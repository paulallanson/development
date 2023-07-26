unit STMaintCourierSpeed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, Mask, Spin, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintCourierSpeedFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    qryZero: TFDQuery;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    DescrEdit: TEdit;
    chkbxActive: TCheckBox;
    Label2: TLabel;
    edtCourrierName: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DoDelete;
  public
    CourierCode: integer;
    CourierName: string;
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  STMaintCourierSpeedFrm: TSTMaintCourierSpeedFrm;

implementation

uses ComObj, ActiveX;

{$R *.DFM}

procedure TSTMaintCourierSpeedFrm.FormActivate(Sender: TObject);
begin
  self.edtCourrierName.text := CourierName;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new courier speed type';
  if sFuncMode = 'C' then
    Caption := 'Change a courier speed type';
  if sFuncMode = 'D' then
    Caption := 'Delete a courier speed type';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');

  CheckOK(Self);
end;

procedure TSTMaintCourierSpeedFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TSTMaintCourierSpeedFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TSTMaintCourierSpeedFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TSTMaintCourierSpeedFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with UpdSQL do
    begin
      Close;
      ParamByName('Courier_Speed').AsInteger := iCode;
      ParamByName('Speed_Description').AsString := DescrEdit.Text + '';
      ParamByName('Courier').Asinteger := CourierCode;
      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;
end;

procedure TSTMaintCourierSpeedFrm.DoDelete;
begin
  with DelSQL do
  begin
    SQL.Clear;
    SQL.Add('Delete From Courier_Speed ' +
            'Where Courier_Speed=' + IntToStr(iCode));
    ExecSQL;
  end;
end;

procedure TSTMaintCourierSpeedFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Courier_Speed ' +
            '(Courier_Speed, Speed_Description) ' +
            'VALUES(''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TSTMaintCourierSpeedFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Courier_Speed Where Courier_Speed=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TSTMaintCourierSpeedFrm.GetNextKey: integer;
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
      Result := FieldByName('Courier_Speed').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
