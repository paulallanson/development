unit WTLUJobRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, gtQrCtrls;

type
  TfrmWTLUJobRpts = class(TForm)
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
  frmWTLUJobRpts: TfrmWTLUJobRpts;

implementation

uses wtRSOutJobs, wtRSJobValue, WTRSJobRemedials, WTRSRemedialType;

{$R *.DFM}

procedure TfrmWTLUJobRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUJobRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUJobRpts.RunReport(TempForm: string);
begin
  if TempForm = 'FRMWTRSOUTJOBS' then
  begin
    frmWTRSOutJobs := TfrmWTRSOutJobs.Create(self);
    try
      frmWTRSOutJobs.showmodal;
    finally
      frmWTRSOutJobs.free;
    end
  end
  else
  if TempForm = 'FRMWTRSJOBVALUE' then
  begin
    frmWTRSJobValue := TfrmWTRSJobValue.Create(self);
    try
      frmWTRSJobValue.showmodal;
    finally
      frmWTRSJobValue.free;
    end
  end
  else
  if TempForm = 'FRMWTRSJOBREMEDIALS' then
  begin
    frmWTRSJobRemedials := TfrmWTRSJobRemedials.Create(self);
    try
      frmWTRSJobRemedials.showmodal;
    finally
      frmWTRSJobRemedials.free;
    end
  end
  else
  if TempForm = 'FRMWTRSREMEDIALTYPE' then
  begin
    frmWTRSRemedialType := TfrmWTRSRemedialType.Create(self);
    try
      frmWTRSRemedialType.showmodal;
    finally
      frmWTRSRemedialType.free;
    end
  end;
end;

procedure TfrmWTLUJobRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUJobRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
