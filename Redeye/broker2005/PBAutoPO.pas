(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Auto-convert Enquiry to Purchase Order form.

VSS Info:
$Header: /PBL D5/PBAutoPO.pas 19    9/07/03 13:02 Davidn $
$History: PBAutoPO.pas $
 * 
 * *****************  Version 19  *****************
 * User: Davidn       Date: 9/07/03    Time: 13:02
 * Updated in $/PBL D5
 * Changed to prompt for delivery address type, delivery in to stock and
 * invoiced upfront
 * 
 * *****************  Version 18  *****************
 * User: Paul         Date: 13/06/:3   Time: 15:06
 * Updated in $/PBL D5
 * When creating an order from enquiry, the list of questions was not
 * displayed using the correct prompt type
 * 
 * *****************  Version 17  *****************
 * User: Paul         Date: 9/12/:2    Time: 16:26
 * Updated in $/PBL D5
 * changed to correct problem when delivery date was not being set to Date
 * required.
 * 
 * *****************  Version 16  *****************
 * User: Paul         Date: 13/09/:2   Time: 9:38
 * Updated in $/PBL D5
 * Changed to correctly work out the prices if Run On qty entered.
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 5/09/:2    Time: 9:41
 * Updated in $/PBL D5
 * Changed to incorporate the selection of a Run On Qty
 * 
 * *****************  Version 14  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:51
 * Updated in $/PBL D5
 * Changed to combine the displaying of Customer and Branch in one edit
 * box.
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 2/08/:0    Time: 11:57
 * Updated in $/PBL D5
 * Changed to default the Number of Boxes and the Delivery Date for the
 * Delivery Details when creating new Delivery Details.
 * 
 * *****************  Version 11  *****************
 * User: Roddym       Date: 14/03/:0   Time: 14:58
 * Updated in $/PBL D5
 * Remove Invoice Method from Purchase Order screens and objects.
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 1/03/:0    Time: 10:29
 * Updated in $/PBL D5
 * Changed so that the Forms Reference  was copied from the Enquiry to the
 * Purchase Order
 * 
 * *****************  Version 9  *****************
 * User: Roddym       Date: 11/02/:0   Time: 15:29
 * Updated in $/PBL D5
 * Fix bug where all questions were not being associated with a Purchase
 * Order, especially when adding from scratch rather than from an enquiry.
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 10/02/:0   Time: 12:00
 * Updated in $/PBL D5
 * Add questions and answers to Purchase Order and Acknowledgement
 * structures and letter layouts.  Add new page layout field PrintDefault
 * similar to FaxDefault.  Add new letter layout field LetterTypeDefault
 * so we can display the user's selected default on print selection forms
 * in Broker.
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 9/02/:0    Time: 13:37
 * Updated in $/PBL D5
 * Add new properties SupplierName and BranchName to the PurchaseOrder
 * object.  Remove Customer and CustomerName from PurchaseOrder as these
 * only apply at line level.  Add new functions to get SupplierName and
 * BranchName.
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 7/02/:0    Time: 14:57
 * Updated in $/PBL D5
 * Change field Price_Unit from char to integer so we can have more than 9
 * price units.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 2/02/:0    Time: 10:11
 * Updated in $/PBL D5
 * Change OrderUnit and SellUnit from incorrect integer to char (the key
 * field to Price_Unit table is a single character, not necessarily
 * numeric).  Also, when displaying cost and sell price, calculate the
 * total rather than show unit prices.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 24/12/99   Time: 9:56
 * Updated in $/PBL D5
 * Database changes so Purchase Orders don't need to refer to Enquiry
 * details.  Fixes to Quotation letter to show all quantities.  
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 13/12/99   Time: 10:45
 * Updated in $/PBL D5
 * Changed to pick up the Width correctly from the Enquiry
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 10/12/99   Time: 17:16
 * Updated in $/PBL D5
 * Changed the layout of the Purchase Order line screen and updated the
 * Depth, Width, Artwork and Unist fields correctly
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 11  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:32
 * Updated in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
unit PBAutoPO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBTables, PBPOObjects;

type
  TPBAutoPOFrm = class(TForm)
    Label1: TLabel;
    procedure MainLoop(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    iTempNewCode: Integer;
    function AddNewOrderLine(const LineNo: Integer): TOrderLine;
    procedure CreateDelivery(const iCust : integer; OrdLine: TOrderLine);
    procedure AddExtraCharges(OrdLine: TOrderLine);
    procedure AddPartDetails(OrdLine: TOrderLine);
    procedure AddAdditionalDetails(OrdLine: TOrderLine);
    procedure AddQuestions(OrdLine: TOrderLine);
    function POConvert: Integer;
    procedure CreatePO;
    procedure AppendPO;
    procedure UpdateEnquiry;
  public
    TempOK: Boolean;
    TempEnqNo, TempEnqLineNo: integer;
    tempPO: real;
    JoBBagNo: integer;
  end;

var
  PBAutoPOFrm: TPBAutoPOFrm;

implementation

uses PBAutoPODataMod, PBAutoPODets, PBPODataMod, PBMaintPOrd, pbDatabase,
  pbMainMenu;

{$R *.DFM}

function TPBAutoPOFrm.AddNewOrderLine(const LineNo: Integer): TOrderLine;
begin
  Result := TOrderLine.Create;
  with Result, PBAutoPODM, PBAutoPODetsFrm do
  begin
    Line := LineNo;
    CustOrderNo := CustOrdEdit.Text;
    Customer := GetEnqSQL.FieldByName('Customer').AsInteger;
    BranchNo := GetEnqSQL.FieldByName('Branch_No').AsInteger;
    CustomerContact := GetEnqSQL.FieldByName('Contact_No').AsInteger;
    Enquiry := GetEnqSQL.FieldByName('Enquiry').AsInteger;
    LineZero := GetEnqSQL.FieldByName('Line').AsInteger;
    SupplierReference := GetQtysSQL.FieldByName('Supplier_Reference').AsString;
    SupplierJobRef := '';
    GoodsRequired := StrToDate(ReqByDateEdit.Text);
    GoodsRequiredbyCust := StrToDate(CustReqDateEdit.Text);
    POLineStatus := 10;
    if ProofsReqChkBox.Checked then
    begin
      ProofRequired := True;
      ProofDate := StrToDate(ProofsDateEdit.Text);
    end
    else
    begin
      ProofRequired := False;
      ProofDate := 0;
    end;

    ExpectedLife := 0;

    VATCode := PBPODM.GetCustVAT(Customer);

    SuppliersDesc := SuppDescEdit.Text;
    CustomersDesc := CustDescEdit.Text;
    Quantity := FOrderQty;
    OrderPrice := StrToFloat(OrdPriceMemo.Text);
    SellingPrice := StrToFloat(SellPriceMemo.Text);
    ListPrice := StrToFloat(ListPriceMemo.Text);
    ProductType := GetEnqSQL.FieldByName('Product_Type').AsInteger;
    PrintedPO := False;
    OrderUnit := FOrderUnit;
    SellUnit := FSellUnit;
    SuppInvRecd := False;
    Rep := GetEnqSQL.FieldByName('Rep').AsInteger;
    if ProofStatDBLUCB.text = '' then
      ProofStatus := ''
    else
      ProofStatus := ProofStatDBLUCB.KeyValue;
    Narrative := 0;
    NarrativeText :=
      PBPODM.GetNarrative(GetEnqSQL.FieldByName('Narrative').AsInteger);
    FormReference := GetEnqSQL.FieldByName('Form_Reference').AsInteger;
    FormsPerBox := GetEnqSQL.FieldByName('Forms_per_box').AsString;
    Depth := GetEnqSQL.FieldByName('Depth').Asfloat;
    DepthUnit := GetEnqSQL.FieldByName('Depth_Unit').Asstring;
    Result.Width := GetEnqSQL.FieldByName('Width').Asfloat;
    WidthUnit := GetEnqSQL.FieldByName('Width_Unit').AsString;
    Artwork := GetEnqSQL.FieldByName('Artwork_Instructions').AsString;
    NCROTCMix := GetEnqSQL.FieldByName('NCR_OTC_Mix').AsString;
    NoOfPlateChanges := GetEnqSQL.FieldByName('No_Of_Plates').AsInteger;
//    JobType := GetEnqSQL.FieldByName('Job_Type').AsInteger;
  end;
  PurchaseOrder.OrderLines.Add(Result);
end;

procedure TPBAutoPOFrm.CreateDelivery(const iCust : integer;
  OrdLine: TOrderLine);
var
  aLine: TDeliveryLine;
begin
{
  aLine := TDeliveryLine.Create;
  with aLine do
  begin
    //Setup a delivery to the customer, or company if there is no customer
    Line := OrdLine.Line;
    DeliveryNo := 1;
    QtyToDeliver := PBAutoPODetsFrm.FOrderQty;
    DatePoint := OrdLine.GoodsRequired;

    try
      NoOfBoxes := PBAutoPODetsFrm.FOrderQty div strtoint(OrdLine.FormsPerBox);
    except
      NoOfBoxes := 0;
    end;

    Customer := iCust;
    BranchNoZero := PurchaseOrder.BranchNo;
  end;
  OrdLine.DeliveryLines.Add(aLine);
}
  aLine := PBAutoPODetsFrm.DeliveryDetail;
  with aLine do
  begin
    //Setup a delivery to the customer, or company if there is no customer
    Line := OrdLine.Line;
    DeliveryNo := 1;

    QtyToDeliver := PBAutoPODetsFrm.FOrderQty;
    DatePoint := OrdLine.GoodsRequired;
    GoodsRequiredbyCust := OrdLine.GoodsRequiredByCust;
    
    try
      NoOfBoxes := PBAutoPODetsFrm.FOrderQty div strtoint(OrdLine.FormsPerBox);
    except
      NoOfBoxes := 0;
    end;

    if dmBroker.DefaultDeliveryViaCompany then
      DeliverViaCompany := 'Y'
    else
      DeliverViaCompany := 'N';
  end;
  
  if PBAutoPODetsFrm.chkbxInvoiceUpfront.checked then
    OrdLine.InvoiceUpfront := 'Y'
  else
    OrdLine.InvoiceUpfront := 'N';

  OrdLine.DeliveryLines.Add(aLine);
end;

procedure TPBAutoPOFrm.AddExtraCharges(OrdLine: TOrderLine);
var
  aCharge: TExtraCharge;
begin
  with PBAutoPODM, GetExtChgsSQL do
  begin
    GetExtChgsSQL.Close;
    ParamByName('Enquiry').AsInteger :=
      GetEnqSQL.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      GetEnqSQL.FieldByName('Line').AsInteger;
    ParamByName('Supplier').AsInteger :=
      GetQtysSQL.FieldByName('Supplier').AsInteger;
    ParamByName('Branch_No').AsInteger :=
      GetQtysSQL.FieldByName('Branch_No').AsInteger;
    Open;
    while not EOF do
    begin
      aCharge := TExtraCharge.Create;
      with aCharge do
      begin
        Line := OrdLine.Line;
        AdditionalCharge := OrdLine.ExtraCharges.NextChargeNumber;
        Details := FieldByName('Details').AsString;
        Amount := FieldByName('Amount').AsFloat;
        QuotationPrice := FieldByName('Quotation_Price').AsFloat;
      end;
      OrdLine.ExtraCharges.Add(aCharge);
      GetExtChgsSQL.Next; { This MUST be qualified or compiler gets it wrong }
    end;
    Close;
  end;
end;

function TPBAutoPOFrm.POConvert: Integer;
begin
  { Returns 0 for proceed, 1 for skip, 2 for finish }
  PBAutoPODetsFrm.EnqNo := TempEnqNo;
  PBAutoPODetsFrm.EnqLineNo := TempEnqLineNo;
  if PBAutoPODetsFrm.GetEnqDets(Self) = 0 then
  begin
    Result := 1;
  end
  else
  begin
    PBAutoPODetsFrm.ExistingPO := 0;
    PBAutoPODetsFrm.ShowModal;
    if PBAutoPODetsFrm.FormOK then
      Result := 0
    else
      Result := 2;
  end;
end;

procedure TPBAutoPOFrm.CreatePO;
begin
  with PBMaintPOrdfrm do
  begin
    FuncMode := poAdd;
    SetUpDetails(Self);
    PurchaseOrder.Supplier :=
      PBAutoPODM.GetQtysSQL.FieldByName('Supplier').AsInteger;
    SupplierEdit.Text :=
      PBAutoPODM.GetQtysSQL.FieldByName('Supp_Name').AsString+
      '/'+PBAutoPODM.GetQtysSQL.FieldByName('Branch_Name').AsString;
    PurchaseOrder.BranchNo :=
      PBAutoPODM.GetQtysSQL.FieldByName('Branch_No').AsInteger;
    
    DateEdit.Text := PBAutoPODetsFrm.DateEdit.Text;
    PurchaseOrder.SupplierContactNo := PBAutoPODetsFrm.Contact;
    ContactEdit.Text :=
      PBAutoPODM.ContactSRC.Dataset.FieldByName('Name').AsString;
  end;
end;

procedure TPBAutoPOFrm.AppendPO;
begin
  with PBMaintPOrdfrm do
  begin
    FuncMode := poAddToExisting;
    with PBAutoPODM.GetExistPOsSQL do
    begin
      PurchaseOrder.PONumber := PBAutoPODetsFrm.ExistingPO;
      POrdNoMemo.Text := floatToStr(PurchaseOrder.PONumber);
      PurchaseOrder.Supplier := FieldByName('Supplier').AsInteger;
      SupplierEdit.Text := FieldByName('Supp_Name').AsString+'/'+
          FieldByName('Branch_Name').AsString;
      PurchaseOrder.BranchNo := FieldByName('Branch_No').AsInteger;
      DateEdit.Text := DateToStr(FieldByName('Date_Point').AsDateTime);
      PurchaseOrder.SupplierContactNo := FieldByName('Contact_No').AsInteger;
      PurchaseOrder.OfficeContact := FieldByName('Office_Contact').AsInteger;
      ContactEdit.Text :=
        PBAutoPODM.ContactSRC.Dataset.FieldByName('Name').AsString;
    end;
    SetUpDetails(Self);
  end;
end;

procedure TPBAutoPOFrm.UpdateEnquiry;
begin
  with PBAutoPODM.UpdEnqLineSQL do
  begin
    ParamByName('Enquiry').AsInteger :=
      PBAutoPODM.GetEnqSQL.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      PBAutoPODM.GetEnqSQL.FieldByName('Line').AsInteger;
    ParamByName('SelectedSupplier').AsInteger :=
      PBAutoPODM.GetQtysSQL.FieldByName('Supplier').AsInteger;
    ParamByName('SelectedBranch_No').AsInteger :=
      PBAutoPODM.GetQtysSQL.FieldByName('Branch_No').AsInteger;
    ExecSQL;
  end;
  {Update the enquiry header}
  with PBAutoPODM.GetLinesNotPOedSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      PBAutoPODM.GetEnqSQL.FieldByName('Enquiry').AsInteger;
    Open;
    with PBAutoPODM.UpdEnqHeadSQL do
    begin
      ParamByName('Enquiry').AsInteger :=
        PBAutoPODM.GetEnqSQL.FieldByName('Enquiry').AsInteger;
      if PBAutoPODM.GetLinesNotPOedSQL.RecordCount > 0 then
        ParamByName('Enquiry_Status').AsInteger := esSomePurchaseOrdersRaised
      else
        ParamByName('Enquiry_Status').AsInteger := esAllPurchaseOrdersRaised;
      ExecSQL;
    end;
    Close;
  end;
end;

procedure TPBAutoPOFrm.AddAdditionalDetails(OrdLine: TOrderLine);
var
  anAdd: TAdditionalDetail;
begin
  with PBAutoPODM.GetAddDetsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := TempEnqNo;
    ParamByName('Line').AsInteger := TempEnqLineNo;
    Open;
    while not EOF do
    begin
      anAdd := TAdditionalDetail.Create;
      with anAdd do
      begin
        Line := FieldByName('Line').AsInteger;
        DetailNo := FieldByName('Additional_Details').AsInteger;
        FAOFlag := FieldByName('FAO_Flag').AsString[1];
        Detail := FieldByName('Details').AsString;
        Narrative := 0;
      end;
      OrdLine.AdditionalDetails.Add(anAdd);
      Next;
    end;
    Close;
  end;
end;

procedure TPBAutoPOFrm.AddPartDetails(OrdLine: TOrderLine);
var
  aPart: TPartDetail;
begin
  with PBAutoPODM.GetPartsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := TempEnqNo;
    ParamByName('Line').AsInteger := TempEnqLineNo;
    Open;
    while not EOF do
    begin
      aPart := TPartDetail.Create;
      with aPart do
      begin
        Line := FieldByName('Line').AsInteger;
        PartNo := FieldByName('Part_No').AsInteger;
        Heading := FieldByName('Heading').AsString;
        SameAsPart := FieldByName('Same_As_Part').AsInteger;
        PaperBrand := FieldByName('Paper_Brand').AsString;
        PaperMaterial := FieldByName('Paper_Material').AsString;
        PaperWeight := FieldByName('Paper_Weight').AsString;
        PaperColour := FieldByName('Paper_Colour').AsString;
        FaceInks := FieldByName('Face_Inks').AsString;
        ReverseInks := FieldByName('Reverse_Inks').AsString;
        LeftMarginType := FieldByName('Left_Margin_Type').AsString;
        LeftMarginWidth := FieldByName('Left_Margin_Width').AsString;
        RightMarginType := FieldByName('Right_Margin_Type').AsString;
        RightMarginWidth := FieldByName('Right_Margin_Width').AsString;
      end;
      OrdLine.PartDetails.Add(aPart);
      Next;
    end;
    Close;
  end;
end;

procedure TPBAutoPOFrm.MainLoop(Sender: TObject);
var
  OrdLine: TOrderLine;
  iRes: Integer;
begin
  { This form is never made visible. It just loops round here calling other
    forms to do the work. }
    PBAutoPODetsFrm := TPBAutoPODetsFrm.Create(Self);
    try
      iRes := POConvert;
      if iRes = 2 then
        Exit
      else
        if iRes = 1 then
          exit
        else
        begin {Startup the maintain purchase orders screen}
          PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
          try
            PurchaseOrder.BranchNo :=
              PBAutoPODM.GetEnqSQL.FieldByName('Branch_No').AsInteger;
            if PBAutoPODetsFrm.ExistingPO = 0 then
              CreatePO
            else
              AppendPO;
            iTempNewCode := PurchaseOrder.OrderLines.NextLineNumber;
            OrdLine := AddNewOrderLine(iTempNewCode);
            CreateDelivery(PBAutoPODM.GetEnqSQL.FieldByName('Customer').AsInteger,
              OrdLine);
            AddExtraCharges(OrdLine);
            AddPartDetails(OrdLine);
            AddAdditionalDetails(OrdLine);
            AddQuestions(OrdLine);
            PBMaintPOrdfrm.rOrderLimit := dmBroker.AuthorisedOrderLimit(frmpbMainMenu.iOperator);
            PBMaintPOrdfrm.rSellLimit := dmBroker.MinimumSalesValue(frmpbMainMenu.iOperator);
            PBMaintPOrdfrm.SellLimitType := dmBroker.MinimumSalesValueType(frmpbMainMenu.iOperator);
            PBMaintPOrdFrm.JobBagNo := self.JoBBagNo;
            PBMaintPOrdFrm.SetJobTypeAbilities;
            PBMaintPOrdFrm.CreateFromEnq := true;
            PBMaintPOrdfrm.ShowModal;
            TempOK := PBMaintPOrdfrm.bOK;
            if TempOK then
              tempPO := PurchaseOrder.PONumber;
          finally
            PBMaintPOrdfrm.Free;
          end;
          if TempOK then
            UpdateEnquiry;
        end;
    finally
      PBAutoPODetsFrm.Free;
    end;
end;

procedure TPBAutoPOFrm.FormCreate(Sender: TObject);
begin
  PBAutoPODM := TPBAutoPODM.Create(Self);
  tempPO := 0;
  JobBagNo := 0;
//  MainLoop(Self);
end;

procedure TPBAutoPOFrm.FormDestroy(Sender: TObject);
begin
  PBAutoPODM.Free;
end;

procedure TPBAutoPOFrm.AddQuestions(OrdLine: TOrderLine);
var
  aQuestion: TQuestion;
  inx : integer;
begin
  { First add all questions for this product type then find any answers
    associated with the original enquiry. }
  with PBAutoPODM.GetQuestionsSQL do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := OrdLine.ProductType;
    Open;
    while not EOF do
    begin
      aQuestion := TQuestion.Create;
      with aQuestion do
      begin
        ProductType := OrdLine.ProductType;
        QuestionNo := FieldByName('Question').AsInteger;
        QuestionText := FieldByName('Question_Text').AsString;
        PromptType := FieldByName('Prompt_type').AsString;
      end;
      OrdLine.Questions.Add(aQuestion);
      Next;
    end;
    Close;
  end;
  with PBAutoPODM.GetAnswersSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := TempEnqNo;
    ParamByName('Line').AsInteger := TempEnqLineNo;
    ParamByName('Product_Type').AsInteger := OrdLine.ProductType;
    Open;
    while not EOF do
    begin
      inx :=
        OrdLine.Questions.IndexFromQuestionNo(FieldByName('Question').AsInteger);
      with OrdLine.Questions[inx] do
        Answer := FieldByName('Product_Answer').AsString;
      Next;
    end;
    Close;
  end;
end;

end.
