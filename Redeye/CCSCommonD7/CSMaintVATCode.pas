(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain VAT Codes.

VSS Info:
$Header: /CCSCommon/CSMaintVATCode.pas 1     10/01/:1 13:02 Paul $
$History: CSMaintVATCode.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:02
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintVATCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintVATCodeFrm = class(TForm)
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
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure RefEditChange(Sender: TObject);
    function IncrementNo(StartStr: string): string;
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
  CSMaintVATCodeFrm: TCSMaintVATCodeFrm;

implementation

uses CSLUVATCode;

{$R *.DFM}

procedure TCSMaintVATCodeFrm.FormActivate(Sender: TObject);
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
  end
  else
  begin
    with CSLUVATCodeFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('VAT_Code').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      RefEdit.Text := FieldByName('VAT_Ref').AsString;
      VATRateMemo.Text := FormatFloat('#0.00', FieldByName('VAT_Rate').AsFloat);
    end;
  end;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
end;

procedure TCSMaintVATCodeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
    (RefEdit.Text <> '') and
    (VATRateMemo.Text <> '');
end;

procedure TCSMaintVATCodeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintVATCodeFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintVATCodeFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintVATCodeFrm.OKBitBtnClick(Sender: TObject);
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
      ParamByName('VAT_Rate').AsFloat := StrToFloat(VATRateMemo.Text);
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ParamByName('VAT_Ref').AsString := RefEdit.Text;
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
      ParamByName('VAT_Rate').AsFloat := StrToFloat(VATRateMemo.Text);
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ParamByName('VAT_Ref').AsString := RefEdit.Text;
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
  CSMaintVATCodeFrm.ModalResult := idok;
end;

procedure TCSMaintVATCodeFrm.RefEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

function TCSMaintVATCodeFrm.IncrementNo(StartStr: string): string;
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

procedure TCSMaintVATCodeFrm.VATRateMemoEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TCSMaintVATCodeFrm.VATRateMemoExit(Sender: TObject);
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

function TCSMaintVATCodeFrm.FormatMoney(TempQty: string): string;
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
  except
    MessageDlg('Invalid financial value - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

function TCSMaintVATCodeFrm.CheckUniqueRef(iTempCode: Integer; iTempRef:
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
