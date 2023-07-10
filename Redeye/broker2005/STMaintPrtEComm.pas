unit STMaintPrtEComm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtDlgs, Db, DBTables, Buttons;

type
  TSTMaintPrtECommFrm = class(TForm)
    edtProdCode: TEdit;
    lblProdCode: TLabel;
    edtPromptInfo: TEdit;
    lblPromptInfo: TLabel;
    edtThmNailFile: TEdit;
    lblThmNail: TLabel;
    chkbxPopupYN: TCheckBox;
    lblPopUp: TLabel;
    edtPopImagePath: TEdit;
    lblPopImagePath: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    btnBrowse1: TButton;
    btnBrowse2: TButton;
    btbtnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryInsECommInfo: TQuery;
    qryUpdECommInfo: TQuery;
    qrySelECommInfo: TQuery;
    qryTopECommNo: TQuery;
    procedure btnBrowse1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBrowse2Click(Sender: TObject);
    procedure btbtnOKClick(Sender: TObject);
    procedure chkbxPopupYNClick(Sender: TObject);
  private
    eCommNo: integer;
    newRecord: boolean;
    ImagePath: string;
    procedure SetECommImageDirRegKey(path: string);
    function GetECommImageDirRegKey: string;
    function GetPath(fileName: string): string;
    procedure LoadECommInfo;
    procedure UpdateECommInfo;
    procedure InsertECommInfo;
    function NextECommNumber: integer;
  public
    part: string;
    procedure Display(part: string);
  end;

var
  STMaintPrtECommFrm: TSTMaintPrtECommFrm;

implementation

uses
  Registry;

{$R *.DFM}

procedure TSTMaintPrtECommFrm.btnBrowse1Click(Sender: TObject);
var
  tempStr: string;
begin
  if self.ImagePath = '' then
  begin
    self.ImagePath := self.GetECommImageDirRegKey;
  end;

  if self.ImagePath <> '' then
  begin
    self.OpenPictureDialog1.InitialDir := self.ImagePath;
  end;

  if self.OpenPictureDialog1.Execute then
  begin
    self.edtThmNailFile.Text := self.OpenPictureDialog1.Files[0];

    //check to see if the directory has changed;
    tempStr := self.GetPath(self.OpenPictureDialog1.Files[0]);
    if tempStr <> self.ImagePath then
    begin
      self.SetECommImageDirRegKey(tempStr);
    end;
  end;
end;

function TSTMaintPrtECommFrm.GetECommImageDirRegKey: string;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Centrereed Ltd\Centrereed Broker', False) then
    begin
      Result := Reg.ReadString('ECommImageDir');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TSTMaintPrtECommFrm.SetECommImageDirRegKey(path: string);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Centrereed Ltd\Centrereed Broker', True) then
    begin
      Reg.WriteString('ECommImageDir', path);
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TSTMaintPrtECommFrm.FormCreate(Sender: TObject);
begin
  self.ImagePath := '';
end;

function TSTMaintPrtECommFrm.GetPath(fileName: string): string;
var
  tempstr: string;
