unit WtLUWTGroupPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtLUWTGroupPrices = class(TForm)
    dbgDetails: TDBGrid;
    lkpMatType: TFDQuery;
    srclkpMatType: TDataSource;
    qryDelWTGPrices: TFDQuery;
    srclkpWTGPrices: TDataSource;
    lkpWTGPrices: TFDQuery;
    lkpWTGPricesWorktop_group: TIntegerField;
    lkpWTGPricesMaterial_Type: TIntegerField;
    lkpWTGPricesThickness: TIntegerField;
    lkpWTGPricesPrice_pointer: TIntegerField;
    lkpWTGPricesThickness_mm: TStringField;
    lkpWTGPricesWorktop_Group_Description: TStringField;
    lkpWTGPricesUnit_Price: TFloatField;
    lkpWTGPricesUnit_Cost: TFloatField;
    lkpWTGPricesPrice_Unit_Description: TStringField;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    Button1: TButton;
    btnExcel: TBitBtn;
    SpeedButton2: TSpeedButton;
    lkpWTGPricesMaterial_Description: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure tblWTGPricesBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure srclkpWTGPricesDataChange(Sender: TObject; Field: TField);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteWTGroupPrices(TempCode: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWtLUWTGroupPrices: TfrmWtLUWTGroupPrices;

implementation

uses WTMaintWTGPrices, wtDataModule, wtMain, wtLUMatType;

{$R *.dfm}

procedure TfrmWtLUWTGroupPrices.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWtLUWTGroupPrices.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintWTGPrices := TfrmWTMaintWTGPrices.create(Application);
    frmWTMaintWTGPrices.MaterialType := dblkpMaterialType.keyvalue;;
    if FuncMode <> 'A' then
    begin
      frmWTMaintWTGPrices.PricePointer := srclkpWTGPrices.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintWTGPrices.SellPrice := srclkpWTGPrices.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintWTGPrices.CostPrice := srclkpWTGPrices.dataset.fieldbyname('Unit_Cost').asfloat;
      frmWTMaintWTGPrices.WTGroup := dbgDetails.DataSource.DataSet.fieldbyname('Worktop_Group').asinteger;
      frmWTMaintWTGPrices.Thickness := dbgDetails.DataSource.DataSet.fieldbyname('Thickness').asinteger;
    end
    else
    begin
      frmWTMaintWTGPrices.PricePointer := 0;
      frmWTMaintWTGPrices.SellPrice := 0.00;
      frmWTMaintWTGPrices.CostPrice := 0.00;
      frmWTMaintWTGPrices.WTGroup := 0;
      frmWTMaintWTGPrices.Thickness := 0;
    end;

    frmWTMaintWTGPrices.FunctionMode := FuncMode;
    frmWTMaintWTGPrices.showmodal;
    icode := frmWTMaintWTGPrices.PricePointer;
    Refresh;
    dbgDetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintWTGPrices.free;
  end;
end;
procedure TfrmWtLUWTGroupPrices.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWtLUWTGroupPrices.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWtLUWTGroupPrices.tblWTGPricesBeforePost(DataSet: TDataSet);
begin
(*
	dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  tblWTGPrices.FieldbyName('Price_Pointer').asinteger := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := tblWTGPrices.FieldbyName('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	dtmdlWorktops.qryAddPointer.ExecSQl;

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := tblWTGPrices.Fieldbyname('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
*)
end;

procedure TfrmWtLUWTGroupPrices.FormCreate(Sender: TObject);
begin
  lkpMatType.active := true;
  dblkpMaterialType.keyvalue :=1;
  dblkpMaterialTypeClick(Self);
end;

procedure TfrmWtLUWTGroupPrices.dblkpMaterialTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWtLUWTGroupPrices.Refresh;
var
  sText: string;
begin
  dbgDetails.columns[0].visible := (dblkpMaterialType.KeyValue = 0);
  dbgDetails.columns[0].width := 150;

  with lkpWTGPrices do
    begin
      close;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').AsInteger := dblkpMaterialType.keyvalue;
      open;
    end;

  stsbrDetails.panels[0].text := inttostr(lkpWTGPrices.recordcount) + ' records displayed';
end;

procedure TfrmWtLUWTGroupPrices.srclkpWTGPricesDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srclkpWTGPrices.DataSet.RecordCount > 0);
  btnDelete.Enabled := (srclkpWTGPrices.DataSet.RecordCount > 0);
  btnExcel.Enabled := (srclkpWTGPrices.DataSet.RecordCount > 0);
end;

procedure TfrmWtLUWTGroupPrices.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWtLUWTGroupPrices.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteWTGroupPrices(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
end;

procedure TfrmWtLUWTGroupPrices.DeleteWTGroupPrices(TempCode: integer);
begin
  with qryDelWTGPrices do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWtLUWTGroupPrices.Button1Click(Sender: TObject);
begin
  frmWTLuMatType := TfrmWTLuMatType.create(self);
  try
    frmWTLuMatType.showmodal;
    lkpMatType.active := false;
    lkpMatType.active := true;
  finally
    frmWTLuMatType.free
  end;
end;

procedure TfrmWtLUWTGroupPrices.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWtLUWTGroupPrices);
end;

procedure TfrmWtLUWTGroupPrices.SpeedButton2Click(Sender: TObject);
begin
  dblkpMaterialType.KeyValue := 0;
  Refresh;
end;

end.
