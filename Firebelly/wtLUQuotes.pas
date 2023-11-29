unit wtLUQuotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, Grids, DBGrids, WTQuotesDM,
  Buttons, AllCommon, IniFiles, wtDataModule, System.ImageList;

type
  TfrmwtLUQuotes = class(TForm)
    stsBrDetails: TStatusBar;
    Panel1: TPanel;
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
    btnCopy: TToolButton;
    dbgDetails: TDBGrid;
    btnConvert: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    btnJob: TToolButton;
    btnTemplate: TToolButton;
    Panel2: TPanel;
    Label3: TLabel;
    edtNumber: TEdit;
    Button1: TButton;
    lblWorkinProgress: TLabel;
    btnSearch: TBitBtn;
    chkbxHighImportance: TCheckBox;
    Label4: TLabel;
    cmbCustomerFilter: TComboBox;
    btnRequote: TToolButton;
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
    procedure btnPrintClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnJobClick(Sender: TObject);
    procedure btnTemplateClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxHighImportanceClick(Sender: TObject);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure btnRequoteClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(aMode: TqMode);
    procedure ConvertToJobScreen;
    procedure ConvertToSalesOrder;
    function CheckInput: boolean;
    procedure ConvertToTradeCustomer;
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmwtLUQuotes: TfrmwtLUQuotes;
  dtmdlAllQuote: TdtmdlQuote;

implementation

uses
  System.UITypes,
  WtMaintQuote, wtRSQuote, WtMaintJob, WTJobsDM, WTQuoteSearch,
  WTLUQuoteRpts, WTSalesOrderDM, wtMaintSalesOrder, wtMain, WTSrchCustomer;

{$R *.DFM}

{ TfrmLUQuotes }

