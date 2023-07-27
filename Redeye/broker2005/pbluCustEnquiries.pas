unit pbluCustEnquiries;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ImgList, ComCtrls, StdCtrls, ExtCtrls, ToolWin, Db, Menus,
  IniFiles, Buttons, System.ImageList;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Enqsclosed   = WM_APP + 104; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmpbluCustEnquiries = class(TForm)
    CoolBar1: TCoolBar;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    btnClose: TButton;
    Toolbar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    ToolButton4: TToolButton;
    imglstMaint: TImageList;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    btnPrint: TToolButton;
    btnCopy: TToolButton;
    btnQuick: TToolButton;
    btnRepliesSpacer: TToolButton;
    btnReplies: TToolButton;
    btnPricing: TToolButton;
    btnQuote: TToolButton;
    btnConvert: TToolButton;
    Label2: TLabel;
    edtNumber: TEdit;
    pmnFunctions: TPopupMenu;
    mnuQuick: TMenuItem;
    mnuAdd: TMenuItem;
    mnuChange: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPrintE: TMenuItem;
    N1: TMenuItem;
    mnuReplies: TMenuItem;
    mnuPricing: TMenuItem;
    mnuPrintQ: TMenuItem;
    N2: TMenuItem;
    mnuConvert: TMenuItem;
    N3: TMenuItem;
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
    mnuCancel: TMenuItem;
    btnSearch: TBitBtn;
    btnQuotes: TToolButton;
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
    procedure btnCopyClick(Sender: TObject);
    procedure btnQuickClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnRepliesClick(Sender: TObject);
    procedure btnPricingClick(Sender: TObject);
    procedure btnQuoteClick(Sender: TObject);
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
    procedure mnuCancelClick(Sender: TObject);
    procedure btnQuotesClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FDisableNameChangeEvent: boolean;
    FParentForm: TForm;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetParentForm(const Value: TForm);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(sTempFuncMode: string);
    function CheckInput: boolean;
    procedure SetOperator(iTempOp: Integer);
    procedure SetButtonProperties(Sender: TObject);
  private
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    FCustomer: integer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    procedure SetCustomer(const Value: integer);
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  public
    CustomerName: string;
    iMnuMaintEnqs, iMnuMaintPOs: integer;
    procedure ClearSearchCriteria;
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmpbluCustEnquiries: TfrmpbluCustEnquiries;

implementation

uses pbEnqsdm, pbluEnqsSearch, pbDatabase, PBenquiry, PBEnquiryDataMod, PBRSEnqN,
      PBEnqSupResp, PBEnqJobPrice, PBRSQuoN, PBAutoPO, CCSCommon,
  pbluCustomers, pbMainMenu, PBRSEnq, PBEnqInActLine, PBRSQuo;

{$R *.DFM}

{ TfrmpbluCustEnquiries }

