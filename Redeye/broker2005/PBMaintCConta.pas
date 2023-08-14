unit PBMaintCConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Mask, ExtCtrls, PBDBMemo, CCSCommon,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCContaFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    GetBranchNameSQL: TFDQuery;
    GetContTypesSQL: TFDQuery;
    ContTypesSRC: TDataSource;
    QryZero: TFDQuery;
    GetContLevelsSQL: TFDQuery;
    ContLevelsSRC: TDataSource;
    GetFileTypeSQL: TFDQuery;
    FileTypSRC: TDataSource;
    FlashTimer: TTimer;
    UpdNotesOnlySQL: TFDQuery;
    qryStatus: TFDQuery;
    srcStatus: TDataSource;
    qryGetContact: TFDQuery;
    qryBranch: TFDQuery;
    dtsBranch: TDataSource;
    qrySelContInfo: TFDQuery;
    qryUpdContInfo: TFDQuery;
    qryInsContInfo: TFDQuery;
    qryDelContInfo: TFDQuery;
    qryNextContInfo: TFDQuery;
    qrySelOperator: TFDQuery;
    pgDetails: TPageControl;
    tsDetails: TTabSheet;
    tsCostCentres: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CustNameEdit: TEdit;
    NameEdit: TEdit;
    dblkpBranchName: TDBLookupComboBox;
    DetsGrpBox: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    MobileLabel: TLabel;
    lblcontactLevel: TLabel;
    lblFaxNo: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SalutationEdit: TEdit;
    TypeDBLCB: TDBLookupComboBox;
    PhoneEdit: TEdit;
    EMailEdit: TEdit;
    MobileEdt: TEdit;
    ContTypeMaintBitBtn: TBitBtn;
    LevelDBLCB: TDBLookupComboBox;
    RecvCorresCB: TCheckBox;
    FaxEdit: TEdit;
    ContLevelMaintBitBtn: TBitBtn;
    FileTypDBLCB: TDBLookupComboBox;
    NotesBitBtn: TBitBtn;
    StatusDBLCB: TDBLookupComboBox;
    memMarkup: TMemo;
    chkbxActive: TCheckBox;
    grpbxContactInfo: TGroupBox;
    lblContName: TLabel;
    Label8: TLabel;
    lblAccExp: TLabel;
    Label12: TLabel;
    edtContName: TEdit;
    edtAccNumber: TEdit;
    cmbbxMonth: TComboBox;
    cmbbxYear: TComboBox;
    btbtnClearAccInfo: TBitBtn;
    Label13: TLabel;
    lstbxMembers: TListBox;
    lstbxMembersCodes: TListBox;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    Label14: TLabel;
    lstbxNonMembers: TListBox;
    lstbxNonMembersCodes: TListBox;
    qryMembers: TFDQuery;
    qryDummy: TFDQuery;
    qryCostCentre: TFDQuery;
    qryAdd: TFDQuery;
    qryDelete: TFDQuery;
    chkbxPaysOnline: TCheckBox;
    tsCategories: TTabSheet;
    Label15: TLabel;
    lstbxUseCategory: TListBox;
    lstbxUseCategoryCode: TListBox;
    Label16: TLabel;
    lstbxNonCategory: TListBox;
    lstbxNonCategoryCode: TListBox;
    btnAddCategory: TBitBtn;
    btnRemoveCategory: TBitBtn;
    qryCategory: TFDQuery;
    qryCategoryDummy: TFDQuery;
    qryUseCategoryMembers: TFDQuery;
    qryDeleteCategories: TFDQuery;
    qryAddCategory: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure ContTypeMaintBitBtnClick(Sender: TObject);
    procedure ContLevelMaintBitBtnClick(Sender: TObject);
    procedure FileTypDBLCBClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memMarkupEnter(Sender: TObject);
    procedure memMarkupExit(Sender: TObject);
    procedure memMarkupKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtAccNumberChange(Sender: TObject);
    procedure cmbbxMonthCloseUp(Sender: TObject);
    procedure cmbbxYearCloseUp(Sender: TObject);
    procedure btbtnClearAccInfoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
    procedure lstbxUseCategoryClick(Sender: TObject);
    procedure lstbxUseCategoryDblClick(Sender: TObject);
    procedure btnAddCategoryClick(Sender: TObject);
    procedure btnRemoveCategoryClick(Sender: TObject);
    procedure lstbxNonCategoryClick(Sender: TObject);
    procedure lstbxNonCategoryDblClick(Sender: TObject);
  private
    PBDBCCMemoFrm: TPBDBMemoFrm;
    bNotesFlash : ByteBool;
    sOldValue: string;
    contactInfo: integer;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextDbKey : integer;
    procedure SetupAccInfo;
    function SaveAccInfo: integer;
    procedure DeleteAccInfo;
    function GetNextContactInfo: integer;
    procedure RefreshUseCategoryData;
    procedure RefreshNonCategoryData;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    procedure DeleteCategoriesFromDB;
    procedure DeleteFromDB;
    procedure SaveCategories;
    procedure SaveCostCentres;
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch: Integer;
    sCustName, sBranchName: string;
  end;

