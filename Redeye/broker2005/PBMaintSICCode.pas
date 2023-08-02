unit PBMaintSICCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSICCodeFrm = class(TForm)
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
    CheckUniqueRefSQL: TFDQuery;
    chkbxActive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure RefEditChange(Sender: TObject);
    function IncrementNo(StartStr: string): string;
    function FormatMoney(TempQty: string): string;
    function CheckUniqueRef(iTempCode: Integer; iTempRef: string): ByteBool;
  private
    sOldValue: string;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  PBMaintSICCodeFrm: TPBMaintSICCodeFrm;

implementation

uses UITypes, PBLUSICCode, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintSICCodeFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-actiSICe the lookup SQLs};
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new SIC Code';
  if sFuncMode = 'C' then
    Caption := 'Change a SIC Code';
  if sFuncMode = 'D' then
    Caption := 'Delete a SIC Code';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    DescrEdit.Text := '';
    RefEdit.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUSICCodeFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('SIC_Code').AsInteger;
      DescrEdit.Text := FieldByName('SIC_Code_Description').AsString;
      RefEdit.Text := FieldByName('SIC_Code_ID').AsString;
      ChkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
//  dmBroker.ScreenAccessControl(Self,'mnuSICRates',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintSICCodeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
    (RefEdit.Text <> '');
end;

procedure TPBMaintSICCodeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintSICCodeFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSICCodeFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSICCodeFrm.OKBitBtnClick(Sender: TObject);
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
      ParamByName('SIC_Code').AsInteger := iTempNewCode;
      ParamByName('SIC_Code_Description').AsString := DescrEdit.Text + '';
      ParamByName('SIC_Code_ID').AsString := RefEdit.Text;
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
      ParamByName('SIC_Code').AsInteger := iCode;
      ParamByName('SIC_Code_Description').AsString := DescrEdit.Text + '';
      ParamByName('SIC_Code_ID').AsString := RefEdit.Text;
      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';
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
        ParamByName('SIC_Code').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
  {If replicating SIC details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(8, iCode, 0, 0, sFuncMode);
    end;

  PBMaintSICCodeFrm.ModalResult := idok;
end;

procedure TPBMaintSICCodeFrm.RefEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

function TPBMaintSICCodeFrm.IncrementNo(StartStr: string): string;
var
  StrLength, Count, Id: Integer;
  Alphas: string[27];
  Numbers: string[11];
  CurrChar: string[1];
begin
  Alphas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZA';
  Numbers := '01234567890';
  {Increment a string value by 1}
  StrLength := Length(StartStr);
  for Count := StrLength downto 1 do
  begin
    CurrChar := Copy(StartStr, Count, 1);
    Id := Pos(CurrChar, Numbers);
    if Id > 0 then
    begin
      StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Numbers, (Id + 1), 1) +
        Copy(StartStr, (Count + 1), (StrLength - Count));
      IncrementNo := StartStr;
      if Id < 10 then Exit;
    end
    else
    begin
      Id := Pos(CurrChar, Alphas);
      if Id > 0 then
      begin
        StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Alphas, (Id + 1), 1) +
          Copy(StartStr, (Count + 1), (StrLength - Count));
        IncrementNo := StartStr;
        if Id < 27 then Exit;
      end;
    end;
  end;
end;

function TPBMaintSICCodeFrm.FormatMoney(TempQty: string): string;
begin
  {Format the qunatity};
  if Trim(TempQty) = '' then
  begin
    Result := '';
    Exit;
  end;
  try
    begin
      Result := FormatFloat('######0.00', StrToFloat(TempQty));
      if StrToFloat(Result) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except MessageDlg('Invalid financial value - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function TPBMaintSICCodeFrm.CheckUniqueRef(iTempCode: Integer; iTempRef:
  string): ByteBool;
begin
  {Check that SIC Ref is unique};
  with CheckUniqueRefSQL do
  begin
    Close;
    ParamByName('SIC_Code').AsInteger := iTempCode;
    ParamByName('SIC_Code_ID').AsString := iTempRef;
    Open;
    Result := (RecordCount > 0);
  end;
  if Result then
    MessageDlg('The Code you have entered is the same as another SIC Code',
      mtError, [mbOK], 0);
end;

end.
