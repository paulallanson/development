unit WTLUTemplatingRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, QrCtrls;

type
  TfrmWTLUTemplatingRpts = class(TForm)
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
  frmWTLUTemplatingRpts: TfrmWTLUTemplatingRpts;

implementation

uses WTRSSOrderTemplate, wtRSSOAntInvoice, WTRSSOrderSchedule,
  WTRSSalesOrder, WTRSSOrderAllocation, WTRSMaterialAnalysis, WTRSSOCostAnalysis,
  WTRSSalesOrderInvoice, WTRSSOProduction, WTRSSOAntOrdering, WTRSSOWarranty;

{$R *.DFM}

procedure TfrmWTLUTemplatingRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUTemplatingRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUTemplatingRpts.RunReport(TempForm: string);
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
  if TempForm = 'FRMWTRSSOPRODUCTION' then
  begin
    frmWTRSSOProduction := TfrmWTRSSOProduction.Create(self);
    try
      frmWTRSSOProduction.showmodal;
    finally
      frmWTRSSOProduction.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSALESORDERINVOICE' then
  begin
    frmWTRSSalesOrderInvoice := TfrmWTRSSalesOrderInvoice.Create(self);
    try
      frmWTRSSalesOrderInvoice.showmodal;
    finally
      frmWTRSSalesOrderInvoice.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSALESORDER' then
  begin
    frmWTRSSalesOrder := TfrmWTRSSalesOrder.Create(self);
    try
      frmWTRSSalesOrder.showmodal;
    finally
      frmWTRSSalesOrder.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSOCOSTANALYSIS' then
  begin
    frmWTRSSOCostAnalysis := TfrmWTRSSOCostAnalysis.Create(self);
    try
      frmWTRSSOCostAnalysis.showmodal;
    finally
      frmWTRSSOCostAnalysis.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSORDERALLOCATION' then
  begin
    frmWTRSSOrderAllocation := TfrmWTRSSOrderAllocation.Create(self);
    try
      frmWTRSSOrderAllocation.showmodal;
    finally
      frmWTRSSOrderAllocation.free;
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
  end
  else
  if TempForm = 'FRMWTRSSOANTORDERING' then
  begin
    frmWTRSSOAntOrdering := TfrmWTRSSOAntOrdering.Create(self);
    try
      frmWTRSSOAntOrdering.showmodal;
    finally
      frmWTRSSOAntOrdering.free;
    end
  end
  else
  if TempForm = 'FRMWTRSMATERIALANALYSIS' then
  begin
    frmWTRSMaterialAnalysis := TfrmWTRSMaterialAnalysis.Create(self);
    try
      frmWTRSMaterialAnalysis.ReportType := 'SO';
      frmWTRSMaterialAnalysis.showmodal;
    finally
      frmWTRSMaterialAnalysis.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSOWARRANTY' then
  begin
    frmWTRSSOWarranty := TfrmWTRSSOWarranty.Create(self);
    try
      frmWTRSSOWarranty.showmodal;
    finally
      frmWTRSSOWarranty.free;
    end
  end;
end;

procedure TfrmWTLUTemplatingRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUTemplatingRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
