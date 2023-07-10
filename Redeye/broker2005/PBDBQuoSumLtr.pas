(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Printing data module for Quotation Summary Letter printing.  This unit is
  derived from PBDBQuoLtr.

VSS Info:
$Header: /PBL D5/PBDBQuoSumLtr.pas 3     26/07/:1 11:05 Paul $
$History: PBDBQuoSumLtr.pas $
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:05
 * Updated in $/PBL D5
 * Uses the new Enquiry, PO, Quotation, Ack range selection screens
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 5/07/:1    Time: 13:37
 * Created in $/PBL D5 - Prototypes
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 28/06/:1   Time: 12:11
 * Updated in $/PBL D5
 * Make changes to allow multi-select and range options on selection
 * screens for report purposes.
 * Ensure changes regarding PO num format and 'only' legend are
 * re-included into these versions.
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
 * *****************  Version 2  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:11
 * Updated in $/PBL D5
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 10/02/:0   Time: 16:27
 * Created in $/PBL D5
 * First check-in.

*******************************************************************************)
unit PBDBQuoSumLtr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CCSDataBroker, Db, DBTables, CCSPrint, PDLetter, PBDBQuoLtr;

type
  TdbQuoSumLtr = class(TdbQuoLtr)
  protected
    procedure BuildProcedures; override;
    procedure BuildContinuation(const Heading : string);
    procedure AddHeading;
    procedure AddNarrative;
    procedure AddPostamble;
    procedure AddSignatory;
  public
    procedure BuildPrintRecords; override;
  end;

implementation

uses pbMainMenu, LetterDM;

{$R *.DFM}

{ TdmQuoSumLtr }

procedure TdbQuoSumLtr.AddHeading;
var
  Heading : string;
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[qcHeading];
  with EnquiriesSRC.Dataset do
  begin
    Heading :=
      Trim(FieldByName('Enquiry').AsString);
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

procedure TdbQuoSumLtr.AddNarrative;
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
    element := FLetter.Elements.ElementByNumber[scNotes];
    if element.BlankBefore then
      BlankLineIfNeeded;
  if (element.UsesTab = 'Y') or
     (element.UsesTab = '1') or
     (element.UsesTab = '2') then
    begin
      FPrintRecord := SimpleText(element.Text, element);
      TextAlignAndFont(FPrintRecord, element.Column, scNotes);
      FColumnRecord := CreateColumnRecord(sText);
      if (element.UsesTab = '2') then
        FColumnRecord.LeftMargin := FLetter.TabStop2Pixels
      else
        FColumnRecord.LeftMargin := FLetter.TabStop1Pixels;
      DataAlignAndFont(FPrintRecord, AssignDataColumn(element), scNotes);
    end
    else
    if Trim(element.Text) <> '' then
    begin
      sText := element.Text + cLFCR + sText;
      FPrintRecord := SimpleText(sText, element);
      TextAlignAndFont(FPrintRecord, element.Column, scNotes);
      case element.Column of
      2 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column2.Font);
      3 :  FPrintRecord.SpecialFont.Assign(FPrintRecord.Column3.Font);
      else FPrintRecord.SpecialFont.Assign(FPrintRecord.Column1.Font);
      end;  { case }
      DataAlignAndFont(FPrintRecord, element.Column, scNotes);
      case element.Column of
      2 :  FPrintRecord.Column2.SpecialLine := 1;
      3 :  FPrintRecord.Column3.SpecialLine := 1;
      else FPrintRecord.Column1.SpecialLine := 1;
      end;  { case }
    end
    else
    begin
      FPrintRecord := SimpleText(sText, element);
      TextAlignAndFont(FPrintRecord, element.Column, scNotes);
    end;
    AddOrMerge(FPrintRecord);
    if element.BlankAfter then
      BlankLine;
  end;
end;

procedure TdbQuoSumLtr.AddPostamble;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[scPostAmble];
  FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR, element);
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, scPostAmble);
  AddOrMerge(FPrintRecord);
end;

procedure TdbQuoSumLtr.AddSignatory;
var
  element : TElement;
begin
  element := FLetter.Elements.ElementByNumber[scSignatory];
  FPrintRecord := SimpleText(element.Text + cLFCR + cLFCR
    + cLFCR + cLFCR + cLFCR + cLFCR +
    EnquiriesSRC.DataSet.FieldByName('Rep_Name').AsString + cLFCR +
    EnquiriesSRC.DataSet.FieldByName ('Rep_Position').AsString,
    element);
  FPrintRecord.RecordType := rtKeepTogether;
  TextAlignAndFont(FPrintRecord, element.Column, scSignatory);
  AddOrMerge(FPrintRecord);
