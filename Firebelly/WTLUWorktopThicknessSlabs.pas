unit WTLUWorktopThicknessSlabs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Data.DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ActiveX,
  ComCtrls, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmWTLUWorktopThicknessSlabs = class(TForm)
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    dbgDetails: TDBGrid;
    qrySlabs: TFDQuery;
    dtsSlabs: TDataSource;
    qryDelete: TFDQuery;
    BitBtn1: TBitBtn;
    qryAddSlab: TFDQuery;
    qryGetSlabs: TFDQuery;
    qryAddStock: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    qryUpdStock: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dtsSlabsDataChange(Sender: TObject; Field: TField);
    procedure btnAddClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    FWorktop: integer;
    FThickness: integer;
    FDescription: string;
    FMaterialType: integer;
    FMaterialTypeDescription: string;
    FStockCode: string;
    procedure Refresh;
    procedure CallMaintScreen(FuncMode: string);
    procedure SetDescription(const Value: string);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure SetMaterialType(const Value: integer);
    procedure SetMaterialTypeDescription(const Value: string);
    procedure SetStockCode(const Value: string);
    procedure AddZero;
    function CreateStockItem(tmpCode, tmpDescription: string): integer;
    procedure DeleteZero;
    function GetNextKey: integer;
    { Private declarations }
  public
    property Description: string read FDescription write SetDescription;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property MaterialTypeDescription: string read FMaterialTypeDescription write SetMaterialTypeDescription;
    property StockCode: string read FStockCode write SetStockCode;
    property Thickness: integer read FThickness write SetThickness;
    property Worktop: integer read FWorktop write SetWorktop;
    { Public declarations }
  end;

var
  frmWTLUWorktopThicknessSlabs: TfrmWTLUWorktopThicknessSlabs;

implementation

uses WTMaintWorktopThicknessSlab, wtMain;

{$R *.dfm}

procedure TfrmWTLUWorktopThicknessSlabs.Refresh;
begin
  qrySlabs.close;
  qrySlabs.parambyname('worktop').asinteger := self.worktop;
  qrySlabs.parambyname('thickness').asinteger := self.thickness;
  
  if not chkbxShowInactive.Checked then
    begin
      qrySlabs.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qrySlabs.parambyname('inactive').asstring := 'Y';
    end;

  qrySlabs.open;
  stsbrDetails.panels[0].text := inttostr(qrySlabs.recordcount) + ' records displayed';
end;


procedure TfrmWTLUWorktopThicknessSlabs.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUWorktopThicknessSlabs.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUWorktopThicknessSlabs.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Worktop_Thickness_Slab_Size WHERE Slab_Size_ID = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Slab_Size_ID').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Slab_Size_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;

end;

procedure TfrmWTLUWorktopThicknessSlabs.dbgDetailsDblClick(
  Sender: TObject);
begin
  CallMaintScreen('C');

end;

