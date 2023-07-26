unit STRSLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db, IniFiles, printers, Winspool, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSLabelsfrm = class(TForm)
    POGroupBox: TGroupBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BoxQuantityEdit: TEdit;
    StartBoxSpinEdit: TSpinEdit;
    NoofBoxesSpinEdit: TSpinEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    FromEdit: TEdit;
    PrefixEdit: TEdit;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    Label1: TLabel;
    CustomerLbl: TLabel;
    DescrLbl: TLabel;
    Label2: TLabel;
    CountSQL: TFDQuery;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    SetsEdit: TEdit;
    Label10: TLabel;
    PrintBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BoxQuantityEditKeyPress(Sender: TObject; var Key: Char);
    procedure BoxQuantityEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure DeliveryDateEditChange(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  STRSLabelsfrm: TSTRSLabelsfrm;

implementation

uses PBIntSelDM, CCSPrint, STRPBxLabels, DateSelV5, pbMainMenu;

{$R *.DFM}

{ TPBRSBoxLabelsfrm }

procedure TSTRSLabelsfrm.SetBoxQuantity(const Value: string);
begin
  FBoxQuantity := Value;
  BoxQuantityEdit.text := FBoxQuantity;
end;

procedure TSTRSLabelsfrm.SetCustName(const Value: string);
begin
  FCustName := Value;
  CustomerLbl.caption := CustName;
end;

procedure TSTRSLabelsfrm.SetDelivery(const Value: integer);
begin
  FDelivery := Value;
end;

procedure TSTRSLabelsfrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
  DeliveryDateEdit.text := DeliveryDate;
end;

procedure TSTRSLabelsfrm.SetDescription(const Value: string);
begin
  FDescription := Value;
  DescrLbl.caption := Description;
end;

procedure TSTRSLabelsfrm.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TSTRSLabelsfrm.SetPONumber(const Value: real);
begin
  FPONumber := Value;
  POGroupBox.Caption := POGroupBox.Caption + ' ' + floattostr(PONumber);
end;

procedure TSTRSLabelsfrm.SetQuantity(const Value: string);
begin
  FQuantity := Value;
end;

procedure TSTRSLabelsfrm.EnableOK;
begin
//  if (BoxQuantityEdit.Text = '') then exit;

  {Try and convert the Box Quantity to an integer
  if fails then exception throws it out}
  try
    strtoint(BoxQuantityEdit.Text);
  except
    if (BoxQuantityEdit.Text <> '') then exit;
  end;

  PreviewBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  PrintBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
//  SetupBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
end;

procedure TSTRSLabelsfrm.FormShow(Sender: TObject);
begin
  enableok;
end;

procedure TSTRSLabelsfrm.PrintReport;
var
  iCount: integer;
begin
  iSelCode := dmIntSel.GetNextDbKey;
  try
    if not bLineUp then
    begin
      iLastBox := StrToInt(startboxspinedit.Text) +
        StrToInt(NoofBoxesSpinEdit.Text) - 1;
      for icount := StrToInt(startboxspinedit.Text) to iLastBox do
        dmIntSel.AddWithKey(iSelCode, iCount, ilastbox, 0, 0, '', selcode);
    end;
    CallPrinter;
  finally
  dmIntSel.DeleteRecord(iSelCode);
  end; 
end;

procedure TSTRSLabelsfrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  bLineUp := false;
  PrintReport;
end;

procedure TSTRSLabelsfrm.SetupBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

function TSTRSLabelsfrm.RecordsExist: Boolean;
begin
end;

procedure TSTRSLabelsfrm.CallPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  STRPBxLabelsFrm := TSTRPBxLabelsFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;

    if not FPrinted and not Preview then
      begin
      {Find the default printer in the list of printers }
      Printers.Printer.PrinterIndex := -1;
      for icount := 0 to pred(Printer.Printers.count) do
        begin
          if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
            Printers.Printer.PrinterIndex := icount;
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
      STRPBxLabelsFrm.PrinterSettings := PrinterSettings;
      STRPBxLabelsFrm.iIntSel := iSelCode;
      if not bLineUp then
      begin
        STRPBxLabelsFrm.selcode := selcode;
        try
          STRPBxLabelsFrm.iBoxQuantity := StrToInt(trim(BoxQuantityEdit.Text));
        except
          STRPBxLabelsFrm.iBoxQuantity := 0;
        end;

        try
          STRPBxLabelsFrm.iSets := StrToInt(trim(SetsEdit.Text));
        except
          STRPBxLabelsFrm.iSets := 1;
        end;
        STRPBxLabelsFrm.sNumberFrom := FromEdit.Text;
        STRPBxLabelsFrm.sPrefix := PrefixEdit.Text;
        STRPBxLabelsFrm.DeliveryDatelbl.caption := DeliveryDateEdit.text;
      end
      else
      begin
        STRPBxLabelsFrm.bLineup := blineup;
        STRPBxLabelsFrm.iBoxQuantity := 99999;
        STRPBxLabelsFrm.sNumberFrom := '1';
        STRPBxLabelsFrm.sPrefix := 'AAAA';
      end;
      {Actually print or preview the report}
      STRPBxLabelsFrm.Preview := Preview;
      if (not bLineUp) and (STRPBxLabelsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('no labels to print ', mtError, [mbAbort], 0);
        Exit;
      end;
      if Preview then
        STRPBxLabelsFrm.STLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            STRPBxLabelsFrm.STLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        STRPBxLabelsFrm.STLabelsQuickReport.Print;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    STRPBxLabelsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSLabelsfrm.FormCreate(Sender: TObject);
begin
  FPrinted := false;
  GetDefaultPrinter;
  deliverydateedit.Text := Datetostr(date);
  dmIntSel := TdmIntSel.Create(Self);
end;

procedure TSTRSLabelsfrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  icount: integer;
  TempArray: array[0..255] of Char;
  sBin, sPaper: string;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Product Label Printer', '', TempArray,
    sizeof(TempArray), 'Brokerstk.ini');

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Product Label Printer Bin', '', TempArray,
    sizeof(TempArray), 'Brokerstk.ini');

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

  GetPrivateProfileString('Centrereed Broker', 'Product Label Printer Paper', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);
  sPaper := TempArray;
  try
    DefaultPaper := strtoint(sPaper);
  except
    DefaultPaper := 9;
  end;

