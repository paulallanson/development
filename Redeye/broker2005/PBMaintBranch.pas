unit PBMaintBranch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls, PBDBMemo, PBDelivNotes,
  ComCtrls, Grids, DBGrids, IniFiles;

type
  TPBMaintBranchFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    GetCustNameSQL: TQuery;
    GetBranchNameSQL: TQuery;
    FlashTimer: TTimer;
    CheckCustAccExistsSQL: TQuery;
    GetCompSQL: TQuery;
    CheckSuppAccExistsSQL: TQuery;
    FlashDelivTimer: TTimer;
    UpdDelivNotesOnlySQL: TQuery;
    UpdNotesOnlySQL: TQuery;
    PrintBitBtn: TBitBtn;
    qryGetBranch: TQuery;
    pgBranches: TPageControl;
    tbGeneral: TTabSheet;
    tbCostCentres: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    CustNameEdit: TEdit;
    NameEdit: TEdit;
    pnlDets: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    lblShortCode: TLabel;
    Label5: TLabel;
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
    InvToGrpBox: TGroupBox;
    InvToCustLabel: TLabel;
    InvToBranchLabel: TLabel;
    InvCustBtn: TButton;
    InvToBranch: TButton;
    ProspectComboBox: TComboBox;
    DelivNotesBitBtn: TBitBtn;
    ChkBxBrnchNm: TCheckBox;
    edtShortCode: TEdit;
    chkbxHODept: TCheckBox;
    chkbxUseHODeliveryNotes: TCheckBox;
    chkbxActive: TCheckBox;
    tbContacts: TTabSheet;
    btnAddCostCentre: TBitBtn;
    btnChgCostCentre: TBitBtn;
    btnDelCostCentre: TBitBtn;
    dbgCostCentres: TDBGrid;
    qryCostCentres: TQuery;
    dtsCostCentres: TDataSource;
    btnAddContact: TBitBtn;
    btnChgContact: TBitBtn;
    btnDelContact: TBitBtn;
    dbgContacts: TDBGrid;
    qryContacts: TQuery;
    dtsContacts: TDataSource;
    chkbxShowInactive: TCheckBox;
    tbEcommerce: TTabSheet;
    Label6: TLabel;
    edtRecipientEmail: TEdit;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edtInvToContact: TEdit;
    BitBtn5: TBitBtn;
    GetContactNameSQL: TQuery;
    Label18: TLabel;
    CountyEdit: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure InvCustBtnClick(Sender: TObject);
    procedure InvToBranchClick(Sender: TObject);
    procedure ShowCustName(Sender: TObject);
    procedure ShowBranchName(Sender: TObject);
    procedure ShowContactName(Sender: TObject);
    procedure AccCodeEditEnter(Sender: TObject);
    procedure AccCodeEditExit(Sender: TObject);
    procedure DelivNotesBitBtnClick(Sender: TObject);
    procedure FlashDelivTimerTimer(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure btnAddContactClick(Sender: TObject);
    procedure btnChgContactClick(Sender: TObject);
    procedure btnDelContactClick(Sender: TObject);
    procedure dbgContactsDblClick(Sender: TObject);
    procedure btnAddCostCentreClick(Sender: TObject);
    procedure btnChgCostCentreClick(Sender: TObject);
    procedure btnDelCostCentreClick(Sender: TObject);
    procedure dbgCostCentresDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    PBDBBrMemoFrm: TPBDBMemoFrm;
    PBBRDelivNotesFrm: TPBDelivNotesFrm;
    sOldValue: string;
    iInvToCust, iInvToBranch, iInvToContact: Integer;
    bNotesFlash, bDelivNotesFlash: ByteBool;
    procedure CallMaintContacts(sTempFuncMode: string);
    procedure RefreshContacts;
    procedure RefreshCostCentres;
    procedure CallMaintCostCentres(sTempFuncMode: string);
    function GetActivePage: integer;
  public
    sFuncMode: string[1];
    iCode, iCust: Integer;
    sCustName: string;
    CostCentreLevel: string;
  end;

var
  PBMaintBranchFrm: TPBMaintBranchFrm;

implementation

uses CCSPrint, PBAuditDM, PBLUBranch, pbDatabase,
  PBImages, PBLUCust, pbLuBranches, pbMainMenu, PBMaintCConta,
  PBMaintBranchCstCntr, PBLUCConta;

var
  InvToCustFrm: TPBLUCustFrm;
  InvToBranchFrm: TPBLUBranchFrm;

{$R *.DFM}

function TPBMaintBranchFrm.GetActivePage: integer;
var
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Branch tab}
  GetPrivateProfileString('Centrereed Broker', 'Default Branch Tab', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  Result := strtoint(TempArray);
end;

procedure TPBMaintBranchFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  PBDBBrMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBBrMemoFrm.bAllow_Upd := True;
  {Create the delivery notes form}
  PBBRDelivNotesFrm := TPBDelivNotesFrm.Create(Self);
  PBBRDelivNotesFrm.bAllow_Upd := True;
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new branch';
  if sFuncMode = 'C' then
    Caption := 'Change a branch';
  if sFuncMode = 'D' then
    Caption := 'Delete a branch';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
    CountyEdit.Text := '';
    PhoneEdit.Text := '';
    FaxEdit.Text := '';
    EMailEdit.Text := '';
    edtRecipientEmail.Text := '';
    iInvToCust := iCust;
    iInvToBranch := 0;
    ChkBxActive.Checked := True;
    AccCodeEdit.Text := '';
    edtShortCode.text := '';
    {Initially setup as a prospect}
    with ProspectComboBox do
    begin
      itemindex := 0;
      Enabled := True;
    end;
    tbCostCentres.TabVisible := false;
    tbContacts.Tabvisible := false;
  end
  else
  begin
    with qryGetBranch do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iCode;
      open;
      CustNameEdit.text := fieldbyname('Customer_Name').asstring;
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      EMailEdit.Text := FieldByName('EMail').AsString;
      edtRecipientEmail.Text := FieldByName('Online_Ordering_Email').AsString;
      edtSHORTCode.text := FieldByName('Short_Code').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      CountyEdit.Text := FieldByName('County').AsString;
      PBDBBrMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      PBBRDelivNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);
      iInvToCust := FieldByName('Inv_To_Customer').AsInteger;
      iInvToBranch := FieldByName('Inv_To_Branch').AsInteger;
      iInvtoContact := fieldbyname('Inv_To_Contact').asinteger;
      AccCodeEdit.Text := FieldByName('Account_Code').AsString;
      ChkBxBrnchNm.Checked := (FieldByName('Use_Branch_Name').AsString = 'Y');
      ChkBxUseHODeliveryNotes.Checked := (FieldByName('Use_HO_Delivery_Notes').AsString = 'Y');
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');

      {Initially set the combo Box to 'Prospect'}
      with ProspectComboBox do
      begin
        itemindex := 0;
        Enabled := True;
        {Change to Actual Customer if Account is on Ledger}
        if FieldByName('Account_Code_on_Ledger').AsString = 'Y' then
        begin
          Items.Add('Account on Ledger');
          itemindex := 2;
          Enabled := False;
        end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'P' then
          begin
            itemindex := 1;
            Enabled := True;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'U' then
          begin
          Items.Add('Ledger Update Pending');
          itemindex := 2;
          Enabled := False;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'I' then
          begin
          Items.Add('Sales Invoice Pending');
          itemindex := 2;
          Enabled := False;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'O' then
          begin
          Items.Add('Purchase Invoice Pending');
          itemindex := 2;
          Enabled := False;
          end;
      end;
    end;

    RefreshContacts;
    RefreshCostCentres;

  end;
  CustNameEdit.Text := sCustName;
  {Enable or disable the buttons};
  pnlDets.Enabled := (sFuncMode <> 'D');
  Nameedit.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  PrintBitBtn.Visible := (sFuncMode= 'C');
  {Show the invoice to details};
  ShowCustName(Self);
  ShowBranchName(Self);
  ShowContactName(self);
  CheckNotes(Self);
  CheckOK(Self);
