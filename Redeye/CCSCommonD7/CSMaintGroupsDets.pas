(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Group Details.  Now uses new PBGroupsDM datamodule.

VSS Info:
$Header: /CCSCommon/CSMaintGroupsDets.pas 1     10/01/:1 13:01 Paul $
$History: CSMaintGroupsDets.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:01
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
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
unit CSMaintGroupsDets;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, CSGroupsDM;

type
  TCSMaintGroupsDetsFrm = class(TForm)
    DetsGroupBox: TGroupBox;
    edtDescription: TEdit;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DeleteLabel: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode, sDescrField, sDescrFieldName, sKeyField: string;
    sDescription: string;
    iCode: Integer;
  end;

var
  CSMaintGroupsDetsFrm: TCSMaintGroupsDetsFrm;

implementation

uses CSMaintGroups;

{$R *.DFM}

procedure TCSMaintGroupsDetsFrm.FormActivate(Sender: TObject);
begin
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
    edtDescription.Text := ''
  else
  begin
    edtDescription.Text := sDescription;
  end;
  CheckOK(Self);
end;

procedure TCSMaintGroupsDetsFrm.CheckOK(Sender: TObject);
begin
  OKBitBtn.Enabled := (Trim(edtDescription.Text) <> '');
end;

procedure TCSMaintGroupsDetsFrm.edtDescriptionChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintGroupsDetsFrm.OKBitBtnClick(Sender: TObject);
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
        SaveCustType(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Category' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextCategory;
      if sFuncMode = 'D' then
        DeleteCategory(iCode)
      else
        SaveCategory(iCode, edtDescription.Text);
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

procedure TCSMaintGroupsDetsFrm.FormCreate(Sender: TObject);
begin
  dmGroups := TdmGroups.Create(Self);
end;

procedure TCSMaintGroupsDetsFrm.FormDestroy(Sender: TObject);
begin
  dmGroups.Free;
end;

end.
