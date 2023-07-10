unit wtLUCustCutOutDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, DBTables, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmWTLUCustCutOutDetails = class(TForm)
    dbgDetails: TDBGrid;
    tblCOutThickness: TTable;
    srcCOutThickness: TDataSource;
    srclkpCOutThickness: TDataSource;
    lkpCOutThickness: TQuery;
    lkpCOutThicknessCutout: TIntegerField;
    lkpCOutThicknessEdge_Type: TIntegerField;
    lkpCOutThicknessMaterial_Type: TIntegerField;
    lkpCOutThicknessPrice_pointer: TIntegerField;
    lkpCOutThicknessDescription: TStringField;
    lkpCOutThicknessUnit_Price: TFloatField;
    lkpCOutThicknessUnit_Cost: TFloatField;
    lkpCOutThicknessPrice_Unit_Description: TStringField;
    lkpCOutThicknessinactive: TStringField;
    lkpMatType: TQuery;
    srclkpMatType: TDataSource;
    qryDelCOutThick: TQuery;
    qryGetCutOutThickness: TQuery;
    qryAddCutOutThickness: TQuery;
    qryDeleteCutOutThickness: TQuery;
    tmrRefresh: TTimer;
    Panel1: TPanel;
    stsbrDetails: TStatusBar;
    Label4: TLabel;
    chkbxShowInactive: TCheckBox;
    edtName: TEdit;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    dblkpEdgeType: TDBLookupComboBox;
    dblkpCopyMaterial: TDBLookupComboBox;
    btnGo: TButton;
    lkpEdgeType: TQuery;
    srclkpEdgeType: TDataSource;
    btnExcel: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lkpCOutThicknessMaterial_Description: TStringField;
    lkpCOutThicknessEdge_Type_Description: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblCOutThicknessNewRecord(DataSet: TDataSet);
    procedure tblCOutThicknessBeforePost(DataSet: TDataSet);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srclkpCOutThicknessDataChange(Sender: TObject;
      Field: TField);
    procedure btnDeleteClick(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
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
    procedure Refresh;
    procedure DeleteCOutThickness(TempCode: integer);
    procedure AddCutOutDetails;
    function AddCutOutThicknessPrice(rCost, rPrice: real): integer;
    procedure AddNewCutOutThickness(iPricePointer, iprofile, iType,
      iMaterial: integer);
    procedure DeleteCutOutDetails;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUCustCutOutDetails: TfrmWTLUCustCutOutDetails;

implementation

uses wtMaintCutOutDetails, wtDataModule, wtMain;

{$R *.dfm}

procedure TfrmWTLUCustCutOutDetails.Refresh;
begin
  dbgDetails.Columns[0].visible := (dblkpMaterialType.KeyValue = 0);
  dbgDetails.Columns[0].width := 150;
  dbgDetails.Columns[1].visible := (dblkpEdgeType.KeyValue = 0);
  dbgDetails.Columns[1].width := 150;

(*  with lkpCOutThickness do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Edge_Type').asinteger := dblkpEdgeType.keyvalue;
      parambyname('Description').asstring :=  '%' + edtName.Text + '%';
      if chkbxShowinactive.checked then
        parambyname('inactive').asstring := 'Y'
      else
        parambyname('inactive').asstring := 'N';
      open;
      stsbrDetails.panels[0].text := inttostr(recordcount) + ' records displayed';
    end;
*)
end;

procedure TfrmWTLUCustCutOutDetails.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    tblCOutthickness.Active := true;
    frmWTMaintCutOutDetails := TfrmWTMaintCutOutDetails.create(Application);
    if FuncMode <> 'A' then
    begin
      frmWTMaintCutOutDetails.PricePointer := srclkpCOutThickness.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintCutOutDetails.SellPrice := srclkpCOutThickness.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintCutOutDetails.CostPrice := srclkpCOutThickness.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      frmWTMaintCutOutDetails.PricePointer := 0;
      frmWTMaintCutOutDetails.SellPrice := 0.00;
      frmWTMaintCutOutDetails.CostPrice := 0.00;
    end;

    frmWTMaintCutOutDetails.MaterialType := dblkpMaterialType.keyvalue;
    frmWTMaintCutOutDetails.EdgeType := dblkpEdgeType.keyvalue;

    frmWTMaintCutOutDetails.FunctionMode := FuncMode;
    frmWTMaintCutOutDetails.showmodal;
    if FuncMode = 'A' then
      icode := tblCOutThickness.FieldbyName('Price_Pointer').asinteger
    else
      icode := frmWTMaintCutOutDetails.PricePointer;
    Refresh;
    dbgDetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCutOutDetails.free;
    tblCOutthickness.Active := false;
  end;
end;

procedure TfrmWTLUCustCutOutDetails.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCustCutOutDetails.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUCustCutOutDetails.dblkpMaterialTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCustCutOutDetails.FormCreate(Sender: TObject);
begin
  lkpMatType.active := true;
  lkpEdgeType.active := true;

  dblkpMaterialType.keyvalue := lkpMatType.fieldbyname('Material_type').asinteger;
  dblkpEdgeType.keyvalue := lkpEdgeType.fieldbyname('Edge_type').asinteger;
end;

procedure TfrmWTLUCustCutOutDetails.tblCOutThicknessNewRecord(
  DataSet: TDataSet);
begin
(*  tblCOutThickness.FieldByName('Edge_Type').asinteger := lkpEdgeType.fieldbyname('Edge_type').asinteger;
  tblCOutThickness.FieldByName('Material_Type').asinteger := lkpMatType.fieldbyname('Material_Type').asinteger;
*)
end;

procedure TfrmWTLUCustCutOutDetails.tblCOutThicknessBeforePost(
  DataSet: TDataSet);
begin
(*	dtmdlWorktops.qryNewPrice.Close;
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
*)
end;

procedure TfrmWTLUCustCutOutDetails.DeleteCOutThickness(TempCode: integer);
begin
(*  with qryDelCOutThick do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
*)
end;

procedure TfrmWTLUCustCutOutDetails.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmWTLUCustCutOutDetails.srclkpCOutThicknessDataChange(
  Sender: TObject; Field: TField);
begin
  btnEdit.Enabled := (srclkpCOutThickness.DataSet.recordcount > 0);
  btnDelete.Enabled := (srclkpCOutThickness.DataSet.recordcount > 0);
  btnExcel.Enabled := (srclkpCOutThickness.DataSet.recordcount > 0);
end;

procedure TfrmWTLUCustCutOutDetails.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
(*  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteCOutThickness(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
*)
end;

procedure TfrmWTLUCustCutOutDetails.dblkpEdgeTypeClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustCutOutDetails.FormClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustCutOutDetails.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUCustCutOutDetails.FormActivate(Sender: TObject);
begin
  Refresh;
  edtName.setfocus;
end;

procedure TfrmWTLUCustCutOutDetails.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCustCutOutDetails.dblkpCopyMaterialClick(Sender: TObject);
begin
  refresh;
  btnGo.Enabled := (dblkpCopyMaterial.Text <> '');

end;

procedure TfrmWTLUCustCutOutDetails.btnGoClick(Sender: TObject);
begin
  if messagedlg('Delete any existing cut out details and create cut out details for ' + dblkpMaterialType.Text + ' from ' + dblkpCopyMaterial.Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {Delete the old edge details for the selected material type}
      DeleteCutOutDetails;

      {Add the edge details}
      AddCutOutDetails;
      Refresh;
    end;
end;

procedure TfrmWTLUCustCutOutDetails.AddCutOutDetails;
var
  iPricePointer, iUnit: integer;
  rSell, rCost: real;
begin
  with qryGetCutOutThickness do
    begin
      close;
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

          iPricePointer := AddCutOutThicknessPrice(rCost, rSell);
          AddNewCutOutThickness(iPricePointer, qryGetCutOutThickness.fieldbyname('CutOut').asinteger, dblkpEdgeType.keyvalue, dblkpMaterialType.keyvalue);
          next;
        end;
    end;
end;

procedure TfrmWTLUCustCutOutDetails.DeleteCutOutDetails;
begin
  with qryDeleteCutOutThickness do
    begin
      close;
      parambyname('Material_type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Edge_Type').asinteger := dblkpedgetype.keyvalue;
      execsql;
    end;
end;

procedure TfrmWTLUCustCutOutDetails.AddNewCutOutThickness(iPricePointer, iprofile, iType, iMaterial: integer);
begin
  {Add the new CutOut details}
  with qryAddCutOutThickness do
    begin
      close;
      parambyname('CutOut').asinteger := iProfile;
      parambyname('Edge_type').asinteger := iType;
      parambyname('Material_Type').asinteger := iMaterial;
      parambyname('Price_Pointer').asinteger := iPricePointer;
      execsql;
    end;
end;

function TfrmWTLUCustCutOutDetails.AddCutOutThicknessPrice(rCost, rPrice: real): integer;
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

procedure TfrmWTLUCustCutOutDetails.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUCustCutOutDetails.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUCustCutOutDetails.SpeedButton2Click(Sender: TObject);
begin
  dblkpMaterialType.KeyValue := 0;
  Refresh;
end;

procedure TfrmWTLUCustCutOutDetails.SpeedButton1Click(Sender: TObject);
begin
  dblkpedgeType.KeyValue := 0;
  Refresh;
end;

procedure TfrmWTLUCustCutOutDetails.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUCutOutDetails);
end;

end.
