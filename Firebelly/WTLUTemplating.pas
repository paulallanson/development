unit WTLUTemplating;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, ImgList, Buttons, StdCtrls, ExtCtrls,
  ToolWin, DB, wtSalesOrderDM, AllCommon, IniFiles, DateUtils, DateSelV5,
  System.ImageList;

type
  TfrmWTLUTemplating = class(TForm)
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
    cmbActionDate: TComboBox;
    CoolBar1: TCoolBar;
    imgLstHot: TImageList;
    btnDocuments: TToolBar;
    btnChange: TToolButton;
    btnTemplate: TToolButton;
    btnConvert: TToolButton;
    ToolButton1: TToolButton;
    btnReports: TToolButton;
    dbgDetails: TDBGrid;
    tmrSearch: TTimer;
    lblWorkinProgress: TLabel;
    BitBtn2: TBitBtn;
    btnReturned: TToolButton;
    chkbxShowOnlyScheduled: TCheckBox;
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
    procedure btnTemplateClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure btnReturnedClick(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
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
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
  end;

var
  frmWTLUTemplating: TfrmWTLUTemplating;
  dtmdlTemplating: TdtmdlSalesOrder;

implementation

uses
  System.UITypes, System.Types,
  wtDataModule, wtMain, WtMaintSalesOrder, wtRSTemplateSheet,
  wtLUSOLines, WTJobsDM, WtMaintJob, WTLUTemplatingRpts;

{$R *.dfm}

{ TfrmWTLUTemplating }

procedure TfrmWTLUTemplating.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUTemplating.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'TemplatingLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmWTLUTemplating.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUTemplating.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive, sShowOnSchedule: string;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  dtmdlTemplating := TdtmdlSalesOrder.create(Application);
  dtmdlTemplating.dtsAllSales.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlTemplating.dtsAllSales;

  try
    with IniFile do
      begin
        if (ReadString('Templating', 'Customer Filter', '0') = '0') then
          cmbCustomerFilter.itemindex := 0
        else
        if (ReadString('Templating', 'Customer Filter', '1') = '1') then
          cmbCustomerFilter.itemindex := 1
        else
        if (ReadString('Templating', 'Customer Filter', '2') = '2') then
          cmbCustomerFilter.itemindex := 2
        else
        if (ReadString('Templating', 'Customer Filter', '3') = '3') then
          cmbCustomerFilter.itemindex := 3;

        {Decide which date we want to default to}
        if (ReadString('Templating', 'Template Date Default', '0') = '0') then
          cmbActionDate.itemindex := 0
        else
        if (ReadString('Templating', 'Template Date Default', '1') = '1') then
          cmbActionDate.itemindex := 1
        else
        if (ReadString('Templating', 'Template Date Default', '2') = '2') then
          cmbActionDate.itemindex := 2
        else
        if (ReadString('Templating', 'Template Date Default', '3') = '3') then
          cmbActionDate.itemindex := 3
        else
        if (ReadString('Templating', 'Template Date Default', '4') = '4') then
          cmbActionDate.itemindex := 4
        else
        if (ReadString('Templating', 'Template Date Default', '5') = '5') then
          cmbActionDate.itemindex := 5;

        edtTempDate.Text := ReadString('Templating', 'Template Date', '');
        sShowLive := ReadString('Templating', 'Show Live Orders', 'None');
        sShowOnSchedule := ReadString('Templating', 'Show On Schedule', 'None');
        dtmdlTemplating.ShowRecords := strtoint(ReadString('Templating', 'Show Records', '0'));
      end;
  finally
    IniFile.Free;
  end;

  dtmdlTemplating.OrderStatus := 50;

(*  dtmdlTemplating.ActionStart := date + 1;
  dtmdlTemplating.ActionEnd := date + 1;
  cmbActionDate.ItemIndex := 1;
*)

  if sShowLive = 'None' then
    dtmdlTemplating.ShowLive := false
  else
    dtmdlTemplating.ShowLive := true;

  if sShowOnSchedule = 'None' then
    dtmdlTemplating.ShowOnSchedule := false
  else
    dtmdlTemplating.ShowOnSchedule := true;

  chkbxShowOnlyScheduled.checked := dtmdlTemplating.ShowOnSchedule;

  AllCommon.SetDBGridCols('', 'TemplatingLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUTemplating.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive, sShowOnSchedule: string;
begin
  if dtmdlTemplating.ShowLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  if dtmdlTemplating.ShowOnSchedule then
    sShowOnSchedule := 'Show'
  else
    sShowOnSchedule := 'None';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
      begin
        WriteString('Templating', 'Show On Schedule', sShowOnSchedule);
        WriteString('Templating', 'Show Live Orders', sShowLive);
        WriteString('Templating', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
        WriteString('Templating', 'Template Date Default', inttostr(cmbActionDate.itemindex));
        WriteString('Templating', 'Template Date', edtTempDate.Text);
        WriteString('Templating', 'Show Records', inttostr(dtmdlTemplating.ShowRecords));
      end;
  finally
    IniFile.free;
  end;

  dtmdlTemplating.free;
end;

procedure TfrmWTLUTemplating.btnSearchClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlTemplating.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmWTLUTemplating.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlTemplating.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlTemplating.RefreshAllData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUTemplating.FormShow(Sender: TObject);
begin
  dtmdlTemplating.RefreshAllData;
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

procedure TfrmWTLUTemplating.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlTemplating do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnTemplate.Enabled := HeaderCountAll > 0;
    btnReturned.Enabled := HeaderCountAll > 0;
    btnConvert.Enabled := HeaderCountAll > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asstring;
(*    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
*)

    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmWTLUTemplating.FormActivate(Sender: TObject);
begin
  dtmdlTemplating.TradeRetail := cmbCustomerFilter.itemindex;
  cmbActionDateChange(Self);
  
  dtmdlTemplating.RefreshAllData;
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

function TfrmWTLUTemplating.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('sales_order', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Sales Order '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmWTLUTemplating.edtNumberKeyPress(Sender: TObject; var Key: Char);
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

procedure TfrmWTLUTemplating.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Sales_order').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmWTLUTemplating.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clYellow;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldByName('Template_Docs_Returned').Asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clBlue;
      (Sender as TDBGrid).Canvas.Brush.color := clLime;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if  (dbgDetails.datasource.dataset.fieldByName('Remedial_Production').AsString = 'Y') or
      (dbgDetails.datasource.dataset.fieldByName('Remedial_No_Production').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := $00FF0080;
      (Sender as TDBGrid).Canvas.Brush.color := clNavy;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end ;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

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

procedure TfrmWTLUTemplating.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlTemplating.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlTemplating.RefreshAllData;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUTemplating.cmbActionDateChange(Sender: TObject);
var
  tempdate: TDateTime;
begin
  pnlDateSelection.Visible := false;

  case cmbActionDate.itemindex of
      0: begin
          case DayofTheWeek(date) of
            1..4:
              begin
                dtmdlTemplating.ActionStart := date + 1;
                dtmdlTemplating.ActionEnd := date + 2;
              end;
            5:
              begin
                dtmdlTemplating.ActionStart := date + 3;
                dtmdlTemplating.ActionEnd := date + 4;
              end;
            6:
              begin
                dtmdlTemplating.ActionStart := date + 2;
                dtmdlTemplating.ActionEnd := date + 3;
              end;
            7:
              begin
                dtmdlTemplating.ActionStart := date + 1;
                dtmdlTemplating.ActionEnd := date + 2;
              end;
          end
         end;
      1: begin
            dtmdlTemplating.ActionStart := date + 1;
            dtmdlTemplating.ActionEnd := date + 2;
         end;
      2: begin
            dtmdlTemplating.ActionStart := date;
            dtmdlTemplating.ActionEnd := date + 1;
         end;
      3: begin
            dtmdlTemplating.ActionStart := date - 1;
            dtmdlTemplating.ActionEnd := date;
         end;
      4: begin
          case DayofTheWeek(date) of
            2..6:
              begin
                dtmdlTemplating.ActionStart := date - 1;
                dtmdlTemplating.ActionEnd := date;
              end;
            7:
              begin
                dtmdlTemplating.ActionStart := date - 2;
                dtmdlTemplating.ActionEnd := date - 1;
              end;
            1:
              begin
                dtmdlTemplating.ActionStart := date - 3;
                dtmdlTemplating.ActionEnd := date - 2;
              end;
          end
         end;
  else
    begin
      pnlDateSelection.Visible := true;
      if trim(edtTempDate.Text) <> '' then
        begin
          dtmdlTemplating.ActionStart := padatestr(edtTempDate.Text);
          dtmdlTemplating.ActionEnd := padatestr(edtTempDate.Text) + 1;
        end
      else
        exit;
    end;
  end;

  if cmbActionDate.itemindex < 5 then
    lblWorkinProgress.caption := cmbActionDate.text
  else
    lblWorkinProgress.caption := cmbActionDate.text + ' ' + edtTempDate.text;

  dtmdlTemplating.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTLUTemplating.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlTemplating.TemplateName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmWTLUTemplating.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(sopChange);
end;

procedure TfrmWTLUTemplating.CallMaintScreen(aMode : TsopMode);
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
      Key := dtmdlTemplating.CurrentSOrder;
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
    key := dtmdlTemplating.CurrentSOrder;


  try
    aSOrder := TSOrder.Create(dtmdlTemplating);
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

procedure TfrmWTLUTemplating.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUTemplating.btnTemplateClick(Sender: TObject);
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
      if dtmdlTemplating.SalesOrderRequiresPurchasing(dtmdlTemplating.CurrentSOrder) then
        begin
          if messagedlg('Purchase Orders haven''t been raised for this order, do you want to continue to print the Template Checklist?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
            exit;
        end;
    end;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSTemplateSheet := TfrmWTRSTemplateSheet.Create( Application );
    Key := dtmdlTemplating.CurrentSOrder;
    frmWTRSTemplateSheet.sOrderNumber := inttostr(Key);

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
    Screen.Cursor := OldCursor;
  end;

end;

procedure TfrmWTLUTemplating.btnConvertClick(Sender: TObject);
var
  QuoteNo: integer;
  rDepositReqd: real;
  sCreditStatus: string;
  bUsePurchasing: boolean;
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
      if dtmdlTemplating.OutstandingPurchases(dtmdlTemplating.CurrentSOrder) then
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
end;

procedure TfrmWTLUTemplating.ConvertToJobScreen(iQuoteNo: integer);
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

procedure TfrmWTLUTemplating.BitBtn2Click(Sender: TObject);
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

procedure TfrmWTLUTemplating.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if dtmdlTemplating.SortType = ' DESC' then
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

  dtmdlTemplating.SortOrder := SortField + SortType;
  dtmdlTemplating.SortType := SortType;

  dtmdlTemplating.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUTemplating.btnReturnedClick(Sender: TObject);
var
  sMessage: string;
  sStatus: string;
  key: integer;
begin
  key := dbgDetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;

  if  (dbgDetails.datasource.dataset.fieldbyname('Template_Docs_Returned').asstring = 'N') or
      (dbgDetails.datasource.dataset.fieldbyname('Template_Docs_Returned').asstring = '') then
    begin
      sMessage := 'Confirm template paperwork has been returned for this order';
      sStatus := 'Y';
    end
  else
    begin
      sMessage := 'Confirm template paperwork NOT yet returned for this order';
      sStatus := 'N';
    end ;

  if messagedlg(sMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      dtmdlTemplating.SetTemplatingDocsReceived(key, sStatus);
    end;
  
  dtmdlTemplating.refreshAlldata;
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

procedure TfrmWTLUTemplating.btnReportsClick(Sender: TObject);
begin
  frmWTLUTemplatingRpts := TfrmWTLUTemplatingRpts.create(self);
  try
    frmWTLUTemplatingRpts.showmodal;
  finally
    frmWTLUTemplatingRpts.free;
  end;

end;

procedure TfrmWTLUTemplating.chkbxShowOnlyScheduledClick(Sender: TObject);
begin
  dtmdlTemplating.ShowOnSchedule := (Sender as TCheckbox).checked;
  dtmdlTemplating.RefreshAllData;
end;

procedure TfrmWTLUTemplating.btnTempDateClick(Sender: TObject);
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

function TfrmWTLUTemplating.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTLUTemplating.edtTempDateChange(Sender: TObject);
begin
  dtmdlTemplating.ActionStart := padatestr((Sender as TEdit).text);
  dtmdlTemplating.ActionEnd := padatestr((Sender as TEdit).text) + 1;

  lblWorkinProgress.caption := cmbActionDate.text + ' ' + (Sender as TEdit).text;

  dtmdlTemplating.refreshAlldata;
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
