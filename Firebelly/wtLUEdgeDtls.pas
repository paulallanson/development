unit wtLUEdgeDtls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wtLUworktops, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmWtLUEdgeDtls = class(TfrmWtLUWorktops)
    Label2: TLabel;
    dblkpEdgeType: TDBLookupComboBox;
    lkpEdgeType: TFDQuery;
    srclkpEdgeType: TDataSource;
    tblEdgethickness: TFDTable;
    srcEdgeThickness: TDataSource;
    lkpEdgeThickness: TFDQuery;
    srclkpEdgeThickness: TDataSource;
    qryDelEdgeThick: TFDQuery;
    qryDelEdgThick: TFDQuery;
    lkpEdgeThicknessEdge_profile: TIntegerField;
    lkpEdgeThicknessEdge_Type: TIntegerField;
    lkpEdgeThicknessMaterial_Type: TIntegerField;
    lkpEdgeThicknessPrice_pointer: TIntegerField;
    lkpEdgeThicknessDescription: TWideStringField;
    lkpEdgeThicknessUnit_Price: TCurrencyField;
    lkpEdgeThicknessUnit_Cost: TCurrencyField;
    lkpEdgeThicknessPrice_Unit_Description: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblEdgethicknessNewRecord(DataSet: TDataSet);
    procedure tblEdgethicknessBeforePost(DataSet: TDataSet);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srclkpEdgeThicknessDataChange(Sender: TObject;
      Field: TField);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteEdgeThickness(TempCode: integer);
  public
    { Public declarations }
  end;

var
  frmWtLUEdgeDtls: TfrmWtLUEdgeDtls;

implementation

uses
  System.UITypes,
  wtMaintEdgeDetails, wtDataModule;

{$R *.DFM}

procedure TfrmWtLUEdgeDtls.Refresh;
begin
  with lkpEdgeThickness do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
      open;
    end;
end;

procedure TfrmWtLUEdgeDtls.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  lkpMatType.active := true;
  lkpEdgeType.active := true;

  dblkpMaterialType.keyvalue := lkpMatType.fieldbyname('Material_type').asinteger;
  dblkpEdgetype.keyvalue := lkpEdgeType.fieldbyname('Edge_Type').asinteger;

  tblEdgeThickness.active := true;
end;

procedure TfrmWtLUEdgeDtls.dblkpMaterialTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWtLUEdgeDtls.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintEdgeDetails := TfrmWTMaintEdgeDetails.create(Application);
    tblEdgeThickness.active := true;
    if FuncMode <> 'A' then
    begin
      frmWTMaintEdgeDetails.PricePointer := srclkpEdgeThickness.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintEdgeDetails.SellPrice := srclkpEdgeThickness.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintEdgeDetails.CostPrice := srclkpEdgeThickness.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      frmWTMaintEdgeDetails.PricePointer := 0;
      frmWTMaintEdgeDetails.SellPrice := 0.00;
      frmWTMaintEdgeDetails.CostPrice := 0.00;
    end;

    frmWTMaintEdgeDetails.MaterialType := dblkpMaterialType.keyvalue;
    frmWTMaintEdgeDetails.EdgeType := dblkpEdgeType.keyvalue;

    frmWTMaintEdgeDetails.FunctionMode := FuncMode;
    frmWTMaintEdgeDetails.showmodal;
    icode := frmWTMaintEdgeDetails.PricePointer;
    Refresh;
    dbgdetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintEdgeDetails.free;
    tblEdgeThickness.active := false;
  end;
end;

procedure TfrmWtLUEdgeDtls.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWtLUEdgeDtls.BitBtn3Click(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteEdgeThickness(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
end;

procedure TfrmWtLUEdgeDtls.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWtLUEdgeDtls.DBGrid1DblClick(Sender: TObject);
begin
  btnEditClick(Self);
end;

procedure TfrmWtLUEdgeDtls.dblkpEdgeTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWtLUEdgeDtls.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  lkpMatType.active := false;
  lkpEdgeType.active := false;
end;

procedure TfrmWtLUEdgeDtls.tblEdgethicknessNewRecord(DataSet: TDataSet);
begin
  tblEdgeThickness.FieldByName('Edge_Type').asinteger := lkpEdgeType.fieldbyname('Edge_Type').asinteger;
  tblEdgeThickness.FieldByName('Material_Type').asinteger := lkpMatType.fieldbyname('Material_Type').asinteger;
end;

procedure TfrmWtLUEdgeDtls.tblEdgethicknessBeforePost(DataSet: TDataSet);
begin
	dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  tblEdgeThickness.FieldbyName('Price_Pointer').asinteger := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

  dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := tblEdgeThickness.FieldbyName('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'E';
	dtmdlWorktops.qryAddPointer.ExecSQl;

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := tblEdgeThickness.Fieldbyname('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 3;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
end;

procedure TfrmWtLUEdgeDtls.DeleteEdgeThickness(TempCode: integer);
begin
  with qryDelEdgeThick do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWtLUEdgeDtls.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWtLUEdgeDtls.srclkpEdgeThicknessDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srclkpEdgeThickness.DataSet.recordcount > 0);
  btnDelete.Enabled := (srclkpEdgeThickness.DataSet.recordcount > 0);
  btnThickness.Enabled := (srclkpEdgeThickness.DataSet.recordcount > 0);
end;

procedure TfrmWtLUEdgeDtls.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteEdgeThickness(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
end;

procedure TfrmWtLUEdgeDtls.FormActivate(Sender: TObject);
begin
  Refresh;
end;

end.
