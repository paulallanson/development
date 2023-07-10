unit PBRPPOnotonJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, CCSPrint;

type
  TPBRPPOnotonJBfrm = class(TForm)
    qckrptPOnotonJB: TQuickRep;
    QRBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    qrlblTitle: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    qryReport: TQuery;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportCustomer: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportBranch_Name: TStringField;
    qryReportCustomer_Name: TStringField;
    qryReportCust_Order_No: TStringField;
    qryReportCustomers_Desc: TStringField;
    qryReportQuantity: TFloatField;
    qryReportOrder_Price: TCurrencyField;
    qryReportSelling_Price: TCurrencyField;
    qryReportSell_Unit: TIntegerField;
    qryReportOrder_Unit: TIntegerField;
    qryReportRep_Name: TStringField;
    qryReportCost_Unit_Description: TStringField;
    qryReportCost_Factor: TFloatField;
    qryReportSell_Unit_Description: TStringField;
    qryReportSell_Factor: TFloatField;
    qryReportDate_Point: TDateTimeField;
    qryReportSupplier_branch_Name: TStringField;
    qryReportSupplier_name: TStringField;
    qryReportJob_Bag: TIntegerField;
    qryReportTotal_Cost: TCurrencyField;
    qryReportTotal_Sell: TCurrencyField;
    QRShape1: TQRShape;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    qrlblIncCallOffs: TQRLabel;
    procedure qryReportTotal_CostGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qckrptPOnotonJBBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qryReportTotal_SellGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    Fprintersettings: TPrintersettings;
    procedure Setprintersettings(const Value: TPrintersettings);
    { Private declarations }
  public
    property printersettings: TPrintersettings read Fprintersettings write Setprintersettings;
  end;

var
  PBRPPOnotonJBfrm: TPBRPPOnotonJBfrm;

implementation

{$R *.DFM}

procedure TPBRPPOnotonJBfrm.qryReportTotal_CostGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rValue: real;
begin
  if qryReportCost_Factor.asinteger = 0 then
    text := formatfloat('#,###,##0.00',qryReportOrder_price.asfloat)
  else
    begin
      rValue := ((qryReportQuantity.asinteger / qryReportCost_Factor.asinteger)
                * qryReportOrder_price.asfloat);
      text := formatfloat('#,###,##0.00',rValue);
    end;
end;

procedure TPBRPPOnotonJBfrm.Setprintersettings(
  const Value: TPrintersettings);
begin
  Fprintersettings := Value;
end;

procedure TPBRPPOnotonJBfrm.qckrptPOnotonJBBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qckrptPOnotonJB.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;

  qryReport.Open;

end;

procedure TPBRPPOnotonJBfrm.qryReportTotal_SellGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var
  rValue: real;
begin
  if qryReportSell_Factor.asinteger = 0 then
    text := formatfloat('#,###,##0.00',qryReportSelling_price.asfloat)
  else
    begin
      rValue := ((qryReportQuantity.asinteger / qryReportSell_Factor.asinteger)
                * qryReportSelling_price.asfloat);
      text := formatfloat('#,###,##0.00',rValue);
    end;
end;

end.
