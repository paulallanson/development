unit PBRSActivityCust;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, DateSelV5,  CCSPrint,
  OleCtnrs, ComCtrls;

type
  TPBRSActivityCustFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    pnlAssignedToSearch: TPanel;
    lblCustBran: TLabel;
    edtAssignedTo: TEdit;
    btnOperator: TButton;
    CancelBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDateFrom: TEdit;
    btbtnDateFrom: TBitBtn;
    Label2: TLabel;
    edtDateTo: TEdit;
    btbtnDateTo: TBitBtn;
    rdgrpAssignedTo: TRadioGroup;
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
    chkbxShowOnlyLive: TCheckBox;
    rdgrpActivityType: TRadioGroup;
    pnlActivityTypeSearch: TPanel;
    Label4: TLabel;
    edtActivityType: TEdit;
    btnActivityType: TButton;
    procedure btnOperatorClick(Sender: TObject);
    procedure rdgrpAssignedToClick(Sender: TObject);
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
    procedure rdgrpActivityTypeClick(Sender: TObject);
  private
    AssignedToCode: integer;
    AssignedToText: string;
    ActivityCode: integer;
    ActivityText: string;
    CustName: string;
    CustCode: integer;
    BranchCode: integer;
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
  PBRSActivityCustFrm: TPBRSActivityCustFrm;

implementation

uses PBDatabase, PBLUCust, PBPOObjects, CCSCommon, PBLUOps,
  PBLUActivityType, PBRPActivityCust;

{$R *.DFM}

procedure TPBRSActivityCustFrm.btnOperatorClick(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.Create(Self);
  try
    PBLUOpsFrm.bIs_Lookup := True;
    PBLUOpsFrm.bAllow_Upd := False;
    PBLUOpsFrm.SelCode := AssignedToCode;
    PBLUOpsFrm.ShowModal;
    if PBLUOpsFrm.Selected then
    begin
      AssignedToCode := PBLUOpsFrm.SelCode;
      AssignedToText := PBLUOpsFrm.SelName;
    end;
    edtAssignedTo.Text := AssignedToText;
  finally
    PBLUOpsFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSActivityCustFrm.rdgrpAssignedToClick(Sender: TObject);
begin
  pnlAssignedToSearch.visible := rdgrpAssignedTo.itemIndex = 1;
  if pnlAssignedToSearch.visible = False then
  begin
    AssignedToCode := 0;
    edtAssignedTo.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSActivityCustFrm.btnCustLUClick(Sender: TObject);
begin
  PBLUActivityTypeFrm := TPBLUActivityTypeFrm.Create(Self);
  try
    PBLUActivityTypeFrm.bIs_Lookup := True;
    PBLUActivityTypeFrm.bAllow_Upd := False;
    PBLUActivityTypeFrm.SelCode := inttostr(ActivityCode);
    PBLUActivityTypeFrm.ShowModal;
    if PBLUActivityTypeFrm.Selected then
    begin
      ActivityCode := strtoint(PBLUActivityTypeFrm.SelCode);
      ActivityText := PBLUActivityTypeFrm.SelName;
    end;
    edtActivityType.Text := ActivityText;
  finally
    PBLUActivityTypeFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSActivityCustFrm.rdgrpCustClick(Sender: TObject);
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

procedure TPBRSActivityCustFrm.canPrint;
begin
  if ((rdgrpAssignedTo.itemIndex = 1) and (AssignedToCode = 0)) or
     ((rdgrpCust.ItemIndex = 1) and (custName = '')) or
     ((rdgrpActivityType.ItemIndex = 1) and (ActivityCode = 0)) then
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

procedure TPBRSActivityCustFrm.btbtnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  if datefrom = 0 then
    datefrom := date - 30;
    
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  canprint;
end;

function TPBRSActivityCustFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSActivityCustFrm.FormCreate(Sender: TObject);
begin
  self.custCode := 0;
  self.branchCode := 0;
  self.custText := '';
  self.AssignedToCode := 0;
  self.ActivityCode := 0;

  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TPBRSActivityCustFrm.FormShow(Sender: TObject);
begin
  self.canPrint;
end;

procedure TPBRSActivityCustFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPActivityCustFrm := TPBRPActivityCustFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPActivityCustFrm.Totalby := TotByRadioGroup.itemindex;
    PBRPActivityCustFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
    PBRPActivityCustFrm.ShowOnlyLive := chkbxShowOnlyLive.checked;
    PBRPActivityCustFrm.PrinterSettings := PrinterSettings;

    if PBRPActivityCustFrm.PrepareReport(dateFrom, dateTo, self.custCode, self.AssignedToCode, self.ActivityCode, self.CustName) > 0 then
    begin
      if preview then
      begin
        PBRPActivityCustFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPActivityCustFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPActivityCustFrm.Free;
    self.visible := true;
  end;
end;

procedure TPBRSActivityCustFrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TPBRSActivityCustFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TPBRSActivityCustFrm.btbtnDateToClick(Sender: TObject);
begin
  {Access the date component}
  if dateto = 0 then
    dateto := date;

  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(dateTo);
  canprint;
end;

procedure TPBRSActivityCustFrm.edtDateFromExit(Sender: TObject);
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

procedure TPBRSActivityCustFrm.edtDateToExit(Sender: TObject);
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

procedure TPBRSActivityCustFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.Enabled := ((Sender as TRadioGroup).itemindex < 4);
end;

procedure TPBRSActivityCustFrm.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPActivityCustFrm := TPBRPActivityCustFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPActivityCustFrm.Totalby := TotByRadioGroup.itemindex;
    PBRPActivityCustFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
    PBRPActivityCustFrm.ShowOnlyLive := chkbxShowOnlyLive.checked;

    PBRPActivityCustFrm.PrinterSettings := PrinterSettings;
    reccount := PBRPActivityCustFrm.PrepareReport(dateFrom, dateTo, self.custCode, self.AssignedToCode, self.ActivityCode, self.CustName);
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPActivityCustFrm.ExportToFile(tempFileName);
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
    PBRPActivityCustFrm.Free;
    self.visible := true;
  end;
end;

procedure TPBRSActivityCustFrm.edtCustChange(Sender: TObject);
begin
  CustName := trim(edtCust.text);
  CanPrint;
end;

procedure TPBRSActivityCustFrm.rdgrpActivityTypeClick(Sender: TObject);
begin
  pnlActivityTypeSearch.visible := rdgrpActivityType.itemIndex = 1;
  if pnlActivityTypeSearch.visible = False then
  begin
    ActivityCode := 0;
    edtActivityType.text := '';
  end;
  self.canPrint;
end;

end.
