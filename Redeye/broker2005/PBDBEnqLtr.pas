(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Printing data module for Enquiry Letter printing.

VSS Info:
$Header: /PBL D5/PBDBEnqLtr.pas 48    7/05/:3 10:13 Janiner $
$History: PBDBEnqLtr.pas $
 * 
 * *****************  Version 48  *****************
 * User: Janiner      Date: 7/05/:3    Time: 10:13
 * Updated in $/PBL D5
 * put thousand comma seperator in quantities format string
 * 
 * *****************  Version 47  *****************
 * User: Paul         Date: 24/03/:3   Time: 13:11
 * Updated in $/PBL D5
 * Changed to incorporate the new Options element of the Enquiry print
 * 
 * *****************  Version 46  *****************
 * User: Paul         Date: 7/01/:3    Time: 11:47
 * Updated in $/PBL D5
 * Added function to print spaces after each part line, also introduced
 * change to Page Designer to have an alternative to Paper when only
 * printing one part details.
 * 
 * *****************  Version 45  *****************
 * User: Paul         Date: 19/12/:2   Time: 15:39
 * Updated in $/PBL D5
 * Changed to add the size to description if Size element is not to be
 * printed
 * 
 * *****************  Version 44  *****************
 * User: Paul         Date: 16/12/:2   Time: 14:38
 * Updated in $/PBL D5
 * Changed the print to only print the title "Paper" if only one part and
 * if the Part Description is either blank or is "Part 1" 
 * 
 * *****************  Version 43  *****************
 * User: Paul         Date: 1/11/:2    Time: 15:05
 * Updated in $/PBL D5
 * Changed quantities to show thousand separator
 * 
 * *****************  Version 42  *****************
 * User: Davidn       Date: 25/10/02   Time: 16:35
 * Updated in $/PBL D5
 * Office contact name not appearing on file copy of enquirys.
 * 
 * *****************  Version 41  *****************
 * User: Paul         Date: 24/10/:2   Time: 11:13
 * Updated in $/PBL D5
 * Changed to print the word 'Paper' if only one part, rather than nothing
 * at all
 * 
 * *****************  Version 40  *****************
 * User: Janiner      Date: 10/10/:2   Time: 14:27
 * Updated in $/PBL D5
 * make sure checking line number for fielcopy routine as well, to allow
 * for multi line enquiries.
 * 
 * *****************  Version 39  *****************
 * User: Janiner      Date: 10/10/:2   Time: 13:08
 * Updated in $/PBL D5
 * If this is a filecopy do not print the address and contact details, and
 * only print one copy of the enquiry.
 * 
 * *****************  Version 38  *****************
 * User: Pahome       Date: 23/09/:2   Time: 17:18
 * Updated in $/PBL D5
 * Changed so that if only one part, then no PART 1 is printed. 
 * 
 * *****************  Version 37  *****************
 * User: Pahome       Date: 17/09/:2   Time: 15:59
 * Updated in $/PBL D5
 * Changed to extract out the Size from the Description and make it a new
 * element of Page Designer
 * 
 * *****************  Version 36  *****************
 * User: Paul         Date: 5/09/:2    Time: 9:42
 * Updated in $/PBL D5
 * Changed to display the Run On Qty if one has been entered.
 * 
 * *****************  Version 35  *****************
 * User: Janiner      Date: 27/02/:2   Time: 11:04
 * Updated in $/PBL D5
 * Add form reference to be maintained by pagedesigner.
 * 
 * *****************  Version 34  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:05
 * Updated in $/PBL D5
 * Uses the new Enquiry, PO, Quotation, Ack range selection screens
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 25/07/:1   Time: 10:59
 * Updated in $/PBL D5 - Prototypes
 * Set property to decide wether to use get range sql or normal get sql .
 * (i.e. are we using the range select screen or the new multi-function
 * screen where a selected po number/enquiry number is input)
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 5/07/:1    Time: 13:34
 * Created in $/PBL D5 - Prototypes
 * 
 * *****************  Version 34  *****************
 * User: Janiner      Date: 28/06/:1   Time: 12:10
 * Updated in $/PBL D5
 * Make changes to allow multi-select and range options on selection
 * screens for report purposes.
 * Ensure changes regarding PO num format and 'only' legend are
 * re-included into these versions.
 * 
 * *****************  Version 2  *****************
 * User: Janiner      Date: 28/06/:1   Time: 10:27
 * Updated in $/pbld5 - prototypes
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 15:22
 * Created in $/pbld5 - prototypes
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 13:49
 * Created in $/PBLD5-~1
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 11:55
 * Created in $/PBLD5 - Prototypes/PBLD5-~1
 * 
 * *****************  Version 32  *****************
 * User: Paul         Date: 6/03/:1    Time: 14:24
 * Updated in $/PBL D5
 * Changed to make the UsesTab a string so that the Page Designer will
 * have the facility to select Tab 1 and Tab 2.
 * 
 * *****************  Version 31  *****************
 * User: Paul         Date: 2/03/:1    Time: 16:50
 * Updated in $/PBL D5
 * Changed to print the Contact name on the Enquiry
 * 
 * *****************  Version 30  *****************
 * User: Paul         Date: 17/11/:0   Time: 11:51
 * Updated in $/PBL D5
 * Changed to display Form Ref if using a non-Page Designer database.
 *
 * *****************  Version 29  *****************
 * User: Paul         Date: 16/11/:0   Time: 12:27
 * Updated in $/PBL D5
 * Changed to correctly display the Office contact when printing the
 * Purchase  Orders, Acks, Quotes and Enqs.
 *
 * *****************  Version 28  *****************
 * User: Paul         Date: 29/06/:0   Time: 15:39
 * Updated in $/PBL D5
 * Changed to display the Heading details for each part at the Start of
 * the Part details, this was specifically done for Broadsword if using
 * the Page Designer, if not using Page Designer then the Heading details
 * are printed on the line after the Part details.
 *
 * *****************  Version 27  *****************
 * User: Paul         Date: 13/04/:0   Time: 15:11
 * Updated in $/PBL D5
 * Corrected the display of the Depth and Width so that all decimals are
 * displayed, previously everything was displayed only as integers.
 *
 * *****************  Version 26  *****************
 * User: Paul         Date: 30/03/:0   Time: 15:03
 * Updated in $/PBL D5
 * Changed to decide whether to display the Depth and Width fields. If
 * they are zero then don't display
 *
 * *****************  Version 25  *****************
 * User: Roddym       Date: 21/03/:0   Time: 14:38
 * Updated in $/PBL D5
 * Minor tweaks to ensure Forms Technology printouts look the way they
 * always did.
 *
 * *****************  Version 24  *****************
 * User: Roddym       Date: 20/03/:0   Time: 17:24
 * Updated in $/PBL D5
 * Fine tune layout of "old" style letters for Forms Technology.
 *
 * *****************  Version 23  *****************
 * User: Roddym       Date: 16/03/:0   Time: 17:22
 * Updated in $/PBL D5
 * Was printing 'Quote Required By: ' instead of dynamic text.
 *
 * *****************  Version 22  *****************
 * User: Roddym       Date: 14/03/:0   Time: 14:59
 * Updated in $/PBL D5
 * Use new Part_Description field instead of "Part N" if not null.
 *
 * *****************  Version 21  *****************
 * User: Roddym       Date: 10/03/:0   Time: 16:13
 * Updated in $/PBL D5
 * Make the UsesTab attribute visible and allow users to change it.
 *
 * *****************  Version 20  *****************
 * User: Roddym       Date: 10/03/:0   Time: 10:54
 * Updated in $/PBL D5
 * Change questions and answers to print blank lines between each q&a
 * rather than round a block of q&a's.
 *
 * *****************  Version 19  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:11
 * Updated in $/PBL D5
 * Infinitely configurable printing layouts (well, almost).
 *
 * *****************  Version 18  *****************
 * User: Roddym       Date: 15/02/:0   Time: 17:12
 * Updated in $/PBL D5
 * New feature to allow setting of two tab stops per letter so the user
 * can size the virtual columns.
 *
 * *****************  Version 17  *****************
 * User: Roddym       Date: 3/02/:0    Time: 15:53
 * Updated in $/PBL D5
 * Remove commas from the end of address lines.  Oh why did my English
 * teachers ever bother?  How far can illiteracy go in modern society
 * before we drown under a tidal wave of gibberish?
 *
 * *****************  Version 16  *****************
 * User: Roddym       Date: 25/01/:0   Time: 8:23
 * Updated in $/PBL D5
 * Fix condition in AddPart deciding if ink information to be printed
 * (boolean was NOT... OR rather than NOT... AND).
 *
 * *****************  Version 15  *****************
 * User: Roddym       Date: 20/01/:0   Time: 15:04
 * Updated in $/PBL D5
 * Fix bug:  was printing "PART x Printed" when there wasn't any part
 * info.
 *
 * *****************  Version 14  *****************
 * User: Roddym       Date: 12/01/:0   Time: 11:43
 * Updated in $/PBL D5
 * Fix bug where narrative text was being built using AddWithSpace
 * function rather than just simple concatenation.
 *
 * *****************  Version 13  *****************
 * User: Roddym       Date: 12/01/:0   Time: 9:12
 * Updated in $/PBL D5
 * Assorted layout fixes in enquiry, quotation, purchase order and
 * acknowledgement letters.  Fixes to faxing code where incorrect layout
 * being used.  Use operator name for contact at start of letter.  Do not
 * print slash if no rep suffix.  Print rep position after signatory.
 *
 * *****************  Version 12  *****************
 * User: Roddym       Date: 10/01/:0   Time: 14:55
 * Updated in $/PBL D5
 * Minor fixes to new printing routines, things like signatory, getting
 * bold lines right, drop contact suffix if empty.
 *
 * *****************  Version 11  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:42
 * Updated in $/PBL D5
 * Changes for new letter printing mechanism, driven by the
 * tb_LetterLayout and tb_LetterElement tables.  New Letter object, also
 * hard-coded version to make switch transparent to Forms Technology.
 *
 * *****************  Version 10  *****************
 * User: Roddym       Date: 24/12/99   Time: 9:56
 * Updated in $/PBL D5
 * Database changes so Purchase Orders don't need to refer to Enquiry
 * details.  Fixes to Quotation letter to show all quantities.
 *
 * *****************  Version 9  *****************
 * User: Roddym       Date: 20/12/99   Time: 11:10
 * Updated in $/PBL D5
 * Fix bug where continuation text on multiple letters/faxes was always
 * that of the last letter/fax to be printed.
 *
 * *****************  Version 8  *****************
 * User: Roddym       Date: 16/12/99   Time: 17:29
 * Updated in $/PBL D5
 * Remove PrintLogo property from databrokers, use LayoutName instead.
 *
 * *****************  Version 7  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 *
 * *****************  Version 6  *****************
 * User: Roddym       Date: 14/12/99   Time: 17:32
 * Updated in $/PBL D5
 * Update status fields as things are printed.
 *
 * *****************  Version 5  *****************
 * User: Roddym       Date: 14/12/99   Time: 15:20
 * Updated in $/PBL D5
 * Fixes to Additional Details printing when none exist and puting
 * questions and answers on same line separated by colon.
 *
 * *****************  Version 4  *****************
 * User: Roddym       Date: 14/12/99   Time: 14:23
 * Updated in $/PBL D5
 * Fix bug, was only printing first letter to supplier, other suppliers
 * not being processed.
 *
 * *****************  Version 3  *****************
 * User: Roddym       Date: 14/12/99   Time: 8:25
 * Updated in $/PBL D5
 * Fix question/answer printing, was only doing first one.
 *
 * *****************  Version 2  *****************
 * User: Roddym       Date: 13/12/99   Time: 15:13
 * Updated in $/PBL D5
 * Don't print artwork or forms per box if no data.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 8/12/99    Time: 16:40
 * Created in $/PBL D5
 * First conversion of Enquiry and Purchase Order faxes/letters.

*******************************************************************************)
unit PBDBEnqLtr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CCSDataBroker, Db, DBTables, CCSPrint, LetterDM, PDLetter;

