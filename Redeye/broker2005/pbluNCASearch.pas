unit pbluNCASearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, pbJobsDm, Buttons;

type
  TfrmpbluNCASearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    edtRaisedBy: TEdit;
    chkbxShowInactive: TCheckBox;
    SearchButton: TButton;
    lblDescription: TLabel;
    edtDescription: TEdit;
    Label2: TLabel;
    edtStatus: TEdit;
    Label1: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    Label4: TLabel;
    edtRep: TEdit;
    Label5: TLabel;
    edtAccountMgr: TEdit;
    ClearButton: TButton;
    chkbxShowLiveNCA: TCheckBox;
    Label8: TLabel;
    edtRaisingDept: TEdit;
    Label10: TLabel;
    edtSourceDept: TEdit;
    Label3: TLabel;
    edtReasonType: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchNCA: TdtmdlJobs;
  end;

var
  frmpbluNCASearch: TfrmpbluNCASearch;

implementation

uses
  System.UITypes,
  DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluNCASearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchNCA.Status := Trim(edtStatus.Text);
  if edtDate.text = '' then
    dtmdlSearchNCA.NCADate := PBDatestr('01/01/1990')
  else
    dtmdlSearchNCA.NCADate := PBDateStr(edtDate.Text);

  if chkbxShowInactive.checked then
    dtmdlSearchNCA.ShowInactive := 'Y'
  else
    dtmdlSearchNCA.ShowInactive := 'N';

  dtmdlSearchNCA.Description := Trim(edtDescription.Text);
  dtmdlSearchNCA.RepName := Trim(edtRep.text);
  dtmdlSearchNCA.AccountMgr := Trim(edtAccountMgr.text);
  dtmdlSearchNCA.RaisedBy := Trim(edtRaisedBy.text);
  dtmdlSearchNCA.ReasonType := Trim(edtReasonType.text);
  dtmdlSearchNCA.RaisingDept := Trim(edtRaisingDept.text);
  dtmdlSearchNCA.SourceDept := Trim(edtSourceDept.text);

  dtmdlSearchNCA.ShowLiveNCA := chkbxShowLiveNCA.checked;
  if chkbxShowInactive.checked then
    dtmdlSearchNCA.ShowInactiveNCA := 'Y'
  else
    dtmdlSearchNCA.ShowInactiveNCA := 'N';
  dtmdlSearchNCA.refreshNCAdata;
  close;
end;

procedure TfrmpbluNCASearch.FormShow(Sender: TObject);
begin
  if dtmdlSearchNCA.Customer <> 0 then
    begin
      edtDescription.visible := false;
      lblDescription.visible := false;
    end;

end;

procedure TfrmpbluNCASearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluNCASearch.edtDateExit(Sender: TObject);
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

procedure TfrmpbluNCASearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

end.
