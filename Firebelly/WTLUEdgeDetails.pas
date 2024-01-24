unit WTLUEdgeDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ComCtrls,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, Buttons, DB, QrCtrls, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUEdgeDetails = class(TForm)
    dbgDetails: TDBGrid;
    qryDelEdgeThick: TFDQuery;
    lkpEdgeThickness: TFDQuery;
    srclkpEdgeThickness: TDataSource;
    lkpMatType: TFDQuery;
    srclkpMatType: TDataSource;
    lkpEdgeType: TFDQuery;
    srclkpEdgeType: TDataSource;
    qryGetEdgeThickness: TFDQuery;
    qryAddEdgeThickness: TFDQuery;
    qryDeleteEdgeThickness: TFDQuery;
    tmrRefresh: TTimer;
    stsbrDetails: TStatusBar;
    pnlFoot: TPanel;
    Label4: TLabel;
    BitBtn4: TBitBtn;
    btnDelete: TBitBtn;
    btnEdit: TBitBtn;
    BitBtn1: TBitBtn;
    chkbxShowInactive: TCheckBox;
    edtName: TEdit;
    btnExcel: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    dblkpEdgeType: TDBLookupComboBox;
    dblkpCopyMaterial: TDBLookupComboBox;
    btnGo: TButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lkpEdgeThicknessEdge_profile: TIntegerField;
    lkpEdgeThicknessEdge_Type: TIntegerField;
    lkpEdgeThicknessMaterial_Type: TIntegerField;
    lkpEdgeThicknessPrice_pointer: TIntegerField;
    lkpEdgeThicknessDescription: TWideStringField;
    lkpEdgeThicknessinactive: TWideStringField;
    lkpEdgeThicknessEdge_Type_Description: TWideStringField;
    lkpEdgeThicknessMaterial_Description: TWideStringField;
    lkpEdgeThicknessUnit_Price: TCurrencyField;
    lkpEdgeThicknessUnit_Cost: TCurrencyField;
    lkpEdgeThicknessPrice_Unit_Description: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblEdgethicknessBeforePost(DataSet: TDataSet);
    procedure srclkpEdgeThicknessDataChange(Sender: TObject;
      Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dblkpCopyMaterialClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure DeleteEdgeDetails;
    procedure DeleteEdgeThickness(TempCode: integer);
    procedure Refresh;
    procedure AddEdgeDetails;
    function AddEdgeThicknessPrice(rCost, rPrice: real): integer;
    procedure AddNewEdgeThickness(iPricePointer, iprofile, iType, iMaterial: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUEdgeDetails: TfrmWTLUEdgeDetails;

implementation

uses
  System.UITypes, AllCommon,
  wtMaintEdgeDetails, wtDataModule, wtMain;

{$R *.dfm}

procedure TfrmWtLUEdgeDetails.Refresh;
var
  sText: string;
begin
  dbgDetails.Columns[0].visible := (dblkpMaterialType.KeyValue = 0);
  dbgDetails.Columns[0].width := 150;
  dbgDetails.Columns[1].visible := (dblkpEdgeType.KeyValue = 0);
  dbgDetails.Columns[1].width := 150;

  with lkpEdgeThickness do
    begin
      close;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := dblkpMaterialType.ListValue;
      parambyname('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
      parambyname('Description').asstring :=  '%' + edtName.Text + '%';
      if chkbxShowinactive.checked then
        parambyname('inactive').asstring := 'Y'
      else
        parambyname('inactive').asstring := 'N';
      open;
      stsbrDetails.panels[0].text := inttostr(recordcount) + ' records displayed';
    end;
end;

procedure TfrmWTLUEdgeDetails.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  lkpMatType.active := true;
  lkpEdgeType.active := true;

  dblkpMaterialType.keyvalue := lkpMatType.fieldbyname('Material_type').asinteger;
  dblkpEdgetype.keyvalue := lkpEdgeType.fieldbyname('Edge_Type').asinteger;

//  tblEdgeThickness.active := true;
end;

procedure TfrmWTLUEdgeDetails.dblkpMaterialTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWtLUEdgeDetails.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintEdgeDetails := TfrmWTMaintEdgeDetails.create(Application);
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
  end;
end;

procedure TfrmWTLUEdgeDetails.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUEdgeDetails.btnDeleteClick(Sender: TObject);
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

procedure TfrmWTLUEdgeDetails.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUEdgeDetails.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(Self);
end;

procedure TfrmWTLUEdgeDetails.dblkpEdgeTypeClick(Sender: TObject);
begin
  refresh;

end;

procedure TfrmWTLUEdgeDetails.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lkpMatType.active := false;
  lkpEdgeType.active := false;
end;

procedure TfrmWTLUEdgeDetails.tblEdgethicknessBeforePost(DataSet: TDataSet);
begin
(*	dtmdlWorktops.qryNewPrice.Close;
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

*)
end;

procedure TfrmWTLUEdgeDetails.DeleteEdgeThickness(TempCode: integer);
begin
  with qryDelEdgeThick do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWTLUEdgeDetails.srclkpEdgeThicknessDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srclkpEdgeThickness.DataSet.recordcount > 0);
  btnDelete.Enabled := (srclkpEdgeThickness.DataSet.recordcount > 0);
  btnExcel.Enabled := (srclkpEdgeThickness.DataSet.recordcount > 0);
end;

procedure TfrmWTLUEdgeDetails.FormActivate(Sender: TObject);
begin
  Refresh;
  edtName.setfocus;
end;

procedure TfrmWTLUEdgeDetails.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWTLUEdgeDetails.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUEdgeDetails.dblkpCopyMaterialClick(Sender: TObject);
begin
  refresh;
  btnGo.Enabled := (dblkpCopyMaterial.Text <> '');
end;

procedure TfrmWTLUEdgeDetails.btnGoClick(Sender: TObject);
begin
  if messagedlg('Delete any existing edge details and create new edge details for ' + dblkpMaterialType.Text + ' from ' + dblkpCopyMaterial.Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {Delete the old edge details for the selected material type}
      DeleteEdgeDetails;

      {Add the edge details}
      AddEdgeDetails;
      Refresh;
    end;
end;

procedure TfrmWTLUEdgeDetails.AddEdgeDetails;
var
  iPricePointer, iUnit: integer;
  rSell, rCost: real;
  sText: string;
begin
  with qryGetEdgeThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := dblkpCopyMaterial.keyvalue;
      parambyname('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
      open;
      first;


      while eof <> true do
        begin
          {Create new record based on data retrieved}
          rCost := fieldbyname('Unit_Cost').asfloat;
          rSell := fieldbyname('Unit_Price').asfloat;
          iUnit := fieldbyname('Price_Unit').asinteger;

          iPricePointer := AddEdgeThicknessPrice(rCost, rSell);
          AddNewEdgeThickness(iPricePointer, qryGetEdgeThickness.fieldbyname('Edge_Profile').asinteger, dblkpEdgeType.keyvalue, dblkpMaterialType.keyvalue);
          next;
        end;
    end;
end;

procedure TfrmWTLUEdgeDetails.DeleteEdgeDetails;
begin
  with qryDeleteEdgeThickness do
    begin
      close;
      parambyname('Material_type').asinteger := dblkpMaterialType.ListValue;
      parambyname('Edge_Type').asinteger := dblkpedgetype.keyvalue;
      execsql;
    end;
end;

procedure TfrmWTLUEdgeDetails.AddNewEdgeThickness(iPricePointer, iprofile, iType, iMaterial: integer);
begin
  {Add the new edge details}
  with qryAddEdgeThickness do
    begin
      close;
      parambyname('Edge_Profile').asinteger := iProfile;
      parambyname('Edge_type').asinteger := iType;
      parambyname('Material_Type').asinteger := iMaterial;
      parambyname('Price_Pointer').asinteger := iPricePointer;
      execsql;
    end;
end;

function TfrmWTLUEdgeDetails.AddEdgeThicknessPrice(rCost, rPrice: real): integer;
var
  iPricePointer: integer;
begin
  {Get the new price pointer}
  dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger + 1;

  {Add the price pointer}
  dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'E';
	dtmdlWorktops.qryAddPointer.ExecSQl;

  {Add the cost and price}
  dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'L';
  dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := rPrice;
  dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := rCost;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 3;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
	dtmdlWorktops.qryAddPrice.execSQL;

  result := iPricePointer;
end;

procedure TfrmWTLUEdgeDetails.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUEdgeDetails.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUEdgeDetails.SpeedButton2Click(Sender: TObject);
begin
  dblkpMaterialType.KeyValue := 0;
  Refresh;
end;

procedure TfrmWTLUEdgeDetails.SpeedButton1Click(Sender: TObject);
begin
  dblkpEdgeType.KeyValue := 0;
  Refresh;
end;

procedure TfrmWTLUEdgeDetails.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUEdgeDetails);

end;

end.
