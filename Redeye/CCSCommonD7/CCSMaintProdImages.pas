unit CCSMaintProdImages;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtDlgs, Db, Buttons, ExtCtrls, DBCtrls, jpeg, GIFImage,
  ShellAPI,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCCSMaintProdImagesFrm = class(TForm)
    edtProdCode: TEdit;
    lblProdCode: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    btnBrowse2: TButton;
    btbtnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryInsECommInfo: TFDQuery;
    qryUpdECommInfo: TFDQuery;
    qrySelECommInfo: TFDQuery;
    qryTopECommNo: TFDQuery;
    DataSource1: TDataSource;
    qryUpdFullImg: TFDQuery;
    btbtnEraseImage2: TBitBtn;
    qryDelEcommInfo: TFDQuery;
    Label1: TLabel;
    memFullImagePath: TMemo;
    btnView: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnBrowse2Click(Sender: TObject);
    procedure btbtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btbtnEraseImage2Click(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
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
    procedure DeleteECommInfo;
    function NextECommNumber: integer;
    function GetJPEG(dsSource : TDataSet; Field : String; var Img : TImage): Integer;
    function GetBMP(dsSource: TDataSet; Field: string; var Img: TImage): Integer;
    function GetGIF(dsSource: TDataSet; Field: string; var Img: TImage): integer;
    procedure updateImages(eCommNo: integer);
    procedure SizeImages;
  public
    part: string;
    procedure Display(part: string);
  end;

var
  CCSMaintProdImagesFrm: TCCSMaintProdImagesFrm;

implementation

uses
  Registry, CCSImageViewer, pbDatabase, pbMainMenu;

{$R *.DFM}

function TCCSMaintProdImagesFrm.GetECommImageDirRegKey: string;
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

procedure TCCSMaintProdImagesFrm.SetECommImageDirRegKey(path: string);
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

procedure TCCSMaintProdImagesFrm.FormCreate(Sender: TObject);
begin
  self.ImagePath := '';
  memFullImagePath.text := '';
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmpbMainMenu.iOperator,0,0) ;
end;

function TCCSMaintProdImagesFrm.GetPath(fileName: string): string;
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

procedure TCCSMaintProdImagesFrm.btnBrowse2Click(Sender: TObject);
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
    self.OpenPictureDialog1.FileName := self.memFullImagePath.text;
  end;  

  if self.OpenPictureDialog1.Execute then
  begin
    memFullImagePath.text := self.OpenPictureDialog1.Files[0];

    //check to see if the directory has changed;
    tempStr := self.GetPath(self.OpenPictureDialog1.Files[0]);
    if tempStr <> self.ImagePath then
    begin
      self.SetECommImageDirRegKey(tempStr);
    end;
  end;
end;

procedure TCCSMaintProdImagesFrm.Display(part: string);
begin
  self.part := part;
  self.edtProdCode.Text := part;
  self.LoadECommInfo;
  self.ShowModal;
end;

procedure TCCSMaintProdImagesFrm.UpdateECommInfo;
begin
  self.updateImages(self.eCommNo);
end;

procedure TCCSMaintProdImagesFrm.LoadECommInfo;
begin
  self.qrySelECommInfo.Active := false;
  self.qrySelECommInfo.ParamByName('stock_reference').asString := self.part;
  self.qrySelECommInfo.Active := true;
  self.qrySelECommInfo.first;

  if self.qrySelECommInfo.RecordCount <> 0  then
  begin
    self.newRecord := false;
    self.eCommNo := self.qrySelECommInfo.FieldByName('Ecommerce_info').asInteger;

    self.memFullImagePath.Text := self.qrySelECommInfo.FieldByName('product_image_path').asstring;
  end
  else
  begin
    self.newRecord := true;
    self.btnBrowse2.Caption := 'Select Image';
    self.memFullImagePath.Text := '';
  end;
end;

procedure TCCSMaintProdImagesFrm.btbtnOKClick(Sender: TObject);
begin
  if self.newRecord then
  begin
    if (memFullImagePath.text <> '') then
    begin
      //there is an image to save so insert a record
      self.InsertECommInfo;
    end;
  end
  else
  begin
    if ((memFullImagePath.text = '')) then
    begin
      //the images have been cleared so delete the record
      self.DeleteECommInfo;
    end
    else
    begin
      //update a record
      if (memFullImagePath.text <> '') then
        self.UpdateECommInfo;
      //else nothing to update so do nothing
    end;
  end;
end;

procedure TCCSMaintProdImagesFrm.InsertECommInfo;
var
  newEcommNO: integer;
begin
  newEcommNO := self.NextECommNumber;
  self.qryInsECommInfo.paramByName('Ecommerce_info').asInteger := newEcommNO;
  self.qryInsECommInfo.paramByName('Stock_Reference').asString := self.part;
  self.qryInsECommInfo.ExecSQL;

  self.updateImages(newEcommNO);
end;

function TCCSMaintProdImagesFrm.NextECommNumber: integer;
begin
  self.qryTopECommNo.Active := false;
  self.qryTopECommNo.Active := true;

  Result := self.qryTopECommNo.FieldByName('top_no').asInteger + 1;
  self.qryTopECommNo.Active := false;
end;

procedure TCCSMaintProdImagesFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.qrySelECommInfo.Close;
end;

function TCCSMaintProdImagesFrm.GetJPEG(dsSource: TDataSet; Field: String;
  var Img: TImage): Integer;
