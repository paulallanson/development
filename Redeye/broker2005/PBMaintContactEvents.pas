(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Customer/Branch Contacts.

VSS Info:
$Header: /PBL D5/PBMaintCContaEvents.pas 7     20/06/03 9:53 Andrewh $
$History: PBMaintCContaEvents.pas $
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 4  *****************
 * User: Pahome       Date: 24/09/:2   Time: 12:34
 * Updated in $/PBL D5
 * Changed to update the Event_GUID field on Customer_Contact_Event table
 * as opposed to GUID which is not compatible with Access database
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 16/07/02   Time: 16:18
 * Created in $/PBL D5
 * New Customer Contact Events feature.
 * 
 * *****************  Version 19  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:28
 * Updated in $/PBL D5
 * 
 * *****************  Version 18  *****************
 * User: Andrewh      Date: 15/07/02   Time: 9:49
 * Updated in $/PBL D5
 * Cure bug where changing notes was not refelected until you got out of
 * look-up screen and go back in/
 * 
 * *****************  Version 17  *****************
 * User: Andrewh      Date: 12/07/02   Time: 15:58
 * Updated in $/PBL D5
 * Add new NOTES and ENQUIRY mode to program.
 * 
 * *****************  Version 16  *****************
 * User: Janiner      Date: 10/07/:1   Time: 14:12
 * Updated in $/PBL D5
 * Allow notes to be added against customer branch contacts.
 * 
 * *****************  Version 15  *****************
 * User: Janiner      Date: 31/01/:1   Time: 9:44
 * Updated in $/PBL D5
 * Ensure null key check is valid on change event, and define exportfilter
 * param type in sqls.
 * 
 * *****************  Version 14  *****************
 * User: Janiner      Date: 30/01/:1   Time: 14:15
 * Updated in $/PBL D5
 * Add Export filter Dropdown box to select 'Accept files of type' .
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 19/10/:0   Time: 12:29
 * Updated in $/PBL D5
 * Changed to refresh the Contact Level combo after adding new levels
 * 
 * *****************  Version 12  *****************
 * User: Davidn       Date: 18/10/00   Time: 10:54
 * Updated in $/PBL D5
 * Fixing bug in the Levels combo box (assigning a duff value to the box
 * in the cases where no contact level had been set for the contact),
 * Added a maintain contact levels bit button,
 * Amended the tab order of the components of the form. 
 * 
 * *****************  Version 11  *****************
 * User: Davidn       Date: 17/10/00   Time: 17:10
 * Updated in $/PBL D5
 * Fixed bug which occured when adding a contact that had no contact level
 * specified.
 * 
 * *****************  Version 10  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:44
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 9  *****************
 * User: Davidn       Date: 17/10/00   Time: 9:55
 * Updated in $/PBL D5
 * Cosmetic changes to layout, ie alignment and sizes of text boxes,
 * matched labels to those on supplier contact maintenance.
 * 
 * *****************  Version 8  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:25
 * Updated in $/PBL D5
 * Changed default setting of recvCorresCB to unchecked.
 * 
 * *****************  Version 7  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:22
 * Updated in $/PBL D5
 * Changes to alignment of visible components.
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:07
 * Updated in $/PBL D5
 * Added a field, combo look up box and check box to allow the addition
 * and amintainance of a Fax number, contact level and receive mail option
 * to the customer contacts maintainance form.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 3/10/:0    Time: 15:41
 * Updated in $/PBL D5
 * Add new maintenance facility to contact type, look-up facility.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:36
 * Updated in $/PBL D5
 * New insert method using Guids to ensure unique new key values.
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 21/01/:0   Time: 10:42
 * Updated in $/PBL D5
 * Display 'name' etc in panel
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
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
