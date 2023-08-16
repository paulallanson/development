unit pbluCustSalesInvoices;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Grids, DBGrids, ExtCtrls, ImgList, ToolWin, pbSalesInvoiceDM,
  Data.Db, System.ImageList, FireDAC.Stan.Param;

const
  {Message values for communication between this child and its parent frmLuCustomers}
  luCustomers_Invoicesclosed   = WM_APP + 107; {sent from child to parent}
  luCustomers_parentclosed  = WM_APP + 103; {sent from parent to child}

type
  TfrmpbLUCustSalesInvoices = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    lblTitle: TLabel;
    PageScroller2: TPageScroller;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnCustomers: TToolButton;
    btnEnquiries: TToolButton;
    btnProduction: TToolButton;
    btnJobs: TToolButton;
    btnStock: TToolButton;
    CoolBar1: TCoolBar;
    PageScroller1: TPageScroller;
    ToolBar1: TToolBar;
    btnChange: TToolButton;
    ToolButton3: TToolButton;
    btnPreview: TToolButton;
    btnPrint: TToolButton;
    btnReprint: TToolButton;
    ToolButton2: TToolButton;
    btnOrder: TToolButton;
    imglstFunctions: TImageList;
    tmrSearch: TTimer;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    Panel4: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    chkbxShowInactive: TCheckBox;
    stsbrDetails: TStatusBar;
    btnSalesInvoicing: TToolButton;
    btnQuotes: TToolButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnJobsClick(Sender: TObject);
    procedure btnProductionClick(Sender: TObject);
    procedure btnEnquiriesClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure btnQuotesClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormDeactivate(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    function GetBinSelection: integer;
    procedure SetSalesInvoiceEdit(Dataset: TDataset);
    procedure SetOperator(iTempOp: Integer);
  private
    ActiveCode: integer;
    DontSaveLayout: Boolean;
    FCustomer: integer;
    FParentForm: TForm;
    procedure SetCustomer(const Value: integer);
    procedure SetParentForm(const Value: TForm);
    procedure CallMaintScreen(aMode: TsiMode);
    procedure CallReport(const bPreview: Boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  protected
    procedure luCustomersParentClosed(var Message: TMessage); message luCustomers_ParentClosed;
  public
    CustomerName: string;
    property Customer: integer read FCustomer write SetCustomer;
    property ParentForm: TForm read FParentForm write SetParentForm;
  end;

var
  frmpbLUCustSalesInvoices: TfrmpbLUCustSalesInvoices;

implementation

uses
  System.UITypes, System.Types,
  PBRPSalesInv, CCSCommon, CCSPrint, Printers, PBMaintSalesInvoice, PBSalesInvPrint,
  pbLUSalesInvRpts, PBSalesInvRPrint, pbluCustomers, pbMainMenu, pbDatabase;

{$R *.DFM}

{ TfrmpbLUCustSalesInvoices }

procedure TfrmpbLUCustSalesInvoices.luCustomersParentClosed(
  var Message: TMessage);
begin
  close;
  message.result := 1;
end;

procedure TfrmpbLUCustSalesInvoices.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  dmSalesInvoice.CustomerCode := FCustomer;
  dmSalesInvoice.Customer := CustomerName;
  dmSalesInvoice.Displayarchived := true;
  dmSalesInvoice.RefreshCustomerData;
end;

procedure TfrmpbLUCustSalesInvoices.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmpbLUCustSalesInvoices.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbLUCustSalesInvoices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, luCustomers_Invoicesclosed, left, Top);
  if Self.dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'CustomerInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
      CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
    end;
  Action := caFree;

end;

procedure TfrmpbLUCustSalesInvoices.FormCreate(Sender: TObject);
begin
  dmSalesInvoice := TdmSalesInvoice.create(self);
  dmSalesInvoice.dsSIHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.datasource := dmSalesInvoice.dsSIHeaderGrid;

  btnStock.visible := frmPBMainMenu.btnStock.visible;
  btnJobs.visible := frmPBMainMenu.btnJobs.visible;

  dmSalesInvoice.dsSIHeaderGrid.dataset.AfterScroll := SetSalesInvoiceEdit;
  CCSCommon.SetDBGridCols('', 'CustomerInvoicesLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
//  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmpbLUCustSalesInvoices.SetSalesInvoiceEdit(Dataset: TDataset);
begin
  if (Dataset.recordcount > 0) then
    begin
      try
        edtNumber.Text := floatToStr(Dataset.FieldByName('Sales_Invoice_no').asfloat);
      except
        edtNumber.Text := '';
      end;
    end;
  with Dataset do
  begin
    btnPreview.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnPrint.enabled := not(fieldbyname('Sales_invoice_Status').asinteger >= 20);
    btnReprint.enabled := (fieldbyname('Sales_invoice_Status').asinteger >= 20);
  end;
end;

procedure TfrmpbLUCustSalesInvoices.FormDestroy(Sender: TObject);
begin
  dmSalesInvoice.free;
end;

procedure TfrmpbLUCustSalesInvoices.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dmSalesInvoice.refreshCustomerdata;
end;

procedure TfrmpbLUCustSalesInvoices.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmpbLUCustSalesInvoices.SetButtons(Sender: TObject; Field: TField);
begin
  with dmSalesInvoice do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPreview.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnReprint.Enabled := HeaderCount > 0;
    btnOrder.enabled := HeaderCount > 0;
//    edtSalesInvNo.Text := dbgDetails.datasource.dataset.fieldbyname('Sales_invoice_no').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbLUCustSalesInvoices.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dmSalesInvoice.Description := edtSearch.text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbLUCustSalesInvoices.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmpbLUCustSalesInvoices.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(siView)
end;

procedure TfrmpbLUCustSalesInvoices.CallMaintScreen(aMode : TsiMode);
var
  Key : integer;
  frm : TPBMaintSalesInvoicefrm;
  aInvoice : TSalesInvoice;
  sWarning: string;
begin
  if aMode = siAdd then
    Key := 0
  else
  if aMode = siView then
    begin
      Key := dmSalesInvoice.CurrentSInvoice;
      if MessageDlg('You only have access to view the selected invoice, continue?', mtConfirmation,
              [mbOk,mbCancel], 0) = mrCancel then exit;
    end
  else
    begin
      Key := dmSalesInvoice.CurrentSInvoice;
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
        with dmSalesInvoice.qryPEnd do
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
              if MessageDlg('This invoice has been included in a period end, '
                        + 'the details can only be viewed and cannot be modified', mtWarning,
              [mbOk,mbCancel], 0) = mrCancel then exit;
              aMode := siView;
            end;
          end
          else
            begin
              if dbgDetails.DataSource.DataSet.FieldByName('Sales_Invoice_Status').AsInteger > 20 then
                begin
                  if MessageDlg('This invoice has been posted to the ledger, the details can only be viewed and cannot be modified or deleted', mtWarning,
                      [mbOk,mbCancel], 0) = mrCancel then exit;
                  aMode := siView;
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
      end;
    end;

//  dbgDetails.DataSource.DataSet.Close;
  try
    aInvoice := TSalesInvoice.Create(dmSalesInvoice);
    try
      aInvoice.DbKey := key;
      aInvoice.LoadFromDB;
      Frm := TPBMaintSalesInvoicefrm.Create(Self);
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
  end;
end;

procedure TfrmpbLUCustSalesInvoices.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      {Extract the relevant data}
      if bPreview then
        PBRPSalesInvfrm.bUpdate := False
      else
        PBRPSalesInvfrm.bUpdate := true;

      PBRPSalesInvfrm.bInvoice := true;

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

procedure TfrmpbLUCustSalesInvoices.FormActivate(Sender: TObject);
begin
  SetOperator(frmPBMainMenu.iOperator);
  if Customer <> 0 then
    begin
      dmSalesInvoice.refreshcustomerdata;
      dbgDetails.DataSource.DataSet.Locate('Sales_Invoice', Variant(inttostr(ActiveCode)),[lopartialKey]);
    end;
end;

procedure TfrmpbLUCustSalesInvoices.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbLUCustSalesInvoices.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TfrmpbLUCustSalesInvoices.btnPrintClick(Sender: TObject);
var
  Key : Integer ;
  frm : TPBSalesInvPrintFrm;
begin
  Key := dbgDetails.Datasource.Dataset.FieldByName('Sales_Invoice').AsInteger;

//  dbgDetails.DataSource.DataSet.Close;
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
  end;
end;

procedure TfrmpbLUCustSalesInvoices.btnReprintClick(Sender: TObject);
var
  key: string;
begin
  key := dbgDetails.datasource.dataset.fieldbyname('Sales_invoice_no').asstring;

  PBSalesInvrPrintFrm := TPBSalesInvrPrintFrm.Create(Self);
  try
    PBSalesInvRPrintFrm.selectionMemo.Text := Key;
    PBSalesInvrPrintFrm.InvoicePrint := true;
    PBSalesInvrPrintFrm.ShowModal;
  finally
    DefaultPrinter := Printer.Printers[Printer.Printerindex];
    DefaultBin := GetBinSelection;
    PBSalesInvrPrintFrm.Free;
  end;
end;

procedure TfrmpbLUCustSalesInvoices.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmpbLUCustSalesInvoices.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

function TfrmpbLUCustSalesInvoices.GetBinSelection: integer;
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

procedure TfrmpbLUCustSalesInvoices.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgDetails.Datasource.Dataset.Locate('Sales_Invoice_no', Variant(edtNumber.Text), [loPartialKey]) then
      btnChangeClick(self)
    else
      ShowMessage('Sales Invoice: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmpbLUCustSalesInvoices.btnJobsClick(Sender: TObject);
begin
  frmpbluCustomers.btnJobsClick(self);
end;

procedure TfrmpbLUCustSalesInvoices.btnProductionClick(Sender: TObject);
begin
  frmpbluCustomers.btnProductionClick(self);
end;

procedure TfrmpbLUCustSalesInvoices.btnEnquiriesClick(Sender: TObject);
begin
  frmpbluCustomers.btnEnquiriesClick(self);
end;

procedure TfrmpbLUCustSalesInvoices.btnCustomersClick(Sender: TObject);
begin
  frmpbluCustomers.btnCustomersClick(self);
end;

procedure TfrmpbLUCustSalesInvoices.btnStockClick(Sender: TObject);
begin
  frmpbluCustomers.btnStockClick(self);

end;

procedure TfrmpbLUCustSalesInvoices.SetOperator(iTempOp: Integer);
var
  icount                      : Integer;
  cTempComp                   : TComponent;
begin
  {Disable all selection buttons}
  for icount := 0 to ComponentCount - 1 do
  begin
    if Components[icount] is TToolButton then
    begin
      if TToolButton(Components[icount]).Parent.Name <> 'ToolBar1' then
        TToolButton(Components[icount]).Enabled := False;
    end;
  end;
  {Set buttons according to file}
  try
    with dmBroker.qryGetButtons do
    begin
      Close;
      ParamByName('Operator').AsInteger := iTempOp;
      Open;
      First;
      while not EOF do
      begin
        cTempComp :=
          self.FindComponent(stringreplace((FieldByName('Button_Name').AsString),'mnu','btn',[rfReplaceAll,rfIgnoreCase]));
        if Assigned(cTempComp) then
          if cTempComp is TToolButton then
            try
            (cTempComp as TToolButton).Enabled := (FieldByName('Button_Status').AsString <> 'B');
            except
            end;
        Next;
      end;
    end;
  except
  end;
  btnSalesInvoicing.Enabled := false;
end;

procedure TfrmpbLUCustSalesInvoices.btnQuotesClick(Sender: TObject);
begin
  frmpbluCustomers.btnQuotesClick(self);
end;

procedure TfrmpbLUCustSalesInvoices.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
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

  if (dbgDetails.datasource.dataset.fieldbyname('Invoice_or_credit').asstring = 'C') then
    (Sender as TDBGrid).Canvas.font.Color := clRed;

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

procedure TfrmpbLUCustSalesInvoices.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_invoice').asinteger;
  except
    ActiveCode := 0;
  end;
end;

end.
