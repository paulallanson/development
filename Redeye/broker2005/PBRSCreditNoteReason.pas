unit PBRSCreditNoteReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Buttons, DateSelV5,  CCSPrint,
  OleCtnrs, ComCtrls;

type
  TPBRSCreditNoteReasonFrm = class(TForm)
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
  private
    repCode: integer;
    repText: string;
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
  PBRSCreditNoteReasonFrm: TPBRSCreditNoteReasonFrm;

implementation

uses PBLURep, PBDatabase, PBLUCust, PBPOObjects, PBRPCreditNoteReason, CCSCommon;

{$R *.DFM}

procedure TPBRSCreditNoteReasonFrm.btnRepClick(Sender: TObject);
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

procedure TPBRSCreditNoteReasonFrm.rdgrpRepClick(Sender: TObject);
begin
  PnlRepsearch.visible := rdgrpRep.itemIndex = 1;
  if PnlRepSearch.visible = False then
  begin
    repCode := 0;
    edtRep.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSCreditNoteReasonFrm.btnCustLUClick(Sender: TObject);
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

procedure TPBRSCreditNoteReasonFrm.rdgrpCustClick(Sender: TObject);
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

procedure TPBRSCreditNoteReasonFrm.canPrint;
begin
  if ((rdgrpRep.itemIndex = 1) and (repCode = 0)) or
     ((rdgrpCust.ItemIndex = 1) and (custCode = 0)) then
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

procedure TPBRSCreditNoteReasonFrm.btbtnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  if datefrom = 0 then
    datefrom := date - 30;
    
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  canprint;
end;

function TPBRSCreditNoteReasonFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSCreditNoteReasonFrm.FormCreate(Sender: TObject);
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

procedure TPBRSCreditNoteReasonFrm.FormShow(Sender: TObject);
begin
  self.canPrint;
end;

procedure TPBRSCreditNoteReasonFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPCreditNoteReasonFrm := TPBRPCreditNoteReasonFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPCreditNoteReasonFrm.Totalby := TotByRadioGroup.itemindex;
    PBRPCreditNoteReasonFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
    PBRPCreditNoteReasonFrm.bSummary := (rdgrpReportType.itemindex = 0);
    PBRPCreditNoteReasonFrm.PrinterSettings := PrinterSettings;
    if PBRPCreditNoteReasonFrm.PrepareReport(dateFrom, dateTo, self.custCode, self.branchCode, self.repCode) > 0 then
    begin
      if preview then
      begin
        PBRPCreditNoteReasonFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPCreditNoteReasonFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPCreditNoteReasonFrm.Free;
    self.visible := true;
  end;
end;

procedure TPBRSCreditNoteReasonFrm.PreviewBitBtnClick(Sender: TObject);
begin
  self.RunReport(true);
end;

procedure TPBRSCreditNoteReasonFrm.PrintBitBtnClick(Sender: TObject);
begin
  self.RunReport(false);
end;

procedure TPBRSCreditNoteReasonFrm.btbtnDateToClick(Sender: TObject);
begin
  {Access the date component}
  if dateto = 0 then
    dateto := date;
    
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(dateTo);
  canprint;
end;

procedure TPBRSCreditNoteReasonFrm.edtDateFromExit(Sender: TObject);
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

procedure TPBRSCreditNoteReasonFrm.edtDateToExit(Sender: TObject);
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

procedure TPBRSCreditNoteReasonFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.Enabled := ((Sender as TRadioGroup).itemindex < 2);
end;

procedure TPBRSCreditNoteReasonFrm.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPCreditNoteReasonFrm := TPBRPCreditNoteReasonFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPCreditNoteReasonFrm.Totalby := TotByRadioGroup.itemindex;
    PBRPCreditNoteReasonFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
    PBRPCreditNoteReasonFrm.bSummary := (rdgrpReportType.itemindex = 0);

    PBRPCreditNoteReasonFrm.PrinterSettings := PrinterSettings;
    reccount := PBRPCreditNoteReasonFrm.PrepareReport(dateFrom, dateTo, self.custCode, self.branchCode, self.repCode);
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPCreditNoteReasonFrm.ExportToFile(tempFileName);
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
    PBRPCreditNoteReasonFrm.Free;
    self.visible := true;
  end;
end;

end.
