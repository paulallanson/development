unit pbLUSalesInvRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUSalesInvRpts = class(TForm)
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
  frmPBLUSalesInvRpts: TfrmPBLUSalesInvRpts;

implementation

uses PBRSSalesbyInv, PBRSSalesByProd, PBRSSalesProfit, PBRSCustTurn,
  PBRSSalesComm, PBLUSalesInvStmts, PBLUInvFactoring, PBRSOSSinv,
  PBRSSalesByPrdCat, PBRSRepsPerform, PBRSOSSinvPinvRecd, PBRSOSSinvJobBags,
  PBRSCreditNoteReason, PBRSSalesInvVerif;

{$R *.DFM}

procedure TfrmPBLUSalesInvRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUSalesInvRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUSalesInvRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSSALESBYINVFRM' then
  begin
    PBRSSalesbyInvFRM := TPBRSSalesbyInvFRM.Create(self);
    try
      PBRSSalesbyInvFRM.showmodal;
    finally
      PBRSSalesbyInvFRM.free;
    end
  end
  else
  if TempForm = 'PBRSCREDITNOTEREASONFRM' then
  begin
    PBRSCreditNoteReasonfrm := TPBRSCreditNoteReasonfrm.Create(self);
    try
      PBRSCreditNoteReasonfrm.showmodal;
    finally
      PBRSCreditNoteReasonfrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESINVVERIFFRM' then
  begin
    PBRSSalesInvVeriffrm := TPBRSSalesInvVeriffrm.Create(self);
    try
      PBRSSalesInvVeriffrm.showmodal;
    finally
      PBRSSalesInvVeriffrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESBYPRODFRM' then
  begin
    PBRSSalesbyProdfrm := TPBRSSalesbyProdfrm.Create(self);
    try
      PBRSSalesbyProdfrm.showmodal;
    finally
      PBRSSalesbyProdfrm.free;
    end
  end
  else
  if TempForm = 'PBLUSALESINVSTMTSFRM' then
  begin
    PBLUSalesInvStmtsfrm := TPBLUSalesInvStmtsfrm.Create(self);
    try
      PBLUSalesInvStmtsfrm.showmodal;
    finally
      PBLUSalesInvStmtsfrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESPROFITFRM' then
  begin
    PBRSSalesProfitfrm := TPBRSSalesProfitfrm.Create(self);
    try
      PBRSSalesProfitfrm.showmodal;
    finally
      PBRSSalesProfitfrm.free;
    end
  end
  else
  if TempForm = 'PBRSCUSTTURNFRM' then
  begin
    PBRSCustTurnfrm := TPBRSCustTurnfrm.Create(self);
    try
      PBRSCustTurnfrm.showmodal;
    finally
      PBRSCustTurnfrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESCOMMFRM' then
  begin
    PBRSSalesCommfrm := TPBRSSalesCommfrm.Create(self);
    try
      PBRSSalesCommfrm.showmodal;
    finally
      PBRSSalesCommfrm.free;
    end
  end
  else
  if TempForm = 'PBLUINVFACTORINGFRM' then
  begin
    PBLUInvFactoringfrm := TPBLUInvFactoringfrm.Create(self);
    try
      PBLUInvFactoringfrm.showmodal;
    finally
      PBLUInvFactoringfrm.free;
    end
  end
  else
  if TempForm = 'PBRSSALESBYPRDCATFRM' then
  begin
    PBRSSalesbyPrdCatFrm := TPBRSSalesbyPrdCatFrm.Create(self);
    try
      PBRSSalesbyPrdCatFrm.showmodal;
    finally
      PBRSSalesbyPrdCatFrm.free;
    end
  end
  else
  if TempForm = 'PBRSOSSINVFRM' then
  begin
    PBRSOSSinvfrm := TPBRSOSSinvfrm.Create(self);
    try
      if lstvwReports.selected.index = 5 then
        PBRSOSSInvFrm.bIs_Stock := True
      else
        PBRSOSSInvFrm.bIs_Stock := false;

      PBRSOSSinvfrm.showmodal;
    finally
      PBRSOSSinvfrm.free;
    end
  end
  else
  if TempForm = 'PBRSOSSINVJOBBAGSFRM' then
  begin
    PBRSOSSinvJobBagsfrm := TPBRSOSSinvJobBagsfrm.Create(self);
    try
      PBRSOSSinvJobBagsfrm.showmodal;
    finally
      PBRSOSSinvJobBagsfrm.free;
    end
  end
  else
  if TempForm = 'PBRSOSSINVPINVRECDFRM' then
  begin
    PBRSOSSinvPinvRecdfrm := TPBRSOSSinvPinvRecdfrm.Create(self);
    try
      PBRSOSSinvPinvRecdfrm.showmodal;
    finally
      PBRSOSSinvPinvRecdfrm.free;
    end
  end
  else
  if TempForm = 'PBRSREPSPERFORMFRM' then
  begin
    PBRSRepsPerformfrm := TPBRSRepsPerformfrm.Create(self);
    try
      PBRSRepsPerformfrm.showmodal;
    finally
      PBRSRepsPerformfrm.free;
    end
  end;
end;

procedure TfrmPBLUSalesInvRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUSalesInvRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
