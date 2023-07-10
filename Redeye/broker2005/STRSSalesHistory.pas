unit STRSSalesHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, OleCtnrs, ComCtrls, Spin;

type
  TSTRSSalesHistoryFrm = class(TForm)
    pnlCustProd: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    Panel1: TPanel;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    rdgrpProdType: TRadioGroup;
    pnlProdType: TPanel;
    lblPrdCat: TLabel;
    edtProdType: TEdit;
    btnProdType: TButton;
    rdgrpCustomer: TRadioGroup;
    pnlCustomer: TPanel;
    Label3: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TBitBtn;
    rdgrpSortBy: TRadioGroup;
    grpbxRange: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    GroupBox1: TGroupBox;
    cmbShowRecords: TComboBox;
    spnRecordCount: TSpinEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DateFromEdit: TEdit;
    DateToEdit: TEdit;
    DateFromBitBtn: TBitBtn;
    DateTobtbtn: TBitBtn;
    chkbxIncludeInactive: TCheckBox;
    procedure btnCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateFromBitBtnClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure DateTobtbtnClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure rdgrpProdTypeClick(Sender: TObject);
    procedure btnProdTypeClick(Sender: TObject);
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure cmbShowRecordsClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    part: string;
    partDesc: string;
    customer, branch: integer;
    ProdType: integer;
    procedure CallReport(const bPreview: Boolean);
    procedure CallLocationReport(const bPreview: Boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure ExcelProductReport;
    procedure ExcelLocationReport;
  public
    { Public declarations }
  end;

var
  STRSSalesHistoryFrm: TSTRSSalesHistoryFrm;

implementation

uses DateSelV5, PBLUCust, CCSCommon, PBLUPrdTyp, STPrtMnt, STRPSalesHistory, CCSPrint,
  STRPSalesHistoryLoc;

{$R *.DFM}

procedure TSTRSSalesHistoryFrm.btnCustomerClick(Sender: TObject);
var
  PBLUCustFrm: TPBLUCustFrm;
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_LookUp := True ;
    PBLUCustFrm.bAllow_Upd := True ;
    PBLUCustFrm.bSel_Branch := True ;
    PBLUCustFrm.SelCode := self.customer;
    PBLUCustFrm.SelBranch := self.branch;
    PBLUCustFrm.ShowModal;
    If PBLUCustFrm.Selected then
    begin
      self.customer := PBLUCustFrm.SelCode;
      self.edtCustomer.Text :=
        PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
      self.branch := PBLUCustFrm.SelBranch;
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TSTRSSalesHistoryFrm.FormCreate(Sender: TObject);
begin
  customer := 0;
  branch :=  0;
  prodType := 0;
  part := '';
  partDesc := '';

  DateFrom := IncMonth(Date(), -1);
  DateTo := Date();
  self.DateFromEdit.Text := DateToStr(DateFrom);
  self.DateToEdit.Text := DateToStr(DateTo);
end;


procedure TSTRSSalesHistoryFrm.DateFromBitBtnClick(Sender: TObject);
begin
  {Access the date component}
  DateFrom := InputDate(DateFrom);
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TSTRSSalesHistoryFrm.rdgrpCustomerClick(Sender: TObject);
begin
  if rdgrpCustomer.ItemIndex = 0 then
  begin
    pnlCustomer.visible := false;
    edtCustomer.visible := false;
    btnCustomer.visible := false;
    Customer := 0;
    edtCustomer.Text := '';
  end
  else
  begin
    pnlCustomer.visible := true;
    edtCustomer.visible := true;
    btnCustomer.visible := true;
    if edtCustomer.text = '' then
    begin
      btnCustomerClick(self);
    end
  end;
end;

procedure TSTRSSalesHistoryFrm.DateTobtbtnClick(Sender: TObject);
begin
  DateTo := InputDate(DateTo);
  DateToEdit.Text := PBDatestr(DateTo);
end;

procedure TSTRSSalesHistoryFrm.DateFromEditExit(Sender: TObject);
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

procedure TSTRSSalesHistoryFrm.DateToEditExit(Sender: TObject);
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

procedure TSTRSSalesHistoryFrm.rdgrpProdTypeClick(Sender: TObject);
begin
  if rdgrpProdType.ItemIndex = 0 then
  begin
    pnlProdType.visible := false;
    edtProdType.visible := false;
    btnProdType.visible := false;
    ProdType := 0;
    edtProdType.Text := '';
  end
  else
  begin
    pnlProdType.visible := true;
    edtProdType.visible := true;
    btnProdType.visible := true;
    if edtProdType.text = '' then
    begin
      btnProdTypeClick(self);
    end
  end;

end;

procedure TSTRSSalesHistoryFrm.btnProdTypeClick(Sender: TObject);
var
  PBLUPrdTypFrm: TPBLUPrdTypFrm;
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_LookUp := True ;
    PBLUPrdTypFrm.bAllow_Upd := false;
    PBLUPrdTypFrm.SelCode := self.ProdType;
    PBLUPrdTypFrm.ShowModal;
    If PBLUPrdTypFrm.Selected then
    begin
      self.ProdType := PBLUPrdTypFrm.SelCode;
      self.edtProdType.Text :=
        PBLUPrdTypFrm.SelName;
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
end;

procedure TSTRSSalesHistoryFrm.btbtnPartFromClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartFrom.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;

end;

procedure TSTRSSalesHistoryFrm.btbtnPartToClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TSTRSSalesHistoryFrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rdgrpSortBy.ItemIndex = 0 then
    CallReport(true)
  else
    CallLocationReport(true);
end;

procedure TSTRSSalesHistoryFrm.CallReport(const bPreview: Boolean);
var
  STRPSalesHistoryFrm: TSTRPSalesHistoryFrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPSalesHistoryFrm := TSTRPSalesHistoryFrm.Create(Self);

  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';

  PrinterSettings := TPrinterSettings.Create;
  try
    if rdgrpCustomer.ItemIndex = 0 then
      begin
        STRPSalesHistoryFrm.customer := 0;
        STRPSalesHistoryFrm.qrlblSelection.caption := 'All customers';
      end
    else
      begin
        STRPSalesHistoryFrm.customer := customer;
        STRPSalesHistoryFrm.qrlblSelection.caption := edtCustomer.text;
      end;

    if rdgrpProdType.ItemIndex = 0 then
      begin
        STRPSalesHistoryFrm.ProdType := 0;
      end
    else
      begin
        STRPSalesHistoryFrm.ProdType := prodtype;
      end;

    STRPSalesHistoryFrm.ShowRecords := cmbShowRecords.itemindex;
    if cmbShowRecords.itemindex = 0 then
      STRPSalesHistoryFrm.RecordList := 999999
    else
      STRPSalesHistoryFrm.RecordList := spnRecordCount.value;

    STRPSalesHistoryFrm.Datefrom := DateFrom;
    STRPSalesHistoryFrm.DateTo := DateTo;

    STRPSalesHistoryFrm.PartFrom := edtPartfrom.text;
    STRPSalesHistoryFrm.PartTo := edtPartTo.text;

    STRPSalesHistoryFrm.IncludeInactive := chkbxIncludeInactive.checked;

    if STRPSalesHistoryFrm.GetDetails = 0 then
      begin
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;

    STRPSalesHistoryFrm.qrlblDateSelection.caption := 'Delivered between ' + DateFromEdit.Text + ' and ' + DateToEdit.text;

    if bPreview then
      STRPSalesHistoryFrm.qrpDetails.Preview
    else
    if SetupPrinter(PrinterSettings) then
      STRPSalesHistoryFrm.qrpDetails.Print;
  finally
    PrinterSettings.free;
    STRPSalesHistoryFrm.Free;

    Application.ProcessMessages;
  end;
end;

procedure TSTRSSalesHistoryFrm.CallLocationReport(const bPreview: Boolean);
var
  STRPSalesHistoryFrm: TSTRPSalesHistoryFrm;
  PrinterSettings: TPrinterSettings;
begin
  STRPSalesHistoryLocFrm := TSTRPSalesHistoryLocFrm.Create(Self);

  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';

  PrinterSettings := TPrinterSettings.Create;
  try
    if rdgrpCustomer.ItemIndex = 0 then
      begin
        STRPSalesHistoryLocFrm.customer := 0;
        STRPSalesHistoryLocFrm.qrlblSelection.caption := 'All customers';
      end
    else
      begin
        STRPSalesHistoryLocFrm.customer := customer;
        STRPSalesHistoryLocFrm.qrlblSelection.caption := edtCustomer.text;
      end;

    if rdgrpProdType.ItemIndex = 0 then
      begin
        STRPSalesHistoryLocFrm.ProdType := 0;
      end
    else
      begin
        STRPSalesHistoryLocFrm.ProdType := prodtype;
      end;

    STRPSalesHistoryLocFrm.ShowRecords := cmbShowRecords.itemindex;
    if cmbShowRecords.itemindex = 0 then
      STRPSalesHistoryLocFrm.RecordList := 999999
    else
      STRPSalesHistoryLocFrm.RecordList := spnRecordCount.value;

    STRPSalesHistoryLocFrm.Datefrom := DateFrom;
    STRPSalesHistoryLocFrm.DateTo := DateTo;

    STRPSalesHistoryLocFrm.PartFrom := edtPartfrom.text;
    STRPSalesHistoryLocFrm.PartTo := edtPartTo.text;

    STRPSalesHistoryLocFrm.IncludeInactive := chkbxIncludeInactive.checked;

    if STRPSalesHistoryLocFrm.GetDetails = 0 then
      begin
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;

    STRPSalesHistoryLocFrm.qrlblDateSelection.caption := 'Delivered between ' + DateFromEdit.Text + ' and ' + DateToEdit.text;

    if bPreview then
      STRPSalesHistoryLocFrm.qrpDetails.Preview
    else
    if SetupPrinter(PrinterSettings) then
      STRPSalesHistoryLocFrm.qrpDetails.Print;
  finally
    PrinterSettings.free;
    STRPSalesHistoryLocFrm.Free;

    Application.ProcessMessages;
  end;
end;

function TSTRSSalesHistoryFrm.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TSTRSSalesHistoryFrm.cmbShowRecordsClick(Sender: TObject);
begin
  spnRecordCount.enabled := ((Sender as TComboBox).itemindex > 0);
  if (Sender as TComboBox).itemindex = 0 then
    spnRecordCount.Value := 0;
end;

procedure TSTRSSalesHistoryFrm.ExcelProductReport;
var
  STRPSalesHistoryFrm: TSTRPSalesHistoryFrm;
  tempFileName: string;
  recCount: integer;
begin
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzzzzz';

  STRPSalesHistoryFrm := TSTRPSalesHistoryFrm.Create(Self);
  try
    if rdgrpCustomer.ItemIndex = 0 then
      begin
        STRPSalesHistoryFrm.customer := 0;
      end
    else
      begin
        STRPSalesHistoryFrm.customer := customer;
      end;

    if rdgrpProdType.ItemIndex = 0 then
      begin
        STRPSalesHistoryFrm.ProdType := 0;
      end
    else
      begin
        STRPSalesHistoryFrm.ProdType := prodtype;
      end;

    STRPSalesHistoryFrm.ShowRecords := cmbShowRecords.itemindex;
    if cmbShowRecords.itemindex = 0 then
      STRPSalesHistoryFrm.RecordList := 999999
    else
      STRPSalesHistoryFrm.RecordList := spnRecordCount.value;

    STRPSalesHistoryFrm.Datefrom := DateFrom;
    STRPSalesHistoryFrm.DateTo := DateTo;

    STRPSalesHistoryFrm.PartFrom := edtPartfrom.text;
    STRPSalesHistoryFrm.PartTo := edtPartTo.text;

    STRPSalesHistoryFrm.IncludeInactive := chkbxIncludeInactive.checked;

    recCount := STRPSalesHistoryFrm.GetDetails;
    if recCount > 0 then
      begin
          prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          pnlExportPrgrss.BringToFront;
          pnlExportPrgrss.Visible := true;
          pnlExportPrgrss.Repaint;
          STRPSalesHistoryFrm.ExportToFile(tempFileName);
          pnlExportPrgrss.visible := false;
          Repaint;
          prgbrExport.Position := 0;
          OleContainer1.CreateLinkToFile(tempFileName, false);
          OleContainer1.DoVerb(0);
        end
      else
        MessageDlg('Nothing to print', mtError, [mbOK], 0);

  finally
    STRPSalesHistoryFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSSalesHistoryFrm.ExcelLocationReport;
var
  STRPSalesHistoryLocFrm: TSTRPSalesHistoryLocFrm;
  tempFileName: string;
  recCount: integer;
begin
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzzzzz';

  STRPSalesHistoryLocFrm := TSTRPSalesHistoryLocFrm.Create(Self);
  try
    if rdgrpCustomer.ItemIndex = 0 then
      begin
        STRPSalesHistoryLocFrm.customer := 0;
      end
    else
      begin
        STRPSalesHistoryLocFrm.customer := customer;
      end;

    if rdgrpProdType.ItemIndex = 0 then
      begin
        STRPSalesHistoryLocFrm.ProdType := 0;
      end
    else
      begin
        STRPSalesHistoryLocFrm.ProdType := prodtype;
      end;

    STRPSalesHistoryLocFrm.ShowRecords := cmbShowRecords.itemindex;
    if cmbShowRecords.itemindex = 0 then
      STRPSalesHistoryLocFrm.RecordList := 999999
    else
      STRPSalesHistoryLocFrm.RecordList := spnRecordCount.value;

    STRPSalesHistoryLocFrm.Datefrom := DateFrom;
    STRPSalesHistoryLocFrm.DateTo := DateTo;

    STRPSalesHistoryLocFrm.PartFrom := edtPartfrom.text;
    STRPSalesHistoryLocFrm.PartTo := edtPartTo.text;

    STRPSalesHistoryLocFrm.IncludeInactive := chkbxIncludeInactive.checked;

    recCount := STRPSalesHistoryLocFrm.GetDetails;
    if recCount > 0 then
      begin
          prgbrExport.Max := recCount;
          tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
          pnlExportPrgrss.BringToFront;
          pnlExportPrgrss.Visible := true;
          pnlExportPrgrss.Repaint;
          STRPSalesHistoryLocFrm.ExportToFile(tempFileName);
          pnlExportPrgrss.visible := false;
          Repaint;
          prgbrExport.Position := 0;
          OleContainer1.CreateLinkToFile(tempFileName, false);
          OleContainer1.DoVerb(0);
        end
      else
        MessageDlg('Nothing to print', mtError, [mbOK], 0);

  finally
    STRPSalesHistoryLocFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TSTRSSalesHistoryFrm.btnExcelClick(Sender: TObject);
begin
  if rdgrpSortBy.ItemIndex = 0 then
    ExcelProductReport
  else
    ExcelLocationReport;
end;

procedure TSTRSSalesHistoryFrm.PrintBitBtnClick(Sender: TObject);
begin
  if rdgrpSortBy.ItemIndex = 0 then
    CallReport(false)
  else
    CallLocationReport(false);

end;

end.
