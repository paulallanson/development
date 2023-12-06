unit wtLUCustEdgeDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUCustEdgeDetails = class(TForm)
    dbgDetails: TDBGrid;
    dtsCustEdge: TDataSource;
    qryCustEdge: TFDQuery;
    qryCustEdgeEdge_Type: TIntegerField;
    qryCustEdgePrice_pointer: TIntegerField;
    qryCustEdgeDescription: TWideStringField;
    qryCustEdgeUnit_Price: TFloatField;
    qryCustEdgeUnit_Cost: TFloatField;
    qryCustEdgePrice_Unit_Description: TWideStringField;
    qryCustEdgeinactive: TWideStringField;
    lkpMatType: TFDQuery;
    srclkpMatType: TDataSource;
    qryGetCustEdges: TFDQuery;
    qryAddCustEdge: TFDQuery;
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
    dblkpCopyGroup: TDBLookupComboBox;
    btnGo: TButton;
    lkpEdgeType: TFDQuery;
    srclkpEdgeType: TDataSource;
    btnExcel: TBitBtn;
    qryCustEdgeEdge_Type_Description: TWideStringField;
    qryCustEdgeGroup_Id: TIntegerField;
    qryDelCustEdge: TFDQuery;
    lkpCustEdgeGroup: TFDQuery;
    dtsCustEdgeGroup: TDataSource;
    qryDelAllCustEdges: TFDQuery;
    qryCustEdgeEdge_Profile: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dtsCustEdgeDataChange(Sender: TObject;
      Field: TField);
    procedure btnDeleteClick(Sender: TObject);
    procedure dblkpEdgeTypeClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dblkpCopyGroupClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FActivated: boolean;
    FCustomer: integer;
    procedure SetActivated(const Value: boolean);
    procedure SetCustomer(const Value: integer);
  private
    FGroupID: integer;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteCustEdge(TempCode: integer);
    procedure AddEdgeDetails;
    function AddCustCutOutPrice(rCost, rPrice: real): integer;
    procedure AddNewGroupEdge(iPricePointer, iprofile, iType: integer);
    procedure DeleteEdgeDetails;
    procedure SetGroupID(const Value: integer);
    property Activated: boolean read FActivated write SetActivated;
  public
    property Customer: integer read FCustomer write SetCustomer;
    property GroupID: integer read FGroupID write SetGroupID;
  end;

var
  frmWTLUCustEdgeDetails: TfrmWTLUCustEdgeDetails;

implementation

uses UITypes, wtDataModule, wtMain, wtMaintCustCustOut, wtMaintCustEdge;

{$R *.dfm}

procedure TfrmWTLUCustEdgeDetails.Refresh;
var
  sText: string;
begin
//  dbgDetails.Columns[0].visible := (dblkpMaterialType.KeyValue = 0);
//  dbgDetails.Columns[0].width := 150;
  dbgDetails.Columns[0].visible := (dblkpEdgeType.KeyValue = 0);
  dbgDetails.Columns[0].width := 150;

  with qryCustEdge do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Group_Id').asinteger := GroupId;
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

procedure TfrmWTLUCustEdgeDetails.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try

    frmWTMaintCustEdge := TfrmWTMaintCustEdge.create(Application);
    if FuncMode <> 'A' then
    begin
      frmWTMaintCustEdge.PricePointer := dtsCustEdge.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintCustEdge.SellPrice := dtsCustEdge.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintCustEdge.CostPrice := dtsCustEdge.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      frmWTMaintCustEdge.PricePointer := 0;
      frmWTMaintCustEdge.SellPrice := 0.00;
      frmWTMaintCustEdge.CostPrice := 0.00;
    end;

    frmWTMaintCustEdge.MaterialType := dblkpMaterialType.keyvalue;
    frmWTMaintCustEdge.EdgeType := dblkpEdgeType.keyvalue;
    frmWTMaintCustEdge.GroupID := self.GroupID;

    frmWTMaintCustEdge.FunctionMode := FuncMode;

    if FuncMode = 'A' then
      frmWTMaintCustEdge.EdgeProfile := 0
    else
      frmWTMaintCustEdge.EdgeProfile := dtsCustEdge.dataset.fieldbyname('Edge_Profile').asinteger;

    frmWTMaintCustEdge.showmodal;
    icode := frmWTMaintCustEdge.PricePointer;
    
    Refresh;
    dbgDetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustEdge.free;
  end;
end;

