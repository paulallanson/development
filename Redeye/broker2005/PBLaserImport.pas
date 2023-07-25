unit PBLaserImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, DateUtils,
  Spin;

type
  TPBLaserImportFrm = class(TForm)
    opndlgImportFile: TOpenDialog;
    mmErrorRecords: TMemo;
    pnlImportFile: TPanel;
    lblStep2: TLabel;
    edtImportFileName: TEdit;
    btnFindFile: TButton;
    pnlProgress: TPanel;
    Label1: TLabel;
    lblProgress: TLabel;
    lblRecordCount: TLabel;
    prgrsbrImport: TProgressBar;
    pnlImport: TPanel;
    lblStep4: TLabel;
    ImportBtn: TButton;
    pnlCancel: TPanel;
    Cancel2BitBtn: TBitBtn;
    lblReadingFile: TLabel;
    pnlDepartment: TPanel;
    lblStep1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblkpDepartment: TDBLookupComboBox;
    dblkpProcess: TDBLookupComboBox;
    Label5: TLabel;
    dblkpOperation: TDBLookupComboBox;
    Label2: TLabel;
    dblkpOperator: TDBLookupComboBox;
    Label6: TLabel;
    spnPerc: TSpinEdit;
    Label7: TLabel;
    procedure btnFindFileClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpDepartmentClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpProcessClick(Sender: TObject);
    procedure dblkpOperationClick(Sender: TObject);
  private
    procedure UpdateError(LineNo: integer; LaserLine: String; var theErrorFile: TextFile);
    procedure InsertError(LineNo: Integer; LaserLine: String; var theErrorFile: TextFile);
    function CountTextFileLines(var theTextFile: TextFile): integer;
    procedure ParseError(LineNo: Integer; LaserLine: String;
                         var theErrorFile: TextFile);
    function ParseLaserFile(LaserLine: string; var Job_ID, Quantity,
      Control_no: integer; var Date_Published, Printer_Type, Client, Job,
      Mailing, Status, Printer_Name: string;
      var No_of_Hours: Double): boolean;
    function GetNextKey: integer;
    function InsertJobLog(var Control_no, Quantity: integer;
                                        var Date_Published, Client, Job, Mailing, Printer_Name: string;
                                        var No_Of_hours: double): boolean;
    procedure AddZero;
    procedure DeleteZero;
  public
    { Public declarations }
  end;

var
  PBLaserImportFrm: TPBLaserImportFrm;

implementation

{$R *.DFM}

uses CCSCommon, SFJobBagLogDM, ComObj, ActiveX, pbMainMenu;

type
  TImportFieldDef = record
    FieldNo : integer;
    ColumnNo : integer;
    ColumnLength : integer;
  end;

procedure TPBLaserImportFrm.btnFindFileClick(Sender: TObject);
begin
  opndlgImportFile.Files.Clear;
  edtImportFileName.Text := '';
  if opndlgImportFile.Execute then
  begin
    if opndlgImportFile.Files.Count > 0 then
    begin
      edtImportFileName.Text := opndlgImportFile.Files[opndlgImportFile.Files.Count - 1];
      ImportBtn.Enabled := True;
    end;
  end;

  if (edtImportFileName.Text <> '') then
  begin
    //enable the import button
    pnlImport.Enabled := True;
    lblStep4.Font.Style := [fsBold];
    lblStep2.Font.Style := [];
  end;
end;

procedure TPBLaserImportFrm.ImportBtnClick(Sender: TObject);
var
  tmpDir: string;
  LaserTextFile : TextFile;
  ErrorRecordFile : TextFile;
  DateFrom, DateTo: TDateTime;
  LaserLine, Date_Published, Printer_Type, Printer_Name: String;
  Client, Job, Mailing, Status : String;
  Quantity, Job_ID, Control_No : integer;
  No_of_hours : Double;
  Result : boolean;
  LineCount, LineNo, ErrorCount : integer;
  UpdateRecordCount, InsertRecordCount, DiscontRecordCount : integer;
  inx, iLength, iStart: integer;