procedure TfrmWTLUWorktopThicknessSlabs.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  frmWTMaintWorktopThicknessSlab := TfrmWTMaintWorktopThicknessSlab.create(Application);
  try

    frmWTMaintWorktopThicknessSlab.FunctionMode := FuncMode;
    frmWTMaintWorktopThicknessSlab.Worktop := self.Worktop;
    frmWTMaintWorktopThicknessSlab.Thickness := self.Thickness;
    frmWTMaintWorktopThicknessSlab.Description := self.Description;

    if FuncMode <> 'A' then
    begin
      frmWTMaintWorktopThicknessSlab.SlabSize := dtsSlabs.dataset.fieldbyname('Slab_Size_ID').asinteger;

      frmWTMaintWorktopThicknessSlab.lblWorktopDescription.caption := self.Description;
      frmWTMaintWorktopThicknessSlab.edtLength.Text := dtsSlabs.dataset.fieldbyname('Length').asstring;
      frmWTMaintWorktopThicknessSlab.edtDepth.Text := dtsSlabs.dataset.fieldbyname('Depth').asstring;
      frmWTMaintWorktopThicknessSlab.edtSlabSizeDescription.text := dtsSlabs.dataset.fieldbyname('Slab_Size_Description').asstring;
      frmWTMaintWorktopThicknessSlab.edtStockCode.text := dtsSlabs.dataset.fieldbyname('Stock_Code').asstring;
      frmWTMaintWorktopThicknessSlab.edtStockDescription.text := dtsSlabs.dataset.fieldbyname('Stock_Description').asstring;
    end
    else
    begin
      frmWTMaintWorktopThicknessSlab.SlabSize := 0;

      frmWTMaintWorktopThicknessSlab.lblWorktopDescription.caption := self.Description;
      frmWTMaintWorktopThicknessSlab.edtLength.Text := '';
      frmWTMaintWorktopThicknessSlab.edtDepth.Text := '';
      frmWTMaintWorktopThicknessSlab.edtSlabSizeDescription.text := '';
      frmWTMaintWorktopThicknessSlab.edtStockCode.text := '';
      frmWTMaintWorktopThicknessSlab.edtStockDescription.text := '';
    end;


    frmWTMaintWorktopThicknessSlab.showmodal;

    Refresh;
    dtsSlabs.dataset.locate('Slab_Size_ID', Variant(inttostr(qrySlabs.fieldbyname('Slab_Size_ID').asinteger)),[lopartialKey]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintWorktopThicknessSlab.free;
//    tblSlabs.Active := false;
  end;
end;

procedure TfrmWTLUWorktopThicknessSlabs.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUWorktopThicknessSlabs.dtsSlabsDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.enabled := (dtsSlabs.DataSet.RecordCount > 0);
  btnDelete.enabled := (dtsSlabs.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUWorktopThicknessSlabs.SetDescription(
  const Value: string);
begin
  FDescription := Value;
  self.Caption := self.Caption + ' for ' + FDescription;
end;

procedure TfrmWTLUWorktopThicknessSlabs.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTLUWorktopThicknessSlabs.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTLUWorktopThicknessSlabs.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUWorktopThicknessSlabs.BitBtn1Click(Sender: TObject);
var
  StockItem: integer;
begin
  if messagedlg('Load the default slab details from the ' + MaterialTypeDescription + ' material type?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with qryGetSlabs do
        begin
          close;
          parambyname('Material_type').asinteger := MaterialType;
          open;

          if StockCode <> '' then
            StockItem := CreateStockItem(StockCode, Description);

          while eof <> true do
            begin
              with qryAddSlab do
                begin
                  Close;
                  parambyname('Slab_Size_Description').asstring := qryGetSlabs.fieldbyname('Slab_Size_Description').asstring;
                  parambyname('Length').asinteger := qryGetSlabs.fieldbyname('Length').asinteger;
                  parambyname('Depth').asinteger := qryGetSlabs.fieldbyname('Depth').asinteger;
                  parambyname('Worktop').asinteger := self.worktop;
                  parambyname('Thickness').asinteger := self.thickness;
                  if StockItem = 0 then
                    parambyname('Stock_Item').clear
                  else
                    parambyname('Stock_Item').asinteger := StockItem;
                  execsql;
                end;
              next;
            end;
        end;
      Refresh;
    end;
end;

procedure TfrmWTLUWorktopThicknessSlabs.SetMaterialType(
  const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTLUWorktopThicknessSlabs.SetMaterialTypeDescription(
  const Value: string);
begin
  FMaterialTypeDescription := Value;
end;

procedure TfrmWTLUWorktopThicknessSlabs.SetStockCode(const Value: string);
begin
  FStockCode := Value;
end;

function TfrmWTLUWorktopThicknessSlabs.CreateStockItem(tmpCode, tmpDescription: string): integer;
begin
  Result := GetNextKey;

  with qryUpdStock do
    begin
      close;
      parambyname('Stock_Item').asinteger := Result;
      parambyname('Stock_Code').asstring := tmpCode;
      parambyname('Stock_Description').asstring := tmpDescription;
      execsql;
    end;
end;

function TfrmWTLUWorktopThicknessSlabs.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert stock record
    with qryAddStock do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Stock_Item').AsInteger;
      Close;
    end;

  finally
    DeleteZero;
  end;
end;

procedure TfrmWTLUWorktopThicknessSlabs.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Stock_Item ' +
            '(Stock_Item, Stock_Code, Stock_Description) ' +
            'VALUES (0, ''Dummy'', ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTLUWorktopThicknessSlabs.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Stock_Item Where Stock_Item = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
