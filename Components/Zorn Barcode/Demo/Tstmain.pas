unit Tstmain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ZBarcode,
  StdCtrls, ExtCtrls, Menus, Printers, Clipbrd, ExtDlgs;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Print1: TMenuItem;
    Exit1: TMenuItem;
    PrintDirect1: TMenuItem;
    Print2: TMenuItem;
    View1: TMenuItem;
    Direct1: TMenuItem;
    Stretched1: TMenuItem;
    Edit1: TMenuItem;
    Text1: TMenuItem;
    Prefix1: TMenuItem;
    AddOn1: TMenuItem;
    Saveas1: TMenuItem;
    CopytoClipboard1: TMenuItem;
    N1: TMenuItem;
    Symbolgy1: TMenuItem;
    Code391: TMenuItem;
    Code1281: TMenuItem;
    EAN81: TMenuItem;
    EAN131: TMenuItem;
    ITF1: TMenuItem;
    ITFwCheck1: TMenuItem;
    Code39wCheck1: TMenuItem;
    Postnet1: TMenuItem;
    UPCA1: TMenuItem;
    Bevel1: TBevel;
    ZBarCode1: TZBarCode;
    SaveDialog1: TSavePictureDialog;
    FontDialog1: TFontDialog;
    Font1: TMenuItem;
    About1: TMenuItem;
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure PrintDirect1Click(Sender: TObject);
    procedure Stretched1Click(Sender: TObject);
    procedure Text1Click(Sender: TObject);
    procedure Prefix1Click(Sender: TObject);
    procedure AddOn1Click(Sender: TObject);
    procedure CopytoClipboard1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure SymbolClick(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses EnterText, About;

{$R *.DFM}

procedure TForm1.FormPaint(Sender: TObject);
begin
  if Stretched1.Checked then
    Canvas.Stretchdraw (GetClientRect, ZBarcode1.Barcode)
  else
    Canvas.Draw (0, 0, ZBarcode1.Barcode);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Invalidate;
end;

procedure TForm1.Print1Click(Sender: TObject);
begin
  with Printer do
  begin
    BeginDoc;
    Canvas.Stretchdraw (Rect (0, 0, Printer.PageWidth, Printer.PageHeight div 2), ZBarcode1.Barcode);
    EndDoc;
  end;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.PrintDirect1Click(Sender: TObject);
begin
  with Printer do
  begin
    BeginDoc;
    Canvas.Draw (100, 100, ZBarcode1.Barcode);
    EndDoc;
  end;
end;

procedure TForm1.Stretched1Click(Sender: TObject);
begin
  TMenuItem (Sender).Checked := true;
  Invalidate;
end;

procedure TForm1.Text1Click(Sender: TObject);
var
  s: string;
begin
  s := ZBarcode1.Text;
  if TextDlg.Execute (s) then
  begin
    ZBarcode1.Text := s;
    Invalidate;
  end;
end;

procedure TForm1.Prefix1Click(Sender: TObject);
var
  s: string;
begin
  s := ZBarcode1.Prefix;
  if TextDlg.Execute (s) then
  begin
    ZBarcode1.Prefix := s;
    Invalidate;
  end;
end;

procedure TForm1.AddOn1Click(Sender: TObject);
var
  s: string;
begin
  s := ZBarcode1.AddOn;
  if TextDlg.Execute (s) then
  begin
    ZBarcode1.AddOn := s;
    Invalidate;
  end;
end;

procedure TForm1.CopytoClipboard1Click(Sender: TObject);
begin
  Clipboard.Assign (ZBarcode1.Barcode);
end;

procedure TForm1.Saveas1Click(Sender: TObject);
begin
  if ZBarcode1.Enhanced then begin
    SaveDialog1.DefaultExt := 'emf';
    SaveDialog1.FilterIndex := 1
  end else begin
    SaveDialog1.DefaultExt := 'wmf';
    SaveDialog1.FilterIndex := 2
  end;
  if SaveDialog1.Execute then
    ZBarcode1.Barcode.SaveToFile (SaveDialog1.Filename);
end;

procedure TForm1.SymbolClick(Sender: TObject);
begin
  TMenuItem (Sender).Checked := true;
  case TMenuItem (Sender).Tag of
  0: ZBarcode1.BarType := btCode39;
  1: ZBarcode1.BarType := btCode39wCheck;
  2: ZBarcode1.BarType := btCode128;
  3: ZBarcode1.BarType := btEAN8;
  4: ZBarcode1.BarType := btEAN13;
  5: ZBarcode1.BarType := btITF;
  6: ZBarcode1.BarType := btITFwCheck;
  7: ZBarcode1.BarType := btPostnet;
  8: ZBarcode1.BarType := btUPCA;
  end;
  Invalidate;
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  FontDialog1.Font.Assign (Zbarcode1.Font);
  if FontDialog1.Execute then
    ZBarcode1.Font := FontDialog1.Font;
  Invalidate;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

end.
