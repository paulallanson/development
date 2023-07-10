unit pbLUAccMgrRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUAccMgrRpts = class(TForm)
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
  frmPBLUAccMgrRpts: TfrmPBLUAccMgrRpts;

implementation

uses
  PBRSWorkIP, PBRSJobBagExtrasWIP, PBRSSalesByInv, PBRSSalesByPrdCat,
  PBRS4CastMonthInvs, PBRSCustTurn, PBRSPEndCustPerform, PBRSSalesByProd;

{$R *.DFM}

procedure TfrmPBLUAccMgrRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUAccMgrRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUAccMgrRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSWORKIPFRM' then
  begin
    PBRSWorkIPFrm := TPBRSWorkIPFrm.Create(self);
    try
      PBRSWorkIPFrm.showmodal;
    finally
      PBRSWorkIPFrm.free;
    end
  end
  else
  if TempForm = 'PBRSJOBBAGEXTRASWIPFRM' then
  begin
    PBRSJobBagExtrasWIPfrm := TPBRSJobBagExtrasWIPfrm.Create(self);
    try
      PBRSJobBagExtrasWIPfrm.showmodal;
    finally
      PBRSJobBagExtrasWIPfrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDCUSTPERFORMFRM' then
  begin
    PBRSPEndCustPerformfrm := TPBRSPEndCustPerformfrm.Create(self);
    try
      PBRSPEndCustPerformfrm.showmodal;
    finally
      PBRSPEndCustPerformfrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESBYPRDCATFRM' then
  begin
    PBRSSALESBYPRDCATFRM := TPBRSSALESBYPRDCATFRM.Create(self);
    try
      PBRSSALESBYPRDCATFRM.showmodal;
    finally
      PBRSSALESBYPRDCATFRM.free;
    end
  end
  else
  if TempForm = 'PBRSSALESBYPRODFRM' then
  begin
    PBRSSALESBYPRODFRM := TPBRSSALESBYPRODFRM.Create(self);
    try
      PBRSSALESBYPRODFRM.showmodal;
    finally
      PBRSSALESBYPRODFRM.free;
    end
  end
  else
  if TempForm = 'PBRS4CASTMONTHINVSFRM' then
  begin
    PBRS4CASTMONTHINVSFRM := TPBRS4CASTMONTHINVSFRM.Create(self);
    try
      PBRS4CASTMONTHINVSFRM.showmodal;
    finally
      PBRS4CASTMONTHINVSFRM.free;
    end
  end
  else
  if TempForm = 'PBRSSALESBYINVFRM' then
  begin
    PBRSSalesByInvfrm := TPBRSSalesByInvfrm.Create(self);
    try
      PBRSSalesByInvfrm.showmodal;
    finally
      PBRSSalesByInvfrm.free;
    end
  end
  else
  if TempForm = 'PBRSCUSTTURNFRM' then
  begin
    PBRSCustTurnFrm := TPBRSCustTurnFrm.Create(self);
    try
      PBRSCustTurnFrm.showmodal;
    finally
      PBRSCustTurnFrm.free;
    end
  end;

end;

procedure TfrmPBLUAccMgrRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUAccMgrRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
