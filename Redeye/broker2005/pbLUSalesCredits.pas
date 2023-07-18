unit pbLUSalesCredits;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, ToolWin, pbSalesInvoiceDM,
  Db, DBTables, Inifiles, Buttons;

type
  TfrmPBLUSalesCredits = class(TForm)
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
    chkbxShowArchived: TCheckBox;
    Label3: TLabel;
    edtInvoiceDate: TEdit;
    chkbxShowInactive: TCheckBox;
    Panel3: TPanel;
    Label4: TLabel;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton3: TToolButton;
    btnPreview: TToolButton;
    btnPrint: TToolButton;
    btnReprint: TToolButton;
    ToolButton6: TToolButton;
    btnReports: TToolButton;
    btnEInvoice: TToolButton;
    BitBtn1: TBitBtn;
    ToolButton1: TToolButton;
    btnPayments: TToolButton;
    chkbxShowUnfactored: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure chkbxShowArchivedClick(Sender: TObject);
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
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEInvoiceClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure btnPaymentsClick(Sender: TObject);
    procedure chkbxShowUnfactoredClick(Sender: TObject);
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
    procedure SetButtonProperties(Sender: TObject);
  private
    ActiveCode: real;
    FActivated: boolean;
    dLastPEDate: TDateTime;
    DontSaveLayout: Boolean;
    dtmdlAllSCredits: TdmSalesInvoice;
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
  frmPBLUSalesCredits: TfrmPBLUSalesCredits;

implementation

uses CCSCommon, PBLUSalesInvoicePO, PBLUSalesInvoiceJB, PBLUSalesInvoiceSO,
      PBMaintSalesInvoice, CCSPrint, Printers, PBRPSalesInv, PBSalesInvPrint,
  pbLUSalesInvRpts, PBSalesInvRPrint, PBLUSalesInvoiceCN, pbDatabase,
  pbMainMenu, PBRSEInvoice;

{$R *.DFM}

procedure TfrmPBLUSalesCredits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'SalesCreditsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;
end;

