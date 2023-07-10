unit PBMaintPOrdHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, PBPOObjects;

type
  TPBMaintPOrdHistoryFrm = class(TForm)
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    btnClose: TButton;
    StatusBar1: TStatusBar;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    PONumber: real;
    POLine: integer;
    OrderLine: TOrderLine;
  end;

var
  PBMaintPOrdHistoryFrm: TPBMaintPOrdHistoryFrm;

implementation

uses PBPODataMod;

{$R *.dfm}

procedure TPBMaintPOrdHistoryFrm.FormActivate(Sender: TObject);
begin
  with PBPODM.qryGetPOPriceHist do
    begin
      close;
      parambyname('purchase_order').asfloat := PONumber;
      parambyname('line').asinteger := OrderLine.Line;
      open;
    end;
end;

end.
