unit STPOObjects;

interface

uses
  Classes, Forms, Dialogs, SysUtils, Controls, Contnrs, STSOObjects, STPODataMod, STSODataMod, Variants, CCSCommon,
  PBNarrativeDM, pbDatabase, Math;

type
  TExtraCharge = class
  private
    FDetails: string;
    FModified: boolean;
    FAmount: double;
    FNominal: string;
    FVatCode: integer;
    FVat: double;
    FNewCharge: boolean;
    procedure SetDetails(const Value: string);
    procedure SetModified(const Value: boolean);
    procedure SetAmount(const Value: double);
    procedure SetNominal(const Value: string);
    procedure SetVatCode(const Value: integer);
    procedure SetVat(const Value: double);
    procedure SetNewCharge(const Value: boolean);

  public
    property Details: string read FDetails write SetDetails;
    property Modified: boolean read FModified write SetModified;
    property Amount: double read FAmount write SetAmount;
    property Nominal: string read FNominal write SetNominal;
    property VatCode: integer read FVatCode write SetVatCode;
    property Vat: double read FVat write SetVat;
    property NewCharge: boolean read FNewCharge write SetNewCharge;
    constructor Create;
    procedure SaveToDB(STPODM: TSTPODM; PONum, ChargeNo: integer);
  end;

  TPurchaseOrderLine = class
  private
    FLineNo: integer;
    FQuantityAllocated: integer;
    FFullyReceived: ShortString;
    FQuantityOrdered: integer;
    FQuantityReceived: integer;
    FPurchPackQuantity: integer;
    FQuantitySent: integer;
    FGRNNo: ShortString;
    FPart: ShortString;
    FPurchasePrice: Currency;
    FDateDelivActual: TDateTime;
    FDateDelivExpected: TDateTime;
    FModified: boolean;
    FNewLine: boolean;
    FReplacementForLine: integer;
    FDiscount: real;
    FCostPrice: Currency;
    FQtyInvoiced: double;
    FOrigPurchasePrice: Currency;
    FOrigPurchPackQuantity: integer;
    FProductStatus: string;
    FLineIsSample: boolean;
    procedure SetLineNo(const Value: integer);
    procedure SetQuantityAllocated(const Value: integer);
    procedure SetFullyReceived(const Value: ShortString);
    procedure SetDateDelivActual(const Value: TDateTime);
    procedure SetDateDelivExpected(const Value: TDateTime);
    procedure SetGRNNo(const Value: ShortString);
    procedure SetPart(const Value: ShortString);
    procedure SetPurchasePrice(const Value: Currency);
    procedure SetPurchPackQuantity(const Value: integer);
    procedure SetQuantityOrdered(const Value: integer);
    procedure SetQuantityReceived(const Value: integer);
    procedure SetQuantitySent(const Value: integer);
    procedure SetModified(const Value: boolean);
    procedure SetNewLine(const Value: boolean);
    procedure SetReplacementForLine(const Value: integer);
    procedure SetDiscount(const Value: real);
    procedure SetCostPrice(const Value: Currency);
    procedure SetQtyInvoiced(const Value: double);
    procedure SetOrigPurchasePrice(const Value: Currency);
    procedure SetOrigPurchPackQuantity(const Value: integer);
    procedure SetProductStatus(const Value: string);
    procedure SetLineIsSample(const Value: boolean);
  public
    property LineNo: integer read FLineNo write SetLineNo;
    property QuantityAllocated: integer read FQuantityAllocated write SetQuantityAllocated;
    property FullyReceived: ShortString read FFullyReceived write SetFullyReceived;
    property QuantityOrdered: integer read FQuantityOrdered write SetQuantityOrdered;
    property Part: ShortString read FPart write SetPart;
    property ProductStatus: string read FProductStatus write SetProductStatus;
    property QuantityReceived: integer read FQuantityReceived write SetQuantityReceived;
    property DateDelivExpected: TDateTime read FDateDelivExpected write SetDateDelivExpected;
    property DateDelivActual: TDateTime read FDateDelivActual write SetDateDelivActual;
    property LineIsSample: boolean read FLineIsSample write SetLineIsSample;
    property PurchasePrice: Currency read FPurchasePrice write SetPurchasePrice;
    property GRNNo: ShortString read FGRNNo write SetGRNNo;
    property QuantitySent: integer read FQuantitySent write SetQuantitySent;
    property PurchPackQuantity: integer read FPurchPackQuantity write SetPurchPackQuantity;
    property Modified: boolean read FModified write SetModified;
    constructor Create;
    property NewLine: boolean read FNewLine write SetNewLine;
    property ReplacementForLine: integer read FReplacementForLine write SetReplacementForLine;
    property Discount: real read FDiscount write SetDiscount;
    property CostPrice: Currency read FCostPrice write SetCostPrice;
    property OrigPurchasePrice: Currency read FOrigPurchasePrice write SetOrigPurchasePrice;
    property OrigPurchPackQuantity: integer read FOrigPurchPackQuantity write SetOrigPurchPackQuantity;
    property QtyInvoiced: double read FQtyInvoiced write SetQtyInvoiced;
  end;

  TPurchaseOrder = class
  private
    FPurchOrdType: integer;
    FPartStore: integer;
    FPONumber: integer;
    FSupplier: integer;
    FSalesOrder: integer;
    FPartStoreFrom: integer;
    FBranchNo: integer;
    FPurchOrdNo: ShortString;
    FDescription: ShortString;
    FRecRef: ShortString;
    FPurchOrdStatus: ShortString;
    FPurchOrdDate: TDateTime;
    FSuppOrderType: ShortString;
    FDateRequired: TDateTime;
    FPOLines: TObjectList;
    FModified: boolean;
    FNewOrder: boolean;
    FOwner: TForm;
    FExtraCharges: TObjectList;
    FNarrative: integer;
    FDeliveryNotes: string;
    FVersionNo: integer;
    FSupplierAckNo: string;
    procedure SetBranchNo(const Value: integer);
    procedure SetDescription(const Value: ShortString);
    procedure SetPartStore(const Value: integer);
    procedure SetPartStoreFrom(const Value: integer);
    procedure SetPOLines(Index: integer; const value: TPurchaseOrderLine);
    procedure SetPONumber(const Value: integer);
    procedure SetPurchOrdDate(const Value: TDateTime);
    procedure SetPurchOrdNo(const Value: ShortString);
    procedure SetPurchOrdStatus(const Value: ShortString);
    procedure SetPurchOrdType(const Value: integer);
    procedure SetRecRef(const Value: ShortString);
    procedure SetSalesOrder(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetSuppOrderType(const Value: ShortString);
    procedure SetDateRequired(const Value: TDateTime);
    procedure SetModified(const Value: boolean);
    procedure SetNewOrder(const Value: boolean);
    procedure SetOwner(const Value: TForm);
    function GetPOLines(Index: integer):TPurchaseOrderLine;
    function GetExtraCharges(index: integer): TExtraCharge;
    procedure SetExtraCharges(index: integer; const Value: TExtraCharge);
    procedure SetNarrative(const Value: integer);
    procedure SetDeliveryNotes(const Value: string);
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    procedure SetVersionNo(const Value: integer);
    procedure SetSupplierAckNo(const Value: string);
  public
    property PONumber: integer read FPONumber write SetPONumber;
    property Description: ShortString read FDescription write SetDescription;
    property PartStore: integer read FPartStore write SetPartStore;
    property RecRef: ShortString read FRecRef write SetRecRef;
    property Supplier: integer read FSupplier write SetSupplier;
    property BranchNo: integer read FBranchNo write SetBranchNo;
    property PurchOrdNo: ShortString read FPurchOrdNo write SetPurchOrdNo;
    property PurchOrdStatus: ShortString read FPurchOrdStatus write SetPurchOrdStatus;
    property PurchOrdDate: TDateTime read FPurchOrdDate write SetPurchOrdDate;
    property PartStoreFrom: integer read FPartStoreFrom write SetPartStoreFrom;
    property PurchOrdType: integer read FPurchOrdType write SetPurchOrdType;
    property DeliveryNotes: string read FDeliveryNotes write SetDeliveryNotes;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property SupplierAckNo: string read FSupplierAckNo write SetSupplierAckNo;
    constructor Create(SO: TSalesOrder; STPODM: TSTPODM);overload;
    constructor Create(PurchOrdNumber: string; STPODM: TSTPODM);overload;
    procedure SaveToDB(STPODM: TSTPODM);
    procedure SaveStatus(STPODM: TSTPODM; tmpStatus: string);
    destructor Destroy; override;
    function CreateTextFile(STPODM: TSTPODM; STSalesOrdDM: TSTSalesOrdDM; SalesOrder: TSalesOrder):String;overload;
    function CreateTextFile(STPODM: TSTPODM):String;overload;
    function CreateXMLFile(STPODM: TSTPODM; STSalesOrdDM: TSTSalesOrdDM; SalesOrder: TSalesOrder): String;
    function CalcOrderValue: double;
    procedure UpdateDBRecords(STPODM: TSTPODM);
    property Narrative: integer read FNarrative write SetNarrative;
    property SuppOrderType: ShortString read FSuppOrderType write SetSuppOrderType;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property POLines[index: integer]: TPurchaseOrderLine read GetPOLines write SetPOLines;
    function AddLine(aProdCode, aReplacedLineNo: string; anOrdQty, aDelQty, aPackSize: integer;
      aPackCost: double): integer;
    function AddSOLine(STPODM: TSTPODM; aProdCode, aReplacedLineNo: string;
      aOrdQty, aDelQty, aPackSize: integer; aPackCost: double): integer;
    property Modified: boolean read FModified write SetModified;
    property NewOrder: boolean read FNewOrder write SetNewOrder;
    property Owner: TForm read FOwner write SetOwner;
    function NumberOfLines: integer;
    function AddPart(STPODM: TSTPODM; tmpPart, tmpDescription: string; tmpPackQty: integer; tmpCost: real): string;
    function SupplierCanEDI(STPODM: TSTPODM): boolean;
    function SupplierAccountCode(STPODM: TSTPODM): string;
    function SupplierAccountPWord(STPODM: TSTPODM): string;
    function SupplierSiteURL(STPODM: TSTPODM): string;
    function SupplierName(STPODM: TSTPODM): string;
    function SupplierTransferType(STPODM: TSTPODM): string;
    property ExtraCharges[index: integer]: TExtraCharge read GetExtraCharges write SetExtraCharges;
    property VersionNo: integer read FVersionNo write SetVersionNo;
    function AddExtraCharge(anAmount, theVAT: Double; theDetails, aNominal: String;
      aVatCode: integer): integer;
  end;

    const
    {Purchase Order Maintenance Function Modes}
    poAdd                   ='A';
    poChange                ='C';
    poDelete                ='D';
    poView                  ='S';

   { Utility functions }

{ If passed a string or a float, FormatMoney will return a string.  An
  error message will be displayed if the value is invalid or -ve. }
function FormatMoney(const Money: variant): string;

implementation

const
  xmlTab1 = #9;
  xmlTab2 = #9 + #9;
  xmlTab3 = #9 + #9 + #9;

function FormatMoney(const Money: variant): string;
begin
  if VarType(Money) = VarString then
  begin
    if Trim(Money) = '' then
    begin
      Result := '0.00';
      Exit;
    end;
  end;
  try
    begin
      if VarType(Money) = VarString then
        Result := FormatFloat('######0.00', StrToFloat(Money))
      else
        Result := FormatFloat('######0.00', Money);
      if StrToFloat(Result) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except
    if VarType(Money) = VarString then
      MessageDlg('Invalid financial value - ' + Money, mtError, [mbOK], 0)
    else
      MessageDlg('Invalid financial value', mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

{ TPurchaseOrderLine }

constructor TPurchaseOrderLine.Create;
begin
  inherited Create;
  self.QtyInvoiced := 0;
  Modified := False;
  NewLine := True;
end;

procedure TPurchaseOrderLine.SetCostPrice(const Value: Currency);
begin
  FCostPrice := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetDateDelivActual(const Value: TDateTime);
begin
  FDateDelivActual := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetDateDelivExpected(const Value: TDateTime);
begin
  FDateDelivExpected := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetDiscount(const Value: real);
begin
  FDiscount := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetFullyReceived(const Value: ShortString);
begin
  FFullyReceived := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetGRNNo(const Value: ShortString);
begin
  FGRNNo := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetLineNo(const Value: integer);
begin
  FLineNo := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetModified(const Value: boolean);
begin
  FModified := Value;
end;

procedure TPurchaseOrderLine.SetNewLine(const Value: boolean);
begin
  FNewLine := Value;
end;

procedure TPurchaseOrderLine.SetPart(const Value: ShortString);
begin
  FPart := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetPurchasePrice(const Value: Currency);
begin
  FPurchasePrice := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetPurchPackQuantity(const Value: integer);
begin
  FPurchPackQuantity := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetQuantityAllocated(const Value: integer);
begin
  FQuantityAllocated := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetQtyInvoiced(const Value: double);
begin
  FQtyInvoiced := Value;
end;

procedure TPurchaseOrderLine.SetQuantityOrdered(const Value: integer);
begin
  FQuantityOrdered := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetQuantityReceived(const Value: integer);
begin
  FQuantityReceived := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetQuantitySent(const Value: integer);
begin
  FQuantitySent := Value;
  Modified := True;
end;

{ TPurchaseOrder }

//Adds a PurchaseOrderLine Object to the list within the PurchaseOrder Object
//Returns the list index of the new line.
function TPurchaseOrder.AddExtraCharge(anAmount, theVAT: Double; theDetails,
  aNominal: String; aVatCode: integer): integer;
var
  indexNo: integer;
begin
  indexNo := FExtraCharges.Add(TExtraCharge.Create);
  with (ExtraCharges[indexNo]) do
  begin
    Amount := anAmount;
    Details := theDetails;
    Nominal := aNominal;
    Vat := theVat;
    VatCode := aVatCode;
  end;
  Result := indexNo;
end;

function TPurchaseOrder.AddLine(aProdCode, aReplacedLineNo: string; anOrdQty, aDelQty,
  aPackSize: integer; aPackCost: double): integer;
var
  indexNo : integer;
begin
  indexNo := FPOLines.Add(TPurchaseOrderLine.Create);
  with (POLines[indexNo]) do
  begin
    Part := aProdCode;
    QuantityOrdered := anOrdQty;
    QuantityReceived := aDelQty;
    QuantitySent := aDelQty;
    PurchPackQuantity := aPackSize;
    PurchasePrice := aPackCost;
    ReplacementForLine := StrToInt(aReplacedLineNo);
  end;
  Result := indexNo;
end;

function TPurchaseOrder.AddSOLine(STPODM: TSTPODM; aProdCode, aReplacedLineNo: string; aOrdQty, aDelQty,
  aPackSize: integer; aPackCost: double): integer;
var
  indexNo : integer;
  iVatCode: integer;
  rSellPrice: real;
  iSellPackSize: integer;
begin
  with STPODM.qryGetLastSOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := self.SalesOrder;
      open;
      indexNo := fieldbyname('Max_Line_No').asinteger + 1;
    end;

  with STPODM.qryGetPartDet do
    begin
      close;
      parambyname('Part').asstring := aProdCode;
      open;
      rSellPrice := fieldbyname('Part_Cost_Cat').asfloat;
      iSellPackSize := fieldbyname('Sell_Pack_Quantity').asinteger;
      iVatCode := fieldbyname('Vat_Code').asinteger;
    end;

  with STPODM.qryInsSOLine do
    begin
      close;
      parambyname('Sales_Order').asinteger := self.SalesOrder;
      parambyname('Line').asinteger := indexNo;
      parambyname('Part').asstring := aProdCode;
      parambyname('Part_Cost').asfloat := aPackCost;
      parambyname('Purch_Pack_Quantity').asinteger := aPackSize;
      parambyname('Part_Sales_Price').asfloat := rSellPrice;
      parambyname('Sell_Pack_Quantity').asinteger := iSellPackSize;
      parambyname('Quantity_Ordered').asinteger := aOrdQty;
      parambyname('Quantity_Allocated').asinteger := aOrdQty;
      parambyname('Quantity_Delivered').asinteger := aOrdQty;
      parambyname('Contract').clear;
      parambyname('Contract_Line_No').clear;
      parambyname('Sales_Order_line_Status').asinteger := 10;
      parambyname('Quantity_Invoiced').asinteger := 0;
      parambyname('Discount_Type').asstring := '';
      Parambyname('Discount_Value').asfloat := 0;
      Parambyname('Vat_Code').asinteger := iVatCode;
      Parambyname('Original_Sell_Price').asfloat := rSellPrice;
      Parambyname('Markup_Type').clear;
      Parambyname('Markup_Value').asfloat := 0;
      Parambyname('Quantity_Overs').asinteger := 0;
      parambyname('Replacement_For_Line').asinteger := strtoint(aReplacedLineNo);
      execsql;
    end;
  Result := indexNo;
end;

function TPurchaseOrder.CalcOrderValue: double;
var
  x: integer;
  Total : double;
begin
  Total := 0.00;
//loop thru PO Lines
  for x := 0 to Pred(Self.FPOLines.Count) do
  begin
    with (Self.POLines[x]) do
    begin
      Total := Total + ((QuantityOrdered * PurchasePrice)/PurchPackQuantity);
    end;
  end;
  for x:= 0 to Pred(Self.fExtraCharges.Count) do
  begin
    with (Self.ExtraCharges[x]) do
    begin
      Total := Total + (Amount);
    end;
  end;
  Result := Total;
end;

constructor TPurchaseOrder.Create(SO: TSalesOrder; STPODM: TSTPODM);
var
  x : integer;
  lineNo : integer;
  CompanyDiscountPerc, ItemDiscountPerc : double;
  Discounted : String;
begin
  inherited Create;
  Description := SO.CustomerName;
  PartStore := SO.PartStore;
  RecRef := '';
  Supplier := SO.Supplier;
  BranchNo := SO.BranchNo0;
  PurchOrdNo := '';
  PurchOrdStatus := 'C';
  PurchOrdDate := Date;
  //PurchOrdType := 4;
  Narrative := SO.SONarrative;
  DeliveryNotes := SO.DeliveryNotes;
  SalesOrder := SO.SONumber;
  SuppOrderType := SO.SupplierOrderType;
  DateRequired := SO.DateReq;
  FPOLines := TObjectList.Create;
  FExtraCharges := TObjectList.Create;

  //get discount amount
  with STPODM.qryGetSupplierInfo do
  begin
    close;
    ParamByName('Supplier').AsInteger := Supplier;
    open;
    CompanyDiscountPerc := FieldByName('Discount').AsFloat;
    close;
  end;

  //loop thru SO Lines to create PO Lines
  for x := 0 to (SO.OrderLines.Count - 1) do
  begin
    //get purchase price from part table.
    with STPODM.qryGetPartDet do
      begin
        close;
        ParamByName('Part').AsString := SO.OrderLines.Lines[x].Part;
        Open;
        if fieldbyname('Product_Class').asstring = 'STK' then
          continue;
      end;

    lineNo := FPOLines.Add(TPurchaseOrderLine.Create);
    with (POLines[lineNo]) do
    begin
      DateDelivExpected := SO.DateReq;
      FullyReceived := 'N';
      LineNo := x;
      Part := SO.OrderLines.Lines[x].Part;
      //check if part is discounted
      with STPODM.qryGetSuppPartInfo do
      begin
        close;
        ParamByName('Supplier').AsInteger := Supplier;
        ParamByName('Part').AsString := Part;
        Open;
        Discounted := FieldByName('Discount_this_Part').AsString;
        ItemDiscountPerc := FieldByName('Discount').AsFloat;
        Close;
      end;

      CostPrice := STPODM.qryGetPartDet.FieldByName('Part_Purchase_Price').AsCurrency;

      if ItemDiscountPerc = 0 then
      //no discount specific to item so check if company discount applies.
      //item specific discounts override company discounts
      begin
        //company discount applies
        if Discounted = 'Y' then
        begin
          PurchasePrice := ((CostPrice)*((100-CompanyDiscountPerc)/100));
          Discount := CompanyDiscountPerc;
        end
        else
        //no discounts apply
        begin
          PurchasePrice := CostPrice;
          Discount := 0;
        end;
      end
      else
      //item discount perc <> 0 so apply item specific discount.
      begin
        PurchasePrice := ((CostPrice)*((100-ItemDiscountPerc)/100));
        Discount := ItemDiscountPerc;
      end;

      if SO.OrderLines[x].Part_Cost < PurchasePrice then
        PurchasePrice := SO.OrderLines[x].Part_Cost;

      PurchPackQuantity := STPODM.GetPartPurchPackQuant(Part);
      QuantityAllocated := 0;
      QuantityOrdered := SO.OrderLines.Lines[x].OrdQty;
      QuantityReceived := 0;
      QuantitySent := 0;
      LineIsSample := SO.OrderLines.Lines[x].LineIsSample;
    end;
  end;

   //loop thru SO Extra Charges to create PO Extra Charges

  for x := 0 to (so.ExtraCharges.Count - 1) do
  begin
    lineNo := FExtraCharges.Add(TExtraCharge.Create);
    with (ExtraCharges[lineNo]) do
    begin
      Details := SO.ExtraCharges[x].Details;
      Amount := SO.ExtraCharges[x].Cost;
      Nominal := SO.ExtraCharges[x].NominalCode;
      VatCode := So.ExtraCharges[x].ChgVatCode;
      NewCharge := True;
      Modified := False;
    end;
  end;
  NewOrder := True;
end;

constructor TPurchaseOrder.Create(PurchOrdNumber: string; STPODM: TSTPODM);
var
  lineNo : Integer;
begin
  inherited Create;

  //Load the PO Header Details from the DataModule
  with STPODM.qryGetPO do
  begin
    paramByName('PurchOrdNo').AsString := PurchOrdNumber;
    open;
    Self.PONumber := FieldByName('Purch_Ord').AsInteger;
    Self.Description := FieldByName('Purch_Ord_Descr').AsString;
    Self.PartStore := FieldByName('Part_Store').AsInteger;
    Self.RecRef := FieldByname('Purch_Ord_Rec_Ref').AsString;
    Self.Supplier := FieldByName('Supplier').AsInteger;
    Self.BranchNo := FieldByName('Branch_no').AsInteger;
    Self.PurchOrdNo := PurchOrdNumber;
    Self.PurchOrdStatus := FieldByName('Purch_Ord_Status').AsString;
    Self.PurchOrdDate := FieldByName('Purch_Ord_Date').AsDateTime;
    Self.PartStoreFrom := FieldByName('Part_Store_From').AsInteger;
    Self.PurchOrdType := FieldByName('Purch_Ord_Type').AsInteger;
    Self.SalesOrder := FieldByName('Sales_order').AsInteger;
    Self.SuppOrderType := FieldByName('Supp_Order_Type').AsString;
    Self.DateRequired := FieldByName('Date_Required').AsDateTime;
    Self.VersionNo := FieldByName('Version_no').asinteger;
    Self.SupplierAckNo := FieldByName('Supplier_Ack_Number').asstring;
    close;
  end;

  FPOLines := TObjectList.Create;

  //Load lines from datamodule.
  with STPODM.qryGetPOLines2 do
  begin
    paramByName('PONum').AsInteger := Self.PONumber;
    open;
    first;
    while not EOF do
    begin
      lineNo := Self.FPOLines.Add(TPurchaseOrderLine.Create);
      with (POLines[lineNo]) do
      begin
        LineNo := FieldByName('Purch_Ord_Line_No').AsInteger;
        QuantityAllocated := FieldByName('Quantity_Allocated').AsInteger;
        FullyReceived := FieldByName('Fully_Received').AsString;
        QuantityOrdered := FieldByName('Quantity_Ordered').AsInteger;
        Part := FieldByName('Part').AsString;
        QuantityReceived := FieldByName('Quantity_Received').AsInteger;
        DateDelivExpected := FieldByName('Date_Deliv_Expected').AsDateTime;
        DateDelivActual := FieldByName('Date_Deliv_Actual').AsDateTime;
        PurchasePrice := FieldByName('Purchase_Price').AsCurrency;
        GRNNo := FieldByName('GRN_No').AsString;
        QuantitySent := FieldByName('Quantity_Sent').AsInteger;
        PurchpackQuantity := FieldByName('Purch_Pack_Quantity').AsInteger;
        ReplacementForLine := FieldByName('Replacement_For_Line').AsInteger;
        Discount := FieldByName('Discount').AsFloat;
        CostPrice := FieldByname('Cost_Price').AsCurrency;
        OrigPurchasePrice := fieldbyname('Original_Purchase_Price').asfloat;
        OrigPurchpackQuantity := FieldByName('Original_Purch_Pack_Qty').AsInteger;
        ProductStatus := FieldByName('Product_Status').AsString;
        LineIsSample := (FieldByName('Line_Is_Sample').AsString = 'Y');
        Modified := False;
        NewLine := False;
      end;
      next;
    end;
    close;
  end;

  FExtraCharges := TObjectList.Create;
  //load extra charges
  with STPODM.qryGetExChgs do
  begin
    Close;
    ParamByName('Purch_Ord').AsInteger := Self.PONumber;
    Open;
    while not EOF do
    begin
      Self.AddExtraCharge(FieldByName('Amount').AsFloat,
                          FieldByName('Amount').AsFloat * STPODM.GetVatRate(FieldByName('Vat_Code').AsInteger),
                          FieldByName('Details').AsString,
                          FieldByName('Nominal').AsString,
                          FieldByName('Vat_Code').AsInteger);
      Next;
    end;
  end;

  Self.Modified := False;
  Self.NewOrder := False;
end;

function TPurchaseOrder.CreateXMLFile(STPODM: TSTPODM; STSalesOrdDM:TSTSalesOrdDM; SalesOrder: TSalesOrder):String;
var
  ifield, ilines: integer;
  CustName, CustBranch: string;
  XMLFile : TextFile;
  XMLFileName : string;
  XMLFileLoc, XMLArchiveLoc : string;
  tempstr, tempFile: string;
  SIDN, CIDN: string;
  PODate, ReqDate: string;
  SearchRec : TSearchRec;
  //local procedure used to cut illegal chars from XML text file lines.
  //used mainly to cut apostrophes from delivery address lines and cust names
  procedure RemoveBadChars(BadChar: string; var theString: String);
  begin
    while (Pos(BadChar, theString)) <> 0 do
    begin
      Delete(theString, (Pos(BadChar, theString)), Length(BadChar));
    end;
  end;
begin
//initialise variables
  POdate := FormatDateTime('yyyy"-"mm"-"dd"T"hh:mm:ss', now);
  ReqDate := FormatDateTime('yyyy"-"mm"-"dd', now);
//get save location
  XMLFileLoc := dmBroker.GetCompanyTransferDirectory+'\out\';
  XMLArchiveLoc := dmBroker.GetCompanyTransferDirectory+'\out\archive\';

//get supplier specific info
  STPODM.GetSupplierInfo(Self.Supplier, SIDN, CIDN);

//set text file name
  XMLFileName := XMLArchiveLoc + CIDN + '_' + Self.PurchOrdNo +'q.xs';

//check if previous copy of file has been sent already, and stored in archive folder
  if FindFirst(XMLFileName, faAnyFile, SearchRec) = 0 then
  begin
  //File Already exists, warn of file overwrite
    if MessageDlg('An XML Text file has been sent to the supplier for this order.'+#10#13+
                  'It was sent on '+DateTimeToStr(FileDateToDateTime(SearchRec.Time))+#10#13+
                  'Do you want to continue and resend the order?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      FindClose(SearchRec);
      exit;
    end
    else
      self.VersionNo := self.VersionNo + 1;
  end;
  FindClose(SearchRec);

  XMLFileName := XMLFileLoc + CIDN + '_' + Self.PurchOrdNo +'q.xs';
//check if file exists already
  if FindFirst(XMLFileName, faAnyFile, SearchRec) = 0 then
  begin
  //File Already exists, warn of file overwrite
    if MessageDlg('An XML Text file already exists for this order.'+#10#13+
                  'It was created on '+DateTimeToStr(FileDateToDateTime(SearchRec.Time))+#10#13+
                  'Do you want to continue and overwrite the file?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      FindClose(SearchRec);
      exit;
    end
    else
      self.VersionNo := self.VersionNo + 1;
  end;
  FindClose(SearchRec);

  CreateNewXMLFile(XMLFileName);

//write file header info
  tempstr := '<?xml version="1.0"?>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := '<?xml-stylesheet type="text/xsl" href="order.xslt"?>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := '<Order xsi:schemaLocation=''urn:schemas-basda-org:2000:purchaseOrder:xdr:3.01 order-v3.xsd '
          + 'urn:schemas-bossfed-co-uk:OP-Order-v1 OP-Order-v1.xsd'''
          + ' xmlns:xsi=''http://www.w3.org/2001/XMLSchema-instance'''
          + ' xmlns=''urn:schemas-basda-org:2000:purchaseOrder:xdr:3.01''>';
  WriteXMLProperty(XMLFilename,tempstr);

//write order header
  tempstr := '<OrderHead>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<Schema>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'Version','3.05');

  tempstr := xmlTab1 + '</Schema>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<Parameters>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'Language','en-GB');
  WriteXMLLine(XMLFileName,'DecimalSeparator','.');
  WriteXMLLine(XMLFileName,'Precision','20.3');

  tempstr := xmlTab1 + '</Parameters>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := '<OrderType Code=''PUO''>Purchase Order</OrderType>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<OrderCurrency>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab2 + '<Currency Code=''GBP''>GB Pounds Sterling</Currency>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '</OrderCurrency>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'Checksum','');

  tempstr := '</OrderHead>';
  WriteXMLProperty(XMLFilename,tempstr);

//Order References
  tempstr := '<OrderReferences>';
  WriteXMLProperty(XMLFilename,tempstr);

  with STSalesOrdDM.GetCustSQL do
    begin
      close;
      parambyname('Customer').asinteger := SalesOrder.Customer;
      open;

      if (recordcount > 0) and (trim(fieldbyname('Contract_Code').asstring) <> '') then
        begin
          tempstr := '<ContractOrderReference>'+trim(fieldbyname('Contract_Code').asstring)+'</ContractOrderReference>';
          WriteXMLProperty(XMLFilename,tempstr);
        end;
    end;

  if self.VersionNo = 0 then
    tempstr := '<BuyersOrderNumber Preserve=''true''>'+Self.PurchOrdNo+'</BuyersOrderNumber>'
  else
    tempstr := '<BuyersOrderNumber Preserve=''true''>'+Self.PurchOrdNo+'/'+inttostr(self.versionNo)+'</BuyersOrderNumber>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := '</OrderReferences>';
  WriteXMLProperty(XMLFilename,tempstr);

//Additional Order References
  tempstr := '<OP:AdditionalOrderReferences xmlns:OP="urn:schemas-bossfed-co-uk:OP-Order-v1">';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<OP:OrderReference ReferenceType="TYP" ReferenceDesc="Order Type">';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'OP:Reference',self.SuppOrderType);

  tempstr := xmlTab1 + '</OP:OrderReference>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<OP:OrderReference ReferenceType="DSO" ReferenceDesc="Dealers Order Number">';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'OP:Reference',inttostr(SalesOrder.SONumber));

  tempstr := xmlTab1 + '</OP:OrderReference>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<OP:OrderReference ReferenceType="ERF" ReferenceDesc="EndUsers Reference">';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'OP:Reference',SalesOrder.CustOrderNo);

  tempstr := xmlTab1 + '</OP:OrderReference>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := '</OP:AdditionalOrderReferences>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'OrderDate',PODate);