var
  PBMaintCContaFrm: TPBMaintCContaFrm;

implementation

uses UITypes, PBLUCust, PBMaintBranch, PBLUBranch, PBLUCConta, ComObj, ActiveX,
  PBMaintGroups, PBImages, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintCContaFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  PBDBCCMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBCCMemoFrm.bAllow_Upd := True;
  GetContTypesSQL.Close;
  GetContTypesSQL.Open;

  qryBranch.close;
  qryBranch.ParamByName('Customer').asinteger := iCust;
  qryBranch.open;

  qryStatus.Close;
  qryStatus.Open;

  GetContLevelsSQL.Close;
  GetContLevelsSQL.Open;

  GetFileTypeSQL.Close;
  GetFileTypeSQL.Open;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new contact';
  if sFuncMode = 'C' then
    Caption := 'Change a contact';
  if sFuncMode = 'D' then
    Caption := 'Delete a contact';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    SalutationEdit.Text := '';
    memMarkup.text := '0.00';
    TypeDBLCB.KeyValue := 0;
    FileTypDBLCB.KeyValue := 0;
    ChkBxActive.Checked := True;
    if qryBranch.recordcount = 1 then
      dblkpBranchName.KeyValue := qryBranch.fieldbyname('Branch_no').asinteger
    else
      begin
        dblkpBranchName.KeyValue := iBranch;
      end;

//    pgDetails.ActivePageIndex := 0;

    dblkpBranchName.setfocus;
  end
  else
  begin
    with qryGetContact do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iCode;
      open;
//      iCode := FieldByName('Contact_No').AsInteger;
      dblkpBranchName.keyvalue := iBranch;
      dblkpBranchName.enabled := false;
      NameEdit.Text := Trim(FieldByName('Name').AsString);
      PhoneEdit.Text := Trim(FieldByName('Phone').AsString);
      MobileEdt.Text := Trim(FieldByname('Mobile_No').AsString);
      EMailEdit.Text := Trim(FieldByName('EMail').AsString);
      memMarkup.Text := formatfloat('0.00',FieldByName('Def_Markup_perc').Asfloat);
      SalutationEdit.Text := Trim(FieldByName('Salutation').AsString);
      PBDBCCMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      TypeDBLCB.KeyValue := FieldByName('Contact_Type').AsInteger;
      if FieldByName('Contact_Level').AsInteger = 0 then
        LevelDBLCB.KeyValue := 0
      else
        LevelDBLCB.KeyValue := FieldByName('Contact_Level').AsInteger;

      if FieldByName('Contact_Status').AsInteger = 0 then
        StatusDBLCB.KeyValue := 0
      else
        StatusDBLCB.KeyValue := FieldByName('Contact_Status').AsInteger;

      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      if fieldByName('ExportFilter').AsString = '' then
        FileTypDBLCB.KeyValue := 0
      else
        FileTypDBLCB.KeyValue := FieldByName('ExportFilter').AsString;
      if ((FieldByName('Receive_Mail').AsString) = 'Y') then
      begin
        RecvCorresCB.Checked := True;
      end
      else
      begin
        RecvCorresCB.Checked := False;
      end;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');

      contactInfo := FieldByName('contact_info').asInteger;
    end;
    if sFuncMode <> 'D' then
      NameEdit.SetFocus;
  end;
  CustNameEdit.Text := sCustName;
