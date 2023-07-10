unit pbluCustQuotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ImgList, ComCtrls, StdCtrls, ExtCtrls, ToolWin, Db, Menus,
  IniFiles, Buttons, pbJobBagDM, pbQuotesDM;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Quotesclosed   = WM_APP + 108; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmpbluCustQuotes = class(TForm)
    CoolBar1: TCoolBar;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    btnClose: TButton;
    tmrSearch: TTimer;
    Label2: TLabel;
    edtNumber: TEdit;
    pmnFunctions: TPopupMenu;
    mnuAdd: TMenuItem;
    mnuChange: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPrint: TMenuItem;
    N1: TMenuItem;
    mnuConvert: TMenuItem;
    ResetGrid1: TMenuItem;
    Panel3: TPanel;
    Panel2: TPanel;
    lblTitle: TLabel;
    PageScroller2: TPageScroller;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnProduction: TToolButton;
    btnJobs: TToolButton;
    btnStock: TToolButton;
    btnEnquiries: TToolButton;
    btnCustomers: TToolButton;
    btnSalesInvoicing: TToolButton;
    N4: TMenuItem;
    btnSearch: TBitBtn;
    dbgDetails: TDBGrid;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    btnDelete: TToolButton;
    btnPrint: TToolButton;
    ToolButton1: TToolButton;
    btnConvert: TToolButton;
    ToolButton3: TToolButton;
    btnReports: TToolButton;
    imglstButtons: TImageList;
    btnQuote: TToolButton;
    mnuDelete: TMenuItem;
    btnReQuote: TToolButton;
    mnuReQuote: TMenuItem;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure ResetGrid1Click(Sender: TObject);
    procedure btnJobsClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSalesInvoicingClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnReQuoteClick(Sender: TObject);
  private
    ActiveCode: integer;
    dtmdlQuotes: TdtmdlQuotes;
    FActivated: Boolean;
    FDisableNameChangeEvent: boolean;
    FParentForm: TForm;
    iOperatorRep: integer;
    iMnuMaint: integer;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetParentForm(const Value: TForm);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(aMode: TQMode);
    function CheckInput: boolean;
    procedure SetOperator(iTempOp: Integer);
    procedure ConvertToJob;
  private
    DontSaveLayout: Boolean;
    FCustomer: integer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    procedure SetCustomer(const Value: integer);
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  public
    CustomerName: string;
    procedure ClearSearchCriteria;
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmpbluCustQuotes: TfrmpbluCustQuotes;

implementation

uses CCSCommon, pbluCustomers, pbMainMenu, pbluQuotesSearch, pbDatabase,
  PBRSQuote, PBMaintQuote, PBMaintJobBag;

{$R *.DFM}

{ TfrmpbluCustQuotes }

