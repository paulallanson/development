unit WTLUQuoteRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, QrCtrls;

type
  TfrmWTLUQuoteRpts = class(TForm)
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
  frmWTLUQuoteRpts: TfrmWTLUQuoteRpts;

implementation

uses WTRSQuotePerf, wtRSOutQuote, WTRSQuoteSalesLead, WTRSQuoteImpLevel, WTRSQuoteDecline,
  wtRSQuoteEvent, wtRSQuoteExpiry;

{$R *.DFM}

procedure TfrmWTLUQuoteRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUQuoteRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUQuoteRpts.RunReport(TempForm: string);
begin
  if TempForm = 'FRMWTRSQUOTEPERF' then
  begin
    frmWTRSQuotePerf := TfrmWTRSQuotePerf.Create(self);
    try
      frmWTRSQuotePerf.showmodal;
    finally
      frmWTRSQuotePerf.free;
    end
  end
  else
  if TempForm = 'FRMWTRSQUOTESALESLEAD' then
  begin
    frmWTRSQuoteSalesLead := TfrmWTRSQuoteSalesLead.Create(self);
    try
      frmWTRSQuoteSalesLead.showmodal;
    finally
      frmWTRSQuoteSalesLead.free;
    end
  end
  else
  if TempForm = 'FRMWTRSQUOTEEVENT' then
  begin
    frmWTRSQuoteEvent := TfrmWTRSQuoteEvent.Create(self);
    try
      frmWTRSQuoteEvent.showmodal;
    finally
      frmWTRSQuoteEvent.free;
    end
  end
  else
  if TempForm = 'FRMWTRSOUTQUOTE' then
  begin
    frmWTRSOutQuote := TfrmWTRSOutQuote.Create(self);
    try
      frmWTRSOutQuote.showmodal;
    finally
      frmWTRSOutQuote.free;
    end
  end
  else
  if TempForm = 'FRMWTRSQUOTEEXPIRY' then
  begin
    frmWTRSQuoteExpiry := TfrmWTRSQuoteExpiry.Create(self);
    try
      frmWTRSQuoteExpiry.showmodal;
    finally
      frmWTRSQuoteExpiry.free;
    end
  end
  else
  if TempForm = 'FRMWTRSQUOTEIMPLEVEL' then
  begin
    frmWTRSQuoteImpLevel := TfrmWTRSQuoteImpLevel.Create(self);
    try
      frmWTRSQuoteImpLevel.showmodal;
    finally
      frmWTRSQuoteImpLevel.free;
    end
  end
  else
  if TempForm = 'FRMWTRSQUOTEDECLINE' then
  begin
    frmWTRSQuoteDecline := TfrmWTRSQuoteDecline.Create(self);
    try
      frmWTRSQuoteDecline.showmodal;
    finally
      frmWTRSQuoteDecline.free;
    end
  end;
end;

procedure TfrmWTLUQuoteRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUQuoteRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
