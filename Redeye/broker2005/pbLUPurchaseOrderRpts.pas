unit pbLUPurchaseOrderRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUPurchaseOrderRpts = class(TForm)
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
  frmPBLUPurchaseOrderRpts: TfrmPBLUPurchaseOrderRpts;

implementation

uses STRSPord;

{$R *.DFM}

procedure TfrmPBLUPurchaseOrderRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUPurchaseOrderRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUPurchaseOrderRpts.RunReport(TempForm: string);
begin
  if TempForm = 'STRSPORDFRM' then
  begin
    STRSPordFrm := TSTRSPordFrm.Create(Self);
    try
      STRSPordFrm.ShowModal;
    finally
      STRSPordFrm.Free;
    end
  end;
end;

procedure TfrmPBLUPurchaseOrderRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUPurchaseOrderRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
