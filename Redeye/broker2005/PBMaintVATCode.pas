unit PBMaintVATCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintVATCodeFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    RefEdit: TEdit;
    Label2: TLabel;
    DetsSRC: TDataSource;
    VATRateMemo: TMemo;
    Label3: TLabel;
    CheckUniqueRefSQL: TFDQuery;
    Label4: TLabel;
    Label5: TLabel;
    edtSalesLedgerDescr: TEdit;
    edtPurchLedgerDescr: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure RefEditChange(Sender: TObject);
    procedure VATRateMemoEnter(Sender: TObject);
    procedure VATRateMemoExit(Sender: TObject);
    function FormatMoney(TempQty: string): string;
    function CheckUniqueRef(iTempCode: Integer; iTempRef: string): ByteBool;
  private
    sOldValue: string;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  PBMaintVATCodeFrm: TPBMaintVATCodeFrm;

implementation

uses UITypes, PBLUPriceUnit, PBLUVATCode, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintVATCodeFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs};
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new VAT Code';
  if sFuncMode = 'C' then
    Caption := 'Change a VAT Code';
  if sFuncMode = 'D' then
    Caption := 'Delete a VAT Code';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    DescrEdit.Text := '';
    RefEdit.Text := '';
    VATRateMemo.Text := '';
    edtSalesLedgerDescr.Text := '';
    edtPurchLedgerDescr.Text := '';
  end
  else
  begin
    with PBLUVATCodeFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('VAT_Code').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      RefEdit.Text := FieldByName('VAT_Ref').AsString;
      VATRateMemo.Text := FormatFloat('#0.00', FieldByName('VAT_Rate').AsFloat);

      edtSalesLedgerDescr.Text := FieldByName('Sales_Ledger_Description').AsString;
      edtPurchLedgerDescr.Text := FieldByName('Purchase_Ledger_Description').AsString;
    end;
  end;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuVATRates',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintVATCodeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
    (RefEdit.Text <> '') and
    (VATRateMemo.Text <> '');
end;

procedure TPBMaintVATCodeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintVATCodeFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintVATCodeFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintVATCodeFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  if sFuncMode = 'A' then
  begin
    if CheckUniqueRef(0, RefEdit.Text) then
      Exit;
    {Add a new code};
    {Get Next code};
    with GetLastSQL do
    begin
      Close;
      Open;
      First;
      iTempNewCode := FieldByName('Last_Code').AsInteger + 1;
      Close;
    end;
    with AddSQL do
    begin
      Close;
      ParamByName('VAT_Code').AsInteger := iTempNewCode;
      ParamByName('VAT_Rate').AsFloat := StrToFloatDef(VATRateMemo.Text, 0, FormatSettings);
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ParamByName('VAT_Ref').AsString := RefEdit.Text;
      ParamByName('Sales_Ledger_Description').AsString := edtSalesLedgerDescr.Text + '';
      ParamByName('Purchase_Ledger_Description').AsString := edtPurchLedgerDescr.Text + '';
      ExecSQL;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    if CheckUniqueRef(iCode, RefEdit.Text) then
      Exit;
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('VAT_Code').AsInteger := iCode;
      ParamByName('VAT_Rate').AsFloat := StrToFloatDef(VATRateMemo.Text, 0, FormatSettings);
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ParamByName('VAT_Ref').AsString := RefEdit.Text;
      ParamByName('Sales_Ledger_Description').AsString := edtSalesLedgerDescr.Text + '';
      ParamByName('Purchase_Ledger_Description').AsString := edtPurchLedgerDescr.Text + '';
      ExecSQL;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('VAT_Code').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
  {If replicating VAT details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(8, iCode, 0, 0, sFuncMode);
    end;

  PBMaintVATCodeFrm.ModalResult := idok;
end;

procedure TPBMaintVATCodeFrm.RefEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintVATCodeFrm.VATRateMemoEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintVATCodeFrm.VATRateMemoExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit};
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

function TPBMaintVATCodeFrm.FormatMoney(TempQty: string): string;
begin
  {Format the qunatity};
  if Trim(TempQty) = '' then
  begin
    Result := '';
    Exit;
  end;
  try
    begin
      Result := FormatFloat('######0.00', StrToFloatDef(TempQty, 0, FormatSettings));
      if StrToFloatDef(Result, 0, FormatSettings) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except MessageDlg('Invalid financial value - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function TPBMaintVATCodeFrm.CheckUniqueRef(iTempCode: Integer; iTempRef:
  string): ByteBool;
begin
  {Check that VAT Ref is unique};
  with CheckUniqueRefSQL do
  begin
    Close;
    ParamByName('VAT_Code').AsInteger := iTempCode;
    ParamByName('VAT_Ref').AsString := iTempRef;
    Open;
    Result := (RecordCount > 0);
  end;
  if Result then
    MessageDlg('The Reference you have entered is the same as another VAT Code',
      mtError, [mbOK], 0);
end;

end.
