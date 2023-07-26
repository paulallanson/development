unit PBLUWorkCentreGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUWorkCentreGroupfrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    btnWCGroups: TBitBtn;
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
    procedure btnWCGroupsClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  PBLUWorkCentreGroupfrm: TPBLUWorkCentreGroupfrm;

implementation

uses pbDatabase, pbMainMenu, PBMaintWorkCentreGroup,
  PBMaintWorkCentreGroupWC;

{$R *.DFM}

procedure TPBLUWorkCentreGroupfrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Work Centre Group';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Work Centre Group';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuWorkCentreGroups',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUWorkCentreGroupfrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUWorkCentreGroupfrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUWorkCentreGroupfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUWorkCentreGroupfrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUWorkCentreGroupfrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUWorkCentreGroupfrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Work_Centre_Group').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Work_Centre_Group_Name').AsString;
  Selected := True;
  Close;
end;

procedure TPBLUWorkCentreGroupfrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUWorkCentreGroupfrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Product_Type}
  CallMaintScreen('A');
end;

procedure TPBLUWorkCentreGroupfrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUWorkCentreGroupfrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUWorkCentreGroupfrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintWorkCentreGroupFrm := TPBMaintWorkCentreGroupFrm.Create(Self);
  try
    PBMaintWorkCentreGroupFrm.sFuncMode := sTempFuncMode;
    PBMaintWorkCentreGroupFrm.ShowModal;
    bTempOK := (PBMaintWorkCentreGroupFrm.ModalResult = mrOK);
    iTempSel := PBMaintWorkCentreGroupFrm.iCode;
  finally
    PBMaintWorkCentreGroupFrm.Free;
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

procedure TPBLUWorkCentreGroupfrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Work_Centre_Group').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TPBLUWorkCentreGroupfrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUWorkCentreGroupfrm.btnWCGroupsClick(Sender: TObject);
begin
  PBMaintWorkCentreGroupWCFrm := TPBMaintWorkCentreGroupWCFrm.Create(Self);
  try
    PBMaintWorkCentreGroupWCFrm.WCGroupCode := DetsSRC.DataSet.FieldByName('Work_Centre_Group').AsInteger;
    PBMaintWorkCentreGroupWCFrm.WCGroupName := DetsSRC.DataSet.FieldByName('Work_Centre_Group_Name').AsString;
    PBMaintWorkCentreGroupWCFrm.ShowModal;
  finally
    PBMaintWorkCentreGroupWCFrm.Free;
  end;
end;

end.