//Supplier
  tempstr := '<Supplier>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'Party',self.SupplierName(STPODM));

  tempstr := '</Supplier>';
  WriteXMLProperty(XMLFilename,tempstr);

//Buyer
  tempstr := '<Buyer>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<BuyerReferences>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'SuppliersCodeForBuyer',CIDN);

  tempstr := xmlTab1 + '</BuyerReferences>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'Party',dmBroker.GetCompanyName);

  tempstr := '</Buyer>';
  WriteXMLProperty(XMLFilename,tempstr);

//Delivery Details
  with STSalesOrdDM.qryGetSODelivAdd do
    begin
      close;
      parambyname('Sales_Order').AsInteger := SalesOrder.SONumber;
      open;

      CustName := FieldByName('Customer_Name').AsString;
      CustBranch := FieldbyName('Branch_Name').asstring;
      if FieldByName('Postcode').AsString = '' then
        begin
          MessageDlg('There is no Post Code for the selected delivery address'+#13#10+
                    'Please enter a Post Code for this Customer: '+CustName+ ', Branch: '+CustBranch, mtWarning, [mbOK], 0);
          CloseFile(XMLFile);
          DeleteFile(XMLFileName);
          Result := '';
          exit;
        end;
    end;
  tempstr := '<Delivery>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '<DeliverTo>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'Party',STSalesOrdDM.qryGetSODelivAdd.fieldbyname('Customer_Name').asstring);

  tempstr := xmlTab2 + '<Address>';
  WriteXMLProperty(XMLFilename,tempstr);

  if trim(SalesOrder.FAO) <> '' then
    WriteXMLLine(XMLFileName,'AddressLine',SalesOrder.FAO);

  for ifield := 5 to 8 do
    WriteXMLLine(XMLFileName,'AddressLine',STSalesOrdDM.qryGetSODelivAdd.fields[ifield].asstring);

  WriteXMLLine(XMLFileName,'Postcode',STSalesOrdDM.qryGetSODelivAdd.fieldbyname('Postcode').asstring);

  tempstr := xmlTab2 + '</Address>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab2 + '<Contact>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'Name',SalesOrder.ContactName);

  tempstr := xmlTab2 + '</Contact>';
  WriteXMLProperty(XMLFilename,tempstr);

  tempstr := xmlTab1 + '</DeliverTo>';
  WriteXMLProperty(XMLFilename,tempstr);

  WriteXMLLine(XMLFileName,'LatestAcceptableDate',ReqDate);

  tempstr := '</Delivery>';
  WriteXMLProperty(XMLFilename,tempstr);

