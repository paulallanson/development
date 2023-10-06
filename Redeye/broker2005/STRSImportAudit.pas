unit STRSImportAudit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSImportAuditfrm = class(TForm)
    Label1: TLabel;
    dblkpAudit: TDBLookupComboBox;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryAudit: TFDQuery;
    dtsAudit: TDataSource;
    procedure EnableButtons(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    procedure RunReport(bPreview: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STRSImportAuditfrm: TSTRSImportAuditfrm;

implementation

uses UITypes, STRPImportAudit;

{$R *.DFM}

procedure TSTRSImportAuditfrm.FormActivate(Sender: TObject);
begin
  qryAudit.close;
  qryAudit.open;
  qryAudit.first;
  dblkpAudit.keyvalue := qryAudit.fieldbyname('Audit_Number').asinteger;
  EnableButtons(self);
end;

procedure TSTRSImportAuditfrm.EnableButtons(Sender: TObject);
begin
  btnPrint.enabled := dblkpAudit.text <> '';
  btnPreview.enabled := btnPrint.enabled;
end;

procedure TSTRSImportAuditfrm.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TSTRSImportAuditfrm.RunReport(bPreview: boolean);
begin
  STRPImportAuditFrm := TSTRPImportAuditFrm.create(self);
  try
    STRPImportAuditFrm.AuditNumber := dblkpAudit.keyvalue;
    if not STRPImportAuditFrm.getDetails then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    if bPreview then
      STRPImportAuditFrm.qrpImportAudit.Preview
    else
      begin
        STRPImportAuditFrm.qrpImportAudit.PrinterSetup;
        if STRPImportAuditFrm.qrpImportAudit.Tag = 0 then
          STRPImportAuditFrm.qrpImportAudit.Print;
      end;
  finally
    STRPImportAuditFrm.free;
  end;
end;

procedure TSTRSImportAuditfrm.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

end.
