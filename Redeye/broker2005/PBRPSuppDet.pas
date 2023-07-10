unit PBRPSuppDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, DBTables, ExtCtrls, CCSPrint, CCSCommon;

type
  TPBRPSuppDetFrm = class(TForm)
    QRPSuppStat: TQuickRep;
    GetDetsQry: TQuery;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblRunDate: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    procedure QRPSuppStatBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }

  public
    { Public declarations }
    PrinterSettings : TPrinterSettings;
    bIsSummary : bytebool;
    bShowInactive: bytebool;
  end;

var
  PBRPSuppFrm: TPBRPSuppDetFrm;

implementation

{$R *.DFM}

procedure TPBRPSuppDetFrm.QRPSuppStatBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 with qrpSuppStat.PrinterSettings do
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
  qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now);
  if bIsSummary then
    qrlblTitle.Caption := 'Supplier Summary Report'
  else
    qrlblTitle.Caption := 'Supplier Detail Report';
  GetDetsQry.Close;
  if bShowinactive then
    GetDetsQry.parambyname('Acc_Active').AsString := 'N'
  else
    GetDetsQry.parambyname('Acc_Active').AsString := 'Y';
  GetDetsQry.Open;
  QRDBText4.enabled := not bIsSummary;
  QRDBText8.enabled := not bIsSummary;
  if bIsSummary then
    QRBand2.Height := 35
  else
    QRBand2.Height := 70;
end;

end.
