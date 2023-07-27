(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Product Type Capabilities form.

VSS Info:
$Header: /PBL D5/PBMaintPrdTypCap.pas 12    20/06/03 9:53 Andrewh $
$History: PBMaintPrdTypCap.pas $
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 4/09/02    Time: 12:20
 * Updated in $/PBL D5
 * Last set of changes was a misunderstanding. Now completley removed.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 4/09/02    Time: 11:59
 * Updated in $/PBL D5
 * Maintain the DEFAULT FOR ALL capability.
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:19
 * Updated in $/PBL D5
 * Apply new ENQUIRE/NOTES security settings.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
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
*******************************************************************************)
unit PBMaintPrdTypCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintPrdTypCapFrm = class(TForm)
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
    PrdTypDescrEdit: TEdit;
    Label2: TLabel;
    qryZero: TFDQuery;
    chkbxActive: TCheckBox;
    DelSuppliers: TFDQuery;
    qryCheckPTCapExists: TFDQuery;
    qryCheckCapExists: TFDQuery;
    qryGetSuppliers: TFDQuery;
    qryAddSupplier: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure DescrEditChange(Sender: TObject);
  private
    bOriginalInactive: boolean;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DeleteSuppliers;
    function CheckPTCapabilityExists: boolean;
    function CheckCapabilityExists: boolean;
    procedure AddSuppliers;
  public
    sFuncMode: string[1];
    iCode, iPrdTyp: Integer;
    sPrdTypDesc: string;
  end;

var
  PBMaintPrdTypCapFrm: TPBMaintPrdTypCapFrm;

implementation

uses UITypes, PBLUPrdTypCap, ComObj, ActiveX, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintPrdTypCapFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new product type capability';
  if sFuncMode = 'C' then
    Caption := 'Change a product type capability';
  if sFuncMode = 'D' then
    Caption := 'Delete a product type capability';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    ChkBxActive.Checked := True;
    bOriginalInactive := false;
  end
  else
  begin
    with PBLUPrdTypCapFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Capability').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      ChkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
      bOriginalInactive := ChkBxActive.Checked;
    end;
  end;
  PrdTypDescrEdit.Text := sPrdTypDesc;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProductTypes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPrdTypCapFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintPrdTypCapFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPrdTypCapFrm.OKBitBtnClick(Sender: TObject);
var
  bDeleteSuppliers: boolean;
  bCheckExists: boolean;
begin
  if (sFuncMode[1] in ['C']) and (ChkBxActive.checked = false) and (ChkBxActive.checked <> bOriginalInactive) then
    begin
      if messagedlg('This capability has been made inactive, do you want to delete from all suppliers?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        bDeleteSuppliers := true;
    end;

  if sFuncMode[1] in ['A', 'C'] then
  begin
    bCheckExists := CheckPTCapabilityExists;

    if bCheckExists then
      begin
        messagedlg('This capability already exists for this product type.',mterror,[mbok],0) ;
        exit;
      end;

    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Product_Type').AsInteger := iPrdTyp;
      ParamByName('Capability').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';
      ExecSQL;
    end;

    if (sFuncMode = 'A') and (ChkBxActive.checked) and CheckCapabilityExists then
      begin
        if messagedlg('This capability exists for other product types. Do you want to add to the same suppliers?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            AddSuppliers;
          end;
      end;

    if bDeleteSuppliers then
      begin
        DeleteSuppliers;
      end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      try
        with DelSQL do
          begin
            Close;
            ParamByName('Product_Type').AsInteger := iPrdTyp;
            ParamByName('Capability').AsInteger := iCode;
            ExecSQL;
          end;
      except
        messagedlg('This capability has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
  end;
  {If replicating details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(11, iPrdTyp, iCode, 0, sFuncMode);
    end;
  ModalResult := mrOK;
end;

function TPBMaintPrdTypCapFrm.CheckPTCapabilityExists: boolean;
begin
  result := false;
  with qryCheckPTCapExists do
    begin
      close;
      parambyname('Product_Type').asinteger := iPrdTyp;
      paramByName('Capability').AsInteger := iCode;
      parambyname('Description').asstring := DescrEdit.text;
      open;
      result := (recordcount > 0);
    end;
end;

function TPBMaintPrdTypCapFrm.CheckCapabilityExists: boolean;
begin
  result := false;
  with qryCheckCapExists do
    begin
      close;
      parambyname('Product_Type').asinteger := iPrdTyp;
      parambyname('Description').asstring := DescrEdit.text;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TPBMaintPrdTypCapFrm.AddSuppliers;
begin
  with qryGetSuppliers do
    begin
      close;
      ParamByName('Product_Type').AsInteger := iPrdTyp;
      ParamByName('Description').Asstring := DescrEdit.text;
      open;

      while eof <> true do
        begin
          qryAddSupplier.close;
          qryAddSupplier.parambyname('Supplier').asinteger := qryGetSuppliers.fieldbyname('Supplier').asinteger;
          qryAddSupplier.parambyname('Branch_no').asinteger := qryGetSuppliers.fieldbyname('Branch_No').asinteger;
          qryAddSupplier.ParamByName('Product_Type').AsInteger := iPrdTyp;
          qryAddSupplier.ParamByName('Capability').AsInteger := iCode;
          qryAddSupplier.execsql;
          next;
        end;
    end;
end;

procedure TPBMaintPrdTypCapFrm.DeleteSuppliers;
begin
  with DelSuppliers do
    begin
      close;
      ParamByName('Product_Type').AsInteger := iPrdTyp;
      ParamByName('Capability').AsInteger := iCode;
      execSQL;
    end;
end;

procedure TPBMaintPrdTypCapFrm.DescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPrdTypCapFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Product_TypeCapability ' +
            '(Product_Type,Capability,Description) ' +
            'VALUES(' + IntToStr(iPrdTyp) + ', 0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintPrdTypCapFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Product_TypeCapability ' +
            'Where Product_Type=' + IntToStr(iPrdTyp) +
            'And Capability=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintPrdTypCapFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByname('Product_Type').AsInteger := iPrdTyp;
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
