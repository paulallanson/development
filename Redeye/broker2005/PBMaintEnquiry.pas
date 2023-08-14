unit PBMaintEnquiry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, CheckLst, Grids, Spin, PBEnquiryDataMod,
  Menus, DBCtrls;

type
  TPBMaintEnquiryFrm = class(TForm)
    pnlEnqHeader: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtdatePoint: TEdit;
    lblEnqNo: TLabel;
    spdbtnDatePoint: TSpeedButton;
    Label4: TLabel;
    edtDateRequired: TEdit;
    spdbtnDateReq: TSpeedButton;
    Label5: TLabel;
    pnlCustDetails: TPanel;
    Label6: TLabel;
    edtCustomer: TEdit;
    Label7: TLabel;
    spdbtnLUCust: TSpeedButton;
    spdbtnLUCustContact: TSpeedButton;
    Label8: TLabel;
    spdbtnLURep: TSpeedButton;
    StatusBar1: TStatusBar;
    pnlOkCancelBtns: TPanel;
    btbtnOK: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    edtDescription: TEdit;
    Label10: TLabel;
    edtProdType: TEdit;
    spdbtnLUProdType: TSpeedButton;
    Label12: TLabel;
    mmLineNarrative: TMemo;
    TabSheet4: TTabSheet;
    pnlPartsGrid: TPanel;
    strgrdParts: TStringGrid;
    TabSheet5: TTabSheet;
    cmbbxContactList: TComboBox;
    cmbbxOperators: TComboBox;
    cmbbxRepList: TComboBox;
    ColourComboBox: TComboBox;
    WeightComboBox: TComboBox;
    BrandComboBox: TComboBox;
    MaterialComboBox: TComboBox;
    pumPartDetails: TPopupMenu;
    Add1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    MarginDefaults1: TMenuItem;
    N2: TMenuItem;
    MaintainPapers1: TMenuItem;
    Copy1: TMenuItem;
    pumSuppCostGrid: TPopupMenu;
    AddQuantity1: TMenuItem;
    DeleteQuantity1: TMenuItem;
    AddSupplier1: TMenuItem;
    pumRunOn: TPopupMenu;
    SetRunOnQuantity1: TMenuItem;
    pnlQuestions1: TPanel;
    pnlAddDtlsMain: TPanel;
    pnlAddDtlsFooter: TPanel;
    btnAddSuppCustNotes: TBitBtn;
    pnlAddDtlsCustomer: TPanel;
    pnlAddDtlsSupp: TPanel;
    pnlAddDtlsBoth: TPanel;
    pnlCustNoteHeader: TPanel;
    Label3: TLabel;
    pnlBothNotesHeader: TPanel;
    Label17: TLabel;
    pnlSuppNotesHeader: TPanel;
    Label18: TLabel;
    sbCustNotes: TScrollBox;
    sbBothNotes: TScrollBox;
    sbSuppNotes: TScrollBox;
    pnlQuestionsHeader: TPanel;
    lblQuestions: TLabel;
    sbQuestions: TScrollBox;
    pnlPricesLower: TPanel;
    pnlPriceOptions: TPanel;
    pnlPricesGrid: TPanel;
    pnlPricesUpper: TPanel;
    pnlSupplierPricesGrid: TPanel;
    pnlRunOn: TPanel;
    pnlRunOnTitle: TPanel;
    strgrdRunOns: TStringGrid;
    pnlSupplierPrices: TPanel;
    pnlCapabilities: TPanel;
    pnlCapabilityTitle: TPanel;
    pnlCapabilitiesFooter: TPanel;
    btbtnSelectSuppliers: TBitBtn;
    chklstbxCapabilities: TCheckListBox;
    pnlCostTitle: TPanel;
    strgrdSupplierPrices: TStringGrid;
    pnlSelectedPrices: TPanel;
    pnlSelectedPricesTitle: TPanel;
    strgrdQuotePrices: TStringGrid;
    pnlSelectedRunon: TPanel;
    pnlSelectedRunonTitle: TPanel;
    strgrdQuoteRunOn: TStringGrid;
    pnlSpecTop: TPanel;
    Label48: TLabel;
    edtDepth: TEdit;
    edtDepthUnit: TEdit;
    UpDown1: TUpDown;
    defaultSizeBtn: TButton;
    UpDown2: TUpDown;
    edtWidthUnit: TEdit;
    edtWidth: TEdit;
    Label50: TLabel;
    Label11: TLabel;
    edtArt: TMemo;
    ArtworkBtn: TButton;
    Label16: TLabel;
    Label32: TLabel;
    edtFormRef: TEdit;
    FormRefButton: TButton;
    FormRefClrBitBtn: TBitBtn;
    edtFormDesc: TEdit;
    PlateChangeSpin: TSpinEdit;
    PlateChangeLbl: TLabel;
    btnSelBestPrices: TButton;
    chkbxMarkUpAll: TCheckBox;
    EnterSupplierPrices1: TMenuItem;
    btbtnAddQuantity: TBitBtn;
    cmbbxPriceUnit: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure strgrdPartsClick(Sender: TObject);
    procedure ColourComboBoxEnter(Sender: TObject);
    procedure ColourComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure ColourComboBoxClick(Sender: TObject);
    procedure WeightComboBoxClick(Sender: TObject);
    procedure BrandComboBoxClick(Sender: TObject);
    procedure MaterialComboBoxClick(Sender: TObject);
    procedure ColourComboBoxExit(Sender: TObject);
    procedure WeightComboBoxExit(Sender: TObject);
    procedure BrandComboBoxExit(Sender: TObject);
    procedure MaterialComboBoxExit(Sender: TObject);
    procedure strgrdPartsExit(Sender: TObject);
    procedure strgrdPartsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edtDepthChange(Sender: TObject);
    procedure edtDepthKeyPress(Sender: TObject; var Key: Char);
    procedure edtWidthKeyPress(Sender: TObject; var Key: Char);
    procedure edtWidthChange(Sender: TObject);
    procedure FormRefButtonClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure spdbtnLUCustClick(Sender: TObject);
    procedure cmbbxOperatorsChange(Sender: TObject);
    procedure cmbbxRepListChange(Sender: TObject);
    procedure spdbtnDateReqClick(Sender: TObject);
    procedure spdbtnLUProdTypeClick(Sender: TObject);
    procedure spdbtnDatePointClick(Sender: TObject);
    procedure mmLineNarrativeExit(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure strgrdPartsKeyPress(Sender: TObject; var Key: Char);
    procedure strgrdPartsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Delete1Click(Sender: TObject);
    procedure btbtnOKClick(Sender: TObject);
    procedure edtDateRequiredChange(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure defaultSizeBtnClick(Sender: TObject);
    procedure ArtworkBtnClick(Sender: TObject);
    procedure strgrdSupplierPricesDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure AddQuantity1Click(Sender: TObject);
    procedure strgrdQuotePricesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgrdQuotePricesExit(Sender: TObject);
    procedure strgrdQuotePricesKeyPress(Sender: TObject; var Key: Char);
    procedure strgrdQuotePricesSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure cmbbxContactListChange(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
    procedure strgrdRunOnsKeyPress(Sender: TObject; var Key: Char);
    procedure strgrdRunOnsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddSupplier1Click(Sender: TObject);
    procedure chklstbxCapabilitiesClickCheck(Sender: TObject);
    procedure strgrdSupplierPricesTopLeftChanged(Sender: TObject);
    procedure strgrdQuotePricesTopLeftChanged(Sender: TObject);
    procedure SetRunOnQuantity1Click(Sender: TObject);
    procedure DeleteQuantity1Click(Sender: TObject);
    procedure spdbtnLUCustContactClick(Sender: TObject);
    procedure spdbtnLURepClick(Sender: TObject);
    procedure btnAddSuppCustNotesClick(Sender: TObject);
    procedure strgrdQuoteRunOnKeyPress(Sender: TObject; var Key: Char);
    procedure strgrdQuoteRunOnExit(Sender: TObject);
    procedure strgrdQuoteRunOnKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure strgrdQuoteRunOnSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure strgrdSupplierPricesDblClick(Sender: TObject);
    procedure EnterSupplierPrices1Click(Sender: TObject);
    procedure strgrdSupplierPricesKeyPress(Sender: TObject; var Key: Char);
    procedure strgrdSupplierPricesSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: String);
    procedure btbtnAddQuantityClick(Sender: TObject);
    procedure cmbbxPriceUnitCloseUp(Sender: TObject);
  published
    procedure QuestionChange(Sender: TObject);
    procedure QuestionDropDown(Sender: TObject);
    procedure QuestionClick(Sender: TObject);
  private
    NextTopCust, NextTopBoth, NextTopSupp: integer;
    procedure DisplayHeaderInfo;
    procedure RefreshContactList(CustNo, BrnchNo: integer);
    procedure RefreshRepList(CustNo, BrnchNo: integer);
    procedure RefreshOfficeContactList();
    procedure DisplayLineDetails;
    procedure DisplayLineNarrative;
    procedure DisplayPartDetails;
    procedure UpdatePartDetails;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure InitialiseGrids;
    procedure DisplayPrices;
    procedure UpdateLineNarrative;
    function OKtoSave: boolean;
    procedure DisplayCapabilities;
    procedure DisplayQuestions;
    procedure FreeQuestionComponents;
    procedure DisplayNotes;
    procedure FreeNoteComponents;
    procedure EditNote(Sender: TObject);
    procedure CheckEditBoxContents(x: integer);
    procedure DisableNonEditableControls();
    procedure EnterSupplierPrices();
    procedure ApplyMarkUptoAll(markUp: double; currCol: integer);
  public
    {public declarations}
    Enquiry: TEnquiry;
  end;

var
  PBMaintEnquiryFrm: TPBMaintEnquiryFrm;

implementation

uses UITypes, FireDAC.Stan.Param, PBLUFormRef, PBLUCust, PBLUPrdTyp, PBLUStandSize, PBLUArtwrkTyp,
  PBLUCConta, PBLUCRep, DateSelV5, PBEnqQuantities, PBEnqSelSup, PBEnqNote,
  PBEnqSuppRespns;

const
  esCreated = 10;
  esPartSelectedForEst = 15;
  esSelectedForEst = 20;
  esPartSentToSupplier = 25;
  esSentToSupplier = 30;
  esSomeSupplierResponse = 35;
  esAllSuppliersResponded = 40;
  esPartPricesSet = 45;
  esAllPricesSet = 50;
  esSomeQuotationsPrinted = 65;
  esAllQuotationsPrinted = 70;
  esPartConfirmAsSalesOrder = 75;
  esAllConfirmedAsSalesOrder = 80;
  esPartPurchOrderRaised = 85;
  esAllPurchOrderRaised = 90;
  esPartCancelled = 95;
  esFullyCancelled = 100;
  esSomePurchInvRecvd = 105;
  esAllPurchInvRecvd = 110;
  esSomeSalesInvRecvd = 115;
  esAllPurchInvRevcd = 120;
  esMarkedInactive = 200;

{$R *.DFM}

{ TForm1 }

procedure TPBMaintEnquiryFrm.DisplayHeaderInfo;
var
  x: integer;
begin
  if Enquiry.EnquiryNo <> 0 then
    lblEnqNo.Caption := IntToStr(Enquiry.EnquiryNo) + ' / ' + IntToStr(Enquiry.Line.LineNo)
  else
    lblEnqNo.Caption := 'New Enquiry';

  edtCustomer.Text := Enquiry.Customer.CustName;

  if Enquiry.CustomerBranch.BranchName <> '' then
     edtCustomer.Text := edtCustomer.Text + '/' + Enquiry.CustomerBranch.BranchName;
     
  edtCustomer.Hint := 'Customer Credit Limit: £' + CurrToStr(Enquiry.Customer.CreditLimit)
     +#13#10+ 'Available Credit: £' + CurrToStr(Enquiry.Customer.AvailableCredit) +#13#10;
  for x := 0 to pred(Enquiry.CustomerBranch.BranchAddr.Count) do
  begin
    if x <> pred(Enquiry.CustomerBranch.BranchAddr.Count) then
      edtCustomer.Hint := edtCustomer.Hint + Enquiry.CustomerBranch.BranchAddr[x] + #13#10
    else
      edtCustomer.Hint := edtCustomer.Hint + Enquiry.CustomerBranch.BranchAddr[x];
  end;
  RefreshContactList(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);

  if cmbbxContactList.Items.IndexOf(Enquiry.Contact.Name) <> -1 then
    cmbbxContactList.ItemIndex := cmbbxContactList.Items.IndexOf(Enquiry.Contact.Name)
  else if cmbbxContactList.Items.Count > 0 then
    cmbbxContactList.ItemIndex := 0
  else
    cmbbxContactList.ItemIndex := -1;

  edtdatePoint.Text := DateToStr(Enquiry.DatePoint);

  if Enquiry.QuoteReqBy <> 0 then
    edtDateRequired.Text := DateToStr(Enquiry.QuoteReqBy)
  else
    edtDateRequired.Text := '';
    
  RefreshRepList(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);
  if Enquiry.Rep.Name = '' then
  begin
    //no rep selected, check number of reps, if only one go with it
    //if more than one leave the user to decide which rep
    if cmbbxRepList.Items.Count > 1 then
      cmbbxRepList.ItemIndex := -1
    else
      cmbbxRepList.ItemIndex := 0;
  end
  else
  begin
    //display the rep in the cmbbx
    cmbbxRepList.ItemIndex := cmbbxRepList.Items.IndexOf(Enquiry.Rep.Name);
  end;
    
  RefreshOfficeContactList();
  cmbbxOperators.ItemIndex := cmbbxOperators.Items.IndexOf(Enquiry.OfficeContact.Name);
end;

procedure TPBMaintEnquiryFrm.DisplayLineDetails;
begin
  with Enquiry.Line do
  begin
    edtDescription.Text := FormDescription;
    edtProdType.text := ProductType.Description;
    edtDepth.Text := FloatToStr(Depth);
    edtDepthUnit.Text := DepthUnit;
    edtWidth.Text := FloatToStr(Width);
    edtWidthUnit.Text := WidthUnit;
    edtArt.Text := ArtWorkInstructions;
    edtFormRef.Text := FormReference.ID;
    edtFormDesc.Text := FormReference.Description;
    PlateChangeSpin.Value := NoOfPlates;
    DisplayLineNarrative;
  end;
end;

procedure TPBMaintEnquiryFrm.RefreshContactList(CustNo, BrnchNo: integer);
begin
  with PBEnqDM.GetCustContSQL do
  begin
    Close;
    ParamByName('Customer').asInteger := CustNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    Open;

    cmbbxContactList.Clear;
    while not EOF do
    begin
      cmbbxContactList.Items.Add(FieldByName('Name').asString);
      next;
    end;
    Close;
  end
end;

procedure TPBMaintEnquiryFrm.RefreshOfficeContactList;
begin
  with PBEnqDM.qrySelOperators do
  begin
    Close;
    Open;
    First;
    cmbbxOperators.Clear;
    while (not EOF) do
    begin
      cmbbxOperators.Items.Add(FieldByName('Name').AsString);
      Next;
    end;
    Close;
  end;
end;

procedure TPBMaintEnquiryFrm.RefreshRepList(CustNo, BrnchNo: integer);
begin
  with PBEnqDM.GetCustRepSQL do
  begin
    Close;
    ParamByName('Customer').asInteger := CustNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    Open;

    cmbbxRepList.Clear;
    while not EOF do
    begin
      cmbbxRepList.Items.Add(FieldByName('Name').asString);
      next;
    end;
    Close;
  end
end;

procedure TPBMaintEnquiryFrm.FormShow(Sender: TObject);
var
  inx: integer;
begin
  DisplayHeaderInfo;
  DisplayLineDetails;
  DisplayPartDetails;
  InitialiseGrids;
  DisplayPrices;
  DisplayCapabilities;
  DisplayQuestions;
  DisplayNotes;
  //now the information is displayed certain controls will have to be disabled
  //depending on the status of the enquiry.
  DisableNonEditableControls;

  //the displaying of the details triggers the onchange event handlers of the
  //various display fields, each of which set modified to true for the various elements
  //of the enquiry, so have to reset the modified to false for each of them or else
  //the enquiry will try to save even if the user doesn't make any changes.
  Enquiry.Modified := False;
  Enquiry.Line.Modified := False;
  Enquiry.Line.Narrative.Updated := False;

  for inx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    Enquiry.Line.Quantities[inx].Modified := False;
  end;

  for inx := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
  begin
    Enquiry.Line.QuotingSuppliers[inx].SupplierResponse.Modified := False;
  end;

  for inx := 0 to (Enquiry.Line.ProductType.NoOfQuestions - 1) do
  begin
    Enquiry.Line.ProductType.Questions[inx].Modified := False;
  end;

  for inx := 0 to (Enquiry.Line.NoOfNotes - 1) do
  begin
    Enquiry.Line.AdditionalDetails[inx].Modified := false;
  end;

  Enquiry.DetailsModified := False;
  PageControl1.ActivePageIndex := 0;
  btbtnOK.Enabled := OKtoSave();
  edtDescription.SetFocus;
end;

procedure TPBMaintEnquiryFrm.DisplayPartDetails;
var
  x: integer;
begin

  with strgrdParts do
  begin
    cells[0,0] := 'Part';
    cells[1,0] := 'Heading';
    cells[2,0] := 'Colour';
    cells[3,0] := 'Weight';
    cells[4,0] := 'Brand';
    cells[5,0] := 'Material';
    cells[6,0] := 'Inks/Face';
    cells[7,0] := 'Inks/Reverse';
    cells[8,0] := 'Left Perf Type';
    cells[9,0] := 'Right Perf Type';
    cells[10,0] := 'Left Perf Width';
    cells[11,0] := 'Right Perf Width';

    if Enquiry.Line.GetNoOfParts > 0 then
    begin
      RowCount := Enquiry.Line.GetNoOfParts + 1;
      Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goEditing]
    end
    else
    begin
      RowCount := 2;
      Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect];
    end;
      
    FixedRows := 1;

    for x := 0 to (Enquiry.Line.GetNoOfParts - 1) do
    begin
      cells[0, x+1] := Enquiry.Line.Parts[x].Description;
      cells[1, x+1] := Enquiry.Line.Parts[x].Heading;
      cells[2, x+1] := Enquiry.Line.Parts[x].PaperColour;
      cells[3, x+1] := Enquiry.Line.Parts[x].PaperWeight;
      cells[4, x+1] := Enquiry.Line.Parts[x].PaperBrand;
      cells[5, x+1] := Enquiry.Line.Parts[x].PaperMaterial;
      cells[6, x+1] := Enquiry.Line.Parts[x].FaceInks;
      cells[7, x+1] := Enquiry.Line.Parts[x].ReverseInks;
      cells[8, x+1] := Enquiry.Line.Parts[x].LeftMarginType;
      cells[9, x+1] := Enquiry.Line.Parts[x].RightMarginType;
      cells[10, x+1] := Enquiry.Line.Parts[x].LeftMarginWidth;
      cells[11, x+1] := Enquiry.Line.Parts[x].RightMarginWidth;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdPartsClick(Sender: TObject);
