unit STRSPickingNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, DBGrids, Buttons, ExtCtrls, DB, Inifiles, STPickObject,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSPickingNoteFrm = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Previewbitbtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    Panel3: TPanel;
    CustomerLbl: TLabel;
    SalesOrderlbl: TLabel;
    Label6: TLabel;
    OrderDatelbl: TLabel;
    qrySOAlloc: TFDQuery;
    dtsSOAlloc: TDataSource;
    Label2: TLabel;
    cmbPickingNote: TComboBox;
    sgDetails: TStringGrid;
    Label1: TLabel;
    edtPickingDate: TEdit;
    CancelBitBtn: TBitBtn;
    qryDelPick: TFDQuery;
    qryAddPick: TFDQuery;
    qryGetNext: TFDQuery;
    btnDate: TSpeedButton;
    qryPickNotes: TFDQuery;
    qrySOPicking: TFDQuery;
    lblPickingConfirmed: TLabel;
    chkbxPrintCopy: TCheckBox;
    qryProdLocation: TFDQuery;
    chkbxAutoConfirm: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgDetailsDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure cmbPickingNoteClick(Sender: TObject);
    procedure edtPickingDateExit(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure sgDetailsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgDetailsKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    FConfirmed: boolean;
    FSelectedLineIndex: Integer;
    FSelectedLotIndex: integer;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    function GetBinSelection: integer;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetPrinterBin(BinCode: integer);
    procedure UpdatePicking;
    function GetNextPicking: integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure ShowPickingNotes;
    procedure SetConfirmed(const Value: boolean);
    procedure TransferToProduction;
    procedure UpdateProduction;
    procedure UpdateTransfers;
    function GetSelectedLine: TPickLine;
    function GetSelectedLot: TLotNumber;
    procedure ForwardStock;
    function GetTotalPartAllocated(tempPart: string): integer;
    function GetTotalPartPicked(tempPart: string): integer;
  private
    sPrintCopy: string;
    FActivated: boolean;
    PickDate: TDateTime;
    PickCode: integer;
    FSONumber: integer;
    FDateRequired: TDateTime;
    FPrinted: boolean;
    procedure SetSONumber(const Value: integer);
    procedure SetDateRequired(const Value: TDateTime);
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure ShowAllocLineDetails;
    procedure ShowPickingDetails;
    procedure BuildLineGrid;
    procedure BuildPickingGrid;
    procedure Runreport(Preview: ByteBool);
    procedure SetPrinted(const Value: boolean);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
  public
    bOK: boolean;
    IsSalesOrder: boolean;
    JobBagNumber: integer;
    ToDestroy: boolean;
    UseForwardStock: boolean;
    property DateRequired: TDateTime read FDateRequired write SetDateRequired;
    property SONumber: integer read FSONumber write SetSONumber;
    property Printed: boolean read FPrinted write SetPrinted;
    property Confirmed: boolean read FConfirmed write SetConfirmed;
    property SelectedLine: TPickLine read GetSelectedLine;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property SelectedLot: TLotNumber read GetSelectedLot;
    property SelectedLotIndex: integer read FSelectedLotIndex;
  end;

var
  STRSPickingNoteFrm: TSTRSPickingNoteFrm;

implementation

uses STRPPickingNote, CCSPrint, printers, PBDatabase, CCSCommon, DateSelV5,
  pbMainMenu, stPickingDM, STStockDM;

{$R *.dfm}

{ TSTRSPickingNoteFrm }

procedure TSTRSPickingNoteFrm.SetDateRequired(const Value: TDateTime);
begin
  FDateRequired := Value;
end;

procedure TSTRSPickingNoteFrm.SetSONumber(const Value: integer);
begin
  FSONumber := Value;
  SalesOrderLbl.Caption := inttostr(FSONumber);
end;

procedure TSTRSPickingNoteFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      chkbxPrintCopy.Checked := (sPrintCopy = 'Y');
      edtPickingDate.Text := pbdatestr(daterequired);
      ShowPickingNotes;
//  ShowAllocLineDetails;
      FActivated := true;
    end;
end;

procedure TSTRSPickingNoteFrm.ShowAllocLineDetails;
begin
  ClearGrid(sgDetails);
  BuildLineGrid;
end;

procedure TSTRSPickingNoteFrm.ShowPickingDetails;
begin
  ClearGrid(sgDetails);
  BuildPickingGrid;
end;

procedure TSTRSPickingNoteFrm.ShowPickingNotes;
begin
  cmbPickingNote.Clear;

  cmbPickingNote.items.add('<New Picking Note>');

  with qryPickNotes do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      open;

      while eof <> true do
        begin
          cmbPickingNote.items.Add(fieldbyname('Picking_List_Ref').asstring + ' - ' + pbDateStr(fieldbyname('Date_Picked').asdatetime));
          next;
        end;
    end;
  cmbPickingNote.ItemIndex := pred(cmbPickingNote.items.count);
  cmbPickingNoteClick(self);
end;

procedure TSTRSPickingNoteFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    rowcount := 2;
    end;
end;

procedure TSTRSPickingNoteFrm.BuildLineGrid;
var
  i, icount: integer;
begin
  i := 0;
  with qrySOAlloc do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      open;

      while eof <> true do
        begin
          if fieldbyname('Quantity_To_Pick').asinteger = 0 then
            begin
              next;
              continue;
            end;

          sgDetails.cells[0,i+1] := fieldbyname('Part').asstring;
          sgDetails.cells[1,i+1] := fieldbyname('Part_Description').asstring;
          sgDetails.cells[2,i+1] := fieldbyname('Part_Bin').asstring;
          sgDetails.cells[3,i+1] := fieldbyname('Quantity_Allocated').asstring;
          sgDetails.cells[4,i+1] := fieldbyname('Quantity_Used').asstring;
          sgDetails.cells[5,i+1] := fieldbyname('Quantity_To_Pick').asstring;
          sgDetails.cells[6,i+1] := fieldbyname('Sales_Order_Line_no').asstring;
          sgDetails.cells[7,i+1] := fieldbyname('Part_Store_Lot').asstring;
          sgDetails.cells[8,i+1] := fieldbyname('Stock_Pack_Quantity').asstring;
          sgDetails.cells[9,i+1] := '0';
          sgDetails.cells[10,i+1] := fieldbyname('Part_Store').asstring;
          sgDetails.cells[11,i+1] := fieldbyname('Invoice_upfront').asstring;
          sgDetails.cells[12,i+1] := fieldbyname('Part_Store_Allocation').asstring;
          sgDetails.cells[13,i+1] := pbdatestr(fieldbyname('Date_Received').asdatetime);
          sgDetails.cells[14,i+1] := fieldbyname('Sets_per_Pad').asstring;
          sgDetails.cells[15,i+1] := fieldbyname('Purchase_Order').asstring;
          i := i+1;
          next;
        end;
      if i = 0 then
        sgDetails.rowcount := 2
      else
        sgDetails.rowcount := i + 1;
    end;

  Confirmed := false;
  edtPickingDate.Text := pbdatestr(PickDate);
  previewBitBtn.enabled := (i > 0);
  printBitBtn.enabled := previewBitBtn.enabled;
end;

procedure TSTRSPickingNoteFrm.FormCreate(Sender: TObject);
begin
  with sgDetails do
    begin
      cells[0,0] := 'Part';
      cells[1,0] := 'Description';
      cells[2,0] := 'Bin';
      cells[3,0] := 'Allocated';
      cells[4,0] := 'Picked';
      cells[5,0] := 'To Pick';
    end;

  GetDefaultPrinter;
end;

procedure TSTRSPickingNoteFrm.sgDetailsDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if vRow <> 0 then
      begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
      end;
  end;

  if (vCol < 3) then
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

procedure TSTRSPickingNoteFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(False);
  if bOk then
    close;
end;

procedure TSTRSPickingNoteFrm.PreviewbitbtnClick(Sender: TObject);
begin
  RunReport(True);
end;

procedure TSTRSPickingNoteFrm.UpdatePicking;
var
  i: integer;
begin
  if strtoint(sgDetails.cells[9,1]) = 0 then
    PickCode := GetNextPicking
  else
    PickCode := strtoint(sgDetails.cells[9,1]);

  {Delete the existing Picking Detail}
  with qryDelPick do
    begin
      close;
      parambyname('Sales_Order_Picking').asinteger := PickCode;
      execsql;
    end;

  for i := 1 to pred(sgDetails.rowcount) do
    begin
      if strtoint(sgDetails.cells[5,i]) = 0 then
        continue;
      with qryAddPick do
        begin
          close;
          ParamByName('Sales_Order_Picking').asInteger := PickCode;
          ParamByName('Picking_No').asinteger := i;
          ParamByName('Sales_Order').asinteger := SONumber;
          ParamByName('Sales_Order_Line_No').asinteger := strtoint(sgDetails.cells[6,i]);

          ParamByName('Quantity_To_Pick').asinteger := strtoint(sgDetails.cells[5,i]);
          if strtoint(sgDetails.cells[9,1]) = 0 then
            ParamByName('Picking_List_Ref').asstring := inttostr(SONumber)+'/'+inttostr(100+(cmbPickingNote.items.count))
          else
            ParamByName('Picking_List_Ref').asstring := inttostr(SONumber)+'/'+inttostr(100+(cmbPickingNote.itemindex));

          ParamByName('Date_Picked').asdatetime := pbdatestr(edtPickingDate.text);
          ParamByName('Part_Bin').asstring := sgDetails.cells[2,i];
          ParamByName('Part_Store_Lot').asstring := sgDetails.cells[7,i];

          ParamByName('Stock_Pack_Quantity').asinteger := strtoint(sgDetails.cells[8,i]);
          ParamByName('Part_Store').asinteger := strtoint(sgDetails.cells[10,i]);
          ParamByName('Invoice_upfront').asstring := sgDetails.cells[11,i];
          ParamByName('Part_Store_Allocation').asinteger := strtoint(sgDetails.cells[12,i]);
          if self.Confirmed then
            Parambyname('Pick_Note_Confirmed').asstring := 'Y'
          else
            Parambyname('Pick_Note_Confirmed').clear;
          ParamByName('Date_Received').asdatetime := pbdatestr(sgDetails.cells[13,i]);
          try
            ParamByName('Sets_per_Pad').asinteger := strtoint(sgDetails.cells[14,i]);
          except
            ParamByName('Sets_per_Pad').asinteger := 1;
          end;

          try
            ParamByName('Purchase_Order').asfloat := strtofloat(sgDetails.cells[15,i]);
          except
            ParamByName('Purchase_Order').asfloat := 0;
          end;
          ExecSQL;
        end;
    end;
end;

function TSTRSPickingNoteFrm.GetNextPicking: integer;
begin
  with qryGetNext do
    begin
      close;
      open;
      result := fieldbyname('Last_Picking').asinteger + 1;
    end;
end;

procedure TSTRSPickingNoteFrm.Runreport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
  Reprint: boolean;
  icount: integer;
  iQtytoPick: integer;
begin
  Reprint := (cmbPickingNote.itemindex <> 0);
  try
    if cmbPickingNote.itemindex = 0 then
      begin
        for icount := 1 to pred(sgDetails.rowcount) do
          begin
            if (strtoint(sgDetails.cells[5,icount]) > (strtoint(sgDetails.cells[3,icount]) - strtoint(sgDetails.cells[4,icount]))) then
              begin
                iQtytoPick := strtoint(sgDetails.cells[3,icount]) - strtoint(sgDetails.cells[4,icount]);
                MessageDlg('You cannot request to pick more than is available to pick, which is ' + inttostr(iQtytoPick)
                        + ' for item ' + inttostr(icount) + ', product code ' + sgDetails.cells[0,icount], mtError, [mbOk], 0);
                bOK := false;
                exit;
              end;
          end;

        if MessageDlg('Do you want to create a picking note for the selected items?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            PickCode := 0;
            UpdatePicking;
          end
        else
          begin
            bOK := false;
            exit;
          end;
      end
    else
      begin
        for icount := 1 to pred(sgDetails.rowcount) do
          begin
            if (strtoint(sgDetails.cells[5,icount]) > (strtoint(sgDetails.cells[3,icount]))) then
              begin
                MessageDlg('You cannot request to pick more than is allocated for item '
                          + inttostr(icount) + ', product code ' + sgDetails.cells[0,icount], mtError, [mbOk], 0);
                bOK := false;
                exit;
              end;
          end;
        UpdatePicking;
      end;
  except
    messagedlg('There was a problem creating the Picking Note', mtError, [mbOk], 0);
    close;
  end;

  {Setup and print the report}
  STRPPickingNotefrm := TSTRPPickingNotefrm.Create(Self);
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
      STRPPickingNotefrm.Reprint := Reprint;
      STRPPickingNotefrm.Preview := Preview;
      STRPPickingNotefrm.SOPicking := PickCode;

      if STRPPickingNotefrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        end
      else
        begin
          if preview then
            STRPPickingNotefrm.qrDetails.Preview
          else
            begin
              if setupPrinter(PrinterSettings) then
                begin
                  STRPPickingNotefrm.qrDetails.Print;
                  DefaultPrinter := printer.Printers[printer.printerindex];
                  DefaultBin := GetBinSelection;

                  if chkbxPrintCopy.Checked then
                    begin
                      Printers.Printer.PrinterIndex := -1;
                      STRPPickingNotefrm.Reprint := true;
                      STRPPickingNotefrm.qrDetails.Print;
                    end;
                  bOK := true;
                end;
            end;
        end;
    finally
      Printers.Printer.PrinterIndex := -1;
      FPrinted := false;
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    STRPPickingNotefrm.Free;
    ShowPickingNotes;
  end;

  {Prompt to Confirm the picking if printing the Picking Note}
  if (not preview) and chkbxAutoConfirm.checked then
    begin
      if MessageDlg('Do you want to confirm the picking for this picking note?', mtConfirmation, [mbYes, mbNo], 1) = mrYes then
        begin
          stStockDataMod := TstStockDataMod.Create(self);
          stPickDM := TstpickDm.Create(self);
          PickingList := TPickingList.Create(stPickDM);
          try
            ForwardStock; {Check whether the location for this order is forward stock}

            qryPickNotes.First;
            qryPickNotes.MoveBy(cmbPickingNote.ItemIndex);

            pickingList.PickingListRef := inttostr(qryPickNotes.fieldbyname('Sales_Order_Picking').asinteger);
            stPickDM.LoadSOPickingListfromDB(PickingList);
            JobBagNumber := stPickDM.GetJobBagNumber(PickingList.PickLines[0].SalesOrder);
            UpdateTransfers;
            if JobBagNumber <> 0 then
              begin
                TransferToProduction;
                if not UseForwardStock then
                  UpdateProduction;
              end;
          finally
            PickingList.Free;
            stPickDM.free;
            stStockDataMod.Free;
          end;
        end;
    end;
end;

procedure TSTRSPickingNoteFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TSTRSPickingNoteFrm.SetPrinterBin(BinCode : integer );
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

function TSTRSPickingNoteFrm.GetBinSelection: integer;
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

procedure TSTRSPickingNoteFrm.GetDefaultPrinter;
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

  GetPrivateProfileString('Centrereed Broker', 'Picking Note Bin', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

  GetPrivateProfileString('Centrereed Broker', 'Print Copy Picking Note', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);
  sPrintCopy := TempArray;
end;

procedure TSTRSPickingNoteFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  if chkbxPrintCopy.checked then
    sPrintCopy := 'Y'
  else
    sPrintCopy := 'N';

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Picking Note Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Picking Note Bin',inttostr(DefaultBin));
      WriteString('Centrereed Broker', 'Print Copy Picking Note',sPrintCopy);
      Free;
    end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TSTRSPickingNoteFrm.SetPrinted(const Value: boolean);
begin
  FPrinted := Value;
end;

procedure TSTRSPickingNoteFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TSTRSPickingNoteFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TSTRSPickingNoteFrm.cmbPickingNoteClick(Sender: TObject);
begin
  if cmbPickingNote.itemindex = 0 then
    begin
      {Get the Allocation details}
      ShowAllocLineDetails;
      edtPickingDate.text := pbdatestr(daterequired);
    end
  else
    begin
      {Go get the Picking Note Details}
      ShowPickingDetails;
    end;
end;

procedure TSTRSPickingNoteFrm.edtPickingDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  
  PickDate := NewDate;
  (Sender as TEdit).Text := PBDatestr(NewDate);
end;

procedure TSTRSPickingNoteFrm.btnDateClick(Sender: TObject);
begin
  PickDate := InputDate(pbdatestr(edtPickingDate.text));
  edtPickingDate.Text := PBDatestr(PickDate);
end;

function TSTRSPickingNoteFrm.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;

end;

procedure TSTRSPickingNoteFrm.BuildPickingGrid;
var
  i, icount: integer;
begin
  i := 0;

  qryPickNotes.First;
  qryPickNotes.MoveBy(cmbPickingNote.ItemIndex-1);

  with qrySOPicking do
    begin
      close;
      parambyname('Sales_Order_Picking').asinteger := qryPickNotes.fieldbyname('Sales_Order_Picking').asinteger;
      open;

      while eof <> true do
        begin
          sgDetails.cells[0,i+1] := fieldbyname('Part').asstring;
          sgDetails.cells[1,i+1] := fieldbyname('Part_Description').asstring;
          sgDetails.cells[2,i+1] := fieldbyname('Part_Bin').asstring;
          sgDetails.cells[3,i+1] := fieldbyname('Quantity_Allocated').asstring;
          sgDetails.cells[4,i+1] := fieldbyname('Quantity_Used').asstring;
          sgDetails.cells[5,i+1] := fieldbyname('Quantity_To_Pick').asstring;
          sgDetails.cells[6,i+1] := fieldbyname('Sales_Order_Line_no').asstring;
          sgDetails.cells[7,i+1] := fieldbyname('Part_Store_Lot').asstring;
          sgDetails.cells[8,i+1] := fieldbyname('Stock_Pack_Quantity').asstring;
          sgDetails.cells[9,i+1] := fieldbyname('Sales_Order_Picking').asstring;
          sgDetails.cells[10,i+1] := fieldbyname('Part_Store').asstring;
          sgDetails.cells[11,i+1] := fieldbyname('Invoice_upfront').asstring;
          sgDetails.cells[12,i+1] := fieldbyname('Part_Store_Allocation').asstring;
          sgDetails.cells[13,i+1] := pbdatestr(fieldbyname('Date_Received').asdatetime);
          sgDetails.cells[14,i+1] := fieldbyname('Sets_per_Pad').asstring;
          sgDetails.cells[15,i+1] := fieldbyname('Purchase_Order').asstring;
          i := i+1;
          next;
        end;

      Confirmed := (fieldbyname('Pick_Note_Confirmed').asstring = 'Y');
      PickDate := fieldbyname('Date_Picked').asdatetime;
      edtPickingDate.Text := pbdatestr(PickDate);

      if i = 0 then
        sgDetails.rowcount := 2
      else
        sgDetails.rowcount := i + 1;
    end;
  previewBitBtn.enabled := (i > 0);
  printBitBtn.enabled := previewBitBtn.enabled;
end;

procedure TSTRSPickingNoteFrm.sgDetailsSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if Confirmed then
    begin
      sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing];
      exit;
    end;

	if (aCol = 5) then
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]

end;

procedure TSTRSPickingNoteFrm.sgDetailsKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;

end;

procedure TSTRSPickingNoteFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveDefaultPrinter;

end;

procedure TSTRSPickingNoteFrm.SetConfirmed(const Value: boolean);
begin
  FConfirmed := Value;
  lblPickingConfirmed.visible := FConfirmed;
  chkbxAutoConfirm.Visible := not FConfirmed;
end;

procedure TSTRSPickingNoteFrm.UpdateTransfers;
var
  iType, ilots, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
  sReference, sMoveType: string;
  iStoreStock, iItem: integer;
  rCost: real;
  bInvupfront: boolean;
  sInvUpFront: string;
begin
  bInvUpfront := false;
  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        PickLine := SelectedLine.Clone;
        {Set up the reference depending on whether a Stock Order or for a job}
        if IsSalesOrder then
          begin
            if JobBagNumber = 0 then
              begin
                if toDestroy then
                  sMoveType := 'X'
                else
                  sMoveType := 'D';
                sReference := 'SalesOrd: ' + inttoStr(PickLine.SalesOrder);
                iItem := PickLine.SalesOrder;
                iType := 1;
              end
            else
              begin
                if toDestroy then
                  sMoveType := 'X'
                else
                  sMoveType := 'U';
                sReference := 'Job Bag: ' + inttoStr(JobBagNumber) + '  (SO/' + inttoStr(PickLine.SalesOrder) +')';
                iItem := PickLine.SalesOrder;
                iType := 1;
              end;
          end
        else
          begin
            sMoveType := 'F';
            sReference := 'SO: ' + inttoStr(PickLine.PurchaseOrder);
            iItem := PickLine.PurchaseOrder;
            iType := 2;
          end;

        if PickLine.LotNumbers.count > 0 then
          begin
            for iLots := 0 to pred(PickLine.LotNumbers.count) do
              begin
                FSelectedLotIndex := iLots;
                LotNumber := SelectedLot.clone;

                iStoreStock := stPickDM.GetStoreStock(PickingList.PickingListRef, pickLine.Part, PickLine.PartBin, LotNumber.LotNumberRef);
                rCost := stPickDM.GetStoreStockCost(iStoreStock)*1;

//                bInvUpfront := stpickDM.CheckInvUpFront(iStoreStock);
                bInvUpFront := pickLine.PaidStock;

                {Update/Downdate the Stock}
                STStockDataMod.updstock(iStoreStock,PickLine.Part,PickingList.PartStore,
                    PickLine.PickBin,LotNumber.LotNumberRef,smoveType,sreference,date,date,-1,0,1,(rCost*-1),PickLine.OrigPurchaseOrder,PickLine.PalletID,PickLine.ProductID,PickLine.Overs);
(*
                if PickLine.QtyPicked > 0 then
                  {Update the Transfer details}
                  begin
                  if itype = 1 then
                    STStockDataMod.AddStockTransfer(LotNumber.LotNumberRef,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                      PickingList.PartStore,PickLine.PickBin,PickingList.PartStore,PickLine.SalesOrderLine,
                        1,1,date,rCost, iStoreStock, bInvUpFront) ;
                  if itype =2 then
                    STStockDataMod.AddStockTransfer(LotNumber.LotNumberRef,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                      PickingList.PartStore,PickLine.PickBin,PickingList.PartStore,PickLine.PurchaseOrderLine,
                        1,1,date,rCost, iStoreStock, bInvUpFront)
                  end;
*)
              end;
          end
        else
          begin
            if (pickline.pickbin <> pickline.PartBin) or (pickline.picklot <>pickline.partStorelot) then
            begin
              iStoreStock := stPickDM.GetStoreStockdiff(PickingList.PartStore, pickLine.Part, PickLine.PickBin,Pickline.PickLot);
              rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
            end
            else
             begin
              istorestock := Pickline.StoreStock;
              rCost := stPickDM.GetStoreStockCost(PickLine.StoreStock)*PickLine.QtyPicked;
             end ;

//            bInvUpfront := stpickDM.CheckInvUpFront(iStoreStock);
            bInvUpFront := pickLine.PaidStock;
            PickLine.PickCost := rCost;
            {Update/Downdate the Stock}
            STStockDataMod.updstock(istorestock,PickLine.Part,PickingList.PartStore,
                PickLine.PickBin,PickLine.PickLot,smoveType,sreference,date,date,(PickLine.QtyPicked*-1),0,PickLine.PackSize,(rCost*-1),Pickline.OrigPurchaseOrder,PickLine.PalletID,PickLine.ProductID,PickLine.Overs);

          end;

        {De-allocate the stock details}
        {If Purchase Order then update the Qty Sent on the Purchase Order}
        if iType = 2 then
          begin
            stPickDM.UpdatePurchOrder(PickLine.PurchaseOrder,PickLine.PurchaseOrderLine,PickLine.QtyPicked);
            STStockDataMod.DeAllocStock(iItem, PickLine.QtyAlloc, iType, PickLine.PurchaseOrderLine);

(*            STStockDataMod.AddStockTransfer(PickLine.PickLot,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                                    PickingList.PartStore,PickLine.PickBin,PickingList.PartStore,PickLine.PurchaseOrderLine,
                                    PickLine.QtyPicked,PickLine.PackSize,date,rCost,iStoreStock,bInvUpFront)
*)
          end
        else
        if iType = 1 then
          begin
            if not UseForwardStock then
              begin
                stPickDM.UpdateSalesOrder(PickLine.SalesOrder,PickLine.SalesOrderLine,PickLine.QtyPicked);
                if bInvUpfront then
                  stPickDM.UpdateSalesOrderQtyInv(PickLine.SalesOrder,PickLine.SalesOrderLine,PickLine.QtyPicked);
              end;
            STStockDataMod.DeAllocStock(iItem, PickLine.QtyAlloc, iType, PickLine.SalesOrderLine);

            if icount = Pred(PickingList.PickLines.count) then
              begin
                stPickDM.UpdateOrderStatus(PickLine.SalesOrder);
                stPickDM.UpdateJobBag(PickLine.SalesOrder);
              end;
          end;
        stPickDM.UpdatePickingStatus(PickingList.PickingListRef);
        PickingList.PickLines[iCount].Assign(PickLine);
      end;
end;

procedure TSTRSPickingNoteFrm.TransferToProduction;
var
  iType, ilots, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
  sReference, sMoveType: string;
  iStoreStock, iItem: integer;
  rCost: real;
  bInvupfront: boolean;
  sInvUpFront: string;
  iMoveStore: integer;
  sMoveBin: string;
  iQtyOvers, iQtyOversThisRec, iQtyOverPicked, iQtyOverPickedThisRec: integer;
  sPart: string;
begin
  iQtyOversThisRec := 0;
  iQtyOvers := 0;
  iQtyOverPicked := 0;
  iQtyOverPickedThisRec := 0;

  bInvUpfront := false;
  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        PickLine := SelectedLine.Clone;

        if PickLine.Part <> sPart then
          begin
            iQtyOvers := STPickDM.GetSalesOrderOvers(PickLine.SalesOrder, PickLine.SalesOrderLine);
            iQtyOverPicked := GetTotalPartPicked(PickLine.Part) - GetTotalPartAllocated(PickLine.Part);
            sPart := PickLine.Part;
          end;

        {Set up the reference depending on whether a Stock Order or for a job}
        sMoveType := 'V';
        iMoveStore := stPickDM.GetProductionStore(PickLine.SalesOrder);
        if iMoveStore = 0 then
          iMoveStore := PickingList.PartStore;

        sMoveBin := stPickDM.GetProductionBin(PickLine.SalesOrder);
        if sMoveBin = '' then
          sMoveBin := PickLine.PickBin;

        sReference := 'Job Bag: ' + inttoStr(JobBagNumber) + '  (SO/' + inttoStr(PickLine.SalesOrder) +')';
        iItem := PickLine.SalesOrder;
        iType := 1;

        if (pickline.pickbin <> pickline.PartBin) or (pickline.picklot <> pickline.partStorelot) then
          begin
            iStoreStock := stPickDM.GetStoreStockdiff(PickingList.PartStore, pickLine.Part, PickLine.PickBin,Pickline.PickLot);
//            rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
            rCost := PickLine.PickCost;
          end
        else
          begin
            istorestock := Pickline.StoreStock;
//            rCost := stPickDM.GetStoreStockCost(PickLine.StoreStock)*PickLine.QtyPicked;
            rCost := PickLine.PickCost;
          end ;

        //        bInvUpfront := stpickDM.CheckTransferInvUpFront(iStoreStock,PickLine.SalesOrder,PickLine.SalesOrderLine);
        bInvUpFront := pickLine.PaidStock;

        if bInvUpFront then
          sInvUpFront := 'Y'
        else
          sInvUpFront := 'N';

        iStoreStock :=  STStockDataMod.AddandGetStoreStock(PickLine.Part,iMoveStore,sMoveBin,PickLine.PickLot,smoveType,sreference,
                        PickLine.LotDate,date,PickLine.QtyPicked,0,PickLine.PackSize,rCost,PickLine.LotDescription, sInvUpFront,PickLine.SetsPerPad, PickLine.OrigPurchaseOrder,PickLine.PalletID,PickLine.Overs);

        if iQtyOvers > 0 then
          begin
            if PickLine.QtyPicked > iQtyOvers then
              iQtyOversThisRec := iQtyOvers
            else
              iQtyOversThisRec := PickLine.QtyPicked;
          end
        else
          iQtyOversThisRec := 0;

        if iQtyOverPicked > 0 then
          begin
            if (PickLine.QtyPicked - PickLine.QtyAlloc) > iQtyOverPicked then
              iQtyOverPickedThisRec := iQtyOverPicked
            else
            if (PickLine.QtyPicked - PickLine.QtyAlloc) > 0 then
              iQtyOverPickedThisRec := (PickLine.QtyPicked - PickLine.QtyAlloc)
            else
              iQtyOverPickedThisRec := 0;
          end
        else
          iQtyOverPickedThisRec := 0;

        if iStoreStock > 0 then
          begin
            STStockDataMod.AllocStoreStock(iStoreStock, PickLine.SalesOrder, PickLine.QtyPicked, 1, PickLine.SalesOrderLine, iQtyOversThisRec, iQtyOverPickedThisRec);

            STStockDataMod.AddStockTransfer(PickLine.PickLot,PickLine.Part,PickLine.SalesOrder,PickLine.PurchaseOrder,
                iMoveStore,sMoveBin,iMoveStore,PickLine.SalesOrderLine, PickLine.QtyPicked,PickLine.PackSize,date,rCost,iStoreStock, binvUpFront);

          end;

        stPickDM.UpdateSalesOrderStatus(PickLine.SalesOrder,120);
        iQtyOvers := iQtyOvers - iQtyOversThisRec;
        iQtyOverPicked := iQtyOverPicked - iQtyOverPickedThisRec;
      end;
end;

procedure TSTRSPickingNoteFrm.UpdateProduction;
var
  iType, ilots, icount: integer;
  PickLine: TPickLine;
  LotNumber: TLotNumber;
  sReference, sMoveType: string;
  iStoreStock, iItem: integer;
  rCost: real;
  bInvupfront: boolean;
  sInvUpFront: string;
begin
  bInvUpfront := false;
  stPickDM.LoadSOProductionDets(PickingList,SONumber);

  for icount := 0 to Pred(PickingList.PickLines.count) do
    with PickingList.PickLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        PickLine := SelectedLine.Clone;
        {Set up the reference depending on whether a Stock Order or for a job}
        sMoveType := 'J';
        sReference := 'Job Bag: ' + inttoStr(JobBagNumber) + '  (SO/' + inttoStr(PickLine.SalesOrder) +')';
        iItem := PickLine.SalesOrder;
        iType := 1;

        if (pickline.pickbin <> pickline.PartBin) or (pickline.picklot <>pickline.partStorelot) then
          begin
            iStoreStock := stPickDM.GetStoreStockdiff(PickingList.PartStore, pickLine.Part, PickLine.PickBin,Pickline.PickLot);
            rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
//            rCost := PickLine.PickCost;
          end
        else
          begin
            istorestock := Pickline.StoreStock;
            rCost := stPickDM.GetStoreStockCost(iStoreStock)*PickLine.QtyPicked;
//            rCost := PickLine.PickCost;
          end ;

        bInvUpFront := pickLine.PaidStock;
        PickLine.PickCost := rCost;

        {Update/Downdate the Stock}
        STStockDataMod.updstock(istorestock,PickLine.Part,PickingList.PartStore,
               PickLine.PickBin,PickLine.PickLot,smoveType,sreference,date,date,(PickLine.QtyPicked*-1),0,PickLine.PackSize,(rCost*-1),PickLine.OrigPurchaseOrder,PickLine.PalletID,PickLine.ProductID,PickLine.Overs);

        STStockDataMod.DeAllocStock(iItem, PickLine.QtyAlloc, iType, PickLine.SalesOrderLine);

(*        if icount = Pred(PickingList.PickLines.count) then
          begin
            stPickDM.UpdateOrderStatus(PickLine.SalesOrder);
            stPickDM.UpdateJobBag(PickLine.SalesOrder);
          end;
*)
        stPickDM.UpdateSalesOrder(PickLine.SalesOrder,PickLine.SalesOrderLine,(PickLine.QtyAlloc-PickLine.QtyPicked)*-1);
        if bInvUpfront then
          stPickDM.UpdateSalesOrderQtyInv(PickLine.SalesOrder,PickLine.SalesOrderLine,(PickLine.QtyAlloc-PickLine.QtyPicked)*-1);

        stPickDM.UpdatePickingStatus(PickingList.PickingListRef);
        PickingList.PickLines[iCount].Assign(PickLine);
      end;
  stPickDM.UpdateOrderStatus(SONumber);
  stPickDM.UpdateJobBag(SONumber);
end;

function TSTRSPickingNoteFrm.GetSelectedLine: TPickLine;
begin
  if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := PickingList.PickLines[FSelectedLineIndex];
end;

function TSTRSPickingNoteFrm.GetSelectedLot: TLotNumber;
begin
  if (SelectedLine = nil) or (FSelectedLotIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.LotNumbers[FSelectedLotIndex];
end;

procedure TSTRSPickingNoteFrm.ForwardStock;
begin
  with qryProdLocation do
    begin
      close;
      parambyname('Sales_Order').asinteger := SONumber;
      open;
      UseForwardStock := (fieldbyname('Receive_Forward_Stock').asstring = 'Y');
    end;
end;

function TSTRSPickingNoteFrm.GetTotalPartAllocated(tempPart: string): integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(PickingList.PickLines.Count) do
    begin
      if tempPart = PickingList.PickLines[i].Part then
        Result := Result + PickingList.PickLines[i].QtyAlloc
    end;
end;

function TSTRSPickingNoteFrm.GetTotalPartPicked(tempPart: string): integer;
var
  i : integer;
begin
  Result := 0;
  for i := 0 to Pred(PickingList.PickLines.Count) do
    begin
      if tempPart = PickingList.PickLines[i].Part then
        Result := Result + PickingList.PickLines[i].QtyPicked;
    end;
end;

end.
