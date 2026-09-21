unit PBMaintCContaEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Mask, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCContaEventsFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    GetOperatorsSQL: TFDQuery;
    OperatorsSRC: TDataSource;
    QryZero: TFDQuery;
    DispMemo: TMemo;
    OperatorDBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    TimeDateTimePicker: TDateTimePicker;
    DateDateTimePicker: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    GetLastSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure FileTypDBLCBClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DispMemoChange(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function GetNextDbKey : integer;
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch, iContact: Integer;
    sCustName, sBranchName: string;
  end;

var
  PBMaintCContaEventsFrm: TPBMaintCContaEventsFrm;

implementation

uses UITypes, ComObj, ActiveX, PBDBMemo, pbMainMenu, PBLUCContaEvents, PBDatabase;

{$R *.DFM}

procedure TPBMaintCContaEventsFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;
  GetOperatorsSQL.Close;
  GetOperatorsSQL.Open;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new event';
  if sFuncMode = 'C' then
    Caption := 'Change an event';
  if sFuncMode = 'D' then
    Caption := 'Delete an event';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    OperatorDBLookupComboBox.KeyValue := frmpbMainMenu.iOperator;
    DateDateTimePicker.Date := Date;
    TimeDateTimePicker.Time := Time;
    DispMemo.Text := '' ;
  end
  else
  begin
    with PBLUCContaEventsFrm.DetsSRC.DataSet do
    begin
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      OperatorDBLookupComboBox.KeyValue := FieldByName('Operator').AsInteger;
      DateDateTimePicker.Date := StrToDate(DateToStr(FieldByName('Date_Time_Entered').AsDateTime));
      TimeDateTimePicker.Time := StrToTime(TimeToStr(FieldByName('Date_Time_Entered').AsDateTime));
      DispMemo.Text := PBDBMemoFrm.DispMemo.Text ;
    end;
  end;
  {CustNameEdit.Text := sCustName;
  BranchNameEdit.Text := sBranchName};
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  if sFuncMode <> 'D' then
    DispMemo.SetFocus;
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCContaEventsFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DispMemo.Text <> '') or (sFuncMode = 'D');
end;

procedure TPBMaintCContaEventsFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCContaEventsFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaEventsFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    PBDBMemoFrm.DispMemo.LInes := DispMemo.Lines ;
    PBDBMemoFrm.DataMemo.Lines := DispMemo.Lines ;
    PBDBMemoFrm.bMemoUpd := True ;
    PBDBMemoFrm.UpdMemoData(Self);
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iContact;
      ParamByName('Customer_Cont_Event_No').AsInteger := iCode;
      ParamByName('Date_Time_Entered').AsDateTime := DateDateTimePicker.Date + TimeDateTimePicker.Time;
      ParamByName('Operator').AsInteger := OperatorDBLookupComboBox.KeyValue;
      ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    PBDBMemoFrm.DelMemoData(Self);
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iContact;
      ParamByName('Customer_Cont_Event_No').AsInteger := iCode;
      ExecSQL;
    end;
  end;
end;

procedure TPBMaintCContaEventsFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaEventsFrm.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

function TPBMaintCContaEventsFrm.GetNextDbKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      Close ;
      ParamByName('Event_Guid').AsString := GuidToString(aGuid);
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_no').AsInteger := iBranch;
      ParamByName('Contact_No').AsInteger := iContact;
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('Event_Guid').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Customer_Cont_Event_No').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintCContaEventsFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Contact_Event ' +
            '(Customer,Branch_No,Contact_No,Customer_Cont_Event_No) ' +
            'VALUES(' + IntToStr(iCust) + ',' + IntToStr(iBranch) + ',' + IntToStr(iContact) +
            ',0)');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCContaEventsFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Contact_Event ' +
            'Where Customer=' + IntToStr(iCust) + ' and Branch_No=' +
            IntToStr(iBranch) + ' and Contact_No=' + IntToStr(iContact) +
                ' and Customer_Cont_Event_No=0 ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCContaEventsFrm.FileTypDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCContaEventsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
PBDBMemoFrm.Free;
end;

procedure TPBMaintCContaEventsFrm.DispMemoChange(Sender: TObject);
begin
CheckOK(self) ;
end;

end.
