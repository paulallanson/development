unit WTRPSOrderTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPSOrderTemplate = class(TForm)
    qrpDetails: TQuickRep;
    qrySalesOrders: TFDQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrlblTotal: TQRLabel;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    qrlblPhone: TQRLabel;
    qrPhoneText: TQRDBText;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    qrySalesOrdersSales_Order: TIntegerField;
    qrySalesOrdersSales_order_Line_no: TIntegerField;
    qrySalesOrdersNett_Price: TFloatField;
    qrySalesOrdersDiscount_Value: TFloatField;
    qrySalesOrdersInstallation_price: TFloatField;
    qrySalesOrdersSurvey_price: TFloatField;
    qrySalesOrdersDelivery_Price: TFloatField;
    qrySalesOrdersVat: TIntegerField;
    qrySalesOrdersVat_Rate: TFloatField;
    qrySalesOrdersQuote: TIntegerField;
    qrySalesOrdersUnit_price: TFloatField;
    qrySalesOrdersJob: TFloatField;
    qrySalesOrdersDate_Raised: TDateTimeField;
    qrySalesOrdersTemplate_Date: TDateTimeField;
    qrySalesOrdersCustomer_Name: TStringField;
    qrySalesOrdersReference: TStringField;
    qrySalesOrdersTelephone_number: TStringField;
    qrrchTextAddress: TQRRichText;
    qrygetNotes: TFDQuery;
    qrySalesOrdersDescription: TStringField;
    qrySalesOrdersInstall_Address: TIntegerField;
    qrGroupbyFootText: TQRDBText;
    qrySalesOrdersSales_Order_Status: TIntegerField;
    qrySalesOrdersSales_Order_Status_Desc: TStringField;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    qrlblVAT: TQRLabel;
    qrlblGoods: TQRLabel;
    qrlblCustGoods: TQRLabel;
    qrlblCustVAT: TQRLabel;
    qrlblReportVAT: TQRLabel;
    qrlblReportGoods: TQRLabel;
    qrlblTemplateDate: TQRLabel;
    qrySalesOrdersMarkup_Value: TFloatField;
    qrySalesOrdersWaste_Value: TFloatField;
    qrlblSelection: TQRLabel;
    qrySalesOrdersRep_Name: TStringField;
    qrySalesOrdersRep: TIntegerField;
    qrySalesOrdersIs_Retail_Customer: TStringField;
    qrySalesOrdersIs_Commercial_Customer: TStringField;
    qrySalesOrdersInstall_Name: TStringField;
    qrySalesOrdersInstall_Phone: TStringField;
    qrySalesOrdersEmail_Address: TStringField;
    qrySalesOrdersIsTemplateInOutlook: TStringField;
    OLDqrySalesOrders: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    IntegerField3: TIntegerField;
    FloatField6: TFloatField;
    IntegerField4: TIntegerField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField5: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField6: TStringField;
    IntegerField7: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
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
  private
    CustomerGoods, CustomerVAT, CustomerTotal, ReportGoods, ReportVAT, ReportTotal: real;
    FCustomerCategory: integer;
    function BuildNotes(const iNotes: integer): string;
    procedure SetCustomerCategory(const Value: integer);
  public
    bIncludeInvoiced: boolean;
    bShowOnlyScheduled: boolean;
    SortBy: integer;
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPSOrderTemplate: TfrmwtRPSOrderTemplate;

implementation

uses wtDataModule, WTRSSOrderTemplate, AllCommon;

{$R *.dfm}

procedure TfrmwtRPSOrderTemplate.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case sortby of
    0:begin
        qrbGroupFooter.enabled := false;
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
        qrlblPhone.Enabled := false;
        qrPhoneText.Enabled := false;
      end;
    1:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Template_Date';
        qrGroupByText.DataField := 'Template_Date';
        qrlblSortBy.Caption := 'Template Date';
        qrlblPhone.Enabled := false;
        qrPhoneText.Enabled := false;
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
        qrlblPhone.Enabled := true;
        qrPhoneText.Enabled := true;
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Sales_Order_Status';
        qrGroupByText.DataField := 'Sales_Order_Status_Desc';
        qrlblSortBy.Caption := 'Status';
        qrlblPhone.Enabled := false;
        qrPhoneText.Enabled := false;
      end;
    4:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep';
        qrlblPhone.Enabled := false;
        qrPhoneText.Enabled := false;
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;

  ReportGoods := 0.00;
  ReportVAT := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSOrderTemplate.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CompleteTotal, QuoteTotal, VATTotal: real;
  iCount: integer;