var
  JPEG : TJpegImage;
  BLStream : TFDBlobStream;
begin
  Result := -1;
  Jpeg := TJPEGImage.Create;
  try
    //If field is not empty, we can proceed with JPEG retrieve
    if not dsSource.FieldByName(Field).isNull then
    begin
      BLStream := TFDBlobStream.Create(dsSource.FieldByName(Field) as TBLOBField, bmRead);
      try
        BLStream.Position := 0;
        try
          Jpeg.LoadFromStream(BLStream);
          Img.Picture.Assign(JPEG);
          Result := 1;
        except
        end;
      finally
        BLStream.Free;
      end;
    end; //if not isNull
  finally
    Jpeg.Free;
  end;
end;

procedure TCCSMaintProdImagesFrm.updateImages(eCommNo: integer);
var
  ext: string;
  tempStr: string;
  len: integer;
begin
  if ((memFullImagePath.text = '')) then
  begin
    self.qryUpdFullImg.ParamByName('full_image').clear;
    self.qryUpdFullImg.ParamByName('format').asString := '';
    self.qryUpdFullImg.ParamByName('product_image_path').asString := '';
    self.qryUpdFullImg.ParamByName('Date_Changed').asdatetime := now;
  end
  else
  begin
    self.qryUpdFullImg.ParamByName('full_image').LoadFromFile(memFullImagePath.text, ftBlob);
    tempStr := memFullImagePath.text;
    len := length(tempStr);
    ext := copy(tempStr, len - 2, 3);
    self.qryUpdFullImg.ParamByName('format').asString := UpperCase(ext);
    self.qryUpdFullImg.ParamByName('product_image_path').asString := memFullImagePath.text;
    self.qryUpdFullImg.ParamByName('Date_Changed').asdatetime := now;
  end;
  self.qryUpdFullImg.paramByName('Ecommerce_info').asInteger := eCommNo;
  self.qryUpdFullImg.ExecSQL;
end;

function TCCSMaintProdImagesFrm.GetBMP(dsSource: TDataSet; Field: string;
  var Img: TImage): Integer;
var
  BitMap : TBitMap;
  BLStream : TFDBlobStream;
begin
  Result := -1;
  BitMap := TBitMap.Create;
  try
    //If field is not empty, we can proceed with JPEG retrieve
    if not dsSource.FieldByName(Field).isNull then
    begin
      BLStream := TFDBlobStream.Create(dsSource.FieldByName(Field) as TBLOBField, bmRead);
      try
        BLStream.Position := 0;
        try
          BitMap.LoadFromStream(BLStream);
          Img.Picture.Assign(BitMap);
          Result := 1;
        except
        end;
      finally
        BLStream.Free;
      end;
    end; //if not isNull
  finally
    BitMap.Free;
  end;
end;

function TCCSMaintProdImagesFrm.GetGIF(dsSource: TDataSet; Field: string;
  var Img: TImage): integer;
var
  GIF : TGIFImage;
  BLStream : TFDBlobStream;
begin
  Result := -1;
  GIF := TGIFImage.Create;
  try
    //If field is not empty, we can proceed with JPEG retrieve
    if not dsSource.FieldByName(Field).isNull then
    begin
      BLStream := TFDBlobStream.Create(dsSource.FieldByName(Field) as TBLOBField, bmRead);
      try
        BLStream.Position := 0;
        try
          GIF.LoadFromStream(BLStream);
          Img.Transparent := GIF.isTransparent;
          Img.Picture.Assign(GIF.BitMap);
          Result := 1;
        except
        end;
      finally
        BLStream.Free;
      end;
    end; //if not isNull
  finally
    GIF.Free;
  end;
end;

procedure TCCSMaintProdImagesFrm.SizeImages;
begin
end;

procedure TCCSMaintProdImagesFrm.btbtnEraseImage2Click(Sender: TObject);
begin
  self.memFullImagePath.text := '';
end;

procedure TCCSMaintProdImagesFrm.DeleteECommInfo;
begin
  self.qryDelEcommInfo.ParamByName('ecomm_info').asInteger := self.eCommNo;
  self.qryDelEcommInfo.ExecSQL;
end;

procedure TCCSMaintProdImagesFrm.btnViewClick(Sender: TObject);
Var
  iTempResult: Integer;
  FiName, DiName, Params: Array [0..255] of char ;
  sTempError: String ;
begin
(*  if UpperCase(Copy(memFullImagePath.text,Length(memFullImagePath.text)-3,4)) <> '.PDF' then
    begin
      {NOT a PDF so just open the document} ;
      Params := '' ;
      StrPCopy(FiName, memFullImagePath.text) ;
    end
  else
    begin
      {IS a PDF so just open it in internet explorer} ;
      StrPCopy(Params, memFullImagePath.text) ;
      StrPCopy(FiName,'iExplore.exe') ;
    end;
*)

  {NOT a PDF so just open the document} ;
  Params := '' ;
  StrPCopy(FiName, memFullImagePath.text) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  if iTempResult <= 32 then
    begin
      {There was an error} ;
      sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
      Case iTempResult of
                ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
                ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
                ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
                SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
                SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
                SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
                SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
                SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
                SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
                SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
                SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
                SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
      end;
      MessageDlg(sTempError,mtError,[mbOK],0) ;
    end;
end;

end.
