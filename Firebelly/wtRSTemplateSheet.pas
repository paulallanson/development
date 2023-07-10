unit wtRSTemplateSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, DB, DBTables, CheckLst, printers, IniFiles,
  wtRPTemplate, gtQrExport, wtRPQuote, AllCommon, ComObj, DBCtrls, ExtCtrls,
  ComCtrls;

type
  TfrmWTRSTemplateSheet = class(TForm)
    SelectLst: TListBox;
    qryGetSOQuotes: TQuery;
    qryGetSalesOrders: TQuery;
    qryGetSalesOrderEmails: TQuery;
    qryGetSOQuotesEmails: TQuery;
    qryGetSalesOrderEmailsOlder: TQuery;
    qryGetSalesOrderEmailsOld: TQuery;
    pnlFooter: TPanel;
    btnPrint: TButton;
    btnPreview: TButton;
    btnEmail: TButton;
    Button4: TButton;
    pnlDocuments: TPanel;
    Label2: TLabel;
    pnlSelection: TPanel;
    selectionGrp: TGroupBox;
    Label3: TLabel;
    memSelection: TMemo;
    chkbxPrint: TCheckBox;
    cmbDocuments: TComboBox;
    qryDocumentStructure: TQuery;
    chkbxPrintPlan: TCheckBox;
    chkbxMerge: TCheckBox;
    qryGetSalesOrdersOld: TQuery;
    qryGetSalesOrder: TQuery;
    pnlDocumentDetails: TPanel;
    pgDocumentDetails: TPageControl;
    TabSheet1: TTabSheet;
    lstbxDocuments: TListBox;
    chkbxAllDocuments: TCheckBox;
    chkbxAllSiteDocuments: TCheckBox;
    TabSheet2: TTabSheet;
    lstbxSiteDocuments: TListBox;
    procedure EnableRun(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstbxDocumentsDblClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure memSelectionKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure memSelectionChange(Sender: TObject);
    procedure chkbxAllDocumentsClick(Sender: TObject);
    procedure cmbDocumentsChange(Sender: TObject);
    procedure chkbxAllSiteDocumentsClick(Sender: TObject);
  private
    FDefaultPrinter: string;
    FDefaultBin: integer;
    FSalesOrderCount: integer;
    FDefaultDocumentFolder: string;
    procedure SetDefaultPrinter(const Value: string);
    procedure EmailReport;
    procedure EmailReportMerge;
    function BuildQueryString: string;
    function GetBinSelection: integer;
    procedure SetDefaultBin(const Value: integer);
    procedure SetPrinterBin(BinCode: integer);
    procedure SetSalesOrderCount(const Value: integer);
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure GetSelection;
    function IncrementNo(StartStr: String): String;
    procedure ClearEmailArray(Sender: TObject);
    procedure BuildEmailDetails;
    procedure PrintToAttachment(frmWTRRTemplate: TfrmwtRPTemplate; tempCode: string);
    procedure PrintQuoteToAttachment(frmwtRPQuote: TfrmwtRPQuote;
      tempCode, tmpOrder: string);
    procedure RunPlanPrint;
    procedure GetOrderDocuments(tmpOrder: integer; tmpFolder: string);
    procedure GetSiteDocuments(tempOrder: integer);
    function GetKitchenPlan(tmpOrder: integer): string;
    procedure SetDefaultDocumentFolder(const Value: string);
    procedure GetCustomerDetails(iOrder: integer);
    procedure PrintSiteDocuments;
  private
    CustomerName: string;
    SiteName: string;
    bCancelledPrint: boolean;
    iIntSelCode: Integer;
    FActivated: boolean;
    FEmailAttachment : TstringList;
    sAttachmentType: string;
    sSitePath: string;
    procedure ListOrderDocuments(strPath: string; ListBox: TListBox);
    procedure GetOrderQuotes(ListBox: TListBox);
    procedure RunQuoteReport(const bPreview: boolean);
    procedure RunTemplateReport(const bPreview: boolean);
    procedure PrintDocuments;
    procedure PrintDocument(const documentToPrint: string);
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultDocumentFolder: string read FDefaultDocumentFolder write SetDefaultDocumentFolder;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  public
    sOrderNumber: string;
    property SalesOrderCount: integer read FSalesOrderCount write SetSalesOrderCount;
  end;

var
  frmWTRSTemplateSheet: TfrmWTRSTemplateSheet;
  EmailArray: array[1..100, 1..11] of string;
  Obj: OleVariant;

implementation

uses wtDataModule, AllEmailHandler, wtEmailList, wtMain;

const
  SQLTemplate =
  'SELECT Fitter.Fitter_Name as Name, '+
  '       Fitter.Email_Address as Email, '+
  '       sales_Order.Sales_Order, '+
  '       Fitter.Email_Address as Contact_Email, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM Fitter, Sales_Order '+
  'WHERE (Fitter.inactive = ''N'') AND ';

{$R *.dfm}

procedure TfrmWTRSTemplateSheet.ListOrderDocuments(strPath: string; ListBox: TListBox);
var
  i: Integer;
  Icon: TIcon;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
begin
  listBox.Clear;
  // search for the first file
  i := FindFirst(strPath + '*.*', faArchive, SearchRec);

  while i = 0 do
    begin
      with ListBox do
      begin
        // On directories and volumes
        if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_DISPLAYNAME);
          ListBox.items.add(SearchRec.Name);
//          ListBox.items.add(FileInfo.szDisplayName);
        end;
      end;
      i := FindNext(SearchRec);
    end;
  if chkbxAllDocuments.Checked then
    lstbxdocuments.SelectAll;
  if chkbxAllSiteDocuments.Checked then
    lstbxSitedocuments.SelectAll;