begin
  if Enquiry.Line.GetNoOfParts = 0 then
  begin
    Add1Click(strgrdParts);
  end;

  if Enquiry.Line.GetNoOfParts > 0 then
  begin
    with strgrdParts do
    begin
      ColourComboBox.sendtoback;
      ColourComboBox.Visible := False;
      WeightComboBox.sendtoback;
      WeightComboBox.Visible := False;
      BrandComboBox.sendtoback;
      BrandComboBox.Visible := False;
      MaterialComboBox.sendtoback;
      MaterialComboBox.Visible := False;

      if Col = 2 then
      begin
        ColourComboBox.Top := celltop(strgrdParts, Row);
        ColourComboBox.Left := cellleft(strgrdParts, Col) + colwidths[2] - ColourComboBox.width;

        ColourComboBox.bringtofront;
        ColourComboBox.Visible := True;
        ColourComboBox.SetFocus;
      end
      else if Col = 3 then
      begin
        WeightComboBox.Top := celltop(strgrdParts, Row);
        WeightComboBox.Left := cellleft(strgrdParts, Col) + colwidths[3] - WeightComboBox.width;

        WeightComboBox.bringtofront;
        WeightComboBox.Visible := True;
        WeightComboBox.SetFocus;
      end
      else if Col = 4 then
      begin
        BrandComboBox.Top := celltop(strgrdParts, Row);
        BrandComboBox.Left := cellleft(strgrdParts, Col) + colwidths[4] - BrandComboBox.width;

        BrandComboBox.bringtofront;
        BrandComboBox.Visible := True;
        BrandComboBox.SetFocus;
      end
      else if Col = 5 then
      begin
        MaterialComboBox.Top := celltop(strgrdParts, Row);
        MaterialComboBox.Left := cellleft(strgrdParts, Col) + colwidths[5] - MaterialComboBox.width;

        MaterialComboBox.bringtofront;
        MaterialComboBox.Visible := True;
        MaterialComboBox.SetFocus;
      end;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.ColourComboBoxEnter(Sender: TObject);
var
  stext: string;
begin
  {In order to make this function generic for all the Paper details, the
  relevant table name is stored in the Hint property of the component.}
  PBEnqDM.qryPaperDtls.SQL.clear;
  PBEnqDM.qryPaperDtls.SQL.Add('Select * from ');
  PBEnqDM.qryPaperDtls.SQL.Add((Sender as TComboBox).hint);
  PBEnqDM.qryPaperDtls.SQL.Add('Order by');
  PBEnqDM.qryPaperDtls.SQL.Add((Sender as TComboBox).hint + '_Description');
  PBEnqDM.qryPaperDtls.close;
  PBEnqDM.qryPaperDtls.open;

  stext := strgrdParts.Cells[strgrdParts.col, strgrdParts.Row];

  (Sender as TComboBox).Clear;

  PBEnqDM.qryPaperDtls.First;

  while (not PBEnqDM.qryPaperDtls.EOF) do
  begin
    (Sender as TComboBox).Items.Add(PBEnqDM.qryPaperDtls.Fields[1].AsString);
    PBEnqDM.qryPaperDtls.Next;
  end;

  (Sender as TComboBox).text := '';
  (Sender as TComboBox).Itemindex := (Sender as TComboBox).Items.IndexOf(stext);

  if (Sender as TComboBox).Itemindex = -1 then (Sender as TComboBox).Text := stext;
end;

procedure TPBMaintEnquiryFrm.ColourComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is Tcombobox) then
    begin
      with strgrdParts do
      begin
        strgrdParts.SetFocus;
        strgrdParts.Col := strgrdParts.Col + 1;
        exit;
      end;
    end;
end;

procedure TPBMaintEnquiryFrm.ColourComboBoxClick(Sender: TObject);
begin
  strgrdParts.Cells[2, strgrdParts.Row] := ColourComboBox.text;
end;

procedure TPBMaintEnquiryFrm.WeightComboBoxClick(Sender: TObject);
begin
  strgrdParts.Cells[3, strgrdParts.Row] := WeightComboBox.text;
end;

procedure TPBMaintEnquiryFrm.BrandComboBoxClick(Sender: TObject);
begin
  strgrdParts.Cells[4, strgrdParts.Row] := BrandComboBox.text;
end;

procedure TPBMaintEnquiryFrm.MaterialComboBoxClick(Sender: TObject);
begin
  strgrdParts.Cells[5, strgrdParts.Row] := MaterialComboBox.text;
end;

procedure TPBMaintEnquiryFrm.ColourComboBoxExit(Sender: TObject);
begin
  UpdatePartDetails;
  ColourComboBox.Visible := False;
  WeightComboBox.Visible := False;
  BrandComboBox.Visible := False;
  MaterialComboBox.Visible := False;
  ColourComboBoxClick(self);
end;

procedure TPBMaintEnquiryFrm.WeightComboBoxExit(Sender: TObject);
begin
  UpdatePartDetails;
  WeightComboBox.Visible := False;
  WeightComboBoxClick(self);
end;

procedure TPBMaintEnquiryFrm.BrandComboBoxExit(Sender: TObject);
begin
  UpdatePartDetails;
  BrandComboBox.Visible := False;
  BrandComboBoxClick(self);
end;

procedure TPBMaintEnquiryFrm.MaterialComboBoxExit(Sender: TObject);
begin
  UpdatePartDetails;
  MaterialComboBox.Visible := False;
  MaterialComboBoxClick(self);
end;

procedure TPBMaintEnquiryFrm.UpdatePartDetails;
var
  x: integer;
begin  
  for x := 0 to (strgrdParts.RowCount - 2) do
  begin
    with strgrdParts do
    begin
      Enquiry.Line.Parts[x].Description := cells[0, x+1];
      Enquiry.Line.Parts[x].Heading := cells[1, x+1];
      Enquiry.Line.Parts[x].PaperColour := cells[2, x+1];
      Enquiry.Line.Parts[x].PaperWeight := cells[3, x+1];
      Enquiry.Line.Parts[x].PaperBrand := cells[4, x+1];
      Enquiry.Line.Parts[x].PaperMaterial := cells[5, x+1];
      Enquiry.Line.Parts[x].FaceInks := cells[6, x+1];
      Enquiry.Line.Parts[x].ReverseInks := cells[7, x+1];
      Enquiry.Line.Parts[x].LeftMarginType := cells[8, x+1];
      Enquiry.Line.Parts[x].RightMarginType := cells[9, x+1];
      Enquiry.Line.Parts[x].LeftMarginWidth := cells[10, x+1];
      Enquiry.Line.Parts[x].RightMarginWidth := cells[11, x+1];
    end;
  end;

  Enquiry.DetailsModified := true;
  Enquiry.Line.Modified := true;
end;

