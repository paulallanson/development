unit STRSBoxLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, Db, IniFiles, Grids, DBGrids, CCSCommon,
  ExtCtrls, ComCtrls, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSBoxLabelsfrm = class(TForm)
    GetDetailsSrc: TDataSource;
    GetSordSQL: TFDQuery;
    LineDetsStringGrid: TStringGrid;
    qryGetSerialNumbers: TFDQuery;
    StatusBar1: TStatusBar;
    pnlFooter: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    pnlHeader: TPanel;
    POGroupBox: TGroupBox;
    Label1: TLabel;
    CustomerLbl: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    DeliveryDateEdit: TEdit;
    BitBtn2: TBitBtn;
    chkAddressOnly: TCheckBox;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    dblkpLogos: TDBLookupComboBox;
    FormRefClrBitBtn: TBitBtn;
    qryLogos: TFDQuery;
    dtsLogos: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure SetupBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShowLineGrid(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BoxQuantityEditKeyPress(Sender: TObject; var Key: Char);
    procedure BoxQuantityEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure DeliveryDateEditExit(Sender: TObject);
    procedure DeliveryDateEditChange(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure LineDetsStringGridDrawCell(Sender: TObject; vcol,
      vrow: Integer; Rect: TRect; State: TGridDrawState);
    procedure LineDetsStringGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
  private
    FSONumber: integer;
    FDeliveryDate: string;
    FQuantity: string;
    FBoxQuantity: string;
    FDescription: string;
    FCustName: string;
    FDefaultPrinter: string;
    FNoOfSets: string;
    FNoOfBoxes: integer;
    FDefaultBin: integer;
    FDefaultPaper: integer;
    procedure SetBoxQuantity(const Value: string);
    procedure SetCustName(const Value: string);
    procedure SetDeliveryDate(const Value: string);
    procedure SetDescription(const Value: string);
    procedure SetSONumber(const Value: integer);
    procedure SetQuantity(const Value: string);
    procedure EnableOK;
    procedure SetDefaultPrinter(const Value: string);
    procedure SetNoOfSets(const Value: string);
    procedure SetNoOfBoxes(const Value: integer);
    function GetBinSelection: integer;
    function GetPaperSelection: integer;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPaper(const Value: integer);
    procedure SetPrinterBin(BinCode: integer);
    procedure SetPrinterPaper(PaperCode: integer);
    function GetSerialNumber(tmpOrder, tmpLine: integer): string;
    { Private declarations }
  public
    { Public declarations }
    property CustName: string read FCustName write SetCustName;
    property Description: string read FDescription write SetDescription;
    property Quantity: string read FQuantity write SetQuantity;
    property DeliveryDate: string read FDeliveryDate write SetDeliveryDate;
    property SONumber: integer read FSONumber write SetSONumber;
    property BoxQuantity: string read FBoxQuantity write SetBoxQuantity;
    property NoOfSets: string read FNoOfSets write SetNoOfSets;
    property NoOfBoxes: integer read FNoOfBoxes write SetNoOfBoxes;
  private
    FPrinted: boolean;
    Preview: ByteBool;
    blineup: boolean;
    PrintSetup: boolean;
    iselcode: integer;
    function CalcNoOfBoxes(iSinglesQty, iPackSize: Integer): Integer;
    procedure CallPrinter;
    procedure PrintReport;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultPaper: integer read FDefaultPaper write SetDefaultPaper;
  end;

var
  STRSBoxLabelsfrm: TSTRSBoxLabelsfrm;

implementation

uses PBIntSelDM, STRPLabels, CCSPrint, printers, dateselv5, pbMainMenu;

{$R *.DFM}

{ TPBRSBoxLabelsfrm }

procedure TSTRSBoxLabelsfrm.SetBoxQuantity(const Value: string);
begin
  FBoxQuantity := Value;
end;

procedure TSTRSBoxLabelsfrm.SetCustName(const Value: string);
begin
  FCustName := Value;
  CustomerLbl.caption := CustName;
end;

procedure TSTRSBoxLabelsfrm.SetDeliveryDate(const Value: string);
begin
  FDeliveryDate := Value;
  DeliveryDateEdit.text := DeliveryDate;
end;

procedure TSTRSBoxLabelsfrm.SetDescription(const Value: string);
begin
  FDescription := Value;
//  DescrLbl.caption := Description;
end;

procedure TSTRSBoxLabelsfrm.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
  POGroupBox.Caption := POGroupBox.Caption + ' ' + Inttostr(SONumber);
end;

procedure TSTRSBoxLabelsfrm.SetQuantity(const Value: string);
begin
  FQuantity := Value;
//  QtyLbl.caption := Quantity;
end;

procedure TSTRSBoxLabelsfrm.EnableOK;
begin
  PreviewBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
  PrintBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
//  SetupBitBtn.Enabled := (DeliveryDateEdit.Text <> '');
end;

procedure TSTRSBoxLabelsfrm.FormShow(Sender: TObject);
begin
  enableok;
  ShowLineGrid(Self);
end;

procedure TSTRSBoxLabelsfrm.PrintReport;
var
  iCount, ibox, iSerialNumber, iLastBox : integer;
begin
  {Check }
  iSelCode := dmIntSel.GetNextDbKey;
  try
    if (not bLineUp) then
    begin
//      {Check for serial numbers}  - Edited out 5/10/2020 because not figured out how this will work
//      iSerialNumber := GetSerialNumber(SONumber, StrToInt(LineDetsStringGrid.Cells[0,1]));

      for icount := 1 to LineDetsStringGrid.Rowcount-1 do
        begin
          try
            iSerialNumber := StrToInt(LineDetsStringGrid.Cells[7,icount])
          except
            iSerialNumber := 0;
          end;

          iLastBox := StrToInt(LineDetsStringGrid.Cells[6,icount]) +
            StrToInt(LineDetsStringGrid.Cells[5,icount]) - 1;

          for ibox := StrToInt(LineDetsStringGrid.Cells[6,icount]) to iLastBox do
            begin
              if (iBox > StrToInt(LineDetsStringGrid.Cells[6,icount])) and (iSerialNumber <> 0) then
                iSerialNumber := iSerialNumber + StrToInt(LineDetsStringGrid.Cells[4,icount]);

              dmIntSel.AddWithKey5(iSelCode, iCount, SONumber,StrToInt(LineDetsStringGrid.Cells[0,icount]),ibox, iSerialNumber, '', inttostr(iLastBox));
            end;
(*        for ibox := 1 to StrToInt(LineDetsStringGrid.Cells[5,icount]) do
            dmIntSel.AddWithKey(iSelCode, iCount, SONumber,StrToInt(LineDetsStringGrid.Cells[0,icount]),ibox, '', LineDetsStringGrid.Cells[5,icount]);
*)
        end;
      end;
    CallPrinter;
  finally
    dmIntSel.DeleteRecord(iSelCode);
  end;
//  close;
end;

function TSTRSBoxLabelsfrm.GetSerialNumber(tmpOrder, tmpLine: integer): string;
begin
  with qryGetSerialNumbers do
    begin
      close;
      parambyname('Sales_order').asinteger := tmpOrder;
      parambyname('sales_order_line_no').asinteger := tmpLine;
      open;
      result := fieldbyname('Serial_Item_From').asstring;
    end;
end;

procedure TSTRSBoxLabelsfrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  bLineUp := false;
  PrintReport;
end;

procedure TSTRSBoxLabelsfrm.SetupBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

procedure TSTRSBoxLabelsfrm.CallPrinter;
var
  PrinterSettings : TPrinterSettings;
  icount: integer;
begin
  {Setup and print the report}
  STRPLabelsFrm := TSTRPLabelsFrm.Create(Self);
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
      STRPLabelsFrm.PrinterSettings := PrinterSettings;
      STRPLabelsFrm.iIntSel := iSelCode;
      if not bLineUp then
      begin
        STRPLabelsFrm.iSONumber := SONumber;
        STRPLabelsFrm.DeliveryDatelbl.caption := DeliveryDateEdit.text;
        STRPLabelsFrm.bAddressOnly := chkAddressOnly.checked;
        if dblkpLogos.KeyValue >= 0 then
          STRPLabelsFrm.logoPath := qryLogos.fieldbyname('Logo_Path').asstring
        else
          STRPLabelsFrm.logoPath := '';
      end
      else
      begin
        STRPLabelsFrm.bLineup := blineup;
        STRPLabelsFrm.iSONumber := 0;
        STRPLabelsFrm.iBoxQuantity := 99999;
        STRPLabelsFrm.sNumberFrom := '1';
        STRPLabelsFrm.sPrefix := 'AAAA';
      end;
      STRPLabelsFrm.Preview := Preview;
      if (not bLineUp) and (STRPLabelsFrm.GetDetails(Self) = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Delivery Details do not exist ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        STRPLabelsFrm.STLabelsQuickReport.Preview
      else
      if PrintSetup then
        begin
        if SetUpPrinter(PrinterSettings) then
          begin
            {Set all the printer defaults}
            STRPLabelsFrm.STLabelsQuickReport.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
            DefaultPaper := GetPaperSelection;
          end;
        end
      else
        STRPLabelsFrm.STLabelsQuickReport.Print;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      {Set back to the default printer}
      PrinterSettings.Free;
    end;
  finally
    STRPLabelsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSBoxLabelsfrm.FormCreate(Sender: TObject);
begin
  dmIntSel := TdmIntSel.Create(Self);
  FPrinted := false;
  GetDefaultPrinter;
end;

procedure TSTRSBoxLabelsfrm.FormDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

procedure TSTRSBoxLabelsfrm.GetDefaultPrinter;
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

function TSTRSBoxLabelsfrm.GetBinSelection: integer;
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

function TSTRSBoxLabelsfrm.GetPaperSelection: integer;
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

procedure TSTRSBoxLabelsfrm.SetPrinterBin(BinCode : integer );
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

procedure TSTRSBoxLabelsfrm.SetPrinterPaper(PaperCode : integer );
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

procedure TSTRSBoxLabelsfrm.BitBtn1Click(Sender: TObject);
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

procedure TSTRSBoxLabelsfrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;
end;

procedure TSTRSBoxLabelsfrm.SaveDefaultPrinter;
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

procedure TSTRSBoxLabelsfrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TSTRSBoxLabelsfrm.BoxQuantityEditKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
//  with Sender as TEdit do
//    P := Pos('.', Text);
P := 0;
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

procedure TSTRSBoxLabelsfrm.BoxQuantityEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  enableok;
end;

procedure TSTRSBoxLabelsfrm.BitBtn2Click(Sender: TObject);
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

procedure TSTRSBoxLabelsfrm.DeliveryDateEditExit(Sender: TObject);
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

procedure TSTRSBoxLabelsfrm.DeliveryDateEditChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TSTRSBoxLabelsfrm.SetNoOfSets(const Value: string);
begin
  FNoOfSets := Value;
end;

procedure TSTRSBoxLabelsfrm.SetNoOfBoxes(const Value: integer);
begin
  FNoOfBoxes := Value;
end;

procedure TSTRSBoxLabelsfrm.PrintBitBtnClick(Sender: TObject);
begin
  bLineup := False;
  Preview := False;
  PrintSetup := True;
  PrintReport;
end;

procedure TSTRSBoxLabelsfrm.ShowLineGrid(Sender: TObject);
var
  TempCount: Integer;
  inx: Integer;
  sSerialNumber: string;
begin
for TempCount := 0 to LineDetsStringGrid.RowCount do
    begin
    LineDetsStringGrid.rows[TempCount].clear;
    end;
     inx := 0;
  LineDetsStringGrid.Cells[0, 0] := 'Line';
  LineDetsStringGrid.Cells[1, 0] := 'Part';
  LineDetsStringGrid.Cells[2, 0] := 'Description';
  LineDetsStringGrid.Cells[3, 0] := 'Quantity';
  LineDetsStringGrid.Cells[4, 0] := 'Pack Size';
  LineDetsStringGrid.Cells[5, 0] := 'Boxes';
  LineDetsStringGrid.Cells[6, 0] := 'Start From';
  LineDetsStringGrid.Cells[7, 0] := 'Numbering Start';
  LineDetsStringGrid.Cells[0, 1] := '';
  LineDetsStringGrid.Cells[1, 1] := '';
  LineDetsStringGrid.Cells[2, 1] := '';
  LineDetsStringGrid.Cells[3, 1] := '';
  LineDetsStringGrid.Cells[4, 1] := '';
  LineDetsStringGrid.Cells[5, 1] := '';
  with GetSordSQL do
  begin
    Close;
    ParamByName('SoNumber').AsInteger := sonumber;
    Open;
    first;
    while not eof do
    begin
        Inc(inx);
        LineDetsStringGrid.Cells[0, inx] := FieldByName('Sales_order_Line_No').AsString;
        LineDetsStringGrid.Cells[1, inx] := FieldByName('Part').AsString;
        LineDetsStringGrid.Cells[2, inx] := FieldByName('Part_Description').AsString;
        if FieldByName('Quantity_Allocated').AsInteger = 0 then
          begin
            LineDetsStringGrid.Cells[3, inx] := IntToStr(FieldByName('Quantity_Delivered').AsInteger);
            LineDetsStringGrid.Cells[5, inx] := inttostr(CalcNoOfBoxes(FieldByName('Quantity_Delivered').AsInteger,FieldByName('Sell_Pack_Quantity').AsInteger));
          end
        else
          begin
            LineDetsStringGrid.Cells[3, inx] := IntToStr(FieldByName('Quantity_Allocated').AsInteger);
            LineDetsStringGrid.Cells[5, inx] := inttostr(CalcNoOfBoxes(FieldByName('Quantity_Allocated').AsInteger,FieldByName('Sell_Pack_Quantity').AsInteger));
          end;
        LineDetsStringGrid.cells[4, inx] := InttoStr(FieldByName('Sell_Pack_Quantity').AsInteger);
        LineDetsStringGrid.cells[6, inx] := '1';
        sSerialNumber := GetSerialNumber(SONumber, StrToInt(LineDetsStringGrid.Cells[0,1]));
        LineDetsStringGrid.cells[7, inx] := sSerialNumber;
      next;
    end;
  end;
  if inx > 0 then
    LineDetsStringGrid.RowCount := inx + 1
  else
    LineDetsStringGrid.RowCount := 2;
end;

function TSTRSBoxLabelsfrm.CalcNoOfBoxes(iSinglesQty,
  iPackSize: Integer): Integer;
Var
iNoOfPacks: Integer;
begin
iNoofPacks := 0;
{Display output as <noofpacks> or <noofpacks>/<noofsingles>} ;
Try
        iNoOfPacks := Trunc(iSinglesQty/iPackSize) ;
Except
      //  Result := 0 ;
        MessageDlg('Invalid no of boxes',mtError,[mbOK],0) ;
        end;
If iSinglesQty = (iPackSize*iNoOfPacks) then
        Result := iNoOfPacks
else
        Result := iNoOfPacks+1 ;
end;
procedure TSTRSBoxLabelsfrm.LineDetsStringGridDrawCell(Sender: TObject;
  vcol, vrow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (vCol = 1) or (vCol = 2) then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;

end;

procedure TSTRSBoxLabelsfrm.LineDetsStringGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
If Acol < 5 then
  canselect := false
else
  canselect := True;
end;

procedure TSTRSBoxLabelsfrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TSTRSBoxLabelsfrm.SetDefaultPaper(const Value: integer);
begin
  FDefaultPaper := Value;
end;

procedure TSTRSBoxLabelsfrm.FormActivate(Sender: TObject);
begin
  with qryLogos do
    begin
      close;
      open;
    end;
end;

procedure TSTRSBoxLabelsfrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  dblkpLogos.KeyValue := -1;
end;

end.
