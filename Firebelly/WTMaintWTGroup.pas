unit WTMaintWTGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, CRControls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintWTGroup = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    srclkpMatType: TDataSource;
    lkpMatType: TFDQuery;
    dblkpMaterialType: TDBLookupComboBox;
    Label2: TLabel;
    edtWorktopGroupDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  frmWTMaintWTGroup: TfrmWTMaintWTGroup;

implementation

uses wtLUWTGroup, wtDataModule, wtMain, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmWTMaintWTGroup.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintWTGroup.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtWorktopGroupDescription.Text) <> '');
end;

procedure TfrmWTMaintWTGroup.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintWTGroup.FormActivate(Sender: TObject);
begin

  with lkpMatType do
    begin
      close;
      open;
    end;

  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtWorktopGroupDescription.Text := '';
      dblkPMaterialType.KeyValue := frmWTLUWTGroup.dblkpMaterialType.KeyValue;
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLUWTGroup.qryWTGroup do
      begin
        iCode := fieldbyname('Worktop_Group').asinteger;

        edtWorktopGroupDescription.Text := fieldbyname('Worktop_Group_Description').asstring;
        dblkPMaterialType.KeyValue := fieldbyname('Material_Type').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintWTGroup.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Worktop_Group').asinteger := iCode;

      parambyname('Worktop_Group_Description').asstring := edtWorktopGroupDescription.Text;
      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintWTGroup.GetNextKey: integer;
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
      Result := FieldByName('Worktop_Group').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintWTGroup.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Worktop_Group ' +
            '(Worktop_Group, Worktop_Group_Description, Material_Type, inactive) ' +
            'VALUES(0, ''Dummy'', 1, ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintWTGroup.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Worktop_Group Where Worktop_Group = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
