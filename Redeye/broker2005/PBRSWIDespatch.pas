unit PBRSWIDespatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, OleCtnrs;

type
  TPBRSWIDespatchFrm = class(TForm)
    rgRep: TRadioGroup;
    pnlRep: TPanel;
    lblRep: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToEdit: TEdit;
    DateToButton: TSpeedButton;
    pnlCustomer: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    rgCustomer: TRadioGroup;
    btnPrint: TBitBtn;
    btnPreview: TBitBtn;
    CancelBitBtn: TBitBtn;
    btnExcel: TBitBtn;
    Label3: TLabel;
    cbSort1: TComboBox;
    Label4: TLabel;
    cbSort2: TComboBox;
    rgCourier: TRadioGroup;
    pnlCourier: TPanel;
    Label5: TLabel;
    edtCourier: TEdit;
    btnCourier: TButton;
    chkbxPageBreak: TCheckBox;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    procedure CanPrint(Sender: TObject);
    procedure rgCourierClick(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure rgRepClick(Sender: TObject);
    procedure btnCourierClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure DateFromButtonClick(Sender: TObject);
    procedure DateToButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cbSort1Change(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    SelRepCode: integer;
    SelRepText: string;
    SelCustCode, SelCustBranch : integer;
    SelCustText : string;
    SelSuppCode, SelSuppBranch : integer;
    SelSuppText : string;
    SelCourierCode : integer;
    SelCourierText : string;
    DateFrom, DateTo: TDateTime;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallReport(const bPreview: Boolean);
  public
    { Public declarations }
  end;

var
  PBRSWIDespatchFrm: TPBRSWIDespatchFrm;

implementation

uses UITypes, STLUCourier, PBLUCust, PBLURep, ccsCommon, DateSelV5, CCSPrint, PBRPWIDespatch;

{$R *.dfm}

procedure TPBRSWIDespatchFrm.rgCourierClick(Sender: TObject);
begin
  if (rgCourier.ItemIndex = 0) then
  begin
    pnlCourier.Visible := False;
    SelCourierCode := 0;
    SelCourierText := '';
    edtCourier.Text := '';
  end
  else
  begin
    pnlCourier.Visible := True;
  end;
  CanPrint(self);
end;

procedure TPBRSWIDespatchFrm.rgCustomerClick(Sender: TObject);
begin
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustomer.Visible := False;
    SelCustCode := 0;
    SelCustText := '';
    edtCustomer.Text := '';
  end
  else
  begin
    pnlCustomer.Visible := True;
  end;
  CanPrint(self);
end;

procedure TPBRSWIDespatchFrm.rgRepClick(Sender: TObject);
begin
  if (rgRep.ItemIndex = 0) then
  begin
    pnlRep.Visible := False;
    SelRepCode := 0;
    SelRepText := '';
    edtRep.Text := '';
  end
  else
  begin
    pnlRep.Visible := True;
  end;
  CanPrint(self);
end;

procedure TPBRSWIDespatchFrm.btnCourierClick(Sender: TObject);
begin
  STLUCourierFrm := TSTLUCourierFrm.Create(Self);
  try
    STLUCourierFrm.bIs_Lookup := True;
    STLUCourierFrm.bAllow_Upd := False;
    STLUCourierFrm.SelCode := SelSuppCode;
    STLUCourierFrm.ShowModal;
    if STLUCourierFrm.Selected then
    begin
      SelCourierCode := STLUCourierFrm.SelCode;
      SelCourierText := STLUCourierFrm.SelName;
    end;
    edtCourier.Text := SelCourierText;
  finally
    STLUCourierFrm.Free;
  end;
  CanPrint(self);
end;

procedure TPBRSWIDespatchFrm.btnCustomerClick(Sender: TObject);
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
  CanPrint(self);
end;

procedure TPBRSWIDespatchFrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelrepCode := PBLURepFrm.SelCode;
      SelrepText := PBLURepFrm.SelName;
    end;
    edtRep.Text := SelRepText;
  finally
    PBLURepFrm.Free;
  end;
  CanPrint(self);
end;

procedure TPBRSWIDespatchFrm.DateFromEditExit(Sender: TObject);
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

procedure TPBRSWIDespatchFrm.DateToEditExit(Sender: TObject);
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

procedure TPBRSWIDespatchFrm.DateFromButtonClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSWIDespatchFrm.DateToButtonClick(Sender: TObject);
begin
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

function TPBRSWIDespatchFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSWIDespatchFrm.CanPrint(Sender: TObject);
begin
  if ((rgRep.itemIndex = 1) and (SelRepCode = 0)) or
     ((rgCustomer.ItemIndex = 1) and (SelCustCode = 0))  or
     ((rgCourier.ItemIndex = 1) and (SelCourierCode = 0)) then
  begin
    btnPreview.Enabled := false;
    btnPrint.Enabled := false;
    btnExcel.Enabled := false;
  end
  else
  begin
    btnPreview.Enabled := true;
    btnPrint.Enabled := true;
    btnExcel.Enabled := true;
  end;
end;

procedure TPBRSWIDespatchFrm.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  {setting the default content of the sort option edit boxes}
  cbSort1.ItemIndex := 1;
  cbSort2.ItemIndex := 0;

  DateTo := Date+30;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date;
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TPBRSWIDespatchFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSWIDespatchFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSWIDespatchFrm.CallReport(const bPreview: Boolean);
var
  PBRPWIDespatchFrm: TPBRPWIDespatchFrm;
  PrinterSettings: TPrinterSettings;
begin
  PBRPWIDespatchFrm := TPBRPWIDespatchFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPWIDespatchFrm.PrinterSettings := PrinterSettings;
      PBRPWIDespatchFrm.qrgrp1.ForceNewPage := self.chkbxPageBreak.checked;

      PBRPWIDespatchFrm.SortRepBy1 := cbsort1.ItemIndex;
      PBRPWIDespatchFrm.SortRepBy2 := cbsort2.ItemIndex;

      PBRPWIDespatchFrm.courier := SelCourierCode;
      PBRPWIDespatchFrm.customer := SelCustCode;
      PBRPWIDespatchFrm.Rep := SelRepCode;

      PBRPWIDespatchFrm.DateFrom := DateFrom;
      PBRPWIDespatchFrm.DateTo := DateTo;

      if PBRPWIDespatchFrm.GetDetails = 0 then
        begin
          MessageDlg('There is nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          if bPreview then
            PBRPWIDespatchFrm.qrpDetails.Preview
          else
          if SetUpPrinter(PrinterSettings) then
            PBRPWIDespatchFrm.qrpDetails.Print;
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     PBRPWIDespatchFrm.Free;
  end;

end;

procedure TPBRSWIDespatchFrm.cbSort1Change(Sender: TObject);
begin
  { Don't allow duplicate selections }
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
  if (cbSort2.ItemIndex >= 0) and (cbSort1.ItemIndex < 0) then
  begin
    cbSort1.ItemIndex := cbSort2.ItemIndex;
    cbSort2.ItemIndex := -1;
  end;
end;

procedure TPBRSWIDespatchFrm.btnExcelClick(Sender: TObject);
var
  tempFileName: string;
  recCount: integer;
  PrinterSettings: TPrinterSettings;
begin
  PBRPWIDespatchFrm := TPBRPWIDespatchFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPWIDespatchFrm.PrinterSettings := PrinterSettings;

//      PBRPWIDespatchFrm.qrlblTitle.caption := PBRPWIDespatchFrm.qrlblTitle.caption + DateToStr(Date);
//      PBRPWIDespatchFrm.qrgrp1.ForceNewPage := self.chkbxPageBreak.checked;

      PBRPWIDespatchFrm.SortRepBy1 := cbsort1.ItemIndex;
      PBRPWIDespatchFrm.SortRepBy2 := cbsort2.ItemIndex;

      PBRPWIDespatchFrm.courier := SelCourierCode;
      PBRPWIDespatchFrm.customer := SelCustCode;
      PBRPWIDespatchFrm.Rep := SelRepCode;

      PBRPWIDespatchFrm.DateFrom := DateFrom;
      PBRPWIDespatchFrm.DateTo := DateTo;

      recCount := PBRPWIDespatchFrm.GetDetails;
      if recCount = 0 then
        begin
          MessageDlg('There is nothing to print', mtError, [mbOK], 0);
        end
      else
        begin
          self.prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          self.pnlExportPrgrss.BringToFront;
          self.pnlExportPrgrss.Visible := true;
          self.pnlExportPrgrss.Repaint;

          PBRPWIDespatchFrm.ExportToFile(tempFileName);
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
     PBRPWIDespatchFrm.Free;
  end;

end;

end.
