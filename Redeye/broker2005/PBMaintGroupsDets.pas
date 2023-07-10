(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Group Details.  Now uses new PBGroupsDM datamodule.

VSS Info:
$Header: /PBL D5/PBMaintGroupsDets.pas 10    20/06/03 9:53 Andrewh $
$History: PBMaintGroupsDets.pas $
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:28
 * Updated in $/PBL D5
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:05
 * Updated in $/PBL D5
 * Added the functionality to handle the maintainance of contact Levels.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 15/02/:0   Time: 12:30
 * Updated in $/PBL D5
 * Added functionality to maintain Paper Colour, Weight, Brands and
 * Materials
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 3/02/:0    Time: 14:10
 * Updated in $/PBL D5
 * Add new unit PBGroupsDM to project uses clause.  Use new insert method
 * to guarantee unique keys when adding to tables.  Move all queries out
 * of PBMaintGroupsDets into new datamodule PBGroupsDM.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBMaintGroupsDets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBTables, PBGroupsDM, ExtCtrls;

type
  TPBMaintGroupsDetsFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DeleteLabel: TLabel;
    DetsGroupBox: TGroupBox;
    Label1: TLabel;
    edtDescription: TEdit;
    ColorDialog1: TColorDialog;
    pnlCommission: TPanel;
    Label3: TLabel;
    MemoCommRt: TMemo;
    pnlColor: TPanel;
    Label2: TLabel;
    edtColor: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode, sDescrField, sDescrFieldName, sKeyField, sCommRt: string;
    Color, FontColor: integer;
    sDescription: string;
    iCode: Integer;
  end;

var
  PBMaintGroupsDetsFrm: TPBMaintGroupsDetsFrm;

implementation

uses pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintGroupsDetsFrm.FormActivate(Sender: TObject);
begin
  if sKeyField <> 'Category' then
  begin
    pnlCommission.visible := false;
(*    DeleteLabel.Top := 72;
    OKBitBtn.Top := 72 ;
    CancelBitBtn.Top := 72;
    PBMaintGroupsDetsFrm.height := 130;
*)
  end;

  pnlColor.visible := (sKeyField = 'Customer_Type');

  if sFuncMode = 'A' then
    Caption := 'Add a new ' + sDescrFieldName
  else
  if sFuncMode = 'C' then
    Caption := 'Change a ' + sDescrFieldName
  else
  if sFuncMode = 'D' then
    Caption := 'Delete a ' + sDescrFieldName;
  DetsGroupBox.Enabled := (sFuncMode <> 'D');
  DeleteLabel.Visible := (sFuncMode = 'D');
  if sFuncMode = 'A' then
    begin
      edtDescription.Text := '';
      MemoCommRt.Lines[0] := '0';
    end
  else
  begin
    edtDescription.Text := sDescription;
    if Color <> 0 then
      begin
        edtColor.Color := Color;
        edtColor.Font.Color := FontColor;
      end;
      
    MemoCommRt.Lines[0] := sCommRt;
  end;
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuGeneralCats',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintGroupsDetsFrm.CheckOK(Sender: TObject);
begin
  OKBitBtn.Enabled := (Trim(edtDescription.Text) <> '');
end;

procedure TPBMaintGroupsDetsFrm.edtDescriptionChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintGroupsDetsFrm.OKBitBtnClick(Sender: TObject);
begin
  with dmGroups do
  begin
    if sKeyField = 'Customer_Type' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextCustType;
      if sFuncMode = 'D' then
        DeleteCustType(iCode)
      else
        SaveCustType(iCode, edtDescription.Text, edtColor.Color, edtColor.Font.color);

      {If replicating Customer Type details then save details to Replicate_Entity table}
      if dmBroker.GetReplicateDBAlias <> '' then
        begin
          dmBroker.AddReplicateEntity(14, iCode, 0, 0, sFuncMode);
        end;

    end
    else
    if sKeyField = 'Category' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextCategory;
      if sFuncMode = 'D' then
        DeleteCategory(iCode)
      else
        SaveCategory(iCode, edtDescription.Text, StrToFloat(memoCommRt.Lines[0]));

      {If replicating Category details then save details to Replicate_Entity table}
      if dmBroker.GetReplicateDBAlias <> '' then
        begin
          dmBroker.AddReplicateEntity(6, iCode, 0, 0, sFuncMode);
        end;
    end
    else
    if sKeyField = 'Contact_Type' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextContactType;
      if sFuncMode = 'D' then
        DeleteContactType(iCode)
      else
        SaveContactType(iCode, edtDescription.Text);

      {If replicating Contact Type details then save details to Replicate_Entity table}
      if dmBroker.GetReplicateDBAlias <> '' then
        begin
          dmBroker.AddReplicateEntity(9, iCode, 0, 0, sFuncMode);
        end;
    end
    else
    if sKeyField = 'Contact_Level' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextContactLevel;
      if sFuncMode = 'D' then
        DeleteContactLevel(iCode)
      else
        SaveContactLevel(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Currency_Code' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextCurrency;
      if sFuncMode = 'D' then
        DeleteCurrency(iCode)
      else
        SaveCurrency(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Intrastat_Id' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextIntrastat;
      if sFuncMode = 'D' then
        DeleteIntrastat(iCode)
      else
        SaveIntrastat(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Paper_Colour' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextColour;
      if sFuncMode = 'D' then
        DeleteColour(iCode)
      else
        SaveColour(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Paper_Weight' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextWeight;
      if sFuncMode = 'D' then
        DeleteWeight(iCode)
      else
        SaveWeight(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Paper_Brand' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextBrand;
      if sFuncMode = 'D' then
        DeleteBrand(iCode)
      else
        SaveBrand(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Paper_Material' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextMaterial;
      if sFuncMode = 'D' then
        DeleteMaterial(iCode)
      else
        SaveMaterial(iCode, edtDescription.Text);
    end;
  end;  { with dmGroups }
end;

procedure TPBMaintGroupsDetsFrm.FormCreate(Sender: TObject);
begin
  dmGroups := TdmGroups.Create(Self);
end;

procedure TPBMaintGroupsDetsFrm.FormDestroy(Sender: TObject);
begin
  dmGroups.Free;
end;

procedure TPBMaintGroupsDetsFrm.CheckKeyIsNumber(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintGroupsDetsFrm.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.Color := ColorDialog1.Color;

end;

procedure TPBMaintGroupsDetsFrm.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.font.Color := ColorDialog1.Color;
end;

end.
