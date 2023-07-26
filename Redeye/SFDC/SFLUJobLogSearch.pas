unit SFLUJobLogSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

const
{ Message values for communication between this child form and
  its parent PBLUPOrd }
  JobLogLU_SelectionChanged      = WM_APP + 101;  { Sent from child to parent }
  JobLogLU_ChildClosed           = WM_APP + 102;  { Sent from child to parent }
  JobLogLU_ParentClosed          = WM_APP + 103;  { Sent from parent to child }

type
  TfrmSFLUJobLogSearch = class(TForm)
    lblFormReference: TLabel;
    lblQuantity: TLabel;
    lblProductCode: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    lblDescription: TLabel;
    lblDescriptiveRef: TLabel;
    lblJobNumber: TLabel;
    lblStatus: TLabel;
    edtProcess: TEdit;
    edtWorkCentre: TEdit;
    edtJobName: TEdit;
    SearchButton: TButton;
    edtOperation: TEdit;
    edtNonJobCode: TEdit;
    edtJobNumber: TEdit;
    edtDepartment: TEdit;
    ClearButton: TButton;
    Label1: TLabel;
    Label4: TLabel;
    edtCustomer: TEdit;
    dtmDateFrom: TDateTimePicker;
    dtmDateTo: TDateTimePicker;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClearButtonClick(Sender: TObject);
  protected
    procedure JobLogLUParentClosed(var Message: TMessage); message JobLogLU_ParentClosed;
  private
    FParentForm: TForm;
    procedure SetParentForm(const Value: TForm);
    { Private declarations }
  public
    property ParentForm : TForm read FParentForm write SetParentForm;
  end;

var
  frmSFLUJobLogSearch: TfrmSFLUJobLogSearch;

implementation

uses SFJobBagLogDM, SFLUJobLog;

{$R *.dfm}

procedure TfrmSFLUJobLogSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlJobBagLog.DateFrom := dtmDateFrom.date;
  dtmdlJobBagLog.DateTo := dtmDateTo.date;
  dtmdlJobBagLog.Customer := Trim(edtCustomer.Text);
  dtmdlJobBagLog.JobNumber := Trim(edtJobNumber.Text);
  dtmdlJobBagLog.JobName := Trim(edtJobName.Text);
  dtmdlJobBagLog.NonJobCode := Trim(edtNonJobCode.Text);
  dtmdlJobBagLog.Department := Trim(edtDepartment.Text);
  dtmdlJobBagLog.Process := Trim(edtProcess.Text);
  dtmdlJobBagLog.WorkCentre := Trim(edtWorkCentre.Text);
  dtmdlJobBagLog.Operation := Trim(edtOperation.Text);
  dtmdlJobBagLog.RefreshData;
  if formatdatetime('dd"/"mm"/"yyyy',dtmdlJobBagLog.DateFrom) <> formatdatetime('dd"/"mm"/"yyyy',dtmdlJobBagLog.DateTo) then
    SFLUJobLogFrm.lblDateFrom.caption := 'Date From';
  SFLUJobLogFrm.dtmDateFrom.date := dtmdateFrom.date;

  PostMessage(ParentForm.Handle, JobLogLU_SelectionChanged, 0, 0);
end;

procedure TfrmSFLUJobLogSearch.SetParentForm(const Value: TForm);
begin
  FParentForm := Value;
end;

procedure TfrmSFLUJobLogSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PostMessage(ParentForm.Handle, JobLogLU_ChildClosed, Left, Top);
  Action := caFree;
end;

procedure TfrmSFLUJobLogSearch.JobLogLUParentClosed(var Message: TMessage);
begin
  Close;
  Message.Result := 1;
end;

procedure TfrmSFLUJobLogSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

end.
