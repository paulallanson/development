unit PBCapCats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, Db, DBTables, StdCtrls, DBCtrls, Buttons;

type
  TPBCapCatsFrm = class(TForm)
    CapDBGrid: TDBGrid;
    GetCapsSQL: TQuery;
    CapsDS: TDataSource;
    Label1: TLabel;
    GetCatsSQL: TQuery;
    CatsDS: TDataSource;
    CloseBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    AddMemo: TMemo;
    GetCatsProdTypesSQL: TQuery;
    GetLastNoSQL: TQuery;
    AddSQL: TQuery;
    Label2: TLabel;
    dblkpProductType: TDBLookupComboBox;
    qryProdType: TQuery;
    dtsProdType: TDataSource;
    qryGetProductType: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CatDBLookupComboBoxClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CapDBGridCellClick(Column: TColumn);
    procedure OKBitBtnClick(Sender: TObject);
    procedure dblkpProductTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBCapCatsFrm: TPBCapCatsFrm;

implementation

uses PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBCapCatsFrm.FormActivate(Sender: TObject);
begin
With GetCapsSQL do
        begin
        Close ;
        Open ;
        end;
With qryProdType do
        begin
        Close ;
        Open ;
        end;
CheckOK(self) ;
  dmBroker.ScreenAccessControl(Self,'mnuProductTypeUtils',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBCapCatsFrm.CatDBLookupComboBoxClick(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TPBCapCatsFrm.CheckOK(Sender: TObject);
begin
If (dblkpProductType.KeyValue <> 0) and
        (CapDBGrid.SelectedRows.Count > 0) then
        begin
        OKBitBtn.Enabled := True ;
        AddMemo.Visible := True ;
        end
else
        begin
        OKBitBtn.Enabled := False ;
        AddMemo.Visible := False ;
        end;
end;

procedure TPBCapCatsFrm.CapDBGridCellClick(Column: TColumn);
begin
CheckOK(self) ;
end;

procedure TPBCapCatsFrm.OKBitBtnClick(Sender: TObject);
Var
iTempCount, iTempCount2: Integer;
begin
{Actually add the questions} ;
With qryGetProductType do
        begin
        {Get all the product types in the category} ;
        Close ;
        ParamByName('Product_Type').AsInteger := dblkpProductType.KeyValue ;
        Open ;
        First ;
        While not EOF do
                begin
                For iTempCount := 0 to (CapDBGrid.SelectedRows.Count - 1) do
                        begin
                        {Loop through the selected questions} ;
                        CapsDS.DataSet.GotoBookmark(Pointer(CapDBGrid.SelectedRows[iTempCount])) ;
                        With GetLastNoSQL do
                                begin
                                Close ;
                                ParamByName('Product_Type').AsInteger := qryGetProductType.FieldByName('Product_Type').AsInteger ;
                                Open ;
                                First ;
                                iTempCount2 := FieldByName('Last_No').AsInteger + 1 ;
                                end;
                        With AddSQL do
                                begin
                                Close ;
                                ParamByName('Product_Type').AsInteger := qryGetProductType.FieldByName('Product_Type').AsInteger ;
                                ParamByName('Capability').AsInteger := iTempCount2 ;
                                ParamByName('Description').AsString := CapsDS.DataSet.FieldByName('Description').AsString ;
                                ExecSQL ;
                                end;
                        end;
                Next ;
                end;
        end;
dblkpProductType.KeyValue := 0 ;
CheckOK(self) ;
end;

procedure TPBCapCatsFrm.dblkpProductTypeClick(Sender: TObject);
begin
CheckOK(self) ;
end;

end.
