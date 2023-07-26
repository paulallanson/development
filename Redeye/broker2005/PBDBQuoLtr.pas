(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Printing data module for Quotation Letter printing.

VSS Info:
$Header: /PBL D5/PBDBQuoLtr.pas 46    7/01/:3 11:47 Paul $
$History: PBDBQuoLtr.pas $
 * 
 * *****************  Version 46  *****************
 * User: Paul         Date: 7/01/:3    Time: 11:47
 * Updated in $/PBL D5
 * Added function to print spaces after each part line, also introduced
 * change to Page Designer to have an alternative to Paper when only
 * printing one part details.
 * 
 * *****************  Version 45  *****************
 * User: Paul         Date: 6/01/:3    Time: 14:52
 * Updated in $/PBL D5
 * Changed to print optional charges
 * 
 * *****************  Version 44  *****************
 * User: Paul         Date: 19/12/:2   Time: 15:39
 * Updated in $/PBL D5
 * Changed to add the size to description if Size element is not to be
 * printed
 * 
 * *****************  Version 43  *****************
 * User: Paul         Date: 16/12/:2   Time: 14:38
 * Updated in $/PBL D5
 * Changed the print to only print the title "Paper" if only one part and
 * if the Part Description is either blank or is "Part 1" 
 * 
 * *****************  Version 42  *****************
 * User: Davidn       Date: 5/11/02    Time: 16:37
 * Updated in $/PBL D5
 * email problem, multiple emails going for each line in quotation.
 * 
 * *****************  Version 40  *****************
 * User: Pahome       Date: 23/09/:2   Time: 17:19
 * Updated in $/PBL D5
 * Changed so that if only one part, then no PART 1 is printed. 
 * 
 * *****************  Version 39  *****************
 * User: Pahome       Date: 17/09/:2   Time: 16:00
 * Updated in $/PBL D5
 * Changed to extract out the Size from the Description and make it a new
 * element of Page Designer
 * 
 * *****************  Version 38  *****************
 * User: Paul         Date: 5/09/:2    Time: 9:42
 * Updated in $/PBL D5
 * Changed to display the Run On Qty if one has been entered.
 * 
 * *****************  Version 37  *****************
 * User: Janiner      Date: 27/02/:2   Time: 11:04
 * Updated in $/PBL D5
 * Add form reference to be maintained by pagedesigner.
 * 
 * *****************  Version 36  *****************
 * User: Paul         Date: 22/02/:2   Time: 15:37
 * Updated in $/PBL D5
 * Added functionality to show total value of quote, order etc based on
 * the Price Unit flag, "Show on report"
 * 
 * *****************  Version 35  *****************
 * User: Janiner      Date: 11/10/:1   Time: 8:16
 * Updated in $/PBL D5
 * Allow printing of additional charges for the selected supplier of each
 * quantity for this order line.
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
 * User: Janiner      Date: 5/07/:1    Time: 13:37
 * Created in $/PBL D5 - Prototypes
 * 
 * *****************  Version 34  *****************
 * User: Janiner      Date: 28/06/:1   Time: 12:11
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
 * User: Janiner      Date: 27/06/:1   Time: 15:23
 * Created in $/pbld5 - prototypes
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 13:50
 * Created in $/PBLD5-~1
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 27/06/:1   Time: 11:56
 * Created in $/PBLD5 - Prototypes/PBLD5-~1
 * 
 * *****************  Version 32  *****************
 * User: Paul         Date: 6/03/:1    Time: 14:24
 * Updated in $/PBL D5
 * Changed to make the UsesTab a string so that the Page Designer will
 * have the facility to select Tab 1 and Tab 2.
 * 
 * *****************  Version 31  *****************
 * User: Paul         Date: 16/02/:1   Time: 12:11
 * Updated in $/PBL D5
 * Changed to pick up the correct contact name when using Page Designer
 * 
 * *****************  Version 30  *****************
 * User: Paul         Date: 16/02/:1   Time: 10:25
 * Updated in $/PBL D5
 * Corrected problem where Office contact was printing as the Operator
 * 
 * *****************  Version 29  *****************
 * User: Paul         Date: 17/11/:0   Time: 11:51
 * Updated in $/PBL D5
 * Changed to display Form Ref if using a non-Page Designer database.
 * 
 * *****************  Version 28  *****************
 * User: Paul         Date: 16/11/:0   Time: 12:27
 * Updated in $/PBL D5
 * Changed to correctly display the Office contact when printing the
 * Purchase  Orders, Acks, Quotes and Enqs.
 * 
 * *****************  Version 27  *****************
 * User: Paul         Date: 29/06/:0   Time: 15:39
 * Updated in $/PBL D5
 * Changed to display the Heading details for each part at the Start of
 * the Part details, this was specifically done for Broadsword if using
 * the Page Designer, if not using Page Designer then the Heading details
 * are printed on the line after the Part details.
 * 
 * *****************  Version 26  *****************
 * User: Paul         Date: 13/04/:0   Time: 15:11
 * Updated in $/PBL D5
 * Corrected the display of the Depth and Width so that all decimals are
 * displayed, previously everything was displayed only as integers.
 * 
 * *****************  Version 25  *****************
 * User: Paul         Date: 30/03/:0   Time: 15:03
 * Updated in $/PBL D5
 * Changed to decide whether to display the Depth and Width fields. If
 * they are zero then don't display
 * 
 * *****************  Version 24  *****************
 * User: Roddym       Date: 21/03/:0   Time: 15:21
 * Updated in $/PBL D5
 * Use Operator_Name rather than Rep_Name for Contact
 * 
 * *****************  Version 23  *****************
 * User: Roddym       Date: 21/03/:0   Time: 14:38
 * Updated in $/PBL D5
 * Minor tweaks to ensure Forms Technology printouts look the way they
 * always did.
 * 
 * *****************  Version 22  *****************
 * User: Roddym       Date: 20/03/:0   Time: 17:24
 * Updated in $/PBL D5
 * Fine tune layout of "old" style letters for Forms Technology.
 * 
 * *****************  Version 21  *****************
 * User: Roddym       Date: 14/03/:0   Time: 14:59
 * Updated in $/PBL D5
 * Use new Part_Description field instead of "Part N" if not null.
 * 
 * *****************  Version 20  *****************
 * User: Roddym       Date: 10/03/:0   Time: 16:13
 * Updated in $/PBL D5
 * Make the UsesTab attribute visible and allow users to change it.
 * 
 * *****************  Version 19  *****************
 * User: Roddym       Date: 10/03/:0   Time: 10:54
 * Updated in $/PBL D5
 * Change questions and answers to print blank lines between each q&a
 * rather than round a block of q&a's.
 * 
 * *****************  Version 18  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:11
 * Updated in $/PBL D5
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 17  *****************
 * User: Roddym       Date: 15/02/:0   Time: 17:12
 * Updated in $/PBL D5
 * New feature to allow setting of two tab stops per letter so the user
 * can size the virtual columns.
 * 
 * *****************  Version 16  *****************
 * User: Roddym       Date: 10/02/:0   Time: 16:28
 * Updated in $/PBL D5
 * Allow choice between one quotation letter per enquiry line or one
 * letter for all lines.  Depends on PageDesigner and database changes.
 * 
 * *****************  Version 15  *****************
 * User: Roddym       Date: 3/02/:0    Time: 15:53
 * Updated in $/PBL D5
 * Remove commas from the end of address lines.  Oh why did my English
 * teachers ever bother?  How far can illiteracy go in modern society
 * before we drown under a tidal wave of gibberish?
 * 
 * *****************  Version 14  *****************
 * User: Roddym       Date: 25/01/:0   Time: 8:23
 * Updated in $/PBL D5
 * Fix condition in AddPart deciding if ink information to be printed
 * (boolean was NOT... OR rather than NOT... AND).
 * 
 * *****************  Version 13  *****************
 * User: Roddym       Date: 20/01/:0   Time: 15:04
 * Updated in $/PBL D5
 * Fix bug:  was printing "PART x Printed" when there wasn't any part
 * info.
 * 
 * *****************  Version 12  *****************
 * User: Roddym       Date: 12/01/:0   Time: 11:43
 * Updated in $/PBL D5
 * Fix bug where narrative text was being built using AddWithSpace
 * function rather than just simple concatenation.
 * 
 * *****************  Version 11  *****************
 * User: Roddym       Date: 12/01/:0   Time: 9:13
 * Updated in $/PBL D5
 * Assorted layout fixes in enquiry, quotation, purchase order and
 * acknowledgement letters.  Fixes to faxing code where incorrect layout
 * being used.  Use operator name for contact at start of letter.  Do not
 * print slash if no rep suffix.  Print rep position after signatory.
 * 
 * *****************  Version 10  *****************
 * User: Roddym       Date: 10/01/:0   Time: 14:55
 * Updated in $/PBL D5
 * Minor fixes to new printing routines, things like signatory, getting
 * bold lines right, drop contact suffix if empty.
 *
 * *****************  Version 9  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:42
 * Updated in $/PBL D5
 * Changes for new letter printing mechanism, driven by the
 * tb_LetterLayout and tb_LetterElement tables.  New Letter object, also
 * hard-coded version to make switch transparent to Forms Technology.
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 24/12/99   Time: 9:56
 * Updated in $/PBL D5
 * Database changes so Purchase Orders don't need to refer to Enquiry
 * details.  Fixes to Quotation letter to show all quantities.  
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 20/12/99   Time: 11:10
 * Updated in $/PBL D5
 * Fix bug where continuation text on multiple letters/faxes was always
 * that of the last letter/fax to be printed.
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 16/12/99   Time: 17:29
 * Updated in $/PBL D5
 * Remove PrintLogo property from databrokers, use LayoutName instead.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 *
 * *****************  Version 4  *****************
 * User: Roddym       Date: 14/12/99   Time: 17:32
 * Updated in $/PBL D5
 * Update status fields as things are printed.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 14/12/99   Time: 15:20
 * Updated in $/PBL D5
 * Fixes to Additional Details printing when none exist and puting
 * questions and answers on same line separated by colon.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 13/12/99   Time: 15:13
 * Updated in $/PBL D5
 * Don't print artwork or forms per box if no data.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 13/12/99   Time: 11:02
 * Created in $/PBL D5
 * First check-in of databroker for Quotation letters.

*******************************************************************************)
unit PBDBQuoLtr ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CCSDataBroker, Db, CCSPrint, PDLetter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdbQuoLtr = class(TDataBroker)
    GetNotesSQL: TFDQuery;
    UpdEnqStatusSQL: TFDQuery;
    GetPricesSQL: TFDQuery;
    QuestionsSRC: TDataSource;
    EnquiriesSRC: TDataSource;
    UpdStatusSQL: TFDQuery;
    GetQtysSQL: TFDQuery;
    GetAddDetailsSQL: TFDQuery;
    GetRngEnqsSQL: TFDQuery;
    PartsSRC: TDataSource;
    GetQuestionsSQL: TFDQuery;
    PricesSRC: TDataSource;
    GetPartsSQL: TFDQuery;
    AddDetailsSRC: TDataSource;
    GetEnquiriesSQL: TFDQuery;
    GetExtrasSQL: TFDQuery;
    ExtrasSRC: TDataSource;
    GetOptChgsSQL: TFDQuery;
  private
    fGetRngSQL: Boolean;
    procedure setRngSQL(const Value: Boolean);
    procedure AddContactEmail;
    procedure AddContactPhone;
  protected
    FOnlyMine: Boolean;
    FPreview: Boolean;
    FByBranch: char;
    FByCustomer: char;
    FOperator: integer;
    FBranch: integer;
    FEnquiryNo: integer;
    FCustomer: integer;
    FProcedures: array[qcAddressee..qcSize] of TBrokerProc;
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
    procedure AddExtraCharge;
    procedure AddPlate;
    procedure AddNarrative;
    procedure AddArtwork;
    procedure AddPrice;
    procedure AddBoxedIn;
    procedure AddAdditionalDetails;
    procedure AddQuestionsAnswers;
    procedure AddPostamble; 
    procedure AddFormRef;
    procedure AddSignatory;
    procedure AddUpdateInfo;
    procedure BuildContinuation(const Heading : string);
    procedure BuildProcedures; virtual;
    procedure SetBranch(const Value: integer);
    procedure SetByBranch(const Value: char);
    procedure SetByCustomer(const Value: char);
    procedure SetCustomer(const Value: integer);
    procedure SetEnquiryNo(const Value: integer);
    procedure SetOnlyMine(const Value: Boolean);
    procedure SetOperator(const Value: integer);
    procedure SetPreview(const Value: Boolean);
  public
    iintselcode: integer;
    procedure BuildPageLayout; override;
    procedure BuildPrintRecords; override;
    procedure UpdateStatus(UpdateInfo: TUpdateInfo); override;
    function  GetDetails : integer;
    property Branch : integer read FBranch write SetBranch;
    property ByBranch : char read FByBranch write SetByBranch;
    property ByCustomer : char read FByCustomer write SetByCustomer;
    property Customer : integer read FCustomer write SetCustomer;
    property EnquiryNo : integer read FEnquiryNo write SetEnquiryNo;
    property OnlyMine : Boolean read FOnlyMine write SetOnlyMine;
    property Operator : integer read FOperator write SetOperator;
    property GetRngSQL : Boolean read fGetRngSQL write setRngSQL;
    property Preview : Boolean read FPreview write SetPreview;
  end;

