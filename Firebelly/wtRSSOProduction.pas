unit wtRSSOProduction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, QrCtrls, ComCtrls, OleCtnrs, DB,
  DBTables, Menus, IniFiles;

type
  TfrmWTRSSOProduction = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpCustomer: TRadioGroup;
    grpbxDateSelect: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    btnCustomer: TButton;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpCategory: TRadioGroup;
    lstbxCustomersCode: TListBox;
    lstbxCustomers: TListBox;
    pmnCustomers: TPopupMenu;
    Delete1: TMenuItem;
    rdgrpSelectBy: TRadioGroup;
    chkbxSplitByMaterialType: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure pmnCustomersPopup(Sender: TObject);
    procedure rdgrpSelectByClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  frmWTRSSOProduction: TfrmWTRSSOProduction;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, WTRPSOProduction;

{$R *.dfm}

procedure TfrmWTRSSOProduction.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOProduction.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSOProduction.RunReport(const bPreview: boolean);
var
  iCount: integer;
begin
  frmWTRPSOProduction := TfrmWTRPSOProduction.create(self);
  try

//  Check if any records
    frmWTRPSOProduction.customer := customer;
    frmWTRPSOProduction.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmWTRPSOProduction.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmWTRPSOProduction.customer := -1;

    frmWTRPSOProduction.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSOProduction.dateto := padatestr(edtDateTo.Text);
    frmWTRPSOProduction.SelectBy := rdgrpSelectBy.itemindex;
    frmWTRPSOProduction.SplitByMaterialType := chkbxSplitByMaterialType.checked;

    frmWTRPSOProduction.CustomerCategory := rdgrpCategory.itemindex;

    if frmWTRPSOProduction.GetWorktopDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPSOProduction.qrlblCaption.Caption := frmWTRPSOProduction.qrlblCaption.Caption;
    frmWTRPSOProduction.qrlblDateRange.Caption := 'Orders due for fitting from ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPSOProduction.qrlblSelection.Caption := 'Customers: ' + lstbxCustomers.Items[0];

    if bPreview then
      begin
          frmWTRPSOProduction.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPSOProduction.qrpDetails.PrinterSetup;
          if frmWTRPSOProduction.qrpDetails.tag = 0 then
            frmWTRPSOProduction.qrpDetails.Print;
      end;
  finally
    frmWTRPSOProduction.free;
  end;
end;

procedure TfrmWTRSSOProduction.btnCustomerClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
//        lstbxSelectedCustomers.Clear;
//        edtCustomer.Clear;
        for iCount := (frmwtSrchCustomer.dbgDetails.SelectedRows.Count - 1) downto 0 do
          begin
            frmwtSrchCustomer.dbgDetails.datasource.DataSet.GotoBookmark(Pointer(frmwtSrchCustomer.dbgDetails.SelectedRows[iCount])) ;
            lstbxCustomersCode.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer').asstring);
            lstbxCustomers.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
//            edtCustomer.Lines.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
          end;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSSOProduction.rdgrpCustomerClick(Sender: TObject);
begin
  case rdgrpCustomer.itemindex of
  0:  begin
        Customer := 0;
        lstbxCustomers.clear;
        lstbxCustomers.items.Add('All Customers');
        lstbxCustomersCode.Clear;
        grpbxCustomer.enabled := false;
      end;
  1:  begin
        lstbxCustomers.clear;
        grpbxCustomer.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSSOProduction.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (lstbxCustomers.count > 0) and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
  btnPreview.enabled := btnPrint.Enabled;
  btnExcel.enabled := btnpreview.enabled;
end;

procedure TfrmWTRSSOProduction.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOProduction.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

function TfrmWTRSSOProduction.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSOProduction.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOProduction.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      chkbxSplitByMaterialType.Checked := (ReadString('Sales Order Production Report', 'Split by Material Type', 'Y') = 'Y');
    end;
  finally
    IniFile.Free;
  end;

  customer := 0;
  rep := 0;
  DateFrom := Date ;
  DateTo := Date + 7;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSSOProduction.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSOProduction.btnExcelClick(Sender: TObject);
var
  iCount: integer;
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPSOProduction := TfrmWTRPSOProduction.create(self);
  try

//  Check if any records
//  Check if any records
    frmWTRPSOProduction.customer := customer;
    frmWTRPSOProduction.customerList.Clear;
    for iCount := 0 to pred(lstbxCustomersCode.Items.count) do
      begin
        frmWTRPSOProduction.customerList.Add(lstbxCustomersCode.Items[icount]);
      end;
    if lstbxCustomersCode.Items.count > 0 then
      frmWTRPSOProduction.customer := -1;

    frmWTRPSOProduction.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPSOProduction.dateto := padatestr(edtDateTo.Text);
    frmWTRPSOProduction.SelectBy := rdgrpSelectBy.itemindex;
    frmWTRPSOProduction.SplitByMaterialType := chkbxSplitByMaterialType.checked;

    frmWTRPSOProduction.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmWTRPSOProduction.GetWorktopDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPSOProduction.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPSOProduction.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSSOProduction.Delete1Click(Sender: TObject);
var
  iCount: integer;
begin
  for iCount := pred(lstbxCustomers.items.count) downto 0 do
    begin
      if lstbxCustomers.Selected[iCount] then
        begin
          lstbxCustomers.Items.Delete(iCount);
          lstbxCustomersCode.Items.Delete(iCount);
        end;
    end;
end;

procedure TfrmWTRSSOProduction.pmnCustomersPopup(Sender: TObject);
begin
  if lstbxCustomers.items.count < 1 then
    exit;
end;

procedure TfrmWTRSSOProduction.rdgrpSelectByClick(Sender: TObject);
begin
  grpbxDateSelect.Caption := (Sender as TRadioGroup).items[(Sender as TRadioGroup).itemindex];
end;

procedure TfrmWTRSSOProduction.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      if chkbxSplitByMaterialType.checked then
        WriteString('Sales Order Production Report', 'Split by Material Type', 'Y')
      else
        WriteString('Sales Order Production Report', 'Split by Material Type', 'N');
      Free;
    end;
end;

end.