begin
  {Reset the colour to white}
  qrsbDetails.color := clWhite;
  for iCount := 0 to pred(componentcount) do
    begin
      if Components[iCount] is TQRDBText then
        begin
          TQRDBText(Components[iCount]).color := clWhite;
          TQRDBText(Components[iCount]).font.Style := [];
        end;
      if Components[iCount] is TQRLabel then
        begin
          TQRLabel(Components[iCount]).color := clWhite;
          TQRLabel(Components[iCount]).font.Style := [];
        end;
      if Components[iCount] is TQRRichText then
        begin
          TQRRichText(Components[iCount]).color := clWhite;
          TQRRichText(Components[iCount]).font.Style := [];
        end;
    end;

  if qrySalesOrders.fieldbyname('IsTemplateInOutlook').asstring = 'Y' then
    begin
      qrsbDetails.color := clMoneyGreen;
      for iCount := 0 to pred(componentcount) do
        begin
          if Components[iCount].Tag = 1 then
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).color := clMoneyGreen;
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).color := clMoneyGreen;
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).color := clMoneyGreen;
            end
          else
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).color := clWhite;
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).color := clWhite;
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).color := clWhite;
            end;

        end;
    end;

  if qrySalesOrders.fieldbyname('Sales_Order_Status').asinteger >= 90 then
    begin
//      qrsbDetails.Font.Style := [fsitalic, fsbold];
      for iCount := 0 to pred(componentcount) do
        begin
          if Components[iCount].Tag = 1 then
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).font.Style := [fsitalic, fsbold];
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).font.Style := [fsitalic, fsbold];
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).font.Style := [fsitalic, fsbold];
            end
          else
            begin
              if Components[iCount] is TQRDBText then
                TQRDBText(Components[iCount]).font.Style := [];
              if Components[iCount] is TQRLabel then
                TQRLabel(Components[iCount]).font.Style := [];
              if Components[iCount] is TQRRichText then
                TQRRichText(Components[iCount]).font.Style := [];
            end;

        end;
    end;

  qrlblTemplateDate.caption := paDatestr(qrySalesOrders.fieldbyname('Template_Date').asdatetime);

  CompleteTotal := qrySalesOrders.fieldbyname('Nett_Price').asfloat -
                      qrySalesOrders.fieldbyname('Discount_Value').asfloat + qrySalesOrders.fieldbyname('Markup_Value').asfloat + qrySalesOrders.fieldbyname('Waste_Value').asfloat;


  QuoteTotal := CompleteTotal +
                      qrySalesOrders.fieldbyname('Installation_Price').asfloat +
                      qrySalesOrders.fieldbyname('Survey_Price').asfloat +
                      qrySalesOrders.fieldbyname('Delivery_Price').asfloat;

  VATTotal := QuoteTotal * (qrySalesOrders.fieldbyname('VAT_Rate').asfloat/100);

  qrlblGoods.caption := formatfloat('0.00',(QuoteTotal));
  qrlblVAT.caption := formatfloat('0.00',(VATTotal));
  qrlblTotal.caption := formatfloat('0.00',(QuoteTotal+VATTotal));

  CustomerGoods := CustomerGoods + QuoteTotal;
  CustomerVAT := CustomerVat + VATTotal;
  CustomerTotal := CustomerTotal + QuoteTotal+VATTotal;

  ReportGoods := ReportGoods + QuoteTotal;
  ReportVAT := ReportVAT + QuoteTotal;
  ReportTotal := ReportTotal + QuoteTotal+VATTotal;

  qrrchTextAddress.lines.clear;
  qrrchTextAddress.lines.add(qrySalesOrders.fieldbyname('Install_Name').asstring);
  qrrchTextAddress.lines.add(BuildNotes(qrySalesOrders.fieldbyname('Install_Address').asinteger));
  if qrySalesOrders.fieldbyname('Install_Phone').asstring <> '' then
    qrrchTextAddress.lines.add(qrySalesOrders.fieldbyname('Install_Phone').asstring);
  if qrySalesOrders.fieldbyname('Email_Address').asstring <> '' then
    qrrchTextAddress.lines.add(qrySalesOrders.fieldbyname('Email_Address').asstring);
