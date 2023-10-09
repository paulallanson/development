(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Broker Enquiry Letter Layout maintenance form.

VSS Info:
$Header: /PageDesigner/PDLetterMaint.pas 11    11/10/:1 8:13 Janiner $
$History: PDLetterMaint.pas $
 * 
 * *****************  Version 11  *****************
 * User: Janiner      Date: 11/10/:1   Time: 8:13
 * Updated in $/PageDesigner
 * Add new routine to allow printing of extra charges as either a
 * summary/detail .
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 10/05/:1   Time: 14:02
 * Updated in $/PageDesigner
 * Interim check-in, to enable testing of invoice print for TF
 * 
 * *****************  Version 9  *****************
 * User: Roddym       Date: 30/03/:0   Time: 14:37
 * Updated in $/PageDesigner
 * Fix bug in Collision (again), now uses a list of memos and sorts them
 * by position.  Fix access violation due to Parent of elements not being
 * set to point to new Letter when assigning clone.
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 30/03/:0   Time: 10:34
 * Updated in $/PageDesigner
 * Changes to the way column widths and indents are handled.  New dialog
 * to confirm column width changes.  Propagate letter font changes to the
 * elements.
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 10/03/:0   Time: 16:12
 * Updated in $/PageDesigner
 * Make the UsesTab attribute visible and allow users to change it.
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 9/03/:0    Time: 15:40
 * Updated in $/PageDesigner
 * Allow user to specify separate fonts for questions and answers.
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
 * User: Roddym       Date: 10/02/:0   Time: 16:29
 * Updated in $/PageDesigner
 * New letter layout Quotation Summary allows all lines of an enquiry to
 * be printed in one letter.  Database changes.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 10/02/:0   Time: 11:59
 * Updated in $/PageDesigner
 * Add questions and answers to Purchase Order and Acknowledgement letter
 * layouts.  Add new page layout field PrintDefault similar to FaxDefault.
 * Add new letter layout field LetterTypeDefault so we can display the
 * user's selected default on print selection forms in Broker.  Version
 * number of PageDesigner raised to 2.2a
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
unit PDLetterMaint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, PDFontFrame, ComCtrls, Buttons, PDLetter, LetterDM,
  ImgList, Spin, ExtCtrls, Mask, DBCtrls, Menus, Clipbrd;

type
  TElementSet = set of 1..99;
  
  TPDLetterMaintFrm = class(TForm)
    pcSettings: TPageControl;
    tsFonts: TTabSheet;
    fmFont1: TfmFontInfo;
    fmFont2: TfmFontInfo;
    fmFont3: TfmFontInfo;
    fmFont4: TfmFontInfo;
    fmFont5: TfmFontInfo;
    tsSettings: TTabSheet;
    tcElements: TTabControl;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    pnlPrintOrder: TPanel;
    lblLayout: TLabel;
    edtLayout: TEdit;
    cbDefault: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTabStop1: TEdit;
    edtTabStop2: TEdit;
    cbTabUnit: TComboBox;
    gbVariable: TGroupBox;
    lblCanEdit: TLabel;
    reText1: TRichEdit;
    fmElementFont1: TfmFontInfo;
    gbDatabase: TGroupBox;
    Label5: TLabel;
    fmElementFont2: TfmFontInfo;
    reText2: TRichEdit;
    lblPrintOrder: TLabel;
    edtPrintOrder: TEdit;
    cbColumn: TComboBox;
    btnPreview: TBitBtn;
    cbPrinted: TCheckBox;
    cbBlankBefore: TCheckBox;
    cbBlankAfter: TCheckBox;
    rgAlignment: TRadioGroup;
    cbUsesTab: TComboBox;
    lblUsesTab: TLabel;
    DtldCheckBox: TCheckBox;
    pmnuRichTextEditor: TPopupMenu;
    mnuUnDo: TMenuItem;
    mnuCut: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPaste: TMenuItem;
    N1: TMenuItem;
    mnuDelete: TMenuItem;
    N2: TMenuItem;
    mnuSelectAll: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tcElementsChange(Sender: TObject);
    procedure BtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tcElementsChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure edtLayoutChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtTabStop1KeyPress(Sender: TObject; var Key: Char);
    procedure rgAlignmentClick(Sender: TObject);
    procedure fmElementFont1cbFontNameChange(Sender: TObject);
    procedure fmElementFont1edtFontSizeChange(Sender: TObject);
    procedure fmElementFont2cbFontNameChange(Sender: TObject);
    procedure fmElementFont2edtFontSizeChange(Sender: TObject);
    procedure cbUsesTabChange(Sender: TObject);
    procedure pmnuRichTextEditorPopup(Sender: TObject);
    procedure mnuUnDoClick(Sender: TObject);
    procedure mnuCutClick(Sender: TObject);
    procedure mnuCopyClick(Sender: TObject);
    procedure mnuPasteClick(Sender: TObject);
    procedure mnuDeleteClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
  private
    FActivated : Boolean;
    FLetter : TLetter;
    FLetterName: string;
    FLetterType: integer;
    FFontSet1, FFontSet2 : TElementSet;
    procedure BuildFontSets;
    procedure PropagateFonts;
    procedure SetTabButtons;
    procedure DoEnquiry;
    procedure DoQuotation;
    procedure DoQuotationSummary;
    procedure DoAcknowledgement;
    procedure DoPurchaseOrder;
    procedure FixPanels;
    function  FontNameViaIndex(const index : integer) : string;
    function  FontSizeViaIndex(const index : integer) : integer;
    function  FontStyleViaIndex(const index : integer) : integer;
    function  FontStyleFromNumber(const style : integer) : TFontStyles;
    procedure LoadData;
    procedure SaveData;
    procedure StoreElement(const index : integer);
    procedure StoreLetter;
    procedure SetButtons(TabSheet : TTabSheet; const frameName : string;
      const value : integer);
    procedure SetNames(const index : integer; const value : string);
    procedure SetSpins(const index, value : integer);
    procedure ShowElement(const index : integer);
    procedure SetLetterName(const Value: string);
    procedure SetLetterType(const Value: integer);
    function GetRichEditFromPopup: TRichEdit;
  public
    property LetterName : string read FLetterName write SetLetterName;
    property LetterType : integer read FLetterType write SetLetterType;
  end;

implementation

uses
  Printers, Math, PDDragDrop, System.UITypes;
  
{$R *.DFM}

procedure TPDLetterMaintFrm.BtnClick(Sender: TObject);
var
  reText : TRichEdit;
begin
  if Sender is TSpeedButton then
    with Sender as TSpeedButton do
      if TfmFontInfo(Parent).Name = 'fmElementFont1' then
        reText := reText1
      else
      if TfmFontInfo(Parent).Name = 'fmElementFont2' then
        reText := reText2
      else
        reText := nil
  else
    reText := nil;

    if Assigned(reText) then
    with Sender as TSpeedButton do
    if Pos('Bold', Name) > 0 then
    begin
      if Down then
        reText.Font.Style := reText.Font.Style + [fsBold]
      else
        reText.Font.Style := reText.Font.Style - [fsBold]
    end
    else
    if Pos('Italic', Name) > 0 then
    begin
      if Down then
        reText.Font.Style := reText.Font.Style + [fsItalic]
      else
        reText.Font.Style := reText.Font.Style - [fsItalic]
    end
    else
    if Pos('Under', Name) > 0 then
    begin
      if Down then
        reText.Font.Style := reText.Font.Style + [fsUnderline]
      else
        reText.Font.Style := reText.Font.Style - [fsUnderline]
    end;
end;

procedure TPDLetterMaintFrm.FormCreate(Sender: TObject);
var
  i, x : integer;
begin
  FLetter := TLetter.Create;
  with fmFont1.cbFontName.Items do
  begin
    Clear;
    Add('<None>');
    AddStrings(Printer.Fonts);
  end;
  fmFont1.cbFontName.Sorted := true;
  fmFont2.cbFontName.Items.Assign(fmFont1.cbFontName.Items);
  fmFont3.cbFontName.Items.Assign(fmFont1.cbFontName.Items);
  fmFont4.cbFontName.Items.Assign(fmFont1.cbFontName.Items);
  fmFont5.cbFontName.Items.Assign(fmFont1.cbFontName.Items);
  fmFont1.cbFontName.ItemIndex := 0;
  fmFont2.cbFontName.ItemIndex := 0;
  fmFont3.cbFontName.ItemIndex := 0;
  fmFont4.cbFontName.ItemIndex := 0;
  fmFont5.cbFontName.ItemIndex := 0;
  fmElementFont1.cbFontName.ItemIndex := 0;
  fmElementFont2.cbFontName.ItemIndex := 0;
  tcElements.TabIndex := 0;
  tcElementsChange(nil);
  for i := 0 to Pred(ComponentCount) do
  begin
    if Components[i] is TfmFontInfo then
    for x := 0 to Pred(TfmFontInfo(Components[i]).ComponentCount) do
      if TfmFontInfo(Components[i]).Components[x] is TSpeedButton then
      begin
          TSpeedButton(TfmFontInfo(Components[i]).Components[x]).OnClick :=
            BtnClick;
        TSpeedButton(TfmFontInfo(Components[i]).Components[x]).GroupIndex :=
          (i*10)+x;
      end;
  end;
end;

procedure TPDLetterMaintFrm.tcElementsChange(Sender: TObject);
begin
  if tcElements.TabIndex = 0 then
  begin
    tsSettings.TabVisible := false;
    tsFonts.TabVisible := true;
  end
  else
  begin
    tsSettings.TabVisible := true;
    tsFonts.TabVisible := false;
    ShowElement(tcElements.TabIndex);
  end;
end;

procedure TPDLetterMaintFrm.LoadData;
var
  i : integer;
  s : string;
begin
  FLetter.Name := LetterName;
  edtLayout.Text := LetterName;
  dmLetter.LoadLetter(FLetter);
  case FLetter.LetterType of
  ltEnquiry         : s := 'enquiries';
  ltQuotation       : s := 'quotations';
  ltPurchaseOrder   : s := 'purchase orders';
  ltAcknowledgement : s := 'acknowledgements';
  ltQuotationSummary: s := 'quotation summaries';
  end;
  cbDefault.Caption := 'Default layout for ' + s;
  cbDefault.Checked := FLetter.IsDefault;
  edtTabStop1.Text := FloatToStrF(FLetter.TabStop1, ffFixed, 6, 2);
  edtTabStop2.Text := FloatToStrF(FLetter.TabStop2, ffFixed, 6, 2);
  cbTabUnit.ItemIndex := cbTabUnit.Items.IndexOf(FLetter.TabUnit);
  with FLetter do
    for i := Low(FontArray) to High(FontArray) do
    begin
      SetNames(i, FontArray[i].FontName);
      SetButtons(tsFonts, 'fmFont' + IntToStr(i), FontArray[i].FontStyle);
      SetSpins(i, FontArray[i].FontSize);
      Application.ProcessMessages;
    end;
end;

procedure TPDLetterMaintFrm.SaveData;
var
  Updating : Boolean;
begin
  if edtLayout.Text <> LetterName then
  begin
    Updating := false;
    if MessageDlg('Are you sure you want to save layout ' +
      LetterName + ' as ' + edtLayout.Text,
      mtConfirmation,[mbYes, mbNo], 0) <> mrYes then
        Exit;
  end
  else
    Updating := true;
  FLetter.Name := edtLayout.Text;
  FLetter.IsDefault := cbDefault.Checked;
  FLetter.TabUnit := cbTabUnit.Text;
  FLetter.TabStop1 := StrToFloatDef(edtTabStop1.Text, 0, FormatSettings);
  FLetter.TabStop2 := StrToFloatDef(edtTabStop2.Text, 0, FormatSettings);
  if Updating then
    dmLetter.UpdateLetter(FLetter)
  else
    dmLetter.AddLetter(FLetter);
  ModalResult := mrOK;
end;

procedure TPDLetterMaintFrm.FormDestroy(Sender: TObject);
begin
  FLetter.Free;
end;

procedure TPDLetterMaintFrm.SetButtons(TabSheet : TTabSheet;
  const frameName : string; const value: integer);
var
  aFrame : TfmFontInfo;
begin
  aFrame := TabSheet.FindChildControl(frameName) as TfmFontInfo;
  if Assigned(aFrame) then
    aFrame.FontStyle := FontStyleFromNumber(value);
end;

procedure TPDLetterMaintFrm.SetNames(const index: integer;
  const value: string);
var
  aName : string;
  aFrame : TfmFontInfo;
begin
  aName := 'fmFont' + IntToStr(index);
  aFrame := tsFonts.FindChildControl(aName) as TfmFontInfo;
  if Assigned(aFrame) then
    aFrame.cbFontName.ItemIndex :=
      aFrame.cbFontName.Items.IndexOf(value);
end;

procedure TPDLetterMaintFrm.SetSpins(const index, value: integer);
var
  aName : string;
  aFrame : TfmFontInfo;
begin
  aName := 'fmFont' + IntToStr(index);
  aFrame := tsFonts.FindChildControl(aName) as TfmFontInfo;
  if Assigned(aFrame) then
    aFrame.edtFontSize.Value := Min(Max(minFontSize, value), maxFontSize);
end;

procedure TPDLetterMaintFrm.ShowElement(const index: integer);
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[index];
  if Assigned(element) then
  begin
    reText1.Text := element.Text;
    with fmElementFont1 do
    begin
      cbFontName.ItemIndex := element.FontNo-1;
      edtFontSize.Value := Min(Max(minFontSize, element.FontSize), maxFontSize);
      fmElementFont1.FontStyle := FontStyleFromNumber(element.FontStyle);
    end;
    with fmElementFont2 do
    begin
      cbFontName.ItemIndex := element.Font2No-1;
      edtFontSize.Value := Min(Max(minFontSize, element.Font2Size), maxFontSize);
      fmElementFont2.FontStyle := FontStyleFromNumber(element.Font2Style);
    end;
    reText1.Font.Name := FontNameViaIndex(element.FontNo);
    reText1.Font.Style := FontStyleFromNumber(element.FontStyle);
    reText1.Font.Size := fmElementFont1.edtFontSize.Value;
    reText2.Font.Name := FontNameViaIndex(element.Font2No);
    reText2.Font.Style := FontStyleFromNumber(element.Font2Style);
    reText2.Font.Size := fmElementFont2.edtFontSize.Value;
    cbPrinted.Checked := element.Printed;
    cbBlankBefore.Checked := element.BlankBefore;
    cbBlankAfter.Checked := element.BlankAfter;
    dtldCheckBox.checked := element.Detailed = 'Y';
    if element.Fixed or not element.DbData then
    begin
      cbUsesTab.Hide;
      cbUsesTab.text := '';
      LblUsesTab.Hide;
    end
    else
    begin
      cbUsesTab.Show;
      lblUsesTab.show;
      if element.UsesTab <> 'N' then
        begin
          if element.UsesTab = 'Y' then
            cbUsesTab.text := '1'
          else
            cbUsesTab.text := element.UsesTab;
        end
      else
        cbusesTab.text := '';
    end;
    case element.Alignment of
    taLeftJustify  : rgAlignment.ItemIndex := 0;
    taRightJustify : rgAlignment.ItemIndex := 2;
    taCenter       : rgAlignment.ItemIndex := 1;
    end; { case }
    if not (element.ShowDetailed) then
        DtldCheckBox.Hide
    else
        DtldCheckBox.Show;

    if element.UsesTab <> 'N' then
    begin
      rgAlignment.Hide;
      cbColumn.Enabled := false;
    end
    else
    begin
      rgAlignment.Show;
      cbColumn.Enabled := true;
    end;
    { Currently, deleivery details for purchase order letters has to be
      hard coded so don't allow them to play with it }
    cbUsesTab.Enabled := true;
    if FLetter.LetterType in [ltPurchaseOrder, ltAcknowledgement] then
      if CompareText(element.Name, psDeliverTo) = 0 then
        cbUsesTab.Enabled := false;
    edtPrintOrder.Text := IntToStr(element.PrintOrder);
    cbColumn.ItemIndex := element.Column;
    pnlPrintOrder.Visible := element.Name <> sContinuation;
    gbVariable.Visible := not element.Fixed;
    { Kludge to allow separate fonts for questions and answers }
    if Pos('QUEST', UpperCase(element.Name)) > 0 then
    begin
      gbVariable.Visible := true;
      gbVariable.Caption := 'Font for questions';
      gbDatabase.Caption := 'Font for answers';
      lblCanEdit.Hide;
      reText1.ReadOnly := true;
    end
    else
    begin
      gbVariable.Caption := 'Variable Part';
      gbDatabase.Caption := 'Fixed (database) part';
      lblCanEdit.Show;
      reText1.ReadOnly := false;
    end;
    gbDatabase.Visible := element.DbData;
    FixPanels;
  end;
end;

function TPDLetterMaintFrm.FontNameViaIndex(const index: integer): string;
var
  aName : string;
  aFrame : TfmFontInfo;
begin
  Result := '';
  aName := 'fmFont' + IntToStr(index);
  aFrame := tsFonts.FindChildControl(aName) as TfmFontInfo;
  if Assigned(aFrame) then
    Result := aFrame.cbFontName.Text;
end;

function TPDLetterMaintFrm.FontStyleFromNumber(
  const style: integer): TFontStyles;
begin
  Result := [];
  if (style and cBold) <> 0 then
    Result := Result + [fsBold];
  if (style and cItalic) <> 0 then
    Result := Result + [fsItalic];
  if (style and cUnderline) <> 0 then
    Result := Result + [fsUnderline];
end;


procedure TPDLetterMaintFrm.tcElementsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if tcElements.TabIndex > 0 then
    StoreElement(tcElements.TabIndex)
  else
    StoreLetter;
end;

procedure TPDLetterMaintFrm.StoreElement(const index: integer);
var
  element : TElement;
  Style : integer;
begin
  element := FLetter.Elements.ElementByNumber[index];
  if Assigned(element) then
  begin
    element.Text := reText1.Text;
    element.Printed := cbPrinted.Checked;
    element.BlankBefore := cbBlankBefore.Checked;
    element.BlankAfter := cbBlankAfter.Checked;
    if dtldCheckBox.checked then
      element.Detailed := 'Y'
    else
      element.Detailed := 'N';
    if element.fixed <> true then
      begin
        if (cbUsesTab.text = '<None>') or
          (cbUsesTab.text = '') then
          element.UsesTab := 'N'
        else
          element.UsesTab := cbUsesTab.text;
      end
    else
      element.UsesTab := 'N';
    element.Column := cbColumn.ItemIndex;
    if element.UsesTab <> 'N' then
      element.Alignment := taLeftJustify
    else
      case rgAlignment.ItemIndex of
      0 : element.Alignment := taLeftJustify;
      2 : element.Alignment := taRightJustify;
      1 : element.Alignment := taCenter;
      end; { case }
    with fmElementFont1 do
    begin
      element.FontNo := cbFontName.ItemIndex + 1;
      element.FontSize := edtFontSize.Value;
      Style := 0;
      if fsBold in FontStyle then
        Style := Style + cBold;
      if fsItalic in FontStyle then
        Style := Style + cItalic;
      if fsUnderline in FontStyle then
        Style := Style + cUnderline;
      element.FontStyle := Style;
    end;
    with fmElementFont2 do
    begin
      element.Font2No := cbFontName.ItemIndex + 1;
      element.Font2Size := edtFontSize.Value;
      Style := 0;
      if fsBold in FontStyle then
        Style := Style + cBold;
      if fsItalic in FontStyle then
        Style := Style + cItalic;
      if fsUnderline in FontStyle then
        Style := Style + cUnderline;
      element.Font2Style := Style;
    end;
  end;
end;

procedure TPDLetterMaintFrm.StoreLetter;
var
  i : integer;
begin
  BuildFontSets;  { So we can remember who needs changing }
  with FLetter do
    for i := Low(FontArray) to High(FontArray) do
    begin
      FontArray[i].FontName := FontNameViaIndex(i);
      FontArray[i].FontStyle := FontStyleViaIndex(i);
      FontArray[i].FontSize := FontSizeViaIndex(i);
    end;
  PropagateFonts;  { Propagate any font changes to the elements }
end;

function TPDLetterMaintFrm.FontSizeViaIndex(const index: integer): integer;
var
  aName : string;
  aFrame : TfmFontInfo;
begin
  Result := minFontSize;
  aName := 'fmFont' + IntToStr(index);
  aFrame := tsFonts.FindChildControl(aName) as TfmFontInfo;
  if Assigned(aFrame) then
    Result := aFrame.edtFontSize.Value;
end;

procedure TPDLetterMaintFrm.btnSaveClick(Sender: TObject);
var
  Valid1, Valid2 : integer;
begin
  if (StrToFloatDef(edtTabStop2.Text, 0, FormatSettings) > 0) and
     (StrToFloatDef(edtTabStop1.Text, 0, FormatSettings) > StrToFloatDef(edtTabStop2.Text, 0, FormatSettings)) then
  begin
    MessageDlg('Tab Stop 1 cannot be greater than Tab Stop 2', mtError,
      [mbOK], 0);
    edtTabStop1.SetFocus;
    Exit;
  end;
  { Rough validation but we don't know the paper size/layout }
  if cbTabUnit.ItemIndex = 0  then  { inches }
  begin
    Valid1 := 3;
    Valid2 := 5;
  end
  else  { centimetres }
  begin
    Valid1 := 8;
    Valid2 := 12;
  end;
  if StrToFloatDef(edtTabStop1.Text, 0, FormatSettings) > Valid1 then
  begin
    if MessageDlg('The value of Tab Stop 1 is probably too high. ' + #13 +
      'Click OK to confirm or Cancel to change.', mtConfirmation,
      [mbOK, mbCancel], 0) <> mrOK then
    begin
      edtTabStop1.SetFocus;
      Exit;
    end;
  end;
  if StrToFloatDef(edtTabStop2.Text, 0, FormatSettings) > Valid2 then
  begin
    if MessageDlg('The value of Tab Stop 2 is probably too high. ' + #13 +
      'Click OK to confirm or Cancel to change.', mtConfirmation,
      [mbOK, mbCancel], 0) <> mrOK then
    begin
      edtTabStop2.SetFocus;
      Exit;
    end;
  end;
  if tcElements.TabIndex > 0 then
    StoreElement(tcElements.TabIndex)
  else
    StoreLetter;
  SaveData;
end;

procedure TPDLetterMaintFrm.btnPreviewClick(Sender: TObject);
var
  frmPreview: TfrmPreview;
  i : integer;
begin
  if tcElements.TabIndex > 0 then
    StoreElement(tcElements.TabIndex)
  else
    StoreLetter;
  Screen.Cursor := crHourGlass;
  frmPreview := TfrmPreview.Create(Self);
  try
    frmPreview.Letter := FLetter.Clone;
    Screen.Cursor := crDefault;
    if frmPreview.Showmodal = mrOK then
    begin
      FLetter.Free;
      FLetter := frmPreview.Letter;
      { Fix the Parent of the elements which is pointing to freed version }
      for i := 0 to Pred(FLetter.Elements.Count) do
        FLetter.Elements[i].Parent := frmPreview.Letter;
    end
    else
      frmPreview.Letter.Free;
  finally
    frmPreview.Free;
    ShowElement(tcElements.TabIndex);
    Screen.Cursor := crDefault;
  end;
end;

procedure TPDLetterMaintFrm.SetLetterName(const Value: string);
begin
  FLetterName := Value;
end;

procedure TPDLetterMaintFrm.edtLayoutChange(Sender: TObject);
begin
  if Trim(edtLayout.Text) = '' then
    btnSave.Hide
  else
  begin
    if (Trim(edtLayout.Text) <> LetterName) and
       (btnSave.Caption <> 'Save As') then
      btnSave.Caption := 'Save As'
    else
    if (Trim(edtLayout.Text) = LetterName) and
       (btnSave.Caption <> 'Save') then
      btnSave.Caption := 'Save';
    btnSave.Show;
  end;
end;

procedure TPDLetterMaintFrm.SetTabButtons;
begin
  { Set the captions of the tab buttons from the Letter Elements }
  with tcElements do
  begin
    Tabs.Clear;
    Tabs.Add('Letter Settings');
    case LetterType of
      ltEnquiry         : DoEnquiry;
      ltQuotation       : DoQuotation;
      ltAcknowledgement : DoAcknowledgement;
      ltPurchaseOrder   : DoPurchaseOrder;
      ltQuotationSummary: DoQuotationSummary;
    end;  { case }
  end;
end;

procedure TPDLetterMaintFrm.SetLetterType(const Value: integer);
begin
  FLetterType := Value;
end;

procedure TPDLetterMaintFrm.DoAcknowledgement;
var
  i : integer;
begin
  for i := Low(AcknowledgementElements) to High(AcknowledgementElements) do
    tcElements.Tabs.Add(AcknowledgementElements[i]);
end;

procedure TPDLetterMaintFrm.DoEnquiry;
var
  i : integer;
begin
  for i := Low(EnquiryElements) to High(EnquiryElements) do
    tcElements.Tabs.Add(EnquiryElements[i]);
end;

procedure TPDLetterMaintFrm.DoPurchaseOrder;
var
  i : integer;
begin
  for i := Low(PurchaseOrderElements) to High(PurchaseOrderElements) do
    tcElements.Tabs.Add(PurchaseOrderElements[i]);
end;

procedure TPDLetterMaintFrm.DoQuotation;
var
  i : integer;
begin
  for i := Low(QuotationElements) to High(QuotationElements) do
    tcElements.Tabs.Add(QuotationElements[i]);
end;

procedure TPDLetterMaintFrm.FormShow(Sender: TObject);
begin
  if not FActivated then
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;          
    LockWindowUpdate(Handle);
    try
      LoadData;
      SetTabButtons;
    finally
      FActivated := true;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
      Application.ProcessMessages;      
    end;
  end;
end;

function TPDLetterMaintFrm.FontStyleViaIndex(
  const index: integer): integer;
var
  aName : string;
  aFrame : TfmFontInfo;
  Style : TFontStyles;
begin
  Result := 0;
  aName := 'fmFont' + IntToStr(index);
  aFrame := tsFonts.FindChildControl(aName) as TfmFontInfo;
  if Assigned(aFrame) then
  begin
    Style := aFrame.FontStyle;
    if fsBold in Style then
      Result := Result + cBold;
    if fsItalic in Style then
      Result := Result + cItalic;
    if fsUnderline in Style then
      Result := Result + cUnderline;
  end;
end;

procedure TPDLetterMaintFrm.DoQuotationSummary;
var
  i : integer;
begin
  for i := Low(QuotationSummaryElements) to High(QuotationSummaryElements) do
    tcElements.Tabs.Add(QuotationSummaryElements[i]);
end;

procedure TPDLetterMaintFrm.edtTabStop1KeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', Text);
  end;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPDLetterMaintFrm.rgAlignmentClick(Sender: TObject);
var
  Data : string;
begin
  Data := reText1.Text;
  reText1.Lines.Clear;
  case rgAlignment.ItemIndex of
  0 : reText1.Alignment := taLeftJustify;
  1 : reText1.Alignment := taCenter;
  2 : reText1.Alignment := taRightJustify;
  end;  { case }
  reText1.Paragraph.Alignment := reText1.Alignment;
  reText1.Text := Data;
end;

procedure TPDLetterMaintFrm.fmElementFont1cbFontNameChange(
  Sender: TObject);
var
  aName : string;
  aFrame : TfmFontInfo;
begin
  aName := 'fmFont' + IntToStr(fmElementFont1.cbFontName.ItemIndex+1);
  aFrame := tsFonts.FindChildControl(aName) as TfmFontInfo;
  if Assigned(aFrame) then
    reText1.Font.Name := aFrame.cbFontName.Text;
end;

procedure TPDLetterMaintFrm.fmElementFont1edtFontSizeChange(
  Sender: TObject);
begin
  reText1.Font.Size := fmElementFont1.edtFontSize.Value;
end;

procedure TPDLetterMaintFrm.fmElementFont2cbFontNameChange(
  Sender: TObject);
var
  aName : string;
  aFrame : TfmFontInfo;
begin
  aName := 'fmFont' + IntToStr(fmElementFont2.cbFontName.ItemIndex+1);
  aFrame := tsFonts.FindChildControl(aName) as TfmFontInfo;
  if Assigned(aFrame) then
    reText2.Font.Name := aFrame.cbFontName.Text;
end;

procedure TPDLetterMaintFrm.fmElementFont2edtFontSizeChange(
  Sender: TObject);
begin
  reText2.Font.Size := fmElementFont2.edtFontSize.Value;
end;

procedure TPDLetterMaintFrm.FixPanels;
const
  pnlPrintOrderTop = 2;
//  gbDatabaseTop    = 219;
  gbDatabaseTop    = 283;
//  gbVariableTop    = 83;
  gbVariableTop    = 139;
begin
  if pnlPrintOrder.Visible then
  begin
    if gbVariable.Visible then
    begin
      gbVariable.Top := gbVariableTop;
      gbDataBase.Top := gbDatabaseTop;
    end
    else
      gbDataBase.Top := gbVariableTop;
  end
  else
  begin
    if gbVariable.Visible then
    begin
      gbVariable.Top := pnlPrintOrderTop;
      gbDataBase.Top := gbVariable.Top + gbVariable.Height + 2;
    end
    else
      gbDataBase.Top := pnlPrintOrderTop;
  end;
end;

procedure TPDLetterMaintFrm.BuildFontSets;
var
  i : integer;
begin
  { Before changing the letter fonts, make a list of all elements whose
    fonts match exactly the letter fonts so we can propagate the
    changes to those elements }
  FFontSet1 := [];
  FFontSet2 := [];
  with FLetter do
    for i := 0 to Pred(Elements.Count) do
    begin
      if (FontArray[Elements[i].FontNo].FontSize =
        Elements[i].FontSize) and
         (FontArray[Elements[i].FontNo].FontStyle =
        Elements[i].FontStyle) then
          FFontSet1 := FFontSet1 + [i];
      if (FontArray[Elements[i].Font2No].FontSize =
        Elements[i].Font2Size) and
         (FontArray[Elements[i].Font2No].FontStyle =
        Elements[i].Font2Style) then
          FFontSet2 := FFontSet2 + [i];
    end;
end;

procedure TPDLetterMaintFrm.PropagateFonts;
var
  i : integer;
begin
  { FFontSet1 and FFontSet2 hold any element indexes whose FontNo or
    Font2No matched the previous font settings.  If a letter font has changed
    size or style then we need to change the elements. }
  with FLetter do
    for i := 0 to Pred(Elements.Count) do
    begin
      if i in FFontSet1 then
      begin
        Elements[i].FontSize := FontArray[Elements[i].FontNo].FontSize;
        Elements[i].FontStyle := FontArray[Elements[i].FontNo].FontStyle;
      end;
      if i in FFontSet2 then
      begin
        Elements[i].Font2Size := FontArray[Elements[i].FontNo].FontSize;
        Elements[i].Font2Style := FontArray[Elements[i].FontNo].FontStyle;
      end;
    end;
end;

procedure TPDLetterMaintFrm.cbUsesTabChange(Sender: TObject);
begin
  if (cbUsesTab.text <> '') and
     (cbUsesTab.text <> '<None>') then
  begin
//    cbColumn.ItemIndex := 1;
//    cbColumn.Enabled := false;
    rgAlignment.ItemIndex := 0;
    rgAlignment.Hide;
  end
  else
  begin
    cbColumn.Enabled := true;
    rgAlignment.Show;
  end;

end;

procedure TPDLetterMaintFrm.pmnuRichTextEditorPopup(Sender: TObject);
var
  re : TRichEdit;
begin
  re := GetRichEditFromPopup;
  mnuUndo.Enabled := re.CanUndo;
  mnuCut.Enabled := re.SelText <> '';
  mnuCopy.Enabled := re.SelText <> '';
  mnuDelete.Enabled := re.SelText <> '';
  mnuPaste.Enabled := Clipboard.HasFormat(CF_TEXT) ;
end;

function TPDLetterMaintFrm.GetRichEditFromPopup: TRichEdit;
begin
  //should add some checking (if richEditContextMenu.PopupComponent is TRichEdit)
  result := TRichEdit(pmnuRichTextEditor.PopupComponent) ;
end;

procedure TPDLetterMaintFrm.mnuUnDoClick(Sender: TObject);
begin
  GetRichEditFromPopup.Undo;
end;

procedure TPDLetterMaintFrm.mnuCutClick(Sender: TObject);
begin
  GetRichEditFromPopup.CuttoClipboard;
end;

procedure TPDLetterMaintFrm.mnuCopyClick(Sender: TObject);
begin
  GetRichEditFromPopup.CopyToClipboard;

end;

procedure TPDLetterMaintFrm.mnuPasteClick(Sender: TObject);
begin
  GetRichEditFromPopup.PasteFromClipboard;
end;

procedure TPDLetterMaintFrm.mnuDeleteClick(Sender: TObject);
begin
  GetRichEditFromPopup.ClearSelection;

end;

procedure TPDLetterMaintFrm.mnuSelectAllClick(Sender: TObject);
begin
  GetRichEditFromPopup.SelectAll;
end;

end.
