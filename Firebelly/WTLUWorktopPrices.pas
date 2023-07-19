unit WTLUWorktopPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUWorktopPrices = class(TForm)
    dbgDetails: TDBGrid;
    qryWorktops: TFDQuery;
    srcLUWorktops: TDataSource;
  private
    { Private declarations }
  public
    iMaterial: integer;
    sDescription: string;
    sInactive: string;
    procedure RefreshData;
  end;

var
  frmWTLUWorktopPrices: TfrmWTLUWorktopPrices;

implementation

uses wtDataModule;

{$R *.dfm}

procedure TfrmWTLUWorktopPrices.RefreshData;
var
  sText: string;
begin
  with qryWorktops do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Material_Type').asinteger := iMaterial;
      parambyname('Description').asstring :=  '%' + sDescription + '%';
      parambyname('inactive').asstring := sInactive;
      open;
    end;
end;

end.
