unit WTUSSetExpiryDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Buttons, DB, DBTables;

type
  TfrmWTUSSetExpiryDate = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label62: TLabel;
    spnExpiryDays: TSpinEdit;
    Label63: TLabel;
    qryUpdQuotes: TQuery;
    Label3: TLabel;
    procedure enableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
  private
    procedure UpdateQuotes;
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTUSSetExpiryDate: TfrmWTUSSetExpiryDate;

implementation

uses AllCommon, DateSelV5;

{$R *.dfm}

procedure TfrmWTUSSetExpiryDate.enableOK(Sender: TObject);
begin
  btnOK.enabled := (edtDateFrom.Text <> '') and
                    (edtDateTo.Text <> '');
end;

procedure TfrmWTUSSetExpiryDate.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Do you want to set the quote expiry date for the date range selected?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  UpdateQuotes;
end;

procedure TfrmWTUSSetExpiryDate.UpdateQuotes;
begin
  with qryUpdQuotes do
    begin
      close;
      parambyname('Date_From').Asdatetime := padatestr(edtDateFrom.Text);
      parambyname('Date_To').Asdatetime := padatestr(edtDateTo.Text);
      parambyname('Expiry_Days').asinteger := spnExpiryDays.value;
      execsql;
    end;
end;

procedure TfrmWTUSSetExpiryDate.edtDateFromExit(Sender: TObject);
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

procedure TfrmWTUSSetExpiryDate.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTUSSetExpiryDate.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateTo.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateTo.text;

  edtDateTo.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTUSSetExpiryDate.InputDate(TempDate: TDateTime): TDateTime;
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

end.
