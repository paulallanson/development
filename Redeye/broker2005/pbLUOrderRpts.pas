unit pbLUOrderRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUOrderRpts = class(TForm)
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
  frmPBLUOrderRpts: TfrmPBLUOrderRpts;

implementation

uses PBRSPODUE, PBRSPOREP, PBRSPOREPM, PBRSWORKIP, PBRS4CastInvs, PBRS4CASTSUMM,
  PBRSPORD, PBRSRptOrds, PBRSProofStatus, PBRSCustCatKPI, PBRSPOAuth, PBRSFSCClaim;

{$R *.DFM}

procedure TfrmPBLUOrderRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUOrderRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUOrderRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSPODUEFRM' then
  begin
    PBRSPODUEFRM := TPBRSPODUEFRM.Create(self);
    try
      PBRSPODUEFRM.showmodal;
    finally
      PBRSPODUEFRM.free;
    end
  end
  else
  if TempForm = 'PBRSCUSTCATKPIFRM' then
  begin
    PBRSCUSTCATKPIFRM := TPBRSCUSTCATKPIFRM.Create(self);
    try
      PBRSCUSTCATKPIFRM.showmodal;
    finally
      PBRSCUSTCATKPIFRM.free;
    end
  end
  else
  if TempForm = 'PBRSPOAUTHFRM' then
  begin
    PBRSPOAUTHFRM := TPBRSPOAUTHFRM.Create(self);
    try
      PBRSPOAUTHFRM.showmodal;
    finally
      PBRSPOAUTHFRM.free;
    end
  end
  else
  if TempForm = 'PBRSFSCCLAIMFRM' then
  begin
    PBRSFSCClaimfrm := TPBRSFSCClaimfrm.Create(self);
    try
      PBRSFSCClaimfrm.showmodal;
    finally
      PBRSFSCClaimfrm.free;
    end
  end
  else
  if TempForm = 'PBRSPOREPFRM' then
  begin
    PBRSPOREPFRM := TPBRSPOREPFRM.Create(self);
    try
      PBRSPOREPFRM.showmodal;
    finally
      PBRSPOREPFRM.free;
    end
  end
  else
  if TempForm = 'PBRSPOREPMFRM' then
  begin
    PBRSPOREPMFRM := TPBRSPOREPMFRM.Create(self);
    try
      PBRSPOREPMFRM.showmodal;
    finally
      PBRSPOREPMFRM.free;
    end
  end
  else
  if TempForm = 'PBRSWORKIPFRM' then
  begin
    PBRSWorkIPfrm := TPBRSWORKIPFRM.Create(self);
    try
      PBRSWORKIPFRM.showmodal;
    finally
      PBRSWORKIPFRM.free;
    end
  end
  else
  if TempForm = 'PBRS4CASTSUMMFRM' then
  begin
    PBRS4CastSummfrm := TPBRS4CastSummfrm.Create(self);
    try
      PBRS4CastSummfrm.showmodal;
    finally
      PBRS4CastSummfrm.free;
    end
  end
  else
  if TempForm = 'PBRS4CASTINVSFRM' then
  begin
    PBRS4CASTINVSFRM := TPBRS4CASTINVSFRM.Create(self);
    try
      PBRS4CASTINVSFRM.showmodal;
    finally
      PBRS4CASTINVSFRM.free;
    end
  end
  else
  if TempForm = 'PBRSRPTORDSFRM' then
  begin
    PBRSRPTORDSFRM := TPBRSRPTORDSFRM.Create(self);
    try
      PBRSRPTORDSFRM.showmodal;
    finally
      PBRSRPTORDSFRM.free;
    end
  end
  else
  if TempForm = 'PBRSPROOFSTATUSFRM' then
  begin
    PBRSProofStatusFrm := TPBRSProofStatusFrm.Create(Self);
    try
      PBRSProofStatusFrm.ShowModal;
    finally
      PBRSProofStatusFrm.Free;
    end
  end
  else
  if TempForm = 'PBRSPORDFRM' then
  begin
    PBRSPORDFRM := TPBRSPORDFRM.Create(self);
    try
      PBRSPORDFRM.showmodal;
    finally
      PBRSPORDFRM.free;
    end
  end
;
end;

procedure TfrmPBLUOrderRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUOrderRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
