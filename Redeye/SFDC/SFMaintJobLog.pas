unit SFMaintJobLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, SFJobBagLogDM,
  Grids, Mask, DateUtils, IniFiles;

type
  TSFMaintJobLogFrm = class(TForm)
    pnlFooter: TPanel;
    pnlHeader: TPanel;
    pnlJobBag: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label8: TLabel;
    edtActivityDate: TEdit;
    btnActivityDate: TBitBtn;
    Label3: TLabel;
    lblJobBag: TLabel;
    Label15: TLabel;
    edtCustomer: TEdit;
    edtJobTitle: TEdit;
    Label4: TLabel;
    dblkpDepartment: TDBLookupComboBox;
    dblkpProcess: TDBLookupComboBox;
    Label5: TLabel;
    pgTimeDetails: TPageControl;
    tbsWorkCentre: TTabSheet;
    tbsNonWorkCentre: TTabSheet;
    sgManDetails: TStringGrid;
    pnlWCDets: TPanel;
    lblPaperSize: TLabel;
    lblNumberUp: TLabel;
    lblFormat: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    dblkpProcessPaper: TDBLookupComboBox;
    cmbFormat: TComboBox;
    edtQuantity: TEdit;
    spnNumberUp: TSpinEdit;
    dblkpWorkCentre: TDBLookupComboBox;
    dblkpOperation: TDBLookupComboBox;
    pnlWorkCentre: TPanel;
    pnlManDetsTop: TPanel;
    Label9: TLabel;
    edtMachineHrs: TEdit;
    pnlUnassWCOperatorsList: TPanel;
    pnlWCOperatorsTop: TPanel;
    pnlWCOperatorsBottom: TPanel;
    Label14: TLabel;
    edtSearch: TEdit;
    tmrSearch: TTimer;
    dblkpWCOperators: TDBLookupListBox;
    pnlWCOperatorsCenter: TPanel;
    tbsNonWorkCentreChange: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label6: TLabel;
    Label37: TLabel;
    dblkpManOperation: TDBLookupComboBox;
    Label40: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    edtEmployeeNo: TEdit;
    lblEmployeeName: TLabel;
    edtEmployeeName: TEdit;
    btnLUEmployee: TBitBtn;
    Label12: TLabel;
    Label34: TLabel;
    edtStartTime: TMaskEdit;
    Label35: TLabel;
    edtFinishTime: TMaskEdit;
    edtLabourHrs: TEdit;
    Label2: TLabel;
    chkbxViewAll: TCheckBox;
    stsbrDetails: TStatusBar;
    cmbManOvertime: TComboBox;
    cmbManTime: TComboBox;
    cmbJobBag: TComboBox;
    lblDelete: TLabel;
    cmbLabourHours: TComboBox;
    cmbOvertimeHours: TComboBox;
    btnLUCustomer: TBitBtn;
    edtStartDate: TEdit;
    edtFinishDate: TEdit;
    pnlAssWCOperatorList: TPanel;
    Panel2: TPanel;
    lstbxWCAssistants: TListBox;
    lstbxWCAssistantsCode: TListBox;
    procedure EnableOK(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpDepartmentClick(Sender: TObject);
    procedure dblkpProcessClick(Sender: TObject);
    procedure edtJobbagKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure edtLabourHrsKeyPress(Sender: TObject; var Key: Char);
    procedure btnActivityDateClick(Sender: TObject);
    procedure edtActivityDateExit(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure dblkpWCOperatorsDblClick(Sender: TObject);
    procedure sgManDetailsDrawCell(Sender: TObject; vCol, vRow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sgManDetailsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure sgWCDetailsKeyPress(Sender: TObject; var Key: Char);
    procedure edtEmployeeNoExit(Sender: TObject);
    procedure btnLUEmployeeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkbxViewAllClick(Sender: TObject);
    procedure edtFinishTimeExit(Sender: TObject);
    procedure cmbManTimeClick(Sender: TObject);
    procedure cmbManTimeEnter(Sender: TObject);
    procedure cmbManTimeExit(Sender: TObject);
    procedure cmbManTimeKeyPress(Sender: TObject; var Key: Char);
    procedure sgManDetailsClick(Sender: TObject);
    procedure cmbManOvertimeEnter(Sender: TObject);
    procedure cmbManOvertimeExit(Sender: TObject);
    procedure cmbManOvertimeKeyPress(Sender: TObject; var Key: Char);
    procedure cmbManKeyPress(Sender: TObject; var Key: Char);
    procedure cmbManEnter(Sender: TObject);
    procedure cmbManExit(Sender: TObject);
    procedure cmbManTimeChange(Sender: TObject);
    procedure cmbManOvertimeChange(Sender: TObject);
    procedure cmbJobBagKeyPress(Sender: TObject; var Key: Char);
    procedure cmbJobBagChange(Sender: TObject);
    procedure cmbJobBagExit(Sender: TObject);
    procedure pnlHeaderEnter(Sender: TObject);
    procedure cmbLabourHoursExit(Sender: TObject);
    procedure cmbLabourHoursKeyPress(Sender: TObject; var Key: Char);
    procedure btnLUCustomerClick(Sender: TObject);
    procedure edtFinishDateExit(Sender: TObject);
    procedure cmbFormatKeyPress(Sender: TObject; var Key: Char);
    procedure lstbxWCAssistantsDblClick(Sender: TObject);
  private
    { Private declarations }
    FActivated: boolean;
    bDisableNameChangeEvent: ByteBool;
    bRequiresCustomer: bytebool;
    bMoved: bytebool;
    bSaved: bytebool;
    bUseWorkCentre: bytebool;
    bValueOK: bytebool;
    dtEntered: TDateTime;
    iCustomer: integer;
    iMasterJobLog: integer;
    iOperator: integer;
    iWCOperator: integer;
    bWCAssistant: bytebool;
    rHourlyRate: double;
    PromptforOperator: string;
    sNonJobBag: string;
    sEmployeeNo: string;
    sWorkCentre: string;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure ShowWCOperators;
    procedure LoadProcessOperations;
    procedure CheckJobTimeLog;
    procedure CheckNonJobTimeLog;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure ClearJobBagDetails;
    procedure ClearWorkCentreDetails;
    procedure ClearNonWorkCentreDetails;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure ShowTimeEnteredtoDate;
    procedure GetDefaults;
  public
    iCode: integer;
    sFuncMode: string[1];
    bInsert: boolean;
  end;

var
  SFMaintJobLogFrm: TSFMaintJobLogFrm;

implementation

uses FPMainMenu, ComObj, ActiveX, CCSCommon, DateSelV5, SFLUWCOperator,
  SFLUCust;

{$R *.dfm}

procedure TSFMaintJobLogFrm.FormCreate(Sender: TObject);
var
  TempArray: array[0..255] of Char;
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  {Search the INI file to decide whether to prompt for Operator}
  GetPrivateProfileString('Shop Floor Data Collection', 'Prompt for User', '', TempArray,
    sizeof(TempArray), frmFPMainMenu.AppIniFile);

  PromptforOperator := TempArray;

//  dtmdlJobBagLog := TdtmdlJobBagLog.Create(self);
  pgTimeDetails.Visible := false;
  pgTimedetails.ActivePageIndex := 0;
  bUseWorkCentre := true;

  sgManDetails.cells[1,0] := 'Operation';
  sgManDetails.cells[2,0] := 'Hours';
  sgManDetails.cells[3,0] := 'Overtime';

  sgManDetails.ColWidths[0] := -1;

  iMasterJobLog := 0;
  rHourlyRate := 0.00;
  bSaved := true;

  bDisableNameChangeEvent := False;
  CCSCommon.LoadFormLayout(frmFPMainMenu.AppIniFile, self);

  GetDefaults;
end;

procedure TSFMaintJobLogFrm.GetDefaults;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmFPMainMenu.AppIniFile);

  with IniFile do
    begin
      try
        sEmployeeNo := ReadString('Shop Floor Data Collection', 'Employee Number', 'None');
        sWorkCentre := ReadString('Shop Floor Data Collection', 'Work Centre', 'None');
      finally
        Free;
      end;
    end;
end;

procedure TSFMaintJobLogFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmFPMainMenu.AppIniFile);

  with IniFile do
    begin
      try
        WriteString('Shop Floor Data Collection', 'Employee Number', edtEmployeeNo.text);
        WriteString('Shop Floor Data Collection', 'Work Centre', dblkpWorkCentre.text);
      finally
        Free;
      end;
    end;
//  dtmdlJobBagLog.Free;
end;

procedure TSFMaintJobLogFrm.FormActivate(Sender: TObject);
var
  bEmployeeExists: boolean;
begin
  if not FActivated then
  begin
  with dtmdlJobBagLog.qryProcessGrp do
    begin
      close;
      open;
    end;

  with dtmdlJobBagLog.qryWorkCentre do
    begin
      close;
      open;
    end;

//  ShowWCOperators;


  {Setup titles}
  if (sFuncMode = 'A') or (sFuncMode = 'I') then
    Caption := 'Add a new Job Time Record';
  if sFuncMode = 'C' then
    Caption := 'Change a Job Time Record';
  if sFuncMode = 'D' then
    Caption := 'Delete a Job Time Record';
  if (sFuncMode = 'A') or (sFuncMode = 'I') then
    begin
      {Empty details}
      edtActivitydate.text := PBDateStr(Date);
      edtStartdate.text := PBDateStr(Date);
      edtFinishdate.text := PBDateStr(Date);

      cmbJobbag.Text := '';
      edtCustomer.Text := '';
      edtJobTitle.Text := '';
      dblkpDepartment.KeyValue := 0;
      dblkpProcess.KeyValue := 0;
      dblkpWorkCentre.KeyValue := dtmdlJobBagLog.GetWorkCentre(sWorkCentre);
      edtQuantity.text := '';
      dblkpProcessPaper.keyvalue := 0;
      spnNumberUp.value := 1;
      cmbFormat.ItemIndex := -1;
      edtMachineHrs.Text := '0';
      bWCAssistant := false;
      edtLabourHrs.Enabled := false;
      bEmployeeExists := dtmdlJobBagLog.GetEmployee(sEmployeeNo);
      if (sEmployeeNo = 'None') or (sEmployeeNo = '') or (not bEmployeeExists) then
        edtemployeeNo.SetFocus
      else
        begin
          edtEmployeeNo.Text := sEmployeeNo;
          edtEmployeeNoExit(self);
          cmbJobBag.SetFocus;
        end;
      if bInsert then
        begin
          if bUseWorkCentre then
            begin
              pgTimeDetails.ActivePageIndex := 0 {tbsWorkCentre}
            end
          else
            begin
              pgTimeDetails.ActivePageIndex := 2; {tbsNonWorkCentre}
            end;
        end
    end
  else
    begin
      pnlWorkCentre.Visible := false;
      with dtmdlJobBagLog.qryGetJobLog do
        begin
          close;
          parambyname('Job_Bag_Time_log').asinteger := iCode;
          open;
          dtEntered := fieldbyname('Date_Entered').asdatetime;
          iOperator := fieldbyname('Operator').asinteger;
          iMasterJobLog := fieldbyname('Master_Job_Time_log').asinteger;
          rHourlyRate := fieldbyname('Hourly_Rate').asfloat;
          bWCAssistant := (fieldbyname('Work_Centre_Assistant').asstring = 'Y');

          edtActivityDate.text := pbdateStr(fieldbyname('Date_Point').asdatetime);

          edtEmployeeNo.Text := fieldbyname('Employee_Number').asstring;
          edtEmployeeName.Text := fieldbyname('Employee_Name').asstring;
          dblkpDepartment.KeyValue := fieldbyname('Process_Group').asinteger;
          dblkpDepartmentclick(self);
          dblkpProcess.KeyValue := fieldbyname('Process').asinteger;
          dblkpProcessclick(self);

          if fieldbyname('Job_bag').asinteger <> 0 then
            cmbJobbag.Text := fieldbyname('Job_bag').asstring
          else
            begin
              cmbJobbag.Text := fieldbyname('Activity').asstring;
              cmbJobBagChange(self);
            end;

          edtCustomer.Text := fieldbyname('Customer_Name').asstring;
          iCustomer := fieldbyname('Customer').asinteger;
          edtJobTitle.Text := fieldbyname('Job_Bag_Description').asstring;

          if self.bUseWorkCentre then
            begin
              iWCOperator := fieldbyname('Work_Centre_Operator').asinteger;
              dblkpWorkCentre.KeyValue := fieldbyname('Work_Centre').asinteger;
              dblkpOperation.KeyValue := fieldbyname('Operation').asinteger;
              edtQuantity.text := floattostr(fieldbyname('Quantity').asfloat);
              dblkpProcessPaper.keyvalue := fieldbyname('Paper_Size').asinteger;
              spnNumberUp.value := fieldbyname('Number_Up').asinteger;

              if fieldbyname('Laser_Format').asstring = 'S' then
                cmbFormat.ItemIndex := 0
              else
              if fieldbyname('Laser_Format').asstring = 'D' then
                cmbFormat.ItemIndex := 1
              else
                cmbFormat.ItemIndex := -1;

              edtStartDate.Text := pbDateStr(fieldbyname('Labour_Time_From').asdatetime);

              try
                edtStartTime.Text := formatdatetime('hh:mm',fieldbyname('Labour_Time_From').asdatetime);
              except
                edtStartTime.Text := '12:00';
              end;

              edtFinishDate.Text := pbDateStr(fieldbyname('Labour_Time_To').asdatetime);
              try
                edtFinishTime.Text := formatdatetime('hh:mm',fieldbyname('Labour_Time_To').asdatetime);
              except
                edtFinishTime.Text := '12:00';
              end;

              edtLabourHrs.Text := formatfloat('0.00',fieldbyname('Labour_Hours').asfloat);
              edtMachineHrs.Text := formatfloat('0.00',fieldbyname('Machine_Hours').asfloat);

(*              if fieldbyname('Machine_Hours').asfloat <> 0 then
                begin
                  edtLabourHrs.Text := formatfloat('0.00',0);
                  edtLabourHrs.enabled := false;
                  edtMachineHrs.Text := formatfloat('0.00',fieldbyname('Machine_Hours').asfloat);
                end
              else
                begin
                  edtMachineHrs.Text := formatfloat('0.00',0);
                  edtMachineHrs.enabled := false;

                  edtLabourHrs.Enabled := self.bWCAssistant;
                  edtLabourHrs.Text := formatfloat('0.00',fieldbyname('Labour_Hours').asfloat);
                end;
*)
              pgTimeDetails.ActivePageIndex := 0; {tbsWorkCentre}
            end
          else
            begin
              iWCOperator := fieldbyname('Work_Centre_Operator').asinteger;
              dblkpManOperation.KeyValue := fieldbyname('Operation').asinteger;
              cmbLabourHours.Text := formatfloat('0.00',fieldbyname('Labour_Hours').asfloat);
              cmbOvertimeHours.Text := formatfloat('0.00',fieldbyname('Labour_Overtime_Hours').asfloat);
              pgTimeDetails.ActivePageIndex := 2; {tbsNonWorkCentre}
            end;
        end;
      enableOK(self);
    end;

  pgTimeDetails.Visible := true;

  {Enable or disable the buttons}
  lblDelete.Visible := (sFuncMode = 'D');
  pnlHeader.Enabled := (sFuncMode <> 'D');
  pnlJobBag.Enabled := (sFuncMode <> 'D');
  pnlWorkCentre.Enabled := (sFuncMode <> 'D');
  FActivated := true;
  end;
end;

procedure TSFMaintJobLogFrm.dblkpDepartmentClick(Sender: TObject);
begin
  ShowWCOperators;
  with dtmdlJobBagLog.qryGetProcessGrp do
    begin
      close;
      parambyname('Process_Group').asinteger := dtmdlJobBagLog.qryProcessGrp.fieldbyname('Process_Group').asinteger;
      open;

      if fieldbyname('is_work_centre_based').asstring = 'Y' then
        begin
          pgTimedetails.ActivePageIndex := 0;
          lblJobBag.caption := 'Control No.';
          bUseWorkCentre := true;
        end
      else
        begin
          if self.sFuncMode = 'A' then
            pgTimedetails.ActivePageIndex := 1
          else
            pgTimedetails.ActivePageIndex := 2;
          lblJobBag.caption := 'Job Bag/Activity';
          bUseWorkCentre := false;
        end;
    end;

  with dtmdlJobBagLog.qryProcess do
    begin
      close;
      open;
      if recordcount = 1 then
        begin
          dblkpProcess.KeyValue := dtmdlJobBagLog.qryProcess.fieldbyname('Process').asinteger;
          dblkpProcessClick(self);
          cmbJobBag.setfocus;
        end;
    end;

  if bUseWorkCentre then
    begin
      with dtmdlJobBagLog.qryProcessGrpWC do
        begin
          close;
          parambyname('Process_Group').asinteger := dtmdlJobBagLog.qryProcessGrp.fieldbyname('Process_Group').asinteger;
          open;
        end;
    end;

  {Show the alternative activities for the selected Process group/Department}
  with dtmdlJobBagLog.qryActivities do
    begin
      close;
      open;
      cmbJobBag.Items.Clear;
      first;

      while eof <> true do
        begin
          cmbJobBag.Items.Add(fieldbyname('Activity').asstring);
          next;
        end;
    end;

  enableok(self);
end;

procedure TSFMaintJobLogFrm.dblkpProcessClick(Sender: TObject);
begin
  {Get the actual process}
  with dtmdlJobBagLog.qryGetProcess do
    begin
      close;
      parambyname('Process').asinteger := dtmdlJobBagLog.qryProcess.fieldbyname('Process').asinteger;
      open;

      {Determine whether to display the Number Up, Paper Size and Laser Format}
      lblNumberUp.caption := fieldbyname('Number_Type_Description').asstring;
      
      lblNumberUp.Enabled := (fieldbyname('SFDC_Prompt_For_Number_Up').asstring = 'Y');
      spnNumberUp.Value := 0;
      spnNumberUp.Enabled := lblNumberUp.Enabled;

      lblPaperSize.Enabled := (fieldbyname('SFDC_Prompt_For_Paper_Size').asstring = 'Y');
      dblkpProcessPaper.KeyValue := 0;
      dblkpProcessPaper.Enabled := lblPaperSize.Enabled;

      lblFormat.Enabled := (fieldbyname('SFDC_Prompt_For_Laser_Format').asstring = 'Y');
      cmbFormat.itemindex := -1;
      cmbFormat.Enabled := lblFormat.Enabled;
    end;

  {load the Process paper sizes}
  with dtmdlJobBagLog.qryProcessPaper do
    begin
      close;
      open;
      if recordcount = 1 then
        dblkpProcessPaper.KeyValue := dtmdlJobBagLog.qryProcessPaper.fieldbyname('Paper_size').asinteger;
    end;

  ClearGrid(sgManDetails);
  LoadProcessOperations;

  enableok(self);
end;

procedure TSFMaintJobLogFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    end;
end;

procedure TSFMaintJobLogFrm.LoadProcessOperations;
var
  icount: integer;
begin
  {load the Process operations}
  with dtmdlJobBagLog.qryProcessOps, sgManDetails do
    begin
      close;
      open;
      if recordcount = 1 then
        dblkpOperation.KeyValue := dtmdlJobBagLog.qryProcessOps.fieldbyname('Operation').asinteger;

      first;
      icount := 1;
      while eof <> true do
        begin
          cells[1,icount] := fieldbyname('Operation_Description').asstring;
          cells[0,icount] := fieldbyname('Operation').asstring;
          icount := icount + 1;
          next;
        end;
      if recordcount = 0 then
        rowcount := 2
      else
        rowcount := recordcount + 1;
    end;

end;

procedure TSFMaintJobLogFrm.edtJobbagKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TSFMaintJobLogFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
        begin
          with TStringGrid(ActiveControl) do
            begin
              if TStringGrid(activeControl).Name = 'sgWCDetails' then
              begin
              if bMoved then
                begin
                  bMoved := False;
                  Exit;
                end;
              if Col = 1 then
                col := 2
              else
              if Col = 2 then
                begin
                  if row = pred(rowcount) then
                    row := 1
                  else
                    row := row + 1;
                  Exit;
                end;
              end
              else
              if TStringGrid(activeControl).Name = 'sgManDetails' then
              begin
              if bMoved then
                begin
                  bMoved := False;
                  Exit;
                end;
              if Col = 3 then
                begin
                  if row = pred(rowcount) then
                    row := 1
                  else
                    row := row + 1;
                  Exit;
                end
              else
                Col := col + 1;
              end
            end;
        end
      else
      if (ActiveControl is TComboBox) then { if it is a TComboBox}
        begin
          exit
        end
      else
        begin
          Key := #0; { eat enter key }
          Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
        end;
    end;
end;

procedure TSFMaintJobLogFrm.CheckJobTimeLog;
var
  irow: integer;
begin
  if (self.sFuncMode = 'C') or (self.sFuncMode = 'D') or (self.sFuncMode = 'I') then
    exit;

  if  (trim(edtActivityDate.Text) = '') or (dblkpDepartment.Text = '') or
      (dblkpProcess.Text = '') or (trim(cmbJobBag.text) = '') or (iWCOperator = 0) then
      exit;
  {check to see if there are any records for this day, employee, department, process and job Bag}
  with dtmdlJobBagLog.qryGetJobTimeLog do
    begin
      close;
      parambyname('Date_Point').asdatetime := pbdatestr(edtActivityDate.text);
      parambyname('Work_Centre_Operator').asinteger := self.iWCOperator;
      parambyname('Process_Group').asinteger := dblkpDepartment.keyvalue;
      parambyname('Process').asinteger := dblkpProcess.keyvalue;
      parambyname('Job_Bag').asinteger := strtoint(trim(cmbJobBag.text));
      open;

      if recordcount > 0 then
        begin
          messagedlg('Entries already exist for this date, department, job bag and employee', mtInformation, [mbOk], 0);
          first;
          iMasterJobLog := fieldbyname('Job_Bag_Time_log').Asinteger;

          ClearNonWorkCentreDetails;

          while eof <> true do
            begin
              for irow := 1 to sgManDetails.rowcount do
                begin
                  if sgManDetails.Cells[0,irow] = fieldbyname('Operation').Asstring then
                    begin
                      sgManDetails.cells[2,irow] := formatfloat('0.00',fieldbyname('Labour_Hours').asfloat);
                      sgManDetails.cells[3,irow] := formatfloat('0.00',fieldbyname('Labour_Overtime_Hours').asfloat);
                    end;
                end;
              next;
            end;
        end
      else
        begin
          iMasterJobLog := 0;
//          ClearNonWorkCentreDetails;
        end;
    end;
  bSaved := true;
end;

procedure TSFMaintJobLogFrm.CheckNonJobTimeLog;
var
  irow: integer;
begin
  if (self.sFuncMode = 'C') or (self.sFuncMode = 'D') or (self.sFuncMode = 'I') then
    exit;
  if  (trim(edtActivityDate.Text) = '') or (dblkpDepartment.Text = '') or
      (dblkpProcess.Text = '') or (trim(cmbJobBag.text) = '') or (iWCOperator = 0) then
      exit;
  if bRequiresCustomer then
    exit;

  {check to see if there are any records for this day, employee, department, process and job Bag}
  with dtmdlJobBagLog.qryGetNonJobTimeLog do
    begin
      close;
      parambyname('Date_Point').asdatetime := pbdatestr(edtActivityDate.text);
      parambyname('Work_Centre_Operator').asinteger := self.iWCOperator;
      parambyname('Process_Group').asinteger := dblkpDepartment.keyvalue;
      parambyname('Process').asinteger := dblkpProcess.keyvalue;
      parambyname('Activity').asstring := cmbJobBag.text;
      open;

      if recordcount > 0 then
        begin
          messagedlg('Entries already exist for this date, department, activity and employee', mtInformation, [mbOk], 0);
          first;
          iMasterJobLog := fieldbyname('Job_Bag_Time_log').Asinteger;

          ClearNonWorkCentreDetails;

          iCustomer := fieldbyname('Customer').AsInteger;
          edtCustomer.Text := fieldbyname('Customer_Name').asstring;
          
          while eof <> true do
            begin
              for irow := 1 to sgManDetails.rowcount do
                begin
                  if sgManDetails.Cells[0,irow] = fieldbyname('Operation').Asstring then
                    begin
                      sgManDetails.cells[2,irow] := formatfloat('0.00',fieldbyname('Labour_Hours').asfloat);
                      sgManDetails.cells[3,irow] := formatfloat('0.00',fieldbyname('Labour_Overtime_Hours').asfloat);
                    end;
                end;
              next;
            end;
        end
      else
        begin
          iMasterJobLog := 0;
//          ClearNonWorkCentreDetails;
        end;
    end;
  bSaved := true;
end;

procedure TSFMaintJobLogFrm.EnableOK(Sender: TObject);
begin
  if sFuncMode = 'A' then
    begin
      if self.bUseWorkCentre then
        begin
          btnOK.Enabled :=
                    (cmbjobBag.Text <> '') and
                    (dblkpDepartment.text <> '') and
                    (dblkpProcess.text <> '') and
                    (dblkpWorkCentre.text <> '') and
                    ((dblkpProcessPaper.text <> '') or (not dblkpProcessPaper.enabled)) and
                    (edtQuantity.Text <> '') and
                    (edtEmployeeNo.Text <> '') and
                    ((edtCustomer.Text <> '') or (not btnLUCustomer.Visible)) and
                    (edtMachineHrs.Text <> '');
        end
      else
        begin
          btnOK.Enabled :=
                    (cmbjobBag.Text <> '') and
                    (dblkpDepartment.KeyValue <> 0) and
                    (dblkpProcess.KeyValue <> 0) and
                    ((edtCustomer.Text <> '') or (not btnLUCustomer.Visible)) and
                    (edtEmployeeNo.Text <> '');
        end;
    end
  else
    begin
      if self.bUseWorkCentre then
        begin
          btnOK.Enabled :=
                    (cmbjobBag.Text <> '') and
                    (dblkpDepartment.KeyValue <> 0) and
                    (dblkpProcess.KeyValue <> 0) and
                    ((edtCustomer.Text <> '') or (not btnLUCustomer.Visible)) and
                    (edtEmployeeNo.Text <> '');
        end
      else
        begin
          btnOK.Enabled :=
                    (cmbjobBag.Text <> '') and
                    (dblkpDepartment.KeyValue <> 0) and
                    (dblkpManOperation.KeyValue <> 0) and
                    (dblkpProcess.KeyValue <> 0) and
                    (cmbLabourHours.Text <> '') and
                    (edtEmployeeNo.Text <> '') and
                    ((edtCustomer.Text <> '') or (not btnLUCustomer.Visible)) and
                    (cmbOvertimeHours.Text <> '');
        end;
    end
end;

procedure TSFMaintJobLogFrm.btnOKClick(Sender: TObject);
var
  iTempNewCode, iMasterCode: Integer;
  irow, icount: integer;
  startDate, FinishDate: TdateTime;
  rLabour, rOvertime, rMachineRate, rClickRate: real;
  bSuccess: boolean;
begin
  if sFuncMode[1] in ['A', 'C', 'I'] then
    begin
      if trim(cmbJobBag.text) = '' then
        begin
          messagedlg('A job bag number or activity code must be entered', mtError, [mbOk], 0);
          cmbJobBag.SetFocus;
          exit;
        end;

      if btnLUCustomer.visible and (trim(edtCustomer.text) = '') then
        begin
          messagedlg('A customer must be entered for the job bag/activity code entered', mtError, [mbOk], 0);
          sgManDetails.SetFocus;
          exit;
        end;

      if pbdatestr(edtActivityDate.text) > date then
        begin
          messagedlg('The Activity Date cannot be a future date', mtError, [mbOk], 0);
          edtActivityDate.SetFocus;
          exit;
        end;

      if self.bUseWorkCentre then
        begin
          try
            startDate := pbdatestr(edtStartDate.text) + strtotime(edtStartTime.text);
          except
            begin
              messagedlg('The Start time is an invalid time', mtError, [mbOk], 0);
              edtStartTime.SetFocus;
              exit;
            end;
          end;

          try
            finishDate := pbdatestr(edtFinishDate.text) + strtotime(edtFinishTime.text);
          except
            begin
              messagedlg('The Finish time is an invalid time', mtError, [mbOk], 0);
              edtFinishTime.SetFocus;
              exit;
            end;
          end;

          if startDate > finishDate then
            begin
              messagedlg('The Start and Finish times are invalid', mtError, [mbOk], 0);
              edtStartTime.SetFocus;
              exit;
            end;
        end;
    end;

  if sFuncMode = 'A' then
  begin
    if iMasterJobLog <> 0 then
      begin
        with dtmdlJobBagLog.qryDelMulti do
          begin
            Close;
            ParamByName('Master_Job_Time_Log').AsInteger := iMasterJobLog;
            execsql;
          end;
      end;

    if bUseWorkCentre then
      begin
        {Add the main operator}
        {Get Next code}
        rMachineRate := 0.00;
        rClickRate := 0.00;
        
        iTempNewCode := GetNextKey;
        with dtmdlJobBagLog.UpdSQL do
          begin
            Close;
            ParamByName('Job_Bag_Time_Log').AsInteger := iTempNewCode;
            try
              begin
                ParamByName('Job_Bag').AsInteger := strtoint(cmbJobBag.text);
                ParamByName('Activity').clear;
              end
            except
              begin
                ParamByName('Job_Bag').clear;
                ParamByName('Activity').asstring := cmbJobBag.text;
              end;
            end;
            ParamByName('Date_Entered').Asdatetime := now;
            ParamByName('Date_Point').Asdatetime := pbdatestr(edtActivityDate.text);
            ParamByName('Process_group').AsInteger := dblkpDepartment.KeyValue;
            ParamByName('Process').AsInteger := dblkpProcess.KeyValue;
            ParamByName('Work_Centre').AsInteger := dblkpWorkCentre.KeyValue;
            if dblkpProcessPaper.text = '' then
              ParamByName('Paper_Size').clear
            else
              ParamByName('Paper_Size').Asinteger := dblkpProcessPaper.keyvalue;
            ParamByName('Number_Up').AsInteger := spnNumberUp.Value;
            ParamByName('Custom_Paper_Size').Asstring := '';

            case cmbFormat.ItemIndex of
              0:  Parambyname('Laser_Format').asstring := 'S';
              1:  Parambyname('Laser_Format').asstring := 'D'
            else
              Parambyname('Laser_Format').clear;
            end;

            ParamByName('Quantity').AsFloat := StrToFloatDef(edtQuantity.Text, 0, FormatSettings);
            ParamByName('Operator').Asinteger := frmFPMainMenu.iOperator;
            ParamByName('Audit_Workstation').Asstring := frmFPMainMenu.sCompName;
            ParamByName('Labour_Time_From').asdatetime := StartDate;
            ParamByName('Labour_Time_to').asdatetime := FinishDate;
            ParambyName('Labour_Overtime_Hours').asfloat := 0;
            ParamByName('Labour_Hours').Asfloat := hourspan(StartDate, FinishDate);
            ParamByName('Machine_Hours').Asfloat := StrToFloatDef(edtMachineHrs.text, 0, FormatSettings);
            ParamByName('Team_Count').AsInteger := 0;
            ParamByName('Work_Centre_Operator').asinteger := iWCOperator;
            ParamByName('Operation').AsInteger := dblkpOperation.keyvalue;
            ParamByName('Work_Centre_Assistant').Asstring := 'N';
            ParamByName('Master_Job_Time_Log').Asinteger := iTempNewCode;
            if iCustomer = 0 then
              ParamByName('Customer').clear
            else
              ParamByName('Customer').Asinteger := iCustomer;

            {Get the operators hourly rate}
            rHourlyRate := dtmdlJobBagLog.GetOperatorHourlyRate(iWCOperator);
            if rHourlyRate <> 0 then
              Parambyname('Hourly_Rate').asfloat := rHourlyRate
            else
              Parambyname('Hourly_Rate').asfloat := dtmdlJobBagLog.GetDeptHourlyRate(dblkpDepartment.KeyValue);

            bSuccess := dtmdlJobBagLog.GetWorkCentreRates(dblkpWorkCentre.KeyValue, rMachineRate, rClickRate);
            if not bSuccess then
              begin
                Parambyname('Machine_Hourly_Rate').asfloat := 0.00;
                Parambyname('Click_Charge').asfloat := 0.00;
              end
            else
              begin
                Parambyname('Machine_Hourly_Rate').asfloat := rMachineRate;
                Parambyname('Click_Charge').asfloat := rClickrate;
              end;
            ExecSQL;
          end;

        {Add the supplementary labour details}
        for irow := 0 to pred(lstbxWCAssistantsCode.count) do
          begin
            {Get Next code}
            iTempNewCode := GetNextKey;
            with dtmdlJobBagLog.UpdSQL do
              begin
                Close;
                ParamByName('Job_Bag_Time_Log').AsInteger := iTempNewCode;
                try
                  begin
                    ParamByName('Job_Bag').AsInteger := strtoint(cmbJobBag.text);
                    ParamByName('Activity').clear;
                  end
                except
                  begin
                    ParamByName('Job_Bag').clear;
                    ParamByName('Activity').asstring := cmbJobBag.text;
                  end;
                end;
                ParamByName('Date_Entered').Asdatetime := now;
                ParamByName('Date_Point').Asdatetime := pbdatestr(edtActivityDate.text);
                ParamByName('Process_group').AsInteger := dblkpDepartment.KeyValue;
                ParamByName('Process').AsInteger := dblkpProcess.KeyValue;
                ParamByName('Work_Centre').AsInteger := dblkpWorkCentre.KeyValue;
                if dblkpProcessPaper.text = '' then
                  ParamByName('Paper_Size').clear
                else
                  ParamByName('Paper_Size').Asinteger := dblkpProcessPaper.keyvalue;
                ParamByName('Number_Up').AsInteger := spnNumberUp.Value;
                ParamByName('Custom_Paper_Size').Asstring := '';

                case cmbFormat.ItemIndex of
                  0:  Parambyname('Laser_Format').asstring := 'S';
                  1:  Parambyname('Laser_Format').asstring := 'D'
                else
                  Parambyname('Laser_Format').clear;
                end;

                ParamByName('Quantity').AsFloat := StrToFloatDef(edtQuantity.Text, 0, FormatSettings);
                ParamByName('Operator').Asinteger := frmFPMainMenu.iOperator;
                ParamByName('Audit_Workstation').Asstring := frmFPMainMenu.sCompName;
                ParamByName('Labour_Time_From').asdatetime := StartDate;
                ParamByName('Labour_Time_to').asdatetime := FinishDate;
                ParamByName('Labour_Hours').Asfloat := hourspan(StartDate, FinishDate);
                ParambyName('Labour_Overtime_Hours').asfloat := 0;
                ParamByName('Machine_Hours').Asfloat := 0;
                ParamByName('Team_Count').AsInteger := 0;
                ParamByName('Work_Centre_Operator').AsInteger := strtoint(lstbxWCAssistantsCode.Items[irow]);
                ParamByName('Operation').AsInteger := dblkpOperation.keyvalue;
                ParamByName('Work_Centre_Assistant').Asstring := 'Y';
                ParamByName('Master_Job_Time_Log').Asinteger := iTempNewCode;
                if iCustomer = 0 then
                  ParamByName('Customer').clear
                else
                  ParamByName('Customer').Asinteger := iCustomer;

                {Get the operators hourly rate}
                rHourlyRate := dtmdlJobBagLog.GetOperatorHourlyRate(strtoint(lstbxWCAssistantsCode.Items[irow]));
                if rHourlyRate <> 0 then
                  Parambyname('Hourly_Rate').asfloat := rHourlyRate
                else
                  Parambyname('Hourly_Rate').asfloat := dtmdlJobBagLog.GetDeptHourlyRate(dblkpDepartment.KeyValue);

                bSuccess := dtmdlJobBagLog.GetWorkCentreRates(dblkpWorkCentre.KeyValue, rMachineRate, rClickRate);
                if not bSuccess then
                  begin
                    Parambyname('Machine_Hourly_Rate').asfloat := 0.00;
                    Parambyname('Click_Charge').asfloat := 0.00;
                  end
                else
                  begin
                    Parambyname('Machine_Hourly_Rate').asfloat := rMachineRate;
                    Parambyname('Click_Charge').asfloat := rClickrate;
                  end;
                ExecSQL;
              end;
          end;
        ClearWorkCentreDetails;
      end
    else
      begin
        icount := 1;
        for irow := 1 to pred(sgManDetails.rowcount) do
          begin
//            if (trim(sgManDetails.cells[2,irow]) = '') and (trim(sgManDetails.cells[3,irow]) = '') then
//              continue;

            try
              rLabour := StrToFloatDef(trim(sgManDetails.cells[2,irow]), 0, FormatSettings);
            except
              rLabour := 0;
            end;

            try
              rOvertime := StrToFloatDef(trim(sgManDetails.cells[3,irow]), 0, FormatSettings);
            except
              rOvertime := 0;
            end;

            if (rLabour <> 0) or (rOvertime <> 0) then
            begin
              {Get Next code}
              iTempNewCode := GetNextKey;

              if icount = 1 then
                iMasterCode := iTempNewCode;

              with dtmdlJobBagLog.UpdSQL do
              begin
                Close;
                ParamByName('Job_Bag_Time_Log').AsInteger := iTempNewCode;
                try
                  begin
                    ParamByName('Job_Bag').AsInteger := strtoint(cmbJobBag.text);
                    ParamByName('Activity').clear;
                  end
                except
                  begin
                    ParamByName('Job_Bag').clear;
                    ParamByName('Activity').asstring := cmbJobBag.text;
                  end;
                end;
                ParamByName('Date_Entered').Asdatetime := now;
                ParamByName('Date_Point').Asdatetime := pbdatestr(edtActivityDate.text);
                ParamByName('Process_group').AsInteger := dblkpDepartment.KeyValue;
                ParamByName('Process').AsInteger := dblkpProcess.KeyValue;
                ParamByName('Work_Centre').clear;
                ParamByName('Paper_Size').clear;
                ParamByName('Number_Up').asinteger := 1;
                ParamByName('Custom_Paper_Size').Asstring := '';

                Parambyname('Laser_Format').clear;

                ParamByName('Quantity').asinteger := 0;
                ParamByName('Operator').Asinteger := frmFPMainMenu.iOperator;
                ParamByName('Audit_Workstation').Asstring := frmFPMainMenu.sCompName;
                ParamByName('Labour_Time_From').clear;
                ParamByName('Labour_Time_to').clear;

                {normal hours}
                try
                  ParamByName('Labour_Hours').Asfloat := StrToFloatDef(sgManDetails.cells[2,irow], 0, FormatSettings);
                except
                  ParamByName('Labour_Hours').Asfloat := 0;
                end;

                {overtime hours}
                try
                  ParamByName('Labour_Overtime_Hours').Asfloat := StrToFloatDef(sgManDetails.cells[3,irow], 0, FormatSettings);
                except
                  ParamByName('Labour_Overtime_Hours').Asfloat := 0;
                end;

                ParamByName('Machine_Hours').Asfloat := 0;
                ParamByName('Team_Count').AsInteger := 0;
                ParamByName('Work_Centre_Operator').AsInteger := iWCOperator;
                ParamByName('Operation').AsInteger := strtoint(sgManDetails.cells[0,irow]);
                ParamByName('Work_Centre_Assistant').Asstring := 'N';
                ParamByName('Master_Job_Time_Log').Asinteger := iMasterCode;
                if iCustomer = 0 then
                  ParamByName('Customer').clear
                else
                  ParamByName('Customer').Asinteger := iCustomer;

                {Get the operators hourly rate}
                rHourlyRate := dtmdlJobBagLog.GetOperatorHourlyRate(iWCOperator);
                if rHourlyRate <> 0 then
                  Parambyname('Hourly_Rate').asfloat := rHourlyRate
                else
                  Parambyname('Hourly_Rate').asfloat := dtmdlJobBagLog.GetDeptHourlyRate(dblkpDepartment.KeyValue);
                Parambyname('Machine_Hourly_Rate').asfloat := 0.00;
                Parambyname('Click_Charge').asfloat := 0.00;
                ExecSQL;
              end;
              icount := icount + 1;
            end;
          end;
        ClearNonWorkCentreDetails;
      end;
    ClearJobBagDetails;
    ShowTimeEnteredToDate;
    bSaved := true;
    if bUseWorkCentre then
      edtEmployeeNo.setfocus
    else
      if PromptforOperator = 'Y' then
        begin
          ClearWorkCentreDetails;
          edtEmployeeNo.setfocus;
        end
      else
        cmbjobbag.setfocus;
  end;
  if sFuncMode = 'C' then
  begin
    {Update an existing code}
    with dtmdlJobBagLog.UpdSQL do
    begin
      Close;
      ParamByName('Job_Bag_Time_Log').AsInteger := iCode;
      try
        begin
          ParamByName('Job_Bag').AsInteger := strtoint(cmbJobBag.text);
          ParamByName('Activity').clear;
        end
      except
        begin
          ParamByName('Job_Bag').clear;
          ParamByName('Activity').asstring := cmbJobBag.text;
        end;
      end;
      ParamByName('Date_Entered').Asdatetime := dtEntered;
      ParamByName('Date_Point').Asdatetime := pbdatestr(edtActivityDate.text);
      ParamByName('Process_group').AsInteger := dblkpDepartment.KeyValue;
      ParamByName('Process').AsInteger := dblkpProcess.KeyValue;
      if dblkpWorkCentre.text = '' then
        ParamByName('Work_Centre').clear
      else
        ParamByName('Work_Centre').AsInteger := dblkpWorkCentre.KeyValue;

      if dblkpProcessPaper.text = '' then
        ParamByName('Paper_Size').clear
      else
        ParamByName('Paper_Size').Asinteger := dblkpProcessPaper.keyvalue;

      ParamByName('Number_Up').AsInteger := spnNumberUp.Value;
      ParamByName('Custom_Paper_Size').Asstring := '';

      case cmbFormat.ItemIndex of
        0:  Parambyname('Laser_Format').asstring := 'S';
        1:  Parambyname('Laser_Format').asstring := 'D'
      else
        Parambyname('Laser_Format').clear;
      end;

      try
        ParamByName('Quantity').AsFloat := StrToFloatDef(edtQuantity.Text, 0, FormatSettings);
      except
        ParamByName('Quantity').AsFloat := 0;
      end;

      ParamByName('Operator').Asinteger := iOperator;
      ParamByName('Audit_Workstation').Asstring := frmFPMainMenu.sCompName;

      if self.bUseWorkCentre then
        begin
          ParamByName('Operation').Asinteger := dblkpOperation.keyvalue;
          ParamByName('Work_Centre_Operator').Asinteger := iWCOperator;

          ParamByName('Labour_Time_From').asdatetime := StartDate;
          ParamByName('Labour_Time_to').asdatetime := FinishDate;

          if self.bWCAssistant then
            begin
              ParamByName('Labour_Hours').Asfloat := StrToFloatDef(edtLabourHrs.text, 0, FormatSettings);
            end
          else
            begin
              try
                ParamByName('Labour_Hours').Asfloat := hourspan(StartDate, FinishDate);
              except
                ParamByName('Labour_Hours').Asfloat := 0;
              end;
            end;

          try
            ParamByName('Machine_Hours').Asfloat := StrToFloatDef(edtMachineHrs.text, 0, FormatSettings);
          except
            ParamByName('Machine_Hours').Asfloat := 0;
          end;

          ParamByName('Labour_Overtime_Hours').Asfloat := 0;
        end
      else
        begin
          ParamByName('Operation').Asinteger := dblkpManOperation.keyvalue;
          ParamByName('Work_Centre_Operator').Asinteger := iWCOperator;

          ParamByName('Labour_Time_From').clear;
          ParamByName('Labour_Time_to').clear;

          try
            ParamByName('Labour_Hours').Asfloat := StrToFloatDef(cmbLabourHours.text, 0, FormatSettings);
          except
            ParamByName('Labour_Hours').Asfloat := 0;
          end;

          ParamByName('Machine_Hours').Asfloat := 0;

          try
            ParamByName('Labour_Overtime_Hours').Asfloat := StrToFloatDef(cmbOvertimeHours.text, 0, FormatSettings);
          except
            ParamByName('Labour_Overtime_Hours').Asfloat := 0;
          end;
        end;

      if bWCAssistant then
        ParamByName('Work_Centre_Assistant').Asstring := 'Y'
      else
        ParamByName('Work_Centre_Assistant').Asstring := 'N';
      ParamByName('Master_Job_Time_Log').Asinteger := self.iMasterJobLog;
      if iCustomer = 0 then
        ParamByName('Customer').clear
      else
        ParamByName('Customer').Asinteger := iCustomer;
      Parambyname('Hourly_Rate').asfloat := rHourlyRate;

      {get the work centre rates}
      try
        bSuccess := dtmdlJobBagLog.GetWorkCentreRates(dblkpWorkCentre.KeyValue, rMachineRate, rClickRate);
      except
        bSuccess := false;
      end;
      
      if not bSuccess then
        begin
          Parambyname('Machine_Hourly_Rate').asfloat := 0.00;
          Parambyname('Click_Charge').asfloat := 0.00;
        end
      else
        begin
          Parambyname('Machine_Hourly_Rate').asfloat := rMachineRate;
          Parambyname('Click_Charge').asfloat := rClickrate;
        end;
      ExecSQL;
    end;
    modalResult := mrok;
  end;
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with dtmdlJobBagLog.qryDelJobBagLog do
      begin
        Close;
        ParamByName('Job_Bag_Time_Log').AsInteger := iCode;
        ExecSQL;
      end;
    end;
    modalResult := mrok;
  end;
end;

function TSFMaintJobLogFrm.GetNextKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with dtmdlJobBagLog.AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with dtmdlJobBagLog.GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Job_Bag_Time_log').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TSFMaintJobLogFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with dtmdlJobBagLog.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Job_Bag_Time_log (Job_bag_Time_log, Custom_Paper_Size) VALUES (0,'' '') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TSFMaintJobLogFrm.DeleteZero;
begin
  with dtmdlJobBagLog.qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Job_Bag_Time_Log Where Job_Bag_Time_Log = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TSFMaintJobLogFrm.edtLabourHrsKeyPress(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TSFMaintJobLogFrm.btnActivityDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtActivitydate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      if DateSelV5Form.Date > date then
        begin
          messagedlg('You cannot enter a future date', mterror, [mbOK], 0);
          edtActivityDate.SetFocus;
          exit;
        end
      else
        edtActivitydate.Text := DateToStr(DateSelV5Form.Date);

      if not self.bUseWorkCentre then
        begin
          try
            strtoint(cmbJobBag.text);
            CheckJobTimeLog;
          except
            CheckNonJobTimeLog;
          end;
        end;

      edtStartDate.Text := DateToStr(DateSelV5Form.Date);
      if trim(edtFinishTime.text) = ':' then
        edtFinishDate.Text := DateToStr(DateSelV5Form.Date);
      {Go display how much time has been entered for this day and employee}
      ShowTimeEnteredToDate;
  finally
    DateSelV5Form.Free;
  end;

  enableok(self);
end;

procedure TSFMaintJobLogFrm.ShowTimeEnteredtoDate;
begin
  if (self.sFuncMode = 'C') or (self.sFuncMode = 'D') then
    exit;
  if (trim(edtActivityDate.text) = '') or (trim(edtEmployeeNo.Text) = '') then
    exit;

  with dtmdlJobBagLog.qryGetEmployeeTime do
    begin
      close;
      parambyname('Date_Point').asdatetime := pbDateStr(trim(edtActivityDate.text));
      parambyname('Work_Centre_Operator').asinteger := iWCOperator;
      open;
      if recordcount > 0 then
        stsbrDetails.Panels[0].Text := 'Daily time entered to-date: Standard hours: ' + formatfloat('##0.00',fieldbyname('Total_labour').asfloat) + ' Overtime: ' + formatfloat('##0.00',fieldbyname('Total_Overtime').asfloat)
      else
        stsbrDetails.Panels[0].Text := ''
    end;
end;

procedure TSFMaintJobLogFrm.edtActivityDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtActivityDate.Text = '' then
    exit;

  try
    NewDate := StrToDate(edtActivityDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtActivityDate.SetFocus;
      Exit;
    end;
  end;

  if pbdatestr(edtActivityDate.text) > date then
    begin
      messagedlg('You cannot enter a future date', mterror, [mbOK], 0);
      edtActivityDate.SetFocus;
      Exit;
    end;

  edtActivityDate.Text := PBDatestr(NewDate);
  edtStartDate.Text := PBDatestr(NewDate);
  if trim(edtFinishTime.text) = ':' then
    edtFinishDate.Text := DateToStr(NewDate);

  if not self.bUseWorkCentre then
    begin
      try
        strtoint(cmbJobBag.text);
        CheckJobTimeLog;
      except
        CheckNonJobTimeLog;
      end;
    end;
  ShowTimeEnteredtoDate;
end;

procedure TSFMaintJobLogFrm.ShowWCOperators;
var
  irow: integer;
begin
  with dtmdlJobBagLog.qryWCOperators do
  begin
    Close;
    sql.clear;
    sql.text := dtmdlJobBagLog.qryWCOperatorsBase.sql.text;
    sql.add('AND Work_Centre_Operator.Work_Centre_Operator NOT IN ');
//    sql.add('(0');
    try
      sql.add('(' + inttostr(iWCOperator));
    except
      sql.add('(0');
    end;

    for irow := 0 to pred(lstbxWCAssistantsCode.count) do
      begin
        if trim(lstbxWCAssistantsCode.items[irow]) = '' then
          break;
        sql.add(', ' + lstbxWCAssistantsCode.items[irow]);
      end;
    sql.add(')');
    sql.Add(' ORDER BY Work_Centre_Operator.Name');

    if chkbxViewAll.checked then
      Parambyname('Process_Group').asinteger := 0
    else
      begin
        if dblkpDepartment.text = '' then
          ParamByName('Process_Group').Asinteger := 0
        else
          ParamByName('Process_Group').Asinteger := dblkpDepartment.KeyValue;
      end;
    ParamByName('Code_From').AsString := '%' + edtSearch.Text + '%';
    Open;
  end;
end;


procedure TSFMaintJobLogFrm.edtSearchChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSFMaintJobLogFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  ShowWCOperators;
end;

procedure TSFMaintJobLogFrm.dblkpWCOperatorsDblClick(Sender: TObject);
var
  irow: integer;
begin
  if dblkpWCOperators.ListSource.DataSet.fieldbyname('Name').asstring = '' then
    exit;

  lstbxWCAssistants.Items.Add(dblkpWCOperators.ListSource.DataSet.fieldbyname('Name').asstring);
  lstbxWCAssistantsCode.Items.Add(dblkpWCOperators.ListSource.DataSet.fieldbyname('Work_Centre_Operator').asstring);

  ShowWCOperators;
end;

procedure TSFMaintJobLogFrm.sgManDetailsDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if vRow <> 0 then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
    end;
  end;

  {If Heading Display Left justified in the cells}
  with sgManDetails do
  begin
    if vCol < 2 then
    begin
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;
end;

procedure TSFMaintJobLogFrm.sgManDetailsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
//	if (Col = 2) or (Col = 3) then
//    sgManDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
//  else
    sgManDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing];
end;

procedure TSFMaintJobLogFrm.sgWCDetailsKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
  enableok(self);
end;

procedure TSFMaintJobLogFrm.edtEmployeeNoExit(Sender: TObject);
begin
  if btnLUEmployee.focused or btnCancel.focused then exit;

  if trim(edtEmployeeno.Text) = '' then
    exit;

  try
    with dtmdlJobBagLog.qryGetEmployee do
    begin
      close;
      parambyname('Employee_number').asstring := edtEmployeeNo.text;
      open;
      if recordcount = 0 then
        begin
          messagedlg('This employee number doesn''t exist', mtError, [mbOk], 0);
          edtEmployeeNo.SetFocus;
          exit;
        end
      else
        begin
          edtEmployeeName.Text := fieldbyname('Name').asstring;
          iWCOperator := fieldbyname('Work_Centre_Operator').asinteger;
          dblkpDepartment.KeyValue := fieldbyname('Process_Group').asinteger;
          dblkpDepartmentclick(self);
          dblkpProcess.KeyValue := fieldbyname('Process').asinteger;
          dblkpProcessclick(self);
        end;
    end;
  except
  end;

  if not self.bUseWorkCentre then
    begin
      try
        strtoint(cmbJobBag.text);
        CheckJobTimeLog;
      except
        CheckNonJobTimeLog;
      end;
    end;
  ShowTimeEnteredtoDate;
end;

procedure TSFMaintJobLogFrm.btnLUEmployeeClick(Sender: TObject);
begin
  SFLUWCOperatorFrm := TSFLUWCOperatorFrm.create(self);
  try
    SFLUWCOperatorFrm.selcode := iWCOperator;
    SFLUWCOperatorFrm.bIs_Lookup := true;
    SFLUWCOperatorFrm.showmodal;
    if SFLUWCOperatorFrm.Selected then
      begin
        iWCOperator := SFLUWCOperatorFrm.selcode;
        edtEmployeeName.Text := SFLUWCOperatorFrm.SelName;
        edtEmployeeNo.Text := SFLUWCOperatorFrm.SelEmpNo;
        dblkpDepartment.KeyValue := SFLUWCOperatorFrm.SelProcessGroup;
        dblkpDepartmentclick(self);
        dblkpProcess.KeyValue := SFLUWCOperatorFrm.SelProcess;
        dblkpProcessclick(self);

        if not self.bUseWorkCentre then
          begin
            try
              strtoint(cmbJobBag.text);
              CheckJobTimeLog;
            except
              CheckNonJobTimeLog;
            end;
          end;
        ShowTimeEnteredtoDate;
      end
    else
      edtemployeeNo.SetFocus;
  finally
    SFLUWCOperatorFrm.free;
  end;
end;

procedure TSFMaintJobLogFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmFPMainMenu.AppIniFile, self);

end;

procedure TSFMaintJobLogFrm.chkbxViewAllClick(Sender: TObject);
begin
  ShowWCOperators;
end;

procedure TSFMaintJobLogFrm.ClearJobBagDetails;
begin
  bRequiresCustomer := false;
  cmbJobBag.text := '';
  edtCustomer.text := '';
  edtCustomer.Color := clBtnFace;
  edtJobTitle.text := '';
  btnLUCustomer.Visible := false;
  enableOK(self);
end;

procedure TSFMaintJobLogFrm.ClearWorkCentreDetails;
var
  irow, icol: integer;
begin
  edtEmployeeNo.Text := '';
  edtEmployeeName.Text := '';
  dblkpDepartment.KeyValue := 0;
  dblkpProcess.KeyValue := 0;
  dblkpWorkCentre.keyvalue := 0;
  dblkpOperation.keyvalue := 0;
  dblkpProcessPaper.keyvalue := 0;
  edtQuantity.text := '';
  cmbFormat.text := '';
  cmbFormat.itemindex := -1;
  edtStartDate.text := edtActivityDate.text;
  edtStartTime.text := ':';
  edtFinishDate.text := edtStartDate.text;
  edtFinishTime.text := ':';
  edtLabourHrs.text := '0';
  edtMachineHrs.text := '0';
  spnNumberUp.Value := 1;

  lstbxWCAssistants.Clear;
  lstbxWCAssistantsCode.Clear;
end;

procedure TSFMaintJobLogFrm.ClearNonWorkCentreDetails;
var
  irow, icol: integer;
begin
  with sgManDetails do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          for icol := 2 to 3 do
            begin
              cells[icol,irow] := ''
            end;
        end;
      col := 2;
      row := 1;
    end;
  LoadProcessOperations;
end;

procedure TSFMaintJobLogFrm.edtFinishTimeExit(Sender: TObject);
var
  startdate, finishdate: TDateTime;
begin
(*
  if trim(edtStartTime.text) <> ':' then
  begin
    try
      startDate := pbdatestr(edtActivityDate.text) + strtotime(edtStartTime.text);
    except
      begin
        messagedlg('The Start time is an invalid time', mtError, [mbOk], 0);
        edtStartTime.SetFocus;
        exit;
      end;
    end;
  end
  else
    exit;

  if trim(edtFinishTime.text) <> ':' then
  begin
    try
      finishDate := pbdatestr(edtActivityDate.text) + strtotime(edtFinishTime.text);
    except
      begin
        messagedlg('The Finish time is an invalid time', mtError, [mbOk], 0);
        edtFinishTime.SetFocus;
        exit;
      end;
    end;
  end
  else
    exit;

(*  if startDate > finishDate then
    begin
      messagedlg('The Start and Finish times are invalid', mtError, [mbOk], 0);
      edtStartTime.SetFocus;
      exit;
    end;
*)

  if trim(edtStartTime.text) <> ':' then
  begin
    try
      startDate := pbdatestr(edtStartDate.text) + strtotime(edtStartTime.text);
    except
      begin
        messagedlg('The Start time is an invalid time', mtError, [mbOk], 0);
        edtStartTime.SetFocus;
        exit;
      end;
    end;
  end
  else
    exit;

  if trim(edtFinishTime.text) <> ':' then
  begin
    try
      finishDate := pbdatestr(edtFinishDate.text) + strtotime(edtFinishTime.text);
    except
      begin
        messagedlg('The Finish time is an invalid time', mtError, [mbOk], 0);
        edtFinishTime.SetFocus;
        exit;
      end;
    end;
  end
  else
    exit;

  if startDate > finishDate then
    begin
      edtLabourHrs.text := formatfloat('0.00',(hourspan(StartDate, FinishDate)*-1))
    end
  else
    begin
      edtLabourHrs.text := formatfloat('0.00',hourspan(StartDate, FinishDate))
    end;
end;

function TSFMaintJobLogFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TSFMaintJobLogFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t;
end;

procedure TSFMaintJobLogFrm.cmbManTimeClick(Sender: TObject);
begin
  with sgManDetails do
  begin
    cells[2,row] := cmbManTime.text;
  end;

end;

procedure TSFMaintJobLogFrm.cmbManTimeEnter(Sender: TObject);
begin
  with cmbManTime do
    begin
      itemindex := Items.indexof(sgManDetails.Cells[2, sgManDetails.row]);
    end;
end;

procedure TSFMaintJobLogFrm.cmbManTimeExit(Sender: TObject);
begin
  cmbManTime.Visible := false;
end;

procedure TSFMaintJobLogFrm.cmbManTimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is Tcombobox) then
    begin
      with sgManDetails do
      begin
        if sgManDetails.Enabled then
          sgManDetails.SetFocus;
        if sgManDetails.row = sgManDetails.rowcount - 1 then
          begin
            sgManDetails.row := 1;
            sgManDetails.col := 2;
          end
        else
          sgManDetails.row := sgManDetails.row + 1;
        exit;
      end;
    end;
end;

procedure TSFMaintJobLogFrm.sgManDetailsClick(Sender: TObject);
begin
  with sgManDetails do
  begin
    cmbManTime.sendtoback;
    cmbManTime.Visible := False;
    cmbManOverTime.sendtoback;
    cmbManOverTime.Visible := False;
    if (col = 2) then
    begin
      cmbManTime.Top := celltop(sgManDetails, Row);
      cmbManTime.Left := cellleft(sgManDetails, 2);
      cmbManTime.width := colwidths[2];

//      if cells[col,row] <> '' then
//        cmbManTime.text := cells[2,row];
      cmbManTime.bringtofront;
      cmbManTime.Visible := True;
      If cmbManTime.Enabled then
        cmbManTime.SetFocus;
    end
    else
    if (col = 3) then
    begin
      cmbManOverTime.Top := celltop(sgManDetails, Row);
      cmbManOverTime.Left := cellleft(sgManDetails, 3);
      cmbManOverTime.width := colwidths[3];

      if cells[col,row] <> '' then
        cmbManTime.text := cells[3,row];
      cmbManOverTime.bringtofront;
      cmbManOverTime.Visible := True;
      If cmbManOverTime.Enabled then
        cmbManOverTime.SetFocus;
    end;
  end;


end;

procedure TSFMaintJobLogFrm.cmbManOvertimeEnter(Sender: TObject);
begin
  with cmbManOverTime do
    begin
      itemindex := Items.indexof(sgManDetails.Cells[3, sgManDetails.row]);
      text := sgManDetails.Cells[3, sgManDetails.row];
    end;

end;

procedure TSFMaintJobLogFrm.cmbManOvertimeExit(Sender: TObject);
var
  iIndex: integer;
begin
  with (sender as TComboBox) do
    begin
      if text <> '' then
        begin
          iIndex := items.IndexOf(text);
          if iIndex = -1 then
            begin
              bValueOK := false;
              sgManDetails.col := 3;
              visible := true;
              setfocus;
              exit;
            end;
        end;
      Visible := false;
      Text := '';
      itemindex := -1
    end;
end;

procedure TSFMaintJobLogFrm.cmbManOvertimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  bValueOK := true;
  if Key = #13 then { if it's an enter key }
    begin
      if (ActiveControl is Tcombobox) then
        begin
          with sgManDetails do
            begin
              if sgManDetails.Enabled then
                sgManDetails.SetFocus;
              if not bValueOK then
                exit;
              if sgManDetails.row = sgManDetails.rowcount - 1 then
                begin
                  if btnOK.Enabled then
                    btnOK.setfocus
                  else
                    begin
                      sgManDetails.row := 1;
                      sgManDetails.col := 2;
                    end
                end
              else
                begin
                  sgManDetails.row := sgManDetails.row + 1;
                  sgManDetails.col := 2;
                end;
            end;
        end;
    end
  else
    begin
      case Key of
        '0'..'9': ;
        '.':;
        #8: {backspace}
          ;
      else
        Key := #0;
      end;
    end


end;

procedure TSFMaintJobLogFrm.cmbManKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      if (ActiveControl is Tcombobox) then
      begin
        with sgManDetails do
          begin
            if sgManDetails.Enabled then
              sgManDetails.SetFocus;
            sgManDetails.col := 3;
          end;
      end;
    end
  else
    begin
      case Key of
        '0'..'9': ;
        '.':;
        #8: {backspace}
          ;
      else
        Key := #0;
      end;
    end
end;

procedure TSFMaintJobLogFrm.cmbManEnter(Sender: TObject);
begin
  with cmbManTime do
    begin
      itemindex := Items.indexof(sgManDetails.Cells[2, sgManDetails.row]);
      text := sgManDetails.Cells[2, sgManDetails.row];
    end;
end;

procedure TSFMaintJobLogFrm.cmbManExit(Sender: TObject);
var
  iIndex: integer;
begin
  with (sender as TComboBox) do
    begin
      if text <> '' then
        begin
          iIndex := items.IndexOf(text);
          if iIndex = -1 then
            begin
              Visible := true;
              setfocus;
              sgManDetails.col := 2;
              exit;
            end;
        end;
      Visible := false;
      Text := '';
      itemindex := -1
    end;
end;

procedure TSFMaintJobLogFrm.cmbManTimeChange(Sender: TObject);
begin
  with sgManDetails do
  begin
    cells[2,row] := cmbManTime.text;
  end;
  bSaved := false;
end;

procedure TSFMaintJobLogFrm.cmbManOvertimeChange(Sender: TObject);
begin
  with sgManDetails do
  begin
    cells[3,row] := cmbManOverTime.text;
  end;
  bSaved := false;
end;

procedure TSFMaintJobLogFrm.cmbJobBagKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      Key := #0; { eat enter key }
      Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
    end;
end;

procedure TSFMaintJobLogFrm.cmbJobBagChange(Sender: TObject);
begin
  if trim(cmbJobBag.Text) = '' then
    exit;

  try
    strtoint(cmbJobBag.text);
    edtCustomer.color := clBtnFace;
    edtJobTitle.color := clBtnFace;
    edtJobTitle.ReadOnly := true;
    btnLUCustomer.Visible := false;
  except
    begin
      with dtmdlJobBagLog.qryGetActivity do
        begin
          close;
          parambyname('Process_Group').asinteger := dblkpDepartment.keyvalue;
          parambyname('Activity').asstring := trim(cmbJobBag.text);
          open;
          if fieldbyname('Requires_Customer').asstring = 'Y' then
            begin
              edtCustomer.color := clWindow;
              btnLUCustomer.Visible := true;
              bRequiresCustomer := true;
            end
          else
            begin
              edtCustomer.color := clBtnFace;
              btnLUCustomer.Visible := false;
              bRequiresCustomer := true;
            end;
          edtCustomer.Text := '';
          iCustomer := 0;
        end;
      iCustomer := 0;
      sNonJobBag := cmbJobBag.text;
    end;
  end;
  enableok(self);
end;

procedure TSFMaintJobLogFrm.cmbJobBagExit(Sender: TObject);
var
  iItemIndex: integer;
begin
  if (trim(cmbJobBag.text) = '') or (btnCancel.Focused) then
    exit;

  try
    with dtmdlJobBagLog.qryGetJobBag do
    begin
      close;
      parambyname('Job_bag').asinteger := strtoint(cmbJobBag.text);
      open;
      if recordcount = 0 then
        begin
          messagedlg('Job number doesn''t exist', mtError, [mbOk], 0);
          cmbJobBag.SetFocus;
          exit;
        end
      else
        begin
          edtCustomer.Text := fieldbyname('Customer_Name').asstring;
          edtJobTitle.Text := fieldbyname('Job_bag_Descr').asstring;
          iCustomer := fieldbyname('Customer').asinteger;

          if (sFuncMode = 'A') or (sFuncMode = 'I') then
          begin
            if btnLUCustomer.visible then
              btnLUCustomer.SetFocus
            else
              begin
                if bUseWorkCentre then
                  dblkpWorkCentre.setfocus
                else
                  begin
                    sgManDetails.Col := 2;
                    sgManDetails.Row := 1;
                    sgManDetails.setfocus;
                    sgManDetailsClick(self);
                  end;
              end;
          end;
        end;
    end;
    if not self.bUseWorkCentre and (sFuncMode = 'A') then
      CheckJobTimeLog;
  except
    begin
      iItemIndex := cmbJobBag.items.indexof(cmbJobBag.text);
      if iItemIndex = -1 then
        begin
          cmbJobBag.setfocus;
          exit;
        end;
      with dtmdlJobBagLog.qryGetActivity do
        begin
          close;
          parambyname('Process_Group').asinteger := dblkpDepartment.keyvalue;
          parambyname('Activity').asstring := trim(cmbJobBag.text);
          open;
          if fieldbyname('Requires_Customer').asstring = 'Y' then
            begin
              edtCustomer.color := clWindow;
              btnLUCustomer.Visible := true;
              bRequiresCustomer := true;
            end
          else
            begin
              edtCustomer.color := clBtnFace;
              btnLUCustomer.Visible := false;
              bRequiresCustomer := false;
            end;
          edtCustomer.Text := '';
          iCustomer := 0;
        end;
      sNonJobBag := cmbJobBag.text;
      if not self.bUseWorkCentre and (sFuncMode = 'A') then
        CheckNonJobTimeLog;
    end;
  end;
  enableok(self);
end;

procedure TSFMaintJobLogFrm.pnlHeaderEnter(Sender: TObject);
begin
  if (not bSaved) and (trim(cmbJobBag.Text) <> '') and (not btnLUCustomer.focused) then
    begin
      if messagedlg('The details you are entering have not been saved, do you want to save the current details', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          btnOKClick(self);
        end
      else
        begin
          (sender as TPanel).setfocus;
        end;
    end;
end;

procedure TSFMaintJobLogFrm.cmbLabourHoursExit(Sender: TObject);
var
  iIndex: integer;
begin
  with (sender as TComboBox) do
    begin
      if text <> '' then
        begin
          iIndex := items.IndexOf(text);
          if iIndex = -1 then
            begin
              setfocus;
              exit;
            end;
        end;
    end;
end;

procedure TSFMaintJobLogFrm.cmbLabourHoursKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      Key := #0; { eat enter key }
      Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
    end
  else
    begin
      case Key of
        '0'..'9': ;
        '.':;
        #8: {backspace};
      else
        Key := #0;
    end;
  end;
end;

procedure TSFMaintJobLogFrm.btnLUCustomerClick(Sender: TObject);
begin
  SFLUCustfrm := TSFLUCustFrm.create(self);

  try
    SFLUCustFrm.bIs_Lookup := true;
    SFLUCustFrm.showmodal;
    if SFLUCustFrm.Selected then
      begin
        iCustomer := SFLUCustFrm.SelCode;
        edtCustomer.Text := SFLUCustFrm.SelName;
        enableok(self);
        bSaved := false;
      end;
  finally
    SFLUCustFrm.free;
  end;
end;

procedure TSFMaintJobLogFrm.edtFinishDateExit(Sender: TObject);
var
  NewDate, StartDate, FinishDate: TDateTime;
begin
  {Validate the date entered}
  If edtFinishDate.Text = '' then
    exit;

  try
    NewDate := StrToDate(edtFinishDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtFinishDate.SetFocus;
      Exit;
    end;
  end;

  (sender as TEdit).Text := PBDatestr(NewDate);

  {Now validate that the times and date entered are OK}
  if trim(edtStartTime.text) <> ':' then
  begin
    try
      startDate := pbdatestr(edtStartDate.text) + strtotime(edtStartTime.text);
    except
      begin
        messagedlg('The Start time is an invalid time', mtError, [mbOk], 0);
        edtStartTime.SetFocus;
        exit;
      end;
    end;
  end
  else
    exit;

  if trim(edtFinishTime.text) <> ':' then
  begin
    try
      finishDate := pbdatestr(edtFinishDate.text) + strtotime(edtFinishTime.text);
    except
      begin
        messagedlg('The Finish time is an invalid time', mtError, [mbOk], 0);
        edtFinishTime.SetFocus;
        exit;
      end;
    end;
  end
  else
    exit;

  if startDate > finishDate then
    begin
      edtLabourHrs.text := formatfloat('0.00',(hourspan(StartDate, FinishDate)*-1))
    end
  else
    begin
      edtLabourHrs.text := formatfloat('0.00',hourspan(StartDate, FinishDate))
    end;
end;

procedure TSFMaintJobLogFrm.cmbFormatKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      Key := #0; { eat enter key }
      Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
    end;
end;

procedure TSFMaintJobLogFrm.lstbxWCAssistantsDblClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxWCAssistants.items.count) downto 0 do
    begin
      if lstbxWCAssistants.Selected[i] then
        begin
          lstbxWCAssistants.Items.Delete(i);
          lstbxWCAssistantsCode.Items.Delete(i);
        end;
    end;
  ShowWCOperators;
end;

end.
