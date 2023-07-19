unit WTMaintRemedialCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, QrCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintRemedialCategory = class(TForm)
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
  frmWTMaintRemedialCategory: TfrmWTMaintRemedialCategory;

implementation

uses WTLURemedialCategory, ComObj, ActiveX;

{$R *.dfm}

{ TForm1 }

procedure TfrmWTMaintRemedialCategory.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintRemedialCategory.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintRemedialCategory.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtDescription.Text <> '');
end;

procedure TfrmWTMaintRemedialCategory.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDescription.Text := '';
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLURemedialCategory.qryRemedialCategory do
      begin
        iCode := fieldbyname('Remedial_Category').asinteger;

        edtDescription.Text := fieldbyname('Remedial_Category_Descr').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintRemedialCategory.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Remedial_Category_Descr').asstring := edtDescription.Text;

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
          parambyname('Remedial_Category').asinteger := iCode;

          parambyname('Remedial_Category_Descr').asstring := edtDescription.Text;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmWTMaintRemedialCategory.GetNextKey: integer;
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
      Result := FieldByName('Remedial_Category').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintRemedialCategory.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Remedial_Category ' +
            '(Remedial_Category, Remedial_Category_Descr, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintRemedialCategory.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Remedial_Category Where Remedial_Category = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TfrmWTMaintRemedialCategory.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Remedial_Category').AsInteger;
    end;
end;


end.
