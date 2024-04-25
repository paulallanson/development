unit PBRPFSCClaim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, DB, QRCtrls, ExtCtrls, CCSCommon, printers, qrprntr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPFSCClaimFrm = class(TForm)
    qrpDetails: TQuickRep;
    qrpPageheader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLblSelection: TQRLabel;
    qrlblDateSelection: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    qrHeadFSC: TQRGroup;
    qryReport: TFDQuery;
    qrFootProductType: TQRBand;
    qrsubdetails: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel2: TQRLabel;
    GrpByQRDBText: TQRDBText;
    qrHeadProductType: TQRGroup;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    qrlblReceived: TQRLabel;
    qrlblInStock: TQRLabel;
    qrlblDespatched: TQRLabel;
    qrFootFSC: TQRBand;
    qrlblFSCReceived: TQRLabel;
    qrlblFSCInStock: TQRLabel;
    qrlblFSCDespatched: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlblPOInStock: TQRLabel;
    qrlblPODespatched: TQRLabel;
    qryGetStock: TFDQuery;
    qrbDetailHeader: TQRChildBand;
    qrbSummaryHeader: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrshpproductTypeLine: TQRShape;
    QRLabel4: TQRLabel;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportCustomer: TIntegerField;
    qryReportCustomers_Desc: TWideStringField;
    qryReportCustomer_Name: TWideStringField;
    qryReportFSC_Material_Claim: TIntegerField;
    qryReportClaim_Description: TWideStringField;
    qryReportClaim_Type: TWideStringField;
    qryReportProduct_Type: TIntegerField;
    qryReportProduct_Type_Description: TWideStringField;
    qryReportFSC_Product_Type_Code: TIntegerField;
    qryReportDate_Deliv_Actual: TDateTimeField;
    qryReportQty_To_Deliver: TFloatField;
    qryReportQty_Received: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure qrFootProductTypeBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFootProductTypeAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrFootFSCBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrFootFSCAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsubdetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsubdetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    sClaimType: string;
    bSummary: boolean;
    DateFrom, DateTo: TDateTime;
    iCode, iProductType: integer;
    function GetDetails: integer;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPFSCClaimFrm: TPBRPFSCClaimFrm;

implementation

uses PBRSFSCClaim;

var
  rReceived, rInStock, rDespatched: double;
  rFSCReceived, rFSCInStock, rFSCDespatched: double;

{$R *.dfm}

function TPBRPFSCClaimFrm.GetDetails: integer;
begin
  with qryReport do
    begin
      close;
      parambyname('FSC_Material_Claim').asinteger := iCode;
      parambyname('Product_type').asinteger := iproductType;
      parambyname('Date_From').asdatetime := DateFrom;
      parambyname('Date_To').asdatetime := DateTo;
      parambyname('Claim_Type').asstring := sClaimType;
      open;
      result := recordcount;
    end;
end;

procedure TPBRPFSCClaimFrm.FormCreate(Sender: TObject);
begin
  rReceived := 0;
  rInStock := 0;
  rDespatched := 0;

  rFSCReceived := 0;
  rFSCInStock := 0;
  rFSCDespatched := 0;
end;

procedure TPBRPFSCClaimFrm.qrFootProductTypeBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblReceived.caption := formatfloat('###,##0',rReceived);
  qrlblInStock.caption := formatfloat('###,##0',rInStock);
  qrlblDespatched.caption := formatfloat('###,##0',rDespatched);

  rFSCReceived := rFSCReceived + rReceived;
  rFSCInStock := rFSCInStock + rInStock;
  rFSCDespatched := rFSCDespatched + rDespatched;
end;

procedure TPBRPFSCClaimFrm.qrFootProductTypeAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and self.bSummary then
  begin
    //FSC
    tempStr := '"' + qryReport.fieldbyname('Claim_Description').asstring + '"';

    //Product Type
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Product_Type_Description').asstring + '"';

    //FSC Product Code
    tempStr := tempStr + ',"' + qryReport.fieldbyname('FSC_Product_Type_Code').asstring + '"';

    //Volume Received
    tempStr := tempStr + ',"' + qrlblReceived.caption + '"';

    //Volume In Stock
    tempStr := tempStr + ',"' + qrlblInStock.caption + '"';

    //Volume Despatched
    tempStr := tempStr + ',"' + qrlblDespatched.caption + '"';

    writeln(self.exportFile, tempStr);
    PBRSFSCClaimfrm.prgbrExport.StepIt;
  end;
  rReceived := 0;
  rInStock := 0;
  rDespatched := 0;
