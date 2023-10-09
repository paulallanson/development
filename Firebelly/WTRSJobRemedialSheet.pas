unit WTRSJobRemedialSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSJobRemedialSheet = class(TForm)
    pnlHead: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    dbgDetails: TDBGrid;
    qryReport: TFDQuery;
    dtsReport: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    btnPrint: TButton;
    btnPreview: TButton;
    btnEmail: TButton;
    Button4: TButton;
    qryJob: TFDQuery;
    dtsJob: TDataSource;
    chkbxSelectAll: TCheckBox;
    qryReportDummy: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
  private
    FActivated: boolean;
    procedure CallReport(const bPreview: Boolean);
    function BuildQueryString: string;
    { Private declarations }
  public
    Job: integer;
  end;

var
  frmWTRSJobRemedialSheet: TfrmWTRSJobRemedialSheet;

implementation

uses UITypes, WtRPJobRemedialSheet, wtDataModule, AllEmailHandler;

const

  SQLRemedial =
  'SELECT DISTINCT Job.Job, '+
  '(Select Production_Email FROM Company WHERE Company = 1) AS Email, '+
  '''Production Manager'' as Name, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email, ' +
  '(Select Production_Email FROM Company WHERE Company = 1) AS Contact_Email ' +
  'FROM Job '+
  'WHERE 1 = 1 AND ';

{$R *.dfm}

procedure TfrmWTRSJobRemedialSheet.CallReport(const bPreview: Boolean);
begin
  frmWTRPJobRemedialSheet := TfrmWTRPJobRemedialSheet.create(self);
  try
    frmWTRPJobRemedialSheet.Job := dbgDetails.datasource.dataset.fieldbyname('Job').asinteger;

    if chkbxSelectAll.Checked then
      frmWTRPJobRemedialSheet.RemedialNo := 0
    else
      frmWTRPJobRemedialSheet.RemedialNo := dbgDetails.datasource.dataset.fieldbyname('Remedial_Number').asinteger;

    frmWTRPJobRemedialSheet.qryReport.sql := qryReportDummy.sql;
    
    if (frmWTRPJobRemedialSheet.GetDetails = 0) then
      MessageDlg('There are no job details to print', mtError, [mbAbort], 0)
    else
      begin
//        frmWTRPJobRemedialSheet.bAccountsCopy := chkbxAccounts.checked;
        if bPreview then
          begin
            frmWTRPJobRemedialSheet.bPreview := true;
            frmWTRPJobRemedialSheet.qrpJobSheet.Preview;
          end
        else
          begin
            frmWTRPJobRemedialSheet.bPreview := false;
            frmWTRPJobRemedialSheet.qrpJobSheet.PrinterSetup;
            if frmWTRPJobRemedialSheet.qrpJobSheet.tag = 0 then
              frmWTRPJobRemedialSheet.qrpJobSheet.Print;
            exit;
          end
      end;
  finally
    frmWTRPJobRemedialSheet.free;
  end;
end;

procedure TfrmWTRSJobRemedialSheet.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      with qryJob do
        begin
          close;
          parambyname('Job').asinteger := Job;
          open;
        end;

      with qryReport do
        begin
          close;
          parambyname('Job').asinteger := Job;
          open;

          btnPrint.Enabled := (recordcount > 0);
          btnPreview.enabled := btnPrint.enabled;
          btnEmail.enabled := btnPrint.enabled;
        end;
      FActivated := true;
    end;
end;

procedure TfrmWTRSJobRemedialSheet.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSJobRemedialSheet.btnPreviewClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TfrmWTRSJobRemedialSheet.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TfrmWTRSJobRemedialSheet.btnEmailClick(Sender: TObject);
var
  sTemp, sSubject: string;
  sPath: string;
  iCount: integer;
  AttachmentList: TStringList;
  sAttachmentType: string;
  sFilename: array[0..255] of Char;
begin
//  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  try

    frmWTRPJobRemedialSheet := TfrmWTRPJobRemedialSheet.create(self);
    try
      frmWTRPJobRemedialSheet.qrpJobSheet.ShowProgress := false;
      frmWTRPJobRemedialSheet.bPreview := false;
      frmWTRPJobRemedialSheet.Job := dbgDetails.datasource.dataset.fieldbyname('Job').asinteger;

      if chkbxSelectAll.Checked then
        frmWTRPJobRemedialSheet.RemedialNo := 0
      else
        frmWTRPJobRemedialSheet.RemedialNo := dbgDetails.datasource.dataset.fieldbyname('Remedial_Number').asinteger;

      frmWTRPJobRemedialSheet.bPrintLogo := true;

      frmWTRPJobRemedialSheet.qryReport.sql := qryReportDummy.sql;
    
      if (frmWTRPJobRemedialSheet.GetDetails = 0) then
        begin
          MessageDlg('There are no jobs to email', mtError, [mbAbort], 0);
          exit;
        end
      else
        begin
          sTemp := BuildQueryString;
          sSubject := 'Job Remedial Sheet: ' + inttostr(dbgDetails.datasource.dataset.fieldbyname('Job').asinteger);
          emailHandler.Body := 'Please find attached, Job: ' + inttostr(dbgDetails.datasource.dataset.fieldbyname('Job').asinteger) + '.'#13#10#13#10;
          emailHandler.ccEmail := '';

          AttachmentList.clear;

(*
          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;
*)
          emailHandler.CreateEmail(frmWTRPJobRemedialSheet.qrpJobSheet, sTemp, 'J'+inttostr(dbgDetails.datasource.dataset.fieldbyname('Job').asinteger), sSubject, AttachmentList);
        end;
    finally
      for iCount := pred(AttachmentList.count) downto 0 do
        begin
          StrPCopy(sFilename, AttachmentList.strings[iCount]);
          deletefile(sFilename);
        end;
      frmWTRPJobRemedialSheet.free;
    end;
  finally
    emailHandler.Free;
  end;
end;

function TfrmWTRSJobRemedialSheet.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLRemedial;
  sTemp := sTemp + 'Job.Job = ' + inttostr(dbgDetails.datasource.dataset.fieldbyname('Job').asinteger);
  Result := sTemp
end;

end.
