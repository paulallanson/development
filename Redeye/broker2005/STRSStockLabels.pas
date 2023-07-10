unit STRSStockLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db, DBTables, IniFiles, printers, Winspool, ComCtrls;

type
  TSTRSStockLabelsfrm = class(TForm)
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CountSQL: TQuery;
    PrintBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CustomerLbl: TLabel;
    Label2: TLabel;
    DescrLbl: TLabel;
    Label3: TLabel;
    productlbl: TLabel;
    Label4: TLabel;
    FromReferencelbl: TLabel;
    chkbxPrintLogo: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BoxQuantityEditKeyPress(Sender: TObject; var Key: Char);
    procedure BoxQuantityEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FPOLine: integer;
    FPONumber: real;
    FDelivery: integer;
    FDeliveryDate: string;
    FQuantity: string;
    FBoxQuantity: string;
    FDescription: string;
    FCustName: string;
    FDefaultPrinter: string;
    FNoOfSets: string;
    FNoOfBoxes: integer;
    FStocked: string;
    FDefaultBin: integer;
    FDefaultPaper: integer;
    fselcode: string;
    fselname: string;
    iselcode: integer;
    procedure SetBoxQuantity(const Value: string);
    procedure SetCustName(const Value: string);
    procedure SetDelivery(const Value: integer);
    procedure SetDeliveryDate(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetPOLine(const Value: integer);
    procedure SetPONumber(const Value: real);
    procedure SetQuantity(const Value: string);
    procedure EnableOK;
    procedure SetDefaultPrinter(const Value: string);
    procedure SetNoOfSets(const Value: string);
    procedure SetNoOfBoxes(const Value: integer);
    procedure SetStocked(const Value: string);
    procedure SetPrinterBin(BinCode: integer);
    procedure SetPrinterPaper(PaperCode: integer);
    function GetBinSelection: integer;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPaper(const Value: integer);
    function GetPaperSelection: integer;
    procedure setselcode(const Value: string);
    procedure setselname(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property CustName: string read FCustName write SetCustName;
    property Description: string read FDescription write SetDescription;
    property Quantity: string read FQuantity write SetQuantity;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    property PONumber: real read FPONumber write SetPONumber;
    property POLine: integer read FPOLine write SetPOLine;
    property Delivery: integer read FDelivery write SetDelivery;
    property BoxQuantity: string read FBoxQuantity write SetBoxQuantity;
    property NoOfSets: string read FNoOfSets write SetNoOfSets;
    property NoOfBoxes: integer read FNoOfBoxes write SetNoOfBoxes;
    property Stocked: string read FStocked write SetStocked;
    property Selcode: string read fselcode write setselcode;
    property Selname: string read fselname write setselname;
  private
    FPrinted: boolean;
    Preview: ByteBool;
    blineup: boolean;
    PrintSetup: boolean;
    iLastBox: Integer;
    function  RecordsExist : Boolean;
    procedure CallPrinter;
    procedure PrintReport;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultPaper: integer read FDefaultPaper write SetDefaultPaper;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  end;

var
  STRSStockLabelsfrm: TSTRSStockLabelsfrm;

implementation

uses PBIntSelDM, CCSPrint, STRPStockLabels, DateSelV5;

{$R *.DFM}

{ TPBRSBoxLabelsfrm }

procedure TSTRSStockLabelsfrm.SetBoxQuantity(const Value: string);
begin
end;

procedure TSTRSStockLabelsfrm.SetCustName(const Value: string);
begin
  FCustName := Value;
  CustomerLbl.caption := CustName;
end;

procedure TSTRSStockLabelsfrm.SetDelivery(const Value: integer);
begin
  FDelivery := Value;
end;

procedure TSTRSStockLabelsfrm.SetDeliveryDate(const Value: string);
begin
end;

procedure TSTRSStockLabelsfrm.SetDescription(const Value: string);
begin
  FDescription := Value;
  DescrLbl.caption := Description;
end;

procedure TSTRSStockLabelsfrm.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TSTRSStockLabelsfrm.SetPONumber(const Value: real);
begin
end;

procedure TSTRSStockLabelsfrm.SetQuantity(const Value: string);
begin
  FQuantity := Value;
end;

procedure TSTRSStockLabelsfrm.EnableOK;
begin
end;

procedure TSTRSStockLabelsfrm.FormShow(Sender: TObject);
begin
  enableok;
end;

procedure TSTRSStockLabelsfrm.PrintReport;
begin
  CallPrinter;
end;

procedure TSTRSStockLabelsfrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  bLineUp := false;
  PrintReport;
end;

procedure TSTRSStockLabelsfrm.SetupBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

function TSTRSStockLabelsfrm.RecordsExist: Boolean;
begin
end;

procedure TSTRSStockLabelsfrm.CallPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  STRPStockLabelsFrm := TSTRPStockLabelsFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;

    if not FPrinted and not Preview then
      begin
      {Find the default printer in the list of printers }
      Printer.PrinterIndex := -1;
      for icount := 0 to pred(Printer.Printers.count) do
        begin
          if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
            Printer.PrinterIndex := icount;
        end;
      if DefaultPrinter <> '' then
        begin
          if pos('ZEBRA',DefaultPrinter) = 0 then
            begin
              SetPrinterBin(DefaultBin);
              if pos('TEC',DefaultPrinter) > 0 then
                SetPrinterPaper(DefaultPaper);
            end;
        end;
      FPrinted := true;
      end;
    try
//      STRPStockLabelsFrm.PrinterSettings := PrinterSettings;
      STRPStockLabelsFrm.iIntSel := iSelCode;
      STRPStockLabelsFrm.selcode := selcode;
      STRPStockLabelsFrm.PrintLogo := chkbxPrintLogo.checked;

      {Actually print or preview the report}
      STRPStockLabelsFrm.Preview := Preview;
      if (not bLineUp) and (STRPStockLabelsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('No labels to print ', mtError, [mbAbort], 0);
        Exit;
      end;
      if Preview then
        STRPStockLabelsFrm.qrpDetails.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            STRPStockLabelsFrm.qrpDetails.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        STRPStockLabelsFrm.qrpDetails.Print;
    finally
      printer.printerindex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    STRPStockLabelsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSStockLabelsfrm.FormCreate(Sender: TObject);
begin
  FPrinted := false;
  GetDefaultPrinter;
end;

procedure TSTRSStockLabelsfrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  icount: integer;
  TempArray: array[0..255] of Char;
  sBin, sPaper, sPrintLogo: string;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Stock Label Printer', '', TempArray,
    sizeof(TempArray), 'Brokerstk.ini');

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Stock Label Printer Bin', '', TempArray,
    sizeof(TempArray), 'Brokerstk.ini');

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

  GetPrivateProfileString('Centrereed Broker', 'Stock Label Printer Paper', '', TempArray,
    sizeof(TempArray), 'Brokerstk.ini');
  sPaper := TempArray;
  try
    DefaultPaper := strtoint(sPaper);
  except
    DefaultPaper := 9;
  end;

  GetPrivateProfileString('Centrereed Broker', 'Stock Label Print Logo', '', TempArray,
    sizeof(TempArray), 'Brokerstk.ini');
  sPrintLogo := TempArray;
  chkbxPrintLogo.checked := (sPrintLogo = 'Y');
end;

function TSTRSStockLabelsfrm.GetBinSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     bin: integer;
     DevMode : PDevMode;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  bin := -1;
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        bin := DevMode^.DMDEFAULTSOURCE;
        GlobalUnlock (hDevMode);
  end;
  result := bin;
end;

function TSTRSStockLabelsfrm.GetPaperSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     Paper: integer;
     DevMode : PDevMode;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  Paper := -1;
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        Paper := DevMode^.dmPaperSize;
        GlobalUnlock (hDevMode);
  end;
  result := Paper;
end;

procedure TSTRSStockLabelsfrm.SetPrinterBin(BinCode : integer );
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        DevMode^.DMDEFAULTSOURCE := BinCode;
        GlobalUnlock (hDevMode);
  end;
end;

procedure TSTRSStockLabelsfrm.SetPrinterPaper(PaperCode : integer );
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
    DevMode := GlobalLock (hDevMode);
    // here we can catch members of DevMode
    DevMode^.dmPaperSize := PaperCode;
    GlobalUnlock (hDevMode);
  end;
end;

procedure TSTRSStockLabelsfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TSTRSStockLabelsfrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('Brokerstk.ini');

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Stock Label Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Stock Label Printer Bin',inttostr(DefaultBin));
      WriteString('Centrereed Broker', 'Stock Label Printer Paper',inttostr(DefaultPaper));
      if chkbxPrintLogo.Checked then
        WriteString('Centrereed Broker', 'Stock Label Print Logo','Y')
      else
        WriteString('Centrereed Broker', 'Stock Label Print Logo','N');
      Free;
    end;

  printer.printerindex := -1;
end;

procedure TSTRSStockLabelsfrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TSTRSStockLabelsfrm.BoxQuantityEditKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
    P := Pos('.', Text);
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TSTRSStockLabelsfrm.BoxQuantityEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  enableok;
end;

procedure TSTRSStockLabelsfrm.SetNoOfSets(const Value: string);
begin
  FNoOfSets := Value;
end;

procedure TSTRSStockLabelsfrm.SetNoOfBoxes(const Value: integer);
begin
end;

procedure TSTRSStockLabelsfrm.PrintBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
//  PrintSetup := False;
  PrintSetup := True;
  PrintReport;
  close;
end;

procedure TSTRSStockLabelsfrm.SetStocked(const Value: string);
begin
  FStocked := Value;
end;

procedure TSTRSStockLabelsfrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TSTRSStockLabelsfrm.SetDefaultPaper(const Value: integer);
begin
  FDefaultPaper := Value;
end;

procedure TSTRSStockLabelsfrm.setselcode(const Value: string);
begin
  fselcode := Value;
end;

procedure TSTRSStockLabelsfrm.setselname(const Value: string);
begin
  fselname := Value;
end;

procedure TSTRSStockLabelsfrm.FormActivate(Sender: TObject);
begin
 with countsql do
  begin
    close;
    parambyname('Part').asstring := selcode;
    open;
    if recordcount = 0 then
    exit;
    Customerlbl.Caption := fieldbyname('name').asstring;
    Descrlbl.caption := selname;
    ProductLbl.caption := selcode;
  end;
end;

end.
