unit PBRSProdWeekly;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, OleCtnrs, ComCtrls;

type
  TPBRSProdWeeklyFrm = class(TForm)
    rgDepartment: TRadioGroup;
    pnlDepartment: TPanel;
    lblRep: TLabel;
    edtDepartment: TEdit;
    btnDepartment: TButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    btnCancel: TBitBtn;
    btnExcel: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure btnDepartmentClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgDepartmentClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    SelDepartment: integer;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSProdWeeklyFrm: TPBRSProdWeeklyFrm;

implementation

uses
  System.UITypes,
  PBLUProcessGroup, CCSCommon, DateSelV5, CCSPrint, Printers,
  PBRPProdWeekly;

{$R *.dfm}

procedure TPBRSProdWeeklyFrm.btnDepartmentClick(Sender: TObject);
begin
  PBLUProcessGroupFrm := TPBLUProcessGroupFrm.create(self);

  try
    PBLUProcessGroupFrm.bIs_Lookup := True;
    PBLUProcessGroupFrm.bAllow_Upd := False;
    PBLUProcessGroupFrm.SelCode := SelDepartment;
    PBLUProcessGroupFrm.showmodal;
    if PBLUProcessGroupFrm.Selected then
    begin
      SelDepartment := PBLUProcessGroupFrm.SelCode;
      edtDepartment.Text := PBLUProcessGroupFrm.SelName;
    end;
  finally
    PBLUProcessGroupFrm.free;
  end;
  EnablePrint(self);

end;

procedure TPBRSProdWeeklyFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSProdWeeklyFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSProdWeeklyFrm.DateFromEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DatefromEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateFromEdit.SetFocus;
      EnablePrint(self);
      Exit;
    end;
  end;

  DateFromEdit.Text := PBDatestr(NewDate);
  DateFrom := NewDate;
  EnablePrint(self);
end;

procedure TPBRSProdWeeklyFrm.DateToEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(DateToEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateToEdit.SetFocus;
      EnablePrint(self);
      Exit;
    end;
  end;

  DateToEdit.Text := PBDatestr(NewDate);
  DateTo := NewDate;
  EnablePrint(self);
end;

procedure TPBRSProdWeeklyFrm.rgDepartmentClick(Sender: TObject);
begin
  if (rgDepartment.ItemIndex = 0) then
  begin
    pnlDepartment.Visible := False;
    EdtDepartment.Text := '';
  end
  else
  begin
    pnlDepartment.Visible := True;
  end;
  EnablePrint(self);
end;

procedure TPBRSProdWeeklyFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSProdWeeklyFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 7;
  DateFromEdit.Text := PBDatestr(DateFrom);

end;

procedure TPBRSProdWeeklyFrm.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled :=
    (
    ((rgDepartment.ItemIndex = 0)) or
    ((rgDepartment.ItemIndex = 1) and (edtDepartment.Text <> ''))
    ) and
    (DateFromEdit.text <> '') and
    (DateToEdit.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;

end;

procedure TPBRSProdWeeklyFrm.CallReport(const bPreview: Boolean);
var
  PBRPProdWeeklyFrm: TPBRPProdWeeklyFrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPProdWeeklyFrm := TPBRPProdWeeklyFrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPProdWeeklyFrm.PrinterSettings := PrinterSettings;
      PBRPProdWeeklyFrm.Preview := bPreview;
      PBRPProdWeeklyFrm.DateFrom := DateFrom;
      PBRPProdWeeklyFrm.DateTo := DateTo;

      if rgDepartment.ItemIndex = 0 then
        PBRPProdWeeklyFrm.iDepartment := 0
      else
        PBRPProdWeeklyFrm.iDepartment := SelDepartment;

      if PBRPProdWeeklyFrm.PrepareReport(dateFrom, dateTo, self.SelDepartment) > 0 then
        begin
          if bpreview then
            begin
              PBRPProdWeeklyFrm.qrpDetails.Preview;
            end
          else
            begin
              if SetUpPrinter(PrinterSettings) then
                PBRPProdWeeklyFrm.qrpDetails.Print;
            end;
        end
      else
        begin
          messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TPBRSProdWeeklyFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSProdWeeklyFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSProdWeeklyFrm.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  PBRPProdWeeklyFrm := TPBRPProdWeeklyFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPProdWeeklyFrm.PrinterSettings := PrinterSettings;
      PBRPProdWeeklyFrm.DateFrom := DateFrom;
      PBRPProdWeeklyFrm.DateTo := DateTo;

      if rgDepartment.ItemIndex = 0 then
        PBRPProdWeeklyFrm.iDepartment := 0
      else
        PBRPProdWeeklyFrm.iDepartment := SelDepartment;

      reccount := PBRPProdWeeklyFrm.PrepareReport(dateFrom, dateTo, self.SelDepartment);
      if reccount > 0 then
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;

          PBRPProdWeeklyFrm.ExportToFile(tempFileName);
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
    end;
  finally
    PBRPProdWeeklyFrm.Free;
    self.visible := true;
  end;

end;

procedure TPBRSProdWeeklyFrm.FormShow(Sender: TObject);
begin
  rgDepartment.ItemIndex := 1;
end;

end.
