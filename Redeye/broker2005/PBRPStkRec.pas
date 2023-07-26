unit PBRPStkRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, CCSPrint, CCSCommon, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPStkRecfrm = class(TForm)
    QuickReport: TQuickRep;
    PageTitle: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel13: TQRLabel;
    qrlblTitle: TQRLabel;
    DescQRLabel: TQRLabel;
    StkQRLabel: TQRLabel;
    OrderDetail: TQRSubDetail;
    qryReport: TFDQuery;
    QRShape1: TQRShape;
    FormTotQRBand: TQRBand;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    RepTotsQRGroup: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qryReport1: TFDQuery;
    qryReport2: TFDQuery;
    qryReport3: TFDQuery;
    qryReport0: TFDQuery;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportDelivery_no: TIntegerField;
    qryReportDate_Point: TDateTimeField;
    qryReportStock_Location_Desc: TStringField;
    qryReportForm_Reference: TIntegerField;
    qryReportForm_Reference_ID: TStringField;
    qryReportForm_Reference_Descr: TStringField;
    qryReportDelivery_to_Stock: TStringField;
    qryReportDate_Deliv_Actual: TDateTimeField;
    qryReportQty_Delivered: TFloatField;
    qryReportBin_Count: TIntegerField;
    QRLabel1: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText6: TQRDBText;
    qryReportStock_Reference: TStringField;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
  end;

var
  PBRPStkRecfrm: TPBRPStkRecfrm;

implementation

{$R *.DFM}

procedure TPBRPStkRecfrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   with quickreport.PrinterSettings do
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
  qryReport.Open;
end;

procedure TPBRPStkRecfrm.FooterQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PageNoQRLabel.Caption := 'Page: ' + IntToStr(QuickReport.PageNumber);
end;

end.