//loop thru lines
  for iLines := 0 to Pred(Self.FPOLines.Count) do
  begin
  //write line info
    with ((Self.POLines[iLines])) do
    begin
      tempstr := '<OrderLine>';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab1 + '<LineNumber Preserve=''true''>'+inttostr(Self.POLines[iLines].LineNo)+'</LineNumber>';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab1 + '<OrderLineReferences>';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab3 + '<BuyersOrderLineReference Preserve="true">Line Ref '+inttostr(Self.POLines[iLines].LineNo)+'</BuyersOrderLineReference>';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab1 + '</OrderLineReferences>';
      WriteXMLProperty(XMLFilename,tempstr);

//Additional Order Line References
      tempstr := xmlTab1 + '<OP:AdditionalOrderLineReferences xmlns:OP="urn:schemas-bossfed-co-uk:OP-Order-v1">';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab2 + '<OP:OrderLineReference ReferenceDesc="Back Order Flag">';
      WriteXMLProperty(XMLFilename,tempstr);

      WriteXMLLine(XMLFileName,'OP:Reference','Y');

      tempstr := xmlTab2 + '</OP:OrderLineReference>';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab1 + '</OP:AdditionalOrderLineReferences>';
      WriteXMLProperty(XMLFilename,tempstr);

