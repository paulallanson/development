unit wtLUSalesInvoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, wtSalesInvoiceDM,
  Data.DB, System.ImageList, Vcl.Buttons,
  QrCtrls, IniFiles;

type
  TfrmWTLUSalesInvoices = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsbrDetails: TStatusBar;
    imglstFunctions: TImageList;
    tmrSearch: TTimer;
    Panel2: TPanel;
    btnClose: TButton;
    btnPrint: TToolButton;
    btnDelete: TToolButton;
    edtSalesInvNo: TEdit;
    Label2: TLabel;
    chkbxShowArchived: TCheckBox;
    ToolButton3: TToolButton;
    Label3: TLabel;
    edtInvoiceDate: TEdit;
    btnReports: TToolButton;
    ToolButton6: TToolButton;
    Panel3: TPanel;
    Label4: TLabel;
    btnReprint: TToolButton;
    Label5: TLabel;
    cmbCustomerFilter: TComboBox;
    BitBtn1: TBitBtn;
    btnPayments: TToolButton;
    ToolButton1: TToolButton;
    btnSearch: TBitBtn;
    btnRequestforPayment: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure chkbxShowArchivedClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
    procedure edtSalesInvNoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPaymentsClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure btnRequestforPaymentClick(Sender: TObject);
  private
    activeCode: integer;
    FDisableNameChangeEvent: boolean;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TsiMode);
    procedure CallReport(const bPreview: Boolean);
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    function GetBinSelection: integer;
    procedure GetDefaultPrinter;
  private
    DontSaveLayout: Boolean;
    dtmdlAllSInvoices: TdtmdlSalesInvoice;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetSalesInvoiceEdit(Dataset: TDataset);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmWTLUSalesInvoices: TfrmWTLUSalesInvoices;

implementation

uses
  AllCommon, WtMaintSalesInvoice, printers, wtRSSalesInvoice, WTLUSalesInvoiceRpts,
  WTLUSalesInvoiceSO, wtRSSalesInvoiceReprint, wtAccExport1, WTMaintSalesInvPay,
  wtLUPayments, WTSInvoiceSearch, wtLUSalesInvoiceRFP, wtMain;

{$R *.DFM}

