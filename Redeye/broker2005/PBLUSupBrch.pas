unit PBLUSupBrch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUSupBrchFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    SuppLabel: TLabel;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    GoToGrpBox: TGroupBox;
    ContactsBitBtn: TBitBtn;
    GetODueEnqDetsSQL: TFDQuery;
    DispPanel: TPanel;
    DBBranchText: TDBText;
    DBBPhoneText: TDBText;
    DBBFaxText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    ThisChkBox: TCheckBox;
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
    procedure ThisChkBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ContactsBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iSupp: Integer;
    SelName, sSuppName: string;
    bIs_Lookup, bAllow_Upd, bSelected, bODueEnqsOnly: ByteBool;
    dODueDate: TDateTime;
  end;

var
  PBLUSupBrchFrm: TPBLUSupBrchFrm;

implementation

uses UITypes, PBMaintSupp, PBMaintSupBrch, PBLUSConta, 
  pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUSupBrchFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    if (not bODueEnqsOnly) then
      Caption := 'Lookup a Supplier Branch'
    else
      Caption := 'Lookup Branches With Overdue Quotes For: ' +
        DateToStr(dODueDate);
    GoToGrpBox.Visible := False;
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Supplier Branches';
    GoToGrpBox.Visible := True;
    SelectBitBtn.Visible := False;
  end;
  SuppLabel.Caption := 'Supplier: ' + sSuppName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  ThisChkBox.Visible := bIs_Lookup;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
  ThisChkBox.Checked := ((bIs_Lookup) and (SelCode = 0));
  dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUSupBrchFrm.ShowGrid(Sender: TObject);
begin
  GetDetsSQL.Close;
  GetODueEnqDetsSQL.Close;
  if (not bODueEnqsOnly) then
  begin
    DetsSRC.DataSet := GetDetsSQL;
    with GetDetsSQL do
    begin
      Close;
      ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
      ParamByName('Supplier').AsInteger := iSupp;
    end;
  end
  else
  begin
    DetsSRC.DataSet := GetODueEnqDetsSQL;
    with GetODueEnqDetsSQL do
    begin
      Close;
      ParamByName('Code_From').AsString := NameEdit.Text + '%';
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('ODue_Date').AsDateTime := dODueDate;
    end;
  end;
  with DetsSRC.DataSet do
  begin
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    ContactsBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUSupBrchFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSupBrchFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUSupBrchFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUSupBrchFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TPBLUSupBrchFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TPBLUSupBrchFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUSupBrchFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Supplier};
  CallMaintScreen('A');
end;

procedure TPBLUSupBrchFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Supplier};
  CallMaintScreen('C');
end;

procedure TPBLUSupBrchFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Supplier};
  CallMaintScreen('D');
end;

procedure TPBLUSupBrchFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  if (sTempFuncMode = 'D') and
    (DetsSRC.DataSet.FieldByName('Branch_No').AsInteger = 0) then
  begin
    MessageDlg('You can''t delete the main (head office) address details', mtError, [mbOK], 0);
    Exit;
  end;
  PBMaintSupBrchFrm := TPBMaintSupBrchFrm.Create(Self);
  try
    PBMaintSupBrchFrm.sFuncMode := sTempFuncMode;
    PBMaintSupBrchFrm.iSupp := iSupp;
    if sTempFuncMode <> 'A' then
      PBMaintSupBrchFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Branch_No').AsInteger
    else
      PBMaintSupBrchFrm.iCode := 0;
    PBMaintSupBrchFrm.sSuppName := sSuppName;
    PBMaintSupBrchFrm.ShowModal;
    bTempOK := (PBMaintSupBrchFrm.ModalResult = mrOK);
    iTempSel := PBMaintSupBrchFrm.iCode;
  finally
    PBMaintSupBrchFrm.Free;
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

procedure TPBLUSupBrchFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = -1 then Exit;
    while (not (EOF)) and (FieldByName('Branch_No').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TPBLUSupBrchFrm.ThisChkBoxClick(Sender: TObject);
begin
  {If checked, disable the grid etc};
//  DetsDBGrid.Enabled := (not (ThisChkBox.Checked));
  SearchGrpBox.Enabled := (not (ThisChkBox.Checked));
  if ThisChkBox.Checked then
  begin
    bDisableNameChangeEvent := True;
    NameEdit.Text := '';
    bDisableNameChangeEvent := False;
    ShowGrid(Self);
    FindInGrid(0);
  end
  else
    FindInGrid(-1)
end;

procedure TPBLUSupBrchFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUSupBrchFrm.ContactsBitBtnClick(Sender: TObject);
begin
  PBLUSContaFrm := TPBLUSContaFrm.Create(Self);
  try
    PBLUSContaFrm.bIs_Lookup := False;
    PBLUSContaFrm.bAllow_Upd := True;
    PBLUSContaFrm.iSupp := iSupp;
    PBLUSContaFrm.sSuppName := sSuppName;
    PBLUSContaFrm.iBranch := DetsSRC.DataSet.FieldByName('Branch_No').AsInteger;
    PBLUSContaFrm.sBranchName := DetsSRC.DataSet.FieldByName('Name').AsString;
    PBLUSContaFrm.ShowModal;
  finally
    PBLUSContaFrm.Free;
  end;
end;

end.
