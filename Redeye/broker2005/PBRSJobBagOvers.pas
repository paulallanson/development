unit PBRSJobBagOvers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TPBRSJobBagOversFrm = class(TForm)
    btnExcel: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    btbtnDateFrom: TBitBtn;
    edtDateTo: TEdit;
    btbtnDateTo: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    rdgrpCust: TRadioGroup;
    pnlCustSearch: TPanel;
    Label3: TLabel;
    edtCust: TEdit;
    btnCustLU: TButton;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    chkbxPageBreak: TCheckBox;
    procedure btnCustLUClick(Sender: TObject);
    procedure rdgrpCustClick(Sender: TObject);
    procedure btbtnDateFromClick(Sender: TObject);
    procedure btbtnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    custCode: integer;
    branchCode: integer;
    custText: string;
    dateFrom: TDateTime;
    dateTo: TDateTime;
    procedure canPrint;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSJobBagOversFrm: TPBRSJobBagOversFrm;

implementation

uses
  System.UITypes,
  PBLUCust, CCSCommon, DateSelV5, PBRPJobBagOvers;

{$R *.dfm}

procedure TPBRSJobBagOversFrm.btnCustLUClick(Sender: TObject);
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

procedure TPBRSJobBagOversFrm.rdgrpCustClick(Sender: TObject);
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

procedure TPBRSJobBagOversFrm.btbtnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  if datefrom = 0 then
    datefrom := date - 30;
    
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  canprint;
end;

procedure TPBRSJobBagOversFrm.btbtnDateToClick(Sender: TObject);
begin
  {Access the date component}
  if dateto = 0 then
    dateto := date;

  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(dateTo);
  canprint;

end;

procedure TPBRSJobBagOversFrm.edtDateFromExit(Sender: TObject);
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

procedure TPBRSJobBagOversFrm.edtDateToExit(Sender: TObject);
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

procedure TPBRSJobBagOversFrm.canPrint;
begin
  if ((rdgrpCust.ItemIndex = 1) and (custCode = 0)) then
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

function TPBRSJobBagOversFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSJobBagOversFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSJobBagOversFrm.CallReport(const bPreview: Boolean);
begin
  {add total order by clause to report query}

  PBRPJobBagOversFrm := TPBRPJobBagOversFrm.Create(Self);
  try
    PBRPJobBagOversFrm.qrlblDateRange.caption :=
          PBRPJobBagOversFrm.qrlblDateRange.caption + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    PBRPJobBagOversFrm.DateFrom := DateFrom;
    PBRPJobBagOversFrm.DateTo := DateTo;
    PBRPJobBagOversFrm.qrCustGroup.ForceNewPage := chkbxPageBreak.checked;

    case rdgrpCust.ItemIndex of
    0: PBRPJobBagOversFrm.Customer := 0;
    1: PBRPJobBagOversFrm.Customer := CustCode;
    end;

    if PBRPJobBagOversFrm.GetDetails = 0 then
      MessageDlg('Nothing to print', mtError, [mbOK], 0)
    else
      begin
        if bPreview then
          PBRPJobBagOversFrm.qrpDetails.Preview
        else
          begin
            PBRPJobBagOversFrm.qrpDetails.PrinterSetup;
            if PBRPJobBagOversFrm.qrpDetails.Tag = 0 then
              PBRPJobBagOversFrm.qrpDetails.Print;
          end;
      end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSJobBagOversFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSJobBagOversFrm.FormCreate(Sender: TObject);
begin
  DateFrom := date - 30;
  DateTo := date;
  edtDateFrom.text := pbdatestr(dateFrom);
  edtDateTo.Text := pbdatestr(dateto);
end;

procedure TPBRSJobBagOversFrm.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempfilename: string;
begin
  {add total order by clause to report query}

  PBRPJobBagOversFrm := TPBRPJobBagOversFrm.Create(Self);
  try
    PBRPJobBagOversFrm.qrlblDateRange.caption :=
          PBRPJobBagOversFrm.qrlblDateRange.caption + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    PBRPJobBagOversFrm.DateFrom := DateFrom;
    PBRPJobBagOversFrm.DateTo := DateTo;

    case rdgrpCust.ItemIndex of
    0: PBRPJobBagOversFrm.Customer := 0;
    1: PBRPJobBagOversFrm.Customer := CustCode;
    end;

    reccount := PBRPJobBagOversFrm.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('Nothing to export', mtError, [mbOK], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tempFileName := getWinTempDir + self.Caption + formatdatetime('dd mm yy hhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    PBRPJobBagOversFrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
     Application.ProcessMessages;
  end;

end;

end.