//Product
      tempstr := xmlTab1 + '<Product>';
      WriteXMLProperty(XMLFilename,tempstr);

      WriteXMLLine(XMLFileName,'SuppliersProductCode',Part);

      tempstr := xmlTab1 + '</Product>';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab1 + '<Quantity>';
      WriteXMLProperty(XMLFilename,tempstr);

      WriteXMLLine(XMLFileName,'PackSize',inttostr(PurchPackQuantity));
      WriteXMLLine(XMLFileName,'Amount',inttostr(ceil(QuantityOrdered/PurchPackQuantity)));

      tempstr := xmlTab1 + '</Quantity>';
      WriteXMLProperty(XMLFilename,tempstr);

      tempstr := xmlTab1 + '<Price>';
      WriteXMLProperty(XMLFilename,tempstr);

      WriteXMLLine(XMLFileName,'UnitPrice',formatfloat('##0.00',PurchasePrice));

      tempstr := xmlTab1 + '</Price>';
      WriteXMLProperty(XMLFilename,tempstr);

      WriteXMLLine(XMLFileName,'LineTotal',formatfloat('##0.00',(PurchasePrice*QuantityOrdered)));

      tempstr := '</OrderLine>';
      WriteXMLProperty(XMLFilename,tempstr);
    end;
  end;

  tempstr := '</Order>';
  WriteXMLProperty(XMLFilename,tempstr);

