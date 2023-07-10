unit WTLUCustomerRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, gtQrCtrls;

type
  TfrmWTLUCustomerRpts = class(TForm)
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
  frmWTLUCustomerRpts: TfrmWTLUCustomerRpts;

implementation

uses wtRSCustomerAction, WTRSCustomerActivity, WTRSCustContDet,
  WTRSRetailAddress;

{$R *.DFM}

procedure TfrmWTLUCustomerRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUCustomerRpts.btnselectClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmWTLUCustomerRpts.RunReport(TempForm: string);
begin
  if TempForm = 'FRMWTRSCUSTOMERACTION' then
  begin
    frmWTRSCustomerAction := TfrmWTRSCustomerAction.Create(self);
    try
      frmWTRSCustomerAction.showmodal;
    finally
      frmWTRSCustomerAction.free;
    end
  end
  else
  if TempForm = 'FRMWTRSCUSTOMERACTIVITY' then
  begin
    frmWTRSCustomerActivity := TfrmWTRSCustomerActivity.Create(self);
    try
      frmWTRSCustomerActivity.showmodal;
    finally
      frmWTRSCustomerActivity.free;
    end
  end
  else
  if TempForm = 'FRMWTRSRETAILADDRESS' then
  begin
    frmWTRSRetailAddress := TfrmWTRSRetailAddress.Create(self);
    try
      frmWTRSRetailAddress.showmodal;
    finally
      frmWTRSRetailAddress.free;
    end
  end
  else
  if TempForm = 'FRMWTRSCUSTCONTDET' then
  begin
    frmWTRSCustContDet := TfrmWTRSCustContDet.Create(self);
    try
      frmWTRSCustContDet.showmodal;
    finally
      frmWTRSCustContDet.free;
    end
  end;

end;

procedure TfrmWTLUCustomerRpts.enableSelect(Sender: TObject);
begin
  btnSelect.enabled := (lstvwReports.SelCount > 0);
end;

procedure TfrmWTLUCustomerRpts.lstvwReportsDblClick(Sender: TObject);
begin
  if (lstvwReports.SelCount > 0) then
    btnSelectClick(self);
end;

end.
