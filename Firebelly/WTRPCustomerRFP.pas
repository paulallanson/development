unit WTRPCustomerRFP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, allCommon, QrExport, qrprntr, printers, jpeg,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPCustomerRFP = class(TForm)
    InvoiceReport: TQuickRep;
    dtsSalesInv: TDataSource;
    dtsGetCompany: TDataSource;
    qryGetCompany: TFDQuery;
    QRLabel6: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    CustBranchQRGroup: TQRGroup;
    InvDetailBand: TQRSubDetail;
    QRBand1: TQRBand;
    lblRundate: TQRLabel;
    qrySalesInv: TFDQuery;
    GrpFootQRBand: TQRBand;
    lblInvoiceNo: TQRLabel;
    QRLabel2: TQRLabel;
    lblUnit: TQRLabel;
    lblPage: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    qryUpSalesInv: TFDQuery;
    qryUpCustomerBranch: TFDQuery;
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
    lblCustomerRef: TQRLabel;
    qryGetSO: TFDQuery;
    QRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    QRLabel15: TQRLabel;
    GetNarrSQL: TFDQuery;
    qriHeadLogo: TQRImage;
    QRLabel9: TQRLabel;
    QRLabel16: TQRLabel;
    lblGoods: TQRLabel;
    qrlblPaymentTerms: TQRLabel;
    qrshpPayment: TQRShape;
    memPayment: TQRMemo;
    QRLabel11: TQRLabel;
    qrlblSiteName: TQRLabel;
    qrsdQLabour: TQRBand;
    qrlblLabourUTR: TQRLabel;
    qrlblLabourValue: TQRLabel;
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
    procedure qrsdQLabourBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    FReprint: boolean;
    procedure SetReprint(const Value: boolean);
    function GetSOReference(sTemp: string): string;
    procedure BuildPaymentNotes(const iNarrative: integer);
  public
    bShowLabour: boolean;
    CustomerNo, BranchNo, iIntSel: Integer;
    Preview: ByteBool;
    CustomerName: string;
    ApplicationNo: string;
    SiteName: string;
    LabourValue: real;
    DateFrom, DateTo, InvDate: TDateTime;
    PrinterSettings : TPrinterSettings;
    rvat, rGoods: Real;
    property Reprint: boolean read FReprint write SetReprint;
    procedure ExportToFile(fileName: string);
  end;

var
  frmWTRPCustomerRFP: TfrmWTRPCustomerRFP;

implementation

uses WTRSCustomerRFP, wtDataModule;

var
  ipage: integer;

{$R *.DFM}

procedure TfrmWTRPCustomerRFP.InvoiceReportBeforePrint(Sender:
  TCustomQuickRep;
  var PrintReport: Boolean);
var
  LocalDir: string;
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

  try
    LocalDir := extractfilepath(application.exename);
    qriHeadlogo.picture.loadfromfile(LocalDir+'wtHeadLogo.bmp');
    qriHeadlogo.Enabled := true;
  except
  end;

  {Activate the company query}
  with QRMemoCmpnyNm do
    begin
      qryGetCompany.close;
      qryGetCompany.open;
      Lines.Clear;
      for irow := 1 to 5 do
        begin
        if Trim(qryGetCompany.Fields[irow].AsString) <> '' then
        Lines.Append(Trim(qryGetCompany.Fields[irow].AsString)) ;
      end;
  {Finally, add the phone number} ;
    Lines.Append(' ');
    Lines.Append('Tel: ' + Trim(qryGetCompany.FieldByName('TelePhone_Number').AsString));
    Lines.Append('Fax: ' + Trim(qryGetCompany.FieldByName('Fax_Number').AsString));
    Lines.Append('Email: ' + Trim(qryGetCompany.FieldByName('Email_Address').AsString));
  end;
  BuildPaymentNotes(dtmdlWorktops.GetCompanyPaymentNotes);
end;

function TfrmWTRPCustomerRFP.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report query}
  with qrySalesInv do
  begin
    Close;
    parambyname('Int_Sel').asinteger := iIntSel;
    Open;
    Result := RecordCount;
  end;
end;

procedure TfrmWTRPCustomerRFP.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  icount: integer;
begin
  TotGoodsqrLbl.Caption := '';
  TotVatqrLbl.Caption := '';
  InvTotqrLbl.Caption := 'Page to Follow';

  CustomerAddMemo.Lines.Clear;

  {Create the Customer Address details memo}
  for icount := 7 to 12 do
  begin
    if qrySalesInv.Fields[icount].AsString = '' then Continue;
    CustomerAddMemo.Lines.Add(qrySalesInv.Fields[icount].AsString);
  end;
  qrlblSiteName.caption := SiteName;
  lblInvoiceNo.caption := ApplicationNo;
  lblRundate.caption := paDateStr(InvDate);
  lblAccountCode.caption := qrySalesInv.fieldbyname('Account_Code').asstring;

  inc(iPage);
  lblPage.caption := inttostr(iPage);

end;