function TPBMaintEnquiryFrm.cellleft(grid: TStringGrid;
  Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TPBMaintEnquiryFrm.celltop(grid: TStringGrid;
  Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t;
end;

procedure TPBMaintEnquiryFrm.strgrdPartsExit(Sender: TObject);
begin
  UpdatePartDetails;
end;

procedure TPBMaintEnquiryFrm.strgrdPartsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {Code extracted from the Delphi Info base No 609}
  if Sender = ActiveControl then Exit;
  if not (gdSelected in State) then Exit;
  with Sender as TStringGrid do
  begin
    Canvas.Brush.Color := Color;
    Canvas.Font.Color := Font.Color;
    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
      Cells[Col, Row]);
  end;

  ColourComboBox.width := strgrdParts.colwidths[2];
  WeightComboBox.width := strgrdParts.colwidths[3];
  BrandComboBox.width := strgrdParts.colwidths[4];
  MaterialComboBox.width := strgrdParts.colwidths[5];
end;

procedure TPBMaintEnquiryFrm.edtDepthChange(Sender: TObject);
begin
  Enquiry.Line.Depth := StrToFloatDef(edtDepth.Text, 0, FormatSettings);
  Enquiry.DetailsModified := true;
  Enquiry.Line.modified := true;
end;

procedure TPBMaintEnquiryFrm.edtDepthKeyPress(Sender: TObject;
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

procedure TPBMaintEnquiryFrm.edtWidthKeyPress(Sender: TObject;
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

procedure TPBMaintEnquiryFrm.edtWidthChange(Sender: TObject);
begin
  Enquiry.Line.Width := StrToFloatDef(edtWidth.Text, 0, FormatSettings);
  Enquiry.DetailsModified := true;
  Enquiry.Line.modified := true;
end;

procedure TPBMaintEnquiryFrm.FormRefButtonClick(Sender: TObject);
begin
  if Enquiry.ReadOnly then
    Exit;
  PBLUFormRefFrm := TPBLUFormRefFrm.Create(Self);
  try
    PBLUFormRefFrm.bIs_Lookup := True;
    PBLUFormRefFrm.bAllow_Upd := True;
    PBLUFormRefFrm.iCust := Enquiry.Customer.CustomerNo;
    PBLUFormRefFrm.sCustName := Enquiry.Customer.CustName;
    PBLUFormRefFrm.iBranch := Enquiry.CustomerBranch.BranchNo;
    PBLUFormRefFrm.sBranchName := Enquiry.CustomerBranch.BranchName;
    PBLUFormRefFrm.SelCode := Enquiry.Line.FormReference.RefNo;
    PBLUFormRefFrm.ShowModal;
    if PBLUFormRefFrm.bSelected then
    begin
      Enquiry.Line.FormReference.RefNo := PBLUFormRefFrm.SelCode;
      Enquiry.Line.FormReference.ID := PBLUFormRefFrm.SelName;
      Enquiry.Line.FormReference.Description := PBLUFormRefFrm.SelDescr;

      Enquiry.DetailsModified := true;
      Enquiry.Line.Modified := true;
    end;
  finally
    PBLUFormRefFrm.Free;
  end;

  edtFormRef.Text := Enquiry.Line.FormReference.ID;
  edtFormDesc.Text := Enquiry.Line.FormReference.Description;
  Enquiry.Line.modified := true;
end;

procedure TPBMaintEnquiryFrm.edtDescriptionChange(Sender: TObject);
begin
  Enquiry.Line.FormDescription := edtDescription.Text;
  Enquiry.DetailsModified := true;
  Enquiry.Line.Modified := true;
  btbtnOK.Enabled := OKtoSave;
end;

procedure TPBMaintEnquiryFrm.spdbtnLUCustClick(Sender: TObject);
begin
  if Enquiry.ReadOnly then
    Exit;
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := Enquiry.Customer.CustomerNo;
    PBLUCustFrm.SelBranch := Enquiry.CustomerBranch.BranchNo;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      if (Enquiry.Customer.CustomerNo <> PBLUCustFrm.SelCode)
        or (Enquiry.CustomerBranch.BranchNo <> PBLUCustFrm.SelBranch) then
      begin 
        Enquiry.Customer.CustomerNo := PBLUCustFrm.SelCode;
        Enquiry.Customer.Load;

        Enquiry.CustomerBranch.BranchNo := PBLUCustFrm.SelBranch;
        Enquiry.CustomerBranch.Load(Enquiry.Customer.CustomerNo);

        {The form reference will be invalid for another customer}
        Enquiry.Line.FormReference.Clear;
        {And so will the REP}
        Enquiry.Rep.RepNo := PBEnqDM.GetDefCustRep(Enquiry.Customer.CustomerNo,
          Enquiry.CustomerBranch.BranchNo);
        Enquiry.Rep.Load;
      end;

      {Will the contact change}
      //ContactComboDropDown(self);

      //if PBEnqDM.IsCustomerOnStop(Enquiry.Customer.CustomerNo) then
      //  MessageDlg('This Customer is currently ON STOP', mtWarning,[mbOk], 0);
      Enquiry.DetailsModified := true;
      Enquiry.Modified := true;
      DisplayHeaderInfo;
      DisplayLineDetails;
      btbtnOK.Enabled := OKtoSave;
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBMaintEnquiryFrm.cmbbxOperatorsChange(Sender: TObject);
begin
  Enquiry.OfficeContact.Name := cmbbxOperators.Items[cmbbxOperators.ItemIndex];
  //we have the operators name but the item index may not be the operator no
  //so query database to find the operator no based on the operator name.
  Enquiry.OfficeContact.GetOpNoByName;
  Enquiry.DetailsModified := true;
  Enquiry.Modified := true;
end;

procedure TPBMaintEnquiryFrm.cmbbxRepListChange(Sender: TObject);
begin
  Enquiry.Rep.Name := cmbbxRepList.Items[cmbbxRepList.ItemIndex];
  //we have the reps name but the item index may not be the rep no
  //so query database to find the rep no based on the rep name.
  Enquiry.Rep.GetRepNoByName;
  Enquiry.DetailsModified := true;
  Enquiry.Modified := true;
end;

procedure TPBMaintEnquiryFrm.spdbtnDateReqClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDateRequired.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      edtDateRequired.Text := DateToStr(DateSelV5Form.Date);
      Enquiry.QuoteReqBy := DateSelV5Form.Date;
      Enquiry.DetailsModified := true;
      Enquiry.Modified := true;
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintEnquiryFrm.spdbtnLUProdTypeClick(Sender: TObject);
begin
  PBLUPrdTypFrm := TPBLUPrdTypFrm.Create(Self);
  try
    PBLUPrdTypFrm.bIs_Lookup := True;
    PBLUPrdTypFrm.bAllow_Upd := True;
    PBLUPrdTypFrm.SelCode := Enquiry.Line.ProductType.TypeNo;
    PBLUPrdTypFrm.ShowModal;
    if PBLUPrdTypFrm.Selected then
    begin
      Enquiry.Line.ProductType.TypeNo := PBLUPrdTypFrm.SelCode;
      Enquiry.Line.ProductType.Load(Enquiry.EnquiryNo, Enquiry.Line.LineNo);
      edtProdType.Text := Enquiry.Line.ProductType.Description;
      try
        Enquiry.Line.ProductType.Capabilities[0].Selected := true;
      except
        MessageDlg('No default capability set up for Prodcut Type: ' +
          Enquiry.Line.ProductType.Description + '.', mtWarning, [mbOK], 0);
      end;

      Enquiry.DetailsModified := True;
      Enquiry.Line.Modified := True;

      Self.FreeQuestionComponents;
      Self.DisplayQuestions;

      Self.DisplayCapabilities;
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  btbtnOK.Enabled := OKtoSave;
end;

procedure TPBMaintEnquiryFrm.DisplayPrices;
var
  x, y: integer;
  thisPrice: double;
  bestPrice: double;
begin
  if (Enquiry.Line.NoOfQuantities < 1) and (Enquiry.Line.NoOfQuotingSuppliers < 1) then
    exit;

  InitialiseGrids;
  for x := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    if Enquiry.Line.Quantities[x].Deleted then
    begin
      strgrdSupplierPrices.ColWidths[x+1] := -1;
      strgrdQuotePrices.ColWidths[x+1] := -1;
    end;
    strgrdSupplierPrices.Cells[x+1, 0] :=
      FloatToStr(Enquiry.Line.Quantities[x].Quantity);
  end;

  with strgrdSupplierPrices do
  begin
    for y := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
    begin
      if Enquiry.Line.QuotingSuppliers[y].SupplierResponse.Deleted then
        RowHeights[y+1] := 0;
      Cells[0, y+1] := Enquiry.Line.QuotingSuppliers[y].Name;
    end;      

    for x := 0 to (Enquiry.Line.NoOfQuantities - 1) do
    begin
      Enquiry.Line.Quantities[x].LowestPriceIndex := 0;
      for y := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
      begin
        if Enquiry.Line.PriceGrid[x, y].SupplierPrice <> 0.00 then
        begin
          Cells[x+1, y+1] := '£' + FloatToStrF(Enquiry.Line.PriceGrid[x, y].SupplierPrice, ffFixed, 15, 2);

          //this bit calculates the total price for the job in order to work out
          //which price is best
          if Enquiry.Line.PriceGrid[x, Enquiry.Line.Quantities[x].LowestPriceIndex].PriceUnitFactor <> 0.00 then
          begin
            //if theprice unit factor is not zero then work out the price using the price unit factor
            bestPrice := (Enquiry.Line.Quantities[x].Quantity)/
                         (Enquiry.Line.PriceGrid[x, Enquiry.Line.Quantities[x].LowestPriceIndex].PriceUnitFactor)*
                         (Enquiry.Line.PriceGrid[x, Enquiry.Line.Quantities[x].LowestPriceIndex].SupplierPrice);
          end
          else
          begin
            //if the price unit factor is zero then the quote price is for the whole job
            bestPrice := Enquiry.Line.PriceGrid[x, Enquiry.Line.Quantities[x].LowestPriceIndex].SupplierPrice;
          end;

          if Enquiry.Line.PriceGrid[x, y].PriceUnitFactor <> 0.00 then
          begin
            //if theprice unit factor is not zero then work out the price using the price unit factor
            thisPrice := (Enquiry.Line.Quantities[x].Quantity)/
                         (Enquiry.Line.PriceGrid[x, y].PriceUnitFactor)*
                         (Enquiry.Line.PriceGrid[x, y].SupplierPrice);
          end
          else
          begin
            //if the price unit factor is zero then the quote price is for the whole job
            thisPrice := Enquiry.Line.PriceGrid[x, y].SupplierPrice;
          end;

          if (thisPrice < bestPrice) then
            Enquiry.Line.Quantities[x].LowestPriceIndex := y;
        end
        else
        begin
          Cells[x+1, y+1] := '';
        end;
      end;
    end;
  end;

  with strgrdQuotePrices do
  begin
    Cells[0, 0] := 'Cost Price';
    Cells[0, 1] := 'Sell Price';
    Cells[0, 2] := 'Markup %';
    Cells[0, 3] := 'Markup';
    Cells[0, 4] := 'Price Unit';

    for x := 0 to (Enquiry.Line.NoOfQuantities - 1) do
    begin
      if Enquiry.Line.Quantities[x].SupplierPrice <> 0 then
        Cells[x+1, 0] := FloatToStrF(Enquiry.Line.Quantities[x].SupplierPrice, ffFixed, 15, 2)
      else
        Cells[x+1, 0] := '';

      if Enquiry.Line.Quantities[x].QuotePrice <> 0.00 then
        Cells[x+1, 1] := FloatToStrF(Enquiry.Line.Quantities[x].QuotePrice, ffFixed, 15, 2)
      else
        Cells[x+1, 1] := '';

      if Enquiry.Line.Quantities[x].SupplierPrice <> 0 then
        Cells[x+1, 2] := FloatToStrF((((Enquiry.Line.Quantities[x].QuotePrice - Enquiry.Line.Quantities[x].SupplierPrice)*100) / Enquiry.Line.Quantities[x].SupplierPrice),  ffFixed, 15, 2)
      else
        Cells[x+1, 2] := '';

      if Enquiry.Line.Quantities[x].QuotePrice <> 0.00 then
        Cells[x+1, 3] := FloatToStrF((Enquiry.Line.Quantities[x].QuotePrice - Enquiry.Line.Quantities[x].SupplierPrice), ffFixed, 15, 2)
      else
        Cells[x+1, 3] := '';

      Cells[x+1, 4] := Enquiry.Line.Quantities[x].PriceUnit.Description;
    end;
  end;


  if Enquiry.Line.NoOfActualQuantities > 1 then
  begin
    pnlRunOn.Width := -1;
    pnlSelectedRunon.Width := -1;
  end
  else
  begin
    pnlRunOn.Width := 119;
    pnlSelectedRunon.Width := 119;
    with strgrdRunOns do
    begin
      if Enquiry.Line.NoOfQuotingSuppliers > 0 then
        Cells[0, 0] := FloatToStr(Enquiry.Line.QuotingSuppliers[0].SupplierResponse.RunOnQuantity);
      for x := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
      begin
        if Enquiry.Line.QuotingSuppliers[x].SupplierResponse.RunOnQuantity = -1 then
        Cells[0, x+1] := 'N/A'
      else
        Cells[0, x+1] := '£' + FloatToStrF(Enquiry.Line.QuotingSuppliers[x].SupplierResponse.RunOnPrice, ffFixed, 15, 2);
      end;
    end;

    with strgrdQuoteRunOn do
    begin
      if Enquiry.Line.RunOnCost <> 0.00 then
      begin
        Cells[0,0] := FloatToStrF(Enquiry.Line.RunOnCost, ffFixed, 15, 2);
        Cells[0,2] := FloatToStrF(((Enquiry.Line.RunOnPrice - Enquiry.Line.RunOnCost) * 100)/ Enquiry.Line.RunOnCost, ffFixed, 15, 2);
        Cells[0,3] := FloatToStrF(Enquiry.Line.RunOnPrice - Enquiry.Line.RunOnCost, ffFixed, 15,2);
      end;
      if Enquiry.Line.RunOnPrice <> 0.00 then
        Cells[0,1] := FloatToStrF(Enquiry.Line.RunOnPrice, ffFixed, 15, 2);
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.spdbtnDatePointClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := Enquiry.DatePoint;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      Enquiry.DatePoint := DateSelV5Form.Date;
      edtdatePoint.Text := DateToStr(Enquiry.DatePoint);
      Enquiry.DetailsModified := true;
      Enquiry.Modified := true;
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintEnquiryFrm.DisplayLineNarrative;
var
  x: integer;
begin
  mmLineNarrative.Text := Enquiry.Line.Narrative.DataInfo;
  (*
  with mmLineNarrative.Lines do
  begin
    Clear;
    for x := 0 to (Enquiry.Line.Narrative.Lines.Count - 1) do
    begin
      Add(Enquiry.Line.Narrative.Lines[x]);
    end;
  end;  *)
end;

procedure TPBMaintEnquiryFrm.mmLineNarrativeExit(Sender: TObject);
begin
  UpdateLineNarrative;
end;

procedure TPBMaintEnquiryFrm.UpdateLineNarrative;
var
  empty: boolean;
  x: integer;
  tempStr: String;
begin
  empty := true;
  Enquiry.Line.Narrative.DataInfo := mmLineNarrative.Text;
  (*
  Enquiry.Line.Narrative.Lines.Clear;
  for x := 0 to (mmLineNarrative.Lines.Count - 1) do
  begin
    tempStr := mmLineNarrative.Lines[x];
    if tempStr <> '' then
      empty := false;

    if Length(tempStr) > 100 then
    begin
      while Length(tempStr) > 100 do
      begin
        Enquiry.Line.Narrative.Lines.Add(Copy(tempStr,1,100));
        Delete(tempStr,1,100);
      end;
    end
    else
    begin
        Enquiry.Line.Narrative.Lines.Add(tempStr);
    end;
  end;

  if empty = true then
  begin
    Enquiry.Line.Narrative.Deleted := true;
  end;       *)
  Enquiry.DetailsModified := True;
  Enquiry.Line.Narrative.Updated := True;
end;

procedure TPBMaintEnquiryFrm.Add1Click(Sender: TObject);
begin
  Enquiry.Line.NewPart;
  Enquiry.Line.modified := true;
  DisplayPartDetails;
  strgrdParts.Col := 0;
  strgrdParts.Row := Enquiry.Line.GetNoOfParts;
  strgrdParts.SetFocus;
end;

procedure TPBMaintEnquiryFrm.strgrdPartsKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    vk_return:
    begin
      if strgrdParts.Col = 11 then
        strgrdParts.Col := 0
      else
        strgrdParts.Col :=  strgrdParts.Col + 1;
      key := #0;
    end;
  else

  end;
end;

procedure TPBMaintEnquiryFrm.strgrdPartsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Ord(key) of
    vk_tab:
    begin
      if strgrdParts.Col = 11 then
        strgrdParts.Col := 0
      else
        strgrdParts.Col :=  strgrdParts.Col + 1;
      key := 0;
    end;
  else

  end;
end;

procedure TPBMaintEnquiryFrm.Delete1Click(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to delete this part: '''
        + strgrdParts.cells[0, strgrdParts.Row] + '''', mtConfirmation, mbOKCancel, 0) =  mrOK then
  begin
    Enquiry.Line.RemovePart(strgrdParts.Row - 1);
    Self.DisplayPartDetails;
  end;
end;

procedure TPBMaintEnquiryFrm.btbtnOKClick(Sender: TObject);
var
  saveResult: boolean;
  savePrompt: word;
begin
  //check that required fields have been entered
  if Enquiry.Customer.CustomerNo = 0 then
  begin
    MessageDlg('You must select a customer before saving.', mtWarning, [mbOK], 0);
    Self.ModalResult := mrCancel;
    exit;
  end;


  if Enquiry.DetailsModified then
  begin
    //prompt for save effort
    savePrompt := MessageDlg('The details have changed, Do you want to save the enquiry?',
        mtConfirmation, [mbYes,mbNo,mbCancel], 0);
    if savePrompt = mrYes then
    begin
      saveResult := Enquiry.Save;
      if saveResult = false then
        exit
      else
        Self.ModalResult := mrYes;
    end
    else if SavePrompt = mrNo then
    begin
      Self.ModalResult := mrNo;
    end
    else if SavePrompt = mrCancel then
    begin
      exit;
    end;
  end
  else
  begin
    Self.ModalResult := mrOK;
  end;
end;

procedure TPBMaintEnquiryFrm.edtDateRequiredChange(Sender: TObject);
begin
  if edtDateRequired.Text <> '' then
  begin
    try
      Enquiry.QuoteReqBy := StrToDate(edtDateRequired.Text);
    except
      MessageDlg('Not a valid date.', mtWarning, [mbOK], 0);
      Enquiry.QuoteReqBy := 0;
    end;
  end
  else
  begin
    Enquiry.QuoteReqBy := 0;
  end;
end;

procedure TPBMaintEnquiryFrm.Copy1Click(Sender: TObject);
begin
  Enquiry.Line.CopyPart(strgrdParts.Row - 1);
  DisplayPartDetails;
  strgrdParts.Col := 0;
  strgrdParts.Row := Enquiry.Line.GetNoOfParts;
  strgrdParts.SetFocus;
end;

function TPBMaintEnquiryFrm.OKtoSave: boolean;
begin
  //check for default/required values
  //if all are set then okay to save.
  Result := true;
  if Enquiry.Customer.CustomerNo = 0 then
  begin
    Result := false;
    exit;
  end;

  if Enquiry.Line.FormDescription = '' then
  begin
    Result := false;
    exit;
  end;

  if Enquiry.Line.ProductType.TypeNo = 0 then
  begin
    Result := false;
    exit;
  end;
end;

procedure TPBMaintEnquiryFrm.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if edtDepthUnit.Text = 'mm' then
  begin
    edtDepthUnit.Text := 'inch';
    edtDepth.Text := FloatToStr(StrToFloatDef(edtDepth.Text, 0, FormatSettings) / 25.4);
  end
  else
  begin
    edtDepthUnit.Text := 'mm';
    edtDepth.Text := FloatToStr(StrToFloatDef(edtDepth.Text, 0, FormatSettings) * 25.4);
  end;
end;

procedure TPBMaintEnquiryFrm.UpDown2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if edtWidthUnit.Text = 'mm' then
  begin
    edtWidthUnit.Text := 'inch';
    edtWidth.Text := FloatToStr(StrToFloatDef(edtWidth.Text, 0, FormatSettings) / 25.4);
  end
  else
  begin
    edtWidthUnit.Text := 'mm';
    edtWidth.Text := FloatToStr(StrToFloatDef(edtWidth.Text, 0, FormatSettings) * 25.4);
  end;
end;

procedure TPBMaintEnquiryFrm.defaultSizeBtnClick(Sender: TObject);
begin
  PBLUStandSizeFrm := TPBLUStandSizeFrm.Create(Self);
  try
    PBLUStandSizeFrm.bIs_Lookup := true;
    PBLUStandSizeFrm.bAllow_Upd := True;
    PBLUStandSizeFrm.ShowModal;
    if PBLUStandSizeFrm.selected then
      begin
        edtDepth.Text := inttostr(PBLUStandSizeFrm.SelDepth);
        Enquiry.Line.Depth := PBLUStandSizeFrm.SelDepth;
        edtDepthUnit.Text := 'mm';
        Enquiry.Line.DepthUnit := 'mm';

        edtWidth.Text := inttostr(PBLUStandSizeFrm.SelWidth);
        Enquiry.Line.Width := PBLUStandSizeFrm.SelWidth;
        edtWidthUnit.Text := 'mm';
        Enquiry.Line.WidthUnit := 'mm';

        Enquiry.DetailsModified := true;
        Enquiry.Line.Modified := true;
      end;
  finally
    PBLUStandSizeFrm.Free;
  end;
end;

procedure TPBMaintEnquiryFrm.ArtworkBtnClick(Sender: TObject);
begin
  PBLUArtwrkTypfrm := TPBLUArtwrkTypfrm.Create(Owner);
  try
    PBLUArtwrkTypfrm.bIs_Lookup := True;
    PBLUArtwrkTypfrm.bAllow_Upd := True;

    PBLUArtwrkTypfrm.ShowModal;
    if PBLUArtwrkTypfrm.selected then
    begin
      Enquiry.Line.ArtworkInstructions := PBLUArtwrkTypfrm.Selname;
      edtArt.text := PBLUArtwrkTypfrm.Selname;

      Enquiry.DetailsModified := true;
      Enquiry.Line.Modified := true;
    end;
  finally
    PBLUArtwrkTypfrm.free;
  end;
end;

procedure TPBMaintEnquiryFrm.InitialiseGrids;
var
  x, y: integer;
begin
  with strgrdSupplierPrices do
  begin
    for x := 0 to (ColCount - 1) do
    begin
      for y := 0 to (RowCount - 1) do
      begin
        Cells[x, y] := '';
      end;
    end;

    if Enquiry.Line.NoOfQuantities = 0 then
    begin
      ColCount := 2;
      DefaultColWidth := 150;
      ColWidths[1] := 60;
    end
    else
    begin
      ColCount := Enquiry.Line.NoOfQuantities + 1;
      DefaultColWidth := 150;
      for x := 1 to (ColCount - 1) do
      begin
        ColWidths[x] := 60;
      end;
    end;

    if Enquiry.Line.NoOfQuotingSuppliers = 0 then
    begin
      RowCount := 2;
    end
    else
    begin
      RowCount := Enquiry.Line.NoOfQuotingSuppliers + 1;
    end;
  end;

  with strgrdQuotePrices do
  begin
    if Enquiry.Line.NoOfQuantities = 0 then
    begin
      ColCount := 2;
      DefaultColWidth := 150;
      ColWidths[1] := 60;
    end
    else
    begin
      ColCount := Enquiry.Line.NoOfQuantities + 1;
      DefaultColWidth := 150;
      for x := 1 to (ColCount - 1) do
      begin
        ColWidths[x] := 60;
      end;
    end;
  end;

  with strgrdRunOns do
  begin
    ColWidths[0] := Width - 10;
  end;

  with strgrdQuoteRunOn do
  begin
    ColWidths[0] := Width - 10;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdSupplierPricesDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ((ACol > 0) and (ARow > 0) and
      (ACol <= Enquiry.Line.NoOfQuantities) and
      (ARow <= Enquiry.Line.NoOfQuotingSuppliers)) then
  begin
    if (((ARow - 1) = (Enquiry.Line.Quantities[Acol - 1].LowestPriceIndex)) and
        (Enquiry.Line.PriceGrid[ACol -1, ARow -1].SupplierPrice <> 0.00)) then
    begin
      strgrdSupplierPrices.canvas.brush.Color := clyellow;
      strgrdSupplierPrices.canvas.font.style := [fsbold];
      strgrdSupplierPrices.canvas.font.Color := clWindowText;
    end
    else
    begin
      strgrdSupplierPrices.canvas.brush.Color := clWindow;
      strgrdSupplierPrices.canvas.font.style := [];
      strgrdSupplierPrices.canvas.font.Color := clWindowText;
    end;
  end;
  strgrdSupplierPrices.canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, strgrdSupplierPrices.Cells[ACol, ARow]);
end;

procedure TPBMaintEnquiryFrm.AddQuantity1Click(Sender: TObject);
var
  QtyString: string;
  Quant: double;
  inx, x, y: integer;
  aLineQuantity: TLineQuantity;
  qtyExists: boolean;
  qtyDeleted: Boolean;
  QuantitiesFrm: TPBEnqQuantitiesFrm;
  QuantitiesEntered: array [0..9] of double;
begin
  QuantitiesFrm := TPBEnqQuantitiesFrm.Create(Self);
  try
    for x := 0 to (Enquiry.Line.NoOfQuantities - 1) do
    begin
      //pass the quantities
      with QuantitiesFrm do
      begin
        with TEdit(FindComponent('Edit' + IntToStr(x))) do
        begin
          Text := FloatToStr(Enquiry.Line.Quantities[x].Quantity);
          if Enquiry.Line.Quantities[x].Deleted then
          begin
            Color := clYellow;
          end;
        end;
      end;
    end;

    QuantitiesFrm.ShowModal;
    if QuantitiesFrm.ModalResult = mrOK then
    begin
      if QuantitiesFrm.edit0.Text <> '' then
        QuantitiesEntered[0] := StrToFloatDef(QuantitiesFrm.edit0.Text, 0, FormatSettings);
      if QuantitiesFrm.edit1.Text <> '' then
        QuantitiesEntered[1] := StrToFloatDef(QuantitiesFrm.edit1.Text, 0, FormatSettings);
      if QuantitiesFrm.edit2.Text <> '' then
        QuantitiesEntered[2] := StrToFloatDef(QuantitiesFrm.edit2.Text, 0, FormatSettings);
      if QuantitiesFrm.edit3.Text <> '' then
        QuantitiesEntered[3] := StrToFloatDef(QuantitiesFrm.edit3.Text, 0, FormatSettings);
      if QuantitiesFrm.edit4.Text <> '' then
        QuantitiesEntered[4] := StrToFloatDef(QuantitiesFrm.edit4.Text, 0, FormatSettings);
      if QuantitiesFrm.edit5.Text <> '' then
        QuantitiesEntered[5] := StrToFloatDef(QuantitiesFrm.edit5.Text, 0, FormatSettings);
      if QuantitiesFrm.edit6.Text <> '' then
        QuantitiesEntered[6] := StrToFloatDef(QuantitiesFrm.edit6.Text, 0, FormatSettings);
      if QuantitiesFrm.edit7.Text <> '' then
        QuantitiesEntered[7] := StrToFloatDef(QuantitiesFrm.edit7.Text, 0, FormatSettings);
      if QuantitiesFrm.edit8.Text <> '' then
        QuantitiesEntered[8] := StrToFloatDef(QuantitiesFrm.edit8.Text, 0, FormatSettings);
      if QuantitiesFrm.edit9.Text <> '' then
        QuantitiesEntered[9] := StrToFloatDef(QuantitiesFrm.edit9.Text, 0, FormatSettings);

      //step thru existing quantities looking for deletions
      for x := 0 to (Enquiry.Line.NoOfQuantities - 1) do
      begin
        qtyDeleted := true;
        for y := 0 to 9 do
        begin
          if Enquiry.Line.Quantities[x].Quantity = QuantitiesEntered[y] then
            qtyDeleted := false;
        end;
        if qtyDeleted then
          Enquiry.Line.Quantities[x].Deleted := true;
      end;

      //step thru quantities entered looking for new ones
      for x := 0 to 9 do
      begin
        qtyExists := false;
        for y := 0 to (Enquiry.Line.NoOfQuantities - 1) do
        begin
          if ((QuantitiesEntered[x] = Enquiry.Line.Quantities[y].Quantity) or
             (QuantitiesEntered[x] = 0.00)) then
            qtyExists := true;
        end;

        if qtyExists then
        begin
          //qty exists, no need to do anything
        end
        else
        begin
          //new quantity, create it and put it in in the correct place,
          //quantities are added in ascending order.
          aLineQuantity := TLineQuantity.Create;
          aLineQuantity.Quantity := QuantitiesEntered[x];
          aLineQuantity.SupplierPrice := 0.00;
          aLineQuantity.QuotePrice := 0.00;
          aLineQuantity.PriceUnit.PriceUnit := 1;
          aLineQuantity.LowestPriceIndex := 0;
          aLineQuantity.NewLineQuantity := true;
          aLineQuantity.Modified := false;
          aLineQuantity.Deleted := false;

          if Enquiry.Line.NoOfQuantities = 0 then
          begin
            //no other quantities so just put new one at the start.
            Enquiry.Line.InsertQuantity(0, aLineQuantity);
            Enquiry.Line.InsertPrices(0);
          end
          else
          begin
            if aLineQuantity.Quantity > Enquiry.Line.Quantities[Enquiry.Line.NoOfQuantities - 1].Quantity then
            begin
              //new one is  bigger than all of the others so stick it at the end
              Enquiry.Line.AddQuantity(aLineQuantity);
              Enquiry.Line.InsertPrices(Enquiry.Line.NoOfQuantities - 1);
            end
            else
            begin
              for inx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
              begin
                if aLineQuantity.Quantity < Enquiry.Line.Quantities[inx].Quantity then
                begin
                  //have to loop thru to see where new quantity fits in, some where
                  //in the middle.
                  Enquiry.Line.InsertQuantity(inx, aLineQuantity);
                  Enquiry.Line.InsertPrices(inx);
                  break;
                end;
              end;
            end;
          end;
        end;
      end;
      Enquiry.DetailsModified := true;
      Self.DisplayPrices;
    end;
  finally
    QuantitiesFrm.Free;
  end;

  {*
  qtyExists := false;
  if InputQuery('Quantity Input', 'Please input the new Quantity', QtyString) then
  begin
    Quant := StrToFloatDef(QtyString, 0, FormatSettings);
    for x := 0 to (Enquiry.Line.NoOfQuantities - 1) do
    begin
      if Quant = Enquiry.Line.Quantities[x].Quantity then
        qtyExists := true;
    end;

    if not qtyExists then
    begin
      //Enquiry.Line.SavePriceGrid(Enquiry.EnquiryNo);
      aLineQuantity := TLineQuantity.Create;
      aLineQuantity.Quantity := Quant;
      aLineQuantity.SupplierPrice := 0.00;
      aLineQuantity.QuotePrice := 0.00;
      aLineQuantity.PriceUnit.PriceUnit := 1;
      aLineQuantity.LowestPriceIndex := 0;
      aLineQuantity.NewLineQuantity := true;
      aLineQuantity.Modified := false;
      aLineQuantity.Deleted := false;

      if Enquiry.Line.NoOfQuantities = 0 then
      begin
        //no other quantities so just put new one at the start.
        Enquiry.Line.InsertQuantity(0, aLineQuantity);
        Enquiry.Line.InsertPrices(0);
      end
      else
      begin
        if aLineQuantity.Quantity > Enquiry.Line.Quantities[Enquiry.Line.NoOfQuantities - 1].Quantity then
        begin
          //new one is  bigger than all of the others so stick it at the end
          Enquiry.Line.AddQuantity(aLineQuantity);
          Enquiry.Line.InsertPrices(Enquiry.Line.NoOfQuantities - 1);
        end
        else
        begin
          for x := 0 to (Enquiry.Line.NoOfQuantities - 1) do
          begin
            if aLineQuantity.Quantity < Enquiry.Line.Quantities[x].Quantity then
            begin
              //have to loop thru to see where new quantity fits in, some where
              //in the middle.
              Enquiry.Line.InsertQuantity(x, aLineQuantity);
              Enquiry.Line.InsertPrices(x);
              break;
            end;
          end;
        end;
      end;
      Enquiry.DetailsModified := true;
      Self.DisplayPrices;

    end;
  end;        *}
end;

procedure TPBMaintEnquiryFrm.DisplayCapabilities;
var
  cpbltyInx: integer;
begin
  //clear the list.
  chklstbxCapabilities.Clear;
  //the first capability (the default) is never added to the capabilities list so
  //the index of the indexes of the capablities check list is always one less than
  //the Enquiry capabilites list.
  with chklstbxCapabilities do
  begin
    for cpbltyInx := 0 to (Enquiry.Line.ProductType.GetCapabilityCount - 1) do
    begin
      if cpbltyInx <> 0 then
        Items.Add(Enquiry.Line.ProductType.Capabilities[cpbltyInx].Description);
    end;

    for cpbltyInx := 0 to (Enquiry.Line.ProductType.GetCapabilityCount - 1) do
    begin
      if cpbltyInx <> 0 then
        Checked[cpbltyInx - 1] := Enquiry.Line.ProductType.Capabilities[cpbltyInx].selected;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdQuotePricesKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  icol, irow: Integer;
begin
  irow := strgrdQuotePrices.Row;
  icol := strgrdQuotePrices.Col;

  with strgrdQuotePrices do
  begin
    if iRow = 1 then
    begin
      try
        StrToFloatDef(Cells[iCol, iRow], 0, FormatSettings)
      except
        exit;
      end;

      if Pos('£', Cells[iCol, iRow]) <> 0 then
        Enquiry.Line.Quantities[iCol - 1].QuotePrice := StrToFloatDef(Copy(Cells[iCol, iRow], 2, 256), 0, FormatSettings)
      else
        Enquiry.Line.Quantities[iCol - 1].QuotePrice := StrToFloatDef(Cells[iCol, iRow], 0, FormatSettings);

      if Enquiry.Line.Quantities[iCol - 1].SupplierPrice <> 0 then
        Cells[iCol, 2] := FloatToStrF((((Enquiry.Line.Quantities[iCol - 1].QuotePrice - Enquiry.Line.Quantities[iCol - 1].SupplierPrice)*100) / Enquiry.Line.Quantities[iCol - 1].SupplierPrice),  ffFixed, 15, 2)
      else
        Cells[iCol, 2] := '';

      if Enquiry.Line.Quantities[iCol - 1].QuotePrice <> 0.00 then
        Cells[iCol, 3] := FloatToStrF((Enquiry.Line.Quantities[iCol - 1].QuotePrice - Enquiry.Line.Quantities[iCol - 1].SupplierPrice), ffFixed, 15, 2)
      else
        Cells[iCol, 3] := '';

      Enquiry.DetailsModified := true;
      Enquiry.Line.Quantities[iCol - 1].Modified := true;
    end
    else if iRow = 2 then
    begin
      try
        StrToFloatDef(Cells[iCol, iRow], 0, FormatSettings)
      except
        exit;
      end;

      if chkbxMarkUpAll.Checked then
      begin
        Self.ApplyMarkUpToAll(StrToFloatDef(Cells[iCol, iRow], 0, FormatSettings), iCol);
      end
      else
      begin
        Enquiry.Line.Quantities[iCol - 1].QuotePrice :=
          (Enquiry.Line.Quantities[iCol - 1].SupplierPrice *
          ((StrToFloatDef(Cells[iCol, iRow], 0, FormatSettings)) / 100)) +
          Enquiry.Line.Quantities[iCol - 1].SupplierPrice;

        if Enquiry.Line.Quantities[iCol - 1].QuotePrice <> 0.00 then
          Cells[iCol, 1] := FloatToStrF(Enquiry.Line.Quantities[iCol - 1].QuotePrice, ffFixed, 15, 2)
        else
          Cells[iCol, 1] := '';

        if Enquiry.Line.Quantities[iCol - 1].QuotePrice <> 0.00 then
          Cells[iCol, 3] := FloatToStrF((Enquiry.Line.Quantities[iCol - 1].QuotePrice - Enquiry.Line.Quantities[iCol - 1].SupplierPrice), ffFixed, 15, 2)
        else
          Cells[iCol, 3] := '';
      end;

      Enquiry.DetailsModified := true;
      Enquiry.Line.Quantities[iCol - 1].Modified := true;
    end
    else if iRow = 3 then
    begin
      try
        StrToFloatDef(Cells[iCol, iRow], 0, FormatSettings)
      except
        exit;
      end;

      Enquiry.Line.Quantities[iCol - 1].QuotePrice :=
        Enquiry.Line.Quantities[iCol - 1].SupplierPrice +
        StrToFloatDef(Cells[iCol, iRow], 0, FormatSettings);

      if Enquiry.Line.Quantities[iCol - 1].QuotePrice <> 0.00 then
        Cells[iCol, 1] := FloatToStrF(Enquiry.Line.Quantities[iCol - 1].QuotePrice, ffFixed, 15, 2)
      else
        Cells[iCol, 1] := '';

      if Enquiry.Line.Quantities[iCol - 1].SupplierPrice <> 0 then
        Cells[iCol, 2] := FloatToStrF((((Enquiry.Line.Quantities[iCol - 1].QuotePrice - Enquiry.Line.Quantities[iCol - 1].SupplierPrice)*100) / Enquiry.Line.Quantities[iCol - 1].SupplierPrice),  ffFixed, 15, 2)
      else
        Cells[iCol, 2] := '';

      Enquiry.DetailsModified := true;
      Enquiry.Line.Quantities[iCol - 1].Modified := true;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.ApplyMarkUptoAll(markUp: double; currCol: integer);
var
  qtyInx: integer;
begin
  with strgrdQuotePrices do
  begin
    for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
    begin
      Enquiry.Line.Quantities[qtyInx].QuotePrice :=
        (Enquiry.Line.Quantities[qtyInx].SupplierPrice *
        (markUp/100)) +
        Enquiry.Line.Quantities[qtyInx].SupplierPrice;

      if Enquiry.Line.Quantities[qtyInx].QuotePrice <> 0.00 then
        Cells[qtyInx+1, 1] :=
          FloatToStrF(Enquiry.Line.Quantities[qtyInx].QuotePrice, ffFixed, 15, 2)
      else
        Cells[qtyInx+1, 1] := '';
        
      if qtyInx+1 <> currCol then
        Cells[qtyInx+1, 2] := FloatToStrF(markUp, ffFixed, 15, 2);

      if Enquiry.Line.Quantities[qtyInx].QuotePrice <> 0.00 then
        Cells[qtyInx+1, 3] :=
          FloatToStrF((Enquiry.Line.Quantities[qtyInx].QuotePrice -
          Enquiry.Line.Quantities[qtyInx].SupplierPrice), ffFixed, 15, 2)
      else
        Cells[qtyInx+1, 3] := '';

      Enquiry.Line.Quantities[qtyInx].Modified := true;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdQuotePricesExit(Sender: TObject);
var
  icol, irow: integer;
begin
  {Format any numeric values}
  with Sender as TStringGrid do
  begin
    for icol := 1 to pred(colcount) do
      for irow := 1 to 3 do
      begin
        if cells[icol, irow] = '' then continue;
        cells[icol, irow] := formatfloat('0.00',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
      end;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdQuotePricesKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;}
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdQuotePricesSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  irow, icol: integer;
begin
  with strgrdQuotePrices do
  begin
    if Cells[Col, 0] = '' then
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing]
    else
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing, goEditing]
  end;

  if ARow = 4 then
  begin
    if not PBEnqDM.GetPriceUnitSQL.Active then
      PBEnqDM.GetPriceUnitSQL.Open;
      
    with cmbbxPriceUnit, Enquiry.Line.Quantities[ACol -1].PriceUnit do
    begin
      KeyValue := PriceUnit;
      left := cellleft(strgrdQuotePrices, ACol)+strgrdQuotePrices.ColWidths[0] + 2;
      top := celltop(strgrdQuotePrices, ARow);
      width := strgrdQuotePrices.ColWidths[ACol];

      bringtofront;
      Visible := True;
      SetFocus;
    end;
    PBEnqDM.GetPriceUnitSQL.Close;
  end;

  {Format any numeric values}
  with Sender as TStringGrid do
  begin
    for icol := 1 to pred(colcount) do
      for irow := 1 to 3 do
      begin
        if cells[icol, irow] = '' then continue;
        cells[icol, irow] := formatfloat('0.00',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
      end;
  end;
end;

procedure TPBMaintEnquiryFrm.cmbbxContactListChange(Sender: TObject);
begin
  Enquiry.Contact.Name := cmbbxContactList.Items[cmbbxContactList.ItemIndex];
  Enquiry.CustEstContact := Enquiry.Contact.Name;
  //we have the reps name but the item index may not be the rep no
  //so query database to find the rep no based on the rep name.
  Enquiry.Contact.GetContactNoByName(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);
  Enquiry.Contact.Load(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);
  Enquiry.DetailsModified := true;
  Enquiry.Modified := true;
end;

procedure TPBMaintEnquiryFrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  Enquiry.Line.FormReference.Clear;
  Enquiry.Line.Modified := True;
end;

procedure TPBMaintEnquiryFrm.strgrdRunOnsKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;}
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdRunOnsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  tempRunOnPrice: double;
begin
  with strgrdRunOns do
  begin
    try
      tempRunOnPrice := StrToFloatDef(cells[Col, Row], 0, FormatSettings);
    except
      MessageDlg('Not a valid number.', mtWarning, [mbOK], 0);
      exit;
    end;

    Enquiry.Line.QuotingSuppliers[Row - 1].SupplierResponse.RunOnPrice :=
      tempRunOnPrice;
      
    Enquiry.DetailsModified := true;
    Enquiry.Line.QuotingSuppliers[Row - 1].SupplierResponse.Modified := true;
  end;
end;

procedure TPBMaintEnquiryFrm.AddSupplier1Click(Sender: TObject);
var
  cpbltyInx, suppInx: integer;
  iItem: Integer;
  supplierSelectForm: TPBEnqSelSupfrm;
  aQuoteSupplier: TSupplier;
  StillOnlist: boolean;
begin
  {Create the Supplier Selection form}
  supplierSelectForm := TPBEnqSelSupfrm.Create(self);
  try
    supplierSelectForm.iEnqNo := 0;
    supplierSelectForm.iEnqLine := Enquiry.Line.LineNo;
    supplierSelectForm.LoadSupps(Self);

    supplierSelectForm.iProdType := Enquiry.Line.ProductType.TypeNo;

    //Load the capabilities array with the selected capability numbers
    iItem := 0;
    for cpbltyInx := 0 to (Enquiry.Line.ProductType.GetCapabilityCount - 1) do
    begin
      if Enquiry.Line.ProductType.Capabilities[cpbltyInx].Selected then
      begin
        supplierSelectForm.iCaps[iItem] :=
          Enquiry.Line.ProductType.Capabilities[cpbltyInx].CapabilityNo;
        inc(iItem);
      end;
    end;

    supplierSelectForm.icapcount := iItem;

    //Load the Selected supplier grid with those suppliers already selected
    supplierSelectForm.iselcount := 0;
    for SuppInx := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
    begin
      supplierSelectForm.iselsupp[SuppInx] :=
        Enquiry.Line.QuotingSuppliers[suppInx].SupplierNo;
      supplierSelectForm.iselBranch[SuppInx] :=
        Enquiry.Line.QuotingSuppliers[suppInx].Branch.BranchNo;
      inc(supplierSelectForm.iselcount);
    end;

    supplierSelectForm.ShowModal;

    if supplierSelectForm.ModalResult = idok then
    begin
      //loop thru exisitng suppliers to see if any have been deleted fom the list
      for suppInx := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
      begin
        StillOnList := False;
        with supplierSelectForm.selsupSRC.Dataset do
        begin
          First;
          while not EOF do
          begin
            if ((Enquiry.Line.QuotingSuppliers[suppInx].SupplierNo = FieldByName('Supplier').asInteger) and
               (Enquiry.Line.QuotingSuppliers[suppInx].Branch.BranchNo = FieldByName('Branch_No').asInteger)) then
                 StillOnList := true;
            next;
          end;
        end;
        if not StillOnList then
        begin
          //this supplier has been removed from the list and needs to be deleted
          Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Deleted := true;
        end;
      end;

      //loop thru selected suppliers and add new ones
      with supplierSelectForm.selsupSRC.Dataset do
      begin
        First;
        while not EOF do
        begin
          //check if supplier is already a quoting supplier
          if Enquiry.Line.IsQuoteSupplier(FieldByName('Supplier').asInteger, FieldByName('Branch_No').asInteger) then
          begin
            //this is an existing quote supplier skip to the next and continue
            next;
          end
          else
          begin
            //this is not an existing quote supplier, add it to the list
            aQuoteSupplier := TSupplier.Create(true);
            aQuoteSupplier.SupplierNo := FieldByName('Supplier').asInteger;
            aQuoteSupplier.Load();
            aQuoteSupplier.Branch.BranchNo := FieldByName('Branch_No').asInteger;
            aQuoteSupplier.Branch.Load(aQuoteSupplier.SupplierNo);
            aQuoteSupplier.SupplierResponse.NewResponse := true;
            Enquiry.Line.AddQuoteSupplier(aQuoteSupplier);
            Enquiry.Line.NewPriceRow;
            next;
          end;
        end;
      end;

    end;
    {*
      //Set the Contacts up (again, if needed)
      GetSupplierContacts;
    end;      *}
  finally
    supplierSelectForm.Free;
    //redisplay prices grid
    Enquiry.DetailsModified := true;
    Self.DisplayPrices;
  end;
end;

procedure TPBMaintEnquiryFrm.chklstbxCapabilitiesClickCheck(
  Sender: TObject);
var
  nonDefaultSelected: boolean;
  x: integer;
begin
  nonDefaultSelected := false;
  Enquiry.Line.ProductType.Capabilities[chklstbxCapabilities.ItemIndex + 1].Selected :=
    chklstbxCapabilities.Checked[chklstbxCapabilities.ItemIndex];

  //check if any standard capabilities have been selected, if not then the default
  //capability must be selected.
  for x := 0 to (Enquiry.Line.ProductType.GetCapabilityCount -1) do
  begin
    if x <> 0 then
    begin
      if Enquiry.Line.ProductType.Capabilities[x].Selected then
        nonDefaultSelected := true;
    end;
  end;

  if nonDefaultSelected = false then
  begin
    //no capabilites have been selected so must select the default one
    try
      Enquiry.Line.ProductType.Capabilities[0].Selected := true;
    except
      MessageDlg('No default capability set up for Prodcut Type: ' +
        Enquiry.Line.ProductType.Description + '.', mtWarning, [mbOK], 0);
    end;
  end
  else
  begin
    //a non default capability has been selected which means that the default
    //capability must not be selected.
    Enquiry.Line.ProductType.Capabilities[0].Selected := false;
  end;
  Enquiry.DetailsModified := true;
  Enquiry.Line.Modified := true;
end;

procedure TPBMaintEnquiryFrm.strgrdSupplierPricesTopLeftChanged(
  Sender: TObject);
begin
  strgrdQuotePrices.LeftCol := strgrdSupplierPrices.LeftCol;
end;

procedure TPBMaintEnquiryFrm.strgrdQuotePricesTopLeftChanged(
  Sender: TObject);
begin
  strgrdSupplierPrices.LeftCol := strgrdQuotePrices.LeftCol;
end;

procedure TPBMaintEnquiryFrm.SetRunOnQuantity1Click(Sender: TObject);
var
  QtyString: string;
  QtyFloat: double;
  suppInx: integer;
begin
  //if strgrdRunOns.Row = 0 then
  begin
    if InputQuery('Quantity Input', 'Please input the Run-On Quantity', QtyString) then
    begin
      try
        QtyFloat := StrToFloatDef(QtyString, 0, FormatSettings);
      except
        messageDlg('Not a valid value!', mtWarning, [mbOK], 0);
        exit;
      end;

      for suppInx := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
      begin
        Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.RunOnQuantity :=QtyFloat;
        Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
      end;
      Enquiry.DetailsModified := true;
    end;
    strgrdRunOns.Cells[0,0] := QtyString;
  end;
end;

procedure TPBMaintEnquiryFrm.DisplayQuestions;
var
  inx : integer;
  MyLabel : TLabel;
  MyEdit : TEdit;
  MyComboBox: TComboBox;
  MyCheckBox: TCheckBox;
  MySpinEdit: TSpinEdit;
  sTempName : string;
  iPos : integer;
begin
  lblQuestions.Caption := 'Questions for Product type: '+ Enquiry.Line.ProductType.Description;
  //loop thru questions
  for inx := 0 to (Enquiry.Line.ProductType.NoOfQuestions - 1) do
  begin
    with Enquiry.Line.ProductType.Questions[inx] do
    begin
    if PromptType = 'cbo' then
      begin
        MyLabel := TLabel.Create(Self);
        MyComboBox := TComboBox.Create(Self);
        stempname := 'cbo' + IntToStr(((inx+1)*1000) + QuestionNo) + 'Line' +
          IntToStr(Enquiry.Line.LineNo);
        Mylabel.autosize := False;
        MyComboBox.Name := stempname;
        MyLabel.Caption := Text;
        MyComboBox.Parent := sbQuestions;
        MyLabel.Parent := sbQuestions;
        MyComboBox.Tag := 100000 + inx;
        MyLabel.Tag := 100000;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 10;
        MyComboBox.Width := 200;
        MyComboBox.Left := mylabel.Left + mylabel.Width + 5;
        MyComboBox.Text := Answer;
        MyComboBox.OnChange := QuestionChange;
        MyComboBox.OnDropDown := QuestionDropDown;
        MyLabel.Height := 15;
        MyComboBox.Height := 22;
//        ipos := ipos + MyLabel.Height;
        MyComboBox.Top := ipos;
        MyLabel.Top := MyComboBox.Top + 9;
        ipos := ipos + MyComboBox.Height+5;
//        MyComboBox.style := csdropdownlist;
      end
    else
    if PromptType = 'chk' then
      begin
        MyLabel := TLabel.Create(Self);
        MyCheckBox := TCheckBox.Create(Self);
        stempname := 'chk' + IntToStr(((inx+1)*1000) + QuestionNo) + 'Line' +
          IntToStr(Enquiry.Line.LineNo);
        MyCheckBox.Name := stempname;
        MyCheckBox.Caption := '';
        MyCheckBox.Parent := sbQuestions;

        Mylabel.autosize := False;
        MyLabel.Caption := Text;
        MyLabel.Parent := sbQuestions;
        MyLabel.Tag := 100000;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 10;
        MyLabel.Height := 15;

        MyCheckBox.Tag := 100000 + inx;
        MyCheckBox.Left := mylabel.Left + mylabel.Width + 5;
        MyCheckBox.Width := 200;
        MyCheckBox.Top := ipos+8;
        MyCheckBox.Font.Size := 10;
        MyCheckBox.checked := (Answer='Y');
        MyCheckBox.OnClick := QuestionClick;
        MyCheckBox.Height := 17;
        MyLabel.Top := MyCheckBox.Top;
        ipos := ipos + MyCheckBox.Height+12;
      end
    else
    if PromptType = 'spn' then
      begin
        MyLabel := TLabel.Create(Self);
        MySpinEdit := TSpinEdit.Create(Self);
        stempname := 'spn' + IntToStr(((inx+1)*1000) + QuestionNo) + 'Line' +
          IntToStr(Enquiry.Line.LineNo);
        Mylabel.autosize := False;
        MySpinEdit.Name := stempname;
        MyLabel.Caption := Text;
        MySpinEdit.Parent := sbQuestions;
        MyLabel.Parent := sbQuestions;
        MySpinEdit.Tag := 100000 + inx;
        MyLabel.Tag := 100000;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        MySpinEdit.Top := ipos;
        Mylabel.Font.Size := 10;
        MySpinEdit.Width := 100;
        MySpinEdit.Left := mylabel.Left + mylabel.Width + 5;
        try
          MySpinEdit.value := strtoint(Answer);
        except
          MySpinEdit.value := 0;
        end;

        MySpinEdit.OnChange := QuestionChange;
        MyLabel.Height := 15;
        MySpinEdit.Height := 24;
        MySpinEdit.MaxValue := 100000;
        MyLabel.top := MySpinEdit.top+9;
        ipos := ipos + MySpinedit.Height+5;
      end
    else
      begin
        MyLabel := TLabel.Create(Self);
        MyEdit := TEdit.Create(Self);
        stempname := 'Edit' + IntToStr(((inx+1)*1000) + QuestionNo) + 'Line' +
          IntToStr(Enquiry.Line.LineNo);
        Mylabel.autosize := False;
        MyEdit.Name := stempname;
        MyLabel.Caption := Text;
        MyEdit.Parent := sbQuestions;
        MyLabel.Parent := sbQuestions;
        MyEdit.Tag := 100000 + inx;
        MyLabel.Tag := 100000;
        MyLabel.Left := 5;
        MyLabel.Width := 200;
        Mylabel.Font.Size := 10;
        MyEdit.Width := (400);
        MyEdit.Left := mylabel.Left + mylabel.Width + 5;
        MyEdit.Text := Answer;
        MyEdit.OnChange := QuestionChange;
        MyLabel.Height := 15;
        MyEdit.Height := 22;
//        ipos := ipos + MyLabel.Height;
        MyEdit.Top := ipos;
        MyLabel.Top := MyEdit.Top+8;
        ipos := ipos + Myedit.Height+5;
      end;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.DeleteQuantity1Click(Sender: TObject);
var
  QtyString: string;
  QtyFloat: double;
  qtyInx: integer;
  qtyExists: boolean;
  delInx: integer;
begin
  qtyExists := false;
  if InputQuery('Delete Quantity', 'Which quantity do you want to remove?', QtyString) then
  begin
    try
      QtyFloat := StrToFloatDef(QtyString, 0, FormatSettings);
    except
      MessageDlg('Not a valid value!', mtWarning, [mbOK], 0);
      exit
    end;

    for qtyInx := 0 to (Enquiry.Line.NoOfQuantities -1 ) do
    begin
      if QtyFloat = Enquiry.Line.Quantities[qtyInx].Quantity then
      begin
        qtyExists := true;
        delInx := qtyInx;
      end;
    end;

    Enquiry.Line.Quantities[delInx].Deleted := true;
    Enquiry.DetailsModified := true;
    Self.DisplayPrices;
  end;
end;

procedure TPBMaintEnquiryFrm.FreeQuestionComponents;
var
  i : integer;
begin
  { Do the frees in reverse order or all hell breaks loose }
  for i := Pred(ComponentCount) downto 0 do
    if (TComponent(Components[i]).Tag >= 100000) and
       (TComponent(Components[i]).Tag <= 199999) then
      TComponent(Components[i]).Free;
end;

procedure TPBMaintEnquiryFrm.QuestionChange(Sender: TObject);
begin
  if Sender is TEDit then
    with Sender as TEdit do
    begin
      Enquiry.Line.ProductType.Questions[Tag-100000].Answer := Text;
      Enquiry.Line.ProductType.Questions[Tag-100000].Modified := True;
    end
  else
  if Sender is TComboBox then
    with Sender as TComboBox do
    begin
      Enquiry.Line.ProductType.Questions[Tag-100000].Answer := Text;
      Enquiry.Line.ProductType.Questions[Tag-100000].Modified := True;
    end
  else
  if Sender is TSpinEdit then
    with Sender as TSpinEdit do
    begin
      Enquiry.Line.ProductType.Questions[Tag-100000].Answer := inttostr(Value);
      Enquiry.Line.ProductType.Questions[Tag-100000].Modified := True;
    end;

  Enquiry.DetailsModified := true;
end;

procedure TPBMaintEnquiryFrm.QuestionDropDown(Sender: TObject);
var
  stext: string;
  aInx: integer;
begin
  with (Sender as TComboBox) do
  begin
    stext := Text;
    Items.Clear;
    with Enquiry.Line.ProductType.Questions[Tag-100000] do
    begin
      for aInx := 0 to (Answers.Count - 1) do
      begin
        Items.Add(Trim(Answers[aInx]));
      end;
    end;

    if items.count = 1 then
      Itemindex := 0
    else
      Itemindex := (Sender as TComboBox).Items.IndexOf(stext);
    if Itemindex = -1 then
      Text := stext;

    Enquiry.DetailsModified := true;
    Enquiry.Line.ProductType.Questions[Tag-100000].Modified := True;
  end;
end;

procedure TPBMaintEnquiryFrm.QuestionClick(Sender: TObject);
begin
 if Sender is TCheckBox then
  with Sender as TCheckBox do
  begin
    if Checked then
      Enquiry.Line.ProductType.Questions[Tag-100000].Answer := 'Y'
    else
      Enquiry.Line.ProductType.Questions[Tag-100000].Answer := 'N';


    Enquiry.DetailsModified := true;
    Enquiry.Line.ProductType.Questions[Tag-100000].Modified := True;
  end;
end;

procedure TPBMaintEnquiryFrm.spdbtnLUCustContactClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Self);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := Enquiry.Customer.CustomerNo;
    PBLUCContaFrm.iBranch := Enquiry.CustomerBranch.BranchNo;
    PBLUCContaFrm.sCustName := Enquiry.Customer.CustName;
    PBLUCContaFrm.sBranchName := Enquiry.CustomerBranch.BranchName;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      Enquiry.Contact.ContactNo := PBLUCContaFrm.SelCode;
      Enquiry.Contact.Load(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);
      Enquiry.DetailsModified := True;
      Enquiry.Modified := True;
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  DisplayHeaderInfo;
end;

