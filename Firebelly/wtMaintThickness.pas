unit wtMaintThickness;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, gtQrCtrls, CRControls, DB, DBTables;

type
  TfrmWtMaintThickness = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    chkbxShowOnline: TCheckBox;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    edtThicknessmm: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    { Public declarations }
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWtMaintThickness: TfrmWtMaintThickness;

implementation

uses wtLUThickness, ComObj, ActiveX;

{$R *.DFM}

{ TfrmWtMaintThickness }

procedure TfrmWtMaintThickness.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintThickness.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintThickness.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtThicknessmm.Text) <> '';
end;

procedure TfrmWtMaintThickness.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtThicknessmm.Text := '';
      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLUThickness.qryThickness do
      begin
        iCode := fieldbyname('Thickness').asinteger;

        edtThicknessmm.Text := fieldbyname('Thickness_mm').asstring;
        chkbxShowOnline.Checked := (fieldbyname('Show_Online').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');

      end;
  enableOK(self);
end;

procedure TfrmWtMaintThickness.SaveToDB;
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
      parambyname('Thickness').asinteger := iCode;

      parambyname('Thickness_mm').asstring := edtThicknessmm.Text;

      if chkbxShowOnline.Checked then
        ParamByName('Show_Online').asstring := 'Y'
      else
        ParamByName('Show_Online').asstring := 'N';

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWtMaintThickness.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
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
      Result := FieldByName('Thickness').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintThickness.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Thickness ' +
            '(Thickness,Thickness_mm, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintThickness.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Thickness Where Thickness = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintThickness.FormShow(Sender: TObject);
begin
  edtThicknessmm.SetFocus;
end;

end.
