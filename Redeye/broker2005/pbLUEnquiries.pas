unit pbLUEnquiries;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, ToolWin, Grids, DBGrids, StdCtrls, pbEnqsdm,
  Db, IniFiles, Buttons, System.ImageList;

type
  TfrmPBLuEnquiries = class(TForm)
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    dbgDetails: TDBGrid;
    CoolBar1: TCoolBar;
    imglstMaint: TImageList;
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
    mnuReset: TMenuItem;
    tmrSearch: TTimer;
    Panel2: TPanel;
    btnClose: TButton;
    Label2: TLabel;
    edtNumber: TEdit;
    PageScroller1: TPageScroller;
    Toolbar1: TToolBar;
    btnQuick: TToolButton;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    ToolButton4: TToolButton;
    btnPrint: TToolButton;
    btnRepliesSpacer: TToolButton;
    btnReplies: TToolButton;
    btnPricing: TToolButton;
    btnQuote: TToolButton;
    btnConvert: TToolButton;
    btnReports: TToolButton;
    Panel3: TPanel;
    Label3: TLabel;
    ToolButton3: TToolButton;
    N4: TMenuItem;
    mnuCancel: TMenuItem;
    btnSearch: TBitBtn;
    btnDecline: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchChange(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnQuickClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnRepliesClick(Sender: TObject);
    procedure btnPricingClick(Sender: TObject);
    procedure btnQuoteClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure mnuCancelClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnDeclineClick(Sender: TObject);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(sTempFuncMode: string);
    function CheckInput: boolean;
    procedure SetButtonProperties(Sender: TObject);
  private
    FActivated: boolean;
    iMnuMaintEnqs, iMnuMaintPOs: integer;
    DontSaveLayout: Boolean;
    iOperatorRep: Integer;
    dtmdlAllEnqs : TdtmdlEnqs;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmPBLuEnquiries: TfrmPBLuEnquiries;

implementation

uses
  System.UITypes,
  CCSCommon, pbluEnqsSearch, pbDatabase, PBenquiry, PBEnquiryDataMod,
  PBRSEnqN, PBEnqJobPrice, PBRSQuoN, PBAutoPO, PBEnqSupResp,
  pbLUEnquiryRpts, pbMainMenu, PBEnqInActLine, PBEnqCancelLine;

{$R *.DFM}

procedure TfrmPBLuEnquiries.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'EnquiryLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmPBLuEnquiries.FormCreate(Sender: TObject);
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

  dtmdlAllEnqs := TdtmdlEnqs.create(self);

  if stempdate = 'None' then
    dtmdlAllEnqs.EnquiryDate := Date - 365
  else
    dtmdlAllEnqs.EnquiryDate := pbdatestr(stempdate);

  dtmdlAllEnqs.dtsEnqs.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllEnqs.dtsEnqs;

  CCSCommon.SetDBGridCols('', 'EnquiryLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
//  dmBroker.ScreenAccessControl(Self,'mnuEnquiries',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLuEnquiries.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Centrereed Broker', 'Enquiry Search Date', pbdatestr(dtmdlAllEnqs.EnquiryDate));
  finally
    IniFile.Free;
  end;

  dtmdlAllEnqs.free;
end;

procedure TfrmPBLuEnquiries.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllEnqs do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnCopy.Enabled := HeaderCount > 0;
    btnDecline.Enabled := HeaderCount > 0;
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

procedure TfrmPBLuEnquiries.SetButtonProperties(Sender: TObject);
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
                  ((iMnuMaintEnqs = 4) and
                        (dtmdlAllEnqs.dtsEnqs.dataset.FieldByName('Rep').AsInteger = iOperatorRep)) or
                  ((iMnuMaintEnqs = 5) and
                        (dtmdlAllEnqs.dtsEnqs.dataset.FieldByName('Operator').AsInteger = frmpbMainMenu.iOperator)));
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

procedure TfrmPBLuEnquiries.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllEnqs.refreshdata;
end;

procedure TfrmPBLuEnquiries.FormShow(Sender: TObject);
begin
//  dtmdlAllEnqs.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmPBLuEnquiries.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnChangeclick(self);
end;

procedure TfrmPBLuEnquiries.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllEnqs.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLuEnquiries.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

function TfrmPBLuEnquiries.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Enquiry', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Enquiry '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBLuEnquiries.btnChangeClick(Sender: TObject);
var
  Enquiry: TEnquiryQuote;
begin
  if not CheckInput then
    exit;

  if dmBroker.IsQuickQuote(strtoint(edtNumber.Text)) then
  begin
    PBEnqDM := TPBEnqDM.Create(Self);
    Enquiry := TEnquiryQuote.Create(dbgDetails.datasource.dataset.FieldByName('enquiry').AsInteger,
                            dbgDetails.DataSource.DataSet.FieldByName('Line').AsInteger);
    try
      Enquiry.ReadOnly := false;
      Enquiry.Edit;
      if Enquiry.ChangesSaved = true then
      begin
        //need to refresh the grid
        dtmdlAllEnqs.refreshdata;
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(Enquiry.EnquiryNo)),[lopartialKey]) ;
      end;
    finally
      Enquiry.Free;
      PBEnqDM.Free;
    end;
  end
  else
  begin
    //not a quick quote so use full enquiry
    //Change an enquiry
    CallMaintScreen('C');
  end;