procedure TPBMaintEnquiryFrm.spdbtnLURepClick(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    PBLUCRepFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := Enquiry.Customer.CustomerNo;
    PBLUCContaFrm.iBranch := Enquiry.CustomerBranch.BranchNo;
    PBLUCContaFrm.sCustName := Enquiry.Customer.CustName;
    PBLUCContaFrm.sBranchName := Enquiry.CustomerBranch.BranchName;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      Enquiry.Rep.RepNo := PBLUCContaFrm.SelCode;
      Enquiry.Rep.Load();
      Enquiry.DetailsModified := True;
      Enquiry.Modified := True;
    end;
  finally
    PBLUCRepFrm.Free;
  end;
end;

procedure TPBMaintEnquiryFrm.DisplayNotes;
var
  noteCount, Inx: integer;
  aMemo: TMemo;
begin
  FreeNoteComponents;
  for Inx := 0 to (Enquiry.Line.NoOfNotes - 1) do
  begin
    with Enquiry.Line.AdditionalDetails[Inx] do
    begin
      if Deleted then
      begin
        //if deleted then do not display
        //the record will be removed from db when enquiry is saved
        continue;
      end;

      aMemo := TMemo.Create(Self);
      aMemo.Name := 'mmNote'+IntToStr(200000 + inx);

      if Audience = 'B' then
      begin
        //Note is for both Suppliers and Customers
        aMemo.Parent := Self.sbBothNotes;
        aMemo.Top := NextTopCust;
        aMemo.Width := sbBothNotes.Width - 4;
        NextTopCust := NextTopCust + aMemo.Height + 4;
      end
      else if Audience = 'C' then
      begin
        //Note is for Customers alone
        aMemo.Parent := Self.sbCustNotes;
        aMemo.Top := NextTopBoth;
        aMemo.Width := sbCustNotes.Width - 4;
        NextTopBoth := NextTopBoth + aMemo.Height + 4;
      end
      else if Audience = 'S' then
      begin
        //Note is for Suppliers alone
        aMemo.Parent := Self.sbSuppNotes;
        aMemo.Top := NextTopSupp;
        aMemo.Width := sbSuppNotes.Width - 4;
        NextTopSupp := NextTopSupp + aMemo.Height + 4;
      end;
      aMemo.Tag := 200000 + inx;
      aMemo.Lines.Clear;
      if Details <> '' then
        aMemo.Lines.Add(Details);
        
      aMemo.WordWrap := true;
      aMemo.OnExit := EditNote;

    end;
  end;
end;

procedure TPBMaintEnquiryFrm.FreeNoteComponents;
var
  i : integer;
begin
  { Do the frees in reverse order or all hell breaks loose }
  for i := Pred(ComponentCount) downto 0 do
  begin
    if (TComponent(Components[i]).Tag >= 200000) and
       (TComponent(Components[i]).Tag <= 299999)  then
    begin
      TComponent(Components[i]).Free;
    end;
  end;
  NextTopCust := 1;
  NextTopBoth := 1;
  NextTopSupp := 1;
end;

procedure TPBMaintEnquiryFrm.btnAddSuppCustNotesClick(Sender: TObject);
var
  PBEnqNoteFrm: TPBEnqNoteFrm;
begin
  PBEnqNoteFrm := TPBEnqNoteFrm.Create(Self);
  try
    PBEnqNoteFrm.ShowModal;
    if PBEnqNoteFrm.ModalResult = mrOK then
    begin
      if PBEnqNoteFrm.RadioGroup1.ItemIndex = 0 then
        Enquiry.Line.AddAdditionalDetail('C')
      else if PBEnqNoteFrm.RadioGroup1.ItemIndex = 1 then
        Enquiry.Line.AddAdditionalDetail('S')
      else if PBEnqNoteFrm.RadioGroup1.ItemIndex = 2 then
        Enquiry.Line.AddAdditionalDetail('B');

      DisplayNotes;
      //set focus on new memo
      (Components[Pred(ComponentCount)] as TMemo).SetFocus;
    end;
  finally
    PBEnqNoteFrm.Free;
  end;
end;

procedure TPBMaintEnquiryFrm.EditNote(Sender: TObject);
var
  x: integer;
  noText: boolean;
begin
  noText := true;
  with sender as TMemo do
  begin
    //run thru lines to see if they are all empty
    for x := 0 to (lines.count -1) do
    begin
      if lines[x] <> '' then
      begin
        noText := false;
      end;
    end;

    if noText then
    begin
      //all of the lines are empty, so delete the note.
      Enquiry.Line.AdditionalDetails[tag - 200000].Deleted := true;
    end
    else
    begin
      Enquiry.Line.AdditionalDetails[tag - 200000].Details := '';
      for x := 0 to (lines.count - 1) do
      begin
        Enquiry.Line.AdditionalDetails[tag - 200000].Details :=
          Enquiry.Line.AdditionalDetails[tag - 200000].Details +
          lines[x];
        if x <> (lines.count - 1) then
        begin
          Enquiry.Line.AdditionalDetails[tag - 200000].Details :=
            Enquiry.Line.AdditionalDetails[tag - 200000].Details + #13#10;
        end;
      end;
    end;
    Enquiry.DetailsModified := true;
    Enquiry.Line.AdditionalDetails[tag-200000].Modified := true;
  end;
end;

procedure TPBMaintEnquiryFrm.CheckEditBoxContents(x: integer);
begin

end;

procedure TPBMaintEnquiryFrm.DisableNonEditableControls;
begin
{*
  if Enquiry.Line.EnquiryStatus < esPartSelectedForEst then
    break;

  
  if Enquiry.Line.EnquiryStatus < esSelectedForEst then
    break;

  if Enquiry.Line.EnquiryStatus < esPartSentToSupplier then
    break;

  if Enquiry.Line.EnquiryStatus < esSentToSupplier then
    break;

  
  if Enquiry.Line.EnquiryStatus < esSomeSupplierResponse then
    break;

  if Enquiry.Line.EnquiryStatus < esAllSuppliersResponded then
    break;

  if Enquiry.Line.EnquiryStatus < esPartPricesSet then
    break;

  if Enquiry.Line.EnquiryStatus < esAllPricesSet then
    break;

  if Enquiry.Line.EnquiryStatus < esSomeQuotationsPrinted then
    break;

  if Enquiry.Line.EnquiryStatus < esAllQuotationsPrinted then
    break;

  if Enquiry.Line.EnquiryStatus < esPartConfirmAsSalesOrder then
    break;

  if Enquiry.Line.EnquiryStatus < esAllConfirmedAsSalesOrder then
    break;

  if Enquiry.Line.EnquiryStatus < esPartPurchOrderRaised then
    break;

  if Enquiry.Line.EnquiryStatus < esAllPurchOrderRaised then
    break;

  if Enquiry.Line.EnquiryStatus < esPartCancelled then
    break;

  if Enquiry.Line.EnquiryStatus < esFullyCancelled then
    break;

  if Enquiry.Line.EnquiryStatus < esSomePurchInvRecvd then
    break;

  if Enquiry.Line.EnquiryStatus < esAllPurchInvRecvd then
    break;

  if Enquiry.Line.EnquiryStatus < esSomeSalesInvRecvd then
    break;

  if Enquiry.Line.EnquiryStatus < esAllPurchInvRevcd then
    break;

  if Enquiry.Line.EnquiryStatus < esMarkedInactive then
    break;

  Self.edtdatePoint.Enabled := False;
  Self.spdbtnDatePoint.Enabled := False;
  Self.AddQuantity1.Enabled := False;
  *}
end;

procedure TPBMaintEnquiryFrm.strgrdQuoteRunOnKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;}
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdQuoteRunOnExit(Sender: TObject);
var
  irow: integer;
