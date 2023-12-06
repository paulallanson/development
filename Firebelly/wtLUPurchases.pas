unit wtLUPurchases;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Db, Grids, DBGrids, WTPurchasesDM, QrCtrls,
  Buttons, IniFiles, System.ImageList;

type
  TfrmwtLUPurchases = class(TForm)
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
    btnCopy: TToolButton;
    dbgDetails: TDBGrid;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    lblWorkinProgress: TLabel;
    edtNumber: TEdit;
    Label3: TLabel;
    btnSearch: TBitBtn;
    btnReports: TToolButton;
    ToolButton1: TToolButton;
    btnReceipts: TToolButton;
    ToolButton3: TToolButton;
    btnReceipts1: TToolButton;
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
    procedure FormActivate(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnReportsClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnReceiptsClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
    procedure btnReceipts1Click(Sender: TObject);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure CallMaintScreen(aMode: TpopMode);
    function CheckInput: boolean;
    procedure CallReceiptsScreen(aMode: TpopMode);
    { Private declarations }
  protected
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmwtLUPurchases: TfrmwtLUPurchases;
  dtmdlAllPurchases: TdtmdlPurchaseOrder;

implementation

uses
  UITypes, WtMaintPurchaseOrder, WTRSPOrder, AllCommon, WTPOrderSearch,
  WTLUPOrderRpts, WTMaintPurchaseOrderReceipts, wtMain;

{$R *.DFM}

{ TfrmLUPurchases }

procedure TfrmwtLUPurchases.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmwtLUPurchases.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'PurchasesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmwtLUPurchases.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUPurchases.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
      begin
        sShowLive := ReadString('Purchase Orders', 'Show Live Orders', 'None');
      end;
  finally
    IniFile.Free;
  end;

  dtmdlAllPurchases := TdtmdlPurchaseOrder.create(Application);
  dtmdlAllPurchases.dtsAllPurchases.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllPurchases.dtsAllPurchases;

  if sShowLive = 'None' then
    dtmdlAllPurchases.ShowLive := false
  else
    dtmdlAllPurchases.ShowLive := true;

  AllCommon.SetDBGridCols('', 'PurchasesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmwtLUPurchases.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowLive: string;
begin
  if dtmdlAllPurchases.ShowLive then
    sShowLive := 'Show'
  else
    sShowLive := 'None';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
      begin
        WriteString('Purchase Orders', 'Show Live Orders', sShowLive);
      end;
  finally
    IniFile.free;
  end;

  dtmdlAllPurchases.free;
end;

procedure TfrmwtLUPurchases.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllPurchases.SupplierName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmwtLUPurchases.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllPurchases.refreshAlldata;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUPurchases.FormShow(Sender: TObject);
begin
  dtmdlAllPurchases.RefreshAlldata;
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

procedure TfrmwtLUPurchases.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllPurchases do
  begin
(*    btnChange.Enabled := HeaderCountAll > 0;
    btnPrint.Enabled := HeaderCountAll > 0;
    btnCopy.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;
    btnReceipts.Enabled := HeaderCountAll > 0;
*)
    btnChange.Enabled := true;
    btnPrint.Enabled := btnChange.Enabled;
    btnCopy.Enabled := btnChange.Enabled;
    btnDelete.Enabled := btnChange.Enabled;
    btnReceipts.Enabled := btnChange.Enabled;

    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Purchase_Order').asstring;
    lblWorkinProgress.Visible := ShowLive;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmwtLUPurchases.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen(popChange);
end;

procedure TfrmwtLUPurchases.CallMaintScreen(aMode : TpopMode);
var
  Key : integer;
  frm : TfrmWtMaintPurchaseOrder;
  aPOrder : TPOrder;
  bOK: boolean;
//  sWarning: string;
begin
  bOK := False;
  if aMode = popAdd then
    Key := 0
  else
  if (aMode = popChange) or (aMode = popDelete) then
    begin
      Key := dtmdlAllPurchases.CurrentPOrder;
      if (dbgdetails.DataSource.DataSet.FieldByName('purchase_order_status').asinteger > 15) AND
         (dbgdetails.DataSource.DataSet.FieldByName('purchase_order_status').asinteger < 50)  then
        begin
          if MessageDlg('This order is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end
      else
      if (dbgdetails.DataSource.DataSet.FieldByName('purchase_order_status').asinteger >= 50) then
        begin
          MessageDlg('This order is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', you cannot make changes to the order.', mtInformation,[mbOk], 0);
          aMode := popView;
        end
      else
    end
  else
    Key := dtmdlAllPurchases.CurrentPOrder;

  try
    aPOrder := TPOrder.Create(dtmdlAllPurchases);
    try
      aPOrder.DbKey := key;
      aPOrder.POMode := aMode;
      aPOrder.LoadFromDB;
      Frm := TfrmWtMaintPurchaseOrder.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.POrder := aPOrder;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aPOrder.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aPOrder.Free;
    end;
  finally
    if bOK then
    begin
      dbgdetails.DataSource.DataSet.Close;
      dbgdetails.DataSource.DataSet.Open;
      dbgdetails.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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

procedure TfrmwtLUPurchases.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(popAdd);
end;

procedure TfrmwtLUPurchases.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmwtLUPurchases.FormActivate(Sender: TObject);
begin
  dtmdlAllPurchases.RefreshAlldata;
  dbgDetails.datasource.DataSet.locate('Purchase_Order', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUPurchases.btnCopyClick(Sender: TObject);
begin
  CallMaintScreen(popCopy);
end;

procedure TfrmwtLUPurchases.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTRSPOrder := TfrmWTRSPOrder.Create( Application );
  try
    Key := dtmdlAllPurchases.CurrentPOrder;
    frmWTRSPOrder.Supplier := dbgDetails.datasource.dataset.fieldbyname('Supplier').asinteger;
    frmWTRSPOrder.Contact := dbgDetails.datasource.dataset.fieldbyname('Contact_no').asinteger;
    frmWTRSPOrder.memSelection.text := inttostr(Key);
    frmWTRSPOrder.showmodal;
  finally
    frmWTRSPOrder.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    dbgdetails.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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
  dbgdetails.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
end;

function TfrmwtLUPurchases.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Purchase_Order', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Purchase Order '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmwtLUPurchases.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
  begin
    dbgDetails.SelectedRows.Clear;
    if dbgDetails.Datasource.Dataset.Locate('Purchase_Order', Variant(edtNumber.Text), [loPartialKey]) then
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
      ShowMessage('Purchase Order: '+ edtNumber.Text + ' does not exist in the current selection.');
  end;

end;

procedure TfrmwtLUPurchases.btnReportsClick(Sender: TObject);
begin
  frmWTLUPOrderRpts := TfrmWTLUPOrderRpts.create(self);
  try
    frmWTLUPOrderRpts.showmodal;
  finally
    frmWTLUPOrderRpts.free;
  end;
end;

procedure TfrmwtLUPurchases.btnSearchClick(Sender: TObject);
begin
  frmWTPOrderSearch := TfrmWTPOrderSearch.create(self);
  try
    frmWTPOrderSearch.dtmdlPurchaseOrder := dtmdlAllPurchases;
    frmWTPOrderSearch.edtDescription.text := dtmdlAllPurchases.Description;
    frmWTPOrderSearch.edtReference.Text := dtmdlAllPurchases.Reference;
    frmWTPOrderSearch.edtStatus.Text := dtmdlAllPurchases.Status;
    frmWTPOrderSearch.edtOfficeContact.Text := dtmdlAllPurchases.OfficeContact;
    frmWTPOrderSearch.edtOperatorName.Text := dtmdlAllPurchases.OperatorName;
    frmWTPOrderSearch.chkbxShowLive.checked := dtmdlAllPurchases.ShowLive;
    frmWTPOrderSearch.chkbxShowInactive.checked := dtmdlAllPurchases.ShowInactive;
    frmWTPOrderSearch.showModal;
  finally
    frmWTPOrderSearch.free;
  end;
end;

procedure TfrmwtLUPurchases.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Purchase_Order').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmwtLUPurchases.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('On_Hold').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clRed;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
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

  if  (Column.Title.Caption <> 'Order Value') then
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

procedure TfrmwtLUPurchases.btnReceiptsClick(Sender: TObject);
var
  key: integer;
begin
  key := dbgDetails.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger;
  if dbgDetails.DataSource.DataSet.fieldbyname('Purchase_Order_Status').asinteger < 40 then
    begin
      if messagedlg('Confirm receipt of the selected purchase order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          dtmdlAllPurchases.UpdateStatus(dbgDetails.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger, 50, 1);

          dtmdlAllPurchases.refreshAlldata;
          dbgdetails.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
        end;
    end
  else
  if dbgDetails.DataSource.DataSet.fieldbyname('Purchase_Order_Status').asinteger = 50 then
    begin
      begin
        if messagedlg('This purchase order has been received, would you like to mark as not yet received?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          dtmdlAllPurchases.UpdateStatus(dbgDetails.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger, 20, 0);

          dtmdlAllPurchases.refreshAlldata;
          dbgdetails.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
      end;
    end;

  {Locate and select the record}
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmwtLUPurchases.btnDeleteClick(Sender: TObject);
var
  key: integer;
begin
  Key := dtmdlAllPurchases.CurrentPOrder + 1;
  if dbgDetails.DataSource.DataSet.fieldbyname('Purchase_Order_Status').asinteger > 30 then
    begin
      messagedlg('The purchase order has been received and cannot be deleted.', mterror,
            [mbOk], 0);
      exit;
    end
  else
    begin
      if messagedlg('Delete the selected order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          dtmdlAllPurchases.DeletePurchaseOrder(dbgDetails.DataSource.DataSet.fieldbyname('Purchase_Order').asinteger);

          dbgdetails.DataSource.DataSet.Close;
          dbgdetails.DataSource.DataSet.Open;
          dbgdetails.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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

procedure TfrmwtLUPurchases.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsUnderline, fsBold] then
    SortType := ' ASC'
  else if dtmdlAllPurchases.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  if (column.FieldName = 'Office_Contact_Name') then
    SortField := 'Office_Contact.Operator_Name'
  else if (column.FieldName = 'Operator_Name') then
    SortField := 'Operator.Operator_Name'
  else
    SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [fsBold];
  Column.Title.Font.Style := [fsUnderline, fsBold];

  dtmdlAllPurchases.SortOrder := SortField + SortType;
  dtmdlAllPurchases.SortType := SortType;

  dtmdlAllPurchases.refreshAlldata;
  with dbgDetails do
  begin
    try
      if datasource.dataset.recordcount > 0 then
        SelectedRows.CurrentRowSelected := true ;
    except
    end;
  end;
end;

procedure TfrmwtLUPurchases.btnReceipts1Click(Sender: TObject);
begin
  CallReceiptsScreen(popChange);
end;

procedure TfrmwtLUPurchases.CallReceiptsScreen(aMode : TpopMode);
var
  Key : integer;
  frm : TfrmWTMaintPurchaseOrderReceipts;
  aPOrder : TPOrder;
  bOK: boolean;
//  sWarning: string;
begin
  bOK := False;

  Key := dtmdlAllPurchases.CurrentPOrder;

  if (dbgdetails.DataSource.DataSet.FieldByName('purchase_order_status').asinteger >= 40) AND
    (dbgdetails.DataSource.DataSet.FieldByName('purchase_order_status').asinteger <= 50)  then
        begin
          if MessageDlg('This order is '+ dbgdetails.DataSource.DataSet.FieldByName('Status_Description').asstring + ', continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          exit;
        end;
  try
    aPOrder := TPOrder.Create(dtmdlAllPurchases);
    try
      aPOrder.DbKey := key;
      aPOrder.LoadFromDB;
      Frm := TfrmWTMaintPurchaseOrderReceipts.Create(Self);
      try
        Frm.POrder := aPOrder;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aPOrder.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aPOrder.Free;
    end;
  finally
    if bOK then
    begin
      dbgdetails.DataSource.DataSet.Close;
      dbgdetails.DataSource.DataSet.Open;
      dbgdetails.DataSource.DataSet.Locate('Purchase_Order', Variant(inttostr(Key)),[lopartialKey]) ;
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

end.
