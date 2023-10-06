unit pbluCustJobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ComCtrls, ImgList, ToolWin, ExtCtrls, Db, pbJobBagDM,
  Menus, Inifiles, Buttons, System.ImageList;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Jobsclosed   = WM_APP + 105; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmpbluCustJobs = class(TForm)
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    imglstjobs: TImageList;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    Label1: TLabel;
    edtSearch: TEdit;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    pmnFunctions: TPopupMenu;
    pmnuAdd: TMenuItem;
    pmnuChange: TMenuItem;
    pmnuDelete: TMenuItem;
    N1: TMenuItem;
    Panel2: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    lblTitle: TLabel;
    PageScroller2: TPageScroller;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnEnquiries: TToolButton;
    btnProduction: TToolButton;
    btnStock: TToolButton;
    btnJobs: TToolButton;
    btnCustomers: TToolButton;
    btnSalesInvoicing: TToolButton;
    btnDraft: TToolButton;
    btnRepeat: TToolButton;
    ToolButton2: TToolButton;
    pmnuRepeat: TMenuItem;
    N2: TMenuItem;
    pmnuDraft: TMenuItem;
    btnSearch: TBitBtn;
    btnDelete: TToolButton;
    btnPrint: TToolButton;
    btnReports: TToolButton;
    ToolButton3: TToolButton;
    pmnuPrint: TMenuItem;
    btnQuotes: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure mnuResetClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSalesInvoicingClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnDraftClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnRepeatClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnQuotesClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TJBMode);
    function CheckInput: boolean;
    procedure SetOperator(iTempOp: Integer);
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  private
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    FActivated: boolean;
    FCustomer: integer;
    FParentForm: TForm;
    iOperatorRep: Integer;
    iMnuMaint: integer;
    dmJobBag: TdmJobBag;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetButtonProperties(Sender: TObject);
    procedure SetCustomer(const Value: integer);
    procedure SetParentForm(const Value: TForm);
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    CustomerName: string;
    bDatasetempty : ByteBool;
    procedure ClearSearchCriteria;
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmpbluCustJobs: TfrmpbluCustJobs;

implementation

uses FireDAC.Stan.Param, 
  System.UITypes,
  pbJobsDm, pbMaintJobBagDets, CCSCommon, PBMaintJobBag,
  pbluCustomers, pbluJobsSearch, pbMainMenu, pbDatabase, PBRSJBDraft,
  PBMaintJobBagInactive, PBRSJobBag, pbLUJobRpts;

{$R *.DFM}

