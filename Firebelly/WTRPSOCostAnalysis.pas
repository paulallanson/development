unit WTRPSOCostAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPSOCostAnalysis = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesOrders: TFDQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbDate: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustPerc: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportPerc: TQRLabel;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    qrlblDate: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    qrlblDateRange: TQRLabel;
    qrGroupbyFootText: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblCustGoods: TQRLabel;
    qrlblCustCost: TQRLabel;
    qrlblReportCost: TQRLabel;
    qrlblReportGoods: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    qrlblSelection: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRDBText2: TQRDBText;
    qrlblCost: TQRLabel;
    qrlblCostPerc: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel3: TQRLabel;
    qrlblMargin: TQRLabel;
    qrlblCustMargin: TQRLabel;
    qrlblReportMargin: TQRLabel;
    qrlblReportDate: TQRLabel;
    qrySalesOrdersSales_Order: TIntegerField;
    qrySalesOrdersDate_Raised: TSQLTimeStampField;
    qrySalesOrdersDescriptive_Reference: TWideStringField;
    qrySalesOrdersSales_Order_Status: TIntegerField;
    qrySalesOrdersSales_Order_Status_Desc: TWideStringField;
    qrySalesOrdersTemplate_Date: TSQLTimeStampField;
    qrySalesOrdersDate_Required: TSQLTimeStampField;
    qrySalesOrdersInstall_Address: TIntegerField;
    qrySalesOrdersCustomer_Name: TWideStringField;
    qrySalesOrdersReference: TWideStringField;
    qrySalesOrdersOrder_Ref_no: TWideStringField;
    qrySalesOrdersTelephone_number: TWideStringField;
    qrySalesOrdersIs_Retail_Customer: TWideStringField;
    qrySalesOrdersIs_Commercial_Customer: TWideStringField;
    qrySalesOrdersGoods_Value: TFloatField;
    qrySalesOrdersVAT_Value: TFloatField;
    qrySalesOrdersTotal_Value: TFloatField;
    qrySalesOrdersTotal_Materials: TFloatField;
    qrySalesOrdersRep: TIntegerField;
    qrySalesOrdersRep_Name: TWideStringField;
    qrySalesOrdersAccount_Manager: TIntegerField;
    qrySalesOrdersAccount_Manager_Name: TWideStringField;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CustomerGoods, CustomerCost, CustomerVAT, CustomerMargin, CustomerTotal, ReportGoods, ReportCost, ReportVAT, ReportMargin, ReportTotal: real;
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    SelectBy: integer;
    SortBy: integer;
    customer, rep: integer;
    customerList: TstringList;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPSOCostAnalysis: TfrmWTRPSOCostAnalysis;

implementation

uses wtDataModule, WTRSSOCostAnalysis, AllCommon;

{$R *.dfm}

procedure TfrmWTRPSOCostAnalysis.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case selectby of
    0:begin
        qrlblDate.caption := 'Order Date' ;
        qrdbDate.datafield := 'Date_Raised';
      end;
    1:begin
        qrlblDate.caption := 'Fitting Date' ;
        qrdbDate.datafield := 'Date_Required';
      end;
    2:begin
        qrlblDate.caption := 'Template Date' ;
        qrdbDate.datafield := 'Template_Date';
      end;
  end;

  case sortby of
    0:begin
        qrbGroupFooter.enabled := false;
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
      end;
    1:begin
        qrbGroupFooter.enabled := true;
//        qrbGroupHeader.Expression := 'qrySalesOrders.Template_Date';
//        qrGroupByText.DataField := 'Template_Date';
//        qrlblSortBy.Caption := 'Template Date';
        qrbGroupHeader.Expression := 'qrySalesOrders.' + qrdbDate.datafield;
        qrGroupByText.DataField := qrdbDate.datafield ;
        qrlblSortBy.Caption := qrlblDate.caption;
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Sales_Order_Status';
        qrGroupByText.DataField := 'Sales_Order_Status_Desc';
        qrlblSortBy.Caption := 'Status';
      end;
    4:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep';
      end;
    5:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Account_Manager_Name';
        qrGroupByText.DataField := 'Account_Manager_Name';
        qrlblSortBy.Caption := 'Office Contact';
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
  CustomerGoods := 0.00;
  CustomerCost := 0.00;
  CustomerMargin := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;

  ReportGoods := 0.00;
  ReportCost := 0.00;
  ReportMargin := 0.00;
  ReportVAT := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmWTRPSOCostAnalysis.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rMargin, rCostPerc: real;
begin
  case selectby of
    0:begin
        qrlblReportDate.caption := paDateStr(qrySalesOrders.fieldbyname('Date_Raised').asdatetime);
      end;
    1:begin
        qrlblReportDate.caption := paDateStr(qrySalesOrders.fieldbyname('Date_Required').asdatetime);
      end;
    2:begin
        qrlblReportDate.caption := paDateStr(qrySalesOrders.fieldbyname('Template_Date').asdatetime);
      end;
  end;

  try
    qrlblCost.caption := formatfloat('0.00',qrySalesOrders.fieldbyname('Total_Materials').asfloat);
  except
    qrlblCost.caption := '0.00';
  end;
  
  rMargin := qrySalesOrders.fieldbyname('Goods_Value').asfloat - qrySalesOrders.fieldbyname('Total_Materials').asfloat;

  if qrySalesOrders.fieldbyname('Goods_Value').asfloat = 0 then
    rCostPerc := 999.99
  else
    rCostPerc := (qrySalesOrders.fieldbyname('Total_Materials').asfloat/qrySalesOrders.fieldbyname('Goods_Value').asfloat)*100;

  qrlblMargin.caption := formatfloat('0.00',rMargin);
  qrlblCostPerc.caption := formatfloat('0.00%',rCostPerc);

  CustomerGoods := CustomerGoods + qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  CustomerCost := CustomerCost + qrySalesOrders.fieldbyname('Total_Materials').asfloat;
  CustomerMargin := CustomerMargin + rMargin;

  ReportGoods := ReportGoods +  qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  ReportCost := ReportCost +  qrySalesOrders.fieldbyname('Total_Materials').asfloat;
  ReportMargin := ReportMargin +  rMargin;
