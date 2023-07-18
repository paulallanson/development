unit pbLuWorksOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ImgList, ComCtrls, StdCtrls, Grids, DBGrids, PBWOrdersDM,
  ToolWin, DB, DBTables, Inifiles, Buttons;

type
  TfrmPBLUWorksOrders = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    ToolButton2: TToolButton;
    btnReports: TToolButton;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    Panel2: TPanel;
    Label2: TLabel;
    btnClose: TButton;
    edtNumber: TEdit;
    stsbrDetails: TStatusBar;
    tmrSearch: TTimer;
    pmnFunctions: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Copy1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    ResetGrid1: TMenuItem;
    btnPrint: TToolButton;
    btnRepeat: TToolButton;
    imglstOrders: TImageList;
    N2: TMenuItem;
    Print1: TMenuItem;
    btnSearch: TBitBtn;
    btnDespatches: TToolButton;
    mmnuStock: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    Backup1: TMenuItem;
    N7: TMenuItem;
    Import1: TMenuItem;
    LaserProduction: TMenuItem;
    FulfilmentProduction: TMenuItem;
    N5: TMenuItem;
    Send1: TMenuItem;
    Excel1: TMenuItem;
    N8: TMenuItem;
    SwitchUser1: TMenuItem;
    Exit1: TMenuItem;
    btnPrintISO: TToolButton;
    btnStatus: TToolButton;
    lblWorkinProgress: TLabel;
    btnSweep: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnRepeatClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure btnReportsClick(Sender: TObject);
    procedure btnDespatchesClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure SwitchUser1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure LaserProductionClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnPrintISOClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(aMode: TwoMode);
    function CheckInput: boolean;
  private
    ActiveCode: real;
    DontSaveLayout: Boolean;
    FActivated: Boolean;
    dtmdlAllWOrders: TdtmdlWOrders;
    iOperatorRep: Integer;
    iTempAccCtrl: integer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmPBLUWorksOrders: TfrmPBLUWorksOrders;

implementation

uses pbDatabase, pbMainMenu, CCSCommon, pbluWorksOrdersSearch, PBMaintWorksOrders, PBRSWorksOrder,
  pbLUWorksOrdersRpts, PBMaintWOrderConfDelivs, PBLUWorksOrderDelivs, PBLaserImport,
  PBRSWorksOrderISO, PBMaintWOrderStatus;

{$R *.dfm}

