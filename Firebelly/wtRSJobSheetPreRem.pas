unit wtRSJobSheetPreRem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, ExtCtrls, QrCtrls, printers, Inifiles, wtMain;

type
  TfrmWTRSJobSheetPreRem = class(TForm)
    Panel1: TPanel;
    btnPrint: TButton;
    btnPreview: TButton;
    btnEmail: TButton;
    Button4: TButton;
    chkbxAccounts: TCheckBox;
    Panel2: TPanel;
    Label1: TLabel;
    memSelection: TMemo;
    Panel3: TPanel;
    Label2: TLabel;
    lstbxDocuments: TListBox;
    chkbxIncludeVoucher: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure EnableRun(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure lstbxDocumentsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FPrintType: string;
    procedure RunClientReport(const bPreview: boolean);
    procedure RunReport(const bPreview: boolean);
    procedure RunJobReport(const bPreview: boolean);
    procedure RunFittingReport(const bPreview: boolean);
    procedure RunFittingTradeReport(const bPreview: boolean);
    procedure RunCuttingReport(const bPreview: boolean);
    procedure RunRemedialReport(const bPreview: boolean);
    procedure SetPrintType(const Value: string);
    procedure EmailClientReport;
    procedure EmailJobReport;
    procedure EmailJobSheet;
    procedure EmailCuttingSheet;
    procedure EmailFittingSheet;
    procedure EmailRemedialSheet;
    function BuildQueryString: string;
    procedure PrintDocument(const documentToPrint: string);
    procedure PrintDocuments;
    procedure ListOrderDocuments(strPath: string; ListBox: TListBox);
    { Private declarations }
  public
    sJobNumber: string;
    bRetail: boolean;
    bAccountsCopy: boolean;
    property PrintType: string read FPrintType write SetPrintType;
  end;

var
  frmWTRSJobSheetPreRem: TfrmWTRSJobSheetPreRem;

implementation

uses wtRPQuote, WtRPJobSheet, wtRPJobAccSheet, WTRPJobCutSched, WtRPJobFitting,
  wtRPJob, AllEmailHandler, wtDataModule, WtRPJobFittingTrade,
  WTRPJobRemedial, WtRPJobRemedialSheet, wtRPJobSheetClient;

const

  SQLFitting =
  'SELECT Fitter.Fitter_Name as Name, '+
  '       Fitter.Email_Address as Email, '+
  '       Job.Job, '+
  '       Fitter.Email_Address as Contact_Email, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM Fitter, Job '+
  'WHERE (Fitter.inactive = ''N'') AND ';

  SQLJobPrint =
  'SELECT DISTINCT Job.Job, '+
  '(Select Production_Email FROM Company WHERE Company = 1) AS Email, '+
  '''Production Manager'' as Name, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email, ' +
  '(Select Production_Email FROM Company WHERE Company = 1) AS Contact_Email ' +
  'FROM Job '+
  'WHERE 1 = 1 AND ';

  SQLCustomerJobPrint =
  'SELECT DISTINCT ' +
  '    Sales_Order_Line.Job, ' +
  '    Sales_Order.Sales_Order, ' +
  '    Customer.Email_Address AS Email, ' +
  '    Sales_Order.Contact_Name AS Name, ' +
  '    ''Adobe Acrobat Document (*.pdf)'' AS export_filter_desc, ' +
  '    ''PDF'' AS ExportFilter, ' +
  '    '' '' AS CC_Email, ' +
  '    Customer_contact.Email_address AS Contact_Email ' +
  'FROM (Customer ' +
  '      INNER JOIN (Sales_Order ' +
  '      LEFT JOIN Customer_contact ' +
  '        ON (Sales_Order.Contact_Name = Customer_contact.Contact_name) AND (Sales_Order.Customer = Customer_contact.Customer)) ' +
  '        ON Customer.Customer = Sales_Order.Customer) ' +
  '      INNER JOIN Sales_Order_Line ' +
  '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order ' +
  'WHERE 1 = 1 AND ';

{$R *.dfm}

procedure TfrmWTRSJobSheetPreRem.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSJobSheetPreRem.btnPrintClick(Sender: TObject);
begin
  if PrintType = 'C' then
    RunCuttingReport(false)
  else
  if PrintType = 'F' then
    begin
      if dtmdlWorktops.UseTradeDetails and not self.bRetail then
        RunFittingTradeReport(false)
      else
        RunFittingReport(false);
    end
  else
  if PrintType = 'J' then
    RunJobReport(false)
  else
  if PrintType = 'R' then
    RunRemedialReport(false)
  else
    begin
      if chkbxAccounts.checked then
        RunClientReport(false)
      else
        Runreport(false);
    end;

  //Check if any additional documents need printing
  with lstbxDocuments do
    begin
      if selcount > 0 then
        PrintDocuments;
    end;
  printer.printerindex := -1;

  close;
end;

procedure TfrmWTRSJobSheetPreRem.RunReport(const bPreview: boolean);
begin
  frmwtRPJobSheet := TfrmwtRPJobSheet.create(self);
  try
    frmwtRPJobSheet.Job := strtoint(memSelection.text);

    if (frmwtRPJobSheet.GetDetails = 0) then
      MessageDlg('There are no jobs to print', mtError, [mbAbort], 0)
    else
      begin
        if bPreview then
          begin
            frmwtRPJobSheet.bPreview := true;
            frmwtRPJobSheet.qrpJobSheet.Preview;
          end
        else
          begin
            frmwtRPJobSheet.bPreview := false;
            frmwtRPJobSheet.qrpJobSheet.PrinterSetup;
            if frmwtRPJobSheet.qrpJobSheet.tag = 0 then
              frmwtRPJobSheet.qrpJobSheet.Print;
            exit;
          end;
      end;
  finally
    frmwtRPJobSheet.free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.RunClientReport(const bPreview: boolean);
begin
  frmwtRPJobSheetClient := TfrmwtRPJobSheetClient.create(self);
  try
    frmwtRPJobSheetClient.Job := strtoint(memSelection.text);
    frmwtRPJobSheetClient.bPrintLogo := true;

    if (frmwtRPJobSheetClient.GetDetails = 0) then
      MessageDlg('There are no jobs to print', mtError, [mbAbort], 0)
    else
      begin
        if bPreview then
          begin
            frmwtRPJobSheetClient.bPreview := true;
            frmwtRPJobSheetClient.qrpDetails.Preview;
          end
        else
          begin
            frmwtRPJobSheetClient.bPreview := false;
            frmwtRPJobSheetClient.qrpDetails.PrinterSetup;
            if frmwtRPJobSheetClient.qrpDetails.tag = 0 then
              frmwtRPJobSheetClient.qrpDetails.Print;
            exit;
          end;
      end;
  finally
    frmwtRPJobSheetClient.free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.RunJobReport(const bPreview: boolean);
begin
  frmwtRPJob := TfrmwtRPJob.create(self);
  try
    frmwtRPJob.Job := strtoint(memSelection.text);

    if (frmwtRPJob.GetDetails = 0) then
      MessageDlg('There are no jobs to print', mtError, [mbAbort], 0)
    else
      begin
        if bPreview then
          begin
            frmwtRPJob.bPreview := true;
            frmwtRPJob.qrpDetails.Preview;
          end
        else
          begin
            frmwtRPJob.bPreview := false;
            frmwtRPJob.qrpDetails.PrinterSetup;
            if frmwtRPJob.qrpDetails.tag = 0 then
              frmwtRPJob.qrpDetails.Print;
            exit;
          end;
      end;
  finally
    frmwtRPJob.free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.EmailJobReport;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
  AttachmentList: TStringList;
  sAttachmentType: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  try
  //    GetSelection;

    frmwtRPJob := TfrmwtRPJob.create(self);
    try
      frmwtRPJob.qrpDetails.ShowProgress := false;
      frmwtRPJob.bPreview := false;
      frmwtRPJob.Job := strtoint(memSelection.text);

      frmwtRPJob.bPrintLogo := true;

      if (frmwtRPJob.GetDetails = 0) then
        begin
          MessageDlg('There are no jobs to email', mtError, [mbAbort], 0);
          exit;
        end
      else
        begin
          sTemp := BuildQueryString;
          sSubject := 'Job Number: ' + memSelection.text;
          emailHandler.Body := 'Please find attached, Job: ' + memSelection.text + '.'#13#10#13#10;
          emailHandler.ccEmail := '';

          AttachmentList.clear;

          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;

          emailHandler.CreateEmail(frmwtRPJob.qrpDetails, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJob.free;
    end;
  finally
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.EmailJobSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
  AttachmentList: TStringList;
  sAttachmentType: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  try
  //    GetSelection;

    frmwtRPJobSheet := TfrmwtRPJobSheet.create(self);
    try
      frmwtRPJobSheet.qrpJobSheet.ShowProgress := false;
      frmwtRPJobSheet.bPreview := false;
      frmwtRPJobSheet.Job := strtoint(memSelection.text);

      frmwtRPJobSheet.bPrintLogo := true;

      if (frmwtRPJobSheet.GetDetails = 0) then
        begin
          MessageDlg('There are no jobs to email', mtError, [mbAbort], 0);
          exit;
        end
      else
        begin
          sTemp := BuildQueryString;
          sSubject := 'Job Sheet: ' + memSelection.text;
          emailHandler.Body := 'Please find attached, Job: ' + memSelection.text + '.'#13#10#13#10;
          emailHandler.ccEmail := '';

          AttachmentList.clear;

          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;

          emailHandler.CreateEmail(frmwtRPJobSheet.qrpJobSheet, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobSheet.free;
    end;
  finally
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.EmailFittingSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
  AttachmentList: TStringList;
  sAttachmentType: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  try
  //    GetSelection;

    frmwtRPJobFitting := TfrmwtRPJobFitting.create(self);
    try
      frmwtRPJobFitting.qrpJobSheet.ShowProgress := false;
      frmwtRPJobFitting.bPreview := false;
      frmwtRPJobFitting.Job := strtoint(memSelection.text);

      frmwtRPJobFitting.bPrintLogo := true;

      if (frmwtRPJobFitting.GetDetails = 0) then
        begin
          MessageDlg('There are no jobs to email', mtError, [mbAbort], 0);
          exit;
        end
      else
        begin
          sTemp := BuildQueryString;
          sSubject := 'Job Fitting Sheet: ' + memSelection.text;
          emailHandler.Body := 'Please find attached, Job: ' + memSelection.text + '.'#13#10#13#10;
          emailHandler.ccEmail := '';

          AttachmentList.clear;

          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;

          emailHandler.CreateEmail(frmwtRPJobFitting.qrpJobSheet, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobFitting.free;
    end;
  finally
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.EmailRemedialSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
  AttachmentList: TStringList;
  sAttachmentType: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  try
  //    GetSelection;

    frmWTRPJobRemedialSheet := TfrmWTRPJobRemedialSheet.create(self);
    try
      frmWTRPJobRemedialSheet.qrpJobSheet.ShowProgress := false;
      frmWTRPJobRemedialSheet.bPreview := false;
      frmWTRPJobRemedialSheet.Job := strtoint(memSelection.text);

      frmWTRPJobRemedialSheet.bPrintLogo := true;

      if (frmWTRPJobRemedialSheet.GetDetails = 0) then
        begin
          MessageDlg('There are no jobs to email', mtError, [mbAbort], 0);
          exit;
        end
      else
        begin
          sTemp := BuildQueryString;
          sSubject := 'Job Remedial Sheet: ' + memSelection.text;
          emailHandler.Body := 'Please find attached, Job: ' + memSelection.text + '.'#13#10#13#10;
          emailHandler.ccEmail := '';

          AttachmentList.clear;

          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;

          emailHandler.CreateEmail(frmWTRPJobRemedialSheet.qrpJobSheet, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmWTRPJobRemedialSheet.free;
    end;
  finally
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.EmailCuttingSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
  AttachmentList: TStringList;
  sAttachmentType: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  try
  //    GetSelection;

    frmwtRPJobCutSched := TfrmwtRPJobCutSched.create(self);
    try
      frmwtRPJobCutSched.qrpCutSchedule.ShowProgress := false;
      frmwtRPJobCutSched.bPreview := false;
      frmwtRPJobCutSched.Job := strtoint(memSelection.text);

      if (frmwtRPJobCutSched.GetDetails = 0) then
        begin
          MessageDlg('There are no jobs to email', mtError, [mbAbort], 0);
          exit;
        end
      else
        begin
          sTemp := BuildQueryString;
          sSubject := 'Job Cutting Sheet: ' + memSelection.text;
          emailHandler.Body := 'Please find attached, Job: ' + memSelection.text + '.'#13#10#13#10;
          emailHandler.ccEmail := '';

          AttachmentList.clear;

          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;

          emailHandler.CreateEmail(frmwtRPJobCutSched.qrpCutSchedule, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobCutSched.free;
    end;
  finally
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.EmailClientReport;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
  AttachmentList: TStringList;
  sAttachmentType: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  try
  //    GetSelection;

    frmwtRPJobSheetClient := TfrmwtRPJobSheetClient.create(self);
    try
      frmwtRPJobSheetClient.qrpDetails.ShowProgress := false;
      frmwtRPJobSheetClient.bPreview := false;
      frmwtRPJobSheetClient.Job := strtoint(memSelection.text);

      frmwtRPJobSheetClient.bPrintLogo := true;

      if (frmwtRPJobSheetClient.GetDetails = 0) then
        begin
          MessageDlg('There are no jobs to email', mtError, [mbAbort], 0);
          exit;
        end
      else
        begin
          sTemp := BuildQueryString;
          sSubject := 'Job Confirmation: ' + memSelection.text;
          emailHandler.Body := 'Please find attached, Job: ' + memSelection.text + '.'#13#10#13#10;
          emailHandler.ccEmail := '';

          AttachmentList.clear;

          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;

          emailHandler.CreateEmail(frmwtRPJobSheetClient.qrpDetails, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobSheetClient.free;
    end;
  finally
    emailHandler.Free;
  end;
end;

function TfrmWTRSJobSheetPreRem.BuildQueryString: string;
var
  sTemp: string;
begin
  if PrintType = 'J' then
    begin
      sTemp := SQLJobPrint;
      sTemp := sTemp + 'Job.Job = ' + memSelection.text;
    end
  else
  if PrintType = 'F' then
    begin
      sTemp := SQLFitting;
      sTemp := sTemp + 'Job.Job = ' + memSelection.text;
    end
  else
  if PrintType = '' then
    begin
      if chkbxAccounts.checked then
        begin
          sTemp := SQLCustomerJobPrint;
          sTemp := sTemp + 'Sales_Order_Line.Job = ' + memSelection.text;
        end
      else
        begin
          sTemp := SQLJobPrint;
          sTemp := sTemp + 'Job.Job = ' + memSelection.text;
        end;
    end
  else
    begin
      sTemp := SQLJobPrint;
      sTemp := sTemp + 'Job.Job = ' + memSelection.text;
    end;

  Result := sTemp
end;

procedure TfrmWTRSJobSheetPreRem.RunRemedialReport(const bPreview: boolean);
begin
  frmWTRPJobRemedialSheet := TfrmWTRPJobRemedialSheet.create(self);
  try
    frmWTRPJobRemedialSheet.Job := strtoint(memSelection.text);
    frmWTRPJobRemedialSheet.RemedialNo := 0;

    if (frmWTRPJobRemedialSheet.GetDetails = 0) then
      MessageDlg('There are no job details to print', mtError, [mbAbort], 0)
    else
      begin
        frmWTRPJobRemedialSheet.bAccountsCopy := chkbxAccounts.checked;
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

procedure TfrmWTRSJobSheetPreRem.RunFittingReport(const bPreview: boolean);
begin
  frmwtRPJobFitting := TfrmwtRPJobFitting.create(self);
  try
    frmwtRPJobFitting.Job := strtoint(memSelection.text);

    if (frmwtRPJobFitting.GetDetails = 0) then
      MessageDlg('There are no job details to print', mtError, [mbAbort], 0)
    else
      begin
        frmwtRPJobFitting.bAccountsCopy := chkbxAccounts.checked;
        frmwtRPJobFitting.bRetail := bRetail;
        frmwtRPJobFitting.bIncludeVoucher := chkbxIncludeVoucher.checked;
        if bPreview then
          begin
            frmwtRPJobFitting.bPreview := true;
            frmwtRPJobFitting.qrpJobSheet.Preview;
          end
        else
          begin
            frmwtRPJobFitting.bPreview := false;
            frmwtRPJobFitting.qrpJobSheet.PrinterSetup;
            if frmwtRPJobFitting.qrpJobSheet.tag = 0 then
              frmwtRPJobFitting.qrpJobSheet.Print;
            exit;
          end
      end;
  finally
    frmwtRPJobFitting.free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.RunFittingTradeReport(const bPreview: boolean);
begin
  frmwtRPJobFittingTrade := TfrmwtRPJobFittingTrade.create(self);
  try
    frmwtRPJobFittingTrade.Job := strtoint(memSelection.text);

    if (frmwtRPJobFittingTrade.GetDetails = 0) then
      MessageDlg('There are no job details to print', mtError, [mbAbort], 0)
    else
      begin
        frmwtRPJobFittingTrade.bAccountsCopy := chkbxAccounts.checked;
        if bPreview then
          begin
            frmwtRPJobFittingTrade.bPreview := true;
            frmwtRPJobFittingTrade.qrpJobSheet.Preview;
          end
        else
          begin
            frmwtRPJobFittingTrade.bPreview := false;
            frmwtRPJobFittingTrade.qrpJobSheet.PrinterSetup;
            if frmwtRPJobFittingTrade.qrpJobSheet.tag = 0 then
                frmwtRPJobFittingTrade.qrpJobSheet.Print;
            exit;
          end;
      end;
  finally
    frmwtRPJobFittingTrade.free;
  end;
end;

procedure TfrmWTRSJobSheetPreRem.RunCuttingReport(const bPreview: boolean);
begin
  frmwtRPJobCutSched := TfrmwtRPJobCutSched.create(self);
  try
    frmwtRPJobCutSched.Job := strtoint(memSelection.text);
    
    if (frmwtRPJobCutSched.GetDetails = 0) then
      MessageDlg('There are no cutting details to print', mtError, [mbAbort], 0)
    else
      begin
        if bPreview then
          begin
            frmwtRPJobCutSched.bPreview := true;
            frmwtRPJobCutSched.qrpCutSchedule.Preview;
          end
        else
          begin
            frmwtRPJobCutSched.bPreview := false;
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

procedure TfrmWTRSJobSheetPreRem.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.Enabled;
  btnEmail.enabled := btnPrint.Enabled;
end;

procedure TfrmWTRSJobSheetPreRem.SetPrintType(const Value: string);
begin
  FPrintType := Value;
  chkbxAccounts.Visible := false;
  if FPrintType = 'C' then
    caption := 'Print Cutting Schedule'
  else
  if FPrintType = 'F' then
    begin
      caption := 'Print Fitting Sheet';
{$IFDEF AKTIV}
      if bRetail then chkbxIncludeVoucher.visible := true;
{$ENDIF}
    end
  else
  if FPrintType = 'J' then
    caption := 'Print Job Details'
  else
  if FPrintType = 'R' then
    caption := 'Print Job Remedial Details'
  else
    begin
      caption := 'Print Job Sheet';
      chkbxAccounts.visible := true;
    end;
end;

procedure TfrmWTRSJobSheetPreRem.btnPreviewClick(Sender: TObject);
begin
  if PrintType = 'C' then
    RunCuttingReport(true)
  else
  if PrintType = 'F' then
    begin
      if dtmdlWorktops.UseTradeDetails and not self.bRetail then
        RunFittingTradeReport(true)
      else
        RunFittingReport(true);
    end
  else
  if PrintType = 'J' then
    RunJobReport(true)
  else
  if PrintType = 'R' then
    RunRemedialReport(true)
  else
    begin
      if chkbxAccounts.checked then
        RunClientReport(true)
      else
        Runreport(true);
    end;
end;

procedure TfrmWTRSJobSheetPreRem.btnEmailClick(Sender: TObject);
begin
  if PrintType = 'C' then
    EmailCuttingSheet
  else
  if PrintType = 'F' then
    begin
      EmailFittingSheet
    end
  else
  if PrintType = 'J' then
    begin
        EmailJobReport;
    end
  else
  if PrintType = 'R' then
    EmailRemedialSheet
  else
  if PrintType = '' then
    begin
      if chkbxAccounts.Checked then
        EmailClientReport
      else
        EmailJobSheet;
    end;
end;

procedure TfrmWTRSJobSheetPreRem.PrintDocuments;
var
  sPath, sFilename: string;
  i: integer;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  for i := 0 to pred(lstbxDocuments.items.count) do
    begin
      if lstbxDocuments.Selected[i] then
        begin
          sfilename := sPath + lstbxDocuments.items[i];
          printDocument(sfilename);
        end;
    end;
end;

procedure TfrmWTRSJobSheetPreRem.PrintDocument(const documentToPrint : string) ;
var
  printCommand : string;
  printerInfo : string;
  Device, Driver, Port: array[0..255] of Char;
  hDeviceMode: THandle;
begin

(*  if Printer.PrinterIndex = cboPrinter.ItemIndex then
    begin
      printCommand := 'print';
      printerInfo := '';
    end
  else
    begin
      printCommand := 'printto';
      Printer.PrinterIndex := cboPrinter.ItemIndex;
      Printer.GetPrinter(Device, Driver, Port, hDeviceMode) ;
      printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
    end;
*)

  printCommand := 'print';
  printerInfo := '';

  ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_HIDE) ;
end;

procedure TfrmWTRSJobSheetPreRem.lstbxDocumentsDblClick(Sender: TObject);
var
  irow: integer;
  sPath, sFileName: string;
  pFilename: Pchar;
begin
  iRow := lstbxDocuments.itemindex;
  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sJobNumber + '\';

  sFilename := lstbxDocuments.Items[iRow];
  pFileName := PChar(sPath+sFilename);
  ShellExecute(Handle, 'open', pFileName, nil, nil, SW_SHOWNORMAL) ;
end;

procedure TfrmWTRSJobSheetPreRem.FormShow(Sender: TObject);
var
  sPath: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';
  ListOrderDocuments(sPath,lstbxDocuments);
end;

procedure TfrmWTRSJobSheetPreRem.ListOrderDocuments(strPath: string; ListBox: TListBox);
var
  i: Integer;
  Icon: TIcon;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
begin
  // search for the first file
  i := FindFirst(strPath + '*.*', faArchive, SearchRec);

  while i = 0 do
    begin
      with ListBox do
      begin
        // On directories and volumes
        if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_DISPLAYNAME);
          ListBox.items.add(SearchRec.Name);
//          ListBox.items.add(FileInfo.szDisplayName);
        end;
      end;
      i := FindNext(SearchRec);
    end;
end;

procedure TfrmWTRSJobSheetPreRem.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  with IniFile do
    begin
      if chkbxAccounts.checked then
        WriteString('Job', 'Client Copy', 'Y')
      else
        WriteString('Job', 'Client Copy', 'N');
      if chkbxIncludeVoucher.checked then
        WriteString('Job', 'Include Voucher', 'Y')
      else
        WriteString('Job', 'Include Voucher', 'N');
      Free;
    end;
end;

procedure TfrmWTRSJobSheetPreRem.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      chkbxAccounts.Checked := (ReadString('Job', 'Client Copy', 'N') = 'Y');
      chkbxIncludeVoucher.Checked := (ReadString('Job', 'Include Voucher', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;
end;

end.