implementation

uses LetterDM, Math, pbMainMenu;

{$R *.DFM}

{ TdmQuoLtr }

procedure TdbQuoLtr.BuildProcedures;
begin
  FProcedures[qcAddressee          ] :=  AddAddressee;
  FProcedures[qcContact            ] :=  AddContact;
  FProcedures[qcDate               ] :=  AddDate;
  FProcedures[qcHeading            ] :=  AddHeading;
  FProcedures[qcToWhom             ] :=  AddToWhom;
  FProcedures[qcPreamble           ] :=  AddPreamble;
  FProcedures[qcDescription        ] :=  AddDescription;
  FProcedures[qcPartsInformation   ] :=  AddParts;
  FProcedures[qcPlates             ] :=  AddPlate;
  FProcedures[qcArtwork            ] :=  AddArtwork;
  FProcedures[qcPrice              ] :=  AddPrice;
  FProcedures[qcBoxedIn            ] :=  AddBoxedIn;
  FProcedures[qcQuestionsandAnswers] :=  AddQuestionsAnswers;
  FProcedures[qcAdditionalDetails  ] :=  AddAdditionalDetails;
  FProcedures[qcExtraCharge        ] :=  AddExtraCharge;
  FProcedures[qcNotes              ] :=  AddNarrative;
  FProcedures[qcPostamble          ] :=  AddPostamble;
  FProcedures[qcSignatory          ] :=  AddSignatory;
  FProcedures[qcFormRef            ] :=  AddFormRef;
  FProcedures[qcSize               ] :=  AddSize;