//update header status to G for printed
  if Self.PurchOrdStatus < 'G' then
    Self.PurchOrdStatus := 'G';

  tempfile := CIDN + '_' + Self.PurchOrdNo +'q.xs';

  //return the name of the file created
  Result := tempFile;
end;

function TPurchaseOrder.CreateTextFile(STPODM: TSTPODM; STSalesOrdDM:TSTSalesOrdDM; SalesOrder: TSalesOrder):String;
var
//This type of file is for direct delivery orders, orders where the goods are to be delivered
//direct to the end user.
//Kingfields service code is DO (Direct Orders)
  EDIFile : TextFile;
  EDIFileName : string;
  EDIFileLoc, EDIArchiveLoc : string;
  STX, MHD, TYP, SDT, CDT, FIL, MTR, CLO, ORD, DIN, DNA, COD, DNB, OTR, OFT : string;
  TTYP, SIDN, CIDN, CNAM, CADD, RTEX : String;
  NOSG : integer;
  DateStrDDMMYY : String;
  blockNo, x : integer;
  SearchRec : TSearchRec;
  //local procedure used to cut illegal chars from EDI text file lines.
  //used mainly to cut apostrophes from delivery address lines and cust names
  procedure RemoveBadChars(BadChar: string; var theString: String);
  begin
    while (Pos(BadChar, theString)) <> 0 do
    begin
      Delete(theString, (Pos(BadChar, theString)), Length(BadChar));
    end;
  end;

begin
//initialise variables
  NOSG := 0;
  blockNo := 1;
  DateStrDDMMYY := FormatDateTime('yymmdd', now);
//get save location
  EDIFileLoc := 'C:\KCOMM\REQUEST\DO\';
  EDIArchiveLoc := 'C:\KCOMM\ARCHIVE\DO\';

//check for EDI directory
  //Turn off error trapping of I/O errors, we want to display our own error message.
  {$I-}
  ChDir(EDIFileLoc);
  if IOResult <> 0 then
  begin
    MessageDlg('Cannot find the KCOMM request directory.'+#13#10+
               'This procedure should only be used on computers with the KCOMM software installed.', mtWarning, [mbOk], 0);
    exit;
  end;
  {$I+}

//get supplier specific info
  STPODM.GetSupplierInfo(Self.Supplier, SIDN, CIDN);

//set text file name
  EDIFileName := EDIArchiveLoc + Self.PurchOrdNo +'q.do';

//check if previous copy of file has been sent already, and stored in archive folder
  if FindFirst(EDIFileName, faAnyFile, SearchRec) = 0 then
  begin
  //File Already exists, warn of file overwrite
    if MessageDlg('An EDI Text file has been sent to the supplier for this order.'+#10#13+
                  'It was sent on '+DateTimeToStr(FileDateToDateTime(SearchRec.Time))+#10#13+
                  'Do you want to continue and resend the order?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      FindClose(SearchRec);
      exit;
    end;
  end;
  FindClose(SearchRec);

  EDIFileName := EDIFileLoc + Self.PurchOrdNo +'q.do';
//check if file exists already
  if FindFirst(EDIFileName, faAnyFile, SearchRec) = 0 then
  begin
  //File Already exists, warn of file overwrite
    if MessageDlg('An EDI Text file already exists for this order.'+#10#13+
                  'It was created on '+DateTimeToStr(FileDateToDateTime(SearchRec.Time))+#10#13+
                  'Do you want to continue and overwrite the file?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      FindClose(SearchRec);
      exit;
    end;
  end;
  FindClose(SearchRec);    

//create text file
  AssignFile(EDIFile, EDIFileName);
  Rewrite(EDIFile);

//write file header info
  STX := 'STX=ANA:1+' + CIDN + '+' + SIDN + '+';
  STX := STX + FormatDateTime('yymmdd:hhnnss', now);
  STX := STX + '+10++CORHDR''';
  WriteLn(EDIFile, STX);

  MHD := 'MHD=' + IntToStr(blockNo) + '+CORHDR:6''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, MHD);

  TYP := 'TYP=0430+';
  TTYP := Self.SuppOrderType;
  TYP := TYP + TTYP + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, TYP);

  SDT := 'SDT=' + SIDN + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, SDT);

  CDT := 'CDT=:'+ CIDN + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, CDT);

  FIL := 'FIL=' + IntToStr((StrToInt(Self.PurchOrdNo) mod 10000))+'+'+IntToStr((StrToInt(Self.PurchOrdNo) div 10000))+'+'+ DateStrDDMMYY + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, FIL);

