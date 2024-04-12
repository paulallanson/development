unit wtRSSOStockDeAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, QrCtrls, ComCtrls, OleCtnrs, DB, Menus,
  Dateutils, IniFiles, Grids, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait;

type
  TfrmWTRSSOStockDeAllocation = class(TForm)
    pnlFooter: TPanel;
    stsBrDetails: TStatusBar;
    btnClose: TButton;
    dbgDetails: TDBGrid;
    pnlHeader: TPanel;
    grpbxDateSelect: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblProcessing: TLabel;
    prgbrRecords: TProgressBar;
    btnAllocate: TButton;
    dtsSalesOrders: TDataSource;
    qrySalesOrders: TFDQuery;
    qryDummyOld: TFDQuery;
    qryGetGSmart: TFDQuery;
    qryGetStockCode: TFDQuery;
    wtStkDatabase: TFDConnection;
    qryUpdSOLine: TFDQuery;
    qryUpdSO: TFDQuery;
    qryGetSalesOrder: TFDQuery;
    qryGetStockSystem: TFDQuery;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edtMoveDateFrom: TEdit;
    edtMoveDateTo: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryDeAllocQuoteSlab: TFDQuery;
    qryGetSalesOrderLine: TFDQuery;
    qryDummy: TFDQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgrpSelectByClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdgrpSortByClick(Sender: TObject);
    procedure rdgrpCategoryClick(Sender: TObject);
    procedure chkbxShowOnlyScheduledClick(Sender: TObject);
    procedure chkbxIncludeInvoicedClick(Sender: TObject);
    procedure btnAllocateClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    DateMoveTo, DateMoveFrom, DateTo, DateFrom: Tdatetime;
    ExportPath: string;
    OrderFile: TextFile;
    OrderFilename: array[0..255] of Char;
    sStockCode: string;
    StockSystem: string;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure GetDetails;
    procedure AllocateStock;
    procedure AllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
    function CheckStock(tempWT, tempThickness, tempLength, tempDepth: integer; Quantity: real): boolean;
    procedure CloseExportFile(tempSO: integer);
    procedure CloseExportOrderLineFile(tempSO, tempLine: integer; tempStockCode: string);
    procedure CreateExportFile;
    procedure CreateGSmartExportHeader;
    procedure CreateGSmartOrderFile(tmpOrder: integer);
    procedure CreateGSmartOrderLineFile(tmpOrder, tmpLine, tmpSlabLine: integer; tmpStockCode: string);
    procedure CreateStockOrderFile(tempSO: integer);
    procedure CreateStockOrderLineFile(tempSO, tempLine, tempSlabLine: integer; tempStockCode: string);
    procedure DeAllocateQuoteSlab(tempQuote, tempWT, tempThickness, tempLength, tempDepth: integer);
    procedure DeAllocateStock;
    procedure DeAllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
    procedure GetStockSystemDetails(Code: string);
    function GetWorktopStockCode(tempWT, tempThickness, tempLength, tempDepth: integer): string;
  public
    { Public declarations }
  end;

var
  frmWTRSSOStockDeAllocation: TfrmWTRSSOStockDeAllocation;

implementation

uses UITypes, 
  wtMain, AllCommon, WTSrchCustomer, DateSelV5, wtDataModule;

{$R *.dfm}

procedure TfrmWTRSSOStockDeAllocation.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOStockDeAllocation.enableOK(Sender: TObject);
begin
  btnAllocate.enabled :=
                    (edtMoveDateFrom.Text <> '') and
                    (edtMoveDateTo.Text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '') and
                    (dtsSalesOrders.DataSet.RecordCount > 0);
end;

procedure TfrmWTRSSOStockDeAllocation.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
  GetDetails;
end;

