unit wtRSJobSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, ExtCtrls, QrCtrls, printers, Inifiles, DB,
  DBTables, QrExport, AllCommon, ComObj, WTRPJobRemedialSheet;

type
  TfrmWTRSJobSheet = class(TForm)
    Panel1: TPanel;
    btnPrint: TButton;
    btnPreview: TButton;
    btnEmail: TButton;
    Button4: TButton;
    chkbxAccounts: TCheckBox;
    Panel2: TPanel;
    Label1: TLabel;
    memSelection: TMemo;
    pnlDocuments: TPanel;
    Label3: TLabel;
    cmbDocuments: TComboBox;
    Panel3: TPanel;
    lstbxDocuments: TListBox;
    chkbxIncludeVoucher: TCheckBox;
    qryDocumentStructure: TQuery;
    Label2: TLabel;
    memSOrderNumber: TMemo;
    chkbxAllDocuments: TCheckBox;
    chkbxMerge: TCheckBox;
    chkbxPrint: TCheckBox;
    qryReport: TQuery;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure EnableRun(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure lstbxDocumentsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbDocumentsChange(Sender: TObject);
    procedure chkbxAllDocumentsClick(Sender: TObject);
  private
    AttachmentList: TStringList;
    FActivated: boolean;
    FPrintType: string;
    FDefaultDocumentFolder: string;
    FSOrderNumber: string;
    sAttachmentType: string;
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
    procedure EmailFittingSheetMerge;
    procedure EmailRemedialSheet;
    function BuildQueryString: string;
    procedure PrintDocument(const documentToPrint: string);
    procedure PrintDocuments;
    procedure ListOrderDocuments(strPath: string; ListBox: TListBox);
    procedure GetOrderDocuments(tmpOrder: integer; tmpFolder: string);
    procedure SetDefaultDocumentFolder(const Value: string);
    procedure SetSOrderNumber(const Value: string);
    // ToDo GDK: remove after testings
    // procedure PrintRemedialToAttachment(frmWTRPJobRemedialSheet: TfrmWTRPJobRemedialSheet; tempCode, tmpOrder: string);
    { Private declarations }
  public
    sJobNumber: string;
    bRetail: boolean;
    bAccountsCopy: boolean;
    property DefaultDocumentFolder: string read FDefaultDocumentFolder write SetDefaultDocumentFolder;
    property PrintType: string read FPrintType write SetPrintType;
    property SOrderNumber: string read FSOrderNumber write SetSOrderNumber;
  end;

var
  frmWTRSJobSheet: TfrmWTRSJobSheet;

implementation

uses
  wtRPQuote, WtRPJobSheet, wtRPJobAccSheet, WTRPJobCutSched, WtRPJobFitting,
  wtRPJob, AllEmailHandler, wtDataModule, WtRPJobFittingTrade, wtRPJobSheetClient,
  Printer.Tools;

const
  SQLFitting =
  'SELECT Job.Job, '+
  '       Sales_Order_Line.Sales_Order, '+
  '       Fitter.Fitter_Name as Name, '+
  '       Fitter.Email_Address as Email, '+
  '       Fitter.Email_Address as Contact_Email, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM Fitter '+
  'RIGHT JOIN (Sales_Order '+
  'INNER JOIN (Job '+
  'INNER JOIN Sales_Order_Line '+
  '     ON Job.Job = Sales_Order_Line.Job) '+
  '     ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order) '+
  '     ON Fitter.Fitter = Sales_Order.Fitter '+
  'WHERE (Fitter.inactive = ''N'') AND ';

(*  SQLFitting =
  'SELECT Fitter.Fitter_Name as Name, '+
  '       Fitter.Email_Address as Email, '+
  '       Job.Job, '+
  '       Fitter.Email_Address as Contact_Email, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM Fitter, Job '+
  'WHERE (Fitter.inactive = ''N'') AND ';
*)

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

procedure TfrmWTRSJobSheet.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSJobSheet.btnPrintClick(Sender: TObject);
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
  if lstbxDocuments.selcount > 0 then
    PrintDocuments;

  printers.Printer.printerindex := -1;

  close;
end;

procedure TfrmWTRSJobSheet.RunReport(const bPreview: boolean);
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

procedure TfrmWTRSJobSheet.RunClientReport(const bPreview: boolean);
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

procedure TfrmWTRSJobSheet.RunJobReport(const bPreview: boolean);
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
//            exit;
          end;
      end;
  finally
    frmwtRPJob.free;
  end;
end;

procedure TfrmWTRSJobSheet.EmailJobReport;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
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

          {Add any other selected documents as an attachment}
          if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(sJobNumber), cmbDocuments.text);
            end;

