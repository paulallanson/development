unit STRSStockUsage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, CCSPrint, OleCtnrs, ComCtrls;

type
  TSTRSStockUsageFrm = class(TForm)
    Panel1: TPanel;
    ChkBxExcProd: TCheckBox;
    btnClose: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtDateFrom: TEdit;
    DateFromButton: TSpeedButton;
    edtDateTo: TEdit;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    edtCustomer: TEdit;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    rdgrpType: TRadioGroup;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    GroupBox1: TGroupBox;
    memProduct: TMemo;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure memProductKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure ExcelReport;
    procedure ExcelReportDetail;
    { Private declarations }
  public
    bChanging: boolean;
    DateFrom, DateTo: TDateTime;
    selcustomer, selcustbranch: integer;
    selCustName, selbranchname: string;
    procedure CallReport(const bPreview: Boolean);
    procedure CallReportDetail(const bPreview: Boolean);
  end;

var
  STRSStockUsageFrm: TSTRSStockUsageFrm;

implementation

uses
  System.UITypes,
  PBLUCust, STPrtMnt, CCSCommon, DateSelV5, STRPStockUsage,
  CCSProgressBar, STRPStockUsageDet;

{$R *.DFM}

procedure TSTRSStockUsageFrm.BitBtn1Click(Sender: TObject);
begin
 pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := SelCustomer;
  pbLUCustFrm.bSel_Branch := True;
  pbLUCustFrm.SelBranch := SelCustBranch;
  pbLUCustFrm.ShowModal;
  if pbLUCustFrm.Selected then
   begin
      SelCustomer := pbLUCustFrm.SelCode;
      SelCustBranch := pbLUCustFrm.SelBranch;
      edtCustomer.Text := pbLUCustFrm.SelName + '/'+ pbLUCustFrm.SelBranchName;
      selCustName := pbLUCustFrm.SelName;
      selbranchname := pbLUCustFrm.SelBranchName;
   end;
  pbLUCustFrm.Free;
  enableprint(self);
end;

procedure TSTRSStockUsageFrm.BitBtn4Click(Sender: TObject);
begin
  edtCustomer.text := '';
  selCustomer := 0;
  selCustBranch := 0;
end;

