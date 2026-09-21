unit PBMaintContactEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, Mask, ExtCtrls, ComCtrls, pbEventsDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBMaintContactEvents = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    qryContacts: TFDQuery;
    dtsContacts: TDataSource;
    QryZero: TFDQuery;
    DispMemo: TMemo;
    dblkpContact: TDBLookupComboBox;
    Label1: TLabel;
    TimeDateTimePicker: TDateTimePicker;
    DateDateTimePicker: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    GetLastSQL: TFDQuery;
    Label4: TLabel;
    dblkpBranch: TDBLookupComboBox;
    qryBranch: TFDQuery;
    dtsBranch: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Label5: TLabel;
    edtCustomer: TEdit;
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
    procedure dblkpBranchClick(Sender: TObject);
    procedure dblkpContactClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function GetNextDbKey : integer;
    procedure getcontacts(tempcode: integer);
  public
    dtmdlAllEvents: TdtmdlEvents;
    sFuncMode: string[1];
    iCode, iCust, iBranch, iContact: Integer;
    sCustName, sBranchName: string;
  end;

var
  frmPBMaintContactEvents: TfrmPBMaintContactEvents;

implementation

uses UITypes, ComObj, ActiveX, PBDBMemo, pbMainMenu, PBDatabase,
  pbluContacts, pbLuBranches;

{$R *.DFM}

procedure TfrmPBMaintContactEvents.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  PBDBMemoFrm.bAllow_Upd := True;

  qryBranch.Close;
  qryBranch.parambyname('Customer').asinteger := iCust;
  qryBranch.Open;

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
    dblkpBranch.KeyValue := iBranch;
    getcontacts(dblkpBranch.KeyValue);
    DateDateTimePicker.Date := Date;
    TimeDateTimePicker.Time := Time;
    DispMemo.Text := '' ;
  end
  else
  begin
    dblkpBranch.enabled := false;
    dblkpContact.enabled := false;
    
    with dtmdlAllEvents.dtsEvents.DataSet do
    begin
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      dblkpBranch.KeyValue := FieldByName('Branch_no').AsInteger;

      getcontacts(dblkpBranch.KeyValue);

      dblkpContact.KeyValue := FieldByName('Contact_no').AsInteger;
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
  if sFuncMode = 'A' then
    dblkpContact.setfocus
  else
  if sFuncMode <> 'D' then
    DispMemo.SetFocus;
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TfrmPBMaintContactEvents.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DispMemo.Text <> '') or (sFuncMode = 'D');
end;

procedure TfrmPBMaintContactEvents.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPBMaintContactEvents.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmPBMaintContactEvents.OKBitBtnClick(Sender: TObject);
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
      ParamByName('Branch_No').AsInteger := dblkpBranch.KeyValue;
      ParamByName('Contact_No').AsInteger := dblkpContact.KeyValue;
      ParamByName('Customer_Cont_Event_No').AsInteger := iCode;
      ParamByName('Date_Time_Entered').AsDateTime := DateDateTimePicker.Date + TimeDateTimePicker.Time;
      ParamByName('Operator').AsInteger := frmpbMainMenu.iOperator;
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

procedure TfrmPBMaintContactEvents.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmPBMaintContactEvents.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

function TfrmPBMaintContactEvents.GetNextDbKey: integer;
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

procedure TfrmPBMaintContactEvents.AddZero;
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

procedure TfrmPBMaintContactEvents.DeleteZero;
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

procedure TfrmPBMaintContactEvents.FileTypDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmPBMaintContactEvents.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBMemoFrm.Free;
end;

procedure TfrmPBMaintContactEvents.DispMemoChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TfrmPBMaintContactEvents.dblkpBranchClick(Sender: TObject);
begin
  iBranch := dblkpBranch.KeyValue;
  GetContacts(iBranch);
end;

procedure TfrmPBMaintContactEvents.getcontacts(tempcode: integer);
begin
  qryContacts.close;
  qryContacts.parambyname('Branch_no').asinteger := tempcode;
  qryContacts.parambyname('Customer').asinteger := iCust;
  qryContacts.open;

  if qryContacts.RecordCount = 1 then
    begin
      dblkpContact.KeyValue := qryContacts.fieldbyname('contact_no').asinteger;
      iContact := qryContacts.fieldbyname('contact_no').asinteger;
    end;
end;

procedure TfrmPBMaintContactEvents.dblkpContactClick(Sender: TObject);
begin
  iContact := dblkpContact.keyvalue;
end;

procedure TfrmPBMaintContactEvents.Button1Click(Sender: TObject);
begin
  frmPBLUContacts := TfrmPBLUContacts.create(self);
  try
    frmPBLUContacts.Code := iCust;
    frmPBLUContacts.CodeType := 'C';
    frmPBLUContacts.MainName := sCustName;
    frmPBluContacts.Caption := 'Customer '+ frmpbluContacts.Caption + ' - ' + sCustName;
    frmPBLUContacts.showmodal;

    getcontacts(dblkpBranch.KeyValue);
  finally
    frmPBLUContacts.free;
  end;
end;

procedure TfrmPBMaintContactEvents.FormShow(Sender: TObject);
begin
  edtCustomer.text := sCustName;
end;

procedure TfrmPBMaintContactEvents.FormCreate(Sender: TObject);
begin
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
end;

procedure TfrmPBMaintContactEvents.Button2Click(Sender: TObject);
begin
  frmPBLUBranches := TfrmPBLUBranches.create(self);
  try
    frmPBLUBranches.Code := iCust;
    frmPBLUBranches.CodeType := 'C';
    frmPBLUBranches.MainName := sCustName;
    frmPBLUBranches.Caption := 'Customer '+ frmpbluBranches.Caption + ' - ' + sCustName;
    frmPBLUBranches.showmodal;

    qryBranch.close;
    qryBranch.parambyname('Customer').asinteger := iCust;
    qryBranch.open;

    getcontacts(dblkpBranch.KeyValue);
  finally
    frmPBLUContacts.free;
  end;

end;

end.
