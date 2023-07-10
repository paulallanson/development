unit PBRSDataServsWIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, OleCtnrs;

type
  TPBRSDataServsWIPFrm = class(TForm)
    rdgrpAccMgr: TRadioGroup;
    AccMgrPanel: TPanel;
    lblSupplier: TLabel;
    edtAccMgr: TEdit;
    btnAccMgr: TButton;
    rdgrpCustomer: TRadioGroup;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    ExcelBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    lblFrom: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    DateToEdit: TEdit;
    lblTo: TLabel;
    rdgrpSortBy: TRadioGroup;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpReportType: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    procedure btnCustomerClick(Sender: TObject);
    procedure btnAccMgrClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure rdgrpAccMgrClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
    procedure rdgrpReportTypeClick(Sender: TObject);
  private
    SelCustCode, SelCustBranch, SelAccMgr : integer;
    SelCustText: string;
    DateFrom, DateTo: TDateTime;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
    procedure CallCSReport(const bPreview: Boolean);
    procedure CallSEPReport(const bPreview: Boolean);
    procedure CallExport;
    procedure CallCSExport;
    procedure CallSEPExport;
    procedure EnablePrint(Sender: TObject);
  public
    { Public declarations }
  end;

var
  PBRSDataServsWIPFrm: TPBRSDataServsWIPFrm;

implementation

uses PBLUCust, PBLUAccountManager, CCSCommon, DateSelV5, PBRPDataServsWIP, CCSPrint,
  PBRPJobBagApprovalDue, PBRPClientServsWIP;

{$R *.dfm}

procedure TPBRSDataServsWIPFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.SelBranch := SelCustBranch;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustBranch := PBLUCustFrm.SelBranch;
      SelCustText := PBLUCustFrm.SelName + ' / ' + PBLUCustFrm.SelBranchName;
      edtCustomer.Text := SelCustText;
      enablePrint(self);
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBRSDataServsWIPFrm.btnAccMgrClick(Sender: TObject);
begin
  PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Self);
  try
    PBLUAccountManagerFrm.bIs_Lookup := True;
    PBLUAccountManagerFrm.bAllow_Upd := False;
    PBLUAccountManagerFrm.SelCode := SelCustCode;
    PBLUAccountManagerFrm.ShowModal;
    if PBLUAccountManagerFrm.Selected then
    begin
      selAccMgr := PBLUAccountManagerFrm.SelCode;
      edtAccMgr.Text := PBLUAccountManagerFrm.SelName;
      enablePrint(self);
    end;
  finally
    PBLUAccountManagerFrm.Free;
  end;

end;

procedure TPBRSDataServsWIPFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
end;

procedure TPBRSDataServsWIPFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSDataServsWIPFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSDataServsWIPFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSDataServsWIPFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
end;

procedure TPBRSDataServsWIPFrm.rdgrpAccMgrClick(Sender: TObject);
begin
  if (rdgrpAccMgr.ItemIndex = 0) then
  begin
    AccMgrPanel.Visible := False;
    edtAccMgr.Text := '';
  end
  else
  begin
    AccMgrPanel.Visible := True;
  end;
  enablePrint(self);
end;

procedure TPBRSDataServsWIPFrm.rdgrpCustomerClick(Sender: TObject);
begin
  if (rdgrpCustomer.ItemIndex = 0) then
  begin
    CustomerPanel.Visible := False;
    edtCustomer.Text := '';
  end
  else
  begin
    CustomerPanel.Visible := True;
  end;
  enablePrint(self);
end;

procedure TPBRSDataServsWIPFrm.FormCreate(Sender: TObject);
begin
  DateTo := Date + 30;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSDataServsWIPFrm.PreviewBitBtnClick(Sender: TObject);
begin
  case rdgrpReportType.itemindex of
    0:  CallReport(True);
    1:  CallCSReport(True);
    2:  CallSEPReport(True);
  end;
end;

