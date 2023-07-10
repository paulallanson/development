unit pbLUProductionRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUProductionRpts = class(TForm)
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
  frmPBLUProductionRpts: TfrmPBLUProductionRpts;

implementation

uses PBRSProdAmends, PBRSProdWeekly, PBLUJobLog;

{$R *.DFM}

procedure TfrmPBLUProductionRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUProductionRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUProductionRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSPRODAMENDSFRM' then
  begin
    PBRSProdAmendsFrm := TPBRSProdAmendsFrm.Create(self);
    try
      PBRSProdAmendsFrm.showmodal;
    finally
      PBRSProdAmendsFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPRODWEEKLYFRM' then
  begin
    PBRSProdWeeklyfrm := TPBRSProdWeeklyfrm.Create(self);
    try
      PBRSProdWeeklyfrm.showmodal;
    finally
      PBRSProdWeeklyfrm.free;
    end
  end
  else
  if TempForm = 'PBLUJOBLOGFRM' then
  begin
    PBLUJobLogfrm := TPBLUJobLogfrm.Create(self);
    try
      PBLUJobLogfrm.showmodal;
    finally
      PBLUJobLogfrm.free;
    end
  end;

end;

procedure TfrmPBLUProductionRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUProductionRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
