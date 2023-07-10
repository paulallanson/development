unit PBRSJobBagBoxLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db, DBTables, IniFiles, PBPOObjects, printers, Winspool, ComCtrls;

type
  TPBRSJobBagBoxLabelsfrm = class(TForm)
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
    Label7: TLabel;
    QtyLbl: TLabel;
    CountSQL: TQuery;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    PrintBitBtn: TBitBtn;
    GroupBox4: TGroupBox;
    chkAddressOnly: TCheckBox;
    rdbtnCustAddr: TRadioButton;
    rdbtnDelAddr: TRadioButton;
    Label11: TLabel;
    cmbFormat: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BoxQuantityEditKeyPress(Sender: TObject; var Key: Char);
    procedure BoxQuantityEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure DeliveryDateEditChange(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbFormatChange(Sender: TObject);
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
    FJobBag: integer;
    procedure SetBoxQuantity(const Value: string);
    procedure SetCustName(const Value: string);
    procedure SetDelivery(const Value: integer);
    procedure SetDeliveryDate(const Value: string);
    procedure SetDescription(const Value: string);
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
    procedure SetJobBag(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property CustName: string read FCustName write SetCustName;
    property Description: string read FDescription write SetDescription;
    property Quantity: string read FQuantity write SetQuantity;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    property Delivery: integer read FDelivery write SetDelivery;
    property BoxQuantity: string read FBoxQuantity write SetBoxQuantity;
    property JobBag: integer read FJobBag write SetJobBag;
    property NoOfSets: string read FNoOfSets write SetNoOfSets;
    property NoOfBoxes: integer read FNoOfBoxes write SetNoOfBoxes;
    property Stocked: string read FStocked write SetStocked;
  private
    sFormat: string;
    FPrinted: boolean;
    Preview: ByteBool;
    PrintSetup: boolean;
    iselcode,
    iLastBox: Integer;
    function  RecordsExist : Boolean;
    procedure CallPrinter;
    procedure CallReelPrinter;
    procedure PrintReport;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultPaper: integer read FDefaultPaper write SetDefaultPaper;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  end;

var
  PBRSJobBagBoxLabelsfrm: TPBRSJobBagBoxLabelsfrm;

implementation

uses PBIntSelDM, PBRPLabels, CCSPrint, DateSelV5, PBRPLabelsReels,
  pbMainMenu, PBRPJobBagLabels, PBRPJobBagLabelsReels;

{$R *.DFM}

{ TPBRSBoxLabelsfrm }

procedure TPBRSJobBagBoxLabelsfrm.SetBoxQuantity(const Value: string);
begin
  FBoxQuantity := Value;
  BoxQuantityEdit.text := FBoxQuantity;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetCustName(const Value: string);
begin
  FCustName := Value;
  CustomerLbl.caption := CustName;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetDelivery(const Value: integer);
begin
  FDelivery := Value;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
  DeliveryDateEdit.text := DeliveryDate;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetDescription(const Value: string);
begin
  FDescription := Value;
  DescrLbl.caption := Description;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetQuantity(const Value: string);
begin
  FQuantity := Value;
  QtyLbl.caption := Quantity;
end;

procedure TPBRSJobBagBoxLabelsfrm.EnableOK;
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

procedure TPBRSJobBagBoxLabelsfrm.FormShow(Sender: TObject);
begin
  enableok;
end;

procedure TPBRSJobBagBoxLabelsfrm.PrintReport;
var
  iCount : integer;
begin
  iSelCode := dmIntSel.GetNextDbKey;
  try
    begin
      iLastBox := StrToInt(startboxspinedit.Text) +
        StrToInt(NoofBoxesSpinEdit.Text) - 1;
      for icount := StrToInt(startboxspinedit.Text) to iLastBox do
        dmIntSel.AddWithKey(iSelCode, iCount, JobBag, Delivery, 0, '', '');
      if not RecordsExist then
      begin
        MessageDlg('Delivery Details do not exist ', mtError, [mbAbort], 0);
        Exit;
      end;
    end;
    if sFormat = 'Reels' then
      CallReelPrinter
    else
      CallPrinter;
  finally
    dmIntSel.DeleteRecord(iSelCode);
  end;
end;

procedure TPBRSJobBagBoxLabelsfrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetupBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

function TPBRSJobBagBoxLabelsfrm.RecordsExist: Boolean;
begin
  with CountSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iSelCode;
    Open;
    Result := RecordCount > 0;
    Close;
  end;
end;

procedure TPBRSJobBagBoxLabelsfrm.CallPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  PBRPJobBagLabelsFrm := TPBRPJobBagLabelsFrm.Create(Self);
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
//      PBRPJobBagLabelsFrm.PrinterSettings := PrinterSettings;
      PBRPJobBagLabelsFrm.iIntSel := iSelCode;

      PBRPJobBagLabelsFrm.JobBag := JobBag;
      try
        PBRPJobBagLabelsFrm.iBoxQuantity := StrToInt(trim(BoxQuantityEdit.Text));
      except
        PBRPJobBagLabelsFrm.iBoxQuantity := 0;
      end;

      PBRPJobBagLabelsFrm.sNumberFrom := FromEdit.Text;
      PBRPJobBagLabelsFrm.sPrefix := PrefixEdit.Text;
      PBRPJobBagLabelsFrm.DeliveryDatelbl.caption := DeliveryDateEdit.text;
      PBRPJobBagLabelsFrm.bAddressOnly := chkAddressOnly.checked;
      PBRPJobBagLabelsFrm.bStocked := Stocked;
      PBRPJobBagLabelsFrm.useCustAddress := (rdbtnCustAddr.checked);

      PBRPJobBagLabelsFrm.Preview := Preview;
      if (PBRPJobBagLabelsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Delivery Details do not exist ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        PBRPJobBagLabelsFrm.PBLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            PBRPJobBagLabelsFrm.PBLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        PBRPJobBagLabelsFrm.PBLabelsQuickReport.Print;
    finally
      printer.printerindex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    PBRPJobBagLabelsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TPBRSJobBagBoxLabelsfrm.CallReelPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  PBRPJobBagLabelsReelsFrm := TPBRPJobBagLabelsReelsFrm.Create(Self);
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
//      PBRPJobBagLabelsReelsFrm.PrinterSettings := PrinterSettings;
      PBRPJobBagLabelsReelsFrm.iIntSel := iSelCode;

      PBRPJobBagLabelsReelsFrm.JobBag := JobBag;
      try
        PBRPJobBagLabelsReelsFrm.iBoxQuantity := StrToInt(trim(BoxQuantityEdit.Text));
      except
        PBRPJobBagLabelsReelsFrm.iBoxQuantity := 0;
      end;

      PBRPJobBagLabelsReelsFrm.sNumberFrom := FromEdit.Text;
      PBRPJobBagLabelsReelsFrm.sPrefix := PrefixEdit.Text;
      PBRPJobBagLabelsReelsFrm.DeliveryDatelbl.caption := DeliveryDateEdit.text;
      PBRPJobBagLabelsReelsFrm.bAddressOnly := chkAddressOnly.checked;
      PBRPJobBagLabelsReelsFrm.bStocked := Stocked;
      PBRPJobBagLabelsReelsFrm.useCustAddress := (rdbtnCustAddr.checked);

      PBRPJobBagLabelsReelsFrm.Preview := Preview;
      if (PBRPJobBagLabelsReelsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Delivery Details do not exist ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        PBRPJobBagLabelsReelsFrm.PBLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            PBRPJobBagLabelsReelsFrm.PBLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        PBRPJobBagLabelsReelsFrm.PBLabelsQuickReport.Print;
    finally
      printer.printerindex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    PBRPJobBagLabelsReelsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TPBRSJobBagBoxLabelsfrm.FormCreate(Sender: TObject);
begin
  dmIntSel := TdmIntSel.Create(Self);
  FPrinted := false;
  GetDefaultPrinter;
end;

procedure TPBRSJobBagBoxLabelsfrm.FormDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

procedure TPBRSJobBagBoxLabelsfrm.GetDefaultPrinter;
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

  GetPrivateProfileString('Centrereed Broker', 'Label Printer Bin', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

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

  GetPrivateProfileString('Centrereed Broker', 'Label Printer Format', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);
  sFormat := TempArray;

(*  {Find the default printer in the list of printers }
  Printer.PrinterIndex := -1;
  for icount := 0 to pred(Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
        Printer.PrinterIndex := icount;
    end;
  if DefaultPrinter <> '' then
    begin
      SetPrinterBin(TempArray,DefaultBin);
      SetPrinterPaper(TempArray,DefaultPaper);
    end;
*)
end;

function TPBRSJobBagBoxLabelsfrm.GetBinSelection: integer;
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

function TPBRSJobBagBoxLabelsfrm.GetPaperSelection: integer;
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

procedure TPBRSJobBagBoxLabelsfrm.SetPrinterBin(BinCode : integer );
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

procedure TPBRSJobBagBoxLabelsfrm.SetPrinterPaper(PaperCode : integer );
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

procedure TPBRSJobBagBoxLabelsfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TPBRSJobBagBoxLabelsfrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Label Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Label Printer Bin',inttostr(DefaultBin));
      WriteString('Centrereed Broker', 'Label Printer Paper',inttostr(DefaultPaper));
      WriteString('Centrereed Broker', 'Label Printer Format',sFormat);
      Free;
    end;

  printer.printerindex := -1;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBRSJobBagBoxLabelsfrm.BoxQuantityEditKeyPress(Sender: TObject;
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

procedure TPBRSJobBagBoxLabelsfrm.BoxQuantityEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  enableok;
end;

procedure TPBRSJobBagBoxLabelsfrm.BitBtn2Click(Sender: TObject);
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

procedure TPBRSJobBagBoxLabelsfrm.DeliveryDateEditExit(Sender: TObject);
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

procedure TPBRSJobBagBoxLabelsfrm.DeliveryDateEditChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetNoOfSets(const Value: string);
begin
  FNoOfSets := Value;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetNoOfBoxes(const Value: integer);
begin
  FNoOfBoxes := Value;
  NoOfBoxesSpinEdit.Value := FNoOfBoxes;
end;

procedure TPBRSJobBagBoxLabelsfrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
//  PrintSetup := False;
  PrintSetup := True;
  PrintReport;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetStocked(const Value: string);
begin
  FStocked := Value;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetDefaultPaper(const Value: integer);
begin
  FDefaultPaper := Value;
end;

procedure TPBRSJobBagBoxLabelsfrm.FormActivate(Sender: TObject);
begin
  cmbFormat.itemindex := cmbFormat.Items.IndexOf(sFormat);
end;

procedure TPBRSJobBagBoxLabelsfrm.cmbFormatChange(Sender: TObject);
begin
  sFormat := cmbFormat.Text;
end;

procedure TPBRSJobBagBoxLabelsfrm.SetJobBag(const Value: integer);
begin
  FJobBag := Value;
end;

end.
