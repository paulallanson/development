unit wtPurchasesDM;

interface

uses
  SysUtils, Classes, DB, Math, Forms, wtNotesDM, wtSupplierDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TpopMode   = (popAdd, popChange, popDelete, popCopy, popRaise, popView);
  TpolMode   = (polAdd, polChange, polDelete, polCopy, polView);
  TpoevMode   = (poevAdd, poevChange, poevDelete, poevView);

  TdtmdlPurchaseOrder = class(TDataModule)
    qryAllPurchases: TFDQuery;
    dtsAllPurchases: TDataSource;
    qryPOHeader: TFDQuery;
    qryOperator: TFDQuery;
    dtsOperator: TDataSource;
    qryZero: TFDQuery;
    qryGetSupplier: TFDQuery;
    qryPOAddHeader: TFDQuery;
    qryPOUpHeader: TFDQuery;
    qryPOGetLast: TFDQuery;
    qryUpCompany: TFDQuery;
    qryPOUpStatus: TFDQuery;
    qryVAT: TFDQuery;
    dtsVAT: TDataSource;
    qryGetContacts: TFDQuery;
    dtsMaterial: TDataSource;
    qryMaterial: TFDQuery;
    qryWTThickness: TFDQuery;
    dtsWorktops: TDataSource;
    dtsWTThickness: TDataSource;
    qryWorktops: TFDQuery;
    qryPOAllLines: TFDQuery;
    qryMaterialSlab: TFDQuery;
    dtsMaterialSlab: TDataSource;
    qryOneWTThickness: TFDQuery;
    qryPOAddLine: TFDQuery;
    qryPOUpdLine: TFDQuery;
    qryQHeader: TFDQuery;
    qryGetSupplierContact: TFDQuery;
    qryQSlab: TFDQuery;
    qryQuoteLines: TFDQuery;
    qrySupplierWorktopCost: TFDQuery;
    qryMaterialSlabs: TFDQuery;
    qryQuoteSlabs: TFDQuery;
    qryUpPOStatus: TFDQuery;
    qryUpPOLines: TFDQuery;
    qryGetProducts: TFDQuery;
    dtsGetProducts: TDataSource;
    qryGetProduct: TFDQuery;
    qryDummy: TFDQuery;
    qryGetSOLines: TFDQuery;
    dtsGetSOLines: TDataSource;
    qryQuoteSlab: TFDQuery;
    qryDummy_old: TFDQuery;
    qryGetPOLines: TFDQuery;
    qryGetSOStatus: TFDQuery;
    qryUpSOStatus: TFDQuery;
    qryQuoteAdhesives: TFDQuery;
    qryPOAllEvents: TFDQuery;
    qryPOEvent: TFDQuery;
    qryPOAddEvent: TFDQuery;
    qryAllPurchasesPurchase_Order: TIntegerField;
    qryAllPurchasesSupplier: TIntegerField;
    qryAllPurchasesDescriptive_Reference: TWideStringField;
    qryAllPurchasesSupplier_Name: TWideStringField;
    qryAllPurchasesDate_Raised: TDateTimeField;
    qryAllPurchasesDate_Required: TDateTimeField;
    qryAllPurchasesOperator: TIntegerField;
    qryAllPurchasesReference: TWideStringField;
    qryAllPurchasesOn_Hold: TWideStringField;
    qryAllPurchasesinactive: TWideStringField;
    qryAllPurchasesGoods_Value: TFloatField;
    qryAllPurchasesOperator_Name: TWideStringField;
    qryAllPurchasesGoods_Receipt_Number: TWideStringField;
    qryAllPurchasesPurchase_Order_Status: TIntegerField;
    qryAllPurchasesStatus_Description: TWideStringField;
    qryAllPurchasesCut_Off_Date: TDateTimeField;
    qryAllPurchasesContact_No: TIntegerField;
    qryAllPurchasesContact_name: TWideStringField;
    qryAllPurchasesNotes: TWideStringField;
    qryAllPurchasesOffice_Contact_Name: TWideStringField;
    qryVATVat: TIntegerField;
    qryVATVat_Rate: TFloatField;
    qryVATDescription: TWideStringField;
    qryVATVat_Code: TWideStringField;
  private
    function GetCurrentPOrder: integer;
    function GetNextPONumber: integer;
    function GetHeaderCountAll: integer;
  public
    CustomerName: string;
    DateRequired: TDateTime;
    Description: string;
    OfficeContact: string;
    OperatorName: string;
    Quote: integer;
    QuoteSlabNo: integer;
    Reference: string;
    SalesOrder: integer;
    SalesOrderLineNo: integer;
    ShowInactive : boolean;
    ShowLive: boolean;
    SortType: string;
    SortOrder: string;
    Status: string;
    Supplier: integer;
    SupplierName: string;
    property CurrentPOrder : integer read GetCurrentPOrder;
    property HeaderCountAll: integer read GetHeaderCountAll;
    function GetSupplierAddress(tempSupp: integer): string;
    function GetSupplierContact(tempSupp: integer; var CID, CName: string): boolean;
    function GetSupplierCounty(tempSupp: integer): string;
    function GetSupplierEmail(tempSupp: integer): string;
    function GetSupplierFax(tempSupp: integer): string;
    function GetSupplierLocale(tempSupp: integer): string;
    function GetSupplierPostcode(tempSupp: integer): string;
    function GetSupplierStreet(tempSupp: integer): string;
    function GetSupplierTelephone(tempSupp: integer): string;
    function GetSupplierTown(tempSupp: integer): string;
    function GetSupplierWebsite(tempSupp: integer): string;
    procedure DeletePurchaseOrder(iOrder: integer);
    procedure RefreshAlldata;
    procedure RefreshSOdata;
    procedure UpdateStatus(tmpPO, tmpStatus, tmpMultiplier: integer);
    function UsingSearch: boolean;
  end;

  TPOrder = class;

  TPOEvent   = class
  private
    FEventNumber: integer;
    FOperator: integer;
    FOperatorName: string;
    FDateEntered: TDateTime;
    FNarrative: TNotes;
    FParent: TPOrder;
    procedure SetDateEntered(const Value: TDateTime);
    procedure SetEventNumber(const Value: integer);
    procedure SetNarrative(const Value: TNotes);
    procedure SetOperator(const Value: integer);
    procedure SetOperatorName(const Value: string);
    procedure SetParent(const Value: TPOrder);
  public
    constructor Create(POrder : TPOrder);
    destructor Destroy; override;
    function Clone : TPOEvent;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DateEntered: TDateTime read FDateEntered write SetDateEntered;
    property EventNumber: integer read FEventNumber write SetEventNumber;
    property Narrative: TNotes read FNarrative write SetNarrative;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName:string read FOperatorName write SetOperatorName;
    property Parent: TPOrder read FParent write SetParent;
  end;

  TPOEvents = class;

  TPOLine = class
  private
    FUnitCost: currency;
    FDiscountPercentage: double;
    FQuantity: double;
    FQtyInvoiced: double;
    FQtyDelivered: double;
    FWorktop: integer;
    FThickness: integer;
    FVat: integer;
    FCostUnit: integer;
    FSlabLength: integer;
    FSlabDepth: integer;
    FPOLNumber: integer;
    FStockItem: integer;
    FVatRate: real;
    FMode: string;
    FSupplierStockCode: string;
    FWorktopDescription: string;
    FDescription: string;
    FNotes: string;
    FThicknessMM: string;
    FDateRequired: TDateTime;
    FParent: TPOrder;
    FDateReceived: TDateTime;
    FSlabDescription: string;
    FSalesOrder: integer;
    FSalesOrderLineNo: integer;
    FMaterialType: integer;
    FSlabUnitCost: currency;
    FGRNNumber: string;
    FDELNoteNumber: string;
    function GetSlabArea: double;
    function GetTotalCost: currency;
    procedure SetCostUnit(const Value: integer);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetDescription(const Value: string);
    procedure SetDiscountPercentage(const Value: double);
    procedure SetMode(const Value: string);
    procedure SetNotes(const Value: string);
    procedure SetParent(const Value: TPOrder);
    procedure SetPOLNumber(const Value: integer);
    procedure SetQtyDelivered(const Value: double);
    procedure SetQtyInvoiced(const Value: double);
    procedure SetQuantity(const Value: double);
    procedure SetSlabDepth(const Value: integer);
    procedure SetSlabLength(const Value: integer);
    procedure SetStockItem(const Value: integer);
    procedure SetSupplierStockCode(const Value: string);
    procedure SetThickness(const Value: integer);
    procedure SetThicknessMM(const Value: string);
    procedure SetUnitCost(const Value: currency);
    procedure SetVat(const Value: integer);
    procedure SetVatRate(const Value: real);
    procedure SetWorktop(const Value: integer);
    procedure SetWorktopDescription(const Value: string);
    procedure SetDateReceived(const Value: TDateTime);
    procedure SetSlabDescription(const Value: string);
    procedure SetSalesOrder(const Value: integer);
    procedure SetSalesOrderLineNo(const Value: integer);
    procedure SetMaterialType(const Value: integer);
    procedure SetSlabUnitCost(const Value: currency);
    procedure SetGRNNumber(const Value: string);
    procedure SetDELNoteNumber(const Value: string);
  public
    constructor Create(POrder : TPOrder);
    destructor Destroy; override;
    function Clone : TPOLine;
    procedure LoadFromDB;
    procedure LoadFromQuoteSlab;
    procedure SaveSOStatus;
    procedure SaveToDB;
    procedure UpdateDB;
    procedure DeleteFromDB;
    property DateReceived: TDateTime read FDateReceived write SetDateReceived;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property DELNoteNumber: string read FDELNoteNumber write SetDELNoteNumber;
    property Description: string read FDescription write SetDescription;
    property DiscountPercentage: double read FDiscountPercentage write SetDiscountPercentage;
    property GRNNumber: string read FGRNNumber write SetGRNNumber;
    property POLNumber: integer read FPOLNumber write SetPOLNumber;
    property CostUnit: integer read FCostUnit write SetCostUnit;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property Mode: string read FMode write SetMode;
    property Notes: string read FNotes write SetNotes;
    property Parent: TPOrder read FParent write SetParent;
    property Quantity: double read FQuantity write SetQuantity;
    property QtyDelivered: double read FQtyDelivered write SetQtyDelivered;
    property QtyInvoiced: double read FQtyInvoiced write SetQtyInvoiced;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property SalesOrderLineNo: integer read FSalesOrderLineNo write SetSalesOrderLineNo;
    property SlabArea: double read GetSlabArea;
    property SlabDescription: string read FSlabDescription write SetSlabDescription;
    property SlabDepth: integer read FSlabDepth write SetSlabDepth;
    property SlabLength: integer read FSlabLength write SetSlabLength;
    property SlabUnitCost: currency read FSlabUnitCost write SetSlabUnitCost;
    property StockItem: integer read FStockItem write SetStockItem;
    property SupplierStockCode: string read FSupplierStockCode write SetSupplierStockCode;
    property Thickness: integer read FThickness write SetThickness;
    property ThicknessMM: string read FThicknessMM write SetThicknessMM;
    property TotalCost: currency read GetTotalCost;
    property UnitCost: currency read FUnitCost write SetUnitCost;
    property Vat: integer read FVat write SetVat;
    property VatRate: real read FVatRate write SetVatRate;
    property Worktop: integer read FWorktop write SetWorktop;
    property WorktopDescription: string read FWorktopDescription write SetWorktopDescription;
  end;

  TPOLines = class;

  TPOEvents    = class
  private
    FParent: TPOrder;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TPOEvent;
    procedure SetItems(Index: integer; const Value: TPOEvent);
  public
    constructor Create(POrder : TPOrder);
    destructor Destroy; override;
    procedure Add(aEvent: TPOEvent);
    procedure Clear;
    function  Clone : TPOEvents;
    procedure Delete(const Index : integer);
    function  IndexOf(const EventNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TPOEvent read GetItems write SetItems;
      default;
    property Parent : TPOrder read FParent;
  end;

  TPOLines  = class
  private
    FParent: TPOrder;
    FItems: TList;
    function GetCount: integer;
    function GetItems(Index: integer): TPOLine;
    function GetMaxLineNo: integer;
    procedure SetItems(Index: integer; const Value: TPOLine);
  public
    constructor Create(POrder : TPOrder);
    destructor Destroy; override;
    procedure Add(aLine : TPOLine);
    procedure Clear;
    function  Clone : TPOLines;
    procedure Delete(const Index : integer);
    function  IndexOf(const LineNo: integer) : integer;
    procedure Renumber;
    property Count : integer read GetCount;
    property Items[Index : integer] : TPOLine read GetItems write SetItems;
      default;
    property MaxLineNo: integer read GetMaxLineNo;
    property Parent : TPOrder read FParent;
  end;

  TPOrder = class
  private
    FdbKey: integer;
    FOperator: integer;
    FSupplier: integer;
    FContactNo: integer;
    FSupplierName: string;
    FNotes: string;
    FContactName: string;
    FGoodsReceiptNumber: string;
    FDateRequired: TDateTime;
    FDateRaised: TDateTime;
    FPODate: TDateTime;
    FReason: integer;
    FStatus: integer;
    FOperatorName: string;
    Finactive: string;
    FOnHold: boolean;
    FStatusDescr: string;
    FCutOffDate: TDateTime;
    FDataModule: TdtmdlPurchaseOrder;
    FPOLines: TPOLines;
    FAccountManager: integer;
    FDescription: string;
    FReference: string;
    FOrderMode: TpopMode;
    FDeliveryAddress: integer;
    FPOEvents: TPOEvents;
    FPOMode: TPOPMode;
    procedure SetdbKey(const Value: integer);
    procedure SetContactName(const Value: string);
    procedure SetContactNo(const Value: integer);
    procedure SetDateRaised(const Value: TDateTime);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetGoodsReceiptNumber(const Value: string);
    procedure SetNotes(const Value: string);
    procedure SetOperator(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetSupplierName(const Value: string);
    procedure SetPODate(const Value: TDateTime);
    procedure SetCutOffDate(const Value: TDateTime);
    procedure Setinactive(const Value: string);
    procedure SetOnHold(const Value: boolean);
    procedure SetOperatorName(const Value: string);
    procedure SetReason(const Value: integer);
    procedure SetStatus(const Value: integer);
    procedure SetStatusDescr(const Value: string);
    procedure SetAccountManager(const Value: integer);
    procedure SetDescription(const Value: string);
    procedure SetReference(const Value: string);
    function GetCurrentStatus: integer;
    function GetTotalCost: currency;
    function GetTotalVat: currency;
    procedure SetOrderMode(const Value: TpopMode);
    procedure SavePONumber;
    procedure SetDeliveryAddress(const Value: integer);
    procedure SetPOMode(const Value: TPOPMode);
  public
    constructor Create(DataModule : TdtmdlPurchaseOrder);
    destructor Destroy; override;
    procedure Clear;
    function  Clone : TPOrder;
    procedure DeleteFromDB;
    procedure DeleteEvents;
    procedure DeleteLines;
    procedure LoadEvents;
    procedure LoadFromDB;
    procedure LoadFromQuote;
    procedure LoadFromQuoteSlabs;
    procedure LoadLines;
    procedure LoadQuoteAdhesiveLines;
    procedure LoadQuoteLines;
    procedure LoadQuoteSlabLines;
    procedure SaveEvents;
    procedure SaveLines;
    procedure SaveToDB(TempAll: boolean);
    property AccountManager: integer read FAccountManager write SetAccountManager;
    property ContactNo: integer read FContactNo write SetContactNo;
    property ContactName: string read FContactName write SetContactName;
    property CutOffDate: TDateTime read FCutOffDate write SetCutOffDate;
    property DataModule: TdtmdlPurchaseOrder read FDataModule;
    property DateRaised: TDateTime read FDateRaised write SetDateRaised;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property dbKey: integer read FdbKey write SetdbKey;
    property DeliveryAddress: integer read FDeliveryAddress write SetDeliveryAddress;
    property Description: string read FDescription write SetDescription;
    property Events: TPOEvents read FPOEvents;
    property GoodsReceiptNumber: string read FGoodsReceiptNumber write SetGoodsReceiptNumber;
    property inactive: string read Finactive write Setinactive;
    property Lines: TPOLines read FPOLines;
    property Notes: string read FNotes write SetNotes;
    property OnHold: boolean read FOnHold write SetOnHold;
    property Operator: integer read FOperator write SetOperator;
    property OperatorName: string read FOperatorName write SetOperatorName;
    property OrderMode: TpopMode read FOrderMode write SetOrderMode;
    property PODate: TDateTime read FPODate write SetPODate;
    property POMode: TPOPMode read FPOMode write SetPOMode;
    property Reference: string read FReference write SetReference;
    property Reason: integer read FReason write SetReason;
    property Status: integer read FStatus write SetStatus;
    property StatusDescr: string read FStatusDescr write SetStatusDescr;
    property Supplier: integer read FSupplier write SetSupplier;
    property SupplierName: string read FSupplierName write SetSupplierName;
    property TotalCost: currency read GetTotalCost;
    property TotalVat: currency read GetTotalVat;
  end;

var
  dtmdlPurchaseOrder: TdtmdlPurchaseOrder;

implementation

uses wtDataModule, wtMain;

{$R *.dfm}

{ TdtmdlPurchase }

function TdtmdlPurchaseOrder.GetCurrentPOrder: integer;
begin
  if dtsAllPurchases.dataset.RecordCount > 0 then
    Result := dtsAllPurchases.dataset.FieldByName('Purchase_Order').AsInteger
  else
    Result := 0;
end;

procedure TdtmdlPurchaseOrder.RefreshSOdata;
var
  sTemp: string;
  i: integer;
begin
  sTemp := '';
  with qryGetSOLines do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      parambyname('Supplier').asinteger := Supplier;
      parambyname('Customer_Name').asstring := '%' + CustomerName + '%';
      parambyname('Date_Required').asdatetime := DateRequired;
      open;
    end;
end;

procedure TdtmdlPurchaseOrder.RefreshAlldata;
var
  sTemp: string;
begin
  sTemp := '';
  with qryAllPurchases do
    begin
      sql.Clear;
      sTemp := qryDummy.sql.text;
      if Description <> '' then
        sTemp := sTemp + ' AND Purchase_Order.Descriptive_Reference LIKE ''%' + Description + '%''';
      if SupplierName <> '' then
        sTemp := sTemp + ' AND Supplier.Supplier_name LIKE ''%' + SupplierName + '%''';
      if Reference <> '' then
        sTemp := sTemp + ' AND Purchase_Order.Reference LIKE ''%' + Reference + '%''';
      if OfficeContact <> '' then
        sTemp := sTemp + ' AND Office_Contact.Operator_Name LIKE ''%' + OfficeContact + '%''';
      if OperatorName <> '' then
        sTemp := sTemp + ' AND Operator.Operator_Name LIKE ''%' + OperatorName + '%''';
      if Status <> '' then
        sTemp := sTemp + ' AND Purchase_order_Status.Status_Description LIKE ''%' + status + '%''';

      if ShowLive then
        sTemp := sTemp + ' AND (Purchase_order.Purchase_order_Status < 50) ';

      if ShowInactive then
        sTemp := sTemp + ' AND ((Purchase_order.inactive is NULL) OR (Purchase_Order.inactive = ''N'')'
                    + ' OR (Purchase_Order.inactive = ''Y'')) '
      else
        sTemp := sTemp + ' AND ((Purchase_Order.inactive is NULL) OR (Purchase_Order.inactive = ''N''))';


      if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Purchase_Order.Purchase_Order desc'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

      sql.text := sTemp;
      open;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierAddress(tempSupp: integer): string;
var
  i: integer;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      for i := 0 to 4 do
        begin
          if trim(fields[i].asstring) = '' then continue;
          result := result + trim(fields[i].asstring) + #13#10;
        end;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierStreet(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Street').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierLocale(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Locale').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierTown(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Town_City').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierPostcode(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Postcode').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierCounty(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('County_State').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierTelephone(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Telephone_number').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierFax(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Fax_Number').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierWebsite(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Web_Address').asstring;
    end;
end;

function TdtmdlPurchaseOrder.GetSupplierEmail(tempSupp: integer): string;
begin
  result := '';
  with qryGetSupplier do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;
      result := fieldbyname('Email_Address').asstring;
    end;
end;

{ TPOrder }

procedure TPOrder.Clear;
begin
  Supplier :=       0;
  SupplierName :=   '';
  PODate :=           0;
  FPOEvents.Clear;
  FPOLines.Clear;
 end;

function TPOrder.Clone: TPOrder;
begin
  Result := TPOrder.Create(FDataModule);
  Result.AccountManager := self.AccountManager;
  Result.ContactNo :=     self.ContactNo;
  Result.ContactName :=   self.ContactName;
  Result.CutOffDate :=    self.CutOffDate;
  Result.DateRaised :=    self.DateRaised;
  Result.DateRequired :=  self.DateRequired;
  Result.Description :=   self.Description;
  Result.DeliveryAddress := self.DeliveryAddress;
  Result.GoodsReceiptNumber := self.GoodsReceiptNumber;
  Result.inactive :=      self.inactive;
  Result.Notes :=         self.Notes;
  Result.OnHold :=        self.OnHold;
  Result.Operator :=      self.Operator;
  Result.OperatorName :=  self.OperatorName;
  Result.PODate:=         self.PODate;
  Result.Reference :=     self.Reference;
  Result.Reason :=        self.reason;
  Result.Status :=        self.Status;
  Result.StatusDescr :=   self.StatusDescr;
  Result.Supplier:=       self.Supplier;
  Result.SupplierName:=   self.SupplierName;
  Result.FPOEvents.Free;
  Result.FPOEvents :=  Self.FPOEvents.Clone;
  Result.FPOLines.Free;
  Result.FPOLines :=  Self.FPOLines.Clone;
end;

constructor TPOrder.Create(DataModule: TdtmdlPurchaseOrder);
begin
  FDataModule := DataModule;
  FPOEvents := TPOEvents.Create(Self);
  FPOLines := TPOLines.Create(Self);
end;

procedure TPOrder.DeleteFromDB;
begin
  DeleteEvents;
  DeleteLines;
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Purchase_Order WHERE Purchase_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;

end;

procedure TPOrder.DeleteLines;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Purchase_OrderLine WHERE Purchase_Order = ' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

destructor TPOrder.Destroy;
begin
  FPOEvents.Free;
  FPOLines.Free;
  inherited;
end;

function TPOrder.GetCurrentStatus: integer;
var
  tempStatus, iOrigStatus: integer;
begin
  iOrigStatus := self.Status;
  with datamodule.qryGetPOLines do
    begin
      close;
      parambyname('Purchase_Order').asinteger := dbKey;
      open;

(*      if (fieldbyname('total_invoiced').asinteger >= fieldbyname('total_PO_Invoiced').asinteger) and
         (fieldbyname('total_invoiced').asinteger >= fieldbyname('total_Qty_To_Invoice').asinteger) and
         (fieldbyname('total_invoiced').asinteger > 0) then
        tempStatus := 100
      else
      if fieldbyname('total_invoiced').asinteger > 0 then
        tempStatus := 90
      else
*)
      if fieldbyname('total_delivered').asinteger >= fieldbyname('total_Qty_to_Order').asinteger then
        tempStatus := 50
      else
      if fieldbyname('total_delivered').asinteger > 0 then
        tempStatus := 40
      else
      if fieldbyname('total_lines').asinteger > 0 then
        tempStatus := 15
      else
        tempStatus := iOrigStatus;
    end;

  result := tempStatus;
end;

function TPOrder.GetTotalCost: currency;
var
  i: integer;
begin
  Result := 0;
  for i := 0 to pred(FPOLines.count) do
    result := result + FPOLines[i].TotalCost
end;

function TPOrder.GetTotalVat: currency;
begin
  result := 0;
end;

procedure TPOrder.LoadFromDB;
begin
  { Load the header record then all lines belonging to the purchase order }
  Clear;
  with FDataModule.qryPOHeader do
  begin
    Close;
    ParamByName('Purchase_Order').AsInteger := DbKey;
    Open;
    AccountManager := fieldbyname('Office_Contact').asinteger;
    ContactNo :=     fieldbyname('Contact_No').asinteger;
    ContactName:=    fieldbyname('Contact_Name').asstring;
    CutOffDate :=     fieldbyname('Cut_off_date').asdatetime;
    DateRaised :=     fieldbyname('Date_Raised').asdatetime;
    DateRequired :=    fieldbyname('Date_Required').asdatetime;
    DeliveryAddress := fieldbyname('Delivery_Address').asinteger;
    Description :=    fieldbyname('Descriptive_Reference').asstring;
    GoodsReceiptNumber := fieldbyname('Goods_Receipt_Number').asstring;
    Inactive :=      fieldbyname('Inactive').asstring;
    Notes :=          fieldbyname('Notes').asString;
    OnHold :=         (fieldbyname('On_Hold').asstring = 'Y');
    Operator :=       fieldbyname('Operator').asinteger;
    OperatorName :=   fieldbyname('Operator_Name').asstring;
    PODate:=          fieldbyname('Date_Raised').asdatetime;
    Reference :=      fieldbyname('Reference').asstring;
    Reason :=        fieldbyname('Inactive_Reason').asinteger;
    Status :=        fieldbyname('Purchase_Order_Status').asinteger;
    StatusDescr :=   fieldbyname('Status_Description').asstring;
    Supplier:=       fieldbyname('Supplier').asinteger;
    SupplierName:=   fieldbyname('Supplier_Name').asstring;
    Close;
  end;
  LoadLines;
  if (poMode <> popCopy) then
    LoadEvents;
end;

procedure TPOrder.LoadFromQuote;
var
  Result: boolean;
  CID, CName: string;
begin
  { Load the header record then all lines belonging to the purchase order }
  Clear;
  with FDataModule.qryQHeader do
  begin
    Close;
    ParamByName('Quote').AsInteger := self.DataModule.Quote;
    Open;
    AccountManager := frmWTMain.Operator;
    CutOffDate :=     date;
    DateRaised :=     date;
    DateRequired :=    date;
    DeliveryAddress := 0;
    Description :=    fieldbyname('Customer_Name').asstring;
    GoodsReceiptNumber := '';
    Inactive :=      'N';
    Notes :=          '';
    OnHold :=         false;
    Operator :=       frmWTMain.Operator;
    OperatorName :=   frmWTMain.OperatorName;
    PODate:=          date;
    Reference :=      inttostr(self.DataModule.SalesOrder);
    Reason :=        0;
    Status :=        10;
    Supplier:=       fieldbyname('Supplier').asinteger;
    SupplierName:=   fieldbyname('Supplier_Name').asstring;

    CID := '0';
    CName := '';

    Result := self.datamodule.GetSupplierContact(Supplier, CID, CName);

    if result then
      begin
        ContactNo :=     strtoint(CID);
        ContactName:=    CName;
      end
    else
      begin
        ContactNo :=     0;
        ContactName:=    '';
      end ;

    Close;
  end;
  LoadQuoteLines;
end;

procedure TPOrder.LoadFromQuoteSlabs;
var
  Result: boolean;
  CID, CName: string;
begin
  { Load the header record then all lines belonging to the purchase order }
  Clear;
  with FDataModule.qryQSlab do
  begin
    Close;
    ParamByName('Quote').AsInteger := self.DataModule.Quote;
    ParamByName('Supplier').AsInteger := self.DataModule.Supplier;
    Open;

    if recordcount = 0 then exit;

    AccountManager := frmWTMain.Operator;
    CutOffDate :=     date;
    DateRaised :=     date;
    DateRequired :=    date;
    DeliveryAddress := 0;
    Description :=    fieldbyname('Customer_Name').asstring;
    GoodsReceiptNumber := '';
    Inactive :=      'N';
    Notes :=          '';
    OnHold :=         false;
    Operator :=       frmWTMain.Operator;
    OperatorName :=   frmWTMain.OperatorName;
    PODate:=          date;
    Reference :=      inttostr(self.DataModule.SalesOrder);
    Reason :=        0;
    Status :=        10;
    Supplier:=       fieldbyname('Supplier').asinteger;
    SupplierName:=   fieldbyname('Supplier_Name').asstring;

    CID := '0';
    CName := '';

    Result := self.datamodule.GetSupplierContact(Supplier, CID, CName);

    if result then
      begin
        ContactNo :=     strtoint(CID);
        ContactName:=    CName;
      end
    else
      begin
        ContactNo :=     0;
        ContactName:=    '';
      end ;

    Close;
  end;
  LoadQuoteSlabLines;
  LoadQuoteAdhesiveLines;
end;

procedure TPOrder.LoadLines;
var
  aLine : TPOLine;
begin
  FPOLines.Clear;
  with FDataModule.qryPOAllLines do
  begin
    Close;
    ParamByName('Purchase_Order').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aLine := TPOLine.Create(Self);
      aLine.DateReceived := FieldByName('Date_Received').Asdatetime;
      aLine.DateRequired := FieldByName('Date_Required').Asdatetime;
      aLine.Description := FieldByName('Description').asstring;
      aLine.DiscountPercentage := FieldByName('Discount_Percentage').asfloat;
      aLine.POLNumber := FieldByName('Line_No').AsInteger;
      
      aLine.CostUnit := FieldByName('Cost_Pack_Quantity').asinteger;
      aLine.MaterialType := FieldByName('Material_Type').asinteger;
      aLine.Mode := 'C';
      aLine.Notes := FieldByName('Notes').asstring;
      aLine.Quantity := FieldByName('Quantity').asfloat;
      aLine.QtyDelivered := FieldByName('Quantity_Delivered').asfloat;
      aLine.QtyInvoiced := FieldByName('Quantity_Invoiced').asfloat;
      aLine.SalesOrder := FieldByName('Sales_Order').asinteger;
      aLine.SalesOrderLineNo := FieldByName('Sales_Order_Line_no').asinteger;
      aLine.SlabDepth := FieldByName('Slab_Depth').asinteger;
      aLine.SlabLength := FieldByName('Slab_Length').asinteger;
      aLine.SlabDescription := FieldByName('Slab_Description').asstring;
      aLine.SlabUnitCost := FieldByName('Slab_Unit_Cost').asfloat;
      aLine.StockItem := FieldByName('Stock_Item').asinteger;
      aLine.SupplierStockCode := FieldByName('Supplier_Product_Code').asstring;
      aLine.Thickness := FieldByName('Thickness').asinteger;
      aLine.ThicknessMM := FieldByName('Thickness_mm').asstring;
      aLine.UnitCost := FieldByName('Unit_Cost').asfloat;
      aLine.Vat := FieldByName('Vat').asinteger;
      aLine.VatRate := FieldByName('Vat_Rate').asfloat;
      aLine.Worktop := FieldByName('Worktop').asinteger;
      aLine.WorktopDescription := FieldByName('Worktop_Description').asstring;

      aLine.GRNNumber := fieldbyname('GRN_Number').asstring;
      aLine.DELNoteNumber := fieldbyname('DEL_Number').asstring;
      FPOLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TPOrder.LoadQuoteLines;
var
  aLine : TPOLine;
  iCount: integer;
  rMaterialArea, rSlabArea: real;
begin
  FPOLines.Clear;
  with FDataModule.qryQuoteLines do
  begin
    Close;
    ParamByName('Quote').AsInteger := self.DataModule.Quote;
    Open;

    iCount := 0;

    while not(EOF) do
    begin
      aLine := TPOLine.Create(Self);
//      aLine.DateReceived := FieldByName('Date_Received').Asdatetime;
//      aLine.DateRequired := FieldByName('Date_Required').Asdatetime;
      aLine.Description := FieldByName('Thickness_mm').asstring + ' ' + FieldByName('Worktop_Description').asstring + ' ' + FieldByName('Material_Description').asstring;
      aLine.DiscountPercentage := 0.00;
      aLine.POLNumber := icount + 1;
      aLine.MaterialType := FieldByName('Material_Type').asinteger;
      aLine.Mode := 'C';
      aLine.Notes := '';
      aLine.QtyDelivered := 0;
      aLine.QtyInvoiced := 0;
      aLine.SalesOrder := self.datamodule.SalesOrder;
      aLine.SalesOrderLineNo := self.datamodule.SalesOrderLineNo;
      aLine.Thickness := FieldByName('Thickness').asinteger;
      aLine.ThicknessMM := FieldByName('Thickness_mm').asstring;
      aLine.Worktop := FieldByName('Worktop').asinteger;
      aLine.WorktopDescription := FieldByName('Worktop_Description').asstring;

      {Get costs from supplier_worktop_thickness table using Supplier, Worktop, Thickness, Todays date}
      DataModule.qrySupplierWorktopCost.close;
      DataModule.qrySupplierWorktopCost.parambyname('Supplier').asinteger := aLine.parent.Supplier;
      DataModule.qrySupplierWorktopCost.parambyname('Worktop').asinteger := aLine.Worktop;
      DataModule.qrySupplierWorktopCost.parambyname('Thickness').asinteger := aLine.Thickness;
      DataModule.qrySupplierWorktopCost.open;

      if recordcount > 0 then
        begin
          aLine.SlabUnitCost := DataModule.qrySupplierWorktopCost.fieldbyname('Unit_Cost').asfloat;
          aLine.CostUnit := 1;
        end
      else
        begin
          aLine.SlabUnitCost := 0;
          aLine.CostUnit := 1;
        end;

      {Get slab sizes for material_type}
      rMaterialArea := fieldbyname('Material_Area').asfloat;
      rSlabArea := 0;
      aLine.SlabDepth := 0;
      aLine.SlabLength := 0;
      aLine.SlabDescription := '';
      aLine.Quantity := 0;

      DataModule.qryMaterialSlabs.close;
      DataModule.qryMaterialSlabs.parambyname('Material_Type').asinteger := aLine.MaterialType;
      DataModule.qryMaterialSlabs.open;

      while DataModule.qryMaterialSlabs.Eof <> true do
        begin
          aLine.SlabDepth := DataModule.qryMaterialSlabs.FieldByName('Depth').asinteger;
          aLine.SlabLength := DataModule.qryMaterialSlabs.FieldByName('Length').asinteger;
          aLine.SlabDescription := DataModule.qryMaterialSlabs.FieldByName('Slab_Size_Description').asstring;

          rSlabArea := ((aLine.SlabDepth * aLine.SlabLength)/1000000);

          if rSlabArea > (rMaterialArea * (1 + 0.25)) then
            begin
              aLine.Quantity := 1;
              break;
            end;
          DataModule.qryMaterialSlabs.next;
        end;

      {Using total area workout how many slabs}
      if aLine.Quantity = 0 then
        begin
          if rSlabArea > 0 then
            aLine.Quantity := ceil((rMaterialArea * (1 + 0.25))/rSlabArea)
          else
            aLine.Quantity := 1;
        end;

      aLine.UnitCost := (rSlabArea * aLine.SlabUnitCost);

//      aLine.Vat := FieldByName('Vat').asinteger;
//      aLine.VatRate := FieldByName('Vat_Rate').asfloat;

//      aLine.StockItem := 0;
      aLine.SupplierStockCode := '';
      FPOLines.Add(aLine);
      Next;
      inc(icount);
    end;
    Close;
  end;
end;

procedure TPOrder.LoadQuoteSlabLines;
var
  aLine : TPOLine;
  iCount: integer;
  rSlabArea: real;
begin
  FPOLines.Clear;
  with FDataModule.qryQuoteSlabs do
  begin
    Close;
    ParamByName('Quote').AsInteger := self.DataModule.Quote;
    ParamByName('Supplier').AsInteger := self.DataModule.Supplier;
    Open;

    iCount := 0;

    while not(EOF) do
    begin
      aLine := TPOLine.Create(Self);
//      aLine.DateReceived := FieldByName('Date_Received').Asdatetime;
//      aLine.DateRequired := FieldByName('Date_Required').Asdatetime;
      aLine.Description := FieldByName('Thickness_mm').asstring + ' ' + FieldByName('Worktop_Description').asstring + ' ' + FieldByName('Material_Description').asstring;
      aLine.DiscountPercentage := 0.00;
      aLine.POLNumber := icount + 1;
      aLine.MaterialType := FieldByName('Material_Type').asinteger;
      aLine.Mode := 'C';
      aLine.Notes := '';
      aLine.QtyDelivered := 0;
      aLine.QtyInvoiced := 0;
      aLine.SalesOrder := self.datamodule.SalesOrder;
      aLine.SalesOrderLineNo := self.datamodule.SalesOrderLineNo;
      aLine.Thickness := FieldByName('Thickness').asinteger;
      aLine.ThicknessMM := FieldByName('Thickness_mm').asstring;
      aLine.Worktop := FieldByName('Worktop').asinteger;
      aLine.WorktopDescription := FieldByName('Worktop_Description').asstring;

      aLine.SlabDepth := FieldByName('Depth').asinteger;
      aLine.SlabLength := FieldByName('Length').asinteger;
      aLine.SlabDescription := '';

      rSlabArea := ((aLine.SlabDepth * aLine.SlabLength)/1000000);

      aLine.Quantity := FieldByName('Quantity').asfloat;

      aLine.UnitCost := (rSlabArea * FieldByName('Unit_Cost').asfloat);
      aLine.CostUnit := 1;

      aLine.SlabUnitCost := (FieldByName('Unit_Cost').asfloat);

//      aLine.Vat := FieldByName('Vat').asinteger;
//      aLine.VatRate := FieldByName('Vat_Rate').asfloat;

//      aLine.StockItem := 0;
      aLine.SupplierStockCode := '';
      FPOLines.Add(aLine);
      Next;
      inc(icount);
    end;
    Close;
  end;
end;

procedure TPOrder.LoadQuoteAdhesiveLines;
var
  aLine : TPOLine;
  iCount: integer;
begin
  with FDataModule.qryQuoteAdhesives do
  begin
    Close;
    ParamByName('Quote').AsInteger := self.DataModule.Quote;
    ParamByName('Supplier').AsInteger := self.DataModule.Supplier;
    Open;

    iCount := self.Lines.count;

    while not(EOF) do
    begin
      aLine := TPOLine.Create(Self);
      aLine.Description := FieldByName('Supplier_Product_Description').asstring;
      aLine.DiscountPercentage := 0.00;
      aLine.POLNumber := icount + 1;
      aLine.MaterialType := 0;
      aLine.Mode := 'C';
      aLine.Notes := '';
      aLine.QtyDelivered := 0;
      aLine.QtyInvoiced := 0;
      aLine.SalesOrder := self.datamodule.SalesOrder;
      aLine.SalesOrderLineNo := self.datamodule.SalesOrderLineNo;
      aLine.Thickness := 0;
      aLine.ThicknessMM := '';
      aLine.Worktop := 0;
      aLine.WorktopDescription := '';

      aLine.SlabDepth := 0;
      aLine.SlabLength := 0;
      aLine.SlabDescription := '';

      aLine.Quantity := FieldByName('Adhesive_Quantity').asinteger;

      aLine.UnitCost := FieldByName('Adhesive_Unit_Cost').asfloat;
      aLine.CostUnit := FieldByName('Adhesive_Cost_Pack_Quantity').asinteger;

      aLine.SlabUnitCost := 0;

      aLine.SupplierStockCode := FieldByName('Adhesive_Product_Code').asstring;
      FPOLines.Add(aLine);
      Next;
      inc(icount);
    end;
    Close;
  end;
end;

procedure TPOrder.SaveEvents;
var
  i : integer;
begin
  { When saving, we have to delete all element records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  DeleteEvents;  { Get rid of any already in database }
  FPOEvents.Renumber;
  for i := 0 to Pred(FPOEvents.Count) do
    begin
      FPOEvents[i].SaveToDB;
    end;
end;

procedure TPOrder.SaveLines;
var
  i : integer;
begin
  { When saving, we have to delete all line records (as the numbering may
    change when records in the middle of a sequence are deleted) and then
    re-write them using the new numbering. }
  if (Status > 20) then
    begin
      for i := 0 to Pred(FPOLines.Count) do
        begin
          if FPOLines[i].Mode = 'C' then
            FPOLines[i].UpdateDB
          else
            FPOLines[i].SaveToDB;
          FPOLines[i].SaveSOStatus
        end;
    end
  else
    begin
      DeleteLines;  { Get rid of any already in database }
      FPOLines.Renumber;
      for i := 0 to Pred(FPOLines.Count) do
        begin
          FPOLines[i].SaveToDB;
        end;
    end;
end;

procedure TPOrder.SavePONumber;
begin
  with datamodule.qryUpCompany do
    begin
      close;
      parambyname('Last_Purchase_Order_number').asinteger := dbKey;
      execsql;
    end;
end;

procedure TPOrder.SaveToDB(TempAll: boolean);
var
  iNotes: integer;
begin
  if DbKey = 0 then
    begin
      DbKey := FDataModule.GetNextPONumber;
      with FDataModule.qryPOAddHeader do
        begin
          ParamByName('Purchase_Order').AsInteger := DbKey;

          ParambyName('Supplier').asinteger := self.Supplier;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.PODate;
          ParambyName('Descriptive_Reference').asstring := Description;

          ParamByName('Operator').AsInteger := Operator;

          ParambyName('Goods_Receipt_Number').asstring := ' ';

          if self.Lines.count = 0 then
            ParamByName('Purchase_Order_Status').Asinteger := 10
          else
            ParamByName('Purchase_Order_Status').Asinteger := 15;

          ParamByName('Cut_Off_Date').clear;

          if self.ContactNo = 0 then
            ParamByName('Contact_no').clear
          else
            ParamByName('Contact_no').asinteger := ContactNo;

          ParamByName('Notes').Asstring := Notes;

          ParamByName('Office_Contact').AsInteger := AccountManager;

          ParambyName('Reference').asstring := Reference;

          Parambyname('Inactive').asstring := 'N';
          Parambyname('inactive_reason').clear;

          ParambyName('On_Hold').asstring := 'N';

          Parambyname('Goods_Value').asfloat := TotalCost;
          Parambyname('VAT_Value').asfloat := 0.00;

          ExecSQL;
        end;
      SavePONumber;
//      dtmdlWorktops.CreateSalesDocDirectory(inttostr(dbKey));
    end
  else
  if TempAll then
    begin
      with FDataModule.qryPOUpHeader do
        begin
          ParamByName('Purchase_Order').AsInteger := DbKey;

          ParambyName('Supplier').asinteger := self.Supplier;
          ParambyName('Date_Required').asdatetime := self.DateRequired;
          ParamByName('Date_Raised').asdatetime := self.PODate;
          ParambyName('Descriptive_Reference').asstring := Description;

          ParamByName('Operator').AsInteger := Operator;

          ParambyName('Goods_Receipt_Number').asstring := self.GoodsReceiptNumber;

          if (Status = 10) and (self.Lines.count > 0) then
            ParamByName('Purchase_Order_Status').Asinteger := 15
          else
            ParamByName('Purchase_Order_Status').Asinteger := Status;

          if CutOffDate = 0 then
            ParamByName('Cut_Off_Date').clear
          else
            ParamByName('Cut_Off_Date').asdatetime := CutOffDate;

          if self.ContactNo = 0 then
            ParamByName('Contact_no').clear
          else
            ParamByName('Contact_no').asinteger := ContactNo;

          ParamByName('Notes').Asstring := Notes;

          ParamByName('Office_Contact').AsInteger := AccountManager;

          ParambyName('Reference').asstring := Reference;

          Parambyname('Inactive').asstring := inactive;
          Parambyname('inactive_reason').clear;

(*          if inactive = 'N' then
            Parambyname('inactive_reason').clear
          else
            Parambyname('inactive_reason').asinteger := Reason;
*)

          if self.OnHold then
            ParambyName('On_Hold').asstring := 'Y'
          else
            ParambyName('On_Hold').asstring := 'N';

          Parambyname('Goods_Value').asfloat := TotalCost;
          Parambyname('VAT_Value').asfloat := 0.00;
          ExecSQL;
        end
    end;
  SaveLines;
  SaveEvents;

  // Update the status now all the lines have been added
  with FDataModule.qryPOUpStatus do
    begin
      ParamByName('Purchase_Order').AsInteger := DbKey;
      ParamByName('Purchase_Order_Status').asinteger := GetCurrentStatus;
      ExecSQL;
    end;
end;

procedure TPOrder.SetAccountManager(const Value: integer);
begin
  FAccountManager := Value;
end;

procedure TPOrder.SetContactName(const Value: string);
begin
  FContactName := Value;
end;

procedure TPOrder.SetContactNo(const Value: integer);
begin
  FContactNo := Value;
end;

procedure TPOrder.SetCutOffDate(const Value: TDateTime);
begin
  FCutOffDate := Value;
end;

procedure TPOrder.SetDateRaised(const Value: TDateTime);
begin
  FDateRaised := Value;
end;

procedure TPOrder.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TPOrder.SetdbKey(const Value: integer);
begin
  FdbKey := Value;
end;

procedure TPOrder.SetDeliveryAddress(const Value: integer);
begin
  FDeliveryAddress := Value;
end;

procedure TPOrder.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TPOrder.SetGoodsReceiptNumber(const Value: string);
begin
  FGoodsReceiptNumber := Value;
end;

procedure TPOrder.Setinactive(const Value: string);
begin
  Finactive := Value;
end;

procedure TPOrder.SetNotes(const Value: string);
begin
  FNotes := Value;
end;

procedure TPOrder.SetOnHold(const Value: boolean);
begin
  FOnHold := Value;
end;

procedure TPOrder.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TPOrder.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TPOrder.SetOrderMode(const Value: TpopMode);
begin
  FOrderMode := Value;
end;

procedure TPOrder.SetPODate(const Value: TDateTime);
begin
  FPODate := Value;
end;

procedure TPOrder.SetReason(const Value: integer);
begin
  FReason := Value;
end;

procedure TPOrder.SetReference(const Value: string);
begin
  FReference := Value;
end;

procedure TPOrder.SetStatus(const Value: integer);
begin
  FStatus := Value;
end;

procedure TPOrder.SetStatusDescr(const Value: string);
begin
  FStatusDescr := Value;
end;

procedure TPOrder.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TPOrder.SetSupplierName(const Value: string);
begin
  FSupplierName := Value;
end;

procedure TPOrder.LoadEvents;
var
  aEvent : TPOEvent;
begin
  FPOEvents.Clear;
  with FDataModule.qryPOAllEvents do
  begin
    Close;
    ParamByName('Purchase_Order').AsInteger := DbKey;
    Open;
    while not(EOF) do
    begin
      aEvent := TPOEvent.Create(Self);
      aEvent.EventNumber := FieldByName('Internal_Note').AsInteger;
      aEvent.DateEntered := FieldByName('Date_Time_Entered').Asdatetime;
      aEvent.Operator := FieldByName('Operator').Asinteger;
      aEvent.OperatorName := FieldByName('Operator_Name').asstring;
      aEvent.Narrative.dbKey := FieldByName('Narrative').asinteger;
      aEvent.Narrative.LoadFromDB;

      FPOEvents.Add(aEvent);
      Next;
    end;
    Close;
  end;
end;

procedure TPOrder.SetPOMode(const Value: TPOPMode);
begin
  FPOMode := Value;
end;

procedure TPOrder.DeleteEvents;
begin
  with FDataModule.qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Purchase_Order_internal_Note WHERE Purchase_Order =' + IntToStr(DbKey));
    ExecSQL;
  end;
end;

{ TPOLines }

procedure TPOLines.Add(aLine: TPOLine);
begin
  FItems.Add(aLine);
end;

procedure TPOLines.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TPOLine(FItems[i]).Free;
end;

function TPOLines.Clone: TPOLines;
var
  i : integer;
begin
  Result := TPOLines.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TPOLine(FItems[i]).Clone);
end;

constructor TPOLines.Create(POrder: TPOrder);
begin
  FParent := POrder;
  FItems := TList.Create;
end;

procedure TPOLines.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TPOLines.Destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TPOLine(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TPOLines.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TPOLines.GetItems(Index: integer): TPOLine;
begin
  Result := TPOLine(FItems[Index]);
end;

function TPOLines.GetMaxLineNo: integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(Count) do
    if Items[i].POLNumber > Result then
      Result := Items[i].POLNumber;
end;

function TPOLines.IndexOf(const LineNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TPOLine(FItems[i]).POLNumber = LineNo then
      Result := i;
end;

procedure TPOLines.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TPOLine(FItems[i]).POLNumber:= (i+1);
end;

procedure TPOLines.SetItems(Index: integer; const Value: TPOLine);
begin
  FItems[Index] := Value;
end;

{ TPOLine }

function TPOLine.Clone: TPOLine;
begin
  Result := TPOLine.Create(FParent);
  Result.CostUnit             := self.CostUnit;
  Result.DateReceived         := self.DateReceived;
  Result.DateRequired         := self.DateRequired;
  Result.DELNoteNumber        := self.DELNoteNumber;
  Result.DiscountPercentage   := self.DiscountPercentage;
  Result.GRNNumber            := self.GRNNumber;
  Result.MaterialType         := self.MaterialType;
  Result.Mode                 := self.Mode;
  Result.Notes                := self.Notes;
  Result.POLNumber            := self.POLNumber;
  Result.Quantity             := self.Quantity;
  Result.QtyDelivered         := self.QtyDelivered;
  Result.QtyInvoiced          := self.QtyInvoiced;
  Result.SalesOrder           := self.SalesOrder;
  Result.SalesOrderLineNo     := self.SalesOrderLineNo;
  Result.SlabDescription      := self.SlabDescription;
  Result.SlabDepth            := self.SlabDepth;
  Result.SlabLength           := self.SlabLength;
  Result.SlabUnitCost         := self.SlabUnitCost;
  Result.StockItem            := self.StockItem;
  Result.SupplierStockCode    := self.SupplierStockCode;
  Result.Thickness            := self.Thickness;
  Result.ThicknessMM          := self.ThicknessMM;
  Result.UnitCost             := self.UnitCost;
  Result.Vat                  := self.Vat;
  Result.VatRate              := self.VatRate;
  Result.Worktop              := self.Worktop;
  Result.WorktopDescription   := self.WorktopDescription;
end;

constructor TPOLine.Create(POrder: TPOrder);
begin
  FParent := POrder;

end;

procedure TPOLine.DeleteFromDB;
begin
  exit;
end;

destructor TPOLine.Destroy;
begin

  inherited;
end;

function TPOLine.GetTotalCost: currency;
var
  rTotalCost, rDiscountValue: double;
begin
  rTotalCost := (UnitCost * (Quantity/CostUnit));

  rDiscountValue := rTotalCost * (self.DiscountPercentage/100);

  result := rTotalCost - rDiscountValue;

end;

function TPOLine.GetSlabArea: double;
begin
  result := (SlabLength * SlabDepth)/1000000;
end;

procedure TPOLine.LoadFromDB;
begin
  exit;
end;

procedure TPOLine.SaveToDB;
var
  dtmdlPOSupplier: TdtmdlSuppliers;
  iSupplierProduct, iPricePointer: integer;
  sText: string;
begin
  with FParent.FDataModule.qryPOAddLine do
  begin
    ParamByName('Purchase_Order').AsInteger := FParent.DbKey;
    ParamByName('Line_no').AsInteger := POLNumber;
    Parambyname('Description').asstring := self.Description;

    Parambyname('Date_Received').asdatetime := self.DateReceived;
    Parambyname('Date_Required').asdatetime := self.DateRequired;
    ParambyName('Discount_Percentage').asfloat := self.DiscountPercentage;
    ParambyName('Cost_Pack_Quantity').asinteger := self.CostUnit;
    ParambyName('Price_Unit').asinteger := 1;

    if self.StockItem = 0 then
      Parambyname('Stock_Item').clear
    else
      Parambyname('Stock_Item').asinteger := self.StockItem;

    ParambyName('Unit_Cost').asfloat := UnitCost;

    Parambyname('Quantity').asfloat := Quantity;

    if self.Worktop = 0 then
      ParambyName('Worktop').clear
    else
      ParambyName('Worktop').asinteger := self.Worktop;

    if self.Thickness = 0 then
      ParambyName('Thickness').clear
    else
      ParambyName('Thickness').asinteger := self.Thickness;

    ParambyName('Quantity_Delivered').asfloat := QtyDelivered;
    ParambyName('Quantity_Invoiced').asfloat := QtyInvoiced;

    ParambyName('Notes').asstring := self.Notes;
    ParambyName('Supplier_Product_Code').asstring := self.SupplierStockCode;

    if self.SalesOrder = 0 then
      begin
        ParambyName('Sales_Order').clear;
        ParambyName('Sales_Order_Line_no').clear;
      end
    else
      begin
        ParambyName('Sales_Order').asinteger := self.SalesOrder;
        ParambyName('Sales_Order_Line_no').asinteger := self.SalesOrderLineNo;
      end;

    ParambyName('Slab_Depth').asinteger := self.SlabDepth;
    ParambyName('Slab_Length').asinteger := self.SlabLength;
    ParambyName('Slab_Unit_Cost').asfloat := self.SlabUnitCost;
    ParambyName('Slab_Description').asstring := self.SlabDescription;

    ParambyName('GRN_Number').asstring := self.GRNNumber;
    ParambyName('DEL_Number').asstring := self.DELNoteNumber;

    if vat = 0 then
      ParambyName('Vat').clear
    else
      ParambyName('Vat').asinteger := Vat;
    ExecSQL;
  end;

  {Save the product to supplier database if doesn't exists}
  if self.SupplierStockCode <> '' then
    begin
      {Update supplier prices}
      dtmdlPOSupplier := TdtmdlSuppliers.create(application);
      try
        {Check Supplier/Worktop}
        dtmdlPOSupplier.qryChkSupplierProd.close;
        if dtmdlWorktops.IsSQL then
          begin
            sText := stringreplace(dtmdlPOSupplier.qryChkSupplierProd.SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
            dtmdlPOSupplier.qryChkSupplierProd.SQL.Text := sText;
          end;

        dtmdlPOSupplier.qryChkSupplierProd.parambyname('Supplier').asinteger := parent.Supplier;
        dtmdlPOSupplier.qryChkSupplierProd.parambyname('Supplier_Product_Code').asstring := SupplierStockCode;
        dtmdlPOSupplier.qryChkSupplierProd.open;

        if dtmdlPOSupplier.qryChkSupplierProd.recordcount = 0 then
          begin
            {Get Price Pointer}
            dtmdlWorktops.qryNewPrice.Close;
            dtmdlWorktops.qryNewPrice.Open;
            iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	          dtmdlWorktops.qryAddPointer.Close;
            dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
            dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'A';
	          dtmdlWorktops.qryAddPointer.ExecSQl;

            {Add Supplier/Worktop record}
            dtmdlPOSupplier.qryAddSupplierProd.close;
            dtmdlPOSupplier.qryAddSupplierProd.parambyname('Supplier').asinteger := parent.Supplier;
            dtmdlPOSupplier.qryAddSupplierProd.parambyname('Supplier_Product_Code').asstring := SupplierStockCode;
            dtmdlPOSupplier.qryAddSupplierProd.parambyname('Description').asstring := Description;
            dtmdlPOSupplier.qryAddSupplierProd.parambyname('Inactive').asstring := 'N';
            dtmdlPOSupplier.qryAddSupplierProd.ParambyName('Cost_Pack_Quantity').asinteger := self.CostUnit;
            dtmdlPOSupplier.qryAddSupplierProd.ParambyName('Sell_Pack_Quantity').asinteger := self.CostUnit;
            dtmdlPOSupplier.qryAddSupplierProd.parambyname('Price_Pointer').asinteger := iPricePointer;
            dtmdlPOSupplier.qryAddSupplierProd.execsql;
          end
        else
          begin
            if dtmdlPOSupplier.qryChkSupplierProd.fieldbyname('Unit_Cost').asfloat > 0 then
              exit
            else
              iPricePointer := dtmdlPOSupplier.qryChkSupplierProd.fieldbyname('Price_Pointer').asinteger;
          end;

        {Now add the cost price}
        dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := 0.00;
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := UnitCost;
	      dtmdlWorktops.qryAddPrice.execSQL;
      finally
        dtmdlPOSupplier.Free;
      end;
    end;
end;

procedure TPOLine.UpdateDB;
begin
  with FParent.FDataModule.qryPOUpdLine do
  begin
    ParamByName('Purchase_Order').AsInteger := FParent.DbKey;
    ParamByName('Line_no').AsInteger := POLNumber;

    Parambyname('Description').asstring := self.Description;

    Parambyname('Date_Received').asdatetime := self.DateReceived;
    Parambyname('Date_Required').asdatetime := self.DateRequired;
    ParambyName('Discount_Percentage').asfloat := self.DiscountPercentage;
    ParambyName('Price_Unit').asinteger := self.CostUnit;

    if self.StockItem = 0 then
      Parambyname('Stock_Item').clear
    else
      Parambyname('Stock_Item').asinteger := self.StockItem;

    ParambyName('Unit_Cost').asfloat := UnitCost;

    Parambyname('Quantity').asfloat := Quantity;

    if self.Worktop = 0 then
      ParambyName('Worktop').clear
    else
      ParambyName('Worktop').asinteger := self.Worktop;

    if self.Thickness = 0 then
      ParambyName('Thickness').clear
    else
      ParambyName('Thickness').asinteger := self.Thickness;

    ParambyName('Quantity_Delivered').asfloat := QtyDelivered;
    ParambyName('Quantity_Invoiced').asfloat := QtyInvoiced;

    ParambyName('Notes').asstring := self.Notes;
    ParambyName('Supplier_Product_Code').asstring := self.SupplierStockCode;

    if self.SalesOrder = 0 then
      begin
        ParambyName('Sales_Order').clear;
        ParambyName('Sales_Order_Line_no').clear;
      end
    else
      begin
        ParambyName('Sales_Order').asinteger := self.SalesOrder;
        ParambyName('Sales_Order_Line_no').asinteger := self.SalesOrderLineNo;
      end;

    ParambyName('Slab_Depth').asinteger := self.SlabDepth;
    ParambyName('Slab_Length').asinteger := self.SlabLength;
    ParambyName('Slab_Unit_Cost').asfloat := self.SlabUnitCost;
    ParambyName('Slab_Description').asstring := self.SlabDescription;

    ParambyName('GRN_Number').asstring := self.GRNNumber;
    ParambyName('DEL_Number').asstring := self.DELNoteNumber;

    ParambyName('Cost_Pack_Quantity').asinteger := self.CostUnit;

    if vat = 0 then
      ParambyName('Vat').clear
    else
      ParambyName('Vat').asinteger := Vat;
    ExecSQL;
  end;
end;

procedure TPOLine.SetCostUnit(const Value: integer);
begin
  FCostUnit := Value;
end;

procedure TPOLine.SetDateReceived(const Value: TDateTime);
begin
  FDateReceived := Value;
end;

procedure TPOLine.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TPOLine.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TPOLine.SetDiscountPercentage(const Value: double);
begin
  FDiscountPercentage := Value;
end;

procedure TPOLine.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TPOLine.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TPOLine.SetNotes(const Value: string);
begin
  FNotes := Value;
end;

procedure TPOLine.SetParent(const Value: TPOrder);
begin
  FParent := Value;
end;

procedure TPOLine.SetPOLNumber(const Value: integer);
begin
  FPOLNumber := Value;
end;

procedure TPOLine.SetQtyDelivered(const Value: double);
begin
  FQtyDelivered := Value;
end;

procedure TPOLine.SetQtyInvoiced(const Value: double);
begin
  FQtyInvoiced := Value;
end;

procedure TPOLine.SetQuantity(const Value: double);
begin
  FQuantity := Value;
end;

procedure TPOLine.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TPOLine.SetSalesOrderLineNo(const Value: integer);
begin
  FSalesOrderLineNo := Value;
end;

procedure TPOLine.SetSlabDepth(const Value: integer);
begin
  FSlabDepth := Value;
end;

procedure TPOLine.SetSlabDescription(const Value: string);
begin
  FSlabDescription := Value;
end;

procedure TPOLine.SetSlabLength(const Value: integer);
begin
  FSlabLength := Value;
end;

procedure TPOLine.SetStockItem(const Value: integer);
begin
  FStockItem := Value;
end;

procedure TPOLine.SetSupplierStockCode(const Value: string);
begin
  FSupplierStockCode := Value;
end;

procedure TPOLine.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TPOLine.SetThicknessMM(const Value: string);
begin
  FThicknessMM := Value;
end;

procedure TPOLine.SetUnitCost(const Value: currency);
begin
  FUnitCost := Value;
end;

procedure TPOLine.SetVat(const Value: integer);
begin
  FVat := Value;
end;

procedure TPOLine.SetVatRate(const Value: real);
begin
  FVatRate := Value;
end;

procedure TPOLine.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TPOLine.SetWorktopDescription(const Value: string);
begin
  FWorktopDescription := Value;
end;

function TdtmdlPurchaseOrder.UsingSearch: boolean;
begin
  if (SupplierName <> '') or
            (Description <> '') or
            (OfficeContact <> '') or
            (OperatorName <> '') or
            (Reference <> '') or
            (Status <> '') or
            (ShowLive) then
    result := true
  else
    result := false;
end;

function TdtmdlPurchaseOrder.GetNextPONumber: integer;
begin
  with qryPOGetLast do
    begin
      close;
      open;
      result := fieldbyname('Last_Purchase_Order_number').asinteger + 1;
    end;
end;

procedure TPOLine.SetSlabUnitCost(const Value: currency);
begin
  FSlabUnitCost := Value;
end;

function TdtmdlPurchaseOrder.GetSupplierContact(tempSupp: integer; var CID, CName: string): boolean;
begin
  with qryGetSupplierContact do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      open;

      if recordcount > 0 then
        begin
          CID := fieldbyname('Contact_no').asstring;
          CName := fieldbyname('Contact_Name').asstring;
          Result := true;
        end
      else
        Result := false;
    end;
end;

procedure TdtmdlPurchaseOrder.UpdateStatus(tmpPO, tmpStatus, tmpMultiplier: integer);
begin
  {Confirm Header Status}
  with qryUpPOStatus do
    begin
      close;
      parambyname('Purchase_Order').asinteger := tmpPO;
      parambyname('Purchase_Order_Status').asinteger := tmpStatus;
      execsql;
    end;

  {Confirm Purchase Order Lines}
  with qryUpPOLines do
    begin
      close;
      parambyname('Purchase_Order').asinteger := tmpPO;
      parambyname('Multiplier').asinteger := tmpMultiplier;
      execsql;
    end;
end;

procedure TdtmdlPurchaseOrder.DeletePurchaseOrder(iOrder: integer);
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Purchase_Order_Internal_Note WHERE Purchase_Order = ' + IntToStr(iOrder));
    ExecSQL;
  end;

  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Purchase_OrderLine WHERE Purchase_Order = ' + IntToStr(iOrder));
    ExecSQL;
  end;

  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Purchase_Order WHERE Purchase_Order =' + IntToStr(iOrder));
    ExecSQL;
  end;
end;

function TdtmdlPurchaseOrder.GetHeaderCountAll: integer;
begin
  result := qryAllPurchases.RecordCount;
end;

procedure TPOLine.LoadFromQuoteSlab;
var
  rSlabArea: real;
begin
  with parent.FDataModule.qryQuoteSlab do
  begin
    Close;
    ParamByName('Quote').AsInteger := parent.FDataModule.Quote;
    ParamByName('Slab_Number').AsInteger := parent.FDataModule.QuoteSlabNo;
    Open;

    if recordcount = 1 then
    begin
      Description := FieldByName('Thickness_mm').asstring + ' ' + FieldByName('Worktop_Description').asstring + ' ' + FieldByName('Material_Description').asstring;
      DiscountPercentage := 0.00;
      MaterialType := FieldByName('Material_Type').asinteger;
      Mode := 'C';
      QtyDelivered := 0;
      QtyInvoiced := 0;
      SalesOrder := parent.FDataModule.SalesOrder;
      SalesOrderLineNo := parent.FDataModule.SalesOrderLineNo;
      Thickness := FieldByName('Thickness').asinteger;
      ThicknessMM := FieldByName('Thickness_mm').asstring;
      Worktop := FieldByName('Worktop').asinteger;
      WorktopDescription := FieldByName('Worktop_Description').asstring;

      SlabDepth := FieldByName('Depth').asinteger;
      SlabLength := FieldByName('Length').asinteger;
      SlabDescription := '';

      rSlabArea := ((SlabDepth * SlabLength)/1000000);

      Quantity := FieldByName('Quantity').asinteger;;

      UnitCost := (rSlabArea * FieldByName('Unit_Cost').asfloat);
      CostUnit := 1;

      SlabUnitCost := (FieldByName('Unit_Cost').asfloat);

      SupplierStockCode := '';
    end;
  end;
end;

procedure TPOLine.SetGRNNumber(const Value: string);
begin
  FGRNNumber := Value;
end;

procedure TPOLine.SaveSOStatus;
var
  iStatus, tempStatus: integer;
begin
  with FParent.FDataModule.qryGetSOStatus do
  begin
    close;
    ParamByName('Sales_Order').AsInteger := self.SalesOrder;
    open;

    iStatus := fieldbyname('Sales_order_Status').asinteger;

    if (fieldbyname('total_Purchased').asinteger >= fieldbyname('total_Qty_To_Purchase').asinteger)  and
        (fieldbyname('total_Purchased').asinteger > 0) then
      tempStatus := 18
    else
      tempStatus := 16
  end;

  if iStatus > 16 then
    exit
  else
    begin
      with FParent.FDataModule.qryUpSOStatus do
        begin
          close;
          parambyname('Sales_Order').asinteger := self.SalesOrder;
          parambyname('Sales_Order_Status').asinteger := tempStatus;
          execsql;
        end;
    end;
end;

procedure TPOLine.SetDELNoteNumber(const Value: string);
begin
  FDELNoteNumber := Value;
end;

{ TPOEvent }

function TPOEvent.Clone: TPOEvent;
begin
  Result := TPOEvent.Create(FParent);
  Result.EventNumber    :=           self.EventNumber;
  Result.DateEntered    :=           self.DateEntered;
  Result.operator       :=           Self.Operator;
  Result.OperatorName   :=           self.OperatorName;
  Result.Narrative      :=           Self.Narrative;
end;

constructor TPOEvent.Create(POrder: TPOrder);
begin
  FParent := POrder;
  FNarrative := TNotes.Create;
end;

destructor TPOEvent.Destroy;
begin
  FNarrative.Free;
  inherited;
end;

procedure TPOEvent.LoadFromDB;
begin
  with FParent.FDataModule.qryPOEvent do
  begin
    Close;
    ParamByName('Purchase_Order').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    Open;
    DateEntered := FieldbyName('Date_Time_Entered').asdatetime;
    Narrative.dbkey := FieldbyName('Narrative').AsInteger;
    Operator := FieldbyName('Operator').asinteger;
    OperatorName := FieldbyName('Operator_Name').asstring;
    Close;
  end;
end;

procedure TPOEvent.SaveToDB;
begin
  Narrative.SavetoDB;
  with FParent.FDataModule.qryPOAddEvent do
  begin
    ParamByName('Purchase_Order').AsInteger := FParent.DbKey;
    ParamByName('Internal_Note').AsInteger := EventNumber;
    ParamByName('Operator').asinteger := Operator;
    Parambyname('Date_Time_Entered').Asdatetime := DateEntered;
    Parambyname('Narrative').asinteger := Narrative.dbKey;
    ExecSQL;
  end;
end;

procedure TPOEvent.SetDateEntered(const Value: TDateTime);
begin
  FDateEntered := Value;
end;

procedure TPOEvent.SetEventNumber(const Value: integer);
begin
  FEventNumber := Value;
end;

procedure TPOEvent.SetNarrative(const Value: TNotes);
begin
  FNarrative := Value;
end;

procedure TPOEvent.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TPOEvent.SetOperatorName(const Value: string);
begin
  FOperatorName := Value;
end;

procedure TPOEvent.SetParent(const Value: TPOrder);
begin
  FParent := Value;
end;

{ TPOEvents }

procedure TPOEvents.Add(aEvent: TPOEvent);
begin
  FItems.Add(aEvent);
end;

procedure TPOEvents.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TPOEvent(FItems[i]).Free;
end;

function TPOEvents.Clone: TPOEvents;
var
  i : integer;
begin
  Result := TPOEvents.Create(FParent);
  for i := 0 to Pred(FItems.Count) do
    Result.Add(TPOEvent(FItems[i]).Clone);
end;

constructor TPOEvents.Create(POrder: TPOrder);
begin
  FParent := POrder;
  FItems := TList.Create;
end;

procedure TPOEvents.Delete(const Index: integer);
begin
  FItems.Delete(Index);
end;

destructor TPOEvents.Destroy;
var
  i: integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TPOEvent(FItems[i]).Free;
  FItems.Free;
  inherited;
end;

function TPOEvents.GetCount: integer;
begin
  Result := FItems.Count;
end;

function TPOEvents.GetItems(Index: integer): TPOEvent;
begin
  Result := TPOEvent(FItems[Index]);
end;

function TPOEvents.IndexOf(const EventNo: integer): integer;
var
  i : integer;
begin
  Result := -1;
  for i := 0 to Pred(FItems.Count) do
    if TPOEvent(FItems[i]).EventNumber = EventNo then
      Result := i;
end;

procedure TPOEvents.Renumber;
var
  i : integer;
begin
  for i := 0 to Pred(FItems.Count) do
    TPOEvent(FItems[i]).EventNumber:= (i+1);
end;

procedure TPOEvents.SetItems(Index: integer; const Value: TPOEvent);
begin
  FItems[Index] := Value;

end;

end.
