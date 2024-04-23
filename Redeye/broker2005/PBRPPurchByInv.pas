unit PBRPPurchByInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPPurchByInvFrm = class(TForm)
    qckrpPurchByInv: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtGoodsValue: TQRDBText;
    qrdbtxtGoodsVAT: TQRDBText;
    qrdbtxtGoodsTotal: TQRDBText;
    qrdbtxtInvDate: TQRDBText;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    TotalSellLbl: TQRLabel;
    TotalVatlbl: TQRLabel;
    TotalGoodsLbl: TQRLabel;
    QRShape1: TQRShape;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotSellQRLbl: TQRLabel;
    RepTotVatQRLbl: TQRLabel;
    RepTotGoodsQRLbl: TQRLabel;
    GrpByQRDBText: TQRDBText;
    QRDBText2: TQRDBText;
    qryPurchbyInv: TFDQuery;
    qryPurchbyInvvat: TCurrencyField;
    qryPurchbyInvgoods: TCurrencyField;
    qryPurchbyInvTotal_Goods: TCurrencyField;
    qryPurchbyInvInvoice_Date: TDateTimeField;
    qryPurchbyInvSupplier_Invoice_no: TWideStringField;
    qryPurchbyInvInvoice_or_Credit: TWideStringField;
    qryPurchbyInvName: TWideStringField;
    qryPurchbyInvName_1: TWideStringField;
    qryPurchbyInvInvoiceRef: TWideStringField;
    qryPurchbyInvsupplierName: TWideStringField;
    QRDBText1: TQRDBText;
    qryPurchbyInvAccount_Code: TWideStringField;
    qryPurchbyInvSupp_Inv_Alt_Ref: TWideStringField;
    procedure qckrpPurchByInvBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qryPurchbyInvInvoiceRefGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbndPageHeaderAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qryPurchbyInvsupplierNameGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    FtotalBySupp: Boolean;
    exporting: boolean;
    exportFile: textFile;
    procedure SettotalBySupp(const Value: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property totalBySupp: Boolean read FtotalBySupp write SettotalBySupp;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPPurchByInvFrm: TPBRPPurchByInvFrm;

implementation

uses PBRSPurchByInv;

var
  iTotal_Sell, iTotal_vat, iTotal_Cost: real;
  RepTotal_Sell, RepTotal_vat, RepTotal_Cost: real;

{$R *.DFM}

procedure TPBRPPurchByInvFrm.qckrpPurchByInvBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  iTotal_Cost := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
  RepTotal_Cost := 0;
   with qckrpPurchByInv.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    Outputbin := PrinterSettings.OutputBin;
  end;
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qryPurchByInv.Open;
  if not totalBySupp then
  begin
    RepQRGroup.enabled := false;
    QRBand1.enabled := false;
    Grpbyqrdbtext.Enabled := false;
  end
  else
  begin
    RepQRGroup.enabled := true;
    QRBand1.enabled := true;
    Grpbyqrdbtext.Enabled := true;
   QRDBText1.enabled := false;
  end;
end;

procedure TPBRPPurchByInvFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  iTotal_Sell := iTotal_Sell + qryPurchByInvGoods.asfloat;
  iTotal_Vat := iTotal_Vat + qryPurchByInvVat.asfloat;
  RepTotal_Sell := RepTotal_Sell + qryPurchByInvGoods.asfloat;
  RepTotal_Vat := RepTotal_Vat + qryPurchByInvVat.asfloat;
end;

procedure TPBRPPurchByInvFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Sell);
  TotalVatLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Vat);
  TotalGoodsLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(iTotal_Sell+iTotal_VAT));
  end;

procedure TPBRPPurchByInvFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  iTotal_Vat := 0;
  RepTotal_Sell := 0;
  RepTotal_Vat := 0;
end;

procedure TPBRPPurchByInvFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Sell);
  RepTotVatQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Vat);
  RepTotGoodsQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',(RepTotal_Sell+RepTotal_VAT));
   end;

procedure TPBRPPurchByInvFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
iTotal_Vat := 0;
end;

procedure TPBRPPurchByInvFrm.SettotalBySupp(const Value: Boolean);
begin
 fTotalBySupp := Value;
end;

procedure TPBRPPurchByInvFrm.qryPurchbyInvInvoiceRefGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryPurchByinvInvoice_or_Credit.asstring = 'C' then
    text := 'CN/'+ qryPurchByinvSupplier_invoice_no.asstring
  else
    text := qryPurchByinvSupplier_invoice_no.asstring;

end;

procedure TPBRPPurchByInvFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Supplier"'
    + ',"Acc Code"'
    + ',"Inv. No."'
    + ',"Inv. Date"'
    + ',"Goods Value"'
    + ',"VAT"'
    + ',"Total"'
    + ',"PIN Ref"';

  writeLn(self.exportFile, tempStr);
  self.qckrpPurchByInv.Prepare;
  
  CloseFile(self.exportFile);
end;

procedure TPBRPPurchByInvFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting then
  begin
    //Supplier
    tempStr := '"'+ qryPurchbyInvname_1.Text + ' - '+qryPurchbyInvName.text + '"';
    //Acc Code
    tempstr := tempStr + ',"' + qryPurchbyInvAccount_Code.asString + '"';
    //Invoice Number
    if qryPurchByinvInvoice_or_Credit.asstring = 'C' then
      tempstr := tempstr + ',"' + 'CN/'+ qryPurchByinvSupplier_invoice_no.asstring + '"'
    else
      tempstr := tempstr+ ',"' +qryPurchByinvSupplier_invoice_no.asstring+ '"';
     //invoice date
    tempStr := tempStr + ',"' + qryPurchbyInvInvoice_Date.asString + '"';
    tempStr := tempStr + ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',qryPurchbyInvGoods.asFloat) + '"';
    //vat
    tempStr := tempStr + ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',qryPurchbyInvVat.asFloat) + '"';
    //total
    tempStr := tempStr + ',"' + formatfloat('£#,###,##0.00;(£#,###,##0.00)',qryPurchbyInvtotal_Goods.asFloat) + '"';
    //PIN Number
    tempstr := tempStr + ',"' + qryPurchbyInvSupp_Inv_Alt_Ref.asString + '"';
    writeln(self.exportFile, tempStr);
    PBRSPurchByInvFrm.prgbrExport.StepIt;
  end;
end;

procedure TPBRPPurchByInvFrm.qrbndPageHeaderAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if self.exporting then
  begin
    PBRSPurchByInvFrm.prgbrExport.Max :=
      qckrpPurchByInv.DataSet.RecordCount;
  end;
end;

procedure TPBRPPurchByInvFrm.qryPurchbyInvsupplierNameGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
text := qryPurchbyInvname_1.Text + ' - '+qryPurchbyInvName.text;
end;

end.