end;

procedure TPBRPFSCClaimFrm.qrFootFSCBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblFSCReceived.caption := formatfloat('###,##0',rFSCReceived);
  qrlblFSCInStock.caption := formatfloat('###,##0',rFSCInStock);
  qrlblFSCDespatched.caption := formatfloat('###,##0',rFSCDespatched);

end;

procedure TPBRPFSCClaimFrm.qrFootFSCAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  rFSCReceived := 0;
  rFSCInStock := 0;
  rFSCDespatched := 0;

end;

procedure TPBRPFSCClaimFrm.qrsubdetailsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rTotalStock, rTotalReceived, rTotalDespatched: real;
begin
  rTotalStock := 0;
  rTotalReceived := qryReport.fieldbyname('Qty_Received').asfloat;
  with qryGetStock do
    begin
      close;
      parambyname('Purchase_Order').asfloat := qryReport.fieldbyname('Purchase_Order').asfloat;
      parambyname('Date_Received').asdatetime := qryreport.fieldbyname('Date_Deliv_Actual').asdatetime;
      open;
      first;

      rTotalStock := fieldbyname('Total_Stock').AsFloat;
      qrlblPOInStock.caption := formatfloat('###,##0',rTotalStock);
    end;
  rTotalDespatched := rTotalReceived - rTotalStock;
  qrlblPODespatched.caption := formatfloat('###,##0',rTotalDespatched);

  rReceived := rReceived + qryReport.fieldbyname('Qty_Received').asfloat;
  rInStock := rInStock + rTotalStock;
  rDespatched := rDespatched + rTotalDespatched;
  PrintBand := not bSummary;
end;

procedure TPBRPFSCClaimFrm.qrpDetailsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }

  if bSummary then
    begin
      qrbSummaryHeader.ParentBand := qrpPageHeader;
      qrbDetailHeader.ParentBand := nil;
      qrHeadProductType.enabled := false;
      qrshpProductTypeLine.Enabled := false;
    end
  else
    begin
      qrbDetailHeader.ParentBand := qrpPageHeader;
      qrbSummaryHeader.ParentBand := nil;
      qrHeadProductType.enabled := true;
      qrshpProductTypeLine.Enabled := true;
    end;
end;

procedure TPBRPFSCClaimFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if self.bSummary then
    begin
      tempstr := '"FSC/PEFC Claim"'
              + ',"Product Type"'
              + ',"FSC/PEFC Product Code"'
              + ',"Received"'
              + ',"In Stock"'
              + ',"Despatched"';
    end
  else
    begin
      tempstr := '"FSC/PEFC Claim"'
              + ',"Product Type"'
              + ',"FSC/PEFC Product Code"'
              + ',"Order No"'
              + ',"Description"'
              + ',"Date Received"'
              + ',"Received"'
              + ',"In Stock"'
              + ',"Despatched"';
    end;

  writeLn(self.exportFile, tempStr);
  self.qrpDetails.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPFSCClaimFrm.qrsubdetailsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting and not self.bSummary then
  begin
    //FSC
    tempStr := '"' + qryReport.fieldbyname('Claim_Description').asstring + '"';

    //Product Type
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Product_Type_Description').asstring + '"';

    //FSC Product Code
    tempStr := tempStr + ',"' + qryReport.fieldbyname('FSC_Product_Type_Code').asstring + '"';

    //Order Number
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Purchase_Order').asstring + '"';

    //Description
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Customers_Desc').asstring + '"';

    //Date Received
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Date_Deliv_Actual').asstring + '"';

    //Volume Received
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Qty_Received').asstring + '"';


    //Volume In Stock
    tempStr := tempStr + ',"' + qrlblPOInStock.Caption + '"';


    //Volume Despatched
    tempStr := tempStr + ',"' + qrlblPODespatched.caption + '"';


    writeln(self.exportFile, tempStr);
    PBRSFSCClaimfrm.prgbrExport.StepIt;
  end;
end;

end.
