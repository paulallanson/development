unit PBMaintWorkCentre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintWorkCentreFrm = class(TForm)
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
    memHourlyRate: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    edtShortName: TEdit;
    Label4: TLabel;
    dblkpFeedMethod: TDBLookupComboBox;
    Label5: TLabel;
    edtEstimateName: TEdit;
    Label6: TLabel;
    memDescription: TMemo;
    qryFeedMethod: TFDQuery;
    dtsFeedMethod: TDataSource;
    Label7: TLabel;
    memClickCharge: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure SaveValue(Sender: TObject);
  private
    FOldValue: string;
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
  PBMaintWorkCentreFrm: TPBMaintWorkCentreFrm;

implementation

uses pbDatabase, pbMainMenu, PBLUWorkCentre, ActiveX;

{$R *.DFM}

procedure TPBMaintWorkCentreFrm.FormActivate(Sender: TObject);
begin
  {Setup titles}
  with qryFeedMethod do
    begin
      close;
      open;
    end;

  if sFuncMode = 'A' then
    Caption := 'Add a new Work Centre';
  if sFuncMode = 'C' then
    Caption := 'Change a Work Centre';
  if sFuncMode = 'D' then
    Caption := 'Delete a Work Centre';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtName.Text := '';
    edtShortName.Text := '';
    edtEstimateName.Text := '';
    memHourlyRate.Text := '0.00';
    memClickCharge.Text := '0.00';
    memDescription.Text := '';
    dblkpFeedMethod.keyvalue := '';
  end
  else
  begin
    with PBLUWorkCentreFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Work_Centre').AsInteger;
      edtName.Text := FieldByName('Work_Centre_Name').AsString;
      edtShortName.Text := FieldByName('Work_Centre_Short_Name').AsString;
      edtEstimateName.Text := FieldByName('Estimating_Name').AsString;
      memHourlyRate.Text := formatfloat('##0.00',FieldByName('Hourly_rate').Asfloat);
      memClickCharge.Text := formatfloat('##0.00',FieldByName('Click_Charge').Asfloat);
      memDescription.Text := fieldbyname('Work_centre_Description').asstring;
      dblkpFeedMethod.keyvalue := fieldbyname('Feed_method').asstring;
    end;
  end;
  {Enable or disable the buttons}
  if sFuncMode <> 'D' then
    edtName.setfocus ;

  edtName.Enabled := (sFuncMode <> 'D');
  edtEstimateName.Enabled := (sFuncMode <> 'D');
  memDescription.Enabled := (sFuncMode <> 'D');
  edtShortName.Enabled := (sFuncMode <> 'D');
  dblkpFeedMethod.Enabled := (sFuncMode <> 'D');
  memHourlyRate.Enabled := (sFuncMode <> 'D');
  memClickCharge.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuWorkCentres',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintWorkCentreFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtName.Text <> '') and
                      (memHourlyRate.Text <> '') and
                      (memClickCharge.Text <> '') and
                      (dblkpFeedMethod.keyvalue <> '');
end;

procedure TPBMaintWorkCentreFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintWorkCentreFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintWorkCentreFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintWorkCentreFrm.OKBitBtnClick(Sender: TObject);
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
      ParamByName('Work_Centre').AsInteger := iCode;
      ParamByName('Work_Centre_Name').AsString := edtName.Text + '';
      ParamByName('Work_Centre_Short_Name').AsString := edtShortName.Text + '';
      ParamByName('Hourly_Rate').Asfloat := StrToFloatDef(memHourlyRate.text, 0, FormatSettings);
      ParamByName('Click_Charge').Asfloat := StrToFloatDef(memClickCharge.text, 0, FormatSettings);
      ParamByName('Feed_Method').Asstring := dblkpFeedMethod.KeyValue;
      ParamByName('Work_Centre_Description').AsString := memDescription.Text + '';
      ParamByName('Estimating_Name').AsString := edtEstimateName.Text + '';
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

procedure TPBMaintWorkCentreFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Work_Centre ' +
            '(Work_Centre,Work_Centre_Name,Running_Speed, Running_Speed_unit, hourly_rate, minimum_depth_mm, minimum_width_mm ' +
            ', maximum_depth_mm, maximum_width_mm, Feed_method) ' +
            'VALUES(0,''Dummy'',0,1,0,0,0,0,0,''S'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintWorkCentreFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Work_Centre Where Work_Centre=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintWorkCentreFrm.GetNextKey: integer;
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
      Result := FieldByName('Work_Centre').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintWorkCentreFrm.DoDelete;
begin
  with DelSQL do
  begin
    SQL.Clear;
    SQL.Add('Delete From Work_Centre ' +
            'Where Work_Centre=' + IntToStr(iCode));
    ExecSQL;
  end;
end;

procedure TPBMaintWorkCentreFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintWorkCentreFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
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
    '-':;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
