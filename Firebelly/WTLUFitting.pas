unit WTLUFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ImgList, Buttons, StdCtrls, ExtCtrls,
  ToolWin, DB, wtSalesOrderDM, AllCommon, IniFiles, DateUtils, Math,
  DateSelV5, System.ImageList;

type
  TfrmWTLUFitting = class(TForm)
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    cmbCustomerFilter: TComboBox;
    stsBrDetails: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    edtNumber: TEdit;
    CoolBar1: TCoolBar;
    imgLstHot: TImageList;
    ToolBar1: TToolBar;
    btnChange: TToolButton;
    btnFitting: TToolButton;
    btnComplete: TToolButton;
    ToolButton1: TToolButton;
    btnReports: TToolButton;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    lblWorkinProgress: TLabel;
    BitBtn2: TBitBtn;
    btnReturned: TToolButton;
    btnDeliveryNote: TToolButton;
    chkbxShowOnlyScheduled: TCheckBox;
    cmbActionDate: TComboBox;
    pnlDateSelection: TPanel;
    Label8: TLabel;
    edtTempDate: TEdit;
    btnTempDate: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure cmbActionDateChange(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure btnFittingClick(Sender: TObject);
    procedure btnReturnedClick(Sender: TObject);
    procedure btnCompleteClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnDeliveryNoteClick(Sender: TObject);
    procedure chkbxShowOnlyScheduledClick(Sender: TObject);
    procedure btnTempDateClick(Sender: TObject);
    procedure edtTempDateChange(Sender: TObject);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    function CheckInput: boolean;
    procedure CallMaintScreen(aMode: TsopMode);
    procedure ConvertToJobScreen(iQuoteNo: integer);
    procedure CallCompleteScreen;
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmWTLUFitting: TfrmWTLUFitting;
  dtmdlFitting: TdtmdlSalesOrder;

implementation

uses
  System.UITypes, System.Types,
  wtDataModule, wtMain, WtMaintSalesOrder, wtRSTemplateSheet, WTRSSODeliveryNote,
  wtLUSOLines, WTJobsDM, WtMaintJob, WTRSFittingSheet, WtMaintJobComplete, WTLUFittingRpts;

{$R *.dfm}

{ TfrmWTLUTemplating }

procedure TfrmWTLUFitting.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUFitting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'FittingLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmWTLUFitting.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUFitting.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive, sShowOnSchedule: string;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  dtmdlFitting := TdtmdlSalesOrder.create(Application);
  dtmdlFitting.dtsAllSales.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlFitting.dtsAllSales;

  try
    with IniFile do
      begin
        if (ReadString('Fitting', 'Customer Filter', '0') = '0') then
          cmbCustomerFilter.itemindex := 0
        else
        if (ReadString('Fitting', 'Customer Filter', '1') = '1') then
          cmbCustomerFilter.itemindex := 1
        else
        if (ReadString('Fitting', 'Customer Filter', '2') = '2') then
          cmbCustomerFilter.itemindex := 2
        else
        if (ReadString('Fitting', 'Customer Filter', '3') = '3') then
          cmbCustomerFilter.itemindex := 3;

        {Decide which date we want to default to}
        if (ReadString('Fitting', 'Template Date Default', '0') = '0') then
          cmbActionDate.itemindex := 0
        else
        if (ReadString('Fitting', 'Template Date Default', '1') = '1') then
          cmbActionDate.itemindex := 1
        else
        if (ReadString('Fitting', 'Template Date Default', '2') = '2') then
          cmbActionDate.itemindex := 2
        else
        if (ReadString('Fitting', 'Template Date Default', '3') = '3') then
          cmbActionDate.itemindex := 3
        else
        if (ReadString('Fitting', 'Template Date Default', '4') = '4') then
          cmbActionDate.itemindex := 4
        else
        if (ReadString('Fitting', 'Template Date Default', '5') = '5') then
          cmbActionDate.itemindex := 5;

        edtTempDate.Text := ReadString('Fitting', 'Template Date', '');
        sShowLive := ReadString('Fitting', 'Show Live Orders', 'None');
        sShowOnSchedule := ReadString('Fitting', 'Show On Schedule', 'None');
        dtmdlFitting.ShowRecords := strtoint(ReadString('Fitting', 'Show Records', '0'));
      end;
  finally
    IniFile.Free;
  end;

  dtmdlFitting.OrderStatus := 60;

(*  dtmdlFitting.ActionStart := date + 1;
  dtmdlFitting.ActionEnd := date + 1;
  cmbActionDate.ItemIndex := 1;
*)

  if sShowLive = 'None' then
    dtmdlFitting.ShowLive := false
  else
    dtmdlFitting.ShowLive := true;

  if sShowOnSchedule = 'None' then
    dtmdlFitting.ShowOnSchedule := false
  else
    dtmdlFitting.ShowOnSchedule := true;

  chkbxShowOnlyScheduled.checked := dtmdlFitting.ShowOnSchedule;

  AllCommon.SetDBGridCols('', 'FittingLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUFitting.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive, sShowOnSchedule: string;
begin
  if dtmdlFitting.ShowLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  if dtmdlFitting.ShowOnSchedule then
    sShowOnSchedule := 'Show'
  else
    sShowOnSchedule := 'None';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
      begin
        WriteString('Fitting', 'Show On Schedule', sShowOnSchedule);
        WriteString('Fitting', 'Show Live Orders', sShowLive);
        WriteString('Fitting', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
        WriteString('Fitting', 'Template Date Default', inttostr(cmbActionDate.itemindex));
        WriteString('Fitting', 'Template Date', edtTempDate.Text);
        WriteString('Fitting', 'Show Records', inttostr(dtmdlFitting.ShowRecords));
      end;
  finally
    IniFile.free;
  end;

  dtmdlFitting.free;
end;

procedure TfrmWTLUFitting.btnSearchClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlFitting.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmWTLUFitting.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlFitting.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlFitting.RefreshFittingData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUFitting.FormShow(Sender: TObject);
begin
  dtmdlFitting.RefreshFittingData;
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

procedure TfrmWTLUFitting.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlFitting do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnFitting.Enabled := HeaderCountAll > 0;
    btnDeliveryNote.Enabled := HeaderCountAll > 0;
    btnReturned.Enabled := HeaderCountAll > 0;
    btnComplete.Enabled := HeaderCountAll > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asstring;
(*    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
*)

    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmWTLUFitting.FormActivate(Sender: TObject);
begin
  dtmdlFitting.TradeRetail := cmbCustomerFilter.itemindex;
  cmbActionDateChange(Self);

  dtmdlFitting.RefreshFittingData;
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

function TfrmWTLUFitting.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('sales_order', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Sales Order '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmWTLUFitting.edtNumberKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmWTLUFitting.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_order').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmWTLUFitting.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
  idays: integer;
begin
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clYellow;
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Fitting_Docs_Returned').Asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clBlue;
      (Sender as TDBGrid).Canvas.Brush.color := clLime;
    end
  else
  if  (dbgDetails.datasource.dataset.fieldByName('Remedial_Production').AsString = 'Y') or
      (dbgDetails.datasource.dataset.fieldByName('Remedial_No_Production').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := $00FF0080;
    end;


  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Order Value') and
      (Column.Title.Caption <> 'VAT') and
      (Column.Title.Caption <> 'Total') and
      (Column.Title.Caption <> 'Deposit Required') and
      (Column.Title.Caption <> 'Deposit Paid') then
  	begin
      if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		if Assigned(Column.Field) then 
	  StrPCopy(Txt, Column.field.text) else
	  StrPCopy(Txt, '');
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;

end;

procedure TfrmWTLUFitting.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlFitting.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlFitting.RefreshFittingData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUFitting.cmbActionDateChange(Sender: TObject);
var
  tempdate: TDateTime;
begin
  pnlDateSelection.Visible := false;

  case cmbActionDate.itemindex of
      0: begin
          case DayofTheWeek(date) of
            1..4:
              begin
                dtmdlFitting.ActionStart := date + 1;
                dtmdlFitting.ActionEnd := date + 2;
              end;
            5:
              begin
                dtmdlFitting.ActionStart := date + 3;
                dtmdlFitting.ActionEnd := date + 4;
              end;
            6:
              begin
                dtmdlFitting.ActionStart := date + 2;
                dtmdlFitting.ActionEnd := date + 3;
              end;
            7:
              begin
                dtmdlFitting.ActionStart := date + 1;
                dtmdlFitting.ActionEnd := date + 2;
              end;
          end
         end;
      1: begin
            dtmdlFitting.ActionStart := date + 1;
            dtmdlFitting.ActionEnd := date + 2;
         end;
      2: begin
            dtmdlFitting.ActionStart := date;
            dtmdlFitting.ActionEnd := date + 1;
         end;
      3: begin
            dtmdlFitting.ActionStart := date - 1;
            dtmdlFitting.ActionEnd := date;
         end;
      4: begin
          case DayofTheWeek(date) of
            2..6:
              begin
                dtmdlFitting.ActionStart := date - 1;
                dtmdlFitting.ActionEnd := date;
              end;
            7:
              begin
                dtmdlFitting.ActionStart := date - 2;
                dtmdlFitting.ActionEnd := date - 1;
              end;
            1:
              begin
                dtmdlFitting.ActionStart := date - 3;
                dtmdlFitting.ActionEnd := date - 2;
              end;
          end
         end;
  else
    begin
      pnlDateSelection.Visible := true;
      if trim(edtTempDate.Text) <> '' then
        begin
          dtmdlFitting.ActionStart := padatestr(edtTempDate.Text);
          dtmdlFitting.ActionEnd := padatestr(edtTempDate.Text) + 1;
        end
      else
        exit;
    end;
  end;

  lblWorkinProgress.caption := cmbActionDate.text;

  if cmbActionDate.itemindex < 5 then
    lblWorkinProgress.caption := cmbActionDate.text
  else
    lblWorkinProgress.caption := cmbActionDate.text + ' ' + edtTempDate.text;

  dtmdlFitting.RefreshFittingData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUFitting.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlFitting.FitterName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmWTLUFitting.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(sopChange);
end;

procedure TfrmWTLUFitting.CallMaintScreen(aMode : TsopMode);
var
  Key : integer;
  frm : TfrmWtMaintSalesOrder;
  aSOrder : TSOrder;
  bOK: boolean;
//  sWarning: string;
begin

  if aMode = sopAdd then
    Key := 0
  else
  if (aMode = sopChange) or (aMode = sopDelete) then
    begin
      Key := dtmdlFitting.CurrentSOrder;
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
    key := dtmdlFitting.CurrentSOrder;


  try
    aSOrder := TSOrder.Create(dtmdlFitting);
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
      dbgdetails.DataSource.DataSet.Locate('Sales_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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

procedure TfrmWTLUFitting.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUFitting.ConvertToJobScreen(iQuoteNo: integer);
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

procedure TfrmWTLUFitting.BitBtn2Click(Sender: TObject);
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

procedure TfrmWTLUFitting.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlFitting.SortType = ' DESC' then
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
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlFitting.SortOrder := SortField + SortType;
  dtmdlFitting.SortType := SortType;

  dtmdlFitting.RefreshFittingData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUFitting.btnFittingClick(Sender: TObject);
var
  OldCursor : TCursor;
  iCount, key, SOKey: integer;
  rDepositReqd: real;
  sCreditStatus: string;
  bUsePurchasing: boolean;
  rOutstandingBalance: real;
begin
  OldCursor := Screen.Cursor;

//  Key := dbgDetails.datasource.DataSet.FieldByName('Job').asinteger;
  SOKey := dbgDetails.datasource.DataSet.FieldByName('Sales_Order').asinteger;

  {OK, let's check that we are able to print Fitting sheet}
  if dtmdlWorktops.CheckBalancePaid then
    begin
      rOutstandingBalance := (SimpleroundTo(dbgdetails.DataSource.DataSet.fieldbyname('Goods_Value').asfloat, -2) + SimpleroundTo(dbgdetails.DataSource.DataSet.fieldbyname('VAT_Value').asfloat,-2))
              - (SimpleroundTo(dbgdetails.DataSource.DataSet.fieldbyname('Deposit_Amount').asfloat,-2));

      if (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'Y') AND (rOutstandingBalance > 0) then
        begin
          messagedlg('There is still a balance outstanding for this job. Ensure full payment has been received before fitting.', mtInformation,
                      [mbOk], 0);
          exit;
        end
      else
      if  (dbgdetails.DataSource.DataSet.fieldbyname('is_retail_customer').asstring = 'N') AND
          (dbgdetails.DataSource.DataSet.fieldbyname('Credit_Status').asstring = 'L')  AND
          (dbgdetails.DataSource.DataSet.fieldbyname('Credit_Limit').asfloat = 0) AND
          (rOutstandingBalance > 0) then
        begin
          messagedlg('There is still a balance outstanding for this job. Ensure full payment has been received before fitting.', mtInformation,
                      [mbOk], 0);
          exit;
        end;
    end;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSFittingSheet := TfrmWTRSFittingSheet.Create( Application );
    Key := dtmdlFitting.CurrentSOrder;
    frmWTRSFittingSheet.sOrderNumber := inttostr(Key);

    {Build up the selection memo box based on the selection}
    for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
      begin
        dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
        if iCount = 0 then
          frmWTRSFittingSheet.memselection.Text := dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring
        else
          frmWTRSFittingSheet.memselection.Text := frmWTRSFittingSheet.memselection.Text + ',' + dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring;
      end;
    frmWTRSFittingSheet.SalesOrderCount := dbgDetails.SelectedRows.Count;
    frmWTRSFittingSheet.showmodal;
  finally
    frmWTRSFittingSheet.free;
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmWTLUFitting.btnReturnedClick(Sender: TObject);
var
  sMessage: string;
  sStatus: string;
  key: integer;
begin
  key := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;

  if  (dbgDetails.datasource.dataset.fieldbyname('Fitting_Docs_Returned').asstring = 'N') or
      (dbgDetails.datasource.dataset.fieldbyname('Fitting_Docs_Returned').asstring = '') then
    begin
      sMessage := 'Confirm fitting paperwork has been returned for this order';
      sStatus := 'Y';
    end
  else
    begin
      sMessage := 'Confirm fitting paperwork NOT yet returned for this order';
      sStatus := 'N';
    end ;

  if messagedlg(sMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      dtmdlFitting.SetFittingDocsReceived(key, sStatus);
      dtmdlFitting.SetRemedialCompleted(key, sStatus);
    end;
  
  dtmdlFitting.RefreshFittingData;
  dbgdetails.DataSource.DataSet.Locate('Sales_Order', Variant(inttostr(Key)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUFitting.btnCompleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  CallCompleteScreen;

end;

procedure TfrmWTLUFitting.CallCompleteScreen;
var
  Key, iFirstKey, SOrder, iCount : integer;
  frm : TfrmWtMaintJobComplete;
  aJob : TJob;
  dtmdlFittingJobs: TdtmdlJob;
begin
  if dbgDetails.SelectedRows.Count = 1 then
    begin
      if dbgdetails.DataSource.DataSet.FieldByName('Job_status').asinteger >= 50 then
        begin
          MessageDlg('This job is already complete.', mtError,
            [mbAbort], 0);
          exit;
        end;

      if messagedlg('Set this job to complete?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Key := dbgDetails.datasource.dataset.fieldbyname('Job').asinteger;
          SOrder := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;

          dtmdlFittingJobs := TdtmdlJob.create(Application);

          try
            try
              aJob := TJob.Create(dtmdlFittingJobs);

              aJob.DbKey := key;
              aJob.LoadFromDB;
              aJob.Status := 50;
              aJob.ActInstallDate := date;
              aJob.SaveStatustoDB;

              dtmdlFittingJobs.SetSOrderStatus(Key);
            finally
              aJob.Free;
            end;
          finally
            dtmdlFittingJobs.Free;
            dtmdlFitting.RefreshFittingData;
            dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;

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
    end
  else
    begin
      if MessageDlg('Do you want to complete the selected jobs?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          dtmdlFittingJobs := TdtmdlJob.create(Application);
          try

            for iCount := (dbgDetails.SelectedRows.Count - 1) downto 0 do
              begin
                dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;

                Key := dbgDetails.datasource.dataset.fieldbyname('Job').asinteger;
                SOrder := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;

                try
                  aJob := TJob.Create(dtmdlFittingJobs);

                  aJob.DbKey := key;
                  aJob.LoadFromDB;
                  aJob.Status := 50;
                  aJob.ActInstallDate := date;
                  aJob.SaveStatustoDB;

                  dtmdlFittingJobs.SetSOrderStatus(Key);
                finally
                  aJob.Free;
                end;
              end;
          finally
            dtmdlFittingJobs.Free;
            dtmdlFitting.RefreshFittingData;
            dbgdetails.DataSource.DataSet.Locate('Job', Variant(inttostr(Key)),[lopartialKey]) ;

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
end;

procedure TfrmWTLUFitting.btnReportsClick(Sender: TObject);
begin
  frmWTLUFittingRpts := TfrmWTLUFittingRpts.create(self);
  try
    frmWTLUFittingRpts.showmodal;
  finally
    frmWTLUFittingRpts.free;
  end;
end;

procedure TfrmWTLUFitting.btnDeliveryNoteClick(Sender: TObject);
var
  OldCursor : TCursor;
  iCount: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSSODeliveryNote := TfrmWTRSSODeliveryNote.Create( Application );

    {Build up the selection memo box based on the selection}
    for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
      begin
        dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
        if iCount = 0 then
          frmWTRSSODeliveryNote.memselection.Text := dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring
        else
          frmWTRSSODeliveryNote.memselection.Text := frmWTRSSODeliveryNote.memselection.Text + ',' + dbgDetails.datasource.dataset.fieldbyname('sales_order').asstring;
      end;
    frmWTRSSODeliveryNote.SalesOrderCount := dbgDetails.SelectedRows.Count;
    frmWTRSSODeliveryNote.showmodal;
  finally
    frmWTRSSODeliveryNote.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmWTLUFitting.chkbxShowOnlyScheduledClick(Sender: TObject);
begin
  dtmdlFitting.ShowOnSchedule := (Sender as TCheckbox).checked;
  dtmdlFitting.RefreshFittingData;
end;

procedure TfrmWTLUFitting.btnTempDateClick(Sender: TObject);
var
  tempDate: string;
  dtTemp: TDateTime;
begin
  if trim(edtTempDate.Text) = '' then
    begin
      dtTemp := date + 1;
      tempdate := padateStr(dtTemp);
    end
  else
    tempdate := edtTempDate.text;

  edtTempDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTLUFitting.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTLUFitting.edtTempDateChange(Sender: TObject);
begin
  dtmdlFitting.ActionStart := padatestr((Sender as TEdit).text);
  dtmdlFitting.ActionEnd := padatestr((Sender as TEdit).text) + 1;

  lblWorkinProgress.caption := cmbActionDate.text + ' ' + (Sender as TEdit).text;

  dtmdlFitting.RefreshFittingData;
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
