unit PBRP4CastSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint, CCSCommon, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRP4CastSummFrm = class(TForm)
    qckrp4CastSumm: TQuickRep;
    qrySalesComm: TFDQuery;
    qrbndPageHeader: TQRBand;
    qrlblTitle: TQRLabel;
    QRLabel5: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    RepQRGroup: TQRGroup;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    RepTotQRLabel: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLblM1Cst: TQRLabel;
    QRLblM2Cst: TQRLabel;
    QRLblM3Cst: TQRLabel;
    QRLblM4Cst: TQRLabel;
    QRLblM5Cst: TQRLabel;
    QRLblM6Cst: TQRLabel;
    QRLblM7Cst: TQRLabel;
    QrLblRep: TQRLabel;
    QRLbl1TotCst: TQRLabel;
    QRLbl2TotCst: TQRLabel;
    QRLbl3TotCst: TQRLabel;
    QRLbl4TotCst: TQRLabel;
    QRlbl5TotCst: TQRLabel;
    QRLbl6TotCst: TQRLabel;
    QRLbl7TotCst: TQRLabel;
    qrySalesCommQty_to_Deliver: TFloatField;
    qrySalesCommDate_Point: TDateTimeField;
    qrySalesCommOrder_Price: TCurrencyField;
    qrySalesCommSelling_Price: TCurrencyField;
    qrySalesCommPrice_Unit_Factor: TFloatField;
    qrySalesCommPrice_Unit_Factor_1: TFloatField;
    qrySalesCommRep: TIntegerField;
    qrySalesCommName: TStringField;
    qrySalesCommInactive: TStringField;
    qrySalesCommPurchase_Order: TFloatField;
    QRLblM14Cst: TQRLabel;
    QRLblM13Cst: TQRLabel;
    QRLblM12Cst: TQRLabel;
    QRLblM11Cst: TQRLabel;
    QRLblM10Cst: TQRLabel;
    QRLblM9Cst: TQRLabel;
    QRLblM8Cst: TQRLabel;
    QRLbl8TotCst: TQRLabel;
    QRLbl9TotCst: TQRLabel;
    QRLbl10TotCst: TQRLabel;
    QRLbl11TotCst: TQRLabel;
    QRLbl12TotCst: TQRLabel;
    QRLbl13TotCst: TQRLabel;
    QRLbl14TotCst: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    procedure qckrp4CastSummBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure RepQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    fTotalByRep: Boolean;
    ffcstDate: TDateTime;
    fbyMonth: Boolean;
    procedure setTotalByRep(const Value: Boolean);
    procedure setfcstDate(const Value: TDateTime);
    procedure setByMonth(const Value: Boolean);
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
    property totalByRep : Boolean read fTotalByRep write setTotalByRep;
    property fcstDate: TDateTime read ffcstDate write setfcstDate;
    property bymonth: Boolean read fbyMonth write setByMonth;
  end;

var
  PBRP4CastSummFrm: TPBRP4CastSummFrm;
  PerStartDates : array[0..14] of tDateTime;
  PerCost: array[0..14] of real;
  RepCost: array[0..14] of real;

implementation

var
  rsell: real;

{$R *.DFM}

procedure TPBRP4CastSummFrm.qckrp4CastSummBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  tempLoop : Byte;
  startdate : tDateTime;
begin
  startDate := FcstDate;
  //startdate := StrToDate('01'+copy(DateToStr(FcstDate),3,length(DateToStr(FcstDate))));
   with qckrp4CastSumm.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qrySalesComm.Open;
  if TotalByRep then
    begin
      QRBand1.enabled := True;
//      RepQRGroup.Expression := 'QRYSalesComm.Rep.Name';
      end;
  for TempLoop := 0 to 12 do
  begin
    if Bymonth then
      PerStartDates[temploop] :=  incMonth(startdate ,temploop)
    else
      PerStartDates[temploop] :=  startDate+(TempLoop*7)
  end;
  QRLabel1.caption := 'Prior to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[0]);
  QRLabel2.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[1]);
  QRLabel3.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[2]);
  QRLabel4.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[3]);
  QRLabel6.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[4]);
  QRLabel7.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[5]);
  QRLabel8.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[6]);
  QRLabel9.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[7]);
  QRLabel10.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[8]);
  QRLabel11.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[9]);
  QRLabel12.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[10]);
  QRLabel14.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[11]);
  QRLabel15.caption := 'to '+formatdatetime('dd"/"mm"/"yy',PerStartDates[12]);
  for temploop := 0 to 13 do
  percost[temploop] := 0;
  for temploop := 0 to 13 do
  repcost[temploop] := 0;
  end;

procedure TPBRP4CastSummFrm.setTotalByRep(const Value: Boolean);
begin
  fTotalByRep := Value;
end;

