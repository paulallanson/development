unit WTRPSOAntInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmwtRPSOAntInvoice = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TgtQRLabel;
    qrySalesOrders: TQuery;
    qrsbDetails: TQRSubDetail;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRLabel5: TgtQRLabel;
    QRLabel6: TgtQRLabel;
    QRLabel7: TgtQRLabel;
    QRLabel8: TgtQRLabel;
    QRLabel11: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRDBText3: TgtQRDBText;
    QRDBText5: TgtQRDBText;
    QRDBText6: TgtQRDBText;
    QRDBText10: TgtQRDBText;
    QRDBText11: TgtQRDBText;
    QRLabel1: TgtQRLabel;
    QRLabel12: TgtQRLabel;
    QRLabel14: TgtQRLabel;
    qrlblDateRange: TgtQRLabel;
    QRBand2: TQRBand;
    QRLabel10: TgtQRLabel;
    qrlblReportTotal: TgtQRLabel;
    QRShape2: TgtQRShape;
    QRDBText1: TgtQRDBText;
    QRDBText9: TgtQRDBText;
    qrlblVATTotal: TgtQRLabel;
    qrlblGoodsTotal: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBText8: TgtQRDBText;
    QRLabel9: TgtQRLabel;
    QRDBText12: TgtQRDBText;
    qrlblDeposit: TgtQRLabel;
    qrlblDateRequired: TgtQRLabel;
    QRSysData2: TgtQRSysData;
    QRSysData1: TgtQRSysData;
    qrlblSelection: TgtQRLabel;
    qrbGroupHeader: TQRGroup;
    qrlblSortBy: TgtQRLabel;
    qrGroupbyText: TgtQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal: TgtQRLabel;
    qrlblCustVAT: TgtQRLabel;
    QRShape1: TgtQRShape;
    qrGroupbyFootText: TgtQRDBText;
    gtQRLabel1: TgtQRLabel;
    qrlblCustGoods: TgtQRLabel;
    qrlblCustDeposit: TgtQRLabel;
    gtqrStatus: TgtQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbCustomerFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbCustomerFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    CustomerGoods, CustomerVAT, CustomerTotal, CustomerDeposit, ReportGoods, ReportVAT, ReportTotal: real;
    exporting: boolean;
    exportFile: textFile;
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    bShowOnlyScheduled: boolean;
    bIncludeInvoiced: boolean;
    SortBy: integer;
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPSOAntInvoice: TfrmwtRPSOAntInvoice;
  rGoods, rVAT, rDeposit: real;

implementation

uses wtDataModule, wtRSSOAntInvoice, AllCommon;

{$R *.dfm}

procedure TfrmwtRPSOAntInvoice.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  case sortby of
    0:begin
        qrbGroupFooter.enabled := false;
        qrbGroupHeader.Expression := '';
        qrGroupByText.DataField := '';
        qrlblSortBy.Caption := '';
      end;
    1:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qrySalesOrders.Template_Date';
        qrGroupByText.DataField := 'Template_Date';
        qrlblSortBy.Caption := 'Template Date';
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
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerDeposit := 0.00;
  CustomerTotal := 0.00;

  ReportTotal := 0.00;
  rGoods := 0.00;
  rVAT := 0.00;
  rDeposit := 0.00;
end;

procedure TfrmwtRPSOAntInvoice.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
end;

procedure TfrmwtRPSOAntInvoice.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ReportTotal := rGoods + rVAT;

end;

function TfrmwtRPSOAntInvoice.GetDetails: integer;
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
        qrySalesOrders.SQL.Add('ORDER BY Rep.Rep_Name, Sales_Order.Sales_Order ASC');
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
    qrySalesOrders.parambyname('IsFittingInOutlook').asstring := 'Y'
  else
    qrySalesOrders.parambyname('IsFittingInOutlook').asstring := 'N';
    
  if self.bIncludeInvoiced then
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 110
  else
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 100;

  qrySalesOrders.parambyname('Customer').asinteger := customer;
  qrySalesOrders.parambyname('Rep').asinteger := Rep;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom + StrToTime('00:00:00');
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo + StrToTime('23:59:59');
  qrySalesOrders.Open;
end;

procedure TfrmwtRPSOAntInvoice.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblGoodsTotal.caption := formatfloat('#,##0.00',rGoods);
  qrlblVATTotal.caption := formatfloat('#,##0.00',rVAT);
  qrlblDeposit.caption := formatfloat('#,##0.00',rDeposit);
  qrlblReportTotal.caption := formatfloat('#,##0.00',(rGoods + rVAT - rDeposit));
end;

