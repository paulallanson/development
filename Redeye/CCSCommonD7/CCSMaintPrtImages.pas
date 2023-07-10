unit CCSMaintPrtImages;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtDlgs, Db, DBTables, Buttons, ExtCtrls, DBCtrls, jpeg, GIFImage;

type
  TCCSMaintPrtImagesFrm = class(TForm)
    edtProdCode: TEdit;
    lblProdCode: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    btnBrowse2: TButton;
    btbtnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryInsECommInfo: TQuery;
    qryUpdECommInfo: TQuery;
    qrySelECommInfo: TQuery;
    qryTopECommNo: TQuery;
    DataSource1: TDataSource;
    lblPopUpImage: TLabel;
    Image2: TImage;
    lblFullImagePath: TLabel;
    qryUpdFullImg: TQuery;
    Shape2: TShape;
    btbtnEraseImage2: TBitBtn;
    qryDelEcommInfo: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnBrowse2Click(Sender: TObject);
    procedure btbtnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image2DblClick(Sender: TObject);
    procedure btbtnEraseImage2Click(Sender: TObject);
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
  CCSMaintPrtImagesFrm: TCCSMaintPrtImagesFrm;

implementation

uses
  Registry, CCSImageViewer;

{$R *.DFM}

function TCCSMaintPrtImagesFrm.GetECommImageDirRegKey: string;
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

procedure TCCSMaintPrtImagesFrm.SetECommImageDirRegKey(path: string);
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

procedure TCCSMaintPrtImagesFrm.FormCreate(Sender: TObject);
begin
  self.ImagePath := '';
  lblFullImagePath.Caption := '';
end;

function TCCSMaintPrtImagesFrm.GetPath(fileName: string): string;
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

procedure TCCSMaintPrtImagesFrm.btnBrowse2Click(Sender: TObject);
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
    self.OpenPictureDialog1.FileName := self.lblFullImagePath.caption;
  end;  

  if self.OpenPictureDialog1.Execute then
  begin
    self.Image2.Visible := true;
    self.Image2.Width := 158;
    self.Image2.Height := 223;
    lblFullImagePath.caption := self.OpenPictureDialog1.Files[0];

    //check to see if the directory has changed;
    tempStr := self.GetPath(self.OpenPictureDialog1.Files[0]);
    if tempStr <> self.ImagePath then
    begin
      self.SetECommImageDirRegKey(tempStr);
    end;
    self.Image2.Picture.LoadFromFile(lblFullImagePath.caption);
    self.SizeImages;
    self.btnBrowse2.Caption := 'Change Image';
  end;
end;

procedure TCCSMaintPrtImagesFrm.Display(part: string);
begin
  self.part := part;
  self.edtProdCode.Text := part;
  self.LoadECommInfo;
  self.ShowModal;
end;

procedure TCCSMaintPrtImagesFrm.UpdateECommInfo;
begin
  self.updateImages(self.eCommNo);
end;

procedure TCCSMaintPrtImagesFrm.LoadECommInfo;
begin
  self.qrySelECommInfo.Active := false;
  self.qrySelECommInfo.ParamByName('stock_reference').asString := self.part;
  self.qrySelECommInfo.Active := true;
  self.qrySelECommInfo.first;

  if self.qrySelECommInfo.RecordCount <> 0  then
  begin
    self.newRecord := false;
    self.eCommNo := self.qrySelECommInfo.FieldByName('Ecommerce_info').asInteger;

    if self.qrySelECommInfo.FieldByName('full_image_format').asString = 'JPG' then
      self.GetJPEG(qrySelECommInfo, 'full_image', Image2)
    else if self.qrySelECommInfo.FieldByName('full_image_format').asString = 'BMP' then
      self.GetBMP(qrySelECommInfo, 'full_image', Image2)
    else if self.qrySelECommInfo.FieldByName('full_image_format').asString = 'GIF' then
      self.GetGIF(qrySelECommInfo, 'full_image', Image2);

    self.SizeImages;
  end
  else
  begin
    self.newRecord := true;
    self.btnBrowse2.Caption := 'Select Image';
  end;
end;

procedure TCCSMaintPrtImagesFrm.btbtnOKClick(Sender: TObject);
begin
  if self.newRecord then
  begin
    if (lblFullImagePath.caption <> '') then
    begin
      //there is an image to save so insert a record
      self.InsertECommInfo;
    end;
  end
  else
  begin
    if ((lblFullImagePath.caption = '')
    and (self.Image2.Visible = false)) then
    begin
      //the images have been cleared so delete the record
      self.DeleteECommInfo;
    end
    else
    begin
      //update a record
      if (lblFullImagePath.caption <> '') then
        self.UpdateECommInfo;
      //else nothing to update so do nothing
    end;
  end;
end;

procedure TCCSMaintPrtImagesFrm.InsertECommInfo;
var
  newEcommNO: integer;
begin
  newEcommNO := self.NextECommNumber;
  self.qryInsECommInfo.paramByName('Ecommerce_info').asInteger := newEcommNO;
  self.qryInsECommInfo.paramByName('Stock_Reference').asString := self.part;
  self.qryInsECommInfo.ExecSQL;

  self.updateImages(newEcommNO);