end;

function TfrmwtRPSOrderTemplate.BuildNotes(const iNotes: integer): string;
var
  aStr: string;
begin
  if iNotes > 0 then
    begin
      qryGetNotes.parambyname('Notes_Code').asinteger := iNotes;
      qryGetNotes.open;
      aStr := '';
      while (not qryGetNotes.eof) do
        Begin
          astr := aStr + qryGetNotes.fieldbyname('Notes_text').asstring;
          if Length(qryGetNotes.fieldbyname('Notes_text').asstring) < 100 then
            aStr := aStr + ' ';
          qryGetNotes.next;
        end;
      qryGetNotes.close;
    end;
  result := aStr;
end;

procedure TfrmwtRPSOrderTemplate.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
end;

procedure TfrmwtRPSOrderTemplate.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustGoods.caption := formatfloat('0.00',CustomerGoods);
  qrlblCustVAT.caption := formatfloat('0.00',CustomerVAT);
  qrlblCustTotal.caption := formatfloat('0.00',CustomerTotal);
end;

function TfrmwtRPSOrderTemplate.GetDetails: integer;
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

  if bShowOnlyScheduled then
    qrySalesOrders.parambyname('IsTemplateInOutlook').asstring := 'Y'
  else
    qrySalesOrders.parambyname('IsTemplateInOutlook').asstring := 'N';

  if self.bIncludeInvoiced then
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 110
  else
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 50;

  qrySalesOrders.parambyname('Customer').asinteger := customer;
  qrySalesOrders.parambyname('Rep').asinteger := rep;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom + StrToTime('00:00:00');
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo + StrToTime('23:59:59');
  qrySalesOrders.Open;
  result := qrySalesOrders.recordcount;
end;

procedure TfrmwtRPSOrderTemplate.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportGoods.caption := formatfloat('0.00',ReportGoods);
  qrlblReportVAT.caption := formatfloat('0.00',ReportVAT);
  qrlblReportTotal.caption := formatfloat('0.00',ReportTotal);
end;

procedure TfrmwtRPSOrderTemplate.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSOrderTemplate.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Sales Order"'
    + ',"Date"'
    + ',"Quote"'
    + ',"Template Date"'
    + ',"Rep"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Install Name"'
    + ',"Install Telephone"'
    + ',"Install Email Address"'
    + ',"Description"'
    + ',"Reference"'
    + ',"Goods"'
    + ',"VAT"'
    + ',"Total"'
    + ',"In Schedule"'
    + ',"Invoiced"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPSOrderTemplate.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qrySalesOrders.fieldbyname('Sales_Order').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Raised').asstring + '"';

    //Quote
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Quote').asstring + '"';

    //Template Date
    tempStr := tempStr + ',"' + qrlblTemplateDate.caption + '"';

    //Rep
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Rep_Name').asstring + '"';

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

    //Install Name
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Install_Name').asstring + '"';

    //Install Number
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Install_Phone').asstring + '"';

    //Install Email
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Email_Address').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Description').asstring + '"';

    //Date Required
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Reference').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qrlblGoods.caption + '"';

    //VAT Value
    tempStr := tempStr + ',"' + qrlblVat.caption + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrlblTotal.caption + '"';

    //Is Template in Outlook
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('IsTemplateInOutlook').asstring + '"';

    //Invoiced
    if qrySalesOrders.fieldbyname('Sales_Order_Status').asfloat >= 90 then
      tempStr := tempStr + ',"' + 'Y' + '"'
    else
      tempStr := tempStr + ',"' + 'N' + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOrderTemplate.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPSOrderTemplate.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

end.
