unit PBRSSalesInvStats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, StdCtrls, ExtCtrls, DBCtrls, Spin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSalesInvStatsFrm = class(TForm)
    Label1: TLabel;
    dblkpPeriod: TDBLookupComboBox;
    rdgrpSortBy: TRadioGroup;
    PrintReportBitBtn: TBitBtn;
    PreviewReportBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryPeriod: TFDQuery;
    dtsPeriod: TDataSource;
    Label2: TLabel;
    spnPeriods: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
  private
    FActivated: boolean;
    iLastPeriod: integer;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSSalesInvStatsFrm: TPBRSSalesInvStatsFrm;

implementation

uses UITypes, pbDatabase, PBRPSalesInvStats, CCSPrint;

{$R *.dfm}

procedure TPBRSSalesInvStatsFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      qryPeriod.close;
      qryPeriod.Open;

      dblkpPeriod.keyvalue := dmBroker.GetCurrentperiod - 1;
      FActivated := true;
    end;
end;

procedure TPBRSSalesInvStatsFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSSalesInvStatsFrm.CallReport(const bPreview: Boolean);
var
  PBRPSalesInvStatsFrm: TPBRPSalesInvStatsFrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPSalesInvStatsFrm := TPBRPSalesInvStatsFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      {this part copies the query and values from the report selection form to the report print form}
      PBRPSalesInvStatsFrm.FirstPeriod := dblkpPeriod.KeyValue;
      PBRPSalesInvStatsFrm.LastPeriod := dblkpPeriod.KeyValue + pred(spnPeriods.value);

      PBRPSalesInvStatsFrm.qrlblDateRange.caption := PBRPSalesInvStatsFrm.qrlblDateRange.caption + ' ' +  dblkpPeriod.text;
      PBRPSalesInvStatsFrm.SortBy := rdgrpSortBy.itemindex;

      if PBRPSalesInvStatsFrm.GetDetails = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          if bPreview then
            PBRPSalesInvStatsFrm.qrpDetails.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPSalesInvStatsFrm.qrpDetails.Print;
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPSalesInvStatsFrm.free;
  end;
end;

procedure TPBRSSalesInvStatsFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

end.
