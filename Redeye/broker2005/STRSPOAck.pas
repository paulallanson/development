unit STRSPOAck;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, STSOObjects, IniFiles, CCSPrint;

type
  TSTRSPOAckFrm = class(TForm)
    OrderGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblPODate: TLabel;
    lblSupplier: TLabel;
    CancelBitBtn: TBitBtn;
    Previewbitbtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    Label3: TLabel;
    lblPONumber: TLabel;
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure Runreport(Preview: ByteBool);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDefaultPrinter: string;
    procedure SetDefaultPrinter(const Value: string);
  private
    FPONumber: integer;
    procedure SetPONumber(const Value: integer);
    procedure GetDefaultPrinter;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  public
    { Public declarations }
    Reprint: ByteBool;
    bOK: ByteBool;
    PrintSetup: boolean;
    property PONumber: integer read FPONumber write SetPONumber;
  end;

var
  STRSPOAckFrm: TSTRSPOAckFrm;

implementation

uses UITypes, STRPPOAck, STStockDM, Printers, pbMainMenu;

{$R *.DFM}

procedure TSTRSPOAckFrm.PreviewbitbtnClick(Sender: TObject);
begin
  RunReport(True);
end;

procedure TSTRSPOAckFrm.Runreport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
begin
 {Actually run the report}
  STRPPOAckFrm := TSTRPPOAckFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPPOAckFrm.PrinterSettings := PrinterSettings;
      STRPPOAckFrm.Preview := Preview;
      STRPPOAckFrm.PONumber := PONumber;
    {Run the Purchase Order Ack Report}
      if STRPPOAckFrm.GetDetails(Self) = 0 then
      begin
        MessageDlg('There is nothing to print', mtError, [mbOK], 0);
      end
      else
      begin
        {Actually print or preview the report}
        if Preview then
          STRPPOAckFrm.PurchOrdQuickReport.Preview
        else
        begin
        If SetUpPrinter(PrinterSettings) then
          STRPPOAckFrm.PurchOrdQuickReport.Print;
        end;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    STRPPOAckFrm.free;
  end;
end;

procedure TSTRSPOAckFrm.PrintBitBtnClick(Sender: TObject);
begin
  Printsetup := True;
  RunReport(False);
  bOK := true;
  close;
end;

procedure TSTRSPOAckFrm.SetPONumber(const Value: integer);
begin
  FPONumber := Value;
end;

procedure TSTRSPOAckFrm.FormCreate(Sender: TObject);
begin
  GetDefaultPrinter;
end;

procedure TSTRSPOAckFrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  icount: integer;
  Device: pchar;
  Driver: pchar;
  Port: pchar;
  HDeviceMode: THandle;
  aprinter: TPrinter;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Purchase Order Printer', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  {Find the default printer in the list of printers }
  Printers.Printer.PrinterIndex := -1;
  for icount := 0 to pred(Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
        Printers.Printer.PrinterIndex := icount;
    end;
end;

procedure TSTRSPOAckFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

end.