type
  TdbEnqLtr = class(TDataBroker)
    QuestionsSRC: TDataSource;
    EnquiriesSRC: TDataSource;
    PartsSRC: TDataSource;
    AddDetailsSRC: TDataSource;
    GetRngEnqsSQL: TQuery;
    UpdStatusSQL: TQuery;
    UpdHeadStatusSQL: TQuery;
    UpdLineStatusSQL: TQuery;
    GetUPSuppEnqSQL: TQuery;
    GetUPEnqLineSQL: TQuery;
    GetQtysSQL: TQuery;
    GetNotesSQL: TQuery;
    GetPartsSQL: TQuery;
    GetAddDetailsSQL: TQuery;
    GetQuestionsSQL: TQuery;
    GetSuppContactSQL: TQuery;
    GetEnquiriesSQL: TQuery;
    GetOptionsSQL: TQuery;
    qrySelEnqStatus: TQuery;
    qrySelEnqLineStatus: TQuery;
    GetOperatorSQL: TQuery;
  private
    FOnlyMine: Boolean;
    FPreview: Boolean;
    FByBranch: char;
    FBySupplier: char;
    FBranch: integer;
    FSupplier: integer;
    FOperator: integer;
    FAcknowledgements: Boolean;
    FEnquiryNo: integer;
    FProcedures: array[ecAddressee..ecOptions] of TBrokerProc;
    fGetRngSQL: Boolean;
    FFileCopy: Boolean;
    procedure AddAddressee;
    procedure AddContact;
    procedure AddDate;
    procedure AddHeading;
    procedure AddToWhom;
    procedure AddPreamble;
    procedure AddDescription;
    procedure AddSize;
    procedure AddPart;
    procedure AddParts;
    procedure AddPlate;
    procedure AddNarrative;
    procedure AddArtwork;
    procedure AddQuantity;
    procedure AddBoxedIn;
    procedure AddAdditionalDetails;
    procedure AddOptions;
    procedure AddQuestionsAnswers;
    procedure AddQuoteBy;
    procedure AddPostAmble;
    procedure AddSignatory;
    procedure AddFormRef;
    procedure AddUpdateInfo;
    procedure BuildContinuation(const Heading : string);
    procedure BuildOneLetter;
    procedure BuildProcedures;
    procedure SetBranch(const Value: integer);
    procedure SetByBranch(const Value: char);
    procedure SetBySupplier(const Value: char);
    procedure SetOnlyMine(const Value: Boolean);
    procedure SetOperator(const Value: integer);
    procedure SetPreview(const Value: Boolean);
    procedure SetSupplier(const Value: integer);
    procedure SetAcknowledgements(const Value: Boolean);
    procedure SetEnquiryNo(const Value: integer);
    function GetEnqHeadStatus(UpdateInfo: TUpdateInfo): integer;
    function GetEnqLineStatus(UpdateInfo: TUpdateInfo): integer;
    function GetOperatorEmail(const iContact: integer): string;
    function GetSuppContactSal(const iSupp, iBranch, iContact: integer): string;
    function GetSuppContactName(const iSupp, iBranch, iContact: integer): string;
    procedure setRngSQL(const Value: Boolean);
    procedure SetFileCopy(const Value: Boolean);
    procedure AddContactEmail;
    procedure AddContactPhone;
  public
    iintselcode: integer;
    procedure BuildPageLayout; override;
    procedure BuildPrintRecords; override;
    procedure UpdateStatus(UpdateInfo : TUpdateInfo); override;
    function  GetDetails : integer;
    procedure GetOtherData;
    property Acknowledgements : Boolean read FAcknowledgements write SetAcknowledgements;
    property Branch : integer read FBranch write SetBranch;
    property ByBranch : char read FByBranch write SetByBranch;
    property BySupplier : char read FBySupplier write SetBySupplier;
    property EnquiryNo : integer read FEnquiryNo write SetEnquiryNo;
    property OnlyMine : Boolean read FOnlyMine write SetOnlyMine;
    property FileCopy : Boolean read FFileCopy write SetFileCopy;
    property Operator : integer read FOperator write SetOperator;
    property Preview : Boolean read FPreview write SetPreview;
    property Supplier : integer read FSupplier write SetSupplier;
    property GetRngSQL : Boolean read fGetRngSQL write setRngSQL;
    end;

