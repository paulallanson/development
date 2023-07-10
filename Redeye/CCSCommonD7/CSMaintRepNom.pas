(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
A description of the unit here

VSS Info:
$Header: /CCSCommon/CSMaintRepNom.pas 1     23/05/:2 8:03 Pahome $
$History: CSMaintRepNom.pas $
 * 
 * *****************  Version 1  *****************
 * User: Pahome       Date: 23/05/:2   Time: 8:03
 * Created in $/CCSCommon
 * Initial take on of common Rep LU and Maintenance units
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintRepNom;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, DBTables, StdCtrls, Buttons;

type
  TCSMaintRepNomFrm = class(TForm)
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DetsGrpBox: TGroupBox;
    NameEdit: TEdit;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    FlashTimer: TTimer;
    NomLbl: TLabel;
    AdditDetsLbl: TLabel;
    NomEdit: TEdit;
    NomDescrEdit: TEdit;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NomEditChange(Sender: TObject);
    procedure NomDescrEditChange(Sender: TObject);
  public
    sFuncMode: string[1];
    iCode, iRep: Integer;
    selname: string;
  end;

var
  CSMaintRepNomFrm: TCSMaintRepNomFrm;

implementation

uses CSLURepNom, CSImages;

{$R *.DFM}

procedure TCSMaintRepNomFrm.FormActivate(Sender: TObject);
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
  iRep := CSLURepNomFrm.selcode;
  NameEdit.Text := selname;
  if sFuncMode = 'A' then
  begin
    {Empty details};
    NomEdit.Text := '';
    NomDescrEdit.Text := '';
  end
  else
  begin
    with CSLURepNomFrm.DetsSRC.DataSet do
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
end;

procedure TCSMaintRepNomFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (NomDescrEdit.Text <> '') and
    (NomEdit.Text <> '');
end;

procedure TCSMaintRepNomFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintRepNomFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintRepNomFrm.OKBitBtnClick(Sender: TObject);
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

procedure TCSMaintRepNomFrm.NomEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintRepNomFrm.NomDescrEditChange(Sender: TObject);
begin
  checkok(Self);
end;

end.
