unit wtRSQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, IniFiles, wtRPQuote,
  QrExport, StrUtils, ShellAPI, wtRPQuoteSummary,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSQuote = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    chkbxprintLogo: TCheckBox;
    SelectLst: TListBox;
    qryGetQuotes: TFDQuery;
    chkbxShowDetail: TCheckBox;
    btnPreview: TButton;
    btnEmail: TButton;
    chkbxOnlyShowGrandTotal: TCheckBox;
    qryQuoteMaterial: TFDQuery;
    OldqryReport: TFDQuery;
    selectionGrp: TGroupBox;
    Label2: TLabel;
    memSelection: TMemo;
    chkbxIncludeConfirm: TCheckBox;
    chkbxExcludeTemplate: TCheckBox;
    qryReport: TFDQuery;
    chkbxShowDiscount: TCheckBox;
    chkbxPrintTemplate: TCheckBox;
    chkbxPrintAvailability: TCheckBox;
    chkbxPrintTerms: TCheckBox;
    chkbxShowOffer: TCheckBox;
    rdgrpType: TRadioGroup;
    chkbxEndUserMarkup: TCheckBox;
    chkbxHideAllPrices: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure EnableRun(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkbxShowDetailClick(Sender: TObject);
    procedure memSelectionKeyPress(Sender: TObject; var Key: Char);
    procedure chkbxOnlyShowGrandTotalClick(Sender: TObject);
    procedure chkbxHideAllPricesClick(Sender: TObject);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    iIntselcode: integer;
    FEmailAttachment : TstringList;
    FPrintType: string;
    sTemplateConditionsFile: string;
    sAttachmentType: string;
    sAvailabilityFile: string;
    sTermsAndConditionsFile: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetPrinterBin(BinCode: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure RunReport(const bPreview: boolean);
    procedure RunSummaryReport(const bPreview: boolean);
    procedure EmailReport;
    procedure EmailSummaryReport;
    procedure EmailTradeReport;
    procedure FaxTradeReport;
    procedure RunTradeReport(const bPreview: boolean);
    procedure BuildEmailDetails;
    procedure BuildFaxDetails;
    procedure ClearEmailArray(Sender: TObject);
    procedure ClearFaxArray(Sender: TObject);
    procedure GetSelection;
    procedure BuildSelection;
    procedure BuildRange(sFirst, sLast: string);
    procedure SetPrintType(const Value: string);
    procedure RunTemplateReport(const bPreview: boolean);
    function BuildQueryString: string;
    function GetQuoteMaterial(tempQuote: integer): string;
    function IncrementNo(StartStr: String): String;
    procedure PrintSummaryToAttachment(frmWTRPQuote: TfrmWTRPQuoteSummary; tempCode: string);
    procedure PrintDocument(const documentToPrint: string);
    procedure PrintDocuments;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  public
    bPrinted: boolean;
    bRetail: boolean;
    bSpeculative: boolean;
    bClosed: boolean;
    property PrintType: string read FPrintType write SetPrintType;
  end;

var
  frmWTRSQuote: TfrmWTRSQuote;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses
  wtDataModule, wtSendFax, wtFaxList, wtRPTemplate, AllEmailHandler,
  wtRPQuoteTrade, wtEmailList, wtMain, AllCommon, Printer.Tools, System.UITypes;

const

  SQLCore =
  'SELECT DISTINCT ' +
  '    Quote.Quote, ' +
  '    Customer.Email_Address AS Email, ' +
  '    Quote.Contact_Name AS Name, ' +
  '    ''Adobe Acrobat Document (*.pdf)'' AS export_filter_desc, ' +
  '    ''PDF'' AS ExportFilter, ' +
  '    '' '' AS CC_Email, ' +
  '    Customer_contact.Email_address AS Contact_Email ' +
  'FROM (Customer ' +
  '      INNER JOIN Quote ' +
  '        ON Customer.Customer = Quote.Customer) ' +
  '      LEFT JOIN Customer_contact ' +
  '        ON (Quote.Customer = Customer_contact.Customer) AND (Quote.Contact_Name = Customer_contact.Contact_name) ' +
  'WHERE 1 = 1 AND ';

  SQLCoreOld =
  'SELECT DISTINCT Quote.Quote, '+
  'Customer.Email_Address as Email, '+
  'Quote.Contact_Name as Name, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM (Customer '+
  'INNER JOIN Quote ON '+
  'Customer.Customer = Quote.Customer) '+
  'WHERE 1=1 AND ';

  SQLRetailCore =
  'SELECT DISTINCT Quote.Quote, '+
  'Address.Email_Address as Email, '+
  'Address.Address_Name as Name, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email, ' +
  'Address.Email_Address as Contact_Email '+
  'FROM (Address '+
  'INNER JOIN Quote ON '+
  'Address.Address = Quote.Address) '+
  'WHERE 1=1 AND ';
{$R *.dfm}

procedure TfrmWTRSQuote.Button4Click(Sender: TObject);
begin
  bClosed := true;
  close;
end;

procedure TfrmWTRSQuote.btnPrintClick(Sender: TObject);
begin
  if PrintType = 'T' then
    begin
      RunTemplateReport(false);
      if bPrinted then
        RunReport(false);
    end
  else
  if dtmdlWorktops.UseTradeDetails and not self.bRetail then
    RunTradeReport(false)
  else
    begin
      case rdgrpType.ItemIndex of
        0:  RunReport(false);
        1:  RunSummaryReport(false);
      end;
      if bPrinted then
        PrintDocuments;
    end;
end;

procedure TfrmWTRSQuote.PrintDocuments;
var
  sPath, sFilename: string;
  i: integer;
begin
  {Template document}
  if chkbxPrintTemplate.checked then
    begin
      sTemplateConditionsFile := dtmdlWorktops.GetTemplateConditionsFile;
      printDocument(sTemplateConditionsFile);
    end;

  if chkbxPrintAvailability.checked then
    begin
      sAvailabilityFile := dtmdlWorktops.GetAvailabilityFile;
      printDocument(sAvailabilityFile);
    end;

  if chkbxPrintTerms.checked then
    begin
      sTermsAndConditionsFile := dtmdlWorktops.GetTermsAndConditionsFile;
      printDocument(sTermsAndConditionsFile);
    end;
end;

procedure TfrmWTRSQuote.PrintDocument(const documentToPrint : string) ;
var
  printCommand : string;
  printerInfo : string;
  Device, Driver, Port: array[0..255] of Char;
  hDeviceMode: THandle;
begin
  printCommand := 'print';
  printerInfo := '';

  ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_HIDE) ;
end;

procedure TfrmWTRSQuote.EmailReport;
var
  sEmail, sTemp, sSubject, sTo, sBodyText, sMaterial: string;
  AttachmentList: TStringList;
  i, icount, irow, iQuoteCount: integer;
  iPosStart,iPosEnd: integer;
  sFilename: array[0..255] of Char;
  printFileName: string;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  frmWTEmailList := TfrmWTEmailList.Create(Self);
  try
    frmWTEmailList.CodeType := 'Q';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
//      frmWTEmailList.EmailListGrid.ColWidths[0] := 0;
      frmWTEmailList.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      frmWTEmailList.EmailListGrid.Cells[1, icount] := EmailArray[icount, 5];
      frmWTEmailList.EmailListGrid.Cells[2, icount] := EmailArray[icount, 9];
      frmWTEmailList.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      frmWTEmailList.EmailListGrid.Cells[4, icount] := EmailArray[icount, 7];
      frmWTEmailList.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];


      {Set up the Email Array with the Customer/Branch/Contact}
      frmWTEmailList.EmailContactArray[icount,1] := EmailArray[icount, 3];
      frmWTEmailList.EmailContactArray[icount,2] := EmailArray[icount, 4];
      frmWTEmailList.EmailContactArray[icount,3] := EmailArray[icount, 2];
    end;
    if icount = 1 then
      frmWTEmailList.EmailListGrid.RowCount := 2
    else
      frmWTEmailList.EmailListGrid.RowCount := icount;

    frmWTEmailList.Caption := 'Quotation Customer List';
    frmWTEmailList.EmailListGrid.Cells[0, 0] := 'Quote';
    frmWTEmailList.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    frmWTEmailList.EmailListGrid.Cells[2, 0] := 'Contact';

    frmWTEmailList.ShowModal;

    sEmail := '';
    iQuoteCount := 0;

    {If OK to do the emailing then send all the emails}
    if frmWTEmailList.ModalResult = idok then
    begin
      for irow := 1 to frmWTEmailList.EmailListGrid.Rowcount -1 do
      begin
        if Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) = '' then continue;  {Drop out if no email address}

        if (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> sEmail) and (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> '') then
          begin
            if sEmail <> '' then
              begin
                if chkbxPrintTemplate.checked and (sTemplateConditionsFile <> '') then
                  FEmailAttachment.Add(sTemplateConditionsFile);

                if chkbxPrintAvailability.checked and (sAvailabilityFile <> '') then
                  FEmailAttachment.Add(sAvailabilityFile);

                if chkbxPrintTerms.checked and (sTermsAndConditionsFile <> '') then
                  FEmailAttachment.Add(sTermsAndConditionsFile);

                EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

                for i := pred(FEmailAttachment.count) downto 0 do
                  begin
                    if (pos(sTemplateConditionsFile,FEmailAttachment.strings[i]) > 0) OR
                       (pos(sAvailabilityFile,FEmailAttachment.strings[i]) > 0) OR
                       (pos(sTermsAndConditionsFile,FEmailAttachment.strings[i]) > 0) then
                      continue;
                    StrPCopy(sFilename, FEmailAttachment.strings[i]);
                    deletefile(sFilename);
                  end;
              end;
            FEmailAttachment.clear;
            iQuoteCount := 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmwtRPQuote := TfrmwtRPQuote.Create(Self);
            try
              frmwtRPQuote.bPreview := false;
              frmwtRPQuote.Quote := strtoint(EmailArray[irow,1]);
              frmwtRPQuote.bPrintLogo := chkbxPrintLogo.checked;
              frmwtRPQuote.bShowOffer := chkbxShowOffer.checked;
              frmwtRPQuote.bPrintDetail := chkbxShowDetail.checked;
              frmwtRPQuote.bPrintDiscount := chkbxShowDiscount.checked;
              frmwtRPQuote.bOnlyGrandTotal := chkbxOnlyShowGrandTotal.checked;
              frmwtRPQuote.bExcludeTemplate := chkbxExcludeTemplate.checked;
              frmwtRPQuote.bPrintAcceptance := chkbxIncludeConfirm.checked;
              {$IFNDEF MEGAMARBLE}
              frmwtRPQuote.bHideAllPrices := chkbxHideAllPrices.checked;
              {$ENDIF}

              frmwtRPQuote.qrpDetails.ShowProgress := false;

              if (frmwtRPQuote.GetDetails = 0) then
  	            begin
                  MessageDlg('There are no quotes to print.',mterror,[mbOK],0);
                  exit;
    	          end;

              sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
              printFileName := 'Q' + EmailArray[irow,1];
              TPrinterTools.New.PrintToAttachment(frmwtRPQuote.qrpDetails, FEMailAttachment, printFileName, sAttachmentType);

              if iQuoteCount = 1 then
                begin
                  sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);

                  sSubject := 'Quotation: ' + EmailArray[irow,1] + ' - ' + frmwtRPQuote.qryReport.fieldbyname('Reference').asstring;

                  sBodyText := '';
                  if bRetail then
                    sBodyText := dtmdlWorktops.GetEmailRetailQuoteDetails;

                  if trim(sBodyText) = '' then
                    sBodyText := dtmdlWorktops.GetEmailQuoteDetails;

                  if trim(sBodyText) = '' then
                    sBodyText := 'Please find attached, quote ' + EmailArray[irow,1] + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;

                  {Replace the quote number}
                  if pos('<Number>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(sBodyText, '<Number>', frmwtRPQuote.qryReport.fieldbyname('Quote').asstring, [rfIgnoreCase])
                    end;

                  {Replace the contact name}
                  if pos('<Customer Contact>', sBodyText) > 0 then
                    begin
                      if trim(frmwtRPQuote.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
                        sBodyText := stringreplace(sBodyText, '<Customer Contact>', frmwtRPQuote.qryReport.fieldbyname('Contact_Name').asstring, [rfIgnoreCase])
                      else
                        sBodyText := stringreplace(sBodyText, '<Customer Contact>', 'Sir/Madam', [rfIgnoreCase]);
                    end;

                  {Replace the description}
                  if pos('<Description>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(sBodyText, '<Description>', frmwtRPQuote.qryReport.fieldbyname('Description').asstring, [rfIgnoreCase])
                    end;

                  {Replace the material}
                  if pos('<Material>', sBodyText) > 0 then
                    begin
                      sMaterial := GetQuoteMaterial(frmwtRPQuote.qryReport.fieldbyname('Quote').asinteger);

                      sBodyText := stringreplace(sBodyText, '<Material>', sMaterial, [rfIgnoreCase])
                    end;

                  {Replace the description}
                  if pos('<Office Contact>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(sBodyText, '<Office Contact>', frmwtRPQuote.qryReport.fieldbyname('Account_Manager_Name').asstring, [rfIgnoreCase]);
                    end;

                  {Replace the description}
                  if pos('<Telephone>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(sBodyText, '<Telephone>', frmwtRPQuote.qryReport.fieldbyname('AM_Telephone_Number').asstring, [rfIgnoreCase]);
                    end;
                end;
            finally
              frmwtRPQuote.free;
            end;
          end
        else
          begin
            iQuoteCount := iQuoteCount + 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmwtRPQuote := TfrmwtRPQuote.Create(Self);
            try
              frmwtRPQuote.bPreview := false;
              frmwtRPQuote.Quote := strtoint(EmailArray[irow,1]);
              frmwtRPQuote.bPrintLogo := chkbxPrintLogo.checked;
              frmwtRPQuote.bShowOffer := chkbxShowOffer.checked;
              frmwtRPQuote.bPrintDetail := chkbxShowDetail.checked;
              frmwtRPQuote.bPrintDiscount := chkbxShowDiscount.checked;
              frmwtRPQuote.bOnlyGrandTotal := chkbxOnlyShowGrandTotal.checked;
              frmwtRPQuote.bExcludeTemplate := chkbxExcludeTemplate.checked;
              frmwtRPQuote.bPrintAcceptance := chkbxIncludeConfirm.checked;
              frmwtRPQuote.bHideAllPrices := chkbxHideAllPrices.checked;
              frmwtRPQuote.bApplyEndUserMarkup := chkbxEndUserMarkup.checked;

              frmwtRPQuote.qrpDetails.ShowProgress := false;

              frmwtRPQuote.GetDetails;
              sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
              printFileName := 'Q' + EmailArray[irow,1];
              TPrinterTools.New.PrintToAttachment(frmwtRPQuote.qrpDetails, FEMailAttachment, printFileName, sAttachmentType);

              sSubject := sSubject + ', ' + EmailArray[irow,1] + ' - ' + frmwtRPQuote.qryReport.fieldbyname('Reference').asstring;

              sBodytext := '';

              if bRetail then
                sBodyText := dtmdlWorktops.GetEmailRetailQuoteDetails;

              if trim(sBodyText) = '' then
                sBodyText := dtmdlWorktops.GetEmailQuoteDetails;

              if trim(sBodyText) = '' then
                sBodytext := 'Please find attached your quotations.'#13#10#13#10
                              +  'If you have any queries please contact me immediately'#13#10#13#10;

              {Replace the quote number}
              if pos('<Number>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Number>', '', [rfIgnoreCase])
                end;

              {Replace the contact name}
              if pos('<Customer Contact>', sBodyText) > 0 then
                begin
                  if trim(frmwtRPQuote.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Customer Contact>', '', [rfIgnoreCase])
                  else
                    sBodyText := stringreplace(sBodyText, '<Customer Contact>', '', [rfIgnoreCase]);
                end;

              {Replace the description}
              if pos('<Description>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(emailHandler.Body, '<Description>', '', [rfIgnoreCase])
                end;

              {Replace the material}
              if pos('<Material>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Material>', '', [rfIgnoreCase])
                end;

              {Replace the description}
              if pos('<Office Contact>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Office Contact>', '', [rfIgnoreCase]);
                end;

              {Replace the description}
              if pos('<Telephone>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Telephone>', '', [rfIgnoreCase]);
                end;

              {Replace any left over chevrons}
              while Pos('>', sBodyText) > 0 do
                begin
                  sBodyText := stringreplace(sBodyText, '>', '', [rfIgnoreCase]);
                end;

              while Pos('<', sBodyText) > 0 do
                begin
                  sBodyText := stringreplace(sBodyText, '<', '', [rfIgnoreCase]);
                end;
            finally
              frmwtRPQuote.free;
            end;
          end;
      end;
      if chkbxPrintTemplate.checked and (sTemplateConditionsFile <> '') then
        FEmailAttachment.Add(sTemplateConditionsFile);

      if chkbxPrintAvailability.checked and (sAvailabilityFile <> '') then
        FEmailAttachment.Add(sAvailabilityFile);

      if chkbxPrintTerms.checked and (sTermsAndConditionsFile <> '') then
        FEmailAttachment.Add(sTermsAndConditionsFile);

      if (FEmailAttachment.Count > 0) then
        begin
          EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);
        end;

      for i := pred(FEmailAttachment.count) downto 0 do
        begin
          if (pos(sTemplateConditionsFile,FEmailAttachment.strings[i]) > 0) OR
             (pos(sAvailabilityFile,FEmailAttachment.strings[i]) > 0) OR
             (pos(sTermsAndConditionsFile,FEmailAttachment.strings[i]) > 0) then
              continue;
          StrPCopy(sFilename, FEmailAttachment.strings[i]);
          deletefile(sFilename);
        end;
    end;
  finally
    frmWTEmailList.free;
  end;
  close;
end;

procedure TfrmWTRSQuote.EmailSummaryReport;
var
  sEmail, sTemp, sSubject, sTo, sBodyText, sMaterial: string;
  AttachmentList: TStringList;
  i, icount, irow, iQuoteCount: integer;
  iPosStart,iPosEnd: integer;
  sFilename: array[0..255] of Char;
  printFileName: string;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  frmWTEmailList := TfrmWTEmailList.Create(Self);
  try
    frmWTEmailList.CodeType := 'Q';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
//      frmWTEmailList.EmailListGrid.ColWidths[0] := 0;
      frmWTEmailList.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      frmWTEmailList.EmailListGrid.Cells[1, icount] := EmailArray[icount, 5];
      frmWTEmailList.EmailListGrid.Cells[2, icount] := EmailArray[icount, 9];
      frmWTEmailList.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      frmWTEmailList.EmailListGrid.Cells[4, icount] := EmailArray[icount, 7];
      frmWTEmailList.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];


      {Set up the Email Array with the Customer/Branch/Contact}
      frmWTEmailList.EmailContactArray[icount,1] := EmailArray[icount, 3];
      frmWTEmailList.EmailContactArray[icount,2] := EmailArray[icount, 4];
      frmWTEmailList.EmailContactArray[icount,3] := EmailArray[icount, 2];
    end;
    if icount = 1 then
      frmWTEmailList.EmailListGrid.RowCount := 2
    else
      frmWTEmailList.EmailListGrid.RowCount := icount;

    frmWTEmailList.Caption := 'Quotation Customer List';
    frmWTEmailList.EmailListGrid.Cells[0, 0] := 'Quote';
    frmWTEmailList.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    frmWTEmailList.EmailListGrid.Cells[2, 0] := 'Contact';

    frmWTEmailList.ShowModal;

    sEmail := '';
    iQuoteCount := 0;

    {If OK to do the emailing then send all the emails}
    if frmWTEmailList.ModalResult = idok then
    begin
      for irow := 1 to frmWTEmailList.EmailListGrid.Rowcount -1 do
      begin
        if Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) = '' then continue;  {Drop out if no email address}

        if (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> sEmail) and (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> '') then
          begin
            if sEmail <> '' then
              begin
                if sTemplateConditionsFile <> '' then
                  FEmailAttachment.Add(sTemplateConditionsFile);

                if sAvailabilityFile <> '' then
                  FEmailAttachment.Add(sAvailabilityFile);

                if sTermsAndConditionsFile <> '' then
                  FEmailAttachment.Add(sTermsAndConditionsFile);

                EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

                for i := pred(FEmailAttachment.count) downto 0 do
                  begin
                    if (pos(sTemplateConditionsFile,FEmailAttachment.strings[i]) > 0) OR
                       (pos(sAvailabilityFile,FEmailAttachment.strings[i]) > 0) OR
                       (pos(sTermsAndConditionsFile,FEmailAttachment.strings[i]) > 0) then
                      continue;
                    StrPCopy(sFilename, FEmailAttachment.strings[i]);
                    deletefile(sFilename);
                  end;
              end;
            FEmailAttachment.clear;
            iQuoteCount := 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmwtRPQuoteSummary := TfrmwtRPQuoteSummary.Create(Self);
            try
              frmwtRPQuoteSummary.bPreview := false;
              frmwtRPQuoteSummary.Quote := strtoint(EmailArray[irow,1]);
              frmwtRPQuoteSummary.bPrintLogo := chkbxPrintLogo.checked;
              frmwtRPQuoteSummary.bShowOffer := chkbxShowOffer.checked;
              frmwtRPQuoteSummary.bPrintDetail := chkbxShowDetail.checked;
              frmwtRPQuoteSummary.bPrintDiscount := chkbxShowDiscount.checked;
              frmwtRPQuoteSummary.bOnlyGrandTotal := chkbxOnlyShowGrandTotal.checked;
              frmwtRPQuoteSummary.bExcludeTemplate := chkbxExcludeTemplate.checked;
              frmwtRPQuoteSummary.bPrintAcceptance := chkbxIncludeConfirm.checked;

              frmwtRPQuoteSummary.qrpDetails.ShowProgress := false;

              if (frmwtRPQuoteSummary.GetDetails = 0) then
  	            begin
                  MessageDlg('There are no quotes to print.',mterror,[mbOK],0);
                  exit;
    	          end;

              sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
              printFileName := 'Q' + EmailArray[irow,1];
              TPrinterTools.New.PrintToAttachment(frmwtRPQuoteSummary.qrpDetails, FEMailAttachment, printFileName, sAttachmentType);

              if iQuoteCount = 1 then
                begin
                  sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);

                  sSubject := 'Quotation: ' + EmailArray[irow,1];

                  sBodyText := '';
                  if bRetail then
                    sBodyText := dtmdlWorktops.GetEmailRetailQuoteDetails;

                  if trim(sBodyText) = '' then
                    sBodyText := dtmdlWorktops.GetEmailQuoteDetails;

                  if trim(sBodyText) = '' then
                    sBodyText := 'Please find attached, quote ' + EmailArray[irow,1] + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;

                  {Replace the quote number}
                  if pos('<Number>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(sBodyText, '<Number>', frmwtRPQuoteSummary.qryReport.fieldbyname('Quote').asstring, [rfIgnoreCase])
                    end;

                  {Replace the contact name}
                  if pos('<Customer Contact>', sBodyText) > 0 then
                    begin
                      if trim(frmwtRPQuoteSummary.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
                        sBodyText := stringreplace(sBodyText, '<Customer Contact>', frmwtRPQuoteSummary.qryReport.fieldbyname('Contact_Name').asstring, [rfIgnoreCase])
                      else
                        sBodyText := stringreplace(sBodyText, '<Customer Contact>', 'Sir/Madam', [rfIgnoreCase]);
                    end;

                  {Replace the description}
                  if pos('<Description>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(emailHandler.Body, '<Description>', frmwtRPQuoteSummary.qryReport.fieldbyname('Description').asstring, [rfIgnoreCase])
                    end;

                  {Replace the material}
                  if pos('<Material>', sBodyText) > 0 then
                    begin
                      sMaterial := GetQuoteMaterial(frmwtRPQuoteSummary.qryReport.fieldbyname('Quote').asinteger);

                      sBodyText := stringreplace(sBodyText, '<Material>', sMaterial, [rfIgnoreCase])
                    end;

                  {Replace the description}
                  if pos('<Office Contact>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(sBodyText, '<Office Contact>', frmwtRPQuoteSummary.qryReport.fieldbyname('Account_Manager_Name').asstring, [rfIgnoreCase]);
                    end;

                  {Replace the description}
                  if pos('<Telephone>', sBodyText) > 0 then
                    begin
                      sBodyText := stringreplace(sBodyText, '<Telephone>', frmwtRPQuoteSummary.qryReport.fieldbyname('AM_Telephone_Number').asstring, [rfIgnoreCase]);
                    end;

                  {Replace any left over chevrons}
(*                  while Pos('>', sBodyText) > 0 do
                    begin
                      iPosStart := Pos('>', sBodyText);
                      iPosEnd := Pos('<', sBodyText);

                      if (iPosStart > 0) AND (iPosEnd > 0) AND (iPosStart < iPosEnd) then
                        sBodyText := stuffString(sBodyText, iPosStart, (iPosEnd-iPosStart),'')
                      else
                        sBodyText := stringreplace(sBodyText, '>', '', [rfIgnoreCase]);
                    end;
*)
                end;
            finally
              frmwtRPQuoteSummary.free;
            end;
          end
        else
          begin
            iQuoteCount := iQuoteCount + 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmwtRPQuoteSummary := TfrmwtRPQuoteSummary.Create(Self);
            try
              frmwtRPQuoteSummary.bPreview := false;
              frmwtRPQuoteSummary.Quote := strtoint(EmailArray[irow,1]);
              frmwtRPQuoteSummary.bPrintLogo := chkbxPrintLogo.checked;
              frmwtRPQuoteSummary.bShowOffer := chkbxShowOffer.checked;
              frmwtRPQuoteSummary.bPrintDetail := chkbxShowDetail.checked;
              frmwtRPQuoteSummary.bOnlyGrandTotal := chkbxOnlyShowGrandTotal.checked;
              frmwtRPQuoteSummary.bExcludeTemplate := chkbxExcludeTemplate.checked;
              frmwtRPQuoteSummary.bPrintAcceptance := chkbxIncludeConfirm.checked;

              frmwtRPQuoteSummary.qrpDetails.ShowProgress := false;

              frmwtRPQuoteSummary.GetDetails;

              sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
              printFileName := 'Q' + EmailArray[irow,1];
              TPrinterTools.New.PrintToAttachment(frmwtRPQuoteSummary.qrpDetails, FEMailAttachment, printFileName, sAttachmentType);

              sSubject := sSubject + ', ' + EmailArray[irow,1];

              sBodytext := '';

              if bRetail then
                sBodyText := dtmdlWorktops.GetEmailRetailQuoteDetails;

              if trim(sBodyText) = '' then
                sBodyText := dtmdlWorktops.GetEmailQuoteDetails;

              if trim(sBodyText) = '' then
                sBodytext := 'Please find attached your quotations.'#13#10#13#10
                              +  'If you have any queries please contact me immediately'#13#10#13#10;

              {Replace the quote number}
              if pos('<Number>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Number>', '', [rfIgnoreCase])
                end;

              {Replace the contact name}
              if pos('<Customer Contact>', sBodyText) > 0 then
                begin
                  if trim(frmwtRPQuoteSummary.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Customer Contact>', '', [rfIgnoreCase])
                  else
                    sBodyText := stringreplace(sBodyText, '<Customer Contact>', '', [rfIgnoreCase]);
                end;

              {Replace the description}
              if pos('<Description>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(emailHandler.Body, '<Description>', '', [rfIgnoreCase])
                end;

              {Replace the material}
              if pos('<Material>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Material>', '', [rfIgnoreCase])
                end;

              {Replace the description}
              if pos('<Office Contact>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Office Contact>', '', [rfIgnoreCase]);
                end;

              {Replace the description}
              if pos('<Telephone>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Telephone>', '', [rfIgnoreCase]);
                end;

              {Replace any left over chevrons}
              while Pos('>', sBodyText) > 0 do
                begin
                  sBodyText := stringreplace(sBodyText, '>', '', [rfIgnoreCase]);
                end;

              while Pos('<', sBodyText) > 0 do
                begin
                  sBodyText := stringreplace(sBodyText, '<', '', [rfIgnoreCase]);
                end;
            finally
              frmwtRPQuoteSummary.free;
            end;
          end;
      end;
      if sTemplateConditionsFile <> '' then
        FEmailAttachment.Add(sTemplateConditionsFile);

      if sAvailabilityFile <> '' then
        FEmailAttachment.Add(sAvailabilityFile);

      if sTermsAndConditionsFile <> '' then
        FEmailAttachment.Add(sTermsAndConditionsFile);

      if (FEmailAttachment.Count > 0) then
        begin
          EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);
        end;

      for i := pred(FEmailAttachment.count) downto 0 do
        begin
          if (pos(sTemplateConditionsFile,FEmailAttachment.strings[i]) > 0) OR
             (pos(sAvailabilityFile,FEmailAttachment.strings[i]) > 0) OR
             (pos(sTermsAndConditionsFile,FEmailAttachment.strings[i]) > 0) then
              continue;
          StrPCopy(sFilename, FEmailAttachment.strings[i]);
          deletefile(sFilename);
        end;
    end;
  finally
    frmWTEmailList.free;
  end;
  close;
end;

function TfrmWTRSQuote.GetQuoteMaterial(tempQuote: integer): string;
begin
  result := '';
  with qryQuoteMaterial do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;

      if recordcount > 0 then
        result := fieldbyname('Thickness_mm').asstring + ' ' + fieldbyname('Colour_Description').asstring + ' ' + fieldbyname('Material_Description').asstring
      else
        result := '';
    end;
end;

procedure TfrmWTRSQuote.RunReport(const bPreview: boolean);
var
  PrinterSettings: TPrinterSettings;
  icount: integer;
begin
  GetSelection;

  frmwtRPQuote := TfrmwtRPQuote.create(self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      Printer.PrinterIndex := -1;
      for icount := 0 to pred(Printer.Printers.count) do
        begin
//          if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
          if DefaultPrinter = Printer.printers[icount] then
            Printer.PrinterIndex := icount;
        end;

      if DefaultPrinter <> '' then
        begin
          SetPrinterBin(DefaultBin);
        end;

//    frmwtRPQuote.Quote := strtoint(memSelection.text);
    frmwtRPQuote.bPrintLogo := chkbxPrintLogo.checked;
    frmwtRPQuote.bShowOffer := chkbxShowOffer.checked;
    frmwtRPQuote.bPrintDiscount := chkbxShowDiscount.checked;
    frmwtRPQuote.bPrintDetail := chkbxShowDetail.checked;
    frmwtRPQuote.bExcludeTemplate := chkbxExcludeTemplate.checked;
    frmwtRPQuote.bOnlyGrandTotal := chkbxOnlyShowGrandTotal.checked;
    {$IFNDEF MEGAMARBLE}
    frmwtRPQuote.bHideAllPrices := chkbxHideAllPrices.checked;
    frmwtRPQuote.bApplyEndUserMarkup := chkbxEndUserMarkup.checked;
    {$ENDIF}
    frmwtRPQuote.bPrintAcceptance := chkbxIncludeConfirm.checked;

    if printType = 'T' then
      begin
        frmwtRPQuote.bPrintLogo := false;
        frmwtRPQuote.bPrintDetail := false;
        frmwtRPQuote.bPrintAcceptance := false;
        frmwtRPQuote.bPrintTotals := false;
      end;

    frmwtRPQuote.qryReport.Close;
    frmwtRPQuote.qryReport.SQL.Text := qryReport.SQL.text;
    frmwtRPQuote.qryReport.Parambyname('Int_sel').AsInteger := iIntselcode;
    frmwtRPQuote.qryReport.Open;
    if frmwtRPQuote.qryreport.recordCount = 0 then
  	  begin
        MessageDlg('There are no quotes to print.',mterror,[mbOK],0);
        exit;
    	end;

(*    if (frmwtRPQuote.GetDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
*)
//    frmwtRPQuote.qrpDetails.Dataset := qryReport;
//    frmwtRPQuote.qrgQuote.Expression := 'Quote';
//    frmwtRPQuote.dtsReport.dataset := qryReport;

    bPrinted := false;
    frmwtRPQuote.bEndUser := false ;
    if bPreview then
      begin
        frmwtRPQuote.bPreview := true;
        frmwtRPQuote.qrpDetails.Preview;
      end
    else
      begin
        frmwtRPQuote.bPreview := false;
(*          if PrintType <> 'T' then
            frmwtRPQuote.qrpDetails.PrinterSetup;

          if frmwtRPQuote.qrpDetails.tag = 0 then
            begin
              frmwtRPQuote.qrpDetails.Print;
              bPrinted := true;
            end;
*)
          if PrintType <> 'T' then
            begin
              if SetUpPrinter(PrinterSettings) then
                begin
                  frmwtRPQuote.qrpDetails.Print;
                  bPrinted := true;
                end
            end
          else
            begin
              frmwtRPQuote.qrpDetails.Print;
              bPrinted := true;
            end;
          close;
        end;
    finally
      DefaultPrinter := printer.Printers[printer.printerindex];
      DefaultBin := GetBinSelection;
      PrinterSettings.Free;
    end;
  finally
    frmwtRPQuote.free;
  end;
end;

procedure TfrmWTRSQuote.RunSummaryReport(const bPreview: boolean);
var
  PrinterSettings: TPrinterSettings;
  icount: integer;
begin
  GetSelection;

  frmwtRPQuoteSummary := TfrmwtRPQuoteSummary.create(self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      Printer.PrinterIndex := -1;
      for icount := 0 to pred(Printer.Printers.count) do
        begin
//          if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
          if DefaultPrinter = Printer.printers[icount] then
            Printer.PrinterIndex := icount;
        end;

      if DefaultPrinter <> '' then
        begin
          SetPrinterBin(DefaultBin);
        end;
  
    frmwtRPQuoteSummary.bPrintLogo := chkbxPrintLogo.checked;
    frmwtRPQuoteSummary.bShowOffer := chkbxShowOffer.checked;
    frmwtRPQuoteSummary.bPrintDiscount := chkbxShowDiscount.checked;
    frmwtRPQuoteSummary.bPrintDetail := chkbxShowDetail.checked;
    frmwtRPQuoteSummary.bExcludeTemplate := chkbxExcludeTemplate.checked;
    frmwtRPQuoteSummary.bOnlyGrandTotal := chkbxOnlyShowGrandTotal.checked;
    frmwtRPQuoteSummary.bPrintAcceptance := chkbxIncludeConfirm.checked;

    if printType = 'T' then
      begin
        frmwtRPQuoteSummary.bPrintLogo := false;
        frmwtRPQuoteSummary.bPrintDetail := false;
        frmwtRPQuoteSummary.bPrintAcceptance := false;
        frmwtRPQuoteSummary.bPrintTotals := false;
      end;

    frmwtRPQuoteSummary.qryReport.Close;
    frmwtRPQuoteSummary.qryReport.SQL.Text := qryReport.SQL.text;
    frmwtRPQuoteSummary.qryReport.Parambyname('Int_sel').AsInteger := iIntselcode;
    frmwtRPQuoteSummary.qryReport.Open;
    if frmwtRPQuoteSummary.qryreport.recordCount = 0 then
  	  begin
        MessageDlg('There are no quotes to print.',mterror,[mbOK],0);
        exit;
    	end;
    bPrinted := false;
    frmwtRPQuoteSummary.bEndUser := false ;
    if bPreview then
      begin
        frmwtRPQuoteSummary.bPreview := true;
        frmwtRPQuoteSummary.qrpDetails.Preview;
      end
    else
      begin
        frmwtRPQuoteSummary.bPreview := false;
(*        if PrintType <> 'T' then
          frmwtRPQuoteSummary.qrpDetails.PrinterSetup;

        if frmwtRPQuoteSummary.qrpDetails.tag = 0 then
          begin
            frmwtRPQuoteSummary.qrpDetails.Print;
            bPrinted := true;
          end;
*)    
          if SetUpPrinter(PrinterSettings) then
            begin
              frmwtRPQuoteSummary.qrpDetails.Print;
              bPrinted := true;
            end;
      
        close;
      end;
  finally
    frmwtRPQuoteSummary.free;
  end;
end;

procedure TfrmWTRSQuote.EmailTradeReport;
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);
  frmwtRPQuoteTrade := TfrmwtRPQuoteTrade.Create(Self);
  try
    GetSelection;

    frmwtRPQuoteTrade.bPreview := false;
    frmwtRPQuoteTrade.Quote := strtoint(memSelection.text);
    frmwtRPQuoteTrade.bPrintLogo := true;
    frmwtRPQuoteTrade.bPrintDetail := chkbxShowDetail.checked;
    frmwtRPQuoteTrade.qrpDetails.ShowProgress := false;

    if (frmwtRPQuoteTrade.GetDetails = 0) then
      begin
        MessageDlg('There are no quotes to email', mtError, [mbAbort], 0);
        exit;
      end
    else
      begin
        sTemp := BuildQueryString;
        sSubject := 'Quotation: ' + memSelection.text;
        emailHandler.Body := 'Please find attached, Quote: ' + memSelection.text + '.'#13#10#13#10;
        emailHandler.ccEmail := '';
        emailHandler.CreateEmail(frmwtRPQuoteTrade.qrpDetails, sTemp, 'Q'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, nil);
      end;
  finally
    frmwtRPQuoteTrade.free;
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSQuote.FaxTradeReport;
var
  faxfound: integer;
  icount, irow: integer;
begin
  ClearFaxArray(Self);

  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
  GetSelection;

  BuildFaxDetails;

  frmWTFaxList := TfrmWTFaxList.Create(Self);
  try
    for icount := 1 to 100 do
      begin
        if FaxArray[icount, 1] = '' then Break;
        frmWTFaxList.FaxListGrid.ColWidths[0] := 0;
        frmWTFaxList.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
        frmWTFaxList.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
      end;

    frmWTFaxList.FaxListGrid.RowCount := icount;
    frmWTFaxList.Caption := 'Quote Print - Fax List';
    frmWTFaxList.FaxListgrid.Cells[1, 0] := 'Customer';
    frmWTFaxList.ShowModal;

    {If OK to do the faxing then send all the faxes}
    if frmWTFaxList.ModalResult = idok then
      begin
        for irow := 1 to frmWTFaxList.FaxlistGrid.Rowcount -1 do
          begin
            if Trim(frmWTFaxList.FaxListGrid.cells[2, irow]) = '' then continue;

            frmwtRPQuoteTrade := TfrmwtRPQuoteTrade.Create(Self);
            try
              frmwtRPQuoteTrade.bPreview := true;
              frmwtRPQuoteTrade.bPrintDetail := chkbxShowDetail.checked;

              frmwtRPQuoteTrade.Quote := strtoint(memSelection.text);
              frmwtRPQuoteTrade.bPrintLogo := true;

              if (frmwtRPQuoteTrade.GetDetails = 0) then
                begin
                  MessageDlg('There are no quotes to fax', mtError, [mbAbort], 0);
                  exit;
                end;

              FaxFound := frmWTSendFax.OutToFax(frmWTFaxList.FaxListGrid.cells[2,irow],
                    'Q'+ FaxArray[irow,1] + ' to '+ FaxArray[irow,4], '');
              if FaxFound = -2 then
                MessageDlg('The fax driver is not installed', mtError, [mbok], 0)
              else
                begin
                  frmwtRPQuoteTrade.qrpDetails.ShowProgress := false;
                  frmwtRPQuoteTrade.qrpDetails.PrinterSettings.PrinterIndex := FaxFound;
                  frmwtRPQuoteTrade.qrpDetails.Print;
                  frmWTSendFax.WaitForFaxFinish(Self) ;
                end;
            finally
              frmwtRPQuoteTrade.free;
            end;
          end;
      end;
  finally
    frmWTFaxList.free;
  end;
end;

procedure TfrmWTRSQuote.RunTradeReport(const bPreview: boolean);
begin
  frmwtRPQuoteTrade := TfrmwtRPQuoteTrade.create(self);
  try
    frmwtRPQuoteTrade.Quote := strtoint(memSelection.text);
    frmwtRPQuoteTrade.bPrintLogo := chkbxPrintLogo.checked;
    frmwtRPQuoteTrade.bPrintDetail := chkbxShowDetail.checked;

    if (frmwtRPQuoteTrade.GetDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        frmwtRPQuoteTrade.bEndUser := false ;
        if bPreview then
          begin
              frmwtRPQuoteTrade.bPreview := true;
              frmwtRPQuoteTrade.qrpDetails.Preview;
          end
        else
          begin
              frmwtRPQuoteTrade.bPreview := false;
              frmwtRPQuoteTrade.qrpDetails.PrinterSetup;
              if frmwtRPQuoteTrade.qrpDetails.tag = 0 then
                frmwtRPQuoteTrade.qrpDetails.Print;
              close;
          end;
      end;
  finally
    frmwtRPQuoteTrade.free;
  end;
end;

procedure TfrmWTRSQuote.RunTemplateReport(const bPreview: boolean);
var
  PrinterSettings: TPrinterSettings;
  icount: integer;
begin
  frmwtRPTemplate := TfrmwtRPTemplate.create(self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      Printer.PrinterIndex := -1;
      for icount := 0 to pred(Printer.Printers.count) do
        begin
//          if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
          if DefaultPrinter = Printer.printers[icount] then
            Printer.PrinterIndex := icount;
        end;

      if DefaultPrinter <> '' then
        begin
          SetPrinterBin(DefaultBin);
        end;
  
    frmwtRPTemplate.Quote := strtoint(memSelection.text);

    if (frmwtRPTemplate.GetQuoteDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        frmwtRPTemplate.bEndUser := false ;
        Printed := false;
        if bPreview then
          begin
              frmwtRPTemplate.bPreview := true;
              frmwtRPTemplate.qrpDetails.Preview;
          end
        else
          begin
              frmwtRPTemplate.bPreview := false;
(*            frmwtRPTemplate.qrpDetails.PrinterSetup;
              if frmwtRPTemplate.qrpDetails.tag = 0 then
                frmwtRPTemplate.qrpDetails.Print;
*)
              if SetUpPrinter(PrinterSettings) then
                begin
                  frmwtRPTemplate.qrpDetails.Print;
                  bPrinted := true;
                end;
              close;
          end;
      end;
    finally
      DefaultPrinter := printer.Printers[printer.printerindex];
      DefaultBin := GetBinSelection;
      PrinterSettings.Free;
    end;
  finally
    frmwtRPTemplate.free;
  end;
end;

procedure TfrmWTRSQuote.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.Enabled;
  btnEmail.Enabled := btnPrint.enabled;
end;

procedure TfrmWTRSQuote.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TfrmWTRSQuote.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TfrmWTRSQuote.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dtmdlWorktops.DelIntSelCode(iIntSelCode, True);

  BuildSelection;

  if SelectLst.Items.Count > 100 then
    begin
      MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
      memSelection.Clear;
      memSelection.SetFocus;
      exit;
    end;

   for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant quote number}
        if SelectLst.Items[icount] = '' then continue;

       	with dtmdlWorktops.qryAddIntSel do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := StrToFloatDef(SelectLst.Items[icount], 0, FormatSettings);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TfrmWTRSQuote.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	selectLst.Clear;

	ilength := length(memSelection.text);

 	stext := memSelection.text;
  if copy(stext,ilength,1) <> ',' then
  	stext := stext + ',';

  stext := trim(stext);

  ifinish := 0;
  while pos(',',stext) > 0 do
  	begin
  		istart := ifinish + 1;
  		ifinish := pos(',',stext);
        ilength := ifinish - istart;

        {Chop out the string which is to be evaluated}
        sEvaluate := copy(stext,istart,ilength);
        sEvaluate := trim(sEvaluate);

        {Check to see if the string has a range selection}
        irange := pos('-',sEvaluate);
        inewLength := length(sEvaluate);

        if irange > 0 then
        	begin
           	{Build the list of possible values in between the range}
              sFirst := copy(sEvaluate,1,irange-1);
              sLast := copy(sEvaluate,irange+1,(iNewLength-irange));

              BuildRange(sFirst,sLast);
        		stext[ifinish] := ':';
              continue;
           end;

        {Check that the item does not already exist}
        if SelectLst.Items.IndexOf(sEvaluate) < 0 then
        	SelectLst.Items.Add(sEvaluate);

        stext[ifinish] := ':';
     end;
end;

procedure TfrmWTRSQuote.BuildRange(sFirst, sLast: string);
var
  sDocumentNo: string;
begin
	if sFirst > sLast then exit;

  sDocumentNo := sFirst;

  {Continue adding invoice lines until the last in the range is reached}
	repeat
      if SelectLst.Items.IndexOf(sDocumentNo) < 0 then
        	SelectLst.Items.Add(sDocumentNo);
     sDocumentNo := incrementno(sDocumentNo);
  until sDocumentNo > sLast;

end;

procedure TfrmWTRSQuote.BuildFaxDetails;
var
  irow: Integer;
begin
  with qryGetQuotes do
  begin
    Close;
    parambyname('Int_Sel_Code').asinteger := iIntselcode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Quote').AsString;
      FaxArray[irow, 2] := FieldByName('Customer').AsString;
      FaxArray[irow, 3] := FieldByName('Contact_Name').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Customer_Name').AsString);
      if (FieldByName('Is_Retail_Customer').AsString = 'Y') OR (FieldByName('Customer_is_Speculative').AsString = 'Y') then
        FaxArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        FaxArray[irow, 5] := FieldByName('Customer_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TfrmWTRSQuote.BuildEmailDetails;
var
  irow: Integer;
begin
  with qryGetQuotes do
  begin
    Close;
    parambyname('Int_Sel_Code').asinteger := iIntselcode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Quote').AsString;
      EmailArray[irow, 2] := '';
      EmailArray[irow, 3] := FieldByName('Customer').AsString;
      EmailArray[irow, 4] := '';
      EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString);
      if (FieldByName('Is_Retail_Customer').AsString = 'Y') OR (FieldByName('Customer_is_Speculative').AsString = 'Y') then
        EmailArray[irow, 6] := FieldByName('Email_Address').AsString
      else
      if (FieldByName('Contact_Email').AsString <> '') then
        EmailArray[irow, 6] := FieldByName('Contact_Email').AsString
      else
        EmailArray[irow, 6] := FieldByName('Customer_Email').AsString;
      EmailArray[irow, 7] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 8] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 9] := FieldByName('Contact_Name').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TfrmWTRSQuote.SetPrintType(const Value: string);
begin
  FPrintType := Value;
  if FPrintType = 'T' then
    begin
      caption := 'Print Template Check List';
      chkbxPrintLogo.Visible := false;
      chkbxShowOffer.Visible := false;
      chkbxShowDiscount.Visible := false;
      chkbxShowDetail.Visible := false;
      chkbxOnlyShowGrandTotal.Visible := false;
      chkbxExcludeTemplate.Visible := false;
      chkbxIncludeConfirm.Visible := false;
      chkbxPrintTemplate.Visible := false;
      chkbxPrintAvailability.Visible := false;
      chkbxPrintTerms.Visible := false;
      chkbxEndUserMarkup.Visible := false;
      chkbxHideAllPrices.Visible := false;
      btnEmail.Visible := false;
    end
  else
    caption := 'Print Quotation';
end;

function TfrmWTRSQuote.BuildQueryString: string;
var
  sTemp: string;
begin
  if bRetail OR bSpeculative then
    sTemp := SQLRetailCore
  else
    sTemp := SQLCore;

  sTemp := sTemp + 'Quote.Quote = ' + memSelection.text;
  Result := sTemp
end;

procedure TfrmWTRSQuote.btnPreviewClick(Sender: TObject);
begin
  if PrintType = 'T' then
    RunTemplateReport(true)
  else
  if dtmdlWorktops.UseTradeDetails and not self.bRetail then
    RunTradeReport(true)
  else
    begin
      case rdgrpType.ItemIndex of
        0:  RunReport(true);
        1:  RunSummaryReport(true);
      end;
    end;
end;

procedure TfrmWTRSQuote.btnEmailClick(Sender: TObject);
begin
  sTemplateConditionsFile := dtmdlWorktops.GetTemplateConditionsFile;
  sAvailabilityFile := dtmdlWorktops.GetAvailabilityFile;
  sTermsAndConditionsFile := dtmdlWorktops.GetTermsAndConditionsFile;

  if PrintType = 'T' then
    RunTemplateReport(false)
  else
  if dtmdlWorktops.UseTradeDetails and not self.bRetail then
    EmailTradeReport
  else
    begin
      try
        ClearEmailArray(Self);
        case rdgrpType.ItemIndex of
          0:  EmailReport;
          1:  EmailSummaryReport;
        end;
      finally
      end;
    end;
end;

procedure TfrmWTRSQuote.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Quote', 'Print Logo', 'Y')
      else
        WriteString('Quote', 'Print Logo', 'N');

      if chkbxShowOffer.checked then
        WriteString('Quote', 'Show Offer', 'Y')
      else
        WriteString('Quote', 'Show Offer', 'N');

      if chkbxShowDetail.checked then
        WriteString('Quote', 'Show Detail', 'Y')
      else
        WriteString('Quote', 'Show Detail', 'N');

      if chkbxShowDiscount.checked then
        WriteString('Quote', 'Show Discount', 'Y')
      else
        WriteString('Quote', 'Show Discount', 'N');

      if chkbxOnlyShowGrandTotal.checked then
        WriteString('Quote', 'Only Grand Total', 'Y')
      else
        WriteString('Quote', 'Only Grand Total', 'N');

      if chkbxHideAllPrices.checked then
        WriteString('Quote', 'Hide All Prices', 'Y')
      else
        WriteString('Quote', 'Hide All Prices', 'N');

      if chkbxExcludeTemplate.checked then
        WriteString('Quote', 'Exclude Template and Fitting', 'Y')
      else
        WriteString('Quote', 'Exclude Template and Fitting', 'N');

      {Save Selection of what to print}
      if chkbxIncludeConfirm.checked then
        WriteString('Quote', 'Include Order Confirmation', 'Y')
      else
        WriteString('Quote', 'Include Order Confirmation', 'N');

      if chkbxPrintTemplate.checked then
        WriteString('Quote', 'Print Template Conditions', 'Y')
      else
        WriteString('Quote', 'Print Template Conditions', 'N');

      if chkbxPrintAvailability.checked then
        WriteString('Quote', 'Print Availability Document', 'Y')
      else
        WriteString('Quote', 'Print Availability Document', 'N');

      if chkbxPrintTerms.checked then
        WriteString('Quote', 'Print Terms and Conditions', 'Y')
      else
        WriteString('Quote', 'Print Terms and Conditions', 'N');

      if chkbxEndUserMarkup.checked then
        WriteString('Quote', 'Apply End User Markup', 'Y')
      else
        WriteString('Quote', 'Apply End User Markup', 'N');
      WriteString('Quote', 'Default Printer', DefaultPrinter);
    end;
  finally
    IniFile.Free;
  end;

  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

procedure TfrmWTRSQuote.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
  with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Quote', 'Print Logo', 'N') = 'Y');
      chkbxShowOffer.Checked := (ReadString('Quote', 'Show Offer', 'N') = 'Y');
      chkbxShowDetail.Checked := (ReadString('Quote', 'Show Detail', 'N') = 'Y');
      chkbxShowDiscount.Checked := (ReadString('Quote', 'Show Discount', 'N') = 'Y');
      chkbxExcludeTemplate.Checked := (ReadString('Quote', 'Exclude Template and Fitting', 'N') = 'Y');
      chkbxOnlyShowGrandTotal.Checked := (ReadString('Quote', 'Only Grand Total', 'N') = 'Y');
      chkbxHideAllPrices.Checked := (ReadString('Quote', 'Hide All Prices', 'N') = 'Y');
      chkbxIncludeConfirm.Checked := (ReadString('Quote', 'Include Order Confirmation', 'N') = 'Y');
      chkbxPrintTemplate.checked := (ReadString('Quote', 'Print Template Conditions', 'N') = 'Y');
      chkbxPrintAvailability.checked := (ReadString('Quote', 'Print Availability Document', 'N') = 'Y');
      chkbxPrintTerms.checked := (ReadString('Quote', 'Print Terms and Conditions', 'N') = 'Y');
      chkbxEndUserMarkup.checked := (ReadString('Quote', 'Apply End User Markup', 'N') = 'Y');
      DefaultPrinter := ReadString('Quote', 'Default Printer', '');
    end;
  finally
    IniFile.Free;
  end;
  iIntselcode := dtmdlWorktops.GetNextIntSelCode(Self);
  FEmailAttachment := TStringList.create;
end;

procedure TfrmWTRSQuote.chkbxShowDetailClick(Sender: TObject);
begin
  if (Sender as TCheckbox).checked then
    begin
      chkbxShowDiscount.Checked := false;
      chkbxShowDiscount.enabled := false;

      chkbxExcludeTemplate.Checked := false;
      chkbxExcludeTemplate.enabled := false;

      chkbxOnlyShowGrandTotal.Checked := false;
      chkbxOnlyShowGrandTotal.enabled := false;

      chkbxHideAllPrices.Checked := false;
      chkbxHideAllPrices.enabled := false;

    end
  else
    begin
      chkbxShowDiscount.enabled := true;
      chkbxExcludeTemplate.enabled := true;
      chkbxOnlyShowGrandTotal.enabled := true;
      chkbxHideAllPrices.enabled := true;
    end;
end;

procedure TfrmWTRSQuote.memSelectionKeyPress(Sender: TObject;
  var Key: Char);
begin
	case Ord(key) of
  	$30..$39:;
  	Ord(','):;
  	Ord('-'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;
end;

Function TfrmWTRSQuote.IncrementNo(StartStr: String): String ;
Var StrLength, Count, Id: Integer ;
    Alphas: String[27] ;
    Numbers: String[11] ;
    CurrChar: String[1] ;
begin
Alphas := 'ABCEDFGHIJKLMNOPQRSTUVWXYZA' ;
Numbers := '01234567890' ;
{Increment a string value by 1}
StrLength := Length(StartStr) ;
For Count := StrLength downto 1 do
    begin
    CurrChar := Copy(StartStr,Count,1) ;
    Id := Pos(CurrChar,Numbers) ;
    if Id > 0 then
       begin
       StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Numbers, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
       IncrementNo := StartStr ;
       if Id < 10 then exit ;
       end
    else
        begin
        Id := Pos(CurrChar,Alphas) ;
        if Id > 0 then
               begin
               StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Alphas, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
        IncrementNo := StartStr ;
        if Id < 27 then exit ;
               end ;
        end ;
       end ;
end ;

(*
procedure TfrmWTRSQuote.PrintToAttachment(frmWTRPQuote: TfrmWTRPQuote; tempCode: string);
var
  i: integer;
  sLocation, sFileName: string;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
begin
//  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

  sFileName := 'Q'+tempCode;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(RTFFilter);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(PDFFilter);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
 //       ExportToRTF(frmWTRPQuote.qrpDetails, sLocation + sFilename + '.bmp');
      frmWTRPQuote.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;

procedure TfrmWTRSQuote.PrintSummaryToAttachment(frmWTRPQuote: TfrmWTRPQuoteSummary; tempCode: string);
var
  i: integer;
  sLocation, sFileName: string;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
begin
//  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

  sFileName := 'Q'+tempCode;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(RTFFilter);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(PDFFilter);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
        frmWTRPQuote.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPQuote.qrpDetails.Prepare;
 //       ExportToRTF(frmWTRPQuote.qrpDetails, sLocation + sFilename + '.bmp');
      frmWTRPQuote.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPQuote.qrpDetails.QRPrinter.Free;
        frmWTRPQuote.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

procedure TfrmWTRSQuote.chkbxOnlyShowGrandTotalClick(Sender: TObject);
begin
  if (Sender as TCheckbox).checked then
    begin
      chkbxExcludeTemplate.Checked := false;
      chkbxExcludeTemplate.enabled := false;

      chkbxHideAllPrices.Checked := false;
      chkbxHideAllPrices.enabled := false;
    end
  else
    begin
      chkbxExcludeTemplate.enabled := true;
      chkbxHideAllPrices.enabled := true;
    end;
end;

procedure TfrmWTRSQuote.chkbxHideAllPricesClick(Sender: TObject);
begin
  if (Sender as TCheckbox).checked then
    begin
      chkbxShowDetail.Checked := false;
      chkbxShowDetail.enabled := false;

      chkbxShowDiscount.Checked := false;
      chkbxShowDiscount.enabled := false;

      chkbxExcludeTemplate.Checked := false;
      chkbxExcludeTemplate.enabled := false;

      chkbxOnlyShowGrandTotal.Checked := false;
      chkbxOnlyShowGrandTotal.enabled := false;

    end
  else
    begin
      chkbxShowDetail.enabled := true;
      chkbxShowDiscount.enabled := true;
      chkbxExcludeTemplate.enabled := true;
      chkbxOnlyShowGrandTotal.enabled := true;
    end;

end;

procedure TfrmWTRSQuote.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmWTRSQuote.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmWTRSQuote.SetPrinterBin(BinCode: integer);
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        DevMode^.DMDEFAULTSOURCE := BinCode;
        GlobalUnlock (hDevMode);
  end;
end;

end.

