unit PBLUStkLocs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, pbFormReferenceDM;

type
  TPBLUStkLocsFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DetsDBGrid: TDBGrid;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    dtmdlAllForms: TdtmdlForms;
    FActivated: boolean;
    procedure ShowGrid;
  public
    { Public declarations }
    iFormRef: integer;
  end;

var
  PBLUStkLocsFrm: TPBLUStkLocsFrm;

implementation

{$R *.DFM}

procedure TPBLUStkLocsFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then { I shall say thees only wonce }
  begin
    DetsDBGrid.DataSource := dtmdlAllForms.dtsLocations;
    FActivated := true;
    ShowGrid;
  end;
end;

procedure TPBLUStkLocsFrm.ShowGrid;
begin
  with dtmdlAllForms do
  begin
    RefreshStockLocs(iFormRef);
    dtsLocations.DataSet.Open;
    DetsDBGrid.selectedRows.CurrentRowSelected := dtsLocations.DataSet.Recordcount > 0 ;
  end;
end;

procedure TPBLUStkLocsFrm.FormCreate(Sender: TObject);
begin
  dtmdlAllForms := TdtmdlForms.Create(self);
end;

end.