begin
  tempStr := fileName;

  while Pos('\', tempStr) <> 0 do
  begin
    delete(tempStr, 1, Pos('\', tempStr));
  end;

  Result := copy(fileName, 1, length(fileName) - length(tempStr));
end;

procedure TSTMaintPrtECommFrm.btnBrowse2Click(Sender: TObject);
var
  tempStr: string;
begin
  if self.ImagePath = '' then
  begin
    self.ImagePath := self.GetECommImageDirRegKey;
  end;

  if self.ImagePath <> '' then
  begin
    self.OpenPictureDialog1.InitialDir := self.ImagePath;
  end;  

  if self.OpenPictureDialog1.Execute then
  begin
    self.edtPopImagePath.text := self.OpenPictureDialog1.Files[0];

    //check to see if the directory has changed;
    tempStr := self.GetPath(self.OpenPictureDialog1.Files[0]);
    if tempStr <> self.ImagePath then
    begin
      self.SetECommImageDirRegKey(tempStr);
    end;
  end;
end;

procedure TSTMaintPrtECommFrm.Display(part: string);
begin
  self.part := part;
  self.edtProdCode.Text := part;
  self.LoadECommInfo;
  self.ShowModal;
end;

procedure TSTMaintPrtECommFrm.UpdateECommInfo;
begin
  self.qryUpdECommInfo.paramByName('Stock_Reference').asString := self.part;
  self.qryUpdECommInfo.paramByName('Other_info_prompt').asString := self.edtPromptInfo.text;
  self.qryUpdECommInfo.paramByName('Thumbnail_image').asString := self.edtThmNailFile.text;
  if self.chkbxPopupYN.checked then
  begin
    self.qryUpdECommInfo.paramByName('Generate_popup').asInteger := 1;
    self.qryUpdECommInfo.paramByName('Popup_image').asString := self.edtPopImagePath.Text;
  end
  else
  begin
    self.qryUpdECommInfo.paramByName('Generate_popup').asInteger := 0;
    self.qryUpdECommInfo.paramByName('Popup_image').clear;
  end;
  self.qryUpdECommInfo.paramByName('Ecommerce_info').asInteger := self.eCommNo;

  self.qryUpdECommInfo.ExecSQL;
end;

procedure TSTMaintPrtECommFrm.LoadECommInfo;
begin
  self.qrySelECommInfo.Active := false;
  self.qrySelECommInfo.ParamByName('stock_reference').asString := self.part;
  self.qrySelECommInfo.Active := true;

  if self.qrySelECommInfo.RecordCount > 0 then
  begin
    self.newRecord := false;
    self.eCommNo := self.qrySelECommInfo.FieldByName('Ecommerce_info').asInteger;
    self.edtPromptInfo.Text :=
      self.qrySelECommInfo.FieldByName('Other_info_prompt').asString;
    self.edtThmNailFile.Text :=
      self.qrySelECommInfo.FieldByName('Thumbnail_image').asString;
    self.chkbxPopupYN.Checked :=
      (self.qrySelECommInfo.FieldByName('Generate_popup').asInteger = 1);
    self.edtPopImagePath.Text :=
      self.qrySelECommInfo.FieldByName('Popup_image').asString;
  end
  else
  begin
    self.newRecord := true;
  end;
  self.qrySelECommInfo.Active := false;
end;

procedure TSTMaintPrtECommFrm.btbtnOKClick(Sender: TObject);
begin
  if self.newRecord then
  begin
    //insert a record
    self.InsertECommInfo;
  end
  else
  begin
    //update a record
    self.UpdateECommInfo;
  end;
end;

procedure TSTMaintPrtECommFrm.InsertECommInfo;
begin
  self.qryInsECommInfo.paramByName('Ecommerce_info').asInteger :=
    self.NextECommNumber;
  self.qryInsECommInfo.paramByName('Stock_Reference').asString := self.part;
  self.qryInsECommInfo.paramByName('Other_info_prompt').asString := self.edtPromptInfo.text;
  self.qryInsECommInfo.paramByName('Thumbnail_image').asString := self.edtThmNailFile.text;
  if self.chkbxPopupYN.checked then
  begin
    self.qryInsECommInfo.paramByName('Generate_popup').asInteger := 1;
    self.qryInsECommInfo.paramByName('Popup_image').asString := self.edtPopImagePath.Text;
  end
  else
  begin
    self.qryInsECommInfo.paramByName('Generate_popup').asInteger := 0;
    self.qryInsECommInfo.paramByName('Popup_image').clear;
  end;

  self.qryInsECommInfo.ExecSQL;
end;

function TSTMaintPrtECommFrm.NextECommNumber: integer;
begin
  self.qryTopECommNo.Active := false;
  self.qryTopECommNo.Active := true;

  Result := self.qryTopECommNo.FieldByName('top_no').asInteger + 1;
  self.qryTopECommNo.Active := false;
end;

procedure TSTMaintPrtECommFrm.chkbxPopupYNClick(Sender: TObject);
begin
  self.edtPopImagePath.enabled :=  self.chkbxPopupYN.Checked;
  self.btnBrowse2.Enabled := self.chkbxPopupYN.Checked;
end;

end.
