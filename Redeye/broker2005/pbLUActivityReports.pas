unit pbLUActivityReports;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUActivityReports = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnRun: TButton;
    Button2: TButton;
    lstvwReports: TListView;
    procedure Button2Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure lstvwReportsDblClick(Sender: TObject);
  private
    iLastIndex: integer;
    procedure RunReport(TempForm: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUActivityReports: TfrmPBLUActivityReports;

implementation

uses PBRSActivityCust;

{$R *.DFM}

procedure TfrmPBLUActivityReports.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUActivityReports.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUActivityReports.RunReport(TempForm: string);
begin
  if TempForm = 'PBRSACTIVITYCUSTFRM' then
  begin
    PBRSActivityCustFrm := TPBRSActivityCustFrm.Create(self);
    try
      PBRSActivityCustFrm.showmodal;
    finally
      PBRSActivityCustFrm.free;
    end
  end;
(*
  else
  if TempForm = 'PBRSQUOTEREASONFRM' then
  begin
    PBRSQuoteReasonFrm := TPBRSQuoteReasonFrm.Create(self);
    try
      PBRSQuoteReasonFrm.showmodal;
    finally
      PBRSQuoteReasonFrm.free;
    end
  end;
*)
end;

procedure TfrmPBLUActivityReports.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

end.
