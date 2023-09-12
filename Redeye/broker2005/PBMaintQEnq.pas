unit PBMaintQEnq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, DBCtrls, PBEnquiryDataMod, CCSCommon, Menus,
  FireDAC.Stan.Param;

type
  TPBMaintQEnqFrm = class(TForm)
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    mmLineNarrative: TMemo;
    Label10: TLabel;
    PriceGrid: TStringGrid;
    edtProdType: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtCustomer: TEdit;
    Label14: TLabel;
    edtDescription: TEdit;
    spdbtnLUCust: TButton;
    Label15: TLabel;
    edtdatePoint: TEdit;
    EnqDateBtn: TSpeedButton;
    DateBtn: TSpeedButton;
    edtDateRequired: TEdit;
    Label16: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    btbtnOK: TBitBtn;
    CancelBitBtn: TBitBtn;
    PriceUnitComboBox: TDBLookupComboBox;
    spdbtnLUProdType: TButton;
    PriceUnitSpeedBtn: TButton;
    Label4: TLabel;
    spdbtnLURep: TButton;
    Label3: TLabel;
    edtSupplier: TEdit;
    SupplierSpeedBtn: TButton;
    Label6: TLabel;
    lblEnqNo: TLabel;
    cmbbxContactList: TComboBox;
    cmbbxRepList: TComboBox;
    cmbbxOperators: TComboBox;
    ContactSpeedButton: TButton;
    btnConvert: TButton;
    ppmnPrices: TPopupMenu;
    DeleteQuantity1: TMenuItem;
    DeleteAllQuantities1: TMenuItem;
    lblRunOn: TLabel;
    edtRunOnQty: TEdit;
    edtRunOnPrice: TEdit;
    edtRunOnCost: TEdit;
    lblRunOnPrice: TLabel;
    lblRunOnCost: TLabel;
    lblRunOnQty: TLabel;
    procedure spdbtnLUCustClick(Sender: TObject);
    procedure spdbtnLUCustContactClick(Sender: TObject);
    procedure edtDateRequiredExit(Sender: TObject);
    procedure edtdatePointExit(Sender: TObject);
    procedure EnqDateBtnClick(Sender: TObject);
    procedure DateBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spdbtnLUProdTypeClick(Sender: TObject);
    procedure cmbbxContactListClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure edtProdTypeChange(Sender: TObject);
    procedure edtCustomerChange(Sender: TObject);
    procedure PriceUnitComboBoxClick(Sender: TObject);
    procedure PriceUnitSpeedBtnClick(Sender: TObject);
    procedure btbtnOKClick(Sender: TObject);
    procedure SupplierSpeedBtnClick(Sender: TObject);
    procedure PriceGridKeyPress(Sender: TObject; var Key: Char);
    procedure PriceGridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure spdbtnLURepClick(Sender: TObject);
    procedure ContactSpeedBtnClick(Sender: TObject);
    procedure cmbbxContactListChange(Sender: TObject);
    procedure cmbbxRepListChange(Sender: TObject);
    procedure cmbbxOperatorsChange(Sender: TObject);
    procedure PriceGridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure PriceUnitComboBoxCloseUp(Sender: TObject);
    procedure mmLineNarrativeExit(Sender: TObject);
    procedure ContactSpeedButtonClick(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure DeleteQuantity1Click(Sender: TObject);
    procedure DeleteAllQuantities1Click(Sender: TObject);
    procedure edtRunOnQtyKeyPress(Sender: TObject; var Key: Char);
    procedure edtRunOnPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edtRunOnCostKeyPress(Sender: TObject; var Key: Char);
    procedure edtRunOnQtyChange(Sender: TObject);
    procedure edtRunOnPriceChange(Sender: TObject);
    procedure edtRunOnCostChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PriceGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    loadingDetails: boolean; //set to true when the form is being filled with enquiry data
    //this stops the onChange event handlers firing and setting TEnquiry.modified to true
    //when nothing has actually changed
    procedure EnableOK;
    procedure GetCustomerReps;
    procedure GetOperators;
    procedure GetPriceUnits;
    procedure Initialise;
    procedure DisplayHeaderInfo;
    function OKtoSave: boolean;
    procedure RefreshContactList(CustNo, BrnchNo, ContactNo: integer);
    procedure RefreshRepList(CustNo, BrnchNo: integer);
    procedure RefreshOfficeContactList();
    procedure UpdateLineNarrative;
    procedure DisplayLineDetails;
    procedure DisplayLineNarrative;
    procedure DisplayPrices;
    procedure UpdateEnqParts;
    procedure UpdateEnqLine;
    procedure EnableRunOnDisplay(enabled: boolean);
  public
    { Public declarations }
    Enquiry: TEnquiryQuote;
  end;

var
  PBMaintQEnqFrm: TPBMaintQEnqFrm;

implementation

uses
  System.UITypes,
  PBLUCust, PBLUCConta, DateSelV5, PBLUPrdTyp,
  PBMainMenu, PBLUPriceUnit, PBNarrativeDM, PBLUSupp, PBLUCRep, PBLUSConta,
  PBEnqSelSup, PBDatabase;

{$R *.DFM}

procedure TPBMaintQEnqFrm.spdbtnLUCustClick(Sender: TObject);
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

        //The form reference will be invalid for another customer
        Enquiry.Line.FormReference.Clear;
        //And so will the REP
        Enquiry.Rep.RepNo := PBEnqDM.GetDefCustRep(Enquiry.Customer.CustomerNo,
          Enquiry.CustomerBranch.BranchNo);
        Enquiry.Rep.Load;
      end;

      RefreshContactList(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo, Enquiry.contact.contactno);
      ContactSpeedButton.Enabled := true;
      //if PBEnqDM.IsCustomerOnStop(Enquiry.Customer.CustomerNo) then
      //  MessageDlg('This Customer is currently ON STOP', mtWarning,[mbOk], 0);
      Enquiry.DetailsModified := true;
      Enquiry.Modified := true;
      DisplayHeaderInfo;
      btbtnOK.Enabled := OKtoSave;
    end;
  finally
    PBLUCustFrm.Free;
  end;

end;

procedure TPBMaintQEnqFrm.GetCustomerReps;
begin
{*  with PBEnqDM.GetCustRepSQL do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Branch_no').asinteger := BranchNo;
      open;
      first;
      if recordcount = 1 then
        RepComboBox.keyvalue := fieldbyname('Rep').asinteger
      else
        RepComboBox.keyvalue := RepCode;
    end;
  RepSpeedButton.enabled := true;         *}
end;

procedure TPBMaintQEnqFrm.GetOperators;
begin
{*  with PBEnqDM.GetOpSQL do
    begin
      close;
      open;
      first
    end;     *}
end;

procedure TPBMaintQEnqFrm.GetPriceUnits;
begin
  with PBEnqDM.GetPriceUnitSQL do
    begin
      close;
      open;
      first
    end;
end;

procedure TPBMaintQEnqFrm.spdbtnLUCustContactClick(Sender: TObject);
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

procedure TPBMaintQEnqFrm.EnableOK;
begin
{*  OKBitBtn.Enabled := false;
  if  (CustomerEdit.text = '') or
      (ContactComboBox.keyvalue = 0) or
      (RepComboBox.keyvalue = 0) or
      (EnqDateEdit.text = '') or
      (ReqbyDateEdit.text = '') or
      (DescriptionEdit.text = '') or
      (ProductTypeEdit.text = '') or
      (NotesMemo.text = '') or
      (SupplierEdit.text = '') or
      (PriceUnitComboBox.keyvalue = null) then exit;
  OKBitBtn.Enabled := true;    *}
end;

procedure TPBMaintQEnqFrm.edtDateRequiredExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDateRequired.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDateRequired.SetFocus;
      Exit;
    end;
  end;

  edtDateRequired.Text := PBDatestr(NewDate);
  Enquiry.Line.ReqResponseDate := NewDate;
  Enquiry.QuoteReqBy := NewDate;
  Enquiry.Modified := true;
  Enquiry.Line.Modified := true;
  Enquiry.DetailsModified := true;
end;

procedure TPBMaintQEnqFrm.edtdatePointExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(edtDatePoint.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtDatePoint.SetFocus;
      Exit;
    end;
  end;

  edtDatePoint.Text := PBDatestr(NewDate);
  Enquiry.DatePoint := NewDate;
  Enquiry.Modified := true;
  Enquiry.DetailsModified := true;
end;

procedure TPBMaintQEnqFrm.EnqDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := PBDatestr(edtDatePoint.text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      Enquiry.DatePoint := DateSelV5Form.Date;
      Enquiry.Modified := true;
      Enquiry.DetailsModified := true;
      edtDatePoint.Text := PBDatestr(DateSelV5Form.Date);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintQEnqFrm.DateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := PBDatestr(edtDateRequired.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      Enquiry.Line.ReqResponseDate := DateSelV5Form.Date;
      Enquiry.QuoteReqBy := DateSelV5Form.Date;
      Enquiry.Modified := true;
      Enquiry.Line.Modified := true;
      Enquiry.DetailsModified := true;
      edtDateRequired.Text := PBDateStr(DateSelV5Form.Date);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintQEnqFrm.FormShow(Sender: TObject);
begin
  self.loadingDetails := true;
  PriceUnitComboBox.KeyValue := '1';
  GetPriceUnits;
  DisplayHeaderInfo;
  DisplayLineDetails;
  DisplayPrices;
  self.loadingDetails := false;
  //Enquiry.DetailsModified := false;
  //Enquiry.Modified := false;
  //Enquiry.Line.Modified := false;
end;

procedure TPBMaintQEnqFrm.spdbtnLUProdTypeClick(Sender: TObject);
begin
{*  PBLUPrdTypfrm := TPBLUPrdTypfrm.Create(Owner);
  PBLUPrdTypfrm.bIs_Lookup := True;
  PBLUPrdTypfrm.bAllow_Upd := True;

  PBLUPrdTypfrm.Selcode := ProductType;

  PBLUPrdTypfrm.ShowModal;
  if PBLUPrdTypfrm.selected then
  begin
    ProductType := PBLUPrdTypfrm.Selcode;
    ProductTypeEdit.Text := PBLUPrdTypfrm.SelName;
  end;
            *}
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
    end;
  finally
    PBLUPrdTypFrm.Free;
  end;
  btbtnOK.Enabled := OKtoSave;
end;

procedure TPBMaintQEnqFrm.Initialise;
var
  irow: integer;
begin
{*  EnqDateEdit.text := PBDateStr(date);
  ReqbyDateEdit.text := PBDateStr(date);

  //Set the price grid column headings
  with PriceGrid do
    begin
      cells[1,0] := 'Quantity';
      cells[2,0] := 'Price';
      cells[3,0] := 'Cost';

      for irow := 1 to 50 do
        begin
          cells[0,irow] := inttostr(irow);
        end;
    end;

  OperatorComboBox.keyvalue := PBMenuMainfrm.iOperator;   *}
end;

procedure TPBMaintQEnqFrm.cmbbxContactListClick(Sender: TObject);
begin
{*  Contact := ContactComboBox.KeyValue;
  EnableOK;                          *}
end;

procedure TPBMaintQEnqFrm.edtDescriptionChange(Sender: TObject);
begin
  if not self.loadingDetails then
  begin
    Enquiry.Line.FormDescription := edtDescription.Text;
    Enquiry.Description := edtDescription.Text;
    Enquiry.DetailsModified := true;
    Enquiry.Line.Modified := true;
    Enquiry.Modified := true;
  end;
  btbtnOK.Enabled := OKtoSave;
end;

procedure TPBMaintQEnqFrm.edtProdTypeChange(Sender: TObject);
begin
//  enableok;
end;

procedure TPBMaintQEnqFrm.edtCustomerChange(Sender: TObject);
begin
 // Enableok;
end;

procedure TPBMaintQEnqFrm.PriceUnitComboBoxClick(Sender: TObject);
begin
 // enableok;
end;

procedure TPBMaintQEnqFrm.PriceUnitSpeedBtnClick(Sender: TObject);
begin
  PBLUPriceUnitFrm := TPBLUPriceUnitFrm.Create(Self);
  try
    PBLUPriceUnitFrm.bIs_Lookup := True;
    PBLUPriceUnitFrm.bAllow_Upd := True;

    if PriceUnitComboBox.keyvalue = 0 then
      PBLUPriceUnitFrm.SelCode := ''
    else
      PBLUPriceUnitFrm.SelCode := PriceUnitComboBox.keyvalue;

    PBLUPriceUnitFrm.ShowModal;
    if PBLUPriceUnitFrm.selected then
      begin
        PriceUnitComboBox.keyvalue := PBLUPriceUnitFrm.Selcode;
      end;
  finally
    PBLUPriceUnitFrm.Free;
  end
end;

procedure TPBMaintQEnqFrm.btbtnOKClick(Sender: TObject);
var
  saveResult: boolean;
  savePrompt: word;
begin
  //check that required fields have been entered
  if ((Enquiry.Customer.CustomerNo = 0) or
     (Enquiry.Contact.ContactNo = 0 )) then
  begin
    MessageDlg('You must select a customer and customer contact before saving.',
        mtWarning, [mbOK], 0);
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
      begin
        Self.ModalResult := mrYes;
      end;
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

procedure TPBMaintQEnqFrm.SupplierSpeedBtnClick(Sender: TObject);
var
  cpbltyInx, suppInx, qtyInx: integer;
  iItem: Integer;
  supplierSelectForm: TPBEnqSelSupfrm;
  aQuoteSupplier: TSupplier;
  StillOnlist, tooManySuppliers: boolean;
  tempFlt: double;
begin
  //Create the Supplier Selection form
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bAllow_Upd := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.SelCode := Enquiry.Line.SelectedSupplier.SupplierNo;
    PBLUSuppFrm.SelBranch := Enquiry.Line.SelectedSupplier.Branch.BranchNo;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      {If the Supplier has changed then clear the contact details}
      if (Enquiry.Line.SelectedSupplier.SupplierNo <> PBLUSuppFrm.SelCode) or
          (Enquiry.Line.SelectedSupplier.Branch.BranchNo <> PBLUSuppFrm.SelBranch) then
      begin
        Enquiry.Line.SelectedSupplier.SupplierNo := PBLUSuppFrm.SelCode;
        Enquiry.Line.SelectedSupplier.Load;
        Enquiry.Line.SelectedSupplier.Branch.BranchNo := PBLUSuppFrm.SelBranch;
        Enquiry.Line.SelectedSupplier.Branch.Load(Enquiry.Line.SelectedSupplier.SupplierNo);
        edtSupplier.Text := PBLUSuppFrm.SelName+'/'+PBLUSuppFrm.SelBranchName;

        //clear out any existing suppliers
        for suppInx := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
        begin
          Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Deleted := true;
        end;

        Enquiry.Line.AddQuoteSupplier;
        Enquiry.Line.NewPriceRow;

        suppInx := Enquiry.Line.NoOfQuotingSuppliers - 1;
        Enquiry.Line.QuotingSuppliers[suppInx].SupplierNo := PBLUSuppFrm.SelCode;
        Enquiry.Line.QuotingSuppliers[suppInx].Load;
        Enquiry.Line.QuotingSuppliers[suppInx].Branch.BranchNo := PBLUSuppFrm.SelBranch;
        Enquiry.Line.QuotingSuppliers[suppInx].Branch.Load(PBLUSuppFrm.SelCode);

        Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ActResponseDate := date;

        //loop thru quantities and set the supplier for each
        for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
        begin
          Enquiry.Line.Quantities[qtyInx].Supplier.SupplierNo :=
            Enquiry.Line.QuotingSuppliers[suppInx].SupplierNo;
          Enquiry.Line.Quantities[qtyInx].Supplier.Branch.BranchNo :=
            Enquiry.Line.QuotingSuppliers[suppInx].Branch.BranchNo;
          //push the selling prices from the grid thru to the marked up prices
          //for responses for each quantity
          try
            tempFlt := StrToFloatDef(PriceGrid.Cells[2, qtyInx+1], 0, FormatSettings)
          except
            tempFlt := 0.00;
          end;
          Enquiry.Line.PriceGrid[qtyInx, suppInx].MarkedUpPrice := tempFlt;
            
          Enquiry.Line.Quantities[qtyInx].Modified := true;
        end;

        Enquiry.DetailsModified := true;
        Enquiry.Line.Modified := true;
        PriceGrid.Enabled := true;
        Self.DisplayPrices;
      end;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
  EnableOK;
end;

procedure TPBMaintQEnqFrm.PriceGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (Acol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
    end;

    {If Heading Display Left justified in the cells}
    with PriceGrid do
    begin
      const Gap = 4;
      var Text := Cells[ACol, ARow];
      var WidthOfText := Canvas.TextWidth(Text);
      var WidthOfCell := ColWidths[ACol];
      var LeftOffset := WidthOfCell - WidthOfText - Gap;

      if ACol = 0 then
      begin
        if gdFixed in State then
          Canvas.Brush.Color := PriceGrid.FixedColor else
          if gdSelected in State then
            Canvas.Brush.Color := $00FFF0E1 else
            Canvas.Brush.Color := clWindow;
        Canvas.FillRect(Rect);
        Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
      end
      else
      begin
        {Display the Columns Right justified in the cells}
        if gdFixed in State then
          Canvas.Brush.Color := PriceGrid.FixedColor else
          if gdSelected in State then
            Canvas.Brush.Color := $00FFF0E1 else
            Canvas.Brush.Color := clWindow;
        Canvas.FillRect(Rect);
        Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
      end;
    end;
  end;
end;

procedure TPBMaintQEnqFrm.PriceGridKeyPress(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {    				'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;
    }
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace};
    #13:
      begin
        if PriceGrid.Col = 3 then
        begin
          PriceGrid.Col := 1;
          PriceGrid.Row := PriceGrid.Row + 1;
        end
        else
        begin
          if PriceGrid.Cells[PriceGrid.Col, PriceGrid.Row] = '' then
          begin
            PriceGrid.Row := 1;
          end
          else
          begin
            PriceGrid.Col := PriceGrid.Col + 1;
          end;
        end;
      end;
  else
    Key := #0;
  end;

end;

procedure TPBMaintQEnqFrm.PriceGridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  irow, icol: integer;
begin
  with Sender as TStringGrid do
  begin
    for icol := 2 to 3 do
      for irow := 1 to 50 do
      begin
        if cells[icol, irow] = '' then continue;
        cells[icol, irow] := formatfloat('0.00',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
      end;
  end;

  //if the user click on one of the existing quantities stop them editing it.
  //Leave it uneditable if the price unit combo box is disabled - screen is in view mode} ;
  if (((ACol = 1)  and ((ARow) < (PriceGrid.RowCount-1)))) or (not PriceUnitComboBox.Enabled) then
    PriceGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goTabs]
  else
    PriceGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goEditing,goTabs];
end;

procedure TPBMaintQEnqFrm.spdbtnLURepClick(Sender: TObject);
begin
(*  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    PBLUCRepFrm.bAllow_Upd := True;

    PBLUCRepFrm.icust := Customer;
    PBLUCRepFrm.iBranch := Branchno;
    PBLUCRepFrm.sCustName := Customeredit.Text;
    PBLUCRepFrm.sBranchName := Branchedit.Text;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      RepCode := PBLUCRepFrm.SelCode;
    end;
    GetCustomerReps;
  finally
    PBLUCRepFrm.Free;
  end;
  EnableOK; *)
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    PBLUCRepFrm.bAllow_Upd := True;

    PBLUCRepFrm.icust := Enquiry.Customer.CustomerNo;
    PBLUCRepFrm.iBranch := Enquiry.CustomerBranch.BranchNo;
    PBLUCRepFrm.sCustName := Enquiry.Customer.CustName;
    PBLUCRepFrm.sBranchName := Enquiry.CustomerBranch.BranchName;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      Enquiry.Rep.RepNo := PBLUCRepFrm.SelCode;
      Enquiry.Rep.Load();
      Enquiry.DetailsModified := True;
      Enquiry.Modified := True;
      RefreshRepList(Enquiry.Customer.CustomerNo,Enquiry.CustomerBranch.BranchNo);
    end;
  finally
    PBLUCRepFrm.Free;
  end;
end;

procedure TPBMaintQEnqFrm.ContactSpeedBtnClick(Sender: TObject);
begin
{*
  PBLUSContaFrm := TPBLUSContaFrm.Create(Self);
  try
    PBLUSContaFrm.bIs_Lookup := True;
    PBLUSContaFrm.bAllow_Upd := True;
    try
      PBLUSContaFrm.SelCode := strtoint(SuppContact);
    except
      PBLUSContaFrm.SelCode := 0;
    end;

    PBLUSContaFrm.iSupp := Enquiry.Line.SelectedSupplier.SupplierNo;
    PBLUSContaFrm.iBranch := Enquiry.Line.SelectedSupplier.Branch.BranchNo;
    PBLUSContaFrm.sSuppName := Enquiry.Line.SelectedSupplier.Name;
    PBLUSContaFrm.sBranchName := Enquiry.Line.SelectedSupplier.Branch.Name;
    PBLUSContaFrm.ShowModal;
    if PBLUSContaFrm.bSelected then
    begin
      SuppContact := inttostr(PBLUSContaFrm.SelCode);
      ContactEdit.text := PBLUSContaFrm.SelName;
    end;
  finally
    PBLUSContaFrm.Free;
  end;  *}
end;

procedure TPBMaintQEnqFrm.DisplayHeaderInfo;
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
  if Enquiry.Customer.CustName <> '' then
    ContactSpeedButton.Enabled := true;
  RefreshContactList(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo, Enquiry.Contact.ContactNo);

  if cmbbxContactList.Items.IndexOf(Enquiry.Contact.Name) <> -1 then
    cmbbxContactList.ItemIndex := cmbbxContactList.Items.IndexOf(Enquiry.Contact.Name)
  else if cmbbxContactList.Items.Count > 0 then
  begin
    cmbbxContactList.ItemIndex := 0;
    Enquiry.Contact.Name := cmbbxContactList.Text;
    Enquiry.Contact.GetContactNoByName(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);
    Enquiry.CustEstContact := Enquiry.Contact.Name;
  end
  else
  begin
    cmbbxContactList.ItemIndex := -1;
  end;

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
    begin
      cmbbxRepList.ItemIndex := -1
    end
    else
    begin
      cmbbxRepList.ItemIndex := 0;
      Enquiry.Rep.Name := cmbbxRepList.Text;
      Enquiry.Rep.GetRepNoByName;
    end;
  end
  else
  begin
    //display the rep in the cmbbx
    cmbbxRepList.ItemIndex := cmbbxRepList.Items.IndexOf(Enquiry.Rep.Name);
  end;
    
  RefreshOfficeContactList();
  cmbbxOperators.ItemIndex := cmbbxOperators.Items.IndexOf(Enquiry.OfficeContact.Name);
end;

function TPBMaintQEnqFrm.OKtoSave: boolean;
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

  if cmbbxRepList.Text = '' then
  begin
    Result := false;
    exit;
  end;
end;

procedure TPBMaintQEnqFrm.RefreshContactList(CustNo, BrnchNo, ContactNo: integer);
begin
  with PBEnqDM.GetCustContSQL do
  begin
    Close;
    ParamByName('Customer').asInteger := CustNo;
    ParamByName('Branch_No').asInteger := BrnchNo;
    ParamByName('Contact_No').asInteger := ContactNo;
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

procedure TPBMaintQEnqFrm.RefreshOfficeContactList;
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

procedure TPBMaintQEnqFrm.RefreshRepList(CustNo, BrnchNo: integer);
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

procedure TPBMaintQEnqFrm.UpdateLineNarrative;
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
  end;        *)
  Enquiry.DetailsModified := True;
  Enquiry.Line.Narrative.Updated := True;
  Enquiry.Line.modified := True;
end;

procedure TPBMaintQEnqFrm.DisplayLineDetails;
begin
  with Enquiry.Line do
  begin
    edtDescription.Text := FormDescription;
    edtProdType.text := ProductType.Description;
    DisplayLineNarrative;
  end;
end;

procedure TPBMaintQEnqFrm.DisplayLineNarrative;
var
  x: integer;
  tempStr: string;
begin
  mmLineNarrative.Lines.Clear;
  mmLineNarrative.Text := Enquiry.Line.Narrative.DataInfo;
  (*
  for x := 0 to (Enquiry.Line.Narrative.Lines.Count - 1) do
  begin
    tempStr := Enquiry.Line.Narrative.Lines[x];
    mmLineNarrative.Lines.Add(tempStr);
  end; *)
end;

procedure TPBMaintQEnqFrm.cmbbxContactListChange(Sender: TObject);
begin
  if not self.loadingDetails then
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
end;

procedure TPBMaintQEnqFrm.cmbbxRepListChange(Sender: TObject);
begin
  if not self.loadingDetails then
  begin
    Enquiry.Rep.Name := cmbbxRepList.Items[cmbbxRepList.ItemIndex];
    //we have the reps name but the item index may not be the rep no
    //so query database to find the rep no based on the rep name.
    Enquiry.Rep.GetRepNoByName;
    Enquiry.DetailsModified := true;
    Enquiry.Modified := true;
  end;
  btbtnOK.Enabled := OKtoSave;
end;

procedure TPBMaintQEnqFrm.cmbbxOperatorsChange(Sender: TObject);
begin
  if not self.loadingDetails then
  begin
    Enquiry.OfficeContact.Name := cmbbxOperators.Items[cmbbxOperators.ItemIndex];
    //we have the operators name but the item index may not be the operator no
    //so query database to find the operator no based on the operator name.
    Enquiry.OfficeContact.GetOpNoByName;
    Enquiry.DetailsModified := true;
    Enquiry.Modified := true;
  end;
end;

procedure TPBMaintQEnqFrm.DisplayPrices;
var
  qtyInx,suppInx,x,qtyCount: integer;
begin
  PriceGrid.Cells[1,0] := 'Quantities';
  PriceGrid.Cells[2,0] := 'Sell Price';
  PriceGrid.Cells[3,0] := 'Buy Price';

  edtSupplier.Text :=  Enquiry.Line.SelectedSupplier.Name +
                           '/' +
                           Enquiry.Line.SelectedSupplier.Branch.Name;

  if edtSupplier.text = '/' then
    edtSupplier.text := '';

  PriceGrid.RowCount := Enquiry.Line.NoOfQuantities + 2;
  if Enquiry.Line.NoOfQuantities <> 0 then
    PriceUnitComboBox.KeyValue := Enquiry.Line.Quantities[0].PriceUnit.PriceUnit;

  suppInx := Enquiry.Line.NoOfQuotingSuppliers -1;

  qtyCount := 0;
  for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    if Enquiry.Line.Quantities[qtyInx].Deleted then
    begin
      PriceGrid.RowHeights[qtyInx + 1] := 0;
    end
    else
    begin
      qtyCount := qtyCount + 1;
      PriceGrid.Cells[0, qtyInx+1] := IntToStr(qtyCount);
      PriceGrid.Cells[1, qtyInx+1] :=
        FloatToStr(Enquiry.Line.Quantities[qtyInx].Quantity);
      PriceGrid.Cells[2, qtyInx+1] :=
        FloatToStrF(Enquiry.Line.Quantities[qtyInx].QuotePrice, ffFixed, 15 ,2);
      PriceGrid.Cells[3, qtyInx+1] :=
        FloatToStrF(Enquiry.Line.PriceGrid[qtyInx, suppInx].SupplierPrice, ffFixed, 15, 2);
    end;
  end;

  if (Enquiry.Line.NoOfQuotingSuppliers > 0) then
  begin
    PriceGrid.Enabled := true;

    self.EnableRunOnDisplay(self.Enquiry.Line.NoOfActualQuantities < 2);
  end;
end;

procedure TPBMaintQEnqFrm.PriceGridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var
  tempFlt: double;
  allPricesSet, somePricesSet: boolean;
  qtyInx, suppInx: integer;
begin
  try
    tempFlt := StrToFloatDef(value, 0, FormatSettings);
  except
    tempFlt := 0.00
  end;

  if ((ARow + 1) = (Sender as TStringGrid).RowCount) and (value = '') then
  begin
    exit;
  end;

  if ((ARow + 1) = (Sender as TStringGrid).RowCount) then
  begin
    if ARow > 1 then
    begin
      (Sender as TStringGrid).Cells[0,ARow] :=
        IntToStr((StrToInt((Sender as TStringGrid).Cells[0,ARow-1])) + 1)
    end
    else
    begin
      (Sender as TStringGrid).Cells[0,ARow] := '1';
    end;
    Enquiry.Line.InsertQuantity;
    Enquiry.Line.Quantities[Arow - 1].Supplier.SupplierNo :=
      Enquiry.Line.QuotingSuppliers[0].SupplierNo;
    Enquiry.Line.Quantities[ARow - 1].Supplier.Branch.BranchNo :=
      Enquiry.Line.QuotingSuppliers[0].Branch.BranchNo;
    (Sender as TStringGrid).RowCount := (Sender as TStringGrid).RowCount + 1;
    Enquiry.Line.NewPriceRow;
  end;
  suppInx := Enquiry.Line.NoOfQuotingSuppliers - 1;
  case ACol of
    1:
    begin
      Enquiry.Line.Quantities[ARow - 1].Quantity := tempFlt;
      Enquiry.Line.PriceGrid[ARow - 1, suppInx].ResponseQuantity := tempFlt;
    end;
    2:
    begin
      Enquiry.Line.Quantities[ARow - 1].QuotePrice := tempFlt;
      Enquiry.Line.PriceGrid[ARow - 1, suppInx].MarkedUpPrice := tempFlt;
    end;
    3:
    begin
      Enquiry.Line.Quantities[ARow - 1].SupplierPrice := tempFlt;
      Enquiry.Line.PriceGrid[ARow - 1, suppInx].SupplierPrice := tempFlt;
    end;
  end;
  Enquiry.Line.PriceGrid[ARow - 1, suppInx].PriceSelected := true;
  Enquiry.Line.PriceGrid[ARow - 1, suppInx].PriceUnitDesc := PriceUnitComboBox.Text;
  Enquiry.Line.PriceGrid[ARow - 1, suppInx].PriceUnit := PBEnqDM.GetPriceUnitNo(Enquiry.Line.PriceGrid[ARow - 1, 0].PriceUnitDesc);
  Enquiry.Line.Quantities[ARow - 1].PriceUnit.PriceUnit := Enquiry.Line.PriceGrid[ARow - 1, 0].PriceUnit;
  Enquiry.Line.Quantities[ARow - 1].PriceUnit.Load;

  allPricesSet := true;
  somePricesSet := false;
  for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    if Enquiry.Line.Quantities[qtyInx].QuotePrice = 0.00 then
      allPricesSet := false
    else
      somePricesSet := true;
  end;

  if somePricesSet then
  begin
    if allPricesSet then
    begin
      Enquiry.EnquiryStatus := 50;
      Enquiry.Line.EnquiryStatus := 50;
    end
    else
    begin
      Enquiry.EnquiryStatus := 45;
      Enquiry.Line.EnquiryStatus := 45;
    end;
  end
  else
  begin
    Enquiry.EnquiryStatus := 10;
    Enquiry.Line.EnquiryStatus := 10;
  end;

  self.EnableRunOnDisplay(self.Enquiry.Line.NoOfActualQuantities < 2);

  Enquiry.DetailsModified := true;
  Enquiry.Line.Modified := true;
  Enquiry.Modified := true;
  Enquiry.Line.Quantities[ARow-1].Modified := True;
  Enquiry.Line.QuotingSuppliers[0].SupplierResponse.Modified := true;
end;

procedure TPBMaintQEnqFrm.PriceUnitComboBoxCloseUp(Sender: TObject);
var
  qtyInx: integer;
begin
  //if Value has changed then need to step thru supplier responses and reset the
  //price unit.
  for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    Enquiry.Line.Quantities[qtyInx].PriceUnit.PriceUnit :=
      PBEnqDM.PriceUnitSRC.DataSet.FieldByName('Price_Unit').asInteger;
    Enquiry.Line.Quantities[qtyInx].PriceUnit.Load;

    Enquiry.Line.PriceGrid[qtyInx, 0].PriceUnit :=
      PBEnqDM.PriceUnitSRC.DataSet.FieldByName('Price_Unit').asInteger;
    Enquiry.Line.Quantities[qtyInx].Modified := true;
  end;
  Enquiry.DetailsModified := true;
end;

procedure TPBMaintQEnqFrm.mmLineNarrativeExit(Sender: TObject);
begin
  UpdateLineNarrative;
end;

procedure TPBMaintQEnqFrm.ContactSpeedButtonClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := Enquiry.Customer.CustomerNo;
    PBLUCContaFrm.iBranch := Enquiry.CustomerBranch.BranchNo;
    PBLUCContaFrm.sCustName := Enquiry.Customer.CustName;
    PBLUCContaFrm.sBranchName := Enquiry.CustomerBranch.BranchName;
    PBLUCContaFrm.SelCode := Enquiry.Contact.ContactNo;
    PBLUCContaFrm.SelName := Enquiry.CustEstContact;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      Enquiry.Contact.ContactNo := PBLUCContaFrm.SelCode;
      Enquiry.Contact.Load(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);
      Enquiry.DetailsModified := true;
      Enquiry.Modified := true;
    end;
    RefreshContactList(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo, Enquiry.Contact.ContactNo);
    if cmbbxContactList.Items.IndexOf(Enquiry.Contact.Name) <> -1 then
      cmbbxContactList.ItemIndex := cmbbxContactList.Items.IndexOf(Enquiry.Contact.Name)
    else if cmbbxContactList.Items.Count > 0 then
    begin
      cmbbxContactList.ItemIndex := 0;
      Enquiry.Contact.Name := cmbbxContactList.Text;
      Enquiry.Contact.GetContactNoByName(Enquiry.Customer.CustomerNo, Enquiry.CustomerBranch.BranchNo);
      Enquiry.CustEstContact := Enquiry.Contact.Name;
    end
    else
    begin
      cmbbxContactList.ItemIndex := -1;
    end;

  finally
    PBLUCContaFrm.Free;
  end;
  EnableOK;
end;

procedure TPBMaintQEnqFrm.btnConvertClick(Sender: TObject);
var
  saveResult: boolean;
  savePrompt: word;
begin
  Enquiry.EnquiryType := '';
  Enquiry.DetailsModified := True;
  Enquiry.Modified := true;
  btnConvert.Enabled := false;

  //check that required fields have been entered
  if ((Enquiry.Customer.CustomerNo = 0) or
     (Enquiry.Contact.ContactNo = 0 )) then
  begin
    MessageDlg('You must select a customer and customer contact before saving.',
        mtWarning, [mbOK], 0);
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
      begin
//        UpdateEnqParts;
//        UpdateEnqLine;
        Self.ModalResult := mrYes;
      end;
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

procedure TPBMaintQEnqFrm.UpdateEnqParts;
begin
  with PBEnqDM.AddEnqLinePartSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := Enquiry.EnquiryNo;
      ParamByName('Line').AsInteger := 1;
      ParamByName('Part').AsInteger := 1;

      ParamByName('Part_Description').AsString := '';
      ParamByName('Heading').AsString := '';
      ParamByName('Same_As').AsInteger := 0;
      ParamByName('Brand').AsString := '';
      ParamByName('Material').AsString := '';
      ParamByName('Weight').AsString := '';
      ParamByName('Colour').AsString := '';
      ParamByName('Face').AsString := '';
      ParamByName('Reverse').AsString := '';
      ParamByName('L_Type').AsString := '';
      ParamByName('L_Width').AsString := '';
      ParamByName('R_Type').AsString := '';
      ParamByName('R_Width').AsString := '';
      ParamByName('Plates').AsInteger := 0;
      ExecSQL;
    end;
end;

procedure TPBMaintQEnqFrm.UpdateEnqLine;
begin
  with PBEnqDM.AddEnqLineSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := Enquiry.EnquiryNo;
    ParamByName('Line').AsInteger := 1;

    ParamByName('Desc').AsString := Enquiry.Description;
    ParamByName('Parts').AsInteger := 1;
    ParamByName('NCR').AsString := 'X';
    ParamByName('Depth').AsFloat := 0;
    ParamByName('D_Unit').AsString := 'mm';
    ParamByName('Width').AsFloat := 0;
    ParamByName('W_Unit').AsString := 'mm';
    ParamByName('Artwork').AsString := '';
    ParamByName('Forms').AsString := '';
    ParamByName('Plates').AsInteger := 0;
    ParamByName('Product').AsInteger := Enquiry.Line.ProductType.TypeNo;
    ParamByName('Status').AsInteger := 50;
    ParamByName('Response').AsDateTime := Now;
    ParamByName('Firm_Order').AsString := '';

    {Determine whether any narrative was entered against the line}
    ParamByName('Narrative').AsInteger := Enquiry.Line.Narrative.DbKey;
    ParamByName('Form_Reference').clear;
    ExecSQL;
  end;
end;

procedure TPBMaintQEnqFrm.DeleteQuantity1Click(Sender: TObject);
begin
  if ((priceGrid.Row) <= Enquiry.Line.NoOfQuantities) then
  begin
    Enquiry.Line.Quantities[PriceGrid.Row - 1].Deleted := true;
    Enquiry.DetailsModified := true;
    DisplayPrices;
  end;
end;

procedure TPBMaintQEnqFrm.DeleteAllQuantities1Click(Sender: TObject);
var
  qtyInx: integer;
begin
  for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    Enquiry.Line.Quantities[qtyInx].Deleted := true;
  end;
  Enquiry.DetailsModified := true;
  DisplayPrices;
end;

procedure TPBMaintQEnqFrm.EnableRunOnDisplay(enabled: boolean);
begin
    self.lblRunOn.enabled := enabled;
    self.lblRunOnQty.Enabled := enabled;
    self.lblRunOnPrice.Enabled := enabled;
    self.lblRunOnCost.Enabled := enabled;

    self.edtRunOnQty.Enabled := enabled;
    self.edtRunOnPrice.Enabled := enabled;
    self.edtRunOnCost.Enabled := enabled;

    if enabled then
    begin
      self.edtRunOnQty.Text := floatToStr(self.Enquiry.Line.RunOnQuantity);
      self.edtRunOnPrice.Text := floatToStrF(self.Enquiry.Line.RunOnPrice, ffFixed, 15, 2);
      self.edtRunOnCost.Text := floatToStrF(self.Enquiry.Line.RunOnCost, ffFixed, 15, 2);
    end
    else
    begin
      self.edtRunOnQty.Text := '';
      self.edtRunOnPrice.Text := '';
      self.edtRunOnCost.Text := '';
    end;
end;

procedure TPBMaintQEnqFrm.edtRunOnQtyKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', text);
  end;
  case key of
    {    				'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;
    }
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace};
  else
    Key := #0;
  end;
end;

procedure TPBMaintQEnqFrm.edtRunOnPriceKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', text);
  end;
  case key of
    {    				'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;
    }
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace};
  else
    Key := #0;
  end;
end;

procedure TPBMaintQEnqFrm.edtRunOnCostKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', text);
  end;
  case key of
    {    				'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;
    }
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace};
  else
    Key := #0;
  end;
