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
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField1: TFloatField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    StringField3: TStringField;
    IntegerField8: TIntegerField;
    tmrSearch: TTimer;
    qryDummy: TFDQuery;
    StringField4: TStringField;
    IntegerField9: TIntegerField;
    StringField5: TStringField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    FloatField2: TFloatField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    StringField6: TStringField;
    IntegerField16: TIntegerField;
    qryStore: TFDQuery;
    StatusBar1: TStatusBar;
    qryStockProduct_Class_Description: TStringField;
    qryStockNot_in_Use: TStringField;
    qryStockProduct_Class: TStringField;
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

uses CCSCommon, pbMainMenu;

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
VAR
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue: string;
begin
  TempRect := Rect;
  if (dbgDetails.datasource.dataset.fieldbyname('Not_in_Use').asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
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
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'SERV') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clblue;
      (Sender as TDBGrid).Canvas.Brush.color := clyellow;
    end
  else
  if (dbgDetails.datasource.dataset.fieldbyname('Product_Class').asstring = 'POD') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clBlue;
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Brush.color := clHighlight;
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if  (Column.Title.Caption <> 'In Stock') and
      (Column.Title.Caption <> 'Allocated') and
      (Column.Title.Caption <> 'Free Stock') and
      (Column.Title.Caption <> 'Paid') and
      (Column.Title.Caption <> 'Unpaid') and
      (Column.Title.Caption <> 'On Buy Print') then
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

end.
