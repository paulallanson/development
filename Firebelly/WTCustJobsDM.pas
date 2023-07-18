unit WTCustJobsDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlCustJobs = class(TDataModule)
    dtsJobs: TDataSource;
    qryJobs: TFDQuery;
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
