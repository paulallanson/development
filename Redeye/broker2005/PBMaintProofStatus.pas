(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Proof Status.

VSS Info:
$Header: /PBL D5/PBMaintProofStatus.pas 8     20/06/03 9:53 Andrewh $
$History: PBMaintProofStatus.pas $
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 26/11/:1   Time: 16:00
 * Updated in $/PBL D5
 * Now allows the specifying of the Default Approval Print Status
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 23/11/:1   Time: 15:26
 * Created in $/PBL D5
 * New Proof Status maintenance form and lookup
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
unit PBMaintProofStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintProofStatusFrm = class(TForm)
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
    DetsSRC: TDataSource;
    qryZero: TFDQuery;
    CheckSQL: TFDQuery;
    chkBxDefault: TCheckBox;
    chkbxApproved: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    procedure UnitFactorEditKeyPress(Sender: TObject; var Key: Char);
  private
    function CheckCodeExist(sTemp: string):boolean;
    function IncrementNo(StartStr: string): string;
  public
    sFuncMode: string[1];
    sCode: string;
  end;

var
  PBMaintProofStatusFrm: TPBMaintProofStatusFrm;

implementation

uses UITypes, ComObj, ActiveX, PBLUProofStatus, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintProofStatusFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new proof status';
  if sFuncMode = 'C' then
    Caption := 'Change a proof status';
  if sFuncMode = 'D' then
    Caption := 'Delete a proof status';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
  end
  else
  begin
    with PBLUProofStatusFrm.DetsSRC.DataSet do
    begin
      sCode := FieldByName('Proof_Status').Asstring;
      DescrEdit.Text := FieldByName('Description').AsString;
      chkBxDefault.checked := (fieldbyname('Proof_Approval_Status').asstring = 'Y');
      chkBxApproved.checked := (fieldbyname('Proof_Approved').asstring = 'Y');
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProof',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintProofStatusFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintProofStatusFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProofStatusFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProofStatusFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProofStatusFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      begin
        sCode := IncrementNo('1');
        while CheckCodeExist(sCode) do
          begin
            sCode := IncrementNo(sCode);
          end;

        with AddSQl do
        begin
          ParamByName('Proof_Status').Asstring := sCode;
          ParamByName('Description').AsString := DescrEdit.Text + '';
          if chkBxDefault.checked then
            ParamByName('Proof_Approval_Status').asstring := 'Y'
          else
            ParamByName('Proof_Approval_Status').asstring := 'N';
          if chkBxApproved.checked then
            ParamByName('Proof_Approved').asstring := 'Y'
          else
            ParamByName('Proof_Approved').asstring := 'N';
          ExecSQL;
        end;
      end;
    with UpdSQL do
    begin
      ParamByName('Proof_Status').Asstring := sCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      if chkBxDefault.checked then
        ParamByName('Proof_Approval_Status').asstring := 'Y'
      else
        ParamByName('Proof_Approval_Status').asstring := 'N';
      if chkBxApproved.checked then
        ParamByName('Proof_Approved').asstring := 'Y'
      else
        ParamByName('Proof_Approved').asstring := 'N';
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
        ParamByName('Proof_Status').Asstring := sCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintProofStatusFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProofStatusFrm.UnitFactorEditKeyPress(Sender: TObject;
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

function TPBMaintProofStatusFrm.CheckCodeExist(sTemp: string):boolean;
begin
  with CheckSQl do
    begin
      close;
      parambyname('Proof_status').asstring := sTemp;
      open;

      if recordcount > 0 then
        result := true
      else
        result := false;
    end;
end;

function TPBMaintProofStatusFrm.IncrementNo(StartStr: string): string;
var
  StrLength, Count, Id: Integer;
  Alphas: string[27];
  Numbers: string[11];
  CurrChar: string[1];
begin
  Alphas := 'ABCEDFGHIJKLMNOPQRSTUVWXYZA';
  Numbers := '01234567890';
  {Increment a string value by 1}
  StrLength := Length(StartStr);
  for Count := StrLength downto 1 do
  begin
    CurrChar := Copy(StartStr, Count, 1);
    Id := Pos(CurrChar, Numbers);
    if Id > 0 then
    begin
      StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Numbers, (Id + 1), 1) +
        Copy(StartStr, (Count + 1), (StrLength - Count));
      IncrementNo := StartStr;
      if Id < 10 then Exit;
    end
    else
    begin
      Id := Pos(CurrChar, Alphas);
      if Id > 0 then
      begin
        StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Alphas, (Id + 1), 1) +
          Copy(StartStr, (Count + 1), (StrLength - Count));
        IncrementNo := StartStr;
        if Id < 27 then Exit;
      end;
    end;
  end;
end;

end.
