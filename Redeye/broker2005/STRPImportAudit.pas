unit STRPImportAudit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, DBTables, ExtCtrls;

type
  TSTRPImportAuditFrm = class(TForm)
    qrpImportAudit: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    qryReport: TQuery;
    qrgrpbAuditNumber: TQRGroup;
    QRSubDetail1: TQRSubDetail;
    QRSysData1: TQRSysData;
    QRDBText1: TQRDBText;
    qrlblErrorMessage: TQRLabel;
    QRSysData2: TQRSysData;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    Fauditnumber: integer;
    procedure Setauditnumber(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    function GetDetails: boolean;
    property auditnumber: integer read Fauditnumber write Setauditnumber;
  end;

var
  STRPImportAuditFrm: TSTRPImportAuditFrm;

implementation

{$R *.DFM}

procedure TSTRPImportAuditFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  sError: string;
begin
  sError := '';
  sError := qryReport.fieldbyname('Error_code_Descr').asstring + ' ' + trim(qryReport.fieldbyname('Audit_Code_1_Field').asstring);
  if qryReport.fieldbyname('Audit_Code_2_Field').asinteger <> 0 then
    sError := sError + '/'+trim(qryReport.fieldbyname('Audit_Code_2_Field').asstring);
  if qryReport.fieldbyname('Audit_Code_3_Field').asstring <> '' then
    sError := sError + ', product code: '+trim(qryReport.fieldbyname('Audit_Code_3_Field').asstring);

  qrlblErrorMessage.caption := sError;
end;

function TSTRPImportAuditFrm.GetDetails: boolean;
begin
  with qryReport do
    begin
      close;
      parambyname('Audit_number').asinteger := self.auditnumber;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TSTRPImportAuditFrm.Setauditnumber(const Value: integer);
begin
  Fauditnumber := Value;
end;

end.
