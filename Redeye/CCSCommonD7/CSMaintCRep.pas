(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Customer/Branch Contacts.

VSS Info:
$Header: /CCSCommon/CSMaintCRep.pas 1     10/01/:1 13:00 Paul $
$History: CSMaintCRep.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:00
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintCRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables;

type
  TCSMaintCRepFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CustNameEdit: TEdit;
    BranchNameEdit: TEdit;
    GetBranchNameSQL: TQuery;
    Label4: TLabel;
    GetRepsSQL: TQuery;
    RepsSRC: TDataSource;
    RepsDBLCB: TDBLookupComboBox;
    PercMemo: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure RepsDBLCBClick(Sender: TObject);
    procedure PercMemoExit(Sender: TObject);
  public
    sFuncMode: string[1];
    iCode, iCust, iBranch: Integer;
    sCustName, sBranchName: string
  end;

var
  CSMaintCRepFrm: TCSMaintCRepFrm;

implementation

uses CSLUCRep;

{$R *.DFM}

procedure TCSMaintCRepFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the list SQL};
  with GetRepsSQL do
  begin
    Close;
    if sFuncMode = 'A' then
      ParamByName('Rep').AsInteger := 0
    else
      ParamByName('Rep').AsInteger := iCode;
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    Open;
  end;
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new rep to this branch';
  if sFuncMode = 'C' then
    Caption := 'Change a rep on this branch';
  if sFuncMode = 'D' then
    Caption := 'Delete a rep from this branch';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    PercMemo.Text := '0.00';
    RepsDBLCB.KeyValue := Null;
    RepsDBLCB.Enabled := True;
  end
  else
  begin
    with CSLUCRepFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Rep').AsInteger;
      PercMemo.Text := FormatFloat('##0.00', FieldByName('Percentage').AsFloat);
      RepsDBLCB.KeyValue := FieldByName('Rep').AsInteger;
      RepsDBLCB.Enabled := False;
    end;
  end;
  CustNameEdit.Text := sCustName;
  BranchNameEdit.Text := sBranchName;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  if sFuncMode = 'A' then
    RepsDBLCB.SetFocus;
end;

procedure TCSMaintCRepFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (PercMemo.Text <> '') and
    (RepsDBLCB.KeyValue <> Null);
end;

procedure TCSMaintCRepFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintCRepFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode = 'A' then
  begin
    {Add a new code};
    {Get Next code};
    with AddSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Rep').AsInteger := RepsDBLCB.KeyValue;
      ParamByName('Percentage').AsFloat := StrToFloat(PercMemo.Text);
      ExecSQL;
    end;
    iCode := RepsDBLCB.KeyValue;
  end;
  if sFuncMode = 'C' then
  begin
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Rep').AsInteger := iCode;
      ParamByName('Percentage').AsFloat := StrToFloat(PercMemo.Text);
      ExecSQL;
      ExecSQL;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete this rep from the customer/branch ?',
      mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iBranch;
      ParamByName('Rep').AsInteger := iCode;
      ExecSQL;
    end;
  end;
end;

procedure TCSMaintCRepFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCRepFrm.TypeDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCRepFrm.RepsDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintCRepFrm.PercMemoExit(Sender: TObject);
begin
  if PercMemo.Text <> '' then
  begin
    try
      PercMemo.Text := FormatFloat('##0.00', StrToFloat(PercMemo.Text))
    except
      MessageDlg('Invalid percentage', mtError, [mbOK], 0);
      PercMemo.SetFocus;
    end;
  end;
  CheckOK(Self);
end;

end.