end;

procedure TfrmWTRSTemplateSheet.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.enabled := btnPrint.enabled
end;

procedure TfrmWTRSTemplateSheet.GetOrderQuotes(ListBox: TListBox);
begin
  with qryGetSOQuotes do
    begin
      close;
      parambyname('Sales_Order').asinteger := strtoint(sOrderNumber);
      open;

      first;
      while eof <> true do
        begin
          ListBox.items.add('Quote details - ' + qryGetSOQuotes.fieldbyname('Quote').asstring);
          next
        end;
    end;
end;

procedure TfrmWTRSTemplateSheet.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSTemplateSheet.btnPrintClick(Sender: TObject);
begin
  RunTemplateReport(false);
  if bCancelledPrint then exit;
  
  if chkbxPrint.Checked then
    RunQuoteReport(false);

  if chkbxPrintPlan.Checked then
    RunPlanPrint;

  //Check if any additional documents need printing
  with lstbxDocuments do
    begin
      if selcount = 0 then
        exit
      else
        PrintDocuments;
    end;

  //Check if any site documents need printing
  with lstbxSiteDocuments do
    begin
      if selcount = 0 then
        exit
      else
        PrintSiteDocuments;
    end;
  printer.printerindex := -1;
end;

procedure TfrmWTRSTemplateSheet.btnPreviewClick(Sender: TObject);
begin
  RunTemplateReport(true);
end;

procedure TfrmWTRSTemplateSheet.RunQuoteReport(const bPreview: boolean);
var
  icount: integer;
begin
  with qryGetSOQuotes do
    begin
      close;
//      parambyname('Sales_Order').asinteger := strtoint(memSelection.text);
      parambyname('Int_sel').AsInteger := iIntselcode;
      open;

      first;
      while eof <> true do
        begin
          frmwtRPQuote := TfrmwtRPQuote.create(self);
          try
//            Changed 16 July 2014 to test why documents not printing!!!!!!

            Printer.PrinterIndex := -1;
            for icount := 0 to pred(Printer.Printers.count) do
              begin
                if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
                  Printer.PrinterIndex := icount;
              end;

            if DefaultPrinter <> '' then
              begin
                SetPrinterBin(DefaultBin);
              end;

            frmwtRPQuote.Quote := qryGetSOQuotes.fieldbyname('Quote').asinteger;
            frmwtRPQuote.bPrintLogo := false;
            frmwtRPQuote.bPrintDetail := false;
            frmwtRPQuote.bPrintAcceptance := false;
            frmwtRPQuote.bOnlyGrandTotal := false;
            frmwtRPQuote.bPrintTotals := false;

            if (frmwtRPQuote.GetDetails = 0) then
              exit
            else
              begin
              // decide which address to show on quote
                frmwtRPQuote.bEndUser := false ;
                if bPreview then
                  begin
                    frmwtRPQuote.bPreview := true;
                    frmwtRPQuote.qrpDetails.Preview;
                  end
                else
                  begin
                    frmwtRPQuote.bPreview := false;
                    frmwtRPQuote.qrpDetails.Print;
                  end;
              end;
          finally
            frmwtRPQuote.free;
          end;
          next;
        end;
    end;
end;

procedure TfrmWTRSTemplateSheet.RunPlanPrint;
begin
  GetSelection;

  with qryGetSalesOrders do
    begin
      close;
      Parambyname('Int_sel').AsInteger := iIntselcode;
      Open;

      while eof <> true do
        begin
          PrintDocument(fieldbyname('Location_Plan_Document').asstring);
          next;
        end;
    end;
end;

procedure TfrmWTRSTemplateSheet.RunTemplateReport(const bPreview: boolean);
begin
  GetSelection;

  frmwtRPTemplate := TfrmwtRPTemplate.create(self);
  try
    with frmwtRPTemplate.qryReport do
      begin
        close;
        sql.Text := qryGetSalesOrders.sql.Text;

        ParamBYName('Int_sel').AsInteger := iIntselcode;
        Open;
        if recordCount = 0 then
  	      begin
            MessageDlg('There are no valid template documents to print in this selection',mterror,[mbOK],0);
            exit;
    	    end;
      end;

    frmwtRPTemplate.bEndUser := false ;

//    frmwtRPTemplate.qrpDetails.Prepare;
//    frmwtRPTemplate.qrlblTotalPages.Caption := ' of ' + inttostr(frmwtRPTemplate.qrpDetails.QRPrinter.PageCount);

    if bPreview then
      begin
        frmwtRPTemplate.bPreview := true;
        frmwtRPTemplate.qrpDetails.Preview;
      end
    else
      begin
        bCancelledPrint := false;
        frmwtRPTemplate.bPreview := false;
        frmwtRPTemplate.qrpDetails.PrinterSetup;
        if frmwtRPTemplate.qrpDetails.tag = 0 then
          begin
            frmWtRPTemplate.qrpDetails.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
          end
        else
          bCancelledPrint := true;
        close;
      end;
  finally
    frmwtRPTemplate.Free;
  end;
