(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Suppliers form.

VSS Info:
$Header: /CCSCommon/CSMaintSupp.pas 3     14/03/:2 9:49 Paul $
$History: CSMaintSupp.pas $
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 14/03/:2   Time: 9:49
 * Updated in $/CCSCommon
 * Added prompts for EAN Number and Our (Broker) Account number
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 13/02/:2   Time: 12:27
 * Updated in $/CCSCommon
 * Updated to the latest 'Broker' versions
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 27/09/:0   Time: 16:08
 * Updated in $/PBL D5
 * Add Vat maintenace look-up button.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 9/02/:0    Time: 10:41
 * Updated in $/PBL D5
 * New insert method and GUIDs to ensure unique new keys when adding.
 * 
 * *****************  Version 3  *****************
 * User: Debbies      Date: 14/01/:0   Time: 12:00
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 14/01/:0   Time: 11:11
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintSupp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TCSMaintSuppFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    NameEdit: TEdit;
    ActiveChkBox: TCheckBox;
    NotesBitBtn: TBitBtn;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    EMailEdit: TEdit;
    PostCodeEdit: TEdit;
    AccCodeEdit: TEdit;
    DiscountMemo: TMemo;
    AddBranchSQL: TQuery;
    UpdBranchSQL: TQuery;
    DelBranchSQL: TQuery;
    FlashTimer: TTimer;
    Label2: TLabel;
    VATRefEdit: TEdit;
    Label3: TLabel;
    IntrastatSRC: TDataSource;
    GetIntrastatSQL: TQuery;
    IntrastatDBLookupComboBox: TDBLookupComboBox;
    CountrySRC: TDataSource;
    GetCountrySQL: TQuery;
    Label4: TLabel;
    CurrencyDBLookupComboBox: TDBLookupComboBox;
    GetCompSQL: TQuery;
    CheckSuppAccExistsSQL: TQuery;
    CheckCustAccExistsSQL: TQuery;
    GetCurrSQL: TQuery;
    CurrSRC: TDataSource;
    GetVATSQL: TQuery;
    VATSRC: TDataSource;
    DefVATDBLookupComboBox: TDBLookupComboBox;
    VATBitBtn: TBitBtn;
    Label6: TLabel;
    qryZero: TQuery;
    VatMaintBitBtn: TBitBtn;
    Label12: TLabel;
    EANEdit: TEdit;
    Label13: TLabel;
    OurAccEdit: TEdit;
    qryDelOrdList: TQuery;
    qryAddOrdList: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure DiscountMemoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure IntrastatDBLookupComboBoxClick(Sender: TObject);
    procedure AccCodeEditExit(Sender: TObject);
    procedure AccCodeEditEnter(Sender: TObject);
    procedure BuildingEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VATBitBtnClick(Sender: TObject);
    procedure DefVATDBLookupComboBoxClick(Sender: TObject);
    procedure VatMaintBitBtnClick(Sender: TObject);
  private
    sOldValue: string;
    bNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  CSMaintSuppFrm: TCSMaintSuppFrm;

implementation

uses CSLUSupp, CSDBMemo, CSImages, ComObj, ActiveX, CSLUVATCode;

{$R *.DFM}

procedure TCSMaintSuppFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;
  GetCompSQL.Close;
  GetCompSQL.Open;
  GetIntrastatSQL.Close;
  GetIntrastatSQL.Open;
  GetVATSQL.Active := False;
  GetVATSQL.Active := True;
  GetCurrSQL.Active := False;
  GetCurrSQL.Active := True;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new supplier';
  if sFuncMode = 'C' then
    Caption := 'Change a supplier';
  if sFuncMode = 'D' then
    Caption := 'Delete a supplier';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    ActiveChkBox.Checked := True;
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PhoneEdit.Text := '';
    PostCodeEdit.Text := '';
    AccCodeEdit.Text := '';
    FaxEdit.Text := '';
    EMailEdit.Text := '';
    OurAccEdit.Text := '';
    DiscountMemo.Text := '0.00';
    IntrastatDBLookupComboBox.KeyValue := 1;
    CurrencyDBLookupComboBox.KeyValue :=
      GetCompSQL.FieldByName('Currency_Code_def').AsInteger;
    VATRefEdit.Text := '';
    EANEdit.Text := '';
  end
  else
  begin
    with CSLUSuppFrm.SelectedSQL do
    begin
      iCode := FieldByName('Supplier').AsInteger;
      ActiveChkBox.Checked := (FieldByName('Acc_Active').AsString = 'Y');
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      EMailEdit.Text := FieldByName('EMail').AsString;
      DiscountMemo.Text := FormatFloat('##0.00',
        FieldByName('Discount').AsFloat);

      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      AccCodeEdit.Text := FieldByName('Account_Code').AsString;
      CSDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      IntrastatDBLookupComboBox.KeyValue :=
        FieldByName('Intrastat_Id').AsInteger;
      if FieldByName('Currency_code_def').AsInteger = 0 then
        CurrencyDBLookupComboBox.KeyValue := Null
      else
        CurrencyDBLookupComboBox.KeyValue :=
          FieldByName('Currency_code_def').AsInteger;
      VATRefEdit.Text := FieldByName('VAT_Reference').AsString;

      EANEdit.Text := FieldByName('EAN_Code').AsString;
      OurAccEdit.Text := FieldByName('Our_Account_Code').AsString;
      if FieldByName('VAT_Code_Def').AsInteger = 0 then
        DefVATDBLookupComboBox.KeyValue := Null
      else
        DefVATDBLookupComboBox.KeyValue :=
          FieldByName('VAT_Code_Def').AsInteger;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TCSMaintSuppFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '') and
    (IntrastatDBLookupComboBox.KeyValue <> Null) and
    (DiscountMemo.Text <> '')and
    (DefVATDBLookupComboBox.Text <> '');
