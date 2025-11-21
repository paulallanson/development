unit WTLUContracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  ToolWin, WTContractsDM, DB, IniFiles, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUContracts = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnCopy: TToolButton;
    btnRequote: TToolButton;
    btnDelete: TToolButton;
    btnPrint: TToolButton;
    ToolButton6: TToolButton;
    ToolButton1: TToolButton;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    edtNumber: TEdit;
    Button1: TButton;
    btnSearch: TBitBtn;
    stsBrDetails: TStatusBar;
    imgLstHot: TImageList;
    tmrSearch: TTimer;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    lblWorkinProgress: TLabel;
    Label4: TLabel;
    cmbCustomerFilter: TComboBox;
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
    procedure btnReQuoteClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cmbCustomerFilterChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDetailsTitleClick(Column: TColumn);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure CallMaintScreen(aMode: TcqMode);
    function CheckInput: boolean;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    { Private declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  frmWTLUContracts: TfrmWTLUContracts;
  dtmdlAllContract: TdtmdlContract;

implementation

uses
  System.UITypes, System.Types,
  AllCommon, WTContractSearch, WtMaintContract, wtRSContract,
  WTLUContractsRpts, wtMain;

{$R *.dfm}

procedure TfrmWTLUContracts.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUContracts.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUContracts.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
    begin
      if (ReadString('Contract', 'Customer Filter', '0') = '0') then
        cmbCustomerFilter.itemindex := 0
      else
      if (ReadString('Contract', 'Customer Filter', '1') = '1') then
        cmbCustomerFilter.itemindex := 1
      else
      if (ReadString('Contract', 'Customer Filter', '2') = '2') then
        cmbCustomerFilter.itemindex := 2
      else
      if (ReadString('Contract', 'Customer Filter', '3') = '3') then
        cmbCustomerFilter.itemindex := 3;
    end;
  finally
    IniFile.Free;
  end;

  dtmdlAllContract := TdtmdlContract.create(Application);
  dtmdlAllContract.dtsAllContracts.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllContract.dtsAllContracts;

  AllCommon.SetDBGridCols('', 'ContractsLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);

end;

procedure TfrmWTLUContracts.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    IniFile.WriteString('Contract', 'Customer Filter', inttostr(cmbCustomerFilter.itemindex));
  finally
    IniFile.Free;
  end;

  dtmdlAllContract.free;
end;

procedure TfrmWTLUContracts.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllContract.CustomerName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmWTLUContracts.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllContract.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllContract.refreshAlldata;

end;

procedure TfrmWTLUContracts.FormShow(Sender: TObject);
begin
  edtSearch.setfocus;

end;

procedure TfrmWTLUContracts.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllContract do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnPrint.Enabled := HeaderCountAll > 0;
    btnCopy.Enabled := HeaderCountAll > 0;
    btnReQuote.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;
//    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Contract_Quote').asstring;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Quote_Number').asstring;

    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    lblWorkinProgress.Visible := ShowLive;
    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmWTLUContracts.btnChangeClick(Sender: TObject);
begin
//  if not CheckInput then
//    exit;

  CallMaintScreen(cqChange);
end;

procedure TfrmWTLUContracts.CallMaintScreen(aMode : TcqMode);
var
  Key : integer;
  frm : TfrmWtMaintContract;
  aContract : TContract;
  bOK: boolean;
begin
  if (aMode = cqChange) then
    begin
      if  (dbgDetails.DataSource.DataSet.FieldByName('Expiry_Date').asdatetime <> 0) and
          (dbgDetails.DataSource.DataSet.FieldByName('Expiry_Date').asdatetime < date) then
        if MessageDlg('This contract has expired. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
          exit;
    end;

  if aMode = cqAdd then
    Key := 0
  else
    Key := dtmdlAllContract.CurrentContract;

  bOK := False;
  try
    aContract := TContract.Create(dtmdlAllContract);
    try
      aContract.DbKey := key;
      aContract.cqMode := aMode;
      aContract.LoadFromDB;
      Frm := TfrmwtMainTContract.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Contract := aContract;
        Frm.ShowModal;
        bOK := Frm.bOK;
        Key := aContract.DbKey;
      finally
        Frm.Free;
      end;
    finally
      aContract.Free;
    end;
  finally
    if bOK then
    begin
      dbgdetails.DataSource.DataSet.Close;
      dbgdetails.DataSource.DataSet.Open;
      dbgdetails.DataSource.DataSet.Locate('Contract_Quote', Variant(inttostr(Key)),[lopartialKey]) ;
    end;
  end;
end;

procedure TfrmWTLUContracts.btnAddClick(Sender: TObject);
begin
  CallMaintScreen(cqAdd);
end;

procedure TfrmWTLUContracts.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUContracts.btnDeleteClick(Sender: TObject);
begin
  if not CheckInput then
    exit;
  CallMaintScreen(cqDelete);
end;

procedure TfrmWTLUContracts.btnPrintClick(Sender: TObject);
var
  OldCursor : TCursor;
  key: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTRSContract := TfrmWTRSContract.Create( Application );
    Key := dtmdlAllContract.CurrentContract;
    frmWTRSContract.key := Key;
    frmWTRSContract.memSelection.text := dbgDetails.Datasource.Dataset.fieldbyname('Quote_Number').asstring;
    frmWTRSContract.showmodal;
  finally
    frmWTRSContract.free;
    dbgdetails.DataSource.DataSet.Close;
    dbgdetails.DataSource.DataSet.Open;
    Screen.Cursor := OldCursor;
  end;
  dbgdetails.DataSource.DataSet.Locate('Contract_Quote', Variant(inttostr(Key)),[lopartialKey]) ;
end;

procedure TfrmWTLUContracts.btnCopyClick(Sender: TObject);
begin
//  if not CheckInput then
//    exit;

  CallMaintScreen(cqCopy);
end;

procedure TfrmWTLUContracts.btnSearchClick(Sender: TObject);
begin
  frmWTContractSearch := TfrmWTContractSearch.create(self);
  try
    frmWTContractSearch.dtmdlContract := dtmdlAllContract;
    frmWTContractSearch.edtDescription.text := dtmdlAllContract.Description;
    frmWTContractSearch.edtDeveloper.text := dtmdlAllContract.Developer;
    frmWTContractSearch.edtSiteLocation.text := dtmdlAllContract.SiteLocation;
    frmWTContractSearch.edtQuoteReference.text := dtmdlAllContract.QuoteReference;
    frmWTContractSearch.chkbxShowLive.checked := dtmdlAllContract.showlive;
    frmWTContractSearch.chkbxShowInactive.checked := dtmdlAllContract.showInactive = 'Y';
    frmWTContractSearch.showModal;
  finally
    frmWTContractSearch.free;
  end;
end;

procedure TfrmWTLUContracts.ToolButton1Click(Sender: TObject);
begin
  frmWTLUContractRpts := TfrmWTLUContractRpts.create(self);
  try
    frmWTLUContractRpts.showmodal;
  finally
    frmWTLUContractRpts.free;
  end;
end;

procedure TfrmWTLUContracts.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if not CheckInput then
        exit;

      btnChangeclick(self);
    end;
end;

function TfrmWTLUContracts.CheckInput: boolean;
begin
  result := true;

  if not dbgDetails.datasource.DataSet.locate('Quote_Number', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Contract Quote '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;

(*  if not dbgDetails.datasource.DataSet.locate('Contract_Quote', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Contract Quote '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
*)
end;

procedure TfrmWTLUContracts.FormActivate(Sender: TObject);
begin
  dtmdlAllContract.TradeRetail := cmbCustomerFilter.itemindex;
  dtmdlAllContract.RefreshAlldata;
  dbgDetails.datasource.DataSet.locate('Contract_Quote', Variant(inttostr(ActiveCode)),[lopartialKey]) ;

end;

procedure TfrmWTLUContracts.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Contract_Quote').asinteger;
  except
    Activecode := 0
  end;

end;

procedure TfrmWTLUContracts.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.Color := clMenuHighlight;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Contract Quote') and (Column.Title.Caption <> 'Quote') and (Column.Title.Caption <> 'Quote Reference') then
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

procedure TfrmWTLUContracts.dbgDetailsTitleClick(Column: TColumn);
var
  icolumn: integer;
  SortType, SortField: string;
begin
  if dbgDetails.Dragging then exit;

  if Column.Title.Font.Style <> [fsBold] then
    SortType := ' ASC'
  else if dtmdlAllContract.SortType = ' DESC' then
      SortType := ' ASC'
  else
    SortType := ' DESC';

  SortField := Column.FieldName;

  for icolumn := 0 to pred(dbgDetails.columns.count) do
    dbgDetails.Columns[icolumn].Title.Font.Style := [];
  Column.Title.Font.Style := [fsbold];

  dtmdlAllContract.SortOrder := SortField + SortType;
  dtmdlAllContract.SortType := SortType;

  dtmdlAllContract.RefreshAllData;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUContracts.cmbCustomerFilterChange(Sender: TObject);
begin
  dtmdlAllContract.TradeRetail := (Sender as TComboBox).itemindex;
  dtmdlAllContract.refreshAlldata;

end;

procedure TfrmWTLUContracts.btnReQuoteClick(Sender: TObject);
begin
//  if not CheckInput then
//    exit;
  CallMaintScreen(cqReQuote);
end;

procedure TfrmWTLUContracts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'ContractsLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

end.