(*
  frmwtRPTemplate := TfrmwtRPTemplate.create(self);
  try
    frmwtRPTemplate.SalesOrder := strtoint(memSelection.text);

    if (frmwtRPTemplate.GetDetails = 0) then
      MessageDlg('There are no template documents to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        frmwtRPTemplate.bEndUser := false ;
        if bPreview then
          begin
              frmwtRPTemplate.bPreview := true;
              frmwtRPTemplate.qrpDetails.Preview;
          end
        else
          begin
              frmwtRPTemplate.bPreview := false;
              frmwtRPTemplate.qrpDetails.PrinterSetup;
              if frmwtRPTemplate.qrpDetails.tag = 0 then
                begin
                  frmwtRPTemplate.qrpDetails.Print;
                  DefaultPrinter := printer.Printers[printer.printerindex];
                  DefaultBin := GetBinSelection;
                end;
              close;
          end;
      end;
  finally
    frmwtRPTemplate.free;
  end;
*)
end;

procedure TfrmWTRSTemplateSheet.PrintDocuments;
var
  sPath, sFilename: string;
  i: integer;
begin
  if cmbDocuments.text = '<All>' then
    sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\'
  else
    sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\' + cmbDocuments.text + '\';

  for i := 0 to pred(lstbxDocuments.items.count) do
    begin
      if lstbxDocuments.Selected[i] then
        begin
          sfilename := sPath + lstbxDocuments.items[i];
          printDocument(sfilename);
        end;
    end;
end;

procedure TfrmWTRSTemplateSheet.PrintSiteDocuments;
var
  sPath, sFilename: string;
  i: integer;
begin
  sPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + SiteName + '\';

  for i := 0 to pred(lstbxSiteDocuments.items.count) do
    begin
      if lstbxSiteDocuments.Selected[i] then
        begin
          sfilename := sPath + lstbxSiteDocuments.items[i];
          printDocument(sfilename);
        end;
    end;
end;

procedure TfrmWTRSTemplateSheet.PrintDocument(const documentToPrint : string) ;
var
  printCommand : string;
  printerInfo : string;
  Device, Driver, Port: array[0..255] of Char;
  hDeviceMode: THandle;
begin

(*  if Printer.PrinterIndex = cboPrinter.ItemIndex then
    begin
      printCommand := 'print';
      printerInfo := '';
    end
  else
    begin
      printCommand := 'printto';
      Printer.PrinterIndex := cboPrinter.ItemIndex;
      Printer.GetPrinter(Device, Driver, Port, hDeviceMode) ;
      printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
    end;
*)

  printCommand := 'print';
  printerInfo := '';

  ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_HIDE) ;
end;

procedure TfrmWTRSTemplateSheet.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      if chkbxPrint.checked then
        WriteString('Template Print', 'Print Quote Details', 'Y')
      else
        WriteString('Template Print', 'Print Quote Details', 'N');

      if chkbxPrintPlan.checked then
        WriteString('Template Print', 'Print Plan Document', 'Y')
      else
        WriteString('Template Print', 'Print Plan Document', 'N');

      if chkbxMerge.checked then
        WriteString('Template Print', 'Merge to PDF', 'Y')
      else
        WriteString('Template Print', 'Merge to PDF', 'N');

      if chkbxAlLDocuments.checked then
        WriteString('Template Print', 'Select All Documents', 'Y')
      else
        WriteString('Template Print', 'Select All Documents', 'N');

      if chkbxAllSiteDocuments.checked then
        WriteString('Template Print', 'Select All Site Documents', 'Y')
      else
        WriteString('Template Print', 'Select All Site Documents', 'N');

      WriteString('Template Print', 'Document Folder', cmbDocuments.Text);

      Free;
    end;
  Obj:= Unassigned;
  FEmailAttachment.Free;
  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

procedure TfrmWTRSTemplateSheet.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      chkbxPrint.Checked := (ReadString('Template Print', 'Print Quote Details', 'N') = 'Y');
      chkbxPrintPlan.Checked := (ReadString('Template Print', 'Print Plan Document', 'N') = 'Y');
      chkbxMerge.Checked := (ReadString('Template Print', 'Merge to PDF', 'N') = 'Y');
      chkbxAllDocuments.Checked := (ReadString('Template Print', 'Select All Documents', 'N') = 'Y');
      chkbxAllSiteDocuments.Checked := (ReadString('Template Print', 'Select All Site Documents', 'N') = 'Y');
      DefaultDocumentFolder := ReadString('Template Print', 'Document Folder', '<All>');
    end;
  finally
    IniFile.Free;
  end;

  //Create ole object
  try
    Obj:= CreateOleObject('PDFSplitMergeX.SplitMergeLib'); //Create object
    Obj.SetLicenseKey('DLDU1RCFNCW9KWX8DBEF7UNHL'); //Set your license key
  except
    on E: Exception do
    begin
      chkbxMerge.Checked := false;
      chkbxMerge.enabled := false;
//      ShowMessage('Please install AzSDK PDF Split Merge ActiveX DLL first.');
//      Exit;
    end;
  end;

  FEmailAttachment := TStringList.create;
  iIntSelCode := dtmdlWorktops.GetNextIntSelCode(Self) ;
end;

procedure TfrmWTRSTemplateSheet.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmWTRSTemplateSheet.lstbxDocumentsDblClick(Sender: TObject);
var
  irow: integer;
  sPath, sFileName: string;
  pFilename: Pchar;
begin
  iRow := lstbxDocuments.itemindex;
  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\';

  sFilename := lstbxDocuments.Items[iRow];
  pFileName := PChar(sPath+sFilename);
  ShellExecute(Handle, 'open', pFileName, nil, nil, SW_SHOWNORMAL) ;
end;

procedure TfrmWTRSTemplateSheet.btnEmailClick(Sender: TObject);
var
  i: integer;
begin
  try
    ClearEmailArray(Self);
    if chkbxMerge.Checked then
      EmailReportMerge
    else
      EmailReport;
  finally
  end;
