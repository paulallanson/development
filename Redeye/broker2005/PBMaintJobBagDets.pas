unit PBMaintJobBagDets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DB, DBGrids, PBJobBagDM, ExtCtrls, ComCtrls,
  DBCtrls, PBPOObjects, pbOrdersDM, Variants, printers, stSOObjects, Menus,
  PBWOrdersDM, FireDAC.Stan.Param;

type
  TPBMaintJobBagDetsFrm = class(TForm)
    pnlHeader: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    tsOrders: TTabSheet;
    Panel1: TPanel;
    FuncGrpBox: TGroupBox;
    btnAdd: TBitBtn;
    btnDelete: TBitBtn;
    btnChange: TBitBtn;
    btnAddPO: TBitBtn;
    labJobBagInfo: TLabel;
    Panel5: TPanel;
    dbgLines: TDBGrid;
    Label5: TLabel;
    edtDate: TEdit;
    edtDateReq: TEdit;
    edtCustomer: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    stsbrDetails: TStatusBar;
    Panel3: TPanel;
    labCosts: TLabel;
    labSales: TLabel;
    labMargin: TLabel;
    LabMarginPerc: TLabel;
    labTotalCost: TLabel;
    labTotalSell: TLabel;
    LabTotalMargin: TLabel;
    labTotalMarginPerc: TLabel;
    Label1: TLabel;
    edtDescription: TEdit;
    edtJobBag: TEdit;
    dblkpCustomerContact: TDBLookupComboBox;
    btnNew: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    edtCustOrderNo: TEdit;
    memQuantity: TMemo;
    Label9: TLabel;
    dblkpRep: TDBLookupComboBox;
    BitBtn5: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel4: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    btnStock: TBitBtn;
    pmnSOrders: TPopupMenu;
    mnuChange: TMenuItem;
    mnuAllocate: TMenuItem;
    mnuDeAllocate: TMenuItem;
    mnuPickingNote: TMenuItem;
    mnuConfirm: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    pmnDummy: TPopupMenu;
    pmnFunctions: TPopupMenu;
    mnuInsertexistingPO: TMenuItem;
    mnuAddnewPO: TMenuItem;
    N3: TMenuItem;
    mnuChangeLine: TMenuItem;
    mnuDelete: TMenuItem;
    mnuAddStockitems: TMenuItem;
    mnuAddSundrycharge: TMenuItem;
    mnuAddWorksOrderCharge: TMenuItem;
    N4: TMenuItem;
    mnuPrint: TMenuItem;
    N5: TMenuItem;
    btnExtras: TBitBtn;
    chkbxReadytoInvoice: TCheckBox;
    Label10: TLabel;
    edtAccountTeam: TEdit;
    btnPrint: TBitBtn;
    btnAccountManager: TBitBtn;
    edtAccountManager: TEdit;
    Label11: TLabel;
    edtDescriptiveRef: TEdit;
    pmnPOrders: TPopupMenu;
    Print1: TMenuItem;
    add1: TMenuItem;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    N6: TMenuItem;
    InsertanexistingPO1: TMenuItem;
    btnNotes: TBitBtn;
    FlashTimer: TTimer;
    chkbxInactive: TCheckBox;
    btnWorksOrders: TBitBtn;
    Label12: TLabel;
    btnShowWO: TBitBtn;
    cmbJobBagWo: TComboBox;
    mnuEditDescription: TMenuItem;
    mnuPrintStockOrder: TMenuItem;
    mnuProduction: TMenuItem;
    pnlBody: TPanel;
    procedure btnCancelClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAddPOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure edtDateReqExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure memQuantityEnter(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure dbgLinesDblClick(Sender: TObject);
    procedure dblkpCustomerContactClick(Sender: TObject);
    procedure dblkpRepClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnSOrdersPopup(Sender: TObject);
    procedure mnuChangeClick(Sender: TObject);
    procedure mnuAllocateClick(Sender: TObject);
    procedure mnuDeAllocateClick(Sender: TObject);
    procedure mnuPickingNoteClick(Sender: TObject);
    procedure mnuConfirmClick(Sender: TObject);
    procedure btnExtrasClick(Sender: TObject);
    procedure pmnFunctionsPopup(Sender: TObject);
    procedure btnAccountManagerClick(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure btnNotesClick(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure btnShowWOClick(Sender: TObject);
    procedure mnueditDescriptionClick(Sender: TObject);
    procedure mnuPrintStockOrderClick(Sender: TObject);
    procedure mnuProductionClick(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    dtmdlJBOrders: TdtmdlOrders;
    dtmdlJBWOrders: TdtmdlWOrders;
    FActivated : Boolean;
    FJobBag: TJobBag;
    FMode: TJBMode;
    FOriginalCustomer : integer;
    FOriginalBranch : integer;
    FPOStatus: integer;
    FPOStatusDescr: string;
    FSOStatus: integer;
    FSOStatusDescr: string;
    FSODateOrdered: TDateTime;
    FSODateRequired: TDateTime;
    FWOStatus: integer;
    FWOStatusDescr: string;
    sOldValue: string;
    procedure AddPurchaseOrder(const rPO: real; iLine : integer);
    function AddNewOrderLine(const LineNo: Integer): PBPOObjects.TOrderLine;
    procedure CreateDelivery(const iCust : integer; OrdLine: PBPOObjects.TOrderLine);
    procedure CallMaintForm(aMode : TJBLMode);
    procedure CallMaintScreen(aMode: TJBLMode);
    procedure CallMaintStockScreen(sTempFuncMode: Char);
    procedure CallMaintWOrderScreen(aMode: TjbwoMode);
    procedure CallMaintWorksOrder(const aMode: TjbwoMode);
    function  ConfirmChange(const newCust, newBranch : integer) : Boolean;
    procedure DropPurchaseOrders;
    procedure GetCustomerContacts(tempNo: integer);
    procedure GetCustomerReps(tempNo: integer);
    procedure SelectCode(Sender: TObject);
    procedure SelectSalesOrder(Sender: TObject);
    procedure SetJobBag(const Value: TJobBag);
    procedure ShowDetails;
    procedure ShowTotals;
    procedure ShowWorksOrders;
    procedure SetMode(const Value: TJBMode);
    procedure UpdJobBagHead(Sender: TObject);
    function AddNewSalesOrder: TSalesOrder;
    procedure CallAllocScreen(sTempFuncMode: Char);
    procedure SelectWorksOrder(Sender: TObject);
    procedure UpdJobBagHeadWorksOrder(aWOrder: TWOrder);
    procedure CallMaintExtrasForm(aMode: TJBLMode);
    procedure CheckNotes(Sender: TObject);
    function OrderAuthorised: boolean;
    procedure CallMaintDetailsForm(aMode: TJBMode);
  public
    bComeFromOrder: boolean;
    property JobBag : TJobBag read FJobBag write SetJobBag;
    property Mode: TJBMode read FMode write SetMode;
  end;

implementation

uses
  System.UITypes,
  PBPODataMod, PBMaintPOrd, PBLUCust, pbMainMenu, PBLUCConta, PBLUCRep, PBMaintJobBagRC,
  DateSelV5, pbLUCustOrdersJB, pbDatabase, STMntSOrd, CCSCommon, STpickobject,
  STPrtAllocSales, STRSPickNote, stPickingDM, STStockDM, STPickbyPart,
  PBMaintWorksOrders, PBMaintJobBagExtras, PBLUAccountManager, PBRSPOrdN,
  PBImages, PBDBMemo, PBMaintJobBagLineDetails, STRSSalesOrd,
  STMaintSalesOrder;


{$R *.DFM}

procedure TPBMaintJobBagDetsFrm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintJobBagDetsFrm.FormActivate(Sender: TObject);
var
  sTemp : string;
begin
  if not FActivated then
  begin
    with JobBag.DataModule do
    begin
      OperatorSQL.close;
      OperatorSQL.open;
    end;

    dblkpCustomerContact.listsource := JobBag.DataModule.srcCustContact;
    dblkpRep.ListSource := JobBag.DataModule.srcCustReps;
    dbgLines.DataSource := JobBag.DataModule.dsjbAllLines;

    case Mode of
    jbAdd     : Caption := 'Add a Job Bag';
    jbChange  : Caption := 'Change a Job Bag';
    jbDelete  : Caption := 'Delete a Job Bag';
    jbView    : Caption := 'View Job Bag details';
    jbRepeat   : Caption := 'Repeat a Job Bag ';

    end;  { case }
    if (Mode = jbAdd)  or (Mode = jbRepeat) then
      begin
        sTemp := ' New Job Bag ';
        cmbJobBagWO.Enabled := false;
        btnWorksOrders.Enabled := false;
      end
    else
      sTemp := ' Job Bag ' + IntToStr(JobBag.DbKey) + ' ';

    if Mode = jbRepeat then
      begin
        JobBag.OriginalJBOrder := JobBag.DbKey;
        JobBag.DbKey := 0;
        JobBag.Date := date;
        JobBag.GoodsRequired := date;
        JobBag.CustOrderNo := '';
        JobBag.OfficeContact := 0;
        JobBag.AccountTeam := JobBag.DataModule.GetOpAccountTeam(JobBag.OfficeContact);
        JobBag.readytoinvoice := 'N';
        JobBag.Operator := frmPBMainMenu.iOperator;
        JobBag.OperatorName := frmPBMainMenu.sOperator_Name;
        JobBag.Inactive := 'N';
      end;

    ShowDetails;
    ShowWorksOrders;

    JobBag.DataModule.ListAllLines(JobBag.DbKey);
    ShowTotals;

    Checknotes(Self);
    CheckOK(Self);

    FActivated := true;

    dmBroker.ScreenAccessControl(Self,'mnuJobs',frmPBMainMenu.iOperator,0,0) ;
  end;
end;

procedure TPBMaintJobBagDetsFrm.SetJobBag(const Value: TJobBag);
begin
  FJobBag := Value;
  FOriginalCustomer := JobBag.Customer;
  FOriginalBranch := JobBag.Branch;
end;

procedure TPBMaintJobBagDetsFrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (Trim(edtDescription.Text) <> '') and
    (Trim(edtCustOrderNo.Text) <> '') and
    (Trim(memQuantity.Text) <> '') and
    (Trim(edtCustomer.Text) <> '') and
    (dblkpCustomerContact.text <> '') and
    (dblkpRep.text <> '') and
    (edtAccountManager.Text <> '');
end;

procedure TPBMaintJobBagDetsFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBMaintJobBagDetsFrm.ShowWorksOrders;
begin
  {Show Works Order details}
  with JobBag.DataModule do
    begin
      qryJBWO.close;
      qryJBWO.parambyname('Job_Bag').asinteger := JobBag.dbkey;
      qryJBWO.open;

      cmbJobBagWO.Clear;

      while qryJBWO.Eof <> true do
        begin
          cmbJobBagWO.Items.Add(qryJBWO.fieldbyname('Works_Order').asstring);
          qryJBWO.Next;
        end;
      cmbJobBagWo.ItemIndex := 0;
      btnShowWO.enabled := (cmbJobBagWO.Items.Count > 0);
    end;
end;

procedure TPBMaintJobBagDetsFrm.ShowDetails;
begin
  if Mode = jbAdd then
    begin
      edtJobBag.text := '<New Order>';
      edtDateReq.Text := PBDateStr(date);
      edtDate.text := PBDateStr(Date);
      edtCustomer.text := '';
      edtDescription.text := '';
      edtDescriptiveRef.Text := '';
      edtCustOrderNo.text := '';
      memQuantity.text := '';
      edtAccountTeam.text := '';
      chkbxReadyToInvoice.checked := false;
      edtAccountManager.Text := '';
    end
  else
    begin
      if JobBag.DbKey = 0 then
        edtJobBag.text := '<New Order>'
      else
        edtJobBag.text := IntToStr(JobBag.DbKey);

      edtDate.text := PBDateStr(JobBag.Date);
      edtCustomer.text := JobBag.CustomerName+'/'+JobBag.BranchName;
      edtDescription.text := JobBag.Description;
      edtDescriptiveRef.Text := JobBag.DescriptiveRef;
      edtCustOrderNo.text := JobBag.CustOrderNo;
      memQuantity.text := inttostr(JobBag.Quantity);
      edtDateReq.Text := PBDateStr(JobBag.GoodsRequired);
      chkbxReadyToInvoice.checked := (JobBag.readytoinvoice = 'Y');

//      chkbxReadytoInvoice.Enabled := (JobBag.JBStatus < 25);
// Cannot make inactive if part invoiced
      chkbxInactive.enabled := (JobBag.JBStatus < 25);
      chkbxinactive.checked := (JobBag.Inactive = 'Y');
      if JobBag.OfficeContact = 0 then
        edtAccountManager.Text := ''
      else
        edtAccountManager.Text :=  JobBag.AccountManagerName;
      edtAccountTeam.text := JobBag.Datamodule.GetOpAccountTeamName(JobBag.OfficeContact);
      GetCustomerContacts(JobBag.ContactNo);
      GetCustomerReps(JobBag.Rep);
      stsbrDetails.Panels[0].Text := 'Created by: ' + JobBag.OperatorName;
    end;
end;

procedure TPBMaintJobBagDetsFrm.ShowTotals;
begin
  labTotalCost.Caption := FloatToStrF(JobBag.TotalCost, ffCurrency, 15, 2);
  labTotalSell.Caption := FloatToStrF(JobBag.TotalSell, ffCurrency, 15, 2);
  labTotalMargin.Caption := FloatToStrF(JobBag.TotalMargin, ffCurrency, 15, 2);
  labTotalMarginPerc.Caption :=
    FloatToStrF(JobBag.TotalMarginPerc, ffFixed, 15, 2);
end;

procedure TPBMaintJobBagDetsFrm.btnAddPOClick(Sender: TObject);
var
  rTempPO: real;
  iTempPOLine: Integer;
  Selected : Boolean;
begin
  rTempPO := 0;
  iTempPOLine := 0;
  frmPBLUCustOrdersJB := TfrmPBLUCustOrdersJB.Create(Self);
  try
    frmPBLUCustOrdersJB.bNot_In_JB := True;
    frmPBLUCustOrdersJB.Customer := JobBag.Customer;
    frmPBLUCustOrdersJB.Branch := JobBag.Branch;
    frmPBLUCustOrdersJB.CustomerName :=
      Trim(JobBag.CustomerName) + '/' + Trim(JobBag.BranchName);
    frmPBLUCustOrdersJB.ShowModal;
    Selected := frmPBLUCustOrdersJB.Selected;
    if Selected then
    begin
      rTempPO := frmPBLUCustOrdersJB.SelCode;
      iTempPOLine := frmPBLUCustOrdersJB.SelLine;
    end;
  finally
    frmPBLUCustOrdersJB.Free;
  end;
  if Selected then
  begin
    dbgLines.DataSource.DataSet.Close;
    try
      AddPurchaseOrder(rTempPO, iTempPOLine);
    finally
      dbgLines.DataSource.DataSet.Open;
      ShowTotals;
    end;
  end;
end;

procedure TPBMaintJobBagDetsFrm.AddPurchaseOrder(const rPO: real;
  iLine: integer);
var
  JBLine : TJobBagLine;
  PurchaseOrder : TPurchaseOrder;
  OrderLine : PBPOObjects.TOrderLine;
  inx : integer;
begin
  PBPODM := TPBPODM.Create(Self);
  try
    PurchaseOrder := TPurchaseOrder.Create(PBPODM);
    try
      PurchaseOrder.PONumber := rPO;
      PBPODM.LoadPOFromDatabase(PurchaseOrder);
      inx := PurchaseOrder.OrderLines.IndexFromLineNo(iLine);
      OrderLine := PurchaseOrder.OrderLines[inx];
      JBLine := TJobBagLine.Create(JobBag);
      JBLine.CurrencyCode := PurchaseOrder.CurrencyCode;
//      JBLine.JBLine := JobBag.Lines.Count + 1;
      JBLine.JBLine := JobBag.Lines.MaxLineNo + 1;
      JBLine.JBLineType := 'P';
      JBLine.JBLineMode := 'N';
      JBLine.PurchaseOrder := PurchaseOrder.PONumber;
      JBLine.Line := OrderLine.Line;
      JBLine.Supplier:= PurchaseOrder.Supplier;
      JBLine.BranchNo := PurchaseOrder.BranchNo;
      JBLine.JBLineDescr := OrderLine.CustomersDesc;
      JBLine.JBQuantity := Trunc(OrderLine.Quantity);
      with JobBag.Datamodule do
      begin
        JBLine.JBLineCost := CalculatePrice(OrderLine.OrderUnit,
          OrderLine.Quantity, OrderLine.OrderPrice)+OrderLine.ExtraCharges.Total;
        JBLine.JBLineSell := CalculatePrice(OrderLine.SellUnit,
          OrderLine.Quantity, OrderLine.SellingPrice)+OrderLine.ExtraCharges.TotalSell;
      end;
      JBLine.JBLineInvoiced := 'N';
      if OrderLine.POLineStatus >= 30 then      {Fully invoiced}
        begin
          JBLine.JBLineInvoiced := 'Y';
          JBLine.JBLineStatus := OrderLine.POLineStatus;
        end
      else if OrderLine.POLineStatus >= 25 then   {Part Invoiced}
        begin
          JBLine.JBLineInvoiced := 'P';
          JBLine.JBLineStatus := OrderLine.POLineStatus;
        end
      else if OrderLine.POLineStatus >= 21 then     {Fully or part delivered}
        JBLine.JBLineStatus := OrderLine.POLineStatus
      else
        JBLine.JBLineStatus := 12;     {In production}

      JBLine.VATCode := OrderLine.VATCode;
      
      JobBag.Lines.Add(JBLine);
      JobBag.SaveToDB(false);
    finally
      PurchaseOrder.Free;
    end;
  finally
    PBPODM.Free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  dbgLines.DataSource.OnDataChange := SetButtons;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagDetsFrm.FormDestroy(Sender: TObject);
begin
  dbgLines.DataSource.OnDataChange := nil;
end;

procedure TPBMaintJobBagDetsFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with JobBag.DataModule do
  begin
    btnChange.Enabled := (LineCount > 0) and (Mode <> jbAdd);
    btnDelete.Enabled := (LineCount > 0) and (Mode <> jbAdd);
//    btnCopy.enabled := (LineCount > 0) and (CurrentLineType = 'P') and (Mode <> jbAdd);
    btnAddPO.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat);
    btnNew.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat);
    btnAdd.enabled := (Mode <> jbAdd) and (Mode <> jbRepeat);
    btnStock.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat);
    btnExtras.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat);
    btnNotes.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat);
    btnPrint.Enabled := (Mode <> jbAdd) and (Mode <> jbRepeat);