function TfrmWTRSSOStockDeAllocation.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSOStockDeAllocation.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
  with IniFile do
    begin
    end;
  finally
    IniFile.Free;
  end;

  DateMoveFrom := Date - 1;
  DateMoveTo := Date;
  edtMovedateFrom.Text := paDateStr(dateMovefrom);
  edtMoveDateTo.Text := paDateStr(dateMoveto);
  DateFrom := Date ;
  DateTo := Date + 7;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);

  StockSystem := dtmdlWorktops.StockSystemCode;
  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTRSSOStockDeAllocation.rdgrpSelectByClick(Sender: TObject);
begin
  grpbxDateSelect.Caption := (Sender as TRadioGroup).items[(Sender as TRadioGroup).itemindex];
end;

procedure TfrmWTRSSOStockDeAllocation.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  with IniFile do
    begin
    end;
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTRSSOStockDeAllocation.FormActivate(Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.GetDetails;
var
  iCount: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  qrySalesOrders.SQL.text := qryDummy.SQL.Text;
  
  qrySalesOrders.Close;

  DateMovefrom := padatestr(edtMoveDatefrom.Text);
  DateMoveTo := padatestr(edtMoveDateTo.Text);

(*  Datefrom := padatestr(edtDatefrom.Text);
  DateTo := padatestr(edtDateTo.Text);
*)
  qrySalesOrders.parambyname('Date_Move_From').Asdatetime := DateMovefrom + StrToTime('00:00:00');
  qrySalesOrders.parambyname('Date_Move_To').Asdatetime := DateMoveTo + StrToTime('23:59:59');

(*  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom + StrToTime('00:00:00');
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo + StrToTime('23:59:59');
*)
  qrySalesOrders.Open;

  stsBrDetails.panels[0].text := inttostr(qrySalesOrders.recordcount) + ' records displayed';
  EnableOK(self);
end;

procedure TfrmWTRSSOStockDeAllocation.rdgrpSortByClick(Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.rdgrpCategoryClick(Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.chkbxShowOnlyScheduledClick(
  Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.chkbxIncludeInvoicedClick(
  Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.btnAllocateClick(Sender: TObject);
begin
  GetStockSystemDetails(StockSystem);

  if MessageDlg('Do you want to de-allocate the stock on the selected orders?',
            mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit;
  DeAllocateStock;

  messagedlg('Stock allocation is complete.', mtInformation,[mbOk], 0);

  exit;
end;

procedure TfrmWTRSSOStockDeAllocation.GetStockSystemDetails(Code: string);
begin
  with qryGetStockSystem do
    begin
      close;
      parambyname('Stock_System').asstring := Code;
      open;
      ExportPath := fieldbyname('Sales_Order_Import_Directory').asstring;
    end;
end;

procedure TfrmWTRSSOStockDeAllocation.AllocateStock;
var
  iOrigOrder: integer;
  bAllocateStock: boolean;
begin
  with qrySalesOrders do
    begin
      iOrigOrder := 0;
      bAllocateStock := false;

      first;
      while eof <> true do
        begin
          if (iOrigOrder <> fieldbyname('Sales_Order').asinteger) and (iOrigOrder <> 0) and bAllocateStock then
            CreateStockOrderFile(iOrigOrder);
          sleep(1000);
          bAllocateStock := CheckStock(fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger, fieldbyname('Slab_Quantity').asfloat);

          {I bAllocateStock true then update the sales order line allocate qty and create a file to send to GSmart}
          if bAllocateStock then
            AllocateStockOrder(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger, DateFrom, DateTo);

          iOrigOrder := fieldbyname('Sales_Order').asinteger;
          next;
        end;

      if (iOrigOrder <> 0) and bAllocateStock then
        CreateStockOrderFile(iOrigOrder);
    end;
end;

procedure TfrmWTRSSOStockDeAllocation.DeAllocateQuoteSlab(tempQuote, tempWT, tempThickness, tempLength, tempDepth: integer);
begin
  with qryDeAllocQuoteSlab do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      parambyname('Worktop').asinteger := tempWT;
      parambyname('Thickness').asinteger := tempThickness;
      parambyname('Length').asinteger := tempLength;
      parambyname('Depth').asinteger := tempDepth;
      execsql;
    end;
end;

procedure TfrmWTRSSOStockDeAllocation.DeAllocateStock;
var
  iOrigOrder, icount, iMax, iSlabLine: integer;
  bAllocateStock: boolean;
begin
  self.pnlExportPrgrss.Visible := true;
  self.pnlExportPrgrss.Repaint;
  lblProcessing.caption := 'De-allocating stock ' + inttostr(qrySalesOrders.recordcount) + ' orders';

  iMax := qrySalesOrders.recordcount;

  prgbrRecords.Position := 0;
  icount := 0;

  with qrySalesOrders do
    begin
      iOrigOrder := 0;
      iSlabLine := 1;

      first;
      while eof <> true do
        begin
          if (iOrigOrder <> fieldbyname('Sales_Order').asinteger) and (iOrigOrder <> 0) then
            begin
              iSlabLine := 1;
            end;

          DeAllocateStockOrder(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger, DateFrom, DateTo);

          sStockCode := GetWorktopStockCode(fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger);

          DeAllocateQuoteSlab(fieldbyname('Quote').asinteger, fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger);

          CreateStockOrderLineFile(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger, iSlabLine, sStockCode);

          iOrigOrder := fieldbyname('Sales_Order').asinteger;

          inc(icount);
          prgbrRecords.Position := Round( icount / iMax * 100);
          Application.ProcessMessages;

          inc(iSlabLine);
          next;
        end;

(*      if (iOrigOrder <> 0) then
        CreateStockOrderFile(iOrigOrder);
*)
    end;
end;

function TfrmWTRSSOStockDeAllocation.CheckStock(tempWT, tempThickness, tempLength, tempDepth: integer; Quantity: real): boolean;
var
  sStockCode: string;
  rAvailableStock: real;
begin
  result := false;

  sStockCode := GetWorktopStockCode(tempWT, tempThickness, tempLength, tempDepth);

  {Check for enough stock if there is a stock code}
  if sStockCode <> '' then
    begin
      with qryGetGSmart do
        begin
          close;
          parambyname('StockCode').asstring := sStockCode;
          open;
          rAvailableStock := (fieldbyname('Total_Quantity').asfloat + fieldbyname('PO_Quantity').asfloat) - fieldbyname('Allocated_Quantity').asfloat;

          if rAvailableStock >= Quantity then
            result := true;
        end;
    end;
end;

function TfrmWTRSSOStockDeAllocation.GetWorktopStockCode(tempWT, tempThickness, tempLength, tempDepth: integer): string;
begin
  Result := '';
  with qryGetStockCode do
    begin
      close;
      parambyname('Worktop').asinteger := tempWT;
      parambyname('Thickness').asinteger := tempThickness;
      parambyname('Length').asinteger := tempLength;
      parambyname('Depth').asinteger := tempDepth;
      open;

      result := fieldbyname('Stock_Code').asstring;
    end;
end;

procedure TfrmWTRSSOStockDeAllocation.AllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
begin
(*  with qryUpdSO do
    begin
      close;
      parambyname('Sales_order').asinteger := tempSO;
      if dtFrom = 0 then
        parambyname('Stock_Allocation_Start_Date').clear
      else
        parambyname('Stock_Allocation_Start_Date').asdatetime := dtFrom;

      if dtTo = 0 then
        parambyname('Stock_Allocation_End_Date').clear
      else
        parambyname('Stock_Allocation_End_Date').asdatetime := dtTo;
      execsql;
    end;

*)
  with qryUpdSOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempSO;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      parambyname('Quantity_Allocated').asinteger := 1;
      if dtFrom = 0 then
        parambyname('Stock_Allocation_Start_Date').clear
      else
        parambyname('Stock_Allocation_Start_Date').asdatetime := dtFrom;

      if dtTo = 0 then
        parambyname('Stock_Allocation_End_Date').clear
      else
        parambyname('Stock_Allocation_End_Date').asdatetime := dtTo;
      execsql;
    end;
end;

procedure TfrmWTRSSOStockDeAllocation.DeAllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
begin
(*  with qryUpdSO do
    begin
      close;
      parambyname('Sales_order').asinteger := tempSO;
      parambyname('Stock_Allocation_Start_Date').clear;
      parambyname('Stock_Allocation_End_Date').clear;
      execsql;
    end;
*)

  with qryUpdSOLine do
    begin
      close;
      parambyname('Sales_order').asinteger := tempSO;
      parambyname('Sales_order_Line_no').asinteger := tempLine;
      parambyname('Quantity_Allocated').asinteger := 0;
      parambyname('Stock_Allocation_Start_Date').clear;
      parambyname('Stock_Allocation_End_Date').clear;
      execsql;
    end;
end;

procedure TfrmWTRSSOStockDeAllocation.CreateStockOrderFile(tempSO: integer);
begin
  CreateExportFile;
  CreateGSmartExportHeader;
  CreateGSmartOrderFile(tempSO);
  CloseExportFile(tempSO);
end;

procedure TfrmWTRSSOStockDeAllocation.CreateStockOrderLineFile(tempSO, tempLine, tempSlabLine: integer; tempStockCode: string);
begin
  CreateExportFile;
  CreateGSmartExportHeader;
  CreateGSmartOrderLineFile(tempSO, tempLine, tempSlabLine, tempStockCode);
  CloseExportOrderLineFile(tempSO, tempLine, tempStockCode);
end;

procedure TfrmWTRSSOStockDeAllocation.CreateExportFile;
var
  sLocation, sFileName: string;
  zLocation, zFileName: array[0..255] of char;
begin
  sLocation := GetWinTempDir;

  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;

  StrPCopy(OrderFilename, sFilename);

  assignfile(OrderFile, OrderFilename);
  try
    deletefile(OrderFilename);
  except
  end;

  try
    Append(OrderFile);
  except
    begin
      try
        ReWrite(OrderFile);
      except
        MessageDlg('Can''t open the Order output file ' + OrderFileName,
          mtInformation,
          [mbOk], 0);
        Exit;
      end;
    end;
  end;
end;

procedure TfrmWTRSSOStockDeAllocation.CreateGSmartExportHeader;
var
  tempStr: string;
begin
  tempStr := 'ORDERREF'
    + ',ACCOUNTREF'
    + ',ACCOUNTNAME'
    + ',STOCKCODE'
    + ',ALTERNATESTOCKCODE'
    + ',QUANTITY'
    + ',DESCRIPTION'
    + ',ORDERDATE'
    + ',DUEDATE'
    + ',ITEMLINE';

  Writeln(OrderFile, tempStr);
end;

procedure TfrmWTRSSOStockDeAllocation.CreateGSmartOrderFile(tmpOrder: integer);
var
  tempstr: string;
  iCount: integer;
  sStockCode: string;
begin
  with qryGetSalesOrder do
  begin
    Close;
    parambyname('Sales_Order').asinteger := tmpOrder;
    Open;

    First;
    icount := 0;

    while (not EOF) do
    begin
      iCount := icount + 1;

      //Order
      tempStr := '' + fieldbyname('Sales_Order').asstring + '';

      //Customer Account Code
      tempStr := tempStr + ',' + fieldbyname('Account_Code').asstring + '';

      //Customer
      tempStr := tempStr + ',' + fieldbyname('Customer_Name').asstring + '';

      //Stock Code
      sStockCode := GetWorktopStockCode(fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger);

      tempStr := tempStr + ',' + sStockCode + '';

      //Alternate Stock Code
      tempStr := tempStr + ',' + '' + '';

      //Slab Quantity
      {Allocate and Deallocate}
      tempStr := tempStr + ',' + '0' + '';

      //Description
      tempStr := tempStr + ',' + fieldbyname('Worktop_Description').asstring + '';

      //Order Date
      tempStr := tempStr + ',' + fieldbyname('Date_Raised').asstring + '';

      //Due Date
      tempStr := tempStr + ',' + fieldbyname('Date_Required').asstring + '';

      //Line
      tempStr := tempStr + ',' + inttostr(icount) + '';

      writeln(OrderFile, tempStr);
      next;
    end;
  end;
end;

procedure TfrmWTRSSOStockDeAllocation.CreateGSmartOrderLineFile(tmpOrder, tmpLine, tmpSlabLine: integer; tmpStockCode: string);
var
  tempstr: string;
  iCount: integer;
begin
  with qryGetSalesOrderLine do
  begin
    Close;
    parambyname('Sales_Order').asinteger := tmpOrder;
    parambyname('Sales_Order_Line_no').asinteger := tmpLine;
    parambyname('Stock_Code').asstring := tmpStockCode;
    Open;

    First;
    icount := 0;

    while (not EOF) do
    begin
      iCount := icount + 1;

      //Order
      tempStr := '' + fieldbyname('Sales_Order').asstring + '_' + inttostr(tmpSlabLine) + '';

      //Customer Account Code
      tempStr := tempStr + ',' + fieldbyname('Account_Code').asstring + '';

      //Customer
      tempStr := tempStr + ',' + fieldbyname('Customer_Name').asstring + '';

      //Stock Code
//      sStockCode := GetWorktopStockCode(fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger);

      tempStr := tempStr + ',' + tmpStockCode + '';

      //Alternate Stock Code
      tempStr := tempStr + ',' + '' + '';

      //Slab Quantity
      tempStr := tempStr + ',' + '0' + '';

      //Description
      tempStr := tempStr + ',' + fieldbyname('Worktop_Description').asstring + '';

      //Order Date
      tempStr := tempStr + ',' + fieldbyname('Date_Raised').asstring + '';

      //Due Date
      tempStr := tempStr + ',' + fieldbyname('Date_Required').asstring + '';

      //Line
      tempStr := tempStr + ',' + inttostr(tmpSlabLine) + '';

      writeln(OrderFile, tempStr);
      next;
    end;
  end;
end;

procedure TfrmWTRSSOStockDeAllocation.CloseExportFile(tempSO: integer);
var
  sNewFileName: string;
  NewFilename: array[0..255] of Char;
begin
  {Close the Order file}
  closefile(Orderfile);

  sNewFileName := inttostr(tempSO) + '.csv';
  sNewFileName := ExportPath + '\' + sNewFileName;

  StrPCopy(NewFilename, sNewFilename);
  RenameFile(OrderFileName, NewFilename);

  try
    deletefile(OrderFilename);
  except
  end;

end;

procedure TfrmWTRSSOStockDeAllocation.CloseExportOrderLineFile(tempSO, tempLine: integer; tempStockCode: string);
var
  sNewFileName: string;
  NewFilename: array[0..255] of Char;
begin
  {Close the Order file}
  closefile(Orderfile);

  sNewFileName := inttostr(tempSO) + '_' + inttostr(tempLine) + '_' + tempStockCode + '.csv';
  sNewFileName := ExportPath + '\' + sNewFileName;

  StrPCopy(NewFilename, sNewFilename);
  RenameFile(OrderFileName, NewFilename);

  try
    deletefile(OrderFilename);
  except
  end;

end;

procedure TfrmWTRSSOStockDeAllocation.BitBtn1Click(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtMoveDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtMoveDateFrom.text;

  edtMoveDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
  GetDetails;
end;

procedure TfrmWTRSSOStockDeAllocation.BitBtn2Click(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtMoveDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtMoveDateto.text;

  edtMoveDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
  GetDetails;
end;

end.
