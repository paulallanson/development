unit PBEnqSuppDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqSuppDataModFrm = class(TDataModule)
    EnqHeadSQL: TFDQuery;
    EnqHeadSRC: TDataSource;
    EnqLineSQL: TFDQuery;
    EnqLineSRC: TDataSource;
    EnqSuppSQL: TFDQuery;
    EnqSuppSRC: TDataSource;
    EnqSuppQtySQL: TFDQuery;
    EnqSuppQtySRC: TDataSource;
    EnqSuppChgsSQL: TFDQuery;
    DelChargeSQL: TFDQuery;
    AddEnqSuppChgsSQL: TFDQuery;
    procedure PBEnqSuppDataModFrmCreate(Sender: TObject);
    procedure PBEnqSuppDataModFrmDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBEnqSuppDataModFrm: TPBEnqSuppDataModFrm;

implementation

{$R *.DFM}

procedure TPBEnqSuppDataModFrm.PBEnqSuppDataModFrmCreate(Sender: TObject);
begin
  enqheadSQL.Active := True;
  enqlineSQL.Active := True;
  enqSuppSQL.Active := True;
  enqSuppQtySQL.Active := True;
  enqSuppChgsSQL.Active := True;

end;

procedure TPBEnqSuppDataModFrm.PBEnqSuppDataModFrmDestroy(Sender: TObject);
begin
  enqheadSQL.Active := False;
  enqlineSQL.Active := False;
  enqSuppSQL.Active := False;
  enqSuppQtySQL.Active := False;
  enqSuppChgsSQL.Active := False;
end;

end.