(*  {Find the default printer in the list of printers }
  Printers.Printer.PrinterIndex := -1;
  for icount := 0 to pred(Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
        Printers.Printer.PrinterIndex := icount;
    end;
  if DefaultPrinter <> '' then
    begin
      SetPrinterBin(TempArray,DefaultBin);
      SetPrinterPaper(TempArray,DefaultPaper);
    end;
*)
end;

function TSTRSLabelsfrm.GetBinSelection: integer;
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

function TSTRSLabelsfrm.GetPaperSelection: integer;
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

procedure TSTRSLabelsfrm.SetPrinterBin(BinCode : integer );
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

procedure TSTRSLabelsfrm.SetPrinterPaper(PaperCode : integer );
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

procedure TSTRSLabelsfrm.BitBtn1Click(Sender: TObject);
var
  ilineup: Integer;
begin
  {Repeat the printing of the invoice lineup until the user selects No}
  repeat
    ilineup := MessageDlg('Would you like to print a Stationary Template?',
      mtConfirmation, mbOkCancel, 0);
    if ilineup = mrOK then
    begin
      {Print the Invoice lineup}
      bLineup := True;
      Preview := False;
      PrintReport;
    end
  until (ilineup <> mrOK);
end;

procedure TSTRSLabelsfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TSTRSLabelsfrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('Brokerstk.ini');

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Product Label Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Product Label Printer Bin',inttostr(DefaultBin));
      WriteString('Centrereed Broker', 'Product Label Printer Paper',inttostr(DefaultPaper));
      Free;
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TSTRSLabelsfrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TSTRSLabelsfrm.BoxQuantityEditKeyPress(Sender: TObject;
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

procedure TSTRSLabelsfrm.BoxQuantityEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  enableok;
end;

procedure TSTRSLabelsfrm.BitBtn2Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DeliveryDateEdit.text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      DeliveryDateEdit.Text := DateToStr(DateSelV5Form.Date);
      EnableOK;
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TSTRSLabelsfrm.DeliveryDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  {Don't check if blank}
  if DeliveryDateEdit.text = '' then exit;

  try
    NewDate := StrToDate(DeliveryDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DeliveryDateEdit.SetFocus;
      Exit;
    end;
  end;

//  DeliveryDateEdit.Text := STDatestr(NewDate);
end;

procedure TSTRSLabelsfrm.DeliveryDateEditChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TSTRSLabelsfrm.SetNoOfSets(const Value: string);
begin
  FNoOfSets := Value;
end;

procedure TSTRSLabelsfrm.SetNoOfBoxes(const Value: integer);
begin
  FNoOfBoxes := Value;
  NoOfBoxesSpinEdit.Value := FNoOfBoxes;
end;

procedure TSTRSLabelsfrm.PrintBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
//  PrintSetup := False;
  PrintSetup := True;
  PrintReport;
end;

procedure TSTRSLabelsfrm.SetStocked(const Value: string);
begin
  FStocked := Value;
end;

procedure TSTRSLabelsfrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TSTRSLabelsfrm.SetDefaultPaper(const Value: integer);
begin
  FDefaultPaper := Value;
end;

procedure TSTRSLabelsfrm.setselcode(const Value: string);
begin
  fselcode := Value;
end;

procedure TSTRSLabelsfrm.setselname(const Value: string);
begin
  fselname := Value;
end;

procedure TSTRSLabelsfrm.FormActivate(Sender: TObject);
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
  end;
end;

procedure TSTRSLabelsfrm.FormDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

end.
