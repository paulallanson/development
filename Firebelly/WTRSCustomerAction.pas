unit WTRSCustomerAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, QrCtrls, ComCtrls,
  OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSCustomerAction = class(TForm)
    btnRun: TButton;
    Button4: TButton;
    rdgrpSalesAction: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxAction: TGroupBox;
    Label3: TLabel;
    cmbAction: TComboBox;
    qryAction: TFDQuery;
    dtsAction: TDataSource;
    chkbxPageBreak: TCheckBox;
    rdgrpOperators: TRadioGroup;
    grpbxOperators: TGroupBox;
    Label4: TLabel;
    cmbOperators: TComboBox;
    qryOperators: TFDQuery;
    dtsOperators: TDataSource;
    Button1: TButton;
    Button2: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    procedure Button4Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgrpSalesActionClick(Sender: TObject);
    procedure cmbActionClick(Sender: TObject);
    procedure rdgrpOperatorsClick(Sender: TObject);
    procedure cmbOperatorsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FCode, FOperator: Integer;
    procedure RunReport(const bPreview: Boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadSalesAction;
    procedure LoadOperators;
  public
    { Public declarations }
  end;

var
  frmWTRSCustomerAction: TfrmWTRSCustomerAction;

implementation

uses UITypes, allCommon, DateSelV5, WTRPCustomerAction, wtLUOperators;

{$R *.dfm}

procedure TfrmWTRSCustomerAction.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSCustomerAction.btnRunClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSCustomerAction.RunReport(const bPreview: Boolean);
begin
  frmWTRPCustomerAction := TfrmWTRPCustomerAction.create(self);
  try

//  Check if any records
    frmWTRPCustomerAction.operator := FOperator;
    frmWTRPCustomerAction.code := FCode;
    frmWTRPCustomerAction.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPCustomerAction.dateto := padatestr(edtDateTo.Text);
    if frmWTRPCustomerAction.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    frmWTRPCustomerAction.qrlblCaption.Caption := frmWTRPCustomerAction.qrlblCaption.Caption + ' - run date: ' + padatestr(date);
    frmWTRPCustomerAction.qrlblDateRange.Caption := 'Raised between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPCustomerAction.qrgCustomerHead.ForceNewPage := chkbxPageBreak.checked;

    if bPreview then
      begin
        frmWTRPCustomerAction.qrpDetails.Preview;
      end
    else
      begin
        frmWTRPCustomerAction.qrpDetails.PrinterSetup;
        if frmWTRPCustomerAction.qrpDetails.tag = 0 then
            frmWTRPCustomerAction.qrpDetails.Print;
      end;
  finally
    frmWTRPCustomerAction.free;
  end;
end;

procedure TfrmWTRSCustomerAction.enableOK(Sender: TObject);
begin
  btnRun.enabled := (cmbAction.text <> '') and
                    (cmbOperators.text <> '') and
                    (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
end;

procedure TfrmWTRSCustomerAction.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSCustomerAction.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSCustomerAction.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSCustomerAction.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSCustomerAction.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
begin
  DateFrom := Date - 30;
  DateTo := Date;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateto);
end;

procedure TfrmWTRSCustomerAction.rdgrpSalesActionClick(Sender: TObject);
begin
  case rdgrpSalesAction.itemindex of
  0:  begin
        FCode := 0;
        cmbAction.clear;
        cmbAction.items.add('All Sources');
        cmbAction.itemindex := 0;
        cmbAction.enabled := false;
        cmbAction.color := clbtnFace;
        grpbxAction.enabled := false;
      end;
  1:  begin
        loadSalesAction;
        cmbAction.Text := '';
        cmbAction.color := clWindow;
        cmbAction.enabled := true;
        grpbxAction.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSCustomerAction.LoadSalesAction;
begin
  cmbAction.clear;
  with qryAction do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbAction.Items.Add(fieldbyname('Prospect_Action_Description').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSCustomerAction.LoadOperators;
begin
  cmbOperators.clear;
  with qryOperators do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbOperators.Items.Add(fieldbyname('Operator_Name').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSCustomerAction.cmbActionClick(Sender: TObject);
begin
  qryAction.First;
  qryAction.MoveBy(cmbAction.itemindex);
  FCode := qryAction.fieldbyname('Prospect_Action').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSCustomerAction.rdgrpOperatorsClick(Sender: TObject);
begin
  case rdgrpOperators.itemindex of
  0:  begin
        FOperator := 0;
        cmbOperators.clear;
        cmbOperators.items.add('All Operators');
        cmbOperators.itemindex := 0;
        cmbOperators.enabled := false;
        cmbOperators.color := clbtnFace;
        grpbxOperators.enabled := false;
      end;
  1:  begin
        loadOperators;
        cmbOperators.Text := '';
        cmbOperators.color := clWindow;
        cmbOperators.enabled := true;
        grpbxOperators.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmWTRSCustomerAction.cmbOperatorsClick(Sender: TObject);
begin
  qryOperators.First;
  qryOperators.MoveBy(cmbOperators.itemindex);
  FOperator := qryOperators.fieldbyname('Operator').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSCustomerAction.Button1Click(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSCustomerAction.Button2Click(Sender: TObject);
var
  RecCount: Integer;
  tmpFileName: string;
begin
  frmWTRPCustomerAction := TfrmWTRPCustomerAction.create(self);
  try
    frmWTRPCustomerAction.operator := FOperator;
    frmWTRPCustomerAction.code := FCode;
    frmWTRPCustomerAction.datefrom := padatestr(edtDateFrom.Text);
    frmWTRPCustomerAction.dateto := padatestr(edtDateTo.Text);
    RecCount := frmWTRPCustomerAction.GetDetails;
    if RecCount = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := RecCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPCustomerAction.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPCustomerAction.Free;
    Application.ProcessMessages;
  end;

end;

end.
