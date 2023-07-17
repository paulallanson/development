unit wtMaintColourGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, QrCtrls, DB, DBTables, StrUtils;

type
  TfrmWtMaintColourGroup = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    chkbxShowOnline: TCheckBox;
    ColorDialog1: TColorDialog;
    memColour: TMemo;
    Label2: TLabel;
    edtColourCode: TEdit;
    Label3: TLabel;
    edtDescription: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure memColourDblClick(Sender: TObject);
    procedure edtColourCode1Change(Sender: TObject);
    procedure edtColourCodeChange(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    function TColorToHex(Color: TColor): string;
    function HexToTColor(sColor: string): TColor;
    procedure SaveToDB;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    { Private declarations }
  public
    { Public declarations }
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWtMaintColourGroup: TfrmWtMaintColourGroup;

implementation

uses  wtLUColourGroup, ComObj, ActiveX;
  
{$R *.DFM}

procedure TfrmWtMaintColourGroup.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintColourGroup.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintColourGroup.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDescription.Text := '';
      edtColourCode.Text := '';
      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;

    end
  else
    with frmWtLUColourGroup.qryColourGroup do
      begin
        iCode := fieldbyname('Colour_Group').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;
        edtColourCode.Text := fieldbyname('Colour_Code').asstring;

        chkbxShowOnline.Checked := (fieldbyname('Show_online').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWtMaintColourGroup.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (trim(edtDescription.Text) <> '') and
                  (trim(edtColourCode.Text) <> '');
end;

procedure TfrmWtMaintColourGroup.memColourDblClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
    begin
      memColour.color := ColorDialog1.Color;
      edtColourCode.Text := TColorToHex(ColorDialog1.Color);
    end;
end;

function TfrmWtMaintColourGroup.TColorToHex( Color : TColor ): string;
begin
  Result :=
    { red value }
    IntToHex( GetRValue( Color ), 2 ) +
    { green value }
    IntToHex( GetGValue( Color ), 2 ) +
    { blue value }
    IntToHex( GetBValue( Color ), 2 );
end;

function TfrmWtMaintColourGroup.HexToTColor( sColor : string ): TColor;
begin
  Result :=
    RGB(
      { get red value }
      StrToInt( '$'+Copy( sColor, 1, 2 ) ),
      { get green value }
      StrToInt( '$'+Copy( sColor, 3, 2 ) ),
      { get blue value }
      StrToInt( '$'+Copy( sColor, 5, 2 ) )
    );
end;

procedure TfrmWtMaintColourGroup.edtColourCode1Change(Sender: TObject);
begin
  try
    begin
//      memColour.color := HexToTColor(frmWTLUColourGroup.tblColourGroup.fieldbyname('Colour_Code').asstring);
      memColour.color := HexToTColor(edtColourCode.text);
    end
  except
    memColour.color := clWhite;
  end;
end;

procedure TfrmWtMaintColourGroup.edtColourCodeChange(Sender: TObject);
begin
  try
    begin
//      memColour.color := HexToTColor(frmWTLUColourGroup.tblColourGroup.fieldbyname('Colour_Code').asstring);
      memColour.color := HexToTColor(edtColourCode.text);
    end
  except
    memColour.color := clWhite;
  end;
  EnableOK(self);
end;

procedure TfrmWtMaintColourGroup.SaveToDB;
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
        parambyname('Colour_Group').asinteger := iCode;

        parambyname('Description').asstring := edtDescription.Text;

        if LeftStr(edtColourCode.Text,1) = '#' then
          parambyname('Colour_Code').asstring := edtColourCode.Text
        else
          parambyname('Colour_Code').asstring := '#'+ edtColourCode.Text;


        if chkbxShowOnline.Checked then
          parambyname('Show_Online').asstring := 'Y'
        else
          parambyname('Show_Online').asstring := 'N';

        if chkbxInactive.Checked then
          parambyname('inActive').asstring := 'Y'
        else
          parambyname('inActive').asstring := 'N';

        ExecSQL;
      end;
  end;
end;

function TfrmWtMaintColourGroup.GetNextKey: integer;
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
      Result := FieldByName('Colour_Group').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintColourGroup.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Colour_Group ' +
            '(Colour_Group, Description, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintColourGroup.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Colour_Group Where Colour_Group = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