//  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintBranchFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (CustNameEdit.Text <> '') and
    (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '');
end;

procedure TPBMaintBranchFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintBranchFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintBranchFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  if sFuncMode = 'A' then
  begin
    {Add a new code};
    {Add the branch narrative};
    PBDBBrMemoFrm.UpdMemoData(Self);
    PBBRDelivNotesFrm.UpdMemoData(Self);
    {Get Next code};
    with GetLastSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      Open;
      First;
      iTempNewCode := FieldByName('Last_Code').AsInteger + 1;
      Close;
    end;
    with AddSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iTempNewCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('Online_Ordering_Email').asstring := edtRecipientEmail.text;
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('County').AsString := CountyEdit.Text + '';
      if PBDBBrMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBBrMemoFrm.iNarr;
      if PBBRDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBBRDelivNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      if iInvToContact = 0 then
        ParambyName('Inv_To_contact').clear
      else
        ParamByName('Inv_To_contact').AsInteger := iInvToContact;

      {Update Account code on Ledger}
      case self.ProspectComboBox.ItemIndex of
        0: ParamByName('Account_Code_on_ledger').AsString := 'N';
        1: ParamByName('Account_Code_on_ledger').AsString := 'P';
        2: ParamByName('Account_Code_on_ledger').AsString := 'U';
        3: ParamByName('Account_Code_on_ledger').AsString := 'I';
        4: ParamByName('Account_Code_on_ledger').AsString := 'O';
      else
        ParamByName('Account_Code_on_ledger').AsString := 'Y';
      end;

      if self.edtShortCode.Text <> '' then
        ParamByName('short_code').asString := self.edtShortCode.text
      else
        ParamByName('short_code').clear;

      if self.chkbxHODept.Checked then
        ParamByName('HODept').asInteger := 1
      else
        ParamByName('HODept').asInteger := 0;

      if self.chkbxUseHODeliveryNotes.Checked then
        ParamByName('Use_HO_Delivery_Notes').asstring := 'Y'
      else
        ParamByName('Use_HO_Delivery_Notes').asstring := 'N';

      if ChkBxBrnchNm.Checked then
        ParamByname('Use_Branch_Name').ASString := 'Y'
      else
        ParamByName('Use_Branch_Name').AsString := 'N';

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      ExecSQL;
      {Write ADD BRANCH to audit trail} ;
      PBAuditDataMod.WriteAudit(1001, iCode, 0, 0, 0, NameEdit.Text) ;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    {Update the branch narrative};
    PBDBBrMemoFrm.UpdMemoData(Self);
    {Update the delivery narrative};
    PBBRDelivNotesFrm.UpdMemoData(Self);
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('Online_Ordering_Email').asstring := edtRecipientEmail.text;
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      ParamByName('County').AsString := CountyEdit.Text + '';
      if PBDBBrMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBBrMemoFrm.iNarr;
      if PBBRDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBBRDelivNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      if iInvToContact = 0 then
        ParambyName('Inv_To_contact').clear
      else
        ParamByName('Inv_To_contact').AsInteger := iInvToContact;

      {Update Account code on Ledger}
      case self.ProspectComboBox.ItemIndex of
        0: ParamByName('Account_Code_on_ledger').AsString := 'N';
        1: ParamByName('Account_Code_on_ledger').AsString := 'P';
        2: ParamByName('Account_Code_on_ledger').AsString := 'U';
        3: ParamByName('Account_Code_on_ledger').AsString := 'I';
        4: ParamByName('Account_Code_on_ledger').AsString := 'O';
      else
        ParamByName('Account_Code_on_ledger').AsString := 'Y';
      end;

      if self.edtShortCode.Text <> '' then
        ParamByName('short_code').asString := self.edtShortCode.text
      else
        ParamByName('short_code').clear;

      if self.chkbxHODept.Checked then
        ParamByName('HODept').asInteger := 1
      else
        ParamByName('HODept').asInteger := 0;

      if self.chkbxUseHODeliveryNotes.Checked then
        ParamByName('Use_HO_Delivery_Notes').asstring := 'Y'
      else
        ParamByName('Use_HO_Delivery_Notes').asstring := 'N';

      if ChkBxBrnchNm.Checked then
          ParamByname('Use_Branch_Name').ASString := 'Y'
        else
          ParamByName('Use_Branch_Name').AsString := 'N';

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      ExecSQL;
      {Write field changes to audit trail} ;
