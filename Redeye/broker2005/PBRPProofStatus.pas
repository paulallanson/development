unit PBRPProofStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Db, Qrctrls, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPProofStatusfrm = class(TForm)
    qryReport: TFDQuery;
    qrpProofStatus: TQuickRep;
    qrbndHeading: TQRBand;
    qrlblTitle: TQRLabel;
    qrbndDetail: TQRBand;
    qrdbtxtDesc: TQRDBText;
    qrdbtxtDate: TQRDBText;
    qrdbtxtCustsDesc: TQRDBText;
    qrdbtxtRequired: TQRDBText;
    qrdbtxtCustOrderNo: TQRDBText;
    qrlblPONum: TQRLabel;
    qrlblStatus: TQRLabel;
    qrlblDate: TQRLabel;
    qrlblDelBy: TQRLabel;
    qrlblCustOrderNo: TQRLabel;
    qrlblRunDate: TQRLabel;
    qrdbtxtName: TQRDBText;
    qrlblCustomerName: TQRLabel;
    qryReportPurchase_Order: TFloatField;
    qryReportLine: TIntegerField;
    qryReportProof_Date: TDateTimeField;
    qryReportProof_Status: TWideStringField;
    qryReportDescription: TWideStringField;
    qryReportCustomers_Desc: TWideStringField;
    qryReportCustomer: TIntegerField;
    qryReportBranch_no: TIntegerField;
    qryReportCustomer_Name: TWideStringField;
    qryReportGoods_Required: TDateTimeField;
    qryReportCust_Order_No: TWideStringField;
    qryReportPOLine: TWideStringField;
    qrdbtxtPOLine: TQRDBText;
    qrsysdtPageNumber: TQRSysData;
    qrlblPageNumber: TQRLabel;
    qryReportSupplier_Name: TWideStringField;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    qryReportSupplier_job_ref: TWideStringField;
    procedure qrpProofStatusBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qryReportPOLineGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    PrinterSettings : TPrinterSettings;
  end;

var
  PBRPProofStatusfrm: TPBRPProofStatusfrm;

implementation

{$R *.DFM}

procedure TPBRPProofStatusfrm.qrpProofStatusBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
 with qrpProofStatus.PrinterSettings do
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
  qryReport.Open;

end;

procedure TPBRPProofStatusfrm.qryReportPOLineGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if qryReportPurchase_Order.IsNull then
    text := ''
  else
    text := PBFormatPONum(qryReportPurchase_Order.AsFloat,qryReportLine.AsInteger);

end;

end.
