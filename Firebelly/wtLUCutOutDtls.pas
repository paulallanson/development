unit wtLUCutOutDtls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtLUEdgeDtls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtLUCutOutDtls = class(TfrmWtLUEdgeDtls)
    tblCOutThickness: TFDTable;
    srcCOutThickness: TDataSource;
    lkpCOutThickness: TFDQuery;
    srclkpCOutThickness: TDataSource;
    qryDelCOutThick: TFDQuery;
    qryDelCOThick: TFDQuery;
    lkpCOutThicknessCutout: TIntegerField;
    lkpCOutThicknessEdge_Type: TIntegerField;
    lkpCOutThicknessMaterial_Type: TIntegerField;
    lkpCOutThicknessPrice_pointer: TIntegerField;
    lkpCOutThicknessDescription: TStringField;
    lkpCOutThicknessUnit_Price: TFloatField;
    lkpCOutThicknessUnit_Cost: TFloatField;
    lkpCOutThicknessPrice_Unit_Description: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dblkpThicknessClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tblCOutThicknessNewRecord(DataSet: TDataSet);
    procedure tblCOutThicknessBeforePost(DataSet: TDataSet);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srclkpCOutThicknessDataChange(Sender: TObject;
      Field: TField);
    procedure btnDeleteClick(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteCOutThickness(TempCode: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWtLUCutOutDtls: TfrmWtLUCutOutDtls;

implementation

uses
  System.UITypes,
  wtMaintCutOutDtls, wtDataModule;

{$R *.dfm}

procedure TfrmWtLUCutOutDtls.Refresh;
begin
  with lkpCOutThickness do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
      open;
    end;
end;

procedure TfrmWtLUCutOutDtls.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    tblCOutthickness.Active := true;
    frmWTMaintCutOutDtls := TfrmWTMaintCutOutDtls.create(Application);
    if FuncMode <> 'A' then
    begin
      frmWTMaintCutOutDtls.PricePointer := srclkpCOutThickness.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintCutOutDtls.SellPrice := srclkpCOutThickness.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintCutOutDtls.CostPrice := srclkpCOutThickness.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      frmWTMaintCutOutDtls.PricePointer := 0;
      frmWTMaintCutOutDtls.SellPrice := 0.00;
      frmWTMaintCutOutDtls.CostPrice := 0.00;
    end;

    frmWTMaintCutOutDtls.MaterialType := dblkpMaterialType.keyvalue;
    frmWTMaintCutOutDtls.EdgeType := dblkpEdgeType.keyvalue;

    frmWTMaintCutOutDtls.FunctionMode := FuncMode;
    frmWTMaintCutOutDtls.showmodal;
    icode := frmWTMaintCutOutDtls.PricePointer;
    Refresh;
    dbgDetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCutOutDtls.free;
    tblCOutthickness.Active := false;
  end;
end;

procedure TfrmWtLUCutOutDtls.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWtLUCutOutDtls.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWtLUCutOutDtls.dblkpThicknessClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWtLUCutOutDtls.dblkpMaterialTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWtLUCutOutDtls.FormCreate(Sender: TObject);
begin
  lkpMatType.active := true;
  lkpEdgeType.active := true;

  dblkpMaterialType.keyvalue := lkpMatType.fieldbyname('Material_type').asinteger;
  dblkpEdgeType.keyvalue := lkpEdgeType.fieldbyname('Edge_type').asinteger;
end;

procedure TfrmWtLUCutOutDtls.BitBtn3Click(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteCOutThickness(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
end;

procedure TfrmWtLUCutOutDtls.tblCOutThicknessNewRecord(DataSet: TDataSet);
begin
  tblCOutThickness.FieldByName('Edge_Type').asinteger := lkpEdgeType.fieldbyname('Edge_type').asinteger;
  tblCOutThickness.FieldByName('Material_Type').asinteger := lkpMatType.fieldbyname('Material_Type').asinteger;
end;

procedure TfrmWtLUCutOutDtls.tblCOutThicknessBeforePost(DataSet: TDataSet);
begin
	dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  tblCOutThickness.FieldbyName('Price_Pointer').asinteger := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

  dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := tblCOutThickness.FieldbyName('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'E';
	dtmdlWorktops.qryAddPointer.ExecSQl;

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := tblCOutThickness.Fieldbyname('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
end;

procedure TfrmWtLUCutOutDtls.DeleteCOutThickness(TempCode: integer);
begin
  with qryDelCOutThick do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWtLUCutOutDtls.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmWtLUCutOutDtls.srclkpCOutThicknessDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srclkpCOutThickness.DataSet.recordcount > 0);
  btnDelete.Enabled := (srclkpCOutThickness.DataSet.recordcount > 0);
  btnThickness.Enabled := (srclkpCOutThickness.DataSet.recordcount > 0);
end;

procedure TfrmWtLUCutOutDtls.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteCOutThickness(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
end;

procedure TfrmWtLUCutOutDtls.dblkpEdgeTypeClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWtLUCutOutDtls.FormActivate(Sender: TObject);
begin
  Refresh;
end;

end.