//NOSG is the number of lines of text in this section.
  NOSG := NOSG + 1;
  MTR := 'MTR=' + IntToStr(NOSG) +'''';
  WriteLn(EDIFile, MTR);
  NOSG := 0;

//write PO header info
  blockNo := blockNo + 1;
  MHD := 'MHD=' + IntToStr(blockNo) + '+CORDER:6''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, MHD);

//if order type is PWD or PWL get delivery address string
  CLO := 'CLO=::' + CIDN;
  if (TTYP = 'PWD') or (TTYP = 'PWL') then
  begin
    if STSalesOrdDM.GetDelAddr(Self.SalesOrder, CNAM, CADD) = false then
    begin
      //retrieval of customer details failed, cancel creation of text file and exit
      //warning messages are displayed witin STSalesOrdDM.GetDelAddr
      CloseFile(EDIFile);
      DeleteFile(EDIFileName);
      Result := '';
      exit;
    end;
    //trim nasty apostrophes out of CNAM CADD
    RemoveBadChars('''', CNAM);
    RemoveBadChars('''', CADD);
    CLO := CLO + '+' + CNAM + '+' + CADD;
  end;
  CLO := CLO + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, CLO);

  //PO reference no, date, ++N for new order
  ORD := 'ORD=' + Self.PurchOrdNo + '::' + DateStrDDMMYY + '++N''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, ORD);

  //order date and delivery date, 000000 if to be delivered next working day.
  DIN := 'DIN=' + DateStrDDMMYY + '+000000''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, DIN);

  if (TTYP = 'PWD') or (TTYP = 'PWL') then
  begin
    //end user details if being delivered direct to customer
    DNA := 'DNA=1++168:' + SalesOrder.CustOrderNo;
    DNA := DNA + ':066:' + IntToStr(SalesOrder.SONumber);
    STSalesOrdDM.GetCustContact(SalesOrder.Customer, SalesOrder.BranchNo, SalesOrder.CustomerContactNo, RTEX);
    DNA := DNA + ':138:' + RTEX;
    RemoveBadChars('''', RTEX);
    DNA := DNA  + '''';
    NOSG := NOSG + 1;
    WriteLn(EDIFile, DNA);
  end;

//loop thru lines
  for x:=0 to Pred(Self.FPOLines.Count) do
  begin
  //write line info
    with ((Self.POLines[x])) do
    begin
      //PO Line details, prod code, pack quantity, ++T if okay to back order otherwise N
      COD := 'COD=' + IntToStr(LineNo) + '+';
      COD := COD + ':' + Part + '+++';
      COD := COD + IntToStr(PurchPackQuantity) + '+';
      COD := COD + FloatToStr((QuantityOrdered)/(PurchPackQuantity)) + '+';
      COD := COD + FloatToStr(10000 * (PurchasePrice)) + '++T''';
      NOSG := NOSG + 1;
      WriteLn(EDIFile, COD);

      //PO Line references
      DNB :=  'DNB=1+' + IntToStr((LineNo) + 1) + '++082:';
      DNB := DNB + Self.PurchOrdNo + '/' + IntToStr((LineNo) + 1) + '''';
      NOSG := NOSG + 1;
      WriteLn(EDIFile, DNB);
    end;
  end;

  //number of order lines
  OTR := 'OTR=' + IntToStr(Self.FPOLines.Count) + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, OTR);

  //NOSG is the number of lines of text in this section.
  NOSG := NOSG + 1;
  MTR := 'MTR=' + IntToStr(NOSG) +'''';
  WriteLn(EDIFile, MTR);
  NOSG := 0;

  blockNo := blockNo + 1;
  MHD := 'MHD=' + IntToStr(blockNo) + '+CORTLR:6''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, MHD);

  //number of orders in file, only ever 1
  OFT := 'OFT=1''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, OFT);

  NOSG := NOSG + 1;
  MTR := 'MTR=' + IntToStr(NOSG) + '''';
  WriteLn(EDIFile, MTR);

  STX := 'END=3''';
  WriteLn(EDIFile, STX);

//close file
  CloseFile(EDIFile);

//update header status to G for printed
  if Self.PurchOrdStatus < 'G' then
    Self.PurchOrdStatus := 'G';
    
  //return the name of the file created
  Result := Self.PurchOrdNo +'q.do';
end;

function TPurchaseOrder.CreateTextFile(STPODM: TSTPODM):String;
//this method is used to create text files for orders for the broker themselves
//the items are not being sold on to a customer there is no assciciated
//sales order. Therefore the order type will always be 's' and there will never
//be a DNA segment (end user details) in the file.
//Kingfields service code is SO (Sales Orders)
var
  EDIFile : TextFile;
  EDIFileName : string;
  EDIFileLoc, EDIArchiveLoc : string;
  SearchRec : TSearchRec;
  STX, MHD, TYP, SDT, CDT, FIL, MTR, CLO, ORD, DIN, COD, DNB, OTR, OFT : string;
  TTYP, SIDN, CIDN: String;
  NOSG : integer;
  DateStrDDMMYY : String;
  blockNo, x : integer;
begin
//initialise variables
  NOSG := 0;
  blockNo := 1;
  DateStrDDMMYY := FormatDateTime('yymmdd', now);
//get save location
  EDIFileLoc := 'C:\KCOMM\REQUEST\SO\';
  EDIArchiveLoc := 'C:\KCOMM\ARCHIVE\SO';

//check for EDI directory
  //Turn off error trapping of I/O errors, we want to display our own error message.
  {$I-}
  ChDir(EDIFileLoc);
  if IOResult <> 0 then
  begin
    MessageDlg('Cannot find the KCOMM request directory.'+#13#10+
               'This procedure should only be used on computers with the KCOMM software installed.', mtWarning, [mbOk], 0);
    exit;
  end;
  {$I+}

//get supplier specific info
  STPODM.GetSupplierInfo(Self.Supplier, SIDN, CIDN);

//set text file name
  EDIFileName := EDIArchiveLoc + Self.PurchOrdNo +'q.so';

//check if previous copy of file has been sent already, and stored in archive folder
  if FindFirst(EDIFileName, faAnyFile, SearchRec) = 0 then
  begin
  //File Already exists, warn of file overwrite
    if MessageDlg('An EDI Text file has been sent to the supplier for this order.'+#10#13+
                  'It was sent on '+DateTimeToStr(FileDateToDateTime(SearchRec.Time))+#10#13+
                  'Do you want to continue and resend the order?',
           mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      FindClose(SearchRec);
      exit;
    end;
  end;
  FindClose(SearchRec);

  EDIFileName := EDIFileLoc + Self.PurchOrdNo +'q.so';
//check if file exists already
  if FindFirst(EDIFileName, faAnyFile, SearchRec) = 0 then
  begin
  //File Already exists, warn of file overwrite
    if MessageDlg('An EDI Text file already exists for this order.'+#10#13+
                  'It was created on '+DateTimeToStr(FileDateToDateTime(SearchRec.Time))+#10#13+
                  'Do you want to continue and overwrite the file?',
           mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      FindClose(SearchRec);
      exit;
    end;
  end;
  FindClose(SearchRec);

//create text file
  AssignFile(EDIFile, EDIFileName);
  Rewrite(EDIFile);

//write file header info
  STX := 'STX=ANA:1+' + CIDN + '+' + SIDN + '+';
  STX := STX + FormatDateTime('yymmdd:hhnnss', now);
  STX := STX + '+10++CORHDR''';
  WriteLn(EDIFile, STX);

  MHD := 'MHD=' + IntToStr(blockNo) + '+CORHDR:6''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, MHD);

  TYP := 'TYP=0430+';
  TTYP := Self.SuppOrderType;
  TYP := TYP + TTYP + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, TYP);

  SDT := 'SDT=' + SIDN + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, SDT);

  CDT := 'CDT=:'+ CIDN + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, CDT);

  FIL := 'FIL=' + IntToStr((StrToInt(Self.PurchOrdNo) mod 10000))+'+'+IntToStr((StrToInt(Self.PurchOrdNo) div 10000))+'+'+ DateStrDDMMYY + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, FIL);

//NOSG is the number of lines of text in this section.
  NOSG := NOSG + 1;
  MTR := 'MTR=' + IntToStr(NOSG) +'''';
  WriteLn(EDIFile, MTR);
  NOSG := 0;

//write PO header info
  blockNo := blockNo + 1;
  MHD := 'MHD=' + IntToStr(blockNo) + '+CORDER:6''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, MHD);

//brokers supplier account number goes here
  CLO := 'CLO=::' + CIDN;
  CLO := CLO + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, CLO);

  //PO reference no, date, ++N for new order
  ORD := 'ORD=' + Self.PurchOrdNo + '::' + DateStrDDMMYY + '++N''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, ORD);

  //order date and delivery date, 000000 if to be delivered next working day.
  DIN := 'DIN=' + DateStrDDMMYY + '+000000''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, DIN);

//loop thru lines
  for x:=0 to Pred(Self.FPOLines.Count) do
  begin
  //write line info
    with ((Self.POLines[x])) do
    begin
      //PO Line details, prod code, pack quantity, ++T if okay to back order otherwise N
      COD := 'COD=' + IntToStr(LineNo) + '+';
      COD := COD + ':' + Part + '+++';
      COD := COD + IntToStr(PurchPackQuantity) + '+';
      COD := COD + FloatToStr((QuantityOrdered)/(PurchPackQuantity)) + '+';
      COD := COD + FloatToStr(10000 * (PurchasePrice)) + '++T''';
      NOSG := NOSG + 1;
      WriteLn(EDIFile, COD);

      //PO Line references
      DNB :=  'DNB=1+' + IntToStr((LineNo) + 1) + '++082:';
      DNB := DNB + Self.PurchOrdNo + '/' + IntToStr((LineNo) + 1) + '''';
      NOSG := NOSG + 1;
      WriteLn(EDIFile, DNB);
    end;
  end;

  //number of order lines
  OTR := 'OTR=' + IntToStr(Self.FPOLines.Count) + '''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, OTR);

  //NOSG is the number of lines of text in this section.
  NOSG := NOSG + 1;
  MTR := 'MTR=' + IntToStr(NOSG) +'''';
  WriteLn(EDIFile, MTR);
  NOSG := 0;

  blockNo := blockNo + 1;
  MHD := 'MHD=' + IntToStr(blockNo) + '+CORTLR:6''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, MHD);

  //number of orders in file, only ever 1
  OFT := 'OFT=1''';
  NOSG := NOSG + 1;
  WriteLn(EDIFile, OFT);

  NOSG := NOSG + 1;
  MTR := 'MTR=' + IntToStr(NOSG) + '''';
  WriteLn(EDIFile, MTR);

  STX := 'END=3''';
  WriteLn(EDIFile, STX);

//close file
  CloseFile(EDIFile);
  
//update header status to G for printed
  if Self.PurchOrdStatus < 'G' then
    Self.PurchOrdStatus := 'G';

  //return the name of the file created
  Result := Self.PurchOrdNo +'q.so';
end;

destructor TPurchaseOrder.Destroy;
begin
  FExtraCharges.Free;
  FPOLines.Free;
  inherited;
end;

function TPurchaseOrder.GetExtraCharges(index: integer): TExtraCharge;
begin
  Result := FExtraCharges.Items[Index] as TExtraCharge;
end;

function TPurchaseOrder.GetPOLines(Index: integer): TPurchaseOrderLine;
begin
  Result := FPOLines.Items[Index] as TPurchaseOrderLine;
end;

function TPurchaseOrder.NumberOfLines: integer;
begin
  Result := FPOLines.Count;
end;

procedure TPurchaseOrder.SaveNarrative(var iNarrative: Integer;
  const Data: string);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

procedure TPurchaseOrder.SaveToDB(STPODM: TSTPODM);
var
  x : integer;
  iTempNarr: integer;
begin
//get next PONumber
  with STPODM.qryGetLastPO do
  begin
    open;
    Self.PONumber := (1 + (Fields[0].AsInteger));
    close;
  end;

//get next Purch Ord No from company file
  with STPODM.qryLastCompnyPO do
  begin
    open;
    Self.PurchOrdNo := IntToStr(FieldByName('Last_PO_Number').AsInteger + 1);
    Self.PurchOrdNo := Self.PurchOrdNo;
    close;
  end;

//update copmany record with new PO number
  with STPODM.qryIncLastPONum do
  begin
    ParamByName('Last_PO').AsString := Self.PurchOrdNo;
    ExecSQL;
  end;