end;

procedure TfrmWTRSTemplateSheet.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TfrmWTRSTemplateSheet.EmailReport;
var
  sKitchenPlan, sTemp, sSubject: string;
  sTo, sPath, sBodyText: string;
  i, icount, iRow: integer;
  sfilename: string;
  sAttachment: array[0..255] of Char;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sOrderNumber: string;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  frmWTEmailList := TfrmWTEmailList.Create(Self);
  try
    frmWTEmailList.CodeType := 'T';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
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

    frmWTEmailList.Caption := 'Sales Order Template List';
    frmWTEmailList.EmailListGrid.Cells[0, 0] := 'Sales Order';
    frmWTEmailList.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    frmWTEmailList.EmailListGrid.Cells[2, 0] := 'Fitter';

    frmWTEmailList.ShowModal;

    {If OK to do the emailing then send all the emails}
    if frmWTEmailList.ModalResult = idok then
    begin
      for irow := 1 to frmWTEmailList.EmailListGrid.Rowcount -1 do
      begin
        if Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) = '' then continue;

        sOrderNumber := EmailArray[irow,1];
        sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\';
        FEmailAttachment.clear;

        frmwtRPTemplate := TfrmwtRPTemplate.create(self);
        try
          frmwtRPTemplate.qrpDetails.ShowProgress := false;
          frmwtRPTemplate.bPreview := false;
          frmwtRPTemplate.SalesOrder := strtoint(EmailArray[irow,1]);

          frmwtRPTemplate.GetDetails;

//          frmwtRPTemplate.qrpDetails.Prepare;
//          frmwtRPTemplate.qrlblTotalPages.Caption := ' of ' + inttostr(frmwtRPTemplate.qrpDetails.QRPrinter.PageCount);

          sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);
          sSubject := Trim(frmWTEmailList.EmailListGrid.Cells[2, irow]) + ' ' + 'Template Documents: ' + EmailArray[irow,1];
          sBodyText := 'Please find attached your template documents.' + #13#10#13#10;

          sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
          Printtoattachment(frmwtRPTemplate, EmailArray[irow,1]);

          if self.chkbxPrint.checked then
            begin
              with qryGetSOQuotesEmails do
                begin
                  close;
                  parambyname('Sales_Order').asinteger := strtoint(EmailArray[irow,1]);
                  open;

                  first;
                  while eof <> true do
                    begin
                      frmwtRPQuote := TfrmwtRPQuote.create(self);
                      try
                        Printer.PrinterIndex := -1;

                        frmwtRPQuote.Quote := qryGetSOQuotesEmails.fieldbyname('Quote').asinteger;
                        frmwtRPQuote.bPrintLogo := false;
                        frmwtRPQuote.bPrintDetail := false;
                        frmwtRPQuote.bPrintAcceptance := false;
                        frmwtRPQuote.bOnlyGrandTotal := false;
                        frmwtRPQuote.bPrintTotals := false;

                        if (frmwtRPQuote.GetDetails = 0) then
                          continue
                        else
                          begin
                            // decide which address to show on quote
                            frmwtRPQuote.bEndUser := false ;
                            frmWTRPQuote.bPreview := false;
                            PrintQuotetoAttachment(frmWTRPQuote, inttostr(qryGetSOQuotesEmails.fieldbyname('Quote').asinteger)+ 'L' + inttostr(iRow), EmailArray[irow,1]);
                          end;
                      finally
                        frmWTRPQuote.Free;
                      end;
                      next;
                    end;
                end;
            end;

          {Create the kitchen Plan as an attachment}
          if self.chkbxPrintPlan.checked then
            begin
              sKitchenPlan := GetKitchenPlan(strtoint(EmailArray[irow,1]));
              if sKitchenPlan <> '' then
                FEmailAttachment.add(sKitchenPlan);
            end;

          {Add any other selected documents as an attachment}
          if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(EmailArray[irow,1]), cmbDocuments.text);
            end;

          GetSiteDocuments(strtoint(EmailArray[irow,1]));
(*
          {If only one template sheet then add any documents listed}
          if SalesOrderCount = 1 then
            begin
              sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + EmailArray[irow,1] + '\';
              for i := 0 to pred(lstbxDocuments.items.count) do
                begin
                  if lstbxDocuments.Selected[i] then
                    begin
                      sfilename := sPath + lstbxDocuments.items[i];
                      FEmailAttachment.Add(sfilename);
                    end;
                end;
            end
          else
            begin
              if chkbxAllDocuments.checked then
                begin
                  // search for the first file
                  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + EmailArray[irow,1] + '\';
                  i := FindFirst(sPath + '*.*', faArchive, SearchRec);

                  while i = 0 do
                    begin
                      // On directories and volumes
                      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
                        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
                        begin
                          //Get The DisplayName
                          SHGetFileInfo(PChar(sPath + SearchRec.Name), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);
                          FEmailAttachment.Add(sPath+SearchRec.Name);
                        end;
                      i := FindNext(SearchRec);
                    end;
                end;
            end;
*)
          EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);
        finally
          frmwtRPTemplate.free;

          {Clear attachments}
          for i := pred(FEmailAttachment.count) downto 0 do
            begin
              if (pos(sPath,FEmailAttachment.strings[i]) > 0) or (pos(sSitePath,FEmailAttachment.strings[i]) > 0) then
                continue;
              StrPCopy(sAttachment, FEmailAttachment.strings[i]);
              deletefile(sAttachment);
            end;
        end;
      end;
    end;
  finally
    frmWTEmailList.Free;
  end;
end;