begin
  {Format any numeric values}
  with Sender as TStringGrid do
  begin
    for irow := 1 to 3 do
    begin
      if cells[0, irow] = '' then continue;
      cells[0, irow] := formatfloat('0.00',StrToFloatDef(cells[0,irow], 0, FormatSettings));
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdQuoteRunOnKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  irow: Integer;
begin
  irow := strgrdQuoteRunOn.Row;

  with strgrdQuoteRunOn do
  begin
    if irow = 1 then
    begin
      try
        StrToFloatDef(Cells[0, iRow], 0, FormatSettings)
      except
        exit;
      end;

      if Pos('£', Cells[0, iRow]) <> 0 then
        Enquiry.Line.RunOnPrice := StrToFloatDef(Copy(Cells[0, iRow], 2, 256), 0, FormatSettings)
      else
        Enquiry.Line.RunOnPrice := StrToFloatDef(Cells[0, iRow], 0, FormatSettings);

      if Enquiry.Line.RunOnCost <> 0 then
        Cells[0, 2] := FloatToStrF((((Enquiry.Line.RunOnPrice - Enquiry.Line.RunOnCost)*100) / Enquiry.Line.RunOnCost),  ffFixed, 15, 2)
      else
        Cells[0, 2] := '';

      if Enquiry.Line.RunOnPrice <> 0 then
        Cells[0, 3] := FloatToStrF(Enquiry.Line.RunOnPrice - Enquiry.Line.RunOnCost,  ffFixed, 15, 2)
      else
        Cells[0, 3] := '';

    end
    else if irow = 2 then
    begin
      try
        StrToFloatDef(Cells[0, iRow], 0, FormatSettings)
      except
        exit;
      end;

      Enquiry.Line.RunOnPrice := (Enquiry.Line.RunOnCost * (StrToFloatDef(Cells[0,2], 0, FormatSettings) / 100))
         + Enquiry.Line.RunOnCost;

      if Enquiry.Line.RunOnCost <> 0 then
        Cells[0,1] := FloatToStrF(Enquiry.Line.RunOnPrice , ffFixed, 15, 2)
      else
        Cells[0,1] := '';

      if Enquiry.Line.RunOnPrice <> 0 then
        Cells[0, 3] := FloatToStrF(Enquiry.Line.RunOnPrice - Enquiry.Line.RunOnCost,  ffFixed, 15, 2)
      else
        Cells[0, 3] := '';

    end
    else if irow = 3 then
    begin
      try
        StrToFloatDef(Cells[0, iRow], 0, FormatSettings)
      except
        exit;
      end;
      
      Enquiry.Line.RunOnPrice :=
        Enquiry.Line.RunOnCost +
        StrToFloatDef(Cells[0, iRow], 0, FormatSettings);

      if Enquiry.Line.RunOnCost <> 0.00 then
        Cells[0, 1] := FloatToStrF(Enquiry.Line.RunOnPrice, ffFixed, 15, 2)
      else
        Cells[0, 1] := '';

      if Enquiry.Line.RunOnCost <> 0 then
        Cells[0, 2] := FloatToStrF((((Enquiry.Line.RunOnPrice - Enquiry.Line.RunOnCost)*100) / Enquiry.Line.RunOnPrice),  ffFixed, 15, 2)
      else
        Cells[0, 2] := '';

    end;
  end;
  
  Enquiry.line.Modified := true;
  Enquiry.DetailsModified := true;
