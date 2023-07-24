unit STRPStockLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint, CCSCommon, printers, qrprntr, gtQrCtrls;

type
  TSTRPStockLabelsFrm = class(TForm)
    RepSQL: TQuery;
    SRCRep: TDataSource;
    FormRefSQL: TQuery;
    qrpDetails: TQuickRep;
    QRBand1: TQRSubDetail;
    QRDBCustOrderRef: TQRDBText;
    lblCust: TQRLabel;
    lblDesc: TQRLabel;
    lblDate: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBTxtdesc: TQRDBText;
    QRDBTxtPrt: TQRDBText;
    lblFormRefID: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    imgReport: TQRImage;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
  private
    procedure SetCaptions;
  public
    Preview: ByteBool;
    iLine, iBoxQuantity, iSets: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    iIntSel: Integer;
    PrinterSettings : TPrinterSettings;
    selcode: string;
    PrintLogo: boolean;
  end;

var
  STRPStockLabelsFrm: TSTRPStockLabelsFrm;

implementation

uses PBImages;

{$R *.DFM}

procedure TSTRPStockLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo: string;
begin
  if (blineup) then Exit;

  with FormRefSQl do
    begin
      close;
      parambyname('Stock_Reference').asstring := repsql.fieldbyname('Part').asstring;
      open;
      first;
      lblFormRefID.caption := fieldbyname('Form_Reference_ID').asstring;
    end;
  DeliveryDateLbl.caption := pbdatestr(repsql.fieldbyname('Date_Received').asdatetime);
end;

function TSTRPStockLabelsFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with RepSQL do
  begin
    Close;
    ParamByName('Part').Asstring := SelCode;
    Open;
    result := recordcount;
  end;
end;

procedure TSTRPStockLabelsFrm.SetCaptions;
begin
end;

procedure TSTRPStockLabelsFrm.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  qrImage.enabled := PrintLogo;
  qrImage.Picture := pbImagesFrm.ReportImage.Picture;

  qrpDetails.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }
end;

end.
