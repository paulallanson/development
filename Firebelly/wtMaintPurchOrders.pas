unit wtMaintPurchOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtPurchasesDM, gtQrCtrls;

type
  TfrmWTMaintPurchOrders = class(TForm)
  private
    FMode: TpopMode;
    FPOrder: TPOrder;
    procedure SetMode(const Value: TpopMode);
    procedure SetPOrder(const Value: TPOrder);
    { Private declarations }
  public
    property POrder: TPOrder read FPOrder write SetPOrder;
    property Mode: TpopMode read FMode write SetMode;
  end;

var
  frmWTMaintPurchOrders: TfrmWTMaintPurchOrders;

implementation

{$R *.dfm}

{ TfrmWTMaintPurchOrders }

procedure TfrmWTMaintPurchOrders.SetMode(const Value: TpopMode);
begin
  FMode := Value;
end;

procedure TfrmWTMaintPurchOrders.SetPOrder(const Value: TPOrder);
begin
  FPOrder := Value;
end;

end.
