unit PBRSJobBagWIPStkReq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, OleCtnrs, ComCtrls;

type
  TPBRSJobBagWIPStkReqFrm = class(TForm)
    DateFromEdit: TEdit;
    Label1: TLabel;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    DateToEdit: TEdit;
    Label2: TLabel;
    rgAccManager: TRadioGroup;
    pnlAccManager: TPanel;
    lblSupplier: TLabel;
    edtAccountManager: TEdit;
    btnAccManager: TButton;
    rgCustomer: TRadioGroup;
    pnlCustomer: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    CancelBitBtn: TBitBtn;
    btnExcel: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    rdgrpTotals: TRadioGroup;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure btnAccManagerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure rgAccManagerClick(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    FActivated: boolean;
    SelCode, selCustCode, SelCustBranch: integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSJobBagWIPStkReqFrm: TPBRSJobBagWIPStkReqFrm;

implementation

uses PBLUAccountManager, PBLUCust, CCSCommon, DateSelV5, PBRPJobBagWIPStkReq, printers, CCSPrint;

{$R *.dfm}

procedure TPBRSJobBagWIPStkReqFrm.btnAccManagerClick(Sender: TObject);
begin
  PBLUAccountManagerFrm := TPBLUAccountManagerfrm.Create(Self);
  try
    PBLUAccountManagerFrm.SelCode := SelCode;
    PBLUAccountManagerFrm.bIs_Lookup := True;
    PBLUAccountManagerFrm.ShowModal;
    if PBLUAccountManagerFrm.Selected then
    begin
      SelCode := PBLUAccountManagerFrm.SelCode;
      edtAccountManager.text := PBLUAccountManagerFrm.SelName;
    end;
  finally
    PBLUAccountManagerFrm.Free;
  end;

end;

procedure TPBRSJobBagWIPStkReqFrm.btnCustomerClick(Sender: TObject);
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
      edtCustomer.text := PBLUCustFrm.SelName + ' / ' + PBLUCustFrm.SelBranchName;
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBRSJobBagWIPStkReqFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateFromEdit.Text <> '' then
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
end;

procedure TPBRSJobBagWIPStkReqFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text <> '' then
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
end;

procedure TPBRSJobBagWIPStkReqFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSJobBagWIPStkReqFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSJobBagWIPStkReqFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSJobBagWIPStkReqFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSJobBagWIPStkReqFrm.CallReport(const bPreview: Boolean);
var
  PBRPJobBagWIPStkReqfrm: TPBRPJobBagWIPStkReqfrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPJobBagWIPStkReqfrm := TPBRPJobBagWIPStkReqfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPJobBagWIPStkReqfrm.PrinterSettings := PrinterSettings;
      PBRPJobBagWIPStkReqfrm.sortby := rdgrpTotals.ItemIndex;

      if rgAccManager.itemindex = 0 then
        PBRPJobBagWIPStkReqfrm.AccMgr := 0
      else
        PBRPJobBagWIPStkReqfrm.AccMgr := SelCode;

      if rgCustomer.itemindex = 0 then
        PBRPJobBagWIPStkReqfrm.Customer := 0
      else
        PBRPJobBagWIPStkReqfrm.Customer := SelCustCode;

      PBRPJobBagWIPStkReqfrm.DateFrom := DateFrom;
      PBRPJobBagWIPStkReqfrm.DateTo := DateTo;

      if PBRPJobBagWIPStkReqfrm.GetDetails = 0 then
        begin
          messagedlg('Nothing to Report', mtInformation, [mbOk], 0);
          exit;
        end;
      if bPreview then
        PBRPJobBagWIPStkReqfrm.qrpDetails.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPJobBagWIPStkReqfrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPJobBagWIPStkReqfrm.free;
  end;
end;

procedure TPBRSJobBagWIPStkReqFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSJobBagWIPStkReqFrm.rgAccManagerClick(Sender: TObject);
begin
  pnlAccManager.Visible := rgAccManager.ItemIndex = 1;
end;

procedure TPBRSJobBagWIPStkReqFrm.rgCustomerClick(Sender: TObject);
begin
  pnlCustomer.Visible := rgCustomer.ItemIndex = 1;
end;

procedure TPBRSJobBagWIPStkReqFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    rgAccManager.itemindex := 0;
    rgCustomer.ItemIndex := 0;
    rgAccManagerClick(nil);
    rgCustomerClick(nil);
    FActivated := true;
    DateTo := date;
    DateToEdit.Text := PBDatestr(DateTo);
  end;

end;

procedure TPBRSJobBagWIPStkReqFrm.btnExcelClick(Sender: TObject);
var
  recCount: integer;
  tempFileName: string;
  PBRPJobBagWIPStkReqfrm: TPBRPJobBagWIPStkReqfrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPJobBagWIPStkReqfrm := TPBRPJobBagWIPStkReqfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPJobBagWIPStkReqfrm.PrinterSettings := PrinterSettings;
      PBRPJobBagWIPStkReqfrm.sortby := rdgrpTotals.ItemIndex;

      if rgAccManager.itemindex = 0 then
        PBRPJobBagWIPStkReqfrm.AccMgr := 0
      else
        PBRPJobBagWIPStkReqfrm.AccMgr := SelCode;

      if rgCustomer.itemindex = 0 then
        PBRPJobBagWIPStkReqfrm.Customer := 0
      else
        PBRPJobBagWIPStkReqfrm.Customer := SelCustCode;

      PBRPJobBagWIPStkReqfrm.DateFrom := DateFrom;
      PBRPJobBagWIPStkReqfrm.DateTo := DateTo;

      recCount := PBRPJobBagWIPStkReqfrm.GetDetails;
      if recCount = 0 then
        begin
          messagedlg('Nothing to Report', mtInformation, [mbOk], 0);
          exit;
        end
      else
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.BringToFront;
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;

          PBRPJobBagWIPStkReqfrm.ExportToFile(tempFileName);
          self.pnlExportPrgrss.visible := false;
          self.Repaint;
          self.prgbrExport.Position := 0;
          self.OleContainer1.CreateLinkToFile(tempFileName, false);
          self.OleContainer1.DoVerb(0);
        end;
   finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPJobBagWIPStkReqfrm.free;
  end;
end;

end.
