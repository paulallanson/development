unit WTRSJobCutSched;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtRSQuote, StdCtrls, ExtCtrls, DB, QrCtrls;

type
  TfrmWTRSJobCutSched = class(TfrmWTRSQuote)
    Button1: TButton;
    procedure EnableRun(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure RunReport(const bPreview: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTRSJobCutSched: TfrmWTRSJobCutSched;

implementation

uses WTRPJobCutSched;

{$R *.dfm}

procedure TfrmWTRSJobCutSched.RunReport(const bPreview: boolean);
begin
  frmwtRPJobCutSched := TfrmwtRPJobCutSched.create(self);
  try
    frmwtRPJobCutSched.Job := strtoint(memSelection.text);

    if (frmwtRPJobCutSched.GetDetails = 0) then
      MessageDlg('There are no jobs to print', mtError, [mbAbort], 0)
    else
      begin
        if bPreview then
          begin
            frmwtRPJobCutSched.qrpCutSchedule.Preview;
          end
        else
          begin
            frmwtRPJobCutSched.qrpCutSchedule.PrinterSetup;
            if frmwtRPJobCutSched.qrpCutSchedule.tag = 0 then
                frmwtRPJobCutSched.qrpCutSchedule.Print;
            exit;
          end;
      end;
  finally
    frmwtRPJobCutSched.free;
  end;
end;

procedure TfrmWTRSJobCutSched.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.Enabled;
  btnEmail.Enabled := btnPrint.enabled;
end;

procedure TfrmWTRSJobCutSched.btnRunClick(Sender: TObject);
begin
  runreport(false);
end;

procedure TfrmWTRSJobCutSched.Button1Click(Sender: TObject);
begin
  RunReport(true);

end;

end.
