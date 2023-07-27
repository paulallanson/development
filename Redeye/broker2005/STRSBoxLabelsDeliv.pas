unit STRSBoxLabelsDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Spin, StdCtrls, Buttons, IniFiles, ccsCommon, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSBoxLabelsDelivFrm = class(TForm)
    POGroupBox: TGroupBox;
    Label1: TLabel;
    lblCustomer: TLabel;
    lblDeliveryto: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    Label5: TLabel;
    spnNoBoxes: TSpinEdit;
    Label4: TLabel;
    spnStartBox: TSpinEdit;
    Label3: TLabel;
    lblSalesOrder: TLabel;
    lblOrderDate: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblCustomerRef: TLabel;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    dblkpLogos: TDBLookupComboBox;
    FormRefClrBitBtn: TBitBtn;
    qryLogos: TFDQuery;
    dtsLogos: TDataSource;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure DeliveryDateEditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
  private
    FDefaultPaper: integer;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPaper(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure EnableOK;
  private
    FPrinted: boolean;
    Preview: ByteBool;
    blineup: boolean;
    PrintSetup: boolean;
    iselcode: integer;
    FSONumber: integer;
    procedure SetSONumber(const Value: integer);
    procedure PrintReport;
    procedure CallPrinter;
    function GetBinSelection: integer;
    procedure GetDefaultPrinter;
    function GetPaperSelection: integer;
    procedure SetPrinterBin(BinCode: integer);
    procedure SetPrinterPaper(PaperCode: integer);
    procedure SaveDefaultPrinter;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultPaper: integer read FDefaultPaper write SetDefaultPaper;
  public
    property SONumber: integer read FSONumber write SetSONumber;
  end;

var
  STRSBoxLabelsDelivFrm: TSTRSBoxLabelsDelivFrm;

implementation

uses STRPLabelsDeliv, printers, CCSPrint, DateSelV5, PBIntSelDM,
  pbMainMenu;

{$R *.DFM}

{ TSTRSBoxLabelsDelivFrm }

procedure TSTRSBoxLabelsDelivFrm.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
  lblSalesOrder.caption := inttostr(FSONumber);
end;

procedure TSTRSBoxLabelsDelivFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  bLineUp := false;
  PrintReport;
end;

procedure TSTRSBoxLabelsDelivFrm.PrintBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

procedure TSTRSBoxLabelsDelivfrm.PrintReport;
var
  iCount, ibox : integer;
begin
  iSelCode := dmIntSel.GetNextDbKey;
  try
    if (not bLineUp) then
    begin
      for ibox := spnStartBox.value to spnNoBoxes.value do
        dmIntSel.AddWithKey(iSelCode, 1, SONumber,1,ibox, '', inttostr(spnNoBoxes.value));
    end;
    CallPrinter;
  finally
    dmIntSel.DeleteRecord(iSelCode);
  end;
//  close;
end;

procedure TSTRSBoxLabelsDelivfrm.CallPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  STRPLabelsDelivFrm := TSTRPLabelsDelivFrm.Create(Self);
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
      STRPLabelsDelivFrm.PrinterSettings := PrinterSettings;
      STRPLabelsDelivFrm.iIntSel := iSelCode;
      if not bLineUp then
      begin
        STRPLabelsDelivFrm.iSONumber := SONumber;
        STRPLabelsDelivFrm.DeliveryDatelbl.caption := DeliveryDateEdit.text;

        if dblkpLogos.KeyValue >= 0 then
          STRPLabelsDelivFrm.logoPath := qryLogos.fieldbyname('Logo_Path').asstring
        else
          STRPLabelsDelivFrm.logoPath := '';
      end
      else
      begin
        STRPLabelsDelivFrm.bLineup := blineup;
        STRPLabelsDelivFrm.iSONumber := 0;
        STRPLabelsDelivFrm.iBoxQuantity := 99999;
        STRPLabelsDelivFrm.sNumberFrom := '1';
        STRPLabelsDelivFrm.sPrefix := 'AAAA';
      end;
      STRPLabelsDelivFrm.Preview := Preview;
      if (not bLineUp) and (STRPLabelsDelivFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Delivery Details do not exist ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        STRPLabelsDelivFrm.STLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            STRPLabelsDelivFrm.STLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        STRPLabelsDelivFrm.STLabelsQuickReport.Print;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      {Set back to the default printer}
      PrinterSettings.Free;
    end;
  finally
    STRPLabelsDelivFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSBoxLabelsDelivfrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  icount: integer;
  TempArray: array[0..255] of Char;
  sBin, sPaper: string;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Label Printer', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

  GetPrivateProfileString('Centrereed Broker', 'Label Printer Paper', '', TempArray,
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
*)
end;

function TSTRSBoxLabelsDelivfrm.GetBinSelection: integer;
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

function TSTRSBoxLabelsDelivfrm.GetPaperSelection: integer;
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

procedure TSTRSBoxLabelsDelivfrm.SetPrinterBin(BinCode : integer );
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

procedure TSTRSBoxLabelsDelivfrm.SetPrinterPaper(PaperCode : integer );
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

procedure TSTRSBoxLabelsDelivfrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Label Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Label Printer Bin',inttostr(DefaultBin));
      WriteString('Centrereed Broker', 'Label Printer Paper',inttostr(DefaultPaper));
      Free;
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TSTRSBoxLabelsDelivFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TSTRSBoxLabelsDelivFrm.SetDefaultPaper(const Value: integer);
begin
  FDefaultPaper := Value;
end;

procedure TSTRSBoxLabelsDelivFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TSTRSBoxLabelsDelivfrm.EnableOK;
begin
  PreviewBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  PrintBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
//  SetupBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
end;
procedure TSTRSBoxLabelsDelivFrm.FormShow(Sender: TObject);
begin
  enableok;
end;

procedure TSTRSBoxLabelsDelivFrm.FormCreate(Sender: TObject);
begin
  dmIntSel := TdmIntSel.Create(Self);
  FPrinted := false;
  GetDefaultPrinter;
end;

procedure TSTRSBoxLabelsDelivFrm.FormDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

procedure TSTRSBoxLabelsDelivFrm.BitBtn2Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DeliveryDateEdit.Text);
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

procedure TSTRSBoxLabelsDelivFrm.DeliveryDateEditExit(Sender: TObject);
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

  DeliveryDateEdit.Text := PBDatestr(NewDate);
end;

procedure TSTRSBoxLabelsDelivFrm.DeliveryDateEditChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TSTRSBoxLabelsDelivFrm.FormActivate(Sender: TObject);
begin
  with qryLogos do
    begin
      close;
      open;
    end;
end;

procedure TSTRSBoxLabelsDelivFrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  dblkpLogos.KeyValue := -1;
end;

end.
