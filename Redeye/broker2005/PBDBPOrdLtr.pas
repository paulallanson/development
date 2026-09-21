{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O-,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
unit PBDBPOrdLtr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CCSDataBroker, Db, PBPOObjects, PBPODataMod, CCSPrint, PDLetter, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdbPOrdLtr = class(TDataBroker)
    GetDelivsSQL: TFDQuery;
    GetSuppAddrSQL: TFDQuery;
    GetPartsSQL: TFDQuery;
    GetSpecInstrSQL: TFDQuery;
    GetExtChgsSQL: TFDQuery;
    SpecInstrSRC: TDataSource;
    GetAddHocAddrSQL: TFDQuery;
    QuestionsSRC: TDataSource;
    CompSRC: TDataSource;
    AddDetailsSRC: TDataSource;
    GetEnqSQL: TFDQuery;
    EnqSRC: TDataSource;
    GetRepAddrSQL: TFDQuery;
    DelivAddrSRC: TDataSource;
    POsSRC: TDataSource;
    GetQuestionsSQL: TFDQuery;
    PartsDataSRC: TDataSource;
    GetAddDetailsSQL: TFDQuery;
    GetQtysSQL: TFDQuery;
    GetPOsSQL: TFDQuery;
    DelivsSRC: TDataSource;
    GetCustAddrSQL: TFDQuery;
    GetAckSQL: TFDQuery;
    GetNotesSQL: TFDQuery;
    GetCompSQL: TFDQuery;
    UpdLineStatusSQL: TFDQuery;
    UpdHeadStatusSQL: TFDQuery;
    GetCustomerContactSQL: TFDQuery;
    GetAckLineSQL: TFDQuery;
    AddressSRC: TDataSource;
    GetCustomerNameSQL: TFDQuery;
    GetRngPOsSQL: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FContactEmail: string;
    FContactPhone: string;
    FOnlyMine: Boolean;
    FPreview: Boolean;
    FByAccount: char;
    FByBranch: char;
    FAccount: integer;
    FPONumber: real;
    FBranch: integer;
    FAcknowledgement: Boolean;
    FOperator: integer;
    FPurchaseOrder : TPurchaseOrder;
    FCurrentOrderLine : TOrderLine;
    FProcedures: array[pcAddressee..pcVersions] of TBrokerProc;
    fGetRngSQL: Boolean;
    procedure AddAddressee;
    procedure AddContact;
    procedure AddDate;
    procedure AddReference;
    procedure AddHeading;
    procedure AddToWhom;
    procedure AddPreamble;
    procedure AddDescription;
    procedure AddSize;
    procedure AddTotal;
    procedure AddJobBagNumber;
    procedure AddFormRef;
    procedure AddFSCClaim;
    procedure AddParts;
    procedure AddPlate;
    procedure AddNarrative;
    procedure AddArtwork;
    procedure AddPrice;
    procedure AddExtras;
    procedure AddExtrasTotal;
    procedure AddBoxedIn;
    procedure AddAdditionalDetails;
    procedure AddQuestionsAnswers;
    procedure AddRequiredDate;
    procedure AddProofDate;
    procedure AddDeliveries;
    procedure AddPostamble;
    procedure AddSignatory;
    procedure AddCustomer;
    procedure AddVersions;
    procedure AddUpdateInfo;
    procedure BuildContinuation(const Heading : string);
    procedure BuildProcedures;
    procedure AddPart(PartDetail : TPartDetail);
    procedure AddDelivery(DeliveryLine : TDeliveryLine);
    procedure AddExtraCharge(ExtraCharge : TExtraCharge; iCount:Integer);
    procedure AddVersion(StockCode: TStockCode; iCount: Integer);
    procedure DoOneOrderLine;
    function  GetCustomerContact(var Salutation : string) : string;
    function  GetCustomerName : string;
    procedure SetAccount(const Value: integer);
    procedure SetBranch(const Value: integer);
    procedure SetByAccount(const Value: char);
    procedure SetByBranch(const Value: char);
    procedure SetOnlyMine(const Value: Boolean);
    procedure SetPONumber(const Value: real);
    procedure SetPreview(const Value: Boolean);
    procedure SetAcknowledgement(const Value: Boolean);
    procedure SetOperator(const Value: integer);
    procedure setRngSQL(const Value: Boolean);
    procedure AddContactEmail;
    procedure AddContactPhone;
  public
    bAuthorised: boolean;
    iintselcode: integer;
    procedure BuildPageLayout; override;
    procedure BuildPrintRecords; override;
    procedure UpdateStatus(UpdateInfo: TUpdateInfo); override;
    function  GetDetails : integer;
    property Account : integer read FAccount write SetAccount;
    property Acknowledgement : Boolean read FAcknowledgement write SetAcknowledgement;
    property Branch : integer read FBranch write SetBranch;
    property ByAccount : char read FByAccount write SetByAccount;
    property ByBranch : char read FByBranch write SetByBranch;
    property OnlyMine : Boolean read FOnlyMine write SetOnlyMine;
    property Operator : integer read FOperator write SetOperator;
    property PONumber : real read FPONumber write SetPONumber;
    property GetRngSQL : Boolean read fGetRngSQL write setRngSQL;
    property Preview : Boolean read FPreview write SetPreview;
  end;

var
  dbPOrdLtr: TdbPOrdLtr;

implementation

uses LetterDM, Math, pbDatabase;

{$R *.DFM}

{ TdbPOrdRep }

procedure TdbPOrdLtr.AddAdditionalDetails;
var
  i : integer;
  sText : string;
  sAllow : set of char;
  element : TElement;
begin
  if FCurrentOrderLine.AdditionalDetails.Count > 0 then
  begin
    element := FLetter.Elements.ElementByNumber[pcAdditionalDetails];
    if Acknowledgement then
      sAllow := ['C', 'B']
    else
      sAllow := ['S', 'B'];
    with FCurrentOrderLine do
    begin
      stext := '';
      for i := 0 to Pred(AdditionalDetails.Count) do
        with AdditionalDetails[i] do
          if CharInSet(FAOFlag, sAllow) then
            sText := sText + Detail + cLFCR;

      {Get out if stext is empty}
      if trim(stext) = '' then exit;

      if element.BlankBefore then
        BlankLineIfNeeded;
      if (element.UsesTab = 'Y') or
         (element.UsesTab = '1') or
         (element.UsesTab = '2') then
      begin
        FPrintRecord := SimpleText(element.Text, element);
        TextAlignAndFont(FPrintRecord, element.Column, pcAdditionalDetails);
        FPrintRecord.RecordType := rtKeepTogether;
        FColumnRecord := CreateColumnRecord(sText);
        if (element.UsesTab = '2') then
          FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
        else
          FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
        DataAlignAndFont(FPrintRecord, AssignDataColumn(element),
          pcAdditionalDetails);
      end
      else
      begin
        FPrintRecord := SimpleText('', element);
        TextAlignAndFont(FPrintRecord, element.Column, pcAdditionalDetails);
        FPrintRecord.RecordType := rtKeepTogether;
        stext := element.Text + cLFCR + sText;
        case element.Column of
        2 :  FPrintRecord.Column2.Text := sText;
        3 :  FPrintRecord.Column3.Text := sText;
        else FPrintRecord.Column1.Text := sText;
        end;  { case }
        TextAlignAndFont(FPrintRecord, element.Column, pcAdditionalDetails);
        case element.Column of
        2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
        3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
        else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
        end;  { case }
        if dmLetter.OldDatabase then
          FPrintRecord.SpecialFont.Style := [fsBold];
        DataAlignAndFont(FPrintRecord, element.Column, pcAdditionalDetails);
        case element.Column of
        2 :  FPrintRecord.Column2.SpecialLine := 1;
        3 :  FPrintRecord.Column3.SpecialLine := 1;
        else FPrintRecord.Column1.SpecialLine := 1;
        end;  { case }
      end;
      AddOrMerge(FPrintRecord);
      if element.BlankAfter then
        BlankLine;
    end;
  end;
end;

procedure TdbPOrdLtr.AddAddressee;
var
  i : integer;
  sTemp, Salute : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcAddressee];
  if Acknowledgement then
    begin
      sTemp := GetCustomerContact(Salute);
      with GetAckLineSQL do
        begin
          close;
          parambyname('Purchase_Order').asfloat :=
            POsSRC.Dataset.fieldbyname('Purchase_Order').asfloat;
          parambyname('Line').asinteger := FCurrentOrderLine.Line;
          open;

          AddressSRC.Dataset := GetAckLineSQL;
        end;
    end
  else
    begin
      sTemp := FpurchaseOrder.TheirContact;
      AddressSRC.Dataset := GetPOsSQL;
    end;

  with AddressSRC.DataSet do
  for i := 0 to 6 do
    if Trim(Fields[i].AsString) <> '' then
    begin
      if (sTemp <> '') then
        sTemp := sTemp + cLFCR;
      sTemp := sTemp + Fields[i].AsString;
    end;
  FPrintRecord := SimpleText(sTemp, element);
  DataAlignAndFont(FPrintRecord, element.Column, pcAddressee);
  if dmLetter.OldDatabase then
    FPrintRecord.Column1.Width := Trunc(2.6*96);
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddContact;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcContact];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Contact:', element);
    TextAlignAndFont(FPrintRecord, 2, pcContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.9 * 96);
    FColumnRecord := CreateColumnRecord
      (PBPODM.GetOfficeContact(FPurchaseOrder.OfficeContact));
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, pcContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.75 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcContact);
    FColumnRecord := CreateColumnRecord
      (PBPODM.GetOfficeContact(FPurchaseOrder.OfficeContact));
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcContact);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text +
      (PBPODM.GetOfficeContact(FPurchaseOrder.OfficeContact)), element);
    TextAlignAndFont(FPrintRecord, element.Column, pcContact);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);