implementation
uses
  Math;

{$R *.DFM}

procedure TdbEnqLtr.BuildProcedures;
begin
  FProcedures[ecAddressee          ] :=  AddAddressee;
  FProcedures[ecContact            ] :=  AddContact;
  FProcedures[ecDate               ] :=  AddDate;
  FProcedures[ecHeading            ] :=  AddHeading;
  FProcedures[ecToWhom             ] :=  AddToWhom;
  FProcedures[ecPreamble           ] :=  AddPreamble;
  FProcedures[ecDescription        ] :=  AddDescription;
  FProcedures[ecPartsInformation   ] :=  AddParts;
  FProcedures[ecPlates             ] :=  AddPlate;
  FProcedures[ecArtwork            ] :=  AddArtwork;
  FProcedures[ecQuantities         ] :=  AddQuantity;
  FProcedures[ecBoxedIn            ] :=  AddBoxedIn;
  FProcedures[ecQuestionsandAnswers] :=  AddQuestionsAnswers;
  FProcedures[ecAdditionalDetails  ] :=  AddAdditionalDetails;
  FProcedures[ecQuoteDate          ] :=  AddQuoteBy;
  FProcedures[ecNotes              ] :=  AddNarrative;
  FProcedures[ecPostamble          ] :=  AddPostamble;
  FProcedures[ecSignatory          ] :=  AddSignatory;
  FProcedures[ecFormRef            ] :=  AddFormRef;
  FProcedures[ecSize               ] :=  AddSize;
  FProcedures[ecOptions            ] :=  AddOptions;
end;

procedure TdbEnqLtr.BuildPageLayout;
begin
  inherited;
  LoadPageLayoutFromDB(LayoutName);
  FLetter.Name := LetterName;
  dmLetter.LoadLetter(FLetter);
  FLetter.Elements.Sort;  { Sorts by print order and column }
end;

procedure TdbEnqLtr.BuildPrintRecords;
var
enqno,enqline : Integer;
begin
  inherited;
  enqno := 0;
  enqline :=0;
  if GetDetails = 0 then
    Exit;
  BuildProcedures;
  with GetEnquiriesSQL do
  begin
    First;
    while not EOF do
    begin
      if ((FieldByname('Enquiry').AsInteger = enqno) and
        (filecopy = True) and (fieldByname('Line').AsInteger = enqline)) then
        begin
          Next;
        end
      else
        begin
          GetOtherData;
          BuildOneLetter;
          enqNo := FieldByname('Enquiry').AsInteger;
          enqline := FieldByName('Line').AsInteger;
          Next;
        end;
    end;
  end;
end;

procedure TdbEnqLtr.AddHeading;
var
  Heading : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecHeading];
  with EnquiriesSRC.Dataset do
  begin
    Heading :=
      Trim(FieldByName('Enquiry').AsString) + '-' +
      Trim(FieldByName('Line').AsString);
    if Trim(FieldByName('Rep_Suffix_or_Prefix').AsString) <> '' then
      Heading := Heading + '/' +
        Trim(FieldByName('Rep_Suffix_or_Prefix').AsString);
  end;
  BuildContinuation(element.Text + Heading);
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecHeading);
    FColumnRecord := CreateColumnRecord(Heading);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecHeading);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + Heading, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecHeading);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.BuildContinuation(const Heading : string);
