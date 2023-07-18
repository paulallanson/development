unit wtMaintLevelofImportance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtMaintLevelofImportance = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    Label2: TLabel;
    edtColor: TEdit;
    Button1: TButton;
    Button2: TButton;
    ColorDialog1: TColorDialog;
    edtImportanceDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmwtMaintLevelofImportance: TfrmwtMaintLevelofImportance;

implementation

uses wtLULevelofImportance, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmwtMaintLevelofImportance.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmwtMaintLevelofImportance.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmwtMaintLevelofImportance.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtImportanceDescription.Text) <> '');
end;

procedure TfrmwtMaintLevelofImportance.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtImportanceDescription.Text := '';
      chkbxInactive.Checked := false;

    end
  else
    with frmWtLULevelofImportance.qryLevelofImportance do
      begin
        iCode := fieldbyname('Level_of_Importance').asinteger;

        edtImportanceDescription.Text := fieldbyname('Importance_Description').asstring;

        if FieldByName('Color').Asinteger <> 0 then
          begin
            edtColor.color := FieldByName('Color').Asinteger;
            edtColor.font.color := FieldByName('Font_Color').Asinteger;
          end;

        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmwtMaintLevelofImportance.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.Color := ColorDialog1.Color;

end;

procedure TfrmwtMaintLevelofImportance.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
    edtColor.font.Color := ColorDialog1.Color;

end;

procedure TfrmwtMaintLevelofImportance.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Importance_Description').asstring := edtImportanceDescription.Text;

          paramByName('Color').Asinteger := edtColor.Color;
          paramByName('Font_Color').Asinteger := edtColor.font.color;

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
          parambyname('Level_of_Importance').asinteger := iCode;

          parambyname('Importance_Description').asstring := edtImportanceDescription.Text;

          paramByName('Color').Asinteger := edtColor.Color;
          paramByName('Font_Color').Asinteger := edtColor.font.color;

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmwtMaintLevelofImportance.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Level_of_Importance').AsInteger;
    end;
end;

end.
