unit PBRPRptOrds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, PBRSRptOrds, Qrctrls;

type
  TPBRPRptOrdsFrm = class(TForm)
    QuickReport: TQuickRep;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    RunDateQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    RepQRGroup: TQRGroup;
    GrpByQRDBText: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    RepQRFooter: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    groupField: string;
  end;

var
  PBRPRptOrdsFrm: TPBRPRptOrdsFrm;

implementation

{$R *.DFM}

procedure TPBRPRptOrdsFrm.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  GrpByQRDBText.DataField := groupField;
  RepQRGroup.Expression := groupField;

  if groupField = 'repName' then
    QRLabel14.caption := 'Rep:'
  else if groupField = 'custName' then
    QRLabel14.caption := 'Customer:'
  else
    QRLabel14.caption := 'Date:';

  RunDateQRLabel.Caption := 'Run Date: ' + DateToStr(trunc(Now()));
end;

end.
