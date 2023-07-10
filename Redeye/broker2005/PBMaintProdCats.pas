unit PBMaintProdCats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, ExtCtrls;

type
  TPBMaintProdCatsFrm = class(TForm)
    pnlFooter: TPanel;
    btbtnClose: TBitBtn;
    pnlHeader: TPanel;
    Label1: TLabel;
    pnlLeft: TPanel;
    dbgrdOut: TDBGrid;
    qrySelProdCatsFalse: TQuery;
    qryProdCatsTrue: TQuery;
    qrySelCategories: TQuery;
    dtsrcCategories: TDataSource;
    pnlRight: TPanel;
    pnlRight2: TPanel;
    dbgrdIn: TDBGrid;
    pnlButtons: TPanel;
    btnAdd: TButton;
    dtsrcNotInCat: TDataSource;
    dtsrcInCat: TDataSource;
    dblucmbbxCategories: TDBLookupComboBox;
    Splitter1: TSplitter;
    qryUpdProdType: TQuery;
    qryProdCatsTrueproduct_type: TIntegerField;
    qryProdCatsTruedescription: TStringField;
    qryProdCatsTruecategory: TIntegerField;
    qryProdCatsTruedescription_1: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblucmbbxCategoriesCloseUp(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dblucmbbxCategoriesDropDown(Sender: TObject);
  private
    luCategory: string;
  public
    { Public declarations }
  end;

var
  PBMaintProdCatsFrm: TPBMaintProdCatsFrm;

implementation

{$R *.DFM}

procedure TPBMaintProdCatsFrm.FormShow(Sender: TObject);
begin
  with qrySelCategories do
  begin
    close;
    open;
  end;
end;

procedure TPBMaintProdCatsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySelCategories.close;
  qrySelProdCatsFalse.close;
  qryProdCatsTrue.close;
end;

procedure TPBMaintProdCatsFrm.dblucmbbxCategoriesCloseUp(Sender: TObject);
begin
  if luCategory <> dblucmbbxCategories.Text then
  begin
    with qrySelProdCatsFalse do
    begin
      close;
      ParamByName('category').asInteger :=
        dblucmbbxCategories.ListSource.DataSet.FieldByName('category').asInteger;
      open;
    end;

    with qryProdCatsTrue do
    begin
      close;
      ParamByName('category').asInteger :=
        dblucmbbxCategories.ListSource.DataSet.FieldByName('category').asInteger;
      open;
    end;
  end;
end;

procedure TPBMaintProdCatsFrm.btnAddClick(Sender: TObject);
var
  inx: integer;
  nextProdType: TBookmark;
begin
  try
    dbgrdOut.datasource.dataset.Next;
    nextProdType := dbgrdOut.datasource.dataset.GetBookmark;
  except

  end;

  with dbgrdOut.datasource.dataset do
  begin
    for inx := 0 to (dbgrdOut.SelectedRows.Count - 1) do
    begin
      GotoBookmark(pointer(dbgrdOut.SelectedRows.Items[inx]));
      qryUpdProdType.ParamByName('category').asInteger :=
        dblucmbbxCategories.ListSource.DataSet.FieldByName('category').asInteger;
      qryUpdProdType.ParamByName('product_type').asInteger :=
        FieldByName('product_type').asInteger;
      qryUpdProdType.ExecSQL;
    end;
  end;
  
  qrySelProdCatsFalse.Close;
  qrySelProdCatsFalse.Open;
  try
    dbgrdOut.datasource.dataset.GotoBookmark(nextProdType);
    dbgrdOut.datasource.dataset.FreeBookmark(nextProdType);
  except

  end;

  qryProdCatsTrue.Close;
  qryProdCatsTrue.Open;
end;

procedure TPBMaintProdCatsFrm.dblucmbbxCategoriesDropDown(Sender: TObject);
begin
  luCategory := dblucmbbxCategories.Text;
end;

end.
