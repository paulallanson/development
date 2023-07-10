unit WTRSRemedialType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, ExtCtrls, Buttons, DateSelV5,
  OleCtnrs, ComCtrls;

type
  TfrmWTRSRemedialType = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    pnlReasonSearch: TPanel;
    lblCustBran: TLabel;
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
    cmbCategory: TComboBox;
    cmbReason: TComboBox;
    cmbDept: TComboBox;
    qryCategory: TQuery;
    qryType: TQuery;
    qryDept: TQuery;
    rdgrpShow: TRadioGroup;
    procedure rdgrpReasonClick(Sender: TObject);
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
    procedure rdgrpCategoryClick(Sender: TObject);
    procedure cmbCategoryChange(Sender: TObject);
    procedure cmbReasonChange(Sender: TObject);
    procedure cmbDeptChange(Sender: TObject);
  private
    category: integer;
    reason: integer;
    Dept: integer;
    dateFrom: TDateTime;
    dateTo: TDateTime;
    procedure canPrint;
    procedure LoadCategories;
    procedure LoadDepts;
    procedure LoadReasons;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure RunReport(preview: boolean);
    procedure RuntoExcel;
  public
    { Public declarations }
  end;

var
  frmWTRSRemedialType: TfrmWTRSRemedialType;

implementation

uses wtLURemedialType, wtLURemedialDept, WTRPRemedialType, wtLURemedialCategory, AllCommon;

{$R *.DFM}

procedure TfrmWTRSRemedialType.rdgrpReasonClick(Sender: TObject);
begin
  case rdgrpReason.itemindex of
  0:  begin
        Reason := 0;
        cmbReason.clear;
        cmbReason.items.add('All Reps');
        cmbReason.itemindex := 0;
        cmbReason.enabled := false;
        cmbReason.color := clbtnFace;
        pnlReasonSearch.enabled := false;
        pnlReasonSearch.visible := pnlReasonSearch.enabled;
      end;
  1:  begin
        loadReasons;
        cmbReason.Text := '';
        cmbReason.color := clWindow;
        cmbReason.enabled := true;
        pnlReasonSearch.enabled := true;
        pnlReasonSearch.visible := pnlReasonSearch.enabled;
      end;
  end;

  self.canPrint;
end;

procedure TfrmWTRSRemedialType.rdgrpDeptClick(Sender: TObject);
begin
  case rdgrpDept.itemindex of
  0:  begin
        Dept := 0;
        cmbDept.clear;
        cmbDept.items.add('All Reps');
        cmbDept.itemindex := 0;
        cmbDept.enabled := false;
        cmbDept.color := clbtnFace;
        pnlDeptSearch.enabled := false;
        pnlDeptSearch.visible := pnlDeptSearch.enabled;
      end;
  1:  begin
        loadDepts;
        cmbDept.Text := '';
        cmbDept.color := clWindow;
        cmbDept.enabled := true;
        pnlDeptSearch.enabled := true;
        pnlDeptSearch.visible := pnlDeptSearch.enabled;
      end;
  end;
  self.canPrint;
end;

procedure TfrmWTRSRemedialType.canPrint;
begin
  if ((rdgrpCategory.itemIndex = 1) and (cmbCategory.text = '')) or
     ((rdgrpReason.ItemIndex = 1) and (cmbReason.text = ''))  or
     ((rdgrpDept.ItemIndex = 1) and (cmbDept.text = '')) then
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

procedure TfrmWTRSRemedialType.btbtnDateFromClick(Sender: TObject);
begin
  {Access the date component}
  if datefrom = 0 then
    datefrom := date - 30;
    
  DateFrom := InputDate(DateFrom);
  edtDateFrom.Text := paDatestr(DateFrom);
  canprint;
end;

function TfrmWTRSRemedialType.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSRemedialType.FormCreate(Sender: TObject);
begin
  self.Dept := 0;
  self.reason := 0;

  DateTo := Date;
  edtDateTo.Text := paDatestr(DateTo);
  DateFrom := Date - 30;
  edtDateFrom.Text := paDatestr(DateFrom);
end;

procedure TfrmWTRSRemedialType.FormShow(Sender: TObject);
begin
  self.canPrint;
end;