//    chkbxReadytoInvoice.Enabled := ((Mode <> jbAdd) and (Mode <> jbRepeat)) and (JobBag.JBStatus < 25);
    chkbxInactive.Enabled := ((Mode <> jbAdd) and (Mode <> jbRepeat)) and (JobBag.JBStatus < 25);
    
    if (CurrentLineType = 'S') and (Mode <> jbAdd) and (Mode <> jbRepeat) then
      dbgLines.PopupMenu := pmnSOrders
    else
    if (CurrentLineType = 'P') and (Mode <> jbAdd) and (Mode <> jbRepeat) then
      dbgLines.PopupMenu := pmnPOrders
    else
      dbgLines.PopupMenu := pmnFunctions;
  end;
  Application.ProcessMessages;
end;

procedure TPBMaintJobBagDetsFrm.CallMaintDetailsForm(aMode: TJBMode);
var
  inx : integer;
  JobBagLine : TJobBagLIne;
  PBMaintJobBagRCFrm: TPBMaintJobBagRCFrm;
begin
  inx := JobBag.DataModule.CurrentLine;
  try
    PBMaintJobBagLineDetailsFrm := TPBMaintJobBagLineDetailsFrm.Create(Self);
    try
      if aMode = jbAdd then
        JobBagLine := TJobBagLine.Create(JobBag)
      else
      begin
        inx := JobBag.Lines.IndexOf(inx);
        JobBagLine := JobBag.Lines[inx];
        if aMode = jbChange then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                if MessageDlg('Job bag item has been invoiced ' +
                  ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                  Exit;
//                aMode := jbView;
              end
              else
              begin
                if JobBagLine.JBLinePurchInvd then
                begin
                  if MessageDlg('A Supplier invoice has been entered for this item ' +
                    ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                   Exit;
                   // aMode := jbView;
                end;
              end;
          end;
      end;
      PBMaintJobBagLineDetailsFrm.JobBagLine := JobBagLine;
      PBMaintJobBagLineDetailsFrm.Mode := aMode;
      PBMaintJobBagLineDetailsFrm.ShowModal;
    finally
      PBMaintJobBagLineDetailsFrm.Free;
    end;
  finally
    dbgLines.DataSource.Dataset.Close;
    dbgLines.DataSource.Dataset.Open;
    dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(JobBagLine.JBLine)]),[lopartialKey]) ;
  end;
