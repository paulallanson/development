unit WTRSJobMasonRpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, gtQrCtrls;

type
  TfrmWTRSJobMasonRpt = class(TForm)
    Label1: TLabel;
    memSelection: TMemo;
    btnPrint: TButton;
    Button4: TButton;
    btnPreview: TButton;
    procedure btnPrintClick(Sender: TObject);
    procedure EnableRun(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    procedure RunReport(const bPreview: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTRSJobMasonRpt: TfrmWTRSJobMasonRpt;

implementation

uses WTRPJobMasonRpt;

{$R *.dfm}

procedure TfrmWTRSJobMasonRpt.RunReport(const bPreview: boolean);
begin
  frmwtRPJobMasonRpt := TfrmwtRPJobMasonRpt.create(self);
  try
    if bPreview then
      frmwtRPJobMasonRpt.qrpMasonRpt.Preview
    else
      begin
        frmwtRPJobMasonRpt.qrpMasonRpt.PrinterSetup;
        if frmwtRPJobMasonRpt.qrpMasonRpt.tag = 0 then
          frmwtRPJobMasonRpt.qrpMasonRpt.Print;
        close;
      end;
  finally
    frmwtRPJobMasonRpt.free;
  end;
end;

procedure TfrmWTRSJobMasonRpt.btnPrintClick(Sender: TObject);
begin
  Runreport(false);
end;

procedure TfrmWTRSJobMasonRpt.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSJobMasonRpt.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSJobMasonRpt.btnPreviewClick(Sender: TObject);
begin
  Runreport(true);
end;

end.