end;

procedure TfrmPBLuEnquiries.btnSearchClick(Sender: TObject);
begin
  frmpbLuEnqsSearch := TfrmpbLuEnqsSearch.create(self);
  try
    frmpbLuEnqsSearch.dtmdlSearchEnqs := dtmdlAllEnqs;
    frmpbLuEnqsSearch.edtBranch.text := dtmdlAllEnqs.BranchName;
    frmpbLuEnqsSearch.edtProductCode.Text := dtmdlAllEnqs.ProductCode;
    frmpbLuEnqsSearch.edtFormReference.Text := dtmdlAllEnqs.FormReference;
    frmpbLuEnqsSearch.edtDescription.Text := dtmdlAllEnqs.Description;
    frmpbLuEnqsSearch.edtProductType.Text := dtmdlAllEnqs.ProductType;
    frmpbLuEnqsSearch.edtRep.Text := dtmdlAllEnqs.RepName;
    frmpbLuEnqsSearch.edtAccountMgr.Text := dtmdlAllEnqs.AccountMgr;
    frmpbLuEnqsSearch.edtOperator.Text := dtmdlAllEnqs.OperatorName;
    frmpbLuEnqsSearch.edtDate.Text := pbDateStr(dtmdlAllEnqs.EnquiryDate);
    frmpbLuEnqsSearch.chkbxShowCancelled.Checked := dtmdlAllEnqs.ShowInactive;
    frmpbLuEnqsSearch.showModal;
  finally
    frmpbLuEnqsSearch.free;
  end;
end;

procedure TfrmPBLuEnquiries.CallMaintScreen(sTempFuncMode: string);
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
      dtmdlAllEnqs.refreshdata;
      if sTempFuncMode <> 'D' then
      begin
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
    end;
  finally
    PBEnquiryFrm.Free;
  end;
end;

procedure TfrmPBLuEnquiries.btnQuickClick(Sender: TObject);
var
  Enquiry: TEnquiryQuote;
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
        dtmdlAllEnqs.refreshdata;
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(Enquiry.EnquiryNo)),[lopartialKey]) ;
      end;
  finally
    Enquiry.Free;
    PBEnqDM.Free;
  end;
end;

procedure TfrmPBLuEnquiries.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmPBLuEnquiries.btnCopyClick(Sender: TObject);
var
  Enquiry: TEnquiryQuote;
begin
  if not CheckInput then
    exit;

  if dmBroker.IsQuickQuote(strtoint(edtNumber.Text)) then
  begin
    PBEnqDM := TPBEnqDM.Create(Self);
    Enquiry := TEnquiryQuote.Create(dbgDetails.datasource.dataset.FieldByName('enquiry').AsInteger,
                             dbgDetails.DataSource.DataSet.FieldByName('Line').AsInteger,
                             'copy');
    try
      Enquiry.line.narrative.DbKey := 0;
      // need to set narrative dbkey to zero to ensure a new narrative record is created for the specification
      Enquiry.EnquiryType := 'Q';
      Enquiry.Edit;
    finally
      Enquiry.Free;
      PBEnqDM.Free;
      dtmdlAllEnqs.refreshdata;
    end;
  end
  else
  begin
    {Change an enquiry}
    CallMaintScreen('R');
  end;
end;

procedure TfrmPBLuEnquiries.btnPrintClick(Sender: TObject);
var
  bTempOK: boolean;
  iTempSel: integer;
  sEnquiry: string;
begin
  if not CheckInput then
    exit;

  {print enquiry}
  sEnquiry := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
  PBRSEnqNFrm := TPBRSEnqNFrm.Create(Self);
  try
    PBRSEnqNFrm.EnquiryMemo.text := sEnquiry;
    PBRSEnqNFrm.sDescription := dbgDetails.datasource.dataset.fieldbyname('Description').asstring;
    PBRSEnqNFrm.ShowModal;
    bTempOK := PBRSEnqNFrm.bOK;
    iTempSel := strtoint(sEnquiry);
  finally
    PBRSEnqNFrm.Free;
  end;
  if bTempOK then
    begin
      dtmdlAllEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
end;

procedure TfrmPBLuEnquiries.btnRepliesClick(Sender: TObject);
var
  iTempSel: Integer;
begin
  if not CheckInput then
    exit;

  PBEnqSupRespFrm := TPBEnqSupRespFrm.Create(Self);
  try
    PBEnqSupRespFrm.EnqStatus :=
      dbgDetails.datasource.dataset.FieldByName('enquiry_status').AsInteger;
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
      dtmdlAllEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  finally
    PBEnqSupRespFrm.Free;
  end;