end;

procedure TPBMaintJobBagDetsFrm.CallMaintForm(aMode: TJBLMode);
var
  inx : integer;
  JobBagLine : TJobBagLIne;
  PBMaintJobBagRCFrm: TPBMaintJobBagRCFrm;
begin
  inx := JobBag.DataModule.CurrentLine;
//  dbgLines.DataSource.Dataset.Close;
  try
    PBMaintJobBagRCFrm := TPBMaintJobBagRCFrm.Create(Self);
    try
      if aMode = jblAdd then
        JobBagLine := TJobBagLine.Create(JobBag)
      else
      begin
        inx := JobBag.Lines.IndexOf(inx);
        JobBagLine := JobBag.Lines[inx];
        if aMode = jblChange then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                if MessageDlg('Job bag item has been invoiced ' +
                  ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                  Exit;
               // aMode := jbView;
              end
              else
              begin
                if JobBagLine.JBLinePurchInvd then
                begin
                  if MessageDlg('A Supplier invoice has been entered for this item ' +
                    ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                   Exit;
                   // aMode := jbView;
                end;
              end;
          end;
         if aMode = jblDelete then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                messagedlg('Cannot delete, this item has been invoiced.', mtInformation, [mbOk], 0);
                exit;
              end;
            if JobBagLine.JBLinePurchInvd then
              begin
                messagedlg('Cannot delete, a Supplier Invoice has been entered for this item.', mtInformation, [mbOk], 0);
                exit;
              end;
          end;
      end;
      PBMaintJobBagRCFrm.JobBagLine := JobBagLine;

      PBMaintJobBagRCFrm.Mode := aMode;
      PBMaintJobBagRCFrm.ShowModal;
      if (aMode = jblAdd) and (PBMaintJobBagRCFrm.ModalResult <> mrOK) then
        JobBagLine.Free;
    finally
      PBMaintJobBagRCFrm.Free;
    end;
  finally
    dbgLines.DataSource.Dataset.Close;
    dbgLines.DataSource.Dataset.Open;
    dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(JobBagLine.JBLine)]),[lopartialKey]) ;
    ShowTotals;
  end;
end;

procedure TPBMaintJobBagDetsFrm.CallMaintExtrasForm(aMode: TJBLMode);
var
  inx : integer;
  JobBagLine : TJobBagLIne;
  PBMaintJobBagExtrasFrm: TPBMaintJobBagExtrasFrm;
begin
  inx := JobBag.DataModule.CurrentLine;
//  dbgLines.DataSource.Dataset.Close;
  try
    PBMaintJobBagExtrasFrm := TPBMaintJobBagExtrasFrm.Create(Self);
    try
      if aMode = jblAdd then
        JobBagLine := TJobBagLine.Create(JobBag)
      else
      begin
        inx := JobBag.Lines.IndexOf(inx);
        JobBagLine := JobBag.Lines[inx];
        if aMode = jblChange then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                if MessageDlg('Job bag item has been invoiced ' +
                  ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                  Exit;
//                aMode := jbView;
              end
              else
              begin
                if JobBagLine.JBLinePurchInvd then
                begin
                  if MessageDlg('A Supplier invoice has been entered for this item ' +
                    ' - Continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes then
                   Exit;
                   // aMode := jbView;
                end;
              end;
          end;
         if aMode = jblDelete then
          begin
            if (JobBagLine.JBLineInvoiced = 'P') or
               (JobBagLine.JBLineInvoiced = 'Y') then
              begin
                messagedlg('Cannot delete, this item has been invoiced.', mtInformation, [mbOk], 0);
                exit;
              end;
            if JobBagLine.JBLinePurchInvd then
              begin
                messagedlg('Cannot delete, a Supplier Invoice has been entered for this item.', mtInformation, [mbOk], 0);
                exit;
              end;
          end;
      end;
      JobBagLine.Supplier := dmBroker.GetCompanySupplier;
      JobBagLine.BranchNo := dmBroker.GetCompanySupplierBranch;
      PBMaintJobBagExtrasFrm.JobBagLine := JobBagLine;
      if aMode = jblAdd then
        begin
          try
            PBMaintJobBagExtrasFrm.WONumber := strtoint(cmbJobBagWO.text)
          except
            PBMaintJobBagExtrasFrm.WONumber := 0;
          end;
        end
      else
        PBMaintJobBagExtrasFrm.WONumber := JobBagLine.WONumber;
      PBMaintJobBagExtrasFrm.Mode := aMode;
      PBMaintJobBagExtrasFrm.ShowModal;
      if (aMode = jblAdd) and (PBMaintJobBagExtrasFrm.ModalResult <> mrOK) then
        JobBagLine.Free;
    finally
      PBMaintJobBagExtrasFrm.Free;
    end;
  finally
    dbgLines.DataSource.Dataset.Close;
    dbgLines.DataSource.Dataset.Open;
    dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(JobBagLine.JBLine)]),[lopartialKey]) ;
    ShowTotals;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagDetsFrm.CallMaintScreen(aMode: TJBLMode);
var
  OrdLine: PBPOObjects.TOrderLine;
  inx : integer;
  bTempOK: Boolean;
  JobBagLine : TJobBagLIne;
  PONumber: real;
  POLine: integer;
  tmpMode: string;
