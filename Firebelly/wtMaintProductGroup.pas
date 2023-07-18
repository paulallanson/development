unit wtMaintProductGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtMaintProductGroup = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    edtProductGroupDescription: TEdit;
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
    { Public declarations }
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWtMaintProductGroup: TfrmWtMaintProductGroup;

implementation

uses
  wtLUProductGroups, ComObj, ActiveX;
  
{$R *.DFM}

procedure TfrmWtMaintProductGroup.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintProductGroup.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintProductGroup.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtProductGroupDescription.Text := '';
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLUProductGroups.qryProductGroup do
      begin
        iCode := fieldbyname('Product_Group').asinteger;

        edtProductGroupDescription.Text := fieldbyname('Product_Group_Description').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWtMaintProductGroup.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtProductGroupDescription.Text) <> '';
end;

procedure TfrmWtMaintProductGroup.SaveToDB;
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
      parambyname('Product_Group').asinteger := iCode;

      parambyname('Product_Group_Description').asstring := edtProductGroupDescription.Text;

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWtMaintProductGroup.GetNextKey: integer;
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
      Result := FieldByName('Product_Group').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintProductGroup.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Product_Group ' +
            '(Product_Group, Product_Group_Description, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintProductGroup.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Product_Group Where Product_Group = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