procedure TfrmPBLUSalesCredits.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUSalesCredits.FormCreate(Sender: TObject);
begin
  dtmdlAllSCredits := TdmSalesInvoice.create(self);

  dtmdlAllSCredits.dsSCHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllSCredits.dsSCHeaderGrid;

  btnPayments.Visible := dtmdlAllSCredits.IsSecurityUser;

  edtInvoiceDate.text := pbDateStr(date);

  dtmdlAllSCredits.dsSCHeaderGrid.dataset.AfterScroll := SetSalesInvoiceEdit;
  CCSCommon.SetDBGridCols('', 'SalesCreditsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuSalesInvoicing',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUSalesCredits.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSCredits do
  begin
    btnChange.Enabled := CreditHeaderCount > 0;
    btnPreview.Enabled := CreditHeaderCount > 0;
    btnPrint.Enabled := CreditHeaderCount > 0;
    btnReprint.Enabled := CreditHeaderCount > 0;
    btnDelete.Enabled := CreditHeaderCount > 0;
    btnPayments.Enabled := CreditHeaderCount > 0;
    stsBrDetails.panels[0].text := inttostr(CreditHeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUSalesCredits.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
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

procedure TfrmPBLUSalesCredits.FormShow(Sender: TObject);
begin
//  dtmdlAllSCredits.RefreshCreditData;
  edtSearch.setfocus;
end;

procedure TfrmPBLUSalesCredits.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllSCredits.Customer := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUSalesCredits.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUSalesCredits.chkbxShowArchivedClick(Sender: TObject);
begin
  dtmdlAllSCredits.DisplayArchived := chkbxShowArchived.checked;
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

procedure TfrmPBLUSalesCredits.btnFromProductionClick(Sender: TObject);
begin
  PBLUSalesInvoicePOfrm := TPBLUSalesInvoicePOfrm.create(self);
  try
    PBLUSalesInvoicePOfrm.InvoiceDate := edtInvoiceDate.text;
    PBLUSalesInvoicePOfrm.showmodal;
    if PBLUSalesInvoicePOfrm.ModalResult = mrOK then
      begin
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
  finally
    PBLUSalesInvoicePOfrm.free;
  end;
end;

procedure TfrmPBLUSalesCredits.btnfromJobBagClick(Sender: TObject);
begin
  PBLUSalesInvoiceJBfrm := TPBLUSalesInvoiceJBfrm.create(self);
  try
    PBLUSalesInvoiceJBfrm.InvoiceDate := edtInvoiceDate.text;
    PBLUSalesInvoiceJBfrm.showmodal;
    if PBLUSalesInvoiceJBfrm.ModalResult = mrOK then
      begin
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
  finally
    PBLUSalesInvoiceJBfrm.free;
  end;
end;

procedure TfrmPBLUSalesCredits.btnFromSalesOrderClick(Sender: TObject);
begin
  PBLUSalesInvoiceSOfrm := TPBLUSalesInvoiceSOfrm.create(self);
  try
    PBLUSalesInvoiceSOfrm.InvoiceDate := edtInvoiceDate.text;
    PBLUSalesInvoiceSOfrm.showmodal;
    if PBLUSalesInvoiceSOfrm.ModalResult = mrOK then
      begin
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
  finally
    PBLUSalesInvoiceSOfrm.free;
  end;
end;

procedure TfrmPBLUSalesCredits.CallMaintScreen(aMode : TsiMode);
var
  Key : integer;
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  sWarning: string;
  tmpOK: boolean;
begin
  if aMode = siAdd then
    Key := 0
  else
  if aMode = siView then
    begin
      Key := dtmdlAllSCredits.CurrentSInvoice;
      if MessageDlg('You only have access to view the selected credit note, continue?', mtConfirmation,
              [mbOk,mbCancel], 0) = mrCancel then exit;
    end
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
        {Check whether Period end has been run on the invoice}
        with dtmdlAllSCredits.qryPEnd do
        begin
          close;
          parambyname('Sales_invoice').asinteger := Key;
          open;
          if recordcount > 0 then
          begin
          if aMode = siDelete then
            begin
              MessageDlg('This credit note has been included in a period end '
                        + 'and therefore cannot be deleted.', mterror, [mbOk], 0);
              exit;
            end
          else
            begin
              if dmBroker.CanChangeInvoice then
                begin
                  if MessageDlg('This credit note has been included in a period end, '
                        + 'only the header details can be modified', mtWarning,
                    [mbOk,mbCancel], 0) = mrCancel then exit;
                  aMode := siHeader;
                end
              else
                begin
                  if MessageDlg('This credit note has been included in a period end, '
                        + 'the details can only be viewed and cannot be modified', mtWarning,
                    [mbOk,mbCancel], 0) = mrCancel then exit;
                  aMode := siView;
                end
            end;
          end
          else
            begin
              if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger > 20 then
                begin
                  if dmBroker.CanChangeInvoice then
                    begin
                      sWarning := 'This credit note has been posted to the ledger, any changes made will require a reprint of the credit note plus adjustments to your sales ledger.';

                      if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
                        exit
                      else
                        aMode := siChange;
                    end
                  else
                    begin
                      sWarning := 'This credit note has been posted to the ledger, the details can only be viewed and cannot be modified or deleted';
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
                      sWarning := 'This credit note has been printed, any changes made will require a reprint of the credit note.';

                      if MessageDlg(sWarning, mtWarning, [mbOk,mbCancel], 0) = mrCancel then
                        exit
                      else
                        aMode := siChange;
                    end
                  else
                    begin
                      sWarning := 'This credit note has been printed, the details can only be viewed and cannot be modified or deleted';
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

//  dbgDetails.DataSource.DataSet.Close;
  try
    aInvoice := TSalesInvoice.Create(dtmdlAllSCredits);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSalesInvoicefrm.Create(Self);
      try
        // Check if this sales invoice number is locked
        if (aInvoice.SIType = 'J') and ((aMode = siChange) or (aMode = siDelete)) then
          begin
            case dmBroker.LockRecord(aInvoice.Reference,'','','','','Sales Invoice',Frm.caption,frmPBMainMenu.Workstation, false) of
              0:;
              1: exit;
              2: exit
            end;
          end;
        Frm.Mode := aMode;
        Frm.SalesInvoice := aInvoice;
        Frm.ShowModal;
        Key := aInvoice.DbKey;
        tmpOK := (Frm.modalresult = idOK);
      finally
        Frm.Free;
      end;
    finally
      dmBroker.UnlockRecord(aInvoice.Reference,'','','','','Sales Invoice',frmPBMainMenu.Workstation);
      aInvoice.Free;
    end;
  finally
    dbgDetails.DataSource.DataSet.Close;
    dbgDetails.DataSource.DataSet.Open;
    dbgDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(Key)),[lopartialKey]) ;
  end;