begin
  {Call NEW Purchase Order Maintenance}
  PONumber := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Purchase_Order').asfloat;
  POLine := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Line').asinteger;

  {Check whether the Purchase Order has been included in a invoice Period End}
  if dtmdlJBOrders.PeriodEndRun('PO',PONumber,POLine) and (aMode = jblChange) then
    begin
      if MessageDlg('This order has been included in a Period end, the cost and sales values cannot be modified' +
        ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
      aMode := jblRestrict;
    end
  else
  if (FPOStatus > 10) and (aMode = jblChange) then
    begin
      if MessageDlg('This order has been ' + FPOStatusDescr + ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
        Exit;
    end;

  inx := JobBag.DataModule.CurrentLine;
  dbgLines.DataSource.Dataset.Close;

  if (aMode = jblAdd) then
    begin
      JobBagLine := TJobBagLine.Create(JobBag);
    end
  else
  if (aMode = jblChange) or (aMode = jblRestrict) then
    begin
      inx := JobBag.Lines.IndexOf(inx);
      JobBagLine := JobBag.Lines[inx];
    end;

  try
    PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
    try
      PBMaintPOrdfrm.myOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
      PBMaintPOrdfrm.mySellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
      PBMaintPOrdfrm.rOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
      PBMaintPOrdfrm.rSellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
      PBMaintPOrdfrm.SellLimitType := dmBroker.MinimumSalesValueType(frmpbMainMenu.iOperator);
      if aMode = jblChange then
        PBMaintPOrdfrm.FuncMode := 'C'
      else
      if aMode = jblAdd then
        PBMaintPOrdfrm.FuncMode := 'A'
      else
      if aMode = jblRestrict then
        PBMaintPOrdfrm.FuncMode := 'T'
      else
        PBMaintPOrdfrm.FuncMode := 'V';

      if aMode = jblAdd then
        PBMaintPOrdfrm.PurchaseOrderNo := 0
      else
        PBMaintPOrdfrm.PurchaseOrderNo := PONumber;

      PurchaseOrder.POHeadStatus := FPOStatus;
      PurchaseOrder.BranchNo := JobBag.Branch;
      PBMaintPOrdfrm.SetupDetails(Self);

      PBMaintPOrdfrm.JobBagNo := JobBag.dbKey;

      if aMode = jblAdd then
        begin
          PBMaintPOrdfrm.DateEdit.Text := pbdatestr(date);

//          PBMaintPOrdfrm.OfficeComboBox.keyvalue := JobBag.officeContact;
//          PurchaseOrder.OfficeContact := JobBag.officeContact;
          PBMaintPOrdFrm.edtAccountManager.Text := '';
          PBMaintPOrdFrm.edtAccountTeam.Text := '';

          OrdLine := AddNewOrderLine(1);
          CreateDelivery(JobBag.Customer,OrdLine);
        end;
      PBMaintPOrdfrm.bComeFromJobBag := true;
      PBMaintPOrdfrm.ShowModal;
      bTempOK := PBMaintPOrdfrm.bOK;

      if bTempOK then
        begin
          if (aMode = jblAdd) then
            begin
            JobBagLine.CurrencyCode := PurchaseOrder.CurrencyCode;
//            JobBagLine.JBLine := JobBag.Lines.Count + 1;
            JobBagLine.JBLine := JobBag.Lines.MaxLineNo + 1;
            JobBagLine.JBLineType := 'P';
            JobBagLine.JBLineMode := 'C';
            JobBagLine.PurchaseOrder := PurchaseOrder.PONumber;
            JobBagLine.Line := PBMaintPOrdfrm.selectedLine.Line;
            JobBagLine.Supplier:= PurchaseOrder.Supplier;
            JobBagLine.BranchNo := PurchaseOrder.BranchNo;
            JobBagLine.JBLineDescr := PBMaintPOrdfrm.selectedLine.CustomersDesc;
            JobBagLine.JBQuantity := Trunc(PBMaintPOrdfrm.selectedLine.Quantity);
            with JobBag.Datamodule do
            begin
              JobBagLine.JBLineCost := CalculatePrice(PBMaintPOrdfrm.selectedLine.OrderUnit,
                PBMaintPOrdfrm.selectedLine.Quantity, PBMaintPOrdfrm.selectedLine.OrderPrice)
                + PBMaintPOrdfrm.selectedLine.extracharges.Total;
              JobBagLine.JBLineSell := CalculatePrice(PBMaintPOrdfrm.selectedLine.SellUnit,
                PBMaintPOrdfrm.selectedLine.Quantity, PBMaintPOrdfrm.selectedLine.SellingPrice)
                + PBMaintPOrdfrm.selectedLine.extracharges.TotalSell;
            end;
            if PBMaintPOrdfrm.selectedLine.POLineStatus = 25 then
              JobBagLine.JBLineInvoiced := 'P'
            else
            if PBMaintPOrdfrm.selectedLine.POLineStatus >= 30 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
              JobBagLine.JBLineInvoiced := 'N';

              //            JobBagLine.JBLineInvoiced := PBMaintPOrdfrm.selectedLine.POLineStatus >= 30;
            JobBagLine.VATCode := PBMaintPOrdfrm.selectedLine.VATCode;
            JobBagLine.Parent.Lines.Add(JobBagLine);
            end
          else
          if (aMode = jblChange) or (aMode = jblRestrict) then
            begin
            if PBMaintPordFrm.UpdJobBagHead then
              UpdJobBagHead(Self);
            JobBagLine.JBLineDescr := PBMaintPOrdfrm.selectedLine.CustomersDesc;
            JobBagLine.JBQuantity := Trunc(PBMaintPOrdfrm.selectedLine.Quantity);
            with JobBag.Datamodule do
            begin
              JobBagLine.JBLineCost := CalculatePrice(PBMaintPOrdfrm.selectedLine.OrderUnit,
                PBMaintPOrdfrm.selectedLine.Quantity, PBMaintPOrdfrm.selectedLine.OrderPrice)
                + PBMaintPOrdfrm.selectedLine.extracharges.Total;
              JobBagLine.JBLineSell := CalculatePrice(PBMaintPOrdfrm.selectedLine.SellUnit,
                PBMaintPOrdfrm.selectedLine.Quantity, PBMaintPOrdfrm.selectedLine.SellingPrice)
                + PBMaintPOrdfrm.selectedLine.extracharges.TotalSell;
            end;
            if PBMaintPOrdFrm.selectedLine.LineStatus = 25 then
              JobBagLine.JBLineInvoiced := 'P'
            else
            if PBMaintPOrdFrm.selectedLine.LineStatus >= 30 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
              JobBagLine.JBLineInvoiced := 'N';

//            JobBagLine.JBLineInvoiced := PBMaintPOrdfrm.selectedLine.POLineStatus >= 30;
            JobBagLine.VATCode := PBMaintPOrdfrm.selectedLine.VATCode;
            JobBagLine.Parent.SaveToDB(false);
            end;
        end;
    finally
      PBMaintPOrdfrm.Free;
    end;
  finally
    dbgLines.DataSource.Dataset.Open;
    dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(JobBagLine.JBLine)]),[lopartialKey]) ;
    ShowTotals;
  end;
end;

procedure TPBMaintJobBagDetsFrm.SelectCode(Sender: TObject);
var
  tempCode: real;
begin
  tempCode := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Purchase_Order').asfloat;
  with dtmdlJBOrders.qrySelectedPO do
    begin
      Close;
      ParamByName('Purchase_Order').asfloat := tempCode;
      Open;
      First;
    end;

  FPOStatus := dtmdlJBOrders.qrySelectedPO.FieldByName('Purch_Ord_Head_Status').AsInteger;
  FPOStatusDescr := dtmdlJBOrders.qrySelectedPO.FieldByName('Status_Descr').AsString;
end;

procedure TPBMaintJobBagDetsFrm.SelectSalesOrder(Sender: TObject);
var
  tempCode: real;
begin
  tempCode := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Sales_Order').asfloat;
  with dtmdlJBOrders.qrySelectedSO do
    begin
      Close;
      ParamByName('Sales_Order').asfloat := tempCode;
      Open;
      First;
    end;

  FSOStatus := dtmdlJBOrders.qrySelectedSO.FieldByName('Sales_Order_Head_Status').AsInteger;
  FSOStatusDescr := dtmdlJBOrders.qrySelectedSO.FieldByName('Status_Descr').AsString;
  FSODateOrdered := dtmdlJBOrders.qrySelectedSO.FieldByName('Date_Ordered').AsDateTime;
  FSODateRequired := dtmdlJBOrders.qrySelectedSO.FieldByName('Date_Required').AsDateTime;
end;

procedure TPBMaintJobBagDetsFrm.SelectWorksOrder(Sender: TObject);
var
  tempCode: real;
begin
  tempCode := StrToFloatDef(cmbJobBagWO.Text, 0, FormatSettings);
  with dtmdlJBWOrders.qrySelectedWO do
    begin
      Close;
      ParamByName('Works_Order').asfloat := tempCode;
      Open;
      First;
    end;

  FWOStatus := dtmdlJBWOrders.qrySelectedWO.FieldByName('Works_Order_Status').AsInteger;
  FWOStatusDescr := dtmdlJBWOrders.qrySelectedWO.FieldByName('Status_Descr').AsString;
end;

procedure TPBMaintJobBagDetsFrm.btnAddClick(Sender: TObject);
begin
  CallMaintForm(jblAdd);
end;

procedure TPBMaintJobBagDetsFrm.btnChangeClick(Sender: TObject);
begin
  if JobBag.DataModule.CurrentLineType = 'P' then
    begin
      if bComeFromOrder then exit;
      dtmdlJBOrders := TdtmdlOrders.create(self);
      try
        SelectCode(self);
        CallMaintScreen(jblChange);
      finally
        dtmdlJBOrders.free;
      end;
    end
  else
  if JobBag.DataModule.CurrentLineType = 'S' then
    begin
      if bComeFromOrder then exit;
      dtmdlJBOrders := TdtmdlOrders.create(self);
      try
        SelectSalesOrder(self);
        CallMaintStockScreen('C');
      finally
        dtmdlJBOrders.free;
      end;
    end
  else
  if JobBag.DataModule.CurrentLineType = 'A' then
    CallMaintExtrasForm(jblChange)
  else
    CallMaintForm(jblChange)
end;

procedure TPBMaintJobBagDetsFrm.btnDeleteClick(Sender: TObject);
begin
  CallMaintForm(jblDelete);
end;

procedure TPBMaintJobBagDetsFrm.SetMode(const Value: TJBMode);
begin
  FMode := Value;
end;

procedure TPBMaintJobBagDetsFrm.BitBtn1Click(Sender: TObject);
begin
  { We must use the global PBLUCustFrm variable as it is assumed to
    exist by other units called by PBLUCustFrm. }
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := JobBag.Customer;
    PBLUCustFrm.SelBranch := JobBag.Branch;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected and
      ConfirmChange(PBLUCustFrm.SelCode, PBLUCustFrm.SelBranch) then
    begin
      JobBag.Customer := PBLUCustFrm.SelCode;
      JobBag.Branch := PBLUCustFrm.SelBranch;
      edtCustomer.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
      JobBag.CustomerName := PBLUCustFrm.SelName;
      JobBag.BranchName := PBLUCustFrm.SelBranchName;

      if dblkpCustomerContact.keyvalue = null then
        GetCustomerContacts(0)
      else
        GetCustomerContacts(dblkpCustomerContact.keyvalue);

      if dblkpRep.keyvalue = null then
        GetCustomerReps(0)
      else
        GetCustomerReps(dblkpRep.keyvalue);
    end;
  finally
    PBLUCustFrm.Free;
  end;
  CheckOK(Self);
end;

function TPBMaintJobBagDetsFrm.ConfirmChange(const newCust,
  newBranch: integer): Boolean;
begin
  { If the user has changed customer and there are purchase orders in this
    job bag then we have to drop the purchase orders not for the
    newly selected customer/branch. }
  if ((newCust <> JobBag.Customer) or (newBranch <> JobBag.Branch))
    and (JobBag.Lines.POCount > 0) then
  begin
    if MessageDlg('If you change the customer and/or branch then all ' + #13 +
      'purchase orders currently in this job bag will be deleted' + #13 +
      'when you finally save the change.' + #13 +
      'If this is what you want then click OK to confirm otherwise ' + #13 +
      'click abort.', mtConfirmation, [mbOK, mbAbort], 0) = mrOK then
      Result := true
    else
      Result := false;
  end
  else
    Result := true;  { No actual change }