procedure TPBRP4CastSummFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
loop : integer;
begin
with qrySalesComm do
begin
  if FieldByName('Price_Unit_Factor').asfloat <> 0 then
    rSell := (FieldByName('Qty_to_Deliver').asfloat / FieldByName('Price_Unit_Factor').asfloat)
      * FieldByName('Selling_Price').asfloat
  else
    if fieldByName('Qty_to_Deliver').Asfloat <> 0 then
      rsell := FieldByName('Order_Price').asfloat
    else
      rsell := 0.00;
  for loop := 0 to 12 do
  begin
    if loop = 0 then
    begin
      if qrysalescomm.fieldByName('Date_Point').asDateTime < PerStartDates[loop] then
      begin
        percost[loop] := percost[loop]+rsell;
        break;
      end ;
    end
    else
    begin
      if (qrysalesComm.fieldByName('Date_Point').asDateTime >= PerStartDates[loop-1]) and
      (qrysalesComm.fieldByName('Date_Point').asDateTime < PerStartDates[loop]) then
      begin
        percost[loop] := percost[loop]+rsell;
        break;
      end;
    end;
  end;
  end;
end;

procedure TPBRP4CastSummFrm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
loop : integer;
totcst: real;
begin
QRLblm1cst.caption := formatfloat('0.00',percost[0]);
QRLblm2cst.caption := formatfloat('0.00',percost[1]);
QRLblm3cst.caption := formatfloat('0.00',percost[2]);
QRLblm4cst.caption := formatfloat('0.00',percost[3]);
QRLblm5cst.caption := formatfloat('0.00',percost[4]);
QRLblm6cst.caption := formatfloat('0.00',percost[5]);
QRLblm7cst.caption := formatfloat('0.00',percost[6]);
QRLblm8cst.caption := formatfloat('0.00',percost[7]);
QRLblm9cst.caption := formatfloat('0.00',percost[8]);
QRLblm10cst.caption := formatfloat('0.00',percost[9]);
QRLblm11cst.caption := formatfloat('0.00',percost[10]);
QRLblm12cst.caption := formatfloat('0.00',percost[11]);
QRLblm13cst.caption := formatfloat('0.00',percost[12]);
totcst := 0.;
for loop := 0 to 12 do
begin
  totcst := totcst+percost[loop]
end;
QRLblm14cst.caption := formatfloat('0.00',totcst);
repcost[0] := repcost[0]+StrToFloatDef(QRLblm1cst.caption, 0, FormatSettings);
repcost[1] := repcost[1]+StrToFloatDef(QRLblm2cst.caption, 0, FormatSettings);
repcost[2] := repcost[2]+StrToFloatDef(QRLblm3cst.caption, 0, FormatSettings);
repcost[3] := repcost[3]+StrToFloatDef(QRLblm4cst.caption, 0, FormatSettings);
repcost[4] := repcost[4]+StrToFloatDef(QRLblm5cst.caption, 0, FormatSettings);
repcost[5] := repcost[5]+StrToFloatDef(QRLblm6cst.caption, 0, FormatSettings);
repcost[6] := repcost[6]+StrToFloatDef(QRLblm7cst.caption, 0, FormatSettings);
repcost[7] := repcost[7]+StrToFloatDef(QRLblm8cst.caption, 0, FormatSettings);
repcost[8] := repcost[8]+StrToFloatDef(QRLblm9cst.caption, 0, FormatSettings);
repcost[9] := repcost[9]+StrToFloatDef(QRLblm10cst.caption, 0, FormatSettings);
repcost[10] := repcost[10]+StrToFloatDef(QRLblm11cst.caption, 0, FormatSettings);
repcost[11] := repcost[11]+StrToFloatDef(QRLblm12cst.caption, 0, FormatSettings);
repcost[12] := repcost[12]+StrToFloatDef(QRLblm13cst.caption, 0, FormatSettings);
repcost[13] := repcost[13]+StrToFloatDef(QRLblm14cst.caption, 0, FormatSettings);
for loop := 0 to 14 do
  percost[loop] := 0;

end;

procedure TPBRP4CastSummFrm.RepQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLblRep.caption := qrySalesComm.fieldByname('Name').AsString;
end;

procedure TPBRP4CastSummFrm.setfcstDate(const Value: TDateTime);
begin
  ffcstDate := Value;
end;

procedure TPBRP4CastSummFrm.setByMonth(const Value: Boolean);
begin
  fbyMonth := Value;
end;

procedure TPBRP4CastSummFrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
loop: integer;
begin
for loop := 0 to 6 do
  repcost[loop] := 0;
end;

procedure TPBRP4CastSummFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
QRLbl1totCst.caption := formatfloat('0.00',repcost[0]);
QRLbl2totCst.caption := formatfloat('0.00',repcost[1]);
QRLbl3totCst.caption := formatfloat('0.00',repcost[2]);
QRLbl4totCst.caption := formatfloat('0.00',repcost[3]);
QRLbl5totCst.caption := formatfloat('0.00',repcost[4]);
QRLbl6totCst.caption := formatfloat('0.00',repcost[5]);
QRLbl7totCst.caption := formatfloat('0.00',repcost[6]);
QRLbl8totCst.caption := formatfloat('0.00',repcost[7]);
QRLbl9totCst.caption := formatfloat('0.00',repcost[8]);
QRLbl10totCst.caption := formatfloat('0.00',repcost[9]);
QRLbl11totCst.caption := formatfloat('0.00',repcost[10]);
QRLbl12totCst.caption := formatfloat('0.00',repcost[11]);
QRLbl13totCst.caption := formatfloat('0.00',repcost[12]);
QRLbl14totCst.caption := formatfloat('0.00',repcost[13]);
end;

end.