end;

procedure TCSMaintSuppFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintSuppFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSuppFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    CSDBMemoFrm.UpdMemoData(Self);
    if sFuncMode = 'A'then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      if ActiveChkBox.Checked then
        ParamByName('Acc_Active').AsString := 'Y'
      else
        ParamByName('Acc_Active').AsString := 'N';
      ParamByName('Discount').AsFloat := StrToFloat(DiscountMemo.Text);
      ParamByName('Intrastat_Id').AsInteger :=
        IntrastatDBLookupComboBox.KeyValue;
      if CurrencyDBLookupComboBox.KeyValue = Null then
        ParamByName('Currency_Code').Clear
      else
        ParamByName('Currency_Code').AsInteger :=
          CurrencyDBLookupComboBox.KeyValue;
      ParamByName('VAT_Reference').AsString := VATRefEdit.Text + '';
      ParamByName('EAN_Code').AsString := EANEdit.Text + '';
      ParamByName('Our_Account_Code').AsString := OurAccEdit.Text + '';
      if DefVATDBLookupComboBox.KeyValue = Null then
        ParamByName('VAT_Code_Def').Clear
      else
        ParamByName('VAT_Code_Def').AsInteger :=
          DefVATDBLookupComboBox.KeyValue;
      ExecSQL;
    end;
    with UpdBranchSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iCode;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete the details ?', mtConfirmation, [mbNo, mbYes],
      0) = mrYes then
    begin
      with DelBranchSQL do
      begin
        Close;
        ParamByName('Supplier').AsInteger := iCode;
        ExecSQL;
      end;
      with DelSQL do
      begin
        Close;
        ParamByName('Supplier').AsInteger := iCode;
        ExecSQL;
      end;
    end;
    {Delete the branch narrative}
    CSDBMemoFrm.DelMemoData(Self);
  end;
end;

procedure TCSMaintSuppFrm.DiscountMemoExit(Sender: TObject);
begin
  if DiscountMemo.Text <> '' then
  begin
    try
      DiscountMemo.Text := FormatFloat('##0.00', StrToFloat(DiscountMemo.Text))
    except
      MessageDlg('Invalid settlement discount', mtError, [mbOK], 0);
      DiscountMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintSuppFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CSDBMemoFrm.Free;
end;

procedure TCSMaintSuppFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintSuppFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintSuppFrm.CheckNotes(Sender: TObject);
begin
  if CSDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TCSMaintSuppFrm.IntrastatDBLookupComboBoxClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintSuppFrm.AccCodeEditExit(Sender: TObject);
begin
  if AccCodeEdit.Text = '' then Exit;
  {Validate that the account code is unique}
  with GetCompSQL do
  begin
    Close;
    Open;
    First;
    if FieldByName('Acc_Code_Supp_Unique').AsString <> 'Y' then
      Exit;
  end;
  with CheckSuppAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    ParamByName('Supplier').AsInteger := iCode;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on supplier: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
  with CheckCustAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on customer: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintSuppFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
end;

procedure TCSMaintSuppFrm.BuildingEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckOK(Self);
end;

procedure TCSMaintSuppFrm.VATBitBtnClick(Sender: TObject);
begin
  DefVATDBLookupComboBox.KeyValue := Null;
  CheckOK(self);
end;

procedure TCSMaintSuppFrm.DefVATDBLookupComboBoxClick(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TCSMaintSuppFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Supplier(Supplier) Values (0) ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintSuppFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Supplier Where Supplier=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TCSMaintSuppFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Supplier').AsInteger;
      Close;
    end;
    with AddBranchSQL do
    begin
      ParamByName('Supplier').AsInteger := Result;
      ExecSQL;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TCSMaintSuppFrm.VatMaintBitBtnClick(Sender: TObject);
begin
CSLUVatCodeFrm := TCSLUVatCodeFrm.Create(self) ;
  try
    CSLUVatCodeFrm.bIs_Lookup := False ;
    CSLUVatCodeFrm.bAllow_Upd := True ;
    CSLUVatCodeFrm.iSelCode := 0 ;
    CSLUVatCodeFrm.ShowModal ;
  finally
  CSLUVatCodeFrm.Free ;
end;
GetVATSQL.Active := False;
GetVATSQL.Active := True;
end;

end.
