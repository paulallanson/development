(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Purchase Orders DataModule Form

VSS Info:
$Header: /PBL D5/PBRDPORep.pas 8     9/09/:3 14:47 Janiner $
$History: PBRDPORep.pas $
 * 
 * *****************  Version 8  *****************
 * User: Janiner      Date: 9/09/:3    Time: 14:47
 * Updated in $/PBL D5
 * Allow the facility to only show cancelled orders.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 27/03/:2   Time: 11:18
 * Updated in $/PBL D5
 * Changed to allow the excluding of Call Offs from the reports, had to
 * create constants and change the queries.
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 1/08/:1    Time: 14:54
 * Updated in $/PBL D5
 * Amend Customer Sql to report for all branches for customer, add new
 * routine to allow reporting/subtotalling by customer branch.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 12/12/:0   Time: 13:11
 * Updated in $/PBL D5
 * Changed to allow sorting by Form Description
 * 
 * *****************  Version 4  *****************
 * User: Debbies      Date: 7/01/:0    Time: 16:01
 * Updated in $/PBL D5
 * Sort Total/Margin problems & general redesign
 * 
 * *****************  Version 3  *****************
 * User: Debbies      Date: 6/01/:0    Time: 9:26
 * Updated in $/PBL D5
 * Sorted Cost, Sell & Report Totals problems
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/12/99    Time: 16:30
 * Updated in $/PBL D5
 * QuickReport conversions.  Get rid of semicolons after comments.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBRDPORep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRDPORepDataMod = class(TDataModule)
    GetPOsSeq00SQL: TFDQuery;
    GetPOsSeq30SQL: TFDQuery;
    GetPosSeq20SQL: TFDQuery;
    GetPOsSeq50SQL: TFDQuery;
    GetPosSeq40SQL: TFDQuery;
    GetPOsSeq41SQL: TFDQuery;
    GetPosSeq11SQL: TFDQuery;
    GetPOsSeq10SQL: TFDQuery;
    GetPOsSeq02SQL: TFDQuery;
    GetPOsSeq01SQL: TFDQuery;
    GetPosSeq21SQL: TFDQuery;
    GetPosSeq12SQL: TFDQuery;
    GetPosSeq22SQL: TFDQuery;
    GetPOsSeq31SQL: TFDQuery;
    GetPOsSeq32SQL: TFDQuery;
    GetPOsSeq42SQL: TFDQuery;
    GetPOsSeq51SQL: TFDQuery;
    GetPOsSeq52SQL: TFDQuery;
    FormRefSQL: TFDQuery;
    GetPOsSeq60SQL: TFDQuery;
    GetPOsSeq61SQL: TFDQuery;
    GetPOsSeq62SQL: TFDQuery;
    GetPOsSeq70SQL: TFDQuery;
    GetPOsSeq71SQL: TFDQuery;
    GetPOsSeq72SQL: TFDQuery;
    procedure GetPOsSeq00SQLAfterCancel(DataSet: TDataSet);
    procedure GetPOsSeq00SQLtotal_order_valGetText(Sender: TField;
      var Txt: String; DisplayText: Boolean);
    procedure GetPOsSeq10SQLTotal_Order_ValueGetText(Sender: TField;
      var Txt: String; DisplayText: Boolean);
    procedure GetPOsSeq2SQLTotal_Order_ValueGetText(Sender: TField;
      var Txt: String; DisplayText: Boolean);
    procedure GetPOsSeq6SQLTotal_Order_ValueGetText(Sender: TField;
      var Txt: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetCriteria(bExclude: byteBool): string;
    function GetInvoiceOnCallOff(OnlyInvOnCallOff: byteBool): string;
    function GetJobBags(bExJobBags: byteBool): string;
    function GetActive(bActive: byteBool): string;
    function GetOrderBy(Sort1, Sort2: integer): string;
  end;

var
  PBRDPORepDataMod: TPBRDPORepDataMod;

implementation

Const
    ExcludeCallOffs = ' and (Purchase_Orderline.Original_Order <> round(Purchase_Orderline.Purchase_Order,0))';
    ExcludeJobBags = ' and (select top 1 Job_Bag from Job_Bag_Line_Dets where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLine.Purchase_Order and Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) is NULL ';
//    InvoiceOnCallOff = ' and (Purchase_OrderLine.Purch_ord_line_status = 50) ';
    InvoiceOnCallOff  = ' and (select top 1 Qty_to_Deliver from Delivery_Detail where ((Delivery_detail.purchase_order = Purchase_orderline.Purchase_order) and (Delivery_detail.Line = Purchase_orderline.Line)) '
                      + ' and (Delivery_detail.Delivery_to_stock = ''Y'')) > 0 '
                      + ' and ((Purchase_OrderLine.Invoice_upfront = ''N'') or (Purchase_OrderLine.Invoice_upfront is NULL)) '
                      + ' and ((Purchase_OrderLine.purch_ord_line_status < 25) or (Purchase_OrderLine.purch_ord_line_status > 30)) ';
    Active = ' and (Purchase_Orderline.Inactive <> ''Y'')';
    InActive = ' and (Purchase_OrderLine.Inactive = ''Y'')';
    OrderBy00 = 'Order By Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy01 = 'Order By Product_Type.Description, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy02 = 'Order By Product_Type.Description, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference,'
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy10 = 'Order By Supplier.Name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy11 = 'Order By Supplier.Name, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy12 = 'Order By Supplier.Name, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference,'
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy20 = 'Order By Customer.Name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy21 = 'Order By Customer.Name, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy22 = 'Order By Customer.Name, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference,'
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy30 = 'Order By Rep.Name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy31 = 'Order By Rep.Name, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy32 = 'Order By Rep.Name, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference, '
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy40 = 'Order By Operator.Name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy41 = 'Order By Operator.Name, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy42 = 'Order By Operator.Name, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference,'
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy50 = 'Order By Customer_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy51 = 'Order By Customer_Type.Description, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy52 = 'Order By Customer_Type.Description, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference,'
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy60 = 'Order By Cust_Name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy61 = 'Order By Cust_Name, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy62 = 'Order By Cust_Name, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference, '
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy70 = 'Order By Account_Manager.Name, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy71 = 'Order By Account_Manager.Name, Product_Type.Description, Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';
    OrderBy72 = 'Order By Account_Manager.Name, Purchase_OrderLine.Customers_Desc, Purchase_OrderLine.Form_Reference,'
              + 'Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Line';

{$R *.DFM}

procedure TPBRDPORepDataMod.GetPOsSeq00SQLAfterCancel(DataSet: TDataSet);
begin
  {NOTE: The SQLs on this data module are used by the POR (Purchase Order Reports) }
  {      and the POM (Purchase Order Margin Reports). Consider both reports when }
  {      making changes}
end;

function TPBRDPORepDataMod.GetCriteria(bExclude: byteBool): string;
begin
  if bExclude then
    result := ExcludeCallOffs
  else
    result := '';
end;

function TPBRDPORepDataMod.GetJobBags(bExJobBags: byteBool): string;
begin
  if bExJobBags then
    result := ExcludeJobBags
  else
    result := '';
end;

function TPBRDPORepDataMod.GetOrderBy(Sort1, Sort2: integer): string;
begin
  case Sort1 of
      0:
        begin
        case sort2 of
          0: result := OrderBy00;
          1: result := OrderBy01;
          2: result := OrderBy02;
        end;
        end;
      1:
        begin
        case sort2 of
          0: result := OrderBy10;
          1: result := OrderBy11;
          2: result := OrderBy12;
        end;
        end;
      2:
        begin
        case sort2 of
          0: result := OrderBy20;
          1: result := OrderBy21;
          2: result := OrderBy22;
        end;
        end;
      3:
        begin
        case sort2 of
          0: result := OrderBy30;
          1: result := OrderBy31;
          2: result := OrderBy32;
        end;
        end;
      4:
        begin
        case sort2 of
          0: result := OrderBy40;
          1: result := OrderBy41;
          2: result := OrderBy42;
        end;
        end;
      5:
        begin
        case sort2 of
          0: result := OrderBy50;
          1: result := OrderBy51;
          2: result := OrderBy52;
        end;
        end;
      6:
        begin
        case sort2 of
          0: result := OrderBy60;
          1: result := OrderBy61;
          2: result := OrderBy62;
        end;
        end;
      7:
        begin
        case sort2 of
          0: result := OrderBy70;
          1: result := OrderBy71;
          2: result := OrderBy72;
        end;
        end;
    end;
end;

procedure TPBRDPORepDataMod.GetPOsSeq00SQLtotal_order_valGetText(
  Sender: TField; var Txt: String; DisplayText: Boolean);
begin
   with GetPOsSeq00SQL do
     begin
     if FieldByName('Order_Unit_Factor').asfloat <> 0 then
        Txt := floattostr((FieldByName('Quantity').asfloat / FieldByName('Order_Unit_Factor').asfloat)
                      * FieldByName('Order_Price').asfloat )
      else
        Txt := floattostr(FieldByName('Order_Price').asfloat) ;
      end;
end;

procedure TPBRDPORepDataMod.GetPOsSeq10SQLTotal_Order_ValueGetText(Sender: TField;
      var Txt: String; DisplayText: Boolean);
begin
     with GetPOsSeq10SQL do
     begin
     if FieldByName('Order_Unit_Factor').asfloat <> 0 then
        Txt := floattostr((FieldByName('Quantity').asfloat / FieldByName('Order_Unit_Factor').asfloat)
                      * FieldByName('Order_Price').asfloat )
      else
        Txt := floattostr(FieldByName('Order_Price').asfloat) ;
      end;
end;

procedure TPBRDPORepDataMod.GetPOsSeq2SQLTotal_Order_ValueGetText(Sender: TField;
      var Txt: String; DisplayText: Boolean);
begin
(*       with GetPOsSeq2SQL do
     begin
     if FieldByName('Order_Unit_Factor').asfloat <> 0 then
        Txt := floattostr((FieldByName('Quantity').asfloat / FieldByName('Order_Unit_Factor').asfloat)
                      * FieldByName('Order_Price').asfloat )
      else
        Txt := floattostr(FieldByName('Order_Price').asfloat) ;
end;
*)
end;

procedure TPBRDPORepDataMod.GetPOsSeq6SQLTotal_Order_ValueGetText(Sender: TField;
      var Txt: String; DisplayText: Boolean);
begin
(*       with GetPOsSeq6SQL do
     begin
     if FieldByName('Order_Unit_Factor').asfloat <> 0 then
        Txt := floattostr((FieldByName('Quantity').asfloat / FieldByName('Order_Unit_Factor').asfloat)
                      * FieldByName('Order_Price').asfloat )
      else
        Txt := floattostr(FieldByName('Order_Price').asfloat) ;
end;
*)
end;
function TPBRDPORepDataMod.GetActive(bActive: byteBool): string;
begin
 if bActive then
    result := Active
  else
    result := Inactive;
end;

function TPBRDPORepDataMod.GetInvoiceOnCallOff(OnlyInvOnCallOff: byteBool): string;
begin
 if OnlyInvOnCallOff then
    result := InvoiceOnCallOff
  else
    result := '';
end;

end.