end;

function TCCSMaintPrtImagesFrm.NextECommNumber: integer;
begin
  self.qryTopECommNo.Active := false;
  self.qryTopECommNo.Active := true;

  Result := self.qryTopECommNo.FieldByName('top_no').asInteger + 1;
  self.qryTopECommNo.Active := false;
end;

procedure TCCSMaintPrtImagesFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.qrySelECommInfo.Close;
end;

procedure TCCSMaintPrtImagesFrm.Image2DblClick(Sender: TObject);
begin
  //display image full size in a new form
  CCSImageViewerFrm := TCCSImageViewerFrm.create(self);
  try
    CCSImageViewerFrm.Image1.Picture := self.Image2.Picture;
    CCSImageViewerFrm.showmodal;
  finally
    CCSImageViewerFrm.free;
  end;
end;

function TCCSMaintPrtImagesFrm.GetJPEG(dsSource: TDataSet; Field: String;
  var Img: TImage): Integer;
var
  JPEG : TJpegImage;
  BLStream : TBlobStream;
begin
  Result := -1;
  Jpeg := TJPEGImage.Create;
  try
    //If field is not empty, we can proceed with JPEG retrieve
    if not dsSource.FieldByName(Field).isNull then
    begin
      BLStream := TBLOBStream.Create(dsSource.FieldByName(Field) as TBLOBField, bmRead);
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

procedure TCCSMaintPrtImagesFrm.updateImages(eCommNo: integer);
var
  ext: string;
  tempStr: string;
  len: integer;
begin
  if ((lblFullImagePath.caption = '')
  and (self.Image2.Visible = false)) then
  begin
    self.qryUpdFullImg.ParamByName('full_image').clear;
    self.qryUpdFullImg.ParamByName('format').asString := '';
  end
  else
  begin
    self.qryUpdFullImg.ParamByName('full_image').LoadFromFile(lblFullImagePath.caption, ftBlob);
    tempStr := lblFullImagePath.caption;
    len := length(tempStr);
    ext := copy(tempStr, len - 2, 3);
    self.qryUpdFullImg.ParamByName('format').asString := UpperCase(ext);
  end;
  self.qryUpdFullImg.paramByName('Ecommerce_info').asInteger := eCommNo;
  self.qryUpdFullImg.ExecSQL;
end;

function TCCSMaintPrtImagesFrm.GetBMP(dsSource: TDataSet; Field: string;
  var Img: TImage): Integer;
var
  BitMap : TBitMap;
  BLStream : TBlobStream;
begin
  Result := -1;
  BitMap := TBitMap.Create;
  try
    //If field is not empty, we can proceed with JPEG retrieve
    if not dsSource.FieldByName(Field).isNull then
    begin
      BLStream := TBLOBStream.Create(dsSource.FieldByName(Field) as TBLOBField, bmRead);
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

function TCCSMaintPrtImagesFrm.GetGIF(dsSource: TDataSet; Field: string;
  var Img: TImage): integer;
var
  GIF : TGIFImage;
  BLStream : TBlobStream;
begin
  Result := -1;
  GIF := TGIFImage.Create;
  try
    //If field is not empty, we can proceed with JPEG retrieve
    if not dsSource.FieldByName(Field).isNull then
    begin
      BLStream := TBLOBStream.Create(dsSource.FieldByName(Field) as TBLOBField, bmRead);
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

procedure TCCSMaintPrtImagesFrm.SizeImages;
begin
  lblPopUpImage.Caption := 'Product Image ('
    + IntToStr(self.Image2.Picture.width) + 'x'
    + IntToStr(Image2.Picture.Height) + ')';
  if (self.Image2.Height < self.Image2.Picture.Height)
  or (self.Image2.width < self.Image2.Picture.width) then
  begin
    self.Image2.Stretch := true;
    self.Image2.Height :=
      trunc(self.Image2.width *
      (self.Image2.Picture.Height / self.Image2.Picture.width));
  end
  else
    self.Image2.Stretch := false;

  if self.Image2.Picture.Height > 0 then
  begin
    if self.Image2.Picture.Height < self.Image2.Height then
    begin
      self.Image2.Height := self.Image2.Picture.Height;
    end;
    self.Shape2.Height := self.Image2.Height + 2;
  end;

  if self.Image2.Picture.width > 0 then
  begin
    if self.Image2.Picture.width < self.Image2.width then
    begin
      self.Image2.width := self.Image2.Picture.width;
    end;
    self.Shape2.Width := self.Image2.Width + 2;
  end;
end;

procedure TCCSMaintPrtImagesFrm.btbtnEraseImage2Click(Sender: TObject);
begin
  self.Image2.Visible := false;
  self.Shape2.width := 158;
  self.Shape2.Height := 223;
  self.lblFullImagePath.Caption := '';
  lblPopUpImage.Caption := 'Product Image';
end;

procedure TCCSMaintPrtImagesFrm.DeleteECommInfo;
begin
  self.qryDelEcommInfo.ParamByName('ecomm_info').asInteger := self.eCommNo;
  self.qryDelEcommInfo.ExecSQL;
end;

end.