//save header details
  with STPODM.qryInsPO do
  begin
    ParamByName('Purch_Ord').AsInteger := Self.PONumber;
    ParamByName('Purch_Ord_Descr').AsString := Self.Description;
    ParamByName('Part_Store').AsInteger := Self.PartStore;
    ParamByName('Purch_Ord_Rec_Ref').AsString := Self.RecRef;
    ParamByName('Supplier').AsInteger := Self.Supplier;
    ParamByName('Branch_No').AsInteger := Self.BranchNo;
    ParamByName('Purch_Ord_No').AsString := Self.PurchOrdNo;
    ParamByName('Purch_Ord_Status').AsString := Self.PurchOrdStatus;
    ParamByName('Purch_Ord_Date').AsDateTime := Self.PurchOrdDate;
    if Self.PartStoreFrom = 0 then
      ParamByName('Part_Store_From').Clear
    else
      ParamByName('Part_Store_From').AsInteger := Self.PartStoreFrom;

    if Self.PurchOrdType = 0 then
      ParamByName('Purch_Ord_Type').Clear
    else
      ParamByName('Purch_Ord_Type').AsInteger := Self.PurchOrdType;

    ParamByName('Sales_Order').AsInteger := Self.SalesOrder;
    if Self.SuppOrderType = '' then
      ParamByName('Supp_Order_Type').Clear
    else
      ParamByName('Supp_Order_Type').AsString := Self.SuppOrderType;

    ParamByName('Date_Required').AsDateTime := Self.DateRequired;
    self.SaveNarrative(iTempNarr,self.DeliveryNotes);
    Narrative := iTempNarr;

    ParamByName('Narrative').AsInteger := Self.Narrative;
    ExecSQL;
  end;

//loop thru lines
  for x:= 0 to Pred(FPOLines.Count) do
  begin
    with (POLines[x]) do
    begin
    //save line details
      with STPODM.qryInsPOLine do
      begin
        ParamByName('Purch_Ord').AsInteger := Self.PONumber;
        ParamByName('Purch_Ord_Line_No').AsInteger := x+1;
        ParamByName('Quantity_Ordered').AsInteger := QuantityOrdered;
        ParamByName('Part').AsString := Part;
        ParamByName('Quantity_Received').AsInteger := QuantityReceived;
        if DateDelivExpected = 0 then
          ParamByName('Date_Deliv_Expected').Clear
        else
          ParamByName('Date_Deliv_Expected').AsDateTime := DateDelivExpected;

        if DateDelivActual = 0 then
          ParamByName('Date_Deliv_Actual').Clear
        else
          ParamByName('Date_Deliv_Actual').AsDateTime := DateDelivActual;

        ParamByName('Purchase_Price').AsCurrency := PurchasePrice;
        ParamByname('GRN_No').AsString := GRNNo;
        ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;

        if LineIsSample then
          Parambyname('Line_Is_Sample').asstring := 'Y'
        else
          Parambyname('Line_Is_Sample').asstring := 'N';

        if ReplacementForLine = 0 then
          ParamByName('Replacement_For_Line').Clear
        else
          ParamByName('Replacement_For_Line').AsInteger := ReplacementForLine;
        ParamByName('Discount').AsFloat := Discount;

        if CostPrice = 0 then
          ParamByName('Cost_Price').Clear
        else
          ParamByName('Cost_Price').AsCurrency := CostPrice;

        ParamByName('Qty_Invoiced').asFloat := QtyInvoiced;
        ParamByName('Original_Purchase_Price').asFloat := OrigPurchasePrice;
        ParamByName('Original_Purch_Pack_Qty').asinteger := OrigPurchPackQuantity;
        ParamByName('Product_Status').asstring := ProductStatus;
        ExecSQL;
      end;
    end;
  end;

  //delete existing extra charge lines from database.
  STPODM.DeleteExtraChargeRecords(Self.PONumber);
  //loop thru extra charges and save to database.
  for x := 0 to Pred(FExtraCharges.count) do
  begin
    if Self.ExtraCharges[x].Amount > 0 then
      Self.ExtraCharges[x].SaveToDB(STPODM, Self.PONumber, x+1);
  end;
end;

procedure TPurchaseOrder.SetBranchNo(const Value: integer);
begin
  FBranchNo := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetDescription(const Value: ShortString);
begin
  FDescription := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetExtraCharges(index: integer;
  const Value: TExtraCharge);
begin
  FExtraCharges[index] := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetModified(const Value: boolean);
begin
  FModified := Value;
end;

procedure TPurchaseOrder.SetNewOrder(const Value: boolean);
begin
  FNewOrder := Value;
end;

procedure TPurchaseOrder.SetOwner(const Value: TForm);
begin
  FOwner := Value;
end;

procedure TPurchaseOrder.SetPartStore(const Value: integer);
begin
  FPartStore := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetPartStoreFrom(const Value: integer);
begin
  FPartStoreFrom := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetPOLines(index: integer; const Value: TPurchaseOrderLine);
begin
  FPOLines[index] := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetPONumber(const Value: integer);
begin
  FPONumber := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetPurchOrdDate(const Value: TDateTime);
begin
  FPurchOrdDate := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetPurchOrdNo(const Value: ShortString);
begin
  FPurchOrdNo := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetPurchOrdStatus(const Value: ShortString);
begin
  FPurchOrdStatus := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetPurchOrdType(const Value: integer);
begin
  FPurchOrdType := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetRecRef(const Value: ShortString);
begin
  FRecRef := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetSuppOrderType(const Value: ShortString);
begin
  FSuppOrderType := Value;
  Modified := True;
end;

function TPurchaseOrder.SupplierCanEDI(STPODM: TSTPODM): boolean;
begin
  with STPODM.qryGetSupplierInfo do
  begin
    Close;
    ParamByName('Supplier').AsInteger := Self.Supplier;
    Open;
    if FieldByName('Our_account_Code').AsString <> '' then
      Result := True
    else
      Result := False;
  end;
end;

function TPurchaseOrder.SupplierTransferType(STPODM: TSTPODM): string;
begin
  with STPODM.qryGetSupplierInfo do
  begin
    Close;
    ParamByName('Supplier').AsInteger := Self.Supplier;
    Open;
    result := fieldbyname('Transfer_Protocol_Type').asstring;
  end;
end;

function TPurchaseOrder.SupplierAccountCode(STPODM: TSTPODM): string;
begin
  with STPODM.qryGetSupplierInfo do
  begin
    Close;
    ParamByName('Supplier').AsInteger := Self.Supplier;
    Open;
    result := fieldbyname('Our_Account_Code').asstring;
  end;
end;

function TPurchaseOrder.SupplierAccountPWord(STPODM: TSTPODM): string;
begin
  with STPODM.qryGetSupplierInfo do
  begin
    Close;
    ParamByName('Supplier').AsInteger := Self.Supplier;
    Open;
    result := fieldbyname('Our_Account_Password').asstring;
  end;
end;

function TPurchaseOrder.SupplierSiteURL(STPODM: TSTPODM): string;
begin
  with STPODM.qryGetSupplierInfo do
  begin
    Close;
    ParamByName('Supplier').AsInteger := Self.Supplier;
    Open;
    result := fieldbyname('Transfer_Site_URL').asstring;
  end;
end;

procedure TPurchaseOrder.UpdateDBRecords(STPODM: TSTPODM);
var
  x : integer;
begin
  if Self.Modified then
  begin
    with STPODM.qryUpdPO do
    begin
      ParamByName('Purch_Ord_Descr').AsString := Self.Description;
      ParamByName('Part_Store').AsInteger := Self.PartStore;
      ParamByName('Purch_Ord_Rec_Ref').AsString := Self.RecRef;
      ParamByName('Supplier').AsInteger := Self.Supplier;
      ParamByName('Branch_No').AsInteger := Self.BranchNo;
      ParamByName('Purch_Ord_No').AsString := Self.PurchOrdNo;
      ParamByName('Purch_Ord_Status').AsString := Self.PurchOrdStatus;
      ParamByName('Purch_Ord_Date').AsDateTime := Self.PurchOrdDate;
      ParamByName('Date_Required').AsDateTime := Self.DateRequired;

      if Self.SalesOrder = 0 then
        ParamByName('Sales_Order').Clear
      else
        ParamByName('Sales_Order').AsInteger := Self.SalesOrder;

      if Self.PartStoreFrom = 0 then
        ParamByName('Part_Store_From').Clear
      else
        ParamByName('Part_Store_From').AsInteger := Self.PartStoreFrom;

      if Self.PurchOrdType = 0 then
        ParamByName('Purch_Ord_Type').Clear
      else
        ParamByName('Purch_Ord_Type').AsInteger := Self.PurchOrdType;

      if Self.SuppOrderType = '' then
        ParamByName('Supp_Order_Type').Clear
      else
        ParamByName('Supp_Order_Type').AsString := Self.SuppOrderType;

      ParamByName('Purch_Ord').AsInteger := Self.PONumber;
      Parambyname('Version_no').asinteger := Self.VersionNo;
      Parambyname('Supplier_Ack_number').asstring := Self.SupplierAckNo;
      ExecSQL;
    end;
  end;

