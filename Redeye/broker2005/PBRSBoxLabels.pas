unit PBRSBoxLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db, IniFiles, PBPOObjects, printers, Winspool, ComCtrls,
  DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSBoxLabelsfrm = class(TForm)
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
    CountSQL: TFDQuery;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    SetsEdit: TEdit;
    Label10: TLabel;
    PrintBitBtn: TBitBtn;
    GroupBox4: TGroupBox;
    chkAddressOnly: TCheckBox;
    rdbtnCustAddr: TRadioButton;
    rdbtnDelAddr: TRadioButton;
    Label11: TLabel;
    cmbFormat: TComboBox;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    qryLogos: TFDQuery;
    dtsLogos: TDataSource;
    dblkpLogos: TDBLookupComboBox;
    FormRefClrBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
    procedure cmbFormatChange(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
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
  private
    sFormat: string;
    FPrinted: boolean;
    Preview: ByteBool;
    blineup: boolean;
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
  PBRSBoxLabelsfrm: TPBRSBoxLabelsfrm;

implementation

uses
  System.UITypes,
  PBIntSelDM, PBRPLabels, CCSPrint, DateSelV5, PBRPLabelsReels,
  pbMainMenu;

{$R *.DFM}

{ TPBRSBoxLabelsfrm }

procedure TPBRSBoxLabelsfrm.SetBoxQuantity(const Value: string);
begin
  FBoxQuantity := Value;
  BoxQuantityEdit.text := FBoxQuantity;
end;

procedure TPBRSBoxLabelsfrm.SetCustName(const Value: string);
begin
  FCustName := Value;
  CustomerLbl.caption := CustName;
end;

procedure TPBRSBoxLabelsfrm.SetDelivery(const Value: integer);
begin
  FDelivery := Value;
end;

procedure TPBRSBoxLabelsfrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
  DeliveryDateEdit.text := DeliveryDate;
end;

procedure TPBRSBoxLabelsfrm.SetDescription(const Value: string);
begin
  FDescription := Value;
  DescrLbl.caption := Description;
end;

procedure TPBRSBoxLabelsfrm.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TPBRSBoxLabelsfrm.SetPONumber(const Value: real);
begin
  FPONumber := Value;
  POGroupBox.Caption := POGroupBox.Caption + ' ' + floattostr(PONumber);
end;

procedure TPBRSBoxLabelsfrm.SetQuantity(const Value: string);
begin
  FQuantity := Value;
  QtyLbl.caption := Quantity;
end;

procedure TPBRSBoxLabelsfrm.EnableOK;
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

procedure TPBRSBoxLabelsfrm.FormShow(Sender: TObject);
begin
  enableok;
end;

procedure TPBRSBoxLabelsfrm.PrintReport;
var
  iCount : integer;
begin
  iSelCode := dmIntSel.GetNextDbKey;
  try
    if not bLineUp then
    begin
      iLastBox := StrToInt(startboxspinedit.Text) +
        StrToInt(NoofBoxesSpinEdit.Text) - 1;
      for icount := StrToInt(startboxspinedit.Text) to iLastBox do
        dmIntSel.AddWithKey(iSelCode, iCount, PONumber, POLine, Delivery, '', '');
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

procedure TPBRSBoxLabelsfrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  bLineUp := false;
  PrintReport;
end;

procedure TPBRSBoxLabelsfrm.SetupBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

function TPBRSBoxLabelsfrm.RecordsExist: Boolean;
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

procedure TPBRSBoxLabelsfrm.CallPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  PBRPLabelsFrm := TPBRPLabelsFrm.Create(Self);
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
//      PBRPLabelsFrm.PrinterSettings := PrinterSettings;
      PBRPLabelsFrm.iIntSel := iSelCode;
      if not bLineUp then
      begin
        PBRPLabelsFrm.rPONumber := PONumber;
        PBRPLabelsFrm.iLine := POLine;
        try
          PBRPLabelsFrm.iBoxQuantity := StrToInt(trim(BoxQuantityEdit.Text));
        except
          PBRPLabelsFrm.iBoxQuantity := 0;
        end;

        try
          PBRPLabelsFrm.iSets := StrToInt(trim(SetsEdit.Text));
        except
          PBRPLabelsFrm.iSets := 1;
        end;
        PBRPLabelsFrm.sNumberFrom := ShortString(FromEdit.Text);
        PBRPLabelsFrm.sPrefix := ShortString(PrefixEdit.Text);
        PBRPLabelsFrm.DeliveryDatelbl.caption := DeliveryDateEdit.text;
        PBRPLabelsFrm.bAddressOnly := chkAddressOnly.checked;
        PBRPLabelsFrm.bStocked := Stocked;
        if dblkpLogos.KeyValue >= 0 then
          PBRPLabelsFrm.logoPath := qryLogos.fieldbyname('Logo_Path').asstring
        else
          PBRPLabelsFrm.logoPath := '';
          
        PBRPLabelsFrm.useCustAddress := (rdbtnCustAddr.checked);
      end
      else
      begin
        PBRPLabelsFrm.bLineup := blineup;
        PBRPLabelsFrm.rPONumber := 0;
        PBRPLabelsFrm.iLine := 0;
        PBRPLabelsFrm.iBoxQuantity := 99999;
        PBRPLabelsFrm.sNumberFrom := '1';
        PBRPLabelsFrm.sPrefix := 'AAAA';
      end;
      PBRPLabelsFrm.Preview := Preview;
      if (not bLineUp) and (PBRPLabelsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Delivery Details do not exist ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        PBRPLabelsFrm.PBLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            PBRPLabelsFrm.PBLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        PBRPLabelsFrm.PBLabelsQuickReport.Print;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    PBRPLabelsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TPBRSBoxLabelsfrm.CallReelPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  PBRPLabelsReelsFrm := TPBRPLabelsReelsFrm.Create(Self);
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
//      PBRPLabelsReelsFrm.PrinterSettings := PrinterSettings;
      PBRPLabelsReelsFrm.iIntSel := iSelCode;
      if not bLineUp then
      begin
        PBRPLabelsReelsFrm.rPONumber := PONumber;
        PBRPLabelsReelsFrm.iLine := POLine;
        try
          PBRPLabelsReelsFrm.iBoxQuantity := StrToInt(trim(BoxQuantityEdit.Text));
        except
          PBRPLabelsReelsFrm.iBoxQuantity := 0;
        end;

        try
          PBRPLabelsReelsFrm.iSets := StrToInt(trim(SetsEdit.Text));
        except
          PBRPLabelsReelsFrm.iSets := 1;
        end;
        PBRPLabelsReelsFrm.sNumberFrom := ShortString(FromEdit.Text);
        PBRPLabelsReelsFrm.sPrefix := ShortString(PrefixEdit.Text);
        PBRPLabelsReelsFrm.DeliveryDatelbl.caption := DeliveryDateEdit.text;
        PBRPLabelsReelsFrm.bAddressOnly := chkAddressOnly.checked;
        PBRPLabelsReelsFrm.bStocked := Stocked;
        PBRPLabelsReelsFrm.useCustAddress := (rdbtnCustAddr.checked);
      end
      else
      begin
        PBRPLabelsReelsFrm.bLineup := blineup;
        PBRPLabelsReelsFrm.rPONumber := 0;
        PBRPLabelsReelsFrm.iLine := 0;
        PBRPLabelsReelsFrm.iBoxQuantity := 99999;
        PBRPLabelsReelsFrm.sNumberFrom := '1';
        PBRPLabelsReelsFrm.sPrefix := 'AAAA';
      end;
      PBRPLabelsReelsFrm.Preview := Preview;
      if (not bLineUp) and (PBRPLabelsReelsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Delivery Details do not exist ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        PBRPLabelsReelsFrm.PBLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            PBRPLabelsReelsFrm.PBLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        PBRPLabelsReelsFrm.PBLabelsQuickReport.Print;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    PBRPLabelsReelsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TPBRSBoxLabelsfrm.FormCreate(Sender: TObject);
begin
  dmIntSel := TdmIntSel.Create(Self);
  FPrinted := false;
  GetDefaultPrinter;
end;

procedure TPBRSBoxLabelsfrm.FormDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

procedure TPBRSBoxLabelsfrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
//  icount: integer;
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

function TPBRSBoxLabelsfrm.GetBinSelection: integer;
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

function TPBRSBoxLabelsfrm.GetPaperSelection: integer;
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

procedure TPBRSBoxLabelsfrm.SetPrinterBin(BinCode : integer );
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

procedure TPBRSBoxLabelsfrm.SetPrinterPaper(PaperCode : integer );
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

procedure TPBRSBoxLabelsfrm.BitBtn1Click(Sender: TObject);
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

procedure TPBRSBoxLabelsfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TPBRSBoxLabelsfrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    WriteString('Centrereed Broker', 'Label Printer',DefaultPrinter);
    WriteString('Centrereed Broker', 'Label Printer Bin',inttostr(DefaultBin));
    WriteString('Centrereed Broker', 'Label Printer Paper',inttostr(DefaultPaper));
    WriteString('Centrereed Broker', 'Label Printer Format',sFormat);
  finally
    IniFile.Free;
  end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSBoxLabelsfrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBRSBoxLabelsfrm.BoxQuantityEditKeyPress(Sender: TObject;
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

procedure TPBRSBoxLabelsfrm.BoxQuantityEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  enableok;
end;

procedure TPBRSBoxLabelsfrm.BitBtn2Click(Sender: TObject);
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

procedure TPBRSBoxLabelsfrm.DeliveryDateEditExit(Sender: TObject);
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

procedure TPBRSBoxLabelsfrm.DeliveryDateEditChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBRSBoxLabelsfrm.SetNoOfSets(const Value: string);
begin
  FNoOfSets := Value;
end;

procedure TPBRSBoxLabelsfrm.SetNoOfBoxes(const Value: integer);
begin
  FNoOfBoxes := Value;
  NoOfBoxesSpinEdit.Value := FNoOfBoxes;
end;

procedure TPBRSBoxLabelsfrm.PrintBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
//  PrintSetup := False;
  PrintSetup := True;
  PrintReport;
end;

procedure TPBRSBoxLabelsfrm.SetStocked(const Value: string);
begin
  FStocked := Value;
end;

procedure TPBRSBoxLabelsfrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSBoxLabelsfrm.SetDefaultPaper(const Value: integer);
begin
  FDefaultPaper := Value;
end;

procedure TPBRSBoxLabelsfrm.FormActivate(Sender: TObject);
begin
  cmbFormat.itemindex := cmbFormat.Items.IndexOf(sFormat);

  with qryLogos do
    begin
      close;
      open;
    end;
end;

procedure TPBRSBoxLabelsfrm.cmbFormatChange(Sender: TObject);
begin
  sFormat := cmbFormat.Text;
end;

procedure TPBRSBoxLabelsfrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  dblkpLogos.KeyValue := -1;
end;

end.
