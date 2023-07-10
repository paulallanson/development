unit pbluQuotesSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, pbQuotesDM;

type
  TfrmpbluQuotesSearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    edtQuantity: TEdit;
    edtCustOrderNo: TEdit;
    chkbxShowInactive: TCheckBox;
    SearchButton: TButton;
    lblDescription: TLabel;
    edtDescription: TEdit;
    Label2: TLabel;
    edtStatus: TEdit;
    Label3: TLabel;
    edtBranch: TEdit;
    Label1: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    Label4: TLabel;
    edtRep: TEdit;
    Label5: TLabel;
    edtAccountMgr: TEdit;
    Label7: TLabel;
    edtOperator: TEdit;
    ClearButton: TButton;
    chkbxShowLive: TCheckBox;
    Label8: TLabel;
    edtSubRep: TEdit;
    Label10: TLabel;
    edtEndUser: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchQuotes: TdtmdlQuotes;
  end;

var
  frmpbluQuotesSearch: TfrmpbluQuotesSearch;

implementation

uses DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluQuotesSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchQuotes.BranchName := Trim(edtBranch.Text);
  dtmdlSearchQuotes.Status := Trim(edtStatus.Text);
  dtmdlSearchQuotes.CustomerRef := Trim(edtCustOrderNo.Text);
  dtmdlSearchQuotes.Quantity := Trim(edtQuantity.Text);
  if edtDate.text = '' then
    dtmdlSearchQuotes.QuoteDate := PBDatestr('01/01/1990')
  else
    dtmdlSearchQuotes.QuoteDate := PBDateStr(edtDate.Text);

  if chkbxShowInactive.checked then
    dtmdlSearchQuotes.ShowInactive := 'Y'
  else
    dtmdlSearchQuotes.ShowInactive := 'N';

  dtmdlSearchQuotes.Description := Trim(edtDescription.Text);
  dtmdlSearchQuotes.RepName := Trim(edtRep.text);
  dtmdlSearchQuotes.SubRepName := Trim(edtSubRep.text);
  dtmdlSearchQuotes.OperatorName := Trim(edtOperator.text);
  dtmdlSearchQuotes.EndUserName := Trim(edtEndUser.text);

  dtmdlSearchQuotes.ShowLive := chkbxShowLive.checked;
  dtmdlSearchQuotes.refreshdata;
  close;
end;

procedure TfrmpbluQuotesSearch.FormShow(Sender: TObject);
begin
  if dtmdlSearchQuotes.Customer <> 0 then
    begin
      edtDescription.visible := false;
      lblDescription.visible := false;
    end;

end;

procedure TfrmpbluQuotesSearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluQuotesSearch.edtDateExit(Sender: TObject);
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

  edtDate.Text := PBDatestr(NewDate);
end;

procedure TfrmpbluQuotesSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

end.
