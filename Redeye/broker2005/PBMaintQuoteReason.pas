unit PBMaintQuoteReason;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TPBMaintQuoteReasonFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    DetsSRC: TDataSource;
    qryZero: TQuery;
    rdgType: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
  end;

var
  PBMaintQuoteReasonFrm: TPBMaintQuoteReasonFrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUCreditReason,
  PBLUQuoteReason;

{$R *.DFM}

procedure TPBMaintQuoteReasonFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Quote Win/Loss Reason';
  if sFuncMode = 'C' then
    Caption := 'Change Quote Win/Loss Reason';
  if sFuncMode = 'D' then
    Caption := 'Delete a Quote Win/Loss Reason';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    rdgType.itemindex := PBLUQuoteReasonFrm.rdgReasonType.ItemIndex;
    DescrEdit.Text := '';
  end
  else
  begin
    with PBLUQuoteReasonFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Quote_Reason').AsInteger;
      DescrEdit.Text := FieldByName('Quote_Reason_Description').AsString;
      if FieldByName('Quote_Reason_Type').AsString = 'L' then
        rdgType.itemindex := 0
      else
        rdgType.itemindex := 1;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuQuoteReasons',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintQuoteReasonFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintQuoteReasonFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintQuoteReasonFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintQuoteReasonFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintQuoteReasonFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A','C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      ParamByName('Quote_Reason').AsInteger := iCode;
      ParamByName('Quote_Reason_Description').AsString := DescrEdit.Text + '';
      if rdgType.itemindex = 0 then
        Parambyname('Quote_Reason_Type').asstring := 'L'
      else
        Parambyname('Quote_Reason_Type').asstring := 'W';
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
        ParamByName('Quote_Reason').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintQuoteReasonFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Quote_Reason ' +
            '(Quote_Reason,Quote_Reason_Description, Quote_Reason_Type) ' +
            'VALUES(''0'',''Dummy'',''L'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintQuoteReasonFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Quote_Reason Where Quote_Reason=''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintQuoteReasonFrm.GetNextKey: integer;
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
      Result := FieldByName('Quote_Reason').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
