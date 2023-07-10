(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Purchase Order look-up data module.

VSS Info:
$Header: /PBL D5/PBLUPOrdDM.pas 21    26/06/03 10:41 Andrewh $
$History: PBLUPOrdDM.pas $
 * 
 * *****************  Version 21  *****************
 * User: Andrewh      Date: 26/06/03   Time: 10:41
 * Updated in $/PBL D5
 * 
 * *****************  Version 20  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 19  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 18  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 17  *****************
 * User: Paul         Date: 8/11/:2    Time: 13:18
 * Updated in $/PBL D5
 * Corrected problem when entering Customer Account Code. Also added Event
 * maintenance on to the function buttons.
 * 
 * *****************  Version 16  *****************
 * User: Janiner      Date: 7/11/:2    Time: 14:00
 * Updated in $/PBL D5
 * add goods required date to dummy sql
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 16/08/:2   Time: 14:37
 * Updated in $/PBL D5
 * Changed to check whether Period End has been run.
 * Also to allow the update of Current Period Additonal Charges.
 * 
 * *****************  Version 14  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 13  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 12  *****************
 * User: Davidn       Date: 13/06/02   Time: 13:38
 * Updated in $/PBL D5
 * Fixed Cust search function on Customer Enquiry, look up wasn't working.
 * Also passed text in search field to LUCustFrm when called so it doesn't
 * have to be typed again. Finally when LUBranch is called to find a
 * customer branch the account codee for the head office was always being
 * returned, changed it to return the account code of the selected branch.
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 17/01/:2   Time: 14:37
 * Updated in $/PBL D5
 * Updated lookup to show the status of ON Hold in the Status Description
 * 
 * *****************  Version 10  *****************
 * User: Janiner      Date: 17/01/:2   Time: 10:20
 * Updated in $/PBL D5
 * Add new pop-up menu for right click on grid, and load hot keys. Also
 * new hot button for putting an order on hold.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 29/11/:1   Time: 13:02
 * Updated in $/PBL D5
 * Changed to display warning if Proof has already been printed
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 11/10/:1   Time: 9:53
 * Updated in $/PBL D5
 * Changed to reduce the number of records retrieved in the result set.
 * Changed from 1000 to 500.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:16
 * Updated in $/PBL D5
 * Changed to allow the displaying of Inactive/Active orders depending on
 * selection criteria
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 19/03/:1   Time: 11:04
 * Updated in $/PBL D5
 * Provides search on Account Code as well as Customer Name or Supplier
 * Name
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 31/01/:1   Time: 14:01
 * Updated in $/PBL D5
 * Add order quantity onto selection criteria
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 6/12/:0    Time: 15:54
 * Updated in $/PBL D5
 * Changed to allow selection of the Purchase Order through the Search
 * button. Only 1000 records are selected from the Query therefore to get
 * a sepecific PO type it in the search screen.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 17/10/:0   Time: 17:08
 * Updated in $/PBL D5
 * Changed selection routine
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 16/03/:0   Time: 15:08
 * Created in $/PBL D5
 * New dynamic selection screens for enquiry and purchase order lookups.

*******************************************************************************)
unit PBLUPOrdDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmLookUpPOrd = class(TDataModule)
    DetsSRC: TDataSource;
    NullSRC: TDataSource;
    SelectedSQL: TQuery;
    GetContactSQL: TQuery;
    GetDetsSQL: TQuery;
    SelectedLineSQL: TQuery;
    OlderDummySQL: TQuery;
    GetCustSQL: TQuery;
    OldDummySQL: TQuery;
    GetDetsSQLDate_Point: TDateTimeField;
    GetDetsSQLStatus_Description: TStringField;
    GetDetsSQLSupp_Name: TStringField;
    GetDetsSQLSuppliers_Desc: TStringField;
    GetDetsSQLCustomers_Desc: TStringField;
    GetDetsSQLEnquiry: TIntegerField;
    GetDetsSQLLine0: TIntegerField;
    GetDetsSQLCust_Name: TStringField;
    GetDetsSQLPurchase_Order: TFloatField;
    GetDetsSQLLine: TIntegerField;
    GetDetsSQLForm_Reference_ID: TStringField;
    GetDetsSQLCust_Order_No: TStringField;
    GetDetsSQLQuantity: TFloatField;
    GetDetsSQLCustomer_Account_Code: TStringField;
    GetDetsSQLSupplier_Account_Code: TStringField;
    GetDetsSQLSelling_Price: TCurrencyField;
    GetDetsSQLOrder_Price: TCurrencyField;
    GetDetsSQLOrdering_unit: TStringField;
    GetDetsSQLSelling_Unit: TStringField;
    GetDetsSQLPurch_Ord_Line_Status: TIntegerField;
    GetDetsSQLStatus_Descr: TStringField;
    DummySQL: TQuery;
    qryInvoice: TQuery;
    GetDetsSQLProof_Revision: TStringField;
    UpdSelectedLineSQL: TQuery;
    GetDetsSQLOn_Hold: TStringField;
    qryFindCustBranch: TQuery;
    qryperiodEnd: TQuery;
    GetDetsSQLGoods_Required: TDateTimeField;
    GetDetsSQLBranch_Name: TStringField;
    GetDetsSQLCustomer: TIntegerField;
    GetDetsSQLBranch_no: TIntegerField;
    GetDetsSQLOperator: TIntegerField;
    GetDetsSQLRep: TIntegerField;
    GetDetsSQLjob_bag: TIntegerField;
    GetDetsSQLGoods_Reqd_by_Customer: TDateTimeField;
    GetDetsSQLOriginal_Order: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure GetDetsSQLStatus_DescrGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    FSupplierDesc: string;
    FCustomer: string;
    FFormReference: string;
    FOrderStatus: string;
    FCustomerRef: string;
    FCustomerDesc: string;
    FSupplier: string;
    FShowCustomerDesc: Boolean;
    FShowPONumber: Boolean;
    FSeqByPONumber: Boolean;
    FShowSupplierDesc: Boolean;
    FShowCustomerRef: Boolean;
    FSeqBySupplierDesc: Boolean;
    FShowEnquiryNo: Boolean;
    FSeqByCustomerDesc: Boolean;
    FShowOrderStatus: Boolean;
    FSeqByCustomerRef: Boolean;
    FShowSupplier: Boolean;
    FSeqByCustomer: Boolean;
    FSeqByFormRef: Boolean;
    FShowCustomer: Boolean;
    FSeqBySupplier: Boolean;
    FSeqByOrderStatus: Boolean;
    FShowFormRef: Boolean;
    FCustomerNo: integer;
    FJustMine: Boolean;
    FCustomerBranch: integer;
    FNotInJobBag: Boolean;
    FPONumber: string;
    fSeqByOrdQty: Boolean;
    fShowOrdQty: Boolean;
    fOrdQtyDesc: String;
    FShowCancelled: Boolean;
    FShowAllBranches: Boolean;
    procedure AddWithAnd(const Value : string);
    function  GetRecordCount : integer;
    procedure SetCustomer(const Value: string);
    procedure SetCustomerDesc(const Value: string);
    procedure SetCustomerRef(const Value: string);
    procedure SetFormReference(const Value: string);
    procedure SetOrderStatus(const Value: string);
    procedure SetSupplier(const Value: string);
    procedure SetSupplierDesc(const Value: string);
    procedure SetSeqByCustomer(const Value: Boolean);
    procedure SetSeqByCustomerDesc(const Value: Boolean);
    procedure SetSeqByCustomerRef(const Value: Boolean);
    procedure SetSeqByFormRef(const Value: Boolean);
    procedure SetSeqByOrderStatus(const Value: Boolean);
    procedure SetSeqByPONumber(const Value: Boolean);
    procedure SetSeqBySupplier(const Value: Boolean);
    procedure SetSeqBySupplierDesc(const Value: Boolean);
    procedure SetShowCustomer(const Value: Boolean);
    procedure SetShowCustomerDesc(const Value: Boolean);
    procedure SetShowCustomerRef(const Value: Boolean);
    procedure SetShowEnquiryNo(const Value: Boolean);
    procedure SetShowFormRef(const Value: Boolean);
    procedure SetShowOrderStatus(const Value: Boolean);
    procedure SetShowPONumber(const Value: Boolean);
    procedure SetShowSupplier(const Value: Boolean);
    procedure SetShowSupplierDesc(const Value: Boolean);
    procedure SetCustomerNo(const Value: integer);
    procedure SetJustMine(const Value: Boolean);
    procedure SetCustomerBranch(const Value: integer);
    procedure SetNotInJobBag(const Value: Boolean);
    procedure SetPONumber(const Value: string);
    procedure setOrdQtyDesc(const Value: string);
    procedure setSeqByOrdQty(const Value: Boolean);
    procedure setShowOrdQty(const Value: Boolean);
    procedure SetShowCancelled(const Value: Boolean);
    function FindCustBranch(searchStr: String;
      var returnStr: String): boolean;
    function FindGeneralCust(searchStr: String;
      var returnStr: String): boolean;
    procedure SetShowAllBranches(const Value: Boolean);
  public
    procedure RefreshData;
    property Customer: string read FCustomer write SetCustomer;
    property CustomerBranch: integer read FCustomerBranch write SetCustomerBranch;
    property CustomerNo: integer read FCustomerNo write SetCustomerNo;
    property CustomerDesc: string read FCustomerDesc write SetCustomerDesc;
    property CustomerRef: string read FCustomerRef write SetCustomerRef;
    property FormReference: string read FFormReference write SetFormReference;
    property JustMine: Boolean read FJustMine write SetJustMine;
    property OrderStatus: string read FOrderStatus write SetOrderStatus;
    property NotInJobBag: Boolean read FNotInJobBag write SetNotInJobBag;
    property RecordCount: integer read GetRecordCount;
    property OrdqtyDesc: string read fOrdQtyDesc write setOrdQtyDesc;
    property SeqByCustomer: Boolean read FSeqByCustomer write SetSeqByCustomer;
    property SeqByCustomerDesc: Boolean read FSeqByCustomerDesc write SetSeqByCustomerDesc;
    property SeqByCustomerRef: Boolean read FSeqByCustomerRef write SetSeqByCustomerRef;
    property SeqByFormRef: Boolean read FSeqByFormRef write SetSeqByFormRef;
    property SeqByOrderStatus: Boolean read FSeqByOrderStatus write SetSeqByOrderStatus;
    property SeqByPONumber: Boolean read FSeqByPONumber write SetSeqByPONumber;
    property SeqBySupplier: Boolean read FSeqBySupplier write SetSeqBySupplier;
    property SeqBySupplierDesc: Boolean read FSeqBySupplierDesc write SetSeqBySupplierDesc;
    property SeqByOrdQty: Boolean read fSeqByOrdQty write setSeqByOrdQty;
    property ShowAllBranches: Boolean read FShowAllBranches write SetShowAllBranches;
    property ShowCustomer: Boolean read FShowCustomer write SetShowCustomer;
    property ShowCustomerDesc: Boolean read FShowCustomerDesc write SetShowCustomerDesc;
    property ShowCustomerRef: Boolean read FShowCustomerRef write SetShowCustomerRef;
    property ShowEnquiryNo: Boolean read FShowEnquiryNo write SetShowEnquiryNo;
    property ShowFormRef: Boolean read FShowFormRef write SetShowFormRef;
    property ShowOrderStatus: Boolean read FShowOrderStatus write SetShowOrderStatus;
    property ShowPONumber: Boolean read FShowPONumber write SetShowPONumber;
    property ShowSupplier: Boolean read FShowSupplier write SetShowSupplier;
    property ShowSupplierDesc: Boolean read FShowSupplierDesc write SetShowSupplierDesc;
    property ShowOrdQty: Boolean read fShowOrdQty write setShowOrdQty;
    property Supplier: string read FSupplier write SetSupplier;
    property SupplierDesc: string read FSupplierDesc write SetSupplierDesc;
    function PeriodEndRun(TempPO: real; TempLine: integer): boolean;
    property PONumber: string read FPONumber write SetPONumber;
    property ShowCancelled: Boolean read FShowCancelled write SetShowCancelled;
    function FindCust(searchStr: String; var returnStr: String): boolean;
  end;

