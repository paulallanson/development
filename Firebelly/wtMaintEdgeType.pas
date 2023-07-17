unit wtMaintEdgeType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, QrCtrls, DB, DBTables;

type
  TfrmWTMaintEdgeType = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    chkbxShowOnline: TCheckBox;
    edtEdgeTypeDescription: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWTMaintEdgeType: TfrmWTMaintEdgeType;

implementation

uses wtLUEdgeTypes, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmWTMaintEdgeType.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintEdgeType.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintEdgeType.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtEdgeTypeDescription.Text := '';
      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLUEdgeTypes.qryEdgeType do
      begin
        iCode := fieldbyname('Edge_Type').asinteger;

        edtEdgeTypeDescription.Text := fieldbyname('Edge_Type_Description').asstring;
        chkbxShowOnline.Checked := (fieldbyname('Show_Online').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintEdgeType.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtEdgeTypeDescription.Text) <> '';
end;

procedure TfrmWTMaintEdgeType.SaveToDB;
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
      parambyname('Edge_Type').asinteger := iCode;

      parambyname('Edge_Type_Description').asstring := edtEdgeTypeDescription.Text;

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

function TfrmWTMaintEdgeType.GetNextKey: integer;
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
      Result := FieldByName('Edge_Type').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintEdgeType.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Edge_Type ' +
            '(Edge_Type, Edge_Type_Description, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintEdgeType.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Edge_Type Where Edge_Type = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
