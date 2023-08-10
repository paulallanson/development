unit pbLUSalesInvoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, pbSalesInvoiceDM,
  Db, Inifiles, pbJobBagDM, Buttons, System.ImageList;

type
  TfrmPBLUSalesInvoices = class(TForm)
    CoolBar1: TCoolBar;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    stsbrDetails: TStatusBar;
    imglstFunctions: TImageList;
    tmrSearch: TTimer;
    Panel2: TPanel;
    btnClose: TButton;
    edtNumber: TEdit;
    Label2: TLabel;
    pmnRaise: TPopupMenu;
    btnFromProduction: TMenuItem;
    btnfromJobBag: TMenuItem;
    btnFromSalesOrder: TMenuItem;
    Label3: TLabel;
    edtInvoiceDate: TEdit;
    Panel3: TPanel;
    Label4: TLabel;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    btnSeparator1: TToolButton;
    btnPreview: TToolButton;
    btnPrint: TToolButton;
    btnReprint: TToolButton;
    ToolButton6: TToolButton;
    btnSeparator2: TToolButton;
    btnReports: TToolButton;
    pmnDummy: TPopupMenu;
    btnPayments: TToolButton;
    btnPaymentsRpt: TToolButton;
    btnEInvoice: TToolButton;
    btnFromOrderRange: TMenuItem;
    btnSweep: TBitBtn;
    ToolButton2: TToolButton;
    btnSearch: TBitBtn;
    GroupBox1: TGroupBox;
    rdbtnAllPaid: TRadioButton;
    rdbtnPaid: TRadioButton;
    rdbtnUnPaid: TRadioButton;
    rdbtnPartPaid: TRadioButton;
    btnStatements: TToolButton;
    chkbxShowUnfactored: TCheckBox;
    ToolButton1: TToolButton;
    btnOrder: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnFromProductionClick(Sender: TObject);
    procedure btnfromJobBagClick(Sender: TObject);
    procedure btnFromSalesOrderClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure edtInvoiceDateExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPaymentsClick(Sender: TObject);
    procedure btnPaymentsRptClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure btnOrderClick(Sender: TObject);
    procedure btnEInvoiceClick(Sender: TObject);
    procedure btnFromOrderRangeClick(Sender: TObject);
    procedure pmnRaisePopup(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure rdbtnAllPaidClick(Sender: TObject);
    procedure rdbtnPaidClick(Sender: TObject);
    procedure rdbtnUnPaidClick(Sender: TObject);
    procedure rdbtnPartPaidClick(Sender: TObject);
    procedure btnStatementsClick(Sender: TObject);
    procedure chkbxShowUnfactoredClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TsiMode);
    procedure CallReport(const bPreview: Boolean);
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    function GetBinSelection: integer;
    procedure SaveDefaultPrinter;
    procedure GetDefaultPrinter;
    procedure SetPrinterBin(BinCode: integer);
    procedure SetButtonProperties(Sender: TObject);
  private
    ActiveCode: integer;
    FActivated: boolean;
    dLastPEDate: TDateTime;
    DontSaveLayout: Boolean;
    dtmdlAllSInvoices: TdmSalesInvoice;
    iMnuMaint: integer;
    iOperatorRep: Integer;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetSalesInvoiceEdit(Dataset: TDataset);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmPBLUSalesInvoices: TfrmPBLUSalesInvoices;

implementation

uses CCSCommon, PBLUSalesInvoicePO, PBLUSalesInvoiceJB, PBLUSalesInvoiceSO,
      PBMaintSalesInvoice, CCSPrint, Printers, PBRPSalesInv, PBSalesInvPrint,
  pbLUSalesInvRpts, PBSalesInvRPrint, pbDatabase, pbMainMenu,
  PBRSOSSInvPayments, pbMaintSalesInvPay, PBMaintJobBag, PBExportEInvoice,
  PBRSEInvoice, PBRSCustInvoice, pbluSalesInvoiceSearch, PBLUSalesInvStmts, PBLUSalesInvoiceDD;

{$R *.DFM}

procedure TfrmPBLUSalesInvoices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPBLUSalesInvoices.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Centrereed Broker', 'Invoice Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Invoice Bin',inttostr(DefaultBin));
    end;
  finally
    IniFile.Free;
  end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TfrmPBLUSalesInvoices.GetDefaultPrinter;
