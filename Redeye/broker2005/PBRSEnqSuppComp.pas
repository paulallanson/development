unit PBRSEnqSuppComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, OleCtnrs;

type
  TPBRSEnqSuppCompFrm = class(TForm)
    CancelBitBtn: TBitBtn;
    ExcelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btnRep: TButton;
    edtSupplier: TEdit;
    lblSupplier: TLabel;
    grpBxDate: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateFromEdit: TEdit;
    DateToEdit: TEdit;
    DateFromButton: TSpeedButton;
    DateToButton: TSpeedButton;
    ChkBxInactive: TCheckBox;
    procedure btnRepClick(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure ExcelBitBtnClick(Sender: TObject);
  private
    bPreview: boolean;
    DateFrom, DateTo: TDateTime;
    SelSupplier, SelBranch: integer;
    SelName: string;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure PrintReport(Sender: TObject);
  public

  end;

var
  PBRSEnqSuppCompFrm: TPBRSEnqSuppCompFrm;

implementation

uses DateSelV5, PBLUSupp, CCSCommon, Printers, CCSPrint, PBRPEnqSupplierComp;

{$R *.dfm}

procedure TPBRSEnqSuppCompFrm.btnRepClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.SelCode := SelSupplier;
    PBLUSuppFrm.SelBranch := SelBranch;
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSupplier := PBLUSuppFrm.SelCode;
      SelBranch := PBLUSuppFrm.SelBranch;
      SelName := PBLUSuppFrm.SelName;
      edtSupplier.text := SelName;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
  EnablePrint(self);
end;

procedure TPBRSEnqSuppCompFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSEnqSuppCompFrm.DateToButtonClick(Sender: TObject);
begin
 {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TPBRSEnqSuppCompFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DatefromEdit.Text = '' then
    Exit;
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

procedure TPBRSEnqSuppCompFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateToEdit.Text = '' then
    Exit;
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

function TPBRSEnqSuppCompFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSEnqSuppCompFrm.FormCreate(Sender: TObject);
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

procedure TPBRSEnqSuppCompFrm.EnablePrint(Sender: TObject);
begin
  PrintBitBtn.enabled := edtSupplier.text <> '';
  PreviewBitBtn.enabled := PrintBitBtn.enabled;
  ExcelBitBtn.enabled := PrintBitBtn.enabled;
end;

procedure TPBRSEnqSuppCompFrm.PreviewBitBtnClick(Sender: TObject);
begin
  bPreview := True;
  PrintReport(Self);
end;

procedure TPBRSEnqSuppCompFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  PBRPEnqSupplierCompFrm := TPBRPEnqSupplierCompFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try

      PBRPEnqSupplierCompFrm.PrinterSettings := PrinterSettings;
      PBRPEnqSupplierCompFrm.Preview := bPreview;
      PBRPEnqSupplierCompFrm.Inactive := chkBxInactive.checked;
      PBRPEnqSupplierCompFrm.DateFrom := pbDateStr(DateFromEdit.Text);
      PBRPEnqSupplierCompFrm.DateTo := pbDateStr(DateToEdit.Text);

      PBRPEnqSupplierCompFrm.qrlblDateRange.caption := PBRPEnqSupplierCompFrm.qrlblDateRange.Caption + DateFromEdit.Text +
      ' To '+DateToEdit.Text;

      PBRPEnqSupplierCompFrm.qrlblSelectedSupplier.caption := SelName;

      if chkBxInactive.checked then
        PBRPEnqSupplierCompFrm.qrlblDateRange.caption := PBRPEnqSupplierCompFrm.qrlblDateRange.Caption+ ' Including Inactive Eqnuiries';

      PBRPEnqSupplierCompFrm.iSupplier := SelSupplier;
      PBRPEnqSupplierCompFrm.iBranch := SelBranch;
      PBRPEnqSupplierCompFrm.sSupplierName := edtSupplier.Text;

      if PBRPEnqSupplierCompFrm.GetDetails(Self) = 0 then
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
      else
      begin
        {Actually print or preview the report}
        if (not bPreview) then
        begin
              if SetUpPrinter(PrinterSettings) then
                PBRPEnqSupplierCompFrm.qrpdetails.Print
        end
        else
          PBRPEnqSupplierCompFrm.qrpdetails.Preview;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPEnqSupplierCompFrm.Free;
  end;
end;
procedure TPBRSEnqSuppCompFrm.PrintBitBtnClick(Sender: TObject);
begin
  bPreview := false;
  PrintReport(Self);
end;

procedure TPBRSEnqSuppCompFrm.ExcelBitBtnClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempFilename: string;
begin
  {Setup and print the report}
  PBRPEnqSupplierCompFrm := TPBRPEnqSupplierCompFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPEnqSupplierCompFrm.PrinterSettings := PrinterSettings;
      PBRPEnqSupplierCompFrm.Preview := bPreview;
      PBRPEnqSupplierCompFrm.Inactive := chkBxInactive.checked;
      PBRPEnqSupplierCompFrm.DateFrom := pbDateStr(DateFromEdit.Text);
      PBRPEnqSupplierCompFrm.DateTo := pbDateStr(DateToEdit.Text);

      PBRPEnqSupplierCompFrm.qrlblDateRange.caption := PBRPEnqSupplierCompFrm.qrlblDateRange.Caption + DateFromEdit.Text +
      ' To '+DateToEdit.Text;

      PBRPEnqSupplierCompFrm.qrlblSelectedSupplier.caption := SelName;

      if chkBxInactive.checked then
        PBRPEnqSupplierCompFrm.qrlblDateRange.caption := PBRPEnqSupplierCompFrm.qrlblDateRange.Caption+ ' Including Inactive Eqnuiries';

      PBRPEnqSupplierCompFrm.iSupplier := SelSupplier;
      PBRPEnqSupplierCompFrm.iBranch := SelBranch;
      PBRPEnqSupplierCompFrm.sSupplierName := edtSupplier.Text;

      reccount := PBRPEnqSupplierCompFrm.GetDetails(Self);
      if reccount = 0 then
        begin
          MessageDlg('Nothing to export', mtError, [mbOK], 0);
          exit;
        end;

      self.prgbrExport.Max := recCount;
      tempFileName := getWinTempDir + 'Enquiry Supplier Comparison Report ' + formatdatetime('dd mm yy hhmmss',now)+'.csv';
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;

      PBRPEnqSupplierCompFrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;

      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    finally
      Printersettings.free;
    end;
  finally
    Application.ProcessMessages;
    PBRPEnqSupplierCompFrm.Free;
  end;

end;

end.