{$IFDEF PMS}
  FContactEmail := PBPODM.GetOfficeContactEmail(FPurchaseOrder.OfficeContact);
  FContactPhone := PBPODM.GetOfficeContactPhone(FPurchaseOrder.OfficeContact);

  if FContactEmail <> '' then
    AddContactEmail;
  if FContactPhone <> '' then
    AddContactPhone;
{$ENDIF}
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddContactEmail;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcContact];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Email:', element);
    TextAlignAndFont(FPrintRecord, 2, pcContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.9 * 96);
    FColumnRecord := CreateColumnRecord(FContactEmail);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, pcContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.75 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText('Email: ', element);
    TextAlignAndFont(FPrintRecord, element.Column, pcContact);
    FColumnRecord := CreateColumnRecord(FContactEmail);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcContact);
  end
  else
  begin
    FPrintRecord := SimpleText('Email: ' + (FContactEmail), element);
    TextAlignAndFont(FPrintRecord, element.Column, pcContact);
  end;
  AddOrMerge(FPrintRecord);
end;

procedure TdbPOrdLtr.AddContactPhone;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcContact];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Direct Dial:', element);
    TextAlignAndFont(FPrintRecord, 2, pcContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.9 * 96);
    FColumnRecord := CreateColumnRecord(FContactPhone);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, pcContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.75 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText('Direct Dial: ', element);
    TextAlignAndFont(FPrintRecord, element.Column, pcContact);
    FColumnRecord := CreateColumnRecord(FContactPhone);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcContact);
  end
  else
  begin
    FPrintRecord := SimpleText('Direct Dial: ' + (FcontactPhone), element);
    TextAlignAndFont(FPrintRecord, element.Column, pcContact);
  end;
  AddOrMerge(FPrintRecord);
end;

procedure TdbPOrdLtr.AddDate;
var
  element : TElement;
  orderDate: TDateTime;
begin
  element := FLetter.Elements.ElementByNumber[pcDate];
  orderDate := FPurchaseOrder.DatePoint;
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText(cLFCR + 'Date:', element);
    TextAlignAndFont(FPrintRecord, 2, pcDate);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.9 * 96);
    FColumnRecord := CreateColumnRecord(cLFCR +
      FormatDateTime('d mmmm yyyy', OrderDate));
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, pcDate);
    FPrintRecord.Column3.LeftMargin := Trunc(3.75 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcDate);
    FColumnRecord := CreateColumnRecord(FormatDateTime('d mmmm yyyy', OrderDate));
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcDate);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text +
      FormatDateTime('d mmmm yyyy', OrderDate), element);
    TextAlignAndFont(FPrintRecord, element.Column, pcDate);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddReference;
var
  sRef : string;
  element : TElement;
begin
  if Acknowledgement then
    sRef := FCurrentOrderLine.CustOrderNo
  else
    sRef := FCurrentOrderLine.SupplierReference;
  if Trim(sRef) = '' then
    Exit;
  element := FLetter.Elements.ElementByNumber[pcReference];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText(cLFCR + 'Your Ref:', element);
    TextAlignAndFont(FPrintRecord, 2, pcReference);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.9 * 96);
    FColumnRecord := CreateColumnRecord(cLFCR + sRef);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, pcReference);
    FPrintRecord.Column3.LeftMargin := Trunc(3.75 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcReference);
    FColumnRecord := CreateColumnRecord(sRef);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcReference);
  end
  else
  begin
    sRef := element.Text + ' ' + sRef;
    FPrintRecord := SimpleText(sRef, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcReference);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if (element.BlankAfter) and (not dmLetter.OldDatabase) then
    BlankLine;
end;

procedure TdbPOrdLtr.AddArtwork;
var
  element : TElement;
begin
  with FCurrentOrderLine do
    if Trim(Artwork) = '' then
      Exit;
  with FCurrentOrderLine do
  begin
    element := FLetter.Elements.ElementByNumber[pcArtWork];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, pcArtwork);
      FColumnRecord := CreateColumnRecord(Artwork);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcArtWork);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text + Artwork, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, pcArtwork);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddBoxedIn;
var
  element : TElement;
begin
  with FCurrentOrderLine do
    if Trim(FormsPerBox) = '' then
      Exit;
  if FLetter.Elements.ElementByNumber[pcBoxedIn].BlankBefore then
    BlankLineIfNeeded;
  with FPrintRecords, FCurrentOrderLine do
  begin
    element := FLetter.Elements.ElementByNumber[pcBoxedIn];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, pcBoxedIn);
      FColumnRecord := CreateColumnRecord(FormsPerBox);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcBoxedIn);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text + FormsPerBox, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, pcBoxedIn);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddPostAmble;
var
  sEnding : string;
  sSigned : string;
  element : TElement;
begin
  if dmLetter.OldDatabase then
    sSigned := 'Signed........................................................' +
      '.........................................'
  else
    sSigned := '';

  element := FLetter.Elements.ElementByNumber[pcPostAmble];
  if Acknowledgement then
    sEnding := FLetter.Elements.ElementByNumber[pcPostAmble].Text + cLFCR +
      cLFCR
  else
    sEnding := FLetter.Elements.ElementByNumber[pcPostAmble].Text + cLFCR +
      cLFCR + sSigned;

  FPrintRecord := SimpleText(sEnding, element);
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, pcPostAmble);
  AddOrMerge(FPrintRecord);
end;

procedure TdbPOrdLtr.AddSignatory;
var
  element : TElement;