procedure TfrmwtLUQuotes.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmwtLUQuotes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'QuotesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmwtLUQuotes.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUQuotes.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  dtmdlAllQuote := TdtmdlQuote.create(Application);
  dtmdlAllQuote.dtsAllQuotes.OnDataChange := SetButtons;

  dbgDetails.DataSource := dtmdlAllQuote.dtsAllQuotes;

  try
    with IniFile do
    begin
      if (ReadString('Quote', 'Customer Filter', '0') = '0') then
        cmbCustomerFilter.itemindex := 0
      else
      if (ReadString('Quote', 'Customer Filter', '1') = '1') then
        cmbCustomerFilter.itemindex := 1
      else
      if (ReadString('Quote', 'Customer Filter', '2') = '2') then
        cmbCustomerFilter.itemindex := 2
      else
      if (ReadString('Quote', 'Customer Filter', '3') = '3') then
        cmbCustomerFilter.itemindex := 3;

      sShowLive := ReadString('Quote', 'Show Live Quotes', 'None');
      dtmdlAllQuote.ShowRecords := strtoint(ReadString('Quote', 'Show Records', '0'));
      dtmdlAllQuote.ShowMonths := strtoint(ReadString('Quote', 'Show Months', '0'));
      dtmdlAllQuote.QuoteDate := paDateStr(ReadString('Quote', 'Show From Date', ''));
    end;
  finally
    IniFile.Free;
  end;

  if sShowLive = 'None' then
    dtmdlAllQuote.ShowLive := false
  else
    dtmdlAllQuote.ShowLive := true;

  AllCommon.SetDBGridCols('', 'QuotesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmwtLUQuotes.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  if dtmdlAllQuote.ShowLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Quote', 'Show Live Quotes', sShowLive);
      WriteString('Quote', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
      WriteString('Quote', 'Show Records', inttostr(dtmdlAllQuote.ShowRecords));
      WriteString('Quote', 'Show Months', inttostr(dtmdlAllQuote.ShowMonths));
      WriteString('Quote', 'Show From Date', paDateStr(dtmdlAllQuote.QuoteDate));
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllQuote.free;
end;

procedure TfrmwtLUQuotes.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllQuote.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmwtLUQuotes.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllQuote.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllQuote.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUQuotes.FormShow(Sender: TObject);
begin
//  dtmdlAllQuote.RefreshAlldata;
  edtSearch.setfocus;
end;

procedure TfrmwtLUQuotes.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllQuote do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnPrint.Enabled := HeaderCountAll > 0;
    btnCopy.Enabled := HeaderCountAll > 0;
    btnRequote.Enabled := HeaderCountAll > 0;
    btnTemplate.Enabled := HeaderCountAll > 0;
    btnConvert.Enabled := HeaderCountAll > 0;
    btnJob.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Quote').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblWorkinProgress.Visible := ShowLive;
    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmwtLUQuotes.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallMaintScreen(qChange);
end;

procedure TfrmwtLUQuotes.CallMaintScreen(aMode : TqMode);
var
  Key : integer;
  frm : TfrmWtMaintQuote;
  aQuote : TQuote;
  bOK: boolean;
begin
  bOk := False;
  if aMode = qAdd then
    Key := 0
  else
  if aMode = qDelete then
    begin
      if (dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >= 24) then {Don't delete if converted to order}
        begin
          MessageDlg('This quote is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', you cannot delete the quote.',
              mtConfirmation, [mbOK], 0);
          exit;
        end;
      Key := dtmdlAllQuote.CurrentQuote;
    end
  else
  if aMode = qRequote then
    begin
      if (dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >= 23) then
        begin
          MessageDlg('This quote is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', you can only requote through the sales order.',
              mtConfirmation, [mbOK], 0);
          exit;
        end;
      Key := dtmdlAllQuote.CurrentQuote;
    end
  else
  if aMode = qChange then
    begin
      if (dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >= 10) and
         (dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger < 23)  then
        begin
          if  (dbgDetails.DataSource.DataSet.FieldByName('Expiry_Date').asdatetime <> 0) and
              (dbgDetails.DataSource.DataSet.FieldByName('Expiry_Date').asdatetime < date) then
              if MessageDlg('This quote has expired. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                exit
(*          else
          if MessageDlg('This quote is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
*)
        end
      else
      if (dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger > 22) then
        begin
          if MessageDlg('This quote is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', only the costs can be changed or deleted, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit
          else
            aMode := qView;
        end;

      Key := dtmdlAllQuote.CurrentQuote;
    end
  else
    Key := dtmdlAllQuote.CurrentQuote;

  try
    aQuote := TQuote.Create(dtmdlAllQuote);
    try
      aQuote.DbKey := key;
      aQuote.qMode := aMode;
      aQuote.LoadFromDB;
      Frm := TfrmwtMaintQuote.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.OriginalQuoteFromReQuote := aQuote.dbKey;
        Frm.Quote := aQuote;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aQuote.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aQuote.Free;
    end;
  finally
    if bOK then
    begin
      dbgdetails.DataSource.DataSet.Close;
      dbgdetails.DataSource.DataSet.Open;
      while dbgdetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(Key)),[lopartialKey]) <> true do
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

procedure TfrmwtLUQuotes.ConvertToJobScreen;
var
  Key, iQuoteNo : integer;
  frm : TfrmWtMaintJob;
  aJob : TJob;
  sCreditStatus: string;
begin
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >=30 then
    begin
      MessageDlg('Cannot convert this quote, the quote has already been converted to a job', mtError,
        [mbAbort], 0);
      exit;
    end
  else
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger < 23 then
    begin
      if not frmWTMain.bEndUSer then
        begin
          MessageDlg('Cannot convert this quote, the quote has not been confirmed as a sales order', mtError,
            [mbAbort], 0);
          exit;
        end;
    end;

  {Check Credit Status}
  sCreditStatus := dtmdlWorktops.GetCustomerCreditStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger);
  if sCreditStatus = 'B' then
    begin
      MessageDlg(cBlock, mtWarning,[mbOk], 0);
      exit;
    end;

  if MessageDlg('Do you want to convert quote ' + edtNumber.text + ', to a new job?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  dtmdlJob := TdtmdlJob.create(application);
  iQuoteNo := 0;
  Key := 0;
  try
    aJob := TJob.Create(dtmdlJob);
    try
      iQuoteNo := dtmdlAllQuote.CurrentQuote;
      aJob.DataModule.QuoteNo := dtmdlAllQuote.CurrentQuote;
      aJob.DbKey := key;
      aJob.LoadFromQuote;
      Frm := TfrmwtMaintJob.Create(Self);
      try
        Frm.Mode := jConvert;
        Frm.Job := aJob;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          begin
            dtmdlAllQuote.UpdateQStatus(aJob.Quote,30);
            dtmdlAllQuote.UpdateSOStatus(aJob.dbKey,aJob.Quote,50);
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
    dbgdetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(iQuoteNo)),[lopartialKey]) ;
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

procedure TfrmwtLUQuotes.ConvertToSalesOrder;
var
  Key, iQuoteNo : integer;
  frm : TfrmWtMaintSalesOrder;
  aSOrder : TSOrder;
  sCreditStatus: string;
begin
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >=30 then
    begin
      MessageDlg('Cannot convert this quote, the quote has already been converted to a sales order', mtError,
        [mbAbort], 0);
      exit;
    end
  else
  if dbgdetails.DataSource.DataSet.FieldByName('Quote_status').asinteger >= 23 then
    begin
      MessageDlg('This quote has already been confirmed as a sales order', mtError,
        [mbAbort], 0);
      exit;
    end;

  if  (dbgDetails.DataSource.DataSet.FieldByName('Expiry_Date').asdatetime <> 0) and
      (dbgDetails.DataSource.DataSet.FieldByName('Expiry_Date').asdatetime < date) then
      if MessageDlg('This quote has expired. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

  {Check Credit Status}
  sCreditStatus := dtmdlWorktops.GetCustomerCreditStatus(dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger);
  if sCreditStatus = 'B' then
    begin
      MessageDlg(cBlock, mtWarning,[mbOk], 0);
      exit;
    end;

  if (dbgdetails.DataSource.DataSet.FieldByName('Customer_is_Speculative').asstring = 'Y') then
    begin
      if MessageDlg('This quote is for a speculative trade customer, do you want to convert to a confirmed trade customer?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            ConvertToTradeCustomer;
    end;

  dtmdlSalesOrder := TdtmdlSalesOrder.create(application);
  iQuoteNo := 0;
  Key := 0;
  try
    aSOrder := TSOrder.Create(dtmdlSalesOrder);
    try
      iQuoteNo := dtmdlAllQuote.CurrentQuote;
      aSOrder.DataModule.QuoteNo := dtmdlAllQuote.CurrentQuote;
      aSOrder.DbKey := key;
      aSOrder.LoadFromQuote;
      Frm := TfrmwtMaintSalesOrder.Create(Self);
      try
        Frm.Mode := sopConvert;
        Frm.SOrder := aSOrder;
        Frm.ShowModal;
        if Frm.ModalResult = idOK then
          dtmdlAllQuote.UpdateQStatusSO(aSOrder.DataModule.QuoteNo, 24);
      finally
        Frm.Free;
      end;
    finally
      aSOrder.Free;
    end;
  finally
    dtmdlSalesOrder.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(iQuoteNo)),[lopartialKey]) ;
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

procedure TfrmwtLUQuotes.ConvertToTradeCustomer;
var
  iCustomer, iAddress: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);

  try
    frmwtSrchCustomer.CodeSelected := dbgdetails.DataSource.DataSet.FieldByName('Customer').asinteger;
    frmwtSrchCustomer.Address := dbgdetails.DataSource.DataSet.FieldByName('Address').asinteger;

    frmwtSrchCustomer.edtSearch.Text := dbgdetails.DataSource.DataSet.FieldByName('Customer_Name').asstring;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        {Update quote with new customer details and remove address details}
        iCustomer := frmwtSrchCustomer.CodeSelected;
        iAddress := dbgdetails.DataSource.DataSet.FieldByName('Address').asinteger;
        dtmdlAllQuote.UpdateQAddress(dtmdlAllQuote.CurrentQuote,iCustomer, iAddress, frmwtSrchCustomer.NameSelected);