procedure TPBRSDataServsWIPFrm.EnablePrint(Sender: TObject);
begin
  printBitBtn.enabled := ((rdgrpAccMgr.itemindex = 0) or ((rdgrpAccMgr.itemindex = 1) and (edtAccMgr.Text <> ''))) and
                         ((rdgrpCustomer.itemindex = 0) or ((rdgrpCustomer.itemindex = 1) and (edtCustomer.Text <> '')));

  previewBitBtn.enabled := printBitBtn.Enabled;
  excelBitBtn.enabled := printBitBtn.Enabled;
end;

procedure TPBRSDataServsWIPFrm.PrintBitBtnClick(Sender: TObject);
begin
  case rdgrpReportType.itemindex of
    0:  CallReport(False);
    1:  CallCSReport(False);
    2:  CallSEPReport(False);
  end;
end;

procedure TPBRSDataServsWIPFrm.CallReport(const bPreview: Boolean);
begin
  {add total order by clause to report query}

  PBRPDataServsWIPFrm := TPBRPDataServsWIPFrm.Create(Self);
  try
    PBRPDataServsWIPFrm.qrlblDateRange.caption :=
          PBRPDataServsWIPFrm.qrlblDateRange.caption + DateFromEdit.Text + ' to ' + DateToEdit.Text;
    PBRPDataServsWIPFrm.DateFrom := DateFrom;
    PBRPDataServsWIPFrm.DateTo := DateTo;
    PBRPDataServsWIPFrm.qrGroup.ForceNewPage := chkbxPageBreak.checked;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPDataServsWIPFrm.AccManager := 0;
    1: PBRPDataServsWIPFrm.AccManager := selAccMgr;
    end;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPDataServsWIPFrm.Customer := 0;
    1: PBRPDataServsWIPFrm.Customer := SelCustCode;
    end;

    case rdgrpSortBy.itemindex of
    0: PBRPDataServsWIPFrm.SortbyDate := true;
    1: PBRPDataServsWIPFrm.SortbyJob := true;
    2: PBRPDataServsWIPFrm.SortbyAccMgr := true;
    3: PBRPDataServsWIPFrm.SortbyCustomer := true;
    end;

    if PBRPDataServsWIPFrm.GetDetails = 0 then
      MessageDlg('Nothing to print', mtError, [mbOK], 0)
    else
      begin
        if bPreview then
          PBRPDataServsWIPFrm.qrpDetails.Preview
        else
          begin
            PBRPDataServsWIPFrm.qrpDetails.PrinterSetup;
            if PBRPDataServsWIPFrm.qrpDetails.Tag = 0 then
              PBRPDataServsWIPFrm.qrpDetails.Print;
          end;
      end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSDataServsWIPFrm.CallSEPReport(const bPreview: Boolean);
begin
  {add total order by clause to report query}

  PBRPJobBagApprovalDueFrm := TPBRPJobBagApprovalDueFrm.Create(Self);
  try
    PBRPJobBagApprovalDueFrm.qrlblDateRange.caption :=
          PBRPJobBagApprovalDueFrm.qrlblDateRange.caption + DateFromEdit.Text + ' to ' + DateToEdit.Text;
    PBRPJobBagApprovalDueFrm.DateFrom := DateFrom;
    PBRPJobBagApprovalDueFrm.DateTo := DateTo;
    PBRPJobBagApprovalDueFrm.qrGroup.ForceNewPage := chkbxPageBreak.checked;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPJobBagApprovalDueFrm.AccManager := 0;
    1: PBRPJobBagApprovalDueFrm.AccManager := selAccMgr;
    end;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPJobBagApprovalDueFrm.Customer := 0;
    1: PBRPJobBagApprovalDueFrm.Customer := SelCustCode;
    end;

    case rdgrpSortBy.itemindex of
    0: PBRPJobBagApprovalDueFrm.SortbyDate := true;
    1: PBRPJobBagApprovalDueFrm.SortbyJob := true;
    2: PBRPJobBagApprovalDueFrm.SortbyAccMgr := true;
    3: PBRPJobBagApprovalDueFrm.SortbyCustomer := true;
    end;

    if PBRPJobBagApprovalDueFrm.GetDetails = 0 then
      MessageDlg('Nothing to print', mtError, [mbOK], 0)
    else
      begin
        if bPreview then
          PBRPJobBagApprovalDueFrm.qrpDetails.Preview
        else
          begin
            PBRPJobBagApprovalDueFrm.qrpDetails.PrinterSetup;
            if PBRPJobBagApprovalDueFrm.qrpDetails.Tag = 0 then
              PBRPJobBagApprovalDueFrm.qrpDetails.Print;
          end;
      end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSDataServsWIPFrm.CallCSReport(const bPreview: Boolean);
