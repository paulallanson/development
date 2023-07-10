unit PBLUJobLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB,
  DBTables, IniFiles;

type
  TPBLUJobLogFrm = class(TForm)
    dbgDetails: TDBGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblDateFrom: TLabel;
    memMachine: TMemo;
    memOvertime: TMemo;
    memLabour: TMemo;
    dtmDateFrom: TDateTimePicker;
    Panel1: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    Panel2: TPanel;
    btnClose: TButton;
    btnExcel: TBitBtn;
    stsbrDetails: TStatusBar;
    tmrSearch: TTimer;
    Query1: TQuery;
    procedure btnExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure dtmDateFromChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
  private
    procedure SetButtons(Sender: TObject; Field: TField);
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  PBLUJobLogFrm: TPBLUJobLogFrm;

implementation

uses pbMainMenu, SFJobBagLogDM, CCSCommon, PBLUJobLogSearch;

{$R *.dfm}

procedure TPBLUJobLogFrm.btnExcelClick(Sender: TObject);
begin
  frmPBMainMenu.ExportToExcel(PBLUJobLogFrm);
end;

procedure TPBLUJobLogFrm.FormShow(Sender: TObject);
begin
  dtmdlJobBagLog.RefreshData;
  if dtmdlJobBagLog.DateFrom <> dtmdlJobBagLog.DateTo then
    lblDateFrom.caption := 'Date From';
end;

procedure TPBLUJobLogFrm.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sTmpDateFrom, stmpDateTo, sEmployeeName: string;
begin
  IniFile := TIniFile.Create('datacollect.ini');

  with IniFile do
    begin
      stmpDateFrom := ReadString('Shop Floor Data Collection', 'Search Date From', 'None');
      stmpDateTo := ReadString('Shop Floor Data Collection', 'Search Date To', 'None');
      sEmployeeName := ReadString('Shop Floor Data Collection', 'Employee Name', 'None');
      Free;
    end;

  dtmdlJobBagLog := TdtmdlJobBagLog.create(self);
  dtmdlJobBagLog.dtsJobLogGrid.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlJobBagLog.dtsJobLogGrid;

  if stmpDateFrom = 'None' then
    begin
      dtmdlJobBagLog.DateFrom := Date;
      dtmDateFrom.Date := date;
    end
  else
    begin
      dtmdlJobBagLog.DateFrom := pbdatestr(stmpDateFrom);
      dtmDateFrom.Date := dtmdlJobBagLog.DateFrom;
    end;

  if stmpDateTo = 'None' then
    begin
      dtmdlJobBagLog.DateTo := Date;
    end
  else
    begin
      dtmdlJobBagLog.DateTo := pbdatestr(stmpDateTo);
    end;

  if sEmployeeName = 'None' then
    begin
      dtmdlJobBagLog.WCOperatorName := '';
      edtSearch.Text := '';
    end
  else
    begin
      dtmdlJobBagLog.WCOperatorName := sEmployeeName;
      edtSearch.Text := dtmdlJobBagLog.WCOperatorName;
    end;

  CCSCommon.SetDBGridCols('', 'JobLogLU Col Order', 'datacollect.ini', self.dbgDetails);
  CCSCommon.LoadFormLayout('datacollect.ini', self);
end;

procedure TPBLUJobLogFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveDBGridCols('', 'JobLogLU Col Order', 'datacollect.ini', self.dbgDetails);
  CCSCommon.SaveFormLayout('datacollect.ini', self);

end;

procedure TPBLUJobLogFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlJobBagLog do
  begin
    btnExcel.Enabled := HeaderCount > 0;
    if usingSearch then
      btnSearch.Font.color := clRed
    else
      btnSearch.Font.color := clBlack;

    memLabour.Text := formatfloat('#,##0.00',TotalLabour);
    memOvertime.Text := formatfloat('#,##0.00',TotalOvertime);
    memMachine.Text := formatfloat('#,##0.00',TotalMachine);
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBLUJobLogFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBLUJobLogFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('datacollect.ini');

  with IniFile do
    begin
      WriteString('Shop Floor Data Collection', 'Search Date From', pbdatestr(dtmdlJobBagLog.DateFrom));
      WriteString('Shop Floor Data Collection', 'Search Date To', pbdatestr(dtmdlJobBagLog.DateTo));
      WriteString('Shop Floor Data Collection', 'Employee Name', dtmdlJobBagLog.WCOperatorName);
      Free;
    end;
  dtmdlJobBagLog.free;
end;

procedure TPBLUJobLogFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlJobBagLog.RefreshData;
end;

procedure TPBLUJobLogFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlJobBagLog.WCOperatorName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUJobLogFrm.dtmDateFromChange(Sender: TObject);
begin
  dtmdlJobBagLog.DateFrom := dtmDateFrom.Date;
  dtmdlJobBagLog.DateTo := dtmDateFrom.Date;
  dtmdlJobBagLog.RefreshData;
  lblDateFrom.caption := 'Date';
end;

procedure TPBLUJobLogFrm.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUJobLogFrm.btnSearchClick(Sender: TObject);
begin
  frmPBLUJoblogSearch := TfrmPBLUJoblogSearch.Create(Self);

  try
    frmPBLUJoblogSearch.dtmDateFrom.Date := dtmdlJobBagLog.DateFrom;
    frmPBLUJoblogSearch.dtmDateTo.Date := dtmdlJobBagLog.DateTo;

    frmPBLUJoblogSearch.edtCustomer.text := dtmdlJobBagLog.Customer;
    frmPBLUJoblogSearch.edtJobNumber.Text := dtmdlJobBagLog.JobNumber;
    frmPBLUJoblogSearch.edtJobName.Text := dtmdlJobBagLog.JobName;
    frmPBLUJoblogSearch.edtDepartment.Text := dtmdlJobBagLog.Department;
    frmPBLUJoblogSearch.edtProcess.Text := dtmdlJobBagLog.Process;
    frmPBLUJoblogSearch.edtNonJobCode.Text := dtmdlJobBagLog.NonJobCode;
    frmPBLUJoblogSearch.edtWorkCentre.Text := dtmdlJobBagLog.WorkCentre;
    frmPBLUJoblogSearch.edtOperation.Text := dtmdlJobBagLog.Operation;
    frmPBLUJoblogSearch.ShowModal;
  finally
    frmPBLUJoblogSearch.free;
  end;

end;

end.
