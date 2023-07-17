unit WTLUContractsRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, QrCtrls;

type
  TfrmWTLUContractRpts = class(TForm)
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
  frmWTLUContractRpts: TfrmWTLUContractRpts;

implementation

uses WTRSContractQuote, WTRSContractDetails, WTRSContractOrders;

{$R *.DFM}

procedure TfrmWTLUContractRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUContractRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUContractRpts.RunReport(TempForm: string);
begin
  if TempForm = 'FRMWTRSCONTRACTQUOTE' then
  begin
    frmWTRSContractQuote := TfrmWTRSContractQuote.Create(self);
    try
      frmWTRSContractQuote.showmodal;
    finally
      frmWTRSContractQuote.free;
    end
  end
  else
  if TempForm = 'FRMWTRSCONTRACTDETAILS' then
  begin
    frmWTRSContractDetails := TfrmWTRSContractDetails.Create(self);
    try
      frmWTRSContractDetails.showmodal;
    finally
      frmWTRSContractDetails.free;
    end
  end
  else
  if TempForm = 'FRMWTRSCONTRACTORDERS' then
  begin
    frmWTRSContractOrders := TfrmWTRSContractOrders.Create(self);
    try
      frmWTRSContractOrders.showmodal;
    finally
      frmWTRSContractOrders.free;
    end
  end;
end;

procedure TfrmWTLUContractRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUContractRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
