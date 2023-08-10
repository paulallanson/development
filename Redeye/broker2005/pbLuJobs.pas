unit pbLuJobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin,
  Db, pbJobsDM, pbJobBagDM, inifiles, Buttons, System.ImageList;

type
  TfrmPBLUJobs = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsbrDetails: TStatusBar;
    imglstjobs: TImageList;
    tmrSearch: TTimer;
    pmnFunctions: TPopupMenu;
    pmnuAdd: TMenuItem;
    pmnuChange: TMenuItem;
    Panel2: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    btnReports: TToolButton;
    Panel3: TPanel;
    Label3: TLabel;
    btnDraft: TToolButton;
    pmnuPrintDraft: TMenuItem;
    btnRepeat: TToolButton;
    ToolButton1: TToolButton;
    pmnuRepeat: TMenuItem;
    N2: TMenuItem;
    ToolButton3: TToolButton;
    btnPrint: TToolButton;
    pmnuPrint: TMenuItem;
    N3: TMenuItem;
    ResetGrid1: TMenuItem;
    btnSearch: TBitBtn;
    lblWorkinProgress: TLabel;
    btnDelete: TToolButton;
    pmnuDelete: TMenuItem;
    pmnuNonConform: TMenuItem;
    rdgrpShowComplete: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    btnInvoiceThisWeek: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnReportsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnDraftClick(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure btnRepeatClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure btnInvoiceThisWeekClick(Sender: TObject);
  private
    FActivated: boolean;
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    iMnuMaint: integer;
    iOperatorRep: Integer;
    FDisableNameChangeEvent: boolean;
    dtmdlAllJobs : TdtmdlJobs;
    dmJobBag: TdmJobBag;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetButtonProperties(Sender: TObject);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TJBMode);
    function CheckInput: boolean;
    { Private declarations }
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmPBLUJobs: TfrmPBLUJobs;

implementation

uses CCSCommon, PBMaintJobBagDets, pbLUJobRpts, pbluJobsSearch, pbDatabase,
  pbMainMenu, PBRSJBDraft, PBMaintJobBag, PBRSJobBag,
  PBMaintJobBagInactive, PBMaintJobBagNonConform;

{$R *.DFM}

procedure TfrmPBLUJobs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'JobLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmPBLUJobs.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUJobs.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllJobs.refreshdata;
end;

procedure TfrmPBLUJobs.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowWIP: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Job Bag Search Date', 'None');
      sShowWIP := ReadString('Centrereed Broker', 'Show Job Bag WIP', 'None');
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllJobs := TdtmdlJobs.create(self);

  if stempdate = 'None' then
    dtmdlAllJobs.JobDate := Date - 365
  else
    dtmdlAllJobs.JobDate := PBdatestr(stempdate);

  if sShowWIP = 'None' then
    dtmdlAllJobs.ShowWIP := false
  else
    dtmdlAllJobs.ShowWIP := true;

  dtmdlAllJobs.dtsJobs.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllJobs.dtsJobs;

  CCSCommon.SetDBGridCols('', 'JobLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);

//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
//  dmBroker.ScreenAccessControl(Self,'mnuJobs',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUJobs.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowWIP: string;
begin
  if dtmdlAllJobs.ShowWIP then
    sShowWIP := 'Show'
  else
    sShowWIP := 'None';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Centrereed Broker', 'Job Bag Search Date', pbdatestr(dtmdlAllJobs.JobDate));
      WriteString('Centrereed Broker', 'Show Job Bag WIP', sShowWIP);
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllJobs.free;
end;

procedure TfrmPBLUJobs.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllJobs do
  begin
    btnChange.Enabled := HeaderCount > 0;
//    btnDelete.Enabled := HeaderCount > 0;
    btnRepeat.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnDraft.Enabled := HeaderCount > 0;
    btnInvoiceThisWeek.Enabled := HeaderCount > 0;
    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Job_Bag').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblWorkinProgress.Visible := ShowWIP;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUJobs.SetButtonProperties(Sender: TObject);
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

  btnInvoiceThisWeek.Visible := bTempCanUpd and dmBroker.ConfirmProduction;
  btnDelete.Visible := bTempCanUpd and dmBroker.OperatorCanDeleteJobBag(frmPBMainMenu.iOperator);
// set popup menu properties
  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuRepeat.Visible := btnRepeat.Visible;
  pmnuPrint.Visible := btnPrint.Visible;
  pmnuDelete.visible := btnDelete.Visible
end;

procedure TfrmPBLUJobs.FormShow(Sender: TObject);
begin
//  dtmdlAllJobs.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUJobs.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllJobs.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUJobs.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUJobs.CallMaintScreen(aMode: TJBMode);
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
            dtmdlAllJobs.RefreshData;
            dbgDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
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
end;

procedure TfrmPBLUJobs.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(jbAdd);
end;

procedure TfrmPBLUJobs.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(jbView)
  else
    CallMaintScreen(jbChange);
end;

function TfrmpbluJobs.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Job_Bag', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Job '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBLUJobs.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmPBLUJobs.btnReportsClick(Sender: TObject);
begin
  frmPBLUJobRpts := TfrmPBLUJobRpts.create(self);
  try
    frmPBLUJobRpts.showmodal;
  finally
    frmPBLUJobRpts.free;
  end;
end;

procedure TfrmPBLUJobs.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUJobs.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Job_Bag_Status').AsInteger = 5) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := cllime;
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('NCA_Live_Lines').Asinteger > 0) then
    (Sender as TDBGrid).Canvas.Brush.color := clRed
  else
  if (dbgDetails.datasource.dataset.fieldByName('NCA_Signed_Off').Asinteger > 0) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clyellow;
    end
