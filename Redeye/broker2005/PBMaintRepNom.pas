(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
A description of the unit here

VSS Info:
$Header: /PBL D5/PBMaintRepNom.pas 7     20/06/03 9:53 Andrewh $
$History: PBMaintRepNom.pas $
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 2  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBMaintRepNom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, StdCtrls, Buttons, Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintRepNomFrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DetsGrpBox: TGroupBox;
    NameEdit: TEdit;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    FlashTimer: TTimer;
    NomLbl: TLabel;
    AdditDetsLbl: TLabel;
    NomDescrEdit: TEdit;
    Label2: TLabel;
    NomEdit: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NomEditChange(Sender: TObject);
    procedure NomDescrEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    sFuncMode: string[1];
    iCode, iRep: Integer;
    selname: string;
  end;

var
  PBMaintRepNomFrm: TPBMaintRepNomFrm;

implementation

uses UITypes, PBLURepNom, PBImages, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintRepNomFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  //PBDBMemoFrm := TPBDBMemoFrm.Create(Self) ;
  //PBDBMemoFrm.bAllow_Upd := True ;
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new nominal';
  if sFuncMode = 'C' then
    Caption := 'Change a nominal';
  if sFuncMode = 'D' then
    Caption := 'Delete a nominal';
  iRep := PBLURepNomFrm.selcode;
  NameEdit.Text := selname;
  if sFuncMode = 'A' then
  begin
    {Empty details};
    NomEdit.Text := '';
    NomDescrEdit.Text := '';
  end
  else
  begin
    with PBLURepNomFrm.DetsSRC.DataSet do
    begin
      irep := FieldByName('Rep').AsInteger;
      iCode := FieldByName('Nominal_Reference').AsInteger;
      NomEdit.Text := FieldByName('Nominal').AsString;
      NomDescrEdit.Text := FieldByName('Nominal_Description').AsString;
    end;
  end;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuReps',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintRepNomFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (NomDescrEdit.Text <> '') and
    (NomEdit.Text <> '');
end;

procedure TPBMaintRepNomFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintRepNomFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRepNomFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  if sFuncMode = 'A' then
  begin
    {Add a new code};
    {Add the rep narrative};
    {Get Next code};
    with GetLastSQL do
    begin
      Close;
      ParamByName('Rep').AsInteger := iRep;
      Open;
      First;
      iTempNewCode := FieldByName('Last_Code').AsInteger + 1;
      Close;
    end;
    with AddSQL do
    begin
      Close;
      ParamByName('Rep').AsInteger := iRep;
      ParamByName('Nominal_Reference').AsInteger := iTempNewCode;
      ParamByName('Nominal').AsString := NomEdit.Text + '';
      ParamByName('Nominal_Description').AsString := NomDescrEdit.Text + '';
      ExecSQL;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    {Update the rep narrative};
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Rep').AsInteger := iRep;
      ParamByName('Nominal_reference').AsInteger := iCode;
      ParamByName('Nominal').AsString := NomEdit.Text + '';
      ParamByName('Nominal_Description').AsString := NomDescrEdit.Text + '';
      ExecSQL;
    end;
  end;
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
      ParamByName('Rep').AsInteger := irep;
      ParamByName('Nominal_Reference').AsInteger := iCode;
      ExecSQL;
    end;
    {Delete the rep nominal};

  end;
end;

procedure TPBMaintRepNomFrm.NomEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintRepNomFrm.NomDescrEditChange(Sender: TObject);
begin
  checkok(Self);
end;

procedure TPBMaintRepNomFrm.FormCreate(Sender: TObject);
begin
  {Set Nominal Code length}
  if dmBroker.GetAccountsPackage = 'SAGEMMS' then
    begin
      nomedit.editMask := '!00009999/AAA/AAA;0;_';
      nomedit.MaxLength := 16;
    end
  else
    begin
      nomedit.editMask := '';
      nomedit.MaxLength := 8;
    end;
end;

end.
