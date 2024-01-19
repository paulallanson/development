unit wtRSSOStockAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtnrs, DB,
   Menus, Dateutils, IniFiles, Grids, DBGrids, ActiveX,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.DataSet;

type
  TfrmWTRSSOStockAllocation = class(TForm)
    pmnCustomers: TPopupMenu;
    Delete1: TMenuItem;
    pnlFooter: TPanel;
    stsBrDetails: TStatusBar;
    btnClose: TButton;
    dbgDetails: TDBGrid;
    pnlHeader: TPanel;
    rdgrpCustomer: TRadioGroup;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    btnCustomer: TButton;
    lstbxCustomers: TListBox;
    rdgrpSortBy: TRadioGroup;
    lstbxCustomersCode: TListBox;
    grpbxDateSelect: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    rdgrpCategory: TRadioGroup;
    rdgrpSelectBy: TRadioGroup;
    chkbxShowOnlyScheduled: TCheckBox;
    chkbxIncludeInvoiced: TCheckBox;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblProcessing: TLabel;
    prgbrRecords: TProgressBar;
    btnAllocate: TButton;
    dtsSalesOrders: TDataSource;
    qrySalesOrders: TFDQuery;
    qryDummy: TFDQuery;
    qryGetGSMStock: TFDQuery;
    qryGetStockCode: TFDQuery;
    wtStkDatabase: TFDConnection;
    qryUpdSOLine: TFDQuery;
    qryUpdSO: TFDQuery;
    qryGetSalesOrder: TFDQuery;
    qryGetStockSystem: TFDQuery;
    btnExclude: TButton;
    rdgrpAllocate: TRadioGroup;
    qryDeleteStoreStock: TFDQuery;
    qryGetGSmartAll: TFDQuery;
    qryCheckStockCode: TFDQuery;
    qryAddStock: TFDQuery;
    qryAdd: TFDQuery;
    qryUpdate: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    qryUpdStock: TFDQuery;
    qryAddStoreStock: TFDQuery;
    qryGetLastSS: TFDQuery;
    qryGetStock: TFDQuery;
    qryUpStoreStock: TFDQuery;
    qryGetSalesOrderLine: TFDQuery;
    qryDummyOld: TFDQuery;
    qryAllocQuoteSlab: TFDQuery;
    qryDeAllocQuoteSlab: TFDQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure pmnCustomersPopup(Sender: TObject);
    procedure rdgrpSelectByClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdgrpSortByClick(Sender: TObject);
    procedure rdgrpCategoryClick(Sender: TObject);
    procedure chkbxShowOnlyScheduledClick(Sender: TObject);
    procedure chkbxIncludeInvoicedClick(Sender: TObject);
    procedure btnAllocateClick(Sender: TObject);
    procedure dtsSalesOrdersDataChange(Sender: TObject; Field: TField);
    procedure btnExcludeClick(Sender: TObject);
    procedure rdgrpAllocateClick(Sender: TObject);
  private
    DateTo, DateFrom: Tdatetime;
    ExportPath: string;
    OrderFile: TextFile;
    OrderFilename: array[0..255] of Char;
    rep, customer: integer;
    sStockCode: string;
    StockSystem: string;
    SOPInterval: integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure GetDetails;
    procedure AllocateQuoteSlab(tempQuote, tempWT, tempThickness, tempLength, tempDepth: integer);
    procedure AllocateStock;
    procedure AllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
    function CheckStock(tempWT, tempThickness, tempLength, tempDepth: integer; Quantity: real): boolean;
    procedure CloseExportFile(tempSO: integer);
    procedure CloseExportOrderLineFile(tempSO, tempLine: integer; tempStockCode: string);
    procedure CreateExportFile;
    procedure CreateGSmartExportHeader;
    procedure CreateGSmartOrderFile(tmpOrder: integer);
    procedure CreateGSmartOrderLineFile(tmpOrder, tmpLine: integer; tmpStockCode: string);
    procedure CreateStockOrderFile(tempSO: integer);
    procedure CreateStockOrderLineFile(tempSO, tempLine: integer; tempStockCode: string);
    procedure DeAllocateQuoteSlab(tempQuote, tempWT, tempThickness, tempLength, tempDepth: integer);
    procedure DeAllocateStock;
    procedure DeAllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
    procedure GetStockSystemDetails(Code: string);
    function GetWorktopStockCode(tempWT, tempThickness, tempLength, tempDepth: integer): string;
    procedure CreateStoreStock(sStockCode, sStockDescription: string; rTotalQty, rAllocatedQty, rPOQty: real);
    procedure LoadGSMStock;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    function CheckGSmartStock(tempWT, tempThickness, tempLength,
      tempDepth: integer; Quantity: real): boolean;
  public
    { Public declarations }
  end;