//    (Sender as TDBGrid).Canvas.Brush.color := cllime
  else
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') or (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'P') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clRed;
//      (Sender as TDBGrid).Canvas.Brush.color := clRed
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Production_Complete').Asstring = 'Y') and (dbgDetails.datasource.dataset.fieldByName('Job_bag_Status').Asinteger < 30) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.color := clgreen;
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Invoice_This_Week').Asstring = 'Y') and (dbgDetails.datasource.dataset.fieldByName('Job_bag_Status').Asinteger < 30) then
        (Sender as TDBGrid).Canvas.Brush.color := $000080FF;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Quantity') then
  	begin
      if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		if Assigned(Column.Field) then 
	  StrPCopy(Txt, Column.field.text) else
	  StrPCopy(Txt, '');
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TfrmPBLUJobs.btnDeleteClick(Sender: TObject);
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
            dtmdlAllJobs.Refreshdata;
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
                dtmdlAllJobs.Refreshdata;
            finally
              PBMaintJobBagInactiveFrm.Free;
            end;
          end;
        end;
    end
  else
    CallMaintScreen(jbDelete);
end;

procedure TfrmPBLUJobs.btnSearchClick(Sender: TObject);
begin
  frmpbLuJobsSearch := TfrmpbLuJobsSearch.create(self);
  try
    frmpbLuJobsSearch.dtmdlSearchJobs := dtmdlAllJobs;
    frmpbLuJobsSearch.edtBranch.text := dtmdlAllJobs.BranchName;
    frmpbLuJobsSearch.edtCustOrderNo.Text := dtmdlAllJobs.CustomerRef;
    frmpbLuJobsSearch.edtStatus.Text := dtmdlAllJobs.Status;
    frmpbLuJobsSearch.edtProductionStatus.Text := dtmdlAllJobs.ProductionStatus;
    frmpbLuJobsSearch.edtQuantity.Text := dtmdlAllJobs.OrdQtyDesc;
    frmpbLuJobsSearch.edtQuote.Text := dtmdlAllJobs.Quote;
    frmpbLuJobsSearch.edtDescription.Text := dtmdlAllJobs.Description;
    frmpbLuJobsSearch.edtDescriptiveRef.Text := dtmdlAllJobs.DescriptiveRef;
    frmpbLuJobsSearch.edtRep.Text := dtmdlAllJobs.RepName;
    frmpbLuJobsSearch.edtSubRep.Text := dtmdlAllJobs.SubRepName;
    frmpbLuJobsSearch.edtAccountMgr.Text := dtmdlAllJobs.AccountMgr;
    frmpbLuJobsSearch.edtOperator.Text := dtmdlAllJobs.OperatorName;
    frmpbLuJobsSearch.edtEndUser.Text := dtmdlAllJobs.EndUSerName;
    frmpbLuJobsSearch.chkbxShowWIP.checked := dtmdlAllJobs.ShowWIP;
    frmpbLuJobsSearch.chkbxShowInactive.checked := (dtmdlAllJobs.ShowInactive = 'Y');

    frmpbLuJobsSearch.edtDate.Text := pbDateStr(dtmdlAllJobs.JobDate);
    frmpbLuJobsSearch.edtDateReq.Text := pbDateStr(dtmdlAllJobs.DateRequired);
    frmpbLuJobsSearch.showModal;
  finally
    frmpbLuJobsSearch.free;
  end;
