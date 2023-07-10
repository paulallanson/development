unit PBRSProdAmends;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, OleCtnrs, ComCtrls;

type
  TPBRSProdAmendsFrm = class(TForm)
    rgDepartment: TRadioGroup;
    rgCustomer: TRadioGroup;
    pnlDepartment: TPanel;
    lblRep: TLabel;
    edtDepartment: TEdit;
    btnDepartment: TButton;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    TotByRadioGroup: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    btnCancel: TBitBtn;
    btnExcel: TBitBtn;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    chkbxRechargeable: TCheckBox;
    procedure btnDepartmentClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgDepartmentClick(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    SelDepartment, SelCustCode: integer;
    SelCustName: string;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSProdAmendsFrm: TPBRSProdAmendsFrm;

implementation

uses PBLUProcessGroup, PBLUCust, CCSCommon, DateSelV5, PBRPProdAmends, CCSPrint, Printers,
  PBRPSalesByInv;

{$R *.dfm}

procedure TPBRSProdAmendsFrm.btnDepartmentClick(Sender: TObject);
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

procedure TPBRSProdAmendsFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := SelCustCode;
    PBLUCustFrm.bSel_Branch := false;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      SelCustCode := PBLUCustFrm.SelCode;
      SelCustName := PBLUCustFrm.SelName;
      edtCustomer.Text := SelCustName;
    end;
  finally
    PBLUCustFrm.Free;
  end;
  EnablePrint(self);
end;

procedure TPBRSProdAmendsFrm.DateToButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSProdAmendsFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSProdAmendsFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSProdAmendsFrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSProdAmendsFrm.rgDepartmentClick(Sender: TObject);
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

procedure TPBRSProdAmendsFrm.rgCustomerClick(Sender: TObject);
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
  EnablePrint(self);
end;

procedure TPBRSProdAmendsFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSProdAmendsFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date - 7;
  DateFromEdit.Text := PBDatestr(DateFrom);

end;

procedure TPBRSProdAmendsFrm.EnablePrint(Sender: TObject);
begin
  btnPrint.enabled :=
    (
    ((rgDepartment.ItemIndex = 0) and (rgCustomer.ItemIndex = 0)) or
    ((rgDepartment.ItemIndex = 1) and (edtDepartment.Text <> '')) or
    ((rgCustomer.ItemIndex = 1) and (edtCustomer.Text <> ''))
    ) and
    (DateFromEdit.text <> '') and
    (dateToEdit.text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;

end;

procedure TPBRSProdAmendsFrm.CallReport(const bPreview: Boolean);
var
  PBRPProdAmendsfrm: TPBRPProdAmendsfrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPProdAmendsfrm := TPBRPProdAmendsfrm.Create(Self);
   try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPProdAmendsfrm.PrinterSettings := PrinterSettings;
      PBRPProdAmendsfrm.Preview := bPreview;
      PBRPProdAmendsfrm.DateFrom := DateFrom;
      PBRPProdAmendsfrm.DateTo := DateTo;

      PBRPProdAmendsFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
      PBRPProdAmendsFrm.OnlyRechargeables := chkbxRechargeable.checked;

      PBRPProdAmendsfrm.TotalBy := TotByRadioGroup.itemIndex;

      if PBRPProdAmendsfrm.PrepareReport(dateFrom, dateTo, self.selcustCode, self.SelDepartment) > 0 then
        begin
          if bpreview then
            begin
              PBRPProdAmendsfrm.qrpDetails.Preview;
            end
          else
            begin
              if SetUpPrinter(PrinterSettings) then
                PBRPProdAmendsfrm.qrpDetails.Print;
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

procedure TPBRSProdAmendsFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TPBRSProdAmendsFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TPBRSProdAmendsFrm.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  PBRPProdAmendsfrm := TPBRPProdAmendsfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPProdAmendsfrm.PrinterSettings := PrinterSettings;
      PBRPProdAmendsfrm.DateFrom := DateFrom;
      PBRPProdAmendsfrm.DateTo := DateTo;

      PBRPProdAmendsFrm.OnlyRechargeables := chkbxRechargeable.checked;
      PBRPProdAmendsfrm.TotalBy := TotByRadioGroup.itemIndex;

      reccount := PBRPProdAmendsfrm.PrepareReport(dateFrom, dateTo, self.selcustCode, self.SelDepartment);
      if reccount > 0 then
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;

          PBRPProdAmendsfrm.ExportToFile(tempFileName);
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
    PBRPProdAmendsfrm.Free;
    self.visible := true;
  end;

end;

procedure TPBRSProdAmendsFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.Enabled := ((Sender as TRadioGroup).itemindex < 3);
end;

end.
