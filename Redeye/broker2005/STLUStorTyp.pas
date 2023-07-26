(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look up store type.

VSS Info:
$Header: /Broker Stock/STLUStorTyp.pas 2     28/11/00 15:59 Davidn $
$History: STLUStorTyp.pas $
 * 
 * *****************  Version 2  *****************
 * User: Davidn       Date: 28/11/00   Time: 15:59
 * Updated in $/Broker Stock
 * Checking fonts, button & tab order, and glyphs.
*******************************************************************************)
unit STLUStorTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTLUStorTypFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    SearchTimer: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: String);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure SelectCode(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool ;
  public
    { Public declarations }
    iSelCode: Integer ;
    SelName: String ;
    bIs_Lookup, bAllow_Upd,Selected: ByteBool ;
  end;

  var
  STLUStorTypFrm: TSTLUStorTypFrm;

implementation

uses STMntStorTyp, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TSTLUStorTypFrm.FormActivate(Sender: TObject);
begin
  Selected := False ;
  If bIs_Lookup = True then
    begin
    Caption := 'Lookup a Store Type' ;
    SelectBitBtn.Visible := True ;
    end
  else
    begin
    Caption := 'Maintain Store Types' ;
    SelectBitBtn.Visible := False ;
    end;
  NameEdit.Text := '' ;
  {Load up the string grid} ;
  ShowGrid(Self) ;
  NameEdit.SetFocus ;
  if (iSelCode <> 0) then FindInGrid(iSelCode) ;
  dmBroker.ScreenAccessControl(Self,'mnuStoreTypes',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TSTLUStorTypFrm.ShowGrid(Sender: TObject);
begin
With GetDetsSQL do
     begin
     Close ;
     ParamByName('Code_From').AsString := NameEdit.Text + '%' ;
     Open ;
     SelectBitBtn.Enabled := RecordCount > 0 ;
     ChgBitBtn.Enabled := RecordCount > 0 ;
     DelBitBtn.Enabled := RecordCount > 0 ;
     CountLabel.Caption := IntToStr(RecordCount) + ' items' ;
     end;
end;

procedure TSTLUStorTypFrm.NameEditChange(Sender: TObject);
begin
If bDisableNameChangeEvent = True then exit ;
SearchTimer.Enabled := False ;
SearchTimer.Enabled := True ;
end;

procedure TSTLUStorTypFrm.SearchTimerTimer(Sender: TObject);
begin
SearchTimer.Enabled := False ;
ShowGrid(Self) ;
end;

procedure TSTLUStorTypFrm.DetsDBGridColEnter(Sender: TObject);
begin
{Item selected, enable OK button} ;
SelectBitBtn.Enabled := True ;
end;

procedure TSTLUStorTypFrm.SelectBitBtnClick(Sender: TObject);
begin
{SelectCode(Self)} ;
Close ;
end;

procedure TSTLUStorTypFrm.DetsDBGridDblClick(Sender: TObject);
begin
If bIs_Lookup = True then
   begin
   {SelectCode(Self)}
   end
   else
      chgbitbtnclick(self);
end;

procedure TSTLUStorTypFrm.AddBitBtnClick(Sender: TObject);
begin
{Add a new Rep} ;
CallMaintScreen('A') ;
end;

procedure TSTLUStorTypFrm.ChgBitBtnClick(Sender: TObject);
begin
{Change a Rep} ;
CallMaintScreen('C');
end;

procedure TSTLUStorTypFrm.DelBitBtnClick(Sender: TObject);
begin
{Delete a Rep} ;
CallMaintScreen('D') ;
end;

procedure TSTLUStorTypFrm.CallMaintScreen(sTempFuncMode: String);
Var
bTempOK: ByteBool ;
iTempSel: Integer ;
begin
STMntStorTypFrm := TSTMntStorTypFrm.Create(self) ;
STMntStorTypFrm.sFuncMode := sTempFuncMode ;
STMntStorTypFrm.ShowModal ;
bTempOK := (STMntStorTypFrm.ModalResult = mrOK) ;
iTempSel := STMntStorTypFrm.iCode ;
STMntStorTypFrm.Free ;
If bTempOK = True then
   begin
   ShowGrid(Self) ;
   If sTempFuncMode <> 'D' then
      begin
      FindInGrid(iTempSel) ;
      If bIs_Lookup = True then
         SelectCode(Self) ;
      end;
   NameEdit.SetFocus ;
   end;
end;

procedure TSTLUStorTypFrm.FindInGrid(iTempSel: Integer);
begin
{Find the item you just changed} ;
With DetsSRC.DataSet do
     begin
     First ;
     If iTempSel = 0 then exit ;
     While (EOF = False) and (FieldByName('Part_Store_Type').AsInteger <> iTempSel) do
           Next ;
     end;
end;

procedure TSTLUStorTypFrm.FormCreate(Sender: TObject);
begin
iSelCode := 0 ;
bDisableNameChangeEvent := False ;
end;

procedure TSTLUStorTypFrm.SelectCode(Sender: TObject);
begin
iSelCode := DetsSRC.DataSet.FieldByName('Part_Store_Type').AsInteger ;
SelName := DetsSRC.DataSet.FieldByName('Part_Store_Type_Name').AsString ;
Selected := True ;
Close ;
end;

end.
