unit WTQuoteSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wtQuotesDM, QrCtrls, Spin, Buttons, DateSelV5, AllCommon;

type
  TfrmWTQuoteSearch = class(TForm)
    Label1: TLabel;
    edtDescription: TEdit;
    Label2: TLabel;
    edtReference: TEdit;
    btnSearch: TButton;
    lblMaterial: TLabel;
    edtMaterial: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtStatus: TEdit;
    ClearButton: TButton;
    chkbxShowLive: TCheckBox;
    chkbxShowInactive: TCheckBox;
    Label5: TLabel;
    edtQuoteReference: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    spnedtRecords: TSpinEdit;
    Label8: TLabel;
    edtProjectReference: TEdit;
    Label9: TLabel;
    edtExpiryDate: TEdit;
    btnExpiryDate: TBitBtn;
    Label10: TLabel;
    edtQuoteDate: TEdit;
    btnQuoteDate: TBitBtn;
    Label11: TLabel;
    spnedtMonths: TSpinEdit;
    Label12: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure btnExpiryDateClick(Sender: TObject);
    procedure edtExpiryDateExit(Sender: TObject);
    procedure btnQuoteDateClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlQuote: TdtmdlQuote;
  end;

var
  frmWTQuoteSearch: TfrmWTQuoteSearch;

implementation

uses UITypes;
{$R *.dfm}

procedure TfrmWTQuoteSearch.btnSearchClick(Sender: TObject);
begin
  dtmdlQuote.Description := Trim(edtDescription.Text);
  dtmdlQuote.ProjectReference := Trim(edtProjectReference.Text);
  dtmdlQuote.Reference := Trim(edtReference.Text);
  dtmdlQuote.Material := Trim(edtMaterial.Text);
  dtmdlQuote.Status := Trim(edtStatus.Text);
  dtmdlQuote.ShowLive := chkbxShowLive.checked;
  dtmdlQuote.QuoteReference := Trim(edtQuoteReference.Text);
  dtmdlQuote.Showrecords := spnedtRecords.value;
  dtmdlQuote.ShowMonths := spnedtMonths.value;

  if chkbxShowInactive.checked then
    dtmdlQuote.ShowInactive := 'Y'
  else
    dtmdlQuote.ShowInactive := '';

  if edtQuoteDate.Text = '' then
    dtmdlQuote.QuoteDate := 0
  else
    dtmdlQuote.QuoteDate := paDateStr(edtQuoteDate.Text);

  if edtExpiryDate.Text = '' then
    dtmdlQuote.ExpiryDate := 0
  else
    dtmdlQuote.ExpiryDate := paDateStr(edtExpiryDate.Text);

  dtmdlQuote.refreshAlldata;
  close;
end;

procedure TfrmWTQuoteSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    begin
      if (components[icount] is TEdit) AND (((components[icount]) AS TEDit).Name <> 'edtQuoteDate') then
        (components[icount] as TEdit).Text := '';
    end;
  btnsearchclick(self);
end;

procedure TfrmWTQuoteSearch.btnExpiryDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtExpiryDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtExpiryDate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTQuoteSearch.edtExpiryDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if (Sender as TEdit).Text = '' then
    Exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      if (Sender as TEdit).Enabled then
        (Sender as TEdit).SetFocus;
      exit;
    end;
  end;

  (Sender as TEdit).Text := PADatestr(NewDate);
end;

procedure TfrmWTQuoteSearch.btnQuoteDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtQuoteDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtQuoteDate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

end.