begin
(*  element := FLetter.Elements.ElementByNumber[pcSignatory];
  { Handle       'For and on behalf of ' }
  if not Acknowledgement then
  begin
    element.Column := 1;
//    FPrintRecord := SimpleText('For and on behalf of ', element);
    FPrintRecord := SimpleText(element.text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcSignatory);
    FPrintRecord.RecordType := rtKeepTogether;
    FPrintRecord.Column2 := CreateColumnRecord(CompanyName);
    with FPrintRecord.Column2 do
    begin
//      LeftMargin := Trunc(96*1.4);
      LeftMargin := Trunc(96*1.4);
      PrintAsLastLine := true;    { Kludge, special handling in CCSDevil and }
      DataAlignAndFont(FPrintRecord, 2, pcSignatory);     { the compositors }
    end;
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR
      + cLFCR + cLFCR + cLFCR + cLFCR +
      PBPODM.GetRepDesc(FCurrentOrderLine.Rep) + cLFCR +
      PBPODM.GetRepPosition(FCurrentOrderLine.Rep),
      element);
  end;
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, pcSignatory);
  AddOrMerge(FPrintRecord);
*)
  with FCurrentOrderLine do
  begin
    element := FLetter.Elements.ElementByNumber[pcSignatory];
    if not Acknowledgement then
    begin
      element.Column := 1;
      if element.BlankBefore then
        BlankLineIfNeeded;
      if (element.UsesTab = 'Y') or
         (element.UsesTab = '1') or
         (element.UsesTab = '2') then
      begin
        FPrintRecord := SimpleText(element.text, element);
        FPrintRecord.RecordType := rtKeepTogether;
        TextAlignAndFont(FPrintRecord, element.Column, pcSignatory);

        FColumnRecord := CreateColumnRecord(CompanyName);
        if (element.UsesTab = '2') then
          FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
        else
          FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
        DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcSignatory);
      end
      else
      begin
        FPrintRecord := SimpleText(element.Text + CompanyName, element);
        FPrintRecord.RecordType := rtKeepTogether;
        TextAlignAndFont(FPrintRecord, element.Column, pcSignatory);
      end;
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR
        + cLFCR + cLFCR + cLFCR + cLFCR +
        PBPODM.GetRepDesc(FCurrentOrderLine.Rep) + cLFCR +
        PBPODM.GetRepPosition(FCurrentOrderLine.Rep),
        element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, pcSignatory);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddCustomer;
var
  sTemp: string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcCustomer];
  if not Acknowledgement then
  begin
    sTemp := GetCustomerName + cLFCR + FCurrentOrderLine.CustOrderNo;
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcCustomer);
      FColumnRecord := CreateColumnRecord(sTemp);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcCustomer);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text + sTemp, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcCustomer);
    end;
    if element.BlankBefore then
      BlankLineIfNeeded;

    AddOrMerge(FPrintRecord);

    {Display Customer/End User Reference}
    sTemp := 'Order No:';
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(sTemp, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcCustomer);
      FColumnRecord := CreateColumnRecord('');
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcCustomer);
    end
    else
    begin
      FPrintRecord := SimpleText(sTemp, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcCustomer);
    end;

    AddOrMerge(FPrintRecord);

    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddNarrative;
var
  sText : string;
  element : TElement;
begin
  if Trim(FCurrentOrderLine.NarrativeText) <> '' then
  begin
    element := FLetter.Elements.ElementByNumber[pcNotes];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if Trim(element.Text) <> '' then
    begin
      if (element.UsesTab = 'Y') or
         (element.UsesTab = '1') or
         (element.UsesTab = '2') then
      begin
        FPrintRecord := SimpleText(element.Text, element);
        TextAlignAndFont(FPrintRecord, element.Column, pcNotes);
        FColumnRecord := CreateColumnRecord(FCurrentOrderLine.NarrativeText);
        if (element.UsesTab = '2') then
          FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
        else
          FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
        DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcNotes);
      end
      else
      begin
        sText := element.Text + cLFCR + FCurrentOrderLine.NarrativeText;
        FPrintRecord := SimpleText(sText, element);
        TextAlignAndFont(FPrintRecord, element.Column, pcNotes);
        case element.Column of
        2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
        3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
        else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
        end;  { case }
        DataAlignAndFont(FPrintRecord, element.Column, pcNotes);
        case element.Column of
        2 :  FPrintRecord.Column2.SpecialLine := 1;
        3 :  FPrintRecord.Column3.SpecialLine := 1;
        else FPrintRecord.Column1.SpecialLine := 1;
        end;  { case }
      end;
    end
    else
    begin
      FPrintRecord := SimpleText(FCurrentOrderLine.NarrativeText, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcNotes);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddPart(PartDetail : TPartDetail);
var
  sData, sPerf, sText, sText1 : string;
  ipos, iLength: integer;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcPartsInformation];
  with FPrintRecords, PartDetail do
  begin
    sPerf := '';
    if Trim(LeftMarginType) <> '' then
      sPerf := sPerf + LeftMarginType + ' Margin Perfs at '
        + LeftMarginWidth + ' from left';
    if (Trim(LeftMarginType) <> '') and (Trim(RightMarginType) <> '') then
      sPerf := sPerf + ', ';

    if Trim(RightMarginType) <> '' then
      sPerf := sPerf + RightMarginType + ' Margin Perfs at '
        + RightMarginWidth + ' from right';

    {Assemble the paper details}
    sData := '';
    sData := AddWithSpace(sData, Trim(PaperColour));
    sData := AddWithSpace(sData, Trim(PaperWeight));
    sData := AddWithSpace(sData, Trim(PaperBrand));
    sData := AddWithSpace(sData, Trim(PaperMaterial));

    if ((Trim(FaceInks) <> '') or (Trim(ReverseInks) <> '')) then
    begin
     sData := AddWithSpace(sData, 'Printed');
     if Trim(FaceInks) <> '' then
     begin
       sData := AddWithSpace(sData, Trim(FaceInks));
       sData := AddWithSpace(sData, 'on face');
       if Trim(ReverseInks) = '' then
          sData := AddWithSpace(sData, 'only');
     end;

     if Trim(ReverseInks) <> '' then
     begin
       sData := AddWithSpace(sData, Trim(ReverseInks));
       sData := AddWithSpace(sData, 'on reverse');
       if Trim(faceInks) = '' then
          sData := AddWithSpace(sData, 'only');
     end;
    end;
    if Trim(sData) = '' then Exit;

    {Insert any Perf details}
    if sPerf <> '' then
      sData := sData + cLFCR + sPerf;
    {Insert any Heading details}
    if dmLetter.OldDatabase then
      begin
      if Trim(Heading) <> '' then
        sData := sData + cLFCR + 'Heading: ' + Trim(Heading);
      end
    else
      if Trim(Heading) <> '' then
        sData := Trim(Heading) + ': ' + sData;

    {Insert any Plate Change details}
    if PlateChanges <> 0 then
      sData := sData + cLFCR + 'Plate Changes: ' +
       IntToStr(PlateChanges);

    ipos := pos('|',Trim(element.Text));
    ilength := length(Trim(element.Text))-ipos;

    {split out the different headings if entered}
    if ipos <> 0 then
      begin
        stext := copy(element.Text,1,(ipos-1));
        stext1 := copy(element.Text,(ipos+1),ilength);
      end
    else
      begin
        sText := element.Text;
        sText1 := 'Paper';
      end;

    if (FCurrentOrderline.PartDetails.Count = 1) and
       ((Trim(PartDescription) = 'Part 1') or (Trim(PartDescription) = '')) then
      stext := sText1
    else
      begin
        if Trim(PartDescription) <> '' then
          sText := PartDescription
        else
        if Trim(sText) <> '' then
          sText := sText + IntToStr(PartNo)
        else
          sText := 'PART ' + IntToStr(PartNo);
      end;
