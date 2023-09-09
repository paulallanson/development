unit PBRSJobBagComplete;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, OleCtnrs, ComCtrls;

type
  TPBRSJobBagCompleteFrm = class(TForm)
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
    rdgrpShowJobs: TRadioGroup;
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
  PBRSJobBagCompleteFrm: TPBRSJobBagCompleteFrm;

implementation

uses
  System.UITypes,
  PBLUAccountManager, PBLUCust, CCSCommon, DateSelV5, printers, CCSPrint, PBRPJobBagComplete,
  pbDatabase, PBLUOps;

{$R *.dfm}

procedure TPBRSJobBagCompleteFrm.btnAccManagerClick(Sender: TObject);
begin
  if dmBroker.UseAccountManagers then
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
    end
  else
    begin
      PBLUOpsFrm := TPBLUOpsFrm.Create(Owner);
      try
        PBLUOpsFrm.bIs_Lookup := True;
        PBLUOpsFrm.SelCode := SelCode;
        PBLUOpsFrm.ShowModal;
        if PBLUOpsFrm.Selected then
          begin
            SelCode := PBLUOpsFrm.SelCode;
            edtAccountManager.text := PBLUOpsFrm.SelName;
          end;
      finally
      end;
    end;
end;

procedure TPBRSJobBagCompleteFrm.btnCustomerClick(Sender: TObject);
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

procedure TPBRSJobBagCompleteFrm.DateFromEditExit(Sender: TObject);
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
  end
  else
    DateFrom := 0;

end;

procedure TPBRSJobBagCompleteFrm.DateToEditExit(Sender: TObject);
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
  end
  else
    DateTo := 0;
end;

procedure TPBRSJobBagCompleteFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSJobBagCompleteFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSJobBagCompleteFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSJobBagCompleteFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSJobBagCompleteFrm.CallReport(const bPreview: Boolean);
var
  PBRPJobBagCompletefrm: TPBRPJobBagCompletefrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPJobBagCompletefrm := TPBRPJobBagCompletefrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      if DateFromEdit.Text = '' then
        PBRPJobBagCompleteFrm.QRLblTotBy.caption :='Dated From: First'
      else
        PBRPJobBagCompleteFrm.QRLblTotBy.caption := 'Dated From: '+ DateFromEdit.Text ;

      if DateToEdit.Text = '' then
        PBRPJobBagCompleteFrm.QRLblTotBy.caption := PBRPJobBagCompleteFrm.QRLblTotBy.caption + ' - Last'
      else
        PBRPJobBagCompleteFrm.QRLblTotBy.caption := PBRPJobBagCompleteFrm.QRLblTotBy.caption + ' - ' + DateToEdit.Text;

      if rdgrpTotals.ItemIndex = 0 then
        PBRPJobBagCompleteFrm.TotalByAccManager := True
      else
      if rdgrpTotals.ItemIndex = 1 then
        PBRPJobBagCompleteFrm.TotalByCust := True
      else
        begin
          PBRPJobBagCompleteFrm.TotalByCust := False;
          PBRPJobBagCompleteFrm.TotalByAccManager := false;
        end;

      if rdgrpShowJobs.ItemIndex = 0 then
        PBRPJobBagCompleteFrm.ShowInvThisWeek := True
      else
      if rdgrpShowJobs.ItemIndex = 1 then
        PBRPJobBagCompleteFrm.ShowComplete := True;

      if rgAccManager.itemindex = 0 then
        PBRPJobBagCompletefrm.AccMgr := 0
      else
        PBRPJobBagCompletefrm.AccMgr := SelCode;

      if rgCustomer.itemindex = 0 then
        PBRPJobBagCompletefrm.Customer := 0
      else
        PBRPJobBagCompletefrm.Customer := SelCustCode;

      PBRPJobBagCompletefrm.DateFrom := DateFrom;
      PBRPJobBagCompletefrm.DateTo := DateTo;

      PBRPJobBagCompletefrm.bInvoicedValues := false;
      PBRPJobBagCompletefrm.bSummary := true;

      if PBRPJobBagCompletefrm.GetDetails = 0 then
        begin
          messagedlg('Nothing to Report', mtInformation, [mbOk], 0);
          exit;
        end;
      if bPreview then
        PBRPJobBagCompletefrm.qrpDetails.Preview
      else
      if SetUpPrinter(PrinterSettings) then
        PBRPJobBagCompletefrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPJobBagCompletefrm.free;
  end;
end;

procedure TPBRSJobBagCompleteFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSJobBagCompleteFrm.rgAccManagerClick(Sender: TObject);
begin
  pnlAccManager.Visible := rgAccManager.ItemIndex = 1;
end;

procedure TPBRSJobBagCompleteFrm.rgCustomerClick(Sender: TObject);
begin
  pnlCustomer.Visible := rgCustomer.ItemIndex = 1;
end;

procedure TPBRSJobBagCompleteFrm.FormActivate(Sender: TObject);
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

procedure TPBRSJobBagCompleteFrm.btnExcelClick(Sender: TObject);
var
  recCount: integer;
  tempFileName: string;
  PBRPJobBagCompletefrm: TPBRPJobBagCompletefrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPJobBagCompletefrm := TPBRPJobBagCompletefrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      if rdgrpTotals.ItemIndex = 0 then
        PBRPJobBagCompleteFrm.TotalByAccManager := True
      else
      if rdgrpTotals.ItemIndex = 1 then
        PBRPJobBagCompleteFrm.TotalByCust := True
      else
        begin
          PBRPJobBagCompleteFrm.TotalByCust := False;
          PBRPJobBagCompleteFrm.TotalByAccManager := false;
        end;

      if rdgrpShowJobs.ItemIndex = 0 then
        PBRPJobBagCompleteFrm.ShowInvThisWeek := True
      else
      if rdgrpShowJobs.ItemIndex = 1 then
        PBRPJobBagCompleteFrm.ShowComplete := True;

      if rgAccManager.itemindex = 0 then
        PBRPJobBagCompletefrm.AccMgr := 0
      else
        PBRPJobBagCompletefrm.AccMgr := SelCode;

      if rgCustomer.itemindex = 0 then
        PBRPJobBagCompletefrm.Customer := 0
      else
        PBRPJobBagCompletefrm.Customer := SelCustCode;

      PBRPJobBagCompletefrm.DateFrom := DateFrom;
      PBRPJobBagCompletefrm.DateTo := DateTo;

      PBRPJobBagCompletefrm.bInvoicedValues := false;
      PBRPJobBagCompletefrm.bSummary := true;

      recCount := PBRPJobBagCompletefrm.GetDetails;
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

          PBRPJobBagCompletefrm.ExportToFile(tempFileName);
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
    PBRPJobBagCompletefrm.free;
  end;
end;

end.
