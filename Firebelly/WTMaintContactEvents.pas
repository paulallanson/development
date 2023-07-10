unit WTMaintContactEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, Mask, ExtCtrls, ComCtrls, gtQrCtrls, wtDBMemo;

type
  TfrmWTMaintContactEvents = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    qryContacts: TQuery;
    dtsContacts: TDataSource;
    QryZero: TQuery;
    DispMemo: TMemo;
    dblkpContact: TDBLookupComboBox;
    Label1: TLabel;
    TimeDateTimePicker: TDateTimePicker;
    DateDateTimePicker: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    GetLastSQL: TQuery;
    Button1: TButton;
    Label5: TLabel;
    edtCustomer: TEdit;
    qryEvent: TQuery;
    Label4: TLabel;
    dblkpProspectAction: TDBLookupComboBox;
    SpeedButton4: TSpeedButton;
    qryAction: TQuery;
    dtsAction: TDataSource;
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
    procedure SpeedButton4Click(Sender: TObject);
  private
    frmWTEventDBMemo: TfrmWTDBMemo;
    FFuncMode: string;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextDbKey : integer;
    procedure Getcontacts;
    procedure GetActions;
  public
    sFuncMode: string[1];
    iCode, iCust, iContact, iAction: Integer;
    sCustName: string;
  end;

var
  frmWTMaintContactEvents: TfrmWTMaintContactEvents;

implementation

uses ComObj, ActiveX, wtMain,
  wtSrchCustContacts, WTEventsDM, wtLUProspectAction;

{$R *.DFM}

procedure TfrmWTMaintContactEvents.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  frmWTEventDBMemo.bAllow_Upd := True;

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
    getcontacts;
    getActions;
    DateDateTimePicker.Date := Date;
    TimeDateTimePicker.Time := Time;
    DispMemo.Text := '' ;
    if iAction <> 0 then
      dblkpProspectAction.KeyValue := iAction;  
  end
  else
  begin
    dblkpContact.enabled := false;

    with qryEvent do
    begin
      close;
      parambyname('Customer_Event_no').asinteger := iCode;
      open;

      frmWTEventDBMemo.LoadMemoData(FieldByName('Narrative').AsInteger);

      getcontacts;
      getActions;
      dblkpContact.KeyValue := FieldByName('Contact_no').AsInteger;
      DateDateTimePicker.Date := StrToDate(DateToStr(FieldByName('Date_Time_Entered').AsDateTime));
      TimeDateTimePicker.Time := StrToTime(TimeToStr(FieldByName('Date_Time_Entered').AsDateTime));
      dblkpProspectAction.KeyValue := fieldbyname('Prospect_Action').asinteger;
      DispMemo.Text := frmWTEventDBMemo.DispMemo.Text ;
    end;
  end;

  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  if sFuncMode = 'A' then
    dblkpContact.setfocus
  else
  if sFuncMode <> 'D' then
    DispMemo.SetFocus;
end;

procedure TfrmWTMaintContactEvents.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := ((DispMemo.Text <> '')  and (dblkpContact.text <> '')) or (sFuncMode = 'D');
end;

procedure TfrmWTMaintContactEvents.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmWTMaintContactEvents.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmWTMaintContactEvents.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if (dblkpProspectAction.Text = '') and (sFuncMode[1] in ['A']) then
      begin
        messagedlg('An action must be selected, please enter an action from the drop-down list', mtError, [mbOk], 0);
        dblkpProspectAction.setfocus;
        exit;
      end;

    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    frmWTEventDBMemo.DispMemo.LInes := DispMemo.Lines ;
    frmWTEventDBMemo.DataMemo.Lines := DispMemo.Lines ;
    frmWTEventDBMemo.bMemoUpd := True ;
    frmWTEventDBMemo.UpdMemoData(Self);
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Contact_No').AsInteger := dblkpContact.KeyValue;
      ParamByName('Customer_Event_No').AsInteger := iCode;
      ParamByName('Date_Time_Entered').AsDateTime := DateDateTimePicker.Date + TimeDateTimePicker.Time;
      ParamByName('Operator').AsInteger := frmWTMain.Operator;
      ParamByName('Event_Title').Asstring := copy(trim(frmWTEventDBMemo.DispMemo.text),1,50);
      ParamByName('Narrative').AsInteger := frmWTEventDBMemo.iNarr;
      if dblkpProspectAction.Text = '' then
        ParamByName('Prospect_Action').clear
      else
        ParamByName('Prospect_Action').AsInteger := dblkpProspectAction.KeyValue;
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
    frmWTEventDBMemo.DelMemoData(Self);
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Contact_No').AsInteger := iContact;
      ParamByName('Customer_Event_No').AsInteger := iCode;
      ExecSQL;
    end;
  end;
  self.ModalResult := mrok;
