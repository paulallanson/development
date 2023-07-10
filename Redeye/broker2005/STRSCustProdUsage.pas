unit STRSCustProdUsage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, CCSPrint, ComCtrls, OleCtnrs;

type
  TSTRSCustProdUsageFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtFrom: TEdit;
    edtTo: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel1: TPanel;
    ChkBxExcProd: TCheckBox;
    btnClose: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnEmail: TBitBtn;
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
    chkbxBranches: TCheckBox;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure edtFromChange(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  public
    bChanging: boolean;
    DateFrom, DateTo: TDateTime;
    selcustomer, selcustbranch: integer;
    selCustName, selbranchname: string;
    procedure CallReport(const bPreview: Boolean);
  end;

var
  STRSCustProdUsageFrm: TSTRSCustProdUsageFrm;

implementation

uses PBLUCust, STPrtMnt, STRPCustProdUsage, CCSCommon, DateSelV5;

{$R *.DFM}

procedure TSTRSCustProdUsageFrm.BitBtn1Click(Sender: TObject);
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
      enableprint(self);
   end;
  pbLUCustFrm.Free;
end;

procedure TSTRSCustProdUsageFrm.BitBtn4Click(Sender: TObject);
begin
  edtCustomer.text := '';
  selCustomer := 0;
  selCustBranch := 0;
end;

procedure TSTRSCustProdUsageFrm.edtFromChange(Sender: TObject);
begin
  enableprint(self);
  if bChanging then exit;
  edtTo.Text := edtFrom.Text ;
end;

procedure TSTRSCustProdUsageFrm.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled := (edtDateFrom.text <> '') and
                      (edtDateTo.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.Enabled;
end;

procedure TSTRSCustProdUsageFrm.CallReport(const bPreview: Boolean);
var
  STRPCustProdUsagefrm: TSTRPCustProdUsagefrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPCustProdUsagefrm := TSTRPCustProdUsagefrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPCustProdUsagefrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then edtFrom.Text := '000000000000';
      if edtTo.Text = '' then edtTo.Text := 'zzzzzzzzzzzz';
      bchanging := false;

      STRPCustProdUsagefrm.Customer := selCustomer;
      STRPCustProdUsagefrm.PartFrom := edtFrom.Text;
      STRPCustProdUsagefrm.PartTo := edtTo.Text;
      STRPCustProdUsagefrm.NotinUse := chkbxExcProd.checked;
      STRPCustProdUsagefrm.DateFrom := DateFrom;
      STRPCustProdUsagefrm.DateTo := DateTo;
      if ChkbxBranches.checked then
        STRPCustProdUsageFrm.Branch := 99
      else
        STRPCustProdUsageFrm.Branch := selCustBranch;


      if selCustomer <> 0 then
        begin
          STRPCustProdUsagefrm.qrlblSelection.caption := 'Customer: '+selCustName;
          if chkBxBranches.checked then
             STRPCustProdUsagefrm.qrlblSelection.caption := STRPCustProdUsagefrm.qrlblSelection.caption + ' (All Branches)'
          else
            STRPCustProdUsagefrm.qrlblSelection.caption := STRPCustProdUsagefrm.qrlblSelection.caption + ' ('+selbranchname+')';
        end
      else
        STRPCustProdUsagefrm.qrlblSelection.caption := '';

      STRPCustProdUsagefrm.qrlblDateSelection.caption := 'Period: '+edtDateFrom.text + ' to '
                                                          + edtDateTo.text;
      if STRPCustProdUsagefrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('Nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          STRPCustProdUsagefrm.qrlblTitle.Caption :=
              STRPCustProdUsagefrm.qrlblTitle.Caption + DateToStr(Date());
          if bPreview then
            STRPCustProdUsagefrm.QuickReport.Preview
          else
          if SetupPrinter(PrinterSettings) then
            STRPCustProdUsagefrm.QuickReport.Print;
        end;
      STRPCustProdUsagefrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;
procedure TSTRSCustProdUsageFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TSTRSCustProdUsageFrm.SpeedButton1Click(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(DateTo);
end;

procedure TSTRSCustProdUsageFrm.BitBtn2Click(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
  enableprint(self);
end;

procedure TSTRSCustProdUsageFrm.BitBtn3Click(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
  enableprint(self);
end;

function TSTRSCustProdUsageFrm.InputDate(TempDate: TDateTime): TDateTime;
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
procedure TSTRSCustProdUsageFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TSTRSCustProdUsageFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TSTRSCustProdUsageFrm.edtDateFromExit(Sender: TObject);
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

procedure TSTRSCustProdUsageFrm.edtDateToExit(Sender: TObject);
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

procedure TSTRSCustProdUsageFrm.FormCreate(Sender: TObject);
begin
  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TSTRSCustProdUsageFrm.btnExcelClick(Sender: TObject);
var
  STRPCustProdUsagefrm: TSTRPCustProdUsagefrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
  STRPCustProdUsagefrm := TSTRPCustProdUsagefrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPCustProdUsagefrm.PrinterSettings := PrinterSettings;

      bChanging := true;
      if edtFrom.Text = '' then edtFrom.Text := '000000000000';
      if edtTo.Text = '' then edtTo.Text := 'zzzzzzzzzzzz';
      bchanging := false;

      STRPCustProdUsagefrm.Customer := selCustomer;
      STRPCustProdUsagefrm.PartFrom := edtFrom.Text;
      STRPCustProdUsagefrm.PartTo := edtTo.Text;
      STRPCustProdUsagefrm.NotinUse := chkbxExcProd.checked;
      STRPCustProdUsagefrm.DateFrom := DateFrom;
      STRPCustProdUsagefrm.DateTo := DateTo;
      if ChkbxBranches.checked then
        STRPCustProdUsageFrm.Branch := 99
      else
        STRPCustProdUsageFrm.Branch := selCustBranch;

      recCount := STRPCustProdUsagefrm.GetDetails(Self);
      if recCount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        STRPCustProdUsagefrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;
        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
      STRPCustProdUsagefrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

end.
