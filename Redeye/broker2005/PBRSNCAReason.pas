unit PBRSNCAReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ExtCtrls, Buttons, DateSelV5,  CCSPrint,
  OleCtnrs, ComCtrls;

type
  TPBRSNCAReasonFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    pnlReasonSearch: TPanel;
    lblCustBran: TLabel;
    edtReason: TEdit;
    btnReason: TButton;
    CancelBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDateFrom: TEdit;
    btbtnDateFrom: TBitBtn;
    Label2: TLabel;
    edtDateTo: TEdit;
    btbtnDateTo: TBitBtn;
    rdgrpReason: TRadioGroup;
    pnlDeptSearch: TPanel;
    Label3: TLabel;
    edtDept: TEdit;
    btnDeptLU: TButton;
    rdgrpDept: TRadioGroup;
    TotByRadioGroup: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    btnExcel: TBitBtn;
    rdgrpCategory: TRadioGroup;
    pnlCategorySearch: TPanel;
    Label4: TLabel;
    edtCategory: TEdit;
    btnCategoryLU: TButton;
    procedure btnReasonClick(Sender: TObject);
    procedure rdgrpReasonClick(Sender: TObject);
    procedure btnDeptLUClick(Sender: TObject);
    procedure rdgrpDeptClick(Sender: TObject);
    procedure btbtnDateFromClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure btbtnDateToClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure edtDateToExit(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edtDeptChange(Sender: TObject);
    procedure btnCategoryLUClick(Sender: TObject);
    procedure rdgrpCategoryClick(Sender: TObject);
  private
    category: integer;
    reason: integer;
    DeptCode: integer;
    dateFrom: TDateTime;
    dateTo: TDateTime;
    procedure canPrint;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure RunReport(preview: boolean);
    procedure RuntoExcel;
  public
    { Public declarations }
  end;

var
  PBRSNCAReasonFrm: TPBRSNCAReasonFrm;

implementation

uses
  System.UITypes,
  PBDatabase, PBPOObjects, CCSCommon, PBRPNCAReason, PBLUNonConformType, PBLUNonConformDept,
  PBLUNonConformCat;

{$R *.DFM}

procedure TPBRSNCAReasonFrm.btnReasonClick(Sender: TObject);
begin
  PBLUNonConformTypeFrm := TPBLUNonConformTypeFrm.Create(Self);
  try
    PBLUNonConformTypeFrm.bIs_Lookup := True;
    PBLUNonConformTypeFrm.bAllow_Upd := False;
    PBLUNonConformTypeFrm.SelCode := reason;
    PBLUNonConformTypeFrm.ShowModal;
    if PBLUNonConformTypeFrm.Selected then
    begin
      reason := PBLUNonConformTypeFrm.SelCode;
      edtReason.Text := PBLUNonConformTypeFrm.SelName;
    end;
  finally
    PBLUNonConformTypeFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSNCAReasonFrm.rdgrpReasonClick(Sender: TObject);
begin
  pnlReasonSearch.visible := rdgrpReason.itemIndex = 1;
  if pnlReasonSearch.visible = False then
  begin
    reason := 0;
    edtReason.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSNCAReasonFrm.btnDeptLUClick(Sender: TObject);
begin
  PBLUNonConformDeptFrm := TPBLUNonConformDeptFrm.Create(Self);
  try
    PBLUNonConformDeptFrm.bIs_Lookup := True;
    PBLUNonConformDeptFrm.bAllow_Upd := False;
    PBLUNonConformDeptFrm.SelCode := DeptCode;
    PBLUNonConformDeptFrm.ShowModal;
    if PBLUNonConformDeptFrm.Selected then
    begin
      DeptCode := PBLUNonConformDeptFrm.SelCode;
      edtDept.Text := PBLUNonConformDeptFrm.SelName ;
    end;
  finally
    PBLUNonConformDeptFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSNCAReasonFrm.rdgrpDeptClick(Sender: TObject);
begin
  pnlDeptSearch.visible := rdgrpDept.itemIndex = 1;
  if pnlDeptSearch.visible = False then
  begin
    DeptCode := 0;
    edtDept.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSNCAReasonFrm.canPrint;
begin
  if ((rdgrpReason.itemIndex = 1) and (reason = 0)) or
     ((rdgrpCategory.ItemIndex = 1) and (edtCategory.text = ''))  or
     ((rdgrpDept.ItemIndex = 1) and (edtDept.text = '')) then
  begin
    PreviewBitBtn.Enabled := false;
    PrintBitBtn.Enabled := false;
    btnExcel.Enabled := false;
  end
  else
  begin
    PreviewBitBtn.Enabled := true;
    PrintBitBtn.Enabled := true;
    btnExcel.Enabled := true;
  end;
end;

procedure TPBRSNCAReasonFrm.btbtnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  if datefrom = 0 then
    datefrom := date - 30;
    
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := PBDatestr(DateFrom);
  canprint;
end;

function TPBRSNCAReasonFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TPBRSNCAReasonFrm.FormCreate(Sender: TObject);
begin
  self.DeptCode := 0;
  self.reason := 0;

  DateTo := Date;
  edtDateTo.Text := PBDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := PBDatestr(DateFrom);
end;

procedure TPBRSNCAReasonFrm.FormShow(Sender: TObject);
begin
  self.canPrint;
end;

procedure TPBRSNCAReasonFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPNCAReasonFrm := TPBRPNCAReasonFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    if category = 0 then
      PBRPNCAReasonFrm.qrlblCategories.caption := 'All Categories'
    else
      PBRPNCAReasonFrm.qrlblCategories.caption := 'Category: ' + edtcategory.text;

    PBRPNCAReasonFrm.Totalby := TotByRadioGroup.itemindex;
    PBRPNCAReasonFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;
    PBRPNCAReasonFrm.PrinterSettings := PrinterSettings;

    if PBRPNCAReasonFrm.PrepareReport(dateFrom, dateTo, self.DeptCode, self.reason, self.category) > 0 then
    begin
      if preview then
      begin
        PBRPNCAReasonFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPNCAReasonFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPNCAReasonFrm.Free;
    self.visible := true;
  end;
end;

procedure TPBRSNCAReasonFrm.PreviewBitBtnClick(Sender: TObject);
begin
  self.RunReport(true);
end;

procedure TPBRSNCAReasonFrm.PrintBitBtnClick(Sender: TObject);
begin
  self.RunReport(false);
end;

procedure TPBRSNCAReasonFrm.btbtnDateToClick(Sender: TObject);
begin
  {Access the date component}
  if dateto = 0 then
    dateto := date;

  DateTo := InputDate(DateTo);
  edtDateTo.Text := PBDatestr(dateTo);
  canprint;
end;

procedure TPBRSNCAReasonFrm.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateFrom.Text <> '' then
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
end;

procedure TPBRSNCAReasonFrm.edtDateToExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtDateTo.Text <> '' then
  begin
  try
    NewDate := StrToDate(edtDateTo.Text);
    except
      begin
        MessageDlg('Invalid Date', mtError, [mbOk], 0);
        edtDateTo.SetFocus;
        Exit;
      end;
    end;
    edtDateTo.Text := PBDatestr(NewDate);
    DateTo := NewDate;
  end;
end;

procedure TPBRSNCAReasonFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.Enabled := ((Sender as TRadioGroup).itemindex < 2);
end;

procedure TPBRSNCAReasonFrm.btnExcelClick(Sender: TObject);
begin
  RuntoExcel;
end;

procedure TPBRSNCAReasonFrm.RuntoExcel;
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  PBRPNCAReasonFrm := TPBRPNCAReasonFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
    PBRPNCAReasonFrm.Totalby := TotByRadioGroup.itemindex;

    PBRPNCAReasonFrm.PrinterSettings := PrinterSettings;
    reccount := PBRPNCAReasonFrm.PrepareReport(dateFrom, dateTo, self.DeptCode, self.reason, self.category);
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPNCAReasonFrm.ExportToFile(tempFileName);
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
    PBRPNCAReasonFrm.Free;
    self.visible := true;
  end;

end;

procedure TPBRSNCAReasonFrm.edtDeptChange(Sender: TObject);
begin
  CanPrint;
end;

procedure TPBRSNCAReasonFrm.btnCategoryLUClick(Sender: TObject);
begin
  PBLUNonConformCatFrm := TPBLUNonConformCatFrm.Create(Self);
  try
    PBLUNonConformCatFrm.bIs_Lookup := True;
    PBLUNonConformCatFrm.bAllow_Upd := False;
    PBLUNonConformCatFrm.SelCode := category;
    PBLUNonConformCatFrm.ShowModal;
    if PBLUNonConformCatFrm.Selected then
    begin
      category := PBLUNonConformCatFrm.SelCode;
      edtCategory.Text := PBLUNonConformCatFrm.SelName;
    end;
  finally
    PBLUNonConformCatFrm.Free;
  end;
  self.canPrint;

end;

procedure TPBRSNCAReasonFrm.rdgrpCategoryClick(Sender: TObject);
begin
  pnlCategorySearch.visible := rdgrpCategory.itemIndex = 1;
  if pnlCategorySearch.visible = False then
  begin
    category := 0;
    edtCategory.text := '';
  end;
  self.canPrint;

end;

end.