end;

procedure TfrmWTMaintContactEvents.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmWTMaintContactEvents.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

function TfrmWTMaintContactEvents.GetNextDbKey: integer;
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
      ParamByName('Event_Title').AsString := GuidToString(aGuid);
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Contact_No').AsInteger := iContact;
      ParamByName('Operator').AsInteger := frmWTMain.Operator;
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('Event_Title').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Customer_Event_No').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintContactEvents.AddZero;
var
  sTemp: string;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Event ' +
            '(Customer, Contact_No, Operator, Customer_Event_No) ' +
            'VALUES(' + IntToStr(iCust) + ',' + IntToStr(iContact) + ',' + IntToStr(frmWTMain.Operator) +
            ',0)');
    try
      ExecSQL;
    except
      sTemp := 'Failed' ;
    end;
  end;
end;

procedure TfrmWTMaintContactEvents.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Event ' +
            'Where Customer=' + IntToStr(iCust) + ' and Contact_No=' + IntToStr(iContact) +
                ' and Customer_Event_No=0 ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintContactEvents.FileTypDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TfrmWTMaintContactEvents.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmWTEventDBMemo.Free;
end;

procedure TfrmWTMaintContactEvents.DispMemoChange(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TfrmWTMaintContactEvents.dblkpBranchClick(Sender: TObject);
begin
  GetContacts;
end;

procedure TfrmWTMaintContactEvents.getcontacts;
begin
  qryContacts.close;
  qryContacts.parambyname('Customer').asinteger := iCust;
  qryContacts.open;

  if qryContacts.RecordCount = 1 then
    begin
      dblkpContact.KeyValue := qryContacts.fieldbyname('contact_no').asinteger;
      iContact := qryContacts.fieldbyname('contact_no').asinteger;
    end;
end;

procedure TfrmWTMaintContactEvents.GetActions;
begin
  qryAction.close;
  qryAction.open;

  if qryAction.RecordCount = 1 then
    begin
      dblkpProspectAction.KeyValue := qryAction.fieldbyname('Prospect_Action').asinteger;
      iAction := qryAction.fieldbyname('Prospect_Action').asinteger;
    end;
end;

procedure TfrmWTMaintContactEvents.dblkpContactClick(Sender: TObject);
begin
  iContact := dblkpContact.keyvalue;
  CheckOK(self);
end;

procedure TfrmWTMaintContactEvents.Button1Click(Sender: TObject);
begin
  frmWTSrchCustContacts := TfrmWTSrchCustContacts.create(self);
  try
    frmWTSrchCustContacts.Customer := iCust;
    frmWTSrchCustContacts.Caption := 'Customer '+ frmWTSrchCustContacts.Caption + ' - ' + sCustName;
    frmWTSrchCustContacts.showmodal;

    getcontacts;
  finally
    frmWTSrchCustContacts.free;
    checkok(self);
  end;
end;

procedure TfrmWTMaintContactEvents.FormShow(Sender: TObject);
begin
  edtCustomer.text := sCustName;
end;

procedure TfrmWTMaintContactEvents.FormCreate(Sender: TObject);
begin
  frmWTEventDBMemo := TfrmWTDBMemo.Create(Self);
end;

procedure TfrmWTMaintContactEvents.SpeedButton4Click(Sender: TObject);
begin
  frmWTLUProspectAction := TfrmWTLUProspectAction.create(self);
  try
    frmWTLUProspectAction.showmodal;
    getActions;
  finally
    frmWTLUProspectAction.free;
    checkok(self);
  end;
end;

end.
