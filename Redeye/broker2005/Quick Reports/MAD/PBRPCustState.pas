unit PBRPCustState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, CCSPrint,
  PBPOObjects, CCSCommon, QrExport, qrprntr, printers, jpeg,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPCustStateFrm = class(TForm)
    InvoiceReport: TQuickRep;
    SalesInvDataSource: TDataSource;
    CompDataSource: TDataSource;
    GetCompSQL: TFDQuery;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    CustBranchQRGroup: TQRGroup;
    InvDetailBand: TQRSubDetail;
    CustRefQRDBText: TQRDBText;
    QRBand1: TQRBand;
    lblRundate: TQRLabel;
    SalesInvSQL: TFDQuery;
    QRDBText1: TQRDBText;
    GrpFootQRBand: TQRBand;
    lblInvoiceNo: TQRLabel;
    QRLabel2: TQRLabel;
    lblGoods: TQRLabel;
    lblPage: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    UpSalesInvSQL: TFDQuery;
    UpCustSQL: TFDQuery;
    QRLabel17: TQRLabel;
    LblTotal: TQRLabel;
    TotGoodsQRLbl: TQRLabel;
    TotVatQRLbl: TQRLabel;
    InvTotQrLbl: TQRLabel;
    QRMemoCmpnyNm: TQRMemo;
    QRLabel3: TQRLabel;
    CustomerAddMemo: TQRMemo;
    QRLabel18: TQRLabel;
    LblAccountCode: TQRDBText;
    QRLabel14: TQRLabel;
    lblVat: TQRLabel;
    memPayment: TQRMemo;
    QRShape1: TQRShape;
    lblCustomerRef: TQRLabel;
    qryGetPO: TFDQuery;
    qryGetSO: TFDQuery;
    qryGetJB: TFDQuery;
    QRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    memDefPayment: TQRMemo;
    GetNarrSQL: TFDQuery;
    imgReport: TQRImage;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    gtQRImage2: TQRImage;
    qrmRegNumber: TQRMemo;
    qrmRegOffice: TQRMemo;
    imgISO: TQRImage;
    procedure InvoiceReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvDetailBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CustBranchQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure InvDetailBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure InvoiceReportAfterPrint(Sender: TObject);
    procedure GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    FReprint: boolean;
    procedure SetReprint(const Value: boolean);
    function GetPOReference(sTemp: string): string;
    function GetJBReference(sTemp: string): string;
    function GetSOReference(sTemp: string): string;
    procedure BuildPaymentNotes(const iNarrative: integer);
  public
    CustomerNo, BranchNo, iIntSel: Integer;
    Preview: ByteBool;
    CustomerName: string;
    StatementNo: string;
    DateFrom, DateTo, InvDate: TDateTime;
    PrinterSettings : TPrinterSettings;
    rvat, rGoods: Real;
    property Reprint: boolean read FReprint write SetReprint;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPCustStateFrm: TPBRPCustStateFrm;

implementation

uses PBImages, pbDatabase, PBRSCustState;

var
  ipage: integer;

{$R *.DFM}

procedure TPBRPCustStateFrm.InvoiceReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
var                         
  TopMar, BottomMar, LeftMar, RightMar: Double;
  Copies: Integer;
  Bin: TQRBin;
  Size: TQRPaperSize;
  Duplex: Boolean;
  irow: integer;
begin
  {set the printer to what the user selected}
  InvoiceReport.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  InvoiceReport.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  InvoiceReport.PrinterSettings.copies := Copies;   {set the number of copies }
  InvoiceReport.PrinterSettings.PaperSize := Size;   {set the number of copies }

  imgReport.Picture := PBImagesFrm.ReportImage.Picture;
  imgReport.Enabled := true;

  {Activate the company query}
  with QRMemoCmpnyNm do
    begin
      GetCompSQL.close;
      GetCompSQL.open;
      Lines.Clear;
      for irow := 1 to 5 do
        begin
        if Trim(GetCompSQL.Fields[irow].AsString) <> '' then
        Lines.Append(Trim(GetCompSQL.Fields[irow].AsString)) ;
      end;
  {Finally, add the phone number} ;
    Lines.Append(' ');
    Lines.Append('Tel: ' + Trim(GetCompSQL.FieldByName('Phone').AsString));
    Lines.Append('Fax: ' + Trim(GetCompSQL.FieldByName('Fax_Number').AsString));
    Lines.Append('Email: ' + Trim(GetCompSQL.FieldByName('Email').AsString));
  end;
  BuildPaymentNotes(dmBroker.GetCompanyPaymentNotes);
end;

function TPBRPCustStateFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report query}
  with SalesInvSQL do
  begin
    Close;
    parambyname('Int_Sel').asinteger := iIntSel;
    Open;
    Result := RecordCount;
  end;
end;

procedure TPBRPCustStateFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount: integer;
begin
  CustomerAddMemo.Lines.Clear;

  {Create the Customer Address details memo}
  for icount := 8 to 13 do
  begin
    if SalesInvSQL.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(SalesInvSQL.Fields[icount].AsString);
  end;
  lblInvoiceNo.caption := StatementNo;
  lblRundate.caption := PBDatestr(InvDate);
  lblAccountCode.caption := SalesInvSQL.fieldbyname('Account_Code').asstring;
