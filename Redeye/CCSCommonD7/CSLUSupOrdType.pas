(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Lookup a Branch form.

VSS Info:
$Header: /CCSCommon/CSLUSupOrdType.pas 1     14/03/:2 10:40 Paul $
$History: CSLUSupOrdType.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 14/03/:2   Time: 10:40
 * Created in $/CCSCommon
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 13/02/:2   Time: 12:27
 * Updated in $/CCSCommon
 * Updated to the latest 'Broker' versions
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 16/11/:0   Time: 12:25
 * Updated in $/PBL D5
 * Changed to display the Name, Phone and Fax numbers in a panel at the
 * foot of the form.
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:31
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 2/10/:0    Time: 11:54
 * Updated in $/PBL D5
 * Changed so that the Data grid was enabled even though the Head Office
 * check box was selected.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSLUSupOrdType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls, CSCommon,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSLUSupOrdTypeFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchTimer: TTimer;
    CloseBitBtn: TBitBtn;
    SuppLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    stsBrDets: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(sTempSel: string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    iSupp: Integer;
    SelCode, SelName, sSuppName: string;
    bIs_Lookup, bAllow_Upd, bSelected, bODueEnqsOnly: ByteBool;
    dODueDate: TDateTime;
  end;

var
  CSLUSupOrdTypeFrm: TCSLUSupOrdTypeFrm;

implementation

uses CSMaintSupOrdType;

{$R *.DFM}

procedure TCSLUSupOrdTypeFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  SuppLabel.Caption := 'Supplier: ' + sSuppName;
  {Load up the string grid};
  ShowGrid(Self);
  FindInGrid(SelCode);
end;

procedure TCSLUSupOrdTypeFrm.ShowGrid(Sender: TObject);
begin
  GetDetsSQL.Close;
  DetsSRC.DataSet := GetDetsSQL;
  with GetDetsSQL do
    begin
      Close;
      parambyname('Supplier').asinteger := iSupp;
    end;
  with DetsSRC.DataSet do
  begin
    Open;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    stsBrDets.Panels[0].text := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TCSLUSupOrdTypeFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TCSLUSupOrdTypeFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Supp_Order_type').asstring;
  SelName := DetsSRC.DataSet.FieldByName('Supp_Order_Desc').AsString;
  bSelected := True;
  Close;
end;

procedure TCSLUSupOrdTypeFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TCSLUSupOrdTypeFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Supplier};
  CallMaintScreen('A');
end;

procedure TCSLUSupOrdTypeFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Supplier};
  CallMaintScreen('C');
end;

procedure TCSLUSupOrdTypeFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Supplier};
  CallMaintScreen('D');
end;

procedure TCSLUSupOrdTypeFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  sTempSel: string;
begin
  CSMaintSupOrdTypeFrm := TCSMaintSupOrdTypeFrm.Create(Self);
  try
    CSMaintSupOrdTypeFrm.sFuncMode := sTempFuncMode;
    CSMaintSupOrdTypeFrm.iSupp := iSupp;
    CSMaintSupOrdTypeFrm.sSuppName := sSuppName;
    CSMaintSupOrdTypeFrm.ShowModal;
    bTempOK := (CSMaintSupOrdTypeFrm.ModalResult = mrOK);
    sTempSel := CSMaintSupOrdTypeFrm.sCode;
  finally
    CSMaintSupOrdTypeFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(sTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TCSLUSupOrdTypeFrm.FindInGrid(sTempSel: string);
begin
  {Find the item you just changed};
  with DetsSRC.DataSet do
  begin
    First;
    if sTempSel = '' then Exit;
    while (not (EOF)) and (FieldByName('Supp_Order_type').Asstring <> sTempSel) do
      Next;
  end;
end;

procedure TCSLUSupOrdTypeFrm.FormCreate(Sender: TObject);
begin
  SelCode := '';
  bDisableNameChangeEvent := False;
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

end.