end;

procedure TfrmPBLUJobs.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuJobs') ;

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
        dtmdlAllJobs.Operator := frmpbMainMenu.iOperator;
      dtmdlAllJobs.Rep := iOperatorRep;
      dtmdlAllJobs.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

      SetButtonProperties(self);
//      chkbxShowOnlyComplete.visible := dmBroker.ConfirmProduction;
      rdgrpShowComplete.Visible := dmBroker.ConfirmProduction;
      FActivated := True;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllJobs.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(ActiveCode)),[lopartialKey]);
end;

procedure TfrmPBLUJobs.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Job_Bag').asinteger;
  except
    ActiveCode := 0;
  end;
end;

procedure TfrmPBLUJobs.btnDraftClick(Sender: TObject);
var
  bTempOK: Boolean;
  selcode: integer;
  customername: string;
begin
  if not CheckInput then
    exit;

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

procedure TfrmPBLUJobs.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('JobLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmPBLUJobs.btnRepeatClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Jobs cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  if dtmdlAllJobs.CheckContract(dbgdetails.DataSource.DataSet.FieldByName('Job_Bag').asinteger) then
    begin
      MessageDlg('This job bag is part of a contract, the job bag must be repeated through the contract.', mtWarning,[mbOk], 0);
      exit;
    end;

  CallMaintScreen(jbRepeat);
end;

procedure TfrmPBLUJobs.btnPrintClick(Sender: TObject);
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

procedure TfrmPBLUJobs.pmnFunctionsPopup(Sender: TObject);
begin
  pmnuChange.Caption := trim(btnChange.caption);
end;

procedure TfrmPBLUJobs.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlAllJobs.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  if (column.fieldname = 'Status_Text') then
    SortField := 'Job_Bag_Status_Descr'
  else
    SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllJobs.SortOrder := SortField + SortType;
  dtmdlAllJobs.SortType := SortType;

  dtmdlAllJobs.refreshdata;
end;

procedure TfrmPBLUJobs.RadioButton1Click(Sender: TObject);
begin
  dtmdlAllJobs.ShowOnlyComplete := false;
  dtmdlAllJobs.ShowThisWeek := true;
  dtmdlAllJobs.RefreshData;
end;

procedure TfrmPBLUJobs.RadioButton2Click(Sender: TObject);
begin
  dtmdlAllJobs.ShowThisWeek := false;
  dtmdlAllJobs.ShowOnlyComplete := true;
  dtmdlAllJobs.RefreshData;
end;

procedure TfrmPBLUJobs.RadioButton3Click(Sender: TObject);
begin
  dtmdlAllJobs.ShowThisWeek := false;
  dtmdlAllJobs.ShowOnlyComplete := false;
  dtmdlAllJobs.RefreshData;
end;

procedure TfrmPBLUJobs.btnInvoiceThisWeekClick(Sender: TObject);
var
  key: integer;
  iCount: integer;
begin
  key := dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
  if dbgDetails.SelectedRows.Count = 1 then
    begin
      if  (dbgDetails.DataSource.DataSet.fieldbyname('Invoice_This_Week').asstring = '') or
          (dbgDetails.DataSource.DataSet.fieldbyname('Invoice_This_Week').asstring = 'N') then
          dtmdlAllJobs.SetInvoiceThisWeek(dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger, 'Y')
      else
          dtmdlAllJobs.SetInvoiceThisWeek(dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger, 'N');
    end
  else
    begin
      for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
        begin
          dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;

          if  (dbgDetails.DataSource.DataSet.fieldbyname('Invoice_This_Week').asstring = '') or
              (dbgDetails.DataSource.DataSet.fieldbyname('Invoice_This_Week').asstring = 'N') then
              dtmdlAllJobs.SetInvoiceThisWeek(dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger, 'Y')
          else
              dtmdlAllJobs.SetInvoiceThisWeek(dbgDetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger, 'N');
        end
    end;
    
  dtmdlAllJobs.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Job_Bag', Variant(inttostr(Key)),[lopartialKey]) ;
end;

end.