(*      begin
        if Trim(PartDescription) <> '' then
          sText := PartDescription
        else
        if Trim(element.Text) <> '' then
          sText := element.Text + IntToStr(PartNo)
        else
          sText := 'PART ' + IntToStr(PartNo);
      end;
*)
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(sText, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcPartsInformation);
      FPrintRecord.RecordType := rtKeepTogether;
      FColumnRecord := CreateColumnRecord(sData);
      if dmLetter.OldDatabase then  { Hard code this }
        FColumnRecord.LeftMargin := 90
      else
        begin
        if (element.UsesTab = '2') then
          FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
        else
          FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
        end;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element),
        pcPartsInformation);
    end
    else
    begin
      FPrintRecord := SimpleText(sText + ' ' + sData,
        element);
      TextAlignAndFont(FPrintRecord, element.Column, pcPartsInformation);
      FPrintRecord.RecordType := rtKeepTogether;
    end;
    { Do NOT call AddOrMerge }
    FPrintRecords.Add(FPrintRecord);
    if dmLetter.OldDatabase then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddParts;
var
  i : integer;
begin
  if FCurrentOrderline.PartDetails.Count = 0 then
    Exit;
  if FLetter.Elements.ElementByNumber[pcPartsInformation].BlankBefore then
    BlankLineIfNeeded;
  for i := 0 to Pred(FCurrentOrderline.PartDetails.Count) do
    begin
      AddPart(FCurrentOrderline.PartDetails[i]);
      if FLetter.Elements.ElementByNumber[pcPartsInformation].BlankAfter then
        BlankLineIfNeeded;
    end;
end;

procedure TdbPOrdLtr.AddHeading;
var
  Heading : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcHeading];
  with POsSRC.Dataset do
  begin
    if (trim(FieldByName('Alt_Purchase_Order').asstring) <> '') and dmBroker.UseSAPIntegration then
      Heading := FieldByName('Alt_Purchase_Order').asstring
    else
      Heading := PBFormatPONum(FieldByName('Purchase_Order').AsFloat,FCurrentOrderLine.Line);

    if Trim(PBPODM.GetRepSuffixPrefix(FCurrentOrderLine.Rep)) <> '' then
      Heading := Heading  + '/' +
        Trim(PBPODM.GetRepSuffixPrefix(FCurrentOrderLine.Rep));
    if fieldbyname('Needs_Authorising').asstring = 'Y' then
      Heading := 'UNAUTHORISED';
  end;
  BuildContinuation(element.Text + Heading);
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcHeading);
    FColumnRecord := CreateColumnRecord(Heading);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcHeading);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + Heading, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcHeading);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.BuildContinuation(const Heading : string);
var
  element : TElement;
  aPrintRecord : TPrintRecord;  { Don't use the global }
begin
  element := FLetter.Elements.ElementByNumber[pcContinuation];
  aPrintRecord := ContinuedRecord(Heading + ' ' + element.Text, element.Column);
  TextAlignAndFont(aPrintRecord, element.Column, pcContinuation);
  FPrintRecords.Add(aPrintRecord);
end;

procedure TdbPOrdLtr.AddDescription;
var
  sDepth, sWidth, sSize, sLinker, sData, sDescr : string;
  element : TElement;
  bprintSize: boolean;
begin
  if Acknowledgement then
    sDescr := FCurrentOrderLine.CustomersDesc
  else
    sDescr := FCurrentOrderLine.SuppliersDesc;

  {If Hard Coded i.e. Forms Technology then get the size info.}
  if dmLetter.OldDatabase then { Hard coded }
    begin
      {Set Depth if value other than zero}
      if FCurrentOrderLine.Depth = 0 then
        sDepth := ''
      else
        sDepth := floattostr(FCurrentOrderLine.Depth) +
        FCurrentOrderLine.DepthUnit;

      {Set Width if value other than zero}
      if FCurrentOrderLine.Width = 0 then
        sWidth := ''
      else
        sWidth := floattostr(FCurrentOrderLine.Width) +
        FCurrentOrderLine.WidthUnit;

      {Set Size Description}
      if  (sDepth = '') or
          (sWidth = '') then
        sLinker := ''
      else
        sLinker := ' x ';

      sSize := sDepth + sLinker + sWidth;

      if trim(sSize) = '' then
        sData := Trim(sDescr)
      else
        sData := Trim(sDescr) + ', ' + sSize;
    end
  else
    begin
      element := FLetter.Elements.ElementByNumber[pcSize];
      bPrintSize := not element.Printed;
      if bPrintsize then
        begin
          {Set Depth if value other than zero}
          if FCurrentOrderLine.Depth = 0 then
            sDepth := ''
          else
            sDepth := floattostr(FCurrentOrderLine.Depth) +
            FCurrentOrderLine.DepthUnit;

          {Set Width if value other than zero}
          if FCurrentOrderLine.Width = 0 then
            sWidth := ''
          else
            sWidth := floattostr(FCurrentOrderLine.Width) +
            FCurrentOrderLine.WidthUnit;

          {Set Size Description}
          if  (sDepth = '') or
              (sWidth = '') then
            sLinker := ''
          else
            sLinker := ' x ';

          sSize := sDepth + sLinker + sWidth;

          if trim(sSize) = '' then
            sData := Trim(sDescr)
          else
            sData := Trim(sDescr) + ', ' + sSize;
        end
      else
        sData := sDescr;
    end;


  element := FLetter.Elements.ElementByNumber[pcDescription];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then { Hard coded }
  begin
    FPrintRecord := SimpleText('DESCRIPTION ', element);
    TextAlignAndFont(FPrintRecord, element.Column, pcDescription);
    FColumnRecord := CreateColumnRecord(sData);
    FColumnRecord.LeftMargin := Trunc(1.3 * 96);
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcDescription);

  end
  else
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcDescription);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcDescription);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcDescription);
  end;
  AddOrMerge(FPrintRecord);

  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddSize;
var
  sDepth, sWidth, sSize, sLinker, sData: string;
  element : TElement;
begin
  if dmLetter.OldDatabase then exit; { Hard coded }

  {Set Depth if value other than zero}
  if FCurrentOrderLine.Depth = 0 then
    sDepth := ''
  else
    sDepth := floattostr(FCurrentOrderLine.Depth) +
    FCurrentOrderLine.DepthUnit;

  {Set Width if value other than zero}
  if FCurrentOrderLine.Width = 0 then
    sWidth := ''
  else
    sWidth := floattostr(FCurrentOrderLine.Width) +
    FCurrentOrderLine.WidthUnit;

  {Set Size Description}
  if  (sDepth = '') or
      (sWidth = '') then
    sLinker := ''
  else
    sLinker := ' x ';

  sSize := sDepth + sLinker + sWidth;

  if trim(sSize) = '' then
    exit
  else
    sData := Trim(sSize);

  element := FLetter.Elements.ElementByNumber[pcSize];
  if element.BlankBefore then
    BlankLineIfNeeded;

  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcSize);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcSize);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcSize);
  end;
  AddOrMerge(FPrintRecord);

  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.BuildPageLayout;
begin
  inherited;
  LoadPageLayoutFromDB(LayoutName);
  FLetter.Name := LetterName;
  dmLetter.LoadLetter(FLetter);
  FLetter.Elements.Sort;  { Sorts by print order }
end;

procedure TdbPOrdLtr.BuildPrintRecords;
var
  i : integer;
begin
  inherited;
  if GetDetails <> 0 then
  begin
    BuildProcedures;
    FPurchaseOrder := TPurchaseOrder.Create(PBPODM);
    try
      while not PosSRC.DataSet.EOF do
      begin
        FPurchaseOrder.PONumber :=
          PosSRC.DataSet.FieldByName('Purchase_Order').asfloat;
        FPurchaseOrder.FuncMode := poView;
        PBPODM.LoadPOFromDatabase(FPurchaseOrder);
        for i := 0 to Pred(FPurchaseOrder.OrderLines.Count) do
        begin
          FCurrentOrderLine := FPurchaseOrder.OrderLines[i];
          DoOneOrderLine;
        end;
        FPurchaseOrder.Clear;
        PosSRC.DataSet.Next;
      end;
    finally
      FPurchaseOrder.Free;
    end;
  end;
end;

