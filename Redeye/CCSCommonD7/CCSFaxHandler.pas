unit CCSFaxHandler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Db, ExtCtrls, oomisc, printers, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait;

type
  TFaxHandler = class(TDataModule)
    GetOldFaxesQuery: TFDQuery;
    WaitForFaxFinishTimer: TTimer;
    FaxDatabase: TFDConnection;
    DelFaxQuery: TFDQuery;
    AddFaxSQL: TFDQuery;
    qrySelCustBrnchFax: TFDQuery;
    procedure WaitForFaxFinishTimerTimer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FaxDatabaseBeforeConnect(Sender: TObject);
  private
    FaxFileName: string;
    TimedFax: ByteBool;
    FaxTime: string[5];
    PrinterSettings: TPrinterSettings;
    function ConfirmCustBrnchFaxNo(cust, branch: integer): string;
    function OutToFax(FaxNo, FaxDescr, TempFaxTime: string): Integer;
    procedure WriteLogLine(TempText: string);
  public
    procedure Fax(report: TQuickRep; faxNo: string);overload;
    procedure Fax(report: TQuickRep; customer, branch: integer);overload;
  end;

var
  FaxHandler: TFaxHandler;

implementation

uses STMenuMain, STSendFax, STFaxList, CCSCommon;

{$R *.DFM}

{ TFaxHandler }

procedure TFaxHandler.Fax(report: TQuickRep; faxNo: string);
begin
  report.PrinterSettings.PrinterIndex := self.OutToFax(faxNo, 'Fax Desc', '');
  report.Print;
end;

procedure TFaxHandler.WaitForFaxFinishTimerTimer(Sender: TObject);
var
  TempArray: array[0..255] of Char;
  TempResult: string[1];
  sConvertLabel: string;
begin
  WaitForFaxFinishTimer.Enabled := False;
  {Check if fax has finished};
  GetPrivateProfileString('Fax Server Sending', 'Last Fax OK', '', TempArray,
    SizeOf(TempArray), 'FaxSrvV3.ini');
  sConvertLabel := TempArray;
  TempResult := sConvertLabel;
  if Trim(TempResult) = '' then
  begin
    WaitForFaxFinishTimer.Enabled := True;
    Exit;
  end;
  {Fax has finished};
  if TempResult = 'Y' then
  begin
    WriteLogLine(FaxFileName + ' finished OK');
  end
  else
  begin
    WriteLogLine(FaxFileName + ' finished with error');
  end;
end;

procedure TFaxHandler.FaxDatabaseBeforeConnect(Sender: TObject);
begin
  ConfigureFDConnection(FaxDatabase);
  {Get user and password from login screen};
  FaxDatabase.Params.UserName := 'faxes';
  FaxDatabase.Params.Password := 'rabbit';
end;

function TFaxHandler.OutToFax(FaxNo, FaxDescr,
  TempFaxTime: string): Integer;
var
  FaxFound: ByteBool;
  TempLoop: Byte;
begin
  {Force the printer select to be the fax system};
  FaxFound := False;
  for TempLoop := 0 to Printer.Printers.Count - 1 do
  begin
    if Pos('PRINTFAX', Printer.Printers[TempLoop]) > 0 then
    begin
      Printers.Printer.PrinterIndex := TempLoop;
      FaxFound := True;
      Break;
    end;
  end;
  if FaxFound then
  begin
    {Setup the fax phone number};
    STSendFaxFrm.FaxPhoneNo := FaxNo;
    STSendFaxFrm.FaxRef := FaxDescr;
    if Trim(TempFaxTime) = '' then
      TimedFax := False
    else
    begin
      TimedFax := True;
      FaxTime := TempFaxTime;
    end;
    {And write the profile file};
    WritePrivateProfileString('Application', 'WindowCaption',
      'Fax Send Form',
      'APFFAX.INI');
    WritePrivateProfileString('Application', 'WindowClass', 'TSTSendFaxFrm',
      'APFFAX.INI');
  end;
  if FaxFound then
    Result := TempLoop
  else
    Result := -2;
end;

procedure TFaxHandler.WriteLogLine(TempText: string);
var
  TempFile: TextFile;
  sLogFileName: string;
  TempArray: array[0..255] of Char;
begin
  {Get log file name};
  GetPrivateProfileString('Fax Server Config', 'Log File', 'NA', TempArray,
    sizeof(TempArray), 'FaxSrvV3.ini');
  sLogFileName := TempArray;
  if sLogFileName = 'NA' then
  begin
    WritePrivateProfileString('Fax Server Config', 'Log File',
      'C:\FaxSrvV3.log',
      'FaxSrvV3.ini');
    TempArray := 'C:\FaxSrvV3.log';
    sLogFileName := TempArray;
  end;

  {Write a text line to the log};
  AssignFile(TempFile, sLogFileName);
  try
    Append(TempFile);
  except
    begin
      try
        ReWrite(TempFile);
      except
        MessageDlg('Can''t open the log file' + 'faxsvr4.log', mtInformation,
          [mbOk], 0);
        Exit;
      end;
    end;

  end;
  WriteLn(TempFile, DateTimeToStr(Now), '  ****  ', TempText, '  ****');
  CloseFile(TempFile);
end;

procedure TFaxHandler.DataModuleCreate(Sender: TObject);
begin
  self.PrinterSettings := TPrinterSettings.Create;
end;

procedure TFaxHandler.Fax(report: TQuickRep; customer, branch: integer);
var
  faxNo: string;
begin
  faxNo := self.ConfirmCustBrnchFaxNo(customer, branch);

  if faxNo <> '' then
  begin
    report.PrinterSettings.PrinterIndex := self.OutToFax(faxNo, 'Fax Desc', '');
    report.Print;
  end;
end;

function TFaxHandler.ConfirmCustBrnchFaxNo(cust, branch: integer): string;
var
  FaxList: TSTFaxListFrm;
begin
  with qrySelCustBrnchFax do
  begin
    close;
    paramByName('customer').asInteger := cust;
    paramByName('branch').asInteger := branch;
    open;

    FaxList := TSTFaxListFrm.Create(nil);

    try
      FaxList.FaxListGrid.Cells[0, 0] := 'Customer';
      FaxList.FaxListGrid.Cells[1, 0] := 'Branch';
      FaxList.FaxListGrid.Cells[2, 0] := 'Fax Number';
      FaxList.FaxListGrid.Cells[0, 1] := FieldByName('name').asString;
      FaxList.FaxListGrid.Cells[1, 1] := FieldByName('branch_name').asString;
      FaxList.FaxListGrid.Cells[2, 1] := FieldByName('fax_number').asString;
      FaxList.FaxListGrid.ColWidths[0] := 200;
      FaxList.FaxListGrid.ColWidths[1] := 200;
      FaxList.FaxListGrid.ColWidths[2] := 100;
      FaxList.ShowModal;

      if FaxList.ModalResult = mrOK then
      begin
        Result := FaxList.FaxListGrid.Cells[2, 1];
      end
      else
      begin
        Result := '';
      end;
    finally
      FaxList.Free;
    end;

    close;
  end;
end;

end.
