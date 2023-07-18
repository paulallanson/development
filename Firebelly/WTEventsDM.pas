unit WTEventsDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlEvents = class(TDataModule)
    qryEvents: TFDQuery;
    dtsEvents: TDataSource;
    qryDummy: TFDQuery;
  private
    function GetHeaderCount: integer;
    { Private declarations }
  public
    CustomerName: string;
    BranchName: string;
    Customer: integer;
    Description: string;
    procedure RefreshData;
    property HeaderCount: integer read GetHeaderCount;
  end;

var
  dtmdlEvents: TdtmdlEvents;

implementation

{$R *.DFM}

{ TdtmdlEvents }

function TdtmdlEvents.GetHeaderCount: integer;
begin
  result := qryEvents.recordcount;
end;

procedure TdtmdlEvents.RefreshData;
var
  sTemp: string;
begin
  qryEvents.sql.clear;
  qryEvents.sql.text := qryDummy.sql.text;

  sTemp := '';
  if CustomerName <> '' then
    sTemp := sTemp + ' AND (Customer.Name LIKE ''%' + CustomerName + '%'')';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';

  sTemp := sTemp + ' ORDER BY Customer_Contact_Event.date_time_entered desc ';

  qryEvents.SQL.text := qryEvents.SQL.text + sTemp;


  with qryEvents do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

end.
