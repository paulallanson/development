unit WTLUSalesInvoiceRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, gtQrCtrls;

type
  TfrmWTLUSalesInvoiceRpts = class(TForm)
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
  frmWTLUSalesInvoiceRpts: TfrmWTLUSalesInvoiceRpts;

implementation

uses WTRSSalesByInvoice, wtRSMaterialAnalysis, WTRSSIPayments, WTRSSalesInvoicePayments;

{$R *.DFM}

procedure TfrmWTLUSalesInvoiceRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUSalesInvoiceRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUSalesInvoiceRpts.RunReport(TempForm: string);
begin
  if TempForm = 'FRMWTRSSALESBYINVOICE' then
  begin
    frmWTRSSalesByInvoice := TfrmWTRSSalesByInvoice.Create(self);
    try
      frmWTRSSalesByInvoice.showmodal;
    finally
      frmWTRSSalesByInvoice.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSIPAYMENTS' then
  begin
    frmWTRSSIPayments := TfrmWTRSSIPayments.Create(self);
    try
      frmWTRSSIPayments.showmodal;
    finally
      frmWTRSSIPayments.free;
    end
  end
  else
  if TempForm = 'FRMWTRSSALESINVOICEPAYMENTS' then
  begin
    frmWTRSSalesInvoicePayments := TfrmWTRSSalesInvoicePayments.Create(self);
    try
      frmWTRSSalesInvoicePayments.showmodal;
    finally
      frmWTRSSalesInvoicePayments.free;
    end
  end
  else
  if TempForm = 'FRMWTRSMATERIALANALYSIS' then
  begin
    frmWTRSMaterialAnalysis := TfrmWTRSMaterialAnalysis.Create(self);
    try
      frmWTRSMaterialAnalysis.ReportType := 'SI';
      frmWTRSMaterialAnalysis.showmodal;
    finally
      frmWTRSMaterialAnalysis.free;
    end
  end;
end;

procedure TfrmWTLUSalesInvoiceRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUSalesInvoiceRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