function TdbPOrdLtr.GetDetails: integer;
begin
  if GetRngsql then
    begin
    GetPosSql.SQL := GetRngPOsSql.SQL;
    end;
  with GetPOsSQL do
    begin
      Close;
      if GetRngSQL then
        ParamByName('iintselcode').AsInteger := iintselcode;
      ParamByName('Purchase_Order').asfloat := PONumber;
      if OnlyMine then
        ParamByName('Operator').AsInteger := Operator
      else
        ParamByName('Operator').AsInteger := 0;
      ParamByName('BySupplier').AsString := ByAccount;
      ParamByName('Supplier').AsInteger := Account;
      ParamByName('ByBranch').AsString := ByBranch;
      ParamByName('Branch_No').AsInteger := Branch;
      Open;
      Result := RecordCount;
    end;
end;

procedure TdbPOrdLtr.SetAccount(const Value: integer);
begin
  FAccount := Value;
end;

procedure TdbPOrdLtr.SetAcknowledgement(const Value: Boolean);
begin
  FAcknowledgement := Value;
end;

procedure TdbPOrdLtr.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TdbPOrdLtr.SetByAccount(const Value: char);
begin
  FByAccount := Value;
end;

procedure TdbPOrdLtr.SetByBranch(const Value: char);
begin
  FByBranch := Value;
end;

procedure TdbPOrdLtr.SetOnlyMine(const Value: Boolean);
begin
  FOnlyMine := Value;
end;

procedure TdbPOrdLtr.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TdbPOrdLtr.SetPONumber(const Value: real);
begin
  FPONumber := Value;
end;

procedure TdbPOrdLtr.SetPreview(const Value: Boolean);
begin
  FPreview := Value;
end;

procedure TdbPOrdLtr.DataModuleCreate(Sender: TObject);
begin
  inherited;
  PBPODM := TPBPODM.Create(Self);
end;

procedure TdbPOrdLtr.DataModuleDestroy(Sender: TObject);
begin
  inherited;
  PBPODM.Free;
end;

procedure TdbPOrdLtr.DoOneOrderLine;
var
  i : integer;
begin
  for i := 0 to Pred(FLetter.Elements.Count) do
    if FLetter.Elements[i].Number in [pcAddressee..pcVersions] then
      if FLetter.Elements[i].Printed then
        FProcedures[FLetter.Elements[i].Number];
  AddUpdateInfo;
  AddEndRecord;  { The End }
end;

procedure TdbPOrdLtr.AddDelivery(DeliveryLine : TDeliveryLine);
var
  sTemp, sInstr : string;
  element : TElement;
begin
  { Currently, this has to be hard coded for columns 1, 2 and 3.  There
    are restrictions in PageDesigner also to ensure that Delivery elements
    aren't played with. }
  element := FLetter.Elements.ElementByNumber[pcDeliverTo];
  if Element.BlankBefore then
    BlankLine;
  with DeliveryLine do
  begin
    FPrintRecord := SimpleText(element.Text, element);
    element.Column := 1;

    {Check whether delivery is via the company first and this is an acknowledgement}
    if (DeliverViaCompany = 'Y') and not(Acknowledgement) then
      sTemp := PBPODM.GetAddressString(atCompany, 0, 0)
    else
      begin
        case AddressType of
        atAdHoc      : begin
          if DeliveryLine.FAO <> '' then
            sTemp := 'FAO: ' + DeliveryLine.FAO + #13#10 +
                    PBPODM.GetAddressString(atAdHoc, AdHocAddress, 0)
          else
            stemp := PBPODM.GetAddressString(atAdHoc, AdHocAddress, 0);
          sInstr := PBPODM.GetAddressSpecInstr(atAdHoc, AdHocAddress, 0);
                       end;
        atSupplier   : begin
          if DeliveryLine.FAO <> '' then
            sTemp := 'FAO: ' + DeliveryLine.FAO + #13#10 +
                    PBPODM.GetAddressString(atSupplier, Supplier, BranchNo)
          else
            stemp := PBPODM.GetAddressString(atSupplier, Supplier, BranchNo);
          sInstr := '';
                       end;
        atRep        : begin
          sTemp := PBPODM.GetAddressString(atRep, Rep, 0);
          sInstr := '';
                       end;
        atCustomer   : begin
          if DeliveryLine.FAO <> '' then
            sTemp := 'FAO: ' + DeliveryLine.FAO + #13#10 +
                     PBPODM.GetAddressString(atCustomer, Customer, BranchNoZero)
          else
            sTemp := PBPODM.GetAddressString(atCustomer, Customer, BranchNoZero);
          sInstr := PBPODM.GetAddressSpecInstr(atCustomer, Customer, BranchNoZero);
                       end;
        atCompany    : begin
          sTemp := PBPODM.GetAddressString(atCompany, 0, CompanyBranch);
//          sInstr := '';
          sInstr := PBPODM.GetAddressSpecInstr(atCompany, 0, CompanyBranch);
                       end;
        end;  { case }
      end;

    TextAlignAndFont(FPrintRecord, element.Column, pcDeliverTo);
    FPrintRecord.RecordType := rtKeepTogether;
    FColumnRecord := CreateColumnRecord(sTemp);
    FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    FPrintRecord.Column2 := FColumnRecord;
    DataAlignAndFont(FPrintRecord, 2, pcDeliverTo);

    if NoOfBoxes > 0 then
      sTemp := 'Quantity: ' + Trim(Format('%9.0n',[QtyToDeliver]))
        + cLFCR + cLFCR + 'No of Boxes: ' + IntToStr(NoOfBoxes)
    else
      sTemp := 'Quantity: ' + Trim(Format('%9.0n',[QtyToDeliver]))
        + cLFCR + cLFCR;

    if Acknowledgement then
      sTemp := sTemp + cLFCR + cLFCR +
        'Delivery Date: ' + FormatDateTime('d/mm/yyyy', GoodsRequiredbyCust)
    else
      sTemp := sTemp + cLFCR + cLFCR + 
        'Delivery Date: ' + FormatDateTime('d/mm/yyyy', DatePoint);

    FColumnRecord := CreateColumnRecord(sTemp);
    FColumnRecord.LeftMargin := FLetter.TabStop2Pixels;
    FPrintRecord.Column3 := FColumnRecord;
    DataAlignAndFont(FPrintRecord, 3, pcDeliverTo);
    FPrintRecord.Column1.Width := 100;
    if dmLetter.OldDatabase then
      begin
        FPrintRecord.Column2.LeftMargin := 106;
        FPrintRecord.Column2.Width := Trunc(2.4 * 106);
        FPrintRecord.Column3.LeftMargin := Trunc(3.5 * 106);
        FPrintRecord.Column3.Width := 0;
      end
    else
      begin
        FPrintRecord.Column2.LeftMargin := FLetter.TabStop1Pixels;
        FPrintRecord.Column2.Width := Trunc(2.4 * 106);
        FPrintRecord.Column3.LeftMargin := FLetter.TabStop2Pixels;
        FPrintRecord.Column3.Width := 0;
      end;
    { Do NOT call AddOrMerge }
    FPrintRecords.Add(FPrintRecord);

    {Show the Delivery Instructions if there are any}
    try
      if Trim(sInstr) = '' then
        sInstr := Instructions
      else
        sInstr := sInstr + cLFCR + Instructions;
    except
      { Ignore missing data }
    end;

    if (trim(sInstr) <> '') then
      begin
      {Print a Blank line prior to showing the Delivery Instructions}
      BlankLine;

      {This is to print the Delivery Instructions}
      FPrintRecord := SimpleText('Instructions:', element);
      Element.column := 1;
      TextAlignAndFont(FPrintRecord, element.column, pcDeliverTo);
      FPrintRecord.RecordType := rtKeepTogether;
      FColumnRecord := CreateColumnRecord(sInstr);
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      FPrintRecord.Column2 := FColumnRecord;
      DataAlignAndFont(FPrintRecord, 2, pcDeliverTo);

{    TextAlignAndFont(FPrintRecord, 1, pcDeliverTo);
    FColumnRecord := CreateColumnRecord(sInstr);
    FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcDeliverTo);
}
      FPrintRecord.Column1.Width := 100;
      if dmLetter.OldDatabase then
        begin
          FPrintRecord.Column2.LeftMargin := 106;
        end
      else
        begin
          FPrintRecord.Column2.LeftMargin := FLetter.TabStop1Pixels;
        end;
      FPrintRecords.Add(FPrintRecord);
      {Print Blank line after Instructions}
      BlankLine;
      end;

    if (dmLetter.OldDatabase) and (trim(sInstr) = '')then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddExtras;
