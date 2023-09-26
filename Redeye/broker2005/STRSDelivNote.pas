unit STRSDelivNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, STSOObjects, IniFiles, CCSPrint;

type
  TSTRSDelivNotefrm = class(TForm)
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
    chkbxPrintLogo: TCheckBox;
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
    procedure FormDestroy(Sender: TObject);
  private
    FDefaultPrinter: string;
    FDeliveryNo: integer;
    procedure SetDeliveryNo(const Value: integer);
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
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    { Private declarations }
  public
    { Public declarations }
    Reprint: ByteBool;
    bOK: ByteBool;
    PrintSetup: boolean;
    property SONumber: integer read FSONumber write SetSONumber;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property DeliveryNo: integer read FDeliveryNo write SetDeliveryNo;
  end;

var
  STRSDelivNotefrm: TSTRSDelivNotefrm;

implementation

uses UITypes, FireDAC.Stan.Param, STRPDeliv, printers, pbDatabase, DateSelV5, pbMainMenu;

{$R *.DFM}

procedure TSTRSDelivNotefrm.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
end;

procedure TSTRSDelivNotefrm.PreviewbitbtnClick(Sender: TObject);
begin
  RunReport(True);
end;

procedure TSTRSDelivNotefrm.Runreport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
  begin
  {Setup and print the report}
  GetSelection;
  STRPDelivFrm := TSTRPDelivFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPDelivFrm.iIntSelCode := fIntSelCode ;
      STRPDelivFrm.sDespDt := DeliveryDateEdit.Text;
      STRPDelivFrm.Preview := Preview;
      STRPDelivFrm.DateReq := DateRequired;
      STRPDelivFrm.Reprint := Reprint;
      STRPDelivFrm.PrintLogo := chkbxPrintLogo.checked;
      STRPDelivFrm.SalesOrder := 99;
//      STRPDelivFrm.PrinterSettings := PrinterSettings;
      if STRPDelivFrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        end
      else
        begin
          if preview then
            STRPDelivFrm.PickSoListQuickReport.Preview
          else
          if Printsetup then
          begin
            if setupPrinter(PrinterSettings) then
              STRPDelivFrm.PickSoListQuickReport.Print;
          end
        else
        STRPDelivFrm.PickSoListQuickReport.Print;
      end;
    finally
    DefaultPrinter := printer.Printers[printer.printerindex];
    Printersettings.free;
  end;
  finally
    STRPDelivFrm.Free;
    dmBroker.DelIntSelCode(fIntselCode, True);
  end;
end;

procedure TSTRSDelivNotefrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  try
  with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Redeye', 'Delivery Note - Print Logo', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;

  fIntSelCode := dmBroker.GetNextIntSelCode(Self);
  bOK := false;
  GetDefaultPrinter;
end;

procedure TSTRSDelivNotefrm.GetSelection;
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

procedure TSTRSDelivNotefrm.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TSTRSDelivNotefrm.PrintBitBtnClick(Sender: TObject);
begin
  Printsetup := False;
  RunReport(False);
  bOK := true;
  close;
end;

procedure TSTRSDelivNotefrm.SetupBitBtnClick(Sender: TObject);
begin
  PrintSetup := True;
  RunReport(false);
  bOK := true;
  close;
end;

procedure TSTRSDelivNotefrm.BitBtn2Click(Sender: TObject);
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

procedure TSTRSDelivNotefrm.DeliveryDateEditExit(Sender: TObject);
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

procedure TSTRSDelivNotefrm.DeliveryDateEditChange(Sender: TObject);
begin
  checkOK(self);
end;

procedure TSTRSDelivNotefrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  PreviewBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  PrintBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  SetupBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
end;

procedure TSTRSDelivNotefrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  icount: integer;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Delivery Note Printer', '', TempArray,
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

procedure TSTRSDelivNotefrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Delivery Note Printer',DefaultPrinter);

      Free;
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TSTRSDelivNotefrm.SetDefaultPrinter(const Value: string);
begin
 FDefaultPrinter := Value;
end;

procedure TSTRSDelivNotefrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
SaveDefaultPrinter;
end;

procedure TSTRSDelivNotefrm.SetDeliveryNo(const Value: integer);
begin
  FDeliveryNo := Value;
end;

procedure TSTRSDelivNotefrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Redeye', 'Delivery Note - Print Logo', 'Y')
      else
        WriteString('Redeye', 'Delivery Note - Print Logo', 'N');

      Free;
    end;
end;

end.
