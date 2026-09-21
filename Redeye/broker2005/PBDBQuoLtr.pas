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
