unit pbPOrdersDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlPOrders = class(TDataModule)
    qryPOHeaderGrid: TFDQuery;
    dtsPOHeaderGrid: TDataSource;
    qryCompany: TFDQuery;
    qryUpd: TFDQuery;
    qryUpdPOLine: TFDQuery;
    qryGetPOLines: TFDQuery;
    qryCheckPOStatus: TFDQuery;
    qryUpdPOStatus: TFDQuery;
  private
    function GetHeaderCount: integer;
    { Private declarations }
  public
    supplier: string;
    property HeaderCount: integer read GetHeaderCount;
    procedure RefreshData;
  end;

var
  dtmdlPOrders: TdtmdlPOrders;

implementation

{$R *.DFM}

{ TdtmdlPOrders }

function TdtmdlPOrders.GetHeaderCount: integer;
begin
  Result := qryPOHeaderGrid.RecordCount;
end;

procedure TdtmdlPOrders.RefreshData;
begin
  with qryPOHeaderGrid do
  begin
    Close;
    ParamByName('supplier').Asstring := Supplier + '%';
    open;
  end;

end;

end.
