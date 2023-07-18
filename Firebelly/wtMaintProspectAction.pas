unit wtMaintProspectAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintProspectAction = class(TForm)
    lblName: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtProspectActionDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
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
  frmWTMaintProspectAction: TfrmWTMaintProspectAction;

implementation

uses wtLUProspectAction, ComObj, ActiveX;

{$R *.dfm}

{ TfrmWTMaintReps }

procedure TfrmWTMaintProspectAction.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintProspectAction.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintProspectAction.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtProspectActionDescription.Text) <> '';
end;

function TfrmWTMaintProspectAction.GetCustomerName(tempCust: integer): string;
begin
end;

procedure TfrmWTMaintProspectAction.FormShow(Sender: TObject);
begin
  EnableOK(Self);
end;

procedure TfrmWTMaintProspectAction.SaveToDB;
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
      parambyname('Prospect_Action').asinteger := iCode;

      parambyname('Prospect_Action_Description').asstring := edtProspectActionDescription.Text;

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintProspectAction.GetNextKey: integer;
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
      Result := FieldByName('Prospect_Action').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintProspectAction.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Prospect_Action ' +
            '(Prospect_Action, Prospect_Action_Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintProspectAction.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Prospect_Action Where Prospect_Action = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintProspectAction.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtProspectActionDescription.Text := '';
    end
  else
    with frmWTLUProspectAction.qryAction do
      begin
        iCode := fieldbyname('Prospect_Action').asinteger;

        edtProspectActionDescription.Text := fieldbyname('Prospect_Action_Description').asstring;
      end;
  EnableOK(self);

end;

end.
