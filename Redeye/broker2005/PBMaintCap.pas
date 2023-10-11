{*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Product Type Questions form.

VSS Info:
$Header: /PBL D5/PBMaintCap.pas 5     20/06/03 9:53 Andrewh $
$History: PBMaintCap.pas $
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 24/09/02   Time: 10:52
 * Updated in $/PBL D5
 * New capabilities maintenance program.
 * 
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 24/09/02   Time: 10:31
 * Created in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 12/09/02   Time: 16:31
 * Updated in $/PBL D5
 * New questions lookup and maintenance now working.
 *
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 12/09/02   Time: 15:23
 * Created in $/PBL D5
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:19
 * Updated in $/PBL D5
 * Apply new ENQUIRE/NOTES security settings.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 22/02/:2   Time: 15:31
 * Updated in $/PBL D5
 * Now prompts for a prompt type which can be a Checkbox, List box, combo,
 * edit box etc.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 29/06/:0   Time: 14:41
 * Updated in $/PBL D5
 * Introduced a Sequence reference number used to control the display of
 * the questions in Enquiry and PO
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 13:03
 * Updated in $/PBL D5
 * Use new insert method and GUIDs to ensure unique keys when adding.  Fix
 * bug in PBMaintPrdTyp where subsidiary records in Capabilities and
 * Questions weren't being deleted causing FK restraint violation.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************}
unit PBMaintCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCapFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    TextEdit: TEdit;
    qryZero: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure TextEditChange(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  PBMaintCapFrm: TPBMaintCapFrm;

implementation

uses
  System.UITypes,
  PBDatabase, PBLUQuestn,ComObj, ActiveX, PBLUPrdTypQuList, PBLUCap,
  pbMainMenu;

{$R *.DFM}

procedure TPBMaintCapFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Capability';
  if sFuncMode = 'C' then
    Caption := 'Change a Capability';
  if sFuncMode = 'D' then
    Caption := 'Delete a Capability';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    TextEdit.Text := '';
  end
  else
  begin
    with PBLUCapFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Capability').AsInteger;
      TextEdit.Text := FieldByName('Description').AsString;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProductTypeUtils',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCapFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (TextEdit.Text <> '');
end;

procedure TPBMaintCapFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCapFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Capability').AsInteger := iCode;
      ParamByName('Description').AsString := TextEdit.Text + '';
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
        ParamByName('Capability').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;


procedure TPBMaintCapFrm.TextEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCapFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Capability ' +
            '(Capability,Description) ' +
            'VALUES(0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCapFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Capability Where Capability=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintCapFrm.GetNextKey: integer;
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
      Result := FieldByName('Capability').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.