//      PBAuditDataMod.FieldChanges('customer_branch',frmpbluBranches.dtsBranch.dataset,UpdSQL) ;
      {Write UPDATE BRANCH to audit trail} ;
//      PBAuditDataMod.WriteAudit(2001, iCode, 0, 0, 0, NameEdit.Text) ;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iCode;
      ExecSQL;
      {Write DELETE BRANCH to audit trail} ;
      PBAuditDataMod.WriteAudit(3001, iCode, 0, 0, 0, NameEdit.Text) ;
    end;
    {Delet the branch narrative};
    PBDBBrMemoFrm.DelMemoData(Self);
    PBBRDelivNotesFrm.DelMemoData(Self);
  end;
end;

procedure TPBMaintBranchFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintBranchFrm.NotesBitBtnClick(Sender: TObject);
begin
  PBDBBrMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBDBBrMemoFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBDBBrMemoFrm.bMemoUpd) then
        begin
        PBDBBrMemoFrm.UpdMemoData(Self) ;
        With UpdNotesOnlySQL do
                begin
                Close ;
                ParamByName('Customer').AsInteger := iCust;
                ParamByName('Branch_No').AsInteger := iCode;
                if PBDBBrMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBDBBrMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintBranchFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBBrMemoFrm.Free;
  PBBRDelivNotesFrm.Free;
