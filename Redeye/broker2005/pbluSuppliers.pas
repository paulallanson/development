unit pbluSuppliers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, ImgList,
  Db, Menus;

type
  TfrmpbluSuppliers = class(TForm)
    stsbrdetails: TStatusBar;
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    imglstMaint: TImageList;
    tmrSearch: TTimer;
    lblSearch: TLabel;
    edtSearch: TEdit;
    dbgDetails: TDBGrid;
    ToolButton1: TToolButton;
    btnContacts: TToolButton;
    btnBranches: TToolButton;
    pmnFunctions: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    Branches1: TMenuItem;
    Contacts1: TMenuItem;
    Panel3: TPanel;
    Label3: TLabel;
    btnClose: TButton;
    btnReports: TToolButton;
    btnFileTypes: TToolButton;
    ToolButton2: TToolButton;
    btnLabels: TToolButton;
    btnSearch: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnBranchesClick(Sender: TObject);
    procedure btnContactsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnFileTypesClick(Sender: TObject);
    procedure btnLabelsClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    FDisableNameChangeEvent: Boolean;
    procedure SetDisableNameChangeEvent(const Value: Boolean);
    procedure CallMaintScreen(Mode: string);
  private
    FActivated: Boolean;
    DontSaveLayout: boolean;
    procedure SetButtons(Sender: TObject; Field: TField);
    property DisableNameChangeEvent: Boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmpbluSuppliers: TfrmpbluSuppliers;

implementation

uses pbSupplierDm, pbLuBranches, pbluContacts, PBMaintSupp, PBMaintSConta, CCSCommon,
  pbDatabase, pbMainMenu, PBLUSupplierRpts, PBLUSupOrdType, PBRSCusSupLabs,
  pbluSupplierSearch;

{$R *.DFM}

