unit wtLUSales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, Grids, DBGrids, wtSalesOrderDM,
  AllCommon, IniFiles, Buttons, QrCtrls, DateUtils, System.ImageList;

type
  TfrmwtLUSales = class(TForm)
    stsBrDetails: TStatusBar;
    Panel1: TPanel;
    Button1: TButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton6: TToolButton;
    imgLstHot: TImageList;
    btnPrint: TToolButton;
    Label1: TLabel;
    edtSearch: TEdit;
    tmrSearch: TTimer;
    dbgDetails: TDBGrid;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    btnConvert: TToolButton;
    Label3: TLabel;
    edtNumber: TEdit;
    btnReports: TToolButton;
    btnTemplate: TToolButton;
    ToolButton1: TToolButton;
    lblWorkinProgress: TLabel;
    btnSearch: TBitBtn;
    Label4: TLabel;
    cmbCustomerFilter: TComboBox;
    btnCopy: TToolButton;
    btnProforma: TToolButton;
    btnPayments: TToolButton;
    btnFittingEmail: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnReportsClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnTemplateClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure btnProformaClick(Sender: TObject);
    procedure btnPaymentsClick(Sender: TObject);
    procedure btnFittingEmailClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(aMode: TsopMode);
    procedure ConvertToJob(iSalesOrder, iQuoteNo: integer; sReference: string);
    procedure ConvertToJobScreen(iQuoteNo: integer);
    function CheckInput: boolean;
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmwtLUSales: TfrmwtLUSales;
  dtmdlAllSales: TdtmdlSalesOrder;

implementation

uses
  System.UITypes, System.Types, Math,
  WtMaintSalesOrder, wtRSSOrder, WTJobsDM, WtMaintJob, wtLUSOLines,
  WTLUSOrderRpts, WTSOrderSearch, wtRSTemplateSheet, wtDataModule,
  wtLUPayments, wtMain, wtRSFittingConfirm;

{$R *.DFM}

{ TfrmLUQuotes }