end;

procedure TfrmPBLuEnquiries.btnPricingClick(Sender: TObject);
var
  iTempSel: Integer;
begin
  if not CheckInput then
    exit;

  PBEnqJobPriceFrm := TPBEnqJobPriceFrm.Create(Self);
  try
    PBEnqJobPriceFrm.EnqStatus :=
      dbgDetails.datasource.dataset.FieldByName('enquiry_status').AsInteger;
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
      dtmdlAllEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
  finally
    PBEnqJobPriceFrm.Free;
  end;
end;

procedure TfrmPBLuEnquiries.btnQuoteClick(Sender: TObject);
var
  bTempOK: boolean;
  iTempSel: integer;
  sEnquiry: string;
begin
  if not CheckInput then
    exit;

  sEnquiry := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
  {print the quote}
  PBRSQuoNFrm := TPBRSQuoNFrm.Create(Self);
  try
    PBRSQuoNFrm.EnquiryMemo.text := sEnquiry;
    PBRSQuoNFrm.ShowModal;
    bTempOK := PBRSQuoNFrm.bOK;
    iTempSel := strtoint(sEnquiry);
  finally
    PBRSQuoNFrm.Free;
  end;

  if bTempOK then
    begin
      dtmdlAllEnqs.refreshdata;
      dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
    end;
end;

procedure TfrmPBLuEnquiries.btnConvertClick(Sender: TObject);
var
  iTempSel: integer;
  iTempLine: integer;
  iStatus: integer;
begin
(*  if not CheckInput then
    exit;
*)

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

  if (dmBroker.IsProspect(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger)) then
    begin
      MessageDlg('This quote is for a prospect, in order to convert this to an order, the prospect must be set up as a customer', mtError,
        [mbAbort], 0);
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

  dtmdlAllEnqs.refreshdata;
  dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
end;

procedure TfrmPBLuEnquiries.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLuEnquiries.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLuEnquiries.btnReportsClick(Sender: TObject);
begin
  frmPBLUEnquiryRpts := TfrmPBLUEnquiryRpts.create(self);
  try
    frmPBLUEnquiryRpts.showmodal;
  finally
    frmPBLUEnquiryRpts.free;
  end;
end;

procedure TfrmPBLuEnquiries.pmnFunctionsPopup(Sender: TObject);
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

procedure TfrmPBLuEnquiries.mnuCancelClick(Sender: TObject);
var
  iTempSel: integer;
begin
  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;

  PBEnqInActLineFrm := TPBEnqInActLineFrm.create(self);
  try
    PBEnqInActLineFrm.iEnqNum := iTempSel;
//    PBEnqInActLineFrm.b_inactive := dtmdlAllEnqs.showinactive;
    PBEnqInActLineFrm.b_inactive := (dbgDetails.DataSource.DataSet.fieldbyname('Enq_Inactive').asstring = 'Y');
    PBEnqInActLineFrm.showmodal;
    if PBEnqInActLineFrm.modalresult = idok then
      begin
        dtmdlAllEnqs.refreshdata;
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel+1)),[lopartialKey]) ;
      end;
  finally
    PBEnqInActLineFrm.free;
  end;

end;

procedure TfrmPBLuEnquiries.Close1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLuEnquiries.FormActivate(Sender: TObject);
begin
  dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuEnquiries') ;
  if not FActivated then
    begin
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iMnuMaintEnqs := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuEnquiries') ;
      iMnuMaintPOs := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlAllEnqs.Operator := frmpbMainMenu.iOperator;
      dtmdlAllEnqs.Rep := iOperatorRep;
      dtmdlAllEnqs.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

      FActivated := True;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllEnqs.RefreshData;
  dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLuEnquiries.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmPBLuEnquiries.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Enq_Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clRed;
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmPBLuEnquiries.btnDeclineClick(Sender: TObject);
var
  iTempSel: integer;
begin
  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;

  PBEnqCancelLineFrm := TPBEnqCancelLineFrm.create(self);
  try
    PBEnqCancelLineFrm.EnquiryNo := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
    PBEnqCancelLineFrm.EnquiryLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
    PBEnqCancelLineFrm.lblCustomer.caption := 'Customer: ' + dbgDetails.datasource.DataSet.FieldByName('Customer_Name').asstring;
    PBEnqCancelLineFrm.lblDescription.caption := 'Description: ' + dbgDetails.datasource.DataSet.FieldByName('Description').asstring;

    PBEnqCancelLineFrm.bInactive := dtmdlAllEnqs.showinactive;
    PBEnqCancelLineFrm.showmodal;
    if PBEnqCancelLineFrm.modalresult = idok then
      begin
        dtmdlAllEnqs.refreshdata;
        dbgDetails.datasource.DataSet.locate('Enquiry', Variant(floattostr(iTempSel)),[lopartialKey]) ;
      end;
  finally
    PBEnqCancelLineFrm.free;
  end;
end;

end.
