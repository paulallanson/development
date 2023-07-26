unit PBRSSalesInvVerif;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, DateSelV5, PBPOObjects, OleCtnrs, CCSCommon, ComCtrls;

type
  TPBRSSalesInvVerifFrm = class(TForm)
    pnlControls: TPanel;
    rgCustomer: TRadioGroup;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    TotByRadioGroup: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    rgAccManager: TRadioGroup;
    AccManagerPanel: TPanel;
    lblRep: TLabel;
    edtAccManager: TEdit;
    btnAccManager: TButton;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    DateToEdit: TEdit;
    Label2: TLabel;
    OleContainer1: TOleContainer;
    CancelBitBtn: TBitBtn;
    btbtnExcel: TBitBtn;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure btnAccManagerClick(Sender: TObject);
    procedure rgAccManagerClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
  private
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    DateFrom, DateTo: TDateTime;
    SelAccCode: integer;
    SelAccText : string;
    procedure CallReport(const bPreview : Boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  PBRSSalesInvVerifFrm: TPBRSSalesInvVerifFrm;

implementation

uses pbDatabase, PBLUCust, pbMainMenu, PBRPSalesInvVerif,
  PBLUAccountManager, PBLUOps;

{$R *.DFM}

procedure TPBRSSalesInvVerifFrm.FormCreate(Sender: TObject);
begin
//  dmBroker.ScreenAccessControl(Self,'PBSalesByInvBitBtn',PBMenuMainfrm.iOperator,0,PBMenuMainfrm.iRep) ;
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSSalesInvVerifFrm.rgCustomerClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
  end
  else
  begin
    pnlCustSearch.Visible := True;
  end;
end;

procedure TPBRSSalesInvVerifFrm.btnCustomerClick(Sender: TObject);
{creates the Cust look up form, stores the cust and branch number, displays the cust name and branch name in the Cust edit box}
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

procedure TPBRSSalesInvVerifFrm.CallReport(const bPreview: Boolean);
var
  PBRPSalesInvVerifFrm: TPBRPSalesInvVerifFrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPSalesInvVerifFrm := TPBRPSalesInvVerifFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesInvVerifFrm.PrinterSettings := PrinterSettings;

      if TotByRadioGroup.itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPSalesInvVerifFrm.TotalByAccMgr := True
          else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPSalesInvVerifFrm.TotalByCust := True
         else
            begin
              PBRPSalesInvVerifFrm.TotalByCust := False;
              PBRPSalesInvVerifFrm.TotalByAccMgr := False;
            end;
        end;

      if rgCustomer.ItemIndex = 0 then
        PBRPSalesInvVerifFrm.Customer := 0
      else
        PBRPSalesInvVerifFrm.Customer := SelCustCode;

      if rgAccManager.ItemIndex = 0 then
        PBRPSalesInvVerifFrm.AccManager := 0
      else
        PBRPSalesInvVerifFrm.AccManager := SelAccCode;

      PBRPSalesInvVerifFrm.dateFrom := DateFrom;
      PBRPSalesInvVerifFrm.dateTo := DateTo;
      
      PBRPSalesInvVerifFrm.qrlblDateRange.caption :=
      PBRPSalesInvVerifFrm.qrlblDateRange.caption + DateFromEdit.Text +
          ' to: ' + DateToEdit.Text;

      if PBRPSalesINvVeriffrm.GetDetails = 0 then
          MessageDlg('No records in selected range', mtError, [mbOK], 0)
      else
        begin
          PBRPSalesInvVerifFrm.repQRGroup.ForceNewPage := (chkbxPageBreak.checked);
          if bPreview then
            PBRPSalesInvVerifFrm.qckrpSalesByInv.Preview
          else
            if SetUpPrinter(PrinterSettings) then
              PBRPSalesInvVerifFrm.qckrpSalesByInv.Print;
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSalesInvVerifFrm.Free;
  end;
end;

procedure TPBRSSalesInvVerifFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSSalesInvVerifFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSSalesInvVerifFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSSalesInvVerifFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSSalesInvVerifFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSSalesInvVerifFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSSalesInvVerifFrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSSalesInvVerifFrm.btnAccManagerClick(Sender: TObject);
begin
  if dmBroker.UseAccountManagers then
    begin
      PBLUAccountManagerFrm := TPBLUAccountManagerFrm.Create(Self);
      try
        PBLUAccountManagerFrm.bIs_Lookup := True;
        PBLUAccountManagerFrm.bAllow_Upd := False;
        PBLUAccountManagerFrm.SelCode := SelAccCode;
        PBLUAccountManagerFrm.ShowModal;
        if PBLUAccountManagerFrm.Selected then
          begin
            SelAccCode := PBLUAccountManagerFrm.SelCode;
            SelAccText := PBLUAccountManagerFrm.SelName;
          end;
        edtAccManager.Text := SelAccText;
      finally
        PBLUAccountManagerFrm.Free;
      end
    end
  else
    begin
      PBLUOpsFrm := TPBLUOpsFrm.Create(Self);
      try
        PBLUOpsFrm.bIs_Lookup := True;
        PBLUOpsFrm.bAllow_Upd := False;
        PBLUOpsFrm.SelCode := SelAccCode;
        PBLUOpsFrm.ShowModal;
        if PBLUOpsFrm.Selected then
          begin
            SelAccCode := PBLUOpsFrm.SelCode;
            SelAccText := PBLUOpsFrm.SelName;
          end;
        edtAccManager.Text := SelAccText;
      finally
        PBLUOpsFrm.Free;
      end
    end
end;

procedure TPBRSSalesInvVerifFrm.rgAccManagerClick(Sender: TObject);
begin
  if (rgAccManager.ItemIndex = 0) then
  begin
    AccManagerPanel.Visible := False;
    EdtAccManager.Text := '';
  end
  else
  begin
    AccManagerPanel.Visible := True;
  end;
end;

procedure TPBRSSalesInvVerifFrm.btbtnExcelClick(Sender: TObject);
var
  PBRPSalesInvVerifFrm: TPBRPSalesInvVerifFrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
  PBRPSalesInvVerifFrm := TPBRPSalesInvVerifFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesInvVerifFrm.PrinterSettings := PrinterSettings;

      if TotByRadioGroup.itemIndex >= 0 then
        begin
          if TotByRadioGroup.ItemIndex = 0 then
            PBRPSalesInvVerifFrm.TotalByAccMgr := True
          else
            if TotByRadioGroup.ItemIndex = 1 then
              PBRPSalesInvVerifFrm.TotalByCust := True
         else
            begin
              PBRPSalesInvVerifFrm.TotalByCust := False;
              PBRPSalesInvVerifFrm.TotalByAccMgr := False;
            end;
        end;

      if rgCustomer.ItemIndex = 0 then
        PBRPSalesInvVerifFrm.Customer := 0
      else
        PBRPSalesInvVerifFrm.Customer := SelCustCode;

      if rgAccManager.ItemIndex = 0 then
        PBRPSalesInvVerifFrm.AccManager := 0
      else
        PBRPSalesInvVerifFrm.AccManager := SelAccCode;

      PBRPSalesInvVerifFrm.dateFrom := DateFrom;
      PBRPSalesInvVerifFrm.dateTo := DateTo;

      recCount := PBRPSalesINvVeriffrm.GetDetails;

      if recCount = 0 then
          MessageDlg('No records in selected range', mtError, [mbOK], 0)
      else
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;


          PBRPSalesInvVerifFrm.ExportToFile(tempFileName);
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
    PBRPSalesInvVerifFrm.Free;
  end;
end;

procedure TPBRSSalesInvVerifFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.enabled := TotByRadioGroup.itemindex <> 2;
end;

end.
