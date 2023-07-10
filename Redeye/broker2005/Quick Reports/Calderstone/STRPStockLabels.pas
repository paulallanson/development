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
    QRDBCustOrderRef: TgtQRDBText;
    lblCust: TgtQRLabel;
    lblDesc: TgtQRLabel;
    lblDate: TgtQRLabel;
    DeliveryDateLbl: TgtQRLabel;
    QRLabel2: TgtQRLabel;
    QRDBTxtdesc: TgtQRDBText;
    QRDBTxtPrt: TgtQRDBText;
    lblFormRefID: TgtQRLabel;
    qrImage: TgtQRImage;
    QRDBText1: TgtQRDBText;
    QRLabel3: TgtQRLabel;
    QRLabel4: TgtQRLabel;
    QRDBText2: TgtQRDBText;
    QRShape1: TgtQRShape;
    QRShape2: TgtQRShape;
    QRShape3: TgtQRShape;
    QRShape4: TgtQRShape;
    QRShape5: TgtQRShape;
    QRShape6: TgtQRShape;
    QRLabel1: TgtQRLabel;
    QRDBText3: TgtQRDBText;
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

  qrpDetails.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  qrpDetails.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  qrpDetails.PrinterSettings.Copies := Copies;   {set the output bin the }
end;

end.
