unit wtExpiryDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AllCommon, DB, DBTables;

type
  TfrmWTExpiryDate = class(TForm)
    Label1: TLabel;
    edtNewExpiryDate: TEdit;
    btnOK: TButton;
    Button2: TButton;
    Label2: TLabel;
    edtoldExpiryDate: TEdit;
    qryUpCompany: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure edtNewExpiryDateExit(Sender: TObject);
    procedure edtNewExpiryDateChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure EnableOK;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTExpiryDate: TfrmWTExpiryDate;

implementation

uses wtDataModule;

{$R *.dfm}

procedure TfrmWTExpiryDate.FormActivate(Sender: TObject);
var
  ADate: TDateTime;
begin
  edtOldExpiryDate.Clear;
  edtNewExpiryDate.Clear;

  ADate := dtmdlWorktops.GetSoftwareCheckSum;

  edtOldExpiryDate.Text := datetimetostr(ADate);
end;

procedure TfrmWTExpiryDate.edtNewExpiryDateExit(Sender: TObject);
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

procedure TfrmWTExpiryDate.EnableOK;
begin
  btnOK.enabled := edtNewExpiryDate.text <> '';
end;

procedure TfrmWTExpiryDate.edtNewExpiryDateChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TfrmWTExpiryDate.btnOKClick(Sender: TObject);
var
  ADate: TDateTime;
begin
  ADate := strtoDate(edtNewExpiryDate.text);

  with qryUpCompany do
    begin
      close;
      parambyname('Software_CheckSum').asfloat := ADate;
      execsql;
    end;
end;

procedure TfrmWTExpiryDate.Button2Click(Sender: TObject);
begin
  close;
end;

end.
