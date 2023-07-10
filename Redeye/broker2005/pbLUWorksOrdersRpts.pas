unit pbLUWorksOrdersRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUWorksOrdersRpts = class(TForm)
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
  frmPBLUWorksOrdersRpts: TfrmPBLUWorksOrdersRpts;

implementation

uses PBRSWIDespatch;

{$R *.DFM}

procedure TfrmPBLUWorksOrdersRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUWorksOrdersRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUWorksOrdersRpts.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSWIDESPATCHFRM' then
  begin
    PBRSWIDespatchFrm := TPBRSWIDespatchFrm.Create(Self);
    try
      PBRSWIDespatchFrm.ShowModal;
    finally
      PBRSWIDespatchFrm.Free;
    end
  end;
end;

procedure TfrmPBLUWorksOrdersRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUWorksOrdersRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
