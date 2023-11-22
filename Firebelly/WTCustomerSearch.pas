unit WTCustomerSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmWTCustomerSearch = class(TForm)
    Label1: TLabel;
    edtStreet: TEdit;
    Label2: TLabel;
    edtlocale: TEdit;
    btnSearch: TButton;
    lblMaterial: TLabel;
    edtTown: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtPostcode: TEdit;
    ClearButton: TButton;
    Label5: TLabel;
    edtCounty: TEdit;
    Label6: TLabel;
    edtPhone: TEdit;
    Label7: TLabel;
    edtType: TEdit;
    Label8: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    chkbxIncludeProspects: TCheckBox;
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmWTCustomerSearch: TfrmWTCustomerSearch;

implementation

uses UITypes, wtLUCustomer, AllCommon, DateSelV5;

{$R *.dfm}

procedure TfrmWTCustomerSearch.btnSearchClick(Sender: TObject);
begin
  frmWTLUCustomer.Street := Trim(edtStreet.Text);
  frmWTLUCustomer.Town := Trim(edtTown.Text);
  frmWTLUCustomer.County := Trim(edtCounty.Text);
  frmWTLUCustomer.Postcode := Trim(edtPostcode.Text);
  frmWTLUCustomer.TownLocale := Trim(edtLocale.Text);
  frmWTLUCustomer.Phone := Trim(edtPhone.Text);
  frmWTLUCustomer.CustomerType:= Trim(edtType.Text);
  frmWTLUCustomer.IncludeProspects:= chkbxIncludeProspects.checked;

  var SelectedDate := StrToDate(edtDate.Text);

  if (edtDate.text = '') or (SelectedDate <= StrToDate('01/01/2000')) then
    frmWTLUCustomer.DateCreated := StrToDate('01/01/1800')
  else
    frmWTLUCustomer.DateCreated := SelectedDate;

  frmWTLUCustomer.refreshdata;
  close;
end;

procedure TfrmWTCustomerSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  chkbxIncludeProspects.Checked := true;
  btnsearchclick(self);
end;

procedure TfrmWTCustomerSearch.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDate.Text = '' then
    Exit;
  try
    NewDate := StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      if edtDate.Enabled then
        edtDate.SetFocus;
      exit;
    end;
  end;

  edtDate.Text := paDatestr(NewDate);
end;

procedure TfrmWTCustomerSearch.btnDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

end.