end;

procedure TfrmPBLUSalesCredits.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(siChange)
end;

procedure TfrmPBLUSalesCredits.btnDeleteClick(Sender: TObject);
begin
  if dbgDetails.Datasource.Dataset.Locate('Sales_Invoice_no', edtNumber.Text, [loCaseInsensitive]) then
    CallMaintScreen(siDelete)
  else
    ShowMessage('Sales Invoice: '+ edtNumber.Text + ' does not exist in the current selection.');
end;

procedure TfrmPBLUSalesCredits.CallReport(const bPreview: Boolean);
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

      PBRPSalesInvfrm.bInvoice := false;
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
procedure TfrmPBLUSalesCredits.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TfrmPBLUSalesCredits.btnPrintClick(Sender: TObject);
var
  Key : Integer ;
  frm : TPBSalesInvPrintFrm;
begin
  Key := dbgDetails.Datasource.Dataset.FieldByName('Sales_Invoice').AsInteger;

//  dbgDetails.DataSource.DataSet.Close;
  try
    Frm := TPBSalesInvPrintFrm.Create(Self);
    try
      Frm.CreditNotePrint := true;
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
  end;
end;

function TfrmPBLUSalesCredits.GetBinSelection: integer;
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

procedure TfrmPBLUSalesCredits.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmPBLUSalesCredits.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmPBLUSalesCredits.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUSalesCredits.btnReportsClick(Sender: TObject);
begin
  frmPBLUSalesInvRpts := TfrmPBLUSalesInvRpts.create(self);
  try
    frmPBLUSalesInvRpts.showmodal;
  finally
    frmPBLUSalesInvRpts.free;
  end;
end;

procedure TfrmPBLUSalesCredits.btnReprintClick(Sender: TObject);
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

    PBSalesInvrPrintFrm.CreditNotePrint := true;;
    PBSalesInvrPrintFrm.InvoicePrint := false;
    PBSalesInvrPrintFrm.ShowModal;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
    PBSalesInvrPrintFrm.Free;
  end;
end;

procedure TfrmPBLUSalesCredits.chkbxShowInactiveClick(Sender: TObject);
begin
  dtmdlAllSCredits.DisplayInactive := chkbxShowInactive.checked;
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