end;

procedure TfrmWTRPSOCostAnalysis.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerCost := 0.00;
  CustomerMargin := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
end;

procedure TfrmWTRPSOCostAnalysis.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustGoods.caption := formatfloat('0.00',CustomerGoods);
  qrlblCustCost.caption := formatfloat('0.00',CustomerCost);

  qrlblCustMargin.caption := formatfloat('0.00',CustomerMargin);

  try
    if CustomerGoods = 0 then
      qrlblCustPerc.caption := '999.99%'
    else
      qrlblCustPerc.caption := formatfloat('0.00%',(CustomerCost/CustomerGoods)*100);
  except
    qrlblCustPerc.caption := formatfloat('0.00%',999.99);
  end;
end;

function TfrmWTRPSOCostAnalysis.GetDetails: integer;
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
    0: begin
        qrySalesOrders.SQL.Add(' ((Sales_Order.Date_Raised >= :Date_From) and (Sales_Order.Date_Raised < :Date_To)) ');
       end;
    1: begin
        qrySalesOrders.SQL.Add(' ((Sales_Order.Date_Required >= :Date_From) and (Sales_Order.Date_Required < :Date_To)) ');
       end;
    2: begin
        qrySalesOrders.SQL.Add(' ((Sales_Order.Template_Date >= :Date_From) and (Sales_Order.Template_Date < :Date_To)) ');
       end;
    3: begin
        qrySalesOrders.SQL.Add(' ((Sales_Order.Date_Raised >= :Date_From) and (Sales_Order.Date_Raised < :Date_To)) AND ');
        qrySalesOrders.SQL.Add(' ((Sales_Order.Date_Type = ''T'')) ');
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

  case sortby of
    0:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order');
      end;
    1:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Template_Date, Sales_Order.Sales_Order');
      end;
    2:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Customer_Name, Sales_Order.Sales_Order');
      end;
    3:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order_Status, Sales_Order.Sales_Order');
      end;
    4:begin
        qrySalesOrders.SQL.Add('ORDER BY Rep.Rep_Name, Sales_Order.Sales_Order');
      end;
    5:begin
        qrySalesOrders.SQL.Add('ORDER BY Operator.Operator_Name, Sales_Order.Sales_Order');
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

//  qrySalesOrders.parambyname('Customer_List').asstring := customerList;
//  qrySalesOrders.parambyname('Customer').asinteger := customer;
  qrySalesOrders.parambyname('Rep').asinteger := rep;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom;
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo;
  qrySalesOrders.Open;
  result := qrySalesOrders.recordcount;
end;

procedure TfrmWTRPSOCostAnalysis.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportGoods.caption := formatfloat('0.00',ReportGoods);
  qrlblReportCost.caption := formatfloat('0.00',ReportCost);
  qrlblReportMargin.caption := formatfloat('0.00',ReportMargin);

  try
    if ReportGoods = 0 then
      qrlblReportPerc.caption := '999.99%'
    else
      qrlblReportPerc.caption := formatfloat('0.00%',(ReportCost/ReportGoods)*100);
  except
    qrlblReportPerc.caption := formatfloat('0.00%',999.99);
  end;

end;

procedure TfrmWTRPSOCostAnalysis.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmWTRPSOCostAnalysis.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Sales Order"';

  case SelectBy of
    0: begin
        tempStr := tempStr + ',"Order Date"';
       end;
    1: begin
        tempStr := tempStr + ',"Fitting Date"';
       end;
    2: begin
        tempStr := tempStr + ',"Template Date"';
       end;
  end;

  tempStr := tempStr
    + ',"Customer"'
    + ',"Category"'
    + ',"Reference"'
    + ',"Customer Order Ref"'
    + ',"Rep"'
    + ',"Goods"'
    + ',"Material Cost"'
    + ',"Margin"'
    + ',"Cost %"'
    + ',"Status"'
    + ',"Account Manager"';

  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPSOCostAnalysis.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qrySalesOrders.fieldbyname('Sales_Order').asstring + '"';

    //Date Raised
    case SelectBy of
    0: begin
        tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Raised').asstring + '"';
       end;
    1: begin
        tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Required').asstring + '"';
       end;
    2: begin
        tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Template_Date').asstring + '"';
       end;
    end;

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

    //Reference
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Reference').asstring + '"';

    //Customer Order Ref
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Order_Ref_No').asstring + '"';

    //Rep
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Rep_Name').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Goods_Value').asstring + '"';

    //CostValue
    tempStr := tempStr + ',"' + qrlblCost.caption + '"';

    //Margin
    tempStr := tempStr + ',"' + qrlblMargin.caption + '"';

    //Cost Percentage
    tempStr := tempStr + ',"' + qrlblCostPerc.caption + '"';

    //Status
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Sales_Order_Status_Desc').asstring + '"';

    //Account Manager
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Account_Manager_Name').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOCostAnalysis.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSOCostAnalysis.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmWTRPSOCostAnalysis.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmWTRPSOCostAnalysis.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

end.
