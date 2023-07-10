unit wtMaintFitters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables, gtQrCtrls;

type
  TfrmWTMaintFitters = class(TForm)
    lblName: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    chkbxInactive: TCheckBox;
    chkbxIncludeInSchedule: TCheckBox;
    edtFitterName: TEdit;
    edtTelephoneNumber: TEdit;
    edtMobileNumber: TEdit;
    edtEmailAddress: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    customer: integer;
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    function GetCustomerName(tempCust: integer): string;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintFitters: TfrmWTMaintFitters;

implementation

uses wtLUFitters, ComObj, ActiveX;

{$R *.dfm}

{ TfrmWTMaintReps }

procedure TfrmWTMaintFitters.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintFitters.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintFitters.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtFitterName.Text) <> '';
end;

function TfrmWTMaintFitters.GetCustomerName(tempCust: integer): string;
begin
end;

procedure TfrmWTMaintFitters.FormShow(Sender: TObject);
begin
  edtFitterName.setfocus;
end;

procedure TfrmWTMaintFitters.FormActivate(Sender: TObject);
begin
      if FunctionMode = 'A' then
        begin
          iCode := 0;

          edtFitterName.Text := '';
          edtTelephoneNumber.Text := '';
          edtEmailAddress.Text := '';
          edtMobileNumber.Text := '';

          chkbxIncludeInSchedule.Checked := false;
          chkbxInactive.Checked := false;
        end
      else
        with frmWTLUFitters.qryFitters do
          begin
            iCode := fieldbyname('Fitter').asinteger;

            edtFitterName.Text := fieldbyname('Fitter_Name').asstring;
            edtTelephoneNumber.Text := fieldbyname('Telephone_Number').asstring;
            edtEmailAddress.Text := fieldbyname('Email_Address').asstring;
            edtMobileNumber.Text := fieldbyname('Mobile_Number').asstring;

            chkbxIncludeInSchedule.Checked := (fieldbyname('Include_In_Schedule').asstring = 'Y');
            chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
          end;
  EnableOK(self);
end;

procedure TfrmWTMaintFitters.SaveToDB;
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
      parambyname('Fitter').asinteger := iCode;

      parambyname('Fitter_Name').asstring := edtFitterName.Text;
      parambyname('Telephone_Number').asstring := edtTelephoneNumber.Text;
      parambyname('Mobile_Number').asstring := edtMobileNumber.Text;
      parambyname('Email_Address').asstring := edtEmailAddress.Text;

      if chkbxIncludeInSchedule.Checked then
        paramByName('Include_In_Schedule').asstring := 'Y'
      else
        paramByName('Include_In_Schedule').asstring := 'N';

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintFitters.GetNextKey: integer;
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
      Result := FieldByName('Fitter').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintFitters.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Fitter ' +
            '(Fitter,Fitter_Name, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintFitters.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Fitter Where Fitter = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