procedure TfrmpbluSuppliers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if MessageDlg('Do you want to close all the supplier details ?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
    begin
      if Self.dontSaveLayout then
      begin
      //dont do anything
      end
      else
      begin
        CCSCommon.SaveDBGridCols('', 'SupplierLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
        CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
      end;
      Action := caFree
    end
  else
    Action := caNone;
end;

procedure TfrmpbluSuppliers.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlSuppliers.refreshdata;
end;

procedure TfrmpbluSuppliers.FormCreate(Sender: TObject);
begin
  dtmdlSuppliers := TdtmdlSuppliers.create(self);
  dtmdlSuppliers.dtsSuppliers.OnDataChange := SetButtons;

  CCSCommon.SetDBGridCols('', 'SupplierLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmpbluSuppliers.FormDestroy(Sender: TObject);
begin
  dtmdlSuppliers.free;
end;

procedure TfrmpbluSuppliers.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluSuppliers.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlSuppliers do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnBranches.Enabled := HeaderCount > 0;
    btnContacts.Enabled := HeaderCount > 0;
    btnFileTypes.Enabled := HeaderCount > 0;
    btnLabels.Enabled := HeaderCount > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;
procedure TfrmpbluSuppliers.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlSuppliers.SupplierName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluSuppliers.SetDisableNameChangeEvent(const Value: Boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluSuppliers.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmpbluSuppliers.btnAddClick(Sender: TObject);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  {Add a new customer}
  PBMaintSuppFrm := TPBMaintSuppFrm.Create(Self);
  try
    PBMaintSuppFrm.sFuncMode := 'A';
    PBMaintSuppFrm.ShowModal;
    bTempOK := (PBMaintSuppFrm.ModalResult = mrOK);
    iTempSel := PBMaintSuppFrm.iCode;

    if bTempOK then
    begin
      PBMaintSContaFrm := TPBMaintSContaFrm.Create(Self);
      try
        PBMaintSContaFrm.sFuncMode := 'A';
        PBMaintSContaFrm.iSupp := iTempSel;
        PBMaintSContaFrm.iBranch := 0;

        PBMaintSContaFrm.iCode := 0;
        PBMaintSContaFrm.sSuppName := PBMaintSuppFrm.NameEdit.Text;
        PBMaintSContaFrm.sBranchName := 'Head Office';
        PBMaintSContaFrm.PhoneEdit.text := PBMaintSuppFrm.PhoneEdit.Text;
        PBMaintSContaFrm.FaxEdit.text := PBMaintSuppFrm.FaxEdit.Text;

        PBMaintSContaFrm.ShowModal;
      finally
        PBMaintSContaFrm.Free;
      end;
    end;
  finally
    PBMaintSuppFrm.Free;
  end;

  if bTempOK then
  begin
    edtSearch.text := PBMaintSuppFrm.NameEdit.text;
    dtmdlSuppliers.refreshdata;
    dbgDetails.DataSource.DataSet.Locate('Supplier', Variant(inttostr(iTempSel)),[lopartialKey]) ;
  end;

end;

procedure TfrmpbluSuppliers.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');

end;

procedure TfrmpbluSuppliers.CallMaintScreen(Mode: string);
var
  bTempOK: ByteBool;
  iTemp: integer;
begin
  PBMaintSuppFrm := TPBMaintSuppFrm.Create(Self);
  try
    pbMaintSuppFrm.dtmdlOneSupplier := dtmdlSuppliers;
    if Mode = 'A' then
      PBMaintSuppFrm.iSupplier := 0
    else
      PBMaintSuppFrm.iSupplier := dbgDetails.datasource.dataset.fieldbyname('Supplier').asinteger;

    PBMaintSuppFrm.sFuncMode := Mode;
    PBMaintSuppFrm.ShowModal;
    bTempOK := (PBMaintSuppFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintSuppFrm.iCode;
        if Mode = 'A' then
          edtSearch.text := PBMaintSuppFrm.NameEdit.text
        else
          begin
            dtmdlSuppliers.refreshdata;
            dbgDetails.DataSource.DataSet.Locate('Supplier', Variant(inttostr(iTemp)),[lopartialKey]) ;
          end;
      end;
  finally
    PBMaintSuppFrm.Free;
  end;
end;

procedure TfrmpbluSuppliers.btnBranchesClick(Sender: TObject);
begin
  frmpbluBranches := TfrmpbluBranches.create(self);
  try
    frmpbluBranches.Code := dbgDetails.datasource.dataset.fieldbyname('Supplier').asinteger;
    frmpbluBranches.CodeType := 'S';
    frmpbluBranches.Caption := 'Supplier '+ frmpbluBranches.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluBranches.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluBranches.showmodal;
  finally
    frmpbluBranches.free;
  end;
end;

procedure TfrmpbluSuppliers.btnContactsClick(Sender: TObject);
begin
  frmpbluContacts := TfrmpbluContacts.create(self);
  try
    frmpbluContacts.Code := dbgDetails.datasource.dataset.fieldbyname('Supplier').asinteger;
    frmpbluContacts.CodeType := 'S';
    frmpbluContacts.Caption := 'Supplier '+ frmpbluContacts.Caption + ' - ' + dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluContacts.MainName := dbgDetails.datasource.dataset.fieldbyname('Name').asstring;
    frmpbluContacts.showmodal;
  finally
    frmpbluContacts.free;
  end;
end;

procedure TfrmpbluSuppliers.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmpbluSuppliers.FormShow(Sender: TObject);
begin
  dtmdlSuppliers.RefreshData;
  edtsearch.setfocus;
end;

procedure TfrmpbluSuppliers.btnReportsClick(Sender: TObject);
begin
  frmPBLUSupplierRpts := TfrmPBLUSupplierRpts.create(self);
  try
    frmPBLUSupplierRpts.showmodal;
  finally
    frmPBLUSupplierRpts.free;
  end;
end;

procedure TfrmpbluSuppliers.btnFileTypesClick(Sender: TObject);
begin
  PBLUSupOrdTypeFrm := TPBLUSupOrdTypeFrm.Create(Self);
  try
    PBLUSupOrdTypeFrm.bIs_Lookup := False;
    PBLUSupOrdTypeFrm.bAllow_Upd := True;
    PBLUSupOrdTypeFrm.iSupp := dbgDetails.datasource.DataSet.FieldByName('Supplier').AsInteger;
    PBLUSupOrdTypeFrm.sSuppName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBLUSupOrdTypeFrm.ShowModal;
  finally
    PBLUSupOrdTypeFrm.Free;
  end;
end;

procedure TfrmpbluSuppliers.btnLabelsClick(Sender: TObject);
begin
  PBRSCusSupLabsFrm := TPBRSCusSupLabsFrm.Create(Self);
  try
    {Select mode as customer/supplier} ;
    PBRSCusSupLabsFrm.bCustomer := False;
    {Feed in the supplier code} ;
    PBRSCusSupLabsFrm.iCode := dbgDetails.datasource.DataSet.FieldByName('Supplier').AsInteger;
    PBRSCusSupLabsFrm.sName := dbgDetails.datasource.DataSet.FieldByName('Name').AsString;
    PBRSCusSupLabsFrm.ShowModal;
  finally
    PBRSCusSupLabsFrm.Free;
  end;
end;

procedure TfrmpbluSuppliers.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('Acc_Active').AsString = 'N') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmpbluSuppliers.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuSuppliers') ;
  if not FActivated then
  begin
    FActivated := True;
  end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);
end;

procedure TfrmpbluSuppliers.btnSearchClick(Sender: TObject);
begin
  frmpbluSupplierSearch := TfrmpbluSupplierSearch.create(self);
  try
    frmpbluSupplierSearch.dtmdlSearchSuppliers := dtmdlSuppliers;
    frmpbluSupplierSearch.edtTown.text := dtmdlSuppliers.Town;
    frmpbluSupplierSearch.edtPostcode.Text := dtmdlSuppliers.Postcode;
    frmpbluSupplierSearch.edtCounty.Text := dtmdlSuppliers.County;
    frmpbluSupplierSearch.edtTelephone.Text := dtmdlSuppliers.Telephone;
    frmpbluSupplierSearch.edtFax.Text := dtmdlSuppliers.Fax;

//    frmpbluSupplierSearch.edtDate.Text := pbDateStr(dtmdlSuppliers.DateCreated);

    frmpbluSupplierSearch.chkbxShowInactive.checked := dtmdlSuppliers.ShowInactive;
    frmpbluSupplierSearch.showModal;
  finally
    frmpbluSupplierSearch.free;
  end;

end;

end.
