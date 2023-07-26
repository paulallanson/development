unit PBMaintWorkCentreGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintWorkCentreGroupFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    qryZero: TFDQuery;
    Label1: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    edtShortName: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DoDelete;
  public
    sFuncMode: string[1];
    iCode: Integer;
    iProductType: integer;
  end;

var
  PBMaintWorkCentreGroupFrm: TPBMaintWorkCentreGroupFrm;

implementation

uses pbDatabase, pbMainMenu, PBLUWorkCentreGroup, ActiveX;

{$R *.DFM}

procedure TPBMaintWorkCentreGroupFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Work Centre Group';
  if sFuncMode = 'C' then
    Caption := 'Change a Work Centre Group';
  if sFuncMode = 'D' then
    Caption := 'Delete a Work Centre Group';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtName.Text := '';
    edtShortName.Text := '';
  end
  else
  begin
    with PBLUWorkCentreGroupFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Work_Centre_Group').AsInteger;
      edtName.Text := FieldByName('Work_Centre_Group_Name').AsString;
      edtShortName.Text := FieldByName('Work_Centre_Group_Short_Name').AsString;
    end;
  end;
  {Enable or disable the buttons}
  if sFuncMode <> 'D' then
    edtName.setfocus ;

  edtName.Enabled := (sFuncMode <> 'D');
  edtShortName.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuWorkCentreGroups',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintWorkCentreGroupFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtName.Text <> '');
end;

procedure TPBMaintWorkCentreGroupFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintWorkCentreGroupFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintWorkCentreGroupFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintWorkCentreGroupFrm.OKBitBtnClick(Sender: TObject);
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
      ParamByName('Work_Centre_Group').AsInteger := iCode;
      ParamByName('Work_Centre_Group_Name').AsString := edtName.Text + '';
      ParamByName('Work_Centre_Group_Short_Name').AsString := edtShortName.Text + '';
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;
end;

procedure TPBMaintWorkCentreGroupFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Work_Centre_Group ' +
            '(Work_Centre_Group,Work_Centre_Group_Name) ' +
            'VALUES(0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintWorkCentreGroupFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Work_Centre_Group Where Work_Centre_Group=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintWorkCentreGroupFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert work centre group record
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
      Result := FieldByName('Work_Centre_Group').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintWorkCentreGroupFrm.DoDelete;
begin
  with DelSQL do
  begin
    SQL.Clear;
    SQL.Add('Delete From Work_Centre_Group ' +
            'Where Work_Centre_Group=' + IntToStr(iCode));
    ExecSQL;
  end;
end;

end.