end;

procedure TdbQuoLtr.AddAdditionalDetails;
var
  sText : string;
  element : TElement;
begin
  with GetAddDetailsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    Open;
  end;
  if GetAddDetailsSQL.RecordCount > 0 then
  begin
    element := FLetter.Elements.ElementByNumber[qcAdditionalDetails];
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
    if element.BlankBefore then
      BlankLineIfNeeded;
    if (element.UsesTab = 'Y') or
       (element.UsesTab = '1') or
       (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, qcAdditionalDetails);
      FPrintRecord.RecordType := rtKeepTogether;
      FColumnRecord := CreateColumnRecord(sText);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

      DataAlignAndFont(FPrintRecord, AssignDataColumn(element),
        qcAdditionalDetails);
    end
    else
    begin
      FPrintRecord := SimpleText('', element);
      TextAlignAndFont(FPrintRecord, element.Column, qcAdditionalDetails);
      FPrintRecord.RecordType := rtKeepTogether;
      sText := element.Text + cLFCR + sText;
      case element.Column of
      2 :  FPrintRecord.Column2.Text := sText;
      3 :  FPrintRecord.Column3.Text := sText;
      else FPrintRecord.Column1.Text := sText;
      end;  { case }
      TextAlignAndFont(FPrintRecord, element.Column, qcAdditionalDetails);
      case element.Column of
      2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
      3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
      else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
      end;  { case }
      if dmLetter.OldDatabase then
        FPrintRecord.SpecialFont.Style := [fsBold];
      DataAlignAndFont(FPrintRecord, element.Column, qcAdditionalDetails);
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

