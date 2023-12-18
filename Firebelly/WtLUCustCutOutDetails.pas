unit wtLUCustCutOutDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUCustCutOutDetails = class(TForm)
    dbgDetails: TDBGrid;
    dtsCustCutOut: TDataSource;
    qryCustCutOut: TFDQuery;
    qryCustCutOutCutout: TIntegerField;
    qryCustCutOutEdge_Type: TIntegerField;
    qryCustCutOutPrice_pointer: TIntegerField;
    qryCustCutOutDescription: TWideStringField;
    qryCustCutOutUnit_Price: TFloatField;
    qryCustCutOutUnit_Cost: TFloatField;
    qryCustCutOutPrice_Unit_Description: TWideStringField;
    qryCustCutOutinactive: TWideStringField;
    lkpMatType: TFDQuery;
    srclkpMatType: TDataSource;
    qryGetCustCutOuts: TFDQuery;
    qryAddCustCutOut: TFDQuery;
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
    qryCustCutOutEdge_Type_Description: TStringField;
    qryCustCutOutGroup_Id: TIntegerField;
    qryDelCustCutOut: TFDQuery;
    lkpCustEdgeGroup: TFDQuery;
    dtsCustEdgeGroup: TDataSource;
    qryDelAllCustCutOut: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dtsCustCutOutDataChange(Sender: TObject;
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
    procedure DeleteCustCutOut(TempCode: integer);
    procedure AddCutOutDetails;
    function AddCustCutOutPrice(rCost, rPrice: real): integer;
    procedure AddNewGroupCutOut(iPricePointer, iprofile, iType: integer);
    procedure DeleteCutOutDetails;
    procedure SetGroupID(const Value: integer);
    property Activated: boolean read FActivated write SetActivated;
  public
    property Customer: integer read FCustomer write SetCustomer;
    property GroupID: integer read FGroupID write SetGroupID;
  end;

var
  frmWTLUCustCutOutDetails: TfrmWTLUCustCutOutDetails;

implementation

uses UITypes, wtDataModule, wtMain, wtMaintCustCustOut;

{$R *.dfm}

procedure TfrmWTLUCustCutOutDetails.Refresh;
var
  sText: string;
begin
//  dbgDetails.Columns[0].visible := (dblkpMaterialType.KeyValue = 0);
//  dbgDetails.Columns[0].width := 150;
  dbgDetails.Columns[0].visible := (dblkpEdgeType.KeyValue = 0);
  dbgDetails.Columns[0].width := 150;

  with qryCustCutOut do
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

procedure TfrmWTLUCustCutOutDetails.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try

    frmWTMaintCustCutOut := TfrmWTMaintCustCutOut.create(Application);
    if FuncMode <> 'A' then
    begin
      frmWTMaintCustCutOut.PricePointer := dtsCustCutOut.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintCustCutOut.SellPrice := dtsCustCutOut.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintCustCutOut.CostPrice := dtsCustCutOut.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      frmWTMaintCustCutOut.PricePointer := 0;
      frmWTMaintCustCutOut.SellPrice := 0.00;
      frmWTMaintCustCutOut.CostPrice := 0.00;
    end;

    frmWTMaintCustCutOut.MaterialType := dblkpMaterialType.keyvalue;
    frmWTMaintCustCutOut.EdgeType := dblkpEdgeType.keyvalue;
    frmWTMaintCustCutOut.GroupID := self.GroupID;

    frmWTMaintCustCutOut.FunctionMode := FuncMode;

    if FuncMode = 'A' then
      frmWTMaintCustCutOut.CutOut := 0
    else
      frmWTMaintCustCutOut.CutOut := dtsCustCutOut.dataset.fieldbyname('CutOut').asinteger;

    frmWTMaintCustCutOut.showmodal;
    icode := frmWTMaintCustCutOut.PricePointer;
    
    Refresh;
    dbgDetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustCutOut.free;
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

procedure TfrmWTLUCustCutOutDetails.DeleteCustCutOut(TempCode: integer);
begin
  with qryDelCustCutOut do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWTLUCustCutOutDetails.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmWTLUCustCutOutDetails.dtsCustCutOutDataChange(
  Sender: TObject; Field: TField);
begin
  btnEdit.Enabled := (dtsCustCutOut.DataSet.recordcount > 0);
  btnDelete.Enabled := (dtsCustCutOut.DataSet.recordcount > 0);
  btnExcel.Enabled := (dtsCustCutOut.DataSet.recordcount > 0);
end;

procedure TfrmWTLUCustCutOutDetails.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteCustCutOut(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      Refresh;
    end;
end;

procedure TfrmWTLUCustCutOutDetails.dblkpEdgeTypeClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustCutOutDetails.FormClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUCustCutOutDetails.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLUCustCutOutDetails.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWTLUCustCutOutDetails.FormActivate(Sender: TObject);
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

procedure TfrmWTLUCustCutOutDetails.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCustCutOutDetails.dblkpCopyGroupClick(Sender: TObject);
begin
//  refresh;
  btnGo.Enabled := (dblkpCopyGroup.Text <> '');
end;

procedure TfrmWTLUCustCutOutDetails.btnGoClick(Sender: TObject);
begin
  if messagedlg('Delete any existing cut out details and create cut out details from ' + dblkpCopyGroup.Text, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      {Delete the original cut out details for the selected group}
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
  sText: string;
begin
  with qryGetCustCutOuts do
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
          AddNewGroupCutOut(iPricePointer, qryGetCustCutOuts.fieldbyname('CutOut').asinteger, qryGetCustCutOuts.fieldbyname('Edge_Type').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTLUCustCutOutDetails.DeleteCutOutDetails;
begin
  with qryDelAllCustCutOut do
    begin
      close;
      parambyname('Group_Id').asinteger := GroupID;
      execsql;
    end;
end;

procedure TfrmWTLUCustCutOutDetails.AddNewGroupCutOut(iPricePointer, iprofile, iType: integer);
begin
  {Add the new CutOut details}
  with qryAddCustCutOut do
    begin
      close;
      parambyname('Group_Id').asinteger := GroupID;
      parambyname('CutOut').asinteger := iProfile;
      parambyname('Edge_type').asinteger := iType;
      parambyname('Price_Pointer').asinteger := iPricePointer;
      execsql;
    end;
end;

function TfrmWTLUCustCutOutDetails.AddCustCutOutPrice(rCost, rPrice: real): integer;
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
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'Q';
  dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := rPrice;
  dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := rCost;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 2;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
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
  frmWTMain.ExportToExcel(frmWTLUCustCutOutDetails);
end;

procedure TfrmWTLUCustCutOutDetails.SetGroupID(const Value: integer);
begin
  FGroupID := Value;
end;

procedure TfrmWTLUCustCutOutDetails.SetActivated(const Value: boolean);
begin
  FActivated := Value;
end;

procedure TfrmWTLUCustCutOutDetails.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

end.