procedure TfrmpbluCustQuotes.luCustomersParentClosed(
  var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmpbluCustQuotes.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dtmdlQuotes.Customer := FCustomer;
  dtmdlQuotes.RefreshData;
end;

procedure TfrmpbluCustQuotes.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustQuotes.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmpbluCustQuotes.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustQuotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Quotesclosed, left, Top);
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'CustomerQuotesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmpbluCustQuotes.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
  begin
    stempdate := ReadString('Centrereed Broker', 'Quote Search Date', 'None');
    Free;
  end;

  dtmdlQuotes := TdtmdlQuotes.create(self);

  if stempdate = 'None' then
    dtmdlQuotes.QuoteDate := Date - 365
  else
    dtmdlQuotes.QuoteDate := pbdatestr(stempdate);

  dtmdlQuotes.dsQHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlQuotes.dsQHeaderGrid;

  btnStock.visible := frmPBMainMenu.btnStock.visible;
  btnJobs.visible := frmPBMainMenu.btnJobs.visible;

  CCSCommon.SetDBGridCols('', 'CustomerQuotesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TfrmpbluCustQuotes.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
  begin
    WriteString('Centrereed Broker', 'Quote Search Date', pbdatestr(dtmdlQuotes.QuoteDate));
    Free;
  end;

  dtmdlQuotes.free;
end;

procedure TfrmpbluCustQuotes.btnSearchClick(Sender: TObject);
begin
  frmpbLuQuotesSearch := TfrmpbLuQuotesSearch.create(self);
  try
    frmpbLuQuotesSearch.dtmdlSearchQuotes := dtmdlQuotes;
    frmpbLuQuotesSearch.edtBranch.text := dtmdlQuotes.BranchName;
    frmpbLuQuotesSearch.edtCustOrderNo.Text := dtmdlQuotes.CustomerRef;
    frmpbLuQuotesSearch.edtStatus.Text := dtmdlQuotes.Status;
    frmpbLuQuotesSearch.edtQuantity.Text := dtmdlQuotes.Quantity;
    frmpbLuQuotesSearch.edtDescription.Text := dtmdlQuotes.Description;
    frmpbLuQuotesSearch.edtRep.Text := dtmdlQuotes.RepName;
    frmpbLuQuotesSearch.edtOperator.Text := dtmdlQuotes.OperatorName;
    frmpbLuQuotesSearch.chkbxShowInactive.checked := (dtmdlQuotes.ShowInactive = 'Y');
    frmpbLuQuotesSearch.chkbxShowLive.checked := dtmdlQuotes.ShowLive;

    frmpbLuQuotesSearch.edtDate.Text := pbDateStr(dtmdlQuotes.QuoteDate);
    frmpbLuQuotesSearch.showModal;
  finally
    frmpbLuQuotesSearch.free;
  end;
end;

procedure TfrmpbluCustQuotes.ClearSearchCriteria;
begin
  dtmdlQuotes.BranchName := '';
  dtmdlQuotes.CustomerRef := '';
  dtmdlQuotes.Status := '';
  dtmdlQuotes.Quantity := '';
  dtmdlQuotes.Description := '';
  dtmdlQuotes.RepName := '';
  dtmdlQuotes.OperatorName := '';

  edtSearch.text := '';
end;

procedure TfrmpbluCustQuotes.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlQuotes.refreshdata;
end;

procedure TfrmpbluCustQuotes.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbluCustQuotes.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlQuotes do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnReQuote.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnConvert.Enabled := HeaderCount > 0;
    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Quote').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustQuotes.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlQuotes.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustQuotes.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmpbluCustQuotes.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(qView)
  else
    CallMaintScreen(qChange);
end;

procedure TfrmpbluCustQuotes.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(qAdd);
end;

procedure TfrmpbluCustQuotes.CallMaintScreen(aMode: TQMode);
var
  Key : real;
  frm : TPBMaintQuoteFrm;
  aQuote : TQuote;
  OrigAccCtrlMenu: integer;
begin
  if (aMode = qChange) and (dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status').asinteger >= 100) then
    begin
      if MessageDlg('This quote is ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status_Description').asstring +
        ' and can only be viewed - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
      aMode := qView;
    end;

  OrigAccCtrlMenu := dmBroker.iAccCtrlMenu;

  if aMode = qAdd then
    Key := 0
  else
    begin
      Key := dbgDetails.DataSource.DataSet.fieldbyname('Quote').asfloat;
    end;

  try
    aQuote := TQuote.Create(dtmdlQuotes);
    try
      aQuote.DbKey := key;
      aQuote.qMode := aMode;
      aQuote.LoadFromDB;
      Frm := TPBMaintQuoteFrm.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Quote := aQuote;

        // if not in View mode, check is this record is locked, if not then lock it
        // 0  not locked
        // 1  locked but want to view
        // 2  locked and don't want to view
        if (dmBroker.iAccCtrlMenu <> 3) and (aMode = qChange) then
          begin
            case dmBroker.LockRecord(floattostr(aQuote.DbKey),'','','','','Quote',Frm.caption,frmPBMainMenu.Workstation,true) of
              0:;
              1: dmBroker.iAccCtrlMenu := 3;
              2: exit
            end
          end;

        Frm.ShowModal;
        if (Frm.ModalResult = mrok)
         then
          begin
            Key := aQuote.DbKey;
          end;

      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(floattostr(aQuote.DbKey),'','','','','Quote',frmPBMainMenu.Workstation);
      aQuote.Free;
    end;
  finally
    dmBroker.iAccCtrlMenu := OrigAccCtrlMenu;
  end;

  dtmdlQuotes.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(Key)),[lopartialKey]) ;
end;

procedure TfrmpbluCustQuotes.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: real;
begin
  if not CheckInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmPBRSQuote := TfrmPBRSQuote.Create( Application );
    Key := dbgdetails.DataSource.DataSet.fieldbyname('Quote').asfloat;

    frmPBRSQuote.memSelection.text := floattostr(Key);
    frmPBRSQuote.bProspect := (dbgdetails.DataSource.DataSet.fieldbyname('Ad_hoc_Address').asinteger <> 0);
    frmPBRSQuote.edtCustomer.text := dbgdetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    frmPBRSQuote.memDescription.text := dbgdetails.DataSource.DataSet.fieldbyname('Description').asstring;
    frmPBRSQuote.memQuantity.text := dbgdetails.DataSource.DataSet.fieldbyname('Quantity').asstring;
    frmPBRSQuote.showmodal;
  finally
    frmPBRSQuote.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(Key)),[lopartialKey]) ;
end;

function TfrmpbluCustQuotes.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Quote', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Quote '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustQuotes.btnConvertClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  ConvertToJob;

end;

procedure TfrmpbluCustQuotes.ConvertToJob;
var
  QuoteNo : real;
  key: integer;
  frm : TPBMaintJobBagFrm;
  aJob : TJobBag;
  dtmdlJob: TdmJobBag;
