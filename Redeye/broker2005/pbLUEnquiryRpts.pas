unit pbLUEnquiryRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUEnquiryRpts = class(TForm)
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
  frmPBLUEnquiryRpts: TfrmPBLUEnquiryRpts;

implementation

uses PBRSODueQte, PBRSODueEnq, PBRSEnqSel, PBRSEnq, PBRSQuo, PBRSEnqSuppComp;

{$R *.DFM}

procedure TfrmPBLUEnquiryRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUEnquiryRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUEnquiryRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSODUEQTEFRM' then
  begin
    PBRSODueQteFrm := TPBRSODueQteFrm.Create(self);
    try
      PBRSODueQteFrm.showmodal;
    finally
      PBRSODueQteFrm.free;
    end
  end
  else
  if TempForm = 'PBRSODUEENQFRM' then
  begin
    PBRSODueEnqFrm := TPBRSODueEnqFrm.Create(self);
    try
      PBRSODueEnqFrm.showmodal;
    finally
      PBRSODueEnqFrm.free;
    end
  end
  else
  if TempForm = 'PBRSENQSELFRM' then
  begin
    PBRSEnqSelFrm := TPBRSEnqSelFrm.Create(self);
    try
      PBRSEnqSelFrm.showmodal;
    finally
      PBRSEnqSelFrm.free;
    end
  end
  else
  if TempForm = 'PBRSENQFRM' then
  begin
    PBRSEnqFrm := TPBRSEnqFrm.Create(self);
    try
      PBRSEnqFrm.showmodal;
    finally
      PBRSEnqFrm.free;
    end
  end
  else
  if TempForm = 'PBRSQUOFRM' then
  begin
    PBRSQuoFrm := TPBRSQuoFrm.Create(self);
    try
      PBRSQuoFrm.showmodal;
    finally
      PBRSQuoFrm.free;
    end
  end
  else
  if TempForm = 'PBRSENQSUPPCOMPFRM' then
  begin
    PBRSEnqSuppCompFrm := TPBRSEnqSuppCompFrm.Create(self);
    try
      PBRSEnqSuppCompFrm.showmodal;
    finally
      PBRSEnqSuppCompFrm.free;
    end
  end;
end;

procedure TfrmPBLUEnquiryRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUEnquiryRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
