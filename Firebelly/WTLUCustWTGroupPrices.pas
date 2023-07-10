unit WTLUCustWTGroupPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmWTLUCustWTGroupPrices = class(TForm)
    dbgDetails: TDBGrid;
    qryDelCustWTGroupPrices: TQuery;
    srclkpCustWTGroupPrices: TDataSource;
    lkpCustWTGroupPrices: TQuery;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    btnExcel: TBitBtn;
    Label3: TLabel;
    lblGroupName: TLabel;
    Label2: TLabel;
    lblMaterialType: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure srclkpCustWTGroupPricesDataChange(Sender: TObject; Field: TField);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FCustomer: integer;
    FGroupCode: integer;
    FGroupName: string;
    FMaterialType: integer;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteWTGroupPrices(TempCode: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetGroupCode(const Value: integer);
    procedure SetGroupName(const Value: string);
    procedure SetMaterialType(const Value: integer);
    { Private declarations }
  public
    property Customer: integer read FCustomer write SetCustomer;
    property GroupCode: integer read FGroupCode write SetGroupCode;
    property GroupName: string read FGroupName write SetGroupName;
    property MaterialType: integer read FMaterialType write SetMaterialType;
  end;

var
  frmWTLUCustWTGroupPrices: TfrmWTLUCustWTGroupPrices;

implementation

uses wtDataModule, wtMain, WTMaintCustWTGroupPrices;

{$R *.dfm}

procedure TfrmWTLUCustWTGroupPrices.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintCustWTGroupPrices := TfrmWTMaintCustWTGroupPrices.create(Application);
    frmWTMaintCustWTGroupPrices.FunctionMode := FuncMode;
    if FuncMode <> 'A' then
    begin
      frmWTMaintCustWTGroupPrices.PricePointer := srclkpCustWTGroupPrices.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintCustWTGroupPrices.SellPrice := srclkpCustWTGroupPrices.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintCustWTGroupPrices.CostPrice := srclkpCustWTGroupPrices.dataset.fieldbyname('Unit_Cost').asfloat;
      frmWTMaintCustWTGroupPrices.Thickness := dbgDetails.DataSource.DataSet.fieldbyname('Thickness').asinteger;
      frmWTMaintCustWTGroupPrices.Markup := dbgDetails.DataSource.DataSet.fieldbyname('Markup_Percentage').asfloat;

      frmWTMaintCustWTGroupPrices.Customer := Customer;
      frmWTMaintCustWTGroupPrices.GroupCode := GroupCode;
    end
    else
    begin
      frmWTMaintCustWTGroupPrices.PricePointer := 0;
      frmWTMaintCustWTGroupPrices.SellPrice := 0.00;
      frmWTMaintCustWTGroupPrices.CostPrice := 0.00;
      frmWTMaintCustWTGroupPrices.Markup := 0.00;
      frmWTMaintCustWTGroupPrices.Thickness := 0;
      frmWTMaintCustWTGroupPrices.Customer := Customer;
      frmWTMaintCustWTGroupPrices.GroupCode := GroupCode;
    end;

    frmWTMaintCustWTGroupPrices.showmodal;
    icode := frmWTMaintCustWTGroupPrices.PricePointer;
    Refresh;
    dbgDetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintCustWTGroupPrices.free;
  end;
end;

procedure TfrmWTLUCustWTGroupPrices.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUCustWTGroupPrices.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUCustWTGroupPrices.dblkpMaterialTypeClick(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUCustWTGroupPrices.Refresh;
var
  sText: string;
begin
  lkpCustWTGroupPrices.close;
  if dtmdlWorktops.IsSQL then
    begin
      sText := stringreplace(lkpCustWTGroupPrices.SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
      lkpCustWTGroupPrices.SQL.Text := sText;
    end;

  lkpCustWTGroupPrices.parambyname('Customer').AsInteger := Customer;
  lkpCustWTGroupPrices.parambyname('Group_Number').AsInteger := GroupCode;
  lkpCustWTGroupPrices.open;
  stsbrDetails.panels[0].text := inttostr(lkpCustWTGroupPrices.recordcount) + ' records displayed';
end;

procedure TfrmWTLUCustWTGroupPrices.srclkpCustWTGroupPricesDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srclkpCustWTGroupPrices.DataSet.RecordCount > 0);
  btnDelete.Enabled := (srclkpCustWTGroupPrices.DataSet.RecordCount > 0);
  btnExcel.Enabled := (srclkpCustWTGroupPrices.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUCustWTGroupPrices.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUCustWTGroupPrices.btnDeleteClick(Sender: TObject);
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

procedure TfrmWTLUCustWTGroupPrices.DeleteWTGroupPrices(TempCode: integer);
begin
  with qryDelCustWTGroupPrices do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWTLUCustWTGroupPrices.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWTLUCustWTGroupPrices);
end;

procedure TfrmWTLUCustWTGroupPrices.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTLUCustWTGroupPrices.SetGroupCode(const Value: integer);
begin
  FGroupCode := Value;
end;

procedure TfrmWTLUCustWTGroupPrices.SetGroupName(const Value: string);
begin
  FGroupName := Value;
  lblGroupName.caption := FGroupName;
end;

procedure TfrmWTLUCustWTGroupPrices.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTLUCustWTGroupPrices.FormActivate(Sender: TObject);
begin
  refresh;
end;

end.
