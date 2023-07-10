unit PBRSStkRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TPBRSStkRecFrm = class(TForm)
    rgReportType: TRadioGroup;
    btnPreview: TBitBtn;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure rgReportTypeClick(Sender: TObject);
  private
    { Private declarations }
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSStkRecFrm: TPBRSStkRecFrm;

implementation

uses PBRPStkRec, CCSPrint;

{$R *.DFM}

procedure TPBRSStkRecFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSStkRecFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
    PrinterSettings := TPrinterSettings.Create;
    try
      begin
        PBRPStkRecfrm := TPBRPStkRecfrm.Create(Self);
        try
          PBRPStkRecfrm.PrinterSettings := PrinterSettings;
          PBRPStkRecfrm.qryReport.SQL.Clear;
          case rgReportType.Itemindex of
            0: PBRPStkRecfrm.qryReport.SQL.Text := PBRPStkRecfrm.qryReport0.SQL.Text;
            1: PBRPStkRecfrm.qryReport.SQL.Text := PBRPStkRecfrm.qryReport1.SQL.Text;
            2: PBRPStkRecfrm.qryReport.SQL.Text := PBRPStkRecfrm.qryReport2.SQL.Text;
            3: PBRPStkRecfrm.qryReport.SQL.Text := PBRPStkRecfrm.qryReport3.SQL.Text;
          end;

//          PBRPStkRecfrm.qrlblTitle.Caption := PBRPStkRecfrm.qrlblTitle.Caption + DateToStr(Now);
          PBRPStkRecfrm.qrlblTitle.Caption := rgReportType.Items[rgReportType.ItemIndex] + ' - Run Date: ' + DateToStr(Now);

          if bPreview then
            PBRPStkRecfrm.QuickReport.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPStkRecfrm.QuickReport.Print;
        finally
          PBRPStkRecfrm.Free;
          Application.ProcessMessages;
        end;
      end;
    finally
      PrinterSettings.Free;
    end;
end;

procedure TPBRSStkRecFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSStkRecFrm.rgReportTypeClick(Sender: TObject);
begin
  btnPreview.enabled := true;
  btnPrint.enabled := true;
end;

end.
