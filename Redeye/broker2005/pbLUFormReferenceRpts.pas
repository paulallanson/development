unit pbLUFormReferenceRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUFormReferenceRpts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnRun: TButton;
    Button2: TButton;
    lstvwReports: TListView;
    procedure Button2Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure lstvwReportsDblClick(Sender: TObject);
  private
    procedure RunReport(TempForm: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUFormReferenceRpts: TfrmPBLUFormReferenceRpts;

implementation

uses PBRSStkRec, PBRSStkMove, PBRSStkBal, PBRSStkHold, PBRSStkVal;

{$R *.DFM}

procedure TfrmPBLUFormReferenceRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUFormReferenceRpts.btnRunClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmPBLUFormReferenceRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSSTKRECFRM' then
  begin
    PBRSStkRecFrm := TPBRSStkRecFrm.Create(self);
    try
      PBRSStkRecFrm.showmodal;
    finally
      PBRSStkRecFrm.free;
    end
  end
  else
  if TempForm = 'PBRSSTKMOVEFRM' then
  begin
    PBRSStkMoveFrm := TPBRSStkMoveFrm.Create(self);
    try
      PBRSStkMoveFrm.showmodal;
    finally
      PBRSStkMoveFrm.free;
    end
  end
  else
  if TempForm = 'PBRSSTKBALFRM' then
  begin
    PBRSStkBalFrm := TPBRSStkBalFrm.Create(self);
    try
      PBRSStkBalFrm.showmodal;
    finally
      PBRSStkBalFrm.free;
    end
  end
  else
  if TempForm = 'PBRSSTKHOLDFRM' then
  begin
    PBRSStkHoldFrm := TPBRSStkHoldFrm.Create(self);
    try
      PBRSStkHoldFrm.showmodal;
    finally
      PBRSStkHoldFrm.free;
    end
  end
  else
  if TempForm = 'PBRSSTKVALFRM' then
  begin
    PBRSStkValFrm := TPBRSStkValFrm.Create(self);
    try
      PBRSStkValFrm.showmodal;
    finally
      PBRSStkValFrm.free;
    end
  end;
end;

procedure TfrmPBLUFormReferenceRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

end.