procedure TSTRSStockUsageFrm.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled := (edtDateFrom.text <> '') and
                      (edtDateTo.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TSTRSStockUsageFrm.CallReport(const bPreview: Boolean);
var
  STRPStockUsagefrm: TSTRPStockUsagefrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPStockUsageFrm := TSTRPStockUsageFrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
//      STRPStockUsageFrm.PrinterSettings := PrinterSettings;

      STRPStockUsageFrm.Customer := selCustomer;

      STRPStockUsageFrm.Product := memProduct.Text;

      STRPStockUsageFrm.NotinUse := chkbxExcProd.checked;
      STRPStockUsageFrm.DateFrom := DateFrom;
      STRPStockUsageFrm.DateTo := DateTo;

      if selCustomer <> 0 then
        begin
          STRPStockUsageFrm.qrlblSelection.caption := 'Customer: '+selCustName;
        end
      else
        STRPStockUsageFrm.qrlblSelection.caption := '';

      STRPStockUsageFrm.qrlblDateSelection.caption := 'Period: '+edtDateFrom.text + ' to '
                                                          + edtDateTo.text;
      if STRPStockUsageFrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
//          STRPStockUsageFrm.qrlblTitle.Caption :=
//              STRPStockUsageFrm.qrlblTitle.Caption + DateToStr(Date());
          if bPreview then
            STRPStockUsageFrm.qrpDetails.Preview
          else
            begin
            if SetupPrinter(PrinterSettings) then
              STRPStockUsageFrm.qrpDetails.Print;
            end;
        end;
      STRPStockUsageFrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TSTRSStockUsageFrm.CallReportDetail(const bPreview: Boolean);
var
  STRPStockUsageDetfrm: TSTRPStockUsageDetfrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPStockUsageDetFrm := TSTRPStockUsageDetFrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPStockUsageDetFrm.Customer := selCustomer;

      STRPStockUsageDetFrm.Product := memProduct.Text;

      STRPStockUsageDetFrm.NotinUse := chkbxExcProd.checked;
      STRPStockUsageDetFrm.DateFrom := DateFrom;
      STRPStockUsageDetFrm.DateTo := DateTo;

      if selCustomer <> 0 then
        begin
          STRPStockUsageDetFrm.qrlblSelection.caption := 'Customer: '+selCustName;
        end
      else
        STRPStockUsageDetFrm.qrlblSelection.caption := '';

      STRPStockUsageDetFrm.qrlblDateSelection.caption := 'Period: '+edtDateFrom.text + ' to '
                                                          + edtDateTo.text;
      if STRPStockUsageDetFrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          STRPStockUsageDetFrm.qrlblTitle.Caption :=
              STRPStockUsageDetFrm.qrlblTitle.Caption + DateToStr(Date());
          if bPreview then
            STRPStockUsageDetFrm.qrpDetails.Preview
          else
            begin
            if SetupPrinter(PrinterSettings) then
              STRPStockUsageDetFrm.qrpDetails.Print;
            end;
        end;
      STRPStockUsageDetFrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TSTRSStockUsageFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TSTRSStockUsageFrm.SpeedButton1Click(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(DateTo);
end;

function TSTRSStockUsageFrm.InputDate(TempDate: TDateTime): TDateTime;
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
procedure TSTRSStockUsageFrm.btnPreviewClick(Sender: TObject);
begin
  if rdgrpType.ItemIndex = 0 then
    CallReport(true)
  else
    CallReportDetail(true);
end;

procedure TSTRSStockUsageFrm.btnPrintClick(Sender: TObject);
begin
  if rdgrpType.ItemIndex = 0 then
    CallReport(false)
  else
    CallReportDetail(false);
end;

procedure TSTRSStockUsageFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
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

procedure TSTRSStockUsageFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDateto.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateto.SetFocus;
      Exit;
    end;
  end;

  edtDateto.Text := PBDatestr(NewDate);
  Dateto := NewDate;
end;

procedure TSTRSStockUsageFrm.FormCreate(Sender: TObject);
begin
  TEdit(memProduct).charcase := ecUpperCase; 
  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := PBDatestr(DateFrom);

  EnablePrint(self);
end;

procedure TSTRSStockUsageFrm.ExcelReportDetail;
var
  STRPStockUsageDetFrm: TSTRPStockUsageDetFrm;
  tempFileName: string;
  recCount: integer;
begin

  STRPStockUsageDetFrm := TSTRPStockUsageDetFrm.Create(Self);
    try
      STRPStockUsageDetFrm.Customer := selCustomer;
      STRPStockUsageDetFrm.Product := memProduct.Text;
      STRPStockUsageDetFrm.NotinUse := chkbxExcProd.checked;
      STRPStockUsageDetFrm.DateFrom := DateFrom;
      STRPStockUsageDetFrm.DateTo := DateTo;

      recCount := STRPStockUsageDetFrm.GetDetails(Self);
      if recCount > 0 then
        begin
          prgbrExport.Max := recCount;
          tempFileName := getWinTempDir+'temp.csv';
          pnlExportPrgrss.BringToFront;
          pnlExportPrgrss.Visible := true;
          pnlExportPrgrss.Repaint;
          STRPStockUsageDetFrm.ExportToFile(tempFileName);
          pnlExportPrgrss.visible := false;
          Repaint;
          prgbrExport.Position := 0;
          OleContainer1.CreateLinkToFile(tempFileName, false);
          OleContainer1.DoVerb(0);
        end
      else
        MessageDlg('Nothing to print', mtError, [mbOK], 0);

  finally
    STRPStockUsageDetFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSStockUsageFrm.ExcelReport;
var
  STRPStockUsageFrm: TSTRPStockUsageFrm;
  tempFileName: string;
  recCount: integer;
begin

  STRPStockUsageFrm := TSTRPStockUsageFrm.Create(Self);
    try
      STRPStockUsageFrm.Customer := selCustomer;
      STRPStockUsageFrm.Product := memProduct.Text;
      STRPStockUsageFrm.NotinUse := chkbxExcProd.checked;
      STRPStockUsageFrm.DateFrom := DateFrom;
      STRPStockUsageFrm.DateTo := DateTo;

      recCount := STRPStockUsageFrm.GetDetails(Self);
      if recCount > 0 then
        begin
          prgbrExport.Max := recCount;
          tempFileName := getWinTempDir+'temp.csv';
          pnlExportPrgrss.BringToFront;
          pnlExportPrgrss.Visible := true;
          pnlExportPrgrss.Repaint;
          STRPStockUsageFrm.ExportToFile(tempFileName);
          pnlExportPrgrss.visible := false;
          Repaint;
          prgbrExport.Position := 0;
          OleContainer1.CreateLinkToFile(tempFileName, false);
          OleContainer1.DoVerb(0);
        end
      else
        MessageDlg('Nothing to print', mtError, [mbOK], 0);

  finally
    STRPStockUsageFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSStockUsageFrm.memProductKeyPress(Sender: TObject;
  var Key: Char);
begin
	case Ord(key) of
  	$30..$39:;
  	$41..$86:;
  	Ord('>'):;
  	Ord('-'):;
  	Ord(','):;
  	Ord(':'):;
  	Ord('/'):;
  	Ord('&'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;
end;

procedure TSTRSStockUsageFrm.FormShow(Sender: TObject);
begin
  memProduct.SetFocus;
end;

procedure TSTRSStockUsageFrm.btnExcelClick(Sender: TObject);
begin
  if rdgrpType.ItemIndex = 0 then
    ExcelReport
  else
    ExcelReportDetail;
end;

end.