procedure TfrmWTRPCustomerRFP.InvDetailBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with qrySalesInv do
    begin
      lblCustomerRef.caption := GetSOReference(fieldbyname('Reference').asstring) + ' - ' + fieldbyname('Invoice_No').asstring;

      lblUnit.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat);
      lblGoods.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat);
      lblVAT.caption := formatfloat('0.00',fieldbyname('vat_value').asfloat);
 //     lblUnitPrice.caption := formatfloat('0.00',fieldbyname('unit_price').asfloat);
      lblTotal.caption := formatfloat('0.00',fieldbyname('Goods_value').asfloat +
         fieldbyname('vat_value').asfloat);
      rGoods := rGoods + StrToFloat(LblGoods.Caption);
      rvat := rVat + fieldbyname('vat_value').asfloat;
    end;
end;

function TfrmWTRPCustomerRFP.GetSOReference(sTemp: string): string;
begin
  with qryGetSO do
    begin
      close;
      parambyname('Sales_Order').asinteger := strtoint(sTemp);
      open;
      result := fieldbyname('Reference').asstring;
    end;
end;

procedure TfrmWTRPCustomerRFP.CustBranchQRGroupBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  iPage := 0;

  rvat := 0.00;
  rgoods := 0.00;
  
  bShowLabour := (qrySalesInv.fieldbyname('Separate_Labour_Invoice_Value').asstring = 'Y');
//  qrsdQLabour.Enabled := bShowLabour;

  if bShowLabour then
    qrlblLabourUTR.caption := 'UTR No: ' + qryGetCompany.fieldbyname('Unique_Tax_Reference').asstring
  else
    qrlblLabourUTR.caption := '';
  if LabourValue > 0 then
    qrlblLabourValue.caption := 'Labour Value: ' + formatfloat('£#,##0.00',LabourValue)
  else
    qrlblLabourValue.caption := '';
end;

procedure TfrmWTRPCustomerRFP.InvDetailBandAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  Tempstr: string;
begin
//  if not Preview and
//     not Reprint then
  if not Preview then
    begin
      with qryUpSalesInv do
        begin
          close;
          parambyname('Sales_Invoice').asinteger := qrySalesInv.fieldbyname('Sales_Invoice').asinteger;
          parambyname('Application_reference').asstring := ApplicationNo;
          parambyname('Application_Date').asdatetime := InvDate;
          parambyname('Application_Date_from').asdatetime := DateFrom;
          parambyname('Application_Date_to').asdatetime := DateTo;
          parambyname('Application_Labour_Value').asfloat := LabourValue;
          execsql;
        end;
    end;

  if exporting then
    begin
      tempStr := '"' + qryUpSalesInv.fieldbyname('Name').asstring + '"';
      tempStr := tempStr + ',"' + qrySalesInv.fieldbyname('Account_Code').asstring + '"';
      tempStr := tempStr + ',"' + lblRunDate.caption + '"';
      tempStr := tempStr + ',"' + lblInvoiceNo.caption + '"';
      tempStr := tempStr + ',"' + lblCustomerRef.Caption + '"';
      tempStr := tempStr + ',"' + qryUpSalesInv.fieldbyname('Invoice_Description').asstring + '"';
      tempStr := tempStr + ',"' + lblGoods.caption + '"';
      tempStr := tempStr + ',"' + lblVat.caption + '"';
      tempStr := tempStr + ',"' + lblTotal.caption + '"';
      tempStr := tempStr + ',"' + qrySalesInv.fieldbyname('Sales_Invoice_no').asstring + '"';
      tempStr := tempStr + ',"' + qrySalesInv.fieldbyname('Reference').asstring + '"';
      writeln(self.exportFile, tempStr);
      frmWTRSCustomerRFP.prgbrExport.StepIt;
    end;
end;

procedure TfrmWTRPCustomerRFP.SetReprint(const Value: boolean);
begin
  FReprint := Value;
end;

procedure TfrmWTRPCustomerRFP.InvoiceReportAfterPrint(
  Sender: TObject);
begin
  with qryUpCustomerBranch do
    begin
      close;
      parambyname('Customer').asinteger := CustomerNo;
      parambyname('Last_Application_Ref').asstring := ApplicationNo;
      execsql;
    end;
end;

procedure TfrmWTRPCustomerRFP.BuildPaymentNotes(const iNarrative : integer);
var
  aStr : string;
begin
  if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Notes_Code').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Notes_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Notes_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
  memPayment.Lines.Clear;
  memPayment.Lines.Text := aStr;
end;

procedure TfrmWTRPCustomerRFP.ExportToFile(fileName: string);
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

procedure TfrmWTRPCustomerRFP.qrsdQLabourBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotal: real;
begin
  rTotal := rGoods + rVat;

  TotGoodsQRLbl.caption := FloatToStrF(rGoods, ffCurrency, 15, 2);
  TotVatQRLbl.caption := FloatToStrF(rVat, ffCurrency, 15, 2);
  InvTotQRLbl.Caption := FloatToStrF(rTotal, ffCurrency, 15, 2);
end;

end.
