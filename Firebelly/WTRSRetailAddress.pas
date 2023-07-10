unit WTRSRetailAddress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, DBCtrls, Buttons,
  Printers, Spin, ComCtrls, OleCtnrs, AllCommon;

type
  TfrmWTRSRetailAddress = class(TForm)
    dtsrcCurrentContStatus: TDataSource;
    pnlControls: TPanel;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    chkbxShowOnlyMailing: TCheckBox;
    stsbrDetails: TStatusBar;
    dbgrdContStatus: TDBGrid;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    stdSQL: TQuery;
    qryCurrentContStatus: TQuery;
    pnlSearch: TPanel;
    Label1: TLabel;
    edtName: TEdit;
    Label3: TLabel;
    edtStreet: TEdit;
    Label5: TLabel;
    edtLocale: TEdit;
    edtTown: TEdit;
    btnClear: TBitBtn;
    edtPostcode: TEdit;
    Label2: TLabel;
    Label6: TLabel;
    tmrSearch: TTimer;
    btnCancel: TBitBtn;
    btnExcel: TBitBtn;
    Label4: TLabel;
    edtCounty: TEdit;
    chkbxShowOnlyOrdered: TCheckBox;
    Label7: TLabel;
    edtDateFrom: TEdit;
    btnDatefrom: TBitBtn;
    qryOrdered: TQuery;
    btnClearDate: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cmbbxContStatusChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure chkbxShowOnlyMailingClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure chkbxShowOnlyOrderedClick(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnClearDateClick(Sender: TObject);
    procedure edtDateFromKeyPress(Sender: TObject; var Key: Char);
  private
    iCurrentYear, iCurrentPeriod, iYear1, iYear2, iYear3: integer;
    FDisableNameChangeEvent: boolean;
    procedure FixQuery;
    function BuildQueryString: string;
    function Ordering(aBox: TComboBox): string;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
  public
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmWTRSRetailAddress: TfrmWTRSRetailAddress;

implementation

uses wtMain, DateSelV5, wtDataModule;

{$R *.DFM}

procedure TfrmWTRSRetailAddress.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crDefault;
  FixQuery;
end;

procedure TfrmWTRSRetailAddress.cmbbxContStatusChange(Sender: TObject);
begin
  FixQuery;
end;

function TfrmWTRSRetailAddress.BuildQueryString: string;
var
  sTemp : string;
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  if chkbxShowOnlyOrdered.Checked then
    sTemp := qryOrdered.SQL.text
  else
    sTemp := StdSQL.SQL.Text;

  if chkbxShowOnlyMailing.Checked then
    sTemp := sTemp + ' AND (Address.Mailing = ''Y'') ';

  if edtName.Text <> '' then
    sTemp := stemp + ' AND Address.Address_Name LIKE ''%' + trim(edtName.Text) + '%''';

  if edtStreet.Text <> '' then
    sTemp := stemp + ' AND Address.Street LIKE ''%' + trim(edtStreet.Text) + '%''';

  if edtLocale.Text <> '' then
    sTemp := stemp + ' AND Address.Locale LIKE ''%' + trim(edtLocale.Text) + '%''';

  if edtTown.Text <> '' then
    sTemp := stemp + ' AND Address.Town_City LIKE ''%' + trim(edtTown.Text) + '%''';

  if edtPostcode.Text <> '' then
    sTemp := stemp + ' AND Address.Postcode LIKE ''%' + trim(edtPostcode.Text) + '%''';

  if edtCounty.Text <> '' then
    sTemp := stemp + ' AND Address.County_State LIKE ''%' + trim(edtCounty.Text) + '%''';

  if chkbxShowOnlyOrdered.Checked and (paDateStr(edtDateFrom.Text) <> 0) then
    sTemp := stemp + ' AND Date_Raised >= ' + qDate(paDateStr(edtDateFrom.Text));

  sTemp := sTemp + ' ORDER BY Address.Address_Name';
  Result := sTemp;
end;

procedure TfrmWTRSRetailAddress.FixQuery;
begin
  try
    qryCurrentContStatus.Close;
    qryCurrentContStatus.SQL.Clear;
    qryCurrentContStatus.SQL.text := BuildQueryString;

    qryCurrentContStatus.Open;
    stsbrDetails.panels[0].text := ' ' + IntToStr(qryCurrentContStatus.RecordCount) + ' records processed';
    btnExcel.Enabled := (qryCurrentContStatus.RecordCount > 0);
  finally
    qryCurrentContStatus.EnableControls;
  end;
end;

function TfrmWTRSRetailAddress.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Customer_Type.Description,';
  1:   Result := ' Contact_Type.Contact_Type_Description,';
  2:   Result := ' Rep_Name,';
  else Result := ' ';
  end;
end;

procedure TfrmWTRSRetailAddress.btnExcelClick(Sender: TObject);
var
  tempFileName: string;
begin
  frmWTMain.ExportToExcel(frmWTRSRetailAddress);
end;

procedure TfrmWTRSRetailAddress.chkbxShowOnlyMailingClick(Sender: TObject);
begin
  FixQuery;
end;

procedure TfrmWTRSRetailAddress.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  FixQuery;
end;

procedure TfrmWTRSRetailAddress.edtNameChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTRSRetailAddress.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTRSRetailAddress.btnClearClick(Sender: TObject);
begin
  edtName.Clear;
  edtStreet.clear;
  edtLocale.Clear;
  edtTown.clear;
  edtPostcode.clear;
end;

procedure TfrmWTRSRetailAddress.chkbxShowOnlyOrderedClick(Sender: TObject);
begin
  edtDateFrom.Enabled := (Sender as TCheckBox).checked ;
  FixQuery;
end;

procedure TfrmWTRSRetailAddress.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
  FixQuery;
end;

function TfrmWTRSRetailAddress.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSRetailAddress.edtDateFromExit(Sender: TObject);
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

  FixQuery;
end;

procedure TfrmWTRSRetailAddress.btnClearDateClick(Sender: TObject);
begin
  edtDateFrom.Clear;
end;

procedure TfrmWTRSRetailAddress.edtDateFromKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      btnDateFrom.setfocus;
    end;
end;

end.
