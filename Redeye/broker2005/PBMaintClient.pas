unit PBMaintClient;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBCtrls, Inifiles, Spin, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintClientFrm = class(TForm)
    AttachDirecEdit: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    ApplicDBLCB: TDBLookupComboBox;
    TypeDBLCB: TDBLookupComboBox;
    GetApplicQuery: TFDQuery;
    GetTypQuery: TFDQuery;
    GepApplicDataSource: TDataSource;
    GetDefTypDataSource: TDataSource;
    ApplicClrBitBtn: TBitBtn;
    AttachClrBitBtn: TBitBtn;
    DirectClrBitBtn: TBitBtn;
    Label4: TLabel;
    edtEMailAccount: TEdit;
    Label5: TLabel;
    spnInterval: TSpinEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtInvoiceEmailAccount: TEdit;
    Label8: TLabel;
    FontName: TComboBox;
    edtFontSize: TEdit;
    UpDown1: TUpDown;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ApplicDBLCBClick(Sender: TObject);
    procedure TypeDBLCBClick(Sender: TObject);
    procedure AttachDirecEditChange(Sender: TObject);
    procedure ApplicClrBitBtnClick(Sender: TObject);
    procedure AttachClrBitBtnClick(Sender: TObject);
    procedure DirectClrBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure spnIntervalChange(Sender: TObject);
    procedure FontNameClick(Sender: TObject);
  private
    fAttachType: string;
    fDirec: string;
    fApplic: string;
    FAccountName: string;
    FInterval: string;
    FInvoiceEmail: string;
    FFont: string;
    FFontSize: integer;
    procedure setApplic(const Value: string);
    procedure setAttachType(const Value: string);
    procedure setDirec(const Value: string);
    procedure SetAccountName(const Value: string);
    procedure SetInterval(const Value: string);
    procedure SetInvoiceEmail(const Value: string);
    procedure GetFontNames;
    procedure SetFont(const Value: string);
    procedure SetFontSize(const Value: integer);
  private
    procedure getEmailDefaults;
    procedure WriteEmailDefaults;
    property AccountName: string read FAccountName write SetAccountName;
    property AttachType: string read fAttachType write setAttachType;
    property Applic: string read fApplic write setApplic;
    property Direc: string read fDirec write setDirec;
    property Font: string read FFont write SetFont;
    property FontSize: integer read FFontSize write SetFontSize;
    property Interval: string read FInterval write SetInterval;
    property InvoiceEmail: string read FInvoiceEmail write SetInvoiceEmail;
  { Private declarations }
  public
    { Public declarations }
    end;

var
  PBMaintClientFrm: TPBMaintClientFrm;

implementation

uses  CCSCommon, PBDatabase, PBMainMenu;

{$R *.DFM}

procedure TPBMaintClientFrm.BitBtn1Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := AttachDirecEdit.Text;
    if DirDlg.Execute then
      AttachDirecEdit.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPBMaintClientFrm.FormCreate(Sender: TObject);
begin
  GetFontNames;
  GetEmailDefaults;
  GetTypQuery.Close;
  GetTypQuery.Open;
  GetApplicQuery.Close;
  GetApplicQuery.Open;
  AttachDirecEdit.Text := Direc;
end;

