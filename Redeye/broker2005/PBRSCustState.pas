unit PBRSCustState;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, PBPOObjects, Spin, QuickRpt,
  OleCtnrs, ComCtrls, CCSCommon;

type
  TPBRSCustStateFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlDetails: TPanel;
    Label3: TLabel;
    edtCustomerName: TEdit;
    Label1: TLabel;
    edtStatementNo: TEdit;
    Label2: TLabel;
    edtDate: TEdit;
    btnDateSel: TBitBtn;
    lblDateRange: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EmailBitBtn: TBitBtn;
    ExcelBitBtn: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;

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
  private
    Preview: ByteBool;
    DisplayPrintDialog : Boolean;
    iIntselcode: Integer;
    FReprint: boolean;
    FDateFrom: TDatetime;
    FDateTo: TDAteTime;
    procedure GetSelection;
    procedure SetReprint(const Value: boolean);
    procedure SetDateFrom(const Value: TDatetime);
    procedure SetDateTo(const Value: TDAteTime);
    procedure EmailReport;
    function BuildQueryString: string;
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
  PBRSCustStateFrm: TPBRSCustStateFrm;

implementation

uses PBRPCustState, PBLUCust, DateSelV5, CCSPrint, PBLUSInvDM, PBDatabase,
  CCSemailHandler;

{$R *.DFM}

  const SQLCore =
  'SELECT Customer.Customer, ' +
  '       Customer_Branch.Branch_no, ' +
  '       Customer_Branch.Account_Code, ' +
  '       Customer_Contact.Name as Name, '+
  '       Customer_Contact.Contact_no, '+
  '       Customer_Contact.Email, '+
	'       ''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'       ''PDF'' as ExportFilter, '+
  '       '' '' as CC_Email ' +
  'FROM Customer INNER JOIN '+
  '     (Customer_Branch '+
  '       LEFT JOIN Customer_Contact '+
  '       ON (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND '+
  '           (Customer_Branch.Customer = Customer_Contact.Customer) AND '+
  '           (Customer_Branch.Inv_to_Contact = Customer_Contact.Contact_no)) '+
  '       ON Customer.Customer = Customer_Branch.Customer ';

procedure TPBRSCustStateFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
  tempOK := false;
end;

procedure TPBRSCustStateFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  DisplayPrintDialog := true;
  tempOK := true;
  PrintReport(Self);
  if TempOK then
    close;
end;

procedure TPBRSCustStateFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  getselection;
  PBRPCustStateFrm := TPBRPCustStateFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPCustStateFrm.PrinterSettings := PrinterSettings;
      PBRPCustStateFrm.Preview := Preview;
      PBRPCustStateFrm.Reprint := Reprint;
      PBRPCustStateFrm.CustomerNo := SelCustomer;
      PBRPCustStateFrm.BranchNo := SelBranch;
      PBRPCustStateFrm.CustomerName := SelName;
      PBRPCustStateFrm.iIntSel := iIntSelCode;
      PBRPCustStateFrm.InvDate := InvoiceDate;
      PBRPCustStateFrm.DateFrom := DateFrom;
      PBRPCustStateFrm.DateTo := DateTo;
      PBRPCustStateFrm.StatementNo := edtStatementNo.text;

      if (PBRPCustStateFrm.GetDetails(Self) = 0) then
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
      else
        if Preview then
          PBRPCustStateFrm.InvoiceReport.Preview
        else
          if SetUpPrinter(PrinterSettings) then
            PBRPCustStateFrm.InvoiceReport.Print
          else
            TempOK := false;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPCustStateFrm.Free;
    dmBroker.DelIntSelCode(iIntSelCode, True);
  end;
end;

procedure TPBRSCustStateFrm.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dmBroker.DelIntSelCode(iIntSelCode, True);
  if SelectLst.Count > 100 then
    begin
      MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
    end;
   for icount := 0 to pred(SelectLst.count) do
    	begin
       	{Get the relevant Invoice number}
        if SelectLst.strings[icount] = '' then continue;

       	with dmBroker.AddIntSelQuery do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := StrToFloatDef(SelectLst.strings[icount], 0, FormatSettings);
          ParamByName('Text100').AsString := SelectLst.strings[icount];
          execSQL;
          end;
      end;
end;

function TPBRSCustStateFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSCustStateFrm.FormShow(Sender: TObject);
begin
  edtDate.text := PBDateStr(InvoiceDate);
end;

procedure TPBRSCustStateFrm.FormActivate(Sender: TObject);
begin
  if edtStatementNo.text = '' then
    edtStatementNo.text := dmLookUpSInv.GetNextStatement(SelCustomer,SelBranch);
  EnableOK(self);
end;

procedure TPBRSCustStateFrm.btnDateSelClick(Sender: TObject);
begin
  InvoiceDate := InputDate(InvoiceDate);
  edtDate.Text := PBDatestr(InvoiceDate);
  EnableOK(self);
