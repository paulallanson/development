unit wtLUSalesCredits;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, wtSalesInvoiceDM,
  Data.DB, System.ImageList, Vcl.Buttons, IniFiles;

type
  TfrmWTLUSalesCredits = class(TForm)
    CoolBar1: TCoolBar;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsbrDetails: TStatusBar;
    imglstFunctions: TImageList;
    pmnFunctions: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Copy1: TMenuItem;
    Repeat1: TMenuItem;
    PrintFaxOrder1: TMenuItem;
    N1: TMenuItem;
    Allocate1: TMenuItem;
    Picking1: TMenuItem;
    N2: TMenuItem;
    Proofs1: TMenuItem;
    N3: TMenuItem;
    Delivery1: TMenuItem;
    N4: TMenuItem;
    ResetGrid1: TMenuItem;
    tmrSearch: TTimer;
    Panel2: TPanel;
    btnClose: TButton;
    edtSalesInvNo: TEdit;
    Label2: TLabel;
    chkbxShowArchived: TCheckBox;
    Label3: TLabel;
    edtInvoiceDate: TEdit;
    Panel3: TPanel;
    Label4: TLabel;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton3: TToolButton;
    btnPrint: TToolButton;
    btnReprint: TToolButton;
    ToolButton6: TToolButton;
    btnReports: TToolButton;
    Label5: TLabel;
    cmbCustomerFilter: TComboBox;
    BitBtn1: TBitBtn;
    btnSearch: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure chkbxShowArchivedClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
    procedure edtSalesInvNoKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
  private
    Activecode: integer;
    FDisableNameChangeEvent: boolean;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TsiMode);
    procedure CallReport(const bPreview: Boolean);
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    function GetBinSelection: integer;
  private
    dLastPEDate: TDateTime;
    DontSaveLayout: Boolean;
    dtmdlAllSCredits:  TdtmdlSalesInvoice;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetSalesInvoiceEdit(Dataset: TDataset);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmWTLUSalesCredits: TfrmWTLUSalesCredits;

implementation

uses
  System.UITypes,
  AllCommon, WtMaintSalesInvoice, printers, wtRSSalesInvoice,
  WTLUSalesInvoiceCN, wtRSSalesInvoiceReprint, WTSInvoiceSearch,
  wtMain;

{$R *.DFM}