//  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);

  RefreshUseCategoryData;
  RefreshNonCategoryData;

  RefreshData;
  RefreshNonMemberData;

  SetupAccInfo;
  CheckOK(Self);
//  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCContaFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '')
    and (TypeDBLCB.KeyValue <> 0)
    and (((edtAccNumber.Text <> '') and (cmbbxMonth.itemindex <> -1) and (cmbbxYear.itemindex <> -1))
         or ((edtAccNumber.Text <> '') and (cmbbxMonth.Text <> '') and (cmbbxYear.Text <> ''))
         or ((edtAccNumber.Text = '' ) and (cmbbxMonth.text = '') and (cmbbxYear.text = '') and (edtContName.Text = ''))
         or (grpbxContactInfo.visible = false));
end;

procedure TPBMaintCContaFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCContaFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaFrm.OKBitBtnClick(Sender: TObject);
begin
  iBranch := dblkpBranchName.keyvalue;

  if sFuncMode[1] in ['A', 'C'] then
  begin
    if trim(emailedit.Text) = '' then
      begin
        messagedlg('An email address has not been entered, please enter the contact''s email address', mtError, [mbOk], 0);
        exit;
      end;

    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    PBDBCCMemoFrm.UpdMemoData(Self);
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Mobile_No').AsString := MobileEdt.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('Salutation').AsString := SalutationEdit.Text + '';
      ParamByName('Def_Markup_Perc').Asfloat := StrToFloatDef(memMarkup.Text, 0, FormatSettings);
      ParamByName('Contact_Type').AsInteger := TypeDBLCB.KeyValue;
      if (LevelDBLCB.text = '') then
        ParamByName('Contact_Level').Clear
      else
        ParamByName('Contact_Level').AsInteger := LevelDBLCB.KeyValue;

      if (StatusDBLCB.Text = '') then
        ParamByName('Contact_Status').Clear
      else
        ParamByName('Contact_Status').AsInteger := StatusDBLCB.KeyValue;

      if (FileTypDBLCB.text = '') then
        ParamByName('ExportFilter').Clear
      else
        ParamByName('ExportFilter').AsString := FileTypDBLCB.KeyValue;
        ParamByName('Fax_Number').AsString := FaxEdit.Text;
      if PBDBCCMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBCCMemoFrm.iNarr;
      if (RecvCorresCB.Checked) then
      begin
        ParamByName('Receive_Mail').AsString := 'Y'
      end
      else
      begin
        ParamByName('Receive_Mail').AsString := 'N';
      end;
      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      if qrySelOperator.FieldByName('security_user').asString = 'Y' then
      begin
        //the user is a security user so check if there is any account info to save
        if (edtAccNumber.Text <> '') or (chkbxPaysOnline.checked) then
        begin
          //saveAccInfo inserts or updates the account info as required and
          //returns the key to the contact info record
          ParamByName('contact_info').asInteger := SaveAccInfo;
        end
        else
        begin
          //there may have been contact account info and it has been deleted
          //so remove the database record.
          ParamByName('contact_info').clear;
        end
      end
      else
      begin
        //the user is not a security user but the contact info key must be retained
        //if there is one.
        if contactInfo <> 0 then
          ParamByName('contact_info').asInteger := contactInfo
        else
          ParamByName('contact_info').clear;
      end;
      ExecSQL;

      SaveCategories;
      SaveCostCentres;

      if (qrySelOperator.FieldByName('security_user').asString = 'Y')
        and (edtAccNumber.Text = '') and not chkbxPaysOnline.checked then
        DeleteAccInfo;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    PBDBCCMemoFrm.DelMemoData(Self);
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iCode;
      ExecSQL;
    end;

    DeleteAccInfo;
  end;
  modalresult := idOK;
end;

procedure TPBMaintCContaFrm.SaveCostCentres;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Customer').asinteger := iCust;
        parambyname('Branch_no').asinteger := iBranch;
        parambyname('Contact_no').asinteger := iCode;
        parambyname('Cost_Centre').asstring := lstbxMembersCodes.items[i];
        execsql;
      end;
    end;
