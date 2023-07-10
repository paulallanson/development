unit WTMaintEdges;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, gtQrCtrls, ExtDlgs, jpeg,
  ExtCtrls, DB, DBTables;

type
  TfrmWTMaintEdges = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    chkbxShowOnline: TCheckBox;
    Label7: TLabel;
    edtImagePath: TEdit;
    Button3: TButton;
    Panel1: TPanel;
    imgWorktop: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    edtDescription: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FfunctionMode: string;
    sImageLocation: string;
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
  frmWTMaintEdges: TfrmWTMaintEdges;

implementation

uses wtLUEdges, wtDataModule, ComObj, ActiveX;

{$R *.dfm}

{ TfrmWTMaintEdges }

procedure TfrmWTMaintEdges.SetfunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintEdges.btnOKClick(Sender: TObject);
var
  iPathLength, iFileLength: integer;
begin

  SaveToDB;
end;

procedure TfrmWTMaintEdges.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmWTMaintEdges.FormActivate(Sender: TObject);
begin
  sImageLocation := dtmdlWorktops.GetWebImageDirectory;

  if FunctionMode = 'A' then
    begin
      iCode := 0;
      
      edtDescription.Text := '';

      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;

      {Load image}
      edtImagePath.Text := '';
    end
  else
    with frmWTLUEdges.qryEdgeProfile do
      begin
        iCode := fieldbyname('Edge_Profile').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;

        chkbxShowOnline.Checked := (fieldbyname('Show_Online').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');

        {Load image}
        try
          imgWorktop.Picture.LoadFromFile(sImageLocation + '\' + fieldbyname('Image_Path').asstring);
          edtImagePath.Text := sImageLocation + '\' + fieldbyname('Image_Path').asstring;
        except
          imgWorktop.Picture.LoadFromFile('');
          edtImagePath.Text := '';
        end;

        if fieldbyname('Image_Path').asstring = '' then
          edtImagePath.Text := '';

      end;

  edtDescription.SetFocus;
  EnableOK(self);
end;

procedure TfrmWTMaintEdges.Button3Click(Sender: TObject);
begin
  with TOpenPictureDialog.Create(nil) do
    try
//      Caption := 'Open Image';
      Options := [ofPathMustExist, ofFileMustExist];
      if Execute then
        begin
          imgWorktop.Picture.LoadFromFile(FileName);
          edtImagePath.text := filename;
        end;
    finally
      Free;
    end;

end;

procedure TfrmWTMaintEdges.SaveToDB;
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
      parambyname('Edge_Profile').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;

      if chkbxShowOnline.Checked then
        ParamByName('Show_Online').asstring := 'Y'
      else
        ParamByName('Show_Online').asstring := 'N';

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      iPathLength := length(sImageLocation);
      iFileLength := length(trim(edtImagePath.text));

      ParamByName('Image_Path').asstring := copy(edtImagePath.text,iPathLength+2,(iFileLength-iPathLength+1));

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintEdges.GetNextKey: integer;
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
      Result := FieldByName('Edge_Profile').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintEdges.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Edge_Profile ' +
            '(Edge_Profile, Description, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintEdges.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Edge_Profile Where Edge_Profile = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
