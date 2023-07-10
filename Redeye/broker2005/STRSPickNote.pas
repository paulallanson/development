unit STRSPickNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, STSOObjects, IniFiles, CCSPrint;

type
  TSTRSPickNotefrm = class(TForm)
    OrderGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    OrderDatelbl: TLabel;
    CustomerLbl: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    CancelBitBtn: TBitBtn;
    Previewbitbtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    SetupBitBtn: TBitBtn;
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure Runreport(Preview: ByteBool);
    procedure FormCreate(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure DeliveryDateEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDefaultPrinter: string;
    FDefaultBin: integer;
    procedure SetDefaultBin(const Value: integer);
    function GetBinSelection: integer;
  private
    FIntSelCode: integer;
    FSONumber: integer;
    FDateRequired: TDateTime;
    procedure SetSONumber(const Value: integer);
    procedure GetSelection;
    procedure SetDateRequired(const Value: TDateTime);
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetDefaultPrinter(const Value: string);
    procedure SetPrinterBin(BinCode: integer);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    FPrinted: boolean;
    Reprint: ByteBool;
    bOK: ByteBool;
    PrintSetup: boolean;
    property SONumber: integer read FSONumber write SetSONumber;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
  end;

var
  STRSPickNotefrm: TSTRSPickNotefrm;

implementation

uses STRPPick, printers, pbDatabase, dateselv5, pbMainMenu;

{$R *.DFM}

procedure TSTRSPickNotefrm.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
end;

procedure TSTRSPickNotefrm.PreviewbitbtnClick(Sender: TObject);
begin
  RunReport(True);
end;

procedure TSTRSPickNotefrm.Runreport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  GetSelection;
  STRPPickFrm := TSTRPPickFrm.Create(Self);
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
          SetPrinterBin(DefaultBin);
        end;
      FPrinted := true;
      end;
    try
      STRPPickFrm.iIntSelCode := fIntSelCode ;
      STRPPickFrm.sDespDt := DeliveryDateEdit.Text;
      STRPPickFrm.Preview := Preview;
      STRPPickFrm.DateReq := DateRequired;
      STRPPickFrm.Reprint := Reprint;
      STRPPickFrm.SalesOrder := 99;
//      STRPPickFrm.PrinterSettings := PrinterSettings;
      if STRPPickFrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        end
      else
        begin
          if preview then
            STRPPickFrm.PickSoListQuickReport.Preview
          else
          if Printsetup then
          begin
            if setupPrinter(PrinterSettings) then
              begin
                STRPPickFrm.PickSoListQuickReport.Print;
                DefaultPrinter := printer.Printers[printer.printerindex];
                DefaultBin := GetBinSelection;
              end;
          end
        else
        STRPPickFrm.PickSoListQuickReport.Print;
      end;
    finally
      printer.printerindex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    STRPPickFrm.Free;
    dmBroker.DelIntSelCode(fIntselCode, True);
  end;
end;

procedure TSTRSPickNotefrm.FormCreate(Sender: TObject);
begin
  fIntSelCode := dmBroker.GetNextIntSelCode(Self);
  bOK := false;
  GetDefaultPrinter;
end;

procedure TSTRSPickNotefrm.GetSelection;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dmBroker.DelIntSelCode(fIntSelCode, True);

 	with dmBroker.AddIntSelQuery do
    begin
      Close;
      ParamByName('Int_sel_Code').AsInteger := FIntselCode;
      ParamByName('Sel1').AsFloat := SONumber;
      ParamByName('Text100').AsString := inttostr(SONumber);
      execSQL;
    end;
end;

procedure TSTRSPickNotefrm.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TSTRSPickNotefrm.PrintBitBtnClick(Sender: TObject);
begin
  Printsetup := False;
  RunReport(False);
  bOK := true;
  close;
end;

procedure TSTRSPickNotefrm.SetupBitBtnClick(Sender: TObject);
begin
  PrintSetup := True;
  RunReport(false);
  bOK := true;
  close;
end;

procedure TSTRSPickNotefrm.BitBtn2Click(Sender: TObject);
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
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TSTRSPickNotefrm.DeliveryDateEditExit(Sender: TObject);
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

procedure TSTRSPickNotefrm.DeliveryDateEditChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TSTRSPickNotefrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  PreviewBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  PrintBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  SetupBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
end;

procedure TSTRSPickNotefrm.SetPrinterBin(BinCode : integer );
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

function TSTRSPickNotefrm.GetBinSelection: integer;
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

procedure TSTRSPickNotefrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  sBin: string;
  icount: integer;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Picking Note Printer', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

(*  {Find the default printer in the list of printers }
  Printer.PrinterIndex := -1;
  for icount := 0 to pred(Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
        Printer.PrinterIndex := icount;
    end;
*)
  GetPrivateProfileString('Centrereed Broker', 'Picking Note Bin', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

end;

procedure TSTRSPickNotefrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Picking Note Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Picking Note Bin',inttostr(DefaultBin));
      Free;
    end;

  printer.printerindex := -1;
end;

procedure TSTRSPickNotefrm.SetDefaultPrinter(const Value: string);
begin
 FDefaultPrinter := Value;
end;

procedure TSTRSPickNotefrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
SaveDefaultPrinter;
end;

procedure TSTRSPickNotefrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

end.
