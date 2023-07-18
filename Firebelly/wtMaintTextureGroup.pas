unit wtMaintTextureGroup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, QrCtrls, ExtDlgs, jpeg, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtMaintTextureGroup = class(TForm)
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
    edtDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FFunctionMode: string;
    sImageLocation: string;
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
  frmWtMaintTextureGroup: TfrmWtMaintTextureGroup;

implementation

uses
  wtLUTextureGroup, wtDataModule, ComObj, ActiveX;
  
{$R *.DFM}

procedure TfrmWtMaintTextureGroup.btnOKClick(Sender: TObject);
var
  iPathLength, iFileLength: integer;
begin
  SaveToDB;
end;

procedure TfrmWtMaintTextureGroup.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintTextureGroup.FormActivate(Sender: TObject);
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
    with frmWTLUTextureGroup.qryTextureGroup do
      begin
        iCode := fieldbyname('Texture_Group').asinteger;

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

procedure TfrmWtMaintTextureGroup.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmWtMaintTextureGroup.Button3Click(Sender: TObject);
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

procedure  TfrmWtMaintTextureGroup.SaveToDB;
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
      parambyname('Texture_Group').asinteger := iCode;

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

function  TfrmWtMaintTextureGroup.GetNextKey: integer;
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
      Result := FieldByName('Texture_Group').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure  TfrmWtMaintTextureGroup.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Texture_Group ' +
            '(Texture_Group,Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure  TfrmWtMaintTextureGroup.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Texture_Group Where Texture_Group = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