//loop thru lines
  for x:= 0 to Pred(FPOLines.Count) do
  begin
    with(POLines[x]) do
    begin
    //save line details if added or modified, modified is set to true within
    //each property set method.
      if NewLine then
      begin
        with STPODM.qryInsPOLine do
        begin
          ParamByName('Purch_Ord').AsInteger := Self.PONumber;
          ParamByName('Purch_Ord_Line_No').AsInteger := x+1;
          ParamByName('Quantity_Ordered').AsInteger := QuantityOrdered;
          ParamByName('Part').AsString := Part;
          ParamByName('Quantity_Received').AsInteger := QuantityReceived;
          if DateDelivExpected = 0 then
            ParamByName('Date_Deliv_Expected').Clear
          else
            ParamByName('Date_Deliv_Expected').AsDate := DateDelivExpected;

          if DateDelivActual = 0 then
            ParamByName('Date_Deliv_Actual').Clear
          else
            ParamByName('Date_Deliv_Actual').AsDate := DateDelivActual;

          ParamByName('Purchase_Price').AsCurrency := PurchasePrice;
          ParamByname('GRN_No').AsString := GRNNo;
          ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;

          if ReplacementForLine = 0 then
            ParamByName('Replacement_For_Line').Clear
          else
            ParamByName('Replacement_For_Line').AsInteger := ReplacementForLine;
          ParamByName('Discount').AsFloat := Discount;

          if LineIsSample then
            Parambyname('Line_Is_Sample').asstring := 'Y'
          else
            Parambyname('Line_Is_Sample').asstring := 'N';

          if CostPrice = 0 then
            ParamByName('Cost_Price').Clear
          else
            ParamByName('Cost_Price').AsCurrency := CostPrice;

          ParamByName('Qty_Invoiced').asFloat := QtyInvoiced;
          Parambyname('Original_Purchase_Price').asfloat := OrigPurchasePrice;
          Parambyname('Original_Purch_Pack_Qty').asinteger := OrigPurchPackQuantity;
          Parambyname('Product_Status').asstring := ProductStatus;
          ExecSQL;
        end;
      end
      else
      if Modified then
      begin
        with STPODM.qryUpdPOLine do
        begin
          ParamByName('Part').AsString := Part;
          ParamByName('Quantity_Ordered').AsInteger := QuantityOrdered;
          ParamByName('Quantity_Received').AsInteger := QuantityReceived;
          if DateDelivExpected = 0 then
            ParamByName('Date_Deliv_Expected').Clear
          else
            ParamByName('Date_Deliv_Expected').AsDate := DateDelivExpected;

          if DateDelivActual = 0 then
            ParamByName('Date_Deliv_Actual').Clear
          else
            ParamByName('Date_Deliv_Actual').AsDate := DateDelivActual;

          ParamByName('Purchase_Price').AsCurrency := PurchasePrice;
          ParamByname('GRN_No').AsString := GRNNo;
          ParamByName('Purch_Pack_Quantity').AsInteger := PurchPackQuantity;
          if ReplacementForLine = 0 then
            ParamByName('Replacement_For_Line').Clear
          else
            ParamByName('Replacement_For_Line').AsInteger := ReplacementForLine;

          ParamByName('Discount').AsFloat := Discount;

          if LineIsSample then
            Parambyname('Line_Is_Sample').asstring := 'Y'
          else
            Parambyname('Line_Is_Sample').asstring := 'N';

          if CostPrice = 0 then
            ParamByName('Cost_Price').Clear
          else
            ParamByName('Cost_Price').AsCurrency := CostPrice;

          ParamByName('Purch_Ord').AsInteger := Self.PONumber;
          ParamByName('Purch_Ord_Line_No').AsInteger := LineNo;
          Parambyname('Original_Purchase_Price').asfloat := OrigPurchasePrice;
          Parambyname('Original_Purch_Pack_Qty').asinteger := OrigPurchPackQuantity;
          Parambyname('Product_Status').asString := ProductStatus;
          ExecSQL;
        end;
      end;
    end;
  end;

  //delete existing extra charge lines from database.
  STPODM.DeleteExtraChargeRecords(Self.PONumber);
  //loop thru extra charges
  for x := 0 to pred(FExtraCharges.count) do
  begin
    Self.ExtraCharges[x].SaveToDB(STPODM, Self.PONumber, x+1);
  end;
end;

procedure TPurchaseOrderLine.SetReplacementForLine(const Value: integer);
begin
  FReplacementForLine := Value;
  Modified := True;
end;

procedure TPurchaseOrderLine.SetOrigPurchasePrice(const Value: Currency);
begin
  FOrigPurchasePrice := Value;
end;

procedure TPurchaseOrderLine.SetOrigPurchPackQuantity(
  const Value: integer);
begin
  FOrigPurchPackQuantity := Value;
end;

procedure TPurchaseOrderLine.SetProductStatus(const Value: string);
begin
  FProductStatus := Value;
end;

procedure TPurchaseOrderLine.SetLineIsSample(const Value: boolean);
begin
  FLineIsSample := Value;
  Modified := true;
end;

{ TExtraCharge }

constructor TExtraCharge.Create;
begin
  inherited Create;
  Modified := False;
  NewCharge := True;
end;

Procedure TExtraCharge.SaveToDB(STPODM: TSTPODM; PONum, ChargeNo: integer);
begin
  if Self.Amount <> 0 then
  begin
    with STPODM.qryInsExChg do
    begin
      ParamByName('Purch_Ord').AsInteger := PONum;
      ParamByName('Additional_Charge').AsInteger := ChargeNo;
      ParamByName('Details').AsString := Self.Details;
      ParamByName('Amount').AsFloat := Self.Amount;
      ParamByName('Nominal').AsString := Self.Nominal;
      ParamByName('Vat_Code').AsInteger := Self.VatCode;
      ExecSQL;
    end;
  end;
end;

procedure TExtraCharge.SetAmount(const Value: double);
begin
  FAmount := Value;
  Modified := True;
end;

procedure TExtraCharge.SetDetails(const Value: string);
begin
  FDetails := Value;
  Modified := True;
end;

procedure TExtraCharge.SetModified(const Value: boolean);
begin
  FModified := Value;
end;

procedure TExtraCharge.SetNewCharge(const Value: boolean);
begin
  FNewCharge := Value;
end;

procedure TExtraCharge.SetNominal(const Value: string);
begin
  FNominal := Value;
  Modified := True;
end;

procedure TExtraCharge.SetVat(const Value: double);
begin
  FVat := Value;
  Modified := True;
end;

procedure TExtraCharge.SetVatCode(const Value: integer);
begin
  FVatCode := Value;
  Modified := True;
end;

procedure TPurchaseOrder.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TPurchaseOrder.SetDeliveryNotes(const Value: string);
begin
  FDeliveryNotes := Value;
end;

function TPurchaseOrder.SupplierName(STPODM: TSTPODM): string;
begin
  with STPODM.qryGetSupplierInfo do
  begin
    Close;
    ParamByName('Supplier').AsInteger := Self.Supplier;
    Open;
    Result := fieldbyname('Name').asstring
  end;
end;

procedure TPurchaseOrder.SaveStatus(STPODM: TSTPODM; tmpStatus: string);
begin
  with STPODM.qryUpPOStatus do
    begin
      close;
      parambyname('Purch_Ord').asinteger := self.PONumber;
      parambyname('Purch_Ord_Status').asstring := tmpStatus;
      execsql;
    end;
end;

procedure TPurchaseOrder.SetVersionNo(const Value: integer);
begin
  FVersionNo := Value;
end;

procedure TPurchaseOrder.SetSupplierAckNo(const Value: string);
begin
  FSupplierAckNo := Value;
end;

function TPurchaseOrder.AddPart(STPODM: TSTPODM; tmpPart, tmpDescription: string; tmpPackQty: integer; tmpCost: real): string;
begin
  with STPODM.qryCheckPart do
    begin
      close;
      parambyname('Part').asstring := tmpPart;
      open;
      if recordcount > 0 then
        begin
          result := tmpPart;
          exit;
        end;
    end;

// Part doesn't exist so create the part
  with STPODM.qryAddPart do
    begin
      close;
      Parambyname('Part').asstring := tmpPart;
      Parambyname('Part_Description').asstring := tmpDescription;
      Parambyname('Part_Cost_List').asfloat := 0;
      Parambyname('Part_Cost_Cat').asfloat := 0;
      Parambyname('Vat_Code').asinteger := 1;
      Parambyname('Purch_Pack_Quantity').asinteger := tmpPackQty;
      Parambyname('Sell_Pack_Quantity').asinteger := tmpPackQty;
      Parambyname('Part_Purchase_Price').asfloat := tmpCost;
      Parambyname('Product_Class').asstring := 'NSTK';
      execsql;
    end;

  with STPODM.qryAddLevels do
    begin
      Close;
      Parambyname('Part').AsString := tmpPart;
      parambyname('Stock_Levels').asinteger := tmpPackQty;
      execsql;
    end;

  result := tmpPart;
end;

end.
