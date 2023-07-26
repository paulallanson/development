unit SFLUWCOperator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TSFLUWCOperatorFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    chkbxActiveOnly: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iThisCode: Integer;
    SelName: string;
    SelEmpNo: string;
    SelProcessGroup, SelProcess: integer;
    SelTeam: integer;
    SelTeamName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  SFLUWCOperatorFrm: TSFLUWCOperatorFrm;

implementation

uses pbDatabase, FPMainMenu;

{$R *.DFM}

procedure TSFLUWCOperatorFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Work Centre Operator';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Work Centre Operator';
    SelectBitBtn.Visible := False;
  end;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
end;

procedure TSFLUWCOperatorFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Open;

    SelectBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TSFLUWCOperatorFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TSFLUWCOperatorFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TSFLUWCOperatorFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TSFLUWCOperatorFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TSFLUWCOperatorFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Work_Centre_Operator').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  SelEmpNo := DetsSRC.DataSet.FieldByName('Employee_number').AsString;
  SelProcessGroup := DetsSRC.DataSet.FieldByName('Process_Group').Asinteger;
  SelProcess := DetsSRC.DataSet.FieldByName('Process').Asinteger;
  Selected := True;
  Close;
end;

procedure TSFLUWCOperatorFrm.DetsDBGridDblClick(Sender: TObject);
begin
  SelectCode(Self)
end;

procedure TSFLUWCOperatorFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Work_Centre_Operator').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TSFLUWCOperatorFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TSFLUWCOperatorFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

end.