end;

procedure TPBMaintBranchFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintBranchFrm.CheckNotes(Sender: TObject);
begin
  if PBDBBrMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
  if PBBRDelivNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintBranchFrm.InvCustBtnClick(Sender: TObject);
var
  iTempInvToCust: Integer;
begin
  iTempInvToCust := iInvToCust;
  {Activate the customer lookup screen};
  InvToCustFrm := TPBLUCustFrm.Create(Self);
  try
    InvToCustFrm.iThisCode := iCode;
    if iInvToCust <> 0 then
      InvToCustFrm.SelCode := iInvToCust
    else
      InvToCustFrm.SelCode := iCode;
    InvToCustFrm.bIs_Lookup := True;
    InvToCustFrm.bAllow_upd := False;
    InvToCustFrm.ShowModal;
    if InvToCustFrm.ModalResult = mrOK then
    begin
      if (InvToCustFrm.SelCode <> iCode) then
        iInvToCust := InvToCustFrm.SelCode;
      {		else
            iInvToCust := 0 ;
       } ShowCustName(Self);
      if iTempInvToCust <> iInvToCust then
      begin
        iInvToBranch := 0;
        ShowBranchName(Self);

        iInvToContact := 0;
        ShowContactName(self);
      end;
    end;
  finally
    InvToCustFrm.Free;
  end;
end;

procedure TPBMaintBranchFrm.InvToBranchClick(Sender: TObject);
var
  iTempInvToBranch: integer;
begin
  iTempInvToBranch := iInvToBranch;
  {Activate the branch lookup screen};
  InvToBranchFrm := TPBLUBranchFrm.Create(Self);
  try
    if iInvToCust <> 0 then
      InvToBranchFrm.iCust := iInvToCust
    else
      InvToBranchFrm.iCust := iCode;
    InvToBranchFrm.sCustName := InvToCustLabel.Caption;
    InvToBranchFrm.SelCode := iInvToBranch;
    InvToBranchFrm.bIs_Lookup := True;
    InvToBranchFrm.bAllow_upd := False;
    InvToBranchFrm.ShowModal;
    iInvToBranch := InvToBranchFrm.SelCode;
  finally
    InvToBranchFrm.Free;
  end;
  ShowBranchName(Self);
  if iTempInvToBranch <> iInvToBranch then
  begin
    iInvToContact := 0;
    ShowContactName(self);
  end;

  CheckOK(Self);
end;

procedure TPBMaintBranchFrm.ShowCustName(Sender: TObject);
begin
  if (iInvToCust = 0) then
  begin
    InvToCustLabel.Caption := 'This Customer';
  end
  else
  begin
    with GetCustNameSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iInvToCust;
      Open;
      First;
      InvToCustLabel.Caption := FieldByName('Name').AsString;
    end;
  end;
end;

procedure TPBMaintBranchFrm.ShowBranchName(Sender: TObject);
begin
  if (iInvToBranch = 0) then
  begin
    InvToBranchLabel.Caption := 'Head Office';
  end
  else
  begin
    with GetBranchNameSQL do
    begin
      Close;
      ParamByName('Branch_No').AsInteger := iInvToBranch;
      if iInvToCust <> 0 then
        ParamByName('Customer').AsInteger := iInvToCust
      else
        ParamByName('Customer').AsInteger := iCode;
      Open;
      First;
      InvToBranchLabel.Caption := FieldByName('Name').AsString;
    end;
  end;
  CheckOK(Self);
