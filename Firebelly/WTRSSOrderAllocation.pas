unit WTRSSOrderAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, gtQrCtrls, ComCtrls, OleCtnrs;

type
  TfrmWTRSSOrderAllocation = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpFitter: TRadioGroup;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    grpbxFitter: TGroupBox;
    Label4: TLabel;
    edtFitter: TEdit;
    btnFitter: TButton;
    rdgrpSortBy: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    btnPreview: TButton;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpCategory: TRadioGroup;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnFitterClick(Sender: TObject);
    procedure rdgrpFitterClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
  private
    Fitter: integer;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  frmWTRSSOrderAllocation: TfrmWTRSSOrderAllocation;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, wtLUFitters, WTRPSOrderAllocation;

{$R *.dfm}

procedure TfrmWTRSSOrderAllocation.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOrderAllocation.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSSOrderAllocation.RunReport(const bPreview: boolean);
begin
  frmWTRPSOrderAllocation := TfrmWTRPSOrderAllocation.create(self);
  try

//  Check if any records
    frmWTRPSOrderAllocation.fitter := fitter;
    if trim(edtDateFrom.Text) = '' then
      frmWTRPSOrderAllocation.datefrom := 0
    else
      frmWTRPSOrderAllocation.datefrom := padatestr(edtDateFrom.Text);

    if trim(edtDateTo.Text) = '' then
      frmWTRPSOrderAllocation.dateto := 0
    else
      frmWTRPSOrderAllocation.dateto := padatestr(edtDateTo.Text);

    frmWTRPSOrderAllocation.Sortby := rdgrpSortBy.itemindex;

    if frmWTRPSOrderAllocation.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;
    if bPreview then
      begin
          frmWTRPSOrderAllocation.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPSOrderAllocation.qrpDetails.PrinterSetup;
          if frmWTRPSOrderAllocation.qrpDetails.tag = 0 then
            frmWTRPSOrderAllocation.qrpDetails.Print;
      end;
  finally
    frmWTRPSOrderAllocation.free;
  end;
end;

procedure TfrmWTRSSOrderAllocation.btnFitterClick(Sender: TObject);
begin
  frmwtLUFitters := TfrmwtLUFitters.create(self);
  try
//    frmwtLUFitters.CodeSelected := Fitter;
    frmwtLUFitters.showmodal;
    if frmwtLUFitters.modalresult = idOK then
      begin
(*        Fitter := frmwtSrchCustomer.CodeSelected;
        edtFitter.text := frmwtSrchCustomer.NameSelected;
*)      end;
  finally
    frmwtLUFitters.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSSOrderAllocation.rdgrpFitterClick(Sender: TObject);
begin
  case rdgrpFitter.itemindex of
  0:  begin
        Fitter := 0;
        edtFitter.Text := 'All Fitters';
        grpbxFitter.enabled := false;
      end;
  1:  begin
        edtFitter.Text := '';
        grpbxFitter.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSSOrderAllocation.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (edtFitter.text <> '');
  btnPreview.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSSOrderAllocation.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOrderAllocation.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSSOrderAllocation.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSSOrderAllocation.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSSOrderAllocation.FormCreate(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
begin
  Fitter := 0;
  DateFrom := Date;
  DateTo := Date;
  edtdateFrom.Text := paDateStr(dateFrom);
  edtDateTo.Text := paDateStr(dateTo);
end;

procedure TfrmWTRSSOrderAllocation.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

end.
