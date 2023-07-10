unit PBLUActivitiesSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, PBActivityDM;

type
  TfrmPBLUActivitiesSearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtSubject: TEdit;
    edtBranch: TEdit;
    chkbxShowOnlyLive: TCheckBox;
    SearchButton: TButton;
    edtDate: TEdit;
    btnDate: TBitBtn;
    edtType: TEdit;
    edtPriority: TEdit;
    ClearButton: TButton;
    edtContact: TEdit;
    edtStatus: TEdit;
    edtCreatedBy: TEdit;
    edtAssignedTo: TEdit;
    lblDueDate: TLabel;
    edtDueDate: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    edtDescription: TEdit;
    Label7: TLabel;
    edtReference: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure edtDueDateExit(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchActivities : TdtmdlActivity;
  end;

var
  frmPBLUActivitiesSearch: TfrmPBLUActivitiesSearch;

implementation

uses CCSCommon, DateSelV5;

{$R *.dfm}

procedure TfrmPBLUActivitiesSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchActivities.BranchName := Trim(edtBranch.Text);
  dtmdlSearchActivities.ContactName := Trim(edtContact.Text);
  dtmdlSearchActivities.Priority := Trim(edtPriority.Text);
  dtmdlSearchActivities.Subject := Trim(edtSubject.Text);
  dtmdlSearchActivities.ActivityType := Trim(edtType.Text);
  dtmdlSearchActivities.ActivityStatus := Trim(edtStatus.text);
  dtmdlSearchActivities.CreatedByName := Trim(edtCreatedBy.text);

  dtmdlSearchActivities.Reference := Trim(edtReference.Text);
  dtmdlSearchActivities.Description := Trim(edtDescription.Text);

  dtmdlSearchActivities.AssignedToName := Trim(edtAssignedTo.text);
  dtmdlSearchActivities.ShowOnlyLive := chkbxShowOnlyLive.checked;

  if (edtDate.text = '') or (pbdatestr(edtDate.Text) <= '01/01/2000') then
    dtmdlSearchActivities.DateCreated := PBDatestr('01/01/1800')
  else
    dtmdlSearchActivities.DateCreated := PBDateStr(edtDate.Text);

  if (edtDueDate.text = '') or (pbdatestr(edtDueDate.Text) <= '01/01/2000') then
    dtmdlSearchActivities.DueDate := PBDatestr('01/01/1800')
  else
    dtmdlSearchActivities.DueDate := PBDateStr(edtDueDate.Text);

  dtmdlSearchActivities.refreshdata;
  close;

end;

procedure TfrmPBLUActivitiesSearch.btnDateClick(Sender: TObject);
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

procedure TfrmPBLUActivitiesSearch.BitBtn1Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDueDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDueDate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmPBLUActivitiesSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

procedure TfrmPBLUActivitiesSearch.edtDueDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDueDate.Text = '' then
    Exit;
  try
    NewDate := StrToDate(edtDueDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      if edtDueDate.Enabled then
        edtDueDate.SetFocus;
      exit;
    end;
  end;

  edtDueDate.Text := PBDatestr(NewDate);
end;

procedure TfrmPBLUActivitiesSearch.edtDateExit(Sender: TObject);
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

end.