var
  i : integer;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcExtraCharge];
  if (element.detailed = 'Y') and not (dmletter.OldDatabase) then
    begin
      if element.BlankBefore then
        BlankLineIfNeeded;
      for i := 0 to Pred(FCurrentOrderline.ExtraCharges.Count) do
        AddExtraCharge(FCurrentOrderline.ExtraCharges[i],i);
    end
    else
      if element.BlankBefore then
        BlankLineIfNeeded;
    AddExtrasTotal;
    if element.BlankAfter then
        BlankLineIfNeeded;
end;

procedure TdbPOrdLtr.AddPrice;
var
  sTemp : string;
  element : TElement;
  iFactor: integer;
  rValue: real;
begin
  element := FLetter.Elements.ElementByNumber[pcQuantityPrice];
  with FCurrentOrderLine do
  begin
    sTemp := Trim(Format('%9.0n',[Quantity])) + ' at ';
//    sTemp := IntToStr(Trunc(Quantity)) + ' at ';
    if Acknowledgement then
      begin
        sTemp := sTemp +
          Trim(Format('%-10.2m', [SellingPrice])) +
          ' ' + Trim(PBPODM.GetPriceUnitDescr(SellUnit));
        rValue := SellingPrice;
      end
    else
      begin
        sTemp := sTemp +
          Trim(Format('%-10.2m', [OrderPrice])) +
          ' ' + Trim(PBPODM.GetPriceUnitDescr(OrderUnit));
        rValue := OrderPrice;
      end;

    if Acknowledgement then
      begin
        if Trim(PBPODM.GetPriceUnitShowTotal(SellUnit)) = 'Y' then
          begin
          iFactor := PBPODM.GetPriceUnitFactor(SellUnit);
          if iFactor = 0 then
            sTemp := sTemp + '        Total Value ' + Trim(Format('%-10.2m', [rValue]))
          else
            sTemp := sTemp + '        Total Value ' + Trim(Format('%-10.2m', [(Quantity/iFactor)*rValue]));
          end;
      end
    else
      begin
        if Trim(PBPODM.GetPriceUnitShowTotal(OrderUnit)) = 'Y' then
          begin
          iFactor := PBPODM.GetPriceUnitFactor(OrderUnit);
          if iFactor = 0 then
            sTemp := sTemp + '        Total Value ' + Trim(Format('%-10.2m', [rValue]))
          else
            sTemp := sTemp + '        Total Value ' + Trim(Format('%-10.2m', [(Quantity/iFactor)*rValue]));
          end;
      end;
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase then
    begin
      FPrintRecord := SimpleText('QUANTITY ' + sTemp, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcQuantityPrice);
    end
    else
    if (element.UsesTab <> 'Y') and
       (element.UsesTab <> '1') and
       (element.UsesTab <> '2') then
    begin
      FPrintRecord := SimpleText(element.Text + sTemp, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcQuantityPrice);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcQuantityPrice);
      FColumnRecord := CreateColumnRecord(sTemp);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcQuantityPrice);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.AddRequiredDate;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcRequiredDate];
  with FCurrentOrderLine do
  begin
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
      if Acknowledgement then
        FPrintRecord := SimpleText(element.Text +
          FormatDateTime('d/mm/yyyy', GoodsRequiredbyCust), element)
      else
        FPrintRecord := SimpleText(element.Text +
          FormatDateTime('d/mm/yyyy', GoodsRequired), element);

      TextAlignAndFont(FPrintRecord, element.Column, pcRequiredDate);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcRequiredDate);
      if Acknowledgement then
        FColumnRecord := CreateColumnRecord(
          FormatDateTime('d/mm/yyyy', GoodsRequiredbyCust))
      else
        FColumnRecord := CreateColumnRecord(
          FormatDateTime('d/mm/yyyy', GoodsRequired));
          
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcRequiredDate);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.UpdateStatus(UpdateInfo: TUpdateInfo);
begin
  if not Preview and bAuthorised then
  begin
    with UpdHeadStatusSQL do
    begin
      ParamByName('Purchase_Order').asfloat := UpdateInfo.PONumber;
      ExecSQL;
    end;
    with UpdLineStatusSQL do
    begin
      ParamByName('Purchase_Order').asfloat := UpdateInfo.PONumber;
      ParamByName('Line').AsInteger := UpdateInfo.Line;
      ExecSQL;
    end;
  end;
end;

procedure TdbPOrdLtr.AddUpdateInfo;
var
  UpdateInfo : TUpdateInfo;
begin
  FPrintRecord := TPrintRecord.Create;
  FPrintRecord.RecordType := rtUpdateInfo;
  UpdateInfo := TUpdateInfo.Create;
  UpdateInfo.PONumber := POsSRC.DataSet.FieldByName('Purchase_Order').asfloat;
  UpdateInfo.Line := FCurrentOrderLine.Line;
  FPrintRecord.UpdateInfo := UpdateInfo;
  FPrintRecords.Add(FPrintRecord);
end;

function TdbPOrdLtr.GetCustomerContact(var Salutation : string): string;
begin
  with GetCustomerContactSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger :=
      FCurrentOrderLine.Customer;
    ParamByName('Branch_No').AsInteger :=
      FCurrentOrderLine.BranchNo;
    ParamByName('Contact_No').AsInteger :=
      FCurrentOrderLine.CustomerContact;
    Open;
    Result := FieldByName('Name').AsString;
    Salutation := FieldByName('Salutation').AsString;
    Close;
  end;
end;

function TdbPOrdLtr.GetCustomerName: string;
begin
  with GetCustomerNameSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger :=
      FCurrentOrderLine.Customer;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

procedure TdbPOrdLtr.AddPlate;
var
  element : TElement;
begin
  if FCurrentOrderLine.NoOfPlateChanges > 0 then
  begin
    element := FLetter.Elements.ElementByNumber[pcPlates];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
      FPrintRecord := SimpleText(element.Text +
        PBIntStr(FCurrentOrderLine.NoOfPlateChanges), element);
      TextAlignAndFont(FPrintRecord, element.Column, pcPlates);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcPlates);
      FColumnRecord := CreateColumnRecord(
          PBIntStr(FCurrentOrderLine.NoOfPlateChanges));
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcPlates);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.BuildProcedures;
begin
  FProcedures[pcAddressee          ] :=  AddAddressee;
  FProcedures[pcContact            ] :=  AddContact;
  FProcedures[pcDate               ] :=  AddDate;
  FProcedures[pcReference          ] :=  AddReference;
  FProcedures[pcToWhom             ] :=  AddToWhom;
  FProcedures[pcHeading            ] :=  AddHeading;
  FProcedures[pcPreamble           ] :=  AddPreamble;
  FProcedures[pcDescription        ] :=  AddDescription;
  FProcedures[pcPartsInformation   ] :=  AddParts;
  FProcedures[pcPlates             ] :=  AddPlate;
  FProcedures[pcArtwork            ] :=  AddArtwork;
  FProcedures[pcQuantityPrice      ] :=  AddPrice;
  FProcedures[pcBoxedIn            ] :=  AddBoxedIn;
  FProcedures[pcAdditionalDetails  ] :=  AddAdditionalDetails;
  FProcedures[pcQuestions          ] :=  AddQuestionsAnswers;
  FProcedures[pcExtraCharge        ] :=  AddExtras;
  FProcedures[pcRequiredDate       ] :=  AddRequiredDate;
  FProcedures[pcDeliverTo          ] :=  AddDeliveries;
  FProcedures[pcNotes              ] :=  AddNarrative;
  FProcedures[pcPostamble          ] :=  AddPostamble;
  FProcedures[pcSignatory          ] :=  AddSignatory;
  FProcedures[pcCustomer           ] :=  AddCustomer;
  FProcedures[pcProofDate          ] :=  AddProofDate;
  FProcedures[pcFormReference      ] :=  AddFormRef;
  FProcedures[pcSize               ] :=  AddSize;
  FProcedures[pcTotal              ] :=  AddTotal;
  FProcedures[pcJobBagNumber       ] :=  AddJobBagNumber;
  FProcedures[pcFSCClaim           ] :=  AddFSCClaim;
  FProcedures[pcVersions           ] :=  AddVersions;