end;

procedure TPBMaintCContaFrm.DeleteFromDB;
begin
  with qryDelete do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iCode;
      execsql;
    end;
end;

procedure TPBMaintCContaFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaFrm.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

function TPBMaintCContaFrm.GetNextDbKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('Guid').AsString := GuidToString(aGuid);
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_no').AsInteger := iBranch;
      ParamByName('Contact_Type').AsInteger := TypeDBLCB.KeyValue;
      If (FileTypDBLCB.text = '') then
        ParamByName('ExportFilter').clear
      else
        ParamByName('ExportFilter').AsString := FileTypDBLCB.KeyValue;
      if PBDBCCMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBCCMemoFrm.iNarr;
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('Guid').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Contact_No').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintCContaFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Contact ' +
            '(Customer,Branch_No,Contact_No,Name,Contact_Type) ' +
            'VALUES(' + IntToStr(iCust) + ',' + IntToStr(iBranch) +
            ',0,''Dummy'',' + IntToStr(TypeDBLCB.KeyValue) + ')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCContaFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Contact ' +
            'Where Customer=' + IntToStr(iCust) + ' and Branch_No=' +
            IntToStr(iBranch) + ' and Contact_No=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCContaFrm.ContTypeMaintBitBtnClick(Sender: TObject);
begin
PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(self) ;
  try
    PBMaintGroupsFrm.iGroupselect := 3;
    PBMaintGroupsFrm.ShowModal ;
  Finally;
  PBMaintGroupsFrm.Free ;
  end;
GetContTypesSQL.Active := False;
GetContTypesSQL.Active := True;
end;

procedure TPBMaintCContaFrm.ContLevelMaintBitBtnClick(Sender: TObject);
begin
PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(self) ;
  try
    PBMaintGroupsFrm.iGroupselect := 4;
    PBMaintGroupsFrm.ShowModal ;
  Finally;
  PBMaintGroupsFrm.Free ;
  end;
GetContLevelsSQL.Active := False;
GetContLevelsSQL.Active := True;
end;

procedure TPBMaintCContaFrm.FileTypDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaFrm.NotesBitBtnClick(Sender: TObject);
begin
  PBDBCCMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBDBCCMemoFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBDBCCMemoFrm.bMemoUpd) then
        begin
        PBDBCCMemoFrm.UpdMemoData(Self) ;
        With UpdNotesOnlySQL do
                begin
                Close ;
                ParamByName('Customer').AsInteger := iCust;
                ParamByName('Branch_No').AsInteger := iBranch;
                ParamByName('Contact_No').AsInteger := iCode;
                if PBDBCCMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBDBCCMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintCContaFrm.CheckNotes(Sender: TObject);
begin
  if PBDBCCMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintCContaFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintCContaFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
PBDBCCMemoFrm.Free;
end;

