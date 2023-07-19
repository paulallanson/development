unit WTRPCustomerActivity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPCustomerActivity = class(TForm)
    qrpDetails: TQuickRep;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    qryReport: TFDQuery;
    qrgCustomerHead: TQRGroup;
    qrsbDetails: TQRSubDetail;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrbCustomerFooter: TQRBand;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblTotalQuoteCount: TQRLabel;
    QRShape2: TQRShape;
    qrlblDateRange: TQRLabel;
    QRSysData2: TQRSysData;
    qrlblTotalOrderCount: TQRLabel;
    gtQRLabel1: TQRLabel;
    qryActivity: TFDQuery;
    qryQuotes: TFDQuery;
    qrySOrders: TFDQuery;
    gtQRLabel2: TQRLabel;
    qrlblLastActivity: TQRLabel;
    qrlblQuoteCount: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRLabel4: TQRLabel;
    qrlblSOrderCount: TQRLabel;
    qrlblSOrderValue: TQRLabel;
    qrlblSInvoiceCount: TQRLabel;
    qrlblSInvoiceValue: TQRLabel;
    gtQRLabel7: TQRLabel;
    gtQRLabel8: TQRLabel;
    qrySInvoices: TFDQuery;
    gtQRLabel5: TQRLabel;
    qrlblCustomerCount: TQRLabel;
    qrlblGrpQuoteCount: TQRLabel;
    qrlblGrpOrderCount: TQRLabel;
    QRShape1: TQRShape;
    qrlblGrpOrderValue: TQRLabel;
    qrlblGrpInvoicecount: TQRLabel;
    qrlblGrpInvoicevalue: TQRLabel;
    qrlblTotalOrderValue: TQRLabel;
    qrlblTotalInvoiceCount: TQRLabel;
    qrlblTotalInvoiceValue: TQRLabel;
    gtQRLabel9: TQRLabel;
    qrlblTotalCustomerCount: TQRLabel;
    gtQRLabel6: TQRLabel;
    gtQRDBText1: TQRDBText;
    qrsbActivity: TQRSubDetail;
    qryActivityDetails: TFDQuery;
    qrlblActivity: TQRLabel;
    qrlblNotes: TQRLabel;
    qrlblContactName: TQRLabel;
    qrlblOperatorName: TQRLabel;
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbCustomerFooterAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbCustomerFooterBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsbActivityBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    exporting: boolean;
    exportFile: textFile;
    iCustomer, iCustQuotes, iQuotes, iSOrders, iSInvoices: integer;
    iTotalCustomers, iTotalCustQuotes, iTotalQuotes, iTotalSOrders, iTotalSInvoices: integer;
    rSOrders, rSInvoices: real;
    rTotalSOrders, rTotalSInvoices: real;
    TotalCount: integer;
    TotalConverted: integer;
    CustomerTotal, ReportTotal: real;
    function ShowNotes(TempNotes: integer): string;
  public
    bDetailed: boolean;
    customer, rep: integer;
    DateFrom, DateTo: TDateTime;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmwtRPCustomerActivity: TfrmwtRPCustomerActivity;

implementation

uses wtDataModule, wtRSCustomerActivity, AllCommon, wtNotesDM;

{$R *.dfm}

procedure TfrmwtRPCustomerActivity.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  iCustomer := 0;
  iCustQuotes := 0;
  iTotalCustomers := 0;
  iTotalCustQuotes := 0;
  iTotalQuotes := 0;
  iTotalSOrders := 0;
  rTotalSOrders := 0;
  iTotalSInvoices := 0;
  rTotalSInvoices := 0;
  iQuotes := 0;
  iSOrders := 0;
  iSInvoices := 0;
  rSOrders := 0.00;
  rSinvoices := 0.00;
  TotalCount := 0;
  TotalConverted := 0;
  CustomerTotal := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPCustomerActivity.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CompleteTotal, QuoteTotal, VATTotal: real;
begin
  iCustomer := iCustomer + 1;
  {Get last activity date}
  with qryActivity do
    begin
      close;
      parambyname('Customer').asinteger := qryReport.fieldbyname('Customer').asinteger;
      open;

      qrlblLastActivity.caption := padatestr(fieldbyname('Date_Time_Entered').asdatetime);
    end;

  {Get Quote Count}
  with qryQuotes do
    begin
      close;
      parambyname('Customer').asinteger := qryReport.fieldbyname('Customer').asinteger;
      parambyname('Date_from').asdatetime := Datefrom;
      parambyname('Date_to').asdatetime := DateTo;
      open;

      if (fieldbyname('Quote_Count').asinteger > 0) then
        iCustQuotes := iCustQuotes + 1;

      qrlblQuoteCount.caption := fieldbyname('Quote_Count').asstring;
      iQuotes := iQuotes + fieldbyname('Quote_Count').asinteger;

    end;

  {Get Sales Order}
  with qrySOrders do
    begin
      close;
      parambyname('Customer').asinteger := qryReport.fieldbyname('Customer').asinteger;
      parambyname('Date_from').asdatetime := Datefrom;
      parambyname('Date_to').asdatetime := DateTo;
      open;

      qrlblSOrderCount.caption := formatfloat('0',fieldbyname('Order_Count').asfloat);
      qrlblSOrderValue.caption := formatfloat('£#,##0.00',fieldbyname('Total_Sales').asfloat);

      iSOrders := iSOrders + fieldbyname('Order_Count').asinteger;
      rSOrders := rSOrders + fieldbyname('Total_Sales').asfloat;
    end;

  {Get Sales Order}
  with qrySInvoices do
    begin
      close;
      parambyname('Customer').asinteger := qryReport.fieldbyname('Customer').asinteger;
      parambyname('Date_from').asdatetime := Datefrom;
      parambyname('Date_to').asdatetime := DateTo;
      open;

      qrlblSInvoiceCount.caption := formatfloat('0',fieldbyname('Invoice_Count').asfloat);
      qrlblSInvoiceValue.caption := formatfloat('£#,##0.00',fieldbyname('Total_Invoice').asfloat);

      iSInvoices := iSInvoices + fieldbyname('Invoice_Count').asinteger;
      rSInvoices := rSInvoices + fieldbyname('Total_Invoice').asfloat;
    end;

  {show activity details}
  if bDetailed then
    begin
      with qryActivityDetails do
        begin
          close;
          parambyname('Customer').asinteger := qryReport.fieldbyname('Customer').asinteger;
          parambyname('Date_from').asdatetime := Datefrom;
          parambyname('Date_to').asdatetime := DateTo;
          open;
          (qrsbActivity.Enabled := recordcount > 0)
          
        end;
    end;