procedure TfrmWTLUCustEdgeDetails.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCustEdgeDetails.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUCustEdgeDetails.dblkpMaterialTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCustEdgeDetails.DeleteCustEdge(TempCode: integer);
begin
  with qryDelCustEdge do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWTLUCustEdgeDetails.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmWTLUCustEdgeDetails.dtsCustEdgeDataChange(
  Sender: TObject; Field: TField);
begin
  btnEdit.Enabled := (dtsCustEdge.DataSet.recordcount > 0);
  btnDelete.Enabled := (dtsCustEdge.DataSet.recordcount > 0);
  btnExcel.Enabled := (dtsCustEdge.DataSet.recordcount > 0);
end;

procedure TfrmWTLUCustEdgeDetails.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteCustEdge(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
end;

procedure TfrmWTLUCustEdgeDetails.dblkpEdgeTypeClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustEdgeDetails.FormClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustEdgeDetails.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLUCustEdgeDetails.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmWTLUCustEdgeDetails.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      lkpMatType.active := true;
      lkpEdgeType.active := true;

      with lkpCustEdgeGroup do
        begin
          close;
          parambyname('Customer').asinteger := Customer;
          open;
        end;

      dblkpMaterialType.keyvalue := lkpMatType.fieldbyname('Material_type').asinteger;
      dblkpEdgeType.keyvalue := lkpEdgeType.fieldbyname('Edge_type').asinteger;

      Refresh;
      edtName.setfocus;
      FActivated := true;
    end;
end;

procedure TfrmWTLUCustEdgeDetails.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCustEdgeDetails.dblkpCopyGroupClick(Sender: TObject);
begin
//  refresh;
  btnGo.Enabled := (dblkpCopyGroup.Text <> '');
end;

procedure TfrmWTLUCustEdgeDetails.btnGoClick(Sender: TObject);
begin
  if messagedlg('Delete any existing edge profiles and create new details from ' + dblkpCopyGroup.Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {Delete the original cut out details for the selected group}
      DeleteEdgeDetails;

      {Add the edge details}
      AddEdgeDetails;
      Refresh;
    end;
end;

procedure TfrmWTLUCustEdgeDetails.AddEdgeDetails;
var
  iPricePointer, iUnit: integer;
  rSell, rCost: real;
  sText: string;
begin
  with qryGetCustEdges do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Group_Id').asinteger := dblkpCopyGroup.keyvalue;
      open;
      first;


      while eof <> true do
        begin
          {Create new record based on data retrieved}
          rCost := fieldbyname('Unit_Cost').asfloat;
          rSell := fieldbyname('Unit_Price').asfloat;
          iUnit := fieldbyname('Price_Unit').asinteger;

          iPricePointer := AddCustCutOutPrice(rCost, rSell);
          AddNewGroupEdge(iPricePointer, qryGetCustEdges.fieldbyname('Edge_Profile').asinteger, qryGetCustEdges.fieldbyname('Edge_Type').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTLUCustEdgeDetails.DeleteEdgeDetails;
begin
  with qryDelAllCustEdges do
    begin
      close;
      parambyname('Group_Id').asinteger := GroupID;
      execsql;
    end;
end;

procedure TfrmWTLUCustEdgeDetails.AddNewGroupEdge(iPricePointer, iprofile, iType: integer);
begin
  {Add the new CutOut details}
  with qryAddCustEdge do
    begin
      close;
      parambyname('Group_Id').asinteger := GroupID;
      parambyname('Edge_Profile').asinteger := iProfile;
      parambyname('Edge_type').asinteger := iType;
      parambyname('Price_Pointer').asinteger := iPricePointer;
      execsql;
    end;
end;

function TfrmWTLUCustEdgeDetails.AddCustCutOutPrice(rCost, rPrice: real): integer;
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
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
	dtmdlWorktops.qryAddPrice.execSQL;

  result := iPricePointer;
end;

procedure TfrmWTLUCustEdgeDetails.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUCustEdgeDetails.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUCustEdgeDetails.SpeedButton2Click(Sender: TObject);
begin
  dblkpMaterialType.KeyValue := 0;
  Refresh;
end;

procedure TfrmWTLUCustEdgeDetails.SpeedButton1Click(Sender: TObject);
begin
  dblkpedgeType.KeyValue := 0;
  Refresh;
end;

procedure TfrmWTLUCustEdgeDetails.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUCustEdgeDetails);
end;

procedure TfrmWTLUCustEdgeDetails.SetGroupID(const Value: integer);
begin
  FGroupID := Value;
end;

procedure TfrmWTLUCustEdgeDetails.SetActivated(const Value: boolean);
begin
  FActivated := Value;
end;

procedure TfrmWTLUCustEdgeDetails.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

end.
