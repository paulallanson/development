(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up A VAT Code.

VSS Info:
$Header: /CCSCommon/CSLUVATCode.pas 1     10/01/:1 12:59 Paul $
$History: CSLUVATCode.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:59
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUVATCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, CSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUVATCodeFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
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
  private
    { Private declarations }
  public
    { Public declarations }
    sThisCode: string;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    iSelCode: Integer;
  end;

var
  CSLUVATCodeFrm: TCSLUVATCodeFrm;

implementation

uses CSMaintVATCode;

{$R *.DFM}

procedure TCSLUVATCodeFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a VAT Code';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain VAT Codes';
    SelectBitBtn.Visible := False;
  end;
  FuncGrpBox.Visible := (bAllow_Upd) and
    TestButton('VATCodesBitBtn');
  {Load up the string grid};
  ShowGrid(Self);
  if (iSelCode <> 0) then FindInGrid(iSelCode);
end;

procedure TCSLUVATCodeFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUVATCodeFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TCSLUVATCodeFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TCSLUVATCodeFrm.SelectCode(Sender: TObject);
begin
  iSelCode := DetsSRC.DataSet.FieldByName('VAT_Code').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  Selected := True;
  Close;
end;

procedure TCSLUVATCodeFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnClick(Self);
end;

procedure TCSLUVATCodeFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new VAT_Code};
  CallMaintScreen('A');
end;

procedure TCSLUVATCodeFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a VAT_Code};
  CallMaintScreen('C');
end;

procedure TCSLUVATCodeFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a VAT_Code};
  CallMaintScreen('D');
end;

procedure TCSLUVATCodeFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  CSMaintVATCodeFrm := TCSMaintVATCodeFrm.Create(Self);
  try
    CSMaintVATCodeFrm.sFuncMode := sTempFuncMode;
    CSMaintVATCodeFrm.ShowModal;
    bTempOK := (CSMaintVATCodeFrm.ModalResult = mrOK);
    iTempSel := CSMaintVATCodeFrm.iCode;
  finally
    CSMaintVATCodeFrm.Free;
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

procedure TCSLUVATCodeFrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('VAT_Code').AsInteger <> iTempSel) do
      Next;
  end;
end;

procedure TCSLUVATCodeFrm.FormCreate(Sender: TObject);
begin
  iSelCode := 0;
end;

end.
