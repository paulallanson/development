(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Customer/Branch Contacts.

VSS Info:
$Header: /PBL D5/PBLUCContaEvents.pas 12    20/06/03 9:52 Andrewh $
$History: PBLUCContaEvents.pas $
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:14
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 8/11/:2    Time: 13:17
 * Updated in $/PBL D5
 * Corrected problem whereby the default date was not correct when setting
 * the appointment
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 5/11/:2    Time: 15:55
 * Updated in $/PBL D5
 * Changed to add facility for setting appointments
 * 
 * *****************  Version 7  *****************
 * User: Pahome       Date: 17/10/:2   Time: 20:40
 * Updated in $/PBL D5
 * Removed the time from the lookup
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 2/10/:2    Time: 10:00
 * Updated in $/PBL D5
 * Customer,branch names and telephone numbers not shown, now fixed.
 * 
 * *****************  Version 5  *****************
 * User: Pahome       Date: 24/09/:2   Time: 12:33
 * Updated in $/PBL D5
 * Changed to update the Event_GUID field on Customer_Contact_Event table
 * as opposed to GUID which is not compatible with Access database
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 13/09/02   Time: 15:02
 * Updated in $/PBL D5
 * When first entering screen, now highlights event at top of list
 * (latest) not the one at the bottom.
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
 * New Customer Contact Events lookup.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 15/07/02   Time: 9:42
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 12/07/02   Time: 15:58
 * Updated in $/PBL D5
 * Add new NOTES and ENQUIRY mode to program.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:44
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:05
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
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
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBLUCContaEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCContaEventsFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    BranchLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DispPanel: TPanel;
    Label3: TLabel;
    ContactLabel: TLabel;
    TextMemo: TMemo;
    LblPhone: TLabel;
    LblTelNo: TLabel;
    GetDetsSQLCustomer_Cont_Event_No: TIntegerField;
    GetDetsSQLCustomer: TIntegerField;
    GetDetsSQLOperator: TIntegerField;
    GetDetsSQLBranch_No: TIntegerField;
    GetDetsSQLContact_no: TIntegerField;
    GetDetsSQLDate_Time_Entered: TDateTimeField;
    GetDetsSQLNarrative: TIntegerField;
    GetDetsSQLName: TStringField;
    GetDetsSQLEventDate: TDateField;
    AppBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure DetsSRCDataChange(Sender: TObject; Field: TField);
    procedure GetDetsSQLEventDateGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure AppBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    iContact, SelCode, iCust,iBranch: Integer;
    sContactName,sCustName, sBranchName, SelName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  PBLUCContaEventsFrm: TPBLUCContaEventsFrm;

implementation

uses pbMainMenu, PBDatabase, PBMaintCContaEvents, PBDBMemo, PBMaintContApp;

{$R *.DFM}

procedure TPBLUCContaEventsFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer/Branch Contact Event';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer/Branch Contact Events';
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
  ContactLabel.Caption := sContactName;
  FuncGrpBox.Visible := (bAllow_Upd);
  {Load up the string grid}
  ShowGrid(Self);
  If SelCode <> 0 then
        FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUCContaEventsFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Contact_No').AsInteger := iContact;
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUCContaEventsFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCContaEventsFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUCContaEventsFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUCContaEventsFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TPBLUCContaEventsFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Customer_Cont_Event_No').AsInteger;
  SelName := DateTimeToStr(DetsSRC.DataSet.FieldByName('Date_Time_Entered').AsDateTime);
  bSelected := True;
  Close;
end;

procedure TPBLUCContaEventsFrm.DetsDBGridDblClick(Sender: TObject);
begin
If GetDetsSQL.RecordCount = 0 then
        exit ;
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUCContaEventsFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer}
  CallMaintScreen('A');
end;

procedure TPBLUCContaEventsFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer}
  CallMaintScreen('C');
end;

procedure TPBLUCContaEventsFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer}
  CallMaintScreen('D');
end;

procedure TPBLUCContaEventsFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintCContaEventsFrm := TPBMaintCContaEventsFrm.Create(Self);
  try
    PBMaintCContaEventsFrm.sFuncMode := sTempFuncMode;
    PBMaintCContaEventsFrm.iCust := iCust;
    PBMaintCContaEventsFrm.iBranch := iBranch;
    PBMaintCContaEventsFrm.iContact := iContact;
    if sTempFuncMode <> 'A' then
      PBMaintCContaEventsFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Customer_Cont_Event_No').AsInteger
    else
      PBMaintCContaEventsFrm.iCode := 0;
    PBMaintCContaEventsFrm.sCustName := sCustName;
    PBMaintCContaEventsFrm.sBranchName := sBranchName;
    PBMaintCContaEventsFrm.sBranchName := sContactName;
    PBMaintCContaEventsFrm.ShowModal;
    bTempOK := (PBMaintCContaEventsFrm.ModalResult = mrOK);
    iTempSel := PBMaintCContaEventsFrm.iCode;
  finally
    PBMaintCContaEventsFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TPBLUCContaEventsFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then Exit;
    while (not (EOF)) and (FieldByName('Customer_Cont_Event_No').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUCContaEventsFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUCContaEventsFrm.DetsSRCDataChange(Sender: TObject;
  Field: TField);
begin
{Get the details for the memo display} ;
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBDBMemoFrm.bAllow_Upd := False;
    PBDBMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
    TextMemo.Text := PBDBMemoFrm.DispMemo.Text ;
  finally
    PBDBMemoFrm.Free;
  end;
end;

procedure TPBLUCContaEventsFrm.GetDetsSQLEventDateGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  text := PBDateStr(GetDetsSQLDate_Time_Entered.asdatetime);
end;

procedure TPBLUCContaEventsFrm.AppBitBtnClick(Sender: TObject);
var
  sSubject, sBody: string;
  AppDateTime: TDateTime;
  Hour, Min, Sec, MSec: Word;
  PBAppMemoFrm: TPBDBMemoFrm;
begin
  PBMaintContAppfrm := TPBMaintContAppfrm.create(self);
  try
    PBMaintContAppfrm.showmodal;
    if PBMaintContAppfrm.modalresult = idOK then
      begin
        sSubject := 'Call ' + ContactLabel.caption + ' at ' + CustLabel.caption;

        sBody := 'Phone no: ' + lbltelNo.caption + #13#10 + #13#10;

        {Get the details for the memo display} ;
        PBAppMemoFrm := TPBDBMemoFrm.Create(Self);
        try
          PBAppMemoFrm.bAllow_Upd := False;
          GetDetsSQL.First;
          PBAppMemoFrm.LoadMemoData(DetsSRC.DataSet.FieldByName('Narrative').AsInteger);
          if trim(PBAppMemoFrm.DispMemo.Text) = '' then
            sBody := sBody + ''
          else
            sBody := sBody + 'Last event details: ' + #13#10 + #13#10 + PBAppMemoFrm.DispMemo.Text ;
        finally
          PBAppMemoFrm.Free;
        end;
        decodetime(PBMaintContAppfrm.dtpckAppTime.time,Hour,Min,Sec,Msec);
//        AppDatetime := PBMaintContAppFrm.mnthCalApp.date + encodetime(Hour,Min,Sec,Msec);
        AppDatetime := PBMaintContAppFrm.DateTimePicker.date + encodetime(Hour,Min,Sec,Msec);
        AddAppViaOutLook('',sSubject,sBody,AppDateTime,true,20);
      end;
  finally
    PBMaintContAppfrm.free;
  end;
end;

end.
