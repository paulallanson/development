unit WTCustQuotesDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, QrCtrls;

type
  TdtmdlCustQuotes = class(TDataModule)
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
  dtmdlCustQuotes: TdtmdlCustQuotes;

implementation

uses
  wtDataModule;
  
{$R *.DFM}

function TdtmdlCustQuotes.GetHeaderCount: integer;
begin
  Result := qryQuotes.recordcount;
end;

procedure TdtmdlCustQuotes.Refreshdata;
begin
  with qryQuotes do
    begin
      close;
      parambyname('Description').asstring := '%' + Description + '%';
      parambyname('Customer').asinteger := Customer;
      open;
    end;
end;

end.
