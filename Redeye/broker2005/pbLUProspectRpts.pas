unit pbLUProspectRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUProspectRpts = class(TForm)
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
  frmPBLUProspectRpts: TfrmPBLUProspectRpts;

implementation

uses PBRSCustContDet, PBRSCustDet;

{$R *.DFM}

procedure TfrmPBLUProspectRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUProspectRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUProspectRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSCUSTCONTDETFRM' then
  begin
    PBRSCustContDetFrm := TPBRSCustContDetFrm.Create(self);
    try
      PBRSCustContDetFrm.Prospects := true;
      PBRSCustContDetFrm.showmodal;
    finally
      PBRSCustContDetFrm.free;
    end
  end
  else
  if TempForm = 'PBRSCUSTDETFRM' then
  begin
    PBRSCustDetFrm := TPBRSCustDetFrm.Create(self);
    try
      PBRSCustDetFrm.Prospects := true;
      PBRSCustDetFrm.showmodal;
    finally
      PBRSCustDetFrm.free;
    end
  end;
end;

procedure TfrmPBLUProspectRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUProspectRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
