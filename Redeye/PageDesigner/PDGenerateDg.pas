(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Generate script dialog for Page/Letter Layout Designer for Broker.

VSS Info:
$Header: /PageDesigner/PDGenerateDg.pas 7     10/05/:1 14:16 Paul $
$History: PDGenerateDg.pas $
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 10/05/:1   Time: 14:16
 * Updated in $/PageDesigner
 * Changed to allow the setting of the 'Set data to Tab'
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 5/07/:0    Time: 16:49
 * Updated in $/PageDesigner
 * Corrected Generate Script function which was not saving the Alignment
 * and Tab Stop elements
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:09
 * Updated in $/PageDesigner
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 15/02/:0   Time: 17:11
 * Updated in $/PageDesigner
 * New feature to allow setting of two tab stops per letter so the use can
 * size the virtual columns.  Version bumped to 2.3a because of this and
 * database changes.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/02/:0   Time: 17:34
 * Updated in $/PageDesigner
 * Set defaults for new quotation summary layout, fix script generation to
 * handle new layout and database fields.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 12/01/:0   Time: 9:14
 * Updated in $/PageDesigner
 * Assorted layout fixes for letters, line spacing etc.  Fix script
 * generation.  Use CR + LF in text for acknowledgement.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 10/01/:0   Time: 11:27
 * Created in $/PageDesigner
 * New feature:  generate SQL statements to create layout and element
 * entries in the database based on the internal hard coded values.

*******************************************************************************)
unit PDGenerateDg;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, PDLetter;

type
  TPDGenerateDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TEdit;
    edtDirectory: TEdit;
    btnBrowse: TButton;
    procedure btnBrowseClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    FOut : TextFile;
    FFileName : string;
    procedure GenerateScript;
    procedure PutOut(const data : string);
    procedure StartScript;
    procedure BuildLetter(const LetterName : string;
      const LetterType : integer);
    procedure DeleteElements(const LetterName : string);
    procedure DeleteLetter(const LetterName : string);
    procedure ExtractLetter(Letter : TLetter);
    procedure ExtractElement(const LetterName : string; element : TElement);
  public
    { Public declarations }
  end;

var
  PDGenerateDlg: TPDGenerateDlg;

implementation

uses
  CCSCommon, Dialogs, LetterDM;

{$R *.DFM}

