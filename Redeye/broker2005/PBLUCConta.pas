unit PBLUCConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUCContaFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
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
    GoToGrpBox: TGroupBox;
    EventsBitBtn: TBitBtn;
    DBContactText: TDBText;
    DBCPhoneText: TDBText;
    DBCMobileText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    chkbxActiveOnly: TCheckBox;
    NullSRC: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure ShowNotes(Sender: TObject);
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
    procedure EventsBitBtnClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iCust, iBranch: Integer;
    SelName, sCustName, sBranchName, sCustTelNo, SelNameEmail: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
    Contact_Name, Account_Month, Account_Year, Account_Number: string;
  end;

var
  PBLUCContaFrm: TPBLUCContaFrm;

implementation

uses UITypes, PBMaintCConta, pbMainMenu, PBDatabase, PBLUCContaEvents, PBDBMemo;

{$R *.DFM}

procedure TPBLUCContaFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer/Branch Contact';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer/Branch Contacts';
    SelectBitBtn.Visible := False;
  end;
  CustLabel.Caption := sCustName;
  BranchLabel.Caption := sBranchName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
//  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUCContaFrm.ShowNotes(Sender: TObject);
var
  PBLUDBMemoFrm: TPBDBMemoFrm;
begin
  PBLUDBMemoFrm := TPBDBMemoFrm.Create(Self);
  try
    PBLUDBMemoFrm.bAllow_Upd := False;
    PBLUDBMemoFrm.LoadMemoData(detsdbGrid.datasource.DataSet.FieldByName('Narrative').AsInteger);
    PBLUDBMemoFrm.ShowModal;
  finally
    PBLUDBMemoFrm.Free;
  end;
end;

procedure TPBLUCContaFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    EventsBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUCContaFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUCContaFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUCContaFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUCContaFrm.SelectBitBtnClick(Sender: TObject);
begin
  if detsdbGrid.datasource.DataSet.FieldByName('Narrative').AsInteger <> 0 then
    ShowNotes(Self);
  SelectCode(Self);
end;

procedure TPBLUCContaFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Contact_No').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  SelNameEmail := DetsSRC.DataSet.FieldByName('Email').AsString;
  Contact_Name := DetsSRC.DataSet.FieldByName('Contact_Name').AsString;
  Account_Month := DetsSRC.DataSet.FieldByName('Account_Month').AsString;
  Account_Year := DetsSRC.DataSet.FieldByName('Account_Year').AsString;
  Account_Number := DetsSRC.DataSet.FieldByName('Account_Number').AsString;
  
  bSelected := True;
  Close;
end;

procedure TPBLUCContaFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUCContaFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer}
  CallMaintScreen('A');
end;

procedure TPBLUCContaFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer}
  CallMaintScreen('C');
end;

procedure TPBLUCContaFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer}
  CallMaintScreen('D');
end;

procedure TPBLUCContaFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintCContaFrm := TPBMaintCContaFrm.Create(Self);
  try
    PBMaintCContaFrm.sFuncMode := sTempFuncMode;
    PBMaintCContaFrm.iCust := iCust;
    PBMaintCContaFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      PBMaintCContaFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Contact_No').AsInteger
    else
      PBMaintCContaFrm.iCode := 0;
    PBMaintCContaFrm.sCustName := sCustName;
    PBMaintCContaFrm.sBranchName := sBranchName;
    PBMaintCContaFrm.ShowModal;
    bTempOK := (PBMaintCContaFrm.ModalResult = mrOK);
    iTempSel := PBMaintCContaFrm.iCode;
  finally
    PBMaintCContaFrm.Free;
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
    NameEdit.SetFocus;
  end;
end;

procedure TPBLUCContaFrm.FindInGrid(iTempSel: Integer);
begin
  detsDBGrid.datasource := NullSRC;
  {Find the item you just changed}
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then Exit;
    while (not (EOF)) and (FieldByName('Contact_No').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
  detsDBGrid.datasource := DetsSRC;
end;

procedure TPBLUCContaFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUCContaFrm.EventsBitBtnClick(Sender: TObject);
begin
  PBLUCContaEventsFrm := TPBLUCContaEventsFrm.Create(Self);
  try
    PBLUCContaEventsFrm.bIs_Lookup := False;
    PBLUCContaEventsFrm.bAllow_Upd := True;
    PBLUCContaEventsFrm.iCust := iCust;
    PBLUCContaEventsFrm.iBranch := iBranch;
    PBLUCContaEventsFrm.iContact := DetsSRC.DataSet.FieldByName('Contact_No').AsInteger;
    PBLUCContaEventsFrm.sContactName := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBLUCContaEventsFrm.SCustName := sCustName;
    PBLUCContaEventsFrm.sBranchName := sBranchName;
    if DetsSRC.Dataset.FieldByName('Phone').AsString = '' then
      PBLUCContaEventsFrm.LblTelNO.Caption := sCustTelNo
    else
      PBLUCContaEventsFrm.LblTelNO.Caption := DetsSRC.Dataset.FieldByName('Phone').AsString;
    PBLUCContaEventsFrm.ShowModal;
  finally
    showgrid(self);
    findingrid(PBLUCContaEventsFrm.iCust);
    PBLUCContaEventsFrm.Free;
  end;

end;

procedure TPBLUCContaFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(detsDBGrid.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

end.