var
  element : TElement;
  aPrintRecord : TPrintRecord;  { Don't use the global }
begin
  element := FLetter.Elements.ElementByNumber[ecContinuation];
  aPrintRecord := ContinuedRecord(Heading + ' ' + element.Text, element.Column);
  TextAlignAndFont(aPrintRecord, element.Column, ecContinuation);
  FPrintRecords.Add(aPrintRecord);
end;

procedure TdbEnqLtr.AddPart;
var
  sData, sPerf, sText, stext1 : string;
  ipos, ilength: integer;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecPartsInformation];

  sPerf := '';
  if Trim(PartsSRC.DataSet.FieldByName('Left_Margin_Type').AsString) <> '' then
    sPerf := sPerf +
      PartsSRC.DataSet.FieldByName('Left_Margin_Type').AsString +
      ' Margin Perfs at '
      + PartsSRC.DataSet.FieldByName('Left_Margin_Width').AsString +
        ' from left';

  if (Trim(PartsSRC.DataSet.FieldByName('Left_Margin_Type').AsString) <> '') and
    (Trim(PartsSRC.DataSet.FieldByName('Right_Margin_Type').AsString) <> '')
      then
    sPerf := sPerf + ', ';

  if Trim(PartsSRC.DataSet.FieldByName('Right_Margin_Type').AsString) <> '' then
    sPerf := sPerf +
      PartsSRC.DataSet.FieldByName('Right_Margin_Type').AsString +
      ' Margin Perfs at '
      + PartsSRC.DataSet.FieldByName('Right_Margin_Width').AsString +
        ' from right';

  {Assemble the paper details}
  sData := '';
  sData := AddWithSpace(sData,
    Trim(PartsSRC.DataSet.FieldByName('Paper_Colour').AsString));
  sData := AddWithSpace(sData,
    Trim(PartsSRC.DataSet.FieldByName('Paper_Weight').AsString));
  sData := AddWithSpace(sData,
    Trim(PartsSRC.DataSet.FieldByName('Paper_Brand').AsString));
  sData := AddWithSpace(sData,
    Trim(PartsSRC.DataSet.FieldByName('Paper_Material').AsString));

  if ((Trim(PartsSRC.DataSet.FieldByName('Face_Inks').AsString) <> '') or
    (Trim(PartsSRC.DataSet.FieldByName('Reverse_Inks').AsString) <> '')) then
  begin
   sData := AddWithSpace(sData, 'Printed');
   if Trim(PartsSRC.DataSet.FieldByName('Face_Inks').AsString) <> '' then
   begin
     sData := AddWithSpace(sData,
       Trim(PartsSRC.DataSet.FieldByName('Face_Inks').AsString));
     sData := AddWithSpace(sData, 'on face');
     if Trim(PartsSRC.Dataset.FieldByName('Reverse_Inks').AsString) = '' then
      sData := AddWithSpace(sData, 'only');
   end;

   if Trim(PartsSRC.DataSet.FieldByName('Reverse_Inks').AsString) <> '' then
   begin
     sData := AddWithSpace(sData,
       Trim(PartsSRC.DataSet.FieldByName('Reverse_Inks').AsString));
     sData := AddWithSpace(sData, 'on reverse');
     if Trim(PartsSRC.Dataset.FieldByName('Face_Inks').AsString) = '' then
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
    if Trim(PartsSRC.DataSet.FieldByName('Heading').AsString) <> '' then
      sData := sData + cLFCR + 'Heading: ' +
        Trim(PartsSRC.DataSet.FieldByName('Heading').AsString);
    end
  else
    if Trim(PartsSRC.DataSet.FieldByName('Heading').AsString) <> '' then
      sData := Trim(PartsSRC.DataSet.FieldByName('Heading').AsString) + ': ' + sData;

  {Insert any Plate Change details}
  if PartsSRC.DataSet.FieldByName('No_of_Plate_Changes').AsString <> '0' then
    sData := sData + cLFCR + 'Plate Changes: ' +
      PartsSRC.DataSet.FieldByName('No_of_Plate_Changes').AsString;

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

  {Decide what label to put against the part}
  if (PartsSRC.Dataset.recordcount = 1) and
     ((Trim(PartsSRC.DataSet.FieldByName('Part_Description').AsString) = '') or
     (Trim(PartsSRC.DataSet.FieldByName('Part_Description').AsString) = 'Part 1')) then
      sText := stext1
  else
    begin
      if Trim(PartsSRC.DataSet.FieldByName('Part_Description').AsString) <> '' then
        sText := PartsSRC.DataSet.FieldByName('Part_Description').AsString
      else
      if Trim(sText) <> '' then
        sText := sText +
          PartsSRC.DataSet.FieldByName('Part_No').AsString
      else
        sText := 'PART ' +
          PartsSRC.DataSet.FieldByName('Part_No').AsString;
(*      if Trim(element.Text) <> '' then
        sText := element.Text +
          PartsSRC.DataSet.FieldByName('Part_No').AsString
      else
        sText := 'PART ' +
          PartsSRC.DataSet.FieldByName('Part_No').AsString;
*)    end;

  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(sText, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecPartsInformation);
    FPrintRecord.RecordType := rtKeepTogether;
    FColumnRecord := CreateColumnRecord(sData);
    if dmLetter.OldDatabase then  { Hard code this }
      FColumnRecord.LeftMargin := 90
    else
      begin
      if element.UsesTab = '2' then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      end;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element),
      ecPartsInformation);
  end
  else
  begin
    FPrintRecord := SimpleText(sText + ' ' + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecPartsInformation);
    FPrintRecord.RecordType := rtKeepTogether;
  end;
  { Do NOT call AddOrMerge }
  FPrintRecords.Add(FPrintRecord);
  if dmLetter.OldDatabase then
    BlankLine;
end;

procedure TdbEnqLtr.AddParts;
begin
  with PartsSRC.DataSet do
    if RecordCount > 0 then
    begin
      if FLetter.Elements.ElementByNumber[ecPartsInformation].BlankBefore then
        BlankLineIfNeeded;
      First;
      while not EOF do
      begin
        AddPart;
        if FLetter.Elements.ElementByNumber[ecPartsInformation].BlankAfter then
          BlankLineIfNeeded;
        Next;
      end;
(*      if FLetter.Elements.ElementByNumber[ecPartsInformation].BlankAfter then
        BlankLineIfNeeded;
*)    end;
end;

function TdbEnqLtr.GetDetails : Integer;
begin
  {Activate the main report SQL}
  if GetRngsql then
    begin
    GetEnquiriesSql.SQL := GetRngEnqsSql.SQL;
    end;
  with GetEnquiriesSQL do
  begin
    Close;
    if GetRngSQL then
      ParamByName('iintselcode').AsInteger := iintselcode;
    ParamByName('Enquiry').AsInteger := EnquiryNo;
    ParamByName('Operator').AsInteger := Operator;
    ParamByName('BySupplier').AsString := BySupplier;
    ParamByName('Supplier').AsInteger := Supplier;
    ParamByName('ByBranch').AsString := ByBranch;
    ParamByName('Branch_No').AsInteger := Branch;
    Open;
    Result := RecordCount;
  end;
end;

procedure TdbEnqLtr.GetOtherData;
begin
  with GetPartsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    Open;
  end;
  with GetQuestionsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    ParamByName('Product_Type').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Product_Type').AsInteger;
    Open;
  end;
  with GetAddDetailsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    Open;
  end;
  with GetNotesSQL do
  begin
    Close;
    ParamByName('Narrative').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Narrative').AsInteger;
    Open;
  end;
  {Get the other quantities}
  with GetQtysSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    ParamByName('Supplier').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Supplier').AsInteger;
    ParamByName('Branch_No').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Branch_No').AsInteger;
    Open;
  end;
  with GetOptionsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    ParamByName('Product_Type').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Product_Type').AsInteger;
    Open;
  end;
end;

procedure TdbEnqLtr.AddNarrative;
var
  sText : string;
  element : TElement;
