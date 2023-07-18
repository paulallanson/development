unit wtMaintAppointmentType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintAppointmentType = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    edtColor: TEdit;
    Button1: TButton;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    edtName: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  frmWTMaintAppointmentType: TfrmWTMaintAppointmentType;

implementation

uses wtLUAppointmentType, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmWTMaintAppointmentType.btnOKClick(Sender: TObject);
begin
  SaveToDB;

end;

procedure TfrmWTMaintAppointmentType.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintAppointmentType.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtName.Text) <> '');
end;

procedure TfrmWTMaintAppointmentType.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtName.Text := '';
    end
  else
    with frmWtLUAppointmentType.qryAppointmentType do
      begin
        iCode := fieldbyname('ID').asinteger;

        edtName.Text := fieldbyname('Name').asstring;

        if FieldByName('AppointmentColour').Asinteger <> 0 then
          begin
(*            edtColor.color := FieldByName('Color').Asinteger;
            edtColor.font.color := FieldByName('Font_Color').Asinteger;
*)
          end;

      end;

  EnableOK(self);
end;

procedure TfrmWTMaintAppointmentType.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.Color := ColorDialog1.Color;

end;

procedure TfrmWTMaintAppointmentType.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.font.Color := ColorDialog1.Color;

end;

procedure TfrmWTMaintAppointmentType.SaveToDB;
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
        parambyname('ID').asinteger := iCode;

        parambyname('Name').asstring := edtName.Text;

//        paramByName('AppointmentColour').Asinteger := edtColor.Color;
//        paramByName('Font_Colour').Asinteger := edtColor.font.color;

        ExecSQL;
      end;
  end;
end;

function TfrmWTMaintAppointmentType.GetNextKey: integer;
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
      Result := FieldByName('ID').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintAppointmentType.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into AppointmentType ' +
            '(ID, Name) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintAppointmentType.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From AppointmentType Where ID = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