end;

procedure TPBMaintEnquiryFrm.strgrdQuoteRunOnSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  irow: integer;
begin
  with strgrdQuotePrices do
  begin
    if Cells[0, 0] = '' then
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing]
    else
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing, goEditing]
  end;

  {Format any numeric values}
  with Sender as TStringGrid do
  begin
    for irow := 1 to 3 do
    begin
      if cells[0, irow] = '' then continue;
      cells[0, irow] := formatfloat('0.00',StrToFloatDef(cells[0,irow], 0, FormatSettings));
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdSupplierPricesDblClick(Sender: TObject);
var
  suppInx: integer;
begin
  with strgrdSupplierPrices do
  begin
    if ((Enquiry.Line.NoOfQuantities = 0) or
        (Enquiry.Line.NoOfQuotingSuppliers = 0)) then
    begin
      exit;
    end
    else
    begin
      //price has been entered and selected as the chosen quote.
      Enquiry.Line.Quantities[Col - 1].SupplierPrice := Enquiry.Line.PriceGrid[Col - 1, Row - 1].SupplierPrice;
      if Enquiry.Line.Quantities[Col - 1].QuotePrice = 0.00 then
        Enquiry.Line.Quantities[Col - 1].QuotePrice := Enquiry.Line.PriceGrid[Col - 1, Row - 1].SupplierPrice;
      Enquiry.Line.Quantities[Col - 1].Supplier.SupplierNo := Enquiry.Line.QuotingSuppliers[Row - 1].SupplierNo;
      Enquiry.Line.Quantities[Col - 1].Supplier.Branch.BranchNo := Enquiry.Line.QuotingSuppliers[Row - 1].Branch.BranchNo;
      Enquiry.Line.Quantities[Col - 1].PriceUnit.PriceUnit := Enquiry.Line.PriceGrid[Col - 1, Row - 1].PriceUnit;
      Enquiry.Line.Quantities[Col - 1].PriceUnit.Load;

      Enquiry.Line.RunOnCost := Enquiry.Line.QuotingSuppliers[Row - 1].SupplierResponse.RunOnPrice;
      Enquiry.Line.RunOnQuantity := Enquiry.Line.QuotingSuppliers[Row - 1].SupplierResponse.RunOnQuantity;

      for suppInx := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
      begin
        Enquiry.Line.PriceGrid[Col - 1, suppInx].PriceSelected := false;
      end;

      Enquiry.Line.PriceGrid[Col - 1, Row - 1].PriceSelected := true;
      Enquiry.Line.Quantities[Col - 1].Modified := true;
      Enquiry.DetailsModified := true;

      DisplayPrices;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.EnterSupplierPrices;