var
  frmWTRSSOStockAllocation: TfrmWTRSSOStockAllocation;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, wtDataModule;

{$R *.dfm}

procedure TfrmWTRSSOStockAllocation.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOStockAllocation.btnCustomerClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
//        lstbxSelectedCustomers.Clear;
//        edtCustomer.Clear;
        for iCount := (frmwtSrchCustomer.dbgDetails.SelectedRows.Count - 1) downto 0 do
          begin
            frmwtSrchCustomer.dbgDetails.datasource.DataSet.GotoBookmark(TBookMark(frmwtSrchCustomer.dbgDetails.SelectedRows[iCount])) ;
            lstbxCustomersCode.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer').asstring);
            lstbxCustomers.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
//            edtCustomer.Lines.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
          end;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.enableOK(Sender: TObject);
begin
  btnAllocate.enabled := (lstbxCustomers.count > 0) and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '') and
                    (dtsSalesOrders.DataSet.RecordCount > 0);
end;

procedure TfrmWTRSSOStockAllocation.rdgrpCustomerClick(Sender: TObject);
begin
  case rdgrpCustomer.itemindex of
  0:  begin
        Customer := 0;
        lstbxCustomers.clear;
        lstbxCustomers.items.Add('All Customers');
        lstbxCustomersCode.Clear;
        grpbxCustomer.enabled := false;
      end;
  1:  begin
        lstbxCustomers.clear;
        grpbxCustomer.enabled := true;
      end;
  end;
  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.btnDatefromClick(Sender: TObject);
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

procedure TfrmWTRSSOStockAllocation.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSSOStockAllocation.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSOStockAllocation.btnDateToClick(Sender: TObject);
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

