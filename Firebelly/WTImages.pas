unit WTImages;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, CCSCommon, jpeg;

type
  TPBImagesFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ReportImage: TImage;
    OffBitBtn: TBitBtn;
    OnBitBtn: TBitBtn;
    ReportInvoiceImage: TImage;
    ReportImage1: TImage;
    ReportImage2: TImage;
    ReportImage3: TImage;
    procedure LoadReportLogo(Sender: TObject);
  private
    FDefaultLogo: string;
    FDefaultInvoiceLogo: string;
    FDefaultLogo1: string;
    FDefaultLogo3: string;
    FDefaultLogo2: string;
    procedure SetDefaultLogo(const Value: string);
    procedure SetDefaultInvoiceLogo(const Value: string);
    procedure SetDefaultLogo1(const Value: string);
    procedure SetDefaultLogo2(const Value: string);
    procedure SetDefaultLogo3(const Value: string);
    { Private declarations }
  public
    property DefaultLogo: string read FDefaultLogo write SetDefaultLogo;
    property DefaultLogo1: string read FDefaultLogo1 write SetDefaultLogo1;
    property DefaultLogo2: string  read FDefaultLogo2 write SetDefaultLogo2;
    property DefaultLogo3: string  read FDefaultLogo3 write SetDefaultLogo3;
    property DefaultInvoiceLogo: string read FDefaultInvoiceLogo write SetDefaultInvoiceLogo;
  end;

var
  PBImagesFrm: TPBImagesFrm;

implementation


uses
  FireDAC.Comp.Client;

{$R *.DFM}

procedure TPBImagesFrm.LoadReportLogo(Sender: TObject);
var
  TempArray: array[0..255] of Char;
  sgList: TStringList;
  sDatabase, LocalDrive, LocalDir: string;
  AppIniFile: Array [0..255] of char;
begin
  LocalDir := extractfilepath(application.ExeName);

  if pos('Application Data',LocalDir) > 0 then
    StrPCopy(AppIniFile,LocalDir+'Redeye.ini')
  else
    StrPCopy(AppIniFile,'Redeye.ini');

  GetPrivateProfileString('Centrereed Broker', 'LoginAlias', 'Broker', TempArray,
    sizeof(TempArray), AppIniFile);

  sgList := TStringList.Create;
  try
    FDManager.GetConnectionDefParams(TempArray,sgList);
    sDatabase := sgList.Values['DATABASE NAME'];
  finally
    sgList.free;
  end;

  try
    ReportImage.Picture.LoadFromFile(LocalDir+sDatabase+'\PBRepLogo.bmp');
    DefaultLogo := LocalDir+sDatabase+'\PBRepLogo.bmp';
  except
    ReportImage.Picture.LoadFromFile('PBRepLogo.bmp');
    DefaultLogo := 'PBRepLogo.bmp';
  end;

  try
    ReportImage1.Picture.LoadFromFile(LocalDir+sDatabase+'\PBRepLogo1.bmp');
    DefaultLogo1 := LocalDir+sDatabase+'\PBRepLogo1.bmp';
  except
    begin
      try
        ReportImage1.Picture.LoadFromFile('PBRepLogo1.bmp');
        DefaultLogo1 := 'PBRepLogo1.bmp';
      except
        ReportImage1.Picture := nil;
        DefaultLogo1 := '';
      end;
    end;
  end;

  try
    ReportImage2.Picture.LoadFromFile(LocalDir+sDatabase+'\PBRepLogo2.bmp');
    DefaultLogo2 := LocalDir+sDatabase+'\PBRepLogo2.bmp';
  except
    begin
      try
        ReportImage2.Picture.LoadFromFile('PBRepLogo2.bmp');
        DefaultLogo2 := 'PBRepLogo1.bmp';
      except
        ReportImage2.Picture := nil;
        DefaultLogo2 := '';
      end;
    end;
  end;

  try
    ReportImage3.Picture.LoadFromFile(LocalDir+sDatabase+'\PBRepLogo3.bmp');
    DefaultLogo3 := LocalDir+sDatabase+'\PBRepLogo3.bmp';
  except
    begin
      try
        ReportImage3.Picture.LoadFromFile('PBRepLogo3.bmp');
        DefaultLogo3 := 'PBRepLogo3.bmp';
      except
        ReportImage3.Picture := nil;
        DefaultLogo3 := '';
      end;
    end;
  end;

  try
    ReportInvoiceImage.Picture.LoadFromFile(LocalDir+sDatabase+'\PBRepLogo_Invoice.bmp');
    DefaultInvoiceLogo := LocalDir+sDatabase+'\PBRepLogo_Invoice.bmp';
  except
    try
      ReportInvoiceImage.Picture.LoadFromFile('PBRepLogo_Invoice.bmp');
      DefaultInvoiceLogo := 'PBRepLogo_Invoice.bmp';
    except
      ReportInvoiceImage.Picture.LoadFromFile('PBRepLogo.bmp');
      DefaultInvoiceLogo := 'PBRepLogo.bmp';
    end;
  end;
end;

procedure TPBImagesFrm.SetDefaultInvoiceLogo(const Value: string);
begin
  FDefaultInvoiceLogo := Value;
end;

procedure TPBImagesFrm.SetDefaultLogo(const Value: string);
begin
  FDefaultLogo := Value;
end;

procedure TPBImagesFrm.SetDefaultLogo1(const Value: string);
begin
  FDefaultLogo1 := Value;
end;

procedure TPBImagesFrm.SetDefaultLogo2(const Value: string);
begin
  FDefaultLogo2 := Value;
end;

procedure TPBImagesFrm.SetDefaultLogo3(const Value: string);
begin
  FDefaultLogo3 := Value;
end;

end.