begin
  with GetNotesSQL do
  begin
    First;
    sText := '';
    while not EOF do
    begin
      sText := sText + FieldByName('Narrative_Text').AsString;
      if Length(FieldByName('Narrative_Text').AsString) < 100 then
        sText := sText + ' ';
      Next;
    end;
  end;
  if Trim(sText) <> '' then
  begin
    element := FLetter.Elements.ElementByNumber[ecNotes];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, ecNotes);
      FColumnRecord := CreateColumnRecord(sText);
      if element.UsesTab = '2' then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecNotes);
    end
    else
    if Trim(element.Text) <> '' then
    begin
      sText := element.Text + cLFCR + sText;
      FPrintRecord := SimpleText(sText, element);
      TextAlignAndFont(FPrintRecord, element.Column, ecNotes);
      case element.Column of
      2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
      3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
      else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
      end;  { case }
      DataAlignAndFont(FPrintRecord, element.Column, ecNotes);
      case element.Column of
      2 :  FPrintRecord.Column2.SpecialLine := 1;
      3 :  FPrintRecord.Column3.SpecialLine := 1;
      else FPrintRecord.Column1.SpecialLine := 1;
      end;  { case }
    end
    else
    begin
      FPrintRecord := SimpleText(sText, element);
      TextAlignAndFont(FPrintRecord, element.Column, ecNotes);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbEnqLtr.AddArtwork;
var
  sTemp : string;
  element : TElement;
begin
  with EnquiriesSRC.DataSet do
   if Trim(FieldByName('Artwork_Instructions').AsString) = '' then
     Exit;
  element := FLetter.Elements.ElementByNumber[ecArtWork];
  if element.BlankBefore then
    BlankLineIfNeeded;
  sTemp :=
    EnquiriesSRC.DataSet.FieldByName('Artwork_Instructions').AsString;
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, ecArtwork);
    FColumnRecord := CreateColumnRecord(sTemp);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecArtWork);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + sTemp, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, ecArtwork);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddAdditionalDetails;
var
  sText : string;
  element : TElement;
begin
  if GetAddDetailsSQL.RecordCount > 0 then
  begin
    element := FLetter.Elements.ElementByNumber[ecAdditionalDetails];
    if element.BlankBefore then
      BlankLineIfNeeded;
    sText := '';
    with AddDetailsSRC.Dataset do
    begin
      First;
      while not EOF do
      begin
        stext := sText + FieldByName('Details').AsString + cLFCR;
        Next;
      end;
    end;
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, ecAdditionalDetails);
      FPrintRecord.RecordType := rtKeepTogether;
      FColumnRecord := CreateColumnRecord(sText);
      if element.UsesTab = '2' then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

      DataAlignAndFont(FPrintRecord, AssignDataColumn(element),
        ecAdditionalDetails);
    end
    else
    begin
      FPrintRecord := SimpleText('', element);
      TextAlignAndFont(FPrintRecord, element.Column, ecAdditionalDetails);
      FPrintRecord.RecordType := rtKeepTogether;
      sText := element.Text + cLFCR + sText;
      case element.Column of
      2 :  FPrintRecord.Column2.Text := sText;
      3 :  FPrintRecord.Column3.Text := sText;
      else FPrintRecord.Column1.Text := sText;
      end;  { case }
      TextAlignAndFont(FPrintRecord, element.Column, ecAdditionalDetails);
      case element.Column of
      2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
      3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
      else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
      end;  { case }
      if dmLetter.OldDatabase then
        FPrintRecord.SpecialFont.Style := [fsBold];
      DataAlignAndFont(FPrintRecord, element.Column, ecAdditionalDetails);
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

procedure TdbEnqLtr.AddBoxedIn;
var
  sTemp : string;
  element : TElement;
begin
  if Trim(EnquiriesSRC.DataSet.FieldByName('Forms_Per_Box').AsString) = '' then
    Exit;
  element := FLetter.Elements.ElementByNumber[ecBoxedIn];
  if element.BlankBefore then
    BlankLineIfNeeded;
  sTemp := EnquiriesSRC.DataSet.FieldByName('Forms_Per_Box').AsString;
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, ecBoxedIn);
    FColumnRecord := CreateColumnRecord(sTemp);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecBoxedIn);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + sTemp, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, ecBoxedIn);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddQuestionsAnswers;
var
  sTemp : string;
  iLen  : integer;
  element : TElement;
begin
  if GetQuestionsSQL.RecordCount > 0 then
  begin
    if dmLetter.OldDatabase then
      BlankLineIfNeeded;
    element := FLetter.Elements.ElementByNumber[ecQuestionsAndAnswers];
    GetQuestionsSQL.First;
    while not GetQuestionsSQL.EOF do
    begin
      if Trim(GetQuestionsSQL.FieldByName('Product_Answer').AsString) <> '' then
      begin
        if dmLetter.OldDatabase or ((element.UsesTab <> 'Y') and
                                    (element.UsesTab <> '1') and
                                    (element.UsesTab <> '2')) then
        begin
          FPrintRecord :=
            SimpleText(GetQuestionsSQL.FieldByName('Question_Text').AsString
            + ': ' +
            GetQuestionsSQL.FieldByName('Product_Answer').AsString, element);
          TextAlignAndFont(FPrintRecord, element.Column, ecQuestionsAndAnswers);
        end
        else
        begin
          if element.BlankBefore then
            BlankLineIfNeeded;
          sTemp := GetQuestionsSQL.FieldByName('Question_Text').AsString + ': ';
          FPrintRecord := SimpleText(sTemp, element);
          TextAlignAndFont(FPrintRecord, element.Column, ecQuestionsAndAnswers);
          case element.Column of
          2 :  iLen := TextLength(sTemp, FPrintRecord.Column2.Font) + 12;
          3 :  iLen := TextLength(sTemp, FPrintRecord.Column3.Font) + 12;
          else iLen := TextLength(sTemp, FPrintRecord.Column1.Font) + 12;
          end;  { case }

          FColumnRecord := CreateColumnRecord(
            GetQuestionsSQL.FieldByName('Product_Answer').AsString);
          FColumnRecord.LeftMargin := Max(iLen, FLetter.TabStop1Pixels);
          DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecQuestionsAndAnswers);
        end;
        FPrintRecords.Add(FPrintRecord);  { DO NOT AddOrMerge }
        if element.BlankAfter and not dmLetter.OldDatabase then
          BlankLine;
      end;
      GetQuestionsSQL.Next;
    end;
    if dmLetter.OldDatabase then
      BlankLine;
  end;
end;


procedure TdbEnqLtr.AddOptions;
var
  sText : string;
  element : TElement;
begin
  if GetOptionsSQL.RecordCount > 0 then
  begin
    element := FLetter.Elements.ElementByNumber[ecOptions];
    if element.BlankBefore then
      BlankLineIfNeeded;
    sText := '';
    with GetOptionsSQL do
    begin
      First;
      while not EOF do
      begin
        stext := sText + FieldByName('Description').AsString + cLFCR;
        Next;
      end;
    end;
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, ecOptions);
      FPrintRecord.RecordType := rtKeepTogether;
      FColumnRecord := CreateColumnRecord(sText);
      if element.UsesTab = '2' then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

      DataAlignAndFont(FPrintRecord, AssignDataColumn(element),
        ecOptions);
    end
    else
    begin
      FPrintRecord := SimpleText('', element);
      TextAlignAndFont(FPrintRecord, element.Column, ecOptions);
      FPrintRecord.RecordType := rtKeepTogether;
      sText := element.Text + cLFCR + sText;
      case element.Column of
      2 :  FPrintRecord.Column2.Text := sText;
      3 :  FPrintRecord.Column3.Text := sText;
      else FPrintRecord.Column1.Text := sText;
      end;  { case }
      TextAlignAndFont(FPrintRecord, element.Column, ecOptions);
      case element.Column of
      2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
      3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
      else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
      end;  { case }
      if dmLetter.OldDatabase then
        FPrintRecord.SpecialFont.Style := [fsBold];
      DataAlignAndFont(FPrintRecord, element.Column, ecOptions);
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