procedure TPBMaintClientFrm.getEmailDefaults;
var
//  IniFile : TIniFile;
  TempArray: array[0..255] of Char;
  sAliasName: string;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Email', 'Application', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  Applic := TempArray;

  GetPrivateProfileString('Email', 'DEF Attach Type', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  AttachType := TempArray;

  GetPrivateProfileString('Email', 'Def Attach Direc', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  Direc := TempArray;

  GetPrivateProfileString('Activity', 'Reminder Interval', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  Interval := TempArray;


  sAliasName := dmBroker.PBLDatabase.ConnectionDefName;
  {get General Email Account}
  GetPrivateProfileString('Email',  pchar(sAliasName + ' Email Account'), '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  AccountName := TempArray;
  edtEmailAccount.text := AccountName;

  {get Invocing Email Account}
  GetPrivateProfileString('Email',  pchar(sAliasName + ' Invoice Email Account'), '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  InvoiceEmail := TempArray;

  GetPrivateProfileString('Email', 'Email Font', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  Font := TempArray;

  GetPrivateProfileString('Email', 'Email Font Size', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  try
    begin
      FontSize := strtoint(TempArray);
      UpDown1.Position := FontSize;
    end
  except
    begin
      FontSize := 10;
      UpDown1.Position := FontSize;
    end
  end;

  edtInvoiceEmailAccount.text := InvoiceEmail;

  AttachDirecEdit.Text := Direc;
  TypeDBLCB.Keyvalue := AttachType;
  ApplicDBLCB.KeyValue := Applic;

  FontName.text := Font;

  edtFontSize.Text := inttostr(FontSize);

  try
    spnInterval.Value := strtoint(Interval);
  except
    spnInterval.Value := 15;
  end;
end;

procedure TPBMaintClientFrm.WriteEmailDefaults;
var
  IniFile : TIniFile;
  sAliasName: string;
begin
  sAliasName := dmBroker.PBLDatabase.ConnectionDefName;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      WriteString('Email', 'Application',Applic);
      WriteString('Email', 'Def Attach Type',AttachType);
      WriteString('Email', 'Def Attach Direc',Direc);
      WriteString('Email', pchar(sAliasName + ' Email Account'), AccountName);
      WriteString('Email', pchar(sAliasName + ' Invoice Email Account'), InvoiceEmail);
      WriteString('Email', 'Email Font',Font);
      WriteString('Email', 'Email Font Size',inttostr(FontSize));
      WriteString('Activity','Reminder Interval',Interval);
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TPBMaintClientFrm.btnOKClick(Sender: TObject);
begin
  AccountName := edtEmailAccount.Text;
  InvoiceEmail := edtInvoiceEmailAccount.Text;
  Font := FontName.Text;
  FontSize := strtoint(edtFontSize.text);
  writeEmailDefaults;
  frmPBMainMenu.tmrCheckActivity.Interval := 60000*spnInterval.Value;
end;

procedure TPBMaintClientFrm.setApplic(const Value: string);
begin
  fApplic := Value;
end;

procedure TPBMaintClientFrm.setAttachType(const Value: string);
begin
  fAttachType := Value;
end;

procedure TPBMaintClientFrm.setDirec(const Value: string);
begin
  fDirec := Value;
end;

procedure TPBMaintClientFrm.ApplicDBLCBClick(Sender: TObject);
begin
Applic := ApplicDBLCB.keyvalue;
end;

procedure TPBMaintClientFrm.TypeDBLCBClick(Sender: TObject);
begin
AttachType := TypeDBLCB.KeyValue;
end;

procedure TPBMaintClientFrm.AttachDirecEditChange(Sender: TObject);
begin
Direc := AttachDirecEdit.Text
end;

procedure TPBMaintClientFrm.ApplicClrBitBtnClick(Sender: TObject);
begin
ApplicDBLCB.KeyValue := 0;
Applic := '';

end;

procedure TPBMaintClientFrm.AttachClrBitBtnClick(Sender: TObject);
begin
TypeDBLCB.KeyValue := 0;
AttachType := '';
end;

procedure TPBMaintClientFrm.DirectClrBitBtnClick(Sender: TObject);
begin
AttachDirecEdit.Text := '';
end;

procedure TPBMaintClientFrm.FormActivate(Sender: TObject);
begin
  dmBroker.ScreenAccessControl(Self,'mnuClient',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintClientFrm.SetAccountName(const Value: string);
begin
  FAccountName := Value;
end;

procedure TPBMaintClientFrm.spnIntervalChange(Sender: TObject);
begin
Interval := inttostr(spnInterval.value);

end;

procedure TPBMaintClientFrm.SetInterval(const Value: string);
begin
  FInterval := Value;
end;

procedure TPBMaintClientFrm.SetInvoiceEmail(const Value: string);
begin
  FInvoiceEmail := Value;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TPBMaintClientFrm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TPBMaintClientFrm.SetFont(const Value: string);
begin
  FFont := Value;
end;

procedure TPBMaintClientFrm.SetFontSize(const Value: integer);
begin
  FFontSize := Value;
end;

procedure TPBMaintClientFrm.FontNameClick(Sender: TObject);
begin
  Font := FontName.Text;
end;

end.
