(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
Product Group Look up unit.

VSS Info:
$Header: /Broker Stock/STLUPrtGrp.pas 3     28/11/00 11:01 Davidn $
$History: STLUPrtGrp.pas $
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 28/11/00   Time: 11:01
 * Updated in $/Broker Stock
 * Modified font, tab order, shortcut keys, button arrangement.
*******************************************************************************)
unit STLUPrtGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTLUPrtGrpFrm = class(TForm)
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
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: String);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
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
  STLUPrtGrpFrm: TSTLUPrtGrpFrm;

implementation

uses STMntPrtGrp, pbDatabase, pbMainMenu;


{$R *.DFM}

procedure TSTLUPrtGrpFrm.FormActivate(Sender: TObject);
begin
  Selected := False ;
  If bIs_Lookup = True then
    begin
    Caption := 'Lookup a Product Group' ;
    SelectBitBtn.Visible := True ;
    end
  else
    begin
    Caption := 'Maintain Product Groups' ;
    SelectBitBtn.Visible := False ;
    end;
  NameEdit.Text := '' ;
  {Load up the string grid} ;
  ShowGrid(Self) ;
  NameEdit.SetFocus ;
  if (iSelCode <> 0) then FindInGrid(iSelCode) ;
  dmBroker.ScreenAccessControl(Self,'mnuProductGroups',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TSTLUPrtGrpFrm.ShowGrid(Sender: TObject);
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

procedure TSTLUPrtGrpFrm.NameEditChange(Sender: TObject);
begin
If bDisableNameChangeEvent = True then exit ;
SearchTimer.Enabled := False ;
SearchTimer.Enabled := True ;
end;

procedure TSTLUPrtGrpFrm.SearchTimerTimer(Sender: TObject);
begin
SearchTimer.Enabled := False ;
ShowGrid(Self) ;
end;

procedure TSTLUPrtGrpFrm.DetsDBGridColEnter(Sender: TObject);
begin
{Item selected, enable OK button} ;
SelectBitBtn.Enabled := True ;
end;

procedure TSTLUPrtGrpFrm.SelectBitBtnClick(Sender: TObject);
begin
SelectCode(Self) ;
Close ;
end;

procedure TSTLUPrtGrpFrm.SelectCode(Sender: TObject);
begin
iSelCode := DetsSRC.DataSet.FieldByName('Part_Group').AsInteger ;
SelName := DetsSRC.DataSet.FieldByName('Part_Group_Descr').AsString ;
Selected := True ;
Close ;
end;

procedure TSTLUPrtGrpFrm.DetsDBGridDblClick(Sender: TObject);
begin
If bIs_Lookup = True then
   begin
   SelectCode(Self)
   end
   else
      chgbitbtnclick(self);
end;

procedure TSTLUPrtGrpFrm.AddBitBtnClick(Sender: TObject);
begin
{Add a new Rep} ;
CallMaintScreen('A') ;
end;

procedure TSTLUPrtGrpFrm.ChgBitBtnClick(Sender: TObject);
begin
{Change a Rep} ;
CallMaintScreen('C');
end;

procedure TSTLUPrtGrpFrm.DelBitBtnClick(Sender: TObject);
begin
{Delete a Rep} ;
CallMaintScreen('D') ;
end;

procedure TSTLUPrtGrpFrm.CallMaintScreen(sTempFuncMode: String);
Var
bTempOK: ByteBool ;
iTempSel: Integer ;
begin
STMntPrtGrpFrm := TSTMntPrtGrpFrm.Create(self) ;
STMntPrtGrpFrm.sFuncMode := sTempFuncMode ;
STMntPrtGrpFrm.ShowModal ;
bTempOK := (STMntPrtGrpFrm.ModalResult = mrOK) ;
iTempSel := STMntPrtGrpFrm.iCode ;
STMntPrtGrpFrm.Free ;
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

procedure TSTLUPrtGrpFrm.FindInGrid(iTempSel: Integer);
begin
{Find the item you just changed} ;
With DetsSRC.DataSet do
     begin
     First ;
     If iTempSel = 0 then exit ;
     While (EOF = False) and (FieldByName('Part_Group').AsInteger <> iTempSel) do
           Next ;
     end;
end;

procedure TSTLUPrtGrpFrm.FormCreate(Sender: TObject);
begin
iSelCode := 0 ;
bDisableNameChangeEvent := False ;
end;

end.