var
  x: integer;
  SuppRespFrm: TPBEnqSuppRespnsFrm;
begin
  with strgrdSupplierPrices do
  begin
    if ((Col > 0) and (Row > 0) and
      (Col <= Enquiry.Line.NoOfQuantities) and
      (Row <= Enquiry.Line.NoOfQuotingSuppliers))  then
    begin
      if Enquiry.Line.PriceGrid[Col - 1, Row - 1].ResponseQuantity = 0 then
        Enquiry.Line.PriceGrid[Col - 1, Row - 1].ResponseQuantity :=
          Enquiry.Line.Quantities[Col - 1].Quantity;

      SuppRespFrm := TPBEnqSuppRespnsFrm.Create(Self);
      SuppRespFrm.Enquiry := Enquiry;
      SuppRespFrm.SuppInx := Row -1;

      //if there is more than one quantity run on's don't apply, so hide the edit box
       if Enquiry.Line.NoOfQuantities > 1 then
         SuppRespFrm.ShowRunOn := False
       else
         SuppRespFrm.ShowRunOn := true;

      SuppRespFrm.ShowModal;

      DisplayPrices;
      SuppRespFrm.Free;
    end;
  end;
end;

procedure TPBMaintEnquiryFrm.EnterSupplierPrices1Click(Sender: TObject);
begin
  Self.EnterSupplierPrices();