procedure TfrmPBLUSalesCredits.SetSalesInvoiceEdit(Dataset: TDataset);
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
    btnPreview.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnPrint.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnReprint.enabled := (fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnDelete.enabled := not (fieldByName('Inactive').asstring = 'Y');
  end;
end;

procedure TfrmPBLUSalesCredits.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgDetails.Datasource.Dataset.Locate('Sales_Invoice_no', edtNumber.Text, [loCaseInsensitive]) then
      btnChangeClick(self)
    else
      ShowMessage('Sales Invoice: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmPBLUSalesCredits.dbgDetailsDrawColumnCell(Sender: TObject;
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

  if  (Column.Title.Caption <> 'Credit Note No.') and
      (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Goods') and
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

procedure TfrmPBLUSalesCredits.btnAddClick(Sender: TObject);
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

  if pbdatestr(edtInvoiceDate.text) < dLastPEDate then
    begin
      messagedlg('The date entered is for a closed period, enter a date later than '+ pbdatestr(dLastPEDate), mterror, [mbOK], 0);
      edtInvoiceDate.SetFocus;
      Exit;
    end;

  PBLUSalesInvoiceCNfrm := TPBLUSalesInvoiceCNfrm.create(self);
  try
    PBLUSalesInvoiceCNfrm.InvoiceDate := edtInvoiceDate.text;
    PBLUSalesInvoiceCNfrm.showmodal;
    if PBLUSalesInvoiceCNfrm.ModalResult = mrOK then
      begin
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
  finally
    PBLUSalesInvoiceCNfrm.free;
  end;
end;

procedure TfrmPBLUSalesCredits.FormActivate(Sender: TObject);
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
      dtmdlAllSCredits.Operator := frmpbMainMenu.iOperator;

    dtmdlAllSCredits.Rep := iOperatorRep;

    SetButtonProperties(self);

    FActivated := True;
  end;

  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllSCredits.RefreshCreditData;
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

procedure TfrmPBLUSalesCredits.SetButtonProperties(Sender: TObject);
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
  btnReports.Visible := bTempCanUpd;

  // set popup menu properties
(*  pmnuAdd.Visible := btnAdd.Visible;
  pmnuChange.Visible := btnChange.Visible;
  pmnuRepeat.Visible := btnRepeat.Visible;
  pmnuPrint.Visible := btnPrint.Visible;
  pmnuDelete.visible := btnDelete.Visible
*)
end;

procedure TfrmPBLUSalesCredits.FormDestroy(Sender: TObject);
begin
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'SalesCreditsLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  SaveDefaultPrinter;
end;

procedure TfrmPBLUSalesCredits.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Invoice Printer',DefaultPrinter);
      WriteString('Centrereed Broker', 'Invoice Bin',inttostr(DefaultBin));
      Free;
    end;

  printer.printerindex := -1;
end;

procedure TfrmPBLUSalesCredits.btnEInvoiceClick(Sender: TObject);
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
      end;
  finally
    PBRSEInvoiceFrm.free;
  end;
end;

procedure TfrmPBLUSalesCredits.BitBtn1Click(Sender: TObject);
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

procedure TfrmPBLUSalesCredits.ToolButton1Click(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_Invoice').asfloat;
  except
    Activecode := 0
  end;

  dtmdlAllSCredits.RefreshCreditData;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesCredits.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_Invoice').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmPBLUSalesCredits.btnPaymentsClick(Sender: TObject);
var
  rAmount: real;
  iSalesInvoice: integer;
begin
  iSalesInvoice := dbgDetails.datasource.dataset.fieldbyname('Sales_Invoice').asinteger;
  if (dbgDetails.datasource.dataset.fieldbyname('Paid_Status').asstring = 'Y') or (dbgDetails.datasource.dataset.fieldbyname('Paid_Status').asstring = 'P') then
    begin
      if messagedlg('This credit note is flagged as taken, do you want to make the credit note not taken?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          rAmount := 0.00;
          dtmdlAllSCredits.UpdatePaidStatus(iSalesInvoice, '', rAmount)
        end
    end
  else
    begin
      if messagedlg('This credit note is flagged as not taken, do you want to make the credit note taken?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          rAmount := (dbgDetails.datasource.dataset.fieldbyname('Goods_Value').asfloat + dbgDetails.datasource.dataset.fieldbyname('Vat_Value').asfloat);
          dtmdlAllSCredits.UpdatePaidStatus(iSalesInvoice, 'Y', rAmount)
        end
    end;
  dbgDetails.DataSource.DataSet.Close;
  dbgDetails.DataSource.DataSet.Open;
  dbgDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(iSalesInvoice)),[lopartialKey]) ;
end;

procedure TfrmPBLUSalesCredits.chkbxShowUnfactoredClick(Sender: TObject);
begin
  dtmdlAllSCredits.DisplayUnFactored := (Sender as Tcheckbox).checked;
  dtmdlAllSCredits.RefreshCreditdata;
  dbgDetails.datasource.DataSet.locate('Sales_Invoice', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

end.