procedure TfrmWTRSRemedialType.RunReport(preview: boolean);
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  frmWTRPRemedialType := TfrmWTRPRemedialType.Create(Self);
  try
    if category = 0 then
      frmWTRPRemedialType.qrlblCategories.caption := 'All Categories'
    else
      frmWTRPRemedialType.qrlblCategories.caption := 'Category: ' + cmbcategory.text;

    frmWTRPRemedialType.Totalby := TotByRadioGroup.itemindex;
    frmWTRPRemedialType.ShowCompleted := rdgrpShow.itemindex;
    frmWTRPRemedialType.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;

    if frmWTRPRemedialType.PrepareReport(dateFrom, dateTo, self.Dept, self.reason, self.category) > 0 then
    begin
      if preview then
      begin
        frmWTRPRemedialType.qrReport.Preview;
      end
      else
      begin
          frmWTRPRemedialType.qrReport.PrinterSetup;
          if frmWTRPRemedialType.qrReport.tag = 0 then
            frmWTRPRemedialType.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    frmWTRPRemedialType.Free;
    self.visible := true;
  end;
end;

procedure TfrmWTRSRemedialType.PreviewBitBtnClick(Sender: TObject);
begin
  self.RunReport(true);
end;

procedure TfrmWTRSRemedialType.PrintBitBtnClick(Sender: TObject);
begin
  self.RunReport(false);
end;

procedure TfrmWTRSRemedialType.btbtnDateToClick(Sender: TObject);
begin
  {Access the date component}
  if dateto = 0 then
    dateto := date;

  DateTo := InputDate(DateTo);
  edtDateTo.Text := paDatestr(dateTo);
  canprint;
end;

procedure TfrmWTRSRemedialType.edtDateFromExit(Sender: TObject);
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
    edtDateFrom.Text := paDatestr(NewDate);
    DateFrom := NewDate;
  end;
end;

procedure TfrmWTRSRemedialType.edtDateToExit(Sender: TObject);
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
    edtDateTo.Text := paDatestr(NewDate);
    DateTo := NewDate;
  end;
end;

procedure TfrmWTRSRemedialType.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPageBreak.Enabled := ((Sender as TRadioGroup).itemindex < 4);
end;

procedure TfrmWTRSRemedialType.btnExcelClick(Sender: TObject);
begin
  RuntoExcel;
end;

procedure TfrmWTRSRemedialType.RuntoExcel;
var
  reccount: integer;
  tempFileName: string;
//  PrinterSettings: TPrinterSettings;
begin
  if edtDateFrom.text = '' then
    datefrom := 0;
  if edtDateto.text = '' then
    dateto := 0;

  frmWTRPRemedialType := TfrmWTRPRemedialType.Create(Self);
//  PrinterSettings := TPrinterSettings.Create;
  try
    frmWTRPRemedialType.Totalby := TotByRadioGroup.itemindex;
    frmWTRPRemedialType.ShowCompleted := rdgrpShow.itemindex;

//    frmWTRPRemedialType.PrinterSettings := PrinterSettings;
    reccount := frmWTRPRemedialType.PrepareReport(dateFrom, dateTo, self.Dept, self.reason, self.category);
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        frmWTRPRemedialType.ExportToFile(tempFileName);
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
//    PrinterSettings.free;
    frmWTRPRemedialType.Free;
    self.visible := true;
  end;

end;

procedure TfrmWTRSRemedialType.edtDeptChange(Sender: TObject);
begin
  CanPrint;
end;

procedure TfrmWTRSRemedialType.rdgrpCategoryClick(Sender: TObject);
begin
  case rdgrpCategory.itemindex of
  0:  begin
        Category := 0;
        cmbCategory.clear;
        cmbCategory.items.add('All Categories');
        cmbCategory.itemindex := 0;
        cmbCategory.enabled := false;
        cmbCategory.color := clbtnFace;
        pnlCategorySearch.enabled := false;
        pnlCategorySearch.visible := pnlCategorySearch.enabled;
      end;
  1:  begin
        loadCategories;
        cmbCategory.Text := '';
        cmbCategory.color := clWindow;
        cmbCategory.enabled := true;
        pnlCategorySearch.enabled := true;
        pnlCategorySearch.visible := true;
      end;
  end;
  
  CanPrint;
end;

procedure TfrmWTRSRemedialType.LoadCategories;
begin
  cmbCategory.clear;
  with qryCategory do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbCategory.Items.Add(fieldbyname('Remedial_Category_Descr').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSRemedialType.LoadReasons;
begin
  cmbReason.clear;
  with qryType do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbReason.Items.Add(fieldbyname('Remedial_Type_Descr').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSRemedialType.LoadDepts;
begin
  cmbDept.clear;
  with qryDept do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbDept.Items.Add(fieldbyname('Remedial_Dept_Descr').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSRemedialType.cmbCategoryChange(Sender: TObject);
begin
  CanPrint;
end;

procedure TfrmWTRSRemedialType.cmbReasonChange(Sender: TObject);
begin
  CanPrint;
end;

procedure TfrmWTRSRemedialType.cmbDeptChange(Sender: TObject);
begin
  CanPrint;
end;

end.
