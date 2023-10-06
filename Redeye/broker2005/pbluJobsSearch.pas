unit pbluJobsSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, pbJobsDm, Buttons;

type
  TfrmpbluJobsSearch = class(TForm)
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
    lblDescriptiveRef: TLabel;
    edtDescriptiveRef: TEdit;
    Label4: TLabel;
    edtRep: TEdit;
    Label5: TLabel;
    edtAccountMgr: TEdit;
    Label7: TLabel;
    edtOperator: TEdit;
    ClearButton: TButton;
    chkbxShowWIP: TCheckBox;
    Label8: TLabel;
    edtProductionStatus: TEdit;
    Label10: TLabel;
    edtDateReq: TEdit;
    btnDateReq: TBitBtn;
    edtQuote: TEdit;
    Label11: TLabel;
    Label14: TLabel;
    edtSubRep: TEdit;
    Label15: TLabel;
    edtEndUser: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure edtDateReqExit(Sender: TObject);
    procedure btnDateReqClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchJobs: TdtmdlJobs;
  end;

var
  frmpbluJobsSearch: TfrmpbluJobsSearch;

implementation

uses UITypes, DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluJobsSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchJobs.BranchName := Trim(edtBranch.Text);
  dtmdlSearchJobs.Status := Trim(edtStatus.Text);
  dtmdlSearchJobs.ProductionStatus := Trim(edtProductionStatus.Text);
  dtmdlSearchJobs.CustomerRef := Trim(edtCustOrderNo.Text);
  dtmdlSearchJobs.OrdQtyDesc := Trim(edtQuantity.Text);
  if edtDate.text = '' then
    dtmdlSearchJobs.JobDate := PBDatestr('01/01/1990')
  else
    dtmdlSearchJobs.JobDate := PBDateStr(edtDate.Text);

  if edtDateReq.text = '' then
    dtmdlSearchJobs.DateRequired := 0
  else
    dtmdlSearchJobs.DateRequired := PBDateStr(edtDateReq.Text);

  if chkbxShowInactive.checked then
    dtmdlSearchJobs.ShowInactive := 'Y'
  else
    dtmdlSearchJobs.ShowInactive := 'N';

  dtmdlSearchJobs.Quote := Trim(edtQuote.Text);
  dtmdlSearchJobs.Description := Trim(edtDescription.Text);
  dtmdlSearchJobs.DescriptiveRef := Trim(edtDescriptiveRef.text);
  dtmdlSearchJobs.RepName := Trim(edtRep.text);
  dtmdlSearchJobs.SubRepName := Trim(edtSubRep.text);
  dtmdlSearchJobs.AccountMgr := Trim(edtAccountMgr.text);
  dtmdlSearchJobs.OperatorName := Trim(edtOperator.text);
  dtmdlSearchJobs.EndUserName := Trim(edtEndUSer.text);

  dtmdlSearchJobs.ShowWIP := chkbxShowWIP.checked;
  dtmdlSearchJobs.refreshdata;
  close;
end;

procedure TfrmpbluJobsSearch.FormShow(Sender: TObject);
begin
  if dtmdlSearchJobs.Customer <> 0 then
    begin
      edtDescription.visible := false;
      lblDescription.visible := false;
    end;

end;

procedure TfrmpbluJobsSearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluJobsSearch.edtDateExit(Sender: TObject);
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

procedure TfrmpbluJobsSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

procedure TfrmpbluJobsSearch.edtDateReqExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDateReq.Text = '' then
    Exit;
  try
    NewDate := StrToDate(edtDateReq.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      if edtDateReq.Enabled then
        edtDateReq.SetFocus;
      exit;
    end;
  end;

  edtDateReq.Text := PBDatestr(NewDate);
end;

procedure TfrmpbluJobsSearch.btnDateReqClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateReq.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDateReq.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

end.
