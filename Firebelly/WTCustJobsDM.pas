unit WTCustJobsDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, gtQrCtrls;

type
  TdtmdlCustJobs = class(TDataModule)
    dtsJobs: TDataSource;
    qryJobs: TQuery;
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
  dtmdlCustJobs: TdtmdlCustJobs;

implementation

uses
  wtDataModule;
  
{$R *.DFM}

function TdtmdlCustJobs.GetHeaderCount: integer;
begin
  Result := qryJobs.recordcount;
end;

procedure TdtmdlCustJobs.Refreshdata;
begin
  with qryJobs do
    begin
      close;
      open;
    end;
end;

end.
