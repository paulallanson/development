unit WTLUPOrderRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, QrCtrls;

type
  TfrmWTLUPOrderRpts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnselect: TButton;
    Button2: TButton;
    lstvwReports: TListView;
    procedure Button2Click(Sender: TObject);
    procedure btnselectClick(Sender: TObject);
    procedure lstvwReportsDblClick(Sender: TObject);
    procedure enableSelect(Sender: TObject);
  private
    procedure RunReport(TempForm: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUPOrderRpts: TfrmWTLUPOrderRpts;

implementation

uses WTRSPurchaseOrder, WTRSPOOrdersDue, WTRSPOrdersOutstanding;

{$R *.DFM}

procedure TfrmWTLUPOrderRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUPOrderRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUPOrderRpts.RunReport(TempForm: string);
begin
  if TempForm = 'FRMWTRSPURCHASEORDER' then
  begin
    frmWTRSPurchaseOrder := TfrmWTRSPurchaseOrder.Create(self);
    try
      frmWTRSPurchaseOrder.showmodal;
    finally
      frmWTRSPurchaseOrder.free;
    end
  end
  else
  if TempForm = 'FRMWTRSPOORDERSDUE' then
  begin
    frmWTRSPOOrdersDue := TfrmWTRSPOOrdersDue.Create(self);
    try
      frmWTRSPOOrdersDue.showmodal;
    finally
      frmWTRSPOOrdersDue.free;
    end
  end
  else
  if TempForm = 'FRMWTRSPORDERSOUTSTANDING' then
  begin
    frmWTRSPOrdersOutstanding := TfrmWTRSPOrdersOutstanding.Create(self);
    try
      frmWTRSPOrdersOutstanding.showmodal;
    finally
      frmWTRSPOrdersOutstanding.free;
    end
  end;
end;

procedure TfrmWTLUPOrderRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUPOrderRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
