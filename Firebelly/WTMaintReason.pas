unit WTMaintReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, QrCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintReason = class(TForm)
    label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtInactiveReasonDescr: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
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
  frmWTMaintReason: TfrmWTMaintReason;

implementation

uses WTLUReason, ComObj, ActiveX;

{$R *.dfm}

{ TForm1 }

procedure TfrmWTMaintReason.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintReason.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintReason.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtInactiveReasonDescr.Text <> '');
end;

procedure TfrmWTMaintReason.FormShow(Sender: TObject);
begin
  EnableOK(Self);
end;

procedure TfrmWTMaintReason.SaveToDB;
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
      parambyname('Inactive_Reason').asinteger := iCode;

      parambyname('Inactive_Reason_Descr').asstring := edtInactiveReasonDescr.Text;
      parambyname('Inactive_Type').asstring := 'Q';

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintReason.GetNextKey: integer;
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
      Result := FieldByName('Inactive_Reason').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintReason.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Inactive_Reason ' +
            '(Inactive_Reason, Inactive_Reason_Descr, Inactive_Type) ' +
            'VALUES(0, ''Dummy'', ''Q'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintReason.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Inactive_Reason Where Inactive_Reason = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintReason.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtInactiveReasonDescr.Text := '';
    end
  else
    with frmWTLUReason.qryReason do
      begin
        iCode := fieldbyname('Inactive_Reason').asinteger;

        edtInactiveReasonDescr.Text := fieldbyname('Inactive_Reason_Descr').asstring;
      end;
  EnableOK(self);

end;

end.