procedure TfrmWTRSTemplateSheet.EmailReportMerge;
var
  sEmail, sTemp, sSubject: string;
  sTo, sPath, sBodyText, sKitchenPlan: string;
  iOrderCount, i, icount, iRow: integer;
  sFilename: array[0..255] of Char;
  sAttachment: array[0..255] of Char;
  sMergedPDFList: TStringLIst;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sOrderNumber, sMergedPDF, sLocation: string;
  iSuccess: integer;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  frmWTEmailList := TfrmWTEmailList.Create(Self);
  try
    frmWTEmailList.CodeType := 'T';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
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

    frmWTEmailList.Caption := 'Sales Order Template List';
    frmWTEmailList.EmailListGrid.Cells[0, 0] := 'Sales Order';
    frmWTEmailList.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    frmWTEmailList.EmailListGrid.Cells[2, 0] := 'Fitter';

    frmWTEmailList.ShowModal;

    sEmail := '';
    iOrderCount := 0;
    sLocation := GetWinTempDir;
    sMergedPDFList := TStringList.create;

    {If OK to do the emailing then send all the emails}
    if frmWTEmailList.ModalResult = idok then
    begin
      for irow := 1 to frmWTEmailList.EmailListGrid.Rowcount -1 do
      begin
        if Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) = '' then continue;

        sOrderNumber := EmailArray[irow,1];
        sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\';

        if (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> sEmail) and (Trim(frmWTEmailList.EmailListGrid.cells[3, irow]) <> '') then
          begin
            if sEmail <> '' then
              begin
                FEmailAttachment.clear;
                if (sMergedPDFList.Count > 0) then
                  begin
                    for icount := 0 to pred(sMergedPDFList.Count) do
                      FEmailAttachment.Add(sMergedPDFList[icount]);
                  end;

                EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

                {Clear attachments}
                for i := pred(FEmailAttachment.count) downto 0 do
                  begin
                    if pos(sPath,FEmailAttachment.strings[i]) > 0 then
                      continue;
                    StrPCopy(sAttachment, FEmailAttachment.strings[i]);
                    deletefile(sAttachment);
                  end;
                sMergedPDFList.clear;
              end;

            FEmailAttachment.clear;
            iOrderCount := 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmwtRPTemplate := TfrmwtRPTemplate.create(self);
            try
              frmwtRPTemplate.qrpDetails.ShowProgress := false;
              frmwtRPTemplate.bPreview := false;
              frmwtRPTemplate.SalesOrder := strtoint(EmailArray[irow,1]);

              frmwtRPTemplate.GetDetails;

              sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
              Printtoattachment(frmwtRPTemplate, EmailArray[irow,1]);

              if iOrderCount = 1 then
                begin
                  sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);
                  sSubject := Trim(frmWTEmailList.EmailListGrid.Cells[2, irow]) + ' ' + 'Template Documents: ' + EmailArray[irow,1] ;
                  sBodyText := 'Please find attached your template documents.' + #13#10#13#10;
                end
              else
                sSubject := sSubject + ', ' + EmailArray[irow,1];

            finally
              frmwtRPTemplate.free;
            end;

            {Create the Quote as an attachment}
            if self.chkbxPrint.checked then
            begin
              with qryGetSOQuotesEmails do
                begin
                  close;
                  parambyname('Sales_Order').asinteger := strtoint(EmailArray[irow,1]);
                  open;

                  first;
                  while eof <> true do
                    begin
                      frmwtRPQuote := TfrmwtRPQuote.create(self);
                      try
                        Printer.PrinterIndex := -1;

                        frmwtRPQuote.Quote := qryGetSOQuotesEmails.fieldbyname('Quote').asinteger;
                        frmwtRPQuote.bPrintLogo := false;
                        frmwtRPQuote.bPrintDetail := false;
                        frmwtRPQuote.bPrintAcceptance := false;
                        frmwtRPQuote.bOnlyGrandTotal := false;
                        frmwtRPQuote.bPrintTotals := false;

                        if (frmwtRPQuote.GetDetails = 0) then
                          continue
                        else
                          begin
                            // decide which address to show on quote
                            frmwtRPQuote.bEndUser := false ;
                            frmWTRPQuote.bPreview := false;
                            PrintQuotetoAttachment(frmWTRPQuote, inttostr(qryGetSOQuotesEmails.fieldbyname('Quote').asinteger)+ 'L' + inttostr(iRow), EmailArray[irow,1]);
                          end;
                      finally
                        frmWTRPQuote.Free;
                      end;
                      next;
                    end;
                end;
            end;

            {Create the kitchen plan as an attachment}
            if self.chkbxPrintPlan.checked then
            begin
              sKitchenPlan := GetKitchenPlan(strtoint(EmailArray[irow,1]));
              if sKitchenPlan <> '' then
                FEmailAttachment.add(sKitchenPlan);
            end;

            {Add any other selected documents as an attachment}
            if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(EmailArray[irow,1]), cmbDocuments.text);
            end;

            GetSiteDocuments(strtoint(EmailArray[irow,1]));

            {Merge all the PDF Documents into one}
            sMergedPDF := sLocation + 'TS' + sOrderNumber + '-' + inttostr(iOrderCount) + '_Merged.PDF';
            for iCount := 0 to pred(FEmailAttachment.count) do
              begin
                if iCount = 0 then
                  sTemp := FEmailAttachment.strings[0]
                else
                  sTemp := sTemp + '|' + FEmailAttachment.strings[iCount];
              end;

