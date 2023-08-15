unit PBRSQuoteReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, DateSelV5,  CCSPrint,
  OleCtnrs, ComCtrls;

type
  TPBRSQuoteReasonFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    CancelBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDateFrom: TEdit;
    btbtnDateFrom: TBitBtn;
    Label2: TLabel;
    edtDateTo: TEdit;
    btbtnDateTo: TBitBtn;
    rdgrpRep: TRadioGroup;
    pnlCustSearch: TPanel;
    Label3: TLabel;
    edtCust: TEdit;
    btnCustLU: TButton;
    rdgrpCust: TRadioGroup;
    TotByRadioGroup: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    btnExcel: TBitBtn;
    rdgrpReportType: TRadioGroup;
    procedure btnRepClick(Sender: TObject);
    procedure rdgrpRepClick(Sender: TObject);
    procedure btnCustLUClick(Sender: TObject);
    procedure rdgrpCustClick(Sender: TObject);
    procedure btbtnDateFromClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure btbtnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edtCustChange(Sender: TObject);
  private
    repCode: integer;
    repText: string;
    CustName: string;
    custCode: integer;
    branchCode: integer;
    custText: string;
    dateFrom: TDateTime;
    dateTo: TDateTime;
    procedure canPrint;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure RunReport(preview: boolean);
  public
    { Public declarations }
  end;

var
  PBRSQuoteReasonFrm: TPBRSQuoteReasonFrm;

implementation

uses
  System.UITypes,
  PBLURep, PBDatabase, PBLUCust, PBPOObjects, CCSCommon,
  PBRPQuoteReason;

{$R *.DFM}

procedure TPBRSQuoteReasonFrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := repCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      repCode := PBLURepFrm.SelCode;
      repText := PBLURepFrm.SelName;
    end;
    edtRep.Text := repText;
  finally
    PBLURepFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSQuoteReasonFrm.rdgrpRepClick(Sender: TObject);
begin
  PnlRepsearch.visible := rdgrpRep.itemIndex = 1;
  if PnlRepSearch.visible = False then
  begin
    repCode := 0;
    edtRep.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSQuoteReasonFrm.btnCustLUClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := custCode;
    PBLUCustFrm.SelBranch := branchCode;
    PBLUCustFrm.bSel_Branch := True;    
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      custCode := PBLUCustFrm.SelCode;
      branchCode := PBLUCustFrm.SelBranch;
      custText := PBLUCustFrm.SelName +' / '+ PBLUCustFrm.SelBranchName;
    end;
    edtCust.Text := custText;
  finally
    PBLUCustFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSQuoteReasonFrm.rdgrpCustClick(Sender: TObject);
begin
  pnlCustSearch.visible := rdgrpCust.itemIndex = 1;
  if pnlCustSearch.visible = False then
  begin
    custCode := 0;
    branchCode := 0;
    edtCust.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSQuoteReasonFrm.canPrint;
begin
  if ((rdgrpRep.itemIndex = 1) and (repCode = 0)) or
     ((rdgrpCust.ItemIndex = 1) and (custName = '')) then
  begin
    PreviewBitBtn.Enabled := false;
    PrintBitBtn.Enabled := false;
  end
  else
  begin
    PreviewBitBtn.Enabled := true;
    PrintBitBtn.Enabled := true;
  end;
end;

procedure TPBRSQuoteReasonFrm.btbtnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  if datefrom = 0 then
    datefrom := date - 30;
    
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  canprint;
end;

function TPBRSQuoteReasonFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSQuoteReasonFrm.FormCreate(Sender: TObject);
begin
  self.custCode := 0;
  self.branchCode := 0;
  self.custText := '';
  self.repCode := 0;

  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TPBRSQuoteReasonFrm.FormShow(Sender: TObject);
begin
  self.canPrint;
end;

procedure TPBRSQuoteReasonFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPQuoteReasonFrm := TPBRPQuoteReasonFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPQuoteReasonFrm.Totalby := TotByRadioGroup.itemindex;
    PBRPQuoteReasonFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
    PBRPQuoteReasonFrm.bSummary := (rdgrpReportType.itemindex = 0);
    PBRPQuoteReasonFrm.PrinterSettings := PrinterSettings;
    if PBRPQuoteReasonFrm.PrepareReport(dateFrom, dateTo, self.custCode, self.branchCode, self.repCode, self.custname) > 0 then
    begin
      if preview then
      begin
        PBRPQuoteReasonFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPQuoteReasonFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPQuoteReasonFrm.Free;
    self.visible := true;
  end;
end;

procedure TPBRSQuoteReasonFrm.PreviewBitBtnClick(Sender: TObject);
begin
  self.RunReport(true);
end;

procedure TPBRSQuoteReasonFrm.PrintBitBtnClick(Sender: TObject);
begin
  self.RunReport(false);
end;

procedure TPBRSQuoteReasonFrm.btbtnDateToClick(Sender: TObject);
begin
  {Access the date component}
  if dateto = 0 then
    dateto := date;

  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(dateTo);
  canprint;
end;

procedure TPBRSQuoteReasonFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateFrom.Text <> '' then
  begin
    try
      NewDate := StrToDate(edtDatefrom.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateFrom.SetFocus;
        Exit;
      end;
    end;
    edtDateFrom.Text := PBDatestr(NewDate);
    DateFrom := NewDate;
  end;
end;

procedure TPBRSQuoteReasonFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateTo.Text <> '' then
  begin
  try
    NewDate := StrToDate(edtDateTo.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateTo.SetFocus;
        Exit;
      end;
    end;
    edtDateTo.Text := PBDatestr(NewDate);
    DateTo := NewDate;
  end;
end;

procedure TPBRSQuoteReasonFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.Enabled := ((Sender as TRadioGroup).itemindex < 2);
end;

procedure TPBRSQuoteReasonFrm.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPQuoteReasonFrm := TPBRPQuoteReasonFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPQuoteReasonFrm.Totalby := TotByRadioGroup.itemindex;
    PBRPQuoteReasonFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
    PBRPQuoteReasonFrm.bSummary := (rdgrpReportType.itemindex = 0);

    PBRPQuoteReasonFrm.PrinterSettings := PrinterSettings;
    reccount := PBRPQuoteReasonFrm.PrepareReport(dateFrom, dateTo, self.custCode, self.branchCode, self.repCode, self.custname);
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPQuoteReasonFrm.ExportToFile(tempFileName);
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
    PrinterSettings.free;
    PBRPQuoteReasonFrm.Free;
    self.visible := true;
  end;

end;

procedure TPBRSQuoteReasonFrm.edtCustChange(Sender: TObject);
begin
  CustName := trim(edtCust.text);
  CanPrint;
end;

end.