begin
  {add total order by clause to report query}

  PBRPClientServsWIPFrm := TPBRPClientServsWIPFrm.Create(Self);
  try
    PBRPClientServsWIPFrm.qrlblDateRange.caption :=
          PBRPClientServsWIPFrm.qrlblDateRange.caption + DateFromEdit.Text + ' to ' + DateToEdit.Text;
    PBRPClientServsWIPFrm.DateFrom := DateFrom;
    PBRPClientServsWIPFrm.DateTo := DateTo;
    PBRPClientServsWIPFrm.qrGroup.ForceNewPage := chkbxPageBreak.checked;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPClientServsWIPFrm.AccManager := 0;
    1: PBRPClientServsWIPFrm.AccManager := selAccMgr;
    end;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPClientServsWIPFrm.Customer := 0;
    1: PBRPClientServsWIPFrm.Customer := SelCustCode;
    end;

    case rdgrpSortBy.itemindex of
    0: PBRPClientServsWIPFrm.SortbyDate := true;
    1: PBRPClientServsWIPFrm.SortbyJob := true;
    2: PBRPClientServsWIPFrm.SortbyAccMgr := true;
    3: PBRPClientServsWIPFrm.SortbyCustomer := true;
    end;

    if PBRPClientServsWIPFrm.GetDetails = 0 then
      MessageDlg('Nothing to print', mtError, [mbOK], 0)
    else
      begin
        if bPreview then
          PBRPClientServsWIPFrm.qrpDetails.Preview
        else
          begin
            PBRPClientServsWIPFrm.qrpDetails.PrinterSetup;
            if PBRPClientServsWIPFrm.qrpDetails.Tag = 0 then
              PBRPClientServsWIPFrm.qrpDetails.Print;
          end;
      end;
  finally
     Application.ProcessMessages;
  end;
end;

procedure TPBRSDataServsWIPFrm.ExcelBitBtnClick(Sender: TObject);
begin
  case rdgrpReportType.itemindex of
    0:  CallExport;
    1:  CallCSExport;
    2:  CallSEPExport;
  end;
end;

procedure TPBRSDataServsWIPFrm.CallExport;
var
  reccount: integer;
  tempfilename: string;
