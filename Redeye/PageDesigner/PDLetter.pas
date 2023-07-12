(*******************************************************************************

Copyright (c) Centrereed Ltd 1999
                                           
Comments
--------
  Broker Enquiry Letter associated objects.

VSS Info:
$Header: /PageDesigner/PDLetter.pas 24    23/04/:3 11:30 Paul $
$History: PDLetter.pas $
 * 
 * *****************  Version 24  *****************
 * User: Paul         Date: 23/04/:3   Time: 11:30
 * Updated in $/PageDesigner
 * Changed to allow the showing of Order and Acknowledgement Totals
 * 
 * *****************  Version 23  *****************
 * User: Paul         Date: 27/03/:3   Time: 12:46
 * Updated in $/PageDesigner
 * Changed to incorporate Enquiry Options
 * 
 * *****************  Version 23  *****************
 * User: Paul         Date: 24/03/:3   Time: 13:12
 * Updated in $/PageDesigner
 * Added new Options element to the Enquiry Print
 * 
 * *****************  Version 22  *****************
 * User: Pahome       Date: 17/09/:2   Time: 16:04
 * Updated in $/PageDesigner
 * Added a new element "Size" which has been taken from the Description
 * 
 * *****************  Version 21  *****************
 * User: Janiner      Date: 27/02/:2   Time: 11:15
 * Updated in $/PageDesigner
 * Allow maintenance of form ref on Enq/quotation print and form ref and
 * proof req'd by date on Purch orders and Acks.
 * 
 * *****************  Version 20  *****************
 * User: Janiner      Date: 11/10/:1   Time: 8:13
 * Updated in $/PageDesigner
 * Add new routine to allow printing of extra charges as either a
 * summary/detail .
 * 
 * *****************  Version 19  *****************
 * User: Paul         Date: 10/05/:1   Time: 14:02
 * Updated in $/PageDesigner
 * Interim check-in, to enable testing of invoice print for TF
 * 
 * *****************  Version 18  *****************
 * User: Paul         Date: 9/02/:1    Time: 9:51
 * Updated in $/PageDesigner
 * Changed to dispable the printing of Additional Costs on Purchase Orders
 * and Acknowledgements
 * 
 * *****************  Version 17  *****************
 * User: Paul         Date: 18/09/:0   Time: 12:23
 * Updated in $/PageDesigner
 * Changed to incorporate the new Customer selection field
 * 
 * *****************  Version 16  *****************
 * User: Paul         Date: 1/08/:0    Time: 17:26
 * Updated in $/PageDesigner
 * Changed to allow the deisgning of PO and Acks to position where the
 * Customer/End User details go
 * 
 * *****************  Version 15  *****************
 * User: Roddym       Date: 30/03/:0   Time: 14:37
 * Updated in $/PageDesigner
 * Fix bug in Collision (again), now uses a list of memos and sorts them
 * by position.  Fix access violation due to Parent of elements not being
 * set to point to new Letter when assigning clone.
 * 
 * *****************  Version 14  *****************
 * User: Roddym       Date: 30/03/:0   Time: 10:34
 * Updated in $/PageDesigner
 * Changes to the way column widths and indents are handled.  New dialog
 * to confirm column width changes.  Propagate letter font changes to the
 * elements.
 * 
 * *****************  Version 13  *****************
 * User: Roddym       Date: 21/03/:0   Time: 14:38
 * Updated in $/PageDesigner
 * Minor tweaks to ensure Forms Technology printouts look the way they
 * always did.
 * 
 * *****************  Version 12  *****************
 * User: Roddym       Date: 15/03/:0   Time: 9:54
 * Updated in $/PageDesigner
 * Minor fixes to ensure FT printouts are correct after all the changes
 * made to letter printing.
 * 
 * *****************  Version 11  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:09
 * Updated in $/PageDesigner
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 10  *****************
 * User: Roddym       Date: 15/02/:0   Time: 17:11
 * Updated in $/PageDesigner
 * New feature to allow setting of two tab stops per letter so the use can
 * size the virtual columns.  Version bumped to 2.3a because of this and
 * database changes.
 *
 * *****************  Version 9  *****************
 * User: Roddym       Date: 10/02/:0   Time: 17:34
 * Updated in $/PageDesigner
 * Set defaults for new quotation summary layout, fix script generation to
 * handle new layout and database fields.
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 10/02/:0   Time: 16:29
 * Updated in $/PageDesigner
 * New letter layout Quotation Summary allows all lines of an enquiry to
 * be printed in one letter.  Database changes.
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 10/02/:0   Time: 11:59
 * Updated in $/PageDesigner
 * Add questions and answers to Purchase Order and Acknowledgement letter
 * layouts.  Add new page layout field PrintDefault similar to FaxDefault.
 * Add new letter layout field LetterTypeDefault so we can display the
 * user's selected default on print selection forms in Broker.  Version
 * number of PageDesigner raised to 2.2a
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 13/01/:0   Time: 8:20
 * Updated in $/PageDesigner
 * Add new Clear method to TLetter.  Hardcoded layouts were being appended
 * to existing object causing multiple prints of same items.  Call Clear
 * in HardLoad and SoftLoad methods to ensure a blank layout to begin
 * with.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 12/01/:0   Time: 9:14
 * Updated in $/PageDesigner
 * Assorted layout fixes for letters, line spacing etc.  Fix script
 * generation.  Use CR + LF in text for acknowledgement.
 *
 * *****************  Version 4  *****************
 * User: Roddym       Date: 10/01/:0   Time: 14:54
 * Updated in $/PageDesigner
 * Minor fixes to signatories and suchlike (missing commas and so on).
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/01/:0   Time: 11:27
 * Updated in $/PageDesigner
 * New feature:  generate SQL statements to create layout and element
 * entries in the database based on the internal hard coded values.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:41
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
unit PDLetter;

interface

uses
{$IFDEF DEBUG}
  CCSDebug,
{$ENDIF}
  CCSPrint, Classes;

const
  sInches                 = 'Inches';
  sCentimetres            = 'Centimetres';
  sContinuation           = 'Continuation';  { Do not change, code looks for it }
  Pixels_Per_Inch         = 20;
  Pixels_Per_Cent         = 8;
  Pixels                  = 0.2;
  InchesToCm              = 2.54;
  A4_Height               = 11.69;
  A4_Width                = 8.27;
  A3_Height               = A4_Width;
  A3_Width                = (2*A4_Height);
  Letter_Height           = 11;
  Letter_Width            = 8.5;
  PageLeft                = 12;
  PageTop                 = 18;
  DefaultTab1             = 1.3;   { inches }
  DefaultTab2             = 3.5;   { inches }

  { Letter layout constants }
  minFontSize            = 8;
  maxFontSize            = 24;
  cBold                  = 1;
  cItalic                = 2;
  cUnderline             = 4;

  ltPageLayout           = 0;
  { Letter type constants used in f_LetterType field in database }
  ltEnquiry              = 1;
  ltQuotation            = 2;
  ltPurchaseOrder        = 3;
  ltAcknowledgement      = 4;
  ltQuotationSummary     = 5;

  { Enquiry Letter }

  { Enquiry letter string constants }
  esAddressee            = 'Addressee';
  esContact              = 'Contact';
  esDate                 = 'Date';
  esHeading              = 'Enquiry Heading';
  esToWhom               = 'To Whom';
  esPreamble             = 'Preamble';
  esDescription          = 'Description';
  esPartsInformation     = 'Parts Information';
  esPlates               = 'No of Plates';
  esArtwork              = 'Artwork';
  esQuantities           = 'Quantities';
  esBoxedIn              = 'Boxed In';
  esQuestionsandAnswers  = 'Questions and Answers';
  esAdditionalDetails    = 'Additional Details';
  esQuoteDate            = 'Quote Date';
  esNotes                = 'Notes';
  esPostamble            = 'Postamble';
  esSignatory            = 'Signatory';
  esFormRef              = 'Form Ref';
  esSize                 = 'Size';
  esOptions              = 'Options';
  esContinuation         = sContinuation;  { Do not change, code looks for it }

  { These numbers are used internally to identify the elements that make up
    an enquiry letter.  Beware of changing them.  }
  ecAddressee             = 1;
  ecContact               = 2;
  ecDate                  = 3;
  ecHeading               = 4;
  ecToWhom                = 5;
  ecPreamble              = 6;
  ecDescription           = 7;
  ecPartsInformation      = 8;
  ecPlates                = 9;
  ecArtwork               = 10;
  ecQuantities            = 11;
  ecBoxedIn               = 12;
  ecQuestionsandAnswers   = 13;
  ecAdditionalDetails     = 14;
  ecQuoteDate             = 15;
  ecNotes                 = 16;
  ecPostamble             = 17;
  ecSignatory             = 18;
  ecFormRef               = 19;
  ecSize                  = 20;
  ecOptions               = 21;
  ecContinuation          = 22;


  EnquiryElements        : array[ecAddressee..ecContinuation] of string =
    (esAddressee,
     esContact,
     esDate,
     esHeading,
     esToWhom,
     esPreamble,
     esDescription,
     esPartsInformation,
     esPlates,
     esArtwork,
     esQuantities,
     esBoxedIn,
     esQuestionsandAnswers,
     esAdditionalDetails,
     esQuoteDate,
     esNotes,
     esPostamble,
     esSignatory,
     esFormRef,
     esSize,
     esOptions,
     esContinuation
    );

  { Quotation Letter }

  { Quotation letter string constants }
  qsAddressee            = 'Addressee';
  qsContact              = 'Contact';
  qsDate                 = 'Date';
  qsHeading              = 'Quotation Heading';
  qsToWhom               = 'To Whom';
  qsPreamble             = 'Preamble';
  qsDescription          = 'Description';
  qsPartsInformation     = 'Parts Information';
  qsPlates               = 'No of Plates';
  qsArtwork              = 'Artwork';
  qsBoxedIn              = 'Boxed In';
  qsQuestionsandAnswers  = 'Questions and Answers';
  qsAdditionalDetails    = 'Additional Details';
  qsPrice                = 'Price';
  qsExtraCharge          = 'Additional Charges';
  qsNotes                = 'Notes';
  qsPostamble            = 'Postamble';
  qsSignatory            = 'Signatory';
  qsFormRef              = 'Form Ref';
  qsSize                 = 'Size';
  qsContinuation         = sContinuation;  { Do not change, code looks for it }

  { These numbers are used internally to identify the elements that make up
    a quotation letter.  Beware of changing them.  }
  qcAddressee             = 1;
  qcContact               = 2;
  qcDate                  = 3;
  qcHeading               = 4;
  qcToWhom                = 5;
  qcPreamble              = 6;
  qcDescription           = 7;
  qcPartsInformation      = 8;
  qcPlates                = 9;
  qcArtwork               = 10;
  qcPrice                 = 11;
  qcBoxedIn               = 12;
  qcQuestionsandAnswers   = 13;
  qcAdditionalDetails     = 14;
  qcExtraCharge           = 15;
  qcNotes                 = 16;
  qcPostamble             = 17;
  qcSignatory             = 18;
  qcFormRef               = 19;
  qcSize                  = 20;
  qcContinuation          = 21;


  QuotationElements        : array[qcAddressee..qcContinuation] of string =
    (qsAddressee,
     qsContact,
     qsDate,
     qsHeading,
     qsToWhom,
     qsPreamble,
     qsDescription,
     qsPartsInformation,
     qsPlates,
     qsArtwork,
     qsPrice,
     qsBoxedIn,
     qsQuestionsandAnswers,
     qsAdditionalDetails,
     qsExtraCharge,
     qsNotes,
     qsPostamble,
     qsSignatory,
     qsFormRef,
     qsSize,
     qsContinuation
    );

  { Purchase Order and Acknowledgement MUST have same values and order }

  { Purchase Order string constants }
  psAddressee            = 'Addressee';
  psContact              = 'Contact';
  psDate                 = 'Date';
  psReference            = 'Reference';
  psHeading              = 'P/O Heading';
  psToWhom               = 'To Whom';
  psPreamble             = 'Preamble';
  psDescription          = 'Description';
  psPartsInformation     = 'Parts Info';
  psPlates               = 'No of Plates';
  psArtwork              = 'Artwork';
  psQuantityPrice        = 'Qty Price';
  psBoxedIn              = 'Boxed In';
  psAdditionalDetails    = 'Addit. Details';
  psQuestions            = 'Questions';
  psExtraCharge          = 'Addit. Charges';
  psRequiredDate         = 'Goods Req''d By';
  psDeliverTo            = 'Deliver To';
  psNotes                = 'Notes';
  psPostamble            = 'Postamble';
  psSignatory            = 'Signatory';
  psCustomer             = 'Customer';
  psProofDate            = 'Proof Req''d By';
  psFormReference        = 'Form Ref.';
  psSize                 = 'Size';
  psTotal                = 'Total';
  psJobBagNumber         = 'Job Bag';
  psFSCClaim             = 'FSC Claim';
  psVersions             = 'Versions';
  psContinuation         = sContinuation;  { Do not change, code looks for it }

  { These numbers are used internally to identify the elements that make up
    a purchase order.  Beware of changing them.  }
  pcAddressee            =  1;
  pcContact              =  2;
  pcDate                 =  3;
  pcReference            =  4;
  pcToWhom               =  5;
  pcHeading              =  6;
  pcPreamble             =  7;
  pcDescription          =  8;
  pcPartsInformation     =  9;
  pcPlates               = 10;
  pcArtwork              = 11;
  pcQuantityPrice        = 12;
  pcBoxedIn              = 13;
  pcAdditionalDetails    = 14;
  pcQuestions            = 15;
  pcExtraCharge          = 16;
  pcRequiredDate         = 17;
  pcDeliverTo            = 18;
  pcNotes                = 19;
  pcPostamble            = 20;
  pcSignatory            = 21;
  pcCustomer             = 22;
  pcProofDate            = 23;
  pcFormReference        = 24;
  pcSize                 = 25;
  pcTotal                = 26;
  pcJobBagNumber         = 27;
  pcFSCClaim             = 28;
  pcVersions             = 29;
  pcContinuation         = 30;

  PurchaseOrderElements        : array[pcAddressee..pcContinuation] of string =
    (psAddressee            ,
     psContact              ,
     psDate                 ,
     psReference            ,
     psToWhom               ,
     psHeading              ,
     psPreamble             ,
     psDescription          ,
     psPartsInformation     ,
     psPlates               ,
     psArtwork              ,
     psQuantityPrice        ,
     psBoxedIn              ,
     psAdditionalDetails    ,
     psQuestions            ,
     psExtraCharge          ,
     psRequiredDate         ,
     psDeliverTo            ,
     psNotes                ,
     psPostamble            ,
     psSignatory            ,
     psCustomer             ,
     psProofDate            ,
     psFormReference        ,
     psSize                 ,
     psTotal                ,
     psJobBagNumber         ,
     psFSCClaim             ,
     psVersions             ,
     psContinuation
    );

  { Acknowledgement and Purchase Order MUST have same values and order}

  { Acknowledgement string constants }
  asAddressee            = 'Addressee';
  asContact              = 'Contact';
  asDate                 = 'Date';
  asReference            = 'Reference';
  asHeading              = 'P/O Heading';
  asToWhom               = 'To Whom';
  asPreamble             = 'Preamble';
  asDescription          = 'Description';
  asPartsInformation     = 'Parts Info.';
  asPlates               = 'No of Plates';
  asArtwork              = 'Artwork';
  asQuantityPrice        = 'Qty Price';
  asBoxedIn              = 'Boxed In';
  asAdditionalDetails    = 'Addit. Details';
  asQuestions            = 'Questions';
  asExtraCharge          = 'Addit. Charges';
  asRequiredDate         = 'Goods Req''d By';
  asDeliverTo            = 'Deliver To';
  asNotes                = 'Notes';
  asPostamble            = 'Postamble';
  asSignatory            = 'Signatory';
  asCustomer             = 'Customer';
  asProofDate            = 'Proof Req''d By';
  asFormReference        = 'Form Ref.';
  asSize                 = 'Size';
  asTotal                = 'Total';
  asJobBagNumber         = 'Job Bag';
  asFSCClaim             = 'FSC Claim';
  asVersions             = 'Versions';
  asContinuation         = sContinuation;  { Do not change, code looks for it }

  { These numbers are used internally to identify the elements that make up
    an ccknowledgement.  Beware of changing them.  }
  acAddressee            =  1;
  acContact              =  2;
  acDate                 =  3;
  acReference            =  4;
  acToWhom               =  5;
  acHeading              =  6;
  acPreamble             =  7;
  acDescription          =  8;
  acPartsInformation     =  9;
  acPlates               = 10;
  acArtwork              = 11;
  acQuantityPrice        = 12;
  acBoxedIn              = 13;
  acAdditionalDetails    = 14;
  acQuestions            = 15;
  acExtraCharge          = 16;
  acRequiredDate         = 17;
  acDeliverTo            = 18;
  acNotes                = 19;
  acPostamble            = 20;
  acSignatory            = 21;
  acCustomer             = 22;
  acProofDate            = 23;
  acFormReference        = 24;
  acSize                 = 25;
  acTotal                = 26;
  acJobBagNumber         = 27;
  acFSCClaim             = 28;
  acVersions             = 29;
  acContinuation         = 30;

  AcknowledgementElements        : array[acAddressee..acContinuation] of string =
    (asAddressee            ,
     asContact              ,
     asDate                 ,
     asReference            ,
     asToWhom               ,
     asHeading              ,
     asPreamble             ,
     asDescription          ,
     asPartsInformation     ,
     asPlates               ,
     asArtwork              ,
     asQuantityPrice        ,
     asBoxedIn              ,
     asAdditionalDetails    ,
     asQuestions            ,
     asExtraCharge          ,
     asRequiredDate         ,
     asDeliverTo            ,
     asNotes                ,
     asPostamble            ,
     asSignatory            ,
     asCustomer             ,
     asProofDate            ,
     asFormReference        ,
     asSize                 ,
     asTotal                ,
     asJobBagNumber         ,
     asFSCClaim             ,
     asVersions            ,
     asContinuation
    );

  { Quotation Summary Letter }

  { Quotation Summary letter string constants }
  ssAddressee            = 'Addressee';
  ssContact              = 'Contact';
  ssDate                 = 'Date';
  ssHeading              = 'Quotation Heading';
  ssToWhom               = 'To Whom';
  ssPreamble             = 'Preamble';
  ssDescription          = 'Description';
  ssPartsInformation     = 'Parts Information';
  ssPlates               = 'No of Plates';
  ssArtwork              = 'Artwork';
  ssBoxedIn              = 'Boxed In';
  ssQuestionsandAnswers  = 'Questions and Answers';
  ssAdditionalDetails    = 'Additional Details';
  ssPrice                = 'Price';
  ssNotes                = 'Notes';
  ssPostamble            = 'Postamble';
  ssSignatory            = 'Signatory';
  ssContinuation         = sContinuation;  { Do not change, code looks for it }

  { These numbers are used internally to identify the elements that make up
    a quotation summary letter.  Beware of changing them.  }
  scAddressee             = 1;
  scContact               = 2;
  scDate                  = 3;
  scHeading               = 4;
  scToWhom                = 5;
  scPreamble              = 6;
  scDescription           = 7;
  scPartsInformation      = 8;
  scPlates                = 9;
  scArtwork               = 10;
  scPrice                 = 11;
  scBoxedIn               = 12;
  scQuestionsandAnswers   = 13;
  scAdditionalDetails     = 14;
  scNotes                 = 15;
  scPostamble             = 16;
  scSignatory             = 17;
  scContinuation          = 18;


  QuotationSummaryElements : array[scAddressee..scContinuation] of string =
    (ssAddressee,
     ssContact,
     ssDate,
     ssHeading,
     ssToWhom,
     ssPreamble,
     ssDescription,
     ssPartsInformation,
     ssPlates,
     ssArtwork,
     ssPrice,
     ssBoxedIn,
     ssQuestionsandAnswers,
     ssAdditionalDetails,
     ssNotes,
     ssPostamble,
     ssSignatory,
     ssContinuation
    );


type
  THardCoded      = record
    N : integer;   // Number
    P : integer;   // PrintOrder
    C : integer;   // Column
    L : integer;   // Left Margin (pixels)
    W : integer;   // Width (pixels)
    S : integer;   // Style
    D : integer;   // DbData   0 = false, 1 = true
    F : integer;   // Fixed    0 = false, 1 = true
    O : integer;   // Printed  0 = false, 1 = true
    A : char;      // Alignment L, R or C or X
    T : string;    // Text
  end;

  THardCodedEnquiry         =
    array[ecAddressee..ecContinuation] of THardCoded;
  THardCodedQuotation       =
    array[qcAddressee..qcContinuation] of THardCoded;
  THardCodedPurchaseOrder   =
    array[pcAddressee..pcContinuation] of THardCoded;
  THardCodedAcknowledgement =
    array[acAddressee..acContinuation] of THardCoded;
  THardCodedQuotationSummary =
    array[scAddressee..scContinuation] of THardCoded;

const
  etToWhom =
    'Dear ';
  etPreamble =
    'We would be pleased to receive your Quotation and best delivery date ' +
    'for the following item:-';
  etPostAmble =
    'Thank you for your assistance, if you have any queries or suggestions ' +
    'please do not hesitate to contact my sales administration team.';
  etSignatory =
    'Yours sincerely, ';
  etAdditional =
    'Additional Details/Special Instructions';
  cHardCodedEnquiry : THardCodedEnquiry =
  ( (N: ecAddressee           ;P:  1; C: 1 ; L:   0 ; W: 192 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ''),
    (N: ecContact             ;P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Contact: '),
    (N: ecDate                ;P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Date: '),
    (N: ecHeading             ;P:  2; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'C' ; T: 'ENQUIRY NO. '),
    (N: ecToWhom              ;P:  3; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: etToWhom),
    (N: ecPreamble            ;P:  4; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: etPreamble),
    (N: ecDescription         ;P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'DESCRIPTION '),
    (N: ecPartsInformation    ;P:  6; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'PART '),
    (N: ecPlates              ;P:  7; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Number of Plates: '),
    (N: ecArtwork             ;P:  9; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Artwork: '),
    (N: ecQuantities          ;P:  9; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'QUANTITIES: '),
    (N: ecBoxedIn             ;P:  9; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Boxed In: '),
    (N: ecQuestionsandAnswers ;P: 10; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: ''),
    (N: ecAdditionalDetails   ;P: 11; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: etAdditional),
    (N: ecQuoteDate           ;P: 12; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: 'Quote Required By: '),
    (N: ecNotes               ;P:  8; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: ''),
    (N: ecPostamble           ;P: 13; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: etPostAmble),
    (N: ecSignatory           ;P: 13; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: etSignatory),
    (N: ecFormRef             ;P:  5; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'FORM REF '),
    (N: ecSize                ;P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'SIZE '),
    (N: ecOptions             ;P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Options '),
    (N: ecContinuation        ;P: 14; C: 0 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ' Continued...')
  );

 qtToWhom =
    'Dear ';
 qtPreamble =
    'We thank you for your recent enquiry and are pleased to offer the ' +
    'following price(s) for your consideration:-';
 qtPostAmble =
    'Our quoted prices are subject to final copy and are firm for 30 days ' +
    'unless otherwise agreed in writing.  We trust this price meets your approval ' +
    'and look forward to receiving your instructions. ' + cLFCR + cLFCR +
    'All prices are exclusive of VAT at the ruling rate at date of invoice.';
 qtSignatory =
    'Yours sincerely, ';
 qtAdditional =
    'Additional Details/Special Instructions';
  cHardCodedQuotation : THardCodedQuotation =
  ( (N: qcAddressee           ; P:  1; C: 1 ; L:   0 ; W: 192 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ''),
    (N: qcContact             ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Contact: '),
    (N: qcDate                ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Date: '),
    (N: qcHeading             ; P:  2; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'C' ; T: 'QUOTATION NO. '),
    (N: qcToWhom              ; P:  3; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: qtToWhom),
    (N: qcPreamble            ; P:  4; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: qtPreamble),
    (N: qcDescription         ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'DESCRIPTION '),
    (N: qcPartsInformation    ; P:  6; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'PART '),
    (N: qcPlates              ; P:  7; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Number of Plates: '),
    (N: qcArtwork             ; P:  9; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Artwork: '),
    (N: qcPrice               ; P: 13; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Price'),
    (N: qcBoxedIn             ; P: 10; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Boxed In: '),
    (N: qcQuestionsandAnswers ; P: 11; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: ''),
    (N: qcAdditionalDetails   ; P: 12; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: qtAdditional),
    (N: qcExtraCharge         ; P: 14; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Additional Charges '),
    (N: qcNotes               ; P:  8; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: ''),
    (N: qcPostamble           ; P: 15; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: qtPostAmble),
    (N: qcSignatory           ; P: 15; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: qtSignatory),
    (N: qcFormRef             ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'FORM REF '),
    (N: qcSize                ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'SIZE '),
    (N: qcContinuation        ; P: 16; C: 0 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ' Continued...')
  );
  ptToWhom =
    'Dear ';
  ptPreamble =
    'We are pleased to confirm our Order for your Quotation referred to above. ' +
    'Please proceed as specified below and acknowledge our order by return.';
  ptPostAmble =
    'Should you have any problems interpreting this order or have a query '+
    'with this specification, please contact us immediately. All original '+
    'negatives, artwork and 12 copies of the finished job to be returned '+
    'with your invoice to ensure prompt payment.';
  ptSignatory =
    'For and on behalf of ';
  ptAdditional =
    'Additional Details/Special Instructions';
  cHardCodedPurchaseOrder : THardCodedPurchaseOrder =
  ( (N: pcAddressee        ; P:  1; C: 1 ; L:   0 ; W: 192 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ''),
    (N: pcContact          ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Contact: '),
    (N: pcDate             ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Date: '),
    (N: pcReference        ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Ref: '),
    (N: pcToWhom           ; P:  2; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: ptToWhom),
    (N: pcHeading          ; P:  3; C: 0 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'PURCHASE ORDER NO. '),
    (N: pcPreamble         ; P:  4; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: ptPreamble),
    (N: pcDescription      ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'DESCRIPTION '),
    (N: pcPartsInformation ; P:  6; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'PART '),
    (N: pcPlates           ; P:  7; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Number of Plates: '),
    (N: pcArtwork          ; P:  9; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Artwork: '),
    (N: pcQuantityPrice    ; P: 13; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Price '),
    (N: pcBoxedIn          ; P: 10; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Boxed In: '),
    (N: pcAdditionalDetails; P: 11; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: ptAdditional),
    (N: pcQuestions        ; P: 12; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Questions:'),
    (N: pcExtraCharge      ; P: 14; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Additional Charges '),
    (N: pcRequiredDate     ; P: 15; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Goods required by '),
    (N: pcDeliverTo        ; P: 16; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Delivery to: '),
    (N: pcNotes            ; P:  8; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: ''),
    (N: pcPostamble        ; P: 17; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: ptPostAmble),
    (N: pcSignatory        ; P: 17; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: ptSignatory),
    (N: pcCustomer         ; P: 17; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 1 ; O: 0 ; A: 'L' ; T: ''),
    (N: pcProofDate        ; P: 15; C: 2 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Proofs required by '),
    (N: pcFormReference    ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'FORM REFERENCE '),
    (N: pcSize             ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'SIZE '),
    (N: pcTotal            ; P: 17; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'TOTAL '),
    (N: pcJobBagNumber     ; P:  5; c: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'Job Bag No. '),
    (N: pcFSCClaim         ; P:  5; c: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'FSC Claim '),
    (N: pcVersions         ; P:  5; c: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'Versisons '),
    (N: pcContinuation     ; P: 18; C: 0 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ' Continued...')
  );

  atToWhom =
    'Dear ';
  atPreamble =
    'We thank you and are pleased to confirm your Order Number as detailed above. ' +
    'We draw your attention to our Standard Terms and Conditions, in particular ' +
    'to clause 13.5 relating to unders and overs. We are proceeding as specified below:-';
  atPostAmble =
    'Please check the above information carefully and advise us immediately if it '+
    'does not meet with your exact requirements. Unless discrepancies or changes ' +
    'are notified by return in writing we cannot accept responsibility for any ' +
    'errors which may be incurred.';
  atSignatory =
    'Yours sincerely,';
  atAdditional =
    'Additional Details/Special Instructions';
  cHardCodedAcknowledgement : THardCodedAcknowledgement =
  ( (N: acAddressee        ; P:  1; C: 1 ; L:   0 ; W: 192 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ''),
    (N: acContact          ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Contact: '),
    (N: acDate             ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Date: '),
    (N: acReference        ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Ref: '),
    (N: acToWhom           ; P:  2; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: atToWhom),
    (N: acHeading          ; P:  3; C: 0 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'ORDER ACKNOWLEDGEMENT NO. '),
    (N: acPreamble         ; P:  4; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 0 ; O: 1 ; A: 'L' ; T: atPreamble),
    (N: acDescription      ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'DESCRIPTION '),
    (N: acPartsInformation ; P:  6; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'PART '),
    (N: acPlates           ; P:  7; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Number of Plates: '),
    (N: acArtwork          ; P:  9; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Artwork: '),
    (N: acQuantityPrice    ; P: 13; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Price '),
    (N: acBoxedIn          ; P: 10; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Boxed In: '),
    (N: acAdditionalDetails; P: 11; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: atAdditional),
    (N: acQuestions        ; P: 12; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Questions:'),
    (N: acExtraCharge      ; P: 14; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Additional Charges '),
    (N: acRequiredDate     ; P: 15; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Goods required by '),
    (N: acDeliverTo        ; P: 16; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Delivery to: '),
    (N: acNotes            ; P:  8; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'L' ; T: ''),
    (N: acPostamble        ; P: 17; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: atPostAmble),
    (N: acSignatory        ; P: 17; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: atSignatory),
    (N: acCustomer         ; P: 17; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 0 ; A: 'L' ; T: ''),
    (N: acProofDate        ; P: 15; C: 2 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Proofs required by '),
    (N: acFormReference    ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'FORM REFERENCE '),
    (N: acSize             ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'SIZE '),
    (N: acTotal            ; P: 17; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'TOTAL '),
    (N: acJobBagNumber     ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'JOB BAG NO. '),
    (N: acFSCClaim         ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'FSC Claim '),
    (N: acVersions         ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'C' ; T: 'Versisons '),
    (N: acContinuation     ; P: 18; C: 0 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ' Continued...')
  );

 stToWhom =
    'Dear ';
 stPreamble =
    'We thank you for your recent enquiry and are pleased to offer the ' +
    'following price(s) for your consideration:-';
 stPostAmble =
    'Our quoted prices are subject to final copy and are firm for 30 days ' +
    'unless otherwise agreed in writing.  We trust this price meets your approval ' +
    'and look forward to receiving your instructions. ' + cLFCR + cLFCR +
    'All prices are exclusive of VAT at the ruling rate at date of invoice.';
 stSignatory =
    'Yours sincerely, ';
 stAdditional =
    'Additional Details/Special Instructions';
  cHardCodedQuotationSummary : THardCodedQuotationSummary =
  ( (N: scAddressee           ; P:  1; C: 1 ; L:   0 ; W: 192 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: ''),
    (N: scContact             ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Contact: '),
    (N: scDate                ; P:  1; C: 2 ; L: 208 ; W: 190 ; S: 0 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: 'Date: '),
    (N: scHeading             ; P:  2; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'C' ; T: 'QUOTATION NO. '),
    (N: scToWhom              ; P:  3; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: stToWhom),
    (N: scPreamble            ; P:  4; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: stPreamble),
    (N: scDescription         ; P:  5; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'DESCRIPTION '),
    (N: scPartsInformation    ; P:  6; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'PART '),
    (N: scPlates              ; P:  7; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Number of Plates: '),
    (N: scArtwork             ; P:  9; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Artwork: '),
    (N: scPrice               ; P: 13; C: 1 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 0 ; O: 1 ; A: 'X' ; T: 'Price '),
    (N: scBoxedIn             ; P: 10; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: 'Boxed In: '),
    (N: scQuestionsandAnswers ; P: 11; C: 1 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'X' ; T: ''),
    (N: scAdditionalDetails   ; P: 12; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'L' ; T: stAdditional),
    (N: scNotes               ; P:  8; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 1 ; F: 0 ; O: 0 ; A: 'L' ; T: ''),
    (N: scPostamble           ; P: 14; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: stPostAmble),
    (N: scSignatory           ; P: 14; C: 0 ; L:   0 ; W:   0 ; S: 0 ; D: 0 ; F: 1 ; O: 1 ; A: 'L' ; T: stSignatory),
    (N: scContinuation        ; P: 15; C: 0 ; L:   0 ; W:   0 ; S: 1 ; D: 1 ; F: 1 ; O: 1 ; A: 'L' ; T: '')
  );
                                       
                                       
type

  TLetter     = class;

  TElement    = class
  private
    FFixed: Boolean;
    FWidth: integer;
    FFontSize: integer;
    FFontStyle: integer;
    FFontNo: integer;
    FNumber: integer;
    FColumn: integer;
    FLeft: integer;
    FPrintOrder: integer;
    FText: string;
    FName: string;
    FDbData: Boolean;
    FParent : TLetter;
    FPrinted: Boolean;
    FBlankAfter: Boolean;
    FBlankBefore: Boolean;
    FAlignment: TAlignment;
    FUsesTab: string;
    FFont2Size: integer;
    FFont2No: integer;
    FFont2Style: integer;
    fDetailed: string;
    fShowDetailed: Boolean;
    function  GetClone : TElement;
    procedure SetColumn(const Value: integer);
    procedure SetFixed(const Value: Boolean);
    procedure SetFontNo(const Value: integer);
    procedure SetFontSize(const Value: integer);
    procedure SetFontStyle(const Value: integer);
    procedure SetLeft(const Value: integer);
    procedure SetName(const Value: string);
    procedure SetNumber(const Value: integer);
    procedure SetPrintOrder(const Value: integer);
    procedure SetText(const Value: string);
    procedure SetWidth(const Value: integer);
    procedure SetDbData(const Value: Boolean);
    procedure SetPrinted(const Value: Boolean);
    procedure SetBlankAfter(const Value: Boolean);
    procedure SetBlankBefore(const Value: Boolean);
    procedure SetAlignment(const Value: TAlignment);
    procedure SetUsesTab(const Value: string);
    procedure SetFont2No(const Value: integer);
    procedure SetFont2Size(const Value: integer);
    procedure SetFont2Style(const Value: integer);
    procedure setDetailed(const Value: string);
    procedure setShowDetailed(const Value: Boolean);
  public
    procedure Assign(anElement : TElement);
    constructor Create(aLetter : TLetter);
{$IFDEF DEBUG}
    procedure Dump;
{$ENDIF}
    property Alignment : TAlignment read FAlignment write SetAlignment;
    property BlankAfter : Boolean read FBlankAfter write SetBlankAfter;
    property BlankBefore : Boolean read FBlankBefore write SetBlankBefore;
    property Detailed : string read fDetailed write setDetailed;
    property ShowDetailed : Boolean read fShowDetailed write SetShowDetailed;
    property Clone : TElement read GetClone;
    property Column : integer read FColumn write SetColumn;
    property DbData : Boolean read FDbData write SetDbData;
    property Fixed : Boolean read FFixed write SetFixed;
    property FontNo : integer read FFontNo write SetFontNo;
    property FontSize : integer read FFontSize write SetFontSize;
    property FontStyle : integer read FFontStyle write SetFontStyle;
    property Font2No : integer read FFont2No write SetFont2No;
    property Font2Size : integer read FFont2Size write SetFont2Size;
    property Font2Style : integer read FFont2Style write SetFont2Style;
    property Left : integer read FLeft write SetLeft;
    property Name : string read FName write SetName;
    property Number : integer read FNumber write SetNumber;
    property Parent : TLetter read FParent write FParent;
    property Printed : Boolean read FPrinted write SetPrinted;
    property PrintOrder : integer read FPrintOrder write SetPrintOrder;
    property Text : string read FText write SetText;
    property UsesTab : string read FUsesTab write SetUsesTab;
    property Width : integer read FWidth write SetWidth;
  end;

  TElementList     = class
  private
    FElements : TList;
    FParent : TLetter;
    function GetClone : TElementList;
    function GetElement(Index: integer): TElement;
    function GetElementByNumber(num: integer): TElement;
    function GetCount : integer;
  public
    constructor Create(aLetter : TLetter);
    destructor Destroy; override;
    procedure Add(Element : TElement);
    procedure Clear;
{$IFDEF DEBUG}
    procedure Dump;
{$ENDIF}
    procedure Sort;
    property Clone : TElementList read GetClone;
    property Count : integer read GetCount;
    property Element[Index : integer] : TElement read GetElement; default;
    property ElementByNumber[Num : integer] : TElement read GetElementByNumber;
    property Parent : TLetter read FParent;
  end;

  TLetterFont      = class
  private
    FFontStyle: integer;
    FFontSize: integer;
    FFontName: string;
    function  GetClone : TLetterFont;
    procedure SetFontName(const Value: string);
    procedure SetFontSize(const Value: integer);
    procedure SetFontStyle(const Value: integer);
  public
    procedure Assign(aLetterFont : TLetterFont);
{$IFDEF DEBUG}
    procedure Dump;
{$ENDIF}
    property Clone : TLetterFont read GetClone;
    property FontName : string read FFontName write SetFontName;
    property FontSize : integer read FFontSize write SetFontSize;
    property FontStyle : integer read FFontStyle write SetFontStyle;
  end;

  TFontArray  = array [1..5] of TLetterFont;

  TLetter     = class
  private
    FElements : TElementList;
    FFontArray: TFontArray;
    FName: string;
    FLetterType: integer;
    FIsDefault: Boolean;
    FTabStop2: double;
    FTabStop1: double;
    FTabUnit: string;
    function  GetClone : TLetter;
    function  GetTabStop1Pixels : integer;
    function  GetTabStop2Pixels : integer;
    procedure SetName(const Value: string);
    procedure SetLetterType(const Value: integer);
    procedure SetIsDefault(const Value: Boolean);
    procedure SetTabStop1(const Value: double);
    procedure SetTabStop2(const Value: double);
    procedure SetTabUnit(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
{$IFDEF DEBUG}
    procedure Dump;
{$ENDIF}
    property Clone : TLetter read GetClone;
    property IsDefault : Boolean read FIsDefault write SetIsDefault;
    property Elements : TElementList read FElements;
    property FontArray : TFontArray read FFontArray;
    property LetterType : integer read FLetterType write SetLetterType;
    property Name : string read FName write SetName;
    property TabUnit : string read FTabUnit write SetTabUnit;
    property TabStop1 : double read FTabStop1 write SetTabStop1;
    property TabStop2 : double read FTabStop2 write SetTabStop2;
    property TabStop1Pixels : integer read GetTabStop1Pixels;
    property TabStop2Pixels : integer read GetTabStop2Pixels;
  end;

implementation
uses
  Forms, SysUtils;
{ TElement }

procedure TElement.Assign(anElement: TElement);
begin
  Alignment    := anElement.Alignment    ;
  BlankAfter   := anElement.BlankAfter   ;
  BlankBefore  := anElement.BlankBefore  ;
  Detailed     := anElement.Detailed      ;
  Column       := anElement.Column       ;
  DbData       := anElement.DbData       ;
  Fixed        := anElement.Fixed        ;
  FontNo       := anElement.FontNo       ;
  FontSize     := anElement.FontSize     ;
  FontStyle    := anElement.FontStyle    ;
  Font2No      := anElement.Font2No      ;
  Font2Size    := anElement.Font2Size    ;
  Font2Style   := anElement.Font2Style   ;
  Left         := anElement.Left         ;
  Name         := anElement.Name         ;
  Number       := anElement.Number       ;
  Printed      := anElement.Printed      ;
  PrintOrder   := anElement.PrintOrder   ;
  Text         := anElement.Text         ;
  UsesTab      := anElement.UsesTab      ;
  Width        := anElement.Width        ;
  ShowDetailed := anElement.ShowDetailed  ;
end;

constructor TElement.Create(aLetter: TLetter);
begin
  FParent := aLetter;
end;

{$IFDEF DEBUG}
procedure TElement.Dump;
begin
  Trace('BlankAfter   = ' +  BoolToStr(BlankAfter) );
  Trace('BlankBefore  = ' +  BoolToStr(BlankBefore));
  Trace('Column       = ' +  IntToStr(Column)      );
  Trace('DbData       = ' +  BoolToStr(DbData)     );
  Trace('Fixed        = ' +  BoolToStr(Fixed)      );
  Trace('FontNo       = ' +  IntToStr(FontNo)      );
  Trace('FontSize     = ' +  IntToStr(FontSize)    );
  Trace('FontStyle    = ' +  IntToStr(FontStyle)   );
  Trace('Font2No      = ' +  IntToStr(Font2No)     );
  Trace('Font2Size    = ' +  IntToStr(Font2Size)   );
  Trace('Font2Style   = ' +  IntToStr(Font2Style)  );
  Trace('Left         = ' +  IntToStr(Left)        );
  Trace('Name         = ' +  Name                  );
  Trace('Number       = ' +  IntToStr(Number)      );
  Trace('Printed      = ' +  BoolToStr(Printed)    );
  Trace('PrintOrder   = ' +  IntToStr(PrintOrder)  );
  Trace('Text         = ' +  Text                  );
  Trace('Width        = ' +  IntToStr(Width)       );
  Trace('Detailed     = ' +  Detailed             );
  Trace('ShowDetailed = ' +  BoolToStr(ShowDetailed) );
  case Alignment of
  taLeftJustify:  Trace('Alignment    = Left');
  taCenter:       Trace('Alignment    = Centre');
  taRightJustify: Trace('Alignment    = Right');
  end;  { case }
  Trace('UsesTab      = ' + UsesTab);
  Trace('============================');
end;
{$ENDIF}

function TElement.GetClone: TElement;
begin
  Result := TElement.Create(Parent);
  Result.Assign(Self);
end;

procedure TElement.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
end;

procedure TElement.SetBlankAfter(const Value: Boolean);
begin
  FBlankAfter := Value;
end;

procedure TElement.SetBlankBefore(const Value: Boolean);
begin
  FBlankBefore := Value;
end;

procedure TElement.SetColumn(const Value: integer);
begin
  FColumn := Value;
end;

procedure TElement.SetDbData(const Value: Boolean);
begin
  FDbData := Value;
end;

procedure TElement.setDetailed(const Value: string);
begin
  fDetailed := Value;
end;

procedure TElement.SetFixed(const Value: Boolean);
begin
  FFixed := Value;
end;

procedure TElement.SetFont2No(const Value: integer);
begin
  FFont2No := Value;
end;

procedure TElement.SetFont2Size(const Value: integer);
begin
  FFont2Size := Value;
end;

procedure TElement.SetFont2Style(const Value: integer);
begin
  FFont2Style := Value;
end;

procedure TElement.SetFontNo(const Value: integer);
begin
  FFontNo := Value;
end;

procedure TElement.SetFontSize(const Value: integer);
begin
  FFontSize := Value;
end;

procedure TElement.SetFontStyle(const Value: integer);
begin
  FFontStyle := Value;
end;

procedure TElement.SetLeft(const Value: integer);
begin
  FLeft := Value;
end;

procedure TElement.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TElement.SetNumber(const Value: integer);
begin
  FNumber := Value;
end;

procedure TElement.SetPrinted(const Value: Boolean);
begin
  FPrinted := Value;
end;

procedure TElement.SetPrintOrder(const Value: integer);
begin
  FPrintOrder := Value;
end;

procedure TElement.setShowDetailed(const Value: Boolean);
begin
  fShowDetailed := Value;
end;

procedure TElement.SetText(const Value: string);
begin
  FText := Value;
end;

procedure TElement.SetUsesTab(const Value: string);
begin
  FUsesTab := Value;
end;

procedure TElement.SetWidth(const Value: integer);
begin
  FWidth := Value;
end;

{ TLetterFont }

procedure TLetterFont.Assign(aLetterFont: TLetterFont);
begin
  FontName     := aLetterFont.FontName;
  FontSize     := aLetterFont.FontSize;
  FontStyle    := aLetterFont.FontStyle;
end;

{$IFDEF DEBUG}
procedure TLetterFont.Dump;
begin
  Trace('FontName     = ' +  FontName     );
  Trace('FontSize     = ' +  IntToStr(FontSize)     );
  Trace('FontStyle    = ' +  IntToStr(FontStyle)    );
end;
{$ENDIF}

function TLetterFont.GetClone: TLetterFont;
begin
  Result := TLetterFont.Create;
  Result.Assign(Self);
end;

procedure TLetterFont.SetFontName(const Value: string);
begin
  FFontName := Value;
end;

procedure TLetterFont.SetFontSize(const Value: integer);
begin
  FFontSize := Value;
end;

procedure TLetterFont.SetFontStyle(const Value: integer);
begin
  FFontStyle := Value;
end;

{ TLetter }

procedure TLetter.Clear;
var
  i : integer;
begin
  FElements.Clear;
  for i := Low(FontArray) to High(FontArray) do
  begin
    FFontArray[i].FontName := '';
    FFontArray[i].FontSize := 0;
    FFontArray[i].FontStyle := 0;
  end;
end;

constructor TLetter.Create;
var
  i : integer;
begin
  FElements := TElementList.Create(Self);
  for i := Low(FontArray) to High(FontArray) do
    FFontArray[i] := TLetterFont.Create;
end;

destructor TLetter.Destroy;
var
  i : integer;
begin
  for i := Low(FontArray) to High(FontArray) do
    FFontArray[i].Free;
  FElements.Free;
  inherited;
end;

{$IFDEF DEBUG}
procedure TLetter.Dump;
var
  i : integer;
begin
  Trace('Letter Dump ***********************');
  Trace('Letter Name  = ' + Name);
  Trace('IsDefault    = ' + BoolToStr(IsDefault));
  Trace('TabUnit      = ' + TabUnit);
  Trace('TabStop1     = ' + FloatToStr(TabStop1));
  Trace('TabStop2     = ' + FloatToStr(TabStop2));
  for i := Low(FontArray) to High(FontArray) do
    FFontArray[i].Dump;
  Trace('Elements follow ===================');
  Elements.Dump;
end;
{$ENDIF}

function TLetter.GetClone: TLetter;
var
  i : integer;
begin
  Result := TLetter.Create;
  Result.FElements.Free;
  Result.FElements := FElements.Clone;
  Result.Name := Name;
  Result.LetterType := LetterType;
  Result.IsDefault := IsDefault;
  Result.TabUnit := TabUnit;
  Result.TabStop1 := TabStop1;
  Result.TabStop2 := TabStop2;
  for i := Low(FontArray) to High(FontArray) do
    Result.FFontArray[i].Assign(FontArray[i]);
end;

function TLetter.GetTabStop1Pixels: integer;
begin
  if CompareText(TabUnit, sInches) = 0 then
    Result := Trunc(TabStop1 * Screen.PixelsPerInch)
  else
    Result := Trunc(TabStop1 / InchesToCm * Screen.PixelsPerInch);
end;

function TLetter.GetTabStop2Pixels: integer;
begin
  if CompareText(TabUnit, sInches) = 0 then
    Result := Trunc(TabStop2 * Screen.PixelsPerInch)
  else
    Result := Trunc(TabStop2 / InchesToCm * Screen.PixelsPerInch);
end;

procedure TLetter.SetIsDefault(const Value: Boolean);
begin
  FIsDefault := Value;
end;

procedure TLetter.SetLetterType(const Value: integer);
begin
  FLetterType := Value;
end;

procedure TLetter.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TLetter.SetTabStop1(const Value: double);
begin
  FTabStop1 := Value;
end;

procedure TLetter.SetTabStop2(const Value: double);
begin
  FTabStop2 := Value;
end;

procedure TLetter.SetTabUnit(const Value: string);
begin
  FTabUnit := Value;
end;

{ TElementList }

function SortElements(Item1, Item2: Pointer): Integer;
begin
  { Compare returns < 0 if Item1 is less and Item2, 0 if they are equal
    and > 0 if Item1 is greater than Item2. We are checking PrintOrder then
    if equal Column then if still equal ElementNumber.  Thus we should never
    really return equal. }
  if TElement(Item1).PrintOrder < TElement(Item2).PrintOrder then
    Result := -1
  else
  if TElement(Item1).PrintOrder = TElement(Item2).PrintOrder then
  begin  { Check column order }
    if TElement(Item1).Column < TElement(Item2).Column then
      Result := -1
    else
    if TElement(Item1).Column = TElement(Item2).Column then
    begin
      if TElement(Item1).Number < TElement(Item2).Number then
        Result := -1
      else
      if TElement(Item1).Number = TElement(Item2).Number then
        Result := 0  { Should be impossible }
      else
        Result := 1;
    end
    else
      Result := 1;
  end
  else
    Result := 1;
end;

procedure TElementList.Add(Element: TElement);
begin
  FElements.Add(Element);
end;

procedure TElementList.Clear;
var
  i : integer;
begin
  for i := 0 to Pred(FElements.Count) do
    TElement(FElements[i]).Free;
  FElements.Clear;
end;

constructor TElementList.Create(aLetter : TLetter);
begin
  FElements := TList.Create;
  FParent := aLetter;
end;

destructor TElementList.Destroy;
begin
  Clear;
  FElements.Free;
  inherited;
end;

{$IFDEF DEBUG}
procedure TElementList.Dump;
var
  i : integer;
begin
  for i := 0 to Pred(FElements.Count) do
    TElement(FElements[i]).Dump;
end;
{$ENDIF}

function TElementList.GetClone: TElementList;
var
  i : integer;
begin
  Result := TElementList.Create(Parent);
  for i := 0 to Pred(FElements.Count) do
    Result.FElements.Add(TElement(FElements[i]).Clone);
end;

function TElementList.GetCount: integer;
begin
  Result := FElements.Count;
end;

function TElementList.GetElement(Index: integer): TElement;
begin
  Result := FElements[Index];
end;

function TElementList.GetElementByNumber(num: integer): TElement;
var
  i : integer;
begin
  Result := nil;
  for i := 0 to Pred(Count) do
    if TElement(FElements[i]).Number = num then
      Result := FElements[i];
end;

procedure TElementList.Sort;
begin
  FElements.Sort(SortElements);
end;

end.

