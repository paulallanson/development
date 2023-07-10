unit WTLUPOrderSalesOrders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, ExtCtrls;

type
  TfrmWTLUPOrderSalesOrders = class(TForm)
    Panel3: TPanel;
    Label3: TLabel;
    dtTransaction: TDateTimePicker;
    sgdetails: TStringGrid;
    Panel2: TPanel;
    Label2: TLabel;
    edtSearch: TEdit;
    btbtnClose: TBitBtn;
    btnOK: TBitBtn;
    stsbrDetails: TStatusBar;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUPOrderSalesOrders: TfrmWTLUPOrderSalesOrders;

implementation

{$R *.dfm}

end.