procedure TfrmWTLUSalesInvoices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'SalesInvoicesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmWTLUSalesInvoices.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesInvoices.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
  with IniFile do
    begin
      if (ReadString('Sales Invoices', 'Customer Filter', '0') = '0') then
        cmbCustomerFilter.itemindex := 0
      else
      if (ReadString('Sales Invoices', 'Customer Filter', '1') = '1') then
        cmbCustomerFilter.itemindex := 1
      else
      if (ReadString('Sales Invoices', 'Customer Filter', '2') = '2') then
        cmbCustomerFilter.itemindex := 2
      else
      if (ReadString('Sales Invoices', 'Customer Filter', '3') = '3') then
        cmbCustomerFilter.itemindex := 3;

      DefaultPrinter := ReadString('Sales Invoices', 'Invoice Printer', '');
    end;
  finally
    IniFile.Free;
  end;

  windowstate := wsMaximized;

  dtmdlAllSInvoices := TdtmdlSalesInvoice.create(self);

  dtmdlAllSInvoices.dsSIHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllSInvoices.dsSIHeaderGrid;

  edtInvoiceDate.text := paDateStr(date);

  dtmdlAllSInvoices.dsSIHeaderGrid.dataset.AfterScroll := SetSalesInvoiceEdit;
  AllCommon.SetDBGridCols('', 'SalesInvoicesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUSalesInvoices.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSInvoices do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnReprint.enabled := HeaderCount > 0;
    btnPayments.enabled := HeaderCount > 0;
    edtSalesInvNo.Text := dbgDetails.datasource.dataset.fieldbyname('invoice_no').asstring;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmWTLUSalesInvoices.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllSInvoices.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSInvoices.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUSalesInvoices.FormShow(Sender: TObject);
begin
//  dtmdlAllSInvoices.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmWTLUSalesInvoices.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllSInvoices.Customer := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSalesInvoices.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUSalesInvoices.chkbxShowArchivedClick(Sender: TObject);
begin
  dtmdlAllSInvoices.DisplayArchived := chkbxShowArchived.checked;
  dtmdlAllSInvoices.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSInvoices.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUSalesInvoices.CallMaintScreen(aMode : TsiMode);
var
  Key : integer;
  frm : TfrmWtMaintSalesInvoice;
  aInvoice : TSalesInvoice;
  sWarning: string;
begin
  if aMode = siAdd then
    Key := 0
  else
    begin
      Key := dtmdlAllSInvoices.CurrentSInvoice;
      if dbgDetails.DataSource.DataSet.FieldByName('Inactive').Asstring = 'Y' then
        begin
          if MessageDlg('This invoice has been deleted, the details can only be viewed and cannot be modified', mtWarning,
            [mbOk,mbCancel], 0) = mrCancel then
            exit;
          aMode := siView;
        end
      else
      begin
        if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger > 20 then
          begin
            if MessageDlg('This invoice has been posted to the ledger, the details can only be viewed and cannot be modified or deleted', mtWarning,
                      [mbOk,mbCancel], 0) = mrCancel then exit;
//            aMode := siView;
            aMode := siChange;
          end
        else
        if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger = 20 then
          begin
            if aMode = siDelete then
              sWarning := 'This invoice has been printed, are you sure you wish to delete this invoice?'
            else
              sWarning := 'This invoice has been printed, any changes made will require a reprint of the invoice.';

            if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
              exit;
          end;
      end;
    end;

//  dbgDetails.DataSource.DataSet.Close;
  try
    aInvoice := TSalesInvoice.Create(dtmdlAllSInvoices);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TfrmWTMaintSalesInvoice.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.SalesInvoice := aInvoice;
        Frm.ShowModal;
        Key := aInvoice.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aInvoice.Free;
    end;
  finally
    dbgDetails.DataSource.DataSet.Close;
    dbgDetails.DataSource.DataSet.Open;
    dbgDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;

    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
  end;
end;

procedure TfrmWTLUSalesInvoices.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(siChange)
end;

procedure TfrmWTLUSalesInvoices.btnDeleteClick(Sender: TObject);
begin
  if trim(edtSalesInvNo.text) = '' then
    begin
      if dbgDetails.Datasource.Dataset.Locate('Sales_Invoice', dbgDetails.Datasource.Dataset.fieldbyname('Sales_Invoice').asinteger, [loCaseInsensitive]) then
        CallMaintScreen(siDelete)
      else
        ShowMessage('The selected invoice does not exist in the current selection.');
    end
  else
  if dbgDetails.Datasource.Dataset.Locate('Invoice_no', edtSalesInvNo.Text, [loCaseInsensitive]) then
    CallMaintScreen(siDelete)
  else
    ShowMessage('Sales Invoice: '+ edtSalesInvNo.Text + ' does not exist in the current selection.');

//  CallMaintScreen(siDelete)
end;

procedure TfrmWTLUSalesInvoices.CallReport(const bPreview: Boolean);
begin
end;

procedure TfrmWTLUSalesInvoices.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TfrmWTLUSalesInvoices.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  Key : Integer ;
  frm : TfrmwtRSSalesInvoice;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

//  dbgDetails.DataSource.DataSet.Close;

  GetDefaultPrinter;
  
  try
    Frm := TfrmwtRSSalesInvoice.Create(Self);
    Key := dbgDetails.Datasource.Dataset.FieldByName('Sales_Invoice').AsInteger;
    try
      Frm.icode := Key;
      Frm.InvoicePrint := true;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
    dbgDetails.DataSource.DataSet.Close;
    dbgDetails.DataSource.DataSet.Open;
    dbgDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;

    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
  end;
end;

function TfrmWTLUSalesInvoices.GetBinSelection: integer;
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

procedure TfrmWTLUSalesInvoices.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmWTLUSalesInvoices.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmWTLUSalesInvoices.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUSalesInvoices.btnReportsClick(Sender: TObject);
begin
  frmWTLUSalesInvoiceRpts := TfrmWTLUSalesInvoiceRpts.create(self);
  try
    frmWTLUSalesInvoiceRpts.showmodal;
  finally
    frmWTLUSalesInvoiceRpts.free;
  end;
end;

procedure TfrmWTLUSalesInvoices.btnReprintClick(Sender: TObject);
var
  icount: integer;
  key: integer;
  SINumber: integer;
  frm : TfrmwtRSSalesInvoiceReprint;
begin
  SINumber := dbgDetails.Datasource.Dataset.FieldByName('Invoice_no').AsInteger;
  Key := dbgDetails.Datasource.Dataset.FieldByName('sales_invoice').AsInteger;
  try
    Frm := TfrmWTRSSalesInvoiceReprint.Create(Self);
    try
      Frm.icode := Key;

      GetDefaultPrinter;

//      Frm.memSelection.text := inttostr(SINumber);
        {Build up the selection memo box based on the selection}
        for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
          begin
            dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
            if iCount = 0 then
              Frm.memselection.Text := dbgDetails.datasource.dataset.fieldbyname('invoice_no').asstring
            else
              Frm.memselection.Text := Frm.memselection.Text + ',' + dbgDetails.datasource.dataset.fieldbyname('invoice_no').asstring;
          end;

      Frm.InvoicePrint := true;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
  end;
end;

procedure TfrmWTLUSalesInvoices.SetSalesInvoiceEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
      try
        edtSalesInvNo.Text := Dataset.FieldByName('Invoice_no').asstring;
      except
        edtSalesInvNo.Text := '';
      end;
    end;
  with Dataset do
  begin
    btnPrint.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnRePrint.enabled := (fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnDelete.enabled := not (fieldByName('Inactive').asstring = 'Y');
  end;
end;

procedure TfrmWTLUSalesInvoices.edtSalesInvNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    dbgDetails.SelectedRows.Clear;
    if dbgDetails.Datasource.Dataset.Locate('Invoice_no', Variant(edtSalesInvNo.Text), [loPartialKey]) then
      begin
        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
        btnChangeClick(self)
      end
    else
      ShowMessage('Sales Invoice: '+ edtSalesInvNo.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmWTLUSalesInvoices.btnAddClick(Sender: TObject);
begin
  frmWTLUSalesInvoiceSO := TfrmWTLUSalesInvoiceSO.create(self);
  try
    frmWTLUSalesInvoiceSO.InvoiceDate := edtInvoiceDate.text;
    frmWTLUSalesInvoiceSO.showmodal;
    if frmWTLUSalesInvoiceSO.ModalResult = mrOK then
      dtmdlAllSInvoices.RefreshData;
    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
      end;
    end;

  finally
    frmWTLUSalesInvoiceSO.free;
  end;

end;

procedure TfrmWTLUSalesInvoices.FormActivate(Sender: TObject);
begin
  dtmdlAllSInvoices.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('sales_invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUSalesInvoices.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('sales_invoice').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmWTLUSalesInvoices.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
VAR
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue: string;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  TempRect := Rect;
  if (dbgDetails.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'I') and
    (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Invoice No') and
      (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Goods') and
      (Column.Title.Caption <> 'Total Paid') and
      (Column.Title.Caption <> 'Deposit Paid') and
      (Column.Title.Caption <> 'VAT') then
  	begin
  		StrPCopy(txt, Column.field.asstring);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
    		WITH Sender AS TDBGrid DO
      		BEGIN
           	if  (Column.Title.Caption <> 'Invoice No.') and
              (Column.Title.Caption <> 'Goods') and
              (Column.Title.Caption <> 'Total') and
              (Column.Title.Caption <> 'Total Paid') and
              (Column.Title.Caption <> 'Deposit Paid') and
               (Column.Title.Caption <> 'VAT') then
              	begin
        			Canvas.Brush.Color := Color;
        			Canvas.Font.Color  := Font.Color;
        			Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,
          			Column.field.asstring);
                 end;
      		END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Goods') or
          (Column.Title.Caption = 'Total') or
          (Column.Title.Caption = 'Total Paid') or
          (Column.Title.Caption = 'Deposit Paid') or
          (Column.Title.Caption = 'VAT') then
        try
            sValue := formatfloat('£#,###,##0.00',StrToFloatDef(Column.field.asstring, 0, FormatSettings))
        except
          sValue := ''
        end
      else
        sValue := Column.field.asstring;
  		StrPCopy(Txt, sValue);

  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TfrmWTLUSalesInvoices.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlAllSInvoices.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlAllSInvoices.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUSalesInvoices.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
    begin
      WriteString('Sales Invoices', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
      WriteString('Sales Invoices', 'Invoice Printer',DefaultPrinter);
    end;
  finally
    IniFile.Free;
  end;


  Printers.Printer.PrinterIndex := -1;
end;

procedure TfrmWTLUSalesInvoices.BitBtn1Click(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TfrmWTLUSalesInvoices.btnPaymentsClick(Sender: TObject);
var
  OldCursor : TCursor;
  Key, SOrder, tmpStatus: integer;
begin
  key := dbgDetails.DataSource.dataset.fieldbyname('Sales_Invoice').asinteger;

  try
    SOrder := strtoint(dbgDetails.DataSource.dataset.fieldbyname('Reference').asstring);
  except
    SOrder := 0;
  end;

  tmpStatus := dbgDetails.DataSource.dataset.fieldbyname('Sales_Invoice_Status').asinteger;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUPayments := TfrmWTLUPayments.Create(Self);
  try
    frmWTLUPayments.lblSalesOrder.caption := 'Sales Order: ' + inttostr(SOrder);
    frmWTLUPayments.lblSalesInvoice.caption := 'Sales Invoice: ' + dbgDetails.DataSource.dataset.fieldbyname('Invoice_No').asstring;
    frmWTLUPayments.lblCustomer.caption := 'Customer: ' + dbgDetails.DataSource.dataset.fieldbyname('Customer_Name').asstring;
    frmWTLUPayments.lblAccountCode.caption := 'Account Code: ' + dbgDetails.DataSource.dataset.fieldbyname('Account_Code').asstring;
    frmWTLUPayments.lblDescription.caption := 'Description:' + dbgDetails.DataSource.dataset.fieldbyname('Description').asstring;
    frmWTLUPayments.rDepositTerms := 0;
    frmWTLUPayments.rTotalValue := dbgDetails.DataSource.dataset.fieldbyname('Total_Value').asfloat;
    frmWTLUPayments.rDepositAmount := dbgDetails.DataSource.dataset.fieldbyname('Deposit_Amount').asfloat;
    frmWTLUPayments.InvoiceNumber := dbgDetails.DataSource.dataset.fieldbyname('Invoice_No').asstring;
    frmWTLUPayments.SalesInvoice := key;
    frmWTLUPayments.SalesOrder := SOrder;
    frmWTLUPayments.ShowModal;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
    Screen.Cursor := OldCursor;
  finally
    frmWTLUPayments.free;
  end;

end;

procedure TfrmWTLUSalesInvoices.ToolButton1Click(Sender: TObject);
var
  key: integer;
  aInvoice: TSalesInvoice;
begin
  key := dbgDetails.DataSource.dataset.fieldbyname('Sales_Invoice').asinteger;

  try
    aInvoice := TSalesInvoice.Create(dtmdlAllSInvoices);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      aInvoice.SIStatus := 25;
      aInvoice.SaveToDB(true);
    finally
      aInvoice.Free;
    end;
  finally
    dbgDetails.DataSource.DataSet.Close;
    dbgDetails.DataSource.DataSet.Open;
    dbgDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;

    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
  end;
end;

procedure TfrmWTLUSalesInvoices.btnSearchClick(Sender: TObject);
begin
  frmWTSInvoiceSearch := TfrmWTSInvoiceSearch.create(self);
  try
    frmWTSInvoiceSearch.dtmdlSalesInvoice := dtmdlAllSInvoices;
    frmWTSInvoiceSearch.bInvoice := true;
    frmWTSInvoiceSearch.edtDescription.text := dtmdlAllSInvoices.Description;
    frmWTSInvoiceSearch.edtCustomerOrder.text := dtmdlAllSInvoices.CustomerOrder;
//    frmWTSInvoiceSearch.edtProjectReference.Text := dtmdlAllSInvoices.ProjectReference;
    frmWTSInvoiceSearch.edtReference.Text := dtmdlAllSInvoices.Reference;
    frmWTSInvoiceSearch.edtStatus.Text := dtmdlAllSInvoices.Status;
    frmWTSInvoiceSearch.edtOfficeContact.Text := dtmdlAllSInvoices.OfficeContact;
    frmWTSInvoiceSearch.edtOperatorName.Text := dtmdlAllSInvoices.OperatorName;
    frmWTSInvoiceSearch.edtRepName.Text := dtmdlAllSInvoices.RepName;
    frmWTSInvoiceSearch.chkbxShowInactive.checked := dtmdlAllSInvoices.ShowInactive;
    frmWTSInvoiceSearch.showModal;
  finally
    frmWTSInvoiceSearch.free;
  end;

end;

procedure TfrmWTLUSalesInvoices.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlAllSInvoices.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllSInvoices.SortOrder := SortField + SortType;
  dtmdlAllSInvoices.SortType := SortType;

  dtmdlAllSInvoices.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUSalesInvoices.btnRequestforPaymentClick(Sender: TObject);
begin
  frmWTLUSalesInvoiceRFP := TfrmWTLUSalesInvoiceRFP.Create(Self);
  try
    frmWTLUSalesInvoiceRFP.ShowModal;
  finally
    frmWTLUSalesInvoiceRFP.free;
  end;

end;

procedure TfrmWTLUSalesInvoices.GetDefaultPrinter;
var
  sBin: string;
  icount: integer;
  TempArray: array[0..255] of Char;
begin
  {Find the default printer in the list of printers }
  Printers.Printer.PrinterIndex := -1;
  for icount := 0 to pred(Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
        Printers.Printer.PrinterIndex := icount;
    end;
end;


end.
