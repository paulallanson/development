unit PBRSCustCatKPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, OleCtnrs, ComCtrls, ExtCtrls;

type
  TPBRSCustCatKPIfrm = class(TForm)
    rgPrdCat: TRadioGroup;
    RepPanel: TPanel;
    lblPrdCat: TLabel;
    edtPrdCat: TEdit;
    btnRep: TButton;
    Label2: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label3: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    CancelBitBtn: TBitBtn;
    ExcelBitBtn: TBitBtn;
    RdGrpRepType: TRadioGroup;
    lblCustBran: TLabel;
    btnCustomer: TButton;
    edtCustomer: TEdit;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    procedure EnablePrint(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure rgPrdCatClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    SelCode: integer;
    SelText : string;
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSCustCatKPIfrm: TPBRSCustCatKPIfrm;

implementation

uses UITypes, PBLUCust, PBLUCategory, CCSCommon, DateSelV5, PBRPCustCatKPI, CCSPrint;

{$R *.dfm}

procedure TPBRSCustCatKPIfrm.btnCustomerClick(Sender: TObject);
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
    end;
    edtCustomer.Text := SelCustText;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBRSCustCatKPIfrm.btnRepClick(Sender: TObject);
begin
 PBLUCategoryFrm := TPBLUCategoryFrm.Create(Self);
  try
    PBLUCategoryFrm.bIs_Lookup := True;
    PBLUCategoryFrm.SelCode := SelCode;
    PBLUCategoryFrm.ShowModal;
    if PBLUCategoryFrm.Selected then
    begin
      SelCode := PBLUCategoryFrm.SelCode;
      SelText := PBLUCategoryFrm.SelName;
    end;
    edtprdCat.Text := SelText;
  finally
    PBLUCategoryFrm.Free;
  end;
end;

procedure TPBRSCustCatKPIfrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSCustCatKPIfrm.DateToButtonClick(Sender: TObject);
begin
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSCustCatKPIfrm.rgPrdCatClick(Sender: TObject);
begin
  if (rgPrdCat.ItemIndex = 0) then
  begin
    RepPanel.Visible := False;
    edtprdCat.Text := '';
  end
  else
  begin
    RepPanel.Visible := True;
  end;
end;

function TPBRSCustCatKPIfrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSCustCatKPIfrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSCustCatKPIfrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSCustCatKPIfrm.FormActivate(Sender: TObject);
begin
  if DateFromEdit.Text = '' then
  begin
    DateFrom := Date - 30;
    DateFromEdit.Text := PBDatestr(DateFrom);
  end;
  if DateToEdit.Text = '' then
  begin
    DateTo := Date;
    DateToEdit.Text := PBDatestr(DateTo);
  end;
end;

procedure TPBRSCustCatKPIfrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSCustCatKPIfrm.CallReport(const bPreview: Boolean);
var
  PBRPCustCatKPIfrm: TPBRPCustCatKPIfrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPCustCatKPIfrm := TPBRPCustCatKPIfrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPCustCatKPIfrm.iCust := SelCustCode;

    if rgPrdCat.ItemIndex = 0 then
      PBRPCustCatKPIfrm.iCat := 0
    else
      PBRPCustCatKPIfrm.iCat := SelCode;

    PBRPCustCatKPIfrm.Datefrom := DateFrom;
    PBRPCustCatKPIfrm.DateTo := DateTo;
    PBRPCustCatKPIfrm.bSummary := (rdgrpRepType.itemindex = 0);
    if PBRPCustCatKPIfrm.GetDetails = 0 then
      begin
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;
    PBRPCustCatKPIfrm.qrlblSelection.caption := SelCustText;
    PBRPCustCatKPIfrm.qrlblDateSelection.caption := 'Delivered between ' + DateFromEdit.Text + ' and ' + DateToEdit.text;
    if bPreview then
      PBRPCustCatKPIfrm.qrpDetails.Preview
    else
    if SetupPrinter(PrinterSettings) then
      PBRPCustCatKPIfrm.qrpDetails.Print;
  finally
    PrinterSettings.free;
    PBRPCustCatKPIfrm.Free;

    Application.ProcessMessages;
  end;
end;

procedure TPBRSCustCatKPIfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSCustCatKPIfrm.EnablePrint(Sender: TObject);
begin
  PreviewBitBtn.Enabled := edtCustomer.Text <> '';
  PrintBitBtn.Enabled := PreviewBitBtn.enabled;
  ExcelBitBtn.enabled := PreviewBitBtn.enabled;
end;

procedure TPBRSCustCatKPIfrm.ExcelBitBtnClick(Sender: TObject);
var
  PBRPCustCatKPIfrm: TPBRPCustCatKPIfrm;
  reccount: integer;
  tempFileName : string;
begin
  PBRPCustCatKPIfrm := TPBRPCustCatKPIfrm.Create(Self);
  try
    PBRPCustCatKPIfrm.iCust := SelCustCode;

    if rgPrdCat.ItemIndex = 0 then
      PBRPCustCatKPIfrm.iCat := 0
    else
      PBRPCustCatKPIfrm.iCat := SelCode;

    PBRPCustCatKPIfrm.Datefrom := DateFrom;
    PBRPCustCatKPIfrm.DateTo := DateTo;
    PBRPCustCatKPIfrm.bSummary := (rdgrpRepType.itemindex = 0);
    recCount := PBRPCustCatKPIfrm.GetDetails;
    if recCount <> 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPCustCatKPIfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;
        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end
    else
      begin
        MessageDlg('There are no records to print', mtError, [mbOK], 0);
      end;
  finally
    PBRPCustCatKPIfrm.Free;
    Application.ProcessMessages;
  end;
end;

end.