end;

procedure TdbPOrdLtr.AddPreamble;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcPreamble];
  if element.BlankBefore then
    BlankLineIfNeeded;
  FPrintRecord := SimpleText(element.Text, element);
  TextAlignAndFont(FPrintRecord, element.Column, pcPreamble);
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddToWhom;
var
  sSalute, sTemp : string;
  element : TElement;
begin
  sSalute := '';
  if Acknowledgement then
  begin
    sTemp := GetCustomerContact(sSalute);
    if Trim(sSalute) <> '' then
      sSalute := AddWithSpace(FLetter.Elements.ElementByNumber[pcToWhom].Text,
        sSalute) + ','
    else
    if Trim(sTemp) <> '' then
      sSalute := AddWithSpace(FLetter.Elements.ElementByNumber[pcToWhom].Text,
        sTemp) + ',';
  end
  else
  begin
    if Trim(FPurchaseOrder.Salutation) <> '' then
      sSalute := AddWithSpace(FLetter.Elements.ElementByNumber[pcToWhom].Text,
        Trim(FPurchaseOrder.Salutation)) + ','
    else
    begin
      sTemp := FPurchaseOrder.TheirContact;
      if Trim(sTemp) <> '' then
        sSalute := AddWithSpace(FLetter.Elements.ElementByNumber[pcToWhom].Text,
          sTemp) + ',';
    end;
  end;
  element := FLetter.Elements.ElementByNumber[pcToWhom];
  if element.BlankBefore then
    BlankLineIfNeeded;
  FPrintRecord := SimpleText(sSalute, element);
  TextAlignAndFont(FPrintRecord, element.Column, pcToWhom);
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddDeliveries;
var
  i : integer;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcDeliverTo];
  if element.BlankBefore then
    BlankLineIfNeeded;
  for i := 0 to Pred(FCurrentOrderline.DeliveryLines.Count) do
    AddDelivery(FCurrentOrderline.DeliveryLines[i]);
  if element.BlankAfter then
    BlankLineIfNeeded;
end;

procedure TdbPOrdLtr.AddVersions;
var
  i : integer;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcVersions];
  if element.BlankBefore then
    BlankLineIfNeeded;
  for i := 0 to Pred(FCurrentOrderline.StockCodes.Count) do
    AddVersion(FCurrentOrderline.StockCodes[i],i);
  if element.BlankAfter then
    BlankLineIfNeeded;
end;

procedure TdbPOrdLtr.AddQuestionsAnswers;
var
  sTemp : string;
  i, iLen  : integer;
  element : TElement;
begin
  {insert a default numbering Question if Numbering has been setup}
  if trim(FCurrentOrderLine.Numbering) <> '' then
  begin
    if dmLetter.OldDatabase then
      BlankLineIfNeeded;
    element := FLetter.Elements.ElementByNumber[pcQuestions];
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
      begin
        FPrintRecord := SimpleText('Numbering: ' + FCurrentOrderLine.Numbering, element);
        TextAlignAndFont(FPrintRecord, element.Column, pcQuestions);
      end
    else
      begin
        if element.BlankBefore then
          BlankLineIfNeeded;
        sTemp := 'Numbering: ';
        FPrintRecord := SimpleText(sTemp, element);
        TextAlignAndFont(FPrintRecord, element.Column, pcQuestions);
        case element.Column of
        2 :  iLen := TextLength(sTemp, FPrintRecord.Column2.Font) + 12;
        3 :  iLen := TextLength(sTemp, FPrintRecord.Column3.Font) + 12;
        else iLen := TextLength(sTemp, FPrintRecord.Column1.Font) + 12;
        end;  { case }

        FColumnRecord := CreateColumnRecord(FCurrentOrderLine.Numbering);
        FColumnRecord.LeftMargin := Max(iLen, FLetter.TabStop1Pixels);
        DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcQuestions);
      end;
    FPrintRecords.Add(FPrintRecord);  { DO NOT AddOrMerge }
    if element.BlankAfter and not dmLetter.OldDatabase then
      BlankLine;
  end;
  if dmLetter.OldDatabase then
    BlankLine;

  {Now process the proper Questions}
  if FCurrentOrderLine.Questions.Count > 0 then
  begin
    if dmLetter.OldDatabase then
      BlankLineIfNeeded;
    element := FLetter.Elements.ElementByNumber[pcQuestions];
    for i := 0 to Pred(FCurrentOrderLine.Questions.Count) do
    with FCurrentOrderLine.Questions[i] do
    if Trim(Answer) <> '' then
    begin
      if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                                 (element.UsesTab <> '1') and
                                 (element.UsesTab <> '2') then
      begin
        FPrintRecord := SimpleText(QuestionText + ': ' + Answer, element);
        TextAlignAndFont(FPrintRecord, element.Column, pcQuestions);
      end
      else
      begin
        if element.BlankBefore then
          BlankLineIfNeeded;
        sTemp := QuestionText + ': ';
        FPrintRecord := SimpleText(sTemp, element);
        TextAlignAndFont(FPrintRecord, element.Column, pcQuestions);
        case element.Column of
        2 :  iLen := TextLength(sTemp, FPrintRecord.Column2.Font) + 12;
        3 :  iLen := TextLength(sTemp, FPrintRecord.Column3.Font) + 12;
        else iLen := TextLength(sTemp, FPrintRecord.Column1.Font) + 12;
        end;  { case }

        FColumnRecord := CreateColumnRecord(Answer);
        FColumnRecord.LeftMargin := Max(iLen, FLetter.TabStop1Pixels);
        DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcQuestions);
      end;
      FPrintRecords.Add(FPrintRecord);  { DO NOT AddOrMerge }
      if element.BlankAfter and not dmLetter.OldDatabase then
        BlankLine;
    end;
    if dmLetter.OldDatabase then
      BlankLine;
  end;
end;

procedure TdbPOrdLtr.setRngSQL(const Value: Boolean);
begin
  fGetRngSQL := Value;
end;

procedure TdbPOrdLtr.AddExtraCharge(ExtraCharge: TExtraCharge; iCount:Integer);
var
  element : TElement;
  rPrice: real;
begin
  with FPrintRecords, ExtraCharge do

  {Check the relevant Prices}
  if Acknowledgement then
    rPrice := ExtraCharge.QuotationPrice
  else
    rPrice := ExtraCharge.Amount;
  if rPrice <> 0 then
  begin
    element := FLetter.Elements.ElementByNumber[pcExtraCharge];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
        FPrintRecord := SimpleText( ExtraCharge.details + '  '+
          Format('%10.2m', [rPrice]), element);
      TextAlignAndFont(FPrintRecord, 1, pcExtraCharge);
    end
    else
    begin
      if icount = 0 then
        FPrintRecord := SimpleText(element.Text, element)
      else
        FPrintRecord := SimpleText('',element) ;
      TextAlignAndFont(FPrintRecord, element.Column, pcExtraCharge);
        FColumnRecord := CreateColumnRecord(ExtraCharge.details+ ' at '+
        Format('%-10.2m', [rPrice]));
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcExtraCharge);
    end;
    AddOrMerge(FPrintRecord);
      if element.BlankAfter then
      BlankLine;
  end;