procedure TfrmpbluCustEnquiries.luCustomersParentClosed(
  var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmpbluCustEnquiries.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dtmdlEnqs.Customer := FCustomer;
  dtmdlEnqs.RefreshData;
end;

procedure TfrmpbluCustEnquiries.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustEnquiries.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmpbluCustEnquiries.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustEnquiries.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Enqsclosed, left, Top);
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'CustomerEnqLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmpbluCustEnquiries.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    stempdate := IniFile.ReadString('Centrereed Broker', 'Enquiry Search Date', 'None');
  finally
    IniFile.Free;
  end;

  dtmdlEnqs := TdtmdlEnqs.create(self);

  if stempdate = 'None' then
    dtmdlEnqs.EnquiryDate := Date - 365
  else
    dtmdlEnqs.EnquiryDate := pbdatestr(stempdate);

  dtmdlEnqs.dtsEnqs.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlEnqs.dtsEnqs;

  btnStock.visible := frmPBMainMenu.btnStock.visible;
  btnJobs.visible := frmPBMainMenu.btnJobs.visible;

  CCSCommon.SetDBGridCols('', 'CustomerEnqLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
//  dmBroker.ScreenAccessControl(Self,'mnuEnquiries',frmPBMainMenu.iOperator,0,0) ;
//  setOperator(frmpbMainMenu.iOperator);
end;

procedure TfrmpbluCustEnquiries.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Enquiry Search Date', pbdatestr(dtmdlEnqs.EnquiryDate));
  finally
    IniFile.Free;
  end;

  dtmdlEnqs.free;
end;

procedure TfrmpbluCustEnquiries.btnSearchClick(Sender: TObject);
begin
  frmpbLuEnqsSearch := TfrmpbLuEnqsSearch.create(self);
  try
    frmpbLuEnqsSearch.dtmdlSearchEnqs := dtmdlEnqs;
    frmpbLuEnqsSearch.edtBranch.text := dtmdlEnqs.BranchName;
    frmpbLuEnqsSearch.edtProductCode.Text := dtmdlEnqs.ProductCode;
    frmpbLuEnqsSearch.edtFormReference.Text := dtmdlEnqs.FormReference;
    frmpbLuEnqsSearch.edtRep.Text := dtmdlEnqs.RepName;
    frmpbLuEnqsSearch.edtProductType.Text := dtmdlEnqs.ProductType;
    frmpbLuEnqsSearch.edtDate.Text := pbDateStr(dtmdlEnqs.EnquiryDate);
    frmpbLuEnqsSearch.chkbxShowCancelled.Checked := dtmdlEnqs.ShowInactive;
    frmpbLuEnqsSearch.showModal;
  finally
    frmpbLuEnqsSearch.free;
  end;
end;

procedure TfrmpbluCustEnquiries.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlEnqs.refreshdata;
end;

procedure TfrmpbluCustEnquiries.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbluCustEnquiries.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlEnqs do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnReplies.Enabled := HeaderCount > 0;
    btnPricing.Enabled := HeaderCount > 0;
    btnQuote.Enabled := HeaderCount > 0;
    btnConvert.Enabled := HeaderCount > 0;
    edtNumber.Text := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
    SetButtonProperties(self);

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustEnquiries.SetButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this order if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the PO Maint button on the menu} ;
//  iTempAccCtrl := iMnuBtnPOMaint ;
  bTempCanUpd :=  ((iMnuMaintEnqs = 1) or
                  (iMnuMaintEnqs = 4) or
                  (iMnuMaintEnqs = 5));
  {They can ADD orders IF} ;
  {    they have FULL, REP or OPERATOR access} ;
  bTempCanAdd := ((iMnuMaintEnqs = 1) or (iMnuMaintEnqs = 4) or
                                        (iMnuMaintEnqs = 5)) ;
  btnAdd.Visible := bTempCanAdd ;
  btnQuick.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnChange.Caption := '  &Change  ';
    end
  else
    begin
      btnChange.Caption := '   &View   ';
    end;
  btnCopy.Visible := bTempCanAdd ;

//  btnConvert.Visible := bTempCanUpd and dmBroker.OperatorCanConvertEnquiry(frmPBMainMenu.iOperator) and (iMnuMaintPOs = 1);
  btnConvert.Visible := bTempCanUpd and dmBroker.OperatorCanConvertEnquiry(frmPBMainMenu.iOperator);
  
  {Deal with the "Print POs" permissions} ;