//            iSuccess:= obj.Merge(FEmailAttachment.strings[0] + '|'+ FEmailAttachment.strings[1] + '|'+ FEmailAttachment.strings[2], sMergedPDF);
            iSuccess:= obj.Merge(sTemp, sMergedPDF);

            if iSuccess = 1 then
              begin
                sMergedPDFList.Add(sMergedPDF);
                for i := pred(FEmailAttachment.count) downto 0 do
                  begin
                    if (pos(sPath,FEmailAttachment.strings[i]) > 0) or (pos(sSitePath,FEmailAttachment.strings[i]) > 0) then
                      continue;
                    StrPCopy(sFilename, FEmailAttachment.strings[i]);
                    deletefile(sFilename);
                  end;
                FEmailAttachment.clear;
              end;

(*            {If only one template sheet then add any documents listed}
            if SalesOrderCount = 1 then
            begin
              sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + EmailArray[irow,1] + '\';
              for i := 0 to pred(lstbxDocuments.items.count) do
                begin
                  if lstbxDocuments.Selected[i] then
                    begin
                      sfilename := sPath + lstbxDocuments.items[i];
                      FEmailAttachment.Add(sfilename);
                    end;
                end;
            end
            else
            begin
              if chkbxAllDocuments.checked then
                begin
                  // search for the first file
                  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + EmailArray[irow,1] + '\';
                  i := FindFirst(sPath + '*.*', faArchive, SearchRec);

                  while i = 0 do
                    begin
                      // On directories and volumes
                      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
                        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
                        begin
                          //Get The DisplayName
                          SHGetFileInfo(PChar(sPath + SearchRec.Name), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);
                          FEmailAttachment.Add(sPath+SearchRec.Name);
                        end;
                      i := FindNext(SearchRec);
                    end;
                end;
            end;
*)
          end
        else
          begin
            iOrderCount := iOrderCount + 1;

            sEmail := Trim(frmWTEmailList.EmailListGrid.cells[3, irow]);

            frmwtRPTemplate := TfrmwtRPTemplate.create(self);
            try
              frmwtRPTemplate.qrpDetails.ShowProgress := false;
              frmwtRPTemplate.bPreview := false;
              frmwtRPTemplate.SalesOrder := strtoint(EmailArray[irow,1]);

              frmwtRPTemplate.GetDetails;

              sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
              Printtoattachment(frmwtRPTemplate, EmailArray[irow,1]);

              sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);
//              sSubject := 'Template Documents: ' + EmailArray[irow,1];
              sSubject := sSubject + ', ' + EmailArray[irow,1] ;
              sBodyText := 'Please find attached your template documents.' + #13#10#13#10;
            finally
              frmwtRPTemplate.free;
            end;

            {Create the Quote as an attachment}
            if self.chkbxPrint.checked then
            begin
              with qryGetSOQuotesEmails do
                begin
                  close;
                  parambyname('Sales_Order').asinteger := strtoint(EmailArray[irow,1]);
                  open;

                  first;
                  while eof <> true do
                    begin
                      frmwtRPQuote := TfrmwtRPQuote.create(self);
                      try
                        Printer.PrinterIndex := -1;

                        frmwtRPQuote.Quote := qryGetSOQuotesEmails.fieldbyname('Quote').asinteger;
                        frmwtRPQuote.bPrintLogo := false;
                        frmwtRPQuote.bPrintDetail := false;
                        frmwtRPQuote.bPrintAcceptance := false;
                        frmwtRPQuote.bOnlyGrandTotal := false;
                        frmwtRPQuote.bPrintTotals := false;

                        if (frmwtRPQuote.GetDetails = 0) then
                          continue
                        else
                          begin
                            // decide which address to show on quote
                            frmwtRPQuote.bEndUser := false ;
                            frmWTRPQuote.bPreview := false;
                            PrintQuotetoAttachment(frmWTRPQuote, inttostr(qryGetSOQuotesEmails.fieldbyname('Quote').asinteger), EmailArray[irow,1]);
                          end;
                      finally
                        frmWTRPQuote.Free;
                      end;
                      next;
                    end;
                end;
            end;

            {Create the kitchen Plan as an attachment}
            if self.chkbxPrintPlan.checked then
            begin
              sKitchenPlan := GetKitchenPlan(strtoint(EmailArray[irow,1]));
              if sKitchenPlan <> '' then
                FEmailAttachment.add(sKitchenPlan);
            end;

            {Add any other selected documents as an attachment}
            if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(EmailArray[irow,1]), cmbDocuments.text);
            end;

            GetSiteDocuments(strtoint(EmailArray[irow,1]));

            {Merge all the PDF Documents into one}
            sMergedPDF := sLocation + 'TS' + sOrderNumber + '-' + inttostr(iOrderCount) + '_Merged.PDF';
            for iCount := 0 to pred(FEmailAttachment.count) do
              begin
                if iCount = 0 then
                  sTemp := FEmailAttachment.strings[0]
                else
                  sTemp := sTemp + '|' + FEmailAttachment.strings[iCount];
              end;

//            iSuccess:= obj.Merge(FEmailAttachment.strings[0] + '|'+ FEmailAttachment.strings[1] + '|'+ FEmailAttachment.strings[2], sMergedPDF);
            iSuccess:= obj.Merge(sTemp, sMergedPDF);

            if iSuccess = 1 then
              begin
                sMergedPDFList.Add(sMergedPDF);
                for i := pred(FEmailAttachment.count) downto 0 do
                  begin
                    if (pos(sPath,FEmailAttachment.strings[i]) > 0) or (pos(sSitePath,FEmailAttachment.strings[i]) > 0) then
                      continue;
                    StrPCopy(sFilename, FEmailAttachment.strings[i]);
                    deletefile(sFilename);
                  end;
                FEmailAttachment.clear;
              end;
          end;
        end;
      end;