procedure TdbQuoLtr.AddAddressee;
var
  i : integer;
  sTemp : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcAddressee];
  sTemp := Trim(GetEnquiriesSQL.FieldByName('Cust_Est_Contact').AsString);
  with GetEnquiriesSQL do
    for i := 0 to 6 do
      if Trim(Fields[i].AsString) <> '' then
      begin
        if (sTemp <> '') then
          sTemp := sTemp + cLFCR;
        sTemp := sTemp + Fields[i].AsString;
      end;
  FPrintRecord := SimpleText(sTemp, element);
  DataAlignAndFont(FPrintRecord, element.Column, qcAddressee);
  if dmLetter.OldDatabase then
    FPrintRecord.Column1.Width := Trunc(2.6*96);
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddContact;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcContact];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Contact:', element);
    TextAlignAndFont(FPrintRecord, 2, qcContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Name').AsString);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, qcContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcContact);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Name').AsString);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcContact);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text +
      EnquiriesSRC.DataSet.FieldByName('Contact_Name').AsString, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcContact);
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

procedure TdbQuoLtr.AddContactEmail;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcContact];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Email: :', element);
    TextAlignAndFont(FPrintRecord, 2, qcContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, qcContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText('Email: ', element);
    TextAlignAndFont(FPrintRecord, element.Column, qcContact);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcContact);
  end
  else
  begin
    FPrintRecord := SimpleText('Email: ' +
      EnquiriesSRC.DataSet.FieldByName('Contact_Email').AsString, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcContact);
  end;
  AddOrMerge(FPrintRecord);
end;

procedure TdbQuoLtr.AddContactPhone;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcContact];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText('Direct Dial:', element);
    TextAlignAndFont(FPrintRecord, 2, qcContact);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString);
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, qcContact);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText('Direct Dial: ', element);
    TextAlignAndFont(FPrintRecord, element.Column, qcContact);
    FColumnRecord := CreateColumnRecord
      (EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString);
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcContact);
  end
  else
  begin
    FPrintRecord := SimpleText('Direct Dial: ' +
      EnquiriesSRC.DataSet.FieldByName('Contact_Phone').AsString, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcContact);
  end;
  AddOrMerge(FPrintRecord);
end;

procedure TdbQuoLtr.AddDate;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcDate];
  if dmLetter.OldDatabase then { Hard code this }
  begin
    element.Column := 2;
    FPrintRecord := SimpleText(cLFCR + 'Date:', element);
    TextAlignAndFont(FPrintRecord, 2, qcDate);
    FPrintRecord.Column2.LeftMargin := Trunc(2.8 * 96);
    FPrintRecord.Column2.Width := Trunc(0.7 * 96);
    FColumnRecord := CreateColumnRecord(cLFCR +
      FormatDateTime('d mmmm yyyy', Date));
    FPrintRecord.Column3 := FColumnRecord;
    TextAlignAndFont(FPrintRecord, 3, qcDate);
    FPrintRecord.Column3.LeftMargin := Trunc(3.55 * 96);
    FPrintRecord.Column3.Width := Trunc(1.6 * 96);
  end
  else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcDate);
    FColumnRecord := CreateColumnRecord(FormatDateTime('d mmmm yyyy', Date));
    if element.UsesTab = '2' then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;

    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcDate);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text +
      FormatDateTime('d mmmm yyyy', Date), element);
    TextAlignAndFont(FPrintRecord, element.Column, qcDate);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddArtwork;
var
  sTemp : string;
  element : TElement;
begin
  with EnquiriesSRC.DataSet do
   if Trim(FieldByName('Artwork_Instructions').AsString) = '' then
     Exit;
  sTemp :=
    EnquiriesSRC.DataSet.FieldByName('Artwork_Instructions').AsString;
  element := FLetter.Elements.ElementByNumber[qcArtWork];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, qcArtwork);
    FColumnRecord := CreateColumnRecord(sTemp);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcArtWork);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + sTemp, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, qcArtwork);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddBoxedIn;
var
  sTemp : string;
  element : TElement;
