unit PBLUWorksOrderDelivs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, pbWOrdersDM;

type
  TfrmPBLUWorksOrderDelivs = class(TForm)
    sgDelivs: TStringGrid;
    Panel7: TPanel;
    btnConfirm: TBitBtn;
    btnDeleteDelivs: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure btnDeleteDelivsClick(Sender: TObject);
    procedure sgDelivsDblClick(Sender: TObject);
  private
    FActivated: boolean;
    FWOrder: TWOrder;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure SetGridHeaders;
    procedure ShowDeliveries;
    procedure BuildDeliveryGrid;
    procedure SetWOrder(const Value: TWOrder);
    { Private declarations }
  public
    OKrefresh: boolean;
    property WOrder : TWOrder read FWOrder write SetWOrder;
  end;

var
  frmPBLUWorksOrderDelivs: TfrmPBLUWorksOrderDelivs;

implementation

uses CCSCommon, PBMaintWOrderConfDelivs;

{$R *.dfm}

procedure TfrmPBLUWorksOrderDelivs.FormCreate(Sender: TObject);
begin
  SetGridHeaders;
end;

procedure TfrmPBLUWorksOrderDelivs.SetGridHeaders;
begin
  {Extras header}
  sgDelivs.cells[0,0] := 'No';
  sgDelivs.cells[1,0] := 'Courier';
  sgDelivs.cells[2,0] := 'Service';
  sgDelivs.cells[3,0] := 'Quantity';
  sgDelivs.cells[4,0] := 'Date';
  sgDelivs.cells[5,0] := 'Weight';
  sgDelivs.cells[6,0] := 'Date Delivered';
end;

procedure TfrmPBLUWorksOrderDelivs.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      OKrefresh := false;
      ShowDeliveries;
      FActivated := true;
    end;
end;

procedure TfrmPBLUWorksOrderDelivs.ShowDeliveries;
begin
  ClearGrid(sgDelivs);  {Clear contents of Line grid}
  BuildDeliveryGrid;
end;

procedure TfrmPBLUWorksOrderDelivs.BuildDeliveryGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgDelivs, WOrder.datamodule do
    begin
      for i := 0 to pred(WOrder.Deliveries.count) do
        begin
        cells[0,i+1] := inttostr(WOrder.Deliveries[i].DelivNumber);
        cells[1,i+1] := WOrder.Deliveries[i].CourierName;
        cells[2,i+1] := WOrder.Deliveries[i].ServiceDescr;
        cells[3,i+1] := inttostr(WOrder.Deliveries[i].Quantity);
        cells[4,i+1] := pbdatestr(WOrder.Deliveries[i].DelivDate);
        cells[5,i+1] := inttostr(WOrder.Deliveries[i].weight);
        cells[6,i+1] := pbdatestr(WOrder.Deliveries[i].DelivDateAct);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnConfirm.enabled := not (WOrder.Deliveries.count = 0);
end;

procedure TfrmPBLUWorksOrderDelivs.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    rowcount := 2;
    end;
end;

procedure TfrmPBLUWorksOrderDelivs.SetWOrder(const Value: TWOrder);
begin
  FWOrder := Value;
end;

procedure TfrmPBLUWorksOrderDelivs.btnConfirmClick(Sender: TObject);
var
  inx: integer;
  frm: TfrmPBMaintWOrderConfDelivs;
  WODeliv: TWODeliv;
begin
  inx := sgDelivs.row;
  frm := TfrmPBMaintWOrderConfDelivs.Create(Self);
  try
    inx := WOrder.Deliveries.IndexOf(inx);
    WODeliv := WOrder.Deliveries[inx];

    Frm.WODeliv := WODeliv;
    Frm.Mode := wodelChange;

    Frm.ShowModal;
    if Frm.ModalResult = mrOK then
      begin
        OKRefresh := true;
        ShowDeliveries;
        sgDelivs.row := inx+1;
      end;
  finally
    Frm.Free;
  end;
end;

procedure TfrmPBLUWorksOrderDelivs.btnDeleteDelivsClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUWorksOrderDelivs.sgDelivsDblClick(Sender: TObject);
begin
  btnConfirmClick(self);
end;

end.
