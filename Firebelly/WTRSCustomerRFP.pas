unit WTRSCustomerRFP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBTables, Spin, QuickRpt,
  gtQrCtrls, OleCtnrs, ComCtrls, allCommon;

type
  TfrmWTRSCustomerRFP = class(TForm)
    pnlDetails: TPanel;
    Label3: TLabel;
    edtCustomerName: TEdit;
    Label1: TLabel;
    edtApplicationNo: TEdit;
    Label2: TLabel;
    edtDate: TEdit;
    btnDateSel: TBitBtn;
    lblDateRange: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    Label6: TLabel;
    edtSiteName: TEdit;
    qryGetStatement: TQuery;
    qrySetStatement: TQuery;
    pnlLabourValue: TPanel;
    Label7: TLabel;
    memValue: TMemo;
    pnlBottom: TPanel;
    btnPrint: TBitBtn;
    btnPreview: TBitBtn;
    btnEmail: TBitBtn;
    btnClose: TBitBtn;
    btnExcel: TBitBtn;

    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDateSelClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
    procedure memValueEnter(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
  private
    Preview: ByteBool;
    DisplayPrintDialog : Boolean;
    iIntselcode: Integer;
    sOldValue: string;
    FReprint: boolean;
    FDateFrom: TDatetime;
    FDateTo: TDAteTime;
    procedure GetSelection;
    procedure SetReprint(const Value: boolean);
    procedure SetDateFrom(const Value: TDatetime);
    procedure SetDateTo(const Value: TDAteTime);
    procedure EmailReport;
    function BuildQueryString: string;
    function GetnextStatement(TempCust, TempSite: integer): string;
  public
    SelCustomer, SelBranch: Integer;
    SelName: string;
    SelectLst: TStringList;
    InvoiceDate: TDateTime;
    TempOK: boolean;
    property Reprint: boolean read FReprint write SetReprint;
    property DateFrom: TDatetime read FDateFrom write SetDateFrom;
    property DateTo: TDAteTime read FDateTo write SetDateTo;
  end;

var
  frmWTRSCustomerRFP: TfrmWTRSCustomerRFP;

implementation

uses DateSelV5, wtDataModule, WTRPCustomerRFP, allEmailHandler;

{$R *.DFM}

  const SQLCore =
    'SELECT	DISTINCT Sales_invoice.Application_Reference, '+
		'   Customer_contact.Email_address as Email, '+
		'   Customer_contact.Email_address as Contact_Email, '+
		'   Sales_invoice.Customer_Name as Name, '+
		'   ''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
		'   ''PDF'' as ExportFilter, '+
		'   '' '' as CC_Email '+
    'FROM Int_Sel '+
		'   INNER JOIN (Customer_contact '+
		'   INNER JOIN (Customer_Branch '+
		'   INNER JOIN Sales_invoice '+
		'	    ON (Customer_Branch.Branch_No = Sales_invoice.Branch_No) AND (Customer_Branch.Customer = Sales_invoice.Customer)) '+
		'	    ON (Customer_contact.Contact_no = Customer_Branch.Site_QS_Contact) AND (Customer_contact.Customer = Customer_Branch.Customer)) '+
		'	    ON Int_Sel.Sel1 = Sales_invoice.Sales_invoice ';

  const OldSQLCore =
    'SELECT DISTINCT Sales_invoice.Application_Reference, '+
    'Customer.Email_Address as Email, '+
    'Customer.Email_Address as Contact_Email, '+
    'Sales_invoice.Customer_Name as Name, '+
    '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	  '''PDF'' as ExportFilter, '+
    ''' '' as CC_Email '+
    'FROM Int_Sel  '+
    '    INNER JOIN (Customer '+
    '    INNER JOIN Sales_invoice '+
    '        ON (Customer.Customer = Sales_invoice.Customer) AND (Customer.Customer = Sales_invoice.Customer))  '+
    '        ON Int_Sel.Sel1 = Sales_invoice.Sales_invoice ';

procedure TfrmWTRSCustomerRFP.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
  tempOK := false;
end;

procedure TfrmWTRSCustomerRFP.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  DisplayPrintDialog := true;
  tempOK := true;
  PrintReport(Self);
  if TempOK then
    close;
end;

procedure TfrmWTRSCustomerRFP.PrintReport(Sender: TObject);
begin
  Getselection;

  frmWTRPCustomerRFP := TfrmWTRPCustomerRFP.Create(Self);

  try
    frmWTRPCustomerRFP.Preview := Preview;
    frmWTRPCustomerRFP.Reprint := Reprint;
    frmWTRPCustomerRFP.CustomerNo := SelCustomer;
    frmWTRPCustomerRFP.BranchNo := SelBranch;
    frmWTRPCustomerRFP.CustomerName := SelName;
    frmWTRPCustomerRFP.iIntSel := iIntSelCode;
    frmWTRPCustomerRFP.InvDate := InvoiceDate;
    frmWTRPCustomerRFP.DateFrom := DateFrom;
    frmWTRPCustomerRFP.DateTo := DateTo;
    frmWTRPCustomerRFP.ApplicationNo := edtApplicationNo.text;
    frmWTRPCustomerRFP.SiteName := edtSiteName.text;
    frmWTRPCustomerRFP.LabourValue := strtofloat(memValue.text);

    if (frmWTRPCustomerRFP.GetDetails(Self) = 0) then
      MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
    else
      if Preview then
        frmWTRPCustomerRFP.InvoiceReport.Preview
      else
        begin
          frmWTRPCustomerRFP.InvoiceReport.PrinterSetup;
          if frmWTRPCustomerRFP.InvoiceReport.tag = 0 then
            frmWTRPCustomerRFP.InvoiceReport.Print
          else
            TempOK := false;
        end;
  finally
    Application.ProcessMessages;
    frmWTRPCustomerRFP.Free;
    dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
  end;
end;

procedure TfrmWTRSCustomerRFP.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
  if SelectLst.Count > 1000 then
    begin
      MessageDlg(' This selection will result in more than 1000 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
    end;

   for icount := 0 to pred(SelectLst.count) do
    	begin
       	{Get the relevant Invoice number}
        if SelectLst.strings[icount] = '' then continue;

       	with dtmdlWorktops.qryAddIntSel do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := strtoFloat(SelectLst.strings[icount]);
          ParamByName('Text100').AsString := SelectLst.strings[icount];
          execSQL;
          end;
      end;
end;

function TfrmWTRSCustomerRFP.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTRSCustomerRFP.FormShow(Sender: TObject);
begin
  edtDate.text := paDateStr(InvoiceDate);
end;

procedure TfrmWTRSCustomerRFP.FormActivate(Sender: TObject);
begin
  if edtApplicationNo.text = '' then
    edtApplicationNo.text := GetNextStatement(SelCustomer,SelBranch);
  EnableOK(self);

end;

procedure TfrmWTRSCustomerRFP.btnDateSelClick(Sender: TObject);
begin
  InvoiceDate := InputDate(InvoiceDate);
  edtDate.Text := paDatestr(InvoiceDate);
  EnableOK(self);
end;

procedure TfrmWTRSCustomerRFP.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDate.SetFocus;
      Exit;
    end;
  end;

  edtDate.Text := paDatestr(InvoiceDate);
  InvoiceDate := NewDate;
end;

procedure TfrmWTRSCustomerRFP.FormCreate(Sender: TObject);
begin
  SelectLst := TStringList.create;
  iIntselcode := dtmdlWorktops.GetNextIntSelCode(Self);
end;

procedure TfrmWTRSCustomerRFP.FormDestroy(Sender: TObject);
begin
  selectLst.free;
end;

procedure TfrmWTRSCustomerRFP.SetReprint(const Value: boolean);
begin
  FReprint := Value;
  pnlDetails.Enabled := not FReprint;
  if FReprint then
    caption := 'Reprint Customer Statement'
end;

procedure TfrmWTRSCustomerRFP.CancelBitBtnClick(Sender: TObject);
begin
  tempOK := false;
  close;
end;

procedure TfrmWTRSCustomerRFP.SetDateFrom(const Value: TDatetime);
begin
  FDateFrom := Value;
  edtDateFrom.text := paDateStr(FDateFrom);
end;

procedure TfrmWTRSCustomerRFP.SetDateTo(const Value: TDAteTime);
begin
  FDateTo := Value;
  edtDateTo.text := paDateStr(FDateTo);
end;

procedure TfrmWTRSCustomerRFP.EnableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtApplicationNo.text <> '') and
                         (edtDate.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSCustomerRFP.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
begin
  try
    TempOK := true;
    EmailReport;
  finally
    if TempOK then
      close;
  end;
end;

procedure TfrmWTRSCustomerRFP.EmailReport;
var
  sTemp, sSubject: string;
begin
  GetSelection;

  emailHandler := TemailHandler.Create(self);

  frmWTRPCustomerRFP := TfrmWTRPCustomerRFP.create(self);
  try

    frmWTRPCustomerRFP.Preview := false;
    frmWTRPCustomerRFP.Reprint := Reprint;
    frmWTRPCustomerRFP.CustomerNo := SelCustomer;
    frmWTRPCustomerRFP.BranchNo := SelBranch;
    frmWTRPCustomerRFP.CustomerName := SelName;
    frmWTRPCustomerRFP.iIntSel := iIntSelCode;
    frmWTRPCustomerRFP.InvDate := InvoiceDate;
    frmWTRPCustomerRFP.DateFrom := DateFrom;
    frmWTRPCustomerRFP.DateTo := DateTo;
    frmWTRPCustomerRFP.ApplicationNo := edtApplicationNo.text;
    frmWTRPCustomerRFP.SiteName := edtSiteName.text;
    frmWTRPCustomerRFP.LabourValue := strtofloat(memValue.text);

    if (frmWTRPCustomerRFP.GetDetails(self) = 0) then
      begin
        MessageDlg('There are no details to print', mtError, [mbAbort], 0);
        TempOK := false;
      end
    else
      begin
        frmWTRPCustomerRFP.Preview := false;
        sTemp := BuildQueryString;

        sSubject := 'Application for Payment: ' + edtApplicationNo.text;
        emailHandler.Body := 'Please find attached your ' + sSubject + '.'#13#10#13#10
                          +  'If you have any queries please contact me immediately'#13#10#13#10;
        emailHandler.ccEmail := '';
        emailHandler.CreateOneEmail(frmWTRPCustomerRFP.InvoiceReport, sTemp, 'AFP' + edtApplicationNo.text, sSubject);
      end;
  finally
    frmWTRPCustomerRFP.free;
    emailHandler.Free;
  end;
end;

function TfrmWTRSCustomerRFP.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;
  sTemp := sTemp + 'WHERE  Int_Sel.Int_Sel_Code = ' + inttostr(iIntSelCode);
//  sTemp := sTemp + 'WHERE Sales_Invoice.Customer = ' + inttostr(selCustomer);
  Result := sTemp
end;

procedure TfrmWTRSCustomerRFP.ExcelBitBtnClick(Sender: TObject);
var
  reccount: integer;
  TempFileName: string;
begin
  GetSelection;

(*
  frmWTRPCustomerRFP := TfrmWTRPCustomerRFP.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      frmWTRPCustomerRFP.PrinterSettings := PrinterSettings;
      frmWTRPCustomerRFP.Preview := false;
      frmWTRPCustomerRFP.Reprint := Reprint;
      frmWTRPCustomerRFP.CustomerNo := SelCustomer;
      frmWTRPCustomerRFP.BranchNo := SelBranch;
      frmWTRPCustomerRFP.CustomerName := SelName;
      frmWTRPCustomerRFP.iIntSel := iIntSelCode;
      frmWTRPCustomerRFP.InvDate := InvoiceDate;
      frmWTRPCustomerRFP.DateFrom := DateFrom;
      frmWTRPCustomerRFP.DateTo := DateTo;
      frmWTRPCustomerRFP.StatementNo := edtStatementNo.text;

      reccount := frmWTRPCustomerRFP.GetDetails(Self);

      if reccount <> 0 then
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;

          frmWTRPCustomerRFP.ExportToFile(tempFileName);
          self.pnlExportPrgrss.visible := false;
          self.Repaint;
          self.prgbrExport.Position := 0;

          self.OleContainer1.CreateLinkToFile(tempFileName, false);
          self.OleContainer1.DoVerb(0);
        end
      else
        begin
          messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    frmWTRPCustomerRFP.Free;
    dmBroker.DelIntSelCode(iIntSelCode, True);
  end;
*)
end;

function TfrmWTRSCustomerRFP.GetnextStatement(TempCust, TempSite: integer): string;
begin
  with qryGetStatement do
    begin
      close;
      parambyname('Customer').asinteger := TempCust;
      open;
      result := incrementNo(fieldbyname('Last_Application_ref').asstring);
    end;
end;


procedure TfrmWTRSCustomerRFP.memValueEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTRSCustomerRFP.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

end.

