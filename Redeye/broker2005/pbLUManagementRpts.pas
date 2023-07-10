unit pbLUManagementRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUManagementRpts = class(TForm)
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
  frmPBLUManagementRpts: TfrmPBLUManagementRpts;

implementation

uses PBRSPEndRepsPerform, PBRSPEndRepsProfit, PBRSPEndCustPerform,
  PBRSPEndRepsCommission, PBRS4CastMonthInvs, PBRSSalesInvStats,
  PBRSPEndLocPerform, PBRSPEndCatPerform, PBRSSalesInvCost,
  PBRSPEndRepTeamPerform;

{$R *.DFM}

procedure TfrmPBLUManagementRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUManagementRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUManagementRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSPENDREPSPERFORMFRM' then
  begin
    PBRSPEndRepsPerformFrm := TPBRSPEndRepsPerformFrm.Create(self);
    try
      PBRSPEndRepsPerformFrm.showmodal;
    finally
      PBRSPEndRepsPerformFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDREPTEAMPERFORMFRM' then
  begin
    PBRSPEndRepTeamPerformFrm := TPBRSPEndRepTeamPerformFrm.Create(self);
    try
      PBRSPEndRepTeamPerformFrm.showmodal;
    finally
      PBRSPEndRepTeamPerformFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDCATPERFORMFRM' then
  begin
    PBRSPEndCatPerformFrm := TPBRSPEndCatPerformFrm.Create(self);
    try
      PBRSPEndCatPerformFrm.showmodal;
    finally
      PBRSPEndCatPerformFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDLOCPERFORMFRM' then
  begin
    PBRSPEndLocPerformFrm := TPBRSPEndLocPerformFrm.Create(self);
    try
      PBRSPEndLocPerformFrm.showmodal;
    finally
      PBRSPEndLocPerformFrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESINVSTATSFRM' then
  begin
    PBRSSalesInvStatsFrm := TPBRSSalesInvStatsFrm.Create(self);
    try
      PBRSSalesInvStatsFrm.showmodal;
    finally
      PBRSSalesInvStatsFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDREPSPROFITFRM' then
  begin
    PBRSPEndRepsProfitFrm := TPBRSPEndRepsProfitFrm.Create(self);
    try
      PBRSPEndRepsProfitFrm.showmodal;
    finally
      PBRSPEndRepsProfitFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDCUSTPERFORMFRM' then
  begin
    PBRSPEndCustPerformFrm := TPBRSPEndCustPerformFrm.Create(self);
    try
      PBRSPEndCustPerformFrm.showmodal;
    finally
      PBRSPEndCustPerformFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDREPSCOMMISSIONFRM' then
  begin
    PBRSPEndRepsCommissionFrm := TPBRSPEndRepsCommissionFrm.Create(self);
    try
      PBRSPEndRepsCommissionFrm.showmodal;
    finally
      PBRSPEndRepsCommissionFrm.free;
    end
  end
  else
  if TempForm = 'PBRS4CASTMONTHINVSFRM' then
  begin
    PBRS4CastMonthInvsFrm := TPBRS4CastMonthInvsFrm.Create(self);
    try
      PBRS4CastMonthInvsFrm.showmodal;
    finally
      PBRS4CastMonthInvsFrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESINVCOSTFRM' then
  begin
    PBRSSalesInvCostFrm := TPBRSSalesInvCostFrm.Create(self);
    try
      PBRSSalesInvCostFrm.showmodal;
    finally
      PBRSSalesInvCostFrm.free;
    end
  end;

end;

procedure TfrmPBLUManagementRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUManagementRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
