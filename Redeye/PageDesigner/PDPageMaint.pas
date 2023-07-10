(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Page Layout Designer for Broker.

VSS Info:
$Header: /PageDesigner/PDPageMaint.pas 5     8/03/:0 17:09 Roddym $
$History: PDPageMaint.pas $
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
 * User: Roddym       Date: 10/02/:0   Time: 11:59
 * Updated in $/PageDesigner
 * Add questions and answers to Purchase Order and Acknowledgement letter
 * layouts.  Add new page layout field PrintDefault similar to FaxDefault.
 * Add new letter layout field LetterTypeDefault so we can display the
 * user's selected default on print selection forms in Broker.  Version
 * number of PageDesigner raised to 2.2a
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:42
 * Updated in $/PageDesigner
 * Changes to Letter object, also hard-coded version to make switch
 * transparent to Forms Technology.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
unit PDPageMaint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ExtDlgs, Mask, DBCtrls, ComCtrls, Buttons, Spin, printers;

type
  TMode           = (modeAdd, modeChange, modeDelete, modeView);

  TPDPageMaintFrm = class(TForm)
    OPD: TOpenPictureDialog;
    gbDetails: TGroupBox;
    labPageSize: TLabel;
    labUnits: TLabel;
    cmbPageSize: TComboBox;
    cmbUnits: TComboBox;
    rgOrientation: TRadioGroup;
    rgBlankOrPrinted: TRadioGroup;
    gbPrintables: TGroupBox;
    cbLogo: TDBCheckBox;
    cbAddress: TDBCheckBox;
    pcAreas: TPageControl;
    tsAddress: TTabSheet;
    gbAddress: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtTopA: TDBEdit;
    edtLeftA: TDBEdit;
    edtWidthA: TDBEdit;
    edtHeightA: TDBEdit;
    tsLogo: TTabSheet;
    gbLogo: TGroupBox;
    labTopL: TLabel;
    labLeftL: TLabel;
    labWidthL: TLabel;
    labHeightL: TLabel;
    Label9: TLabel;
    edtTopL: TDBEdit;
    edtLeftL: TDBEdit;
    edtWidthL: TDBEdit;
    edtHeightL: TDBEdit;
    btnBrowse: TButton;
    edtBitmap: TDBEdit;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    gbHead: TGroupBox;
    labGiveName: TLabel;
    edtName: TEdit;
    btnShow: TBitBtn;
    pnlHead: TPanel;
    btnLookup: TSpeedButton;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnView: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    gbPreview: TGroupBox;
    desPage: TLabel;
    imgDefault: TImage;
    imgLoaded: TImage;
    labDelete: TLabel;
    cbPrintDefault: TDBCheckBox;
    lblFont: TLabel;
    cmbFontName: TComboBox;
    edtFontSize: TSpinEdit;
    btnBold: TSpeedButton;
    btnItalic: TSpeedButton;
    btnUnderline: TSpeedButton;
    gbMargins: TGroupBox;
    labTopM: TLabel;
    edtTopM: TDBEdit;
    labBottomM: TLabel;
    edtBottomM: TDBEdit;
    labLeftM: TLabel;
    edtleftM: TDBEdit;
    labRightM: TLabel;
    edtRightM: TDBEdit;
    rgAlignment: TRadioGroup;
    chkbxAutowrap: TCheckBox;
    Label10: TLabel;
    tsRegAddress: TTabSheet;
    tsLogo1: TTabSheet;
    tsLogo2: TTabSheet;
    tsLogo3: TTabSheet;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtTopL1: TDBEdit;
    edtLeftL1: TDBEdit;
    edtWidthL1: TDBEdit;
    edtHeightL1: TDBEdit;
    Button1: TButton;
    edtBitMap1: TDBEdit;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    edtTopL2: TDBEdit;
    edtLeftL2: TDBEdit;
    edtWidthL2: TDBEdit;
    edtHeightL2: TDBEdit;
    Button2: TButton;
    edtBitMap2: TDBEdit;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edtTopL3: TDBEdit;
    edtLeftL3: TDBEdit;
    edtWidthL3: TDBEdit;
    edtHeightL3: TDBEdit;
    Button3: TButton;
    edtBitMap3: TDBEdit;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label26: TLabel;
    btnRegBold: TSpeedButton;
    btnRegItalic: TSpeedButton;
    btnRegUnderline: TSpeedButton;
    lblRegAutoWrap: TLabel;
    edtTopRegA: TDBEdit;
    edtLeftRegA: TDBEdit;
    edtWidthRegA: TDBEdit;
    edtHeightRegA: TDBEdit;
    cmbRegFontName: TComboBox;
    edtRegFontSize: TSpinEdit;
    rgRegAlignment: TRadioGroup;
    chkbxRegAutoWrap: TCheckBox;
    cbRegAddress: TDBCheckBox;
    cbLogo1: TDBCheckBox;
    cbLogo2: TDBCheckBox;
    cbLogo3: TDBCheckBox;
    tsPrePrinted: TTabSheet;
    gbPrePrinted: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edtTopP: TDBEdit;
    edtLeftP: TDBEdit;
    edtWidthP: TDBEdit;
    edtHeightP: TDBEdit;
    procedure btnShowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbLogoClick(Sender: TObject);
    procedure rgBlankOrPrintedClick(Sender: TObject);
    procedure cbAddressClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnLookupClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    FActDone : Boolean;
    FFullHeight : integer;
    FMode : TMode;
    Page :  TLabel;
    FPageWidth : real;
    FPageHeight : real;
    FPixels : real;
    FTopM, FLeftM, FRightM, FBottomM : integer;
    FTopL, FLeftL, FWidthL, FHeightL : integer;
    FTopL1, FLeftL1, FWidthL1, FHeightL1 : integer;
    FTopL2, FLeftL2, FWidthL2, FHeightL2 : integer;
    FTopL3, FLeftL3, FWidthL3, FHeightL3 : integer;
    FTopA, FLeftA, FWidthA, FHeightA : integer;
    FTopRegA, FLeftRegA, FWidthRegA, FHeightRegA : integer;
    FTopP, FLeftP, FWidthP, FHeightP : integer;
    function Pixelate(edt : TDBEdit) : integer;
    procedure DrawPage;
    procedure SetPageSize;
    procedure SetUnits;
    procedure SetMargins;
    procedure SetLogo;
    procedure SetLogo1;
    procedure SetLogo2;
    procedure SetLogo3;
    procedure SetAddress;
    procedure SetRegAddress;
    procedure SetPrePrinted;
    procedure DrawMargins;
    procedure DrawLogo;
    procedure DrawLogo1;
    procedure DrawLogo2;
    procedure DrawLogo3;
    procedure DrawAddress;
    procedure DrawRegAddress;
    procedure DrawPrePrinted;
    procedure NewPage;
    function  ValidData(const Saving : Boolean) : Boolean;
    procedure ErrorMsg(const data : string);
    procedure LoadData;
    procedure SaveData;
    procedure SetpcArea;
    procedure RollUp;
    procedure RollDown;
    procedure Enable(const OnOrOff : Boolean);
    procedure NewDefaults;
    function  ConfirmDelete : Boolean;
  end;

implementation

uses
  PageDM, PBLogin, PBDatabase, PDLUPage, PDLetter;

{$R *.DFM}


procedure TPDPageMaintFrm.btnShowClick(Sender: TObject);
begin
  if not ValidData(false) then
    Exit;
  NewPage;
  SetUnits;
  SetPageSize;
  SetMargins;
  SetLogo;
  SetLogo1;
  SetLogo2;
  SetLogo3;
  SetAddress;
  SetRegAddress;
  SetPrePrinted;
  DrawPage;
  DrawMargins;
  if rgBlankOrPrinted.ItemIndex = 1 then
    DrawPrePrinted
  else
  begin
    DrawLogo;
    DrawLogo1;
    DrawLogo2;
    DrawLogo3;
    DrawAddress;
    DrawRegAddress;
  end;
end;

procedure TPDPageMaintFrm.FormCreate(Sender: TObject);
begin
  FFullHeight := ClientHeight;
  cmbUnits.ItemIndex := -1;
  cmbPageSize.ItemIndex := -1;
  desPage.Hide;

  with cmbFontName.Items do
  begin
    Clear;
    Add('<None>');
    AddStrings(Printer.Fonts);
  end;
  cmbFontName.Sorted := true;
  cmbFontName.ItemIndex := 0;

  with cmbRegFontName.Items do
  begin
    Clear;
    Add('<None>');
    AddStrings(Printer.Fonts);
  end;
  cmbRegFontName.Sorted := true;
  cmbRegFontName.ItemIndex := 0;

  dmPage.qryPage.RequestLive := true;
end;

procedure TPDPageMaintFrm.DrawPage;
var
  Rect : TRect;
begin
  if (FPageWidth = 0) or (FPageHeight = 0) then
    Exit;
  Page.Hide;
  try
    Page.Left := PageLeft;
    Page.Top := PageTop;
    Page.Width := Trunc(FPageWidth * Pixels_Per_Inch);
    Page.Height := Trunc(FPageHeight * Pixels_Per_Inch);
    with Page.Canvas do
    begin
      Pen.Color := clBlack;
      Brush.Color := clWhite;
      Rect.Left := 0;
      Rect.Top := 0;
      Rect.Right := Page.Width;
      Rect.Bottom := Page.Height;
      FillRect(Rect);
    end;
  finally
    Page.Show;
  end;
  Page.Canvas.Refresh;
  Application.ProcessMessages;
end;

procedure TPDPageMaintFrm.SetMargins;
begin
  FTopM := Pixelate(edtTopM);
  FBottomM := Pixelate(edtBottomM);
  FLeftM := Pixelate(edtLeftM);
  FRightM := Pixelate(edtRightM);
end;

procedure TPDPageMaintFrm.SetPageSize;
begin
  if rgOrientation.ItemIndex = 0 then
    case cmbPageSize.ItemIndex of
    0: begin
         FPageWidth := A4_Width;
         FPageHeight := A4_Height;
       end;
    1: begin
         FPageWidth := Letter_Width;
         FPageHeight := Letter_Height;
       end;
    end  { case }
  else
    case cmbPageSize.ItemIndex of
    0: begin
         FPageWidth := A4_Height;
         FPageHeight := A4_Width;
       end;
    1: begin
         FPageWidth := Letter_Height;
         FPageHeight := Letter_Width;
       end;
    end;  { case }
end;

procedure TPDPageMaintFrm.SetUnits;
begin
  case cmbUnits.ItemIndex of
  0:   FPixels := Pixels_Per_Inch;
  1:   FPixels := Pixels_Per_Cent;
  2:   FPixels := Pixels;
  end;  { case }
end;

procedure TPDPageMaintFrm.cbLogoClick(Sender: TObject);
begin
  tsLogo.TabVisible := cbLogo.Checked;
  SetpcArea;
end;

procedure TPDPageMaintFrm.SetLogo;
begin
  FTopL := Pixelate(edtTopL);
  FWidthL := Pixelate(edtWidthL);
  FLeftL := Pixelate(edtLeftL);
  FHeightL := Pixelate(edtHeightL);
end;

procedure TPDPageMaintFrm.SetLogo1;
begin
  FTopL1 := Pixelate(edtTopL1);
  FWidthL1 := Pixelate(edtWidthL1);
  FLeftL1 := Pixelate(edtLeftL1);
  FHeightL1 := Pixelate(edtHeightL1);
end;

procedure TPDPageMaintFrm.SetLogo2;
begin
  FTopL2 := Pixelate(edtTopL2);
  FWidthL2 := Pixelate(edtWidthL2);
  FLeftL2 := Pixelate(edtLeftL2);
  FHeightL2 := Pixelate(edtHeightL2);
end;

procedure TPDPageMaintFrm.SetLogo3;
begin
  FTopL3 := Pixelate(edtTopL3);
  FWidthL3 := Pixelate(edtWidthL3);
  FLeftL3 := Pixelate(edtLeftL3);
  FHeightL3 := Pixelate(edtHeightL3);
end;

procedure TPDPageMaintFrm.DrawMargins;
var
  Rect : TRect;
begin
  with Page.Canvas do
  begin
    Rect.Left := FLeftM;
    Rect.Top := FTopM;
    Rect.Right := Page.Width-FRightM;
    Rect.Bottom := Page.Height-FBottomM;
    Rectangle(Rect);
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.DrawLogo;
var
  Rect : TRect;
begin
  if cbLogo.Checked then
  with Page.Canvas do
  begin
    Rect.Left := FLeftL;
    Rect.Top := FTopL;
    Rect.Right := FLeftL + FWidthL;
    Rect.Bottom := FTopL + FHeightL;
    Brush.Color := clBlack;
    if (Trim(edtBitMap.Text) <> '') and FileExists(edtBitMap.Text) then
    begin
      imgLoaded.Picture.LoadFromFile(edtBitMap.Text);
      StretchDraw(Rect, imgLoaded.Picture.Bitmap);
    end
    else
      StretchDraw(Rect, imgDefault.Picture.Bitmap);
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.DrawLogo1;
var
  Rect : TRect;
begin
  if cbLogo1.Checked then
  with Page.Canvas do
  begin
    Rect.Left := FLeftL1;
    Rect.Top := FTopL1;
    Rect.Right := FLeftL1 + FWidthL1;
    Rect.Bottom := FTopL1 + FHeightL1;
    Brush.Color := clBlack;
    if (Trim(edtBitMap1.Text) <> '') and FileExists(edtBitMap1.Text) then
    begin
      imgLoaded.Picture.LoadFromFile(edtBitMap1.Text);
      StretchDraw(Rect, imgLoaded.Picture.Bitmap);
    end
    else
      StretchDraw(Rect, imgDefault.Picture.Bitmap);
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.DrawLogo2;
var
  Rect : TRect;
begin
  if cbLogo2.Checked then
  with Page.Canvas do
  begin
    Rect.Left := FLeftL2;
    Rect.Top := FTopL2;
    Rect.Right := FLeftL2 + FWidthL2;
    Rect.Bottom := FTopL2 + FHeightL2;
    Brush.Color := clBlack;
    if (Trim(edtBitMap2.Text) <> '') and FileExists(edtBitMap2.Text) then
    begin
      imgLoaded.Picture.LoadFromFile(edtBitMap2.Text);
      StretchDraw(Rect, imgLoaded.Picture.Bitmap);
    end
    else
      StretchDraw(Rect, imgDefault.Picture.Bitmap);
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.DrawLogo3;
var
  Rect : TRect;
begin
  if cbLogo3.Checked then
  with Page.Canvas do
  begin
    Rect.Left := FLeftL3;
    Rect.Top := FTopL3;
    Rect.Right := FLeftL3 + FWidthL3;
    Rect.Bottom := FTopL3 + FHeightL3;
    Brush.Color := clBlack;
    if (Trim(edtBitMap3.Text) <> '') and FileExists(edtBitMap3.Text) then
    begin
      imgLoaded.Picture.LoadFromFile(edtBitMap3.Text);
      StretchDraw(Rect, imgLoaded.Picture.Bitmap);
    end
    else
      StretchDraw(Rect, imgDefault.Picture.Bitmap);
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.rgBlankOrPrintedClick(Sender: TObject);
begin
  if rgBlankOrPrinted.ItemIndex = 1 then
  begin
    cbLogo.Checked := false;
    cbAddress.Checked := false;
    gbPrintables.Hide;
    tsLogo.TabVisible := false;
    tsLogo1.TabVisible := false;
    tsLogo2.TabVisible := false;
    tsLogo3.TabVisible := false;
    tsAddress.TabVisible := false;
    tsRegAddress.TabVisible := false;
    tsPrePrinted.TabVisible := true;
  end
  else
  begin
    gbPrintables.Show;
    tsPrePrinted.TabVisible := false;
    tsLogo.TabVisible := true;
    tsAddress.TabVisible := true;
  end;
  SetpcArea;
end;

procedure TPDPageMaintFrm.cbAddressClick(Sender: TObject);
begin
  tsAddress.TabVisible := cbAddress.Checked;
  SetpcArea;
end;

procedure TPDPageMaintFrm.btnAddClick(Sender: TObject);
begin
  if (Uppercase(Trim(edtName.Text)) = 'BLANK')
  or (Uppercase(Trim(edtName.Text)) = 'PREPRINTED') then
  begin
    MessageDlg('The names ''Blank'' and ''Preprinted'' are reserved ' + #13 +
      'and cannot be used for new layouts. Please choose ' + #13 +
      'another name for your new layout.', mtError, [mbOK], 0);
    edtName.SetFocus;
    Exit;
  end;
  FMode := modeAdd;
  LockWindowUpdate(Handle);
  try
    with dmPage.qryPage do
    begin
      Close;
      RollDown;
      ParamByName('Name').AsString := '';
      Open;
      Insert;
      rgBlankOrPrinted.ItemIndex := 0;
      cbLogo.Checked := false;
      cbAddress.Checked := false;
      NewDefaults;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPDPageMaintFrm.btnChangeClick(Sender: TObject);
begin
  if (Uppercase(Trim(edtName.Text)) = 'BLANK')
  or (Uppercase(Trim(edtName.Text)) = 'PREPRINTED') then
    edtName.ReadOnly := true;
  FMode := modeChange;
  with dmPage.qryPage do
  if Trim(edtName.Text) <> '' then
  begin
    Close;
    ParamByName('Name').AsString := Trim(edtName.Text);
    Open;
    if RecordCount = 1 then
    begin
      RollDown;
      LoadData;
      Edit;
    end
    else
      ErrorMsg('Layout not found');
  end;
end;

procedure TPDPageMaintFrm.btnSaveClick(Sender: TObject);
var
  FaxDefault, PrintDefault : string;
begin
  FaxDefault := '';
  PrintDefault := '';
  if (Fmode = modeView) then
  begin
    RollUp;
    Exit;
  end
  else
  if FMode = modeDelete then
  begin
    if ConfirmDelete then
      dmPage.qryPage.Delete;
    RollUp;
    Exit;
  end
  else
  if not ValidData(true) then
    Exit;
  try
    if dmPage.qryPagef_FaxDefault.AsString = 'Y' then
      FaxDefault := edtName.Text;
    if dmPage.qryPagef_PrintDefault.AsString = 'Y' then
      PrintDefault := edtName.Text;
    SaveData;
    dmPage.qryPage.Post;
    dmPage.ClearFaxDefault(FaxDefault);
    dmPage.ClearPrintDefault(PrintDefault);
    RollUp;
  except on E: Exception do
    MessageDlg('An error occured trying to save the record: ' + #13#10 +
      E.Message, mtError, [mbOK], 0);
  end;
end;

procedure TPDPageMaintFrm.NewPage;
begin
  if Assigned(Page) then
  begin
    Page.Free;
    Page := nil;
  end;
  Page := TLabel.Create(Self);
  with Page do
  begin
    Name := 'Page';
    Parent := gbPreview;
    Left := desPage.Left;
    Top := desPage.Top;
    Autosize := false;
    Caption := '';
    Color := clWhite;
  end;
end;

procedure TPDPageMaintFrm.FormDestroy(Sender: TObject);
begin
  dmPage.qryPage.RequestLive := false;
  if Assigned(Page) then
    Page.Free;
end;

procedure TPDPageMaintFrm.DrawAddress;
var
  Rect : TRect;
begin
  if cbAddress.Checked then
  with Page.Canvas do
  begin
    Rect.Left := FLeftA;
    Rect.Top := FTopA;
    Rect.Right := FLeftA + FWidthA;
    Rect.Bottom := FTopA + FHeightA;
    Brush.Color := clBlack;
    FillRect(Rect);
    Brush.Color := clWhite;
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.DrawRegAddress;
var
  Rect : TRect;
begin
  if cbRegAddress.Checked then
  with Page.Canvas do
  begin
    Rect.Left := FLeftRegA;
    Rect.Top := FTopRegA;
    Rect.Right := FLeftRegA + FWidthRegA;
    Rect.Bottom := FTopRegA + FHeightRegA;
    Brush.Color := clBlack;
    FillRect(Rect);
    Brush.Color := clWhite;
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.DrawPrePrinted;
var
  Rect : TRect;
begin
  if rgBlankOrPrinted.ItemIndex = 1  then
  with Page.Canvas do
  begin
    Rect.Left := FLeftP;
    Rect.Top := FTopP;
    Rect.Right := FLeftP + FWidthP;
    Rect.Bottom := FTopP + FHeightP;
    Brush.Color := clBlack;
    FillRect(Rect);
    Brush.Color := clWhite;
    Refresh;
    Application.ProcessMessages;
  end;
end;

procedure TPDPageMaintFrm.SetAddress;
begin
  FTopA := Pixelate(edtTopA);
  FWidthA := Pixelate(edtWidthA);
  FLeftA := Pixelate(edtLeftA);
  FHeightA := Pixelate(edtHeightA);
end;

procedure TPDPageMaintFrm.SetRegAddress;
begin
  FTopRegA := Pixelate(edtTopRegA);
  FWidthRegA := Pixelate(edtWidthRegA);
  FLeftRegA := Pixelate(edtLeftRegA);
  FHeightRegA := Pixelate(edtHeightRegA);
end;

procedure TPDPageMaintFrm.SetPrePrinted;
begin
  FTopP := Pixelate(edtTopP);
  FWidthP:= Pixelate(edtWidthP);
  FLeftP := Pixelate(edtLeftP);
  FHeightP := Pixelate(edtHeightP);
end;

function TPDPageMaintFrm.Pixelate(edt: TDBEdit): integer;
begin
  try
    Result := Trunc(edt.Field.AsFloat * FPixels);
  except
    Result := 0;
  end;
end;

function TPDPageMaintFrm.ValidData(const Saving : Boolean): Boolean;
begin
  Result := false;
  if Saving and (Trim(edtName.Text) = '') then
  begin
    ErrorMsg('Please enter a name for this layout');
    edtName.SetFocus;
    Exit;
  end;
  if cmbPageSize.ItemIndex < 0 then
  begin
    ErrorMsg('Please select a paper size');
    cmbPageSize.SetFocus;
    Exit;
  end;
  if cmbUnits.ItemIndex < 0 then
  begin
    ErrorMsg('Please select the required units of measure');
    cmbUnits.SetFocus;
    Exit;
  end;
  Result := true;
end;

procedure TPDPageMaintFrm.ErrorMsg(const data: string);
begin
  MessageDlg(data, mtError, [mbOK], 0);
end;

procedure TPDPageMaintFrm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPDPageMaintFrm.LoadData;
begin
  { Handle non-data aware stuff }
  with dmPage.qryPage do
  begin
    if FieldByName('f_Portrait').AsString = 'Y' then
      rgOrientation.ItemIndex := 0
    else
      rgOrientation.ItemIndex := 1;
    cmbPageSize.ItemIndex :=
      cmbPageSize.Items.IndexOf(FieldByName('f_PaperSize').AsString);
    cmbUnits.ItemIndex :=
      cmbUnits.Items.IndexOf(FieldByName('f_Units').AsString);
    if FieldByName('f_Preprinted').AsString = 'Y' then
      rgBlankOrPrinted.ItemIndex := 1
    else
      rgBlankOrPrinted.ItemIndex := 0;

    {Set the Address details}
    if FieldByName('f_AddressFontName').AsString = '' then
      cmbFontName.ItemIndex := cmbFontName.Items.IndexOf('Arial')
    else
      cmbFontName.ItemIndex := cmbFontName.Items.IndexOf(FieldByName('f_AddressFontName').AsString);

    if FieldByName('f_AddressFontSize').Asstring = '' then
      edtFontSize.value := 10
    else
      edtFontSize.value := FieldByName('f_AddressFontSize').Asinteger;

    if FieldByName('f_AddressAlignment').AsString = 'C' then
      rgAlignment.itemindex := 1
    else
    if FieldByName('f_AddressAlignment').AsString = 'R' then
      rgAlignment.itemindex := 2
    else
      rgAlignment.itemindex := 0;

    chkbxAutowrap.checked := (fieldbyname('f_AddressPrintByLine').asstring = 'N');

    case FieldByName('f_AddressFontStyle').Asinteger of
      1:  begin
            btnBold.down := true;
            btnItalic.down := false;
            btnUnderline.down := false;
          end;
      2:  begin
            btnBold.down := false;
            btnItalic.down := true;
            btnUnderline.down := false;
          end;
      3:  begin
            btnBold.down := true;
            btnItalic.down := true;
            btnUnderline.down := false;
          end;
      4:  begin
            btnBold.down := false;
            btnItalic.down := false;
            btnUnderline.down := true;
          end;
      5:  begin
            btnBold.down := true;
            btnItalic.down := false;
            btnUnderline.down := true;
          end;
      6:  begin
            btnBold.down := false;
            btnItalic.down := true;
            btnUnderline.down := true;
          end;
      7:  begin
            btnBold.down := true;
            btnItalic.down := true;
            btnUnderline.down := true;
          end;
    else
      begin
        btnBold.down := false;
        btnItalic.down := false;
        btnUnderline.down := false;
      end;
    end;

    {Set the Registered Address details}
    if FieldByName('f_RegAddressFontName').AsString = '' then
      cmbRegFontName.ItemIndex := cmbRegFontName.Items.IndexOf('Arial')
    else
      cmbRegFontName.ItemIndex := cmbRegFontName.Items.IndexOf(FieldByName('f_RegAddressFontName').AsString);

    if FieldByName('f_RegAddressFontSize').Asstring = '' then
      edtRegFontSize.value := 10
    else
      edtRegFontSize.value := FieldByName('f_RegAddressFontSize').Asinteger;

    if FieldByName('f_RegAddressAlignment').AsString = 'C' then
      rgRegAlignment.itemindex := 1
    else
    if FieldByName('f_RegAddressAlignment').AsString = 'R' then
      rgRegAlignment.itemindex := 2
    else
      rgRegAlignment.itemindex := 0;

    chkbxRegAutowrap.checked := (fieldbyname('f_RegAddressPrintByLine').asstring = 'N');

    case FieldByName('f_RegAddressFontStyle').Asinteger of
      1:  begin
            btnRegBold.down := true;
            btnRegItalic.down := false;
            btnRegUnderline.down := false;
          end;
      2:  begin
            btnRegBold.down := false;
            btnRegItalic.down := true;
            btnRegUnderline.down := false;
          end;
      3:  begin
            btnRegBold.down := true;
            btnRegItalic.down := true;
            btnRegUnderline.down := false;
          end;
      4:  begin
            btnRegBold.down := false;
            btnRegItalic.down := false;
            btnRegUnderline.down := true;
          end;
      5:  begin
            btnRegBold.down := true;
            btnRegItalic.down := false;
            btnRegUnderline.down := true;
          end;
      6:  begin
            btnRegBold.down := false;
            btnRegItalic.down := true;
            btnRegUnderline.down := true;
          end;
      7:  begin
            btnRegBold.down := true;
            btnRegItalic.down := true;
            btnRegUnderline.down := true;
          end;
    else
      begin
        btnRegBold.down := false;
        btnRegItalic.down := false;
        btnRegUnderline.down := false;
      end;
    end;
  end;
end;

procedure TPDPageMaintFrm.SaveData;
var
  Style: integer;
begin
  { Handle non-data aware stuff }
  with dmPage.qryPage do
  begin
    if rgOrientation.ItemIndex = 0 then
      FieldByName('f_Portrait').AsString := 'Y'
    else
      FieldByName('f_Portrait').AsString := 'N';
    FieldByName('f_PaperSize').AsString := cmbPageSize.Text;
    FieldByName('f_Units').AsString := cmbUnits.Text;
    FieldByName('f_PageLayoutName').AsString := Trim(edtName.Text);
    if rgBlankOrPrinted.ItemIndex = 0 then
      FieldByName('f_PrePrinted').AsString := 'N'
    else
    begin
      FieldByName('f_PrePrinted').AsString := 'Y';
      FieldByName('f_FaxDefault').AsString := 'N';
    end;

    {Save Address details}
    FieldByName('f_AddressFontName').asstring := cmbFontName.text;
    FieldByName('f_AddressFontSize').asinteger := edtFontSize.value;

    case rgAlignment.itemindex of
      0: FieldByName('f_AddressAlignment').asstring := 'L';
      1: FieldByName('f_AddressAlignment').asstring := 'C';
      2: FieldByName('f_AddressAlignment').asstring := 'R';
    end;

    Style := 0;
    if btnBold.Down then
      Style := style + cBold;
    if btnItalic.Down then
      Style := style + cItalic;
    if btnUnderline.Down then
      Style := style + cUnderline;
    FieldByName('f_AddressFontStyle').asinteger := Style;

    if chkbxAutowrap.Checked then
      fieldbyname('f_AddressPrintByLine').asstring := 'N'
    else
      fieldbyname('f_AddressPrintByLine').asstring := 'Y';

    {Save Registered Address details}
    FieldByName('f_RegAddressFontName').asstring := cmbRegFontName.text;
    FieldByName('f_RegAddressFontSize').asinteger := edtRegFontSize.value;

    case rgRegAlignment.itemindex of
      0: FieldByName('f_RegAddressAlignment').asstring := 'L';
      1: FieldByName('f_RegAddressAlignment').asstring := 'C';
      2: FieldByName('f_RegAddressAlignment').asstring := 'R';
    end;

    Style := 0;
    if btnRegBold.Down then
      Style := style + cBold;
    if btnRegItalic.Down then
      Style := style + cItalic;
    if btnRegUnderline.Down then
      Style := style + cUnderline;
    FieldByName('f_RegAddressFontStyle').asinteger := Style;

    if chkbxRegAutowrap.Checked then
      fieldbyname('f_RegAddressPrintByLine').asstring := 'N'
    else
      fieldbyname('f_RegAddressPrintByLine').asstring := 'Y';

  end;
end;

procedure TPDPageMaintFrm.btnBrowseClick(Sender: TObject);
begin
  OPD.DefaultExt := GraphicExtension(TBitmap);
  OPD.Filter := GraphicFilter(TBitmap);
  if OPD.Execute then
    edtBitMap.Text := OPD.FileName;
  Application.ProcessMessages;
end;

procedure TPDPageMaintFrm.FormActivate(Sender: TObject);
begin
  if not FActDone then
  begin
    rgBlankOrPrinted.ItemIndex := -1;
    rgBlankOrPrinted.ItemIndex := 0;
    pcAreas.ActivePage := tsAddress;
    RollUp;
    FActDone := true;
  end;
end;

procedure TPDPageMaintFrm.btnDeleteClick(Sender: TObject);
begin
  if (Uppercase(Trim(edtName.Text)) = 'BLANK')
  or (Uppercase(Trim(edtName.Text)) = 'PREPRINTED') then
  begin
    MessageDlg('The layouts ''Blank'' and ''Preprinted'' are reserved ' + #13 +
      'and cannot be deleted from the system.', mtError, [mbOK], 0);
    edtName.SetFocus;
    Exit;
  end;
  {  Delete current record }
  FMode := modeDelete;
  with dmPage.qryPage do
  if Trim(edtName.Text) <> '' then
  begin
    Close;
    ParamByName('Name').AsString := Trim(edtName.Text);
    Open;
    if RecordCount = 1 then
    begin
      RollDown;
      LoadData;
      btnShowClick(nil);
    end
    else
      ErrorMsg('Layout not found');
  end;  
end;

procedure TPDPageMaintFrm.SetpcArea;
var
  i : integer;
  CanSee : Boolean;
begin
  CanSee := false;
  for i := 0 to Pred(pcAreas.PageCount) do
    if pcAreas.Pages[i].TabVisible then
      CanSee := true;
  pcAreas.Visible := CanSee;
end;

procedure TPDPageMaintFrm.btnLookupClick(Sender: TObject);
var
  PDLuPageFrm: TPDLuPageFrm;
begin
  PDLuPageFrm := TPDLuPageFrm.Create(Self);
  try
    PDLuPageFrm.Mode := ltPageLayout;
    if PDLuPageFrm.ShowModal = mrOK then
      edtName.Text := PDLuPageFrm.LayoutName;
  finally
    PDLuPageFrm.Free;
  end;
end;

procedure TPDPageMaintFrm.RollDown;
begin
  LockWindowUpdate(Handle);
  try
    ClientHeight := FFullHeight;
    gbDetails.Show;
    pnlHead.Hide;
    gbPreview.Show;
    Enable(FMode in [modeAdd, modeChange]);
    if FMode = modeDelete then
      labDelete.Show
    else
      labDelete.Hide;

    cbPrintDefault.Visible := not labDelete.Visible;
    Application.ProcessMessages;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPDPageMaintFrm.RollUp;
begin
  LockWindowUpdate(Handle);
  try
    if Assigned(Page) then
      Page.Hide;
    gbDetails.Hide;
    gbPreview.Hide;
    ClientHeight := gbHead.Height;
    pnlHead.Show;
    edtName.ReadOnly := false;
    edtName.Text := '';
    edtNameChange(nil);
    Application.ProcessMessages;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPDPageMaintFrm.btnCancelClick(Sender: TObject);
begin
  dmPage.qryPage.Cancel;
  dmPage.qryPage.Close;
  edtName.Text := '';
  RollUp;
end;

procedure TPDPageMaintFrm.btnViewClick(Sender: TObject);
begin
  FMode := modeView;
  with dmPage.qryPage do
  if Trim(edtName.Text) <> '' then
  begin
    Close;
    ParamByName('Name').AsString := Trim(edtName.Text);
    Open;
    if RecordCount = 1 then
    begin
      RollDown;
      LoadData;
      btnShowClick(nil);
    end
    else
      ErrorMsg('Layout not found');
  end;
end;

procedure TPDPageMaintFrm.Enable(const OnOrOff : Boolean);
begin
  cmbPageSize.Enabled := OnOrOff;
  cmbUnits.Enabled := OnOrOff;
  rgOrientation.Enabled := OnOrOff;
  gbMargins.Enabled := OnOrOff;
  rgBlankOrPrinted.Enabled := OnOrOff;
  gbPrintables.Enabled := OnOrOff;
  tsPreprinted.Enabled := OnOrOff;
  tsAddress.Enabled := OnOrOff;
  tsLogo.Enabled := OnOrOff;
end;

procedure TPDPageMaintFrm.NewDefaults;
begin
  { Set some default values }
  with dmPage.qryPage do
  begin
    FieldByName('f_Portrait').AsString := 'Y';
    FieldByName('f_PaperSize').AsString := 'A4';
    FieldByName('f_Units').AsString := sInches;
    FieldByName('f_PrePrinted').AsString := 'N';
    FieldByName('f_PrintAddress').AsString := 'N';
    FieldByName('f_PrintLogo').AsString := 'N';
    FieldByName('f_FaxDefault').AsString := 'N';
  end;
end;

procedure TPDPageMaintFrm.edtNameChange(Sender: TObject);
begin
  if not pnlHead.Visible then
    Exit;
  if Trim(edtName.Text) <> '' then
  begin
    btnAdd.Show;
    btnChange.Show;
    btnView.Show;
    btnDelete.Show;
  end
  else
  begin
    btnAdd.Hide;
    btnChange.Hide;
    btnView.Hide;
    btnDelete.Hide;
  end;
end;

function TPDPageMaintFrm.ConfirmDelete: Boolean;
begin
  Result := MessageDlg('Are you certain you want to delete this layout?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

end.