begin
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger <= 20 then
    begin
      MessageDlg('This is a request for quote and requires an estimate before it can be converted to a job bag', mtError,
        [mbAbort], 0);
      exit;
    end
  else
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >=100 then
    begin
      MessageDlg('Cannot convert this quote, this quote has already been converted to a job bag', mtError,
        [mbAbort], 0);
      exit;
    end;

  if dbgdetails.DataSource.DataSet.FieldByName('inactive').asstring = 'Y' then
    begin
      MessageDlg('Cannot convert this quote, this quote has been declined', mtError,
        [mbAbort], 0);
      exit;
    end;

  if (dbgdetails.DataSource.dataset.fieldbyname('Estimate_File').asstring <> '') then
    begin
      if (FileDateToDateTime(FileAge(dbgdetails.DataSource.dataset.fieldbyname('Estimate_File').asstring)) > dbgdetails.DataSource.dataset.fieldbyname('Date_Last_Estimated').asdatetime) then
        begin
          if messagedlg('There is a possibility that the estimate is different to the quote, do you want to go back into the quote and recalculate', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit;
          CallMaintScreen(qChange);
          exit;
        end;
    end;

  if dbgdetails.DataSource.DataSet.FieldByName('Ad_Hoc_Address').asinteger <> 0 then
    begin
      MessageDlg('This quote is for a prospect, in order to convert this to a job, the prospect must be set up as a customer', mtError,
        [mbAbort], 0);
      exit;
    end;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Quotes cannot be converted for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  if MessageDlg('Do you want to convert quote ' + edtNumber.text + ', to a new job bag?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  dtmdlJob := TdmJobBag.create(application);
  QuoteNo := 0;
  Key := 0;
  try
    aJob := TJobBag.Create(dtmdlJob);
    try
      QuoteNo := dbgdetails.DataSource.DataSet.FieldByName('Quote').asfloat;
      aJob.DataModule.QuoteNo := QuoteNo;
      aJob.DbKey := key;
      aJob.LoadFromQuote;
      Frm := TPBMaintJobBagFrm.Create(Self);
      try
        Frm.Mode := jbConvert;
        Frm.JobBag := aJob;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          begin
            dtmdlQuotes.UpdateQuoteStatus(aJob.DataModule.QuoteNo,100);
          end;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dtmdlJob.free;
    dtmdlQuotes.RefreshData;
    dbgDetails.DataSource.DataSet.Locate('Quote', Variant(floattostr(QuoteNo)),[lopartialKey]) ;
  end;
end;

procedure TfrmpbluCustQuotes.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmpbluCustQuotes.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('CustomerQuoteLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmpbluCustQuotes.btnJobsClick(Sender: TObject);
begin
  frmpbluCustomers.btnJobsClick(self);
end;

procedure TfrmpbluCustQuotes.btnStockClick(Sender: TObject);
begin
  frmpbluCustomers.btnStockClick(self);
end;

procedure TfrmpbluCustQuotes.btnProductionClick(Sender: TObject);
begin
  frmpbluCustomers.btnProductionClick(self);
end;

procedure TfrmpbluCustQuotes.btnCustomersClick(Sender: TObject);
begin
  frmpbluCustomers.btnCustomersClick(self);
end;

procedure TfrmpbluCustQuotes.FormActivate(Sender: TObject);
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
      iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuQuotes') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlQuotes.Operator := frmpbMainMenu.iOperator;
      dtmdlQuotes.Rep := iOperatorRep;

      Factivated := true;
    end;

  dtmdlQuotes.RefreshData;
  dbgDetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(ActiveCode)),[lopartialKey]);

end;

procedure TfrmpbluCustQuotes.btnSalesInvoicingClick(Sender: TObject);
begin
  frmpbluCustomers.btnSalesInvoicingClick(self);
end;

procedure TfrmpbluCustQuotes.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
    begin
      if TToolButton(Components[icount]).Parent.Name <> 'Toolbar1' then
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
  btnQuote.Enabled := false;
end;

procedure TfrmpbluCustQuotes.pmnFunctionsPopup(Sender: TObject);
begin
  mnuAdd.enabled := btnAdd.enabled;
  mnuChange.enabled := btnChange.enabled;
  mnuReQuote.enabled := btnReQuote.enabled;
  mnuCopy.enabled := btnCopy.enabled;
  mnuDelete.enabled := btnDelete.enabled;
  mnuPrint.enabled := btnPrint.enabled;
  mnuConvert.visible := btnConvert.visible;
  mnuConvert.enabled := btnConvert.enabled;
end;

procedure TfrmpbluCustQuotes.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(qCopy);
end;

procedure TfrmpbluCustQuotes.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Quote').asinteger;
  except
    ActiveCode := 0;
  end;
end;

procedure TfrmpbluCustQuotes.btnEnquiriesClick(Sender: TObject);
begin
  frmpbluCustomers.btnEnquiriesClick(self);
end;

procedure TfrmpbluCustQuotes.btnDeleteClick(Sender: TObject);
begin
  if (dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status').asinteger > 40) then
    begin
      MessageDlg('This quote is ' +
        dbgDetails.Datasource.Dataset.fieldbyname('Quote_Status_Description').asstring +
        ' and therefore cannot be deleted', mtError, [mbAbort], 0);
        Exit;
    end;
  CallMaintScreen(qDelete);
end;

procedure TfrmpbluCustQuotes.btnReQuoteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(qReQuote);
end;

end.