end;

procedure TPBMaintQEnqFrm.edtRunOnQtyChange(Sender: TObject);
var
  suppInx: integer;
begin
  if not self.loadingDetails then
  begin
    suppInx := Self.Enquiry.Line.NoOfQuotingSuppliers - 1;
    if edtRunOnQty.Text <> '' then
    begin
      self.Enquiry.Line.RunOnQuantity := StrToFloatDef(edtRunOnQty.Text, 0, FormatSettings);
      self.Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.RunOnQuantity := StrToFloatDef(edtRunOnQty.Text, 0, FormatSettings);
      self.Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
      self.Enquiry.DetailsModified := true;
    end
    else
    begin
      self.Enquiry.Line.RunOnQuantity := 0.0;
    end;
    self.Enquiry.Line.Modified := true;
    self.Enquiry.DetailsModified := true;
  end;
end;

procedure TPBMaintQEnqFrm.edtRunOnPriceChange(Sender: TObject);
begin
  if not self.loadingDetails then
  begin
    if edtRunOnPrice.Text <> '' then
    begin
      self.Enquiry.Line.RunOnPrice := StrToFloatDef(edtRunOnPrice.Text, 0, FormatSettings);
    end
    else
    begin
      self.Enquiry.Line.RunOnPrice := 0.0;
    end;
    self.Enquiry.Line.Modified := true;
    self.Enquiry.DetailsModified := true;
  end;
end;

procedure TPBMaintQEnqFrm.edtRunOnCostChange(Sender: TObject);
var
  suppInx: integer;
begin
  if not self.loadingDetails then
  begin
    suppInx := Self.Enquiry.Line.NoOfQuotingSuppliers - 1;
    if edtRunOnCost.Text <> '' then
    begin
      self.Enquiry.Line.RunOnCost := StrToFloatDef(edtRunOnCost.Text, 0, FormatSettings);

      self.Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.RunOnPrice := StrToFloatDef(edtRunOnCost.Text, 0, FormatSettings);
      self.Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
      self.Enquiry.DetailsModified := true;
    end
    else
    begin
      self.Enquiry.Line.RunOnCost := 0.0;
    end;
    self.Enquiry.Line.Modified := true;
    self.Enquiry.DetailsModified := true;
  end;
end;

procedure TPBMaintQEnqFrm.FormActivate(Sender: TObject);
begin
{Put in the access control} ;
//  dmBroker.ScreenAccessControl(Self,'',frmPBMainMenufrm.iOperator,
//        self.Enquiry.Operator.OperatorNo,self.Enquiry.Rep.RepNo) ;
end;

end.