var
  dmLookUpPOrd: TdmLookUpPOrd;

implementation

uses pbMainMenu;

{$R *.DFM}

{ TdmLookUpPOrd }

procedure TdmLookUpPOrd.AddWithAnd(const Value: string);
begin
  GetDetsSQL.SQL.Add(' AND ' + Value);
end;

procedure TdmLookUpPOrd.RefreshData;
var
  TempNeedPOL, TempNeedStatusH, TempNeedStatusL: Boolean;
  i: integer;
begin
  TempNeedStatusH := False;
  TempNeedStatusL := False;
  TempNeedPOL := (ShowCustomer) or (Customer <> '') or
    (SeqByCustomer) or
    (ShowCustomerDesc) or (CustomerDesc <> '') or
    (SeqByCustomerDesc) or
    (ShowSupplierDesc) or (SupplierDesc <> '') or
    (SeqBySupplierDesc) or
    (ShowOrdQty) or(seqByOrdQty) or
    (OrdQtyDesc <> '') or
    (CustomerNo <> 0);
  if (ShowOrderStatus) or (OrderStatus <> '') or (SeqByOrderStatus) then
  begin
    TempNeedStatusH := not TempNeedPOL;
    TempNeedStatusL := TempNeedPOL;
  end;
  GetDetsSQL.Close;
  with GetDetsSQL.SQL do
  begin
    Clear;
    {Start with the basic code from the DummySQL Query component}
    for i := 0 to DummySQl.SQl.count - 1 do
    begin
      Add(DummySQL.SQL[i]);
    end;
    {Add the Purchase Order selection}
    if PONumber <> '' then
      Add(' Purchase_Order.Purchase_Order <= '+trim(PONumber))
    else
      Add(' Purchase_Order.Purchase_Order >= 0');

    Add(' AND (1 = 1) ');
    if OrderStatus <> '' then
    begin
      if TempNeedStatusH then
        AddWithAND('(Purch_Ord_Head_Status.Description Like ''%' + OrderStatus
          + '%'')');
      if TempNeedStatusL then
        AddWithAND('(Purch_Ord_Line_Status.Description Like ''%' + OrderStatus
          + '%'')');
    end;
    
    if Supplier <> '' then
      AddWithAND('((Supplier.Name Like ''%' + Supplier + '%'') or (Supplier_Branch.Account_Code =''' + Supplier + '''))');
    if SupplierDesc <> '' then
      AddWithAND('(Purchase_OrderLine.Suppliers_Desc Like ''%' + SupplierDesc
        + '%'')');
    if Customer <> '' then
      AddWithAND('((Customer.Name Like ''%' + Customer + '%'') or (Customer_Branch.Account_Code =''' + Customer + '''))');
//      AddWithAND('((Customer.Name Like ''%' + Customer + '%''))');
    if CustomerNo <> 0 then
      begin
        AddWithAND('(Purchase_OrderLine.Customer = ' + IntToStr(CustomerNo) + ')');
      end;

    if not ShowAllBranches then
      begin
        AddWithAND('(Purchase_OrderLine.Branch_No = ' + IntToStr(CustomerBranch) + ')');
      end;

    if CustomerDesc <> '' then
      AddWithAND('(Purchase_OrderLine.Customers_Desc Like ''%' + CustomerDesc
        + '%'')');
    if FormReference <> '' then
      AddWithAND('(Form_Reference.Form_Reference_ID Like ''%' + FormReference
        + '%'')');
    if CustomerRef <> '' then
      AddWithAND('(Purchase_OrderLine.Cust_Order_No Like ''%' + CustomerRef
        + '%'')');
    if OrdQtyDesc <> '' then
      AddWithAND('(Purchase_OrderLine.quantity = '+ OrdQtyDesc+')');
    if JustMine then
      AddWithAND('(Purchase_Order.Operator = ' +
        IntToStr(frmPBMainMenu.iOperator) + ')');
    if ShowCancelled then
      AddWithAND('(Purchase_OrderLine.Inactive = ''Y'')')
    else
      AddWithAND('((Purchase_OrderLine.Inactive <> ''Y'') or (Purchase_OrderLine.Inactive is null))');
    if NotInJobBag then
    begin
      AddWithAND('(Purchase_Order.Purchase_Order Not In (Select Purchase_Order From Job_Bag_Line_Dets');
      Add('   Where (Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLine.Purchase_Order) and');
      Add('         (Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line)))');
    end;
    {Build the SQL ORDER BY clause}
    Add(' ORDER BY ');
    if SeqByOrderStatus then
    begin
      if TempNeedStatusH then
        Add('Purch_Ord_Head_Status.Description, Purchase_Order.Purchase_Order desc');
      if TempNeedStatusL then
        Add('Purch_Ord_Line_Status.Description, Purchase_Order.Purchase_Order desc');
    end
    else
    if SeqBySupplier then
      Add('Supplier.Name, Purchase_Order.Purchase_Order desc')
    else
    if SeqBySupplierDesc then
      Add('Purchase_OrderLine.Suppliers_Desc, Purchase_Order.Purchase_Order desc, Purchase_OrderLine.Line')
    else
    if SeqByCustomer then
      Add('Customer.Name, Purchase_Order.Purchase_Order desc, Purchase_OrderLine.Line')
    else
    if SeqByCustomerDesc then
      Add('Purchase_OrderLine.Customers_Desc, Purchase_Order.Purchase_Order desc, Purchase_OrderLine.Line')
    else
    if SeqByFormRef then
      Add('Form_Reference.Form_Reference_id, Purchase_Order.Purchase_Order desc, Purchase_OrderLine.Line')
    else
    if SeqByCustomerRef then
      Add('Purchase_OrderLine.Cust_Order_No')
    else  { Default is by PONumber }
      Add('Purchase_Order.Purchase_Order desc, Purchase_OrderLine.Line');
    if SeqByOrdqty then
      Add('Purchase_OrderLine.Quantity');
    end;
  GetDetsSQL.Open;
end;

procedure TdmLookUpPOrd.SetCustomer(const Value: string);
begin
  FCustomer := Value;
end;

procedure TdmLookUpPOrd.SetCustomerBranch(const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TdmLookUpPOrd.SetCustomerDesc(const Value: string);
begin
  FCustomerDesc := Value;
end;

procedure TdmLookUpPOrd.SetCustomerNo(const Value: integer);
begin
  FCustomerNo := Value;
end;

procedure TdmLookUpPOrd.SetCustomerRef(const Value: string);
begin
  FCustomerRef := Value;
end;

procedure TdmLookUpPOrd.SetFormReference(const Value: string);
begin
  FFormReference := Value;
end;

procedure TdmLookUpPOrd.SetJustMine(const Value: Boolean);
begin
  FJustMine := Value;
end;

procedure TdmLookUpPOrd.SetNotInJobBag(const Value: Boolean);
begin
  FNotInJobBag := Value;
end;

procedure TdmLookUpPOrd.SetOrderStatus(const Value: string);
begin
  FOrderStatus := Value;
end;

procedure TdmLookUpPOrd.SetSeqByCustomer(const Value: Boolean);
begin
  FSeqByCustomer := Value;
end;

procedure TdmLookUpPOrd.SetSeqByCustomerDesc(const Value: Boolean);
begin
  FSeqByCustomerDesc := Value;
end;

procedure TdmLookUpPOrd.SetSeqByCustomerRef(const Value: Boolean);
begin
  FSeqByCustomerRef := Value;
end;

procedure TdmLookUpPOrd.SetSeqByFormRef(const Value: Boolean);
begin
  FSeqByFormRef := Value;
end;

procedure TdmLookUpPOrd.SetSeqByOrderStatus(const Value: Boolean);
begin
  FSeqByOrderStatus := Value;
end;

procedure TdmLookUpPOrd.SetSeqByPONumber(const Value: Boolean);
begin
  FSeqByPONumber := Value;
end;

procedure TdmLookUpPOrd.SetSeqBySupplier(const Value: Boolean);
begin
  FSeqBySupplier := Value;
end;

procedure TdmLookUpPOrd.SetSeqBySupplierDesc(const Value: Boolean);
begin
  FSeqBySupplierDesc := Value;
end;

procedure TdmLookUpPOrd.SetShowCustomer(const Value: Boolean);
begin
  FShowCustomer := Value;
end;

procedure TdmLookUpPOrd.SetShowCustomerDesc(const Value: Boolean);
begin
  FShowCustomerDesc := Value;
end;

procedure TdmLookUpPOrd.SetShowCustomerRef(const Value: Boolean);
begin
  FShowCustomerRef := Value;
end;

procedure TdmLookUpPOrd.SetShowEnquiryNo(const Value: Boolean);
begin
  FShowEnquiryNo := Value;
end;

procedure TdmLookUpPOrd.SetShowFormRef(const Value: Boolean);
begin
  FShowFormRef := Value;
end;

procedure TdmLookUpPOrd.SetShowOrderStatus(const Value: Boolean);
begin
  FShowOrderStatus := Value;
end;

procedure TdmLookUpPOrd.SetShowPONumber(const Value: Boolean);
begin
  FShowPONumber := Value;
end;

procedure TdmLookUpPOrd.SetShowSupplier(const Value: Boolean);
begin
  FShowSupplier := Value;
end;

procedure TdmLookUpPOrd.SetShowSupplierDesc(const Value: Boolean);
begin
  FShowSupplierDesc := Value;
end;

procedure TdmLookUpPOrd.SetSupplier(const Value: string);
begin
  FSupplier := Value;
end;

procedure TdmLookUpPOrd.SetSupplierDesc(const Value: string);
begin
  FSupplierDesc := Value;
end;

procedure TdmLookUpPOrd.DataModuleCreate(Sender: TObject);
begin
  { The DummySQL query is set to be the dataset of DetsSRC for
    use at design time but at runtime we want to use GetDetsSQL. }
  DetsSRC.DataSet := GetDetsSQL;
  { Set default values for properties }
  SeqByPONumber := true;
  ShowCustomer := true;
  ShowCustomerDesc := true;
  ShowCustomerRef := true;
  ShowEnquiryNo := true;
  ShowFormRef := true;
  ShowOrderStatus := true;
  ShowPONumber := true;
  ShowSupplier := true;
  ShowSupplierDesc := true;
  ShowOrdQty := true;
  ShowAllBranches := true;
end;

function TdmLookUpPOrd.GetRecordCount: integer;
begin
  Result := GetDetsSQL.RecordCount;
end;

procedure TdmLookUpPOrd.SetPONumber(const Value: string);
begin
  FPONumber := Value;
end;

procedure TdmLookUpPOrd.setOrdQtyDesc(const Value: string);
begin
  fOrdQtyDesc := Value;
end;

procedure TdmLookUpPOrd.setSeqByOrdQty(const Value: Boolean);
begin
  fSeqByOrdQty := Value;
end;

procedure TdmLookUpPOrd.setShowOrdQty(const Value: Boolean);
begin
  fShowOrdQty := Value;
end;

procedure TdmLookUpPOrd.GetDetsSQLStatus_DescrGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
(*  if  (DetsSRC.Dataset.fieldbyname('Purch_ord_line_status').asinteger = 30) and
      (DetsSRC.Dataset.fieldbyname('Sales_invoice_no').asstring <> '') then
    text := DetsSRC.Dataset.fieldbyname('Sales_invoice_no').asstring
  else
    text := DetsSRC.Dataset.fieldbyname('Status_description').asstring;
*)
  if  (DetsSRC.Dataset.fieldbyname('Purch_ord_line_status').asinteger = 30) then
    begin
      qryInvoice.close;
      qryInvoice.parambyname('Purchase_Order').asfloat := DetsSRC.Dataset.fieldbyname('Purchase_Order').asfloat;
      qryInvoice.parambyname('Line').asinteger := DetsSRC.Dataset.fieldbyname('Line').asinteger;
      qryInvoice.open;

      if qryInvoice.recordcount > 0 then
        if (qryInvoice.FieldByName('Sales_invoice_no').asstring <> '') then
          begin
            text := qryInvoice.fieldbyname('Sales_invoice_no').asstring;
            exit;
          end;
      text := DetsSRC.Dataset.fieldbyname('Status_description').asstring;
    end
  else
  if (DetsSRC.Dataset.fieldbyname('On_Hold').asstring = 'Y') then
    text := 'ON HOLD'
  else
    text := DetsSRC.Dataset.fieldbyname('Status_description').asstring;
end;

procedure TdmLookUpPOrd.SetShowCancelled(const Value: Boolean);
begin
  FShowCancelled := Value;
end;

function TdmLookUpPOrd.FindCust(searchStr: String; var returnStr: String): boolean;
begin
  CustomerNo := 0;
  CustomerBranch := 0;
  Result := false;
  //first try to find a specific customer branch
  if FindCustBranch(searchStr, returnStr) = true then
  begin
    Result := true;
  end
  else
  begin
    //couldn't find a specific customer branch so just try for a customer
    if FindGeneralCust(searchStr, returnStr) = true then
    begin
      Result := true;
    end
    else
    begin
      //couldn't find specific customer either, user needs to enter more text
      //to narow the search
    end;
  end;
end;

function TdmLookUpPOrd.FindCustBranch(searchStr: String;
  var returnStr: String): boolean;
begin
  Result := false;
  with qryFindCustBranch do
  begin
    close;
    ParamByName('SearchCode').AsString := searchStr;
    open;
    if recordcount = 1 then
    begin
      //found the specific branch
      returnStr := FieldByName('Customer_Name').AsString + ' / ' + FieldByName('Branch_Name').AsString;
      CustomerNo := FieldByName('Customer').AsInteger;
      CustomerBranch := FieldByName('Branch_No').AsInteger;
      Result := true;
    end;
    close;
  end;
end;

function TdmLookUpPOrd.FindGeneralCust(searchStr: String;
  var returnStr: String): boolean;
begin
  Result := false;
  with GetCustSQL do
  begin
    close;
    ParamByName('Code_From').AsString := searchStr;
    open;
    if recordcount = 1 then
    begin
      //found the specific customer
      returnStr := FieldByName('Customer_Name').AsString;
      Customer := FieldByName('Customer_Name').AsString;
      Result := true;
    end;
    close;
  end;
end;

function TdmLookUpPOrd.PeriodEndRun(TempPO: real; TempLine: integer): boolean;
begin
  Result := false;
  with qryPeriodEnd do
  begin
    close;
    ParamByName('Purchase_Order').Asfloat := TempPO;
    ParamByName('Line').Asinteger := TempLine;
    open;
    if recordcount > 0 then
    begin
      Result := true;
    end;
    close;
  end;
end;

procedure TdmLookUpPOrd.SetShowAllBranches(const Value: Boolean);
begin
  FShowAllBranches := Value;
end;

end.
