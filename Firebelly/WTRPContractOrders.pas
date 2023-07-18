unit WTRPContractOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPContractOrders = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TFDQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    qrbGroupFooter: TQRBand;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblDateRange: TQRLabel;
    qrGroupbyFootText: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    qrlblSelection: TQRLabel;
    gtQRLabel1: TQRLabel;
    qrbQuoteHeader: TQRGroup;
    qrbQuoteFooter: TQRBand;
    qrlblCustTotal: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText5: TQRDBText;
    gtQRDBText1: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRDBText2: TQRDBText;
    gtQRDBText3: TQRDBText;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    gtQRLabel5: TQRLabel;
    qrlblOrderValue: TQRLabel;
    gtQRShape1: TQRShape;
    gtQRLabel7: TQRLabel;
    qrlblContractTotal: TQRLabel;
    qrlblContractCount: TQRLabel;
    qrlblCustCount: TQRLabel;
    qrlblReportCount: TQRLabel;
    gtQRLabel8: TQRLabel;
    gtQRDBText4: TQRDBText;
    gtQRLabel6: TQRLabel;
    gtQRLabel9: TQRLabel;
    gtQRLabel10: TQRLabel;
    qrlblInvoiced: TQRLabel;
    qrlblTempDate: TQRLabel;
    qrlblFitDate: TQRLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrbQuoteFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbQuoteHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
    bShowOnlyScheduled: boolean;
    SortBy: integer;
    customer, rep: integer;
    customerList: TstringList;
    DateFrom, DateTo: TDateTime;
    exporting: boolean;
    exportFile: textFile;
    rContractTotal, rCustomerTotal, rReportTotal: real;
    iContractCount, iCustomerCount, iReportCount: integer;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPContractOrders: TfrmwtRPContractOrders;

implementation

uses wtDataModule, WTRSContractOrders, allCommon;

{$R *.dfm}

procedure TfrmwtRPContractOrders.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
        qrbGroupHeader.Expression := 'qryReport.Contract_Date';
        qrGroupByText.DataField := 'Contract_Date';
        qrlblSortBy.Caption := 'Contract Date';
      end;
    2:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Customer_Name';
        qrGroupByText.DataField := 'Customer_Name';
        qrlblSortBy.Caption := 'Customer';
      end;
    3:begin
        qrbGroupFooter.enabled := true;
        qrbGroupHeader.Expression := 'qryReport.Rep_Name';
        qrGroupByText.DataField := 'Rep_Name';
        qrlblSortBy.Caption := 'Rep';
      end;
  end;

  qrGroupByFootText.DataField := qrGroupByText.DataField;

  rContractTotal := 0;
  rCustomerTotal := 0;
  rReportTotal := 0;
end;

procedure TfrmwtRPContractOrders.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iRecordCount: integer;
  rTotal: real;
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

  if qryReport.fieldbyname('IsFittingInOutlook').asstring = 'Y' then
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

  if (qryReport.FieldByName('Contract_Quote').asstring = 'Y') or (qryReport.FieldByName('Sales_Order').asinteger = 0) then
    begin
      PrintBand := false;
      exit;
    end;

  rTotal := (qryReport.FieldByName('Nett_Price').asfloat
                      - qryReport.FieldByName('Discount_Value').asfloat
                      + qryReport.FieldByName('Markup_Value').asfloat
                      + qryReport.FieldByName('Installation_Price').asfloat
                      + qryReport.FieldByName('Delivery_Price').asfloat
                      + qryReport.FieldByName('Survey_Price').asfloat);

  qrlblOrderValue.caption := formatfloat('£#,##0.00',rTotal);

  if qryReport.fieldbyname('Template_Date').asstring = '' then
    qrlblTempDate.caption := ''
  else
    qrlblTempDate.caption := padatestr(qryReport.fieldbyname('Template_Date').asdatetime);

  if qryReport.fieldbyname('Date_Required').asstring = '' then
    qrlblFitDate.caption := ''
  else
    qrlblFitDate.caption := padatestr(qryReport.fieldbyname('Date_Required').asdatetime);


  if qryReport.fieldbyname('Quantity_Invoiced').asinteger >= qryReport.fieldbyname('Quantity').asinteger then
    qrlblInvoiced.caption := 'Y'
  else
  if (qryReport.fieldbyname('Quantity_Invoiced').asinteger < qryReport.fieldbyname('Quantity').asinteger) AND (qryReport.fieldbyname('Quantity_Invoiced').asinteger > 0) then
    qrlblInvoiced.caption := 'P'
  else
    qrlblInvoiced.caption := 'N';

  rContractTotal := rContractTotal + rTotal;
  rCustomerTotal := rCustomerTotal + rTotal;
  rReportTotal := rReportTotal + rTotal;

  iContractCount := iContractCount + 1;
  iCustomerCount := iCustomerCount + 1;
  iReportCount := iReportCount + 1;
