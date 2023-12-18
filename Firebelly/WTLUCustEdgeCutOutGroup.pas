unit WTLUCustEdgeCutOutGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUCustEdgeCutOutGroup = class(TForm)
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    Panel2: TPanel;
    btnEdges: TBitBtn;
    btnCutOuts: TBitBtn;
    pnlHeader: TPanel;
    Label1: TLabel;
    lblCustomerName: TLabel;
    dbgDetails: TDBGrid;
    qryGetGroups: TFDQuery;
    dtsGetGroups: TDataSource;
    qryDelete: TFDQuery;
    procedure btnAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnCutOutsClick(Sender: TObject);
    procedure btnEdgesClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCustomer: integer;
    FCustomerName: string;
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure ShowGrid(Sender: TObject);
    procedure FindInGrid(sTempSel: string);
    { Private declarations }
  public
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
  end;

var
  frmWTLUCustEdgeCutOutGroup: TfrmWTLUCustEdgeCutOutGroup;

implementation

uses UITypes, WTMaintCustEdgeCutOutGroup, wtMain, WtLUCustCutOutDetails,
  wtLUCustEdgeDetails;

{$R *.dfm}

procedure TfrmWTLUCustEdgeCutOutGroup.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
  lblCustomerName.Caption := CustomerName;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCustEdgeCutOutGroup.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iCode: integer;
begin
  frmWTMaintCustEdgeCutOutGroup := TfrmWTMaintCustEdgeCutOutGroup.Create(Self);
  try
    frmWTMaintCustEdgeCutOutGroup.Customer := self.Customer;
    frmWTMaintCustEdgeCutOutGroup.Mode := sTempFuncMode;
    frmWTMaintCustEdgeCutOutGroup.ShowModal;
    bTempOK := (frmWTMaintCustEdgeCutOutGroup.ModalResult = mrOK);
    iCode := frmWTMaintCustEdgeCutOutGroup.Code;
  finally
    frmWTMaintCustEdgeCutOutGroup.Free;
  end;
  if bTempOK then
    begin
      ShowGrid(Self);
      qryGetGRoups.Locate('Group_Id',Variant(inttostr(iCode)),[]);
    end;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed}
  with dtsGetGroups.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Group_Id').AsString <> sTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.ShowGrid(Sender: TObject);
begin
  with qryGetGroups do
    begin
      close;
      ParamByName('Customer').Asinteger := self.Customer;
      if chkbxShowInactive.Checked then
        ParamByName('inactive').AsString := 'Y'
      else
        ParamByName('inactive').AsString := 'N';
      Open;

      btnEdit.Enabled := RecordCount > 0;
      btnDelete.Enabled := RecordCount > 0;
      btnEdges.Enabled := RecordCount > 0;
      btnCutOuts.Enabled := RecordCount > 0;
      btnExcel.Enabled := RecordCount > 0;
  end;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.FormActivate(Sender: TObject);
begin
  {Load up the string grid}
  ShowGrid(Self);
end;

procedure TfrmWTLUCustEdgeCutOutGroup.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUCustEdgeCutOutGroup.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            parambyname('Group_Id').asinteger := dbgDetails.datasource.dataset.fieldbyname('Group_Id').asinteger;
            execsql;
          end;
      except
        messagedlg('The selected record has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
  ShowGrid(Self);
end;

procedure TfrmWTLUCustEdgeCutOutGroup.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUCustEdgeCutOutGroup.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUCustEdgeCutOutGroup);
end;

procedure TfrmWTLUCustEdgeCutOutGroup.btnCutOutsClick(Sender: TObject);
begin
  frmWtLUCustCutOutDetails := TfrmWtLUCustCutOutDetails.create(application);
  try
    frmWtLUCustCutOutDetails.Customer := self.customer;
    frmWtLUCustCutOutDetails.GroupID := dbgDetails.DataSource.DataSet.fieldbyname('Group_Id').asinteger;
    frmWtLUCustCutOutDetails.dblkpMaterialType.KeyValue := dbgDetails.DataSource.DataSet.fieldbyname('Material_Type').asinteger;
    frmWtLUCustCutOutDetails.showmodal;
  finally
    frmWtLUCustCutOutDetails.free;
  end;

end;

procedure TfrmWTLUCustEdgeCutOutGroup.btnEdgesClick(Sender: TObject);
begin
  frmWTLUCustEdgeDetails := TfrmWTLUCustEdgeDetails.create(application);
  try
    frmWTLUCustEdgeDetails.Customer := self.customer;
    frmWTLUCustEdgeDetails.GroupID := dbgDetails.DataSource.DataSet.fieldbyname('Group_Id').asinteger;
    frmWTLUCustEdgeDetails.dblkpMaterialType.KeyValue := dbgDetails.DataSource.DataSet.fieldbyname('Material_Type').asinteger;
    frmWTLUCustEdgeDetails.showmodal;
  finally
    frmWTLUCustEdgeDetails.free;
  end;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.dbgDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWTLUCustEdgeCutOutGroup.chkbxShowInactiveClick(
  Sender: TObject);
begin
  ShowGrid(self);
end;

end.