end;

procedure TPBMaintJobBagDetsFrm.GetCustomerContacts(tempno: integer);
begin
  with JobBag.Datamodule.qryCustContact do
    begin
      close;
      parambyname('Customer').asinteger := JobBag.Customer;
      parambyname('Branch_no').asinteger := JobBag.Branch;
      open;

      if (recordcount = 1) then
        begin
         if tempno = 0 then
           dblkpCustomerContact.keyvalue := fieldbyname('Contact_no').asinteger
         else
           dblkpCustomerContact.keyvalue := tempno
        end
      else
        begin
          if tempno = 0 then
            dblkpCustomerContact.keyvalue := 0
          else
            dblkpCustomerContact.keyvalue := tempno
        end;

      JobBag.ContactNo := dblkpCustomerContact.keyvalue;
    end;
end;

procedure TPBMaintJobBagDetsFrm.GetCustomerReps(tempno: integer);
begin
  with JobBag.Datamodule.qryCustReps do
    begin
      close;
      parambyname('Customer').asinteger := JobBag.Customer;
      parambyname('Branch_no').asinteger := JobBag.Branch;
      open;

      if (recordcount = 1) then
        begin
         if tempno = 0 then
           dblkpRep.keyvalue := fieldbyname('Rep').asinteger
         else
           dblkpRep.keyvalue := tempno
        end
      else
        begin
          if tempno = 0 then
            dblkpRep.keyvalue := 0
          else
            dblkpRep.keyvalue := tempno
        end;
      JobBag.Rep := dblkpRep.keyvalue;
    end;
end;

procedure TPBMaintJobBagDetsFrm.BitBtn3Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDate.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.btnOKClick(Sender: TObject);
var
  i: integer;