(*        {Convert all quotes to new customer and remove all address details}
        dtmdlAllQuote.UpdateAllQAddress(dbgdetails.DataSource.DataSet.FieldByName('Customer_Name').asstring,iCustomer);
        {Convert all contract quotes to new customer and remove all address details}
*)
      end;
  finally
    frmwtSrchCustomer.Free;
  end;
end;

procedure TfrmwtLUQuotes.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(qAdd);
end;

procedure TfrmwtLUQuotes.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmwtLUQuotes.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(qDelete);
end;

procedure TfrmwtLUQuotes.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
  iCount: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSQuote := TfrmWTRSQuote.Create( Application );
    Key := dtmdlAllQuote.CurrentQuote;
    frmWTRSQuote.bRetail := (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y');
    frmWTRSQuote.bSpeculative := (dbgdetails.DataSource.DataSet.fieldbyname('Customer_is_Speculative').asstring = 'Y');

//    frmWTRSQuote.memSelection.text := inttostr(Key);

    {Build up the selection memo box based on the selection}
    for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
      begin
        dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
          if iCount = 0 then
            frmWTRSQuote.memselection.Text := dbgDetails.datasource.dataset.fieldbyname('Quote').asstring
          else
            frmWTRSQuote.memselection.Text := frmWTRSQuote.memselection.Text + ',' + dbgDetails.datasource.dataset.fieldbyname('Quote').asstring;
      end;

    frmWTRSQuote.showmodal;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(Key)),[lopartialKey]) ;
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
    frmWTRSQuote.free;
  end;