begin
  if Trim(EnquiriesSRC.DataSet.FieldByName('Forms_Per_Box').AsString) = '' then
    Exit;
  sTemp := EnquiriesSRC.DataSet.FieldByName('Forms_Per_Box').AsString;
  element := FLetter.Elements.ElementByNumber[qcBoxedIn];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(element.Text, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, qcBoxedIn);
    FColumnRecord := CreateColumnRecord(sTemp);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcBoxedIn);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + sTemp, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, qcBoxedIn);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddPostAmble;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcPostAmble];
  FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR, element);
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, qcPostAmble);
  AddOrMerge(FPrintRecord);
end;

procedure TdbQuoLtr.AddSignatory;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcSignatory];
  FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR
//    + cLFCR + cLFCR + cLFCR + cLFCR +
    + cLFCR + 
    EnquiriesSRC.DataSet.FieldByName('Rep_Name').AsString + cLFCR +
    EnquiriesSRC.DataSet.FieldByName ('Rep_Position').AsString,
    element);
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, qcSignatory);
  AddOrMerge(FPrintRecord);
end;

procedure TdbQuoLtr.AddNarrative;
var
  sText : string;
  element : TElement;
begin
  with GetNotesSQL do
  begin
    Close;
    ParamByName('Narrative').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Narrative').AsInteger;
    Open;
    sText := '';
    while not EOF do
    begin
      sText := sText + FieldByName('Narrative_Text').AsString;
      Next;
    end;
  end;
  if Trim(sText) <> '' then
  begin
    element := FLetter.Elements.ElementByNumber[qcNotes];
    if element.BlankBefore then
      BlankLineIfNeeded;
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, qcNotes);
      FColumnRecord := CreateColumnRecord(sText);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcNotes);
    end
    else
    if Trim(element.Text) <> '' then
    begin
      sText := element.Text + cLFCR + sText;
      FPrintRecord := SimpleText(sText, element);
      TextAlignAndFont(FPrintRecord, element.Column, qcNotes);
      case element.Column of
      2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
      3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
      else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
      end;  { case }
      DataAlignAndFont(FPrintRecord, element.Column, qcNotes);
      case element.Column of
      2 :  FPrintRecord.Column2.SpecialLine := 1;
      3 :  FPrintRecord.Column3.SpecialLine := 1;
      else FPrintRecord.Column1.SpecialLine := 1;
      end;  { case }
    end
    else
    begin
      FPrintRecord := SimpleText(sText, element);
      TextAlignAndFont(FPrintRecord, element.Column, qcNotes);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbQuoLtr.AddPart;
var
  sData, sPerf, sText, sText1 : string;
  ipos, ilength: integer;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcPartsInformation];

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
     If Trim(PartsSRC.DataSet.FieldByName('Reverse_Inks').AsString) = '' then
        sData := AddWithSpace(sData, 'only');
   end;

   if Trim(PartsSRC.DataSet.FieldByName('Reverse_Inks').AsString) <> '' then
   begin
     sData := AddWithSpace(sData,
       Trim(PartsSRC.DataSet.FieldByName('Reverse_Inks').AsString));
     sData := AddWithSpace(sData, 'on reverse');
    if Trim(PartsSRC.DataSet.fieldByName('Face_Inks').AsString) = '' then
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
    TextAlignAndFont(FPrintRecord, element.Column, qcPartsInformation);
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
      qcPartsInformation);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + ' ' + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcPartsInformation);
    FPrintRecord.RecordType := rtKeepTogether;
  end;
  { Do NOT call AddOrMerge }
  FPrintRecords.Add(FPrintRecord);
  if dmLetter.OldDatabase then
    BlankLine;
end;

procedure TdbQuoLtr.AddPlate;
var
  element : TElement;
begin
  {Insert any Plate Change details}
  if EnquiriesSRC.DataSet.FieldByName('No_of_Plates').AsString <> '0' then
  begin
    element := FLetter.Elements.ElementByNumber[qcPlates];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                               (element.UsesTab <> '1') and
                               (element.UsesTab <> '2') then
    begin
      FPrintRecord := SimpleText(element.Text +
          EnquiriesSRC.DataSet.FieldByName('No_of_Plates').AsString, element);
      TextAlignAndFont(FPrintRecord, element.Column, qcPlates);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, qcPlates);
      FColumnRecord := CreateColumnRecord(
          EnquiriesSRC.DataSet.FieldByName('No_of_Plates').AsString);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcPlates);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbQuoLtr.AddPrice;
var
  sTemp, sTempTotal, sROTemp, sLabel : string;
  element : TElement;
  iFactor, icount: integer;
  rQuantity, rValue: real;
