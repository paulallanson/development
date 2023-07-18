unit WTMaintDesigner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintDesigner = class(TForm)
    label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    edtDesignerName: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    procedure btnOKClick(Sender: TObject);
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
  frmWTMaintDesigner: TfrmWTMaintDesigner;

implementation

uses WTLUDesigner, wtLUSalesLead, ComObj, ActiveX;

{$R *.dfm}

{ TForm1 }

procedure TfrmWTMaintDesigner.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintDesigner.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintDesigner.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtDesignerName.Text <> '');
end;

procedure TfrmWTMaintDesigner.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDesignerName.Text := '';
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLUDesigner.qryDesigner do
      begin
        iCode := fieldbyname('Designer').asinteger;

        edtDesignerName.Text := fieldbyname('Designer_Name').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintDesigner.SaveToDB;
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
      parambyname('Designer').asinteger := iCode;

      parambyname('Designer_Name').asstring := edtDesignerName.Text;

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintDesigner.GetNextKey: integer;
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
      Result := FieldByName('Designer').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintDesigner.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Designer ' +
            '(Designer, Designer_Name, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintDesigner.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Designer Where Designer = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
