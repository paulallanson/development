unit PBRSDelivNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CCSPrint, PBPOObjects, Db, Inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSDelivNoteFrm = class(TForm)
    CancelBitBtn: TBitBtn;
    Previewbitbtn: TBitBtn;
    SetupBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    OrderGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DescrLbl: TLabel;
    CustomerLbl: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    Confirmchkbox: TCheckBox;
    Label3: TLabel;
    QtyEdit: TEdit;
    UpDelivSQL: TFDQuery;
    PrintBitBtn: TBitBtn;
    chkbxPrintLogo: TCheckBox;
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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
    FPOLine: integer;
    FPONumber: real;
    FActualDeliveryDate: string;
    FbOK: boolean;
    FDefaultPrinter: string;
    FDefaultBin: integer;
    procedure SetCustName(const Value: string);
    procedure SetDeliveryDate(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetQuantity(const Value: string);
    procedure SetDelivery(const Value: integer);
    procedure SetPOLine(const Value: integer);
    procedure SetPONumber(const Value: real);
    procedure PrintDeliveryNotes(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure UpdateDeliveryDate;
    procedure UpdateDeliveryPrinted;
    procedure SetActualDeliveryDate(const Value: string);
    procedure SetbOK(const Value: boolean);
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetDefaultPrinter(const Value: string);
    function GetBinSelection: integer;
    procedure SetDefaultBin(const Value: integer);
    procedure SetPrinterBin(BinCode: integer);
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
    property ActualDeliveryDate: string read FActualDeliveryDate write SetActualDeliveryDate;
    property bOK: boolean read FbOK write SetbOK;
  private
    FPrinted: boolean;
    Preview: ByteBool;
    blineup: boolean;
    PrintSetup: boolean;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  end;

var
  PBRSDelivNoteFrm: TPBRSDelivNoteFrm;

implementation

uses PBRPDeliv, PBLUDeliveriesDM, printers, dateselv5, pbMainMenu;

{$R *.DFM}

{ TPBRSDelivNoteFrm }

procedure TPBRSDelivNoteFrm.SetCustName(const Value: string);
begin
  FCustName := Value;
  CustomerLbl.caption := CustName;
end;

procedure TPBRSDelivNoteFrm.SetDelivery(const Value: integer);
begin
  FDelivery := Value;
end;

procedure TPBRSDelivNoteFrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
  DeliveryDateEdit.text := DeliveryDate;
end;

procedure TPBRSDelivNoteFrm.SetDescription(const Value: string);
begin
  FDescription := Value;
  DescrLbl.caption := Description;
end;

procedure TPBRSDelivNoteFrm.SetPOLine(const Value: integer);
begin
  FPOLine := Value;
end;

procedure TPBRSDelivNoteFrm.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TPBRSDelivNoteFrm.SetQuantity(const Value: string);
begin
  FQuantity := Value;
  QtyEdit.text := Quantity;
end;

procedure TPBRSDelivNoteFrm.UpdateDeliveryDate;
begin
  with dtmdlDeliveries.qryUpDelivDate do
    begin
      close;
      parambyname('Purchase_Order').asfloat := PONumber;
      parambyname('Line').asinteger := POLine;
      parambyname('Delivery_no').asinteger := Delivery;
      parambyname('Qty_Delivered').asinteger := strtoint(Quantity);

      parambyname('Date_Deliv_Actual').asdatetime := PBDateStr(ActualDeliveryDate);
      execsql;
    end;
end;

procedure TPBRSDelivNoteFrm.UpdateDeliveryPrinted;
begin
  with dtmdlDeliveries.qryUpDelivPrinted do
    begin
      close;
      parambyname('Purchase_Order').asfloat := PONumber;
      parambyname('Line').asinteger := POLine;
      parambyname('Delivery_no').asinteger := Delivery;
      execsql;
    end;
end;

procedure TPBRSDelivNoteFrm.PrintDeliveryNotes(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  PBRPDelivFrm := TPBRPDelivFrm.Create(Self);
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
      PBRPDelivFrm.Preview := Preview;
      PBRPDelivFrm.bLineup := bLineup;
      PBRPDelivFrm.bPrintLogo := chkbxPrintLogo.checked;
      PBRPDelivFrm.PrinterSettings := PrinterSettings;

      if not bLineUp then
        begin
          PBRPDelivFrm.PONo := PONumber;
          PBRPDelivFrm.POLine := POLine;
          PBRPDelivFrm.DelLine := Delivery;
        end;

      PBRPDelivFrm.OnlyMine := false;
      if (not bLineUp) and (PBRPDelivFrm.GetDetails(Self) = 0) then
        {Record count is zero - nothing to print}
        MessageDlg('There are no Delivery Notes to print', mtError, [mbAbort],
          0)
      else
        begin
        {Set the Delivery Date}
        PBRPDelivFrm.DeliveryDate := DeliveryDateEdit.text;
        {Actually print or preview the report}
        if Preview then
          PBRPDelivFrm.PBDelivQuickReport.Preview
        else
        if PrintSetup then
          begin
            if SetUpPrinter(PrinterSettings) then
              begin
                {Set all the printer defaults}
                PBRPDelivFrm.PBDelivQuickReport.Print;
                DefaultPrinter := printer.Printers[printer.printerindex];
                DefaultBin := GetBinSelection;
              end;
          end
        else
          PBRPDelivFrm.PBDelivQuickReport.Print;
        end;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPDelivFrm.Free;
  end;
end;

procedure TPBRSDelivNoteFrm.PreviewbitbtnClick(Sender: TObject);
begin
  Preview := True;
  bLineup := False;
  PrintDeliveryNotes(Self);
end;

procedure TPBRSDelivNoteFrm.SetupBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintDeliveryNotes(Self);

  {Update the Delivery date if confirmed}
  if ConfirmChkBox.checked then
    begin
    ActualDeliveryDate := DeliveryDateEdit.text;
    UpdateDeliveryDate;
    end;

  {Update the Delivery record with the Delivery Date and that Delivery note has been printed}
  UpdateDeliveryPrinted;
  dtmdlDeliveries.SavePurchaseOrder(PONumber,POLine);
  bOK := true;
  close;
end;

procedure TPBRSDelivNoteFrm.BitBtn1Click(Sender: TObject);
var
  ilineup: Integer;
begin
  Preview := false;
  {Repeat the printing of the invoice lineup until the user selects No}
  repeat
    ilineup := MessageDlg('Would you like to print a Stationary Template?',
      mtConfirmation, mbOkCancel, 0);
    if ilineup = mrOK then
    begin {Print the Invoice lineup}
      bLineup := True;
      PrintDeliveryNotes(nil);
    end
  until (ilineup <> mrOK);
end;

procedure TPBRSDelivNoteFrm.FormActivate(Sender: TObject);
begin
  OrderGroupBox.caption := OrderGroupBox.caption + floattostr(PONumber);
end;

procedure TPBRSDelivNoteFrm.DeliveryDateEditExit(Sender: TObject);
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

procedure TPBRSDelivNoteFrm.BitBtn2Click(Sender: TObject);
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

procedure TPBRSDelivNoteFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  PreviewBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  PrintBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  SetupBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
end;

procedure TPBRSDelivNoteFrm.DeliveryDateEditChange(Sender: TObject);
begin
  CheckOK(self);
end;

procedure TPBRSDelivNoteFrm.SetActualDeliveryDate(const Value: string);
begin
  FActualDeliveryDate := Value;
end;

procedure TPBRSDelivNoteFrm.SetbOK(const Value: boolean);
begin
  FbOK := Value;
end;

procedure TPBRSDelivNoteFrm.FormCreate(Sender: TObject);
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

procedure TPBRSDelivNoteFrm.GetDefaultPrinter;
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

(*  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  try
    DefaultPrinter := IniFile.ReadString('Centrereed Broker', 'Delivery Note Printer', 'None');
  finally
    IniFile.Free;
  end;

  {Find the default printer in the list of printers }
  Printers.Printer.PrinterIndex := -1;
  for icount := 0 to pred(Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
        Printers.Printer.PrinterIndex := icount;
    end;
*)
end;

procedure TPBRSDelivNoteFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TPBRSDelivNoteFrm.SaveDefaultPrinter;
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

procedure TPBRSDelivNoteFrm.SetPrinterBin(BinCode : integer );
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

function TPBRSDelivNoteFrm.GetBinSelection: integer;
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

procedure TPBRSDelivNoteFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TPBRSDelivNoteFrm.PrintBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := False;
  PrintDeliveryNotes(Self);

  {Update the Delivery date if confirmed}
  if ConfirmChkBox.checked then
    begin
    ActualDeliveryDate := DeliveryDateEdit.text;
    UpdateDeliveryDate;
    end;

  {Update the Delivery record with the Delivery Date and that Delivery note has been printed}
  UpdateDeliveryPrinted;
  dtmdlDeliveries.SavePurchaseOrder(PONumber,POLine);
  bOK := true;
  close;
end;

procedure TPBRSDelivNoteFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSDelivNoteFrm.FormDestroy(Sender: TObject);
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

end.
