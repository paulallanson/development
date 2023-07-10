unit pbLUJobRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUJobRpts = class(TForm)
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
  frmPBLUJobRpts: TfrmPBLUJobRpts;

implementation

uses PBRSPOnotonJB, PBRSJBMargin, PBRSJobBagWIP, PBRSJobBagExtrasWIP, STRSSOReturns,PBRSDataServsWIP,
  PBRSJobBagWIPStkReq, PBRSJobBagOvers, PBRSJobBagComplete;

{$R *.DFM}

procedure TfrmPBLUJobRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUJobRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUJobRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSPONOTONJBFRM' then
  begin
    PBRSPOnotonJBFrm := TPBRSPOnotonJBFrm.Create(self);
    try
      PBRSPOnotonJBFrm.showmodal;
    finally
      PBRSPOnotonJBFrm.free;
    end
  end
  else
  if TempForm = 'PBRSDATASERVSWIPFRM' then
  begin
    PBRSDataServsWIPFrm := TPBRSDataServsWIPFrm.Create(self);
    try
      PBRSDataServsWIPFrm.showmodal;
    finally
      PBRSDataServsWIPFrm.free;
    end
  end
  else
  if TempForm = 'PBRSJOBBAGOVERSFRM' then
  begin
    PBRSJobBagOversFrm := TPBRSJobBagOversFrm.Create(self);
    try
      PBRSJobBagOversFrm.showmodal;
    finally
      PBRSJobBagOversFrm.free;
    end
  end
  else
  if TempForm = 'PBRSJOBBAGWIPSTKREQFRM' then
  begin
    PBRSJobBagWIPStkReqfrm := TPBRSJobBagWIPStkReqfrm.Create(self);
    try
      PBRSJobBagWIPStkReqfrm.showmodal;
    finally
      PBRSJobBagWIPStkReqfrm.free;
    end
  end
  else
  if TempForm = 'PBRSJBMARGINFRM' then
  begin
    PBRSJBMarginFrm := TPBRSJBMarginFrm.Create(self);
    try
      PBRSJBMarginFrm.showmodal;
    finally
      PBRSJBMarginFrm.free;
    end
  end
  else
  if TempForm = 'PBRSJOBBAGWIPFRM' then
  begin
    PBRSJobBagWIPFrm := TPBRSJobBagWIPFrm.Create(self);
    try
      PBRSJobBagWIPFrm.showmodal;
    finally
      PBRSJobBagWIPFrm.free;
    end
  end
  else
  if TempForm = 'STRSSORETURNSFRM' then
  begin
    STRSSOReturnsfrm := TSTRSSOReturnsfrm.Create(self);
    try
      STRSSOReturnsfrm.showmodal;
    finally
      STRSSOReturnsfrm.free;
    end
  end
  else
  if TempForm = 'PBRSJOBBAGEXTRASWIPFRM' then
  begin
    PBRSJobBagExtrasWIPFrm := TPBRSJobBagExtrasWIPFrm.Create(self);
    try
      PBRSJobBagExtrasWIPFrm.showmodal;
    finally
      PBRSJobBagExtrasWIPFrm.free;
    end
  end
  else
  if TempForm = 'PBRSJOBBAGCOMPLETEFRM' then
  begin
    PBRSJobBagCompleteFrm := TPBRSJobBagCompleteFrm.Create(self);
    try
      PBRSJobBagCompleteFrm.showmodal;
    finally
      PBRSJobBagCompleteFrm.free;
    end
  end;
end;

procedure TfrmPBLUJobRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUJobRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
