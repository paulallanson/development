unit STLUPartStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTLUPartStockFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtSearch: TEdit;
    btbtnClose: TBitBtn;
    btnSelect: TBitBtn;
    dbgDetails: TDBGrid;
    Label2: TLabel;
    lblWarehouse: TLabel;
    dtsStock: TDataSource;
    qryStock: TFDQuery;
    tmrSearch: TTimer;
    qryDummy: TFDQuery;
    qryStore: TFDQuery;
    StatusBar1: TStatusBar;
    qryStockPart: TWideStringField;
    qryStockCustomer: TIntegerField;
    qryStockdescription: TWideStringField;
    qryStockform_reference_id: TWideStringField;
    qryStockform_reference: TIntegerField;
    qryStockstore_qty: TIntegerField;
    qryStockqty_alloc: TIntegerField;
    qryStockqty_free: TIntegerField;
    qryStockpurch_ord_qty: TIntegerField;
    qryStockprod_ord_qty: TFloatField;
    qryStockpaid_for: TIntegerField;
    qryStocknot_paid_for: TIntegerField;
    qryStockNot_in_Use: TWideStringField;
    qryStockProduct_Class: TWideStringField;
    qryDummyPart: TWideStringField;
    qryDummyCustomer: TIntegerField;
    qryDummydescription: TWideStringField;
    qryDummyform_reference_id: TWideStringField;
    qryDummyform_reference: TIntegerField;
    qryDummystore_qty: TIntegerField;
    qryDummyqty_alloc: TIntegerField;
    qryDummyqty_free: TIntegerField;
    qryDummypurch_ord_qty: TIntegerField;
    qryDummyprod_ord_qty: TFloatField;
    qryDummypaid_for: TIntegerField;
    qryDummynot_paid_for: TIntegerField;
    qryDummyNot_in_Use: TWideStringField;
    qryDummyProduct_Class: TWideStringField;
    qryDummyProduct_Class_Description: TStringField;
    procedure edtSearchChange(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btbtnCloseClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure IntegerField2GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
  private
    customer: integer;
    Description: string;
    NotInUse: string;
    procedure RefreshData;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure GetStore(tempStore: integer);
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    activeCode: string;
    sCode, sCodeDescr, sFormRef: string;
    store: integer;
    bOK: boolean;
  end;

var
  STLUPartStockFrm: TSTLUPartStockFrm;

implementation

uses
  System.UITypes,
  CCSCommon, pbMainMenu;

{$R *.dfm}

procedure TSTLUPartStockFrm.RefreshData;
var
  sTemp: string;
  suffix, maintext: string;
  iStart, iSublength: integer;
begin
  customer := 0;
  NotInUse := 'N';

  qryStock.close;
  qryStock.SQL.Clear;

  {Add the Purchase Order query details}
  sTemp := '';
  qryStock.SQL.text := qryDummy.SQL.text;

  sTemp := sTemp + ' AND ((Product_Class = ''STK'') or (Product_Class is NULL) or (Product_Class = ''POD'')) ';

  sTemp := sTemp + 'ORDER BY Part.Part';

  qryStock.SQL.text := qryStock.SQL.text + sTemp;

  iStart := pos('>',Description);
  iSublength := length(Description) - (iStart);

  suffix := '';
  maintext := description;

  if iStart > 0 then
    begin
      suffix := copy(description,iStart+1,iSublength);
      maintext := copy(description,1,(iStart-1));
    end;

  with qryStock do
  begin
    Close;
    parambyname('Customer').asinteger := Customer;
    parambyname('Description').asstring := '%' + maintext + '%' + trim(suffix);
    parambyname('Not_in_Use').asstring := NotInUse;
    Open;
  end;
end;
procedure TSTLUPartStockFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent
    then exit;
  Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSTLUPartStockFrm.btnSelectClick(Sender: TObject);
begin
  sCode := dbgDetails.datasource.DataSet.FieldByName('Part').AsString;
  sCodeDescr := dbgDetails.datasource.DataSet.FieldByName('Description').AsString;
  sFormRef := dbgDetails.datasource.DataSet.FieldByName('Form_Reference_ID').AsString;
  Customer := dbgDetails.datasource.DataSet.FieldByName('Customer').Asinteger;
  bOK := True;
  close;
end;

procedure TSTLUPartStockFrm.btbtnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TSTLUPartStockFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  refreshdata;
end;

procedure TSTLUPartStockFrm.IntegerField2GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if sender.IsNull then
    Text := '0'
  else
    text := sender.asstring;
end;

procedure TSTLUPartStockFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  dtsStock.OnDataChange := SetButtons;
  DisableNameChangeEvent := False;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SetDBGridCols('', 'PartStockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TSTLUPartStockFrm.SetButtons(Sender: TObject; Field: TField);
begin
  btnSelect.Enabled := qryStock.recordcount > 0;
end;

procedure TSTLUPartStockFrm.dbgDetailsDblClick(Sender: TObject);
begin
  btnSelectClick(self);
end;

procedure TSTLUPartStockFrm.GetStore(tempStore: integer);
begin
  with qryStore do
    begin
      close;
      parambyname('Part_store').asinteger := tempStore;
      open;

      lblWarehouse.caption := fieldbyname('Part_store_name').asstring;
    end;
end;

procedure TSTLUPartStockFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TSTLUPartStockFrm.FormActivate(Sender: TObject);
begin
  GetStore(store);
end;

procedure TSTLUPartStockFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  CCSCommon.SaveDBGridCols('', 'PartStockLU Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
end;

procedure TSTLUPartStockFrm.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldbyname('Not_in_Use').asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'STK') then
    begin
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'NSTK') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clYellow;
      (Sender as TDBGrid).Canvas.Brush.color := clGreen;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'SERV') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clyellow;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'POD') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clBlue;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;

  if  (Column.Title.Caption <> 'In Stock') and
      (Column.Title.Caption <> 'Allocated') and
      (Column.Title.Caption <> 'Free Stock') and
      (Column.Title.Caption <> 'Paid') and
      (Column.Title.Caption <> 'Unpaid') and
      (Column.Title.Caption <> 'On Buy Print') then
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

end.
