unit WTRPContractQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtRPContractQuote = class(TForm)
    qrpDetails: TQuickRep;
    qryReport: TFDQuery;
    qrbGroupHeader: TQRGroup;
    qrsbDetails: TQRSubDetail;
    qrlblSortBy: TQRLabel;
    qrGroupbyText: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    qrbGroupFooter: TQRBand;
    qrlblCustTotal: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel12: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRDBText8: TQRDBText;
    qrGroupbyFootText: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    qrlblSelection: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRDBText1: TQRDBText;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRDBText2: TQRDBText;
    qrlblUnits: TQRLabel;
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
    CustomerGoods, CustomerVAT, CustomerTotal, ReportGoods, ReportVAT, ReportTotal: real;
    FCustomerCategory: integer;
    procedure SetCustomerCategory(const Value: integer);
  public
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
  frmwtRPContractQuote: TfrmwtRPContractQuote;

implementation

uses wtDataModule, WTRSContractQuote;

{$R *.dfm}

procedure TfrmwtRPContractQuote.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
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
  CustomerGoods := 0.00;
  CustomerVAT := 0.00;
  CustomerTotal := 0.00;

  ReportGoods := 0.00;
  ReportVAT := 0.00;
  ReportTotal := 0.00;
end;

procedure TfrmwtRPContractQuote.qrsbDetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if qryReport.FieldByName('Units').AsInteger = 0 then
    qrlblUnits.caption := qryReport.FieldByName('Drawing_Count').Asstring
  else
    qrlblUnits.caption := qryReport.FieldByName('Units').Asstring;
  CustomerTotal := CustomerTotal + qryReport.FieldByName('Order_Count').Asinteger;
  ReportTotal := ReportTotal + qryReport.FieldByName('Order_Count').Asinteger;
end;

procedure TfrmwtRPContractQuote.qrbGroupFooterAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  CustomerTotal := 0.00;
end;

procedure TfrmwtRPContractQuote.qrbGroupFooterBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblCustTotal.caption := formatfloat('0',CustomerTotal);
end;

function TfrmwtRPContractQuote.GetDetails: integer;
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
        qryReport.SQL.Add('ORDER BY Contract_Quote.Quote_Number');
      end;
    1:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Contract_Date, Contract_Quote.Quote_Number');
      end;
    2:begin
        qryReport.SQL.Add('ORDER BY Contract_Quote.Customer_Name, Contract_Quote.Quote_Number');
      end;
    3:begin
        qryReport.SQL.Add('ORDER BY Rep.Rep_Name, Contract_Quote.Quote_Number');
      end;
  end;

  qryReport.Close;

(*  case CustomerCategory of
    0: qryReport.parambyname('TradeRetail').asstring := 'A';
    1: qryReport.parambyname('TradeRetail').asstring := 'N';
    2: qryReport.parambyname('TradeRetail').asstring := 'Y';
  end;
*)

  qryReport.parambyname('Rep').asinteger := rep;
  qryReport.parambyname('Date_From').Asdatetime := Datefrom;
  qryReport.parambyname('Date_To').Asdatetime := DateTo;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmwtRPContractQuote.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblReportTotal.caption := formatfloat('0',ReportTotal);
end;

procedure TfrmwtRPContractQuote.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  ReportTotal := 0.00;
end;

procedure TfrmwtRPContractQuote.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Contract Quote"'
    + ',"Contract Date"'
    + ',"Expiry Date"'
    + ',"Customer"'
    + ',"Developer"'
    + ',"Site Location"'
    + ',"Rep"'
    + ',"Drawings"'
    + ',"Units"'
    + ',"Options"'
    + ',"Orders"';


  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmwtRPContractQuote.qrsbDetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Job
    tempStr := '"' + qryReport.fieldbyname('Quote_Number').asstring + '"';

    //Date Raised
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Contract_Date').asstring + '"';

    //expiry date
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Expiry_Date').asstring + '"';

    //Customer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customer_Name').asstring + '"';

    //Developer
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Developer').asstring + '"';

    //Location
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Site_Location').asstring + '"';

    //Rep
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Rep_Name').asstring + '"';

    //Drawings
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Drawing_Count').asstring + '"';

    //Units
    tempStr := tempStr + ',"' + qrlblUnits.caption + '"';

    //Options
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Option_Count').asstring + '"';

    //Orders
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Order_Count').asstring + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSContractQuote.prgbrExport.StepIt;
  end;
end;

procedure TfrmwtRPContractQuote.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmwtRPContractQuote.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmwtRPContractQuote.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

end.