begin
  with GetPricesSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    Open;
  end;
  if GetPricesSQL.RecordCount > 0 then
  begin
    sTemp := '';
    sTempTotal := '';
    while not GetPricesSQL.EOF do
    begin
      if PricesSRC.DataSet.FieldByName('Show_on_report').asstring = 'Y' then
        begin
          ifactor := PricesSRC.DataSet.FieldByName('Price_Unit_Factor').asinteger;
          rQuantity := PricesSRC.DataSet.FieldByName('Quantity').AsFloat;
          rValue := PricesSRC.DataSet.FieldByName('Quotation_Price').AsFloat;
          if ifactor = 0 then
            sTempTotal := '        Total Value ' + Trim(Format('%-10.2m', [rValue]))
          else
            sTempTotal := '        Total Value ' + Trim(Format('%-10.2m', [(rQuantity/iFactor)*rValue]));
        end;
      sTemp := sTemp + Trim(Format('%9.0n',
        [PricesSRC.DataSet.FieldByName('Quantity').AsFloat])
        + ' at ' + Trim(Format('%-10.2m',
        [PricesSRC.DataSet.FieldByName('Quotation_Price').AsFloat]))
        + ' ' + Trim(PricesSRC.DataSet.FieldByName('Description').AsString))
        + sTempTotal
        + cLFCR;

      {Check for Optional charges}
      with GetOptChgsSQL do
        begin
          close;
          ParamByName('Enquiry').AsInteger := EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
          ParamByName('Line').AsInteger := EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
          ParamByName('Supplier').AsInteger := PricesSRC.DataSet.FieldByName('Supplier').asinteger;
          ParamByName('Branch_no').AsInteger := PricesSRC.DataSet.FieldByName('Branch_no').asinteger;
          Open;

          first;
          while eof <> true do
            begin
              sLabel := '';
              if fieldbyname('Charge_type').asstring = 'O' then
                sLabel := ' - Optional';

              sTemp := sTemp + trim(fieldbyname('Details').asstring)+ ' at ' + Trim(Format('%-10.2m',
                [FieldByName('Quotation_Price').AsFloat])) + sLabel + cLFCR;
              next;
            end;
          if recordcount > 0 then
            sTemp := sTemp + cLFCR;
        end;

      GetPricesSQL.Next;
    end;
    element := FLetter.Elements.ElementByNumber[qcPrice];
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase then
    begin
      element.FontStyle := cBold;
      FPrintRecord := SimpleText('Price' + cLFCR + sTemp, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, qcPrice);
    end
    else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, qcPrice);
      FColumnRecord := CreateColumnRecord(sTemp);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcPrice);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text + sTemp, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, qcPrice);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;

  {Now display the Run On Quantity and Price}
  sTemp := Trim(EnquiriesSRC.Dataset.FieldByName('Run_on_Quantity').AsString);

  if (sTemp = '') or
     (strtoint(sTemp) = 0) then exit;

  sTemp := Trim(Format('%9.0n',
        [EnquiriesSRC.Dataset.FieldByName('Run_on_Quantity').Asfloat])
        + ' at ' + Trim(Format('%-10.2m',
        [EnquiriesSRC.Dataset.FieldByName('Run_on_price').Asfloat])));

  element := FLetter.Elements.ElementByNumber[qcPrice];
  if element.BlankBefore then
    BlankLineIfNeeded;

  {Create a string with LFCR in to prefix the Run On label. Had to do this because don't
  know how to position it correctly.}
  sROtemp := '';
  for icount := 1 to GetOptChgsSQL.recordcount do
    sROtemp := sROTemp + cLFCR;

  if (GetOptChgsSQL.recordcount > 0) then
    sROTemp := sROTemp + cLFCR + cLFCR
  else
    sROTemp := cLFCR;

  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
  begin
    FPrintRecord := SimpleText(sROTemp+'Run on:', element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, qcPrice);
    FColumnRecord := CreateColumnRecord(sTemp);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcPrice);
  end
  else
  begin
    FPrintRecord := SimpleText(sROTemp+'Run on:' + sTemp, element);
    FPrintRecord.RecordType := rtKeepTogether;
    TextAlignAndFont(FPrintRecord, element.Column, qcPrice);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddQuestionsAnswers;
var
  sTemp : string;
  iLen  : integer;
  element : TElement;
begin
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
  if GetQuestionsSQL.RecordCount > 0 then
  begin
    if dmLetter.OldDatabase then
      BlankLineIfNeeded;
    element := FLetter.Elements.ElementByNumber[qcQuestionsAndAnswers];
    GetQuestionsSQL.First;
    while not GetQuestionsSQL.EOF do
    begin
      if Trim(GetQuestionsSQL.FieldByName('Product_Answer').AsString) <> '' then
      begin
        if dmLetter.OldDatabase or (element.UsesTab <> 'Y') and
                                   (element.UsesTab <> '1') and
                                   (element.UsesTab <> '2') then

        begin
          FPrintRecord :=
            SimpleText(GetQuestionsSQL.FieldByName('Question_Text').AsString
            + ': ' +
            GetQuestionsSQL.FieldByName('Product_Answer').AsString, element);
          TextAlignAndFont(FPrintRecord, element.Column, qcQuestionsAndAnswers);
        end
        else
        begin
          if element.BlankBefore then
            BlankLineIfNeeded;
          sTemp := GetQuestionsSQL.FieldByName('Question_Text').AsString + ': ';
          FPrintRecord := SimpleText(sTemp, element);
          TextAlignAndFont(FPrintRecord, element.Column, qcQuestionsAndAnswers);
          case element.Column of
          2 :  iLen := TextLength(sTemp, FPrintRecord.Column2.Font) + 12;
          3 :  iLen := TextLength(sTemp, FPrintRecord.Column3.Font) + 12;
          else iLen := TextLength(sTemp, FPrintRecord.Column1.Font) + 12;
          end;  { case }

          FColumnRecord := CreateColumnRecord(
            GetQuestionsSQL.FieldByName('Product_Answer').AsString);
          FColumnRecord.LeftMargin := Max(iLen, FLetter.TabStop1Pixels);
          DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcQuestionsAndAnswers);
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

