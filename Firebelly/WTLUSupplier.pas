unit WTLUSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, Grids, DBGrids,
  ToolWin, DB, AllCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList;

type
  TfrmWTLUSupplier = class(TForm)
    Panel1: TPanel;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    btnContacts: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    dbgDetails: TDBGrid;
    stsbrDetails: TStatusBar;
    imgLstHot: TImageList;
    tmrSearch: TTimer;
    Panel2: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    chkbxShowInactive: TCheckBox;
    btnSearch: TBitBtn;
    qryDummy: TFDQuery;
    dtsSuppliers: TDataSource;
    qrySuppliers: TFDQuery;
    qryDelete: TFDQuery;
    Panel4: TPanel;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnContactsClick(Sender: TObject);
    procedure dbgDetailsTitleClick(Column: TColumn);
  private
    ActiveCode: integer;
    FChildLeft, FChildTop: integer;
    ShowInactive: boolean;
    SortType: string;
    SortOrder: string;
    SupplierName: string;
    FDisableNameChangeEvent: boolean;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    function UsingSearch: boolean;
    procedure CallMaintScreen(FuncMode: string);
  public
    DateCreated: TdateTime;
    street, Townlocale, Town, Postcode, County, Phone: string;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    procedure refreshData;
  end;

var
  frmWTLUSupplier: TfrmWTLUSupplier;

implementation

uses
  wtDataModule, WTMaintSupplier, WTSupplierSearch, WTLUSupplierContacts,
  wtMain;

{$R *.dfm}

procedure TfrmWTLUSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'SupplierLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree
end;

procedure TfrmWTLUSupplier.FormCreate(Sender: TObject);
begin
  dtsSuppliers.OnDataChange := SetButtons;
  FChildLeft := -1;
  FChildTop := -1;
  AllCommon.SetDBGridCols('', 'SupplierLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUSupplier.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;
end;

procedure TfrmWTLUSupplier.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSupplier.SetButtons(Sender: TObject; Field: TField);
begin
  with dtsSuppliers.dataset do
  begin
    btnChange.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
    btnContacts.Enabled := recordCount > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;
    stsBrDetails.panels[0].text := inttostr(recordCount) + ' records displayed';
  end;
end;

function TfrmWTLUSupplier.UsingSearch: boolean;
begin
  if (SupplierName <> '') or
            (Street <> '') or
            (Town <> '') or
            (TownLocale <> '') or
            (Postcode <> '') or
            (County <> '') or
            (Phone <> '') then
    result := true
  else
    result := false;
end;

procedure TfrmWTLUSupplier.chkbxShowInactiveClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  ShowInactive := chkbxShowInactive.checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSupplier.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            parambyname('Supplier').asinteger := dbgDetails.datasource.DataSet.fieldbyname('Supplier').asinteger;
            execsql;
          end;
        Refreshdata;
      except
        messagedlg('Supplier '+ dbgDetails.datasource.DataSet.fieldbyname('Supplier_name').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUSupplier.FormActivate(Sender: TObject);
begin
  refreshdata;
  dbgDetails.datasource.DataSet.locate('supplier', Variant(floattostr(ActiveCode)),[lopartialKey]) ;
end;

procedure TfrmWTLUSupplier.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('supplier').asinteger;
  except
    Activecode := 0
  end;
end;

procedure TfrmWTLUSupplier.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUSupplier.refreshData;
var
  stemp: string;
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  with qrySuppliers do
    begin
      close;
      sql.Clear;
      sTemp := qryDummy.sql.text;
      if SupplierName <> '' then
        sTemp := sTemp + ' AND Supplier.Supplier_name LIKE ''%' + SupplierName + '%''';
      if Street <> '' then
        sTemp := sTemp + ' AND Supplier.Street LIKE ''%' + Street + '%''';
      if Town <> '' then
        sTemp := sTemp + ' AND Supplier.Town_City LIKE ''%' + Town + '%''';
      if TownLocale <> '' then
        sTemp := sTemp + ' AND Supplier.Locale LIKE ''%' + TownLocale + '%''';
      if County <> '' then
        sTemp := sTemp + ' AND Supplier.County_State LIKE ''%' + County + '%''';
      if Postcode <> '' then
        sTemp := sTemp + ' AND Supplier.Postcode LIKE ''' + Postcode + '%''';
      if Phone <> '' then
        sTemp := sTemp + ' AND Supplier.telephone_number LIKE ''' + phone + '%''';

      if DateCreated > 0 then
        sTemp := sTemp + ' AND Supplier.Date_Created >= ' + qDate(DateCreated);

      if SortOrder = '' then
        sTemp := sTemp + ' ORDER BY Supplier.Supplier_Name'
      else
        sTemp := sTemp + ' ORDER BY ' + SortOrder;

//      stemp := sTemp + 'ORDER BY Supplier.Supplier_Name';

      sql.Text := stemp;
      if ShowInactive then
        parambyname('inActive').asstring := 'Y'
      else
        parambyname('inActive').asstring := 'N';
      open;
    end;

end;

procedure TfrmWTLUSupplier.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SupplierName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUSupplier.btnSearchClick(Sender: TObject);
begin
  frmWTSupplierSearch := TfrmWTSupplierSearch.create(self);
  try
    frmWTSupplierSearch.edtStreet.text := Street;
    frmWTSupplierSearch.edtLocale.Text := TownLocale;
    frmWTSupplierSearch.edtTown.Text := Town;
    frmWTSupplierSearch.edtPostcode.Text := postcode;
    frmWTSupplierSearch.edtPhone.Text := Phone;
    frmWTSupplierSearch.edtCounty.Text := County;
    frmWTSupplierSearch.showModal;
  finally
    frmWTSupplierSearch.free;
  end;
end;

procedure TfrmWTLUSupplier.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintSupplier := TfrmWTMaintSupplier.create(Application);
    if FuncMode <> 'A' then
      begin
        iCode := dbgDetails.datasource.dataset.fieldbyname('Supplier').asinteger;
      end
    else
      iCode := 0;
    frmWTMaintSupplier.getRecord(iCode);
    frmWTMaintSupplier.FunctionMode := FuncMode;
    frmWTMaintSupplier.showmodal;
    if frmWTMaintSupplier.ModalResult = idOK then
      begin
        if FuncMode = 'A' then
          begin
            edtSearch.text := frmWTMaintSupplier.qryOneSupplier.fieldbyname('Supplier_Name').asstring;
            iCode := frmWTMaintSupplier.Supplier;
          end;
        refreshData;
        dtsSuppliers.DataSet.Locate('Supplier', Variant(inttostr(iCode)),[lopartialKey]) ;
      end;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintSupplier.free;
  end;
end;

procedure TfrmWTLUSupplier.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUSupplier.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUSupplier.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
end;

procedure TfrmWTLUSupplier.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUSupplier.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
  icount: integer;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUSupplier.btnContactsClick(Sender: TObject);
begin
  frmWTLUSupplierContacts := TfrmWTLUSupplierContacts.create(self);
  try
    frmWTLUSupplierContacts.Supplier := dbgDetails.DataSource.DataSet.fieldbyname('Supplier').asinteger;
    frmWTLUSupplierContacts.isLookup := false;
    frmWTLUSupplierContacts.showmodal
  finally
    frmWTLUSupplierContacts.free;
  end;
end;

procedure TfrmWTLUSupplier.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
//  SortType: string;
  SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.style <> [fsbold] then
    SortType := ' ASC'
  else if SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  SortOrder := SortField + SortType;
  SortType := SortType;

  refreshdata;

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