begin
  {add total order by clause to report query}

  PBRPClientServsWIPFrm := TPBRPClientServsWIPFrm.Create(Self);
  try
    PBRPClientServsWIPFrm.qrlblDateRange.caption :=
          PBRPClientServsWIPFrm.qrlblDateRange.caption + DateFromEdit.Text + ' to ' + DateToEdit.Text;
    PBRPClientServsWIPFrm.DateFrom := DateFrom;
    PBRPClientServsWIPFrm.DateTo := DateTo;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPClientServsWIPFrm.AccManager := 0;
    1: PBRPClientServsWIPFrm.AccManager := selAccMgr;
    end;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPClientServsWIPFrm.Customer := 0;
    1: PBRPClientServsWIPFrm.Customer := SelCustCode;
    end;

    case rdgrpSortBy.itemindex of
    0: PBRPClientServsWIPFrm.SortbyDate := true;
    1: PBRPClientServsWIPFrm.SortbyJob := true;
    2: PBRPClientServsWIPFrm.SortbyAccMgr := true;
    3: PBRPClientServsWIPFrm.SortbyCustomer := true;
    end;

    reccount := PBRPClientServsWIPFrm.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('Nothing to export', mtError, [mbOK], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tempFileName := getWinTempDir + 'Data Services WIP Report ' + formatdatetime('dd mm yy hhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    PBRPClientServsWIPFrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
     Application.ProcessMessages;
  end;

end;

procedure TPBRSDataServsWIPFrm.CallCSExport;
var
  reccount: integer;
  tempfilename: string;
begin
  {add total order by clause to report query}

  PBRPClientServsWIPFrm := TPBRPClientServsWIPFrm.Create(Self);
  try
    PBRPClientServsWIPFrm.qrlblDateRange.caption :=
          PBRPClientServsWIPFrm.qrlblDateRange.caption + DateFromEdit.Text + ' to ' + DateToEdit.Text;
    PBRPClientServsWIPFrm.DateFrom := DateFrom;
    PBRPClientServsWIPFrm.DateTo := DateTo;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPClientServsWIPFrm.AccManager := 0;
    1: PBRPClientServsWIPFrm.AccManager := selAccMgr;
    end;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPClientServsWIPFrm.Customer := 0;
    1: PBRPClientServsWIPFrm.Customer := SelCustCode;
    end;

    case rdgrpSortBy.itemindex of
    0: PBRPClientServsWIPFrm.SortbyDate := true;
    1: PBRPClientServsWIPFrm.SortbyJob := true;
    2: PBRPClientServsWIPFrm.SortbyAccMgr := true;
    3: PBRPClientServsWIPFrm.SortbyCustomer := true;
    end;

    reccount := PBRPClientServsWIPFrm.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('Nothing to export', mtError, [mbOK], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tempFileName := getWinTempDir + 'Client Services WIP Report ' + formatdatetime('dd mm yy hhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    PBRPClientServsWIPFrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
     Application.ProcessMessages;
  end;

end;

procedure TPBRSDataServsWIPFrm.CallSEPExport;
var
  reccount: integer;
  tempfilename: string;
begin
  {add total order by clause to report query}

  PBRPJobBagApprovalDueFrm := TPBRPJobBagApprovalDueFrm.Create(Self);
  try
    PBRPJobBagApprovalDueFrm.qrlblDateRange.caption :=
          PBRPJobBagApprovalDueFrm.qrlblDateRange.caption + DateFromEdit.Text + ' to ' + DateToEdit.Text;
    PBRPJobBagApprovalDueFrm.DateFrom := DateFrom;
    PBRPJobBagApprovalDueFrm.DateTo := DateTo;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPJobBagApprovalDueFrm.AccManager := 0;
    1: PBRPJobBagApprovalDueFrm.AccManager := selAccMgr;
    end;

    case rdgrpAccMgr.ItemIndex of
    0: PBRPJobBagApprovalDueFrm.Customer := 0;
    1: PBRPJobBagApprovalDueFrm.Customer := SelCustCode;
    end;

    case rdgrpSortBy.itemindex of
    0: PBRPJobBagApprovalDueFrm.SortbyDate := true;
    1: PBRPJobBagApprovalDueFrm.SortbyJob := true;
    2: PBRPJobBagApprovalDueFrm.SortbyAccMgr := true;
    3: PBRPJobBagApprovalDueFrm.SortbyCustomer := true;
    end;

    reccount := PBRPJobBagApprovalDueFrm.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('Nothing to export', mtError, [mbOK], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tempFileName := getWinTempDir + 'Job Bag SEP Approvals Due Report ' + formatdatetime('dd mm yy hhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    PBRPJobBagApprovalDueFrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
     Application.ProcessMessages;
  end;

end;

procedure TPBRSDataServsWIPFrm.rdgrpReportTypeClick(Sender: TObject);
begin
  case (sender as TRadioGroup).itemindex of
    0: begin
        lblFrom.caption := 'Live Proof Date From';
        lblTo.caption := 'Live Proof Date To';
       end;
    1: begin
        lblFrom.caption := 'Date Required From';
        lblTo.caption := 'Date Required To';
       end;
    2: begin
        lblFrom.caption := 'SEP Approval Date From';
        lblTo.caption := 'SEP Approval Date To';
       end;
  end;
end;

end.