//      if (FEmailAttachment.Count > 0) then
      if (sMergedPDFList.Count > 0) then
        begin
          for icount := 0 to pred(sMergedPDFList.Count) do
            FEmailAttachment.Add(sMergedPDFList[icount]);

          EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

          for i := pred(FEmailAttachment.count) downto 0 do
            begin
              if (pos(sPath,FEmailAttachment.strings[i]) > 0) or (pos(sSitePath,FEmailAttachment.strings[i]) > 0) then
                continue;
              StrPCopy(sFilename, FEmailAttachment.strings[i]);
              deletefile(sFilename);
            end;
          sMergedPDFList.clear;
        end;
  finally
    frmWTEmailList.Free;
    sMergedPDFList.Free;
  end;
  close;
end;

procedure TfrmWTRSTemplateSheet.BuildEmailDetails;
var
  irow: Integer;
begin
  with qryGetSalesOrderEmails do
  begin
    Close;
    ParamBYName('Int_sel').AsInteger := iIntselcode;
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Sales_Order').AsString;
      EmailArray[irow, 2] := FieldByName('Templater').AsString;
      EmailArray[irow, 3] := FieldByName('Customer').AsString;
      EmailArray[irow, 4] := '';
      EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString);
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 8] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 9] := Trim(FieldByName('Fitter_Name').AsString);
      inc(irow);
      Next;
    end;
  end;
end;

function TfrmWTRSTemplateSheet.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLTemplate;

  sTemp := sTemp + 'Sales_Order.Sales_Order = ' + memSelection.text;
  Result := sTemp
end;

function TfrmWTRSTemplateSheet.GetBinSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     bin: integer;
     DevMode : PDevMode;
begin
  Printer.GetPrinter (Device,Driver,Port,hDevMode);
  bin := -1;
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        bin := DevMode^.DMDEFAULTSOURCE;
        GlobalUnlock (hDevMode);
  end;
  result := bin;
end;

procedure TfrmWTRSTemplateSheet.SetPrinterBin(BinCode : integer );
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