var
  sBin: string;
  icount: integer;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Invoice Printer', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Invoice Bin', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;

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
end;

procedure TfrmPBLUSalesInvoices.SetPrinterBin(BinCode : integer );
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

procedure TfrmPBLUSalesInvoices.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUSalesInvoices.FormCreate(Sender: TObject);
begin
  dtmdlAllSInvoices := TdmSalesInvoice.create(self);

  dtmdlAllSInvoices.dsSIHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllSInvoices.dsSIHeaderGrid;

  dLastPEDate := dtmdlAllSInvoices.GetLastPeriodEndDate;

  btnPayments.Visible := dtmdlAllSInvoices.IsSecurityUser;
  btnPaymentsRpt.Visible := dtmdlAllSInvoices.IsSecurityUser;

  edtInvoiceDate.text := pbDateStr(date);

  dtmdlAllSInvoices.dsSIHeaderGrid.dataset.AfterScroll := SetSalesInvoiceEdit;

  GetDefaultPrinter;

  CCSCommon.SetDBGridCols('', 'SalesInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuSalesInvoicing',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUSalesInvoices.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSInvoices do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPreview.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnReprint.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnOrder.Enabled := HeaderCount > 0;
    btnPayments.Enabled := HeaderCount > 0;
    btnPaymentsRpt.Enabled := HeaderCount > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUSalesInvoices.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
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

procedure TfrmPBLUSalesInvoices.FormShow(Sender: TObject);
begin
//  dtmdlAllSInvoices.RefreshData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUSalesInvoices.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllSInvoices.Customer := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUSalesInvoices.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUSalesInvoices.btnFromProductionClick(Sender: TObject);
begin
  PBLUSalesInvoicePOfrm := TPBLUSalesInvoicePOfrm.create(self);
  try
    PBLUSalesInvoicePOfrm.InvoiceDate := edtInvoiceDate.text;
    PBLUSalesInvoicePOfrm.showmodal;
    if PBLUSalesInvoicePOfrm.ModalResult = mrOK then
      begin
        dtmdlAllSInvoices.RefreshData;
        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    PBLUSalesInvoicePOfrm.free;
  end;
end;

procedure TfrmPBLUSalesInvoices.btnfromJobBagClick(Sender: TObject);
begin
  PBLUSalesInvoiceJBfrm := TPBLUSalesInvoiceJBfrm.create(self);
  try
    PBLUSalesInvoiceJBfrm.InvoiceDate := edtInvoiceDate.text;
    PBLUSalesInvoiceJBfrm.showmodal;
    if PBLUSalesInvoiceJBfrm.ModalResult = mrOK then
      begin
        dtmdlAllSInvoices.RefreshData;
        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    PBLUSalesInvoiceJBfrm.free;
  end;
end;

procedure TfrmPBLUSalesInvoices.btnFromSalesOrderClick(Sender: TObject);
begin
  PBLUSalesInvoiceSOfrm := TPBLUSalesInvoiceSOfrm.create(self);
  try
    PBLUSalesInvoiceSOfrm.InvoiceDate := edtInvoiceDate.text;
    PBLUSalesInvoiceSOfrm.showmodal;
    if PBLUSalesInvoiceSOfrm.ModalResult = mrOK then
      begin
        dtmdlAllSInvoices.RefreshData;
        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    PBLUSalesInvoiceSOfrm.free;
  end;
end;

procedure TfrmPBLUSalesInvoices.CallMaintScreen(aMode : TsiMode);
var
  Key : integer;
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  sWarning: string;
  tmpMode: TsiMode;
begin
  if aMode = siAdd then
    Key := 0
  else
  if aMode = siView then
    begin
      Key := dtmdlAllSInvoices.CurrentSInvoice;
      if MessageDlg('You only have access to view the selected invoice, continue?', mtConfirmation,
              [mbOk,mbCancel], 0) = mrCancel then exit;
    end
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
        {Check whether Period end has been run on the invoice}
        with dtmdlAllSInvoices.qryPEnd do
        begin
          close;
          parambyname('Sales_invoice').asinteger := Key;
          open;
          if recordcount > 0 then
          begin
          if aMode = siDelete then
            begin
              MessageDlg('This invoice has been included in a period end '
                        + 'and therefore cannot be deleted.', mterror, [mbOk], 0);
              exit;
            end
          else
            begin
              if dmBroker.CanChangeInvoice then
                begin
                  if MessageDlg('This invoice has been included in a period end, '
                        + 'only the header details can be modified', mtWarning,
                    [mbOk,mbCancel], 0) = mrCancel then exit;
                  aMode := siHeader;
                end
              else
                begin
                  if MessageDlg('This invoice has been included in a period end, '
                        + 'the details can only be viewed and cannot be modified', mtWarning,
                    [mbOk,mbCancel], 0) = mrCancel then exit;
                  aMode := siView;
                end
            end
          end
          else
            begin
              if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger > 20 then
                begin
                  if dmBroker.CanChangeInvoice then
                    begin
                      sWarning := 'This invoice has been posted to the ledger, any changes made will require a reprint of the invoice plus adjustments to your sales ledger.';

                      if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
                        exit
                      else
                        aMode := siChange;
                    end
                  else
                    begin
                      sWarning := 'This invoice has been posted to the ledger, the details can only be viewed and cannot be modified or deleted';
                      if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
                        exit;
                      aMode := siHeader;
                    end;
                end
              else
              if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger = 20 then
                begin
                  if dmBroker.CanChangeInvoice then
                    begin
                      sWarning := 'This invoice has been printed, any changes made will require a reprint of the invoice.';

                      if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
                        exit
                      else
                        aMode := siChange;
                    end
                  else
                    begin
                      sWarning := 'This invoice has been printed, the details can only be viewed and cannot be modified or deleted';
                      if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
                        exit;
//                    aMode := siView;
                      aMode := siHeader;
                    end;
                end;
            end;
        end;
      end;
    end;
//  aMode := siChange;
  try
    aInvoice := TSalesInvoice.Create(dtmdlAllSInvoices);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSalesInvoicefrm.Create(Self);
      try
        // Check if this job bag number is locked
        if (aInvoice.SIType = 'J') and ((aMode = siChange) or (aMode = siDelete)) then
          begin
            case dmBroker.LockRecord(aInvoice.Reference,'','','','','Job Bag',Frm.caption,frmPBMainMenu.Workstation, false) of
              0:;
              1: exit;
              2: exit
            end;
          end;
        Frm.Mode := aMode;
        Frm.SalesInvoice := aInvoice;
        Frm.ShowModal;
        Key := aInvoice.DbKey;
      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(aInvoice.Reference,'','','','','Job Bag',frmPBMainMenu.Workstation);
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

procedure TfrmPBLUSalesInvoices.btnChangeClick(Sender: TObject);
begin
  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(siView)
  else
    CallMaintScreen(siChange);
end;

procedure TfrmPBLUSalesInvoices.btnDeleteClick(Sender: TObject);
begin
  if trim(edtNumber.text) = '' then
    begin
      if dbgDetails.Datasource.Dataset.Locate('Sales_Invoice', dbgDetails.Datasource.Dataset.fieldbyname('Sales_Invoice').asinteger, [loCaseInsensitive]) then
        CallMaintScreen(siDelete)
      else
        ShowMessage('The selected invoice does not exist in the current selection.');
    end
  else
  if dbgDetails.Datasource.Dataset.Locate('Sales_Invoice_no', edtNumber.Text, [loCaseInsensitive]) then
    CallMaintScreen(siDelete)
  else
    ShowMessage('Sales Invoice: '+ edtNumber.Text + ' does not exist in the current selection.');
end;

procedure TfrmPBLUSalesInvoices.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      {Extract the relevant data}
      PBRPSalesInvFrm.ShowZeroValues := 'Y';

      {Extract the relevant data}
      if bPreview then
        PBRPSalesInvfrm.bUpdate := False
      else
        PBRPSalesInvfrm.bUpdate := true;

      PBRPSalesInvfrm.bInvoice := true;
      PBRPSalesInvfrm.bPreview := bPreview;

      {Only print one invoice}
      PBRPSalesInvfrm.bAll := False;

      PBRPSalesInvfrm.SelCode := dbgDetails.datasource.dataset.FieldByName('Sales_Invoice').AsInteger;

      PBRPSalesInvfrm.GetInvoiceData;
      if bPreview then
        PBRPSalesInvfrm.InvoiceReport.Preview
      else
        PBRPSalesInvfrm.InvoiceReport.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPSalesInvfrm.Free;
  end;
end;
procedure TfrmPBLUSalesInvoices.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TfrmPBLUSalesInvoices.btnPrintClick(Sender: TObject);
var
  Key : Integer ;
  frm : TPBSalesInvPrintFrm;
  inUseBy: string;
begin
  Key := dbgDetails.Datasource.Dataset.FieldByName('Sales_Invoice').AsInteger;

//  dbgDetails.DataSource.DataSet.Close;
  InUseBy := dtmdlAllSInvoices.LockCompanyRecord;
  if InUseBy <> '' then
    begin
      messagedlg('Printing of invoices is a single user operation, '+InUseBy+' is currently printing invoices.', mtInformation,
        [mbOk], 0);
      exit;
    end;
  try
    try
      Frm := TPBSalesInvPrintFrm.Create(Self);
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
  finally
    dtmdlAllSInvoices.FreeCompanyRecord;
  end;
end;

function TfrmPBLUSalesInvoices.GetBinSelection: integer;
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

procedure TfrmPBLUSalesInvoices.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmPBLUSalesInvoices.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmPBLUSalesInvoices.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUSalesInvoices.btnReportsClick(Sender: TObject);
begin
  frmPBLUSalesInvRpts := TfrmPBLUSalesInvRpts.create(self);
  try
    frmPBLUSalesInvRpts.showmodal;
  finally
    frmPBLUSalesInvRpts.free;
  end;
end;

procedure TfrmPBLUSalesInvoices.btnReprintClick(Sender: TObject);
var
  icount: integer;
  key: string;
begin
  key := dbgDetails.datasource.dataset.fieldbyname('Sales_invoice_no').asstring;

  PBSalesInvrPrintFrm := TPBSalesInvrPrintFrm.Create(Self);
  try
//    PBSalesInvRPrintFrm.selectionMemo.Text := Key;

    {Build up the selection memo box based on the selection}
    for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
      begin
        dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
        if iCount = 0 then
          PBSalesInvRPrintFrm.selectionMemo.Text := dbgDetails.datasource.dataset.fieldbyname('Sales_invoice_no').asstring
        else
          PBSalesInvRPrintFrm.selectionMemo.Text := PBSalesInvRPrintFrm.selectionMemo.Text + ',' + dbgDetails.datasource.dataset.fieldbyname('Sales_invoice_no').asstring;
      end;

    PBSalesInvrPrintFrm.InvoicePrint := true;
    PBSalesInvrPrintFrm.ShowModal;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
    PBSalesInvrPrintFrm.Free;
  end;
end;

procedure TfrmPBLUSalesInvoices.SetSalesInvoiceEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
      try
        edtNumber.Text := Dataset.FieldByName('Sales_Invoice_no').asstring;
      except
        edtNumber.Text := '';
      end;
    end;
  with Dataset do
  begin
    btnPreview.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 15);
    btnPrint.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 15);
    btnReprint.enabled := (fieldbyname('Sales_invoice_Status').asinteger >= 15);
    btnDelete.enabled := not (fieldByName('Inactive').asstring = 'Y');
  end;