procedure TPDGenerateDlg.btnBrowseClick(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
    if DirDlg.Execute then
      edtDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

procedure TPDGenerateDlg.BuildLetter(const LetterName : string;
  const LetterType : integer);
var
  Letter : TLetter;
begin
  Letter := TLetter.Create;
  try
    Letter.Name := LetterName;
    Letter.LetterType := LetterType;
    dmLetter.HardLoadLetter(Letter);
    ExtractLetter(Letter);
  finally
    Letter.Free;
  end;
end;

procedure TPDGenerateDlg.DeleteElements(const LetterName: string);
begin
  PutOut('DELETE FROM tb_LetterElement WHERE f_LetterName = ''' +
    LetterName + '''');
end;

procedure TPDGenerateDlg.DeleteLetter(const LetterName: string);
begin
  DeleteElements(LetterName);
  PutOut('DELETE FROM tb_LetterLayout WHERE f_LetterName = ''' +
    LetterName + '''');
    PutOut('GO');
end;

procedure TPDGenerateDlg.ExtractElement(const LetterName: string;
  element: TElement);
var
  i : integer;
  sTemp : string;
  aStr  : string;
begin
  PutOut('INSERT INTO tb_LetterElement VALUES');
  PutOut('  (''' + LetterName + ''', ''' + element.Name + ''', ' +
    IntToStr(element.Number) + ', ' +
    IntToStr(element.FontNo) + ', ' +
    IntToStr(element.FontSize) + ', ' +
    IntToStr(element.FontStyle) + ', ' +
    IntToStr(element.PrintOrder) + ', ' +
    IntToStr(element.Column) + ', ' +
    IntToStr(element.Left) + ', ' +
    IntToStr(element.Width) + ', ');
  with dmLetter do
  PutOut('  ''' + BoolToChar(element.Fixed) + ''', ''' +
    BoolToChar(element.DbData) + ''', ''' +
    BoolToChar(element.Printed) + ''', ''' +
    BoolToChar(element.BlankBefore) + ''', ''' +
    BoolToChar(element.BlankAfter) + ''',');
  sTemp := '';
  for i := 1 to Length(element.Text) do
  if (Ord(element.Text[i]) < 32) or (Ord(element.Text[i]) > 127) then
  begin
    sTemp := sTemp + ''' +' +
      ' CHAR(' + IntToStr(Ord(element.Text[i])) + ') + ''';
  end
  else
  begin
    sTemp := sTemp + element.Text[i];
    if element.Text[i] = '''' then
      sTemp := sTemp + '''';  { double up single quotes }
  end;
  case element.Alignment of
  taRightJustify : aStr := '''R'',';
  taCenter       : aStr := '''C'',';
  else             aStr := '''L'',';
  end;  { case }
  if element.UsesTab <> 'N' then
    aStr := aStr + element.UsesTab
  else
    aStr := aStr + '''N''';
  aStr := aStr + ', ' +  IntToStr(element.Font2No) + ', ' +
    IntToStr(element.Font2Size) + ', ' +
    IntToStr(element.Font2Style);
  PutOut('  ''' + sTemp + ''',' + aStr + ')');
end;

procedure TPDGenerateDlg.ExtractLetter(Letter: TLetter);
var
  i : integer;
  sTemp : string;
begin
  PutOut('INSERT INTO tb_LetterLayout VALUES');
  PutOut('  (''' + Letter.Name + ''',' + IntToStr(Letter.LetterType) + ', ');
  for i := Low(Letter.FontArray) to High(Letter.FontArray) do
    with Letter.FontArray[i] do
    begin
      sTemp := '  ''' + FontName + ''', ' + IntToStr(FontSize) + ', ' +
        IntToStr(FontStyle);
      if i = High(Letter.FontArray) then
        sTemp := sTemp + ',''' + dmLetter.BoolToChar(Letter.IsDefault) + ''','
      else
        sTemp := sTemp + ',';
      PutOut(sTemp);
    end;
  PutOut('    ''' + Letter.TabUnit + ''',' +
    FloatToStrF(Letter.TabStop1, ffFixed, 6, 2) + ',' +
    FloatToStrF(Letter.TabStop2, ffFixed, 6, 2) + ')');
  for i := 0 to Pred(Letter.Elements.Count) do
    ExtractElement(Letter.Name, Letter.Elements[i]);

  PutOut('GO');
end;

procedure TPDGenerateDlg.GenerateScript;
begin
  { Do the dirty deed }
  AssignFile(FOut, FFileName);
  Rewrite(FOut);
  StartScript;
  BuildLetter('Enquiry', ltEnquiry);
  BuildLetter('Quotation', ltQuotation);
  BuildLetter('Purchase Order', ltPurchaseOrder);
  BuildLetter('Acknowledgement', ltAcknowledgement);
  BuildLetter('Quotation Summary', ltQuotationSummary);
  CloseFile(FOut);
end;

procedure TPDGenerateDlg.OKBtnClick(Sender: TObject);
begin
  ModalResult := mrNone;
  edtName.Text := Trim(edtName.Text);
  edtDirectory.Text := Trim(edtDirectory.Text);
  if edtName.Text = '' then
  begin
    MessageDlg('You must enter a file name', mtError, [mbOK], 0);
    edtName.SetFocus;
    Exit;
  end;
  if edtDirectory.Text = '' then
  begin
    MessageDlg('You must enter a directory name', mtError, [mbOK], 0);
    edtDirectory.SetFocus;
    Exit;
  end;
  FFileName := edtDirectory.Text;
  if FFileName[Length(FFileName)] <> '\' then
    FFileName := FFileName + '\';
  FFileName := FFileName + edtName.Text;
  if FileExists(FFileName) then
  begin
    if MessageDlg('File ' + FFileName + ' already exists.' + #13 +
      'Do you want to overwrite it?', mtConfirmation, [mbYes, mbNo], 0)
      <> mrYes then
      Exit;
  end;
  GenerateScript;
  ModalResult := mrOK;
end;

procedure TPDGenerateDlg.PutOut(const data: string);
begin
  WriteLn(FOut, data);
end;

procedure TPDGenerateDlg.StartScript;
begin
  PutOut('/* Broker Letter Layout Script generated on ' +
    DateTimeToStr(Now) + ' */');
  DeleteLetter('Enquiry');
  DeleteLetter('Quotation');
  DeleteLetter('Purchase Order');
  DeleteLetter('Acknowledgement');
  DeleteLetter('Quotation Summary');
end;

end.
