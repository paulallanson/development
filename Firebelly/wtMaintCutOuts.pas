unit wtMaintCutOuts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtDlgs, jpeg, ExtCtrls, DB, DBTables;

type
  TfrmWTMaintCutOuts = class(TForm)
    Label1: TLabel;
    chkbxShowOnline: TCheckBox;
    chkbxIncludeInSinkList: TCheckBox;
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtImagePath: TEdit;
    Label7: TLabel;
    Button3: TButton;
    edtDescription: TEdit;
    Panel1: TPanel;
    imgWorktop: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure chkbxShowOnlineClick(Sender: TObject);
  private
    FfunctionMode: string;
    sImageLocation: string;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    procedure SetfunctionMode(const Value: string);
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintCutOuts: TfrmWTMaintCutOuts;

implementation

uses wtDataModule, ComObj, ActiveX, wtLUCutOuts;

{$R *.dfm}

procedure TfrmWTMaintCutOuts.btnOKClick(Sender: TObject);
begin

  SaveToDB;

end;

procedure TfrmWTMaintCutOuts.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmWTMaintCutOuts.FormActivate(Sender: TObject);
begin
  sImageLocation := dtmdlWorktops.GetWebImageDirectory;

  if FunctionMode = 'A' then
    begin
      iCode := 0;
      
      edtDescription.Text := '';

      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;
      chkbxIncludeInSinkList.Checked := false;

      {Load image}
      edtImagePath.Text := '';
    end
  else
    with frmWTLUCutOuts.qryCutOut do
      begin
        iCode := fieldbyname('CutOut').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;

        chkbxShowOnline.Checked := (fieldbyname('Show_Online').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
        chkbxIncludeInSinkList.Checked := (fieldbyname('include_in_sink_list').asstring = 'Y');

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

procedure TfrmWTMaintCutOuts.Button3Click(Sender: TObject);
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

procedure TfrmWTMaintCutOuts.SaveToDB;
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
      parambyname('CutOut').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;

      if chkbxShowOnline.Checked then
        ParamByName('Show_Online').asstring := 'Y'
      else
        ParamByName('Show_Online').asstring := 'N';

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      if chkbxIncludeInSinkList.Checked then
        paramByName('Include_In_Sink_List').asstring := 'Y'
      else
        paramByName('Include_In_Sink_List').asstring := 'N';

      iPathLength := length(sImageLocation);
      iFileLength := length(trim(edtImagePath.text));

      ParamByName('Image_Path').asstring := copy(edtImagePath.text,iPathLength+2,(iFileLength-iPathLength+1));

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintCutOuts.GetNextKey: integer;
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
      Result := FieldByName('CutOut').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintCutOuts.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into CutOut ' +
            '(CutOut, Description, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintCutOuts.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From CutOut Where CutOut = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintCutOuts.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintCutOuts.chkbxShowOnlineClick(Sender: TObject);
begin
  if (Sender as TCheckbox).checked then
    begin
      chkbxIncludeInSinkList.enabled := true
    end
  else
    begin
      chkbxIncludeInSinkList.checked := false;
      chkbxIncludeInSinkList.enabled := false;
    end;
end;

end.
