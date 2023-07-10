unit pbLUSupplierRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUSupplierRpts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnRun: TButton;
    Button2: TButton;
    lstvwReports: TListView;
    procedure Button2Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure lstvwReportsDblClick(Sender: TObject);
  private
    procedure RunReport(TempForm: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUSupplierRpts: TfrmPBLUSupplierRpts;

implementation

uses PBRSSUPCAP, PBRSCAPABILITY, PBRSSUPPDET, PBRSSuppContDet;

{$R *.DFM}

procedure TfrmPBLUSupplierRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUSupplierRpts.btnRunClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmPBLUSupplierRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSSUPCAPFRM' then
  begin
    PBRSSUPCAPFRM := TPBRSSUPCAPFRM.Create(Self);
    try
      PBRSSUPCAPFRM.ShowModal;
    finally
      PBRSSUPCAPFRM.Free;
    end
  end
  else
  if TempForm = 'PBRSCAPABILITYFRM' then
  begin
    PBRSCAPABILITYFRM := TPBRSCAPABILITYFRM.Create(Self);
    try
      PBRSCAPABILITYFRM.ShowModal;
    finally
      PBRSCAPABILITYFRM.Free;
    end
  end
  else
  if TempForm = 'PBRSSUPPDETFRM' then
  begin
    PBRSSUPPDETFRM := TPBRSSUPPDETFRM.Create(Self);
    try
      PBRSSUPPDETFRM.ShowModal;
    finally
      PBRSSUPPDETFRM.Free;
    end
  end
  else
  if TempForm = 'PBRSSUPPCONTDETFRM' then
  begin
    PBRSSUPPCONTDETFRM := TPBRSSUPPCONTDETFRM.Create(Self);
    try
      PBRSSUPPCONTDETFRM.ShowModal;
    finally
      PBRSSUPPCONTDETFRM.Free;
    end
  end;
end;

procedure TfrmPBLUSupplierRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

end.