end;

procedure TPBRSCustStateFrm.edtDateExit(Sender: TObject);
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

  edtDate.Text := PBDatestr(InvoiceDate);
  InvoiceDate := NewDate;
end;

procedure TPBRSCustStateFrm.FormCreate(Sender: TObject);
begin
  SelectLst := TStringList.create;
  iIntselcode := dmBroker.GetNextIntSelCode(Self);
end;

procedure TPBRSCustStateFrm.FormDestroy(Sender: TObject);
begin
  selectLst.free;
end;

procedure TPBRSCustStateFrm.SetReprint(const Value: boolean);
begin
  FReprint := Value;
  pnlDetails.Enabled := not FReprint;
  if FReprint then
    caption := 'Reprint Customer Statement'
end;

procedure TPBRSCustStateFrm.CancelBitBtnClick(Sender: TObject);
begin
  tempOK := false;
end;

procedure TPBRSCustStateFrm.SetDateFrom(const Value: TDatetime);
begin
  FDateFrom := Value;
  edtDateFrom.text := PBDateStr(FDateFrom);
end;

procedure TPBRSCustStateFrm.SetDateTo(const Value: TDAteTime);
begin
  FDateTo := Value;
  edtDateTo.text := PBDateStr(FDateTo);
end;

procedure TPBRSCustStateFrm.EnableOK(Sender: TObject);
begin
  PrintBitBtn.enabled := (edtStatementNo.text <> '') and
                         (edtDate.text <> '');
  PreviewBitBtn.enabled := PrintBitBtn.enabled;
  EmailBitBtn.enabled := PrintBitBtn.enabled;
  ExcelBitBtn.enabled := PrintBitBtn.enabled;
end;

procedure TPBRSCustStateFrm.EmailBitBtnClick(Sender: TObject);
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

procedure TPBRSCustStateFrm.EmailReport;
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);

  getselection;

  PBRPCustStateFrm := TPBRPCustStateFrm.create(self);
  try

    PBRPCustStateFrm.Preview := false;
    PBRPCustStateFrm.Reprint := Reprint;
    PBRPCustStateFrm.CustomerNo := SelCustomer;
    PBRPCustStateFrm.BranchNo := SelBranch;
    PBRPCustStateFrm.CustomerName := SelName;
    PBRPCustStateFrm.iIntSel := iIntSelCode;
    PBRPCustStateFrm.InvDate := InvoiceDate;
    PBRPCustStateFrm.DateFrom := DateFrom;
    PBRPCustStateFrm.DateTo := DateTo;
    PBRPCustStateFrm.StatementNo := edtStatementNo.text;

    if (PBRPCustStateFrm.GetDetails(self) = 0) then
      begin
        MessageDlg('There are no details to print', mtError, [mbAbort], 0);
        TempOK := false;
      end
    else
      begin
        PBRPCustStateFrm.Preview := false;
        sTemp := BuildQueryString;

        sSubject := 'Statement: ' + edtStatementNo.text;
        emailHandler.Body := 'Please find attached your ' + sSubject + '.'#13#10#13#10
                          +  'If you have any queries please contact me immediately'#13#10#13#10;
        emailHandler.ccEmail := '';
        emailHandler.CreateOneEmail(PBRPCustStateFrm.InvoiceReport, sTemp, 'STATE'+edtStatementNo.text, sSubject);
      end;
  finally
    PBRPCustStateFrm.free;
    emailHandler.Free;
  end;
end;

function TPBRSCustStateFrm.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'WHERE Customer_Branch.Customer = ' + inttostr(selCustomer) + ' AND Customer_Branch.Branch_no = ' + inttostr(selBranch);
  Result := sTemp
end;

procedure TPBRSCustStateFrm.ExcelBitBtnClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  TempFileName: string;
begin
  getselection;
  PBRPCustStateFrm := TPBRPCustStateFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPCustStateFrm.PrinterSettings := PrinterSettings;
      PBRPCustStateFrm.Preview := false;
      PBRPCustStateFrm.Reprint := Reprint;
      PBRPCustStateFrm.CustomerNo := SelCustomer;
      PBRPCustStateFrm.BranchNo := SelBranch;
      PBRPCustStateFrm.CustomerName := SelName;
      PBRPCustStateFrm.iIntSel := iIntSelCode;
      PBRPCustStateFrm.InvDate := InvoiceDate;
      PBRPCustStateFrm.DateFrom := DateFrom;
      PBRPCustStateFrm.DateTo := DateTo;
      PBRPCustStateFrm.StatementNo := edtStatementNo.text;

      reccount := PBRPCustStateFrm.GetDetails(Self);

      if reccount <> 0 then
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;

          PBRPCustStateFrm.ExportToFile(tempFileName);
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
    PBRPCustStateFrm.Free;
    dmBroker.DelIntSelCode(iIntSelCode, True);
  end;
end;

end.