end;

procedure TPBMaintEnquiryFrm.strgrdSupplierPricesKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;}
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintEnquiryFrm.strgrdSupplierPricesSetEditText(
  Sender: TObject; ACol, ARow: Integer; const Value: String);
var
  tempStr: string;
  tempFlt: double;
begin
  if Pos('£', Value) = 1 then
    tempStr := Copy(Value, 2, Length(Value))
  else
    tempStr := Value;

  try
    tempFlt := StrToFloatDef(tempStr, 0, FormatSettings);
  except
    tempFlt := 0.00;
  end;

  Enquiry.Line.PriceGrid[ACol-1, ARow-1].SupplierPrice := tempFlt;

  Enquiry.Line.QuotingSuppliers[ARow-1].SupplierResponse.Modified := true;
  Enquiry.DetailsModified := true;
end;

procedure TPBMaintEnquiryFrm.btbtnAddQuantityClick(Sender: TObject);
var
  aLineQuantity: TLineQuantity;
  newQty: double;
  tempStr: string;
  qtyInx: integer;
begin
  tempStr := InputBox('Add Quantity', 'Enter the quantity to add.', '');

  try
    newQty := StrToFloatDef(tempStr, 0, FormatSettings);
  except
    newQty := 0.00;
  end;

  //check to see if qty already exists
  for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    if newQty = Enquiry.Line.Quantities[qtyInx].Quantity then
    begin
      //qty already exists so just drop out of procedure
      exit;
    end;
  end;

  if newQty <> 0.00 then
  begin
    //new quantity, create it and put it in in the correct place,
    //quantities are added in ascending order.
    aLineQuantity := TLineQuantity.Create;
    aLineQuantity.Quantity := newQty;
    aLineQuantity.SupplierPrice := 0.00;
    aLineQuantity.QuotePrice := 0.00;
    aLineQuantity.PriceUnit.PriceUnit := 1;
    aLineQuantity.LowestPriceIndex := 0;
    aLineQuantity.NewLineQuantity := true;
    aLineQuantity.Modified := false;
    aLineQuantity.Deleted := false;

    if Enquiry.Line.NoOfQuantities = 0 then
    begin
      //no other quantities so just put new one at the start.
      Enquiry.Line.InsertQuantity(0, aLineQuantity);
      Enquiry.Line.InsertPrices(0);
    end
    else
    begin
      if aLineQuantity.Quantity > Enquiry.Line.Quantities[Enquiry.Line.NoOfQuantities - 1].Quantity then
      begin
        //new one is  bigger than all of the others so stick it at the end
        Enquiry.Line.AddQuantity(aLineQuantity);
        Enquiry.Line.InsertPrices(Enquiry.Line.NoOfQuantities - 1);
      end
      else
      begin
        for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
        begin
          if aLineQuantity.Quantity < Enquiry.Line.Quantities[qtyInx].Quantity then
          begin
            //have to loop thru to see where new quantity fits in, some where
            //in the middle.
            Enquiry.Line.InsertQuantity(qtyInx, aLineQuantity);
            Enquiry.Line.InsertPrices(qtyInx);
            break;
          end;
        end;
      end;
    end;
    Self.DisplayPrices;
    Enquiry.DetailsModified := true;
  end;
end;

procedure TPBMaintEnquiryFrm.cmbbxPriceUnitCloseUp(Sender: TObject);
begin
  strgrdQuotePrices.Cells[strgrdQuotePrices.Col, 4] := cmbbxPriceUnit.Text;
  Enquiry.Line.Quantities[strgrdQuotePrices.Col - 1].PriceUnit.PriceUnit :=
          PBEnqDM.GetPriceUnitSQL.FieldByName('Price_Unit').AsInteger;

  Enquiry.Line.Quantities[strgrdQuotePrices.Col - 1].PriceUnit.Description :=
          PBEnqDM.GetPriceUnitSQL.FieldByName('Description').AsString;

  Enquiry.Line.Quantities[strgrdQuotePrices.Col - 1].PriceUnit.UnitFactor :=
          PBEnqDM.GetPriceUnitSQL.FieldByName('Price_Unit_Factor').AsFloat;

  //prices have been modofied so
  Enquiry.Line.Quantities[strgrdQuotePrices.Col - 1].Modified := true;
  Enquiry.DetailsModified := true;

  cmbbxPriceUnit.Visible := false;
  cmbbxPriceUnit.SendToBack;
end;

end.
