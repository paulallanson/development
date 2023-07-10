unit PBMaintainEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Inifiles, ImgList, ToolWin, ClipBrd, ActnList;

type
  TPBMaintainEmailfrm = class(TForm)
    pnlHeader: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    edtRecipient: TEdit;
    edtSubject: TEdit;
    pnlFooter: TPanel;
    btnSend: TBitBtn;
    CancelBitBtn: TBitBtn;
    edtBody: TRichEdit;
    StandardToolBar: TToolBar;
    ToolButton1: TToolButton;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    ToolButton5: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    UndoButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    ToolButton11: TToolButton;
    edtFontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    ToolButton20: TToolButton;
    BulletsButton: TToolButton;
    ToolbarImages: TImageList;
    FontDialog1: TFontDialog;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    StatusBar: TStatusBar;
    procedure btnSendClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure UndoButtonClick(Sender: TObject);
    procedure LeftAlignClick(Sender: TObject);
    procedure CenterAlignClick(Sender: TObject);
    procedure RightAlignClick(Sender: TObject);
    procedure BulletsButtonClick(Sender: TObject);
  private
    FRecipient: string;
    FCC: string;
    FBody: string;
    FSubject: string;
    FUpdating: Boolean;
    FFontSize: integer;
    FFont: string;
    function CurrText: TTextAttributes;
    procedure SetBody(const Value: string);
    procedure SetCC(const Value: string);
    procedure SetRecipient(const Value: string);
    procedure SetSubject(const Value: string);
    procedure SelectionChange(Sender: TObject);
    procedure GetFontNames;
    procedure SetFont(const Value: string);
    procedure SetFontSize(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    bOK: boolean;
    property Recipient: string read FRecipient write SetRecipient;
    property Subject: string read FSubject write SetSubject;
    property CC: string read FCC write SetCC;
    property Body: string read FBody write SetBody;
    property Font: string read FFont write SetFont;
    property FontSize: integer read FFontSize write SetFontSize;
  end;

var
  PBMaintainEmailfrm: TPBMaintainEmailfrm;

implementation

uses RichEdit, ShellAPI, pbMainMenu, CCSCommon;

{$R *.dfm}

{ TPBMaintainEmailfrm }

procedure TPBMaintainEmailfrm.SetBody(const Value: string);
begin
  FBody := Value;
  edtBody.text := FBody;
end;

procedure TPBMaintainEmailfrm.SetCC(const Value: string);
begin
  FCC := Value;
end;

procedure TPBMaintainEmailfrm.SetRecipient(const Value: string);
begin
  FRecipient := Value;
  edtRecipient.text := FRecipient;
end;

procedure TPBMaintainEmailfrm.SetSubject(const Value: string);
begin
  FSubject := Value;
  edtSubject.text := FSubject;
end;

procedure TPBMaintainEmailfrm.btnSendClick(Sender: TObject);
begin
  bOK := true;
  Font := FontName.Text;
  FontSize := strtoint(edtFontSize.text);
  close;
end;

procedure TPBMaintainEmailfrm.FormActivate(Sender: TObject);
begin
  bOK := false;
end;

procedure TPBMaintainEmailfrm.CancelBitBtnClick(Sender: TObject);
begin
  bOK := false;
end;

procedure TPBMaintainEmailfrm.FontNameChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Name := FontName.Items[FontName.ItemIndex];
end;

procedure TPBMaintainEmailfrm.edtFontSizeChange(Sender: TObject);
begin
  if FUpdating then Exit;
  CurrText.Size := StrToInt(edtFontSize.Text);
end;

procedure TPBMaintainEmailfrm.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if BoldButton.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TPBMaintainEmailfrm.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if ItalicButton.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TPBMaintainEmailfrm.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  if UnderlineButton.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];

end;

function TPBMaintainEmailfrm.CurrText: TTextAttributes;
begin
  if edtBody.SelLength > 0 then Result := edtBody.SelAttributes
  else Result := edtBody.DefAttributes;
end;

procedure TPBMaintainEmailfrm.SelectionChange(Sender: TObject);
begin
  with edtBody.Paragraph do
  try
    FUpdating := True;
    BoldButton.Down := fsBold in edtBody.SelAttributes.Style;
    ItalicButton.Down := fsItalic in edtBody.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in edtBody.SelAttributes.Style;
    BulletsButton.Down := Boolean(Numbering);
    edtFontSize.Text := IntToStr(edtBody.SelAttributes.Size);
    FontName.Text := edtBody.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
  finally
    FUpdating := False;
  end;
end;

procedure TPBMaintainEmailfrm.FormCreate(Sender: TObject);
var
  TempArray: array[0..255] of Char;
begin
  GetFontNames;

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

  edtBody.SelAttributes.Name := Font;
  
  SelectionChange(Self);

//  CurrText.Name := DefFontData.Name;
  CurrText.Name := Font;
  CurrText.Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);
  CCSCommon.LoadFormLayout('redeye.ini', self);
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TPBMaintainEmailfrm.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TPBMaintainEmailfrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Email', 'Email Font',Font);
      WriteString('Email', 'Email Font Size',inttostr(FontSize));
      Free;
    end;
    
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintainEmailfrm.SetFont(const Value: string);
begin
  FFont := Value;
end;

procedure TPBMaintainEmailfrm.SetFontSize(const Value: integer);
begin
  FFontSize := Value;
end;

procedure TPBMaintainEmailfrm.CutButtonClick(Sender: TObject);
begin
  edtBody.CutToClipboard;

end;

procedure TPBMaintainEmailfrm.CopyButtonClick(Sender: TObject);
begin
  edtBody.CopyToClipboard;
end;

procedure TPBMaintainEmailfrm.PasteButtonClick(Sender: TObject);
begin
  edtBody.PasteFromClipboard;
end;

procedure TPBMaintainEmailfrm.UndoButtonClick(Sender: TObject);
begin
  with edtBody do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TPBMaintainEmailfrm.LeftAlignClick(Sender: TObject);
begin
  if FUpdating then Exit;
  edtBody.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);

end;

procedure TPBMaintainEmailfrm.CenterAlignClick(Sender: TObject);
begin
  if FUpdating then Exit;
  edtBody.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);

end;

procedure TPBMaintainEmailfrm.RightAlignClick(Sender: TObject);
begin
  if FUpdating then Exit;
  edtBody.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TPBMaintainEmailfrm.BulletsButtonClick(Sender: TObject);
begin
  if FUpdating then Exit;
  edtBody.Paragraph.Numbering := TNumberingStyle(BulletsButton.Down);
end;

end.
