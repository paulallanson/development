unit WTMaintRemedialDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, QrCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintRemedialDept = class(TForm)
    label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    edtDescription: TEdit;
    qryUpdate: TFDQuery;
    qryZero: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
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
    function GetLastKey: integer;
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintRemedialDept: TfrmWTMaintRemedialDept;

implementation

uses WTLURemedialDept, ComObj, ActiveX;

{$R *.dfm}

{ TForm1 }

procedure TfrmWTMaintRemedialDept.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintRemedialDept.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintRemedialDept.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtDescription.Text <> '');
end;

procedure TfrmWTMaintRemedialDept.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDescription.Text := '';
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLURemedialDept.qryRemedialDept do
      begin
        iCode := fieldbyname('Remedial_Dept').asinteger;

        edtDescription.Text := fieldbyname('Remedial_Dept_Descr').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintRemedialDept.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Remedial_Dept_Descr').asstring := edtDescription.Text;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('Remedial_Dept').asinteger := iCode;

          parambyname('Remedial_Dept_Descr').asstring := edtDescription.Text;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmWTMaintRemedialDept.GetNextKey: integer;
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
      Result := FieldByName('Remedial_Dept').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintRemedialDept.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Remedial_Dept ' +
            '(Remedial_Dept, Remedial_Dept_Descr, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintRemedialDept.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Remedial_Dept Where Remedial_Dept = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TfrmWTMaintRemedialDept.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Remedial_Dept').AsInteger;
    end;
end;


end.
