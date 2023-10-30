unit PBMaintSupp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, ComCtrls, pbSupplierDm,
  Grids, DBGrids, Menus, ShellAPI, StrUtils, printers;

type
  TPBMaintSuppFrm = class(TForm)
    FlashTimer: TTimer;
    pgcntrlSupplier: TPageControl;
    tbshtDetails: TTabSheet;
    tbshtProductTypes: TTabSheet;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    TownEdit: TEdit;
    NameEdit: TEdit;
    ActiveChkBox: TCheckBox;
    NotesBitBtn: TBitBtn;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    EMailEdit: TEdit;
    PostCodeEdit: TEdit;
    AccCodeEdit: TEdit;
    DiscountMemo: TMemo;
    VATRefEdit: TEdit;
    IntrastatDBLookupComboBox: TDBLookupComboBox;
    CurrencyDBLookupComboBox: TDBLookupComboBox;
    DefVATDBLookupComboBox: TDBLookupComboBox;
    VatMaintBitBtn: TBitBtn;
    Label12: TLabel;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    edtEan: TEdit;
    edtOurAccount: TEdit;
    edtPassword: TEdit;
    rdgrpProtocol: TRadioGroup;
    Label17: TLabel;
    edtSiteURL: TEdit;
    TabSheet2: TTabSheet;
    dbgCharges: TDBGrid;
    btnAddChg: TBitBtn;
    btnDeleteChg: TBitBtn;
    btnChangeChg: TBitBtn;
    Label18: TLabel;
    Label19: TLabel;
    dblkpCourier: TDBLookupComboBox;
    btnCourierClear: TBitBtn;
    VatBitBtn: TBitBtn;
    btnLUCouriers: TBitBtn;
    tbshtDocuments: TTabSheet;
    dbgDocuments: TDBGrid;
    DocOpenDialog: TOpenDialog;
    pmnuDocuments: TPopupMenu;
    Add1: TMenuItem;
    mnuDocChange: TMenuItem;
    mnuDocDelete: TMenuItem;
    mnuDocOpen: TMenuItem;
    N1: TMenuItem;
    Word1: TMenuItem;
    Excel1: TMenuItem;
    Email1: TMenuItem;
    svDlgOfficeDoc: TSaveDialog;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    PrintBitBtn: TBitBtn;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Label25: TLabel;
    dblkpPaymentTerms: TDBLookupComboBox;
    btnTerms: TBitBtn;
    BitBtn2: TBitBtn;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddChgClick(Sender: TObject);
    procedure btnChangeChgClick(Sender: TObject);
    procedure btnDeleteChgClick(Sender: TObject);
    procedure dbgChargesDblClick(Sender: TObject);
    procedure btnCourierClearClick(Sender: TObject);
    procedure btnLUCouriersClick(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure mnuDocChangeClick(Sender: TObject);
    procedure mnuDocDeleteClick(Sender: TObject);
    procedure mnuDocOpenClick(Sender: TObject);
    procedure NameEditExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnTermsClick(Sender: TObject);
  private
    sOldValue: string;
    bNotesFlash: ByteBool;
    SupCapGB: TGroupBox ;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure ShowCharges;
    procedure ShowDocuments;
    procedure CallMaintCharges(Mode: char);
    procedure CallMaintDocuments(const aMode: string);
    procedure PrintForm;
  public
    dtmdlOneSupplier: TdtmdlSuppliers;
    sFuncMode: string[1];
    iCode: Integer;
    iSupplier: integer;
  end;

var
  PBMaintSuppFrm: TPBMaintSuppFrm;

implementation

uses FireDAC.Stan.Param, UITypes, PBDBMemo, PBMaintSuppCap, pbDatabase, PBImages, PBLUPrdTyp,
  pbMainMenu, ComObj, ActiveX, CCSPrint, pbLuVatCode, PBMaintSuppCharges,
  STLUCourier, PBMaintDocument, CCSCommon, PBLUPaymentTerms;

{$R *.DFM}

procedure TPBMaintSuppFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;
  {Create the Supplier Capabilities Form} ;
  PBMaintSuppCapFrm := TPBMaintSuppCapFrm.Create(Self) ;
  {Load the details even if we're deleting so the delete routine will work} ;
  If sFuncMode <> 'A' then
        PBMaintSuppCapFrm.iSupp := iSupplier
  else
        PBMaintSuppCapFrm.iSupp := 0 ;
  PBMaintSuppCapFrm.iBranch := 0 ;
  {Put the panel onto this form, returns the group box pointer} ;
  SupCapGB := PBMaintSuppCapFrm.InitailiseGroupBox(tbshtProductTypes) ;

  IntrastatDBLookupComboBox.ListSource := dtmdlOneSupplier.IntrastatSrc;
  CurrencyDBLookupComboBox.ListSource := dtmdlOneSupplier.CurrSRC;
  dblkpCourier.ListSource := dtmdlOneSupplier.dtsCouriers;
  DefVatDbLookupComboBox.listsource := dtmdlOneSupplier.VATSRC;
  dblkpPaymentTerms.listsource := dtmdlOneSupplier.dtsTerms;
  dbgCharges.datasource := dtmdlOneSupplier.dtsCharges;

  dbgDocuments.datasource := dtmdlOneSupplier.dtsDocuments;

  ShowCharges;

  dtmdlOneSupplier.GetCompSQL.Close;
  dtmdlOneSupplier.GetCompSQL.Open;
  dtmdlOneSupplier.GetIntrastatSQL.Close;
  dtmdlOneSupplier.GetIntrastatSQL.Open;
  dtmdlOneSupplier.qryCouriers.Close;
  dtmdlOneSupplier.qryCouriers.Open;
  dtmdlOneSupplier.GetVATSQL.Active := False;
  dtmdlOneSupplier.GetVATSQL.Active := True;
  dtmdlOneSupplier.GetCurrSQL.Active := False;
  dtmdlOneSupplier.GetCurrSQL.Active := True;
  dtmdlOneSupplier.qryTerms.Close;
  dtmdlOneSupplier.qryTerms.Open;

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
    edtEAN.Text := '';
    edtOurAccount.Text := '';
    edtPassword.Text := '';
    edtSiteURL.Text := '';
    DefVATDBLookupComboBox.KeyValue := dmBroker.GetCompanyVatCode;
    DiscountMemo.Text := '0.00';
    IntrastatDBLookupComboBox.KeyValue := 1;
    CurrencyDBLookupComboBox.KeyValue :=
      dtmdlOneSupplier.GetCompSQL.FieldByName('Currency_Code_def').AsInteger;
    VATRefEdit.Text := '';
    dblkpCourier.KeyValue := 0;
    dblkpPaymentTerms.KeyValue := 0;
  end
  else
  begin
    with dtmdlOneSupplier.qryGetSupplier do
      begin
      close;
      parambyname('Supplier').asinteger := iSupplier;
      open;
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
      edtEAN.Text := FieldByName('EAN_Code').AsString;
      edtPassword.Text := FieldByName('Our_Account_Password').AsString;
      edtSiteURL.Text := FieldByName('Transfer_Site_URL').AsString;
      edtOurAccount.Text := FieldByName('Our_Account_Code').AsString;

      if Fieldbyname('Transfer_Protocol_Type').asstring = 'EDI' then
        rdgrpProtocol.ItemIndex := 0
      else
      if Fieldbyname('Transfer_Protocol_Type').asstring = 'FTP' then
        rdgrpProtocol.ItemIndex := 1
      else
      if Fieldbyname('Transfer_Protocol_Type').asstring = 'HTTPS' then
        rdgrpProtocol.ItemIndex := 1
      else
        rdgrpProtocol.ItemIndex := 3;


      DiscountMemo.Text := FormatFloat('##0.00',
        FieldByName('Discount').AsFloat);

      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      AccCodeEdit.Text := FieldByName('Account_Code').AsString;
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      IntrastatDBLookupComboBox.KeyValue :=
        FieldByName('Intrastat_Id').AsInteger;
      if FieldByName('Currency_code_def').AsInteger = 0 then
        CurrencyDBLookupComboBox.KeyValue := 0
      else
        CurrencyDBLookupComboBox.KeyValue :=
          FieldByName('Currency_code_def').AsInteger;
      VATRefEdit.Text := FieldByName('VAT_Reference').AsString;

      if FieldByName('VAT_Code_Def').AsInteger = 0 then
        DefVATDBLookupComboBox.KeyValue := 0
      else
        DefVATDBLookupComboBox.KeyValue :=
          FieldByName('VAT_Code_Def').AsInteger;
      dblkpCourier.KeyValue := fieldbyname('Courier').asinteger;
      dblkpPaymentTerms.KeyValue := fieldbyname('Payment_Terms').asinteger;

      dmBroker.CreateSupplierDocDirectory(NameEdit.Text);
      ShowDocuments;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  PrintBitBtn.Visible := (sFuncMode= 'C');
  CheckNotes(Self);
  CheckOK(Self);
  pgcntrlSupplier.activepage := tbshtDetails;
  dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintSuppFrm.ShowCharges;
begin
  with dtmdlOneSupplier.qryCharges do
    begin
      close;
      parambyname('Supplier').asinteger := iSupplier;
      open;
      btnChangeChg.enabled := recordcount > 0;
      btnDeleteChg.enabled := recordcount > 0;
    end;
end;

procedure TPBMaintSuppFrm.ShowDocuments;
begin
  with dtmdlOneSupplier.qryDocuments do
    begin
      close;
      parambyname('Supplier').asinteger := iSupplier;
      open;
    end;
end;

procedure TPBMaintSuppFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '') and
    (IntrastatDBLookupComboBox.KeyValue <> 0) and
    (DiscountMemo.Text <> '')and
    (DefVATDBLookupComboBox.Text <> '');
end;

procedure TPBMaintSuppFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintSuppFrm.NameEditChange(Sender: TObject);
begin
  if (dmBroker.DefaultSupplierAccCode) and (sFuncMode = 'A') then
    begin
      AccCodeEdit.Text := leftstr(stringreplace(trim(NameEdit.Text), ' ', '',[rfReplaceAll]),8);
    end;
  CheckOK(Self);
end;

procedure TPBMaintSuppFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if (trim(AccCodeEdit.Text) = '') and (dmBroker.SuppAccountMandatory) then
      begin
        MessageDlg('An account code must be allocated to a supplier.', mtError, [mbOk], 0);
        accCodeEdit.SetFocus;
        exit;
      end;

    if (sFuncMode = 'C') and (trim(AccCodeEdit.Text) = '') and (dtmdlOneSupplier.InvoicesExist(iCode)) then
      begin
        MessageDlg('Purchase Invoices exist which are pending update to the Purchase Ledger, an account code must be allocated to this supplier.', mtError, [mbOk], 0);
        accCodeEdit.SetFocus;
        exit;
      end;

    PBDBMemoFrm.UpdMemoData(Self);
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with dtmdlOneSupplier.UpdSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      if ActiveChkBox.Checked then
        ParamByName('Acc_Active').AsString := 'Y'
      else ParamByName('Acc_Active').AsString := 'N';
      ParamByName('Discount').AsFloat := StrToFloatDef(DiscountMemo.Text, 0, FormatSettings);
      ParamByName('Intrastat_Id').AsInteger :=
        IntrastatDBLookupComboBox.KeyValue;
      if CurrencyDBLookupComboBox.KeyValue = 0 then
        ParamByName('Currency_Code').Clear
      else
        ParamByName('Currency_Code').AsInteger :=
          CurrencyDBLookupComboBox.KeyValue;
      ParamByName('VAT_Reference').AsString := VATRefEdit.Text + '';
      if DefVATDBLookupComboBox.text = '' then
        ParamByName('VAT_Code_Def').Clear
      else
        ParamByName('VAT_Code_Def').AsInteger :=
          DefVATDBLookupComboBox.KeyValue;
      if dblkpCourier.text = '' then
        ParamByName('Courier').Clear
      else
        ParamByName('Courier').AsInteger := dblkpCourier.KeyValue;

      if dblkpPaymentTerms.text = '' then
        ParamByName('Payment_Terms').Clear
      else
        ParamByName('Payment_Terms').AsInteger := dblkpPaymentTerms.KeyValue;

      ParamByName('EAN_Code').AsString := edtEAN.Text + '';
      ParamByName('Our_Account_Code').AsString := edtOurAccount.Text + '';
      ParamByName('Our_Account_Password').AsString := edtPassword.Text + '';
      ParamByName('Transfer_Site_URL').AsString := edtSiteURL.Text + '';

      case rdgrpProtocol.ItemIndex of
        0: ParamByName('Transfer_Protocol_Type').AsString := 'EDI';
        1: ParamByName('Transfer_Protocol_Type').AsString := 'FTP';
        2: ParamByName('Transfer_Protocol_Type').AsString := 'HTTPS';
      else
        ParamByName('Transfer_Protocol_Type').clear;
      end;

      ExecSQL;
    end;
    with dtmdlOneSupplier.UpdBranchSQL do
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
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      ExecSQL;
    end;
  {Update the supplier capabilities} ;
  {Note that the flag is false to say don't delete them} ;
  PBMaintSuppCapFrm.UpdateSuppCaps(iCode,0,False) ;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete the details ?', mtConfirmation, [mbNo, mbYes],
      0) = mrYes then
    begin
    {Note that the flag is TRUE to say delete them} ;
    PBMaintSuppCapFrm.UpdateSuppCaps(iCode,0,True) ;
      with dtmdlOneSupplier.DelBranchSQL do
      begin
        Close;
        ParamByName('Supplier').AsInteger := iCode;
        ExecSQL;
      end;
      with dtmdlOneSupplier.DelSQL do
      begin
        Close;
        ParamByName('Supplier').AsInteger := iCode;
        ExecSQL;
      end;
    end;
    {Delete the branch narrative}
    PBDBMemoFrm.DelMemoData(Self);
    {Update the supplier capabilities} ;
  end;

  {If replicating Supplier details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(1, iCode, 0, 0, sFuncMode);
    end;

  ModalResult := mrOK;
end;

procedure TPBMaintSuppFrm.DiscountMemoExit(Sender: TObject);
begin
  if DiscountMemo.Text <> '' then
  begin
    try
      DiscountMemo.Text := FormatFloat('##0.00', StrToFloatDef(DiscountMemo.Text, 0, FormatSettings))
    except
      MessageDlg('Invalid settlement discount', mtError, [mbOK], 0);
      DiscountMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

procedure TPBMaintSuppFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBMemoFrm.Free;
  {Clear the treeview} ;
  PBMaintSuppCapFrm.ClearTreeView(self) ;
  PBMaintSuppCapFrm.DeleteIntSel(Self) ;
  PBMaintSuppCapFrm.Free ;
end;

procedure TPBMaintSuppFrm.NotesBitBtnClick(Sender: TObject);
begin
  PBDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBDBMemoFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBDBMemoFrm.bMemoUpd) then
        begin
        PBDBMemoFrm.UpdMemoData(Self) ;
        With dtmdlOneSupplier.UpdNotesOnlySQL do
                begin
                Close ;
                ParamByName('Supplier').AsInteger := iCode;
                if PBDBMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintSuppFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintSuppFrm.CheckNotes(Sender: TObject);
begin
  if PBDBMemoFrm.CheckNotes(Self) then
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

procedure TPBMaintSuppFrm.IntrastatDBLookupComboBoxClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSuppFrm.AccCodeEditExit(Sender: TObject);
begin
  if AccCodeEdit.Text = '' then Exit;
  {Validate that the account code is unique}
  with dtmdlOneSupplier.GetCompSQL do
  begin
    Close;
    Open;
    First;
    if not dmBroker.SupplierAccCodeUnique then
      Exit;
  end;
  with dtmdlOneSupplier.CheckSuppAccExistsSQL do
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
  CheckOK(Self);
end;

procedure TPBMaintSuppFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
end;

procedure TPBMaintSuppFrm.BuildingEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CheckOK(Self);
end;

procedure TPBMaintSuppFrm.VATBitBtnClick(Sender: TObject);
begin
  DefVATDBLookupComboBox.KeyValue := 0;
  CheckOK(self);
end;

procedure TPBMaintSuppFrm.DefVATDBLookupComboBoxClick(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBMaintSuppFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with dtmdlOneSupplier.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Supplier(Supplier) Values (0) ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintSuppFrm.DeleteZero;
begin
  with dtmdlOneSupplier.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Supplier Where Supplier=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintSuppFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with dtmdlOneSupplier.AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with dtmdlOneSupplier.GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Supplier').AsInteger;
      Close;
    end;
    with dtmdlOneSupplier.AddBranchSQL do
    begin
      ParamByName('Supplier').AsInteger := Result;
      ExecSQL;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintSuppFrm.VatMaintBitBtnClick(Sender: TObject);
begin
  PBLUVatCodeFrm := TPBLUVatCodeFrm.Create(self) ;
  try
    PBLUVatCodeFrm.bIs_Lookup := False ;
    PBLUVatCodeFrm.bAllow_Upd := True ;
    PBLUVatCodeFrm.iSelCode := 0 ;
    PBLUVatCodeFrm.ShowModal ;
  finally
  PBLUVatCodeFrm.Free ;
  end;

  dtmdlOneSupplier.GetVATSQL.Active := False;
  dtmdlOneSupplier.GetVATSQL.Active := True;
end;

procedure TPBMaintSuppFrm.BitBtn1Click(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
end;

procedure TPBMaintSuppFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
  PrinterSettings := TPrinterSettings.Create;

  try
    if SetUpPrinter(PrinterSettings) then
        PBMaintSuppFrm.print;
  finally
    PrinterSettings.Free;
  end;

(*  PrinterSettings := TPrinterSettings.Create;

  try
    if SetUpPrinter(PrinterSettings) then
      begin
        sleep(500);
        PrintForm;
      end
  finally
    PrinterSettings.free;
  end;
*)
end;

procedure TPBMaintSuppFrm.PrintForm;
var
  DC: HDC;
  isDcPalDevice: Bool;
  MemDC: HDC;
  MemBitmap: HBITMAP;
  OldMemBitmap: HBITMAP;
  hDibHeader: THandle;
  pDibHeader: Pointer;
  hBits: THandle;
  pBits: Pointer;
  ScaleX: Double;
  ScaleY: Double;
  pPal: PLOGPALETTE;
  pal: HPALETTE;
  OldPal: HPALETTE;
  i: Integer;
begin
  {Get the screen dc}
  DC := GetDC(0);
  {Create a compatible dc}
  MemDC := CreateCompatibleDC(DC);
  {create a bitmap}
  MemBitmap := CreateCompatibleBitmap(DC, Self.Width, Self.Height);
  {select the bitmap into the dc}
  OldMemBitmap := SelectObject(MemDC, MemBitmap);

  {Lets prepare to try a fixup for broken video drivers}
  isDcPalDevice := False;
  if GetDeviceCaps(DC, RASTERCAPS) and RC_PALETTE=RC_PALETTE then
  begin
    GetMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    FillChar(pPal^, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)),
             #0);
    pPal^.palVersion := $300;
    pPal^.palNumEntries := GetSystemPaletteEntries(DC, 0, 256, pPal^.palPalEntry);
    if pPal^.palNumEntries<>0 then
    begin
      pal := CreatePalette(pPal^);
      OldPal := SelectPalette(MemDC, pal, False);
      isDcPalDevice := True
    end
    else
      FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
  end;
  {copy from the screen to the memdc/bitmap}
  BitBlt(MemDC, 0, 0, Self.Width, Self.Height, DC, Self.Left, Self.Top, SRCCOPY);

  if isDcPalDevice=True then
  begin
    SelectPalette(MemDC, OldPal, False);
    DeleteObject(pal);
  end;
  {unselect the bitmap}
  SelectObject(MemDC, OldMemBitmap);
  {delete the memory dc}
  DeleteDC(MemDC);
  {Allocate memory for a DIB structure}
  hDibHeader := GlobalAlloc(GHND, SizeOf(TBITMAPINFO)+(SizeOf(TRGBQUAD)*
                            256));
  {get a pointer to the alloced memory}
  pDibHeader := GlobalLock(hDibHeader);

  {fill in the dib structure with info on the way we want the DIB}
  FillChar(pDibHeader^, SizeOf(TBITMAPINFO)+(SizeOf(TRGBQUAD)*
           256), #0);
  PBITMAPINFOHEADER(pDibHeader)^.biSize := SizeOf(TBITMAPINFOHEADER);
  PBITMAPINFOHEADER(pDibHeader)^.biPlanes := 1;
  PBITMAPINFOHEADER(pDibHeader)^.biBitCount := 8;
  PBITMAPINFOHEADER(pDibHeader)^.biWidth := Self.Width;
  PBITMAPINFOHEADER(pDibHeader)^.biHeight := Self.Height;
  PBITMAPINFOHEADER(pDibHeader)^.biCompression := BI_RGB;

  {find out how much memory for the bits}
  GetDIBits(DC, MemBitmap, 0, Self.Height, nil, TBITMAPINFO(pDibHeader^),
            DIB_RGB_COLORS);

  {Alloc memory for the bits}
  hBits := GlobalAlloc(GHND, PBITMAPINFOHEADER(pDibHeader)^.BiSizeImage);

  {Get a pointer to the bits}
  pBits := GlobalLock(hBits);

  {Call fn again, but this time give us the bits!}
  GetDIBits(DC, MemBitmap, 0, Self.Height, pBits, PBitmapInfo(pDibHeader)^,
            DIB_RGB_COLORS);

  {Lets try a fixup for broken video drivers}
  if isDcPalDevice=True then
  begin
    for i := 0 to (pPal^.palNumEntries-1) do
    begin
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbRed := pPal^.palPalEntry[i].peRed;
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbGreen := pPal^.palPalEntry[i].peGreen;
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbBlue := pPal^.palPalEntry[i].peBlue;
    end;
    FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
  end;
  {Release the screen dc}
  ReleaseDC(0, DC);
  {Delete the bitmap}
  DeleteObject(MemBitmap);

  {Start print job}
  Printer.BeginDoc;

  {Scale print size }
  ScaleX := Self.Width*3;
  ScaleY := Self.Height*3;

  {Just incase the printer drver is a palette device}
  isDcPalDevice := False;
  if GetDeviceCaps(Printer.Canvas.Handle, RASTERCAPS) and RC_PALETTE=RC_PALETTE
                   then
  begin
    {Create palette from dib}
    GetMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    FillChar(pPal^, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)),
             #0);
    pPal^.palVersion := $300;
    pPal^.palNumEntries := 256;
    for i := 0 to (pPal^.palNumEntries-1) do
    begin
      pPal^.palPalEntry[i].peRed := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbRed;
      pPal^.palPalEntry[i].peGreen := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbGreen;
      pPal^.palPalEntry[i].peBlue := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbBlue;
    end;
    pal := CreatePalette(pPal^);
    FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    OldPal := SelectPalette(Printer.Canvas.Handle, pal, False);
    isDcPalDevice := True
  end;
  {send the bits to the printer}
  StretchDiBits(Printer.Canvas.Handle, 0, 0, Round(ScaleX), Round(ScaleY),
                0, 0, Self.Width, Self.Height, pBits, PBitmapInfo(pDibHeader)^,
                DIB_RGB_COLORS, SRCCOPY);

  {Just incase you printer drver is a palette device}
  if isDcPalDevice=True then
  begin
    SelectPalette(Printer.Canvas.Handle, OldPal, False);
    DeleteObject(pal);
  end;
  {Clean up allocated memory}
  GlobalUnlock(hBits);
  GlobalFree(hBits);
  GlobalUnlock(hDibHeader);
  GlobalFree(hDibHeader);

  {end the print job}
  Printer.EndDoc;
end;

procedure TPBMaintSuppFrm.FormShow(Sender: TObject);
begin
  nameedit.setfocus;
end;

procedure TPBMaintSuppFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  dtmdlOneSupplier := TdtmdlSuppliers.create(self);
  CCSCommon.LoadFormLayout(myRedeye_INIFILE, self);
end;

procedure TPBMaintSuppFrm.btnAddChgClick(Sender: TObject);
begin
  CallMaintCharges('A')
end;

procedure TPBMaintSuppFrm.CallMaintCharges(Mode: char);
var
  iCharge: integer;
begin
  PBMaintSuppChargesfrm := TPBMaintSuppChargesfrm.create(self);
  try
  PBMaintSuppChargesfrm.iCharge := 0;
    if Mode <> 'A' then
      begin
        PBMaintSuppChargesfrm.iCharge := dbgCharges.datasource.dataset.fieldbyname('Charge_no').asinteger;
        PBMaintSuppChargesfrm.sDetails := dbgCharges.datasource.dataset.fieldbyname('Details').asstring;
        PBMaintSuppChargesfrm.rCostValue := dbgCharges.datasource.dataset.fieldbyname('Amount').asfloat;
        PBMaintSuppChargesfrm.rSalesValue := dbgCharges.datasource.dataset.fieldbyname('Quotation_Price').asfloat;
        PBMaintSuppChargesfrm.iVatCode := dbgCharges.datasource.dataset.fieldbyname('Vat_code').asinteger;
      end;
      
    PBMaintSuppChargesfrm.FuncMode := Mode;
    PBMaintSuppChargesfrm.iSupplier := iCode;
    PBMaintSuppChargesfrm.showmodal;
    if PBMaintSuppChargesfrm.bOK then
      begin
        ShowCharges;
        if CharInSet(Mode, ['A','C']) then
          iCharge := PBMaintSuppChargesfrm.iCharge
        else
        if Mode = 'D' then
          iCharge := iCharge - 1;
        dbgCharges.datasource.dataset.locate('Charge_no', Variant(inttostr(iCharge)),[lopartialKey]) ;
      end;
  finally
    PBMaintSuppChargesfrm.free;
  end;
end;
procedure TPBMaintSuppFrm.btnChangeChgClick(Sender: TObject);
begin
  CallMaintCharges('C')
end;

procedure TPBMaintSuppFrm.btnDeleteChgClick(Sender: TObject);
begin
  CallMaintCharges('D')
end;

procedure TPBMaintSuppFrm.dbgChargesDblClick(Sender: TObject);
begin
  btnChangeChgClick(self);
end;

procedure TPBMaintSuppFrm.btnCourierClearClick(Sender: TObject);
begin
  dblkpCourier.KeyValue := 0;
end;

procedure TPBMaintSuppFrm.btnLUCouriersClick(Sender: TObject);
begin
  STLUCourierFrm := TSTLUCourierFrm.Create(self) ;
  try
    STLUCourierFrm.bIs_Lookup := False ;
    STLUCourierFrm.bAllow_Upd := True ;
    STLUCourierFrm.SelCode := 0 ;
    STLUCourierFrm.ShowModal ;
  finally
    STLUCourierFrm.Free ;
  end;

  dtmdlOneSupplier.qryCouriers.Active := False;
  dtmdlOneSupplier.qryCouriers.Active := True;

end;

procedure TPBMaintSuppFrm.Add1Click(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
  inx, icount: integer;
begin
  docDir := dmBroker.GetCompanySupplierDirectory + '\' + NameEdit.text;
  tempStr2 := docDir;

  tempStr := '';

  {Find a document} ;
  With DocOpenDialog do
  begin
    InitialDir := tempStr2;
    FileName := tempStr ;
    ForceCurrentDirectory := false;
    If Execute then
    begin
      {Check that they have NOT gone out of document directory} ;
      If Lowercase(Copy(FileName,1, Length(docDir))) <> Lowercase(docDir) then
      begin
        MessageDlg('You can''t select a document outside the Supplier Document Directory',
                                                mtError,[mbOK],0) ;
      end
      else
      begin
        for icount := 0 to pred(Files.Count) do
          begin
            with dtmdlOneSupplier.qryAddDocument do
              begin
                close;
                parambyname('Supplier').asinteger := iSupplier;
                parambyname('Document_no').asinteger := dtmdlOneSupplier.GetnextDocument(iSupplier);
                parambyname('Document_Title').asstring := Copy(Files.Strings[icount], Length(docDir)+2,100);
                parambyname('Document').asstring := Copy(Files.Strings[icount], length(dmBroker.GetCompanySupplierDirectory)+1,255);
                parambyname('Date_Created').asdatetime := FileDateToDateTime(FileAge(Files.Strings[icount]));
                execsql;
              end;
          end;
        ShowDocuments;
//        dbgdocuments.Row := Quote.Documents.count;
      end;
    end;
  end;
end;

procedure TPBMaintSuppFrm.mnuDocChangeClick(Sender: TObject);
begin
  CallMaintDocuments('C');
end;

procedure TPBMaintSuppFrm.CallMaintDocuments(const aMode: string);
var
  frm: TPBMaintDocumentFrm;
begin
  frm := TPBMaintDocumentFrm.Create(Self);

  try
    frm.Mode := aMode;

    frm.DocumentNo := dbgDocuments.datasource.dataset.fieldbyname('Document_no').asinteger;
    frm.DocumentPath := dbgDocuments.datasource.dataset.fieldbyname('Document').asstring;
    frm.DocumentTitle := dbgDocuments.datasource.dataset.fieldbyname('Document_Title').asstring;
    frm.DocumentDate := dbgDocuments.datasource.dataset.fieldbyname('Date_Created').asdatetime;
    Frm.ShowModal;

    if (Frm.ModalResult = mrOK) then
      begin
        if aMode = 'D' then
          begin
            with dtmdlOneSupplier.qryDelDocument do
              begin
                close;
                parambyname('Supplier').asinteger := iSupplier;
                parambyname('Document_no').asinteger := frm.DocumentNo;
                execsql;
              end;
          end
        else
          begin
            with dtmdlOneSupplier.qryUpdDocument do
              begin
                close;
                parambyname('Supplier').asinteger := iSupplier;
                parambyname('Document_no').asinteger := frm.DocumentNo;
                parambyname('Document').asstring := frm.DocumentPath;
                parambyname('Document_Title').asstring := frm.DocumentTitle;
                execsql;
              end;
          end;
        ShowDocuments;
      end;
  finally
    Frm.Free;
  end;
end;

procedure TPBMaintSuppFrm.mnuDocDeleteClick(Sender: TObject);
begin
  CallMaintDocuments('D');
end;

procedure TPBMaintSuppFrm.mnuDocOpenClick(Sender: TObject);
var
  iTempResult: Integer;
  FiName, Params: Array [0..255] of char ;
  sTempError: String ;
  compdir, docPath: string;
begin
  if dbgDocuments.DataSource.DataSet.fieldbyname('Document_Title').asstring = '' then
    exit;

  compdir := dmBroker.GetCompanySupplierDirectory;
  docPath := dbgDocuments.DataSource.DataSet.fieldbyname('Document').asstring;

  Params := '' ;
  StrPCopy(FiName, compdir+DocPath) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  If iTempResult <= 32 then
  begin
    {There was an error} ;
    sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
    Case iTempResult of
      ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
      ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
      ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
      SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
      SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
      SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
      SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
      SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
      SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
      SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
      SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
      SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
    end;
    MessageDlg(sTempError,mtError,[mbOK],0) ;
  end;
end;

procedure TPBMaintSuppFrm.NameEditExit(Sender: TObject);
var
  sAccCode: string;
  icount: integer;
begin
  if (dmBroker.DefaultSupplierAccCode) and (sFuncMode = 'A') then
    begin
      sAccCode := leftstr(stringreplace(trim(NameEdit.Text), ' ', '',[rfReplaceAll]),8);

      if dmBroker.SupplierAccCodeunique then
        begin
          icount := 0;

          while icount >= 0 do
            begin
              with dtmdlOneSupplier.CheckSuppAccExistsSQL do
                begin
                  Close;
                  ParamByName('Acc_Code').AsString := sAccCode;
                  ParamByName('Supplier').AsInteger := iCode;
                  Open;
                  if recordcount > 0 then
                    begin
                      icount := icount + 1;
                      if icount < 10 then
                        sAccCode := leftStr(sAccCode,7) + inttostr(icount)
                      else
                        sAccCode := leftStr(sAccCode,6) + inttostr(icount);
                    end
                  else
                    begin
                      break;
                    end;
                end;
            end;
        end;

      AccCodeEdit.Text := sAccCode;

    end;
end;

procedure TPBMaintSuppFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintSuppFrm.BitBtn2Click(Sender: TObject);
begin
  dblkppaymentTerms.KeyValue := 0;
end;

procedure TPBMaintSuppFrm.btnTermsClick(Sender: TObject);
begin
  PBLUPaymentTermsFrm := TPBLUPaymentTermsFrm.Create(self) ;
  try
    PBLUPaymentTermsFrm.bIs_Lookup := False ;
    PBLUPaymentTermsFrm.bAllow_Upd := True ;
    PBLUPaymentTermsFrm.SelCode := dblkpPaymentTerms.keyvalue ;
    PBLUPaymentTermsFrm.ShowModal ;
  Finally;
    PBLUPaymentTermsFrm.Free ;
  end;

  dtmdlOneSupplier.qryTerms.Active := False;
  dtmdlOneSupplier.qryTerms.Active := True;
end;

end.