procedure TdbQuoLtr.AddHeading;
var
  Heading : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcHeading];
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
    TextAlignAndFont(FPrintRecord, element.Column, qcHeading);
    FColumnRecord := CreateColumnRecord(Heading);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcHeading);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text + Heading, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcHeading);
  end;
  if element.BlankBefore then
    BlankLineIfNeeded;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.BuildContinuation(const Heading : string);
var
  element : TElement;
  aPrintRecord : TPrintRecord;  { Don't use the global }
begin
  element := FLetter.Elements.ElementByNumber[qcContinuation];
  aPrintRecord := ContinuedRecord(Heading + ' ' + element.Text, element.Column);
  TextAlignAndFont(aPrintRecord, element.Column, qcContinuation);
  FPrintRecords.Add(aPrintRecord);
end;

procedure TdbQuoLtr.AddUpdateInfo;
var
  UpdateInfo : TUpdateInfo;
begin
  FPrintRecord := TPrintRecord.Create;
  FPrintRecord.RecordType := rtUpdateInfo;
  UpdateInfo := TUpdateInfo.Create;
  UpdateInfo.EnquiryNo := EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
  UpdateInfo.Line := EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
  FPrintRecord.UpdateInfo := UpdateInfo;
  FPrintRecords.Add(FPrintRecord);
end;

procedure TdbQuoLtr.BuildPageLayout;
begin
  inherited;
  LoadPageLayoutFromDB(LayoutName);
  FLetter.Name := LetterName;
  dmLetter.LoadLetter(FLetter);
  FLetter.Elements.Sort;  { Sorts by print order }  
end;

procedure TdbQuoLtr.AddParts;
begin
  with PartsSRC.DataSet do
    if RecordCount > 0 then
    begin
      if FLetter.Elements.ElementByNumber[qcPartsInformation].BlankBefore then
        BlankLineIfNeeded;
      First;
      while not EOF do
      begin
        AddPart;
        if FLetter.Elements.ElementByNumber[qcPartsInformation].BlankAfter then
          BlankLineIfNeeded;
        Next;
      end;
(*      if FLetter.Elements.ElementByNumber[qcPartsInformation].BlankAfter then
        BlankLineIfNeeded;
*)
    end;
end;

procedure TdbQuoLtr.BuildPrintRecords;
var
  i : integer;
begin
  inherited;
  if GetDetails = 0 then
    Exit;
  BuildProcedures;
  with GetEnquiriesSQL do
  while not EOF do
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
    for i := 0 to Pred(FLetter.Elements.Count) do
      if FLetter.Elements[i].Number in [qcAddressee..qcSize] then
        if FLetter.Elements[i].Printed then
          FProcedures[FLetter.Elements[i].Number];
    AddUpdateInfo;
    AddEndRecord;  { The End }
    Next;
  end;
end;

function TdbQuoLtr.GetDetails: integer;
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
    if OnlyMine then
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator
    else
      ParamByName('Operator').AsInteger := 0;
    ParamByName('Branch_No').AsInteger := Branch;
    ParamByName('Customer').AsInteger := Customer;
    ParamByName('ByCustomer').AsString := ByCustomer;
    ParamByName('ByBranch').AsString := ByBranch;
    Open;
    Result := RecordCount;
  end;
end;

procedure TdbQuoLtr.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TdbQuoLtr.SetByBranch(const Value: char);
begin
  FByBranch := Value;
end;

procedure TdbQuoLtr.SetByCustomer(const Value: char);
begin
  FByCustomer := Value;
end;

procedure TdbQuoLtr.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TdbQuoLtr.SetEnquiryNo(const Value: integer);
begin
  FEnquiryNo := Value;
end;

procedure TdbQuoLtr.SetOnlyMine(const Value: Boolean);
begin
  FOnlyMine := Value;
end;

procedure TdbQuoLtr.SetOperator(const Value: integer);
begin
  FOperator := Value;
end;

procedure TdbQuoLtr.SetPreview(const Value: Boolean);
begin
  FPreview := Value;
end;

procedure TdbQuoLtr.UpdateStatus(UpdateInfo: TUpdateInfo);
begin
  {Update the status of the current line}
  if Preview then Exit;
  with UpdStatusSQL do
  begin
    {This SQL sets the Quotation Printed flag to Y}
    ParamByName('Enquiry').AsInteger := UpdateInfo.EnquiryNo;
    ParamByName('Line').AsInteger := UpdateInfo.Line;
    ExecSQL;
  end;
  with UpdEnqStatusSQL do
  begin
    {This SQL sets the enquiry status to 50 if it was previously 48 or 49}
    ParamByName('Enquiry').AsInteger := UpdateInfo.EnquiryNo;
    ParamByName('NewDate').AsDateTime := Now;
    ExecSQL;
  end;
end;

procedure TdbQuoLtr.AddDescription;
var
  sDepth, sWidth, sSize, sLinker, sData: string;
  element : TElement;
  bprintSize: boolean;
begin
  bPrintSize := false;
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
      if EnquiriesSRC.Dataset.FieldByName('Width').Asinteger = 0 then
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
      if assigned(element) then
      begin
        bPrintSize := not element.Printed;
      end;

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
      begin
        sData := Trim(EnquiriesSRC.Dataset.FieldByName('Form_Description').AsString);
      end;
    end;

  element := FLetter.Elements.ElementByNumber[qcDescription];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then { Hard coded }
  begin
    FPrintRecord := SimpleText('DESCRIPTION ', element);
    TextAlignAndFont(FPrintRecord, element.Column, qcDescription);
    FColumnRecord := CreateColumnRecord(sData);
    FColumnRecord.LeftMargin := Trunc(1.3 * 96);
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcDescription);
  end
  else
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcDescription);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcDescription);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcDescription);
  end;
  AddOrMerge(FPrintRecord);

  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddSize;
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
  if EnquiriesSRC.Dataset.FieldByName('Width').Asinteger = 0 then
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

  element := FLetter.Elements.ElementByNumber[qcSize];
  if element.BlankBefore then
    BlankLineIfNeeded;

  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcSize);
  end
  else
  begin
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcSize);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcSize);
  end;
  AddOrMerge(FPrintRecord);

  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddPreamble;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcPreamble];
  if element.BlankBefore then
    BlankLineIfNeeded;
  FPrintRecord := SimpleText(element.Text, element);
  TextAlignAndFont(FPrintRecord, element.Column, qcPreamble);
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.AddToWhom;
var
  Salutation : string;