procedure TfrmWTLUSalesCredits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  allCommon.SaveDBGridCols('', 'SalesCreditsLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmWTLUSalesCredits.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesCredits.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
  with IniFile do
    begin
      if (ReadString('Sales Credits', 'Customer Filter', '0') = '0') then
        cmbCustomerFilter.itemindex := 0
      else
      if (ReadString('Sales Credits', 'Customer Filter', '1') = '1') then
        cmbCustomerFilter.itemindex := 1
      else
      if (ReadString('Sales Credits', 'Customer Filter', '2') = '2') then
        cmbCustomerFilter.itemindex := 2
      else
      if (ReadString('Sales Credits', 'Customer Filter', '3') = '3') then
        cmbCustomerFilter.itemindex := 3;
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllSCredits := TdtmdlSalesInvoice.create(self);

  dtmdlAllSCredits.dsSCHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllSCredits.dsSCHeaderGrid;

  edtInvoiceDate.text := paDateStr(date);

  dtmdlAllSCredits.dsSCHeaderGrid.dataset.AfterScroll := SetSalesInvoiceEdit;
  allCommon.SetDBGridCols('', 'SalesCreditsLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUSalesCredits.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSCredits do
  begin
    btnChange.Enabled := CreditHeaderCount > 0;
    btnPrint.Enabled := CreditHeaderCount > 0;
    btnReprint.Enabled := CreditHeaderCount > 0;
    btnDelete.Enabled := CreditHeaderCount > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(CreditHeaderCount) + ' records displayed';
  end;
end;

procedure TfrmWTLUSalesCredits.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllSCredits.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSCredits.refreshCreditdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUSalesCredits.FormShow(Sender: TObject);
begin
//  dtmdlAllSCredits.RefreshCreditData;
  edtSearch.setfocus;
end;

procedure TfrmWTLUSalesCredits.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllSCredits.Customer := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSalesCredits.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUSalesCredits.chkbxShowArchivedClick(Sender: TObject);
begin
  dtmdlAllSCredits.DisplayArchived := chkbxShowArchived.checked;
  dtmdlAllSCredits.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSCredits.refreshCreditdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUSalesCredits.CallMaintScreen(aMode : TsiMode);
var
  Key : integer;
  frm : TfrmWtMaintSalesInvoice;
  aInvoice : TSalesInvoice;
  sWarning: string;
  tmpOK: boolean;
begin
  if aMode = siAdd then
    Key := 0
  else
    begin
      Key := dtmdlAllSCredits.CurrentCreditNote;
      if dbgDetails.DataSource.DataSet.FieldByName('Inactive').Asstring = 'Y' then
        begin
          if MessageDlg('This credit note has been deleted, the details can only be viewed and cannot be modified', mtWarning,
            [mbOk,mbCancel], 0) = mrCancel then
            exit;
          aMode := siView;
        end
      else
      begin
        if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger > 20 then
          begin
            if MessageDlg('This credit note has been posted to the ledger, the details can only be viewed and cannot be modified or deleted', mtWarning,
              [mbOk,mbCancel], 0) = mrCancel then exit;
            aMode := siView;
          end
        else
        if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger = 20 then
          begin
            if aMode = siDelete then
              sWarning := 'This credit note has been printed, are you sure you wish to delete this credit note?'
            else
              sWarning := 'This credit note has been printed, any changes made will require a reprint of the credit note.';

            if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
              exit;
          end;
      end;
    end;

//  dbgDetails.DataSource.DataSet.Close;
  try
    aInvoice := TSalesInvoice.Create(dtmdlAllSCredits);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TfrmWtMaintSalesInvoice.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.SalesInvoice := aInvoice;
        Frm.ShowModal;
        Key := aInvoice.DbKey;
        tmpOK := (Frm.modalresult = idOK);
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

procedure TfrmWTLUSalesCredits.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(siChange)
end;

procedure TfrmWTLUSalesCredits.btnDeleteClick(Sender: TObject);
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
    ShowMessage('Credit Note: '+ edtSalesInvNo.Text + ' does not exist in the current selection.');
end;

procedure TfrmWTLUSalesCredits.CallReport(const bPreview: Boolean);
begin
end;

procedure TfrmWTLUSalesCredits.btnPrintClick(Sender: TObject);
var
  Key : Integer ;
  frm : TfrmwtRSSalesInvoice;
begin
  Key := dbgDetails.Datasource.Dataset.FieldByName('Sales_Invoice').AsInteger;

//  dbgDetails.DataSource.DataSet.Close;
  try
    Frm := TfrmwtRSSalesInvoice.Create(Self);
    try
      Frm.icode := Key;
      Frm.InvoicePrint := false;
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

function TfrmWTLUSalesCredits.GetBinSelection: integer;
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

procedure TfrmWTLUSalesCredits.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmWTLUSalesCredits.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmWTLUSalesCredits.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUSalesCredits.btnReportsClick(Sender: TObject);
begin
(*  frmPBLUSalesInvRpts := TfrmPBLUSalesInvRpts.create(self);
  try
    frmPBLUSalesInvRpts.showmodal;
  finally
    frmPBLUSalesInvRpts.free;
  end;
*)
end;

procedure TfrmWTLUSalesCredits.btnReprintClick(Sender: TObject);
var
  iCount: integer;
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

      Frm.InvoicePrint := false;
      Frm.ShowModal;
    finally
      Frm.Free;
    end;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
  end;
end;

procedure TfrmWTLUSalesCredits.SetSalesInvoiceEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
      try
        edtSalesInvNo.Text := floatToStr(Dataset.FieldByName('Invoice_no').asfloat);
      except
        edtSalesInvNo.Text := '';
      end;
    end;
  with Dataset do
  begin
    btnPrint.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnReprint.enabled := (fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnDelete.enabled := not (fieldByName('Inactive').asstring = 'Y');
  end;
end;

procedure TfrmWTLUSalesCredits.edtSalesInvNoKeyPress(Sender: TObject;
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
      ShowMessage('Sales Credit: '+ edtSalesInvNo.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmWTLUSalesCredits.dbgDetailsDrawColumnCell(Sender: TObject;
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
  if (dbgDetails.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'C') and
    (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Credit Note No.') and
      (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Goods') and
      (Column.Title.Caption <> 'VAT') then
  	begin
      if Assigned(Column.Field) then
    		StrPCopy(Txt, Column.Field.AsString) else
        StrPCopy(Txt, '');
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
           	if  (Column.Title.Caption <> 'Credit Note No.') and
              (Column.Title.Caption <> 'Goods') and
              (Column.Title.Caption <> 'Total') and
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

procedure TfrmWTLUSalesCredits.btnAddClick(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtInvoiceDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtInvoiceDate.SetFocus;
      Exit;
    end;
  end;

  if padatestr(edtInvoiceDate.text) < dLastPEDate then
    begin
      messagedlg('The date entered is for a closed period, enter a date later than '+ padatestr(dLastPEDate), mterror, [mbOK], 0);
      edtInvoiceDate.SetFocus;
      Exit;
    end;

  frmWTLUSalesInvoiceCN := TfrmWTLUSalesInvoiceCN.create(self);
  try
    frmWTLUSalesInvoiceCN.InvoiceDate := edtInvoiceDate.text;
    frmWTLUSalesInvoiceCN.showmodal;
    if frmWTLUSalesInvoiceCN.ModalResult = mrOK then
      dtmdlAllSCredits.RefreshCreditData;
    with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

  finally
    frmWTLUSalesInvoiceCN.free;
  end;
end;

procedure TfrmWTLUSalesCredits.FormActivate(Sender: TObject);
begin
  dtmdlAllSCredits.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSCredits.refreshcreditdata;
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

procedure TfrmWTLUSalesCredits.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('sales_invoice').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmWTLUSalesCredits.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlAllSCredits.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlAllSCredits.RefreshCreditData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUSalesCredits.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    IniFile.WriteString('Sales Credits', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTLUSalesCredits.BitBtn1Click(Sender: TObject);
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

procedure TfrmWTLUSalesCredits.btnSearchClick(Sender: TObject);
begin
  frmWTSInvoiceSearch := TfrmWTSInvoiceSearch.create(self);
  try
    frmWTSInvoiceSearch.dtmdlSalesInvoice := dtmdlAllSCredits;
    frmWTSInvoiceSearch.bInvoice := false;
    frmWTSInvoiceSearch.edtDescription.text := dtmdlAllSCredits.Description;
    frmWTSInvoiceSearch.edtCustomerOrder.text := dtmdlAllSCredits.CustomerOrder;
//    frmWTSInvoiceSearch.edtProjectReference.Text := dtmdlAllSCredits.ProjectReference;
    frmWTSInvoiceSearch.edtReference.Text := dtmdlAllSCredits.Reference;
    frmWTSInvoiceSearch.edtStatus.Text := dtmdlAllSCredits.Status;
    frmWTSInvoiceSearch.edtOfficeContact.Text := dtmdlAllSCredits.OfficeContact;
    frmWTSInvoiceSearch.edtOperatorName.Text := dtmdlAllSCredits.OperatorName;
    frmWTSInvoiceSearch.edtRepName.Text := dtmdlAllSCredits.RepName;
    frmWTSInvoiceSearch.chkbxShowInactive.checked := dtmdlAllSCredits.ShowInactive;
    frmWTSInvoiceSearch.showModal;
  finally
    frmWTSInvoiceSearch.free;
  end;
end;

procedure TfrmWTLUSalesCredits.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlAllSCredits.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllSCredits.SortOrder := SortField + SortType;
  dtmdlAllSCredits.SortType := SortType;

  dtmdlAllSCredits.refreshCreditdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

end.
