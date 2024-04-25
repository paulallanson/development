unit PBRPOSSInvPayments;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint, Qrprntr, CCSCommon, PBPOObjects,
  Printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPOSSInvPaymentsFrm = class(TForm)
    qckrpSalesInvPay: TQuickRep;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    qrdbtxtGoodsValue: TQRDBText;
    qrdbtxtInvDate: TQRDBText;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    TotalSellLbl: TQRLabel;
    QRShape1: TQRShape;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    RepTotSellQRLbl: TQRLabel;
    QRDBText2: TQRDBText;
    qrySalesInvOutPay: TFDQuery;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    qrySalesInvOutPayCustomer: TIntegerField;
    qrySalesInvOutPayCustomer_Name: TWideStringField;
    qrySalesInvOutPaySales_invoice: TIntegerField;
    qrySalesInvOutPaySales_invoice_no: TWideStringField;
    qrySalesInvOutPayInvoice_Date: TDateTimeField;
    qrySalesInvOutPayGoods_Value: TCurrencyField;
    qrySalesInvOutPayVat_Value: TCurrencyField;
    qrySalesInvOutPayTotal_Value: TCurrencyField;
    qrySalesInvOutPayPaid_Status: TWideStringField;
    qrySalesInvOutPayPaid_Amount: TCurrencyField;
    qrySalesInvOutPayAccount_Number: TWideStringField;
    qrySalesInvOutPayContact_Name: TWideStringField;
    qrySalesInvOutPayReference: TWideStringField;
    qrySalesInvOutPayExpiry_date: TWideStringField;
    GrpByQRDBText: TQRDBText;
    QRDBTxtCstNm: TQRDBText;
    qrlblAccountNumber: TQRLabel;
    qrlblExpiryDate: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    qrySalesInvOutPayPayment_Method_Desc: TWideStringField;
    procedure qckrpSalesInvPayBeforePrint(Sender: TCustomQuickRep;
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
  private
    FtotalByInvDt: Boolean;
    fTotalByInvNo: Boolean;
    fTotalByCust: Boolean;
    fTotalBySalesOrdNo: Boolean;
    procedure setTotalByCust(const Value: Boolean);
    procedure SettotalByInvDt(const Value: Boolean);
    procedure setTotalByInvNo(const Value: Boolean);
    procedure setTotalBySalesOrdNo(const Value: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property totalByInvNo : Boolean read fTotalByInvNo write setTotalByInvNo;
    property totalBySalesOrdNo : Boolean read fTotalBySalesOrdNo write setTotalBySalesOrdNo;
    property totalByCust: Boolean read fTotalByCust write setTotalByCust;
    property totalByInvDt: Boolean read FtotalByInvDt write SettotalByInvDt;
  end;

var
  PBRPOSSInvPaymentsFrm: TPBRPOSSInvPaymentsFrm;

implementation

uses PBRSSalesByInv, PBRSSalesByProd;

var
  iTotal_Sell: real;
  RepTotal_Sell: real;

{$R *.DFM}

procedure TPBRPOSSInvPaymentsFrm.qckrpSalesInvPayBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  iTotal_Sell := 0;
  RepTotal_Sell := 0;

  {set the printer to what the user selected}
  QckRpSalesInvPay.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  QckRpSalesInvPay.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  QckRpSalesInvPay.PrinterSettings.Copies := Copies;   {set the output bin the }

(*  with QckRpSalesInvPay.PrinterSettings do
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
*)
  if TotalByCust then
    begin
      QRBand1.enabled := True;
      RepQRGroup.Expression := 'QRYSalesInvOutPay.Customer_Name';
      GrpByQRDBText.DataField := 'Customer_Name';
      QRDBTxtCstNm.Enabled := false;
      end
  else
      begin
      QRBand1.enabled := False;
      RepQRGroup.Expression := '';
      GrpByQRDBText.Datafield := '';
      QRDBTxtCstNm.Enabled := True;
      end;
  QrySalesInvOutPay.Open;
  end;

procedure TPBRPOSSInvPaymentsFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblAccountNumber.caption := qrySalesInvOutPay.fieldbyname('Account_Number').asstring;

  if qrySalesInvOutPay.fieldbyname('Expiry_Date').asstring <> '/' then
    qrlblExpiryDate.caption := qrySalesInvOutPay.fieldbyname('Expiry_Date').asstring
  else
    qrlblExpiryDate.caption := '';
    
  iTotal_Sell := iTotal_Sell + qrySalesInvOutPayTotal_Value.asfloat;
  RepTotal_Sell := RepTotal_Sell + qrySalesInvOutPayTotal_Value.asfloat;
end;

procedure TPBRPOSSInvPaymentsFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalSellLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',iTotal_Sell);
end;

procedure TPBRPOSSInvPaymentsFrm.FormCreate(Sender: TObject);
begin
  iTotal_Sell := 0;
  RepTotal_Sell := 0;
end;

procedure TPBRPOSSInvPaymentsFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  RepTotSellQRLbl.caption := formatfloat('£#,###,##0.00;(£#,###,##0.00)',RepTotal_Sell);
end;

procedure TPBRPOSSInvPaymentsFrm.QRBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
iTotal_Sell := 0;
end;

procedure TPBRPOSSInvPaymentsFrm.setTotalByCust(const Value: Boolean);
begin
  fTotalByCust := Value;
end;

procedure TPBRPOSSInvPaymentsFrm.SettotalByInvDt(const Value: Boolean);
begin
  FtotalByInvDt := Value;
end;

procedure TPBRPOSSInvPaymentsFrm.setTotalByInvNo(const Value: Boolean);
begin
  fTotalByInvNo := Value;
end;

procedure TPBRPOSSInvPaymentsFrm.setTotalBySalesOrdNo(
  const Value: Boolean);
begin
  fTotalBySalesOrdNo := Value;
end;

end.
