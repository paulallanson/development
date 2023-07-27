unit PBRSJobBagDelivNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CCSPrint, PBPOObjects, Db, Inifiles;

type
  TPBRSJobBagDelivNoteFrm = class(TForm)
    CancelBitBtn: TBitBtn;
    Previewbitbtn: TBitBtn;
    SetupBitBtn: TBitBtn;
    OrderGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DescrLbl: TLabel;
    CustomerLbl: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    QtyEdit: TEdit;
    PrintBitBtn: TBitBtn;
    chkbxPrintLogo: TCheckBox;
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DeliveryDateEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDeliveryDate: string;
    FDescription: string;
    FCustName: string;
    FQuantity: string;
    FDelivery: integer;
    FActualDeliveryDate: string;
    FbOK: boolean;
    FDefaultPrinter: string;
    FDefaultBin: integer;
    FJobBag: integer;
    procedure SetCustName(const Value: string);
    procedure SetDeliveryDate(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetQuantity(const Value: string);
    procedure SetDelivery(const Value: integer);
    procedure PrintDeliveryNotes(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure SetActualDeliveryDate(const Value: string);
    procedure SetbOK(const Value: boolean);
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetDefaultPrinter(const Value: string);
    function GetBinSelection: integer;
    procedure SetDefaultBin(const Value: integer);
    procedure SetPrinterBin(BinCode: integer);
    procedure SetJobBag(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property ActualDeliveryDate: string read FActualDeliveryDate write SetActualDeliveryDate;
    property bOK: boolean read FbOK write SetbOK;
    property CustName: string read FCustName write SetCustName;
    property Description: string read FDescription write SetDescription;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    property Delivery: integer read FDelivery write SetDelivery;
    property JobBag: integer read FJobBag write SetJobBag;
    property Quantity: string read FQuantity write SetQuantity;
  private
    FPrinted: boolean;
    Preview: ByteBool;
    PrintSetup: boolean;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  end;

var
  PBRSJobBagDelivNoteFrm: TPBRSJobBagDelivNoteFrm;

implementation

uses PBLUDeliveriesDM, printers, dateselv5, pbMainMenu, PBRPJobBagDelivNote;

{$R *.DFM}

{ TPBRSDelivNoteFrm }

procedure TPBRSJobBagDelivNoteFrm.SetCustName(const Value: string);
begin
  FCustName := Value;
  CustomerLbl.caption := CustName;
end;

procedure TPBRSJobBagDelivNoteFrm.SetDelivery(const Value: integer);
begin
  FDelivery := Value;
end;

procedure TPBRSJobBagDelivNoteFrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
  DeliveryDateEdit.text := DeliveryDate;
end;

procedure TPBRSJobBagDelivNoteFrm.SetDescription(const Value: string);
begin
  FDescription := Value;
  DescrLbl.caption := Description;
end;

procedure TPBRSJobBagDelivNoteFrm.SetQuantity(const Value: string);
begin
  FQuantity := Value;
  QtyEdit.text := Quantity;
end;

procedure TPBRSJobBagDelivNoteFrm.PrintDeliveryNotes(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  PBRPJobBagDelivNoteFrm := TPBRPJobBagDelivNoteFrm.Create(Self);
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
          SetPrinterBin(DefaultBin);
        end;
      FPrinted := true;
      end;
    try
      PBRPJobBagDelivNoteFrm.Preview := Preview;
      PBRPJobBagDelivNoteFrm.bPrintLogo := chkbxPrintLogo.checked;
      PBRPJobBagDelivNoteFrm.PrinterSettings := PrinterSettings;

      PBRPJobBagDelivNoteFrm.JobBag := JobBag;
      PBRPJobBagDelivNoteFrm.DelLine := Delivery;

      if (PBRPJobBagDelivNoteFrm.GetDetails(Self) = 0) then
        {Record count is zero - nothing to print}
        MessageDlg('There are no Delivery Notes to print', mtError, [mbAbort],
          0)
      else
        begin
        {Set the Delivery Date}
        PBRPJobBagDelivNoteFrm.DeliveryDate := DeliveryDateEdit.text;
        {Actually print or preview the report}
        if Preview then
          PBRPJobBagDelivNoteFrm.JBDelivQuickReport.Preview
        else
        if PrintSetup then
          begin
            if SetUpPrinter(PrinterSettings) then
              begin
                {Set all the printer defaults}
                PBRPJobBagDelivNoteFrm.JBDelivQuickReport.Print;
                DefaultPrinter := printer.Printers[printer.printerindex];
                DefaultBin := GetBinSelection;
              end;
          end
        else
          PBRPJobBagDelivNoteFrm.JBDelivQuickReport.Print;
        end;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPJobBagDelivNoteFrm.Free;
  end;
end;

procedure TPBRSJobBagDelivNoteFrm.PreviewbitbtnClick(Sender: TObject);
begin
  Preview := True;
  PrintDeliveryNotes(Self);
end;

procedure TPBRSJobBagDelivNoteFrm.SetupBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintSetup := True;
  PrintDeliveryNotes(Self);

  bOK := true;
  close;
end;

procedure TPBRSJobBagDelivNoteFrm.FormActivate(Sender: TObject);
begin
  OrderGroupBox.caption := OrderGroupBox.caption + inttostr(JobBag);
end;

procedure TPBRSJobBagDelivNoteFrm.DeliveryDateEditExit(Sender: TObject);
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

procedure TPBRSJobBagDelivNoteFrm.BitBtn2Click(Sender: TObject);
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

procedure TPBRSJobBagDelivNoteFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  PreviewBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  PrintBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  SetupBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
end;

procedure TPBRSJobBagDelivNoteFrm.DeliveryDateEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBRSJobBagDelivNoteFrm.SetActualDeliveryDate(const Value: string);
begin
  FActualDeliveryDate := Value;
end;

procedure TPBRSJobBagDelivNoteFrm.SetbOK(const Value: boolean);
begin
  FbOK := Value;
end;

procedure TPBRSJobBagDelivNoteFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    chkbxPrintLogo.Checked := IniFile.ReadString('Redeye', 'Delivery Note - Print Logo', 'N') = 'Y';
  finally
    IniFile.Free;
  end;

  GetDefaultPrinter;
end;

procedure TPBRSJobBagDelivNoteFrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  sBin: string;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Delivery Note Printer', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Delivery Note Bin', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

end;

procedure TPBRSJobBagDelivNoteFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TPBRSJobBagDelivNoteFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    WriteString('Centrereed Broker', 'Delivery Note Printer',DefaultPrinter);
    WriteString('Centrereed Broker', 'Delivery Note Bin',inttostr(DefaultBin));
  finally
    IniFile.Free;
  end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSJobBagDelivNoteFrm.SetPrinterBin(BinCode : integer );
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

function TPBRSJobBagDelivNoteFrm.GetBinSelection: integer;
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

procedure TPBRSJobBagDelivNoteFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBRSJobBagDelivNoteFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintSetup := False;
  PrintDeliveryNotes(Self);

  bOK := true;
  close;
end;

procedure TPBRSJobBagDelivNoteFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSJobBagDelivNoteFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    if chkbxPrintLogo.checked then
      WriteString('Redeye', 'Delivery Note - Print Logo', 'Y')
    else
      WriteString('Redeye', 'Delivery Note - Print Logo', 'N');
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSJobBagDelivNoteFrm.SetJobBag(const Value: integer);
begin
  FJobBag := Value;
end;

end.
