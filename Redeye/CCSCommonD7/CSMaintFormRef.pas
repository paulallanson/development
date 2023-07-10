(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Form Reference.

VSS Info:
$Header: /CCSCommon/CSMaintFormRef.pas 1     10/01/:1 13:01 Paul $
$History: CSMaintFormRef.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:01
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 17/02/:0   Time: 11:51
 * Updated in $/PBL D5
 * Changed to correctly check whether the Form Reference ID  currently
 * exists
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 3/02/:0    Time: 16:45
 * Updated in $/PBL D5
 * New insert method to ensure unique keys when adding records.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintFormRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables;

type
  TCSMaintFormRefFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    CustNameEdit: TEdit;
    BranchNameEdit: TEdit;
    GetBranchNameSQL: TQuery;
    GetContTypesSQL: TQuery;
    ContTypesSRC: TDataSource;
    Label6: TLabel;
    RefIDEdit: TEdit;
    RefDescrEdit: TEdit;
    Label8: TLabel;
    MaxSQL: TQuery;
    GetLastSQL: TQuery;
    ChkBoxStockedItem: TCheckBox;
    CheckFormRefSQL: TQuery;
    qryZero: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure RefIDEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure RefDescrEditChange(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch: Integer;
    sCustName, sBranchName: string;
  end;

var
  CSMaintFormRefFrm: TCSMaintFormRefFrm;
  sFormRef: string[20];

implementation

uses CSLUCust, CSMaintBranch, CSLUBranch, CSLUCConta, CSLUFormRef,
     ComObj, ActiveX;

{$R *.DFM}

procedure TCSMaintFormRefFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL}
  GetContTypesSQL.Close;
  GetContTypesSQL.Open;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Form Reference';
  if sFuncMode = 'C' then
    Caption := 'Change a Form Reference Description';
  if sFuncMode = 'D' then
    Caption := 'Delete a Form Reference';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    RefDescrEdit.Text := '';
    RefIDEdit.Text := '';
  end
  else
  begin
    with CSLUFormRefFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Form_Reference').AsInteger;
      RefDescrEdit.Text := Trim(FieldByName('Form_Reference_Descr').AsString);
      RefIDEdit.Text := Trim(FieldByName('Form_Reference_ID').AsString);
      sFormRef := Trim(FieldByName('Form_Reference_ID').AsString);
      ChkBoxStockedItem.Checked := (FieldByName('Stocked_Item').AsString) = 'Y';
    end;
  end;
  CustNameEdit.Text := sCustName;
  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  if sFuncMode <> 'D' then
    RefIDEdit.SetFocus;
end;

procedure TCSMaintFormRefFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (Trim(RefDescrEdit.Text) <> '') and
    (Trim(RefIDEdit.Text) <> '');
end;

procedure TCSMaintFormRefFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintFormRefFrm.RefDescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintFormRefFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A','C'] then
  begin
    with CheckFormRefSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Form_Reference_ID').AsString := Trim(RefIDEdit.Text) + '';
      Open;
      if RecordCount > 0 then
      begin
        if (icode <> fieldbyname('Form_reference').asinteger) then
           begin
           MessageDlg('There is already a Form Reference with this ' +
           'Customer/Branch/ID', mtConfirmation, [mbOK], 0);
           Exit;
           end;
      end;
    end;
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Form_Reference').AsInteger := iCode;
      ParamByName('Form_Reference_Descr').AsString :=
        Trim(RefDescrEdit.Text) + ' ';
      ParamByName('Form_Reference_ID').AsString :=
        Trim(RefIDEdit.Text) + ' ';
      if ChkBoxStockedItem.Checked then
        ParamByName('Stocked_Item').AsString := 'Y'
      else
        ParamByName('Stocked_Item').AsString := 'N';
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('Form_Reference').AsInteger := iCode;
      ExecSQL;
    end;
  end;
  ModalResult := mrOK;
end;

procedure TCSMaintFormRefFrm.RefIDEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintFormRefFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Form_Reference ' +
            '(Customer,Branch_No,Form_Reference, ' +
            'Form_Reference_Descr,Form_Reference_ID,Stocked_Item) ' +
            'VALUES(' + IntToStr(iCust) + ',' + IntToStr(iBranch) + ',0, ' +
            '''Dummy'',''Dummy'',''N'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TCSMaintFormRefFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Form_Reference WHERE Form_Reference=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TCSMaintFormRefFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByname('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Form_Reference').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.