end;

procedure TfrmwtLUQuotes.btnCopyClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(qCopy);
end;

procedure TfrmwtLUQuotes.btnConvertClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  ConvertToSalesOrder
end;

procedure TfrmwtLUQuotes.btnSearchClick(Sender: TObject);
begin
  frmWTQuoteSearch := TfrmWTQuoteSearch.create(self);
  try
    frmWTQuoteSearch.dtmdlQuote := dtmdlAllQuote;
    frmWTQuoteSearch.edtDescription.text := dtmdlAllQuote.Description;
    frmWTQuoteSearch.edtProjectReference.Text := dtmdlAllQuote.ProjectReference;
    frmWTQuoteSearch.edtReference.Text := dtmdlAllQuote.Reference;
    frmWTQuoteSearch.edtMaterial.Text := dtmdlAllQuote.Material;
    frmWTQuoteSearch.edtStatus.Text := dtmdlAllQuote.Status;
    frmWTQuoteSearch.edtQuoteReference.Text := dtmdlAllQuote.QuoteReference;
    frmWTQuoteSearch.chkbxShowLive.checked := dtmdlAllQuote.showlive;
    frmWTQuoteSearch.chkbxShowInactive.checked := dtmdlAllQuote.showInactive = 'Y';
    frmWTQuoteSearch.spnedtRecords.Value := dtmdlAllQuote.showRecords;
    frmWTQuoteSearch.spnedtMonths.Value := dtmdlAllQuote.showMonths;
    frmWTQuoteSearch.edtExpiryDate.text := PADateStr(dtmdlAllQuote.ExpiryDate);
    frmWTQuoteSearch.edtQuoteDate.text := PADateStr(dtmdlAllQuote.QuoteDate);
    frmWTQuoteSearch.showModal;
  finally
    frmWTQuoteSearch.free;
  end;
end;

procedure TfrmwtLUQuotes.ToolButton1Click(Sender: TObject);
begin
  frmWTLUQuoteRpts := TfrmWTLUQuoteRpts.create(self);
  try
    frmWTLUQuoteRpts.showmodal;
  finally
    frmWTLUQuoteRpts.free;
  end;
end;

