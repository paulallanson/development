unit pbPOrdersDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdtmdlPOrders = class(TDataModule)
    qryPOHeaderGrid: TQuery;
    dtsPOHeaderGrid: TDataSource;
    qryCompany: TQuery;
    qryUpd: TQuery;
    qryUpdPOLine: TQuery;
    qryGetPOLines: TQuery;
    qryCheckPOStatus: TQuery;
    qryUpdPOStatus: TQuery;
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
