unit CCSPrint;

interface

uses
  Classes, Graphics, qrprntr, PBImages;

const
  cLFCR             = #13#10;  { Line feed carriage return }
  cDefaultRepLogo   = 'PBRepLogo.bmp';
  cDefaultRepLogo1  = 'PBRepLogo1.bmp';
  cDefaultRepLogo2  = 'PBRepLogo2.bmp';
  cDefaultRepLogo3  = 'PBRepLogo3.bmp';

type
  TRecordType   = (rtEnd, rtBlank, rtText, rtKeepTogether, rtUpdateInfo,
                   rtContinuedText, rtSetColumns);

  TUpdateInfo   = class
  private
    FEnquiryNo: integer;
    FPONumber: real;
    FLine: integer;
    FSupplier: integer;
    FCustomer: integer;
    FBranchNo: integer;
    procedure SetBranchNo(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetEnquiryNo(const Value: integer);
    procedure SetLine(const Value: integer);
    procedure SetPONumber(const Value: real);
    procedure SetSupplier(const Value: integer);
  public
    property BranchNo : integer read FBranchNo write SetBranchNo;
    property Customer : integer read FCustomer write SetCustomer;
    property EnquiryNo : integer read FEnquiryNo write SetEnquiryNo;
    property Line : integer read FLine write SetLine;
    property PONumber : real read FPONumber write SetPONumber;
    property Supplier : integer read FSupplier write SetSupplier;
  end;

  TPageLayout  = class  { All measurements are in pixels }
  private
    FHBuffer : integer;
    FVBuffer : integer;
    FPrintLogo: Boolean;
    FPortrait: Boolean;
    FPreprinted: Boolean;
    FPrintAddress: Boolean;
    FMarginRight: integer;
    FLogoTop: integer;
    FPPLeft: integer;
    FMarginLeft: integer;
    FLogoLeft: integer;
    FPPWidth: integer;
    FAddressHeight: integer;
    FLogoWidth: integer;
    FPPHeight: integer;
    FAddressLeft: integer;
    FPPTop: integer;
    FMarginBottom: integer;
    FMarginTop: integer;
    FAddressTop: integer;
    FAddressWidth: integer;
    FLogoHeight: integer;
    FPageLayoutName: string;
    FPageHeight: integer;
    FPageWidth: integer;
    FSpaceLeft: integer;
    FYPos : integer;
    FLogoFileName: string;
    FAddressFontSize: integer;
    FAddressFontStyle: integer;
    FAddressAlignment: string;
    FAddressFontName: string;
    FAddressPrintbyLine: Boolean;
    FPrintLogo1: Boolean;
    FPrintLogo3: Boolean;
    FPrintLogo2: Boolean;
    FPrintRegAddress: Boolean;
    FRegAddressPrintbyLine: Boolean;
    FLogoTop1: integer;
    FRegAddressFontSize: integer;
    FRegAddressHeight: integer;
    FLogoHeight1: integer;
    FLogoLeft1: integer;
    FLogoHeight2: integer;
    FLogoLeft2: integer;
    FLogoTop3: integer;
    FLogoHeight3: integer;
    FLogoLeft3: integer;
    FLogoTop2: integer;
    FRegAddressLeft: integer;
    FRegAddressFontStyle: integer;
    FRegAddressWidth: integer;
    FLogoWidth2: integer;
    FLogoWidth1: integer;
    FLogoWidth3: integer;
    FRegAddressTop: integer;
    FLogoFileName1: string;
    FLogoFileName2: string;
    FRegAddressFontName: string;
    FLogoFileName3: string;
    FRegAddressAlignment: string;
    procedure SetAddressHeight(const Value: integer);
    procedure SetAddressLeft(const Value: integer);
    procedure SetAddressTop(const Value: integer);
    procedure SetAddressWidth(const Value: integer);
    procedure SetLogoHeight(const Value: integer);
    procedure SetLogoLeft(const Value: integer);
    procedure SetLogoTop(const Value: integer);
    procedure SetLogoWidth(const Value: integer);
    procedure SetMarginBottom(const Value: integer);
    procedure SetMarginLeft(const Value: integer);
    procedure SetMarginRight(const Value: integer);
    procedure SetMarginTop(const Value: integer);
    procedure SetPageLayoutName(const Value: string);
    procedure SetPortrait(const Value: Boolean);
    procedure SetPPHeight(const Value: integer);
    procedure SetPPLeft(const Value: integer);
    procedure SetPPTop(const Value: integer);
    procedure SetPPWidth(const Value: integer);
    procedure SetPreprinted(const Value: Boolean);
    procedure SetPrintAddress(const Value: Boolean);
    procedure SetPrintLogo(const Value: Boolean);
    procedure SetPageHeight(const Value: integer);
    procedure SetPageWidth(const Value: integer);
    function  GetCurrentWidth : integer;
    function  GetMarginLeft : integer;
    procedure SetLogoFileName(const Value: string);
    procedure SetHBuffer(const Value: integer);
    procedure SetVBuffer(const Value: integer);
    procedure SetAddressAlignment(const Value: string);
    procedure SetAddressFontName(const Value: string);
    procedure SetAddressFontSize(const Value: integer);
    procedure SetAddressFontStyle(const Value: integer);
    procedure SetAddressPrintbyLine(const Value: Boolean);
    procedure SetPrintLogo1(const Value: Boolean);
    procedure SetPrintLogo2(const Value: Boolean);
    procedure SetPrintLogo3(const Value: Boolean);
    procedure SetPrintRegAddress(const Value: Boolean);
    procedure SetLogoFileName1(const Value: string);
    procedure SetLogoFileName2(const Value: string);
    procedure SetLogoFileName3(const Value: string);
    procedure SetLogoHeight1(const Value: integer);
    procedure SetLogoHeight2(const Value: integer);
    procedure SetLogoHeight3(const Value: integer);
    procedure SetLogoLeft1(const Value: integer);
    procedure SetLogoLeft2(const Value: integer);
    procedure SetLogoLeft3(const Value: integer);
    procedure SetLogoTop1(const Value: integer);
    procedure SetLogoTop2(const Value: integer);
    procedure SetLogoTop3(const Value: integer);
    procedure SetLogoWidth1(const Value: integer);
    procedure SetLogoWidth2(const Value: integer);
    procedure SetLogoWidth3(const Value: integer);
    procedure SetRegAddressAlignment(const Value: string);
    procedure SetRegAddressFontName(const Value: string);
    procedure SetRegAddressFontStyle(const Value: integer);
    procedure SetRegAddressHeight(const Value: integer);
    procedure SetRegAddressLeft(const Value: integer);
    procedure SetRegAddressPrintbyLine(const Value: Boolean);
    procedure SetRegAddressTop(const Value: integer);
    procedure SetRegAddressWidth(const Value: integer);
    procedure SetRegAddressFontSize(const Value: integer);
  public
    procedure Clear;
    property AddressAlignment : string read FAddressAlignment write SetAddressAlignment;
    property AddressFontName : string read FAddressFontName write SetAddressFontName;
    property AddressFontSize : integer read FAddressFontSize write SetAddressFontSize;
    property AddressFontStyle : integer read FAddressFontStyle write SetAddressFontStyle;
    property AddressPrintbyLine : Boolean read FAddressPrintbyLine write SetAddressPrintbyLine;
    property AddressHeight : integer read FAddressHeight write SetAddressHeight;
    property AddressLeft : integer read FAddressLeft write SetAddressLeft;
    property AddressTop : integer read FAddressTop write SetAddressTop;
    property AddressWidth : integer read FAddressWidth write SetAddressWidth;
    property CurrentWidth : integer read GetCurrentWidth;
    property HBuffer : integer read FHBuffer write SetHBuffer;
    property LogoFileName : string read FLogoFileName write SetLogoFileName;
    property LogoHeight : integer read FLogoHeight write SetLogoHeight;
    property LogoLeft : integer read FLogoLeft write SetLogoLeft;
    property LogoTop : integer read FLogoTop write SetLogoTop;
    property LogoWidth : integer read FLogoWidth write SetLogoWidth;
    property LogoFileName1 : string read FLogoFileName1 write SetLogoFileName1;
    property LogoHeight1 : integer read FLogoHeight1 write SetLogoHeight1;
    property LogoLeft1 : integer read FLogoLeft1 write SetLogoLeft1;
    property LogoTop1 : integer read FLogoTop1 write SetLogoTop1;
    property LogoWidth1 : integer read FLogoWidth1 write SetLogoWidth1;
    property LogoFileName2 : string read FLogoFileName2 write SetLogoFileName2;
    property LogoHeight2 : integer read FLogoHeight2 write SetLogoHeight2;
    property LogoLeft2 : integer read FLogoLeft2 write SetLogoLeft2;
    property LogoTop2 : integer read FLogoTop2 write SetLogoTop2;
    property LogoWidth2 : integer read FLogoWidth2 write SetLogoWidth2;
    property LogoFileName3 : string read FLogoFileName3 write SetLogoFileName3;
    property LogoHeight3 : integer read FLogoHeight3 write SetLogoHeight3;
    property LogoLeft3 : integer read FLogoLeft3 write SetLogoLeft3;
    property LogoTop3 : integer read FLogoTop3 write SetLogoTop3;
    property LogoWidth3 : integer read FLogoWidth3 write SetLogoWidth3;
    property MarginBottom : integer read FMarginBottom write SetMarginBottom;
    property MarginLeft : integer read GetMarginLeft write SetMarginLeft;
    property MarginRight : integer read FMarginRight write SetMarginRight;
    property MarginTop : integer read FMarginTop write SetMarginTop;
    property PageLayoutName : string read FPageLayoutName write SetPageLayoutName;
    property Portrait : Boolean read FPortrait write SetPortrait;
    property PPHeight : integer read FPPHeight write SetPPHeight;
    property PPLeft : integer read FPPLeft write SetPPLeft;
    property PPTop : integer read FPPTop write SetPPTop;
    property PPWidth : integer read FPPWidth write SetPPWidth;
    property Preprinted : Boolean read FPreprinted write SetPreprinted;
    property PrintAddress : Boolean read FPrintAddress write SetPrintAddress;
    property PrintRegAddress : Boolean read FPrintRegAddress write SetPrintRegAddress;
    property PrintLogo : Boolean read FPrintLogo write SetPrintLogo;
    property PrintLogo1 : Boolean read FPrintLogo1 write SetPrintLogo1;
    property PrintLogo2 : Boolean read FPrintLogo2 write SetPrintLogo2;
    property PrintLogo3 : Boolean read FPrintLogo3 write SetPrintLogo3;
    property PageHeight : integer read FPageHeight write SetPageHeight;
    property PageWidth : integer read FPageWidth write SetPageWidth;
    property RegAddressAlignment : string  read FRegAddressAlignment write SetRegAddressAlignment;
    property RegAddressFontName : string read FRegAddressFontName write SetRegAddressFontName;
    property RegAddressFontSize : integer read FRegAddressFontSize write SetRegAddressFontSize;
    property RegAddressFontStyle : integer read FRegAddressFontStyle write SetRegAddressFontStyle;
    property RegAddressPrintbyLine : Boolean read FRegAddressPrintbyLine write SetRegAddressPrintbyLine;
    property RegAddressHeight : integer read FRegAddressHeight write SetRegAddressHeight;
    property RegAddressLeft : integer read FRegAddressLeft write SetRegAddressLeft;
    property RegAddressTop : integer read FRegAddressTop write SetRegAddressTop;
    property RegAddressWidth : integer read FRegAddressWidth write SetRegAddressWidth;
    property SpaceLeft : integer read FSpaceLeft write FSpaceLeft;
    property VBuffer : integer read FVBuffer write SetVBuffer;
    property YPos : integer read FYPos write FYPos;
  end;

  TPrinterSettings = class
  private
    FFromPage: integer;
    FCopies: integer;
    FToPage: integer;
    FOutputBin: TQRBin;
    function  GetPrinterIndex : integer;
    procedure SetCopies(const Value: integer);
    procedure SetFromPage(const Value: integer);
    procedure SetToPage(const Value: integer);
    procedure SetOutputBin(const Value: TQRBin);
  public
    constructor Create;
    property Copies: integer read FCopies write SetCopies;
    property FromPage: integer read FFromPage write SetFromPage;
    property PrinterIndex: integer read GetPrinterIndex;
    property ToPage: integer read FToPage write SetToPage;
    property OutputBin : TQRBin read FOutputBin write SetOutputBin;
  end;

  TColumnRecord  = class
  private
    FLeftMargin: integer;
    FWidth: integer;
    FText: string;
    FAlignment: TAlignment;
    FFont: TFont;
    FSpecialLine: integer;
    FPrintAsLastLine: Boolean;
    procedure SetAlignment(const Value: TAlignment);
    procedure SetFont(const Value: TFont);
    procedure SetLeftMargin(const Value: integer);
    procedure SetText(const Value: string);
    procedure SetWidth(const Value: integer);
    procedure SetSpecialLine(const Value: integer);
    procedure SetPrintAsLastLine(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(aColRec : TColumnRecord);
    property Alignment : TAlignment read FAlignment write SetAlignment;
    property Font : TFont read FFont write SetFont;
    property LeftMargin : integer read FLeftMargin write SetLeftMargin;
    property PrintAsLastLine : Boolean read FPrintAsLastLine write SetPrintAsLastLine;
    property SpecialLine : integer read FSpecialLine write SetSpecialLine;
    property Text : string read FText write SetText;
    property Width : integer read FWidth write SetWidth;
  end;

  TPrintRecord  = class
  private
    FRecordType: TRecordType;
    FColumn1: TColumnRecord;
    FColumn2: TColumnRecord;
    FColumn3: TColumnRecord;
    FUpdateInfo: TUpdateInfo;
    FContinuedText: string;
    FSpecialFont: TFont;
    FPrintOrder: integer;
    procedure SetRecordType(const Value: TRecordType);
    procedure SetColumn1(const Value: TColumnRecord);
    procedure SetColumn2(const Value: TColumnRecord);
    procedure SetColumn3(const Value: TColumnRecord);
    procedure SetUpdateInfo(const Value: TUpdateInfo);
    procedure SetContinuedText(const Value: string);
    procedure SetSpecialFont(const Value: TFont);
    procedure SetPrintOrder(const Value: integer);
  public
    constructor Create;
    destructor Destroy; override;
    property Column1 : TColumnRecord read FColumn1 write SetColumn1;
    property Column2 : TColumnRecord read FColumn2 write SetColumn2;
    property Column3 : TColumnRecord read FColumn3 write SetColumn3;
    property ContinuedText : string read FContinuedText write SetContinuedText;
    property PrintOrder : integer read FPrintOrder write SetPrintOrder;
    property RecordType : TRecordType read FRecordType write SetRecordType;
    property SpecialFont : TFont read FSpecialFont write SetSpecialFont;
    property UpdateInfo : TUpdateInfo read FUpdateInfo write SetUpdateInfo;
  end;

function SetUpPrinter(PrinterSettings : TPrinterSettings) : Boolean; overload;
function SetUpPrinter(PrinterSettings: TQRPrinterSettings): Boolean; overload;
//function GetOutputBin: TQRBin;

implementation
uses
{$IFDEF DEBUG}
  CCSDebug,
{$ENDIF}
  Printers, Dialogs, SysUtils, Math, Windows;

const
  C_BufferZone = 12; { 12 pixels = one eighth inch round logos and addresses }

function SetUpPrinter(PrinterSettings : TPrinterSettings) : Boolean;
var
  PSDialog : TPrintDialog;
begin
  PSDialog := TPrintDialog.Create(nil);
  try

    PSDialog.Options := [poPageNums];
    PSDialog.Copies := 1;
    PSDialog.FromPage := 1;
    PSDialog.MinPage := 1;
    PSDialog.ToPage := 10000;
    PSDialog.MaxPage := 10000;
    Result := PSDialog.Execute;
    if Result then
    begin
      PrinterSettings.Copies := PSDialog.Copies;
      if PSDialog.PrintRange = prPageNums then
      begin
        PrinterSettings.FromPage := PSDialog.FromPage;
        PrinterSettings.ToPage := PSDialog.ToPage;
      end;
//      PrinterSettings.OutputBin := GetOutputBin;
    end;
  finally
    PSDialog.Free;
  end;

end;

function SetUpPrinter(PrinterSettings: TQRPrinterSettings): Boolean;
var
  PSDialog : TPrintDialog;
begin
  PSDialog := TPrintDialog.Create(nil);
  try

    PSDialog.Options := [poPageNums];
    PSDialog.Copies := 1;
    PSDialog.FromPage := 1;
    PSDialog.MinPage := 1;
    PSDialog.ToPage := 10000;
    PSDialog.MaxPage := 10000;
    Result := PSDialog.Execute;
    if Result then
    begin
      PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
      PrinterSettings.Copies := PSDialog.Copies;

      if PSDialog.PrintRange = prPageNums then
      begin
        PrinterSettings.FirstPage := PSDialog.FromPage;
        PrinterSettings.LastPage := PSDialog.ToPage;
      end;
//      PrinterSettings.OutputBin := GetOutputBin;
    end;
  finally
    PSDialog.Free;
  end;
end;

(*
function GetOutputBin: TQRBin;
var
  Printset : TPrintSet;
  sBin : string;
begin
  Printset := TPrintset.create(nil);
  try
    try
      Printset.ResetPrinterDialogs;
      sBin := Printset.GetBinSourceList.strings[Printset.BinIndex];

      if pos('First',sBin) > 0 then
        begin
        Result := First;
        Printset.DefaultSource := dmBin_First;
        end
      else if pos('Upper',sBin) > 0 then
        begin
        Result := Upper;
        Printset.DefaultSource := dmBin_Upper;
        end
      else if pos('Lower',sBin) > 0 then
        begin
        Result := Lower;
        Printset.DefaultSource := dmBin_Lower;
        end
      else if pos('Middle',sBin) > 0 then
        begin
        Result := Middle;
        Printset.DefaultSource := dmBin_Middle;
        end
      else if pos('Manual',sBin) > 0 then
        begin
        Result := Manual;
        Printset.DefaultSource := dmBin_Manual;
        end
      else if pos('Envelope',sBin) > 0 then
        begin
        Result := Envelope;
        Printset.DefaultSource := dmBin_Envelope;
        end
      else if pos('Envelope Manual',sBin) > 0 then
        begin
        Result := EnvManual;
        Printset.DefaultSource := dmBin_EnvManual;
        end
      else if pos('Auto',sBin) > 0 then
        begin
        Result := Auto ;
        Printset.DefaultSource := dmBin_Auto;
        end
      else if pos('Lower',sBin) > 0 then
        begin
        Result := Lower;
        Printset.DefaultSource := dmBin_Lower;
        end
      else if pos('Tractor',sBin) > 0 then
        begin
        Result := Tractor;
        Printset.DefaultSource := dmBin_Tractor;
        end
      else if pos('Cassette',sBin) > 0 then
        begin
        Result := Cassette;
        Printset.DefaultSource := dmBin_Cassette;
        end
      else if pos('Last',sBin) > 0 then
        begin
        Result := Last;
        Printset.DefaultSource := dmBin_Last;
        end
      else if pos('Tray 1',sBin) > 0 then
        begin
        Result := Tray1;
        Printset.DefaultSource := dmBin_First {Tray 1 printer code};
        end
      else if pos('Tray 2',sBin) > 0 then
        begin
        Result := Tray2;
        Printset.DefaultSource := dmBin_lower {Tray 2 printer code};
        end
      else if pos('Tray 3',sBin) > 0 then
        begin
        Result := Tray3;
        Printset.DefaultSource := 11 {Tray 3 printer code};
        end
      else
        begin
        Result := Auto;
        Printset.DefaultSource := dmBin_Auto;
        end;
      Printset.SaveToDefaults;
    finally
      Printset.free;
    end;
  except
    Result := Auto;
  end;
end;
*)

{ TPrintRecord }

constructor TPrintRecord.Create;
begin
  FSpecialFont := TFont.Create;
end;

destructor TPrintRecord.Destroy;
begin
  FSpecialFont.Free;
  if Assigned(FColumn1) then
    FColumn1.Free;
  if Assigned(FColumn2) then
    FColumn2.Free;
  if Assigned(FColumn3) then
    FColumn3.Free;
  if Assigned(FUpdateInfo) then
    FUpdateInfo.Free;
  inherited;
end;

procedure TPrintRecord.SetColumn1(const Value: TColumnRecord);
begin
  FColumn1 := Value;
end;

procedure TPrintRecord.SetColumn2(const Value: TColumnRecord);
begin
  FColumn2 := Value;
end;

procedure TPrintRecord.SetColumn3(const Value: TColumnRecord);
begin
  FColumn3 := Value;
end;

procedure TPrintRecord.SetContinuedText(const Value: string);
begin
  FContinuedText := Value;
end;

procedure TPrintRecord.SetPrintOrder(const Value: integer);
begin
  FPrintOrder := Value;
end;

procedure TPrintRecord.SetRecordType(const Value: TRecordType);
begin
  FRecordType := Value;
end;

procedure TPrintRecord.SetSpecialFont(const Value: TFont);
begin
  FSpecialFont := Value;
end;

procedure TPrintRecord.SetUpdateInfo(const Value: TUpdateInfo);
begin
  FUpdateInfo := Value;
end;

{ TPageLayout }

procedure TPageLayout.SetAddressHeight(const Value: integer);
begin
  FAddressHeight := Value;
end;

procedure TPageLayout.SetAddressLeft(const Value: integer);
begin
  FAddressLeft := Value;
end;

procedure TPageLayout.SetAddressTop(const Value: integer);
begin
  FAddressTop := Value;
end;

procedure TPageLayout.SetAddressWidth(const Value: integer);
begin
  FAddressWidth := Value;
end;

procedure TPageLayout.SetLogoHeight(const Value: integer);
begin
  FLogoHeight := Value;
end;

procedure TPageLayout.SetLogoLeft(const Value: integer);
begin
  FLogoLeft := Value;
end;

procedure TPageLayout.SetLogoTop(const Value: integer);
begin
  FLogoTop := Value;
end;

procedure TPageLayout.SetLogoWidth(const Value: integer);
begin
  FLogoWidth := Value;
end;

procedure TPageLayout.SetMarginBottom(const Value: integer);
begin
  FMarginBottom := Value;
end;

procedure TPageLayout.SetMarginLeft(const Value: integer);
begin
  FMarginLeft := Value;
end;

procedure TPageLayout.SetMarginRight(const Value: integer);
begin
  FMarginRight := Value;
end;

procedure TPageLayout.SetMarginTop(const Value: integer);
begin
  FMarginTop := Value;
end;

procedure TPageLayout.SetPageLayoutName(const Value: string);
begin
  FPageLayoutName := Value;
end;

procedure TPageLayout.SetPageWidth(const Value: integer);
begin
  FPageWidth := Value;
end;

procedure TPageLayout.SetPortrait(const Value: Boolean);
begin
  FPortrait := Value;
end;

procedure TPageLayout.SetPPHeight(const Value: integer);
begin
  FPPHeight := Value;
end;

procedure TPageLayout.SetPPLeft(const Value: integer);
begin
  FPPLeft := Value;
end;

procedure TPageLayout.SetPPTop(const Value: integer);
begin
  FPPTop := Value;
end;

procedure TPageLayout.SetPPWidth(const Value: integer);
begin
  FPPWidth := Value;
end;

procedure TPageLayout.SetPreprinted(const Value: Boolean);
begin
  FPreprinted := Value;
end;

procedure TPageLayout.SetPrintAddress(const Value: Boolean);
begin
  FPrintAddress := Value;
end;

procedure TPageLayout.SetPrintLogo(const Value: Boolean);
begin
  FPrintLogo := Value;
end;

procedure TPageLayout.SetPageHeight(const Value: integer);
begin
  FPageHeight := Value;
end;

function TPageLayout.GetCurrentWidth : integer;
begin
  { Given the current vertical position, what is the maximum width on the
    page allowing for margins, logos, addresses or pre-printed
    blocks? }
  if Preprinted and (YPos >= (PPTop-HBuffer))
    and (YPos <= (PPTop+PPHeight+HBuffer)) then
  begin
    if PPLeft > MarginLeft then
      Result := PPLeft - MarginLeft - HBuffer
    else
      Result := PageWidth - (PPLeft + PPWidth + MarginRight + HBuffer);
  end
  else  { not pre-printed, check if we're doing logos etc }
  if PrintLogo and (YPos >= (LogoTop-HBuffer))
    and (YPos <= (LogoTop+LogoHeight+HBuffer)) then
  begin
    if LogoLeft > MarginLeft then
      Result := LogoLeft - MarginLeft - HBuffer
    else
      Result := PageWidth - (LogoLeft + LogoWidth + MarginRight + HBuffer);
  end
  else
  if PrintAddress and (YPos >= (AddressTop-HBuffer))
  and (YPos <= (AddressTop+AddressHeight+HBuffer)) then
  begin
    if MarginLeft < AddressLeft then
      Result := AddressLeft - MarginLeft - HBuffer
    else
      Result := PageWidth - (AddressLeft + AddressWidth + MarginRight + HBuffer);
  end
  else
    Result := PageWidth - (MarginLeft + MarginRight);
{$IFDEF DEBUG}
  Trace('CurrentWidth returns ' + IntToStr(Result));
{$ENDIF}
end;

procedure TPageLayout.Clear;
begin
  PageLayoutName:= '';
  LogoFileName  := '';
  AddressAlignment  := '';
  AddressFontName   := '';
  AddressFontSize   := 0;
  AddressFontStyle := 0;
  AddressHeight   := 0;
  AddressLeft     := 0;
  AddressTop      := 0;
  AddressWidth    := 0;
  LogoHeight      := 0;
  LogoLeft        := 0;
  LogoTop         := 0;
  LogoWidth       := 0;
  LogoHeight1      := 0;
  LogoLeft1        := 0;
  LogoTop1         := 0;
  LogoWidth1       := 0;
  LogoHeight2      := 0;
  LogoLeft2        := 0;
  LogoTop2         := 0;
  LogoWidth2       := 0;
  LogoHeight3      := 0;
  LogoLeft3        := 0;
  LogoTop3         := 0;
  LogoWidth3       := 0;
  MarginBottom    := 0;
  MarginLeft      := 0;
  MarginRight     := 0;
  MarginTop       := 0;
  PPHeight        := 0;
  PPLeft          := 0;
  PPTop           := 0;
  PPWidth         := 0;
  PageHeight      := 0;
  PageWidth       := 0;
  SpaceLeft       := 0;
  YPos            := 0;
  Preprinted      := false;
  PrintAddress    := false;
  PrintRegAddress := false;
  PrintLogo       := false;
  PrintLogo1      := false;
  PrintLogo2      := false;
  PrintLogo3      := false;
  Portrait        := false;
  RegAddressAlignment  := '';
  RegAddressFontName   := '';
  RegAddressFontSize   := 0;
  REgAddressFontStyle := 0;
  RegAddressHeight   := 0;
  RegAddressLeft     := 0;
  RegAddressTop      := 0;
  RegAddressWidth    := 0;
  HBuffer         := C_BufferZone;
end;

procedure TPageLayout.SetLogoFileName(const Value: string);
begin
  if Trim(Value) = '' then
//    FLogoFileName := cDefaultRepLogo
    FLogoFileName := PBImagesfrm.DefaultLogo
  else
    FLogoFileName := Value;
end;

function TPageLayout.GetMarginLeft: integer;
begin
  { Given the current vertical position, what is the current left margin on the
    page allowing for margins, logos, addresses or pre-printed blocks? }
  if Preprinted and (YPos >= PPTop) and (YPos <= PPTop+PPHeight) and
    (FMarginLeft >= PPLeft) and (FMarginLeft <= (PPLeft+PPWidth)) then
    Result := PPLeft+PPWidth+HBuffer
  else  { not pre-printed, check if we're doing logos etc }
  if PrintLogo and (YPos >= LogoTop) and (YPos <= LogoTop+LogoHeight) and
    (FMarginLeft >= LogoLeft) and (FMarginLeft <= (LogoLeft+LogoWidth)) then
    Result :=LogoLeft+LogoWidth+HBuffer
  else
  if PrintAddress and (YPos >= AddressTop) and (YPos <= AddressTop+AddressHeight) and
    (FMarginLeft >= AddressLeft) and (FMarginLeft <= (AddressLeft+AddressWidth)) then
    Result := AddressLeft+AddressWidth+HBuffer
  else
    Result := FMarginLeft;
{$IFDEF DEBUG}
  Trace('GetMarginLeft returns ' + IntToStr(Result));
{$ENDIF}
end;

procedure TPageLayout.SetHBuffer(const Value: integer);
begin  { Horizontal buffer zone }
  FHBuffer := Value;
end;

procedure TPageLayout.SetVBuffer(const Value: integer);
begin  { Vertical buffer zone }
  FVBuffer := Value;
end;

procedure TPageLayout.SetAddressAlignment(const Value: string);
begin
  FAddressAlignment := Value;
end;

procedure TPageLayout.SetAddressFontName(const Value: string);
begin
  FAddressFontName := Value;
end;

procedure TPageLayout.SetAddressFontSize(const Value: integer);
begin
  FAddressFontSize := Value;
end;

procedure TPageLayout.SetAddressFontStyle(const Value: integer);
begin
  FAddressFontStyle := Value;
end;

procedure TPageLayout.SetAddressPrintbyLine(const Value: Boolean);
begin
  FAddressPrintbyLine := Value;
end;

procedure TPageLayout.SetPrintLogo1(const Value: Boolean);
begin
  FPrintLogo1 := Value;
end;

procedure TPageLayout.SetPrintLogo2(const Value: Boolean);
begin
  FPrintLogo2 := Value;
end;

procedure TPageLayout.SetPrintLogo3(const Value: Boolean);
begin
  FPrintLogo3 := Value;
end;

procedure TPageLayout.SetPrintRegAddress(const Value: Boolean);
begin
  FPrintRegAddress := Value;
end;

procedure TPageLayout.SetLogoFileName1(const Value: string);
begin
  FLogoFileName1 := Value;
end;

procedure TPageLayout.SetLogoFileName2(const Value: string);
begin
  FLogoFileName2 := Value;
end;

procedure TPageLayout.SetLogoFileName3(const Value: string);
begin
  FLogoFileName3 := Value;
end;

procedure TPageLayout.SetLogoHeight1(const Value: integer);
begin
  FLogoHeight1 := Value;
end;

procedure TPageLayout.SetLogoHeight2(const Value: integer);
begin
  FLogoHeight2 := Value;
end;

procedure TPageLayout.SetLogoHeight3(const Value: integer);
begin
  FLogoHeight3 := Value;
end;

procedure TPageLayout.SetLogoLeft1(const Value: integer);
begin
  FLogoLeft1 := Value;
end;

procedure TPageLayout.SetLogoLeft2(const Value: integer);
begin
  FLogoLeft2 := Value;
end;

procedure TPageLayout.SetLogoLeft3(const Value: integer);
begin
  FLogoLeft3 := Value;
end;

procedure TPageLayout.SetLogoTop1(const Value: integer);
begin
  FLogoTop1 := Value;
end;

procedure TPageLayout.SetLogoTop2(const Value: integer);
begin
  FLogoTop2 := Value;
end;

procedure TPageLayout.SetLogoTop3(const Value: integer);
begin
  FLogoTop3 := Value;
end;

procedure TPageLayout.SetLogoWidth1(const Value: integer);
begin
  FLogoWidth1 := Value;
end;

procedure TPageLayout.SetLogoWidth2(const Value: integer);
begin
  FLogoWidth2 := Value;
end;

procedure TPageLayout.SetLogoWidth3(const Value: integer);
begin
  FLogoWidth3 := Value;
end;

procedure TPageLayout.SetRegAddressAlignment(const Value: string);
begin
  FRegAddressAlignment := Value;
end;

procedure TPageLayout.SetRegAddressFontName(const Value: string);
begin
  FRegAddressFontName := Value;
end;

procedure TPageLayout.SetRegAddressFontStyle(const Value: integer);
begin
  FRegAddressFontStyle := Value;
end;

procedure TPageLayout.SetRegAddressHeight(const Value: integer);
begin
  FRegAddressHeight := Value;
end;

procedure TPageLayout.SetRegAddressLeft(const Value: integer);
begin
  FRegAddressLeft := Value;
end;

procedure TPageLayout.SetRegAddressPrintbyLine(const Value: Boolean);
begin
  FRegAddressPrintbyLine := Value;
end;

procedure TPageLayout.SetRegAddressTop(const Value: integer);
begin
  FRegAddressTop := Value;
end;

procedure TPageLayout.SetRegAddressWidth(const Value: integer);
begin
  FRegAddressWidth := Value;
end;

procedure TPageLayout.SetRegAddressFontSize(const Value: integer);
begin
  FRegAddressFontSize := Value;
end;

{ TColumnRecord }

constructor TColumnRecord.Create;
begin
  Font := TFont.Create;
  with Font do
  begin
    Name := 'Times New Roman';
    Size := 12;
    Style := [];
  end;
end;

destructor TColumnRecord.Destroy;
begin
  Font.Free;
  inherited;
end;

procedure TColumnRecord.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
end;

procedure TColumnRecord.SetSpecialLine(const Value: integer);
begin
  FSpecialLine := Value;
end;

procedure TColumnRecord.SetFont(const Value: TFont);
begin
  FFont := Value;
end;

procedure TColumnRecord.SetLeftMargin(const Value: integer);
begin
  FLeftMargin := Value;
end;

procedure TColumnRecord.SetText(const Value: string);
begin
  FText := Value;
end;

procedure TColumnRecord.SetWidth(const Value: integer);
begin
  FWidth := Value;
end;

procedure TColumnRecord.Assign(aColRec : TColumnRecord);
begin
  Alignment   := aColRec.Alignment;
  SpecialLine := aColRec.SpecialLine;
  Font.Assign(aColRec.Font);
  LeftMargin  := aColRec.LeftMargin;
  Text        := aColRec.Text;
  Width       := aColRec.Width;
end;

procedure TColumnRecord.SetPrintAsLastLine(const Value: Boolean);
begin
  FPrintAsLastLine := Value;
end;

{ TUpdateInfo }

procedure TUpdateInfo.SetBranchNo(const Value: integer);
begin
  FBranchNo := Value;
end;

procedure TUpdateInfo.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TUpdateInfo.SetEnquiryNo(const Value: integer);
begin
  FEnquiryNo := Value;
end;

procedure TUpdateInfo.SetLine(const Value: integer);
begin
  FLine := Value;
end;

procedure TUpdateInfo.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TUpdateInfo.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

{ TPrinterSettings }

constructor TPrinterSettings.Create;
begin
  Copies := 1;
end;

function TPrinterSettings.GetPrinterIndex: integer;
begin
  Result := Printers.Printer.PrinterIndex;
end;

procedure TPrinterSettings.SetCopies(const Value: integer);
begin
  FCopies := Value;
end;

procedure TPrinterSettings.SetFromPage(const Value: integer);
begin
  FFromPage := Value;
end;

procedure TPrinterSettings.SetOutputBin(const Value: TQRBin);
begin
  FOutputBin := Value;
end;

procedure TPrinterSettings.SetToPage(const Value: integer);
begin
  FToPage := Value;
end;

end.