procedure TPBMaintCContaFrm.memMarkupEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintCContaFrm.memMarkupExit(Sender: TObject);
//var
//  TempStr: string;
begin
(*  {Validate a quantity on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
*)
end;

procedure TPBMaintCContaFrm.memMarkupKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintCContaFrm.SetupAccInfo;
begin
  if qrySelOperator.FieldByName('security_user').asString = 'Y' then
  begin
    //the user is allowed to maintain credit card info
    grpbxContactInfo.Visible := true;

    if contactInfo <> 0 then
    begin
      qrySelContInfo.ParamByName('contact_info').asInteger := contactInfo;
      qrySelContInfo.Open;

      edtContName.Text := qrySelContInfo.FieldByName('contact_name').asString;
      edtAccNumber.Text := qrySelContInfo.FieldByName('account_number').asString;
      cmbbxMonth.Text := qrySelContInfo.FieldByName('account_month').asString;
      cmbbxYear.Text := qrySelContInfo.FieldByName('account_year').asString;
      chkbxPaysOnline.checked := (qrySelContInfo.FieldByName('Pays_online').asString = 'Y');
      qrySelContInfo.Close;
    end;
  end;
end;

function TPBMaintCContaFrm.SaveAccInfo: integer;
begin
  if contactInfo = 0 then
  begin
    //insert account info
    contactInfo := GetNextContactInfo;
    if contactInfo <> -1 then
    begin
      qryInsContInfo.ParamByName('contact_info').asInteger := contactInfo;
      qryInsContInfo.ParamByName('contact_name').asString := edtContName.Text;
      qryInsContInfo.ParamByName('account_month').asString := cmbbxMonth.Text;
      qryInsContInfo.ParamByName('account_year').asString := cmbbxYear.Text;
      qryInsContInfo.ParamByName('account_number').AsString := edtAccNumber.Text;
      if chkbxPaysOnline.checked then
        qryInsContInfo.ParamByName('Pays_online').AsString := 'Y'
      else
        qryInsContInfo.ParamByName('Pays_online').AsString := 'N';

      qryInsContInfo.ExecSQL;
    end
    else
    begin
      MessageDlg('Could not save account details.', mtWarning, [mbOK], 0);
    end;
  end
  else
  begin
    //update account info
    qryUpdContInfo.ParamByName('contact_info').asInteger := contactInfo;
    qryUpdContInfo.ParamByName('contact_name').asString := edtContName.Text;
    qryUpdContInfo.ParamByName('account_month').asString := cmbbxMonth.Text;
    qryUpdContInfo.ParamByName('account_year').asString := cmbbxYear.Text;
    qryUpdContInfo.ParamByName('account_number').AsString := edtAccNumber.Text;
    if chkbxPaysOnline.checked then
      qryUpdContInfo.ParamByName('Pays_online').AsString := 'Y'
    else
      qryUpdContInfo.ParamByName('Pays_online').AsString := 'N';
    qryUpdContInfo.ExecSQL;
  end;

  Result := contactInfo;
end;

function TPBMaintCContaFrm.GetNextContactInfo: integer;
begin
  try
    qryNextContInfo.Close;
    qryNextContInfo.Open;
    Result := qryNextContInfo.FieldByName('contact_info').AsInteger;

    if Result = 0 then
      Result := 1;
  except
    Result := -1;
  end;

  qryNextContInfo.Close;
end;

procedure TPBMaintCContaFrm.DeleteAccInfo;
begin
  if contactInfo <> 0 then
  begin
    qryDelContInfo.ParamByName('contact_info').asInteger := contactInfo;

    qryDelContInfo.ExecSQL;
  end;
end;

procedure TPBMaintCContaFrm.FormShow(Sender: TObject);
begin
  qrySelOperator.ParamByName('operator').asInteger := frmpbMainMenu.iOperator;
  qrySelOperator.Open;

  if qrySelOperator.FieldByName('security_user').asString <> 'Y' then
  begin
    grpbxContactInfo.Visible := false;
    DetsGrpBox.Height := 317;
    pgDetails.Height := 340;
    self.Height := 500;
  end;
end;

procedure TPBMaintCContaFrm.edtAccNumberChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaFrm.cmbbxMonthCloseUp(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaFrm.cmbbxYearCloseUp(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaFrm.btbtnClearAccInfoClick(Sender: TObject);
begin
  //erase all account info
  edtContName.Text := '';
  edtAccNumber.Text := '';
  cmbbxMonth.Text := '';
  cmbbxYear.Text := '';

  checkOK(Self);
end;

procedure TPBMaintCContaFrm.FormCreate(Sender: TObject);
begin
  contactInfo := 0;
end;

procedure TPBMaintCContaFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Cost_Centre_Description').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Cost_Centre').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintCContaFrm.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryCostCentre do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add(' AND Customer_Branch_CostCentre.Customer = ' + inttostr(iCust));
      sql.add(' AND Customer_Branch_CostCentre.Branch_no = ' + inttostr(iBranch));
      sql.add(' AND Customer_Branch_CostCentre.Cost_Centre NOT IN ');
      sql.add('(''0''');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ''' + lstbxMembersCodes.items[i] + '''');
        end;
      sql.add(')');
      sql.Add('ORDER BY Description');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Cost_Centre_Description').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Cost_Centre').asstring);
          next;
        end;
    end;

end;

