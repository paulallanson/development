unit PBLUStockLocations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, ComCtrls, ExtCtrls;

type
  TfrmPBLUStockLocations = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    dblkpWarehouse: TDBLookupComboBox;
    Label2: TLabel;
    edtBin: TEdit;
    dbgDetails: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUStockLocations: TfrmPBLUStockLocations;

implementation

{$R *.dfm}

end.