procedure TfrmPBLUWorksOrders.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      {Check if the operator REP is needed} ;
      If dmBroker.iAccCtrlMenu = 4 then
        iOperatorRep := dmBroker.GetOperatorRep(frmpbMainMenu.iOperator)
      else
        iOperatorRep := 0 ;
      {Get the button statuses} ;
      iTempAccCtrl := dmBroker.GetButtonStatus(frmpbMainMenu.iOperator, 'mnuProduction') ;

      If dmBroker.iAccCtrlMenu = 5 then
        dtmdlAllWOrders.Operator := frmpbMainMenu.iOperator;
      dtmdlAllWOrders.Rep := iOperatorRep;
      dtmdlAllWOrders.RepIsSubRep := dmBroker.RepIsSubRep(iOperatorRep);

      FActivated := True;
    end;
  {Determine if we should display the Export to Excel menu option}
  frmPBMainMenu.miSendTo.Visible := (dmBroker.iAccCtrlMenu = 1);

  dtmdlAllWOrders.refreshdata;
  dbgDetails.datasource.DataSet.locate('Works_order', Variant(floattostr(ActiveCode)),[lopartialKey]) ;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmPBLUWorksOrders.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  stempDate: string;
  sShowWIP: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      stempdate := ReadString('Centrereed Broker', 'Works Order Search Date', 'None');
      sShowWIP := ReadString('Centrereed Broker', 'Show Works Order WIP', 'None');
      Free;
    end;

  dtmdlAllWOrders := TdtmdlWOrders.create(self);

  if stempdate = 'None' then
    dtmdlAllWOrders.OrderDate := Date - 365
  else
    dtmdlAllWOrders.OrderDate := pbdatestr(stempdate);

  if sShowWIP = 'None' then
    dtmdlAllWOrders.ShowWIP := false
  else
    dtmdlAllWOrders.ShowWIP := true;

  dtmdlAllWOrders.dtsWOHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllWOrders.dtsWOHeaderGrid;

  CCSCommon.SetDBGridCols('', 'WorksOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  dmBroker.ScreenAccessControl(Self,'mnuWorksOrders',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBLUWorksOrders.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllWOrders do
  begin
    btnChange.Enabled := HeaderCount > 0;
    btnPrint.Enabled := HeaderCount > 0;
    btnPrintISO.Enabled := HeaderCount > 0;
    btnStatus.Enabled := HeaderCount > 0;
    btnDelete.Enabled := HeaderCount > 0;
    btnRepeat.Enabled := HeaderCount > 0;
    btnDespatches.Enabled := HeaderCount > 0;

    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Works_order_number').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblWorkinProgress.Visible := ShowWIP;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmPBLUWorksOrders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dontSaveLayout then
    begin
    //dont do anything
    end
  else
    begin
      CCSCommon.SaveDBGridCols('', 'WorksOrderLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
    end;
  Action := caFree;
end;

procedure TfrmPBLUWorksOrders.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowWIP: string;
begin
  if dtmdlAllWOrders.ShowWIP then
    sShowWIP := 'Show'
  else
    sShowWIP := 'None';

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Centrereed Broker', 'Works Order Search Date', pbdatestr(dtmdlAllWOrders.OrderDate));
      WriteString('Centrereed Broker', 'Show Works Order WIP', sShowWIP);
      Free;
    end;

  dtmdlAllWOrders.free;
end;

procedure TfrmPBLUWorksOrders.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('works_Order').asfloat;
  except
    Activecode := 0
  end;
end;

procedure TfrmPBLUWorksOrders.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmPBLUWorksOrders.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllWOrders.refreshdata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUWorksOrders.btnSearchClick(Sender: TObject);
begin
  frmpbLuWorksOrdersSearch := TfrmpbLuWorksOrdersSearch.create(self);
  try
    frmpbLuWorksOrdersSearch.dtmdlSearchWOrders := dtmdlAllWOrders;
    frmpbLuWorksOrdersSearch.edtBranch.text := dtmdlAllWOrders.BranchName;
    frmpbLuWorksOrdersSearch.edtCustOrderNo.Text := dtmdlAllWOrders.CustomerRef;
    frmpbLuWorksOrdersSearch.edtQuantity.Text := dtmdlAllWOrders.OrdQtyDesc;
    frmpbLuWorksOrdersSearch.edtDescription.Text := dtmdlAllWOrders.Description;
    frmpbLuWorksOrdersSearch.edtStatus.Text := dtmdlAllWOrders.Status;
    frmpbLuWorksOrdersSearch.edtDate.Text := pbDateStr(dtmdlAllWOrders.OrderDate);
    frmpbLuWorksOrdersSearch.edtJobBag.Text := dtmdlAllWOrders.JobBag;
    frmpbLuWorksOrdersSearch.chkbxShowCancelled.checked := dtmdlAllWOrders.ShowInactive;
    frmpbLuWorksOrdersSearch.chkbxShowWIP.checked := dtmdlAllWOrders.ShowWIP;
    frmpbLuWorksOrdersSearch.showModal;
  finally
    frmpbLuWorksOrdersSearch.free;
  end;
end;

procedure TfrmPBLUWorksOrders.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllWOrders.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmPBLUWorksOrders.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmPBLUWorksOrders.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    if dbgDetails.Datasource.Dataset.Locate('Works_order_number', Variant(edtNumber.Text), [loPartialKey]) then
      btnChangeClick(self)
    else
      ShowMessage('Works Instruction: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;
end;

function TfrmPBLUWorksOrders.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Works_Order_Number', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Works Instruction: '+ edtNumber.text + ' does not exist in the current selection.', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmPBLUWorksOrders.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(woAdd);
end;

procedure TfrmPBLUWorksOrders.btnChangeClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  if trim(btnChange.caption) = '&View' then
    CallMaintScreen(woView)
  else
    CallMaintScreen(woChange);
end;

procedure TfrmPBLUWorksOrders.btnRepeatClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(woRepeat);
end;

procedure TfrmPBLUWorksOrders.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(woDelete);
end;

procedure TfrmPBLUWorksOrders.CallMaintScreen(aMode : TwoMode);
var
  Key : integer;
  frm : TfrmPBMaintWorksOrders;
  aWOrder : TWOrder;
//  sWarning: string;
begin
  if aMode = woAdd then
    Key := 0
  else
    begin
      Key := dtmdlAllWOrders.CurrentWOrder;
    end;

  aWOrder := TWOrder.Create(dtmdlAllWOrders);
  try
    aWOrder.DbKey := key;
    aWOrder.WOMode := aMode;
    aWOrder.LoadFromDB;
    Frm := TfrmPBMaintWorksOrders.Create(Self);
    try
      Frm.Mode := aMode;
      Frm.WOrder := aWOrder;
      Frm.ShowModal;
      Key := aWOrder.DbKey;
      if Frm.ModalResult = mrOK then
        begin
          dbgDetails.DataSource.DataSet.Close;
          dbgDetails.DataSource.DataSet.Open;
          dbgDetails.DataSource.DataSet.Locate('Works_Order', Variant(inttostr(Key)),[lopartialKey]) ;
        end;
    finally
      Frm.Free;
    end;
  finally
    aWOrder.Free;
  end;
end;

procedure TfrmPBLUWorksOrders.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUWorksOrders.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUWorksOrders.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
  WONumber: real;
  tmpCustomer, tmpDescription: string;
begin
  if not CheckInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmPBRSWorksOrder := TfrmPBRSWorksOrder.Create( Application );
    Key := dtmdlAllWOrders.CurrentWOrder;
    WONumber := dtmdlAllWOrders.CurrentWOrderNumber;
    tmpCustomer := dbgdetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    tmpDescription := dbgdetails.DataSource.DataSet.fieldbyname('Description').asstring;

    frmPBRSWorksOrder.WONumber := dbgdetails.DataSource.DataSet.fieldbyname('Works_Order').asinteger;
    frmPBRSWorksOrder.WOStatus := dbgdetails.DataSource.DataSet.fieldbyname('Works_Order_Status').asinteger;
    frmPBRSWorksOrder.JobBagNo := dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    frmPBRSWorksOrder.memSelection.text := floattostr(WONumber);
    frmPBRSWorksOrder.edtCustomer.text := tmpCustomer;
    frmPBRSWorksOrder.memDescription.text := tmpDescription;
    frmPBRSWorksOrder.showmodal;
  finally
    frmPBRSWorksOrder.free;
//    dbgdetails.DataSource.DataSet.Close;
//    dbgdetails.DataSource.DataSet.Open;

    dtmdlAllWOrders.refreshdata;
    Screen.Cursor := OldCursor;
  end;

  dbgdetails.DataSource.DataSet.Locate('Works_Order', Variant(inttostr(Key)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUWorksOrders.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('WorksOrderLU Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TfrmPBLUWorksOrders.btnReportsClick(Sender: TObject);
begin
  frmPBLUWorksOrdersRpts := TfrmPBLUWorksOrdersRpts.create(self);
  try
    frmPBLUWorksOrdersRpts.showmodal;
  finally
    frmPBLUWorksOrdersRpts.free;
  end;
end;

procedure TfrmPBLUWorksOrders.btnDespatchesClick(Sender: TObject);
var
  key: integer;
  aWOrder: TWOrder;
  frm: TfrmPBMaintWOrderConfDelivs;
  frmLU: TfrmPBLUWorksOrderDelivs;
begin
  Key := dtmdlAllWOrders.CurrentWOrder;

  aWOrder := TWOrder.Create(dtmdlAllWOrders);
  try
    aWOrder.DbKey := key;
    aWOrder.LoadFromDB;

    if aWOrder.Deliveries.count = 1 then
      begin
        Frm := TfrmPBMaintWOrderConfDelivs.Create(Self);

        try
          Frm.WODeliv := aWOrder.Deliveries[0];
          Frm.Mode := wodelChange;
          Frm.ShowModal;
          Key := aWOrder.DbKey;
          if Frm.ModalResult = mrOK then
            begin
              aWOrder.SaveStatus;
              aWOrder.DataModule.SetJBStatus(aWOrder.JobBagNo);
//              dbgDetails.DataSource.DataSet.Close;
//              dbgDetails.DataSource.DataSet.Open;
              dtmdlAllWOrders.refreshdata;
              dbgDetails.DataSource.DataSet.Locate('Works_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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
          Frm.Free;
        end;
      end
    else
      begin
        FrmLU := TfrmPBLUWorksOrderDelivs.Create(Self);

        try
          FrmLU.WOrder := aWOrder;
          FrmLU.ShowModal;
          Key := aWOrder.DbKey;
          if FrmLU.OKRefresh = true then
            begin
              aWOrder.SaveStatus;
              aWOrder.DataModule.SetJBStatus(aWOrder.JobBagNo);
              dtmdlAllWOrders.refreshdata;
              dbgDetails.DataSource.DataSet.Locate('Works_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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
          FrmLU.Free;
        end;
      end;
  finally
    aWOrder.Free;
  end;
end;

procedure TfrmPBLUWorksOrders.Excel1Click(Sender: TObject);
begin
  frmpbMainMenu.miExcelClick(self);
end;

procedure TfrmPBLUWorksOrders.SwitchUser1Click(Sender: TObject);
begin
  frmpbMainMenu.miSwitchUserClick(self);
end;

procedure TfrmPBLUWorksOrders.Exit1Click(Sender: TObject);
begin
  frmpbMainMenu.miExitClick(self);
end;

procedure TfrmPBLUWorksOrders.LaserProductionClick(Sender: TObject);
var
  PBLaserImportFrm: TPBLaserImportFrm;
begin

  PBLaserImportFrm := TPBLaserImportFrm.Create(Self);
  PBLaserImportFrm.ShowModal;

  PBLaserImportFrm.Free;
end;

procedure TfrmPBLUWorksOrders.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if dbgDetails.datasource.dataset.fieldByName('Status_Color').asinteger <> 0 then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := dbgDetails.datasource.dataset.fieldByName('Status_Color').asinteger;
      (Sender as TDBGrid).Canvas.Font.color := dbgDetails.datasource.dataset.fieldByName('Status_Font_Color').asinteger;
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'Estimated Quantity') then
  	begin
      StrPCopy(txt, Column.field.text);
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		StrPCopy(Txt, Column.field.text);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;
end;

procedure TfrmPBLUWorksOrders.btnPrintISOClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
  WONumber: real;
  tmpCustomer, tmpDescription: string;
begin
  if not CheckInput then
    exit;

  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  PBRSWorksOrderISOfrm := TPBRSWorksOrderISOfrm.Create( Application );
  try
    Key := dtmdlAllWOrders.CurrentWOrder;
    WONumber := dtmdlAllWOrders.CurrentWOrderNumber;
    tmpCustomer := dbgdetails.DataSource.DataSet.fieldbyname('Customer_Name').asstring;
    tmpDescription := dbgdetails.DataSource.DataSet.fieldbyname('Description').asstring;

    PBRSWorksOrderISOfrm.WONumber := dbgdetails.DataSource.DataSet.fieldbyname('Works_Order').asinteger;
    PBRSWorksOrderISOfrm.WOStatus := dbgdetails.DataSource.DataSet.fieldbyname('Works_Order_Status').asinteger;
    PBRSWorksOrderISOfrm.JobBagNo := dbgdetails.DataSource.DataSet.fieldbyname('Job_Bag').asinteger;
    PBRSWorksOrderISOfrm.memSelection.text := floattostr(WONumber);
    PBRSWorksOrderISOfrm.edtCustomer.text := tmpCustomer;
    PBRSWorksOrderISOfrm.memDescription.text := tmpDescription;
    PBRSWorksOrderISOfrm.showmodal;
  finally
    PBRSWorksOrderISOfrm.free;
//    dbgdetails.DataSource.DataSet.Close;
//    dbgdetails.DataSource.DataSet.Open;
    dtmdlAllWOrders.refreshdata;
    Screen.Cursor := OldCursor;
  end;

  dbgdetails.DataSource.DataSet.Locate('Works_Order', Variant(inttostr(Key)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmPBLUWorksOrders.btnStatusClick(Sender: TObject);
var
  key, iStatus: integer;
  icount: integer;
begin
  Key := dtmdlAllWOrders.CurrentWOrder;

  PBMaintWOrderStatusFrm := TPBMaintWOrderStatusFrm.Create(Self);

  try
    PBMaintWOrderStatusFrm.ShowModal;
    if PBMaintWOrderStatusFrm.ModalResult = mrOK then
      begin
        iStatus := PBMaintWOrderStatusFrm.NewStatus;
        for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
          begin
            dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));
            dtmdlAllWOrders.SetWOStatus(dbgDetails.datasource.DataSet.fieldbyname('Works_Order').asinteger, iStatus);
          end;
        dtmdlAllWOrders.refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Works_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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
    PBMaintWOrderStatusFrm.free;
  end;
end;

procedure TfrmPBLUWorksOrders.btnSweepClick(Sender: TObject);
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

end.
