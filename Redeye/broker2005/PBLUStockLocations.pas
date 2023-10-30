unit PBLUStockLocations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, ComCtrls, ExtCtrls, Data.DB;

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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUStockLocations: TfrmPBLUStockLocations;

implementation

{$R *.dfm}

procedure TfrmPBLUStockLocations.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
end;

end.
