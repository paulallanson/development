unit STLUCourierSort;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTLUCourierSortFrm = class(TForm)
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
    chkbxActiveOnly: TCheckBox;
    lblCourier: TLabel;
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
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    CourierCode: integer;
    CourierName: string;
    SelCode, iThisCode: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
  end;

var
  STLUCourierSortFrm: TSTLUCourierSortFrm;

implementation

uses UITypes, STMaintCourierSort;

{$R *.DFM}

procedure TSTLUCourierSortFrm.FormActivate(Sender: TObject);
begin
  lblCourier.Caption := 'Courier: ' + courierName;
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Courier Sort Type';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Courier Sort Types';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  if (SelCode <> 0) then FindInGrid(SelCode);
end;

procedure TSTLUCourierSortFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    Parambyname('Courier').asinteger := CourierCode;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TSTLUCourierSortFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TSTLUCourierSortFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TSTLUCourierSortFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TSTLUCourierSortFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TSTLUCourierSortFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Courier_Sort').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Sort_Description').AsString;
  Selected := True;
  Close;
end;

procedure TSTLUCourierSortFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self)
  end
  else
    chgbitbtnclick(Self);
end;

procedure TSTLUCourierSortFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Sort Type}
  CallMaintScreen('A');
end;

procedure TSTLUCourierSortFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Sort Type}
  CallMaintScreen('C');
end;

procedure TSTLUCourierSortFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Sort Type}
  CallMaintScreen('D');
end;

procedure TSTLUCourierSortFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  STMaintCourierSortFrm := TSTMaintCourierSortFrm.Create(Self);
  try
    STMaintCourierSortFrm.sFuncMode := sTempFuncMode;
    STMaintCourierSortFrm.CourierCode := CourierCode;
    STMaintCourierSortFrm.CourierName := CourierName;
    STMaintCourierSortFrm.iCode := DetsSrc.DataSet.fieldbyname('Courier_Sort').asinteger;
    STMaintCourierSortFrm.DescrEdit.Text := DetsSrc.DataSet.fieldbyname('Sort_Description').asstring;
    STMaintCourierSortFrm.chkbxActive.Checked := (DetsSrc.DataSet.fieldbyname('inactive').asstring = 'N');
    STMaintCourierSortFrm.ShowModal;
    bTempOK := (STMaintCourierSortFrm.ModalResult = mrOK);
    iTempSel := STMaintCourierSortFrm.iCode;
  finally
    STMaintCourierSortFrm.Free;
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

procedure TSTLUCourierSortFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Courier_Sort').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
end;

procedure TSTLUCourierSortFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TSTLUCourierSortFrm.chkbxActiveOnlyClick(Sender: TObject);
begin
  showGrid(self);
end;

procedure TSTLUCourierSortFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(detsDBgrid.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

end.
