(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look up Special Instructions.

VSS Info:
$Header: /PBL D5/PBLUSpecIns.pas 13    20/06/03 9:53 Andrewh $
$History: PBLUSpecIns.pas $
 * 
 * *****************  Version 13  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 17/01/:2   Time: 15:29
 * Updated in $/PBL D5
 * Don't allow select in general maintenance routine from database menu.
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 17/01/:2   Time: 10:14
 * Updated in $/PBL D5
 * ensure function keys have glyphs.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 21/03/:0   Time: 12:32
 * Updated in $/PBL D5
 * Changed to allow maintenance of short special instructions
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 11/02/:0   Time: 16:53
 * Updated in $/PBL D5
 * Changed to include a Select button and on Selection the Narrative Code
 * is returned.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 9/02/:0    Time: 10:22
 * Updated in $/PBL D5
 * Use new insert method and GUIDs to ensure unique keys when adding. 

*******************************************************************************)
unit PBLUSpecIns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, StdCtrls, Buttons, Grids, DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUSpecInsFrm = class(TForm)
    CountLabel: TLabel;
    DetsDBGrid: TDBGrid;
    CloseBitBtn: TBitBtn;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure FindInGrid(iTempSel: Integer);
    procedure SelectCode(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure DelBitBtnClick(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
  public
    iCode, iNarr, SelCode: Integer;
    Selname: string;
    SelNarrative: integer;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    sFuncMode: string[1];
  end;

var
  PBLUSpecInsFrm              : TPBLUSpecInsFrm;

implementation

uses PBMaintSpecIns, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUSpecInsFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup Special Instructions';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Special Instructions';
    SelectBitBtn.Visible := False;
  end;
 FuncGrpBox.Visible := (bAllow_Upd = True) ;
  {Load up the string grid};
  ShowGrid(Self);
  if (SelCode <> 0) then FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuSpecialInst',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBLUSpecInsFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    Open;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUSpecInsFrm.AddBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TPBLUSpecInsFrm.ChgBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TPBLUSpecInsFrm.FindInGrid(iTempSel: Integer);
begin
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (EOF = False) and (FieldByName('Special_Instruction').AsInteger <>
      iTempSel) do
      Next;
  end;
end;

procedure TPBLUSpecInsFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Special_Instruction').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  SelNarrative := DetsSRC.DataSet.FieldByName('narrative').Asinteger;
  Selected := True;
  Close;
end;

procedure TPBLUSpecInsFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK                     : ByteBool;
  iTempSel                    : Integer;
begin
  PBMaintSpecInsFrm := TPBMaintSpecInsFrm.Create(Self);
  PBMaintSpecInsFrm.sFuncMode := sTempFuncMode;
  PBMaintSpecInsFrm.NarrativeEdit.Text :=
    DetsSRC.DataSet.FieldByName('Description').AsString;
  PBMaintSpecInsFrm.iCode :=
    DetsSRC.DataSet.FieldByName('Special_Instruction').AsInteger;
  PBMaintSpecInsFrm.inarr := DetsSRC.DataSet.FieldByName('narrative').AsInteger;
  PBMaintSpecInsFrm.ShowModal;
  bTempOK := (PBMaintSpecInsFrm.ModalResult = mrOK);
  iTempSel := PBMaintSpecInsFrm.icode;
  PBMaintSpecInsFrm.Free;
  if bTempOK = True then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup = True then
        SelectCode(Self);
    end;
  end;
end;

procedure TPBLUSpecInsFrm.DelBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TPBLUSpecInsFrm.DetsDBGridDblClick(Sender: TObject);
begin
  ChgBitBtnClick(Sender);
end;

procedure TPBLUSpecInsFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(self);
end;

end.

