unit PBRPStkHold;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, CCSPrint, CCSCommon, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPStkHoldfrm = class(TForm)
    QuickReport: TQuickRep;
    PageTitle: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel13: TQRLabel;
    qrlblTitle: TQRLabel;
    FormRefQRLabel: TQRLabel;
    DescQRLabel: TQRLabel;
    StkQRLabel: TQRLabel;
    OrderDetail: TQRSubDetail;
    CustQRDBText: TQRDBText;
    qryReport: TFDQuery;
    QRShape1: TQRShape;
    FormTotQRBand: TQRBand;
    RepTypeQRLabel: TQRLabel;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    RepTotsQRGroup: TQRGroup;
    CustnamQRLabel: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    lblBoxCount: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    lblFormsPerBox: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    qryReportDescription: TWideStringField;
    qryReportquantity: TIntegerField;
    qryReportquantity_allocated: TIntegerField;
    qryReportdelivery_to_Stock: TStringField;
    qryReportForm_reference: TIntegerField;
    qryReportform_reference_id: TStringField;
    qryReportform_reference_descr: TStringField;
    qryReportPurchase_order: TFloatField;
    qryReportstock_location_desc: TStringField;
    qryReportForms_per_box: TStringField;
    qryReportCust_Order_no: TStringField;
    qryReportcustomer: TIntegerField;
    qryReportbranch_no: TIntegerField;
    qryReportQty_in_stock: TIntegerField;
    qryReportStock_Reference: TStringField;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure OrderDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
  end;

var
  PBRPStkHoldfrm: TPBRPStkHoldfrm;

implementation

{$R *.DFM}

procedure TPBRPStkHoldfrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
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

procedure TPBRPStkHoldfrm.FooterQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
PageNoQRLabel.Caption := 'Page: ' + IntToStr(QuickReport.PageNumber);
end;

procedure TPBRPStkHoldfrm.OrderDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  rBoxcount: real;
begin
  try
    lblFormsperBox.caption := inttostr(qryReport.Fieldbyname('Forms_per_Box').asinteger);
  except
    lblFormsperBox.caption := 'TBA';
  end;

  {Count Boxes}
  try
    rBoxcount := (qryReport.fieldbyname('Qty_in_Stock').asfloat / qryReport.Fieldbyname('Forms_per_Box').asinteger);
    lblBoxCount.caption := inttostr(ceil(rBoxCount));
  except
    lblBoxCount.caption := '';
  end;
end;

end.