var
  element : TElement;
begin
  with EnquiriesSRC.Dataset do
  begin
  if Trim(FieldByName('Salutation').AsString) = '' then
    Salutation :=
      Trim(FieldByName('Cust_est_Contact').AsString) + ','
  else
    Salutation := Trim(FieldByName('Salutation').AsString) + ',';
  end;
  element := FLetter.Elements.ElementByNumber[qcToWhom];
  if element.BlankBefore then
    BlankLineIfNeeded;
  FPrintRecord := SimpleText(AddWithSpace(element.Text, Salutation), element);
  TextAlignAndFont(FPrintRecord, element.Column, qcToWhom);
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

procedure TdbQuoLtr.setRngSQL(const Value: Boolean);
begin
  fGetRngSQL := Value;
end;

procedure TdbQuoLtr.AddExtraCharge;
var
  sTemp : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcExtraCharge];
  with GetExtrasSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
    ParamByName('Line').AsInteger :=
      EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
    Open;
  end;
  if (GetExtrasSQL.RecordCount > 0) then
  begin
    sTemp := '';
    while not GetExtrasSQL.EOF do
    begin
      if GetExtrasSQL.fieldbyName('Quote_Price').AsFloat > 0 then
      begin
        sTemp := sTemp + Trim(Format('%9.0n',
          [ExtrasSRC.DataSet.FieldByName('Quantity').AsFloat]))
          + ' at ' + Trim(Format('%-10.2m',
          [ExtrasSRC.DataSet.FieldByName('Quote_Price').AsFloat]))
          + cLFCR;
      end;

      GetExtrasSQL.Next;
    end;
    if sTemp = '' then
      exit;
    if element.BlankBefore then
      BlankLineIfNeeded;
    if dmLetter.OldDatabase then
    begin
      element.FontStyle := cBold;
      FPrintRecord := SimpleText('Extra Charges' + cLFCR + sTemp, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, qcExtraCharge);
    end
    else
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, qcExtraCharge);
      FColumnRecord := CreateColumnRecord(sTemp);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcExtraCharge);
    end
    else
    begin
      FPrintRecord := SimpleText(element.Text + sTemp, element);
      FPrintRecord.RecordType := rtKeepTogether;
      TextAlignAndFont(FPrintRecord, element.Column, qcExtraCharge);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;

end;

procedure TdbQuoLtr.AddFormRef;
var
  sData, sFormRef: string;
  element : TElement;
begin

  sFormRef :=
    GetFormRefID(EnquiriesSRC.Dataset.FieldByName('Form_Reference').AsInteger);
  if sFormRef = '' then
    exit;

  element := FLetter.Elements.ElementByNumber[qcFormRef];
  if element.BlankBefore then
    BlankLineIfNeeded;
  if dmLetter.OldDatabase then { Hard coded }
  begin
    if sFormRef <> '' then
      sData := sFormRef;

    FPrintRecord := SimpleText('Form Ref ', element);
    TextAlignAndFont(FPrintRecord, element.Column, qcFormRef);
    FColumnRecord := CreateColumnRecord(sData);
    FColumnRecord.LeftMargin := Trunc(1.3 * 96);
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcFormRef);

  end
  else
  if (element.UsesTab <> 'Y') and
     (element.UsesTab <> '1') and
     (element.UsesTab <> '2') then
  begin
    if sFormRef <> '' then
      sData := sFormRef;
    FPrintRecord := SimpleText(element.Text + sData, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcFormRef);
  end
  else
  begin
    if sFormRef <> '' then
      sData := sFormRef;
    FPrintRecord := SimpleText(element.Text, element);
    TextAlignAndFont(FPrintRecord, element.Column, qcFormRef);
    FColumnRecord := CreateColumnRecord(sData);
    if (element.UsesTab = '2') then
      FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
    else
      FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
    DataAlignAndFont(FPrintRecord, AssignDataColumn(element), qcFormRef);
  end;
  AddOrMerge(FPrintRecord);
  if element.BlankAfter then
    BlankLine;
end;

end.
