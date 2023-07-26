unit SFLUJobLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls, Menus, DB,
  SFLUJobLogSearch, IniFiles;

type
  TSFLUJobLogFrm = class(TForm)
    stsbrDetails: TStatusBar;
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    Panel2: TPanel;
    btnClose: TButton;
    btnExcel: TBitBtn;
    pmnFunctions: TPopupMenu;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    Panel3: TPanel;
    tmrSearch: TTimer;
    Label1: TLabel;
    memMachine: TMemo;
    memOvertime: TMemo;
    Label4: TLabel;
    memLabour: TMemo;
    Label5: TLabel;
    lblDateFrom: TLabel;
    dtmDateFrom: TDateTimePicker;
    Add1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure Change1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dtmDateFromChange(Sender: TObject);
    procedure Add1Click(Sender: TObject);
  private
    FChildLeft, FChildTop : integer;
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure CallMaintScreen(Mode: string);
    procedure SetButtons(Sender: TObject; Field: TField);
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  protected
    procedure JobLogLUChildClosed(var Message: TMessage); message JobLogLU_ChildClosed;
    procedure JobLogLUSelectionChanged(var Message: TMessage); message JobLogLU_SelectionChanged;
  public
    { Public declarations }
  end;

var
  SFLUJobLogFrm: TSFLUJobLogFrm;

implementation


uses SFJobBagLogDM, CCSCommon, FPMainMenu, SFMaintJobLog;

{$R *.dfm}

procedure TSFLUJobLogFrm.FormShow(Sender: TObject);
begin
  
  dtmdlJobBagLog.RefreshData;
  if dtmdlJobBagLog.DateFrom <> dtmdlJobBagLog.DateTo then
    lblDateFrom.caption := 'Date From';
//  edtSearch.setfocus;
end;

procedure TSFLUJobLogFrm.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
  sTmpDateFrom, stmpDateTo, sEmployeeName: string;
