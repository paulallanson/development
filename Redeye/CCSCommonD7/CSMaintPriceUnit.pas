(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Price Units.

VSS Info:
$Header: /CCSCommon/CSMaintPriceUnit.pas 1     14/03/:2 12:26 Paul $
$History: CSMaintPriceUnit.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 14/03/:2   Time: 12:26
 * Created in $/CCSCommon
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 14:57
 * Updated in $/PBL D5
 * Change field Price_Unit from char to integer so we can have more than 9
 * price units.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintPriceUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintPriceUnitFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    UnitFactorEdit: TEdit;
    Label2: TLabel;
    DetsSRC: TDataSource;
    ShowOnDocsCheckBox: TCheckBox;
    qryZero: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  CSMaintPriceUnitFrm: TCSMaintPriceUnitFrm;

implementation

uses CSLUPriceUnit, ComObj, ActiveX;

{$R *.DFM}

procedure TCSMaintPriceUnitFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new price unit';
  if sFuncMode = 'C' then
    Caption := 'Change a price unit';
  if sFuncMode = 'D' then
    Caption := 'Delete a price unit';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    UnitFactorEdit.Text := '';
  end
  else
  begin
    with CSLUPriceUnitFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Price_Unit').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      UnitFactorEdit.Text := FieldByName('Price_Unit_Factor').AsString;
      ShowOnDocsCheckBox.Checked := (FieldByName('Show_On_Report').AsString =
        'Y');
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
end;

procedure TCSMaintPriceUnitFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
    (UnitFactorEdit.Text <> '');
end;

procedure TCSMaintPriceUnitFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintPriceUnitFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintPriceUnitFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintPriceUnitFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      if ShowOnDocsCheckBox.Checked then
        ParamByName('Show_On_Report').AsString := 'Y'
      else
        ParamByName('Show_On_Report').AsString := 'N';
      ParamByName('Price_Unit').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ParamByName('Price_Unit_Factor').AsFloat :=
        StrToFloatDef(UnitFactorEdit.Text, 0, FormatSettings);
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Price_unit').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TCSMaintPriceUnitFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintPriceUnitFrm.UnitFactorEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TCSMaintPriceUnitFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Price_Unit ' +
            '(Price_Unit,Description,Price_Unit_Factor,Show_On_Report) ' +
            'VALUES(''0'',''Dummy'',0,''N'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintPriceUnitFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Price_Unit Where Price_Unit=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TCSMaintPriceUnitFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Price_Unit').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
