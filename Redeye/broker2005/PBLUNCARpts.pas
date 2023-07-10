unit pbLUNCARpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUNCARpts = class(TForm)
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
  frmPBLUNCARpts: TfrmPBLUNCARpts;

implementation

uses PBRSQuoteCust, PBRSQuoteReason, PBRSNCAReason, PBRSNCASource, PBRSNCACostGraph, PBRSNCAClient;

{$R *.DFM}

procedure TfrmPBLUNCARpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUNCARpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUNCARpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSNCAREASONFRM' then
  begin
    PBRSNCAReasonFrm := TPBRSNCAReasonFrm.Create(self);
    try
      PBRSNCAReasonFrm.showmodal;
    finally
      PBRSNCAReasonFrm.free;
    end
  end
  else
  if TempForm = 'PBRSNCASOURCEFRM' then
  begin
    PBRSNCASourceFrm := TPBRSNCASourceFrm.Create(self);
    try
      PBRSNCASourceFrm.showmodal;
    finally
      PBRSNCASourceFrm.free;
    end
  end
  else
  if TempForm = 'PBRSNCACOSTGRAPHFRM' then
  begin
    PBRSNCACostGraphFrm := TPBRSNCACostGraphFrm.Create(self);
    try
      PBRSNCACostGraphFrm.showmodal;
    finally
      PBRSNCACostGraphFrm.free;
    end
  end
  else
  if TempForm = 'PBRSNCACLIENTFRM' then
  begin
    PBRSNCAClientFrm := TPBRSNCAClientFrm.Create(self);
    try
      PBRSNCAClientFrm.showmodal;
    finally
      PBRSNCAClientFrm.free;
    end
  end;

end;

procedure TfrmPBLUNCARpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUNCARpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