procedure TfrmpbluCustJobs.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmpbluCustJobs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Jobsclosed, left, Top);
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'CustomerJobLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmpbluCustJobs.luCustomersParentClosed(var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmpbluCustJobs.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    stempdate := IniFile.ReadString('Centrereed Broker', 'Customer Job Bag Search Date', 'None');
  finally
    IniFile.Free;
  end;

  dtmdlJobs := TdtmdlJobs.create(self);

  if stempdate = 'None' then
    dtmdlJobs.JobDate := Date - 365
  else
    dtmdlJobs.JobDate := PBdatestr(stempdate);


  dtmdlJobs.dtsJobs.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlJobs.dtsJobs;

  btnStock.visible := frmPBMainMenu.btnStock.visible;
  btnJobs.visible := frmPBMainMenu.btnJobs.visible;

  CCSCommon.SetDBGridCols('', 'CustomerJobLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  dmBroker.ScreenAccessControl(Self,'mnuJobs',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmpbluCustJobs.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustJobs.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlJobs do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnDraft.Enabled := HeaderCount > 0;
    btnRepeat.Enabled := HeaderCount > 0;
    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Job_Bag').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustJobs.SetButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this job if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the job bag maint button on the menu} ;
  bTempCanUpd :=  ((iMnuMaint = 1) or
                  (iMnuMaint = 4) or
                  (iMnuMaint = 5)) ;
  {They can ADD jobs IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanAdd := ((iMnuMaint = 1) or (iMnuMaint = 4) or
                                        (iMnuMaint = 5)) ;
  btnAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnChange.Caption := '  &Change  ';
    end
  else
    begin
      btnChange.Caption := '   &View   ';
    end;
  btnRepeat.Visible := bTempCanUpd ;

  btnDelete.Visible := bTempCanUpd and dmBroker.OperatorCanDeleteJobBag(frmPBMainMenu.iOperator);
// set popup menu properties
  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuRepeat.Visible := btnRepeat.Visible;
  pmnuPrint.Visible := btnPrint.Visible;
  pmnuDelete.visible := btnDelete.Visible
end;

procedure TfrmpbluCustJobs.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dtmdlJobs.Customer := FCustomer;
  dtmdlJobs.RefreshData;
end;

procedure TfrmpbluCustJobs.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Customer Job Bag Search Date', pbdatestr(dtmdlJobs.JobDate));
  finally
    IniFile.Free;
  end;

  dtmdlJobs.free;
end;

procedure TfrmpbluCustJobs.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlJobs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustJobs.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlJobs.refreshdata;
end;

procedure TfrmpbluCustJobs.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustJobs.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbluCustJobs.btnSearchClick(Sender: TObject);
begin
  frmpbLuJobsSearch := TfrmpbLuJobsSearch.create(self);
  try
    frmpbLuJobsSearch.dtmdlSearchJobs := dtmdlJobs;
    frmpbLuJobsSearch.edtBranch.text := dtmdlJobs.BranchName;
    frmpbLuJobsSearch.edtCustOrderNo.Text := dtmdlJobs.CustomerRef;
    frmpbLuJobsSearch.edtStatus.Text := dtmdlJobs.Status;
    frmpbLuJobsSearch.edtQuantity.Text := dtmdlJobs.OrdQtyDesc;
    frmpbLuJobsSearch.edtQuote.Text := dtmdlJobs.Quote;
    frmpbLuJobsSearch.edtDescription.text := dtmdlJobs.Description;
    frmpbLuJobsSearch.edtDescriptiveRef.Text := dtmdlJobs.DescriptiveRef;
    frmpbLuJobsSearch.edtRep.Text := dtmdlJobs.RepName;
    frmpbLuJobsSearch.edtAccountMgr.Text := dtmdlJobs.AccountMgr;
    frmpbLuJobsSearch.edtOperator.Text := dtmdlJobs.OperatorName;
    frmpbLuJobsSearch.edtDate.Text := pbDateStr(dtmdlJobs.JobDate);
    frmpbLuJobsSearch.edtDateReq.Text := pbDateStr(dtmdlJobs.DateRequired);
    frmpbLuJobsSearch.showModal;
  finally
    frmpbLuJobsSearch.free;
  end;
end;

procedure TfrmpbluCustJobs.ClearSearchCriteria;
begin
  dtmdlJobs.BranchName := '';
  dtmdlJobs.CustomerRef := '';
  dtmdlJobs.Status := '';
  dtmdlJobs.OrdQtyDesc := '';
  dtmdlJobs.Description := '';

  edtSearch.text := '';
end;

procedure TfrmpbluCustJobs.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(jbView)
  else
    CallMaintScreen(jbChange);
end;

function TfrmpbluCustJobs.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Job_Bag', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Job '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustJobs.CallMaintScreen(aMode: TJBMode);
var
  Key : integer;
  frm : TPBMaintJobBagFrm;
  aBag : TJobBag;
  OrigAccCtrlMenu: integer;
begin
  if (aMode = jbChange) and (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      if MessageDlg('This job bag has been cancelled, you cannot maintain the details - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
      aMode := jbView;
    end
  else
  if (aMode = jbChange) and (dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger >= 25) then
    begin
      if MessageDlg('This job bag has been ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
    end;

  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;
  dmJobBag := TdmJobBag.Create(Self);

  if aMode = jbAdd then
    Key := 0
  else
    begin
  //    Key := dmJobBag.CurrentJobBag;  { Get it before we close dataset }
      Key := dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    end;

  try
    aBag := TJobBag.Create(dmJobBag);
    try
      aBag.DbKey := key;
      aBag.JBMode := aMode;
      aBag.LoadFromDB;
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.JobBag := aBag;

        // if not in View mode, check is this record is locked, if not then lock it
        // 0  not locked
        // 1  locked but want to view
        // 2  locked and don't want to view
        if (dmBroker.iAccCtrlMenu <> 3) and (aMode = jbChange) then
          begin
            case dmBroker.LockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',Frm.caption,frmPBMainMenu.Workstation,true) of
              0:;
              1: dmBroker.iAccCtrlMenu := 3;
              2: exit
            end
          end;

        Frm.ShowModal;
        if (Frm.ModalResult = mrok)
         then
          begin
            Key := aBag.DbKey;
          end;

      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(inttostr(aBag.DbKey),'','','','','Job Bag',frmPBMainMenu.Workstation);
      aBag.Free;
    end;
  finally
    dmJobBag.Free;
    dmBroker.iAccCtrlMenu := OrigAccCtrlMenu;
  end;

    dtmdlJobs.RefreshData;
    dbgDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
//  CallHeaderForm(jbChange);
end;

procedure TfrmpbluCustJobs.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(jbAdd);
end;

procedure TfrmpbluCustJobs.mnuResetClick(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('CustomerJobLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmpbluCustJobs.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmpbluCustJobs.btnEnquiriesClick(Sender: TObject);
begin
  frmpbluCustomers.btnEnquiriesClick(self);
end;

procedure TfrmpbluCustJobs.btnStockClick(Sender: TObject);
begin
  frmpbluCustomers.btnStockClick(self);
end;

procedure TfrmpbluCustJobs.btnProductionClick(Sender: TObject);
begin
  frmpbluCustomers.btnProductionClick(self);
end;

procedure TfrmpbluCustJobs.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmpbluCustJobs.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
//      btnPrint.Visible := false;
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuJobs') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlJobs.Operator := frmpbMainMenu.iOperator;
      dtmdlJobs.Rep := iOperatorRep;

      SetButtonProperties(self);

      Factivated := true;
    end;

  dtmdlJobs.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(ActiveCode)),[lopartialKey]);

(*  SetOperator(frmPBMainMenu.iOperator);
  if Customer <> 0 then
    dtmdlJobs.refreshdata;
*)
end;

procedure TfrmpbluCustJobs.btnCustomersClick(Sender: TObject);
begin
  frmpbluCustomers.btnCustomersClick(self);
end;

procedure TfrmpbluCustJobs.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if (dbgDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('NCA_Signed_Off').Asinteger > 0) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := cllime;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') or (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'P') then
    begin
      (Sender as TDBGrid).Canvas.font.Color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

(*  if  (Column.Title.Caption <> 'Bag No') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
    end;
*)
end;

procedure TfrmpbluCustJobs.btnSalesInvoicingClick(Sender: TObject);
begin
  frmpbluCustomers.btnSalesInvoicingClick(self);
end;

procedure TfrmpbluCustJobs.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
    begin
      if TToolButton(Components[icount]).Parent.Name <> 'ToolBar1' then
        TToolButton(Components[icount]).Enabled := False;
    end;
  end;
  {Set buttons according to file}
  try
    with dmBroker.qryGetButtons do
    begin
      Close;
      ParamByName('Operator').AsInteger := iTempOp;
      Open;
      First;
      while not EOF do
      begin
        cTempComp :=
          self.FindComponent(stringreplace((FieldByName('Button_Name').AsString),'mnu','btn',[rfReplaceAll,rfIgnoreCase]));
        if Assigned(cTempComp) then
          if cTempComp is TToolButton then
            try
            (cTempComp as TToolButton).Enabled := (FieldByName('Button_Status').AsString <> 'B');
            except
            end;
        Next;
      end;
    end;
  except
  end;
  btnJobs.Enabled := false;
end;

procedure TfrmpbluCustJobs.pmnFunctionsPopup(Sender: TObject);
begin
  pmnuChange.Caption := btnChange.caption;
end;

procedure TfrmpbluCustJobs.btnDraftClick(Sender: TObject);
var
  bTempOK: Boolean;
  selcode: integer;
  customername: string;
begin
  if (dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger > 25) then
    begin
      MessageDlg('This job bag has been ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' a draft invoice is not available', mtInformation,
      [mbOk], 0);
        Exit;
    end;

  CustomerName := dbgDetails.datasource.dataset.fieldbyname('Customer_Name').asstring;
  selcode := dbgDetails.datasource.dataset.fieldbyname('Job_Bag').asinteger;
  try
    PBRSJBDraftfrm := TPBRSJBDraftfrm.create(self);
    PBRSJBDraftfrm.OrderGroupBox.caption := PBRSJBDraftfrm.OrderGroupBox.caption + inttostr(selcode);
    PBRSJBDraftfrm.lblCustomer.caption := CustomerName;
    PBRSJBDraftfrm.lblDescription.caption := dbgDetails.datasource.dataset.fieldbyname('Job_Bag_Descr').asstring;
    PBRSJBDraftfrm.JBNumber := selcode;
    PBRSJBDraftfrm.showmodal;
    bTempOK := PBRSJBDraftfrm.bOK;
  finally
    PBRSJBDraftfrm.free;
  end;
end;

procedure TfrmpbluCustJobs.btnDeleteClick(Sender: TObject);
var
  key: integer;
begin
  if (dbgDetails.Datasource.Dataset.fieldbyname('Inactive').asstring = 'Y') then
    begin
      key := dbgDetails.datasource.dataset.FieldByName('Job_Bag').asinteger;
      PBMaintJobBagInactiveFrm := TPBMaintJobBagInactiveFrm.create(self);
      try
        PBMaintJobBagInactiveFrm.iJobBag := key;
        PBMaintJobBagInactiveFrm.lblJobBag.caption := dbgDetails.datasource.dataset.FieldByName('Job_Bag').asstring;
        PBMaintJobBagInactiveFrm.lblDescription.caption := dbgDetails.datasource.dataset.FieldByName('Job_Bag_Descr').asstring;
        PBMaintJobBagInactiveFrm.lblCustomer.caption := dbgDetails.datasource.dataset.FieldByName('Customer_Name').asstring;
        PBMaintJobBagInactiveFrm.showmodal;
        if PBMaintJobBagInactiveFrm.modalresult = idOK then
          begin
            dtmdlJobs.Refreshdata;
            dbgDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
          end;
      finally
        PBMaintJobBagInactiveFrm.Free;
      end;
    end
  else
  if (dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger >= 25) then
    begin
      MessageDlg('This job bag status is ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
        ' and therefore cannot be deleted or cancelled.', mtError, [mbOk], 0);
    end
  else
  if (dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status').asinteger > 10) then
    begin
      if dbgDetails.datasource.dataset.FieldByName('PO_Lines').asinteger > 0 then
        begin
          messageDlg('This job bag contains live Purchase Orders and therefore cannot be deleted or cancelled', mtInformation, [mbOk], 0);
          exit;
        end
      else
        begin
          if MessageDlg('This job bag status is ' +
            dbgDetails.Datasource.Dataset.fieldbyname('Job_Bag_Status_Descr').asstring +
            ' and therefore cannot be deleted. Do you want to cancel it instead?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
          begin
            PBMaintJobBagInactiveFrm := TPBMaintJobBagInactiveFrm.create(self);
            try
              PBMaintJobBagInactiveFrm.iJobBag := dbgDetails.datasource.dataset.FieldByName('Job_Bag').asinteger;
              PBMaintJobBagInactiveFrm.lblJobBag.caption := dbgDetails.datasource.dataset.FieldByName('Job_Bag').asstring;
              PBMaintJobBagInactiveFrm.lblDescription.caption := dbgDetails.datasource.dataset.FieldByName('Job_Bag_Descr').asstring;
              PBMaintJobBagInactiveFrm.lblCustomer.caption := dbgDetails.datasource.dataset.FieldByName('Customer_Name').asstring;
              PBMaintJobBagInactiveFrm.showmodal;
              if PBMaintJobBagInactiveFrm.modalresult = idOK then
                dtmdlJobs.Refreshdata;
            finally
              PBMaintJobBagInactiveFrm.Free;
            end;
          end;
        end;
    end
  else
    CallMaintScreen(jbDelete);
end;

procedure TfrmpbluCustJobs.btnRepeatClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Jobs cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  CallMaintScreen(jbRepeat);
end;

procedure TfrmpbluCustJobs.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
  tmpCustomer, tmpDescription: string;
begin
  if not CheckInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmPBRSJobBag := TfrmPBRSJobBag.Create( Application );
    Key := dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    tmpCustomer := dbgdetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    tmpDescription := dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag_Descr').asstring;

    frmPBRSJobBag.memSelection.text := inttostr(Key);
    frmPBRSJobBag.edtCustomer.text := tmpCustomer;
    frmPBRSJobBag.memDescription.text := tmpDescription;
    frmPBRSJobBag.memQuantity.text := dbgdetails.DataSource.DataSet.fieldbyname('Quantity').asstring;
    frmPBRSJobBag.showmodal;
  finally
    frmPBRSJobBag.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmpbluCustJobs.btnReportsClick(Sender: TObject);
begin
  frmPBLUJobRpts := TfrmPBLUJobRpts.create(self);
  try
    frmPBLUJobRpts.showmodal;
  finally
    frmPBLUJobRpts.free;
  end;
end;

procedure TfrmpbluCustJobs.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Job_Bag').asinteger;
  except
    ActiveCode := 0;
  end;
end;

procedure TfrmpbluCustJobs.btnQuotesClick(Sender: TObject);
begin
  frmpbluCustomers.btnQuotesClick(self);
end;

end.