begin
  if Mode = jbDelete then
    begin
      if messagedlg('Are you sure you want to delete this job bag?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
        JobBag.DeleteFromDB
      else
        exit;
      end
  else
  begin
    if chkbxInactive.checked then
      begin
        if messagedlg('Are you sure this job bag is to be cancelled?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          JobBag.inactive := 'Y'
        else
          exit;
      end
    else
      JobBag.inactive := 'N';


    if chkbxReadytoInvoice.checked then
      begin
        for i := 0 to pred(Jobbag.lines.count) do
          begin
            if JobBag.Lines[i].JBQuantity = 0 then
            begin
              messagedlg('Cannot invoice this job bag, there are lines with zero quantity', mtInformation, [mbOk], 0);
              exit;
            end;
            {Check that there is something to invoice}
            if not JobBag.OKtoInvoice then
            begin
              messagedlg('Cannot invoice this job bag, there are no lines ready for invoicing', mtInformation, [mbOk], 0);
              exit;
            end;
          end;
        JobBag.ReadyToInvoice := 'Y'
      end
    else
      JobBag.ReadyToInvoice := 'N';

    JobBag.Description := Trim(edtDescription.Text);
    JobBag.DescriptiveRef := Trim(edtDescriptiveRef.text);
    JobBag.CustomerName := Trim(edtCustomer.Text);
//    JobBag.BranchName := Trim(edtBranch.Text);
    JobBag.Date := PBDateStr(edtDate.Text);
    JobBag.GoodsRequired := PBDateStr(edtDateReq.Text);
    JobBag.CustOrderNo := edtCustOrderNo.Text;
    JobBag.Quantity := strtoint(memQuantity.text);
    JobBag.Operator := frmPBMainMenu.iOperator;
    JobBag.ContactNo := dblkpCustomerContact.keyvalue;
    JobBag.Rep := dblkpRep.keyvalue;
    if FOriginalCustomer <> 0 then
      begin
        if (FOriginalCustomer <> JobBag.Customer)
        or (FOriginalBranch <> JobBag.Branch) then
          DropPurchaseOrders;
      end;
    JobBag.SaveToDB(true);
  end;

  if (Mode = jbAdd) or (Mode = jbRepeat) then
    begin
      MessageDlg('The job bag number is : ' + intToStr(JobBag.dbKey), mtInformation, [mbOK], 0);
      Mode := jbChange;
      Factivated := false;
      FormActivate(self);
      exit;
    end;
  ModalResult := mrOK;
end;

procedure TPBMaintJobBagDetsFrm.DropPurchaseOrders;
var
  i : integer;
begin
  { The user has changed customer and/or branch so we must drop any
    existing purchase orders or chaos will ensue. }
  if JobBag.Lines.POCount > 0 then
  for i := Pred(JobBag.Lines.Count) downto 0 do   { reverse cos we're deleting }
    if JobBag.Lines[i].JBLineType = 'P' then
      JobBag.Lines.Delete(i);
end;

procedure TPBMaintJobBagDetsFrm.BitBtn2Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateReq.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateReq.Text := DateToStr(DateSelV5Form.Date);
    CheckOK(Self);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If edtDate.Text = '' then
    Exit;
    try
    NewDate := StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDate.SetFocus;
      Exit;
    end;
  end;

  edtDate.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintJobBagDetsFrm.edtDateReqExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If edtDateReq.Text = '' then
    Exit;
    try
    NewDate := StrToDate(edtDateReq.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateReq.SetFocus;
      Exit;
    end;
  end;

  edtDateReq.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBMaintJobBagDetsFrm.BitBtn4Click(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := true;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := JobBag.Customer;
    PBLUCContaFrm.iBranch := JobBag.Branch;
    if dblkpCustomerContact.keyvalue = null then
      PBLUCContaFrm.SelCode := 0
    else
      PBLUCContaFrm.SelCode := dblkpCustomerContact.keyvalue;
    PBLUCContaFrm.sCustName := JobBag.CustomerName;
    PBLUCContaFrm.sBranchName := JobBag.BranchName;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      GetCustomerContacts(PBLUCContaFrm.SelCode);
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagDetsFrm.btnNewClick(Sender: TObject);
begin
  dtmdlJBOrders := TdtmdlOrders.create(self);
  try
    CallMaintScreen(jblAdd);
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.memQuantityEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintJobBagDetsFrm.memQuantityKeyPress(Sender: TObject;
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

procedure TPBMaintJobBagDetsFrm.dbgLinesDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TPBMaintJobBagDetsFrm.CreateDelivery(const iCust : integer;
  OrdLine: PBPOObjects.TOrderLine);
var
  aLine: TDeliveryLine;
begin
  aLine := TDeliveryLine.Create;
  with aLine do
  begin
    {Setup a delivery to the customer, or company if there is no customer}
    Line := OrdLine.Line;
    DeliveryNo := 1;
    QtyToDeliver := JobBag.Quantity;
    DatePoint := Date;

    try
      NoOfBoxes := JobBag.Quantity div strtoint(OrdLine.FormsPerBox);
    except
      NoOfBoxes := 1;
    end;

    Customer := iCust;
    BranchNoZero := PurchaseOrder.BranchNo;
  end;
  OrdLine.DeliveryLines.Add(aLine);
end;

function TPBMaintJobBagDetsFrm.AddNewOrderLine(const LineNo: Integer): PBPOObjects.TOrderLine;
begin
  Result := PBPOObjects.TOrderLine.Create;
  with Result do
  begin
    Line := LineNo;
    CustOrderNo := edtCustOrderNo.Text;
    Customer := JobBag.Customer;
    BranchNo := JobBag.Branch;
    CustomerContact := JobBag.ContactNo;
    Enquiry := 0;
    LineZero := 0;
    SupplierReference := '';
    SupplierJobRef := '';
(*    GoodsRequired := StrToDate(edtDateReq.Text);
    GoodsRequiredByCust := StrToDate(edtDateReq.Text);
*)  if PBDateStr(edtDateReq.Text) > date then
      begin
        GoodsRequired := StrToDate(edtDateReq.Text);
        GoodsRequiredByCust := StrToDate(edtDateReq.Text);
      end
    else
      begin
        GoodsRequired := date;
        GoodsRequiredByCust := date;
      end;
    POLineStatus := 10;
    ProofRequired := False;
    ProofDate := 0;
    ExpectedLife := 0;
    VATCode := JobBag.DefaultVatCode;
    SuppliersDesc := edtDescription.text;
    CustomersDesc := edtDescription.text;
    DescriptiveRef := edtDescriptiveRef.Text;
    Quantity := JobBag.Quantity;
    OrderPrice := 0.00;
    SellingPrice := 0.00;
    ListPrice := 0.00;
    ProductType := 0;
    PrintedPO := False;
//    OrderUnit := 0;
//    SellUnit := 0;
    SuppInvRecd := False;
    Rep := JobBag.Rep;
    ProofStatus := '';
    Narrative := 0;
    NarrativeText := '';
    FormReference := 0;
    FormsPerBox := '';
    Depth := 0;
    DepthUnit := 'mm';
    Result.Width := 0;
    WidthUnit := 'mm';
    Artwork := '';
    NCROTCMix := 'X';
    NoOfPlateChanges := 0;
  end;
  PurchaseOrder.OrderLines.Add(Result);
end;

function TPBMaintJobBagDetsFrm.AddNewSalesOrder: TSalesOrder;
begin
  with SalesOrder do
    begin
      Customer := JobBag.Customer;
      BranchNo := JobBag.Branch;
      CustomerName := JobBag.CustomerName;
      BranchName := JobBag.BranchName;
      CustomerContactNo := JobBag.ContactNo;
      ContactName := dblkpcustomerContact.Text;

(*      DeliveryCustomer := JobBag.Customer;
      DeliveryBranch := JobBag.Branch;
*)
      Operator := JobBag.Operator;

      CustOrderNo := JobBag.CustOrderNo;
      DateReq := JobBag.GoodsRequired;
      RepLines[0].Rep := JobBag.Rep;
      RepLines[0].ActnTkn := 'A';
      ReplenishSource := 2;
      SOType := 'J';
    end;
  Result := SalesOrder;
end;

procedure TPBMaintJobBagDetsFrm.dblkpCustomerContactClick(Sender: TObject);
begin
  JobBag.ContactNo := (Sender as TDBLookupComboBox).keyvalue;
  CheckOK(self);
end;

procedure TPBMaintJobBagDetsFrm.dblkpRepClick(Sender: TObject);
begin
  JobBag.rep := (Sender as TDBLookupComboBox).keyvalue;
  CheckOK(self);
end;

procedure TPBMaintJobBagDetsFrm.BitBtn5Click(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    PBLUCRepFrm.bAllow_Upd := True;

    PBLUCRepFrm.iCust := JobBag.Customer;
    PBLUCRepFrm.iBranch := JobBag.Branch;
    PBLUCRepFrm.sCustName := JobBag.CustomerName;
    PBLUCRepFrm.sBranchName := JobBag.BranchName;
    if dblkpRep.keyvalue = null then
      PBLUCRepFrm.SelCode := 0
    else
      PBLUCRepFrm.SelCode := dblkpRep.keyvalue;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      GetCustomerReps(PBLUCRepFrm.SelCode);
    end;
  finally
    PBLUCRepFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagDetsFrm.FormShow(Sender: TObject);
begin
  if self.JobBag.JBStatus >= 30 then
    begin
//      pnlHeader.Enabled := false;
      self.BitBtn1.Enabled := false;
      self.bitbtn5.enabled := false;
    end
  else
    self.BitBtn1.Enabled := true;

end;

procedure TPBMaintJobBagDetsFrm.UpdJobBagHead(Sender: TObject);
begin
  edtDescription.text := purchaseOrder.OrderLines[0].CustomersDesc;
  edtDescriptiveRef.Text := PurchaseOrder.OrderLines[0].DescriptiveRef;
  memQuantity.Text := formatfloat('########',purchaseOrder.Orderlines[0].Quantity);
  edtDateReq.Text := DateToStr(PurchaseOrder.OrderLines[0].GoodsRequiredByCust);
  edtCustOrderNo.Text := PurchaseOrder.OrderLines[0].CustOrderNo;
end;

procedure TPBMaintJobBagDetsFrm.UpdJobBagHeadWorksOrder(aWOrder: TWOrder);
begin
  edtDescription.text := aWOrder.Description;
  memQuantity.Text := formatfloat('########',aWOrder.QuantityEst);
  edtDateReq.Text := DateToStr(aWOrder.DateRequired);
  edtCustOrderNo.Text := aWOrder.CustomerPO;
  JobBag.OfficeContact := aWorder.OfficeContact;
  dblkpRep.keyvalue := aWOrder.Rep;
end;

procedure TPBMaintJobBagDetsFrm.btnPrintClick(Sender: TObject);
begin
  printer.orientation := poLandscape;
  if printersetupdialog1.Execute then
    print;
end;

procedure TPBMaintJobBagDetsFrm.btnStockClick(Sender: TObject);
begin
  CallMaintStockScreen('A');
end;

procedure TPBMaintJobBagDetsFrm.CallMaintStockScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  iTempSel: Integer;
  iSOrdHeadStatus: integer;
  SONumber: integer;
  JobBagLine : TJobBagLIne;
  inx, ilines: integer;
begin
  if (FSOStatus > 30) and (sTempFuncMode = 'C') then
  begin
    if MessageDlg('This order has been ' + FSOStatusDescr +
      ' - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        sTempFuncMode := 'H';
      end
    else
      exit;
  end;

  SONumber := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Sales_Order').asinteger;

  inx := JobBag.DataModule.CurrentLine;
  dbgLines.DataSource.Dataset.Close;

  STMntSordFrm := TSTMntSordFrm.Create(Self);
  try
    STMntSordFrm.FuncMode := sTempFuncMode;
    SalesOrder.SOHeadStatus := FSOStatus;

    if sTempFuncMode = 'A' then
      STMntSordFrm.SalesOrderNo := 0
    else
      STMntSordFrm.SalesOrderNo := SONumber;

    STMntSordFrm.SetupDetails(Self);

    SalesOrder.OfficeContact := JobBag.OfficeContact;
    SalesOrder.AccountManagerName := JobBag.AccountManagerName;
    SalesOrder.AccountTeam := JobBag.AccountTeam;

    STMntSOrdfrm.JobBagNo := JobBag.dbKey;
    if sTempFuncMode = 'A' then
      begin
        SalesOrder := AddNewSalesOrder;
      end;

    STMntSordFrm.ShowModal;
    bTempOK := STMntSordFrm.bOK;
    if bTempOK then
      begin
        for ilines := 0 to pred(SalesOrder.OrderLines.Count) do
        begin
//          if (sTempFuncMode = 'A') then
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'A') then
          begin
            JobBagLine := TJobBagLine.Create(JobBag);
            JobBagLine.CurrencyCode := 1;
            JobBagLine.JBLine := JobBag.Lines.MaxLineNo + 1;
            JobBagLine.JBLineType := 'S';
            JobBagLine.JBLineMode := 'C';
            JobBagLine.PurchaseOrder := 0;
            JobBagLine.Line := 0;
            JobBagLine.Supplier:= 322;
            JobBagLine.BranchNo := 0;

            JobBagLine.SONumber := SalesOrder.SONumber;
            JobBagLine.SOLineNo := SalesOrder.OrderLines[ilines].Line;
            JobBagLine.JBQuantity := Trunc(SalesOrder.OrderLines[ilines].OrdQty);
            with JobBag.Datamodule do
            begin
              JobBagLine.JBLineDescr := SalesOrder.OrderLines[ilines].part + ' - ' + GetPartDescr(SalesOrder.OrderLines[ilines].Part);
              JobBagLine.JBLineCost := CalculateStockPrice(SalesOrder.OrderLines[ilines].PurchPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Part_Cost);
              JobBagLine.JBLineSell := CalculateStockPrice(SalesOrder.OrderLines[ilines].SellPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Sell_Price);
            end;
            if SalesOrder.SOHeadStatus = 200 then
              JobBagLine.JBLineInvoiced := 'P'
            else
            if SalesOrder.SOHeadStatus >= 250 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
              JobBagLine.JBLineInvoiced := 'N';

              //            JobBagLine.JBLineInvoiced := PBMaintPOrdfrm.selectedLine.POLineStatus >= 30;
            JobBagLine.VATCode := SalesOrder.OrderLines[ilines].VatCode;
            JobBagLine.Parent.Lines.Add(JobBagLine);
          end
          else
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'C') then
          begin
            inx := JobBag.Lines.IndexOf(SalesOrder.OrderLines[ilines].JobBagLine);
            JobBagLine := JobBag.Lines[inx];

            JobBagLine.JBQuantity := Trunc(SalesOrder.OrderLines[ilines].OrdQty);

            JobBagLine.SONumber := SalesOrder.SONumber;
            JobBagLine.SOLineNo := SalesOrder.OrderLines[ilines].Line;

            with JobBag.Datamodule do
            begin
              JobBagLine.JBLineDescr := SalesOrder.OrderLines[ilines].part + ' - ' + GetPartDescr(SalesOrder.OrderLines[ilines].Part);
              JobBagLine.JBLineCost := CalculateStockPrice(SalesOrder.OrderLines[ilines].PurchPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Part_Cost);
              JobBagLine.JBLineSell := CalculateStockPrice(SalesOrder.OrderLines[ilines].SellPackQuantity,
                SalesOrder.OrderLines[ilines].OrdQty, SalesOrder.OrderLines[ilines].Sell_Price);
            end;
            if SalesOrder.SOHeadStatus = 200 then
              JobBagLine.JBLineInvoiced := 'P'
            else
            if SalesOrder.SOHeadStatus >= 250 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
              JobBagLine.JBLineInvoiced := 'N';

//            JobBagLine.JBLineInvoiced := PBMaintPOrdfrm.selectedLine.POLineStatus >= 30;
            JobBagLine.VATCode := SalesOrder.OrderLines[ilines].VATCode;
            JobBagLine.Parent.SaveToDB(false);
          end
          else
          if (SalesOrder.OrderLines[ilines].ActnTkn = 'D') then
          begin
            inx := JobBag.Lines.IndexOf(SalesOrder.OrderLines[ilines].JobBagLine);
            JobBagLine := JobBag.Lines[inx];
            JobBagLine.DeletefromDB;
            JobBagLine.Parent.Lines.Delete(inx);
          end;
        end;
      end;

    iTempSel := SalesOrder.SONumber;

  finally
    STMntSordFrm.Free;
  end;
  dbgLines.DataSource.Dataset.Open;
  dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(inx)]),[lopartialKey]) ;
  ShowTotals;
end;

procedure TPBMaintJobBagDetsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintJobBagDetsFrm.pmnSOrdersPopup(Sender: TObject);
begin
  dtmdlJBOrders := TdtmdlOrders.create(self);
  try
    SelectSalesOrder(self);
    mnuAllocate.enabled := (FSOStatus >= 10) and (FSOStatus < 50);
    mnuDeAllocate.enabled := (FSOStatus >= 50) and (FSOStatus < 100);
    mnuConfirm.enabled := (FSOStatus >= 100) and (FSOStatus < 120);
    mnuProduction.enabled := (FSOStatus >= 120) and (FSOStatus <= 120);
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.mnuChangeClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TPBMaintJobBagDetsFrm.CallAllocScreen(sTempFuncMode: Char);
var
  iTempSel: Integer;
  bTempOK: Boolean;
  SONumber: integer;
begin
  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SONumber := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Sales_Order').asinteger;
    STPrtAllocSalesFrm := TSTPrtAllocSalesFrm.Create(Self);
    try
      STPrtAllocSalesFrm.iOrder := SONumber;
      STPrtAllocSalesFrm.bDeAlloc := (sTempFuncMode = 'D');

      STPrtAllocSalesFrm.iStoreFrom := dtmdlJBOrders.GetSOPartStore(SONumber);
      STPrtAllocSalesFrm.lblSalesOrderNo.Caption := 'Sales Order: ' + IntToStr(SONumber) +
                                 '   Despatch From: ' ;
      STPrtAllocSalesFrm.ShowModal;
      bTempOK := STPrtAllocSalesFrm.bOK ;
      iTempSel := SONumber;
    finally
      STPrtAllocSalesFrm.Free;
    end;
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.mnuAllocateClick(Sender: TObject);
begin
  CallAllocScreen('A');
end;

procedure TPBMaintJobBagDetsFrm.mnuDeAllocateClick(Sender: TObject);
begin
  CallAllocScreen('D');
end;

procedure TPBMaintJobBagDetsFrm.mnuPickingNoteClick(Sender: TObject);
var
  Reprint: ByteBool;
  SONumber: integer;
  SOStatus: integer;
  bTempOK: Bytebool;
  iTempSel: integer;
  customername: string;
begin
  customername := JobBag.CustomerName;
  Reprint := false;

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SelectSalesOrder(self);

    SONumber := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Sales_Order').asinteger;

    if (FSOStatus < 50) then
      begin
        messagedlg('Cannot print a Picking Note, stock has not been allocated to the order.', mtWarning,
            [mbOk], 0);
        exit
      end
    else
    if (FSOStatus = 100) then
      begin
        messagedlg('The Picking Note has already been printed', mtWarning,
          [mbOk], 0);
        Reprint := true
      end
    else
    if (FSOStatus >= 120) then
      begin
        messagedlg('The status of this order is '+ FSOStatusDescr + ' you cannot print/reprint the Picking Note.', mtWarning,
          [mbOk], 0);
        exit;
      end;

    STRSPickNotefrm:= TSTRSPickNotefrm.create(self);
    try
      STRSPickNotefrm.OrderGroupBox.caption := STRSPickNotefrm.OrderGroupBox.caption + inttostr(SONumber);
      STRSPickNotefrm.Customerlbl.caption := CustomerName;
      STRSPickNotefrm.OrderDateLbl.caption := pbDateStr(FSODateOrdered);
      STRSPickNotefrm.DeliveryDateEdit.text := pbDateStr(FSODateRequired);
      STRSPickNotefrm.SONumber := SONumber;
      STRSPickNotefrm.DateRequired := FSODateRequired;
      STRSPickNotefrm.Reprint := Reprint;
      STRSPickNotefrm.showmodal;
      bTempOK := STRSPickNotefrm.bOK;
      iTempSel := SONumber;
    finally
      STRSPickNotefrm.free;
    end;
  finally
    dtmdlJBOrders.free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.mnuConfirmClick(Sender: TObject);
var
  inx: integer;
  JobBagLine: TJobBagLine;

  bTempOK: Bytebool;
  iIntSelCode: integer;
  sPickRef: string;
  SONumber: integer;
  PickingList: TPickingList;
begin
  inx := JobBag.DataModule.CurrentLine;

  inx := JobBag.Lines.IndexOf(inx);
  JobBagLine := JobBag.Lines[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SelectSalesOrder(self);

    SONumber := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Sales_Order').asinteger;

    {Delete any entries currently in the IntSel table for this process}
    {This has all been added because the Picking confirmation screen works off the Intsel table}
    iIntSelCode := dmBroker.GetNextIntSelCode(Self) ;
    dmBroker.DelIntSelCode(iIntSelCode, True);

    {Get the Picking Refererence}
    sPickRef := dtmdlJBOrders.GetPickingRef(SONumber);
    dmBroker.AddIntSelCode(iIntSelCode,StrToFloatDef(sPickRef, 0, FormatSettings), sPickRef);
  
    stPickDM := TstpickDm.Create(self);
    stStockDataMod := TstStockDataMod.Create(self);
    PickingList := TPickingList.Create(stPickDM);

    STPickByPartFrm := TSTPickByPartFrm.Create(Self);
    try
      STPickByPartFrm.IsSalesOrder := True;
      STPickByPartFrm.iintselcode := iIntselcode;
      STPickByPartFrm.ShowModal;
      bTempOK := STPickByPartFrm.bOK;
      if bTempOK then
        begin
          JobBagLine.JBLineInvoiced := JobBag.DataModule.GetJobBagLineInvoiced(JobBag.DbKey, JobBagLine.JBLine);
          JobBagLine.JBLineCost := JobBag.DataModule.GetJobBagLineCost(JobBag.DbKey, JobBagLine.JBLine);
          JobBagLine.JBLineSell := JobBag.DataModule.GetJobBagLineSell(JobBag.DbKey, JobBagLine.JBLine);
        end;
    finally
      STPickBYPartFrm.Free;

      stStockDataMod.free;
      stPickDM.free;
    end;
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.CallMaintWOrderScreen(aMode: TjbwoMode);
var
  bTempOK: Boolean;
  iTempSel: Integer;
  key: integer;
  JobBagLine : TJobBagLIne;
  inx, ilines: integer;
  aWOrder: TWOrder;
begin
//  key := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Works_Order').asinteger;

  key := strtoint(cmbJobBagWo.text);
  
  inx := JobBag.DataModule.CurrentLine;
  dbgLines.DataSource.Dataset.Close;

  if (aMode = jbwoAdd) or (aMode = jbwoRepeat) then
    begin
      JobBagLine := TJobBagLine.Create(JobBag);
    end
  else
  if aMode = jbwoChange then
    begin
      inx := JobBag.Lines.IndexOf(inx);
      JobBagLine := JobBag.Lines[inx];
    end;

  try

    aWOrder := TWOrder.Create(dtmdlJBWOrders);
    aWOrder.DbKey := key;
    aWOrder.LoadFromDB;

    frmPBMaintWorksOrders := TfrmPBMaintWorksOrders.Create(Self);
    try
      if aMode = jbwoChange then
        frmPBMaintWorksOrders.Mode := woChange
      else
      if aMode = jbwoAdd then
        frmPBMaintWorksOrders.Mode := woAdd;

      frmPBMaintWorksOrders.WOrder := aWOrder;
      frmPBMaintWorksOrders.ComeFromJobBag := true;
      frmPBMaintWorksOrders.ShowModal;
      bTempOK := frmPBMaintWorksOrders.bOK;

      if bTempOK then
        begin
          if (aMode = jbwoAdd) then
            begin
            JobBagLine.CurrencyCode := 1;
//            JobBagLine.JBLine := JobBag.Lines.Count + 1;
            JobBagLine.JBLine := JobBag.Lines.MaxLineNo + 1;
            JobBagLine.JBLineType := 'W';
            JobBagLine.JBLineMode := 'C';
            JobBagLine.WONumber := aWOrder.dbkey;
            JobBagLine.Supplier:= dmBroker.GetCompanySupplier;
            JobBagLine.BranchNo := dmBroker.GetCompanySupplierBranch;
            JobBagLine.JBLineDescr := aWOrder.Description;
            JobBagLine.JBQuantity := Trunc(aWorder.QuantityEst);
            JobBagLine.JBLineCost := 0.00;
            JobBagLine.JBLineSell := aWOrder.EstimatedCost;
            if aWOrder.WOStatus >= 30 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
            if aWOrder.WOStatus >= 25 then
              JobBagLine.JBLineInvoiced := 'P'
            else
              JobBagLine.JBLineInvoiced := 'N';

            JobBagLine.VATCode := aWOrder.VatCode;
            JobBagLine.Parent.Lines.Add(JobBagLine);
            end
          else
          if aMode = jbwoChange then
            begin
            {Update the job bag head}
            if aWorder.JobBagLine = 1 then
              UpdJobBagHeadWorksOrder(aWOrder);
            JobBagLine.JBLineDescr := aWOrder.Description ;
            JobBagLine.JBQuantity := Trunc(aWOrder.QuantityEst);
            JobBagLine.JBLineCost := 0.00;
            JobBagLine.JBLineSell := aWorder.EstimatedCost;
            if aWOrder.WOStatus >= 30 then
              JobBagLine.JBLineInvoiced := 'Y'
            else
            if aWOrder.WOStatus >= 25 then
              JobBagLine.JBLineInvoiced := 'P'
            else
              JobBagLine.JBLineInvoiced := 'N';

            JobBagLine.VATCode := aWOrder.VATCode;
            JobBagLine.Parent.SaveToDB(false);
            end;
        end;
    finally
      aWOrder.Free;
      frmPBMaintWorksOrders.Free;
    end;
  finally
    dbgLines.DataSource.Dataset.Open;
    dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(JobBagLine.JBLine)]),[lopartialKey]) ;
    ShowTotals;
  end;
end;

procedure TPBMaintJobBagDetsFrm.CallMaintWorksOrder(const aMode: TJBWOMode);
var
  bTempOK: Boolean;
  iTempSel: Integer;
  key: integer;
  JobBagLine : TJobBagLIne;
  inx, ilines: integer;
  aWOrder: TWOrder;
begin
  key := strtoint(cmbJobBagWo.text);

  try
    aWOrder := TWOrder.Create(dtmdlJBWOrders);
    aWOrder.DbKey := key;
    aWOrder.LoadFromDB;
    aWOrder.JobBagLine := (cmbJobBagWO.ItemIndex + 1);

    frmPBMaintWorksOrders := TfrmPBMaintWorksOrders.Create(Self);
    try
      if aMode = jbwoChange then
        frmPBMaintWorksOrders.Mode := woChange
      else
      if aMode = jbwoAdd then
        frmPBMaintWorksOrders.Mode := woAdd;

      frmPBMaintWorksOrders.WOrder := aWOrder;
      frmPBMaintWorksOrders.ComeFromJobBag := true;
      frmPBMaintWorksOrders.ShowModal;
      bTempOK := frmPBMaintWorksOrders.bOK;

      if bTempOK then
        begin
          if aWorder.JobBagLine = 1 then
              UpdJobBagHeadWorksOrder(aWOrder);
        end;
    finally
      aWOrder.Free;
      frmPBMaintWorksOrders.Free;
    end;
  finally
    ShowTotals;
  end;
end;

procedure TPBMaintJobBagDetsFrm.btnExtrasClick(Sender: TObject);
begin
  CallMaintExtrasForm(jblAdd);
end;

procedure TPBMaintJobBagDetsFrm.pmnFunctionsPopup(Sender: TObject);
begin
  with pmnFunctions do
    begin
      mnuinsertexistingPO.enabled := btnAddPO.enabled;
      mnuaddNewPO.enabled := btnNew.enabled;
      mnuaddStockItems.enabled := btnStock.Enabled;
      mnuaddsundrycharge.Enabled := btnAdd.enabled;
      mnuaddWorksOrderCharge.Enabled := btnExtras.enabled;
      mnuchangeline.enabled := btnChange.enabled;
      mnuprint.enabled := btnPrint.enabled;
      mnudelete.enabled := btnDelete.enabled;
      mnuEditDescription.enabled := btnDelete.enabled;
    end;
end;

procedure TPBMaintJobBagDetsFrm.btnAccountManagerClick(Sender: TObject);
begin
  PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Owner);
  try
    PBLUAccountManagerFrm.bIs_Lookup := True;
    PBLUAccountManagerFrm.bAllow_Upd := True;

    PBLUAccountManagerFrm.SelCode := JobBag.OfficeContact;
    PBLUAccountManagerFrm.ShowModal;
    if PBLUAccountManagerFrm.selected then
    begin
      JobBag.OfficeContact := PBLUAccountManagerFrm.SelCode;
      JobBag.AccountManagerName := PBLUAccountManagerFrm.SelName;
      edtAccountManager.Text := PBLUAccountManagerFrm.SelName;
      JobBag.AccountTeam := PBLUAccountManagerFrm.SelTeam;
      edtAccountTeam.Text := PBLUAccountManagerFrm.SelTeamName;
    end;
  finally
    PBLUAccountManagerFrm.Free;
  end;
  CheckOK(self);
