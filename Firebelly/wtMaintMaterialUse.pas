unit wtMaintMaterialUse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, QrCtrls, DB, DBTables;

type
  TfrmWtMaintMaterialUse = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    edtUseDescription: TEdit;
    rdgrpUseFor: TRadioGroup;
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
  frmWtMaintMaterialUse: TfrmWtMaintMaterialUse;

implementation

uses wtLUMaterialUse, ComObj, ActiveX;

{$R *.DFM}

procedure TfrmWtMaintMaterialUse.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintMaterialUse.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintMaterialUse.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtUseDescription.Text := '';
      chkbxInactive.Checked := false;

    end
  else
    with frmWTLUMaterialUse.qryMaterialUse do
      begin
        iCode := fieldbyname('Material_Use').asinteger;

        edtUseDescription.Text := fieldbyname('Use_Description').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');

        rdgrpUseFor.itemindex := fieldbyname('Use_Type').asinteger;

      end;
  EnableOK(self);
end;

procedure TfrmWtMaintMaterialUse.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtUseDescription.Text) <> '';
end;

procedure TfrmWtMaintMaterialUse.SaveToDB;
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
      parambyname('Material_Use').asinteger := iCode;

      parambyname('Use_Description').asstring := edtUseDescription.Text;
      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      parambyname('Use_Type').asinteger := rdgrpUseFor.ItemIndex;

      ExecSQL;
    end;
  end;
end;

function TfrmWtMaintMaterialUse.GetNextKey: integer;
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
      Result := FieldByName('Material_Use').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintMaterialUse.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Material_Use ' +
            '(Material_Use,Use_Description, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintMaterialUse.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Material_Use Where Material_Use = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintMaterialUse.FormShow(Sender: TObject);
begin
  edtUseDescription.setfocus;
end;

end.