procedure TdbEnqLtr.AddQuoteBy;
var
  element : TElement;
  sText : string;
begin
  element := FLetter.Elements.ElementByNumber[ecQuoteDate];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then
    sText := 'Quote Required By: '
  else
    sText := element.Text;
  if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                             (element.UsesTab <> '1') and
                             (element.UsesTab <> '2') then  { Forms Technology hard coding }
  begin
    FPrintRecord := SimpleText(sText +
      EnquiriesSRC.DataSet.FieldByName('Quote_Required_By').AsString, element);
    FPrintRecord.Column1.Alignment :=
      FLetter.Elements.ElementByNumber[ecQuoteDate].Alignment;
    TextAlignAndFont(FPrintRecord, element.Column, ecQuoteDate);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecQuoteDate);
    FColumnRecord := CreateColumnRecord(
      EnquiriesSRC.DataSet.FieldByName('Quote_Required_By').AsString);
    FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecQuoteDate);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddPostamble;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecPostAmble];
  FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR, element);
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, ecPostAmble);
  AddOrMerge(FPrintRecord);
end;

procedure TdbEnqLtr.AddSignatory;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecSignatory];
  FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR
    + cLFCR + cLFCR + cLFCR + cLFCR +
    EnquiriesSRC.DataSet.FieldByName('Rep_Name').AsString + cLFCR +
    EnquiriesSRC.DataSet.FieldByName ('Rep_Position').AsString,
    element);
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, ecSignatory);
  AddOrMerge(FPrintRecord);
end;

procedure TdbEnqLtr.AddAddressee;
var
  i : integer;
  sTemp : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecAddressee];
  sTemp := '';
  with GetEnquiriesSQL do
    begin
    if fieldbyname('Contact_no').asstring <> '' then
      sTemp := Trim(GetSuppContactName(FieldByName('Supplier').Asinteger,
                                      FieldByName('Branch_no').Asinteger,
                                      FieldByName('Contact_no').Asinteger));
    for i := 0 to 6 do
      if Trim(Fields[i].AsString) <> '' then
      begin
        if (sTemp <> '') then
          sTemp := sTemp + cLFCR;
        sTemp := sTemp + Fields[i].AsString;
      end;
    end;
  FPrintRecord := SimpleText(sTemp, element);
  DataAlignAndFont(FPrintRecord, element.Column, ecAddressee);
  if dmLetter.OldDatabase then
    FPrintRecord.Column1.Width := Trunc(2.6*96);
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddContact;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecContact];

  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Contact:', element);
    TextAlignAndFont(FPrintRecord, 2, ecContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Name').AsString);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, ecContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecContact);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Name').AsString);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecContact);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text +
      EnquiriesSRC.DataSet.FieldByName('Contact_Name').AsString, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecContact);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
{$IFDEF PMS}
  if EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString <> '' then
    AddContactEmail;
  if EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString <> '' then
    AddContactPhone;
{$ENDIF}
{$IFDEF BESLEYCOPP}
  if EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString <> '' then
    AddContactEmail;
  if EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString <> '' then
    AddContactPhone;
{$ENDIF}
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddContactEmail;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecContact];

  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Email: ', element);
    TextAlignAndFont(FPrintRecord, 2, ecContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, ecContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText('Email: ', element);
    TextAlignAndFont(FPrintRecord, element.Column, ecContact);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecContact);
  end
  else
  begin
    FPrintRecord := SimpleText('Email: ' +
      EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecContact);
  end;
  AddOrMerge(FPrintRecord);
end;

procedure TdbEnqLtr.AddContactPhone;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecContact];

  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Direct Dial: ', element);
    TextAlignAndFont(FPrintRecord, 2, ecContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, ecContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText('Direct Dial: ', element);
    TextAlignAndFont(FPrintRecord, element.Column, ecContact);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecContact);
  end
  else
  begin
    FPrintRecord := SimpleText('Direct Dial: ' +
      EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecContact);
  end;
  AddOrMerge(FPrintRecord);
end;

procedure TdbEnqLtr.AddDate;
var
  element : TElement;
  EnqDate : TDateTime;
begin
  element := FLetter.Elements.ElementByNumber[ecDate];
  enqDate := EnquiriesSRC.DataSet.FieldByName('Date_Point').AsDateTime;

  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText(cLFCR + 'Date:', element);
    TextAlignAndFont(FPrintRecord, 2, ecDate);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord(cLFCR +
      FormatDateTime('d mmmm yyyy', EnqDate));
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, ecDate);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecDate);
    FColumnRecord := CreateColumnRecord(FormatDateTime('d mmmm yyyy', EnqDate));
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecDate);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text +
      FormatDateTime('d mmmm yyyy', EnqDate), element);
    TextAlignAndFont(FPrintRecord, element.Column, ecDate);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddQuantity;
var
  sQty : string;
  element : TElement;
begin
  with GetQtysSQL do
  begin
    First;
    sQty := '';
    while not EOF do
    begin
      if sQty <> '' then
        sQty := sQty + ' / ';
      sQty := sQty + Formatfloat('###,###,###',FieldByName('Quantity').Asfloat);
      Next;
    end;
  end;

  if (EnquiriesSRC.DataSet.FieldByName('Run_on_Quantity').AsString <> '') and
     (EnquiriesSRC.DataSet.FieldByName('Run_on_Quantity').Asinteger <> 0) then
    sQty := sQty + ' + ' + Formatfloat('###,###,###',EnquiriesSRC.DataSet.FieldByName('Run_on_Quantity').Asfloat) + ' run on';

  element := FLetter.Elements.ElementByNumber[ecQuantities];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then
    element.FontStyle := cBold;
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, ecQuantities);
    FColumnRecord := CreateColumnRecord(sQty);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecQuantities);
    AddOrMerge(FPrintRecord);
    if dmLetter.OldDatabase then { much frigging to mimic Forms Technology }
    begin
      FPrintRecord := GetLastRecord;
      FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
      FPrintRecord.SpecialFont.Style := [fsBold];
      FPrintRecord.Column1.SpecialLine := 2;
      FPrintRecord.Column2.SpecialLine := 2;
    end;
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + sQty, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, ecQuantities);
    AddOrMerge(FPrintRecord);
  end;
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TdbEnqLtr.SetByBranch(const Value: char);
begin
  FByBranch := Value;
end;

procedure TdbEnqLtr.SetBySupplier(const Value: char);
begin
  FBySupplier := Value;
end;