end;

procedure TfrmPBLUSalesInvoices.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgDetails.Datasource.Dataset.Locate('Sales_Invoice_no', edtNumber.Text, [loCaseInsensitive]) then
      begin
        dbgDetails.SelectedRows.Clear;
        dbgDetails.SelectedRows.CurrentRowSelected := true ;
        btnChangeClick(self);
      end
    else
    if dbgDetails.Datasource.Dataset.Locate('Alt_Sales_Invoice_no', edtNumber.Text, [loCaseInsensitive]) then
      begin
        dbgDetails.SelectedRows.Clear;
        dbgDetails.SelectedRows.CurrentRowSelected := true ;
        btnChangeClick(self);
      end
    else
      ShowMessage('Sales Invoice: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmPBLUSalesInvoices.dbgDetailsDrawColumnCell(Sender: TObject;
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

  if  (Column.Title.Caption <> 'Invoice No') and
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
           	if  (Column.Title.Caption <> 'Invoice No.') and
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
            sValue := formatfloat('£#,###,##0.00',strtofloat(Column.field.asstring))
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

procedure TfrmPBLUSalesInvoices.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    dmBroker.iAccCtrlMenu := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuSalesInvoicing') ;
    {Check if the operator REP is needed} ;
    If dmBroker.iAccCtrlMenu = 4 then
      iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
    else
      iOperatorRep := 0 ;

    {Get the button statuses} ;
    iMnuMaint := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuSalesInvoicing') ;

    If dmBroker.iAccCtrlMenu = 5 then
      dtmdlAllSInvoices.Operator := frmpbMainMenu.iOperator;

    dtmdlAllSInvoices.Rep := iOperatorRep;
    dtmdlAllSInvoices.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

    SetButtonProperties(self);

    FActivated := True;
  end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUSalesInvoices.SetButtonProperties(Sender: TObject);
var
  bTempCanUpd, bTempCanAdd: ByteBool;
begin
  {They can UPDATE this job if:} ;
  {    they have FULL access OR} ;
  {    they have REP access and the enquiry is for the operator's rep OR} ;
  {    they have OPERATOR access and the enquiry is for the operator} ;
  {Use the setting for the job bag maint button on the menu} ;
  bTempCanUpd :=  (iMnuMaint = 1) ;
  {They can ADD invoices IF} ;
  {    they have FULL access} ;
  bTempCanAdd := ((iMnuMaint = 1)) ;
  btnAdd.Visible := bTempCanAdd ;
  if bTempCanUpd then
    begin
      btnChange.Caption := '  &Change  ';
    end
  else
    begin
      btnChange.Caption := '   &View   ';
    end;

  btnDelete.Visible := bTempCanUpd;
  btnEinvoice.Visible := bTempCanUpd;
  btnPayments.Visible := bTempCanUpd;
  btnPaymentsRpt.Visible := bTempCanUpd;
  btnStatements.Visible := bTempCanUpd;
  btnReports.Visible := bTempCanUpd;
  btnSeparator1.Visible := bTempCanUpd;
  btnSeparator2.Visible := bTempCanUpd;

  // set popup menu properties
(*  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuRepeat.Visible := btnRepeat.Visible;
  pmnuPrint.Visible := btnPrint.Visible;
  pmnuDelete.visible := btnDelete.Visible
*)
end;

procedure TfrmPBLUSalesInvoices.edtInvoiceDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := strToDate(edtinvoiceDate.text);
  except
    begin
      messagedlg('Invalid Date', mtError, [mbOK], 0);
      edtInvoiceDate.SetFocus;
      exit;
    end;
  end;

  if pbdatestr(edtInvoiceDate.text) <= dLastPEDate then
    begin
      messagedlg('The date entered is for a closed period, enter a date later than '+ pbdatestr(dLastPEDate),mterror, [mbOK], 0);
      edtInvoiceDate.SetFocus;
      exit;
    end;
end;

procedure TfrmPBLUSalesInvoices.FormDestroy(Sender: TObject);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'SalesInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  SaveDefaultPrinter;
end;

procedure TfrmPBLUSalesInvoices.btnAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btnFromProduction.Visible := not frmpbMainMenu.JobBagsMandatory;
  btnFromJobBag.visible := frmpbMainMenu.UsejobBags;
  try
    btnFromSalesOrder.visible := frmpbMainMenu.UseStockSystem;
  except
    btnFromSalesOrder.visible := false;
  end;

  if (not btnFromJobBag.visible) and
     (not btnFromSalesOrder.visible) then
    begin
      btnAdd.dropdownmenu := pmnDummy;
      btnFromProductionClick(self);
    end
  else
    btnAdd.dropdownMenu := pmnRaise;
end;

procedure TfrmPBLUSalesInvoices.btnPaymentsClick(Sender: TObject);
var
  Key, tmpStatus: integer;
begin
  key := dbgDetails.DataSource.dataset.fieldbyname('Sales_Invoice').asinteger;
  tmpStatus := dbgDetails.DataSource.dataset.fieldbyname('Sales_Invoice_Status').asinteger;
  PBMaintSalesInvPayFrm := TPBMaintSalesInvPayFrm.Create(Self);
  try
(*    if tmpStatus >= 25 then
      begin
      if MessageDlg('This invoice has been posted to the sales ledger, the details can only be viewed and cannot be modified', mtWarning,
        [mbOk,mbCancel], 0) = mrCancel then
          exit;
      PBMaintSalesInvPayFrm.Mode := 'V'
      end
    else
*)
    if dbgDetails.DataSource.dataset.fieldbyname('Paid_Status').asstring = '' then
      PBMaintSalesInvPayFrm.Mode := 'A'
    else
      begin
      if MessageDlg('This invoice has already been paid, do you want to continue?', mtConfirmation,
        [mbOk,mbCancel], 0) = mrCancel then
      PBMaintSalesInvPayFrm.Mode := 'C';
      end;

    PBMaintSalesInvPayFrm.SalesInvoice := key;
    PBMaintSalesInvPayFrm.ShowModal;
    if PBMaintSalesInvPayFrm.bOK then
      begin
        dbgDetails.DataSource.DataSet.Close;
        dbgDetails.DataSource.DataSet.Open;
        dbgDetails.DataSource.dataset.locate('Sales_Invoice', Variant(inttostr(key)),[lopartialKey]);

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    PBMaintSalesInvPayFrm.Free;
  end;
end;

procedure TfrmPBLUSalesInvoices.btnPaymentsRptClick(Sender: TObject);
begin
  {Sales Invoice Payment screen}
  PBRSOSSInvPaymentsFrm := TPBRSOSSInvPaymentsFrm.Create(Self);
  try
    PBRSOSSInvPaymentsFrm.ShowModal;
  finally
    PBRSOSSInvPaymentsFrm.Free;
  end;
end;

procedure TfrmPBLUSalesInvoices.dbgDetailsTitleClick(Column: TColumn);
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

  if (column.FieldName = 'Total_Value') then
    SortField := 'Goods_Value'
  else
  if (column.FieldName = 'Paid_status_Description') then
    SortField := 'Paid_Status'
  else
  if (column.FieldName = 'Invoice_Format') then
    SortField := 'Electronic_Invoice'
  else
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

procedure TfrmPBLUSalesInvoices.btnOrderClick(Sender: TObject);
begin
(*  if dbgDetails.DataSource.DataSet.FieldByName('Sales_invoice_type').Asstring = 'S' then
    begin

    end
  else
  if dbgDetails.DataSource.DataSet.FieldByName('Sales_invoice_type').Asstring = 'J' then
    begin
      CallMaintJBScreen(jbChange);
    end
  else
    begin
      SelectCode(Self);
      CallMaintPOScreen('C');
    end;
*)
end;

procedure TfrmPBLUSalesInvoices.btnEInvoiceClick(Sender: TObject);
var
  key: integer;
begin
  if dbgDetails.DataSource.dataset.fieldbyname('Electronic_Invoice').asstring <> 'Y' then
    begin
      MessageDlg('This invoice is not setup as an Electronic Invoice and therefore cannot be transmitted electronically', mtError,
        [mbAbort], 0);
      exit;
    end;

  key := dbgDetails.DataSource.dataset.fieldbyname('Sales_Invoice').asinteger;

  PBRSEInvoiceFrm := TPBRSEInvoiceFrm.Create(Self);
  try
    PBRSEInvoiceFrm.SalesInvoice := key;
    PBRSEInvoiceFrm.showmodal;
    if PBRSEInvoiceFrm.bOK then
      begin
        dbgDetails.DataSource.DataSet.Close;
        dbgDetails.DataSource.DataSet.Open;
        dbgDetails.DataSource.dataset.locate('Sales_Invoice', Variant(inttostr(key)),[lopartialKey]);

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;
  finally
    PBRSEInvoiceFrm.free;
  end;
end;

procedure TfrmPBLUSalesInvoices.btnFromOrderRangeClick(Sender: TObject);
var
  key: integer;
begin
  PBRSCustInvoiceFrm := TPBRSCustInvoiceFrm.Create(Self);
  try
    PBRSCustInvoiceFrm.showmodal;
    if PBRSCustInvoiceFrm.bOK then
      begin
        key := PBRSCustInvoiceFrm.dbKey;
        dbgDetails.DataSource.DataSet.Close;
        dbgDetails.DataSource.DataSet.Open;
        dbgDetails.DataSource.dataset.locate('Sales_Invoice', Variant(inttostr(key)),[lopartialKey]);

        with dbgDetails do
          begin
            try
              if datasource.dataset.recordcount > 0 then
                SelectedRows.CurrentRowSelected := true ;
            except
            end;
          end;
      end;

  finally
    PBRSCustInvoiceFrm.free;
  end;

end;

procedure TfrmPBLUSalesInvoices.pmnRaisePopup(Sender: TObject);
begin
  btnFromOrderRange.Visible := dmBroker.UseConsolidatedInvoicing;
end;

procedure TfrmPBLUSalesInvoices.btnSweepClick(Sender: TObject);
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

procedure TfrmPBLUSalesInvoices.ToolButton2Click(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_Invoice').asinteger;
  except
    Activecode := 0
  end;

  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesInvoices.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_Invoice').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmPBLUSalesInvoices.btnSearchClick(Sender: TObject);
begin
  frmpbLuSalesInvoiceSearch := TfrmpbLuSalesInvoiceSearch.create(self);
  try
    frmpbLuSalesInvoiceSearch.dmSearchSalesInvoices := dtmdlAllSInvoices;
    frmpbLuSalesInvoiceSearch.edtDescription.Text := dtmdlAllSInvoices.Description;
    frmpbLuSalesInvoiceSearch.edtDate.Text := pbDateStr(dtmdlAllSInvoices.InvoiceDate);
    frmpbLuSalesInvoiceSearch.chkbxShowDeleted.checked := dtmdlAllSInvoices.DisplayInactive;
    frmpbLuSalesInvoiceSearch.chkbxShowArchived.checked := dtmdlAllSInvoices.DisplayArchived;
    frmpbLuSalesInvoiceSearch.edtStatus.text := dtmdlAllSInvoices.Status;
    frmpbLuSalesInvoiceSearch.edtRep.Text := dtmdlAllSInvoices.RepName;
    frmpbLuSalesInvoiceSearch.edtSubRep.Text := dtmdlAllSInvoices.SubRepName;
    frmpbLuSalesInvoiceSearch.showModal;
  finally
    frmpbLuSalesInvoiceSearch.free;
  end;
end;

procedure TfrmPBLUSalesInvoices.rdbtnAllPaidClick(Sender: TObject);
begin
  rdbtnPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnPartPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnunPaid.Checked := not (Sender as TRadioButton).Checked;

  dtmdlAllSInvoices.PaidStatus := 'A';
  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesInvoices.rdbtnPaidClick(Sender: TObject);
begin
  rdbtnAllPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnPartPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnunPaid.Checked := not (Sender as TRadioButton).Checked;

  dtmdlAllSInvoices.PaidStatus := 'F';
  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesInvoices.rdbtnUnPaidClick(Sender: TObject);
begin
  rdbtnPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnPartPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnAllPaid.Checked := not (Sender as TRadioButton).Checked;

  dtmdlAllSInvoices.PaidStatus := 'U';
  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesInvoices.rdbtnPartPaidClick(Sender: TObject);
begin
  rdbtnPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnunPaid.Checked := not (Sender as TRadioButton).Checked;
  rdbtnAllPaid.Checked := not (Sender as TRadioButton).Checked;

  dtmdlAllSInvoices.PaidStatus := 'P';
  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesInvoices.btnStatementsClick(Sender: TObject);
begin
  PBLUSalesInvStmtsFrm := TPBLUSalesInvStmtsFrm.create(self);
  try
    PBLUSalesInvStmtsFrm.showmodal;
  finally
    PBLUSalesInvStmtsFrm.free;
  end;
end;

procedure TfrmPBLUSalesInvoices.chkbxShowUnfactoredClick(Sender: TObject);
begin
  dtmdlAllSInvoices.DisplayUnFactored := (Sender as Tcheckbox).checked;
  dtmdlAllSInvoices.refreshdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesInvoices.ToolButton1Click(Sender: TObject);
begin
  PBLUSalesInvoiceDDFrm := TPBLUSalesInvoiceDDFrm.create(self);
  try
    PBLUSalesInvoiceDDFrm.showmodal;
  finally
    PBLUSalesInvoiceDDFrm.free;
  end;
end;

end.
