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
    GetDetsSQLName: TWideStringField;
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