procedure TfrmwtLUSales.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmwtLUSales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'SalesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmwtLUSales.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUSales.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  dtmdlAllSales := TdtmdlSalesOrder.create(Application);
  dtmdlAllSales.dtsAllSales.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllSales.dtsAllSales;

  try
    with IniFile do
      begin
      if (ReadString('Sales Orders', 'Customer Filter', '0') = '0') then
        cmbCustomerFilter.itemindex := 0
      else
      if (ReadString('Sales Orders', 'Customer Filter', '1') = '1') then
        cmbCustomerFilter.itemindex := 1
      else
      if (ReadString('Sales Orders', 'Customer Filter', '2') = '2') then
        cmbCustomerFilter.itemindex := 2
      else
      if (ReadString('Sales Orders', 'Customer Filter', '3') = '3') then
        cmbCustomerFilter.itemindex := 3;

        sShowLive := ReadString('Sales Orders', 'Show Live Orders', 'None');
        dtmdlAllSales.ShowRecords := strtoint(ReadString('Sales Orders', 'Show Records', '0'));
      end;
  finally
    IniFile.Free;
  end;

  if sShowLive = 'None' then
    dtmdlAllSales.ShowLive := false
  else
    dtmdlAllSales.ShowLive := true;

  AllCommon.SetDBGridCols('', 'SalesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmwtLUSales.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  if dtmdlAllSales.ShowLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
      begin
        WriteString('Sales Orders', 'Show Live Orders', sShowLive);
        WriteString('Sales Orders', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
        WriteString('Sales Orders', 'Show Records', inttostr(dtmdlAllSales.ShowRecords));
      end;
  finally
    IniFile.free;
  end;

  dtmdlAllSales.free;
end;

procedure TfrmwtLUSales.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllSales.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmwtLUSales.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllSales.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSales.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUSales.FormShow(Sender: TObject);
begin
  dtmdlAllSales.RefreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

  edtSearch.setfocus;
end;

procedure TfrmwtLUSales.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllSales do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnPrint.Enabled := HeaderCountAll > 0;
    btnProforma.Enabled := HeaderCountAll > 0;
    btnTemplate.Enabled := HeaderCountAll > 0;
    btnFittingEmail.Enabled := HeaderCountAll > 0;
    btnCopy.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;
    btnPayments.Enabled := HeaderCountAll > 0;
    btnConvert.Enabled := HeaderCountAll > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asstring;
    lblWorkinProgress.Visible := ShowLive;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;
procedure TfrmwtLUSales.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(sopChange);
end;

procedure TfrmwtLUSales.CallMaintScreen(aMode : TsopMode);
var
  Key, iFirstKey : integer;
  frm : TfrmWtMaintSalesOrder;
  aSOrder : TSOrder;
  bOK: boolean;
begin
  bOk := False;
  if aMode = sopAdd then
    Key := 0
  else
  if (aMode = sopChange) or (aMode = sopDelete) then
    begin
      Key := dtmdlAllSales.CurrentSOrder;
      if dbgdetails.DataSource.DataSet.FieldByName('On_Hold').asstring = 'Y' then
        begin
          if MessageDlg('This order is On Hold, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end
      else
      if dbgdetails.DataSource.DataSet.FieldByName('sales_order_status').asinteger > 10 then
        begin
          if MessageDlg('This order is '+ dbgdetails.DataSource.DataSet.FieldByName('Sales_order_Status_Desc').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
    end
  else
    key := dtmdlAllSales.CurrentSOrder;

  try
    aSOrder := TSOrder.Create(dtmdlAllSales);
    try
      aSOrder.DbKey := key;
      aSOrder.SOMode := aMode;
      aSOrder.LoadFromDB;
      Frm := TfrmwtMaintSalesOrder.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.SOrder := aSOrder;

        if (aMode = sopChange) then
          begin
//            case dtmdlWorktops.LockRecord(inttostr(aSOrder.DbKey),'','','','','Sales Order',Frm.caption,frmWTMain.Workstation,true) of
            case dtmdlWorktops.LockAppointment(inttostr(aSOrder.DbKey),'Sales Order',frmWTMain.OperatorEmail,frmWTMain.Workstation,true) of
              0:;
              1: Frm.Mode := sopView;
              2: exit
            end
          end;

        Frm.OriginalSalesOrderFromCopy := aSOrder.dbKey;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aSOrder.DbKey;
      finally
        Frm.Free;
      end;
    finally
//      dtmdlWorktops.UnlockRecord(inttostr(aSOrder.DbKey),'','','','','Sales Order',frmWTMain.Workstation);
      dtmdlWorktops.UnlockAppointment(inttostr(aSOrder.DbKey),'Sales Order',frmWTMain.OperatorEmail);
      aSOrder.Free;
    end;
  finally
    if bOK then
    begin
      dbgdetails.DataSource.DataSet.Close;
      dbgdetails.DataSource.DataSet.Open;
      iFirstKey := dbgdetails.DataSource.DataSet.fieldbyname('Sales_Order').asinteger;

      while (dbgdetails.DataSource.DataSet.Locate('Sales_Order', Variant(inttostr(Key)),[lopartialKey]) <> true) and (key < iFirstKey) do
        begin
          inc(key);
        end;

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
end;

procedure TfrmwtLUSales.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(sopAdd);
end;

procedure TfrmwtLUSales.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmwtLUSales.btnDeleteClick(Sender: TObject);
begin
  if dtmdlAllSales.GetSOrderDetails(dbgdetails.DataSource.DataSet.FieldByName('sales_order').asinteger) = true then
    begin
      if MessageDlg('Related details exist for this sales order, you cannot delete. Do you want to make this order inactive?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            dtmdlAllSales.SetSOrderInactive(dbgdetails.DataSource.DataSet.FieldByName('sales_order').asinteger);
            dtmdlAllSales.RefreshAlldata;
            with dbgDetails do
              begin
                try
                  if datasource.dataset.recordcount > 0 then
                    SelectedRows.CurrentRowSelected := true ;
                except
                end;
              end;
            exit;
          end;
    end;
  CallMaintScreen(sopDelete);
end;

procedure TfrmwtLUSales.FormActivate(Sender: TObject);
begin
  dtmdlAllSales.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllSales.RefreshAlldata;
  dbgDetails.datasource.DataSet.locate('Sales_order', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmwtLUSales.btnCopyClick(Sender: TObject);
var
  sCreditStatus: string;
begin
  {Check Credit Status}
  sCreditStatus := dtmdlWorktops.GetCustomerCreditStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger);
  if sCreditStatus = 'B' then
    begin
      MessageDlg(cBlock, mtWarning,[mbOk], 0);
      exit;
    end
  else
  if (sCreditStatus = 'S') then
    MessageDlg(cOnStop, mtWarning,[mbOk], 0)
  else
  if sCreditStatus = 'O' then
    MessageDlg(cOverDue, mtWarning,[mbOk], 0);

  CallMaintScreen(sopCopy);
end;

procedure TfrmwtLUSales.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  Key: integer;
begin
  Key := 0;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSSOrder := TfrmWTRSSOrder.Create( Application );
    Key := dtmdlAllSales.CurrentSOrder;
    frmWTRSSOrder.bRetail := (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y');
    frmWTRSSOrder.bSpeculative := (dbgdetails.DataSource.DataSet.fieldbyname('Customer_is_Speculative').asstring = 'Y');
    frmWTRSSOrder.iCustomer := (dbgdetails.DataSource.DataSet.fieldbyname('Customer').asinteger);
    frmWTRSSOrder.memSelection.text := inttostr(Key);
    frmWTRSSOrder.showmodal;
  finally
    frmWTRSSOrder.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Sales_order', Variant(inttostr(Key)),[lopartialKey]) ;
    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Sales_order', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmwtLUSales.btnConvertClick(Sender: TObject);
var
  QuoteNo, SOrderNo: integer;
  rDepositReqd: real;
  sCreditStatus: string;
  bUsePurchasing: boolean;
  icount: integer;
begin
  SOrderNo := 0;
  if dbgDetails.SelectedRows.Count = 1 then
    begin
      bUsePurchasing := dtmdlWorktops.UsePurchaseOrdering;
      if not CheckInput then
        exit;

      {Check Credit Status}
      sCreditStatus := dtmdlWorktops.GetCustomerCreditStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger);
      if sCreditStatus = 'B' then
        begin
          MessageDlg(cBlock, mtWarning,[mbOk], 0);
          exit;
        end
      else
      if (sCreditStatus = 'S') then
        MessageDlg(cOnStop, mtWarning,[mbOk], 0)
      else
      if sCreditStatus = 'O' then
        MessageDlg(cOverDue, mtWarning,[mbOk], 0);

      rDepositReqd := (dbgDetails.datasource.DataSet.fieldbyname('Total_Value').asfloat * (dbgDetails.datasource.DataSet.fieldbyname('Deposit_Terms').asfloat/100));

      if  (dbgDetails.datasource.DataSet.fieldbyname('deposit_terms').asfloat <> 0) and (dbgDetails.datasource.DataSet.fieldbyname('Sales_Order_Status').asinteger < 50) and
          (dbgDetails.datasource.DataSet.fieldbyname('Deposit_Amount').asfloat < rDepositReqd) then
        begin
          messagedlg('A deposit for this order hasn''t been received, templating and production cannot continue.', mtError, [mbAbort], 0);
          exit;
        end;

      if bUsePurchasing and (dbgDetails.datasource.DataSet.fieldbyname('Sales_Order_Status').asinteger < 20) then
        begin
          if dtmdlAllSales.OutstandingPurchases(dtmdlAllSales.CurrentSOrder) then
            begin
              if messagedlg('Purchases for this order haven''t been received. Continue to convert the order to a job?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                exit;
            end;
        end;

      if dbgdetails.DataSource.DataSet.FieldByName('sales_order_status').asinteger = 100 then
        begin
          MessageDlg('This order is '+ dbgdetails.DataSource.DataSet.FieldByName('Sales_order_Status_Desc').asstring + ', there are no lines to convert',
            mtInformation, [mbOk], 0);
          exit;
        end;

      frmwtLUSOLines := TfrmWTLUSOLines.create(self);
      try
        frmwtLUSOLines.SalesOrder := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asinteger;
        frmwtLUSOLines.CustomerName := dbgDetails.datasource.dataset.fieldbyname('Customer_Name').asstring;
        frmwtLUSOLines.showmodal;
        if frmwtLUSOLines.modalresult = mrok then
          begin
            QuoteNo := frmwtLUSOLines.QuoteNumber;
            ConvertToJobScreen(QuoteNo);
          end;
      finally
        frmwtLUSOLines.free;
      end;
    end
  else
    begin
      if MessageDlg('Do you want to convert the selected orders to jobs?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := (dbgDetails.SelectedRows.Count - 1) downto 0 do
            begin
              dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;

              if dbgdetails.DataSource.DataSet.FieldByName('sales_order_status').asinteger < 100 then
                begin
                  QuoteNo := dtmdlAllSales.GetSOrderQuoteNo(dbgDetails.datasource.DataSet.fieldbyname('Sales_Order').asinteger);
                  if QuoteNo > 0 then
                    begin
                      SOrderNo := dbgDetails.datasource.DataSet.fieldbyname('Sales_Order').asinteger;
                      ConvertToJob(SOrderNo, QuoteNo, dbgDetails.datasource.DataSet.fieldbyname('Reference').asstring);
                    end;
                end;
            end;
          dbgdetails.DataSource.DataSet.Close;
          dbgdetails.DataSource.DataSet.Open;
          dbgdetails.DataSource.DataSet.Locate('Sales_Order', Variant(inttostr(SOrderNo)),[lopartialKey]) ;
          with dbgDetails do
            begin
              try
                if datasource.dataset.recordcount > 0 then
                  SelectedRows.CurrentRowSelected := true ;
              except
              end;
            end;
          MessageDlg('The selected orders have been converted to jobs', mtInformation, [mbOK], 0);
        end;
    end;
end;

procedure TfrmwtLUSales.ConvertToJob(iSalesOrder, iQuoteNo: integer; sReference: string);
var
  Key : integer;
  aJob : TJob;
begin
  dtmdlJob := TdtmdlJob.create(application);
  Key := 0;
  try
    aJob := TJob.Create(dtmdlJob);
    try
      aJob.DataModule.QuoteNo := iQuoteNo;
      aJob.DataModule.SalesOrder := iSalesOrder;
      aJob.DbKey := key;
      aJob.LoadFromQuote;
      aJob.Reference := sReference;
      aJob.DateRequired := date;
      aJob.jMode := jConvert;
      aJob.SaveToDB(true);
      dtmdlJob.UpdateQStatus(aJob.Quote);
      dtmdlJob.UpdateSOLine(aJob.Quote, aJob.dbKey);
      dtmdlJob.UpdateSOStatus(iSalesOrder, 50);
    finally
      aJob.Free;
    end;
  finally
    dtmdlJob.free;
  end;
end;

procedure TfrmwtLUSales.ConvertToJobScreen(iQuoteNo: integer);
var
  tempSO: integer;
  Key : integer;
  frm : TfrmWtMaintJob;
  aJob : TJob;
begin
  tempSO := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asinteger;
  dtmdlJob := TdtmdlJob.create(application);
  Key := 0;
  try
    aJob := TJob.Create(dtmdlJob);
    try
      aJob.DataModule.QuoteNo := iQuoteNo;
      aJob.DataModule.SalesOrder := tempSO;
      aJob.DbKey := key;
      aJob.LoadFromQuote;
      aJob.Reference := dbgDetails.datasource.dataset.fieldbyname('Reference').asstring;

      Frm := TfrmwtMaintJob.Create(Self);
      try
        Frm.Mode := jConvert;
        Frm.Job := aJob;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          begin
            dtmdlJob.UpdateQStatus(aJob.Quote);
            dtmdlJob.UpdateSOLine(aJob.Quote, aJob.dbKey);
            dtmdlJob.UpdateSOStatus(tempSO, 50);
          end;
      finally
        Frm.Free;
      end;
    finally
      aJob.Free;
    end;
  finally
    dtmdlJob.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Sales_Order', Variant(inttostr(tempSO)),[lopartialKey]) ;
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

function TfrmwtLUSales.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('sales_order', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Sales Order '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmwtLUSales.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    dbgDetails.SelectedRows.Clear;
    if dbgDetails.Datasource.Dataset.Locate('Sales_Order', Variant(edtNumber.Text), [loPartialKey]) then
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
      ShowMessage('Sales Order: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

procedure TfrmwtLUSales.btnReportsClick(Sender: TObject);
begin
  frmWTLUSOrderRpts := TfrmWTLUSOrderRpts.create(self);
  try
    frmWTLUSOrderRpts.showmodal;
  finally
    frmWTLUSOrderRpts.free;
  end;
end;

procedure TfrmwtLUSales.btnSearchClick(Sender: TObject);
begin
  frmWTSOrderSearch := TfrmWTSOrderSearch.create(self);
  try
    frmWTSOrderSearch.dtmdlSalesOrder := dtmdlAllSales;
    frmWTSOrderSearch.edtDescription.text := dtmdlAllSales.Description;
    frmWTSOrderSearch.edtCustomerOrder.text := dtmdlAllSales.CustomerOrder;
    frmWTSOrderSearch.edtProjectReference.Text := dtmdlAllSales.ProjectReference;
    frmWTSOrderSearch.edtQuote.Text := dtmdlAllSales.QuoteReference;
    frmWTSOrderSearch.edtReference.Text := dtmdlAllSales.Reference;
    frmWTSOrderSearch.edtStatus.Text := dtmdlAllSales.Status;
    frmWTSOrderSearch.edtOfficeContact.Text := dtmdlAllSales.OfficeContact;
    frmWTSOrderSearch.edtOperatorName.Text := dtmdlAllSales.OperatorName;
    frmWTSOrderSearch.spnedtRecords.Value := dtmdlAllSales.showRecords;
    frmWTSOrderSearch.chkbxShowLive.checked := dtmdlAllSales.ShowLive;
    frmWTSOrderSearch.chkbxShowInactive.checked := dtmdlAllSales.ShowInactive;
    frmWTSOrderSearch.showModal;
  finally
    frmWTSOrderSearch.free;
  end;
end;

procedure TfrmwtLUSales.btnTemplateClick(Sender: TObject);
var
  OldCursor : TCursor;
  iCount, key: integer;
  rDepositReqd: real;
  sCreditStatus: string;
  bUsePurchasing: boolean;
begin
  {Check Credit Status}
  sCreditStatus := dtmdlWorktops.GetCustomerCreditStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger);
  bUsePurchasing := dtmdlWorktops.UsePurchaseOrdering;

  if sCreditStatus = 'B' then
    begin
      MessageDlg(cBlock, mtWarning,[mbOk], 0);
      exit;
    end
  else
  if (sCreditStatus = 'S') then
    MessageDlg(cOnStop, mtWarning,[mbOk], 0)
  else
  if sCreditStatus = 'O' then
    MessageDlg(cOverDue, mtWarning,[mbOk], 0);

  if dbgDetails.SelectedRows.Count = 1 then
    begin
      rDepositReqd := roundfloat((dbgDetails.datasource.DataSet.fieldbyname('Total_Value').asfloat * (dbgDetails.datasource.DataSet.fieldbyname('Deposit_Terms').asfloat/100.000)),2);

      if  (dbgDetails.datasource.DataSet.fieldbyname('deposit_terms').asfloat <> 0) and (dbgDetails.datasource.DataSet.fieldbyname('Sales_Order_Status').asinteger < 50) and
          (dbgDetails.datasource.DataSet.fieldbyname('Deposit_Amount').asfloat < rDepositReqd) then
        begin
          messagedlg('A deposit for this order hasn''t been received, templating and production cannot continue.', mtError, [mbAbort], 0);
          exit;
        end;
    end;

  if bUsePurchasing and (dbgDetails.datasource.DataSet.fieldbyname('Sales_Order_Status').asinteger < 16) then
    begin
      if dtmdlAllSales.SalesOrderRequiresPurchasing(dtmdlAllSales.CurrentSOrder) then
        begin
          if messagedlg('Purchase Orders haven''t been raised for this order, do you want to continue to print the Template Checklist?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
        end;
    end;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSTemplateSheet := TfrmWTRSTemplateSheet.Create( Application );
    Key := dtmdlAllSales.CurrentSOrder;
    frmWTRSTemplateSheet.sOrderNumber := inttostr(Key);

//    frmWTRSTemplateSheet.memSelection.text := inttostr(Key);

    {Build up the selection memo box based on the selection}
    for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
      begin
        dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
        if iCount = 0 then
          frmWTRSTemplateSheet.memselection.Text := dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring
        else
          frmWTRSTemplateSheet.memselection.Text := frmWTRSTemplateSheet.memselection.Text + ',' + dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring;
      end;
    frmWTRSTemplateSheet.SalesOrderCount := dbgDetails.SelectedRows.Count;
    frmWTRSTemplateSheet.showmodal;
  finally
    frmWTRSTemplateSheet.free;
(*
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Sales_order', Variant(inttostr(Key)),[lopartialKey]) ;
    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
*)
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmwtLUSales.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_order').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmwtLUSales.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
(*
var
  idays: integer;
*)
begin
(*
  if dbgDetails.datasource.dataset.fieldbyname('Date_Required').asdatetime <> 0 then
    iDays :=  DaysBetween(now, dbgDetails.datasource.dataset.fieldbyname('Date_Required').asDateTime)
  else
    iDays := 1000;
*)
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
(*
  if (dbgDetails.datasource.dataset.fieldByName('Sales_Order_Status').AsInteger < 100) and
     (now < dbgDetails.datasource.dataset.fieldbyname('Date_Required').asDateTime) and
     (dbgDetails.datasource.dataset.fieldbyname('Date_Required').asdatetime <> 0) and
     (iDays <=7) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.color := clGreen;
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Sales_Order_Status').AsInteger < 100) and
     (now > dbgDetails.datasource.dataset.fieldbyname('Date_Required').asDateTime) and
     (dbgDetails.datasource.dataset.fieldbyname('Date_Required').asdatetime <> 0) and
     (iDays <= 2) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.color := $000080FF;
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Sales_Order_Status').AsInteger < 100) and
     (now > dbgDetails.datasource.dataset.fieldbyname('Date_Required').asDateTime) and
     (dbgDetails.datasource.dataset.fieldbyname('Date_Required').asdatetime <> 0) and
     (idays > 2) then
    begin
      (Sender as TDBGrid).Canvas.font.color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.color := clRed;
    end;
*)

  if  (dbgDetails.datasource.dataset.fieldByName('Remedial_Production').AsString = 'Y') or
      (dbgDetails.datasource.dataset.fieldByName('Remedial_No_Production').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := $00FF0080;
//      (Sender as TDBGrid).Canvas.font.style := [fsBold];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end ;

  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clYellow;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if (gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  TFloatField(dbgDetails.DataSource.DataSet.FieldByName('Goods_Value')).DisplayFormat := '0.00';
  TFloatField(dbgDetails.DataSource.DataSet.FieldByName('VAT_Value')).DisplayFormat := '0.00';
  TFloatField(dbgDetails.DataSource.DataSet.FieldByName('Total_Value')).DisplayFormat := '0.00';
  TFloatField(dbgDetails.DataSource.DataSet.FieldByName('Deposit_Terms')).DisplayFormat := '0.00';
  TFloatField(dbgDetails.DataSource.DataSet.FieldByName('Deposit_Amount')).DisplayFormat := '0.00';

  if  (Column.Title.Caption <> 'Order Value') and
      (Column.Title.Caption <> 'VAT') and
      (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Deposit Required') and
      (Column.Title.Caption <> 'Deposit Paid') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
  	begin
  		if Assigned(Column.Field) then
        Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmwtLUSales.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlAllSales.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlAllSales.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUSales.btnProformaClick(Sender: TObject);
var
  OldCursor : TCursor;
  Key: integer;
begin
  Key := 0;
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSSOrder := TfrmWTRSSOrder.Create( Application );
    Key := dtmdlAllSales.CurrentSOrder;
    frmWTRSSOrder.PrintType := 'I';
    frmWTRSSOrder.bRetail := (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y');
    frmWTRSSOrder.bSpeculative := (dbgdetails.DataSource.DataSet.fieldbyname('Customer_is_Speculative').asstring = 'Y');
    frmWTRSSOrder.memSelection.text := inttostr(Key);
    frmWTRSSOrder.showmodal;
  finally
    frmWTRSSOrder.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Sales_order', Variant(inttostr(Key)),[lopartialKey]) ;
    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Sales_order', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmwtLUSales.btnPaymentsClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
  FunctionMode: string;
begin
  FunctionMode := '';
  if dbgDetails.DataSource.dataset.fieldbyname('Sales_Order_Status').asinteger >= 90 then
    begin
      if messagedlg('This order has been invoiced therefore payments must be managed through the invoicing module. Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        begin
          exit;
        end;
      FunctionMode := 'V';
    end;

  key := dbgDetails.DataSource.dataset.fieldbyname('Sales_Order').asinteger;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUPayments := TfrmWTLUPayments.Create(Self);
  try
    frmWTLUPayments.lblSalesOrder.caption := 'Sales Order: ' + inttostr(key);
    frmWTLUPayments.lblCustomer.caption := 'Customer: ' + dbgDetails.DataSource.dataset.fieldbyname('Customer_Name').asstring;
    frmWTLUPayments.lblAccountCode.caption := 'Account Code: ' + dbgDetails.DataSource.dataset.fieldbyname('Account_Code').asstring;
    frmWTLUPayments.lblDescription.caption := 'Description:' + dbgDetails.DataSource.dataset.fieldbyname('Descriptive_Reference').asstring;
    frmWTLUPayments.rDepositTerms := dbgDetails.DataSource.dataset.fieldbyname('Deposit_Terms').asfloat;
    frmWTLUPayments.rTotalValue := dbgDetails.DataSource.dataset.fieldbyname('Total_Value').asfloat;
    frmWTLUPayments.rDepositAmount := dbgDetails.DataSource.dataset.fieldbyname('Deposit_Amount').asfloat;
    frmWTLUPayments.SalesOrder := key;
    frmWTLUPayments.SalesInvoice := 0;
    frmWTLUPayments.FunctionMode := FunctionMode;
    frmWTLUPayments.ShowModal;
  finally
    frmWTLUPayments.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Sales_order', Variant(inttostr(Key)),[lopartialKey]) ;
    with dbgDetails do
      begin
        try
          if datasource.dataset.recordcount > 0 then
            SelectedRows.CurrentRowSelected := true ;
        except
        end;
      end;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmwtLUSales.btnFittingEmailClick(Sender: TObject);
var
  OldCursor : TCursor;
  key, iCount: integer;
  // sTo, sTemp, sSubject, sBodyText: string;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSFittingConfirm := TfrmWTRSFittingConfirm.Create( Application );
    Key := dtmdlAllSales.CurrentSOrder;
    frmWTRSFittingConfirm.sOrderNumber := inttostr(Key);

    {Build up the selection memo box based on the selection}
    for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
      begin
        dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
        if iCount = 0 then
          frmWTRSFittingConfirm.memselection.Text := dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring
        else
          frmWTRSFittingConfirm.memselection.Text := frmWTRSFittingConfirm.memselection.Text + ',' + dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring;
      end;
    frmWTRSFittingConfirm.SalesOrderCount := dbgDetails.SelectedRows.Count;
    frmWTRSFittingConfirm.showmodal;
  finally
    frmWTRSFittingConfirm.free;
    Screen.Cursor := OldCursor;
  end;

(*  key := dtmdlAllSales.CurrentSOrder;
  AttachmentList := TStringList.Create;
  try
    sSubject := 'Scheduled Fitting Date for order ' + inttostr(key);

    if  (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y') or
        (dbgdetails.DataSource.DataSet.fieldbyname('Customer_is_Speculative').asstring = 'Y') then
      begin
        sBodyText := dtmdlWorktops.GetEmailSalesConfirmFittingDetails;
        sTo := dtmdlAllSales.GetAddressEmail(dbgdetails.DataSource.DataSet.fieldbyname('Address').asinteger);
      end
    else
      begin
        sBodyText := dtmdlWorktops.GetEmailSalesConfirmFittingDetails;
        sTo := dtmdlAllSales.GetSalesOrderContactEmail(key);
      end;

    if trim(sBodyText) = '' then
      sBodyText := 'Please find attached confirmation of your fitting date for order ' + inttostr(key) + '.' + #13#10#13#10
                         +  'If you have any queries please contact me immediately' + #13#10#13#10;

    {Replace the order number}
    if pos('<Number>', sBodyText) > 0 then
      begin
        sBodyText := stringreplace(sBodyText, '<Number>', inttostr(key), [rfIgnoreCase])
      end;

    {Replace the contact name}
    if pos('<Customer Contact>', sBodyText) > 0 then
      begin
        if trim(dbgDetails.datasource.dataset.fieldbyname('Contact_Name').asstring) <> '' then
          sBodyText := stringreplace(sBodyText, '<Customer Contact>', dbgDetails.datasource.dataset.fieldbyname('Contact_Name').asstring, [rfIgnoreCase])
        else
          sBodyText := stringreplace(sBodyText, '<Customer Contact>', 'Sir/Madam', [rfIgnoreCase]);
      end;

    {Replace the Date Type}
    if pos('<Date Type>', sBodyText) > 0 then
      begin
        if trim(dbgDetails.datasource.dataset.fieldbyname('Date_Type').asstring) = 'P' then
              sBodyText := stringreplace(sBodyText, '<Date Type>', 'provisional', [rfIgnoreCase])
        else
        if trim(dbgDetails.datasource.dataset.fieldbyname('Date_Type').asstring) = 'C' then
              sBodyText := stringreplace(sBodyText, '<Date Type>', 'confirmed', [rfIgnoreCase])
        else
              sBodyText := stringreplace(sBodyText, '<Date Type>', 'to be confirmed', [rfIgnoreCase]);
      end;

    {Replace the Template Date}
    if pos('<Template Date>', sBodyText) > 0 then
      begin
        if trim(dbgDetails.datasource.dataset.fieldbyname('Template_Date').asstring) <> '' then
              sBodyText := stringreplace(sBodyText, '<Template Date>', paDateStr(dbgDetails.datasource.dataset.fieldbyname('Template_Date').asDateTime), [rfIgnoreCase])
        else
              sBodyText := stringreplace(sBodyText, '<Template Date>', 'TBC', [rfIgnoreCase]);
      end;

    {Replace the Fitting Date}
    if pos('<Fitting Date>', sBodyText) > 0 then
      begin
        if trim(dbgDetails.datasource.dataset.fieldbyname('Date_Required').asstring) <> '' then
              sBodyText := stringreplace(sBodyText, '<Fitting Date>', paDateStr(dbgDetails.datasource.dataset.fieldbyname('Date_Required').asDateTime), [rfIgnoreCase])
        else
              sBodyText := stringreplace(sBodyText, '<Fitting Date>', 'TBC', [rfIgnoreCase]);
      end;

    {Replace the description}
    if pos('<Description>', sBodyText) > 0 then
      begin
        sBodyText := stringreplace(sBodyText, '<Description>', dbgDetails.datasource.dataset.fieldbyname('Descriptive_Reference').asstring, [rfIgnoreCase])
      end;

    {Replace the office contact}
    if pos('<Office Contact>', sBodyText) > 0 then
      begin
        sBodyText := stringreplace(sBodyText, '<Office Contact>', dbgDetails.datasource.dataset.fieldbyname('Account_Manager_Name').asstring, [rfIgnoreCase]);
      end;

    {Replace the telephone}
    if pos('<Telephone>', sBodyText) > 0 then
      begin
        sBodyText := stringreplace(sBodyText, '<Telephone>', dbgDetails.datasource.dataset.fieldbyname('AM_Telephone_Number').asstring, [rfIgnoreCase]);
      end;

    EmailViaOutlook(sTo,sSubject,sBodyText, AttachmentList, frmWTMain.EmailApplication, frmWTMain.EmailAccount);
  finally
    AttachmentList.Free;
  end;
*)
end;

procedure TfrmwtLUSales.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsUnderline, fsBold] then
    SortType := ' ASC'
  else if dtmdlAllSales.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  if (column.FieldName = 'Template_Date_New') then
    SortField := 'Sales_Order.Template_Date'
  else if (column.FieldName = 'Fitting_Date_New') then
    SortField := 'Sales_Order.Date_Required'
  else if (column.FieldName = 'Status_Text') then
    SortField := 'Sales_Order_Status.Sales_Order_Status_Desc'
  else
    SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [fsBold];
  Column.Title.Font.Style := [fsUnderline, fsBold];

  dtmdlAllSales.SortOrder := SortField + SortType;
  dtmdlAllSales.SortType := SortType;

  dtmdlAllSales.refreshAlldata;
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