end;

procedure TPBMaintBranchFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
end;

procedure TPBMaintBranchFrm.AccCodeEditExit(Sender: TObject);
begin
  {Don't check if blank}
  if Trim(AccCodeEdit.Text) = '' then Exit;
  {Validate that the account code is unique};
  with GetCompSQL do
  begin
    Close;
    Open;
    First;
    if FieldByName('Acc_Code_Cust_Unique').AsString <> 'Y' then
      Exit;
  end;
  with CheckCustAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    ParamByName('Customer').AsInteger := iCust;
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
(*  with CheckSuppAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
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
*)
end;

procedure TPBMaintBranchFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  PBBRDelivNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBBRDelivNotesFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBBRDelivNotesFrm.bMemoUpd) then
        begin
        PBBRDelivNotesFrm.UpdMemoData(Self) ;
        With UpdDelivNotesOnlySQL do
                begin
                Close ;
                ParamByName('Customer').AsInteger := iCust;
                ParamByName('Branch_No').AsInteger := iCode;
                if PBBRDelivNotesFrm.iNarr = 0 then
                        ParamByName('Delivery_Narrative').Clear
                else
                        ParamByName('Delivery_Narrative').AsInteger := PBBRDelivNotesFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintBranchFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TPBMaintBranchFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
    PrinterSettings := TPrinterSettings.Create;
    if SetUpPrinter(PrinterSettings) then
        PBMaintBranchFrm.print;
      PrinterSettings.Free;
end;

procedure TPBMaintBranchFrm.btnAddContactClick(Sender: TObject);
begin
  CallMaintContacts('A');
end;

