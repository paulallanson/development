unit wtLUCOutThickness;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wtLUWTThickness, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, QrCtrls,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmWTLUCoutThickness = class(TfrmWTLUWTThickness)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUCoutThickness: TfrmWTLUCoutThickness;

implementation

uses
  WTDatabaseDM;

{$R *.DFM}

end.
