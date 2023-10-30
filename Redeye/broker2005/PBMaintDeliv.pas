unit PBMaintDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Spin, ExtCtrls,
  PBPOObjects, ComCtrls, Grids, Menus, Math, PBDelivNotes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintDelivFrm = class(TForm)
    BottomPanel: TPanel;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlFormRef: TPanel;
    POrderLbl: TLabel;
    CustomerLbl: TLabel;
    pgDeliveryDetails: TPageControl;
    tbshtDetails: TTabSheet;
    tbshtStock: TTabSheet;
    sgBins: TStringGrid;
    pMnBins: TPopupMenu;
    popAdd: TMenuItem;
    popChange: TMenuItem;
    Label12: TLabel;
    edtFormRef: TEdit;
    btnFormRef: TBitBtn;
    tbshtCallOffs: TTabSheet;
    sgPick: TStringGrid;
    Label3: TLabel;
    Label13: TLabel;
    memQtyDelivIn: TMemo;
    memQtyDElivOut: TMemo;
    N1: TMenuItem;
    Adjustment1: TMenuItem;
    Label15: TLabel;
    memQtyToPick: TMemo;
    TbShtStkLocs: TTabSheet;
    Label16: TLabel;
    MemQtyToStock: TMemo;
    SGStock: TStringGrid;
    FromStoreLabel: TLabel;
    StoreDBLookupComboBox: TDBLookupComboBox;
    pMenuStock: TPopupMenu;
    StockAdd: TMenuItem;
    StockChange: TMenuItem;
    StockDel: TMenuItem;
    QueryGetPOlineDets: TFDQuery;
    GetMoveRecsSQL: TFDQuery;
    UpdStoreLvlSQL: TFDQuery;
    StoreLvlSQL: TFDQuery;
    Label17: TLabel;
    edtStockRef: TEdit;
    FlashDelivTimer: TTimer;
    ChkOneDelivSQL: TFDQuery;
    UpdOrdQtySQL: TFDQuery;
    lblOrderPrice: TLabel;
    lblOrderQty: TLabel;
    DelInstructPanel: TPanel;
    Label10: TLabel;
    DelInstructMemo: TMemo;
    Panel1: TPanel;
    pnlCourierService: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    AddrTypeRadGrp: TRadioGroup;
    AddrGrpBox: TGroupBox;
    AddrTypeLabel: TLabel;
    BranchNameLabel: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    lblFAO: TLabel;
    NameEdit: TEdit;
    BranchNameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    DelivNotesBitBtn: TBitBtn;
    chkbxInvoice: TCheckBox;
    edtFAO: TEdit;
    btnLUContact: TButton;
    QtysGrpBox: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    QtyToDeliverMemo: TMemo;
    QtyDeliveredMemo: TMemo;
    QtyInvoicedMemo: TMemo;
    NoOfBoxesMemo: TMemo;
    BoxQtyMemo: TMemo;
    WeightMemo: TMemo;
    DatePointEdit: TEdit;
    SearchBtn: TButton;
    DeliveryDateEdit: TEdit;
    DeliverViachk: TCheckBox;
    DatePointBtn: TBitBtn;
    DeliveryDateBtn: TBitBtn;
    CustReqDateEdit: TEdit;
    CustReqDatebtn: TBitBtn;
    btnClear: TBitBtn;
    lblCourier: TLabel;
    Label20: TLabel;
    dblkpCourierService: TDBLookupComboBox;
    Label21: TLabel;
    dblkppackageType: TDBLookupComboBox;
    dblkpVersions: TDBLookupComboBox;
    qryVersions: TFDQuery;
    dtsVersions: TDataSource;
    qryUpPOVersions: TFDQuery;
    qryGetPODelivery: TFDQuery;
    qryAddPODelivery: TFDQuery;
    qryGetNextPODelivery: TFDQuery;
    DeliveryToStockChk: TCheckBox;
    Label19: TLabel;
    CountyEdit: TEdit;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure OKBitBtnClick(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    procedure ValidateQtyto3DP(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure VATDBLCBClick(Sender: TObject);
    procedure ShowAddress(Sender: TObject);
    procedure ShowLocations(Sender: TObject);
    procedure ShowPickLocations(Sender: TObject);
    procedure DatePointBtnClick(Sender: TObject);
    procedure AddrTypeRadGrpClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure QtyToDeliverMemoKeyPress(Sender: TObject; var Key: Char);
    procedure QtyToDeliverMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeliveryDateBtnClick(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure DatePointEditExit(Sender: TObject);
    procedure DeliveryToStockChkClick(Sender: TObject);
    procedure btnFormRefClick(Sender: TObject);
    procedure popAddClick(Sender: TObject);
    procedure popChangeClick(Sender: TObject);
    procedure popDeleteClick(Sender: TObject);
    procedure pMnBinsPopup(Sender: TObject);
    procedure sgPickDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure sgPickSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgPickKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbshtCallOffsShow(Sender: TObject);
    procedure tbshtStockShow(Sender: TObject);
    procedure Adjustment1Click(Sender: TObject);
    procedure sgPickKeyPress(Sender: TObject; var Key: Char);
    procedure TbShtStkLocsShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StockAddClick(Sender: TObject);
    procedure StockChangeClick(Sender: TObject);
    procedure StockDelClick(Sender: TObject);
    procedure StockShowClick(Sender: TObject);
    procedure SGStockDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure pMenuStockPopup(Sender: TObject);
    procedure FlashDelivTimerTimer(Sender: TObject);
    procedure DelivNotesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckNotes(Sender: TObject);
    procedure SGStockDblClick(Sender: TObject);
    procedure CustReqDateEditExit(Sender: TObject);
    procedure CustReqDatebtnClick(Sender: TObject);
    procedure btnLUContactClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dblkpVersionsClick(Sender: TObject);
  private
    PBPODelivNotesFrm: TPBDelivNotesFrm;
    bDelivNotesFlash: ByteBool;
    FFuncMode: Char;
    FSupplier: Integer;
    FSupplierBranch: Integer;
    FCustomer: Integer;
    FCustomerBranch: Integer;
    FAdHocAddress: Integer;
    FRep: Integer;
    FPONumber: real;
    sOldValue: string;
    FNoDelInstruct: Boolean;
    FFormsPerBox: string;
    FNoOfBoxes: integer;
    FQtyDelivered: real;
    FQtyToDeliver: real;
    FQtyInvoiced: real;
    FInstructions: string;
    FDatePoint: string;
    FDeliverViaCompany: string;
    FBranchNo: integer;
    FBranchNoZero: integer;
    FSupplierCode: integer;
    FCustomerCode: integer;
    FDeliveryDate: string;
    FRepCode: integer;
    FAdhocAddressCode: integer;
    FDeliveryToStock: string;
    FRadioActive: boolean;
    FCallOff: boolean;
    fUsesStock: boolean;
    fPackSize: integer;
    fDelivNotes: string;
    fResetQty: boolean;
    FOrigOrdQty: real;
    FGoodsRequiredbyCust: string;
    FCostPrice: double;
    FCostUnitDesc: string;
    FUnitCost: double;
    FSetsperPad: integer;
    FInvoiceupfront: string;
    FFAO: string;
    FOrderContact: string;
    FCompanyBranch: integer;
    FCompanyBranchCode: integer;
    FWeight: double;
    FService: integer;
    FCourierCode: integer;
    FPackType: integer;
    FCourier: integer;
    procedure UpdateDelivery;
    procedure CreatePODelivery(tempPO: real; tempDelivery, tempQty: integer);
    procedure SetNoDelInstruct(const Value: Boolean);
    procedure SetFormsPerBox(const Value: string);
    procedure SetDatePoint(const Value: string);
    procedure SetInstructions(const Value: string);
    procedure SetNoOfBoxes(const Value: integer);
    procedure SetQtyDelivered(const Value: real);
    procedure SetQtyInvoiced(const Value: real);
    procedure SetQtyToDeliver(const Value: real);
    procedure SetDeliverViaCompany(const Value: string);
    procedure SetBranchNo(const Value: integer);
    procedure SetBranchNoZero(const Value: integer);
    procedure SetCustomerCode(const Value: integer);
    procedure SetSupplierCode(const Value: integer);
    procedure SetDeliveryDate(const Value: string);
    procedure SetRepCode(const Value: integer);
    procedure SetAdhocAddressCode(const Value: integer);
    procedure SetDeliveryToStock(const Value: string);
    procedure SetRadioActive(const Value: boolean);
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure CallStockMaintScreen(sTempFuncMode: Char);
    function TotalRowsUsed: integer;
    Function NoOfStockRows: integer;
    function GetTotalBinQty: integer;
    function GetTotalPickQty: integer;
    function GetOutstandingBinQty: integer;
    function GetOutstandingStockQty: integer;
    function OKToReset: Boolean;
    function GetBoxCount(TempQty: integer): integer;
    procedure SetCallOff(const Value: boolean);
    procedure setUsesStock(const Value: boolean);
    procedure setPackSize(const Value: integer);
    procedure TransferStock;
    procedure CreatePartDetails;
    procedure UpdateStock;
    procedure UpdateVersions;
    procedure SetStoreLevels;
    procedure SetDelivNotes(const Value: string);
    procedure setResetQty(const Value: boolean);
    procedure SetOrigOrdQty(const Value: real);
    procedure SetGoodsRequiredbyCust(const Value: string);
    procedure SetCostPrice(const Value: double);
    procedure SetCostUnitDesc(const Value: string);
    procedure SetUnitCost(const Value: double);
    procedure SetSetsperPad(const Value: integer);
    procedure SetInvoiceupfront(const Value: string);
    procedure SetFAO(const Value: string);
    procedure SetOrderContact(const Value: string);
    procedure SetCompanyBranch(const Value: integer);
    procedure SetCompanyBranchCode(const Value: integer);
    procedure SetWeight(const Value: double);
    procedure SetCourierCode(const Value: integer);
    procedure SetPackType(const Value: integer);
    procedure SetService(const Value: integer);
    procedure SetCourier(const Value: integer);
  public
    bOK: Boolean;
    bView: Boolean;
    bOldStock: Boolean;
    bNewStock: Boolean;
    bNumbered: Boolean;
    iCustomer, iBranch, iFormReference, idefWareHouse: integer;
    iLine, iDelivLine: integer;
    iBoxQty,isellFactor, ipurchFactor, istockPackSize: integer ;
    sell_price, Purch_price : real;
    lotsInUse: ByteBool;
    rOrigOrder: real;
    iOrigLine: integer;
    currRow: integer;
    PickArray: array[1..100, 1..10] of string;  {PO, Line, Del No, Loc No, Orig Qty,  New Qty}
    property FuncMode: Char read FFuncMode write FFuncMode;
    property Supplier: Integer read FSupplier write FSupplier;
    property SupplierBranch: Integer read FSupplierBranch write FSupplierBranch;
    property CompanyBranch: integer read FCompanyBranch write SetCompanyBranch;
    property CompanyBranchCode: integer read FCompanyBranchCode write SetCompanyBranchCode;
    property Customer: Integer read FCustomer write FCustomer;
    property CustomerBranch: Integer read FCustomerBranch write FCustomerBranch;
    property CostPrice: double read FCostPrice write SetCostPrice;
    property CostUnitDesc: string read FCostUnitDesc write SetCostUnitDesc;
    property Courier: integer read FCourier write SetCourier;
    property CourierCode: integer read FCourierCode write SetCourierCode;
    property AdHocAddress: Integer read FAdHocAddress write FAdHocAddress;
    property NoDelInstruct : Boolean read FNoDelInstruct write SetNoDelInstruct;
    property Rep: Integer read FRep write FRep;
    property PONumber: real read FPONumber write FPONumber;
    property FormsPerBox: string read FFormsPerBox write SetFormsPerBox;
    property DatePoint: string read FDatePoint write SetDatePoint;
    property GoodsRequiredbyCust: string read FGoodsRequiredbyCust write SetGoodsRequiredbyCust;
    property QtyToDeliver: real read FQtyToDeliver write SetQtyToDeliver;
    property QtyDelivered: real read FQtyDelivered write SetQtyDelivered;
    property OrigOrdQty: real read FOrigOrdQty write SetOrigOrdQty;
    property QtyInvoiced: real read FQtyInvoiced write SetQtyInvoiced;
    property NoOfBoxes: integer read FNoOfBoxes write SetNoOfBoxes;
    property Instructions: string read FInstructions write SetInstructions;
    property Invoiceupfront: string read FInvoiceupfront write SetInvoiceupfront;
    property DelivNotes: string read fDelivNotes write SetDelivNotes;
    property DeliverViaCompany: string read FDeliverViaCompany write SetDeliverViaCompany;
    property SupplierCode: integer read FSupplierCode write SetSupplierCode;
    property BranchNo: integer read FBranchNo write SetBranchNo;
    property CustomerCode: integer read FCustomerCode write SetCustomerCode;
    property BranchNoZero: integer read FBranchNoZero write SetBranchNoZero;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    property RepCode: integer read FRepCode write SetRepCode;
    property AdhocAddressCode: integer read FAdhocAddressCode write SetAdhocAddressCode;
    property DeliveryToStock: string read FDeliveryToStock write SetDeliveryToStock;
    property SetsperPad: integer read FSetsperPad write SetSetsperPad;
    property RadioActive: boolean read FRadioActive write SetRadioActive;
    property CallOff: boolean read FCallOff write SetCallOff;
    property ResetQty: boolean read fResetQty write setResetQty;
    property UsesStock: boolean read fUsesStock write setUsesStock;
    property PackSize: integer read fPackSize write setPackSize;
    property UnitCost: double read FUnitCost write SetUnitCost;
    property FAO: string read FFAO write SetFAO;
    property OrderContact: string read FOrderContact write SetOrderContact;
    property Weight: double read FWeight write SetWeight;
    property Service: integer read FService write SetService;
    property PackType: integer read FPackType write SetPackType;
    procedure BuildDeliveryLine(Tempqry: TDataset);
    procedure SaveDeliveryLine(TempOrder: real; TempLine, TempDel: integer);
    procedure SaveDeliveryLocations(TempOrder: real; TempLine, TempDel: integer);
    procedure SavePickingLocations(TempOrder: real; TempLine, TempDel: integer);
    procedure LoadStockLocsGrid(TempOrder: real; TempLine, TempDel: integer);
    procedure ResetOrderqty(TempOrder: real; TempLine, TempDel: integer);
  end;

var
  PBMaintDelivFrm: TPBMaintDelivFrm;

implementation

uses
  System.Types, System.UITypes,
  PBPODataMod, pbMainMenu, pbDatabase, pbStockMoveDm,
  PBLUAdHoc, PBLUSupp, PBLURep, PBLUCust, DateSelV5,
  PBMaintDelivBin, PBMntPrtBin, PBDelivStock, PBImages, PBLUDeliveriesDM,
  PBLUCConta, CCSCommon, PBLUProductRef, pbLUCompBranch;

{$R *.DFM}

procedure TPBMaintDelivFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  UsesStock := frmPBMainMenu.UseStockSystem;
  pgDeliveryDetails.ActivePage := tbShtDetails;
 {Create the delivery narrative form}
  PBPODelivNotesFrm.bAllow_Upd := True;
  if UsesStock then
    begin
      iDefWarehouse := dmBroker.qryCompany.FieldBYName('Default_Warehouse').AsInteger; {Setup titles}
      storeDBLookUpComboBox.keyvalue := idefWarehouse;
      lotsinuse:= false;
      With dtmdlStockMove.GetStoreSQL do
        begin
        close;
        ParamByname('Part_Store').AsInteger := iDefWarehouse;
        open;
        if not eof then
          lotsinuse := (FieldByName('Stock_Lots_In_Use').AsString = 'Y')
        end;
    end;

  if FFuncMode = poAdd then
    Caption := 'Add a new delivery'
  else
    if FFuncMode = poChange then
      Caption := 'Change delivery details'
    else
      if FFuncMode = poDelete then
        Caption := 'Delete delivery details'
      else
        if FFuncMode = poView then
          Caption := 'View delivery details';

  {Set labels for Bin location grid}
  with sgBins do
    begin
      cells[0,0] := 'Bin Location';
      cells[1,0] := 'Delivered';
      cells[2,0] := 'Picked';
      cells[3,0] := 'In Stock';
      cells[4,0] := 'Boxes';
    end;

  {Set labels for Call Off location grid}
  with sgPick do
    begin
      cells[0,0] := 'Stock Location';
      cells[1,0] := 'Bin Location';
      cells[2,0] := 'Qty in Bin';
      cells[3,0] := 'Qty to Pick';
    end;

  with sgStock do
    begin
      cells[0,0] := 'Bin Location';
      cells[1,0] := 'Quantity';
      cells[2,0] := 'Pack size';
      cells[3,0] := 'Pack cost';
      cells[4,0] := 'Numbered from';
      cells[5,0] := 'Numbered to';

      if not bNumbered then
        begin
          colwidths[4] := -1;
          colwidths[5] := -1;
        end;
    end;
  {Set the Delivery Via check box}
  with PBPODM do
    begin
      GetDelivDescr(0, 0, 4);
      DeliverViaChk.Caption := 'Deliver via ' + AddrSRC.DataSet.fieldbyname('Name').asstring;
    end;

  if FFuncMode = poAdd then
  begin
    {Empty details}
    AddrTypeRadGrp.ItemIndex := 4;
    NameEdit.Text := '';
    BranchNameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
    CountyEdit.Text := '';
    DatePointEdit.Text := PBDateStr(Datepoint);
    CustReqDAteEdit.text := PBDateStr(Datepoint);
    DeliveryDateEdit.Text := PBDateStr(Date);
    QtyToDeliverMemo.Text := '';
    QtyDeliveredMemo.Text := '0';
    QtyInvoicedMemo.Text := '0';
    NoOfBoxesMemo.Text := '';
    boxqtyMemo.Text := 'TBA';
    weightMemo.Text := '';
    dblkpCourierService.KeyValue := 0;
    dblkpPackageType.KeyValue := 0;
  //  DelInstructMemo.Text := '';
  end
  else
    begin
      DeliveryToStockChk.checked := false;
      {Get the apppropriate address and display it}
      DatePointEdit.Text := PBDateStr(DatePoint);
      CustReqDateEdit.Text := PBDateStr(GoodsRequiredbyCust);

      edtFormRef.text := PBPODM.GetFormRef(iFormReference);
      edtStockRef.text := PBPODM.GetStockRef(iFormReference);

      if bNumbered then
        bNumbered := PBPODM.IsPartNumbered(edtStockRef.text);

      QtyToDeliverMemo.Text := PBFloatStr(QtyToDeliver);
      QtyDeliveredMemo.Text := PBFloatStr(QtyDelivered);
      QtyInvoicedMemo.Text := PBFloatStr(QtyInvoiced);
      NoOfBoxesMemo.Text := formatfloat('##0',NoOfBoxes);
      BoxQtyMemo.text := FormsperBox;
      DelInstructMemo.Text := Instructions;

      weightMemo.Text := PBFloatStr(Weight);
      dblkpCourierService.KeyValue := Service;
      dblkpPackageType.KeyValue := PackType;

      FCompanyBranch := CompanyBranchCode;
      FCustomer := CustomerCode;
      CustomerBranch := BranchNoZero;
      FSupplier := SupplierCode;
      SupplierBranch := BranchNo;
      FRep := RepCode;
      FAdHocAddress := AdHocAddressCode;
      if FCustomer <> 0 then
        AddrTypeRadGrp.ItemIndex := 3
      else
        if FSupplier <> 0 then
          AddrTypeRadGrp.ItemIndex := 1
        else
          if FRep <> 0 then
            AddrTypeRadGrp.ItemIndex := 2
          else
            if FAdHocAddress <> 0 then
              AddrTypeRadGrp.ItemIndex := 0
            else
              AddrTypeRadGrp.ItemIndex := 4;
      ShowAddress(Self);
      if DeliverViaCompany = 'Y' then
        DeliverViaChk.Checked := true;

      if DeliveryToStock = 'Y' then
        DeliveryToStockChk.Checked := true
      else
        DeliveryToStockChk.Checked := false;

      if InvoiceUpfront = 'Y' then
        chkbxInvoice.checked := true
      else
        chkbxInvoice.checked := false;

      if DeliveryDate = '' then
        DeliveryDateEdit.Text := ''
      else
        DeliveryDateEdit.Text := PBDateStr(DeliveryDate);

(*      DeliveryDateEdit.ReadOnly := (DeliveryDateEdit.Text <> '') and
                                   UsesStock;
*)
      {Show the stock locations}
      if frac(PONumber) = 0 then
        ShowLocations(self)
      else
        ShowPickLocations(self);

      if usesStock then
        With dtmdlStockMove.GetStoresSQL do
        begin
          Close ;
          Open ;
        end;
    end;

  //See if there's any versions asscoaited with this PO
  if dmBroker.AllowStockVersions then
    begin
      with qryVersions do
        begin
          close;
          parambyname('Purchase_Order').asfloat := PONumber;
          open;
          if recordcount > 0 then
            begin
              dblkpVersions.Visible := true;
              btnFormRef.Visible := false;
              edtStockRef.Visible := false;
              edtFormRef.Text := '';
            end
          else
            begin
              dblkpVersions.Visible := false;
              btnFormRef.Visible := true;
              edtStockRef.Visible := true;
            end;
        end;
    end;

  if CourierCode <> 0 then
    begin
      {Get Courier Service}
      with PBPODM.qryCourierService do
        begin
          close;
          parambyname('Courier').asinteger := CourierCode;
          open;
          lblCourier.Caption := 'Courier: ' + fieldbyname('Courier_Name').asstring;
        end;

      {Get Package Type}
      with PBPODM.qryPackageType do
        begin
          close;
          open;
        end;
    end;

  {Enable or disable the buttons}
  self.tbshtDetails.Enabled := not CharInSet(FFuncMode, [poDelete, poView]);
  self.QtysGrpBox.Enabled := not CharInSet(FFuncMode, [poDelete, poRestrict]);

  {Disable changing if using Stock system and Delivery has been made}
  DelLabel.Visible := (FFuncMode = poDelete);
  RadioActive := false;
  AddrTypeRadGrpClick(Self);
  RadioActive := true;
//  OKBitBtn.Visible := (FFuncMode <> poView);
  DeliverytoStockChkClick(self);

  if (bNewStock or bOldStock) and (DeliveryDateEdit.Text <> '') then
    begin
      tbshtDetails.Enabled :=  false;
      pnlFormRef.enabled := false;
      bView := true;
    end;

  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  if  (DeliveryToStockChk.checked) and
      not (bNewStock) and
      (DeliveryDateEdit.text <> '') then
    begin
      OKBitBtn.enabled := (NameEdit.Text <> '') and
          (DatePointEdit.Text <> '') and
          (CustReqDateEdit.Text <> '') and
          (QtyToDeliverMemo.Text <> '') and
          (QtyDeliveredMemo.Text <> '') and
          (NoOfBoxesMemo.Text <> '') and
          (QtyInvoicedMemo.Text <> '') and
          (edtStockRef.text <> '');
    end
  else
  if  (DeliveryToStockChk.Checked) and
      (bNewStock) and
      (DeliveryDateEdit.text <> '')  then
    begin
      OKBitBtn.enabled := (NameEdit.Text <> '') and
          (DatePointEdit.Text <> '') and
          (CustReqDateEdit.Text <> '') and
          (QtyToDeliverMemo.Text <> '') and
          (QtyDeliveredMemo.Text <> '') and
          (NoOfBoxesMemo.Text <> '') and
          (QtyInvoicedMemo.Text <> '') and
          (edtStockRef.text <> '') and
          (MemQtyToStock.Text = '0');
    end
  else
  if  (frac(PONumber) <> 0) and
      not (bNewStock) and
      (DeliveryDateEdit.text <> '') then
    begin
      OKBitBtn.enabled := (NameEdit.Text <> '') and
          (DatePointEdit.Text <> '') and
          (CustReqDateEdit.Text <> '') and
          (QtyToDeliverMemo.Text <> '') and
          (QtyDeliveredMemo.Text <> '') and
          (NoOfBoxesMemo.Text <> '') and
          (QtyInvoicedMemo.Text <> '') and
          (edtStockRef.text <> '');
    end
  else
    begin
      OKBitBtn.Enabled := (NameEdit.Text <> '') and
          (DatePointEdit.Text <> '') and
          (CustReqDateEdit.Text <> '') and
          (QtyToDeliverMemo.Text <> '') and
          (QtyDeliveredMemo.Text <> '') and
          (NoOfBoxesMemo.Text <> '') and
          (QtyInvoicedMemo.Text <> '');
    end;
end;

procedure TPBMaintDelivFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintDelivFrm.UpdateVersions;
begin
  with qryUpPOVersions do
    begin
      Close ;
        parambyname('Purchase_Order').Asfloat := PONumber;
        parambyname('Line').asinteger := 1;
        paramByName('Stock_Code_no').AsInteger := dtsVersions.DataSet.FieldByName('Stock_Code_no').Asinteger;
        ParamByName('Quantity_Delivered').AsInteger := PBFloatStr(QtyDeliveredMemo.Text);
        ExecSQL ;
      end;
end;

procedure TPBMaintDelivFrm.UpdateDelivery;
begin
    QtyToDeliver := PBFloatStr(QtyToDeliverMemo.Text);
    QtyDelivered := PBFloatStr(QtyDeliveredMemo.Text);
    QtyInvoiced := PBFloatStr(QtyInvoicedMemo.Text);
    DatePoint := PBDateStr(DatePointEdit.Text);
    GoodsRequiredbyCust := PBDateStr(CustReqDateEdit.Text);

    if DeliveryDateEdit.text = '' then
      begin
        DeliveryDate := '';
        QtyDelivered := 0;
        QtyInvoiced := 0;
      end
    else
      DeliveryDate := PBDateStr(DeliveryDateEdit.Text);
    NoOfBoxes := PBIntStr(NoOfBoxesMemo.Text);

//    FormsPerBox := PBIntStr(BoxQtyMemo.Text);

    PackType := dblkpPackageType.KeyValue;
    Weight := PBfloatstr(WeightMemo.text);
    Courier := CourierCode;
    Service := dblkpCourierService.KeyValue;

    Instructions := DelInstructMemo.Text;

    {Determine whether to Deliver to Company}
    if DeliverViaChk.checked then
      DeliverViaCompany := 'Y'
    else
      DeliverViaCompany := 'N';

    {Set Delivered to stock}
    if DeliveryToStockChk.checked then
      DeliveryToStock := 'Y'
    else
      DeliveryToStock := 'N';

    {Set invoice up front}
    if DeliveryToStockChk.checked then
      begin
        if chkbxInvoice.checked then
          invoiceupfront := 'Y'
        else
          invoiceupfront := 'N';
      end
    else
      invoiceupfront := 'N';

    { Clear the address fields before setting choice }
    AdHocAddressCode := 0;
    SupplierCode := 0;
    BranchNo := 0;
    CustomerCode := 0;
    BranchNoZero := 0;
    RepCode := 0;
    CompanyBranchCode := 0;
    FAO := '';
    case AddrTypeRadGrp.ItemIndex of
      0: AdHocAddressCode := FAdHocAddress;
      1:
        begin
          SupplierCode := FSupplier;
          BranchNo := SupplierBranch;
        end;
      2: RepCode := FRep;
      3:
        begin
          CustomerCode := FCustomer;
          BranchNoZero := CustomerBranch;
          FAO := edtFAO.text;
        end;
      else
        CompanyBranchCode := FCompanyBranch;
    end;
end;

procedure TPBMaintDelivFrm.CreatePODelivery(tempPO: real; tempDelivery,
  tempQty: integer);
var
  DeliveryNo: integer;
  Branch: integer;
begin
  {Get the last delivery to check for company delivery branch}
  with qryGetPODelivery do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;
      Branch := fieldbyname('Company_Branch').asinteger;
    end;

  {get the next Delivery Number}
  with qryGetNextPODelivery do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      open;

      DeliveryNo := fieldbyname('Last_Delivery').asinteger + 1;
    end;

  with qryAddPODelivery do
    begin
      close;
      parambyname('Purchase_order').asfloat := tempPO;
      parambyname('Line').asinteger := 1;
      parambyname('Delivery_no').asinteger := DeliveryNo;
      parambyname('Qty_To_Deliver').asinteger := tempQty;
      parambyname('Qty_Delivered').asinteger := 0;
      parambyname('Qty_Invoiced').asinteger := 0;
      parambyname('Date_Point').asdatetime := date;
      parambyname('Company_Branch').asinteger := Branch;
      parambyname('Delivery_to_Stock').asstring := 'Y';
      execsql;
    end;
end;

procedure TPBMaintDelivFrm.OKBitBtnClick(Sender: TObject);
var
  sInvoicedMethod: string;
  rOrigQty: real;
begin
  if bView then
    begin
    Modalresult := mrCancel;
    exit;
    end;

  if (CourierCode <> 0) and ((dblkpCourierService.Text = '') and (dblkpPackageType.Text = '')) then
    begin
      MessageDlg('Delivery is by courier therefore you must specify the service, package type and weight', mtError,
        [mbAbort], 0);
      exit;
    end;

  if (AddrTypeRadGrp.itemindex = 4) and (DeliverytoStockChk.Checked) and
     (PBPODM.UseCompanyBranch) and (trim(BranchNameEdit.Text) = '') then
    begin
      MessageDlg('When delivering to the company address type, please select a company delivery location', mtError,
        [mbAbort], 0);
      exit;
    end;

  {Check whether the order should be invoiced upfront}
  if  (frac(PONumber) = 0) and (bNewStock) and
      (trim(DeliveryDateEdit.text) <> '') and (deliverytostockChk.checked) then
     begin
      if chkbxInvoice.checked then
        sInvoicedMethod := 'invoiced upfront, '
      else
        sInvoicedMethod := 'invoiced on call off, ';

      if MessageDlg('This stock order will be '+sInvoicedMethod+'is this correct?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
        then exit;
     end;

  if ((DeliveryDate) <> trim(DeliveryDateEdit.text)) then
     begin
      if MessageDlg('Confirm the change to the delivery date', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
        then exit;
     end;

  if (StrToInt(QtyDeliveredMemo.Text) <> 0) and
     (StrToInt(QtyInvoicedMemo.Text) <> 0) and
     (trim(DeliveryDateEdit.text) = '') then
     begin
      MessageDlg('This delivery has already been made, a Delivery Date must be entered', mterror,
        [mbOk], 0);
      exit;
     end;

  if StrToInt(QtyDeliveredMemo.Text) > StrToInt(QtyToDeliverMemo.Text) then
    if MessageDlg('Quantity Delivered is greater than ' +
      'Quantity To Deliver - Continue ?', mtWarning, [mbNo, mbYes], 0) <> mrYes
      then Exit;

  if StrToInt(QtyDeliveredMemo.Text) > StrToInt(QtyToDeliverMemo.Text) then
    if MessageDlg('Quantity Invoiced is greater than ' +
      'Quantity To Deliver - Continue ?', mtWarning, [mbNo, mbYes], 0) <> mrYes
      then Exit;

  {Check quantity allocated to bins}
  if (frac(PONumber) = 0) and
     (strtoint(QtyToDeliverMemo.text) <> GetTotalBinQty) and
     (GetTotalBinQty <> 0) then
     begin
      if MessageDlg('Quantity allocated to Bins does not equal Quantity Delivered, continue?', mtWarning,
        [mbYes, mbNo], 1) <> mrYes then
        exit;
     end;

  {Check Picking Qty}
  if (frac(PONumber) <> 0) and
     (strtoint(QtyToDeliverMemo.text) <> GetTotalPickQty) and
     (sgPick.cells[0,1] <> '') and
     (DeliveryDateEdit.text <> '') then
     begin
      if MessageDlg('Quantity to Pick does not equal Quantity Delivered, continue?', mtWarning,
        [mbYes, mbNo], 1) <> mrYes then
        exit;
     end;

  ResetQty := False;
  if ((ffuncMode = PoChange) and (OrigOrdQty <> StrtoInt(QtytoDeliverMemo.Text)) and (dblkpVersions.Text = '')) then
    begin
      if OktoReset then
      begin
      if MessageDlg('Do you wish to amend the original order quantity', mtConfirmation, [mbYes, mbNo], 0) <> mrYes
        then resetqty := False
      else
        resetQty := True;
      end;
    end;

  if FFuncMode <> poDelete then
  begin
    //save the original quantity
    rOrigQty := QtyToDeliver;

    UpdateDelivery;
    // update the purchase order version details
    if dblkpVersions.Text <> '' then
      begin
        if (rOrigQty > StrtoInt(QtytoDeliverMemo.Text)) and  (StrtoInt(QtytoDeliverMemo.Text) > 0) then
          CreatePODelivery(PONumber, iDelivLine, (trunc(rOrigQty)-Strtoint(QtytoDeliverMemo.Text)));
        UpdateVersions;
      end;
    if (bNewStock) and (Deliverydate <> '') then
      begin
        TransferStock;
      end;
  end
  else
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
  end;

  Modalresult := mrOK;
  bOK := True;
end;

procedure TPBMaintDelivFrm.ValidateQty(Sender: TObject);
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
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintDelivFrm.VATDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.ShowPickLocations(Sender: TObject);
var
  icount: integer;
  iDelivery, iLocation, iQtyPicked: integer;
//  iQtyToPick: integer;
begin
  with PBPODM.GetPickLocsSQL do
    begin
      close;
      parambyname('Purchase_order').asfloat := rOrigOrder;
      parambyname('Line').asinteger := iOrigLine;
      open;

      icount := 0;
      {Determine how much needs to be picked which hasn't already been specified}
//      iQtytoPick := strtoint(QtytoDeliverMemo.text) - PBPODM.GetTotalPickQty(PONumber, iLine, iDelivLine);

      first;

      if recordcount > 0 then
        sgPick.rowcount := recordcount + 1;
      while eof <> true do
        begin
          inc(icount);

          iDelivery := fieldbyname('Delivery_no').asinteger;
          iLocation := fieldbyname('Location_no').asinteger;
          iQtyPicked := PBPODM.GetPickQuantity(rOrigOrder,iOrigLine,iDelivery,iLocation,PONumber, iLine, iDelivLine);

          Pickarray[icount,1] := fieldbyname('Purchase_Order').asstring;
          Pickarray[icount,2] := fieldbyname('Line').asstring;
          Pickarray[icount,3] := fieldbyname('Delivery_no').asstring;
          Pickarray[icount,4] := fieldbyname('Location_no').asstring;
          Pickarray[icount,5] := fieldbyname('Quantity').asstring;
          Pickarray[icount,6] := fieldbyname('Quantity_Allocated').asstring;
          Pickarray[icount,7] := inttostr(iQtyPicked); {Original value}

          sgPick.cells[0,icount] := fieldbyname('Stock_Location_Desc').asstring;
          sgPick.cells[1,icount] := fieldbyname('Description').asstring;
          sgPick.cells[2,icount] := inttostr(fieldbyname('Quantity').asinteger -
                                    fieldbyname('Quantity_allocated').asinteger +
                                    iQtyPicked);
(*          if iQtyPicked = 0 then
            begin
            {Set default picking values}
            if iQtytoPick <= strtoint(sgPick.cells[2,icount]) then
              begin
              sgPick.cells[3,icount] := inttostr(iQtytoPick);
              iQtytoPick := 0;
              end
            else
              begin
              sgPick.cells[3,icount] := sgPick.cells[2,icount];
              iQtytoPick := (iQtytoPick - strtoint(sgPick.cells[2,icount]));
              end;
            end
          else
*)
          sgPick.cells[3,icount] := inttostr(iQtyPicked);

          Pickarray[icount,8] := sgPick.cells[3,icount];

          next;
        end;
    end;
end;


procedure TPBMaintDelivFrm.ShowLocations(Sender: TObject);
var
  icount: integer;
begin
  with PBPODM.GetDelivLocsSQL do
    begin
      close;
      parambyname('Purchase_order').asfloat := PONumber;
      parambyname('Line').asinteger := iLine;
      parambyname('Delivery_no').asinteger := iDelivLine;
      open;

      icount := 0;
      first;

      if recordcount > 0 then
        sgBins.rowcount := recordcount + 1;
      while eof <> true do
        begin
          inc(icount);
          sgBins.cells[0,icount] := fieldbyname('Description').asstring;
          sgBins.cells[1,icount] := fieldbyname('Quantity').asstring;
          sgBins.cells[2,icount] := fieldbyname('Quantity_Allocated').asstring;
          sgBins.cells[3,icount] := inttostr(fieldbyname('Quantity').asinteger-fieldbyname('Quantity_Allocated').asinteger);
          sgBins.cells[4,icount] := inttostr(GetBoxCount(fieldbyname('Quantity').asinteger-fieldbyname('Quantity_Allocated').asinteger));
          sgBins.cells[5,icount] := 'c';
          next;
        end;
    end;
end;

procedure TPBMaintDelivFrm.ShowAddress(Sender: TObject);
begin
  {Diplay the address on-screen}
  with PBPODM do
    case AddrTypeRadGrp.ItemIndex of
      0: GetDelivDescr(FAdHocAddress, 0, 0);
      1: GetDelivDescr(FSupplier, SupplierBranch, 1);
      2: GetDelivDescr(FRep, 0, 2);
      3: GetDelivDescr(FCustomer, CustomerBranch, 3);
      4: GetDelivDescr(0, CompanyBranch, 4);
    end;
  with PBPODM.AddrSRC.DataSet do
  begin
    NameEdit.Text := FieldByName('Name').AsString;
    if (AddrTypeRadGrp.ItemIndex = 1) or (AddrTypeRadGrp.ItemIndex = 3) or (AddrTypeRadGrp.ItemIndex = 4) then
      BranchNameEdit.Text := FieldByName('Branch_Name').AsString;
    edtFAO.text := self.FAO;
    BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
    StreetEdit.Text := FieldByName('Street').AsString;
    LocaleEdit.Text := FieldByName('Locale').AsString;
    TownEdit.Text := FieldByName('Town').AsString;
    PostCodeEdit.Text := FieldByName('PostCode').AsString;
    CountyEdit.Text := FieldByName('County').AsString;
  end;
    with PBPODM do
      case AddrTypeRadGrp.ItemIndex of
      0: PBPODelivNotesFrm.LoadMemoData(GetDelivNarr(atAdHoc, FAdHocAddress, 0));
      3: PBPODelivNotesFrm.LoadMemoData(GetDelivNarr(atCustomer, FCustomer, CustomerBranch));
      4: PBPODelivNotesFrm.LoadMemoData(GetDelivNarr(atCompany, 0, 0));
      else PBPODelivNotesFrm.LoadMemoData(0);
    end;
end;

procedure TPBMaintDelivFrm.DatePointBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DatePointEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      DatePointEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintDelivFrm.AddrTypeRadGrpClick(Sender: TObject);
begin
  {Default the Delivery to stock field to false}
  if RadioActive then
    DeliveryToStockChk.checked := false;
  {Setup the address box}
  self.edtFAO.Visible := false;
  lblFAO.Visible := false;
  btnLUContact.Visible := false;
  case AddrTypeRadGrp.ItemIndex of
    0:
      begin
        AddrTypeLabel.Caption := 'Ad Hoc';
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
      end;
    1:
      begin
        AddrTypeLabel.Caption := 'Supplier';
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
      end;
    2:
      begin
        AddrTypeLabel.Caption := 'Rep';
        BranchNameLabel.Visible := False;
        BranchNameEdit.Visible := False;
      end;
    3:
      begin
        AddrTypeLabel.Caption := 'Customer';
        BranchNameLabel.Visible := True;
        BranchNameEdit.Visible := True;
        self.edtFAO.Visible := true;
        lblFAO.Visible := true;
        btnLUContact.Visible := true;
        
        if self.Customer = 0 then
        begin
          self.Customer := self.iCustomer;

          if (FAO = '') and (not self.Focused) then
            FAO := self.OrderContact;
        end;
      end;
    4:
      begin
        AddrTypeLabel.Caption := 'Company';
        BranchNameLabel.Visible := PBPODM.UseCompanyBranch;
        BranchNameEdit.Visible := PBPODM.UseCompanyBranch;
        if RadioActive then
          DeliveryToStockChk.checked := true;
      end;
  end;
//  SearchBtn.Enabled := (AddrTypeRadGrp.ItemIndex <> 4);
  ShowAddress(Self);
  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.SearchBtnClick(Sender: TObject);
begin
  {Access the searches}
  case AddrTypeRadGrp.ItemIndex of
    0:
      begin
        PBLUAdHocFrm := TPBLUAdHocFrm.Create(Self);
        try
          PBLUAdHocFrm.bIs_Lookup := True;
          PBLUAdHocFrm.bAllow_Upd := True;
          PBLUAdHocFrm.SelCode := FAdHocAddress;
          PBLUAdHocFrm.ShowModal;
          if PBLUAdHocFrm.Selected then
            FAdHocAddress := PBLUAdHocFrm.SelCode;
        finally
          PBLUAdHocFrm.Free;
        end;
      end;
    1:
      begin
        PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
        try
          PBLUSuppFrm.bIs_Lookup := True;
          PBLUSuppFrm.bAllow_Upd := False;
          PBLUSuppFrm.bSel_Branch := True;
          PBLUSuppFrm.SelCode := FSupplier;
          PBLUSuppFrm.SelBranch := SupplierBranch;
          PBLUSuppFrm.ShowModal;
          if PBLUSuppFrm.Selected then
          begin
            FSupplier := PBLUSuppFrm.SelCode;
            SupplierBranch := PBLUSuppFrm.SelBranch;
          end;
        finally
          PBLUSuppFrm.Free;
        end;
      end;
    2:
      begin
        PBLURepFrm := TPBLURepFrm.Create(Self);
        try
          PBLURepFrm.bIs_Lookup := True;
          PBLURepFrm.bAllow_Upd := False;
          PBLURepFrm.SelCode := FSupplier;
          PBLURepFrm.ShowModal;
          if PBLURepFrm.Selected then
            FRep := PBLURepFrm.SelCode;
        finally
          PBLURepFrm.Free;
        end;
      end;
    3:
      begin
        PBLUCustFrm := TPBLUCustFrm.Create(Self);
        try
          PBLUCustFrm.bIs_Lookup := True;
          PBLUCustFrm.bAllow_Upd := False;
          PBLUCustFrm.bSel_Branch := True;
          PBLUCustFrm.SelCode := FCustomer;
          PBLUCustFrm.SelBranch := CustomerBranch;
          PBLUCustFrm.ShowModal;
          if PBLUCustFrm.Selected then
          begin
            FCustomer := PBLUCustFrm.SelCode;
            CustomerBranch := PBLUCustFrm.SelBranch;
            edtFAO.text := '';
            self.FAO := '';
          end;
        finally
          PBLUCustFrm.Free;
        end;
      end;
    4:
      begin
        PBLUCompBranchFrm := TPBLUCompBranchFrm.Create(Self);
        try
          PBLUCompBranchFrm.bIs_Lookup := True;
          PBLUCompBranchFrm.bAllow_Upd := False;
          PBLUCompBranchFrm.SelCode := FCompanyBranch;
          PBLUCompBranchFrm.ShowModal;
          if PBLUCompBranchFrm.Selected then
          begin
            FCompanyBranch := PBLUCompBranchFrm.SelCode;
            edtFAO.Text := '';
          end;
        finally
          PBLUCompBranchFrm.Free;
        end;
      end;
  end;
  ShowAddress(Self);
  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.SetNoDelInstruct(const Value: Boolean);
begin
  FNoDelInstruct := Value;
  if Value then
  begin
    DelInstructPanel.Hide;
//    DetsGrpBox.Height := DetsGrpBox.Height - DelInstructPanel.Height;
    Height := Height - DelInstructPanel.Height;
  end;
end;

procedure TPBMaintDelivFrm.QtyToDeliverMemoKeyPress(
  Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintDelivFrm.SetFormsPerBox(const Value: string);
begin
  FFormsPerBox := Value;
end;

procedure TPBMaintDelivFrm.QtyToDeliverMemoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  iBoxes: integer;
begin
  {Try and determine how many boxes if Adding Delivery}
  try
    iBoxes := strtoint(QtyToDeliverMemo.Text) div strtoint(FormsPerBox);
    if iBoxes < 1 then
      NoofBoxesMemo.Text := inttostr(1)
    else
      NoofBoxesMemo.Text := inttostr(iBoxes);
  except
    NoofBoxesMemo.Text := '1'
  end;
end;

procedure TPBMaintDelivFrm.SetDatePoint(const Value: string);
begin
  FDatePoint := Value;
end;

procedure TPBMaintDelivFrm.SetInstructions(const Value: string);
begin
  FInstructions := Value;
end;

procedure TPBMaintDelivFrm.SetNoOfBoxes(const Value: integer);
begin
  FNoOfBoxes := Value;
end;

procedure TPBMaintDelivFrm.SetQtyDelivered(const Value: real);
begin
  FQtyDelivered := Value;
end;

procedure TPBMaintDelivFrm.SetQtyInvoiced(const Value: real);
begin
  FQtyInvoiced := Value;
end;

procedure TPBMaintDelivFrm.SetQtyToDeliver(const Value: real);
begin
  FQtyToDeliver := Value;
end;

procedure TPBMaintDelivFrm.SetDeliverViaCompany(const Value: string);
begin
  FDeliverViaCompany := Value;
end;

procedure TPBMaintDelivFrm.SetBranchNo(const Value: integer);
begin
  FBranchNo := Value;
end;

procedure TPBMaintDelivFrm.SetBranchNoZero(const Value: integer);
begin
  FBranchNoZero := Value;
end;

procedure TPBMaintDelivFrm.SetCustomerCode(const Value: integer);
begin
  FCustomerCode := Value;
end;

procedure TPBMaintDelivFrm.SetSupplierCode(const Value: integer);
begin
  FSupplierCode := Value;
end;

procedure TPBMaintDelivFrm.DeliveryDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
  sdate: string;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      if trim(DeliveryDateEdit.text) = '' then
        DateSelV5Form.Date := date
      else
        DateSelV5Form.Date := pbDatestr(DeliveryDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      sdate := PBDateStr(DateSelV5Form.Date);
(*      if PBDateStr(sDate) > date then
        begin
          MessageDlg('Delivery date cannot be a future date', mtError, [mbOk], 0);
          DeliveryDateEdit.SetFocus;
          Exit;
        end;
*)
      DeliveryDateEdit.Text := PBDateStr(DateSelV5Form.Date);
      QtyDeliveredMemo.text := QtyToDeliverMemo.text;
    end;
  finally
    DateSelV5Form.Free;
  end;
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
end;

procedure TPBMaintDelivFrm.DeliveryDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
  TempStr: string;
begin
  {Don't check if blank}
  if DeliveryDateEdit.text = '' then exit;

  try
    NewDate := StrToDate(DeliveryDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DeliveryDateEdit.SetFocus;
      Exit;
    end;
  end;
(*  TempStr := Activecontrol.Name;
  if tempStr <> 'DeliveryDateBtn' then
    begin
      if (NewDate > date) and (FFuncMode <> poView) and (bview = false) then
      begin
        MessageDlg('Delivery Date cannot be in the future', mtError, [mbOk], 0);
        DeliveryDateEdit.SetFocus;
        Exit;
      end;
    end;
*)
  DeliveryDateEdit.Text := PBDatestr(NewDate);
  QtyDeliveredMemo.text := QtyToDeliverMemo.text;
end;

procedure TPBMaintDelivFrm.DatePointEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DatePointEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DatePointEdit.SetFocus;
      Exit;
    end;
  end;

  DatePointEdit.Text := PBDatestr(NewDate);
end;

procedure TPBMaintDelivFrm.SetRepCode(const Value: integer);
begin
  FRepCode := Value;
end;

procedure TPBMaintDelivFrm.SetAdhocAddressCode(const Value: integer);
begin
  FAdhocAddressCode := Value;
end;

procedure TPBMaintDelivFrm.SetDeliveryToStock(const Value: string);
begin
  FDeliveryToStock := Value;
end;

procedure TPBMaintDelivFrm.SetRadioActive(const Value: boolean);
begin
  FRadioActive := Value;
end;

procedure TPBMaintDelivFrm.DeliveryToStockChkClick(Sender: TObject);
begin
  chkbxInvoice.enabled := (deliverytostockChk.checked);
  if not chkbxInvoice.enabled then
    chkbxInvoice.checked := false;
(*  tbShtStkLocs.TabVisible := (deliverytostockChk.checked) and (usesStock = True);
  tbshtStock.tabvisible := (deliverytostockChk.checked) and (not tbShtStkLocs.TabVisible);
*)
  tbshtStock.tabvisible := ((deliverytostockChk.checked) and (sgBins.cells[0,1] <> '')) or
                           ((deliverytostockChk.checked) and (not usesStock));

  tbShtStkLocs.TabVisible := (deliverytostockChk.checked) and (usesStock = True) and (not tbshtStock.TabVisible);

  bOldStock := tbshtStock.tabVisible and UsesStock;
  bNewStock := tbShtStkLocs.TabVisible;

  if bNewStock then
    begin
      try
        packsize := strToInt(BoxQtyMemo.Text);
      except
        packsize := dtmdlStockMove.GetPackSize(copy(edtStockRef.text,1 ,15));
      end;
      if (deliveryDate <> '') then
        LoadStockLocsGrid(PONumber, iLine, iDelivLine);
    end;
end;

procedure TPBMaintDelivFrm.btnFormRefClick(Sender: TObject);
begin
  PBLUProductRefFrm := TPBLUProductRefFrm.Create(Self);
  try
    PBLUProductRefFrm.bIs_Lookup := True;
    PBLUProductRefFrm.bAllow_Upd := True;
    PBLUProductRefFrm.iCust := iCustomer;
    PBLUProductRefFrm.sCustName := PBPODM.GetCustName(iCustomer);
    PBLUProductRefFrm.iBranch := iBranch;
    PBLUProductRefFrm.sBranchName := PBPODM.GetCustBranchName(iCustomer,iBranch);
    PBLUProductRefFrm.SelCode := iFormReference;
    PBLUProductRefFrm.ShowModal;
    if PBLUProductRefFrm.bSelected then
    begin
      iFormReference := PBLUProductRefFrm.SelCode;
      edtStockRef.Text := PBLUProductRefFrm.stockCode;
      edtFormRef.Text := PBLUProductRefFrm.SelName;
      bNumbered := PBLUProductRefFrm.bNumbered;
    end;
  finally
    PBLUProductRefFrm.Free;
  end;
  checkOK(self);
end;

procedure TPBMaintDelivFrm.popAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TPBMaintDelivFrm.CallMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  irow: integer;
begin
  PBMaintDelivBinFrm := TPBMaintDelivBinFrm.Create(Self);
  try
    if sTempFuncMode <> 'A' then
      begin
        with sgBins do
          begin
            irow := row;
            PBMaintDelivBinfrm.edtBinLocation.text := cells[0,irow];
            PBMaintDelivBinfrm.memQty.text := cells[1,irow];
            PBMaintDelivBinFrm.rMaxQty := GetOutstandingBinQty + strtoint(cells[1,irow]);
            PBMaintDelivBinFrm.memQtyAlloc.text := cells[2,irow];
//            PBMaintDelivBinFrm.memQtyAlloc.text := inttostr(PBPODM.GetBinAllocatedQty(PONUmber, iLine, iDelivLine, irow));
          end;
      end
    else
      begin
        PBMaintDelivBinfrm.memQty.text := inttostr(GetOutstandingBinQty);
        PBMaintDelivBinFrm.rMaxQty := GetOutstandingBinQty;
        PBMaintDelivBinFrm.memQtyAlloc.text := '0';
        if sgBins.cells[0,1] = '' then
          irow := 1
        else
          irow := sgBins.rowcount;
      end;

    PBMaintDelivBinFrm.FuncMode := sTempFuncMode;
    PBMaintDelivBinFrm.ShowModal;
    bTempOK := PBMaintDelivBinFrm.bOK;

    if bTempOK then
      begin
        with sgBins do
          begin
            cells[0,irow] := PBMaintDelivBinfrm.edtBinLocation.text;
            cells[1,irow] := PBMaintDelivBinfrm.memQty.text;
            cells[2,irow] := PBMaintDelivBinfrm.memQtyAlloc.text;
            cells[3,irow] := inttostr(strtoint(PBMaintDelivBinfrm.memQty.text)-strtoint(PBMaintDelivBinfrm.memQtyAlloc.text));
            cells[4,irow] := inttostr(GetBoxCount(strtoint(PBMaintDelivBinfrm.memQty.text)-strtoint(PBMaintDelivBinfrm.memQtyAlloc.text)));

            if sTempFuncMode = 'A' then
              begin
                rowcount := TotalRowsUsed;
                cells[5,irow] := 'a';
              end
            else
            if (sTempFuncMode = 'C') and
               (cells[5,irow] <> 'a') then
              cells[5,irow] := 'c'
            else
              cells[5,irow] := 'a';
          end;
      end;
  finally
    PBMaintDelivBinFrm.Free;
  end;
end;

function TPBMaintDelivFrm.TotalRowsUsed: integer;
begin
  if sgBins.cells[0,2] = '' then
    result := 2
  else
    result := sgBins.rowcount + 1;
end;

function TPBMaintDelivFrm.GetBoxCount(TempQty: integer): integer;
var
  rCount: real;
begin
  try
    rCount := (TempQty / strtoint(FormsPerBox));
  except
    rcount := 1
  end;
  result := ceil(rCount);
end;

procedure TPBMaintDelivFrm.popChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TPBMaintDelivFrm.popDeleteClick(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg('Really delete these Bin details ?', mtConfirmation,
    [mbNo, mbYes], 0) <> mrYes then
    Exit;

  with sgBins do
    begin
      cells[0,row] := '';
      cells[1,row] := '';
      for i := row to pred(rowcount) do
        begin
          cells[0,i] := cells[0,i+1];
          cells[1,i] := cells[1,i+1];
        end;
      rowcount := totalrowsused;
    end;

end;

procedure TPBMaintDelivFrm.pMnBinsPopup(Sender: TObject);
begin
  popAdd.enabled := (GetOutstandingBinQty <> 0);
  popChange.enabled := (sgBins.cells[0,sgBins.row] <> '');
end;

function TPBMaintDelivFrm.GetOutstandingBinQty: integer;
var
  iTotalBins, i: integer;
begin
  iTotalBins := 0;
  for i := 1 to pred(sgBins.rowcount) do
    begin
      try
        iTotalBins := iTotalBins + strtoint(sgBins.cells[1,i]);
      except
        iTotalBins := iTotalBins + 0
      end;
    end;
  Result := strtoint(QtyToDeliverMemo.text) - iTotalBins;
end;

function TPBMaintDelivFrm.GetTotalBinQty: integer;
var
  iTotalBins, i: integer;
begin
  iTotalBins := 0;
  for i := 1 to pred(sgBins.rowcount) do
    begin
      try
        iTotalBins := iTotalBins + strtoint(sgBins.cells[1,i]);
      except
        iTotalBins := iTotalBins + 0
      end;
    end;
  Result := iTotalBins;
end;

function TPBMaintDelivFrm.GetTotalPickQty: integer;
var
  iTotalBins, i: integer;
begin
  iTotalBins := 0;
  for i := 1 to pred(sgPick.rowcount) do
    begin
      try
        iTotalBins := iTotalBins + strtoint(sgPick.cells[3,i]);
      except
        iTotalBins := iTotalBins + 0
      end;
    end;
  Result := iTotalBins;
end;

procedure TPBMaintDelivFrm.SetCallOff(const Value: boolean);
begin
  FCallOff := Value;
  if FcallOff then
    begin
      chkbxInvoice.visible := false;
      DeliveryToStockChk.Visible := false;
      AddrTypeRadGrp.items.delete(4);
      tbshtCallOffs.tabvisible := true;
    end;
end;

procedure TPBMaintDelivFrm.sgPickDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  WITH Sender AS TStringGrid DO
    BEGIN
      if vRow <> 0 then
        begin
          Canvas.Brush.Color := Color;
        	Canvas.Font.Color  := Font.Color;
        end;
    END;
end;

procedure TPBMaintDelivFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  PBPODelivNotesFrm := TPBDelivNotesFrm.Create(Self);
  tbshtCallOffs.TabVisible := false;
  tbshtSTkLocs.TabVisible := False;
  dtmdlStockMove := TdtmdlStockMove.Create(Self);
  PBPODm := TPBPODm.Create(self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);

  for var i := 0 to sgBins.ColCount-1 do
  begin
    if not (i in [0]) then
      sgBins.ColAlignments[i] := taRightJustify;
  end;

  for var i := 0 to sgPick.ColCount-1 do
    sgPick.ColAlignments[i] := taRightJustify;

  for var i := 0 to SGStock.ColCount-1 do
  begin
    if not (i in [0]) then
      SGStock.ColAlignments[i] := taRightJustify;
  end;
 end;

procedure TPBMaintDelivFrm.sgPickSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
	if aCol = 3 then
   sgPick.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
   sgPick.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TPBMaintDelivFrm.sgPickKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with sgPick do
    begin
      Pickarray[row,8] := cells[3,row];
      memQtyToPick.Text := inttostr(GetTotalPickQty);
    end;
end;

procedure TPBMaintDelivFrm.tbshtCallOffsShow(Sender: TObject);
begin
  memQtyDelivOut.text := QtytoDeliverMemo.text;
  memQtyToPick.Text := inttostr(GetTotalPickQty);
end;

procedure TPBMaintDelivFrm.tbshtStockShow(Sender: TObject);
begin
  memQtyDelivIn.text := QtytoDeliverMemo.text;
end;

procedure TPBMaintDelivFrm.BuildDeliveryLine(Tempqry: TDataSet);
begin
  with PBMaintDelivFrm do
    begin
      DatePoint := PBDateStr(TempQry.fieldbyname('Date_Point').asdatetime);
      if TempQry.fieldbyname('Goods_reqd_by_Customer').asstring = '' then
        GoodsRequiredbyCust := DatePoint
      else
        GoodsRequiredbyCust := PBDateStr(TempQry.fieldbyname('Goods_reqd_by_Customer').asdatetime);
      QtyToDeliver := TempQry.fieldbyname('Qty_to_Deliver').asinteger;
      QtyDelivered := TempQry.fieldbyname('Qty_Delivered').asinteger;
      QtyInvoiced := TempQry.fieldbyname('Qty_Invoiced').asinteger;
      NoofBoxes := TempQry.fieldbyname('No_of_Boxes').asinteger;

      Weight := TempQry.fieldbyname('Delivery_Weight_Kilos').asfloat;
      Service := TempQry.fieldbyname('Service_no').asinteger;
      Courier := TempQry.fieldbyname('Courier').asinteger;
      CourierCode := TempQry.fieldbyname('Supplier_Courier').asinteger;
      PackType := TempQry.fieldbyname('Package_Type').asinteger;

      Instructions := TempQry.fieldbyname('Delivery_Instructions').asstring;
      CustomerCode := TempQry.fieldbyname('Customer').asinteger;
      BranchNoZero := TempQry.fieldbyname('Branch_no0').asinteger;
      Customer := CustomerCode;
      CustomerBranch := BranchNoZero;

      FAO := TempQry.fieldByName('contact_name').asString;
      OrderContact := TempQry.fieldByName('order_contact_name').asString;

      SupplierCode := TempQry.fieldbyname('Supplier').asinteger;
      BranchNo := TempQry.fieldbyname('Branch_no').asinteger;
      RepCode := TempQry.fieldbyname('Rep').asinteger;
      AdHocAddressCode := TempQry.fieldbyname('Ad_hoc_Address').asinteger;
      CompanyBranchCode := TempQry.fieldbyname('Company_Branch').asinteger;
      DeliverViaCompany := TempQry.fieldbyname('Deliver_Via_Company').asstring;
      DeliveryDate := PBDateStr(TempQry.fieldbyname('Date_Deliv_Actual').asdatetime);
      DeliveryToStock := TempQry.fieldbyname('Delivery_to_Stock').asstring;
      FormsPerBox := TempQry.fieldbyname('Forms_per_Box').asstring;
      try
        SetsperPad := TempQry.fieldbyname('No_of_sets').asinteger;
      except
        SetsperPad := 1;
      end;
      InvoiceUpfront := TempQry.fieldbyname('Invoice_upfront').asstring;
      CostPrice := TempQry.fieldbyname('Order_Price').asfloat;
      CostUnitDesc := TempQry.fieldbyname('Price_unit_description').asstring;
      if TempQry.fieldbyname('Price_unit_factor').asinteger = 0 then
        UnitCost := TempQry.fieldbyname('Order_Price').asfloat/TempQry.fieldbyname('Orig_Ord_Qty').asfloat
      else
        UnitCost := TempQry.fieldbyname('Order_Price').asfloat/TempQry.fieldbyname('Price_Unit_Factor').asinteger;
    end;
  lblOrderPrice.caption := 'Order price: '+formatfloat('£#,##0.00',CostPrice)+ ' ' + CostUnitDesc;
  lblOrderQty.caption := 'Order qty: '+ TempQry.fieldbyname('Orig_Ord_Qty').asstring;
end;

procedure TPBMaintDelivFrm.SaveDeliveryLine(TempOrder: real; TempLine, TempDel: integer);
var
  i : integer;
begin
  with dtmdlDeliveries.qryUpDelivery do
    begin
      close;
      for i := 0 to Pred(Params.Count) do
        Params[i].clear;
      parambyname('Purchase_Order').asfloat := TempOrder;
      parambyname('Line').asinteger := TempLine;
      parambyname('Delivery_no').asinteger := TempDel;

      parambyname('Date_Point').asdatetime := PBDateStr(PBMaintDelivFrm.DatePoint);
      parambyname('Goods_reqd_by_customer').asdatetime := PBDateStr(PBMaintDelivFrm.GoodsRequiredbyCust);
      parambyname('Qty_to_Deliver').asfloat := PBMaintDelivFrm.QtyToDeliver;
      parambyname('Qty_Delivered').asfloat := PBMaintDelivFrm.QtyDelivered;
      parambyname('Qty_Invoiced').asfloat := PBMaintDelivFrm.QtyInvoiced;
      parambyname('No_of_Boxes').asinteger := PBMaintDelivFrm.NoofBoxes;

      parambyname('Delivery_Weight_Kilos').asfloat := PBMaintDelivFrm.Weight;

      if PBMaintDelivFrm.courier <> 0 then
        Parambyname('Courier').asinteger := PBMaintDelivFrm.courier
      else
        Parambyname('Courier').clear;

      if PBMaintDelivFrm.service <> 0 then
        Parambyname('Service_no').asinteger := PBMaintDelivFrm.Service
      else
        Parambyname('Service_no').clear;

      if PBMaintDelivFrm.PackType <> 0 then
        Parambyname('Package_Type').asinteger := PBMaintDelivFrm.PackType
      else
        Parambyname('Package_Type').clear;

      parambyname('Instructions').asstring := PBMaintDelivFrm.Instructions;

      if PBMaintDelivFrm.AdHocAddressCode <> 0 then
        ParamByName('Ad_Hoc_Address').AsInteger := PBMaintDelivFrm.AdHocAddressCode;
      if PBMaintDelivFrm.SupplierCode <> 0 then
      begin
        ParamByName('Supplier').AsInteger := PBMaintDelivFrm.SupplierCode;
        ParamByName('Branch_No').AsInteger := PBMaintDelivFrm.BranchNo;
      end;
      if PBMaintDelivFrm.RepCode <> 0 then
        ParamByName('Rep').AsInteger := PBMaintDelivFrm.RepCode;
      if PBMaintDelivFrm.CustomerCode <> 0 then
      begin
        ParamByName('Customer').AsInteger := PBMaintDelivFrm.CustomerCode;
        ParamByName('Branch_No0').AsInteger := PBMaintDelivFrm.BranchNoZero;
      end;
      parambyname('Deliver_Via_Company').asstring := PBMaintDelivFrm.DeliverViaCompany;

      if PBMaintDelivFrm.DeliveryDate = '' then
        parambyname('Date_Deliv_Actual').clear
      else
        parambyname('Date_Deliv_Actual').asdatetime := PBDateStr(PBMaintDelivFrm.DeliveryDate);

      parambyname('Delivery_To_Stock').asstring := PBMaintDelivFrm.DeliveryToStock;

      if PBMaintDelivFrm.DeliveryToStock = 'Y' then
        parambyname('Stock_Location_Desc').asstring := PBMaintDelivFrm.NameEdit.text
      else
        parambyname('Stock_Location_Desc').clear;

      paramByName('FAO').asString := FAO;
      parambyname('Company_Branch').asinteger := PBMaintDelivFrm.CompanyBranchCode;
      execsql;
    end;
end;

procedure TPBMaintDelivFrm.SaveDeliveryLocations(TempOrder: real; TempLine, TempDel: integer);
var
  icount: integer;
begin
  for icount := 1 to pred(PBMaintDelivFrm.sgBins.rowcount) do
    begin
      if PBMaintDelivFrm.sgBins.cells[0,1] = '' then break;
      if PBMaintDelivFrm.sgBins.cells[5,icount] = 'a' then
        begin
          with dtmdlDeliveries.qryAddDelivLocs do
          begin
            close;
            parambyname('Purchase_Order').asfloat := TempOrder;
            parambyname('Line').asinteger := TempLine;
            parambyname('Delivery_no').asinteger := TempDel;
            parambyname('Location_no').asinteger := icount;
            parambyname('Description').asstring := PBMaintDelivFrm.sgBins.cells[0,icount];
            parambyname('Quantity').asinteger := strtoint(PBMaintDelivFrm.sgBins.cells[1,icount]);
            execsql;
          end;
        end
      else
      if PBMaintDelivFrm.sgBins.cells[5,icount] = 'c' then
        begin
          with dtmdlDeliveries.qryUpDelivLocs do
          begin
            close;
            parambyname('Purchase_Order').asfloat := TempOrder;
            parambyname('Line').asinteger := TempLine;
            parambyname('Delivery_no').asinteger := TempDel;
            parambyname('Location_no').asinteger := icount;
            parambyname('Description').asstring := PBMaintDelivFrm.sgBins.cells[0,icount];
            parambyname('Quantity').asinteger := strtoint(PBMaintDelivFrm.sgBins.cells[1,icount]);
            execsql;
          end;
        end

    end;
end;

procedure TPBMaintDelivFrm.SavePickingLocations(TempOrder: real; TempLine, TempDel: integer);
var
  icount: integer;
  rOrder: real;
  iLine, iDelivery, iLocation: integer;
begin
  {Remove all the Picking details}
  with dtmdlDeliveries.qryDelPickLocs do
    begin
      close;
      parambyname('Calloff_Order').asfloat := TempOrder;
      parambyname('Calloff_Line').asinteger := TempLine;
      parambyname('Calloff_Delivery').asinteger := TempDel;
      execsql;
    end;

  {Update the Delivery location details}
  for icount := 1 to 100 do
    begin
      if PBMaintDelivFrm.pickarray[icount,1] = '' then
        break
      else
        begin
          rOrder := StrToFloatDef(PBMaintDelivFrm.pickarray[icount,1], 0, FormatSettings);
          iLine := strtoint(PBMaintDelivFrm.pickarray[icount,2]);
          iDelivery := strtoint(PBMaintDelivFrm.pickarray[icount,3]);
          iLocation := strtoint(PBMaintDelivFrm.pickarray[icount,4]);

          if PBMaintDelivFrm.pickarray[icount,6] = '' then
            PBMaintDelivFrm.pickarray[icount,6] := '0';

          if PBMaintDelivFrm.pickarray[icount,7] = '' then
            PBMaintDelivFrm.pickarray[icount,7] := '0';

          if PBMaintDelivFrm.pickarray[icount,8] = '' then
            PBMaintDelivFrm.pickarray[icount,8] := '0';

          with dtmdlDeliveries.qryUpDelivLocsAlloc do
            begin
              close;
              parambyname('Purchase_Order').asfloat := rOrder;
              parambyname('Line').asinteger := iLine;
              parambyname('Delivery_no').asinteger := iDelivery;
              parambyname('Location_no').asinteger := iLocation;
              parambyname('Quantity_Allocated').asinteger := strtoint(PBMaintDelivFrm.pickarray[icount,6]) +
                                                            strtoint(PBMaintDelivFrm.pickarray[icount,8]) -
                                                            strtoint(PBMaintDelivFrm.pickarray[icount,7]);

              execsql;
            end;
          if PBMaintDelivFrm.pickarray[icount,8] <> '0' then
            begin
            with dtmdlDeliveries.qryAddPickDtls do
              begin
                close;
                parambyname('Purchase_Order').asfloat := rOrder;
                parambyname('Line').asinteger := iLine;
                parambyname('Delivery_no').asinteger := iDelivery;
                parambyname('Location_no').asinteger := iLocation;
                parambyname('Picking_no').asinteger := dtmdlDeliveries.GetNextPickNumber(rOrder,iLine,iDelivery,iLocation);
                parambyname('Calloff_Order').asfloat := TempOrder;
                parambyname('Calloff_Line').asinteger := TempLine;
                parambyname('Calloff_Delivery').asinteger := TempDel;
                parambyname('Quantity_Picked').asinteger := strtoint(PBMaintDelivFrm.pickarray[icount,8]);
                execsql;
              end;
            end;
        end;
    end;
end;

procedure TPBMaintDelivFrm.Adjustment1Click(Sender: TObject);
begin
  CallMaintScreen('T');
end;

procedure TPBMaintDelivFrm.sgPickKeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintDelivFrm.setUsesStock(const Value: boolean);
begin
  fUsesStock := Value;
end;

procedure TPBMaintDelivFrm.TbShtStkLocsShow(Sender: TObject);
begin
(* if (DeliveryDate = '') then
    memQtyToStock.text := QtytoDeliverMemo.text;
 for irow := 0 to pred(pMenuStock.items.count) do
  begin
     pMenuStock.items[irow].enabled := (DeliveryDate = '');
     next;
  end;
*)
  MemQtyToStock.text := formatfloat('#######0',GetOutstandingstockqty) ;
end;

procedure TPBMaintDelivFrm.FormDestroy(Sender: TObject);
begin
  PBPODelivNotesFrm.Free;
  dtmdlStockMove.Free ;
  PBPODm.free;
end;

procedure TPBMaintDelivFrm.StockAddClick(Sender: TObject);
begin
CallStockMaintScreen('A');
CheckOk(Self);
end;

procedure TPBMaintDelivFrm.StockChangeClick(Sender: TObject);
begin
  CallStockMaintScreen('C');
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.StockDelClick(Sender: TObject);
begin
SGStock.cells[1,SGStock.Row] := '0';
SGStock.cells[0,SGStock.Row] := 'Deleted Item';
MemQtyToStock.text := formatfloat('#######0',GetOutstandingstockqty) ;
CheckOk(Self);
end;

procedure TPBMaintDelivFrm.StockShowClick(Sender: TObject);
begin
  PBMntPrtBinFrm := TPBMntPrtBinFrm.Create(Self);
  try
    PBMntPrtBinFrm.bAllow_Upd := False;
    PBMntPrtBinFrm.iStore := StoreDBLookupComboBox.keyvalue;
    PBMntPrtBinFrm.ShowModal;
  finally
    PBMntPrtBinFrm.Free;
  end;
end;

procedure TPBMaintDelivFrm.CallStockMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  irow, BoxQty: integer;
  rCost: real;
begin
  PBDelivStockFrm := TPBDelivStockFrm.Create(Self);
  try
    if sTempFuncMode <> 'A' then
      begin
        with sgStock do
          begin
            irow := row;
            PBDelivStockFrm.rUnitCost := StrToFloatDef(cells[3,irow], 0, FormatSettings) / StrToFloatDef(cells[2,irow], 0, FormatSettings);
            PBDelivStockfrm.BinEdit.text := cells[0,irow];
            PBDelivStockfrm.Memoqty.text := cells[1,irow];
            PBDelivStockfrm.MemoPackSize.text := cells[2,irow];
            PBDelivStockfrm.MemoCost.text := cells[3,irow];
            PBDelivStockfrm.edtNumberFrom.text := cells[4,irow];
            PBDelivStockfrm.edtNumberTo.text := cells[5,irow];
            PBDelivStockFrm.MemoPackSize.Text := intToStr(packsize);
            BoxQty := StrToInt(cells[1,irow]) ;
            packSize := StrToInt(cells[2,irow]) ;
            PBDelivStockFrm.MemoNoOfBoxes.Text := intToStr(boxqty div packsize);

            PBDelivStockFrm.rMaxQty := GetOutstandingStockQty + strtoint(cells[1,irow]);
          end;
      end
    else
      begin
        PBDelivStockFrm.rUnitCost := UnitCost;
        PBDelivStockfrm.MemoQty.text := inttostr(GetOutstandingStockQty);
        rCost := UnitCost * packsize;
        PBDelivStockfrm.MemoCost.text := formatfloat('##0.00',rCost);

        PBDelivStockFrm.rMaxQty := GetOutstandingStockQty;
        if sgStock.cells[0,1] = '' then
          irow := 1
        else
          irow := sgStock.rowcount;
      end;

    PBDelivStockFrm.FuncMode := sTempFuncMode;
    PBDelivStockFrm.Store := StoreDBLookupComboBox.keyvalue;
    PBDelivStockFrm.MemoPackSize.Text := intToStr(packsize);

    BoxQty := StrToInt(PBDelivStockfrm.MemoQty.text) ;
    if packsize > 0 then
      PBDelivStockFrm.MemoNoOfBoxes.Text := intToStr(ceil(boxqty / packsize))
    else
      PBDelivStockFrm.MemoNoOfBoxes.Text := PBDelivStockfrm.MemoQty.text;

    PBDelivStockfrm.Numbered := bNumbered;
    PBDelivStockfrm.SetsperPad := PBMaintDelivFrm.SetsperPad;
    PBDelivStockFrm.ShowModal;
    bTempOK := PBDelivStockFrm.bOK;

    if bTempOK then
      begin
        with sgStock do
          begin
            cells[0,irow] := PBDelivStockfrm.BinEdit.text;
            cells[1,irow] := PBDelivStockfrm.memoQty.text;
            cells[2,irow] := PBDelivStockfrm.memoPackSize.text;
            cells[3,irow] := PBDelivStockfrm.memoCost.text;
            cells[4,irow] := PBDelivStockfrm.edtNumberFrom.text;
            cells[5,irow] := PBDelivStockfrm.edtNumberTo.text;
            if sTempFuncMode = 'A' then
              begin
                rowcount := NoOfStockRows;
//                cells[4,irow] := 'a';
              end;
(*            else
            if (sTempFuncMode = 'C') and
               (cells[4,irow] <> 'a') then
              cells[4,irow] := 'c'
            else
              cells[4,irow] := 'a';
*)
          end;
      end;
  finally
    MemQtyToStock.text := formatfloat('#######0',GetOutstandingstockqty);
    PBDelivStockFrm.Free;

  end;
end;

function TPBMaintDelivFrm.NoOfStockRows: integer;
begin
  if sgStock.cells[0,2] = '' then
    result := 2
  else
    result := sgStock.rowcount + 1;
end;

function TPBMaintDelivFrm.GetOutstandingStockQty: integer;
var
  iTotalStock, i: integer;
begin
  iTotalStock := 0;
  for i := 1 to pred(sgStock.rowcount) do
    begin
      try
        iTotalStock := iTotalStock + strtoint(sgStock.cells[1,i]);
      except
        iTotalStock := iTotalStock + 0
      end;
    end;
  Result := strtoint(QtytoDeliverMemo.text) - iTotalStock;

end;

procedure TPBMaintDelivFrm.setPackSize(const Value: integer);
begin
  fPackSize := Value;
end;

procedure TPBMaintDelivFrm.SGStockDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  WITH Sender AS TStringGrid DO
    BEGIN
      if vRow <> 0 then
        begin
          Canvas.Brush.Color := Color;
        	Canvas.Font.Color  := Font.Color;
        end;
    END;
end;

procedure TPBMaintDelivFrm.TransferStock;
var
irow: integer;
begin
  with QueryGetPOLineDets do
    begin
      Close;
      ParamByName('OrderNo').AsFloat := poNumber;
      ParamByName('OrderLine').AsInteger := iLine;
      Open;
    end;

  with sgstock do
  begin
    CreatePartDetails;
    SetStoreLevels;
    for iRow := 1 to Pred(rowcount) do
      begin
        if cells[1,iRow] = '0' then
          continue;
        CurrRow := iRow;
        UpdateStock;
      next;
      end;
  end;
end;

procedure TPBMaintDelivFrm.CreatePartDetails;
begin
(*  noBoxs := QueryGetPOLineDets.FieldByName('Forms_Per_Box').AsString;
  try
    iBoxQty := StrToInt(noBoxs);
  except
    iBoxQty := 0;
  end;
*)

  iBoxQty := strtoint(sgStock.cells[2,1]);

  with dtmdlStockMove.PriceUnitSQL do
    begin
      close;
      parambyname('Price_Unit').asinteger := QueryGetPOLineDets.FieldByName('Order_unit').AsInteger;
      open;
      ipurchFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;

  if ipurchFactor = 0 then
    begin
    if iBoxQty > 0 then
      Purch_Price := (QueryGetPOLineDets.FieldByName('Order_Price').AsFloat /
                      QueryGetPOLineDets.FieldByName('Quantity').AsInteger) * iBoxQty
    else
      Purch_Price := QueryGetPOLineDets.FieldByName('Order_Price').AsFloat ;
    end
  else
    begin
    if iBoxQty > 0 then
      Purch_Price := (iBoxQty/ipurchfactor)*QueryGetPOLineDets.FieldByName('Order_Price').AsFloat
    else
      Purch_Price := ipurchfactor * QueryGetPOLineDets.FieldByName('Order_Price').AsFloat;
    end;

  with dtmdlStockMove.PriceUnitSQL do
    begin
      close;
      parambyname('Price_Unit').asinteger := QueryGetPOLineDets.FieldByName('Sell_unit').AsInteger;
      open;
      isellFactor := fieldbyname('Price_unit_Factor').asinteger;
    end;

  if isellFactor = 0 then
    begin
    if iBoxQty > 0 then
      Sell_Price := (QueryGetPOLineDets.FieldByName('Selling_Price').AsFloat /
                    QueryGetPOLineDets.FieldByName('Quantity').AsInteger) * iBoxQty
    else
      Sell_Price := QueryGetPOLineDets.FieldByName('Selling_Price').AsFloat ;
    end
  else
    begin
    if iBoxQty > 0 then
      Sell_Price := (iBoxQty/isellfactor)*QueryGetPOLineDets.FieldByName('Selling_Price').AsFloat
    else
      Sell_Price := isellfactor * QueryGetPOLineDets.FieldByName('Selling_Price').AsFloat;
    end;

  if iPurchFactor = 0 then
    iPurchFactor := 1;

  if isellFactor = 0 then
    isellFactor := 1;

  if queryGetPOLineDets.fieldByName('Invoice_Upfront').AsString = 'Y' then
    begin
      sell_price := 0.00;
      purch_price := 0.00;
    end;

  with dtmdlStockMove.CheckPartExistsQuery do
  begin
    Close;
    ParamByName('Part').AsString := copy(edtStockRef.text,1 ,25);
    Open;
    if Recordcount > 0 then
    begin
      with dtmdlStockMove.UpdPartQuery do
      begin
      Close;
      ParamByName('Part').AsString := copy(edtStockRef.text,1 ,25);
      ParamByName('Part_Purchase_Price').AsFloat := Purch_Price;
      if iBoxqty = 0 then
        ParamByName('Purch_Pack_Quantity').AsFloat := ipurchfactor
      else
        ParamByName('Purch_Pack_Quantity').AsFloat := iBoxqty;
      ParamByName('Part_Purchase_Price').AsFloat := Purch_Price;
      if iBoxqty = 0 then
        ParamByName('Purch_Pack_Quantity').AsFloat := ipurchfactor
      else
        ParamByName('Purch_Pack_Quantity').AsFloat := iBoxqty;
      ParamByName('Part_Cost_List').AsFloat := sell_price;
      ParamByName('Part_Cost_Cat').AsFloat := sell_price;
      if iBoxQty = 0 then
        ParamByName('Sell_pack_Quantity').AsFloat := isellFactor
      else
        ParamByName('Sell_Pack_Quantity').AsFloat := iBoxQty ;
      if iBoxQty = 0 then
        iStockPacksize := ipurchfactor
      else
        iStockPackSize := iBoxQty;
      ParambyName('Price_unit').asinteger := QueryGetPOLineDets.FieldByName('Sell_unit').AsInteger;
      ParambyName('Product_Type').asinteger := QueryGetPOLineDets.FieldByName('Product_Type').AsInteger;
      Parambyname('FSC_Material_Claim').asinteger := QueryGetPOLineDets.FieldByName('FSC_Material_Claim').AsInteger;
      Parambyname('FSC_Mixed_Percentage').asfloat := QueryGetPOLineDets.FieldByName('FSC_Mixed_Percentage').Asfloat;
      ExecSQL;
    end;
  end
else
  begin
  with dtmdlStockMove.AddPartQuery do
    begin
      Close;
      ParamByName('Part').AsString := copy(edtStockRef.text,1 ,25);
      ParamByName('Part_Description').AsString := PBPODM.GetFormDesc(iFormReference);
      ParamByName('Part_Cost_List').AsFloat := sell_price;
      ParamByName('Part_Cost_Cat').AsFloat := sell_price;
      ParamByName('VAT').AsInteger := QueryGetPOLineDets.FieldByName('Vat_Code').AsInteger;
      ParamByName('Part_Group').Clear;
      ParamByName('Part_Purchase_Price').AsFloat := Purch_Price;
      ParamByName('Part_Mark_Up_List').AsFloat := 0.00;
      ParamByName('Part_Mark_Up_Cat').AsFloat := 0.00;

      if iBoxqty = 0 then
        ParamByName('Purch_Pack_Quantity').AsFloat := ipurchfactor
      else
        ParamByName('Purch_Pack_Quantity').AsFloat := iBoxqty;
      if iBoxQty = 0 then
        ParamByName('Sell_pack_Quantity').AsFloat := isellFactor
      else
        ParamByName('Sell_Pack_Quantity').AsFloat := iBoxQty ;
      ParamByName('Track_Serial_No').AsString := 'N';
      ParamByName('Auto_Update').AsString := 'N';
      ParamByName('Not_In_Use').AsString := 'N';
      if bNumbered then
        ParamByName('Numbered').asstring := 'Y'
      else
        ParamByName('Numbered').asstring := 'N';

      if iBoxQty = 0 then
        iStockPacksize := ipurchfactor
      else
        iStockPackSize := iBoxQty;
      ParambyName('Customer').asinteger := iCustomer;
      ParambyName('Branch_no').asinteger := iBranch;
      ParambyName('Price_unit').asinteger := QueryGetPOLineDets.FieldByName('Sell_unit').AsInteger;
      ParambyName('Product_Type').asinteger := QueryGetPOLineDets.FieldByName('Product_Type').AsInteger;
      ParambyName('Product_Class').asstring := 'STK';
      Parambyname('Product_ID').asinteger := dmBroker.GetNextProductID;
      Parambyname('FSC_Material_Claim').asinteger := QueryGetPOLineDets.FieldByName('FSC_Material_Claim').AsInteger;
      Parambyname('FSC_Mixed_Percentage').asfloat := QueryGetPOLineDets.FieldByName('FSC_Mixed_Percentage').Asfloat;
      ExecSQL;
    end;
  end;
end;

end;

procedure TPBMaintDelivFrm.UpdateStock;
var
  sTempPart, sTempBin, sTempLot, sTempType, sTempRef, sTempDesc, sInvUpfront : String ;
  sNumberFrom, sNumberTo: string;
  iTempStore, iTempCode, iTempQty, iTempAlloc, iTempPackSize : Integer;
  iNoSets: integer;
  fTempCost : Real;
  sTempDate : TDateTime;
  iPalletID, iProductID: integer;
begin
  iNoSets := PbMaintDelivfrm.SetsperPad;
  sTempDate := PBDateStr(DeliveryDateEdit.Text);
  sTempPart := copy(edtStockRef.text,1 ,25);
  sInvUpfront := PbMaintDelivfrm.InvoiceUpfront;
  iTempStore := StoreDBLookupComboBox.keyvalue;
  sTempBin := SGStock.cells[0,CurrRow];
  sNumberFrom := sgStock.cells[4,CurrRow];
  sNumberTo := sgStock.cells[5,CurrRow];
  sTempLot := '';
  sTempDesc := floattostr(POnumber);
  iPalletID := 0;
  iProductID := dtmdlStockMove.GetProductID(sTempPart);
  if lotsinUse then
    sTempLot := dtmdlStockMove.GetNextLot(sTempPart);

  sTempRef := 'Conf Deliv P/O No. '+FormatFloat('########',POnumber)+'/'+intToStr(iline)+'/'+intToStr(iDelivLine);
(*  if iBoxQty = 0 then
    iTempPackSize := ipurchFactor
  else
    iTempPackSize := iBoxQty;
*)
  iTempPackSize := strtoint(sgStock.cells[2,currRow]);
  iTempAlloc := 0;
  iTempQty := StrToInt(sgStock.cells[1,CurrRow]);

  {If invoice upfront then set cost to zero}
  if trim(sInvUpFront) = 'Y' then
    fTempCost := 0.00
  else
//    fTempCost := (Purch_Price/iTempPackSize)*iTempQty;
    fTempCost := (StrToFloatDef(sgStock.cells[3,currRow], 0, FormatSettings) / iTempPackSize) * iTempQty;

  iTempCode := dtmdlStockMove.GetStoreStock(iTempStore, sTempPart, sTempBin, sTempLot);
 //         if iTempQty <> 0 then
// fTempCost := StStkTkDm.GetStoreStockCost(iTempCode)* iTempQty;
  sTempType := 'G';

  if iTempQty <> 0 then
    begin
      if iTempCode<> 0 then
        dtmdlStockMove.UpdStock(iTempCode,sTempPart,iTempStore,sTempBin,sTempLot,
          sTempType, sTempRef, sTempDate, iTempQty, iTempAlloc,iTempPackSize, fTempcost,
          sTempDesc, sInvUpFront, sNumberFrom, sNumberTo, iNoSets, PONumber, iPalletID, iProductID, 'N')
      else
        begin
//            fTempCost := STStkTkDM.GetNewStoreStockCost(iTempCode, sTempPart)* iTempQty;
          if not bNumbered then
            begin
              sNumberFrom := '';
              sNumberTo := '';
            end;
          dtmdlStockMove.AddStock(sTempPart,iTempStore,sTempBin,sTempLot,
            sTempType, sTempRef, sTempDate, iTempQty, iTempAlloc,iTempPacksize, fTempCost,
            sTempDesc, sInvUpFront, sNumberFrom, sNumberTo, iNoSets, PONumber, iPalletID, 'N');
        end;
     end;
end;

procedure TPBMaintDelivFrm.LoadStockLocsGrid(TempOrder: real; TempLine,
  TempDel: integer);
var
iCount: integer;
istart: integer;
rCost: real;
begin
  For iCount := 1 to sgstock.rowcount do
    begin
      sgStock.cells[0,icount] := '';
      SGStock.cells[1,icount] := '';
      sgStock.cells[2,icount] := '';
      SGStock.cells[3,icount] := '';
      sgStock.cells[4,icount] := '';
      SGStock.cells[5,icount] := '';
    end;
  iCount := 0;
  sgstock.Rowcount := 2;
  With GetMoveRecsSQL do
    begin
      Close;
      ParamByName('MoveRef').AsString := 'Conf Deliv P/O No. '+FormatFloat('########',TempOrder)+'/'+intToStr(TempLine)+'/'+intToStr(TempDel);
      ParamByName('Store').AsInteger := StoreDBLookupComboBox.keyvalue;
      ParamByName('MoveType').AsString := 'G';
      Open;
      if recordcount > 0 then
        sgStock.rowcount := recordcount + 1;
      while not eof do
        begin
          inc(icount);
          SGStock.Cells[0,iCount] := FieldByName('Part_Movement_Bin').AsString;
          SGStock.Cells[1,iCount] := IntToStr(FieldByName('Store_Quantity').AsInteger);

          SGStock.Cells[2,iCount] := FieldByName('Stock_Pack_Quantity').AsString;
          rCost :=  (FieldByName('Store_Cost').Asfloat/
                    ((FieldByName('Store_Quantity').AsInteger/FieldByName('Stock_Pack_Quantity').AsInteger)));

          SGStock.Cells[3,iCount] := formatfloat('£#,##0.00',rCost);
          istart := pos('to',FieldByName('Part_Movement_Notes').AsString);
          SGStock.Cells[4,iCount] := trim(copy(FieldByName('Part_Movement_Notes').AsString,9,(istart-10)));
          SGStock.Cells[5,iCount] := trim(copy(FieldByName('Part_Movement_Notes').AsString,(istart+2),20));
          next;
        end;
    end;
    MemQtyToStock.text := formatfloat('#######0',GetOutstandingstockqty) ;
    StoreDBLookupComboBox.enabled := False;
end;

procedure TPBMaintDelivFrm.pMenuStockPopup(Sender: TObject);
var
  irow: integer;
begin
  for irow := 0 to pred(pMenuStock.items.count) do
    begin
      pMenuStock.items[irow].enabled := (DeliveryDate = '');
      next;
    end;
    pMenuStock.items[1].enabled := (sgStock.cells[0,1] <> '') and (DeliveryDate = '');
    pMenuStock.items[2].enabled := (sgStock.cells[0,2] <> '') and (DeliveryDate = '');
end;

procedure TPBMaintDelivFrm.SetStoreLevels;
begin
with StoreLvlSQL do
  begin
    Close;
    ParamByname('Part').asString := copy(edtStockRef.text,1 ,25);
    Open;
    If (recordcount = 0) then
      with UpdStoreLvlSQL do
      begin
        Close;
        ParamByName('Part').AsString := copy(edtStockRef.text,1 ,25);
        ParamByName('Rep_Store').Clear;
        ParamByName('MinMax_Qty').AsFloat := iStockPacksize;
        ExecSQL;
      end;
  end;
end;

procedure TPBMaintDelivFrm.SetDelivNotes(const Value: string);
begin
  fDelivNotes := Value;
end;

procedure TPBMaintDelivFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TPBMaintDelivFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  PBPODelivNotesFrm.bAllow_Upd := False;
  PBPODelivNotesFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TPBMaintDelivFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintDelivFrm.CheckNotes(Sender: TObject);
begin
  if PBPODelivNotesFrm.CheckNotes(Self) then
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

function TPBMaintDelivFrm.OKToReset: Boolean;
begin
with ChkOneDelivSql do
  begin
    close;
    ParamByName('Purch_Ord').Asfloat := poNumber;
    open;
    Result := ((recordcount = 1) and (fieldbyName('tot_qty').asfloat = 0));
  end;
end;

procedure TPBMaintDelivFrm.ResetOrderqty(TempOrder: real; TempLine,
  TempDel: integer);
begin
 with UpdOrdQtySQL do
    begin
      close;
      parambyname('Purch_Ord').asfloat := TempOrder;
      parambyname('Line').asinteger := TempLine;
      parambyname('deliv_Qty').asfloat := PBMaintDelivFrm.QtyToDeliver;
      execsql;
    end;
end;

procedure TPBMaintDelivFrm.setResetQty(const Value: boolean);
begin
  fResetQty := Value;
end;

procedure TPBMaintDelivFrm.SetOrigOrdQty(const Value: real);
begin
  FOrigOrdQty := Value;
end;

procedure TPBMaintDelivFrm.SGStockDblClick(Sender: TObject);
begin
  if DeliveryDate <> '' then exit;
  with sgStock do
    begin
      if (cells[0,row] <> '') and (row <> 0) then
        StockChangeClick(self);
    end;
end;

procedure TPBMaintDelivFrm.CustReqDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(CustReqDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      CustReqDateEdit.SetFocus;
      Exit;
    end;
  end;

  CustReqDateEdit.Text := PBDatestr(NewDate);
end;

procedure TPBMaintDelivFrm.CustReqDatebtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(CustReqDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      CustReqDateEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintDelivFrm.SetGoodsRequiredbyCust(const Value: string);
begin
  FGoodsRequiredbyCust := Value;
end;

procedure TPBMaintDelivFrm.SetCostPrice(const Value: double);
begin
  FCostPrice := Value;
end;

procedure TPBMaintDelivFrm.SetCostUnitDesc(const Value: string);
begin
  FCostUnitDesc := Value;
end;

procedure TPBMaintDelivFrm.SetUnitCost(const Value: double);
begin
  FUnitCost := Value;
end;

procedure TPBMaintDelivFrm.SetSetsperPad(const Value: integer);
begin
  FSetsperPad := Value;
end;

procedure TPBMaintDelivFrm.SetInvoiceupfront(const Value: string);
begin
  FInvoiceupfront := Value;
end;

procedure TPBMaintDelivFrm.btnLUContactClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := false;

    PBLUCContaFrm.icust := self.Customer;
    PBLUCContaFrm.iBranch := self.BranchNo;
    //PBLUCContaFrm.SelCode := SelectedLine.CustomerContact;
    PBLUCContaFrm.sCustName := NameEdit.Text;
    PBLUCContaFrm.sBranchName := BranchNameEdit.text;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      edtFAO.text := PBLUCContaFrm.SelName;
    end;
  finally
    PBLUCContaFrm.Free;
  end;
end;

procedure TPBMaintDelivFrm.SetFAO(const Value: string);
begin
  FFAO := Value;
end;

procedure TPBMaintDelivFrm.SetOrderContact(const Value: string);
begin
  FOrderContact := Value;
end;

procedure TPBMaintDelivFrm.SetCompanyBranch(const Value: integer);
begin
  FCompanyBranch := Value;
end;

procedure TPBMaintDelivFrm.btnClearClick(Sender: TObject);
begin
  FCompanyBranch := 0;  
  ShowAddress(Self);
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.SetCompanyBranchCode(const Value: integer);
begin
  FCompanyBranchCode := Value;
end;

procedure TPBMaintDelivFrm.SetWeight(const Value: double);
begin
  FWeight := Value;
end;

procedure TPBMaintDelivFrm.SetCourierCode(const Value: integer);
begin
  FCourierCode := Value;
  pnlCourierService.visible := (FCourierCode <> 0);
end;

procedure TPBMaintDelivFrm.SetPackType(const Value: integer);
begin
  FPackType := Value;
end;

procedure TPBMaintDelivFrm.SetService(const Value: integer);
begin
  FService := Value;
end;

procedure TPBMaintDelivFrm.SetCourier(const Value: integer);
begin
  FCourier := Value;
end;

procedure TPBMaintDelivFrm.ValidateQtyto3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQtyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintDelivFrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintDelivFrm.dblkpVersionsClick(Sender: TObject);
begin
  edtStockRef.Text := dtsVersions.DataSet.FieldByName('Stock_Reference').AsString;
  edtFormRef.Text := dtsVersions.DataSet.FieldByName('Form_Reference_ID').AsString;
  qtytodeliverMemo.Text := formatfloat('0',dtsVersions.dataset.fieldbyname('Quantity_Outstanding').asfloat);
end;

end.