procedure TdbEnqLtr.SetOnlyMine(const Value: Boolean);
begin
  FOnlyMine := Value;
end;

procedure TdbEnqLtr.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TdbEnqLtr.SetPreview(const Value: Boolean);
begin
  FPreview := Value;
end;

procedure TdbEnqLtr.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TdbEnqLtr.SetAcknowledgements(const Value: Boolean);
begin
  FAcknowledgements := Value;
end;

procedure TdbEnqLtr.SetEnquiryNo(const Value: integer);
begin
  FEnquiryNo := Value;
end;

procedure TdbEnqLtr.BuildOneLetter;
var
  i : integer;
begin
for i := 0 to Pred(FLetter.Elements.Count) do
    if FLetter.Elements[i].Number in [ecAddressee..ecOptions] then
      if (FLetter.Elements[i].Printed) and (((filecopy = true) and (FLetter.Elements[i].number >1)) or
            (filecopy = false)) then
        FProcedures[FLetter.Elements[i].Number];
  AddUpdateInfo;
  AddEndRecord;  { The End }
  {if filecopy do not print address and contact }
end;

procedure TdbEnqLtr.UpdateStatus(UpdateInfo : TUpdateInfo);
var
  iTempStatus: Integer;
begin
  {Update the status of the current line}
  if Preview then Exit;
  {Set the Printed_Enquiry flag on Supplier_Enquiry to 'Y' }
  with UpdStatusSQL do
  begin
    ParamByName('Enquiry').AsInteger := UpdateInfo.EnquiryNo;
    ParamByName('Line').AsInteger := UpdateInfo.Line;
    ParamByName('Supplier').AsInteger := UpdateInfo.Supplier;
    ParamByName('Branch_No').AsInteger := UpdateInfo.BranchNo;
    ExecSQL;
  end;
  {Check if there are any unprinted Supplier_Enquiry records left}
  with GetUPSuppEnqSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := UpdateInfo.EnquiryNo;
    ParamByName('Line').AsInteger := UpdateInfo.Line;
    Open;
  end;

  if GetEnqLineStatus(updateInfo) < 30 then
  begin
    {Update the line enquiry status to 30 (sent to supplier) if it was < 30 }
    with UpdLineStatusSQL do
    begin
      ParamByName('Enquiry').AsInteger := UpdateInfo.EnquiryNo;
      ParamByName('Line').AsInteger := UpdateInfo.Line;
      ExecSQL;
    end;
  end;  

  with GetUPEnqLineSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := UpdateInfo.EnquiryNo;
    Open;
    First;
    iTempStatus := FieldByName('Min_Status').AsInteger;
    Close;
  end;
  if iTempStatus < 25 then iTempStatus := 25;


  if GetEnqHeadStatus(updateInfo) < 30 then
  begin
    {Update the enquiry status to 25 or 30 (sent to supplier) if it was < 30 }
    with UpdHeadStatusSQL do
    begin
      ParamByName('Enquiry').AsInteger := UpdateInfo.EnquiryNo;
      ParamByName('Enquiry_Status').AsInteger := iTempStatus;
      ExecSQL;
    end;
  end;
end;

procedure TdbEnqLtr.AddUpdateInfo;
var
  UpdateInfo : TUpdateInfo;
begin
  FPrintRecord := TPrintRecord.Create;
  FPrintRecord.RecordType := rtUpdateInfo;
  UpdateInfo := TUpdateInfo.Create;
  UpdateInfo.EnquiryNo := EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
  UpdateInfo.Line := EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
  UpdateInfo.Supplier := EnquiriesSRC.DataSet.FieldByName('Supplier').AsInteger;
  UpdateInfo.BranchNo := EnquiriesSRC.DataSet.FieldByName('Branch_No').AsInteger;
  FPrintRecord.UpdateInfo := UpdateInfo;
  FPrintRecords.Add(FPrintRecord);
end;

procedure TdbEnqLtr.AddPlate;
var
  element : TElement;
begin
  {Insert any Plate Change details}
  if EnquiriesSRC.DataSet.FieldByName('No_of_Plates').AsString <> '0' then
  begin
    element := FLetter.Elements.ElementByNumber[ecPlates];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
      FPrintRecord := SimpleText('Number of Plates: ' +
          EnquiriesSRC.DataSet.FieldByName('No_of_Plates').AsString, element);
      TextAlignAndFont(FPrintRecord, element.Column, ecPlates);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, ecPlates);
      FColumnRecord := CreateColumnRecord(
          EnquiriesSRC.DataSet.FieldByName('No_of_Plates').AsString);
      if element.UsesTab = '2' then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecPlates);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbEnqLtr.AddDescription;
var
  sDepth, sWidth, sSize, sLinker, sData: string;
  element : TElement;
  bprintSize: boolean;
begin
  bprintSize := false;
  {If Hard Coded i.e. Forms Technology then get the size info.}
  if dmLetter.OldDatabase then { Hard coded }
    begin
      {Set Depth if value other than zero}
      if EnquiriesSRC.Dataset.FieldByName('Depth').Asfloat = 0 then
        sDepth := ''
      else
        sDepth := floattostr(EnquiriesSRC.Dataset.FieldByName('Depth').Asfloat) +
        EnquiriesSRC.Dataset.FieldByName('Depth_Unit').AsString;

      {Set Width if value other than zero}
      if EnquiriesSRC.Dataset.FieldByName('Width').Asfloat = 0 then
        sWidth := ''
      else
        sWidth := floattostr(EnquiriesSRC.Dataset.FieldByName('Width').Asfloat) +
        EnquiriesSRC.Dataset.FieldByName('Width_Unit').AsString;

      {Set Size Description}
      if  (sDepth = '') or
          (sWidth = '') then
        sLinker := ''
      else
        sLinker := ' x ';

      sSize := sDepth + sLinker + sWidth;

      if trim(sSize) = '' then
        sData := Trim(EnquiriesSRC.Dataset.FieldByName('Form_Description').AsString)
      else
        sData := Trim(EnquiriesSRC.Dataset.FieldByName('Form_Description').AsString) + ', ' + sSize;
    end
  else
    begin
      element := FLetter.Elements.ElementByNumber[ecSize];
      bPrintSize := not element.Printed;
      if bPrintsize then
        begin
          {Set Depth if value other than zero}
          if EnquiriesSRC.Dataset.FieldByName('Depth').Asfloat = 0 then
            sDepth := ''
          else
            sDepth := floattostr(EnquiriesSRC.Dataset.FieldByName('Depth').Asfloat) +
                      EnquiriesSRC.Dataset.FieldByName('Depth_Unit').AsString;

          {Set Width if value other than zero}
          if EnquiriesSRC.Dataset.FieldByName('Width').Asfloat = 0 then
            sWidth := ''
          else
            sWidth := floattostr(EnquiriesSRC.Dataset.FieldByName('Width').Asfloat) +
                      EnquiriesSRC.Dataset.FieldByName('Width_Unit').AsString;

          {Set Size Description}
          if  (sDepth = '') or
              (sWidth = '') then
            sLinker := ''
          else
            sLinker := ' x ';

          sSize := sDepth + sLinker + sWidth;

          if trim(sSize) = '' then
            sData := Trim(EnquiriesSRC.Dataset.FieldByName('Form_Description').AsString)
          else
            sData := Trim(EnquiriesSRC.Dataset.FieldByName('Form_Description').AsString) + ', ' + sSize;
        end
      else
        sData := Trim(EnquiriesSRC.Dataset.FieldByName('Form_Description').AsString);
    end;
  element := FLetter.Elements.ElementByNumber[ecDescription];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then { Hard coded }
  begin
    FPrintRecord := SimpleText('DESCRIPTION ', element);
    TextAlignAndFont(FPrintRecord, element.Column, ecDescription);
    FColumnRecord := CreateColumnRecord(sData);
    FColumnRecord.LeftMargin := Trunc(1.3 * 96);
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecDescription);
  end
  else
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecDescription);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecDescription);
    FColumnRecord := CreateColumnRecord(sData);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecDescription);
  end;
  AddOrMerge(FPrintRecord);

  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddSize;