procedure TfrmwtLUQuotes.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    dbgDetails.SelectedRows.Clear;
    if dbgDetails.Datasource.Dataset.Locate('Quote', Variant(edtNumber.Text), [loPartialKey]) then
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
      ShowMessage('Quote: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

function TfrmwtLUQuotes.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Quote', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Quote '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmwtLUQuotes.FormActivate(Sender: TObject);
begin
  if frmWTMain.bEndUser then
    begin
      btnTemplate.visible := false;
      btnConvert.Visible := false;
    end;

  dtmdlAllQuote.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllQuote.RefreshAlldata;
  dbgDetails.datasource.DataSet.locate('Quote', Variant(inttostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUQuotes.btnJobClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  ConvertToJobScreen;

end;

procedure TfrmwtLUQuotes.btnTemplateClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
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

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSQuote := TfrmWTRSQuote.Create( Application );
    Key := dtmdlAllQuote.CurrentQuote;
    frmWTRSQuote.memSelection.text := inttostr(Key);
    frmWTRSQuote.PrintType := 'T';
    frmWTRSQuote.showmodal;
  finally
    frmWTRSQuote.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Quote', Variant(inttostr(Key)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUQuotes.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Quote').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmwtLUQuotes.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Quote_Status').asinteger = 5) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clLime;
      (Sender as TDBGrid).Canvas.Font.Color := clblue;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Quote_Status').asinteger < 23) then
    begin
      if (dbgDetails.datasource.dataset.fieldByName('Importance').Asstring = 'H') then
        begin
          (Sender as TDBGrid).Canvas.Brush.color := clRed;
          (Sender as TDBGrid).Canvas.Font.Color := clWhite;

          if(gdFocused in State) or (gdSelected in State) then
            begin
              (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
            end;

          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end
      else
        if (dbgDetails.datasource.dataset.fieldByName('Importance').Asstring = 'L') then
          begin
            (Sender as TDBGrid).Canvas.Brush.color := clYellow;
            (Sender as TDBGrid).Canvas.font.color := clblue;

            if(gdFocused in State) or (gdSelected in State) then
              begin
                (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
              end;

            (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
          end
      else
        begin
          if(gdFocused in State) or (gdSelected in State) then
            begin
              (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
              (Sender as TDBGrid).Canvas.Font.Color := clWhite;
              (Sender as TDBGrid).Canvas.Brush.Color := clMenuHighlight;
              (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
            end;
        end;
    end
  else
    begin
      if(gdFocused in State) or (gdSelected in State) then
        begin
          (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
          (Sender as TDBGrid).Canvas.Font.Color := clWhite;
          (Sender as TDBGrid).Canvas.Brush.Color := clMenuHighlight;
          (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
        end;
    end;

  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.Color := clMenuHighlight;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if  (Column.Title.Caption <> 'Quote') and (Column.Title.Caption <> 'Supply Price') and (Column.Title.Caption <> 'Install Price')
                                        and (Column.Title.Caption <> 'Survey Price') and (Column.Title.Caption <> 'Delivery Price')
                                        and (Column.Title.Caption <> 'Quote Reference') and (Column.Title.Caption <> 'Original Quote')
                                        and (Column.Title.Caption <> 'Sales Order') then
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

procedure TfrmwtLUQuotes.chkbxHighImportanceClick(Sender: TObject);
begin
  dtmdlAllQuote.HighImportance := (Sender as TCheckbox).checked;
  dtmdlAllQuote.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUQuotes.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlAllQuote.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlAllQuote.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUQuotes.btnRequoteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(qRequote);
end;

procedure TfrmwtLUQuotes.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsUnderline, fsBold] then
    SortType := ' ASC'
  else if dtmdlAllQuote.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  if (column.FieldName = 'Status_Text') then
    SortField := 'Quote_Status.Quote_Status_Description'
  else
    SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [fsBold];
  Column.Title.Font.Style := [fsUnderline, fsBold];

  dtmdlAllQuote.SortOrder := SortField + SortType;
  dtmdlAllQuote.SortType := SortType;

  dtmdlAllQuote.refreshAlldata;
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
