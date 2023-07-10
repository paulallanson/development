unit PBLUJobLogSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TfrmPBLUJobLogSearch = class(TForm)
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
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  frmPBLUJobLogSearch: TfrmPBLUJobLogSearch;

implementation

uses SFJobBagLogDM, PBLUJobLog;

{$R *.dfm}

procedure TfrmPBLUJobLogSearch.SearchButtonClick(Sender: TObject);
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
    PBLUJobLogFrm.lblDateFrom.caption := 'Date From';
  PBLUJobLogFrm.dtmDateFrom.date := dtmdateFrom.date;
  close;
end;

procedure TfrmPBLUJobLogSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
  close;
end;

end.