procedure TfrmWTRSTemplateSheet.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmWTRSTemplateSheet.memSelectionKeyPress(Sender: TObject;
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

procedure TfrmWTRSTemplateSheet.SetSalesOrderCount(const Value: integer);
begin
  FSalesOrderCount := Value;

end;

procedure TfrmWTRSTemplateSheet.BuildSelection;
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

procedure TfrmWTRSTemplateSheet.GetSelection;
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
          ParamByName('Sel1').AsFloat := strtoFloat(SelectLst.Items[icount]);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TfrmWTRSTemplateSheet.BuildRange(sFirst: string; sLast: string);
var
  sOrderNo: string;
begin
	if sFirst > sLast then exit;

  sOrderNo := sFirst;

  {Continue adding invoice lines until the last in the range is reached}
	repeat
      if SelectLst.Items.IndexOf(sOrderNo) < 0 then
        	SelectLst.Items.Add(sOrderNo);
     sOrderNo := incrementno(sOrderNo);
  until sOrderNo > sLast;

end;

Function TfrmWTRSTemplateSheet.IncrementNo(StartStr: String): String ;
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

procedure TfrmWTRSTemplateSheet.FormActivate(Sender: TObject);
var
  sPath: string;
begin
  if not FActivated then
    begin
      with qryDocumentStructure do
        begin
          close;
          open;

          while eof <> true do
            begin
              cmbDocuments.Items.Add(fieldbyname('Folder_Name').asstring);
              next;
            end;
          cmbDocuments.Items.Add('<None>');
          cmbDocuments.ItemIndex := cmbDocuments.Items.IndexOf(DefaultDocumentFolder);
          cmbDocumentsChange(self);
        end;

      if SalesOrderCount = 1 then
        begin
//          sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\';
//          ListOrderDocuments(sPath,lstbxDocuments);
          GetCustomerDetails(strtoint(memSelection.Text));
          sPath := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + SiteName + '\';
          ListOrderDocuments(sPath,lstbxSiteDocuments);
        end
      else
        begin
          pnlDocumentDetails.Visible := false;
          self.Height := 300;
        end;
      FActivated := true;
    end;
  memSelection.SetFocus;
end;

procedure TfrmWTRSTemplateSheet.PrintToAttachment(frmWTRRTemplate: TfrmwtRPTemplate; tempCode: string);
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

  sFileName := 'TS'+tempCode;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRTemplate.qrpDetails.Prepare;
        frmWTRRTemplate.qrpDetails.ExportToFilter(RTFFilter);
      finally
        frmWTRRTemplate.qrpDetails.QRPrinter.Free;
        frmWTRRTemplate.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRTemplate.qrpDetails.Prepare;
        frmWTRRTemplate.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRTemplate.qrpDetails.QRPrinter.Free;
        frmWTRRTemplate.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRTemplate.qrpDetails.Prepare;
        frmWTRRTemplate.qrpDetails.ExportToFilter(PDFFilter);
      finally
        frmWTRRTemplate.qrpDetails.QRPrinter.Free;
        frmWTRRTemplate.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRTemplate.qrpDetails.Prepare;
        frmWTRRTemplate.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRTemplate.qrpDetails.QRPrinter.Free;
        frmWTRRTemplate.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRTemplate.qrpDetails.Prepare;
        frmWTRRTemplate.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRTemplate.qrpDetails.QRPrinter.Free;
        frmWTRRTemplate.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRTemplate.qrpDetails.Prepare;
 //       ExportToRTF(frmWTRRTemplate.qrpDetails, sLocation + sFilename + '.bmp');
      frmWTRRTemplate.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRTemplate.qrpDetails.QRPrinter.Free;
        frmWTRRTemplate.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;

procedure TfrmWTRSTemplateSheet.PrintQuoteToAttachment(frmwtRPQuote: TfrmwtRPQuote; tempCode, tmpOrder: string);
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

  sFileName := 'TS' + tmpOrder + '-Q'+tempCode;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmwtRPQuote.qrpDetails.Prepare;
        frmwtRPQuote.qrpDetails.ExportToFilter(RTFFilter);
      finally
        frmwtRPQuote.qrpDetails.QRPrinter.Free;
        frmwtRPQuote.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmwtRPQuote.qrpDetails.Prepare;
        frmwtRPQuote.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmwtRPQuote.qrpDetails.QRPrinter.Free;
        frmwtRPQuote.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmwtRPQuote.qrpDetails.Prepare;
        frmwtRPQuote.qrpDetails.ExportToFilter(PDFFilter);
      finally
        frmwtRPQuote.qrpDetails.QRPrinter.Free;
        frmwtRPQuote.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmwtRPQuote.qrpDetails.Prepare;
        frmwtRPQuote.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmwtRPQuote.qrpDetails.QRPrinter.Free;
        frmwtRPQuote.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmwtRPQuote.qrpDetails.Prepare;
        frmwtRPQuote.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmwtRPQuote.qrpDetails.QRPrinter.Free;
        frmwtRPQuote.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmwtRPQuote.qrpDetails.Prepare;
 //       ExportToRTF(frmwtRPQuote.qrpDetails, sLocation + sFilename + '.bmp');
      frmwtRPQuote.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmwtRPQuote.qrpDetails.QRPrinter.Free;
        frmwtRPQuote.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;

procedure TfrmWTRSTemplateSheet.memSelectionChange(Sender: TObject);
begin
  enableRun(self);
end;

procedure TfrmWTRSTemplateSheet.chkbxAllDocumentsClick(Sender: TObject);
var
  icount: integer;
begin
  if chkbxAllDocuments.checked then
    lstbxdocuments.SelectAll
  else
    lstbxDocuments.ClearSelection;
end;

function TfrmWTRSTemplateSheet.GetKitchenPlan(tmpOrder: integer): string;
begin
  with qryGetSalesOrder do
    begin
      close;
      parambyname('Sales_Order').asinteger := tmpOrder;
      open;
      result := fieldbyname('Location_Plan_Document').asstring
    end;
end;

procedure TfrmWTRSTemplateSheet.cmbDocumentsChange(Sender: TObject);
var
  sPath: string;
begin
  if SalesOrderCount = 1 then
    begin
      if cmbDocuments.itemindex = 0 then
        begin
          sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\';
          ListOrderDocuments(sPath,lstbxDocuments);
        end
      else
      if cmbDocuments.text <> '<None>' then
        begin
          sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\' + cmbDocuments.text + '\';
          ListOrderDocuments(sPath,lstbxDocuments);
        end
    end;
end;

procedure TfrmWTRSTemplateSheet.GetOrderDocuments(tmpOrder: integer; tmpFolder: string);
var
  iCount: integer;
  SearchRec: TSearchRec;
  sSource: string;
begin
  if tmpFolder = '<All>' then
    sSource :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(tmpOrder) + '\'
  else
    sSource :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(tmpOrder) + '\' + tmpFolder + '\';

  // search for the first file
  icount := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while iCount = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          if chkbxMerge.checked then
            begin
              if (pos('.pdf', SearchRec.Name) > 0) or (pos('.PDF', SearchRec.Name) > 0) then
                FEmailAttachment.add(sSource + SearchRec.Name)
            end
          else
              FEmailAttachment.add(sSource + SearchRec.Name);
        end;
      iCount := FindNext(SearchRec);
    end;
end;

procedure TfrmWTRSTemplateSheet.GetSiteDocuments(tempOrder: integer);
var
  iCount: integer;
  SearchRec: TSearchRec;
  sSource, sFileName: string;
begin
  GetCustomerDetails(tempOrder);
  
  sSitePath :=  dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + SiteName + '\';
  sSource :=  sSitePath;

  // search for the first file
  icount := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while iCount = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          if chkbxMerge.checked then
            begin
              if (pos('.pdf', SearchRec.Name) > 0) or (pos('.PDF', SearchRec.Name) > 0) then
                FEmailAttachment.add(sSource + SearchRec.Name)
            end
          else
              FEmailAttachment.add(sSource + SearchRec.Name);
        end;
      iCount := FindNext(SearchRec);
    end;
end;

procedure TfrmWTRSTemplateSheet.SetDefaultDocumentFolder(
  const Value: string);
begin
  FDefaultDocumentFolder := Value;
end;

procedure TfrmWTRSTemplateSheet.chkbxAllSiteDocumentsClick(
  Sender: TObject);
begin
  if chkbxAllSiteDocuments.checked then
    lstbxSitedocuments.SelectAll
  else
    lstbxSiteDocuments.ClearSelection;
end;

procedure TfrmWTRSTemplateSheet.GetCustomerDetails(iOrder: integer);
begin
  with qryGetSalesOrder do
    begin
      close;
      parambyname('Sales_Order').asinteger := iOrder;
      open;

      CustomerName := fieldbyname('Customer_Name').asstring;
      SiteName := fieldbyname('Branch_Name').asstring;
    end;
end;

end.
