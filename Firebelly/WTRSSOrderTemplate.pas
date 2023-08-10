unit wtRSSOrderTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, QrCtrls, ComCtrls, OleCtnrs, IniFiles, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSSOrderTemplate = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpCustomer: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    rdgrpSortBy: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    btnPreview: TButton;
    btnExcel: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpCategory: TRadioGroup;
    rdgrpReps: TRadioGroup;
    grpbxReps: TGroupBox;
    Label3: TLabel;
    cmbReps: TComboBox;
    qryReps: TFDQuery;
    dtsReps: TDataSource;
    chkbxShowOnlyScheduled: TCheckBox;
    chkbxIncludeInvoiced: TCheckBox;
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
    procedure rdgrpRepsClick(Sender: TObject);
    procedure cmbRepsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    rep, customer: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadReps;
  public
    { Public declarations }
  end;

var
  frmWTRSSOrderTemplate: TfrmWTRSSOrderTemplate;

implementation

uses
  System.UITypes,
  allCommon, WTSrchCustomer, DateSelV5, wtMain,
  WTRPSOrderTemplate;

{$R *.dfm}

procedure TfrmWTRSSOrderTemplate.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOrderTemplate.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSOrderTemplate.RunReport(const bPreview: boolean);
begin
  frmwtRPSOrderTemplate := TfrmwtRPSOrderTemplate.create(self);
  try

//  Check if any records
    frmwtRPSOrderTemplate.customer := customer;
    frmwtRPSOrderTemplate.rep := rep;
    if trim(edtDateFrom.Text) = '' then
      frmwtRPSOrderTemplate.datefrom := 0
    else
      frmwtRPSOrderTemplate.datefrom := padatestr(edtDateFrom.Text);

    if trim(edtDateTo.Text) = '' then
      frmwtRPSOrderTemplate.dateto := 0
    else
      frmwtRPSOrderTemplate.dateto := padatestr(edtDateTo.Text);
      
    frmwtRPSOrderTemplate.Sortby := rdgrpSortBy.itemindex;
    frmwtRPSOrderTemplate.bShowOnlyScheduled := chkbxShowOnlyScheduled.checked;
    frmwtRPSOrderTemplate.bIncludeInvoiced := chkbxIncludeInvoiced.Checked;

    frmwtRPSOrderTemplate.CustomerCategory := rdgrpCategory.itemindex;

    if frmwtRPSOrderTemplate.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmwtRPSOrderTemplate.qrlblCaption.Caption := frmwtRPSOrderTemplate.qrlblCaption.Caption;
    frmwtRPSOrderTemplate.qrlblDateRange.Caption := 'Templating due between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmwtRPSOrderTemplate.qrlblSelection.Caption := 'Reps: ' + cmbReps.Text + ' Customers: ' + edtCustomer.Text;
    if chkbxShowOnlyScheduled.checked then
      frmwtRPSOrderTemplate.qrlblSelection.Caption := frmwtRPSOrderTemplate.qrlblSelection.Caption + ' Only Scheduled Orders';

    frmwtRPSOrderTemplate.qrbGroupHeader.ForceNewPage := chkbxPageBreak.Checked;
    if bPreview then
      begin
          frmwtRPSOrderTemplate.qrpDetails.Preview;
      end
    else
      begin
          frmwtRPSOrderTemplate.qrpDetails.PrinterSetup;
          if frmwtRPSOrderTemplate.qrpDetails.tag = 0 then
            frmwtRPSOrderTemplate.qrpDetails.Print;
      end;
  finally
    frmwtRPSOrderTemplate.free;
  end;
end;

procedure TfrmWTRSSOrderTemplate.btnCustomerClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        customer := frmwtSrchCustomer.CodeSelected;
        edtCustomer.text := frmwtSrchCustomer.NameSelected;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSSOrderTemplate.rdgrpCustomerClick(Sender: TObject);
begin
  case rdgrpCustomer.itemindex of
  0:  begin
        Customer := 0;
        edtCustomer.Text := 'All Customers';
        grpbxCustomer.enabled := false;
      end;
  1:  begin
        edtCustomer.Text := '';
        grpbxCustomer.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSSOrderTemplate.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtCustomer.text <> '') and
                      (cmbReps.Text <> '');
  btnPreview.enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSSOrderTemplate.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOrderTemplate.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSSOrderTemplate.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSOrderTemplate.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOrderTemplate.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
  with IniFile do
    begin
      chkbxShowOnlyScheduled.Checked := (ReadString('Sales Order Template Report', 'Only Show Scheduled', 'N') = 'Y');
      chkbxIncludeInvoiced.Checked := (ReadString('Sales Order Template Report', 'Include Invoiced Orders', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;

  customer := 0;
  rep := 0;
  DateFrom := 0;
  DateTo := Date + 30;
  edtdateFrom.Text := paDateStr(dateFrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSSOrderTemplate.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSOrderTemplate.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmwtRPSOrderTemplate := TfrmwtRPSOrderTemplate.create(self);
  try

//  Check if any records
    frmwtRPSOrderTemplate.customer := customer;
    frmwtRPSOrderTemplate.rep := rep;

    if trim(edtDateFrom.Text) = '' then
      frmwtRPSOrderTemplate.datefrom := 0
    else
      frmwtRPSOrderTemplate.datefrom := padatestr(edtDateFrom.Text);

    if trim(edtDateTo.Text) = '' then
      frmwtRPSOrderTemplate.dateto := 0
    else
      frmwtRPSOrderTemplate.dateto := padatestr(edtDateTo.Text);

    frmwtRPSOrderTemplate.Sortby := rdgrpSortBy.itemindex;
    frmwtRPSOrderTemplate.bShowOnlyScheduled := chkbxShowOnlyScheduled.checked;
    frmwtRPSOrderTemplate.bIncludeInvoiced := chkbxIncludeInvoiced.Checked;

    frmwtRPSOrderTemplate.CustomerCategory := rdgrpCategory.itemindex;

    //  Check if any records exist
    reccount := frmwtRPSOrderTemplate.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmwtRPSOrderTemplate.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmwtRPSOrderTemplate.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSSOrderTemplate.rdgrpRepsClick(Sender: TObject);
begin
  case rdgrpReps.itemindex of
  0:  begin
        Rep := 0;
        cmbReps.clear;
        cmbReps.items.add('All Reps');
        cmbReps.itemindex := 0;
        cmbReps.enabled := false;
        cmbReps.color := clbtnFace;
        grpbxReps.enabled := false;
      end;
  1:  begin
        loadReps;
        cmbReps.Text := '';
        cmbReps.color := clWindow;
        cmbReps.enabled := true;
        grpbxReps.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSSOrderTemplate.cmbRepsClick(Sender: TObject);
begin
  qryReps.First;
  qryReps.MoveBy(cmbReps.itemindex);
  Rep := qryReps.fieldbyname('Rep').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSSOrderTemplate.LoadReps;
begin
  cmbReps.clear;
  with qryReps do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbReps.Items.Add(fieldbyname('Rep_Name').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSSOrderTemplate.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
    begin
      if chkbxIncludeInvoiced.Checked then
        WriteString('Sales Order Template Report', 'Include Invoiced Orders', 'Y')
      else
        WriteString('Sales Order Template Report', 'Include Invoiced Orders', 'N');

      if chkbxShowOnlyScheduled.checked then
        WriteString('Sales Order Template Report', 'Only Show Scheduled', 'Y')
      else
        WriteString('Sales Order Template Report', 'Only Show Scheduled', 'N');
    end;
  finally
    IniFile.Free;
  end;
end;

end.
