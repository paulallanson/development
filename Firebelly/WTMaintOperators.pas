unit WTMaintOperators;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, QrCtrls, DB, DBTables;

type
  TfrmWTMaintOperators = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    chkbxEnabled: TCheckBox;
    Label3: TLabel;
    grpbxReminders: TGroupBox;
    Label4: TLabel;
    cmbQuoteFollowUp: TComboBox;
    chkbxEndUser: TCheckBox;
    grpbxScheduling: TGroupBox;
    chkbxCanUpdateSchedule: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtOperatorName: TEdit;
    edtTelephoneNumber: TEdit;
    edtMobileNumber: TEdit;
    edtEmailAddress: TEdit;
    edtLoginPassword: TEdit;
    edtJobTitle: TEdit;
    edtLoginName: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    Label9: TLabel;
    dblkpRevenueCentre: TDBLookupComboBox;
    qryRevCentre: TQuery;
    dtsRevCentre: TDataSource;
    SpeedButton6: TSpeedButton;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    procedure ShowRevenueCentres;
    { Private declarations }
  public
    { Public declarations }
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintOperators: TfrmWTMaintOperators;

implementation

uses wtLUOperators, wtDataModule, ComObj, ActiveX;

{$R *.dfm}

{ TfrmWTMaintOperators }

procedure TfrmWTMaintOperators.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;

  if Value = 'A' then
    begin
      cmbQuoteFollowUp.ItemIndex := 0;
      chkbxEnabled.Checked := true;
      chkbxCanUpdateSchedule.checked := false;
      chkbxEndUser.Checked := false;
    end
  else
  if Value = 'C' then
    begin
      cmbQuoteFollowUp.ItemIndex := frmwtLUOperators.srcOperators.DataSet.fieldbyname('Quote_Follow_Up_Reminder').asinteger;

      chkbxEnabled.Checked := (frmwtLUOperators.srcOperators.DataSet.fieldbyname('Operator_Can_Login').AsString = 'Y');
      chkbxEndUser.Checked := (frmwtLUOperators.srcOperators.DataSet.fieldbyname('End_User').AsString = 'Y');

      chkbxCanUpdateSchedule.checked := (frmwtLUOperators.srcOperators.DataSet.fieldbyname('Can_Update_Schedule').AsString = 'Y');
    end
end;

procedure TfrmWTMaintOperators.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintOperators.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtOperatorName.Text <> '') and
                   (edtLoginName.text <> '');
end;

procedure TfrmWTMaintOperators.FormActivate(Sender: TObject);
begin
  grpbxScheduling.enabled := dtmdlWorktops.SchedulingSystem <> '';

  if not grpbxScheduling.enabled then
    chkbxCanUpdateSchedule.checked := false;

  chkbxCanUpdateSchedule.enabled := grpbxScheduling.enabled;

  ShowRevenueCentres;

  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtOperatorName.Text := '';
      edtLoginName.Text := '';
      edtLoginPassword.Text := '';
      edtJobTitle.Text := '';
      edtTelephoneNumber.Text := '';
      edtEmailAddress.Text := '';
      edtMobileNumber.Text := '';
      dblkpRevenueCentre.keyvalue := 0;

      chkbxEnabled.Checked := true;
    end
  else
    with frmWTLUOperators.qryOperators do
      begin
        iCode := fieldbyname('Operator').asinteger;

        edtOperatorName.Text := fieldbyname('Operator_Name').asstring;
        edtLoginName.Text := fieldbyname('Login_Name').asstring;
        edtLoginPassword.Text := fieldbyname('Login_Password').asstring;
        edtJobTitle.Text := fieldbyname('Job_Title').asstring;
        edtTelephoneNumber.Text := fieldbyname('Telephone_Number').asstring;
        edtEmailAddress.Text := fieldbyname('Email_Address').asstring;
        edtMobileNumber.Text := fieldbyname('Mobile_Number').asstring;

        dblkpRevenueCentre.keyvalue := fieldbyname('Revenue_Centre').asinteger;

        chkbxEnabled.Checked := (fieldbyname('Operator_Can_Login').asstring = 'Y');
      end;

  EnableOK(self);
end;

procedure TfrmWTMaintOperators.FormShow(Sender: TObject);
begin
  edtOperatorName.setfocus;
end;

procedure TfrmWTMaintOperators.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Operator').asinteger := iCode;

      parambyname('Operator_Name').asstring := edtOperatorName.Text;
      parambyname('Login_Name').asstring := edtLoginName.Text;
      parambyname('Login_Password').asstring := edtLoginPassword.Text;
      parambyname('Job_Title').asstring := edtJobTitle.Text;
      parambyname('Telephone_Number').asstring := edtTelephoneNumber.Text;
      parambyname('Mobile_Number').asstring := edtMobileNumber.Text;
      parambyname('Email_Address').asstring := edtEmailAddress.Text;

      parambyname('Quote_Follow_Up_Reminder').Asinteger := cmbQuoteFollowUp.ItemIndex;

      if chkbxEnabled.Checked then
        parambyname('Operator_Can_Login').AsString := 'Y'
      else
        parambyname('Operator_Can_Login').AsString := 'N';

      if chkbxEndUser.Checked then
        parambyname('End_User').AsString := 'Y'
      else
        parambyname('End_User').AsString := 'N';

      if chkbxCanUpdateSchedule.Checked then
        parambyname('Can_Update_Schedule').AsString := 'Y'
      else
        parambyname('Can_Update_Schedule').AsString := 'N';

      if dblkpRevenueCentre.keyvalue = 0 then
        parambyname('Revenue_Centre').clear
      else
        parambyname('Revenue_Centre').asinteger := dblkpRevenueCentre.keyvalue;
      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintOperators.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
    with qryAdd do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Operator').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintOperators.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Operator ' +
            '(Operator,Operator_Name, Operator_Can_Login) ' +
            'VALUES(0, ''Dummy'', ''Y'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintOperators.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Operator Where Operator = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintOperators.ShowRevenueCentres;
begin
  with qryRevCentre do
    begin
      close;
      open;
    end;
end;

procedure TfrmWTMaintOperators.SpeedButton6Click(Sender: TObject);
begin
  dblkpRevenueCentre.KeyValue := 0;
end;

end.