end;

procedure TdbQuoSumLtr.BuildContinuation(const Heading: string);
var
  element : TElement;
  aPrintRecord : TPrintRecord;  { Don't use the global }
begin
  element := FLetter.Elements.ElementByNumber[scContinuation];
  aPrintRecord := ContinuedRecord(Heading + ' ' + element.Text, element.Column);
  TextAlignAndFont(aPrintRecord, element.Column, scContinuation);
  FPrintRecords.Add(aPrintRecord);
end;

procedure TdbQuoSumLtr.BuildPrintRecords;
var
  i : integer;
  LastEnquiry : integer;
  NeedStart : Boolean;
  Ended : Boolean;
begin
// DO NOT CALL inherited, the necessary code is copied below
  for i := 0 to Pred(FPrintRecords.Count) do
    TPrintRecord(FPrintRecords[i]).Free;
  FPrintRecords.Clear;
  FCurrentRecord := 0;
  BuildPageLayout;
// DO NOT CALL inherited, the necessary code is copied above
  if GetDetails = 0 then
    Exit;
  BuildProcedures;
  LastEnquiry := 0;
  NeedStart := false;
  Ended := false;
  with GetEnquiriesSQL do
  while not Ended do
  begin
    if (LastEnquiry <> EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger)
    then  { enquiry, start a new letter }
    begin
      LastEnquiry := EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
      NeedStart := true;
    end;
    with GetPartsSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger :=
        EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger;
      ParamByName('Line').AsInteger :=
        EnquiriesSRC.DataSet.FieldByName('Line').AsInteger;
      Open;
    end;
    if NeedStart then
    begin
      for i := 0 to Pred(FLetter.Elements.Count) do
        if FLetter.Elements[i].Number in [scAddressee..scPreamble] then
          if FLetter.Elements[i].Printed then
            FProcedures[FLetter.Elements[i].Number];

      NeedStart := false;
    end;
    for i := 0 to Pred(FLetter.Elements.Count) do
      if FLetter.Elements[i].Number in [scDescription..scNotes] then
        if FLetter.Elements[i].Printed then
          FProcedures[FLetter.Elements[i].Number];

    Next; { Peek ahead to see if we're about to go onto next enquiry }
    if (EOF) or
      (LastEnquiry <> EnquiriesSRC.DataSet.FieldByName('Enquiry').AsInteger)
    then  { new enquiry or EOF, finish this letter }
    begin
      Ended := EOF;  { remember if we are really finished }
      Prior;  { go back to the record we were dealing with }

      for i := 0 to Pred(FLetter.Elements.Count) do
        if FLetter.Elements[i].Number in [scPostamble..scSignatory] then
          if FLetter.Elements[i].Printed then
            FProcedures[FLetter.Elements[i].Number];

      AddUpdateInfo;
      AddEndRecord;  { The End }
      Next;
    end;
  end;
end;


procedure TdbQuoSumLtr.BuildProcedures;
begin
  FProcedures[scAddressee          ] :=  AddAddressee;
  FProcedures[scContact            ] :=  AddContact;
  FProcedures[scDate               ] :=  AddDate;
  FProcedures[scHeading            ] :=  AddHeading;
  FProcedures[scToWhom             ] :=  AddToWhom;
  FProcedures[scPreamble           ] :=  AddPreamble;
  FProcedures[scDescription        ] :=  AddDescription;
  FProcedures[scPartsInformation   ] :=  AddParts;
  FProcedures[scPlates             ] :=  AddPlate;
  FProcedures[scArtwork            ] :=  AddArtwork;
  FProcedures[scPrice              ] :=  AddPrice;
  FProcedures[scBoxedIn            ] :=  AddBoxedIn;
  FProcedures[scQuestionsandAnswers] :=  AddQuestionsAnswers;
  FProcedures[scAdditionalDetails  ] :=  AddAdditionalDetails;
  FProcedures[scNotes              ] :=  AddNarrative;
  FProcedures[scPostamble          ] :=  AddPostamble;
  FProcedures[scSignatory          ] :=  AddSignatory;
end;

end.