procedure TPBMaintCContaFrm.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonMembers.items.count) do
    begin
      if lstbxNonMembers.Selected[i] then
        begin
          lstbxMembers.Items.Add(lstbxNonMembers.items[i]);
          lstbxMembersCodes.Items.Add(lstbxNonMembersCodes.items[i]);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TPBMaintCContaFrm.btnRemoveClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxMembers.items.count) downto 0 do
    begin
      if lstbxMembers.Selected[i] then
        begin
          lstbxMembers.Items.Delete(i);
          lstbxMembersCodes.Items.Delete(i);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TPBMaintCContaFrm.lstbxMembersClick(Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TPBMaintCContaFrm.lstbxNonMembersClick(Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintCContaFrm.lstbxNonMembersDblClick(Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TPBMaintCContaFrm.lstbxMembersDblClick(Sender: TObject);
begin
  btnRemoveClick(self);
end;

procedure TPBMaintCContaFrm.RefreshNonCategoryData;
var
  i: integer;
begin
  lstbxNonCategory.clear;
  lstbxNonCategoryCode.clear;

  with qryCategory do
    begin
      close;
      sql.clear;
      sql.text := qryCategoryDummy.sql.text;
      sql.add(' AND Category.Category NOT IN ');
      sql.add('(''0''');
      for i := 0 to pred(lstbxUseCategoryCode.items.count) do
        begin
          sql.add(', ''' + lstbxUseCategoryCode.items[i] + '''');
        end;
      sql.add(')');
      sql.Add('ORDER BY Description');
      open;
      while eof <> true do
        begin
          lstbxNonCategory.Items.Add(fieldbyname('Description').asstring);
          lstbxNonCategoryCode.Items.Add(fieldbyname('Category').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintCContaFrm.RefreshUseCategoryData;
begin
  with qryUseCategoryMembers do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iCode;
      open;
      lstbxUseCategory.clear;

      while eof <> true do
        begin
          lstbxUseCategory.Items.add(fieldbyname('Description').asstring);
          lstbxUseCategoryCode.Items.add(fieldbyname('Category').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintCContaFrm.lstbxUseCategoryClick(Sender: TObject);
begin
  btnRemoveCategory.enabled := (lstbxUseCategory.SelCount > 0);
  btnAddCategory.enabled := false;
end;

procedure TPBMaintCContaFrm.lstbxUseCategoryDblClick(Sender: TObject);
begin
  btnRemoveCategoryClick(self);
end;

procedure TPBMaintCContaFrm.btnAddCategoryClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonCategory.items.count) do
    begin
      if lstbxNonCategory.Selected[i] then
        begin
          lstbxUseCategory.Items.Add(lstbxNonCategory.items[i]);
          lstbxUseCategoryCode.Items.Add(lstbxNonCategoryCode.items[i]);
        end;
    end;
  RefreshNonCategoryData;
end;

procedure TPBMaintCContaFrm.btnRemoveCategoryClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxUseCategory.items.count) downto 0 do
    begin
      if lstbxUseCategory.Selected[i] then
        begin
          lstbxUseCategory.Items.Delete(i);
          lstbxUseCategoryCode.Items.Delete(i);
        end;
    end;
  RefreshNonCategoryData;
end;

procedure TPBMaintCContaFrm.lstbxNonCategoryClick(Sender: TObject);
begin
  btnAddCategory.enabled := (lstbxNonCategory.SelCount > 0);
  btnRemoveCategory.enabled := false;
end;

procedure TPBMaintCContaFrm.lstbxNonCategoryDblClick(Sender: TObject);
begin
  btnAddCategoryClick(self);
end;

procedure TPBMaintCContaFrm.SaveCategories;
var
  i: integer;
begin
  DeleteCategoriesFromDB;

  for i := 0 to pred(lstbxUseCategory.items.count) do
    begin
      with qryAddCategory do
      begin
        close;
        parambyname('Customer').asinteger := iCust;
        parambyname('Branch_no').asinteger := iBranch;
        parambyname('Contact_no').asinteger := iCode;
        parambyname('Category').asinteger := strtoint(lstbxUseCategoryCode.items[i]);
        execsql;
      end;
    end;
end;

procedure TPBMaintCContaFrm.DeleteCategoriesFromDB;
begin
  with qryDeleteCategories do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iBranch;
      parambyname('Contact_no').asinteger := iCode;
      execsql;
    end;
end;

end.
