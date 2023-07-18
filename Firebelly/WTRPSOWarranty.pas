unit WTRPSOWarranty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables;

type
  TfrmWTRPSOWarranty = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesOrders: TQuery;
    qrbGroupHeader: TQRGroup;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel1: TQRLabel;
    qrlblSelection: TQRLabel;
    gtQRLabel1: TQRLabel;
    qrsbDetails: TQRSubDetail;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    qrlblFittingDate: TQRLabel;
    qrlblDescription: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRLabel2: TQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CustomerGoods, CustomerVAT, CustomerTotal, CustomerCost, ReportGoods, ReportVAT, ReportTotal, ReportCost: real;
    FCustomerCategory: integer;
    FSelectBy: integer;
    procedure SetCustomerCategory(const Value: integer);
    procedure SetSelectBy(const Value: integer);
  public
    SortBy: integer;
    customer, rep: integer;
    customerList: TstringList;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    property SelectBy: integer read FSelectBy write SetSelectBy;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPSOWarranty: TfrmWTRPSOWarranty;

implementation

uses wtDataModule, AllCommon, wtRSSOWarranty;

{$R *.dfm}

procedure TfrmWTRPSOWarranty.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case sortby of
    0:begin
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
      end;
    1:begin
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
      end;
    2:begin
        qrbGroupHeader.Expression := 'qrySalesOrders.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    3:begin
        qrbGroupHeader.Expression := 'qrySalesOrders.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep';
      end;
  end;

  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
  CustomerCost := 0.00;

  ReportGoods := 0.00;
  ReportVAT := 0.00;
  ReportTotal := 0.00;
  ReportCost := 0.00;
end;

procedure TfrmWTRPSOWarranty.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblFittingDate.caption := paDateStr(qrySalesOrders.fieldbyname('Date_Required').asdatetime);
  qrlblDescription.caption := qrySalesOrders.fieldbyname('Thickness_mm').asstring + ' ' + qrySalesOrders.fieldbyname('Worktop_Description').asstring + ' ' + qrySalesOrders.fieldbyname('Material_Description').asstring;

(*  CustomerGoods := CustomerGoods + qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  ReportGoods := ReportGoods +  qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  CustomerCost := CustomerCost + qrySalesOrders.fieldbyname('Total_Slab_Cost').asfloat;
  ReportCost := ReportCost + qrySalesOrders.fieldbyname('Total_Slab_Cost').asfloat;


  CustomerVAT := CustomerVat + qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  CustomerTotal := CustomerTotal + qrySalesOrders.fieldbyname('Total_Value').asfloat;

  ReportVAT := ReportVAT +  qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  ReportTotal := ReportTotal +  qrySalesOrders.fieldbyname('Total_Value').asfloat;
*)
end;

procedure TfrmWTRPSOWarranty.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
  CustomerCost := 0.00;
end;

function TfrmWTRPSOWarranty.GetDetails: integer;
var
  iCount: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  case SelectBy of
    1: begin
        qrySalesOrders.SQL.Add(' AND ((Sales_Order.Date_Type = ''C'')) ');
       end;
    2: begin
        qrySalesOrders.SQL.Add(' AND ((Sales_Order.Date_Type = ''P'')) ');
       end;
  end;

  if customerList.Count > 0 then
    begin
      qrySalesOrders.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qrySalesOrders.SQL.Add('(Sales_Order.Customer = ' + customerList[iCount] + ')')
          else
            qrySalesOrders.SQL.Add(' OR (Sales_Order.Customer = ' + customerList[iCount] + ')')
        end;
      qrySalesOrders.SQL.Add(')');
    end;

  qrySalesOrders.SQL.Add(
      'GROUP BY ' +
      ' Sales_Order.Sales_Order,' +
      ' Sales_Order.Date_Raised,' +
      ' Sales_Order.Date_Required,' +
      ' Sales_Order.Date_Type,' +
      ' Sales_Order.Customer,' +
      ' Sales_Order.Customer_Name,' +
      ' Sales_Order.Order_ref_no,' +
      ' Sales_Order.Reference,' +
      ' Sales_Order.inactive,' +
      ' Customer.Is_Retail_Customer,' +
      ' Customer.Is_Commercial_Customer,' +
      ' Worktop.Description,' +
      ' Thickness.Thickness_mm,' +
      ' Material_Type.Description,' +
      ' Rep.Rep_Name,' +
      ' Sales_Order_Status.Sales_Order_Status_Desc' );

  case sortby of
    0:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order');
      end;
    1:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Date_Required, Sales_Order.Sales_Order');
      end;
    2:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Customer_Name, Sales_Order.Sales_Order');
      end;
    3:begin
        qrySalesOrders.SQL.Add('ORDER BY Rep.Rep_Name, Sales_Order.Sales_Order');
      end;
  end;

  qrySalesOrders.Close;

  case CustomerCategory of
        0:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'A';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qrySalesOrders.ParambyName('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;


  qrySalesOrders.parambyname('Rep').asinteger := rep;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom;
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo;
  qrySalesOrders.Open;
  result := qrySalesOrders.recordcount;
end;

procedure TfrmWTRPSOWarranty.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmWTRPSOWarranty.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Sales Order"'
    + ',"Order Date"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Fitting Date"'
    + ',"Reference"'
    + ',"Rep"'
    + ',"Thickness"'
    + ',"Colour"'
    + ',"Material"'
    + ',"Status"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPSOWarranty.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Order
    tempStr := '"' + qrySalesOrders.fieldbyname('Sales_Order').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Raised').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Customer_Name').asstring + '"';

    //Category
    if qrySalesOrders.fieldbyname('Is_Retail_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Retail' + '"'
    else
    if qrySalesOrders.fieldbyname('Is_Commercial_Customer').asstring = 'Y' then
      tempStr := tempStr + ',"' + 'Commercial' + '"'
    else
      tempStr := tempStr + ',"' + 'Trade' + '"';

    //Fittimng Date
    tempStr := tempStr + ',"' + paDateStr(qrySalesOrders.fieldbyname('Date_Required').asdatetime) + '"';

    //Reference
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Reference').asstring + '"';

    //Rep
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Rep_Name').asstring + '"';

    //Thickness
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Thickness_mm').asstring + '"';

    //Colour
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Worktop_Description').asstring + '"';

    //Material Brand
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Material_Description').asstring + '"';

    //Status
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Sales_Order_Status_Desc').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOWarranty.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSOWarranty.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmWTRPSOWarranty.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmWTRPSOWarranty.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

procedure TfrmWTRPSOWarranty.SetSelectBy(const Value: integer);
begin
  FSelectBy := Value;
end;

end.