end;

procedure TdbPOrdLtr.AddExtrasTotal;
var
  element : TElement;
  rTotals: real;
begin
  with FPrintRecords, FCurrentOrderLine do

  {Check the relevant Prices}
  if Acknowledgement then
    rTotals := ExtraCharges.TotalSell
  else
    rTotals := ExtraCharges.Total;

  if rTotals <> 0 then
  begin
    element := FLetter.Elements.ElementByNumber[pcExtraCharge];
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
      FPrintRecord := SimpleText('Additional Charges Total: ' +
        Format('%10.2m', [rTotals]), element);
      TextAlignAndFont(FPrintRecord, 1, pcExtraCharge);
    end
    else
    begin
      if element.detailed = 'Y' then
        FPrintRecord := SimpleText('', element)
      else
        FPrintRecord := SimpleText('Extra Charges ', element);
      TextAlignAndFont(FPrintRecord, element.column, pcExtraCharge);
      if element.detailed = 'Y' then
        begin
          FColumnRecord := CreateColumnRecord(
            Format('Total '+element.Text+' of %10.2m', [rTotals]));
        end
      else
        FColumnRecord := CreateColumnRecord(
          Format('%-10.2m', [rTotals]));;
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord,AssignDataColumn(element), pcExtraCharge);
    end;
    AddOrMerge(FPrintRecord);
  end;

end;

procedure TdbPOrdLtr.AddProofDate;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[pcProofDate];
  with FCurrentOrderLine do
  begin
    if ProofDate = 0 then
      exit;
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
      FPrintRecord := SimpleText(element.Text +
        FormatDateTime('d/mm/yyyy', ProofDate), element);
      TextAlignAndFont(FPrintRecord, element.Column, pcProofDate);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcProofDate);
      FColumnRecord := CreateColumnRecord(
        FormatDateTime('d/mm/yyyy', ProofDate));
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcProofDate);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;

end;

procedure TdbPOrdLtr.AddFormRef;
var
  sData, sFormRef: string;
  element : TElement;
begin

  sFormRef :=
    GetFormRefID(FCurrentOrderLine.FormReference);
  if sFormRef = '' then
    exit;

  element := FLetter.Elements.ElementByNumber[pcFormReference];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then { Hard coded }
  begin
    if sFormRef <> '' then
      sData := sFormRef;

    FPrintRecord := SimpleText('Form Ref ', element);
    TextAlignAndFont(FPrintRecord, element.Column, pcFormReference);
    FColumnRecord := CreateColumnRecord(sData);
    FColumnRecord.LeftMargin := Trunc(1.3 * 96);
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcFormReference);

  end
  else
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    if sFormRef <> '' then
      sData := sFormRef;
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcFormReference);
  end
  else
  begin
    if sFormRef <> '' then
      sData := sFormRef;
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcFormReference);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcFormReference);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddVersion(StockCode: TStockCode; iCount:Integer);
var
  element : TElement;
  iQty: integer;
begin
  with FPrintRecords, StockCode do

  iQty := trunc(StockCode.qtyOrdered);

  element := FLetter.Elements.ElementByNumber[pcVersions];
  if element.BlankBefore then
    BlankLineIfNeeded;

  if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
      FPrintRecord := SimpleText(StockCode.stockReference + ' ' +
          formatfloat('#,##0',(iQty)), element);
      TextAlignAndFont(FPrintRecord, 1, pcVersions);
    end
  else
    begin
      if icount = 0 then
        FPrintRecord := SimpleText(element.Text, element)
      else
        FPrintRecord := SimpleText('',element) ;
      TextAlignAndFont(FPrintRecord, element.Column, pcVersions);
        FColumnRecord := CreateColumnRecord(StockCode.stockReference + ' ' + 
            formatfloat('#,##0',(iQty)));
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcVersions);
    end;
    AddOrMerge(FPrintRecord);
      if element.BlankAfter then
      BlankLine;
end;

procedure TdbPOrdLtr.AddFSCClaim;
var
  sData, sFSCClaim: string;
  sFSCTitle, sTitle: string;
  element : TElement;
begin

  sFSCClaim :=
    GetFSCClaim(FCurrentOrderLine.FSCClaim,FCurrentOrderLine.FSCMixed);
  if sFSCClaim = '' then
    exit;

  element := FLetter.Elements.ElementByNumber[pcFSCClaim];
  sFSCTitle :=
    GetFSCTitle(FCurrentOrderLine.FSCClaim);

  if sFSCTitle = 'FSC' then
    sTitle := 'FSC Claim'
  else
    sTitle := 'PEFC Claim';

  if element.BlankBefore then
    BlankLineIfNeeded;
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    if sFSCClaim <> '' then
      sData := sFSCClaim;
//    FPrintRecord := SimpleText(element.Text + sData, element);
    FPrintRecord := SimpleText(sTitle + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcFSCClaim);
  end
  else
  begin
    if sFSCClaim <> '' then
      sData := sFSCClaim;
//    FPrintRecord := SimpleText(element.Text, element);
    FPrintRecord := SimpleText(sTitle, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcFSCClaim);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcFSCClaim);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddTotal;
var
  rValue: real;
  iFactor: integer;
  sTemp: string;
  element : TElement;
begin
  if dmLetter.OldDatabase then exit; { Hard coded }

  element := FLetter.Elements.ElementByNumber[pcTotal];

  {Calculate order value}
  with FCurrentOrderLine do
  begin
    if Acknowledgement then
      begin
        iFactor := PBPODM.GetPriceUnitFactor(SellUnit);
        if iFactor = 0 then
          rValue := SellingPrice
        else
          rValue := (Quantity/iFactor)*SellingPrice;
        rValue := rValue + ExtraCharges.TotalSell;
      end
    else
      begin
        iFactor := PBPODM.GetPriceUnitFactor(OrderUnit);
        if iFactor = 0 then
          rValue := OrderPrice
        else
          rValue := (Quantity/iFactor)*OrderPrice;
        rValue := rValue + ExtraCharges.Total;
      end;
  end;

  sTemp := Trim(Format('%-10.2m', [rValue]));

  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcTotal);
      FColumnRecord := CreateColumnRecord(sTemp);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcTotal);
    end
  else
    begin
      FPrintRecord := SimpleText(element.Text + sTemp, element);
      TextAlignAndFont(FPrintRecord, element.Column, pcTotal);
    end;

  if element.BlankBefore then
    BlankLineIfNeeded;

  AddOrMerge(FPrintRecord);

  if element.BlankAfter then
    BlankLine;
end;

procedure TdbPOrdLtr.AddJobBagNumber;
var
  sData, sJobBagNo: string;
  element : TElement;
begin

  sJobBagNo :=
    IntToStr(FCurrentOrderLine.JobBagNumber);
  if (sJobBagNo = '') or (sJobBagNo = '0') then
    exit;

  element := FLetter.Elements.ElementByNumber[pcJobBagNumber];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then { Hard coded }
  begin
    if sJobBagNo <> '' then
      sData := sJobBagNo;

    FPrintRecord := SimpleText('Job Bag No: ', element);
    TextAlignAndFont(FPrintRecord, element.Column, pcJobBagNumber);
    FColumnRecord := CreateColumnRecord(sData);
    FColumnRecord.LeftMargin := Trunc(1.3 * 96);
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcJobBagNumber);

  end
  else
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    if sJobBagNo <> '' then
      sData := sJobBagNo;
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcJobBagNumber);
  end
  else
  begin
    if sJobBagNo <> '' then
      sData := sJobBagNo;
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, pcJobBagNumber);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), pcjobBagNumber);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

end.
