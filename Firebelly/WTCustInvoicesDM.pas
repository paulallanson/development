unit WTCustInvoicesDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlCustInvoices = class(TDataModule)
    dtsInvoices: TDataSource;
    qryInvoices: TFDQuery;
  private
    function GetHeaderCount: integer;
    { Private declarations }
  public
    Customer: integer;
    Description: string;
    property HeaderCount: integer read GetHeaderCount;
    procedure Refreshdata;
  end;

var
  dtmdlCustInvoices: TdtmdlCustInvoices;

implementation

uses
  wtDataModule;
  
{$R *.DFM}

function TdtmdlCustInvoices.GetHeaderCount: integer;
begin
  Result := qryInvoices.recordcount;
end;

procedure TdtmdlCustInvoices.Refreshdata;
begin
  with qryInvoices do
    begin
      close;
      parambyname('Description').asstring := '%' + Description + '%';
      parambyname('Customer').asinteger := Customer;
      open;
    end;
end;

end.
