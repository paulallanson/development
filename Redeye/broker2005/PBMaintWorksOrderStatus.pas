unit PBMaintWorksOrderStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintWorksOrderStatusFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    qryZero: TFDQuery;
    Label1: TLabel;
    edtDescription: TEdit;
    chkbxActive: TCheckBox;
    Label2: TLabel;
    edtColor: TEdit;
    Button1: TButton;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    Label3: TLabel;
    edtStatusCode: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edtStatusCodeKeyPress(Sender: TObject; var Key: Char);
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
  PBMaintWorksOrderStatusFrm: TPBMaintWorksOrderStatusFrm;

implementation

uses
  System.UITypes,
  pbDatabase, pbMainMenu, ActiveX, PBLUWorksOrderStatus;

{$R *.DFM}

procedure TPBMaintWorksOrderStatusFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Works Instruction Status';
  if sFuncMode = 'C' then
    Caption := 'Change a Works Instruction Status';
  if sFuncMode = 'D' then
    Caption := 'Delete a Works Instruction Status';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtStatusCode.Text := '';
    edtDescription.Text := '';
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUWorksOrderStatusFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Works_Order_Status').AsInteger;
      edtStatusCode.Text := FieldByName('Works_Order_Status').AsString;
      edtDescription.Text := FieldByName('Works_Order_Status_Descr').AsString;
      chkBxActive.Checked := not (fieldByName('InActive').AsString = 'Y');
      if FieldByName('Color').Asinteger <> 0 then
        begin
          edtColor.Color := FieldByName('Color').Asinteger;
          edtColor.Font.Color := FieldByName('Font_Color').Asinteger;
        end;
    end;
  end;
  {Enable or disable the buttons}
  if sFuncMode <> 'D' then
    edtDescription.setfocus ;

  edtStatusCode.Enabled := (sFuncMode <> 'C') and (sFuncMode <> 'D');
  edtDescription.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuWorksOrderStatus',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintWorksOrderStatusFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtDescription.Text <> '');
end;

procedure TPBMaintWorksOrderStatusFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintWorksOrderStatusFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintWorksOrderStatusFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintWorksOrderStatusFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
    begin
      try
        with AddSQL do
        begin
          Close;
          ParamByName('Works_Order_Status').AsInteger := strtoint(edtStatusCode.text);
          ParamByName('Works_Order_Status_Descr').AsString := edtDescription.Text + '';
          execsql;
        end;
        iCode := strtoint(edtStatusCode.text);
      except
        MessageDlg('This status code already exists, use an alternative number.', mtError, [mbAbort], 0);
        exit;
      end;
    end;

    with UpdSQL do
    begin
      Close;
      ParamByName('Works_Order_Status').AsInteger := iCode;
      ParamByName('Works_Order_Status_Descr').AsString := edtDescription.Text + '';
      ParamByName('Color').Asinteger := edtColor.Color;
      ParamByName('Font_Color').Asinteger := edtColor.Font.Color;
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
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;

  ModalResult := mrOK ;
end;

procedure TPBMaintWorksOrderStatusFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Works_Order_Status ' +
            '(Works_Order_Status,Works_Order_Status_Descr) ' +
            'VALUES(0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintWorksOrderStatusFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Works_Order_Status Where Works_Order_Status=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintWorksOrderStatusFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert status record
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
      Result := FieldByName('Works_Order_Status').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintWorksOrderStatusFrm.DoDelete;
begin
  try
    with DelSQL do
    begin
      SQL.Clear;
      SQL.Add('Delete From Works_Order_Status ' +
            'Where Works_Order_Status=' + IntToStr(iCode));
      ExecSQL;
    end;
  except
    {Set to inactive and save}
    with UpdSQL do
    begin
      Close;
      ParamByName('Works_Order_Status').AsInteger := iCode;
      ParamByName('Works_Order_Status_Descr').AsString := edtDescription.Text + '';
      ParamByName('InActive').AsString := 'Y';
      ExecSQL;
    end;
  end;
end;

procedure TPBMaintWorksOrderStatusFrm.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.Color := ColorDialog1.Color;
end;

procedure TPBMaintWorksOrderStatusFrm.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.font.Color := ColorDialog1.Color;
end;

procedure TPBMaintWorksOrderStatusFrm.edtStatusCodeKeyPress(
  Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
