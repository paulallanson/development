unit PBRSCusSupLabs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db, IniFiles, PBPOObjects, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSCusSupLabsfrm = class(TForm)
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CountSQL: TFDQuery;
    PrintBitBtn: TBitBtn;
    Label5: TLabel;
    NoofBoxesSpinEdit: TSpinEdit;
    SuppCustNameLabel: TLabel;
    SuppCustNameEdit: TEdit;
    BranchDBLookupComboBox: TDBLookupComboBox;
    BranchLabel: TLabel;
    ContactDBLookupComboBox: TDBLookupComboBox;                                        
    ContactBitBtn: TBitBtn;
    ContactLabel: TLabel;
    GetSuppBranchesSQL: TFDQuery;
    GetCustBranchesSQL: TFDQuery;
    BranchesDS: TDataSource;
    GetSuppContactsSQL: TFDQuery;
    GetCustContactsSQL: TFDQuery;
    ContactsDS: TDataSource;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure EnableOK;
    procedure FormActivate(Sender: TObject);
    procedure GetContacts(Sender: TObject);
    procedure BranchDBLookupComboBoxClick(Sender: TObject);
    procedure ContactBitBtnClick(Sender: TObject);
  private
    procedure SetPrinterBin(BinCode: integer);
    procedure SetPrinterPaper(PaperCode: integer);
    function GetBinSelection: integer;
    function GetPaperSelection: integer;
    { Private declarations }
  public
    { Public declarations }
    iCode: Integer;
    bCustomer: ByteBool;
    sName: String;
  private
    FPrinted: bytebool;
    FActivated: bytebool;
    Preview: ByteBool;
    blineup: boolean;
    PrintSetup: boolean;
    iselcode,
    iLastBox: Integer;
    DefaultPrinter: String;
    DefaultBin: integer;
    DefaultPaper: integer;
    function RecordsExist: boolean;
    procedure CallPrinter;
    procedure PrintReport;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
  end;

var
  PBRSCusSupLabsfrm: TPBRSCusSupLabsfrm;

implementation

uses PBIntSelDM, PBRPLabels, CCSPrint, Printers, DateSelV5, PBRPCusSupLabs,
  pbMainMenu;

{$R *.DFM}

{ TPBRSBoxLabelsfrm }

procedure TPBRSCusSupLabsfrm.EnableOK;
begin
{You can always do the print becuase all the inputs have default, valid values} ;
  PreviewBitBtn.Enabled := True;
  PrintBitBtn.Enabled := True;
//  SetupBitBtn.Enabled := True;
end;

procedure TPBRSCusSupLabsfrm.PrintReport;
var
  iCount, iTempContact : integer;
begin
  If ContactDBLookupComboBox.KeyValue <> 0 then
        iTempContact := ContactDBLookupComboBox.KeyValue
  else
        iTempContact := 0 ;
  iSelCode := dmIntSel.GetNextDbKey;
  try
    if not bLineUp then
    begin
      iLastBox :=
        StrToInt(NoofBoxesSpinEdit.Text) ;
      for icount := 1 to iLastBox do
        dmIntSel.AddWithKey(iSelCode, iCount, iCode, BranchDBLookupComboBox.KeyValue, iTempContact, '', '');
    end;
    CallPrinter;
  finally
    dmIntSel.DeleteRecord(iSelCode);
  end;
end;

procedure TPBRSCusSupLabsfrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  bLineUp := false;
  PrintReport;
end;

procedure TPBRSCusSupLabsfrm.SetupBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

function TPBRSCusSupLabsfrm.RecordsExist: Boolean;
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

procedure TPBRSCusSupLabsfrm.CallPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  PBRPCusSupLabsFrm := TPBRPCusSupLabsFrm.Create(Self);
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
      PBRPCusSupLabsFrm.PrinterSettings := PrinterSettings;
      PBRPCusSupLabsFrm.iIntSel := iSelCode;
      PBRPCusSupLabsFrm.Preview := Preview;
      PBRPCusSupLabsFrm.bLineUp := bLineUp ;
      PBRPCusSupLabsFrm.bCustomer := bCustomer ;
      if (not bLineUp) and (PBRPCusSupLabsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Details Not Found ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        PBRPCusSupLabsFrm.PBLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            PBRPCusSupLabsFrm.PBLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        PBRPCusSupLabsFrm.PBLabelsQuickReport.Print;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    PBRPCusSupLabsFrm.Free;
    Application.ProcessMessages;
  end;
end;

function TPBRSCusSupLabsfrm.GetBinSelection: integer;
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

function TPBRSCusSupLabsfrm.GetPaperSelection: integer;
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

procedure TPBRSCusSupLabsfrm.SetPrinterBin(BinCode : integer );
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

procedure TPBRSCusSupLabsfrm.SetPrinterPaper(PaperCode : integer );
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

procedure TPBRSCusSupLabsfrm.FormCreate(Sender: TObject);
begin
  dmIntSel := TdmIntSel.Create(Self);
  GetDefaultPrinter;
end;

procedure TPBRSCusSupLabsfrm.FormDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

procedure TPBRSCusSupLabsfrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  TempArray: array[0..255] of Char;
  sBin, sPaper: string;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Address Label Printer', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Address Label Printer Bin', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

  GetPrivateProfileString('Centrereed Broker', 'Address Label Printer Paper', '', TempArray,
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

procedure TPBRSCusSupLabsfrm.BitBtn1Click(Sender: TObject);
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

procedure TPBRSCusSupLabsfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TPBRSCusSupLabsfrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Address Label Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Address Label Printer Bin',inttostr(DefaultBin));
      WriteString('Centrereed Broker', 'Address Label Printer Paper',inttostr(DefaultPaper));
      Free;
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSCusSupLabsfrm.PrintBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := true;
  PrintReport;
end;

procedure TPBRSCusSupLabsfrm.FormActivate(Sender: TObject);
begin
  if not Factivated then
    begin
      If bCustomer then
        begin
        Caption := 'Print Customer Labels' ;
        SuppCustNameLabel.Caption := 'Customer' ;
        BranchesDS.DataSet := GetCustBranchesSQL ;
        ContactsDS.DataSet := GetCustContactsSQL ;
        end
      else
        begin
        Caption := 'Print Supplier Labels' ;
        SuppCustNameLabel.Caption := 'Supplier' ;
        BranchesDS.DataSet := GetSuppBranchesSQL ;
        ContactsDS.DataSet := GetSuppContactsSQL ;
        end;
      With (BranchesDS.DataSet as TFDQuery) do
        begin
        Close ;
        ParamByName('SelCode').AsInteger := iCode ;
        Open ;
        end;
      SuppCustNameEdit.Text := sName ;
      BranchDBLookupComboBox.KeyValue := 0 ;
      GetContacts(Self) ;
      enableok;
      Factivated := true;
    end;
end;

procedure TPBRSCusSupLabsfrm.GetContacts(Sender: TObject);
begin
With (ContactsDS.DataSet as TFDQuery) do
        begin
        Close ;
        ParamByName('SelCode').AsInteger := iCode ;
        ParamByName('Branch').AsInteger := BranchDBLookupComboBox.KeyValue ;
        Open ;
        end;
ContactDBLookupComboBox.KeyValue := 0 ;
end;

procedure TPBRSCusSupLabsfrm.BranchDBLookupComboBoxClick(Sender: TObject);
begin
GetContacts(Self) ;
end;

procedure TPBRSCusSupLabsfrm.ContactBitBtnClick(Sender: TObject);
begin
ContactDBLookupComboBox.KeyValue := 0 ;
end;

end.
