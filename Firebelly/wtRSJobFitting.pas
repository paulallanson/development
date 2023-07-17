unit wtRSJobFitting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, QrCtrls;

type
  TfrmWTRSJobFitting = class(TForm)
    Label1: TLabel;
    memSelection: TMemo;
    btnRun: TButton;
    Button4: TButton;
    rdgrpOutput: TRadioGroup;
    chkbxAccounts: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure EnableRun(Sender: TObject);
  private
    FPrintType: string;
    procedure RunFittingReport;
    procedure SetPrintType(const Value: string);
    { Private declarations }
  public
    property PrintType: string read FPrintType write SetPrintType;
  end;

var
  frmWTRSJobFitting: TfrmWTRSJobFitting;

implementation

uses wtRPQuote, WtRPJobSheet, wtRPJobAccSheet, WTRPJobCutSched, WtRPJobFitting,
  wtRPJob;

{$R *.dfm}

procedure TfrmWTRSJobFitting.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSJobFitting.btnRunClick(Sender: TObject);
begin
  RunFittingReport;

  if rdgrpoutput.itemindex = 0 then
    close;
end;

procedure TfrmWTRSJobFitting.RunFittingReport;
begin
  frmwtRPJobFitting := TfrmwtRPJobFitting.create(self);
  try
    frmwtRPJobFitting.Job := strtoint(memSelection.text);

    if (frmwtRPJobFitting.GetDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
    else
      begin
        frmwtRPJobFitting.bAccountsCopy := chkbxAccounts.checked;
        case rdgrpoutput.itemindex of
        0:  begin
              frmwtRPJobFitting.bPreview := false;
              frmwtRPJobFitting.qrpJobSheet.PrinterSetup;
              if frmwtRPJobFitting.qrpJobSheet.tag = 0 then
                frmwtRPJobFitting.qrpJobSheet.Print;
              exit;
            end;
        1,2,3:
            begin
              frmwtRPJobFitting.bPreview := true;
              frmwtRPJobFitting.qrpJobSheet.Preview;
            end;
        end;
      end;
  finally
    frmwtRPJobFitting.free;
  end;
end;

procedure TfrmWTRSJobFitting.EnableRun(Sender: TObject);
begin
  btnRun.enabled := memSelection.text <> ''
end;

procedure TfrmWTRSJobFitting.SetPrintType(const Value: string);
begin
  FPrintType := Value;
  if FPrintType = 'C' then
    caption := 'Print Cutting Schedule'
  else
  if FPrintType = 'F' then
    caption := 'Print Fitting Sheet'
  else
  if FPrintType = 'J' then
    caption := 'Print Job Details'
  else
    caption := 'Print Job Sheet';
end;

end.

