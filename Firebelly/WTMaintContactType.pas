unit WTMaintContactType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, gtQrCtrls, DB, DBTables;

type
  TfrmWTMaintContactType = class(TForm)
    label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtContactTypeDescription: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
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
  frmWTMaintContactType: TfrmWTMaintContactType;

implementation

uses WTLUContactType, ComObj, ActiveX;

{$R *.dfm}

{ TForm1 }

procedure TfrmWTMaintContactType.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintContactType.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintContactType.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtContactTypeDescription.Text <> '');
end;

procedure TfrmWTMaintContactType.FormShow(Sender: TObject);
begin
  EnableOK(Self);
end;

procedure TfrmWTMaintContactType.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtContactTypeDescription.Text := '';

    end
  else
    with frmWTLUContactType.qryContactType do
      begin
        iCode := fieldbyname('Contact_Type').asinteger;

        edtContactTypeDescription.Text := fieldbyname('Contact_Type_Description').asstring;
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintContactType.SaveToDB;
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
      parambyname('Contact_Type').asinteger := iCode;

      parambyname('Contact_Type_Description').asstring := edtContactTypeDescription.Text;

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintContactType.GetNextKey: integer;
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
      Result := FieldByName('Contact_Type').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintContactType.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Contact_Type ' +
            '(Contact_Type, Contact_Type_Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintContactType.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Contact_Type Where Contact_Type = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