//  lblDateRange.caption := 'Period: '+PBdateStr(Datefrom)+' to '+PBDateStr(DateTo);

  inc(iPage);
  lblPage.caption := inttostr(iPage);

end;

procedure TPBRPCustStateFrm.InvDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with SalesInvSQL do
    begin
      if fieldbyname('Sales_invoice_type').asstring = '' then
        begin
          lblCustomerRef.caption := GetPOReference(fieldbyname('Reference').asstring)
        end
      else
      if fieldbyname('Sales_invoice_type').asstring = 'S' then
        begin
          lblCustomerRef.caption := GetSOReference(fieldbyname('Reference').asstring)
        end
      else
      if fieldbyname('Sales_invoice_type').asstring = 'J' then
        begin
          lblCustomerRef.caption := GetJBReference(fieldbyname('Reference').asstring)
        end
      else
        lblCustomerRef.caption := '';

      lblGoods.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat);
      lblVAT.caption := formatfloat('0.00',fieldbyname('vat_value').asfloat);
 //     lblUnitPrice.caption := formatfloat('0.00',fieldbyname('unit_price').asfloat);
      lblTotal.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat +
         fieldbyname('vat_value').asfloat);
      rGoods := rGoods + StrToFloatDef(LblGoods.Caption, 0, FormatSettings);
      rvat := rVat + fieldbyname('vat_value').asfloat;
    end;
end;

function TPBRPCustStateFrm.GetPOReference(sTemp: string): string;
begin
  with qryGetPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := StrToFloatDef(sTemp, 0, FormatSettings);
      parambyname('Line').asinteger := 1;
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

function TPBRPCustStateFrm.GetSOReference(sTemp: string): string;
begin
  with qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := strtoint(sTemp);
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

function TPBRPCustStateFrm.GetJBReference(sTemp: string): string;
begin
  with qryGetJB do
    begin
      close;
      parambyname('Job_Bag').asinteger := strtoint(sTemp);
      open;
      result := fieldbyname('Cust_Order_no').asstring;
    end;
end;

procedure TPBRPCustStateFrm.CustBranchQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iPage := 0;
end;

procedure TPBRPCustStateFrm.InvDetailBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  Tempstr: string;
begin
  if not Preview and
     not Reprint then
    begin
      with UpSalesInvSQL do
        begin
          close;
          parambyname('Sales_Invoice').asinteger := SalesInvSQl.fieldbyname('Sales_Invoice').asinteger;
          parambyname('Statement_reference').asstring := StatementNo;
          parambyname('Statement_Date').asdatetime := InvDate;
          parambyname('Statement_from').asdatetime := DateFrom;
          parambyname('Statement_to').asdatetime := DateTo;
          execsql;
        end;
    end;

  if exporting then
    begin
      tempStr := '"' + SalesInvSQL.fieldbyname('Name').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Account_Code').asstring + '"';
      tempStr := tempStr + ',"' + lblRunDate.caption + '"';
      tempStr := tempStr + ',"' + lblInvoiceNo.caption + '"';
      tempStr := tempStr + ',"' + lblCustomerRef.Caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Invoice_Description').asstring + '"';
      tempStr := tempStr + ',"' + lblGoods.caption + '"';
      tempStr := tempStr + ',"' + lblVat.caption + '"';
      tempStr := tempStr + ',"' + lblTotal.caption + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Sales_Invoice_no').asstring + '"';
      tempStr := tempStr + ',"' + SalesInvSQL.fieldbyname('Reference').asstring + '"';
      writeln(self.exportFile, tempStr);
      PBRSCustStateFrm.prgbrExport.StepIt;
    end;
end;

procedure TPBRPCustStateFrm.SetReprint(const Value: boolean);
begin
  FReprint := Value;
end;

procedure TPBRPCustStateFrm.InvoiceReportAfterPrint(
  Sender: TObject);
begin
  with UpCustSQL do
    begin
      close;
      parambyname('Customer').asinteger := CustomerNo;
      parambyname('Branch_no').asinteger := BranchNo;
      parambyname('Last_Statement_Ref').asstring := StatementNo;
      execsql;
    end;
end;

procedure TPBRPCustStateFrm.GrpFootQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal: real;
begin
  rTotal := rGoods + rVat;

  TotGoodsQRLbl.caption := FloatToStrF(rGoods, ffCurrency, 15, 2);
  TotVatQRLbl.caption := FloatToStrF(rVat, ffCurrency, 15, 2);
  InvTotQRLbl.Caption := FloatToStrF(rTotal, ffCurrency, 15, 2);
end;

procedure TPBRPCustStateFrm.GrpFootQRBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
rvat := 0.00;
rgoods := 0.00;
end;

procedure TPBRPCustStateFrm.BuildPaymentNotes(const iNarrative : integer);
var
  aStr : string;
begin
  if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
  memPayment.Lines.Clear;
  memPayment.Lines.Text := aStr;
end;

procedure TPBRPCustStateFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer"'
        + ',"Account Code"'
        + ',"Run Date"'
        + ',"Reference"'
        + ',"Your Reference"'
        + ',"Description"'
        + ',"Goods"'
        + ',"VAT"'
        + ',"Total"'
        + ',"Invoice No"'
        + ',"Job Number"';

  writeLn(self.exportFile, tempStr);

  InvoiceReport.Prepare;

  CloseFile(self.exportFile);
end;

end.