procedure TPBMaintBranchFrm.CallMaintContacts(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTemp: Integer;
begin
  PBMaintCContaFrm := TPBMaintCContaFrm.Create(Self);
  try
    PBMaintCContaFrm.sFuncMode := sTempFuncMode;

    PBMaintCContaFrm.iCust := iCust;
    PBMaintCContaFrm.iBranch := iCode;
    if sTempFuncMode <> 'A' then
      PBMaintCContaFrm.iCode :=
        dbgContacts.datasource.DataSet.FieldByName('Contact_No').AsInteger
    else
      PBMaintCContaFrm.iCode := 0;
    PBMaintCContaFrm.sCustName := CustNameEdit.text;
    PBMaintCContaFrm.sBranchName := Nameedit.text;
    PBMaintCContaFrm.ShowModal;
    bTempOK := (PBMaintCContaFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintCContaFrm.iCode;
        refreshContacts;
        dbgContacts.DataSource.DataSet.Locate('Contact_no', Variant(inttostr(iTemp)),[lopartialKey]) ;
      end;
  finally
    PBMaintCContaFrm.Free;
  end;
end;

procedure TPBMaintBranchFrm.RefreshContacts;
begin
  with qryContacts do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iCode;
      if chkbxShowInactive.Checked then
        parambyname('inactive').asstring := 'Y'
      else
        parambyname('inactive').asstring := 'N';
      open;
      btnchgContact.enabled := recordcount > 0;
      btnDelContact.enabled := recordcount > 0;
    end;
end;

procedure TPBMaintBranchFrm.RefreshCostCentres;
begin
  with qryCostCentres do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Branch_no').asinteger := iCode;
      open;
      btnChgCostCentre.enabled := recordcount > 0;
      btnDelCostCentre.enabled := recordcount > 0;
    end;
end;

procedure TPBMaintBranchFrm.btnChgContactClick(Sender: TObject);
begin
  if dbgContacts.datasource.DataSet.FieldByName('Name').asstring <> '' then
    CallMaintContacts('C');
end;

procedure TPBMaintBranchFrm.btnDelContactClick(Sender: TObject);
begin
  CallMaintContacts('D');
end;

procedure TPBMaintBranchFrm.dbgContactsDblClick(Sender: TObject);
begin
  btnChgContactClick(Self);
end;

procedure TPBMaintBranchFrm.CallMaintCostCentres(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTemp: string;
begin
  PBMaintBranchCstCntrFrm := TPBMaintBranchCstCntrFrm.Create(Self);
  try
    PBMaintBranchCstCntrFrm.sFuncMode := sTempFuncMode;

    PBMaintBranchCstCntrFrm.iCust := iCust;
    PBMaintBranchCstCntrFrm.iBranch := iCode;
    if sTempFuncMode <> 'A' then
      begin
        PBMaintBranchCstCntrFrm.sCostCentre :=
          dbgCostCentres.datasource.DataSet.FieldByName('Cost_Centre').Asstring;
        PBMaintBranchCstCntrFrm.sDescription :=
          dbgCostCentres.datasource.DataSet.FieldByName('Description').Asstring;
      end
    else
      begin
        PBMaintBranchCstCntrFrm.sCostCentre := '';
        PBMaintBranchCstCntrFrm.sDescription := '';
      end;
    PBMaintBranchCstCntrFrm.sCustName := CustNameEdit.text;
    PBMaintBranchCstCntrFrm.sBranchName := Nameedit.text;
    PBMaintBranchCstCntrFrm.ShowModal;
    bTempOK := (PBMaintBranchCstCntrFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        sTemp := PBMaintBranchCstCntrFrm.sCostCentre;
        refreshCostCentres;
        dbgCostCentres.DataSource.DataSet.Locate('Cost_Centre', Variant(sTemp),[lopartialKey]) ;
      end;
  finally
    PBMaintBranchCstCntrFrm.Free;
  end;
end;

procedure TPBMaintBranchFrm.btnAddCostCentreClick(Sender: TObject);
begin
  CallMaintCostCentres('A');
end;

procedure TPBMaintBranchFrm.btnChgCostCentreClick(Sender: TObject);
begin
  if dbgCostCentres.datasource.DataSet.FieldByName('Description').asstring <> '' then
    CallMaintCostCentres('C');
end;

procedure TPBMaintBranchFrm.btnDelCostCentreClick(Sender: TObject);
begin
  CallMaintCostCentres('D');
end;

procedure TPBMaintBranchFrm.dbgCostCentresDblClick(Sender: TObject);
begin
  btnChgCostcentreclick(self);
end;

procedure TPBMaintBranchFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Default Branch Tab', inttostr(pgBranches.TabIndex));
  finally
    inifile.free;
  end;
end;

procedure TPBMaintBranchFrm.FormShow(Sender: TObject);
begin
  if sFuncMode = 'C' then
    begin
      tbCostCentres.tabVisible := CostCentreLevel = 'B';
      try
        pgBranches.ActivePageIndex := self.GetActivePage
      except
        pgBranches.ActivePageIndex := 0;
      end;

      if not pgbranches.Pages[pgBranches.ActivePageIndex].tabVisible then
        pgBranches.ActivePageIndex := 0;
    end;
end;

procedure TPBMaintBranchFrm.chkbxShowInactiveClick(Sender: TObject);
begin
  RefreshContacts;  
end;

procedure TPBMaintBranchFrm.BitBtn5Click(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(self) ;
  try
    PBLUCContaFrm.bIs_Lookup := true ;
    PBLUCContaFrm.bAllow_Upd := True ;
    PBLUCContaFrm.icust := iInvToCust;
    PBLUCContaFrm.iBranch := iInvToBranch;
    PBLUCContaFrm.SelCode := iInvToContact;
    PBLUCContaFrm.sCustName := InvToCustLabel.Caption;
    PBLUCContaFrm.sBranchName := InvToBranchLabel.Caption;
    PBLUCContaFrm.ShowModal ;
    if PBLUCContaFrm.bselected then
      begin
        iInvToContact := PBLUCContaFrm.selCode;
        edtInvToContact.text := PBLUCContaFrm.SelName;
      end;
  Finally;
    PBLUCContaFrm.Free ;
  end;


end;

procedure TPBMaintBranchFrm.ShowContactName(Sender: TObject);
begin
  with GetcontactNameSQL do
    begin
      Close;
      ParamByName('Branch_No').AsInteger := iInvToBranch;
      if iInvToCust <> 0 then
        ParamByName('Customer').AsInteger := iInvToCust
      else
        ParamByName('Customer').AsInteger := iCode;
      ParamByName('Contact_no').AsInteger := iInvToContact;
      Open;
      First;
      edtInvToContact.text := FieldByName('Name').AsString;
    end;
end;

end.