(*          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;
*)

          emailHandler.CreateEmail(frmwtRPJob.qrpDetails, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJob.free;
    end;
  finally
    AttachmentList.Free;
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheet.EmailJobSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
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

          {Add any other selected documents as an attachment}
          if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(sJobNumber), cmbDocuments.text);
            end;

(*          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;
*)
          emailHandler.CreateEmail(frmwtRPJobSheet.qrpJobSheet, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobSheet.free;
    end;
  finally
    AttachmentList.Free;
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheet.EmailFittingSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
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

      frmwtRPJobFitting.bIncludeVoucher := chkbxIncludeVoucher.checked;
{$IFDEF GMS}
      {Don''t include voucher because it's too big when emailing}
      frmwtRPJobFitting.bIncludeVoucher := false;
{$ENDIF}
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

          if self.chkbxPrint.checked then
            begin
              frmWTRPJobRemedialSheet := TfrmWTRPJobRemedialSheet.create(self);
              try
                printers.Printer.printerindex := -1;
                frmWTRPJobRemedialSheet.Job := strtoint(memSelection.text);
                frmWTRPJobRemedialSheet.RemedialNo := 0;
                frmWTRPJobRemedialSheet.bRemedialTemplate := true;
                frmWTRPJobRemedialSheet.qryReport.SQL.Text := qryReport.SQL.text;

                if (frmWTRPJobRemedialSheet.GetDetails = 0) then
                  begin
                  end
                else
                  begin
                    frmWTRPJobRemedialSheet.bPreview := false;
                    sAttachmentType := 'PDF';
                    sFileName := 'RS' + memSelection.text + '-J' + memSOrderNumber.text;
                    PrinterTools.New.PrintToAttachment(frmWTRPJobRemedialSheet.qrpJobSheet, AttachmentList, sFileName, sAttachmentType);
                  end;
              finally
                frmWTRPJobRemedialSheet.Free;
              end;
            end;

          {Add any other selected documents as an attachment}
          if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(sJobNumber), cmbDocuments.text);
            end;

          emailHandler.CreateEmail(frmwtRPJobFitting.qrpJobSheet, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobFitting.free;
    end;
  finally
    AttachmentList.Free;
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheet.EmailFittingSheetMerge;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
  sAttachmentType: string;
  sMergedPDFList: TStringLIst;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  AttachmentList := TStringList.Create;
  emailHandler := TemailHandler.Create(self);
  sMergedPDFList := TStringList.create;

  try
  //    GetSelection;

    frmwtRPJobFitting := TfrmwtRPJobFitting.create(self);
    try
      frmwtRPJobFitting.qrpJobSheet.ShowProgress := false;
      frmwtRPJobFitting.bPreview := false;
      frmwtRPJobFitting.Job := strtoint(memSelection.text);

      frmwtRPJobFitting.bIncludeVoucher := chkbxIncludeVoucher.checked;
{$IFDEF GMS}
      {Don''t include voucher because it's too big when emailing}
      frmwtRPJobFitting.bIncludeVoucher := false;
{$ENDIF}
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

          {Add any other selected documents as an attachment}
          if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(sJobNumber), cmbDocuments.text);
            end;

          emailHandler.CreateEmail(frmwtRPJobFitting.qrpJobSheet, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobFitting.free;
    end;
  finally
    AttachmentList.Free;
    emailHandler.Free;
    sMergedPDFList.free;
  end;
end;

procedure TfrmWTRSJobSheet.EmailRemedialSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
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
    AttachmentList.Free;
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheet.EmailCuttingSheet;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
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

          {Add any other selected documents as an attachment}
          if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(sJobNumber), cmbDocuments.text);
            end;

(*          for i := 0 to pred(lstbxDocuments.items.count) do
            begin
              if lstbxDocuments.Selected[i] then
                begin
                  sfilename := sPath + lstbxDocuments.items[i];
                  Attachmentlist.Add(sfilename);
                end;
            end;
*)
          emailHandler.CreateEmail(frmwtRPJobCutSched.qrpCutSchedule, sTemp, 'J'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
        end;
    finally
      frmwtRPJobCutSched.free;
    end;
  finally
    AttachmentList.Free;
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSJobSheet.EmailClientReport;
var
  sTemp, sSubject: string;
  sPath, sFilename: string;
  i: integer;
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
    AttachmentList.Free;
    emailHandler.Free;
  end;
end;

function TfrmWTRSJobSheet.BuildQueryString: string;
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

procedure TfrmWTRSJobSheet.RunRemedialReport(const bPreview: boolean);
begin
  frmWTRPJobRemedialSheet := TfrmWTRPJobRemedialSheet.create(self);
  try
    frmWTRPJobRemedialSheet.Job := strtoint(memSelection.text);

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

procedure TfrmWTRSJobSheet.RunFittingReport(const bPreview: boolean);
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

procedure TfrmWTRSJobSheet.RunFittingTradeReport(const bPreview: boolean);
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

procedure TfrmWTRSJobSheet.RunCuttingReport(const bPreview: boolean);
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

procedure TfrmWTRSJobSheet.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.Enabled;
  btnEmail.enabled := btnPrint.Enabled;
end;

procedure TfrmWTRSJobSheet.SetPrintType(const Value: string);
begin
  FPrintType := Value;
  chkbxAccounts.Visible := false;
  if FPrintType = 'C' then
    caption := 'Print Cutting Schedule'
  else
  if FPrintType = 'F' then
    begin
      caption := 'Print Fitting Sheet';
//      chkbxPrint.visible := true;
{$IFDEF AKTIV}
      if bRetail then chkbxIncludeVoucher.visible := true;
{$ENDIF}
{$IFDEF GMS}
      chkbxIncludeVoucher.visible := true;
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

procedure TfrmWTRSJobSheet.btnPreviewClick(Sender: TObject);
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

procedure TfrmWTRSJobSheet.btnEmailClick(Sender: TObject);
begin
  if PrintType = 'C' then
    EmailCuttingSheet
  else
  if PrintType = 'F' then
    begin
      if chkbxMerge.Checked then
        EmailFittingSheetMerge
      else
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

procedure TfrmWTRSJobSheet.PrintDocuments;
var
  sPath, sFilename, tmpFolder: string;
  i: integer;
begin
  tmpFolder := cmbDocuments.text;

  if tmpFolder = '<None>' then
    exit
  else
  if tmpFolder = '<All>' then
    sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\'
  else
    sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\' + tmpFolder + '\';

  for i := 0 to pred(lstbxDocuments.items.count) do
    begin
      if lstbxDocuments.Selected[i] then
        begin
          sfilename := sPath + lstbxDocuments.items[i];
          printDocument(sfilename);
        end;
    end;
end;

procedure TfrmWTRSJobSheet.PrintDocument(const documentToPrint : string) ;
var
  printCommand : string;
  printerInfo : string;
  Device, Driver, Port: array[0..255] of Char;
  hDeviceMode: THandle;
begin

(*  if Printers.Printer.PrinterIndex = cboPrinter.ItemIndex then
    begin
      printCommand := 'print';
      printerInfo := '';
    end
  else
    begin
      printCommand := 'printto';
      Printers.Printer.PrinterIndex := cboPrinter.ItemIndex;
      Printer.GetPrinter(Device, Driver, Port, hDeviceMode) ;
      printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
    end;
*)

  printCommand := 'print';
  printerInfo := '';

  ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_HIDE) ;
end;

procedure TfrmWTRSJobSheet.lstbxDocumentsDblClick(Sender: TObject);
var
  irow: integer;
  sPath, sFileName: string;
  pFilename: Pchar;
begin
  iRow := lstbxDocuments.itemindex;
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';

  sFilename := lstbxDocuments.Items[iRow];
  pFileName := PChar(sPath+sFilename);
  ShellExecute(Handle, 'open', pFileName, nil, nil, SW_SHOWNORMAL) ;
end;

procedure TfrmWTRSJobSheet.FormShow(Sender: TObject);
var
  sPath: string;
begin
  sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';
  ListOrderDocuments(sPath,lstbxDocuments);
end;

procedure TfrmWTRSJobSheet.ListOrderDocuments(strPath: string; ListBox: TListBox);
var
  i: Integer;
  Icon: TIcon;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
begin
  listBox.Clear;
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
  if chkbxAllDocuments.Checked then
    lstbxdocuments.SelectAll;
end;

procedure TfrmWTRSJobSheet.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

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

      if PrintType = 'C' then
        begin
          if chkbxAlLDocuments.checked then
            WriteString('Cutting Sheet', 'Select All Documents', 'Y')
          else
            WriteString('Cutting Sheet', 'Select All Documents', 'N');
          WriteString('Cutting Sheet', 'Document Folder', cmbDocuments.Text)
        end
      else
      if PrintType = 'F' then
        begin
          if chkbxAlLDocuments.checked then
            WriteString('Fitting Sheet', 'Select All Documents', 'Y')
          else
            WriteString('Fitting Sheet', 'Select All Documents', 'N');

          if chkbxPrint.checked then
            WriteString('Fitting Sheet', 'Print Remedial Sheet', 'Y')
          else
            WriteString('Fitting Sheet', 'Print Remedial Sheet', 'N');

          WriteString('Fitting Sheet', 'Document Folder', cmbDocuments.Text)
        end
      else
      if PrintType = 'J' then
        begin
          if chkbxAlLDocuments.checked then
            WriteString('Print Job', 'Select All Documents', 'Y')
          else
            WriteString('Print Job', 'Select All Documents', 'N');

          WriteString('Print Job', 'Document Folder', cmbDocuments.Text)
        end
      else
        begin
          if chkbxAlLDocuments.checked then
            WriteString('Job Sheet', 'Select All Documents', 'Y')
          else
            WriteString('Job Sheet', 'Select All Documents', 'N');

          WriteString('Job Sheet', 'Document Folder', cmbDocuments.Text);
        end;
      Free;
    end;
end;

procedure TfrmWTRSJobSheet.FormActivate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  if not FActivated then
    begin
      IniFile := TIniFile.Create('myWorktops.ini');
      try
        with IniFile do
          begin
            chkbxAccounts.Checked := (ReadString('Job', 'Client Copy', 'N') = 'Y');
            chkbxIncludeVoucher.Checked := (ReadString('Job', 'Include Voucher', 'N') = 'Y');

            if PrintType = 'C' then
              begin
                DefaultDocumentFolder := ReadString('Cutting Sheet', 'Document Folder', '<All>');
                chkbxAllDocuments.Checked := (ReadString('Cutting Sheet', 'Select All Documents', 'N') = 'Y');
              end
            else
            if PrintType = 'F' then
              begin
                DefaultDocumentFolder := ReadString('Fitting Sheet', 'Document Folder', '<All>') ;
                chkbxAllDocuments.Checked := (ReadString('Fitting Sheet', 'Select All Documents', 'N') = 'Y');
                chkbxPrint.Checked := (ReadString('Fitting Sheet', 'Print Remedial Sheet', 'N') = 'Y');
              end
            else
            if PrintType = 'J' then
              begin
                DefaultDocumentFolder := ReadString('Print Job', 'Document Folder', '<All>');
                chkbxAllDocuments.Checked := (ReadString('Print Job', 'Select All Documents', 'N') = 'Y');
              end
            else
              begin
                DefaultDocumentFolder := ReadString('Job Sheet', 'Document Folder', '<All>');
                chkbxAllDocuments.Checked := (ReadString('Job Sheet', 'Select All Documents', 'N') = 'Y');
              end;

          end;
      finally
        IniFile.Free;
      end;

      with qryDocumentStructure do
        begin
          close;
          open;

          while eof <> true do
            begin
              cmbDocuments.Items.Add(fieldbyname('Folder_Name').asstring);
              next;
            end;
          cmbDocuments.Items.Add('<None>');
          cmbDocuments.ItemIndex := cmbDocuments.Items.IndexOf(DefaultDocumentFolder);
          cmbDocumentsChange(self);
        end;
      FActivated := true;
    end;
end;

procedure TfrmWTRSJobSheet.cmbDocumentsChange(Sender: TObject);
var
  sPath: string;
begin
  if cmbDocuments.itemindex = 0 then
    begin
      sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\';
      ListOrderDocuments(sPath,lstbxDocuments);
    end
  else
  if cmbDocuments.text <> '<None>' then
    begin
      sPath := dtmdlWorktops.GetCompanyJobDirectory + '\' + sJobNumber + '\' + cmbDocuments.text + '\';
      ListOrderDocuments(sPath,lstbxDocuments);
    end
  else
    lstbxDocuments.Clear;
end;

procedure TfrmWTRSJobSheet.GetOrderDocuments(tmpOrder: integer; tmpFolder: string);
var
  i, iCount: integer;
  SearchRec: TSearchRec;
  sSource, sFileName: string;
begin
  if tmpFolder = '<None>' then
    exit
  else
  if tmpFolder = '<All>' then
    sSource :=  dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(tmpOrder) + '\'
  else
    sSource :=  dtmdlWorktops.GetCompanyJobDirectory + '\' + inttostr(tmpOrder) + '\' + tmpFolder + '\';

  for i := 0 to pred(lstbxDocuments.items.count) do
    begin
      if lstbxDocuments.Selected[i] then
        begin
          sfilename := sSource + lstbxDocuments.items[i];
          Attachmentlist.Add(sfilename);
        end;
    end;

(*  // search for the first file
  icount := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while iCount = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
//          if pos('.pdf', SearchRec.Name) > 0 then
            AttachmentList.add(sSource + SearchRec.Name);
        end;
      iCount := FindNext(SearchRec);
    end;
*)
end;

procedure TfrmWTRSJobSheet.SetDefaultDocumentFolder(const Value: string);
begin
  FDefaultDocumentFolder := Value;
end;

procedure TfrmWTRSJobSheet.SetSOrderNumber(const Value: string);
begin
  FSOrderNumber := Value;
  try
    memSOrderNumber.Text := FSOrderNumber;
  except
    memSOrderNumber.Text := '';
  end;
end;

procedure TfrmWTRSJobSheet.chkbxAllDocumentsClick(Sender: TObject);
begin
  if chkbxAllDocuments.checked then
    lstbxdocuments.SelectAll
  else
    lstbxDocuments.ClearSelection;
end;

(*
procedure TfrmWTRSJobSheet.PrintRemedialToAttachment(frmWTRPJobRemedialSheet: TfrmWTRPJobRemedialSheet; tempCode, tmpOrder: string);
var
  i: integer;
  sLocation, sFileName: string;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
begin
//  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

  sFileName := 'RS' + tmpOrder + '-J'+tempCode;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      AttachmentList.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(AttachmentList[pred(AttachmentList.count)]);
      try
        frmWTRPJobRemedialSheet.qrpJobSheet.Prepare;
        frmWTRPJobRemedialSheet.qrpJobSheet.ExportToFilter(RTFFilter);
      finally
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter.Free;
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      AttachmentList.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(AttachmentList[pred(AttachmentList.count)]);
      try
        frmWTRPJobRemedialSheet.qrpJobSheet.Prepare;
        frmWTRPJobRemedialSheet.qrpJobSheet.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        AttachmentList.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          AttachmentList.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter.Free;
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      AttachmentList.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(AttachmentList[pred(AttachmentList.count)]);
      try
        frmWTRPJobRemedialSheet.qrpJobSheet.Prepare;
        frmWTRPJobRemedialSheet.qrpJobSheet.ExportToFilter(PDFFilter);
      finally
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter.Free;
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      AttachmentList.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(AttachmentList[pred(AttachmentList.count)]);
      try
        frmWTRPJobRemedialSheet.qrpJobSheet.Prepare;
        frmWTRPJobRemedialSheet.qrpJobSheet.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        AttachmentList.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          AttachmentList.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter.Free;
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      AttachmentList.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(AttachmentList[pred(AttachmentList.count)]);
      try
        frmWTRPJobRemedialSheet.qrpJobSheet.Prepare;
        frmWTRPJobRemedialSheet.qrpJobSheet.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        AttachmentList.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          AttachmentList.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter.Free;
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      AttachmentList.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(AttachmentList[pred(AttachmentList.count)]);
      try
        frmWTRPJobRemedialSheet.qrpJobSheet.Prepare;
 //       ExportToRTF(frmWTRPJobRemedialSheet.qrpJobSheet.qrpDetails, sLocation + sFilename + '.bmp');
      frmWTRPJobRemedialSheet.qrpJobSheet.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        AttachmentList.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          AttachmentList.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter.Free;
        frmWTRPJobRemedialSheet.qrpJobSheet.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

end.