end;

procedure TfrmwtRPCustomerActivity.qrbCustomerFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  iCustomer := 0;
  iCustQuotes := 0;
  iQuotes := 0;
  iSOrders := 0;
  iSinvoices := 0;
  rSOrders := 0;
  rSInvoices := 0;
end;

procedure TfrmwtRPCustomerActivity.qrbCustomerFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  rRate: real;
begin
  qrlblCustomerCount.caption := inttostr(iCustomer) + '/' + inttostr(iCustQuotes);
  qrlblGrpQuoteCount.caption := inttostr(iQuotes);
  qrlblGrpOrderCount.caption := inttostr(iSOrders);
  qrlblGrpOrderValue.caption := formatfloat('£#,##0.00',rSOrders);
  qrlblGrpInvoiceCount.caption := inttostr(iSInvoices);
  qrlblGrpInvoiceValue.caption := formatfloat('£#,##0.00',rSInvoices);

  iTotalCustomers := iTotalCustomers + iCustomer;
  iTotalCustQuotes := iTotalCustQuotes + iCustQuotes;
  iTotalQuotes := iTotalQuotes + iQuotes;
  iTotalSOrders := iTotalSOrders + iSOrders;
  rTotalSOrders := rTotalSOrders + rSOrders;
  iTotalSInvoices := iTotalSInvoices + iSInvoices;
  rTotalSInvoices := rTotalSInvoices + rSInvoices;
end;

function TfrmwtRPCustomerActivity.GetDetails: integer;
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
  qryReport.Close;
  qryReport.parambyname('Customer').asinteger := customer;
  qryReport.parambyname('Rep').asinteger := Rep;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmwtRPCustomerActivity.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rRate: real;
begin
  qrlblTotalCustomerCount.caption := inttostr(iTotalCustomers) + '/' + inttostr(iTotalCustQuotes);
  qrlblTotalQuoteCount.caption := inttostr(iTotalQuotes);
  qrlblTotalOrderCount.caption := inttostr(iTotalSOrders);
  qrlblTotalOrderValue.caption := formatfloat('£#,##0.00',rTotalSOrders);
  qrlblTotalInvoiceCount.caption := inttostr(iTotalSInvoices);
  qrlblTotalInvoiceValue.caption := formatfloat('£#,##0.00',rTotalSInvoices);
end;

procedure TfrmwtRPCustomerActivity.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPCustomerActivity.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Rep"'
    + ',"Customer"'
    + ',"Date Created"'
    + ',"Customer Type"'
    + ',"Last Activity"'
    + ',"Quotes"'
    + ',"Orders"'
    + ',"Order Value"'
    + ',"Invoices"'
    + ',"Invoice Value"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPCustomerActivity.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Rep
    tempStr := '"' + qryReport.fieldbyname('Rep_Name').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Created').asstring + '"';

    //telephone
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Type_Description').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qrlblLastActivity.caption + '"';

    //Refernce
    tempStr := tempStr + ',"' + qrlblQuoteCount.caption + '"';

    tempStr := tempStr + ',"' + qrlblSOrderCount.caption + '"';

    tempStr := tempStr + ',"' + qrlblSOrderValue.caption + '"';

    tempStr := tempStr + ',"' + qrlblSInvoiceCount.caption + '"';

    tempStr := tempStr + ',"' + qrlblSInvoiceValue.caption + '"';
    
    writeln(self.exportFile, tempStr);
    frmWTRSCustomerActivity.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPCustomerActivity.qrsbActivityBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblActivity.caption := padatestr(qryActivityDetails.fieldbyname('Date_Time_Entered').asdatetime);
  qrlblContactName.caption := qryActivityDetails.fieldbyname('Contact_Name').asstring;
  qrlblOperatorName.caption := qryActivityDetails.fieldbyname('Operator_Name').asstring;
  qrlblNotes.caption := ShowNotes(qryActivityDetails.fieldbyname('Narrative').asinteger);
end;

function TfrmwtRPCustomerActivity.ShowNotes(TempNotes: integer): string;
var
  Notes: TNotes;
begin
  Result := '';
  if TempNotes = 0 then exit;
  Notes := TNotes.create;
  try
    Notes.DbKey := TempNotes;
    Notes.LoadfromDb;
    Result := Notes.Data;
  finally
    Notes.free;
  end;
end;

procedure TfrmwtRPCustomerActivity.FormCreate(Sender: TObject);
begin
  dtmdlNotes := TdtmdlNotes.create(self);
end;

procedure TfrmwtRPCustomerActivity.FormDestroy(Sender: TObject);
begin
  dtmdlNotes.free;
end;

end.
