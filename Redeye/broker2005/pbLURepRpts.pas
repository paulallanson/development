unit pbLURepRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLURepRpts = class(TForm)
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
  frmPBLURepRpts: TfrmPBLURepRpts;

implementation

uses
  PBRSWorkIP, PBRSJobBagExtrasWIP, PBRSPEndRepsCommission, PBRSPEndRepsPerform,
  PBRSSalesComm, PBRSSalesByInv;

{$R *.DFM}

procedure TfrmPBLURepRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLURepRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLURepRpts.RunReport(TempForm: string);
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
  if TempForm = 'PBRSSALESCOMMFRM' then
  begin
    PBRSSalesCommFrm := TPBRSSalesCommFrm.Create(self);
    try
      PBRSSalesCommFrm.showmodal;
    finally
      PBRSSalesCommFrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDREPSPERFORMFRM' then
  begin
    PBRSPEndRepsPerformfrm := TPBRSPEndRepsPerformfrm.Create(self);
    try
      PBRSPEndRepsPerformfrm.showmodal;
    finally
      PBRSPEndRepsPerformfrm.free;
    end
  end
  else
  if TempForm = 'PBRSPENDREPSCOMMISSIONFRM' then
  begin
    PBRSPEndRepsCommissionfrm := TPBRSPEndRepsCommissionfrm.Create(self);
    try
      PBRSPEndRepsCommissionfrm.showmodal;
    finally
      PBRSPEndRepsCommissionfrm.free;
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
  end;

end;

procedure TfrmPBLURepRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLURepRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
