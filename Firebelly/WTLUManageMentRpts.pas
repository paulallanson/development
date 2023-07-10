unit WTLUManageMentRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, gtQrCtrls;

type
  TfrmWTLUManagementRpts = class(TForm)
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
  frmWTLUManagementRpts: TfrmWTLUManagementRpts;

implementation

uses WTRSSOrderTemplate, wtRSSOAntInvoice, WTRSSOrderSchedule, WTRSOutJobs;

{$R *.DFM}

procedure TfrmWTLUManagementRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUManagementRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUManagementRpts.RunReport(TempForm: string);
begin
  if TempForm = 'FRMWTRSSORDERTEMPLATE' then
  begin
    frmWTRSSOrderTemplate := TfrmWTRSSOrderTemplate.Create(self);
    try
      frmWTRSSOrderTemplate.showmodal;
    finally
      frmWTRSSOrderTemplate.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSORDERSCHEDULE' then
  begin
    frmWTRSSOrderSchedule := TfrmWTRSSOrderSchedule.Create(self);
    try
      frmWTRSSOrderSchedule.showmodal;
    finally
      frmWTRSSOrderSchedule.free;
    end
  end
  else
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
  if TempForm = 'FRMWTRSSOANTINVOICE' then
  begin
    frmWTRSSOAntInvoice := TfrmWTRSSOAntInvoice.Create(self);
    try
      frmWTRSSOAntInvoice.showmodal;
    finally
      frmWTRSSOAntInvoice.free;
    end
  end;
end;

procedure TfrmWTLUManagementRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUManagementRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