end;

procedure TPBMaintJobBagDetsFrm.Print1Click(Sender: TObject);
var
  bTempOK: Boolean;
  selcode: real;
  inx: integer;
  bAuthorised: boolean;
begin
  bAuthorised := true;
  if (dmBroker.AuthorisePOs = 'Y') then
    bAuthorised := OrderAuthorised;

  {Purchase order Print/Fax}
  inx := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Job_Bag_line').asinteger;
  selcode := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Purchase_Order').asfloat;
  PBRSPOrdNFrm := TPBRSPOrdNFrm.Create(Self);
  try
    PBRSPOrdNFrm.bAuthorised := bAuthorised;
    PBRSPOrdNFrm.EnquiryMemo.text := floattostr(selcode);
    PBRSPOrdNFrm.ShowModal;
    bTempOK := PBRSPOrdNFrm.bOK;
  finally
    PBRSPOrdNFrm.Free;
    dbgLines.DataSource.Dataset.Open;
    dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(inx)]),[lopartialKey]) ;
  end;
end;

function TPBMaintJobBagDetsFrm.OrderAuthorised: boolean;
var
  rPOLimit, rLimit: real;
  rPOValue: real;
begin
  result := True;

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    if dtmdlJBOrders.IsPOAuthorised(JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Purchase_Order').Asfloat) then
      exit;

    with dtmdlJBOrders.qryOperator do
      begin
        close;
        parambyname('Operator').asinteger := frmpbMainMenu.iOperator;
        open;
        rPOLimit := fieldbyname('Max_UnAuthorised_PO_Value').asfloat;
      end;

    rPOValue := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Job_Bag_Line_Sell').Asfloat;

    rLimit := dmBroker.GetDefaultPOrderLimit;

    if rPOLimit > rLimit then
      rLimit := rPOLimit;

    if rPOValue > rLimit then
      begin
        MessageDlg('The value of this purchase order is ' + FloatToStrF(rPOValue, ffCurrency, 15, 2) + ', which is over your '
                  + 'order limit of ' + FloatToStrF(rLimit, ffCurrency, 15, 2) +  ', please obtain the necessary authorisation.', mterror, [mbOk], 0);
        result := false;
      end
    else
      result := true;
  finally
    dtmdlJBOrders.Free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.CheckNotes(Sender: TObject);
begin
  if trim(JobBag.NarrativeText) <> '' then
  begin
    FlashTimer.Enabled := True;
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintJobBagDetsFrm.btnNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    if Mode = jbView then
      PBDBInvMemoFrm.bAllow_Upd := false
    else
      PBDBInvMemoFrm.bAllow_Upd := true;

    PBDBInvMemoFrm.Datamemo.text := JobBag.NarrativeText;
    PBDBInvMemoFrm.ShowModal;
    JobBag.Narrativetext := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TPBMaintJobBagDetsFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintJobBagDetsFrm.btnShowWOClick(Sender: TObject);
begin
  if bComeFromOrder then exit;
  dtmdlJBWOrders := TdtmdlWOrders.create(self);
  try
    SelectWorksOrder(self);
    CallMaintWorksOrder(jbwoChange);
  finally
    dtmdlJBWOrders.free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.mnueditDescriptionClick(Sender: TObject);
begin
  CallMaintDetailsForm(jbChange);
end;

procedure TPBMaintJobBagDetsFrm.mnuPrintStockOrderClick(Sender: TObject);
var
  bTempOK: Boolean;
  selcode: integer;
  customername: string;
begin
  CustomerName := edtCustomer.text;
  selcode := dbgLines.datasource.dataset.fieldbyname('Sales_order').asinteger;
  try
    STRSSalesOrdfrm := TSTRSSalesOrdfrm.create(self);
    STRSSalesOrdfrm.OrderGroupBox.caption := STRSSalesOrdfrm.OrderGroupBox.caption + inttostr(selcode);
    STRSSalesOrdfrm.Customerlbl.caption := CustomerName;
    STRSSalesOrdfrm.OrderDateLbl.caption := edtDate.text;
    STRSSalesOrdfrm.SONumber := selcode;
    STRSSalesOrdfrm.showmodal;
    bTempOK := STRSSalesOrdfrm.bOK;
  finally
    STRSSalesOrdfrm.free;
  end;
end;

procedure TPBMaintJobBagDetsFrm.mnuProductionClick(Sender: TObject);
var
  inx: integer;
  JobBagLine: TJobBagLine;

  SONumber: integer;
  jobBagNo: integer;
  bTempOK: boolean;
begin
  inx := JobBag.DataModule.CurrentLine;

  inx := JobBag.Lines.IndexOf(inx);
  JobBagLine := JobBag.Lines[inx];

  dtmdlJBOrders := TdtmdlOrders.create(self);

  try
    SelectSalesOrder(self);

    SONumber := JobBag.Datamodule.dsJBAllLines.DataSet.FieldByName('Sales_Order').asinteger;

    if (FSOStatus <> 120) then
      begin
        messagedlg('The status of this order is '+ FSOStatusDescr + ' unable to confirm this order', mtInformation,
        [mbOk], 0);
          exit;
      end;


    if (dtmdlJBOrders.GetSOtype(SONumber) <> 'J') then
      begin
        messagedlg('Only Orders associated with Job Bags can be confirmed as complete', mtInformation, [mbOk], 0);
        exit;
      end;

    JobBagNo := dbgLines.datasource.DataSet.FieldByName('Job_Bag').AsInteger;

    frmSTMaintSalesOrder := TfrmSTMaintSalesOrder.Create(Self);
    try
      frmSTMaintSalesOrder.Mode := 'C';
      frmSTMaintSalesOrder.SalesOrderNo := SONumber;
      frmSTMaintSalesOrder.JobBagNo := JobBagNo;
      frmSTMaintSalesOrder.ShowModal;
      bTempOK := frmSTMaintSalesOrder.bOK;
      if bTempOK then
        begin
          JobBagLine.JBLineInvoiced := JobBag.DataModule.GetJobBagLineInvoiced(JobBag.DbKey, JobBagLine.JBLine);
          JobBagLine.JBQuantity := JobBag.DataModule.GetJobBagLineQty(JobBag.DbKey, JobBagLine.JBLine);
          JobBagLine.JBLineCost := JobBag.DataModule.GetJobBagLineCost(JobBag.DbKey, JobBagLine.JBLine);
          JobBagLine.JBLineSell := JobBag.DataModule.GetJobBagLineSell(JobBag.DbKey, JobBagLine.JBLine);

          dbgLines.DataSource.Dataset.Open;
          dbgLines.DataSource.DataSet.Locate('Job_Bag;Job_Bag_Line', VarArrayOf([inttostr(JobBag.dbKey),inttostr(JobBagLine.JBLine)]),[lopartialKey]) ;
          ShowTotals;
        end;
    finally
      frmSTMaintSalesOrder.Free;
    end;
  finally
    dtmdlJBOrders.Free;
  end;
end;

end.
