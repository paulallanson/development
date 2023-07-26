(*******************************************************************************

Copyright (c) Centrereed Ltd 2000

Comments
--------
  Maintain Reas Codes.

VSS Info:
$Header: /PBL D5/PBMaintReasCode.pas 9     20/06/03 9:53 Andrewh $
$History: PBMaintReasCode.pas $
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:18
 * Updated in $/PBL D5
 * Changed to add a switch to display Enquiry reasons or PO Reasons
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 28/09/:0   Time: 11:37
 * Updated in $/PBL D5
 * Maintain Reason Codes Form.
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 28/09/:0   Time: 10:35
 * Created in $/PBL D5
 * Reason Code Maintenance
 *
 * *****************  Version 1  *****************
 * User: Janiner       Date: 27/9/00    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBMaintReasCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, PBGroupsDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintReasCodeFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    edtDescription: TEdit;
    DetsSRC: TDataSource;
    CheckUniqueRefSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    function CheckUniqueRef(iTempRef: string): ByteBool;
    procedure edtDescriptionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
  
  public
    sFuncMode, sDescrField, sDescrFieldName, sKeyField: string;
    sDescription: string;
    iCode: Integer;
  end;

var
  PBMaintReasCodeFrm: TPBMaintReasCodeFrm;

implementation

uses PBLUReasCode, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintReasCodeFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs};
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new  ' + sDescrFieldName;
  if sFuncMode = 'C' then
    Caption := 'Change a ' + sDescrFieldName;
  if sFuncMode = 'D' then
    Caption := 'Delete a ' + sDescrFieldName;
  if sFuncMode = 'A' then
    edtDescription.Text := ''
  else
  begin
    edtDescription.Text := sDescription;
  end;
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuReasons',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintReasCodeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (edtDescription.Text <> '');
end;

procedure TPBMaintReasCodeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintReasCodeFrm.OKBitBtnClick(Sender: TObject);
begin
  with dmGroups do
  begin
    if sKeyField = 'Enq_Inactive_Reason' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextEnqReason;
      if sFuncMode = 'D' then
        DeleteEnqReason(iCode)
      else
        SaveEnqReason(iCode, edtDescription.Text);
    end
    else
    if sKeyField = 'Inactive_Reason' then
    begin
      if sFuncMode = 'A' then
        iCode := GetNextPOReason;
      if sFuncMode = 'D' then
        DeletePOReason(iCode)
      else
        SavePOReason(iCode, edtDescription.Text);
    end;
  end;
(*  if sFuncMode = 'A' then
  begin
    if CheckUniqueRef(edtDescription.Text) then
      Exit;
    {Add a new code};
    {Get Next code};
    with GetLastSQL do
    begin
      Close;
      Open;
      First;
      iTempNewCode := FieldByName('Last_Code').AsInteger + 1;
      Close;
    end;
    with AddSQL do
    begin
      Close;
      ParamByName('Enq_InActive_Reason').AsInteger := iTempNewCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ExecSQL;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    if CheckUniqueRef(DescrEdit.Text) then
      Exit;
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Enq_InActive_Reason').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ExecSQL;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete this reason ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Enq_InActive_Reason').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;

  PBMaintReasCodeFrm.ModalResult := idok;
*)
end;

function TPBMaintReasCodeFrm.CheckUniqueRef(iTempRef:
  string): ByteBool;
begin
  {Check that Reas Ref is unique};
  with CheckUniqueRefSQL do
  begin
    Close;
    ParamByName('Description').AsString := iTempRef;
    Open;
    Result := (RecordCount > 0);
  end;
  if Result then
    MessageDlg('The Reason you have entered already exist',
      mtError, [mbOK], 0);
end;

procedure TPBMaintReasCodeFrm.edtDescriptionChange(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TPBMaintReasCodeFrm.FormCreate(Sender: TObject);
begin
  dmGroups := TdmGroups.Create(Self);
end;

procedure TPBMaintReasCodeFrm.FormDestroy(Sender: TObject);
begin
  dmGroups.free;

end;

end.