end;

procedure TfrmwtRPContractOrders.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  icount: integer;
begin
  rCustomerTotal := 0;
  iCustomerCount := 0;
end;

procedure TfrmwtRPContractOrders.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustTotal.Caption := formatfloat('£#,##0.00',rCustomerTotal);
  qrlblCustCount.caption := inttostr(iCustomerCount) + ' orders';
end;

function TfrmwtRPContractOrders.GetDetails: integer;
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
  if customerList.Count > 0 then
    begin
      qryReport.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qryReport.SQL.Add('(Contract_Quote.Customer = ' + customerList[iCount] + ')')
          else
            qryReport.SQL.Add(' OR (Contract_Quote.Customer = ' + customerList[iCount] + ')')
        end;
      qryReport.SQL.Add(')');
    end;

  case sortby of
    0:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
    1:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Contract_Date, Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
    2:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Customer_Name, Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
    3:begin
        qryReport.SQL.Add('ORDER BY Rep.Rep_Name, Contract_Quote.Quote_Number, Contract_Quote_Line.Line_Number, Contract_Quote_Line_Option.Option_Number');
      end;
  end;

  qryReport.Close;

  if bShowOnlyScheduled then
    qryReport.parambyname('IsFittingInOutlook').asstring := 'Y'
  else
    qryReport.parambyname('IsFittingInOutlook').asstring := 'N';
    
  qryReport.parambyname('Rep').asinteger := rep;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmwtRPContractOrders.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportTotal.Caption := formatfloat('£#,##0.00',rReportTotal);
  qrlblReportCount.caption := inttostr(iReportCount)+ ' orders';
end;

procedure TfrmwtRPContractOrders.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  icount: integer;
begin
  rReportTotal := 0;
  iReportCount := 0;
end;

procedure TfrmwtRPContractOrders.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Quote"'
    + ',"Contract Date"'
    + ',"Expiry Date"'
    + ',"Customer"'
    + ',"Rep"'
    + ',"Developer"'
    + ',"Site Location"'
    + ',"Order"'
    + ',"Order Date"'
    + ',"Reference"'
    + ',"Customer Order"'
    + ',"Template Date"'
    + ',"Fitting Date"'
    + ',"Invoiced"'
    + ',"In Schedule"'
    + ',"Value"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPContractOrders.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmwtRPContractOrders.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmwtRPContractOrders.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

procedure TfrmwtRPContractOrders.qrbQuoteFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := iContractCount > 0;
  
  qrlblContractTotal.caption := formatfloat('£#,##0.00',rContractTotal);
  qrlblContractCount.caption := inttostr(iContractCount) + ' orders';
end;

procedure TfrmwtRPContractOrders.qrbQuoteHeaderBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  iCount: integer;
begin
  rContractTotal := 0;
  iContractCount := 0;
end;

procedure TfrmwtRPContractOrders.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  icount: integer;
  tempstr: string;
begin
  if self.exporting and BandPrinted then
  begin
    //Quote
    tempStr := '"' + qryReport.fieldbyname('Quote_Number').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Contract_Date').asstring + '"';

    //expiry date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Expiry_Date').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Rep
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';

    //Developer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Developer').asstring + '"';

    //Location
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Site_Location').asstring + '"';

    //Sales Order
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Sales_Order').asstring + '"';

    //Order Date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Raised').asstring + '"';

    //Reference
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Reference').asstring + '"';

    //Customer Order
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Order_Ref_No').asstring + '"';

    //Template Date
    tempStr := tempStr + ',"' + qrlblTempDate.caption + '"';

    //Fitting Date
    tempStr := tempStr + ',"' + qrlblFitDate.caption + '"';

    //Invoiced
    tempStr := tempStr + ',"' + qrlblInvoiced.caption + '"';

    //Invoiced
    tempStr := tempStr + ',"' + qryReport.fieldbyname('IsFittingInOutlook').asstring + '"';

    //Value
    tempStr := tempStr + ',"' + qrlblOrderValue.caption + '"';
    writeln(self.exportFile, tempStr);
    frmWTRSContractOrders.prgbrExport.StepIt;
  end;
end;

end.
