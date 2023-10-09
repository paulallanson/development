unit wtMaintFinish;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, QrCtrls, ExtDlgs, jpeg, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtMaintFinish = class(TForm)
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
    Label9: TLabel;
    Label10: TLabel;
    edtDescription: TEdit;
    edtShortDescription: TEdit;
    memLongDescription: TMemo;
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
    iCode: Integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWtMaintFinish: TfrmWtMaintFinish;

implementation

uses
  wtLUFinish, wtDataModule, ComObj, ActiveX;

{$R *.DFM}

procedure TfrmWtMaintFinish.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintFinish.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintFinish.FormActivate(Sender: TObject);
begin
  sImageLocation := dtmdlWorktops.GetWebImageDirectory;

  if FunctionMode = 'A' then
    begin
      iCode := 0;
      
      edtDescription.Text := '';

      edtShortDescription.Text := '';
      memLongDescription.Text := '';

      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;

      {Load image}
      edtImagePath.Text := '';
    end
  else
    with frmWTLUFinish.qryWorktopFinish do
      begin
        iCode := fieldbyname('Worktop_Finish').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;

        edtShortDescription.Text := fieldbyname('Short_Description').asstring;
        memLongDescription.Text := fieldbyname('Long_Description').asstring;

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

procedure TfrmWtMaintFinish.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmWtMaintFinish.Button3Click(Sender: TObject);
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

procedure TfrmWtMaintFinish.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Worktop_Finish').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;

      parambyname('Short_Description').asstring := edtShortDescription.Text;
      parambyname('Long_Description').asstring := memLongDescription.Text;

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

function TfrmWtMaintFinish.GetNextKey: integer;
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
      Result := FieldByName('Worktop_Finish').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintFinish.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Worktop_Finish ' +
            '(Worktop_Finish,Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintFinish.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Worktop_Finish Where Worktop_Finish = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