var
  sDepth, sWidth, sSize, sLinker, sData: string;
  element : TElement;
begin
  if dmLetter.OldDatabase then exit; { Hard coded }

  {Set Depth if value other than zero}
  if EnquiriesSRC.Dataset.FieldByName('Depth').Asfloat = 0 then
    sDepth := ''
  else
    sDepth := floattostr(EnquiriesSRC.Dataset.FieldByName('Depth').Asfloat) +
    EnquiriesSRC.Dataset.FieldByName('Depth_Unit').AsString;

  {Set Width if value other than zero}
  if EnquiriesSRC.Dataset.FieldByName('Width').Asfloat = 0 then
    sWidth := ''
  else
    sWidth := floattostr(EnquiriesSRC.Dataset.FieldByName('Width').Asfloat) +
    EnquiriesSRC.Dataset.FieldByName('Width_Unit').AsString;

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
    sData := trim(sSize);

  element := FLetter.Elements.ElementByNumber[ecSize];
  if element.BlankBefore then
    BlankLineIfNeeded;

  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecSize);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecSize);
    FColumnRecord := CreateColumnRecord(sData);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecSize);
  end;
  AddOrMerge(FPrintRecord);

  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddPreamble;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[ecPreamble];
  if pos('<Contact_Email>',element.Text) > 0 then
    element.Text := stringreplace(element.Text,'<Contact_Email>',GetOperatorEmail(EnquiriesSRC.DataSet.FieldByName('Office_Contact').asinteger),[rfIgnoreCase]);
  if element.BlankBefore then
    BlankLineIfNeeded;
  FPrintRecord := SimpleText(element.Text, element);
  TextAlignAndFont(FPrintRecord, element.Column, ecPreamble);
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.AddToWhom;
var
  Salutation, DefaultText: string;
var
  element : TElement;
begin
  Defaulttext := 'For the attention of the Estimating Department';
  with EnquiriesSRC.Dataset do
  begin
  if FieldByName('Contact_no').AsString = '' then
    Salutation := ''
  else
    begin
    salutation := trim(GetSuppContactSal(FieldByName('Supplier').Asinteger,
                                        FieldByName('Branch_no').Asinteger,
                                        FieldByName('Contact_no').Asinteger));
    if salutation = '' then
      salutation := trim(GetSuppContactName(FieldByName('Supplier').Asinteger,
                                        FieldByName('Branch_no').Asinteger,
                                        FieldByName('Contact_no').Asinteger));
    salutation := salutation + ',';
    end;
  end;

  element := FLetter.Elements.ElementByNumber[ecToWhom];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if Salutation = '' then
    FPrintRecord := SimpleText(Defaulttext, element)
  else
    FPrintRecord := SimpleText(AddWithSpace(element.Text, Salutation), element);
  TextAlignAndFont(FPrintRecord, element.Column, ecToWhom);
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

function TdbEnqLtr.GetSuppContactSal(const iSupp, iBranch, iContact: integer): string;
begin
  with GetSuppContactSQL do
  begin
    Close;
    ParamByname('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := iBranch;
    ParamByName('Contact_No').AsInteger := iContact;
    Open;
    Result := FieldByName('Salutation').AsString;
    Close;
  end;
end;

function TdbEnqLtr.GetOperatorEmail(const iContact: integer): string;
begin
  with GetOperatorSQL do
  begin
    Close;
    ParamByName('Operator').AsInteger := iContact;
    Open;
    Result := trim(FieldByName('Email').AsString);
    if result = '' then
      result := 'the contact above';
    Close;
  end;
end;

function TdbEnqLtr.GetSuppContactName(const iSupp, iBranch, iContact: integer): string;
begin
  with GetSuppContactSQL do
  begin
    Close;
    ParamByname('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := iBranch;
    ParamByName('Contact_No').AsInteger := iContact;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;
procedure TdbEnqLtr.setRngSQL(const Value: Boolean);
begin
  fGetRngSQL := Value;
end;

procedure TdbEnqLtr.AddFormRef;
var
  sData, sFormRef: string;
  element : TElement;
begin

  sFormRef :=
    trim(GetFormRefID(EnquiriesSRC.Dataset.FieldByName('Form_Reference').AsInteger));
  if sFormRef = '' then
    exit;

  element := FLetter.Elements.ElementByNumber[ecFormRef];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then { Hard coded }
  begin
    if sFormRef <> '' then
      sData := sFormRef;

    FPrintRecord := SimpleText('Form Ref ', element);
    TextAlignAndFont(FPrintRecord, element.Column, ecFormRef);
    FColumnRecord := CreateColumnRecord(sData);
    FColumnRecord.LeftMargin := Trunc(1.3 * 96);
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecFormRef);

  end
  else
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    if sFormRef <> '' then
      sData := sFormRef;
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecFormRef);
  end
  else
  begin
    if sFormRef <> '' then
      sData := sFormRef;
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, ecFormRef);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), ecFormRef);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbEnqLtr.SetFileCopy(const Value: Boolean);
begin
  FFileCopy := Value;
end;

function TdbEnqLtr.GetEnqHeadStatus(UpdateInfo: TUpdateInfo): integer;
begin
  qrySelEnqStatus.close;
  qrySelEnqStatus.ParamByName('enquiry').asInteger := UpdateInfo.EnquiryNo;
  qrySelEnqStatus.open;

  Result := qrySelEnqStatus.FieldByName('enquiry_status').asInteger;
  qrySelEnqStatus.close;
end;

function TdbEnqLtr.GetEnqLineStatus(UpdateInfo: TUpdateInfo): integer;
begin
  qrySelEnqLineStatus.close;
  qrySelEnqLineStatus.ParamByName('enquiry').asInteger := UpdateInfo.EnquiryNo;
  qrySelEnqLineStatus.ParamByName('line').asInteger := UpdateInfo.Line;
  qrySelEnqLineStatus.open;

  Result := qrySelEnqLineStatus.FieldByName('enquiry_status').asInteger; 
  qrySelEnqLineStatus.close;
end;

end.