procedure TfrmwtRPSOAntInvoice.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPSOAntInvoice.qrsbDetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  iCount: integer;
begin
  {Reset the colour to white}
  qrsbDetails.color := clWhite;
  for iCount := 0 to pred(componentcount) do
    begin
      if Components[iCount] is TgtQRDBText then
        begin
          TgtQRDBText(Components[iCount]).color := clWhite;
          TgtQRDBText(Components[iCount]).font.Style := [];
        end;
      if Components[iCount] is TgtQRLabel then
        begin
          TgtQRLabel(Components[iCount]).color := clWhite;
          TgtQRLabel(Components[iCount]).font.Style := [];
        end;
      if Components[iCount] is TgtQRRichText then
        begin
          TgtQRRichText(Components[iCount]).color := clWhite;
          TgtQRRichText(Components[iCount]).font.Style := [];
        end;
    end;

  if qrySalesOrders.fieldbyname('IsFittingInOutlook').asstring = 'Y' then
    begin
      qrsbDetails.color := clMoneyGreen;
      for iCount := 0 to pred(componentcount) do
        begin
          if Components[iCount].Tag = 1 then
            begin
              if Components[iCount] is TgtQRDBText then
                TgtQRDBText(Components[iCount]).color := clMoneyGreen;
              if Components[iCount] is TgtQRLabel then
                TgtQRLabel(Components[iCount]).color := clMoneyGreen;
              if Components[iCount] is TgtQRRichText then
                TgtQRRichText(Components[iCount]).color := clMoneyGreen;
            end
          else
            begin
              if Components[iCount] is TgtQRDBText then
                TgtQRDBText(Components[iCount]).color := clWhite;
              if Components[iCount] is TgtQRLabel then
                TgtQRLabel(Components[iCount]).color := clWhite;
              if Components[iCount] is TgtQRRichText then
                TgtQRRichText(Components[iCount]).color := clWhite;
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
              if Components[iCount] is TgtQRDBText then
                TgtQRDBText(Components[iCount]).font.Style := [fsitalic, fsbold];
              if Components[iCount] is TgtQRLabel then
                TgtQRLabel(Components[iCount]).font.Style := [fsitalic, fsbold];
              if Components[iCount] is TgtQRRichText then
                TgtQRRichText(Components[iCount]).font.Style := [fsitalic, fsbold];
            end
          else
            begin
              if Components[iCount] is TgtQRDBText then
                TgtQRDBText(Components[iCount]).font.Style := [];
              if Components[iCount] is TgtQRLabel then
                TgtQRLabel(Components[iCount]).font.Style := [];
              if Components[iCount] is TgtQRRichText then
                TgtQRRichText(Components[iCount]).font.Style := [];
            end;

        end;
    end;

  if qrySalesOrders.fieldbyname('On_Hold').asstring = 'Y' then
    gtqrStatus.Caption := 'On Hold'
  else
    gtqrStatus.Caption := qrySalesOrders.fieldbyname('Sales_Order_Status_Desc').asstring;

  qrlblDateRequired.caption := paDatestr(qrySalesOrders.fieldbyname('Date_Required').asdatetime);

  CustomerGoods := CustomerGoods + qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  CustomerVAT := CustomerVat + qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  CustomerDeposit := CustomerDeposit + qrySalesOrders.fieldbyname('Deposit_Amount').asfloat;

  rGoods := rGoods + qrySalesOrders.fieldbyname('Goods_Value').asfloat;
  rVat := rVat + qrySalesOrders.fieldbyname('Vat_Value').asfloat;
  rDeposit := rDeposit + qrySalesOrders.fieldbyname('Deposit_Amount').asfloat;
end;

procedure TfrmwtRPSOAntInvoice.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Sales Order"'
    + ',"Date"'
    + ',"Rep"'
    + ',"Customer"'
    + ',"Category"'
    + ',"Reference"'
    + ',"Order No"'
    + ',"Required"'
    + ',"Job No"'
    + ',"Goods"'
    + ',"VAT"'
    + ',"Deposit Paid"'
    + ',"Total to Invoice"'
    + ',"In Schedule"'
    + ',"Status"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPSOAntInvoice.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qrySalesOrders.fieldbyname('Sales_Order').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Date_Raised').asstring + '"';

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

    //Refernce
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Reference').asstring + '"';

    //Customer Order Refernce
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Order_Ref_No').asstring + '"';

    //Date Required
    tempStr := tempStr + ',"' + qrlblDateRequired.caption + '"';

    //Job Number
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Job_Number').asstring + '"';

    //Goods Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Goods_Value').asstring + '"';

    //VAT Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Vat_Value').asstring + '"';

    //Deposit Paid
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Deposit_Amount').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('Total_Value').asstring + '"';

    //Total Value
    tempStr := tempStr + ',"' + qrySalesOrders.fieldbyname('IsFittingInOutlook').asstring + '"';

    //Status
    tempStr := tempStr + ',"' + gtqrStatus.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOAntInvoice.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPSOAntInvoice.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmwtRPSOAntInvoice.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;
  CustomerDeposit := 0.00;
end;

procedure TfrmwtRPSOAntInvoice.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustGoods.caption := formatfloat('0.00',CustomerGoods);
  qrlblCustVAT.caption := formatfloat('0.00',CustomerVAT);
  qrlblCustDeposit.caption := formatfloat('#,##0.00',CustomerDeposit);
  qrlblCustTotal.caption := formatfloat('#,##0.00',(CustomerGoods + CustomerVAT - CustomerDeposit));
  qrlblReportTotal.caption := formatfloat('#,##0.00',(rGoods + rVAT - rDeposit));
end;

end.