begin
// Initialize counters and variables
  Result := False;
  LineNo := 0;
  ErrorCount := 0;
  UpdateRecordCount := 0;
  InsertRecordCount := 0;
  DiscontRecordCount := 0;

  if (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.txt')
     or (Copy(edtImportFileName.Text, (Length(edtImportFileName.Text)-3), (Length(edtImportFileName.Text)-1)) = '.TXT') then
  begin
//prepare files for input/output
    tmpDir := edtImportFileName.Text;
    iLength := length(tmpDir);

    while pos('\',tmpDir) > 0 do
      begin
        istart := pos('\',tmpDir);
        tmpDir[iStart] := '*';
      end;
    tmpDir :=  copy(edtImportFileName.Text,1,(iLength-(ilength-iStart)));

    AssignFile(LaserTextFile, edtImportFileName.Text);
    Reset(LaserTextFile);
    AssignFile(ErrorRecordFile, tmpDir+'ErrorFile.txt');
    ReWrite(ErrorRecordFile);
    LineCount := CountTextFileLines(LaserTextFile);
    Reset(LaserTextFile);

//set count label values/visibility
    pnlProgress.height := 57;
    mmErrorRecords.height := 153;
    lblRecordCount.Caption := 'records read.';
    lblRecordCount.Visible := True;
    lblProgress.Visible := True;
    prgrsbrImport.Max := LineCount;
    mmErrorRecords.Lines.Clear;

    While Not EOF(LaserTextFile) do
    begin
//Read Line from laser Text File
      ReadLn(LaserTextFile, LaserLine);

      if LineNo = 0 then
        begin
//Discard the first record which contains the header info
          LineNo := LineNo + 1;
          continue;
        end
      else
        LineNo := LineNo + 1;

      lblProgress.Caption := IntToStr(LineNo);
      prgrsbrImport.Position := LineNo;
      pnlProgress.Repaint;

      Result := ParseLaserFile(LaserLine, Job_ID, Quantity, Control_no, Date_Published,
                        Printer_Type, Client, Job, Mailing, Status, Printer_Name, No_of_Hours);

      if Result = False then
      begin
        ParseError(LineNo, LaserLine, ErrorRecordFile);
        ErrorCount := ErrorCount + 1;
        continue;
      end;

//insert Machine record
      Result := InsertJobLog(Control_no, Quantity, Date_Published, Client, Job, Mailing, Printer_Name, No_Of_hours);

      if Result = False then
        begin
          InsertError(LineNo, LaserLine, ErrorRecordFile);
          ErrorCount := ErrorCount + 1;
          continue;
        end
      else
        begin
          InsertRecordCount := InsertRecordCount + 1;
        end;
    end; //end while not EOF

//display error/insert/update counters
    mmErrorRecords.Lines.Add(IntToStr(ErrorCount)+': Errors Encountered');
    if ErrorCount > 0 then
      mmErrorRecords.Lines.Add('The bad records have been written to '+tmpDir+'ErrorFile.txt');
    mmErrorRecords.Lines.Add(IntToStr(InsertRecordCount)+': Records Inserted.');
//    mmErrorRecords.Lines.Add(IntToStr(UpdateRecordCount)+': Records Updated.');
//    mmErrorRecords.Lines.Add(IntToStr(DiscontRecordCount)+': Records Discarded.');

    //close Text Files
    CloseFile(LaserTextFile);
    CloseFile(ErrorRecordFile);
  end
end;

procedure TPBLaserImportFrm.UpdateError(LineNo: integer;
  LaserLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':UpdateError:'+LaserLine);
  WriteLn(theErrorFile, LaserLine);
end;

procedure TPBLaserImportFrm.InsertError(LineNo: Integer;
  LaserLine: String; var theErrorFile: TextFile);
begin
  mmErrorRecords.Lines.Add(IntToStr(LineNo)+':InsertError:'+LaserLine);
  WriteLn(theErrorFile, LaserLine);
end;

function TPBLaserImportFrm.CountTextFileLines(
  var theTextFile: TextFile): integer;
var
  tempCount : integer;
begin
  tempCount := 0;
  while not EOF(theTextFile) do
  begin
    ReadLn(theTextFile);
    tempCount := tempCount + 1;
  end;
  CountTextFileLines := tempCount;
end;

procedure TPBLaserImportFrm.ParseError(LineNo: Integer;
  LaserLine: String; var theErrorFile: TextFile);
begin
  WriteLn(theErrorFile, LaserLine);
end;

function TPBLaserImportFrm.ParseLaserFile(LaserLine: string;
  var Job_ID, Quantity, Control_no: integer;
  var Date_Published, Printer_Type, Client, Job, Mailing, Status, Printer_Name: string;
  var No_of_Hours: Double): boolean;
var
  TabPos : integer;
  TempStr : String;
  ParseString : String;
  ColIndex : integer;
  LineData : array of String;
begin
// Parse LaserLine into individual data items.
  try
    TempStr := '';
    ParseString := LaserLine;
    ColIndex := 0;

//copy data items from the line to an array
    While (Pos(Chr(vk_Tab), ParseString) > 0) do
    begin
      ColIndex := ColIndex + 1;
      SetLength(LineData, ColIndex+1);
      TabPos := Pos(Chr(vk_Tab), ParseString);
      LineData[ColIndex] := Trim(Copy(ParseString,1,TabPos));
      Delete(ParseString,1,TabPos);
    end;

    ColIndex := ColIndex + 1;
    SetLength(LineData, ColIndex+1);
    LineData[ColIndex] := Trim(ParseString);

    Job_id := strtoint(LineData[1]);
    Date_Published := LineData[2];
    Printer_Type := LineData[3];

    Control_no := StrToInt(LineData[4]);
    Client := LineData[5];
    Job := LineData[6];
    Mailing := LineData[7];

    Quantity := StrToInt(LineData[8]);
    Status := LineData[9];
    No_of_hours := StrTofloat(LineData[10]);
    Printer_Name := LineData[11];

    Result := True;
    LineData := nil;
  except
    Result := False;
    LineData := nil;
  end;
end;

function TPBLaserImportFrm.InsertJobLog(var Control_no, Quantity: integer;
                                        var Date_Published, Client, Job, Mailing, Printer_Name: string;
                                        var No_Of_hours: double): boolean;
var
  iTempNewCode, iJobbag, iCustomer, iWorkCentre: integer;
  sTime: string;
  rHourlyRate, rMachineRate, rClickRate: real;
  bSuccess: boolean;
begin
  iTempNewCode := GetNextKey;

  if dtmdlJobBagLog.CheckJobBagNo(Control_no) then
    begin
      iJobBag := Control_no;
      iCustomer := dtmdlJobBagLog.GetJobBagCustomer(iJobBag);
    end
  else
    begin
      iJobBag := 0;
      iCustomer := 0;
      result := false;
      exit;
    end;

  sTime := copy(trim(Date_Published),9,6);

  try
    // save the machine data record
    with dtmdlJobBagLog.UpdSQL do
    begin
      Close;
      ParamByName('Job_Bag_Time_Log').AsInteger := iTempNewCode;
      try
        begin
          ParamByName('Job_Bag').AsInteger := Control_no;
          ParamByName('Activity').clear;
        end
      except
        begin
          ParamByName('Job_Bag').clear;
          ParamByName('Activity').asstring := '';
        end;
      end;

      ParamByName('Date_Entered').Asdatetime := now;
      ParamByName('Date_Point').Asdatetime := pbdatestr(copy(trim(Date_Published),1,8));
      ParamByName('Process_group').AsInteger := dblkpDepartment.KeyValue;
      ParamByName('Process').AsInteger := dblkpProcess.KeyValue;

      iWorkCentre := dtmdlJobBagLog.GetWorkCentrebyShortName(Printer_Name);
      if iWorkCentre = 0 then
        begin
          result := false;
          exit;
        end
      else
        ParamByName('Work_Centre').AsInteger := iWorkCentre;

      ParamByName('Paper_Size').clear;

      ParamByName('Number_Up').AsInteger := 1;
      ParamByName('Custom_Paper_Size').Asstring := '';

      Parambyname('Laser_Format').clear;

      ParamByName('Quantity').AsFloat := Quantity;
      ParamByName('Operator').Asinteger := frmPBMainMenu.iOperator;
      ParamByName('Audit_Workstation').Asstring := frmPBMainMenu.sCompName;
      ParamByName('Labour_Time_From').asdatetime := pbdatestr(copy(trim(Date_Published),1,8)) + strtotime(copy(trim(Date_Published),9,6));
      ParamByName('Labour_Time_to').asdatetime := pbdatestr(copy(trim(Date_Published),1,8)) + strtotime(copy(trim(Date_Published),9,6)) + ((1/24)*(No_Of_Hours));
      ParambyName('Labour_Overtime_Hours').asfloat := 0;
      ParamByName('Labour_Hours').Asfloat := 0;
      ParamByName('Machine_Hours').Asfloat := No_of_hours;
      ParamByName('Team_Count').AsInteger := 0;
      ParamByName('Work_Centre_Operator').asinteger := dblkpOperator.keyvalue;
      ParamByName('Operation').AsInteger := dblkpOperation.keyvalue;
      ParamByName('Work_Centre_Assistant').Asstring := 'N';
      ParamByName('Master_Job_Time_Log').Asinteger := iTempNewCode;

      if iCustomer = 0 then
        ParamByName('Customer').clear
      else
        ParamByName('Customer').Asinteger := iCustomer;

      rHourlyRate := dtmdlJobBagLog.GetOperatorHourlyRate(dblkpOperator.keyvalue);
      if rHourlyRate <> 0 then
        Parambyname('Hourly_Rate').asfloat := rHourlyRate
      else
        Parambyname('Hourly_Rate').asfloat := dtmdlJobBagLog.GetDeptHourlyRate(dblkpDepartment.KeyValue);

      bSuccess := dtmdlJobBagLog.GetWorkCentreRates(iWorkCentre, rMachineRate, rClickRate);
      if not bSuccess then
        begin
          Parambyname('Machine_Hourly_Rate').asfloat := 0.00;
          Parambyname('Click_Charge').asfloat := 0.00;
        end
      else
        begin
          Parambyname('Machine_Hourly_Rate').asfloat := rMachineRate;
          Parambyname('Click_Charge').asfloat := rClickRate;
        end;

      ExecSQL;
    end;

    //Save the labour record if percentage of machine time entered
    if spnPerc.Value > 0 then
    begin

    iTempNewCode := GetNextKey;

    with dtmdlJobBagLog.UpdSQL do
    begin
      Close;
      ParamByName('Job_Bag_Time_Log').AsInteger := iTempNewCode;
      try
        begin
          ParamByName('Job_Bag').AsInteger := Control_no;
          ParamByName('Activity').clear;
        end
      except
        begin
          ParamByName('Job_Bag').clear;
          ParamByName('Activity').asstring := '';
        end;
      end;

      ParamByName('Date_Entered').Asdatetime := now;
      ParamByName('Date_Point').Asdatetime := pbdatestr(copy(trim(Date_Published),1,8));
      ParamByName('Process_group').AsInteger := dblkpDepartment.KeyValue;
      ParamByName('Process').AsInteger := dblkpProcess.KeyValue;

      iWorkCentre := dtmdlJobBagLog.GetWorkCentrebyShortName(Printer_Name);
      if iWorkCentre = 0 then
        begin
          result := false;
          exit;
        end
      else
        ParamByName('Work_Centre').AsInteger := iWorkCentre;

      ParamByName('Paper_Size').clear;

      ParamByName('Number_Up').AsInteger := 1;
      ParamByName('Custom_Paper_Size').Asstring := '';

      Parambyname('Laser_Format').clear;

      ParamByName('Quantity').AsFloat := Quantity;
      ParamByName('Operator').Asinteger := frmPBMainMenu.iOperator;
      ParamByName('Audit_Workstation').Asstring := frmPBMainMenu.sCompName;
      ParamByName('Labour_Time_From').asdatetime := pbdatestr(copy(trim(Date_Published),1,8)) + strtotime(copy(trim(Date_Published),9,6));
      ParamByName('Labour_Time_to').asdatetime := pbdatestr(copy(trim(Date_Published),1,8)) + strtotime(copy(trim(Date_Published),9,6)) + ((1/24)*(No_Of_Hours));
      ParambyName('Labour_Overtime_Hours').asfloat := 0;
      ParamByName('Labour_Hours').Asfloat := (No_of_hours*(spnPerc.Value/100));
      ParamByName('Machine_Hours').Asfloat := 0;
      ParamByName('Team_Count').AsInteger := 0;
      ParamByName('Work_Centre_Operator').asinteger := dblkpOperator.keyvalue;
      ParamByName('Operation').AsInteger := dblkpOperation.keyvalue;
      ParamByName('Work_Centre_Assistant').Asstring := 'N';
      ParamByName('Master_Job_Time_Log').Asinteger := iTempNewCode;

      if iCustomer = 0 then
        ParamByName('Customer').clear
      else
        ParamByName('Customer').Asinteger := iCustomer;

      rHourlyRate := dtmdlJobBagLog.GetOperatorHourlyRate(dblkpOperator.keyvalue);
      if rHourlyRate <> 0 then
        Parambyname('Hourly_Rate').asfloat := rHourlyRate
      else
        Parambyname('Hourly_Rate').asfloat := dtmdlJobBagLog.GetDeptHourlyRate(dblkpDepartment.KeyValue);

      Parambyname('Machine_Hourly_Rate').asfloat := 0.00;
      Parambyname('Click_Charge').asfloat := 0.00;
      ExecSQL;
    end;
    end;
    result := true;
  except
    result := false;
  end;
end;

function TPBLaserImportFrm.GetNextKey: integer;
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

procedure TPBLaserImportFrm.AddZero;
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

procedure TPBLaserImportFrm.DeleteZero;
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

procedure TPBLaserImportFrm.FormCreate(Sender: TObject);
begin
  dtmdlJobBagLog := TdtmdlJobBagLog.Create(self);
end;

procedure TPBLaserImportFrm.FormDestroy(Sender: TObject);
begin
  dtmdlJobBagLog.free;
end;

procedure TPBLaserImportFrm.dblkpDepartmentClick(Sender: TObject);
begin
  with dtmdlJobBagLog.qryProcess do
    begin
      close;
      open;
      dblkpOperation.keyvalue := 0;
    end;

  with dtmdlJobBagLog.qryWCOperators do
    begin
      Close;
      parambyname('Process_Group').asinteger := dblkpDepartment.keyvalue;
      ParamByName('Code_From').AsString := '%%';
      open;
    end;

end;

procedure TPBLaserImportFrm.FormActivate(Sender: TObject);
begin
  with dtmdlJobBagLog.qryProcessGrp do
    begin
      close;
      open;
    end;
end;

procedure TPBLaserImportFrm.dblkpProcessClick(Sender: TObject);
begin
  with dtmdlJobBagLog.qryProcessOps do
    begin
      close;
      open;
      dblkpOperation.keyvalue := 0;
    end;
end;

procedure TPBLaserImportFrm.dblkpOperationClick(Sender: TObject);
begin
  if dblkpOperation.keyvalue <> 0 then
  begin
    lblStep1.Font.Style :=[];
    lblStep2.Font.Style :=[fsBold];
    pnlImportFile.Enabled := True;
    pnlImportFile.setFocus;
  end
  else
  begin
    lblStep1.Font.Style :=[fsBold];
    lblStep2.Font.Style :=[];
    pnlImportFile.Enabled := False;
  end;

end;

end.