procedure TfrmWTRSSOStockAllocation.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(myWorktops_INIFILE);

  try
  with IniFile do
    begin
      chkbxShowOnlyScheduled.Checked := (ReadString('Sales Order Anticipated Ordering Report', 'Only Show Scheduled', 'N') = 'Y');
      chkbxIncludeInvoiced.Checked := (ReadString('Sales Order Anticipated Ordering Report', 'Include Invoiced Orders', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;

  customer := 0;
  rep := 0;
  DateFrom := Date ;
  DateTo := Date + 7;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);

  StockSystem := dtmdlWorktops.StockSystemCode;
  AllCommon.LoadFormLayout(myWorktops_INIFILE, self);
end;

procedure TfrmWTRSSOStockAllocation.Delete1Click(Sender: TObject);
var
  iCount: integer;
begin
  for iCount := pred(lstbxCustomers.items.count) downto 0 do
    begin
      if lstbxCustomers.Selected[iCount] then
        begin
          lstbxCustomers.Items.Delete(iCount);
          lstbxCustomersCode.Items.Delete(iCount);
        end;
    end;
end;

procedure TfrmWTRSSOStockAllocation.pmnCustomersPopup(Sender: TObject);
begin
  if lstbxCustomers.items.count < 1 then
    exit;
end;

procedure TfrmWTRSSOStockAllocation.rdgrpSelectByClick(Sender: TObject);
begin
  grpbxDateSelect.Caption := (Sender as TRadioGroup).items[(Sender as TRadioGroup).itemindex];
end;

procedure TfrmWTRSSOStockAllocation.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(myWorktops_INIFILE);

  with IniFile do
    begin
      if chkbxIncludeInvoiced.Checked then
        WriteString('Sales Order Anticipated Ordering Report', 'Include Invoiced Orders', 'Y')
      else
        WriteString('Sales Order Anticipated Ordering Report', 'Include Invoiced Orders', 'N');

      if chkbxShowOnlyScheduled.checked then
        WriteString('Sales Order Anticipated Ordering Report', 'Only Show Scheduled', 'Y')
      else
        WriteString('Sales Order Anticipated Ordering Report', 'Only Show Scheduled', 'N');
    end;
  AllCommon.SaveFormLayout(myWorktops_INIFILE, self);
end;

procedure TfrmWTRSSOStockAllocation.FormActivate(Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.GetDetails;
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
  
  case rdgrpSelectBy.itemindex of
    1: begin
        qrySalesOrders.SQL.Add(' AND ((Sales_Order.Date_Type = ''C'')) ');
       end;
    2: begin
        qrySalesOrders.SQL.Add(' AND ((Sales_Order.Date_Type = ''P'')) ');
       end;
  end;

  if lstbxCustomersCode.Count > 0 then
    begin
      qrySalesOrders.SQL.Add(' AND (');
      for icount := 0 to pred(lstbxCustomersCode.Count) do
        begin
          if iCount = 0 then
            qrySalesOrders.SQL.Add('(Sales_Order.Customer = ' + lstbxCustomersCode.items[iCount] + ')')
          else
            qrySalesOrders.SQL.Add(' OR (Sales_Order.Customer = ' + lstbxCustomersCode.items[iCount] + ')')
        end;
      qrySalesOrders.SQL.Add(')');
    end;

  qrySalesOrders.SQL.Add(
      'GROUP BY ' +
      ' Sales_Order.Sales_Order, ' +
      ' Sales_Order_Line.Quote, ' +
      ' Sales_Order.Date_Raised, ' +
      ' Sales_Order.Sales_Order_Status, ' +
      ' Sales_Order.Template_Date, ' +
      ' Sales_Order.Date_Required, ' +
      ' Sales_Order.Customer_Name, ' +
      ' Sales_Order.Reference, ' +
      ' Sales_Order.IsFittingInOutlook, ' +
      ' Customer.Is_Retail_Customer, ' +
      ' Customer.Is_Commercial_Customer, ' +
      ' Sales_Order.Rep, ' +
      ' Rep.Rep_Name, ' +
      ' Worktop.Description, ' +
      ' Material_Type.Description, ' +
      ' Thickness.Thickness_mm, ' +
      ' Quote_Slab.Worktop, ' +
      ' Quote_Slab.Thickness, ' +
      ' Quote_Slab.Length, ' +
      ' Quote_Slab.Depth, ' +
      ' Sales_Order_Status.Sales_Order_Status_Desc, '+
      ' Sales_Order.Goods_Value, '+
      ' Sales_Order.VAT_Value, '+
      ' Sales_Order_Line.Unit_Price, '+
      ' Sales_order_line.Sales_Order_line_no');

  case rdgrpAllocate.ItemIndex of
        0:  begin
              qrySalesOrders.SQL.Add('HAVING (SUM(Quote_Slab.Quantity - ISNULL(Quote_Slab.Quantity_Allocated,0)) > 0) ');
            end;
        else
          begin
              qrySalesOrders.SQL.Add('HAVING (SUM(Quote_Slab.Quantity - ISNULL(Quote_Slab.Quantity_Allocated,0)) = 0) ');
          end;
  end;

  case rdgrpsortby.itemindex of
    0:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Sales_Order');
      end;
    1:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Date_Required, Sales_Order.Sales_Order');
      end;
    2:begin
        qrySalesOrders.SQL.Add('ORDER BY Sales_Order.Customer_Name, Sales_Order.Sales_Order');
      end;
    3:begin
        qrySalesOrders.SQL.Add('ORDER BY Rep.Rep_Name, Sales_Order.Sales_Order');
      end;
  end;

  qrySalesOrders.Close;

  case rdgrpCategory.ItemIndex of
        0:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'A';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qrySalesOrders.ParambyName('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qrySalesOrders.Parambyname('Is_Retail_Customer').asstring := 'N';
              qrySalesOrders.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;
  if chkbxShowOnlyScheduled.Checked then
    qrySalesOrders.parambyname('IsFittingInOutlook').asstring := 'Y'
  else
    qrySalesOrders.parambyname('IsFittingInOutlook').asstring := 'N';

  if chkbxIncludeInvoiced.checked then
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 110
  else
    qrySalesOrders.parambyname('Sales_Order_Status').asinteger := 55;

(*  case rdgrpAllocate.ItemIndex of
        0:  begin
              qrySalesOrders.Parambyname('Quantity_Allocated').asinteger := 0;
            end;
        else
          begin
            qrySalesOrders.Parambyname('Quantity_Allocated').asinteger := 1;
          end;
  end;
*)

  Datefrom := padatestr(edtDatefrom.Text);
  DateTo := padatestr(edtDateTo.Text);
  qrySalesOrders.parambyname('Rep').asinteger := rep;
  qrySalesOrders.parambyname('Date_From').Asdatetime := Datefrom + StrToTime('00:00:00');
  qrySalesOrders.parambyname('Date_To').Asdatetime := DateTo + StrToTime('23:59:59');
  qrySalesOrders.Open;

  stsBrDetails.panels[0].text := inttostr(qrySalesOrders.recordcount) + ' records displayed';
  EnableOK(self);
end;

procedure TfrmWTRSSOStockAllocation.rdgrpSortByClick(Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.rdgrpCategoryClick(Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.chkbxShowOnlyScheduledClick(
  Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.chkbxIncludeInvoicedClick(
  Sender: TObject);
begin
  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.btnAllocateClick(Sender: TObject);
begin
  GetStockSystemDetails(StockSystem);

  case rdgrpAllocate.ItemIndex of
    0:  begin
          if MessageDlg('Do you want to allocate stock for the selected orders?',
            mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit;

          LoadGSMStock;
          AllocateStock;

          messagedlg('Stock allocation is complete.', mtInformation,[mbOk], 0);
        end;
    else
        begin
          if MessageDlg('Do you want to de-allocate the stock on the selected orders?',
            mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
              exit;

          DeAllocateStock;

          messagedlg('Stock de-allocation is complete.', mtInformation,[mbOk], 0);
        end;
  end;

  exit;
end;

procedure TfrmWTRSSOStockAllocation.GetStockSystemDetails(Code: string);
begin
  with qryGetStockSystem do
    begin
      close;
      parambyname('Stock_System').asstring := Code;
      open;
      ExportPath := fieldbyname('Sales_Order_Import_Directory').asstring;
      SOPInterval := fieldbyname('Order_Process_Interval').asinteger;
    end;
end;

procedure TfrmWTRSSOStockAllocation.LoadGSMStock;
var
  iCount, iMax: integer;
begin
  self.pnlExportPrgrss.Visible := true;
  self.pnlExportPrgrss.Repaint;

  prgbrRecords.Position := 0;
  icount := 0;

  {Delete all stock }
  with qryDeleteStoreStock do
    begin
      close;
      execsql;
    end;

  {Load Stock details from GSM}
  with qryGetGSmartAll do
    begin
      close;
      open;

      lblProcessing.caption := 'Loading GSmart Stock: ' + inttostr(qryGetGSmartAll.recordcount) + ' stock items';

      iMax := recordcount;

      first;

      while eof <> true do
        begin

          CreateStoreStock(fieldbyname('Stock_Code').asstring, fieldbyname('Stock_Description').asstring, fieldbyname('Total_Quantity').asfloat, fieldbyname('Allocated_Quantity').asfloat,fieldbyname('PO_Quantity').asfloat);

          inc(icount);
          prgbrRecords.Position := Round( icount / iMax * 100);
          Application.ProcessMessages;

          next;
        end;
    end;

  self.pnlExportPrgrss.visible := false;
  self.Repaint;
end;

procedure TfrmWTRSSOStockAllocation.AllocateStock;
var
  iOrigOrder, iCount, iMax: integer;
  bAllocateStock: boolean;
begin
  self.pnlExportPrgrss.Visible := true;
  self.pnlExportPrgrss.Repaint;
  lblProcessing.caption := 'Exporting to GSmart Stock ' + inttostr(qrySalesOrders.recordcount) + ' orders';

  iMax := qrySalesOrders.recordcount;

  prgbrRecords.Position := 0;
  icount := 0;

  with qrySalesOrders do
    begin
      iOrigOrder := 0;
      bAllocateStock := false;

      first;
      while eof <> true do
        begin
(*          if (iOrigOrder <> fieldbyname('Sales_Order').asinteger) and (iOrigOrder <> 0) and bAllocateStock then
            begin
              CreateStockOrderFile(iOrigOrder);
            end;
*)

//          bAllocateStock := CheckGSmartStock(fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger, fieldbyname('Slab_Quantity').asfloat);

          bAllocateStock := CheckStock(fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger, fieldbyname('Slab_Quantity').asfloat);

          {I bAllocateStock true then update the sales order line allocate qty and create a file to send to GSmart}
          if bAllocateStock then
            begin
              AllocateStockOrder(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger, DateFrom, DateTo);

              AllocateQuoteSlab(fieldbyname('Quote').asinteger, fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger);

              CreateStockOrderLineFile(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger, sStockCode);
            end;

          iOrigOrder := fieldbyname('Sales_Order').asinteger;

          inc(icount);
          prgbrRecords.Position := Round( icount / iMax * 100);
          Application.ProcessMessages;

          next;
        end;

(*      if (iOrigOrder <> 0) and bAllocateStock then
        CreateStockOrderFile(iOrigOrder);
*)
    end;

  self.pnlExportPrgrss.visible := false;
  self.Repaint;
end;

procedure TfrmWTRSSOStockAllocation.DeAllocateStock;
var
  iOrigOrder, icount, iMax: integer;
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
      first;
      while eof <> true do
        begin
(*          if (iOrigOrder <> fieldbyname('Sales_Order').asinteger) and (iOrigOrder <> 0) then
            CreateStockOrderFile(iOrigOrder);
*)
          DeAllocateStockOrder(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger, DateFrom, DateTo);

          sStockCode := GetWorktopStockCode(fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger);

          DeAllocateQuoteSlab(fieldbyname('Quote').asinteger, fieldbyname('Worktop').asinteger, fieldbyname('Thickness').asinteger, fieldbyname('Slab_Length').asinteger, fieldbyname('Slab_Depth').asinteger);

          CreateStockOrderLineFile(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_Order_line_no').asinteger, sStockCode);

          iOrigOrder := fieldbyname('Sales_Order').asinteger;

          inc(icount);
          prgbrRecords.Position := Round( icount / iMax * 100);
          Application.ProcessMessages;

          next;
        end;

(*      if (iOrigOrder <> 0) then
        CreateStockOrderFile(iOrigOrder);
*)
    end;

  self.pnlExportPrgrss.visible := false;
  self.Repaint;
end;

function TfrmWTRSSOStockAllocation.CheckGSmartStock(tempWT, tempThickness, tempLength, tempDepth: integer; Quantity: real): boolean;
var
  sStockCode: string;
  rAvailableStock: real;
begin
  result := false;

  sStockCode := GetWorktopStockCode(tempWT, tempThickness, tempLength, tempDepth);

  {Check for enough stock if there is a stock code}
  if sStockCode <> '' then
    begin
      with qryGetGSMStock do
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

function TfrmWTRSSOStockAllocation.CheckStock(tempWT, tempThickness, tempLength, tempDepth: integer; Quantity: real): boolean;
var
  iStoreStock: integer;
  rAvailableStock: real;
begin
  result := false;

  sStockCode := GetWorktopStockCode(tempWT, tempThickness, tempLength, tempDepth);

  {Check for enough stock if there is a stock code}
  if sStockCode <> '' then
    begin
      with qryGetStock do
        begin
          close;
          parambyname('StockCode').asstring := sStockCode;
          open;

          if recordcount > 0 then
            begin
              rAvailableStock := (fieldbyname('Total_Quantity').asfloat) - fieldbyname('Allocated_Quantity').asfloat;
              iStoreStock := fieldbyname('Store_Stock').asinteger;

              if rAvailableStock >= Quantity then
                result := true;
            end;
        end;

      {Allocate the stock}
      if Result = true then
        begin
          with qryUpStoreStock do
            begin
              close;
              parambyname('Store_Stock').asinteger := iStoreStock;
              parambyname('Quantity_Allocated').asfloat := Quantity;
              execsql;
            end;
        end;
    end;
end;

function TfrmWTRSSOStockAllocation.GetWorktopStockCode(tempWT, tempThickness, tempLength, tempDepth: integer): string;
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

procedure TfrmWTRSSOStockAllocation.AllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
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

procedure TfrmWTRSSOStockAllocation.AllocateQuoteSlab(tempQuote, tempWT, tempThickness, tempLength, tempDepth: integer);
begin
  with qryAllocQuoteSlab do
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

procedure TfrmWTRSSOStockAllocation.DeAllocateQuoteSlab(tempQuote, tempWT, tempThickness, tempLength, tempDepth: integer);
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

procedure TfrmWTRSSOStockAllocation.DeAllocateStockOrder(tempSO, tempLine: integer; dtFrom, dtTo: TDateTime);
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
      parambyname('Stock_Allocation_Start_Date').clear;
      parambyname('Stock_Allocation_End_Date').clear;
      execsql;
    end;
end;

procedure TfrmWTRSSOStockAllocation.CreateStockOrderFile(tempSO: integer);
begin
  CreateExportFile;
  CreateGSmartExportHeader;
  CreateGSmartOrderFile(tempSO);
  CloseExportFile(tempSO);
end;

procedure TfrmWTRSSOStockAllocation.CreateStockOrderLineFile(tempSO, tempLine: integer; tempStockCode: string);
begin
  CreateExportFile;
  CreateGSmartExportHeader;
  CreateGSmartOrderLineFile(tempSO, tempLine, tempStockCode);
  CloseExportOrderLineFile(tempSO, tempLine, tempStockCode);
end;

procedure TfrmWTRSSOStockAllocation.CreateExportFile;
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

procedure TfrmWTRSSOStockAllocation.CreateGSmartExportHeader;
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

procedure TfrmWTRSSOStockAllocation.CreateGSmartOrderFile(tmpOrder: integer);
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
      case rdgrpAllocate.ItemIndex of
        0:  begin
              tempStr := tempStr + ',' + fieldbyname('Slab_Quantity').asstring + '';
            end;
        else
          begin
              tempStr := tempStr + ',' + '0' + '';
          end;
      end;

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

procedure TfrmWTRSSOStockAllocation.CreateGSmartOrderLineFile(tmpOrder, tmpLine: integer; tmpStockCode: string);
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
      tempStr := '' + fieldbyname('Sales_Order').asstring + '';

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
      {Allocate and Deallocate}
      case rdgrpAllocate.ItemIndex of
        0:  begin
              tempStr := tempStr + ',' + fieldbyname('Slab_Quantity').asstring + '';
            end;
        else
          begin
              tempStr := tempStr + ',' + '0' + '';
          end;
      end;

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

procedure TfrmWTRSSOStockAllocation.CloseExportFile(tempSO: integer);
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

procedure TfrmWTRSSOStockAllocation.CloseExportOrderLineFile(tempSO, tempLine: integer; tempStockCode: string);
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

procedure TfrmWTRSSOStockAllocation.dtsSalesOrdersDataChange(
  Sender: TObject; Field: TField);
begin
  btnExclude.Enabled := (dtsSalesOrders.DataSet.RecordCount > 0);
end;

procedure TfrmWTRSSOStockAllocation.btnExcludeClick(Sender: TObject);
var
  icount: integer;
begin
  if MessageDlg('Do you want to exclude the selected orders?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for iCount := (dbgDetails.SelectedRows.Count - 1) downto 0 do
        begin
          dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
          AllocateStockOrder(dbgDetails.datasource.DataSet.fieldbyname('Sales_Order').asinteger, dbgDetails.datasource.DataSet.fieldbyname('Sales_Order_Line_No').asinteger, 0, 0);

          AllocateQuoteSlab(dbgDetails.datasource.DataSet.fieldbyname('Quote').asinteger, dbgDetails.datasource.DataSet.fieldbyname('Worktop').asinteger, dbgDetails.datasource.DataSet.fieldbyname('Thickness').asinteger, dbgDetails.datasource.DataSet.fieldbyname('Slab_Length').asinteger, dbgDetails.datasource.DataSet.fieldbyname('Slab_Depth').asinteger);
        end;

      messagedlg('The selected orders have been excluded.', mtInformation,[mbOk], 0);

      GetDetails;
    end;
  
end;

procedure TfrmWTRSSOStockAllocation.rdgrpAllocateClick(Sender: TObject);
begin
  btnAllocate.Caption := (Sender as TRadioGroup).Items.Strings[(Sender as TRadioGroup).Itemindex];

  btnExclude.Visible := ((Sender as TRadioGroup).itemindex = 0);

  chkbxShowOnlyScheduled.caption := stringreplace(chkbxShowOnlyScheduled.caption,'Allocate',btnAllocate.Caption,[]);

  GetDetails;
end;

procedure TfrmWTRSSOStockAllocation.CreateStoreStock(sStockCode, sStockDescription: string; rTotalQty, rAllocatedQty, rPOQty: real);
var
  bExist: boolean;
  iStockItem, iStoreStock: integer;
begin
  {Check if stock code exists}
  with qryCheckStockCode do
    begin
      close;
      parambyname('Stock_Code').asstring := sStockCode;
      open;

      bExist := (recordcount > 0);
      iStockItem := fieldbyname('Stock_Item').asinteger;
    end;

  {Create the stock item}
  if not bExist then
    begin
      iStockItem := GetNextKey;

      with qryUpdStock do
        begin
          close;
          parambyname('Stock_Item').asinteger := iStockItem;
          parambyname('Stock_Code').asstring := sStockCode;
          parambyname('Stock_Description').asstring := sStockDescription;
          execsql;
        end;
    end;

  {Get next store stock item}
  with qryGetLastSS do
    begin
      close;
      open;
      iStoreStock := fieldbyname('Last_Item').asinteger + 1;
    end;

  {Add Stock record}
  with qryAddStoreStock do
    begin
      close;
      parambyname('Store_Stock').asinteger := iStoreStock;
      parambyname('Stock_Item').asinteger := iStockItem;
      parambyname('Store').asinteger := 1;
      parambyname('Bin').asstring := 'FACTORY';
      parambyname('Quantity_in_Stock').asfloat := rTotalQty + rPOQty;
      parambyname('Quantity_Allocated').asfloat := rAllocatedQty;
      parambyname('Unit_Price').asfloat := 0.00;
      parambyname('Price_Unit').asinteger := 2;
      parambyname('Store_Stock_Description').asstring := 'Slab';
      parambyname('Lot_Reference').asstring := '0000001';
      parambyname('Date_Received').asdatetime := date;
      parambyname('Serial_No').asstring := '1';
      parambyname('Depth').asinteger := 0;
      parambyname('Length').asinteger := 0;
      parambyname('Product').clear;
      execsql;
    end;
end;

function TfrmWTRSSOStockAllocation.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert stock record
    with qryAddStock do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Stock_Item').AsInteger;
      Close;
    end;

  finally
    DeleteZero;
  end;
end;

procedure TfrmWTRSSOStockAllocation.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Stock_Item ' +
            '(Stock_Item, Stock_Code, Stock_Description) ' +
            'VALUES (0, ''Dummy'', ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTRSSOStockAllocation.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Stock_Item Where Stock_Item = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
