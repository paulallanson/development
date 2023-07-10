unit pbluEnqsSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, pbEnqsDM, Buttons;

type
  TfrmpbluEnqsSearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    edtProductCode: TEdit;
    edtFormReference: TEdit;
    Label3: TLabel;
    chkbxShowCancelled: TCheckBox;
    SearchButton: TButton;
    Label2: TLabel;
    edtBranch: TEdit;
    lblDescription: TLabel;
    edtDescription: TEdit;
    Label5: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    Label6: TLabel;
    edtProductType: TEdit;
    ClearButton: TButton;
    Label7: TLabel;
    Label8: TLabel;
    edtAccountMgr: TEdit;
    edtOperator: TEdit;
    Label10: TLabel;
    edtRep: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchEnqs: TdtmdlEnqs;
  end;

var
  frmpbluEnqsSearch: TfrmpbluEnqsSearch;

implementation

uses DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluEnqsSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchEnqs.BranchName := Trim(edtBranch.Text);
  dtmdlSearchEnqs.ProductCode := Trim(edtProductCode.Text);
  dtmdlSearchEnqs.FormReference := Trim(edtFormReference.Text);
  dtmdlSearchEnqs.ProductType := trim(edtProductType.text);
  dtmdlSearchEnqs.Description := trim(edtDescription.text);
  dtmdlSearchEnqs.RepName := Trim(edtRep.text);
  dtmdlSearchEnqs.AccountMgr := Trim(edtAccountMgr.text);
  dtmdlSearchEnqs.OperatorName := Trim(edtOperator.text);

  dtmdlSearchEnqs.ShowInactive := chkbxShowCancelled.Checked;
  if edtDate.text = '' then
    dtmdlSearchEnqs.EnquiryDate := pbDatestr('01/01/1990')
  else
    dtmdlSearchEnqs.EnquiryDate := PBDateStr(edtDate.Text);
  dtmdlSearchEnqs.refreshdata;
  close;
end;

procedure TfrmpbluEnqsSearch.FormShow(Sender: TObject);
begin
  if dtmdlSearchEnqs.Customer <> 0 then
    begin
      //edtDate.text := '';
      edtDescription.visible := false;
      lblDescription.visible := false;
    end;
end;

procedure TfrmpbluEnqsSearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluEnqsSearch.edtDateExit(Sender: TObject);
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

procedure TfrmpbluEnqsSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

end.
