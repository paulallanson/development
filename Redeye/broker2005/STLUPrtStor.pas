(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look up Store.

VSS Info:
$Header: /Broker Stock/STLUPrtStor.pas 3     28/11/00 16:05 Davidn $
$History: STLUPrtStor.pas $
 *
 * *****************  Version 3  *****************
 * User: Davidn       Date: 28/11/00   Time: 16:05
 * Updated in $/Broker Stock
 * Added VSS section to top of unit and checked fonts, tab order, button
 * order, and glyphs.

*******************************************************************************)
unit STLUPrtStor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TSTLUPrtStorFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
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
    BinsBitBtn: TBitBtn;
    chkbxActiveOnly: TCheckBox;
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
    procedure BinsBitBtnClick(Sender: TObject);
    procedure CheckBinsButton(Sender: TObject);
    procedure DetsSRCDataChange(Sender: TObject; Field: TField);
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
  STLUPrtStorFrm: TSTLUPrtStorFrm;

implementation

uses STMntPrtStor, STMntPrtBin, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TSTLUPrtStorFrm.FormActivate(Sender: TObject);
begin
Selected := False ;
If bIs_Lookup = True then
   begin
   Caption := 'Lookup a Product Store' ;
   SelectBitBtn.Visible := True ;
   end
else
   begin
   Caption := 'Maintain Product Stores' ;
   SelectBitBtn.Visible := False ;
   end;
NameEdit.Text := '' ;
{Load up the string grid} ;
ShowGrid(Self) ;
NameEdit.SetFocus ;
if (iSelCode <> 0) then FindInGrid(iSelCode) ;
  dmBroker.ScreenAccessControl(Self,'mnuStores',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TSTLUPrtStorFrm.ShowGrid(Sender: TObject);
begin
With GetDetsSQL do
     begin
     Close ;
     ParamByName('Code_From').AsString := NameEdit.Text + '%' ;
     if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
     else
      ParamByName('inactive').AsString := 'Y';
     Open ;
     SelectBitBtn.Enabled := RecordCount > 0 ;
     ChgBitBtn.Enabled := RecordCount > 0 ;
     CheckBinsButton(Self) ;
     DelBitBtn.Enabled := RecordCount > 0 ;
     CountLabel.Caption := IntToStr(RecordCount) + ' items' ;
     end;
end;

procedure TSTLUPrtStorFrm.NameEditChange(Sender: TObject);
begin
If bDisableNameChangeEvent = True then exit ;
SearchTimer.Enabled := False ;
SearchTimer.Enabled := True ;
end;

procedure TSTLUPrtStorFrm.SearchTimerTimer(Sender: TObject);
begin
SearchTimer.Enabled := False ;
ShowGrid(Self) ;
end;

procedure TSTLUPrtStorFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button} ;
  SelectBitBtn.Enabled := True ;
end;

procedure TSTLUPrtStorFrm.SelectBitBtnClick(Sender: TObject);
begin
SelectCode(Self) ;
Close ;
end;

procedure TSTLUPrtStorFrm.SelectCode(Sender: TObject);
begin
iSelCode := DetsSRC.DataSet.FieldByName('Part_Store').AsInteger ;
SelName := DetsSRC.DataSet.FieldByName('Part_Store_Name').AsString ;
Selected := True ;
Close ;
end;

procedure TSTLUPrtStorFrm.DetsDBGridDblClick(Sender: TObject);
begin
If bIs_Lookup = True then
   begin
   SelectCode(Self)
   end
   else
      chgbitbtnclick(self);
end;

procedure TSTLUPrtStorFrm.AddBitBtnClick(Sender: TObject);
begin
{Add a new Rep} ;
CallMaintScreen('A') ;
end;

procedure TSTLUPrtStorFrm.ChgBitBtnClick(Sender: TObject);
begin
{Change a Rep} ;
CallMaintScreen('C');
end;

procedure TSTLUPrtStorFrm.DelBitBtnClick(Sender: TObject);
begin
{Delete a Rep} ;
CallMaintScreen('D') ;
end;

procedure TSTLUPrtStorFrm.CallMaintScreen(sTempFuncMode: String);
Var
bTempOK: ByteBool ;
iTempSel: Integer ;
begin
STMntPrtStorFrm := TSTMntPrtStorFrm.Create(self) ;
STMntPrtStorFrm.sFuncMode := sTempFuncMode ;
STMntPrtStorFrm.ShowModal ;
bTempOK := (STMntPrtStorFrm.ModalResult = mrOK) ;
iTempSel := STMntPrtStorFrm.iCode ;
STMntPrtStorFrm.Free ;
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

procedure TSTLUPrtStorFrm.FindInGrid(iTempSel: Integer);
begin
{Find the item you just changed} ;
With DetsSRC.DataSet do
     begin
     First ;
     If iTempSel = 0 then exit ;
     While (EOF = False) and (FieldByName('Part_Store').AsInteger <> iTempSel) do
           Next ;
     end;
end;

procedure TSTLUPrtStorFrm.FormCreate(Sender: TObject);
begin
iSelCode := 0 ;
bDisableNameChangeEvent := False ;
end;

procedure TSTLUPrtStorFrm.BinsBitBtnClick(Sender: TObject);
begin
STMntPrtBinFrm := TSTMntPrtBinFrm.Create(self) ;
Try
   STMntPrtBinFrm.iStore := DetsDBGrid.DataSource.DataSet.FieldByName('Part_Store').AsInteger ;
   STMntPrtBinFrm.sStoreName := DetsDBGrid.DataSource.DataSet.FieldByName('Part_Store_Name').AsString ;
   STMntPrtBinFrm.bAllow_Upd := True ;
   STMntPrtBinFrm.ShowModal ;
Finally
       STMntPrtBinFrm.Free ;
   end; 
end;

procedure TSTLUPrtStorFrm.CheckBinsButton(Sender: TObject);
begin
With DetsSRC.DataSet do
     BinsBitBtn.Enabled := (RecordCount > 0) and (FieldByName('Stock_Bins_In_Use').AsString = 'Y') ;
end;

procedure TSTLUPrtStorFrm.DetsSRCDataChange(Sender: TObject;
  Field: TField);
begin
CheckBinsButton(Self) ;
end;

end.
