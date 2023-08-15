unit PBExpiryDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CCSCommon, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBExpiryDate = class(TForm)
    Label1: TLabel;
    edtNewExpiryDate: TEdit;
    btnOK: TButton;
    Button2: TButton;
    Label2: TLabel;
    edtoldExpiryDate: TEdit;
    qryUpCompany: TFDQuery;
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
  frmPBExpiryDate: TfrmPBExpiryDate;

implementation

uses
  System.UITypes,
  pbDatabase;

{$R *.dfm}

procedure TfrmPBExpiryDate.FormActivate(Sender: TObject);
var
  ADate: TDateTime;
begin
  edtOldExpiryDate.Clear;
  edtNewExpiryDate.Clear;

  ADate := dmBroker.GetCheckSum;

  edtOldExpiryDate.Text := datetimetostr(ADate);
end;

procedure TfrmPBExpiryDate.edtNewExpiryDateExit(Sender: TObject);
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
  (Sender as TEdit).Text := pbDatestr(NewDate);
end;

procedure TfrmPBExpiryDate.EnableOK;
begin
  btnOK.enabled := edtNewExpiryDate.text <> '';
end;

procedure TfrmPBExpiryDate.edtNewExpiryDateChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TfrmPBExpiryDate.btnOKClick(Sender: TObject);
var
  ADate: TDateTime;
begin
  ADate := strtoDate(edtNewExpiryDate.text);

  with qryUpCompany do
    begin
      close;
      parambyname('Company_CheckSum').asfloat := ADate;
      execsql;
    end;
end;

procedure TfrmPBExpiryDate.Button2Click(Sender: TObject);
begin
  close;
end;

end.