(*  btnPrint.Visible := (dmBroker.AccessControlOpRep(iMnuBtnPOSend,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  {Deal with the "Deliveries" permissions} ;
  btnDeliveries.Visible := (dmBroker.AccessControlOpRep(iMnuBtnDeliv,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  {Deal with the "Proofs" permissions} ;
  btnApprovalForm1.Enabled := (dmBroker.AccessControlOpRep(iMnuBtnProof,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  btnStatus1.Enabled := (dmBroker.AccessControlOpRep(iMnuBtnProofHist,frmpbMainMenu.iOperator,
        dtmdlAllOrders.dtsOrders.dataset.FieldByName('Operator').AsInteger, dtmdlAllOrders.dtsOrders.dataset.FieldByName('Rep').AsInteger) = 1) ;
  btnProofs.Visible := (btnApprovalForm1.Enabled) or (btnStatus1.Enabled) ;
*)
end;

procedure TfrmpbluCustEnquiries.ClearSearchCriteria;
begin
  dtmdlEnqs.BranchName := '';
  dtmdlEnqs.ProductCode := '';
  dtmdlEnqs.FormReference := '';
  dtmdlEnqs.RepName := '';

  edtSearch.text := '';
end;


procedure TfrmpbluCustEnquiries.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlEnqs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustEnquiries.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmpbluCustEnquiries.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('C');
end;

procedure TfrmpbluCustEnquiries.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmpbluCustEnquiries.CallMaintScreen(sTempFuncMode: string);
var
  iTempSel: Integer;
  iEnqHeadStatus: integer;
begin
  {If adding enquiry then set status to enquiry Created}
  if sTempFuncMode = 'A' then
    begin
      iEnqHeadStatus := 10;
    end
  else
    begin
      iEnqHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Enquiry_status').AsInteger;
    end

  {for the view, set the access level to view. Otherwise, give full access} ;
  If sTempFuncMode = 'V' then
    dmBroker.iAccCtrlMenu := 3;

 if (iEnqHeadStatus > 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    if MessageDlg('This enquiry is ' +
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;

  {Call Enquiry Maintenance}
  PBEnquiryFrm := TPBEnquiryFrm.Create(Self);
  try
    PBEnquiryFrm.sEnqFuncMode := sTempFuncMode;
    PBEnquiryFrm.iEnqNumber :=
      dbgDetails.datasource.dataset.FieldByName('enquiry').AsInteger;
    if sTempFuncMode = 'A' then
      PBEnquiryFrm.ClearScreen
    else
      if sTempFuncMode = 'C' then
        PBEnquiryFrm.ChangeEnquiry
      else
        if sTempFuncMode = 'R' then
          PBEnquiryFrm.CopyEnquiry
        else
          if sTempFuncMode = 'V' then
            PBEnquiryFrm.ViewEnquiry;
    PBEnquiryFrm.ShowModal;
    iTempSel := PBEnquiryFrm.iEnqNumber;
    if PBEnquiryFrm.ModalResult = idok then
    begin
      dtmdlEnqs.refreshdata;
      if sTempFuncMode <> 'D' then
      begin
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
    end;
  finally
    PBEnquiryFrm.Free;
  end;
end;

procedure TfrmpbluCustEnquiries.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen('R');
end;

procedure TfrmpbluCustEnquiries.btnQuickClick(Sender: TObject);
var
  Enquiry: TEnquiryQuote;
  iTempSel: integer;
begin
  PBEnqDM := TPBEnqDM.Create(Self);
  //true in the constructor denotes the creation of a quick quote.
  Enquiry := TEnquiryQuote.Create;
  try
    Enquiry.EnquiryType := 'Q';
    Enquiry.Line.NewPart;
    with Enquiry.Line.Parts[0] do
    begin
      Description := '';
      Heading := '';
      SameAsPart := 0;
      PaperBrand := '';
      PaperMaterial := '';
      PaperWeight := '';
      PaperColour := '';
      FaceInks := '';
      ReverseInks := '';
      LeftMarginType := '';
      LeftMarginWidth := '';
      RightMarginType := '';
      RightMarginWidth := '';
    end;
    Enquiry.Edit;
    if Enquiry.Modified then
      begin
        dtmdlEnqs.refreshdata;
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
  finally
    Enquiry.Free;
    PBEnqDM.Free;
  end;
end;

procedure TfrmpbluCustEnquiries.btnPrintClick(Sender: TObject);
var
  bTempOK: boolean;
  iTempSel: integer;
  sEnquiry: string;
  enqList: TStringList;
  inx: integer;
begin
  if self.dbgDetails.SelectedRows.Count < 2 then
  begin
    if not CheckInput then
      exit;

    //print enquiry using print single enquiry selection form
    sEnquiry := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
    PBRSEnqNFrm := TPBRSEnqNFrm.Create(Self);
    try
      PBRSEnqNFrm.sDescription := dbgDetails.datasource.dataset.fieldbyname('Description').asstring;
      PBRSEnqNFrm.EnquiryMemo.text := sEnquiry;
      PBRSEnqNFrm.ShowModal;
      bTempOK := PBRSEnqNFrm.bOK;
      iTempSel := strtoint(sEnquiry);
    finally
     PBRSEnqNFrm.Free;
    end;

    if bTempOK then
    begin
      dtmdlEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  end
  else
  begin
    //multiple enquiries are selected so use multi print form
    PBRSEnqFrm := TPBRSEnqFrm.Create(Self);
    try
      enqList := TStringList.Create;

      for inx := 0 to self.dbgDetails.SelectedRows.Count - 1 do
      begin
        dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows.Items[inx]));
        enqList.Add(dbgDetails.DataSource.DataSet.FieldByName('enquiry').asString)
      end;
      bTempOK := PBRSEnqFrm.PrintEnquiries(enqList);

      dtmdlEnqs.refreshdata;
      for inx := 0 to enqList.Count - 1 do
      begin
        dbgDetails.DataSource.DataSet.Locate('enquiry', StrToInt(enqList[inx]),[]);
        dbgDetails.SelectedRows.CurrentRowSelected := true;
      end;

    finally
      enqList.Free;
      PBRSEnqFrm.Free;
    end;
  end;
end;

procedure TfrmpbluCustEnquiries.btnRepliesClick(Sender: TObject);
var
  iTempSel: Integer;
begin
  if not CheckInput then
    exit;

  PBEnqSupRespFrm := TPBEnqSupRespFrm.Create(Self);
  try
    PBEnqSupRespFrm.iEnqNumber :=
      dbgDetails.datasource.dataset.FieldByName('enquiry').AsInteger;
    PBEnqSupRespFrm.EnquiryEdit.Text :=
      dbgDetails.datasource.dataset.FieldByName('enquiry').AsString;
    {Pass the enquiriy's operator and rep across to allow the screen access function to operate} ;
    PBEnqSupRespFrm.iDataOp :=
      dbgDetails.datasource.dataset.FieldByName('Operator').AsInteger;
    PBEnqSupRespFrm.iDataRep :=
      dbgDetails.datasource.dataset.FieldByName('Rep').AsInteger;
    PBEnqSupRespFrm.GetEnquiryDetails;
    PBEnqSupRespFrm.ShowModal;
    iTempSel := PBEnqSupRespFrm.iEnqNumber;
    if PBEnqSupRespFrm.ModalResult = idok then
    begin
      dtmdlEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  finally
    PBEnqSupRespFrm.Free;
  end;
end;

procedure TfrmpbluCustEnquiries.btnPricingClick(Sender: TObject);
var
  iTempSel: Integer;
begin
  if not CheckInput then
    exit;

  PBEnqJobPriceFrm := TPBEnqJobPriceFrm.Create(Self);
  try
    PBEnqJobPriceFrm.iEnqNumber :=
      dbgDetails.datasource.dataset.FieldByName('enquiry').AsInteger;
    PBEnqJobPriceFrm.iDataOp :=
      dbgDetails.datasource.dataset.FieldByName('Operator').AsInteger;
    PBEnqJobPriceFrm.iDataRep :=
      dbgDetails.datasource.dataset.FieldByName('Rep').AsInteger;
    PBEnqJobPriceFrm.EnquiryEdit.Text :=
      dbgDetails.datasource.dataset.FieldByName('enquiry').AsString;
    PBEnqJobPriceFrm.ShowModal;
    iTempSel := PBEnqJobPriceFrm.iEnqNumber;
    if PBEnqJobPriceFrm.ModalResult = idok then
    begin
      dtmdlEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  finally
    PBEnqJobPriceFrm.Free;
  end;
end;

procedure TfrmpbluCustEnquiries.btnQuoteClick(Sender: TObject);
var
  bTempOK: boolean;
  iTempSel: integer;
  iCount: integer;
  sEnquiry, sMulti: string;
begin
  if not CheckInput then
    exit;

  sEnquiry := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
  {print the quote}
  if dbgDetails.SelectedRows.Count <= 1 then
    begin
      PBRSQuoNFrm := TPBRSQuoNFrm.Create(Self);
      try
        PBRSQuoNFrm.EnquiryMemo.text := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
        PBRSQuoNFrm.ShowModal;
        bTempOK := PBRSQuoNFrm.bOK;
        iTempSel := strtoint(sEnquiry);
      finally
        PBRSQuoNFrm.Free;
      end;
    end
  else
    begin
      for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
        begin
          dbgDetails.Datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));
          if icount = 0 then
            sMulti := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring
          else
            sMulti := sMulti + ','+ dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring ;
        end;
      PBRSQuoFrm := TPBRSQuoFrm.Create(Self);
      try
        PBRSQuoFrm.SelectionMemo.text := sMulti;
        PBRSQuoFrm.ShowModal;
        bTempOK := PBRSQuoFrm.bOK;
        iTempSel := strtoint(sEnquiry);
      finally
        PBRSQuoFrm.Free;
      end;
    end;

  if bTempOK then
    begin
      dtmdlEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
end;

function TfrmpbluCustEnquiries.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Enquiry', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Enquiry '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustEnquiries.btnConvertClick(Sender: TObject);
var
  iTempSel: integer;
  iTempLine: integer;
  iStatus: integer;
begin
{  if not CheckInput then
    exit;
}
  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  iTempLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  iStatus := dbgDetails.datasource.DataSet.FieldByName('enquiry_status').AsInteger;

  if iStatus < 45 then
    begin
      messagedlg('This enquiry has not had any prices set, cannot convert to an order', mtInformation,
      [mbOk], 0);
      exit;
    end
  else
  if iStatus > 85 then
    begin
      messagedlg('This enquiry has already been converted to an order', mtInformation,
     [mbOk], 0);
       exit;
    end;

  if dmBroker.GetCustomerStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger) = 'B' then
    begin
      MessageDlg('This Customer is currently On Stop.'+#10#13+'Enquiries cannot be processed for customers On Stop.', mtWarning,[mbOk], 0);
      exit;
    end;

  PBAutoPOFrm := TPBAutoPOFrm.Create(Self);
  PBAutoPOFrm.TempEnqNo := iTempSel;
  PBAutoPOFrm.TempEnqLineNo := iTempLine;
  PBAutoPOFrm.MainLoop(self);
  PBAutoPOFrm.Free;

  dtmdlEnqs.refreshdata;
  dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
end;

procedure TfrmpbluCustEnquiries.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmpbluCustEnquiries.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('CustomerEnqLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmpbluCustEnquiries.btnJobsClick(Sender: TObject);
begin
  frmpbluCustomers.btnJobsClick(self);
end;

procedure TfrmpbluCustEnquiries.btnStockClick(Sender: TObject);
begin
  frmpbluCustomers.btnStockClick(self);
end;

procedure TfrmpbluCustEnquiries.btnProductionClick(Sender: TObject);
begin
  frmpbluCustomers.btnProductionClick(self);
end;

procedure TfrmpbluCustEnquiries.btnCustomersClick(Sender: TObject);
begin
  frmpbluCustomers.btnCustomersClick(self);
end;

procedure TfrmpbluCustEnquiries.FormActivate(Sender: TObject);
begin
  SetOperator(frmPBMainMenu.iOperator);
  if Customer <> 0 then
    begin
      dtmdlEnqs.refreshdata;
      dbgDetails.DataSource.DataSet.Locate('Enquiry', Variant(inttostr(ActiveCode)),[lopartialKey]);
    end;
    
  iMnuMaintEnqs := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuEnquiries') ;
  iMnuMaintPOs := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;
end;

procedure TfrmpbluCustEnquiries.btnSalesInvoicingClick(Sender: TObject);
begin
  frmpbluCustomers.btnSalesInvoicingClick(self);
end;

procedure TfrmpbluCustEnquiries.SetOperator(iTempOp: Integer);
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
  btnEnquiries.Enabled := false;
end;
procedure TfrmpbluCustEnquiries.pmnFunctionsPopup(Sender: TObject);
begin
  mnuQuick.enabled := btnQuick.enabled;
  mnuAdd.enabled := btnAdd.enabled;
  mnuChange.enabled := btnChange.enabled;
  mnuCopy.enabled := btnCopy.enabled;
  mnuPrintE.enabled := btnPrint.enabled;
  mnuReplies.enabled := btnReplies.enabled;
  mnuPricing.enabled := btnPricing.enabled;
  mnuPrintQ.enabled := btnQuote.enabled;
  mnuConvert.visible := btnConvert.visible;
  mnuConvert.enabled := btnConvert.enabled;
end;

procedure TfrmpbluCustEnquiries.mnuCancelClick(Sender: TObject);
var
  iTempSel: integer;
begin
  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;

  PBEnqInActLineFrm := TPBEnqInActLineFrm.create(self);
  try
    PBEnqInActLineFrm.iEnqNum := iTempSel;
    PBEnqInActLineFrm.b_inactive := dtmdlEnqs.showinactive;
    PBEnqInActLineFrm.showmodal;
    if PBEnqInActLineFrm.modalresult = idok then
      begin
        dtmdlEnqs.refreshdata;
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel+1)),[lopartialKey]) ;
      end;
  finally
    PBEnqInActLineFrm.free;
  end;
end;

procedure TfrmpbluCustEnquiries.btnQuotesClick(Sender: TObject);
begin
  frmpbluCustomers.btnQuotesClick(self);
end;

procedure TfrmpbluCustEnquiries.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  except
    ActiveCode := 0;
  end;
end;

procedure TfrmpbluCustEnquiries.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Enq_Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

end;

end.