begin
  IniFile := TIniFile.Create(frmFPMainMenu.AppIniFile);

  with IniFile do
    begin
      stmpDateFrom := ReadString('Shop Floor Data Collection', 'Search Date From', 'None');
      stmpDateTo := ReadString('Shop Floor Data Collection', 'Search Date To', 'None');
      sEmployeeName := ReadString('Shop Floor Data Collection', 'Employee Name', 'None');
      Free;
    end;

  FChildLeft := -1;
  FChildTop := -1;

  //  dtmdlJobBagLog := TdtmdlJobBagLog.create(self);
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

  CCSCommon.SetDBGridCols('', 'JobLogLU Col Order', frmFPMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.LoadFormLayout(frmFPMainMenu.AppIniFile, self);
end;

procedure TSFLUJobLogFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(frmSFLUJobLogSearch) then
    PostMessage(frmSFLUJobLogSearch.Handle, JobLogLU_ParentClosed, 0, 0);
  CCSCommon.SaveDBGridCols('', 'JobLogLU Col Order', frmFPMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.SaveFormLayout(frmFPMainMenu.AppIniFile, self);
end;

procedure TSFLUJobLogFrm.SetButtons(Sender: TObject; Field: TField);
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

procedure TSFLUJobLogFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TSFLUJobLogFrm.btnExcelClick(Sender: TObject);
begin
  frmFPMainMenu.ExportToExcel(SFLUJobLogFrm);
end;

procedure TSFLUJobLogFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmFPMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Shop Floor Data Collection', 'Search Date From', pbdatestr(dtmdlJobBagLog.DateFrom));
      WriteString('Shop Floor Data Collection', 'Search Date To', pbdatestr(dtmdlJobBagLog.DateTo));
      WriteString('Shop Floor Data Collection', 'Employee Name', dtmdlJobBagLog.WCOperatorName);
      Free;
    end;
//  dtmdlJobBagLog.free;
end;

procedure TSFLUJobLogFrm.CallMaintScreen(Mode: string);
var
  iTempSel: integer;
begin
//  if dbgDetails.datasource.DataSet.fieldbyname('Job_Bag_Description').asstring = '' then exit;
  SFMaintJobLogFrm := TSFMaintJobLogFrm.create(self);
  try
    SFMaintJobLogFrm.iCode := dbgDetails.datasource.DataSet.fieldbyname('Job_Bag_Time_Log').asinteger;
    SFMaintJobLogFrm.bInsert := (mode = 'I');
    SFMaintJobLogFrm.sFuncMode := Mode;
    SFMaintJobLogFrm.showmodal;

    if SFMaintJobLogFrm.ModalResult = mrOK then
      begin
        iTempSel := SFMaintJobLogFrm.iCode;
        dtmdlJobBagLog.RefreshData;
        dbgDetails.DataSource.DataSet.Locate('Job_bag_Time_log', Variant(inttostr(iTempSel)),[lopartialKey]) ;

      end;
  finally
    SFMaintJobLogFrm.free;
  end;
end;

procedure TSFLUJobLogFrm.dbgDetailsDblClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TSFLUJobLogFrm.Change1Click(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TSFLUJobLogFrm.Delete1Click(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TSFLUJobLogFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlJobBagLog.RefreshData;
end;

procedure TSFLUJobLogFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlJobBagLog.WCOperatorName := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSFLUJobLogFrm.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TSFLUJobLogFrm.btnSearchClick(Sender: TObject);
begin
  if Assigned(frmSFLUJobLogSearch) then
    frmSFLUJobLogSearch.BringToFront
  else
  begin
    frmSFLUJobLogSearch := TfrmSFLUJobLogSearch.Create(Self);

    frmSFLUJobLogSearch.ParentForm := Self;
    if FChildLeft >= 0 then
      begin
        frmSFLUJobLogSearch.Position := poDesigned;
        frmSFLUJobLogSearch.Left := FChildLeft;
        frmSFLUJobLogSearch.Top := FChildTop;
      end;

    frmSFLUJobLogSearch.dtmDateFrom.Date := dtmdlJobBagLog.DateFrom;
    frmSFLUJobLogSearch.dtmDateTo.Date := dtmdlJobBagLog.DateTo;

    frmSFLUJobLogSearch.edtCustomer.text := dtmdlJobBagLog.Customer;
    frmSFLUJobLogSearch.edtJobNumber.Text := dtmdlJobBagLog.JobNumber;
    frmSFLUJobLogSearch.edtJobName.Text := dtmdlJobBagLog.JobName;
    frmSFLUJobLogSearch.edtDepartment.Text := dtmdlJobBagLog.Department;
    frmSFLUJobLogSearch.edtProcess.Text := dtmdlJobBagLog.Process;
    frmSFLUJobLogSearch.edtNonJobCode.Text := dtmdlJobBagLog.NonJobCode;
    frmSFLUJobLogSearch.edtWorkCentre.Text := dtmdlJobBagLog.WorkCentre;
    frmSFLUJobLogSearch.edtOperation.Text := dtmdlJobBagLog.Operation;
    frmSFLUJobLogSearch.Show;
  end;
end;

procedure TSFLUJobLogFrm.JobLogLUChildClosed(var Message: TMessage);
begin
  FChildLeft := Message.WParam;
  FChildTop := Message.LParam;
  frmSFLUJobLogSearch := nil;
  Message.Result := 1;
end;

procedure TSFLUJobLogFrm.JobLogLUSelectionChanged(var Message: TMessage);
begin
  dtmdlJobBagLog.Refreshdata;
  Message.Result := 1;
end;

procedure TSFLUJobLogFrm.dtmDateFromChange(Sender: TObject);
begin
  dtmdlJobBagLog.DateFrom := dtmDateFrom.Date;
  dtmdlJobBagLog.DateTo := dtmDateFrom.Date;
  dtmdlJobBagLog.RefreshData;
  lblDateFrom.caption := 'Date';
end;

procedure TSFLUJobLogFrm.Add1Click(Sender: TObject);
begin
  CallMaintScreen('I');
end;

end.
