unit pbLUPurchaseInvoiceRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUPurchaseInvoiceRpts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnRun: TButton;
    Button2: TButton;
    lstvwReports: TListView;
    procedure Button2Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure lstvwReportsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    iLastIndex: integer;
    procedure RunReport(TempForm: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUPurchaseInvoiceRpts: TfrmPBLUPurchaseInvoiceRpts;

implementation

uses PBRSPurchInv, PBRSPurchByInv, PBRSSupplierTurn;

{$R *.DFM}

procedure TfrmPBLUPurchaseInvoiceRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUPurchaseInvoiceRpts.btnRunClick(Sender: TObject);
var
  sTemp: string;
begin
  try
    sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
    iLastIndex := lstvwReports.itemindex;
  except
    sTemp := lstvwReports.items.item[iLastIndex].SubItems[0];
  end;

  RunReport(sTemp);
end;

procedure TfrmPBLUPurchaseInvoiceRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSPURCHINVFRM' then
  begin
    PBRSPurchInvFrm := TPBRSPurchInvFrm.Create(Self);
    try
      PBRSPurchInvFrm.ShowModal;
    finally
      PBRSPurchInvFrm.Free;
    end
  end
  else
  if TempForm = 'PBRSPURCHBYINVFRM' then
  begin
    PBRSPurchByInvFrm := TPBRSPurchByInvFrm.Create(Self);
    try
      PBRSPurchByInvFrm.ShowModal;
    finally
      PBRSPurchByInvFrm.Free;
    end
  end
  else
  if TempForm = 'PBRSSUPPLIERTURNFRM' then
  begin
    PBRSSupplierTurnFrm := TPBRSSupplierTurnFrm.Create(Self);
    try
      PBRSSupplierTurnFrm.ShowModal;
    finally
      PBRSSupplierTurnFrm.Free;
    end
  end;

end;

procedure TfrmPBLUPurchaseInvoiceRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUPurchaseInvoiceRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
