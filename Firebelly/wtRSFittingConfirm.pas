unit wtRSFittingConfirm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, DB, CheckLst, printers, IniFiles,
  WTRPSOrder, QrExport, AllCommon, ComObj, DBCtrls, ExtCtrls, wtSalesOrderDM,
  DateUtils, wtNotesDM, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;
type
  TfrmWTRSFittingConfirm = class(TForm)
    SelectLst: TListBox;
    qryGetSOQuotes: TFDQuery;
    qryGetSalesOrders: TFDQuery;
    qryGetSalesOrderEmails: TFDQuery;
    qryGetSOQuotesEmails: TFDQuery;
    qryGetSalesOrder: TFDQuery;
    pnlFooter: TPanel;
    btnPrint: TButton;
    btnPreview: TButton;
    btnEmail: TButton;
    Button4: TButton;
    pnlDocumentDetails: TPanel;
    lstbxDocuments: TListBox;
    pnlDocuments: TPanel;
    Label2: TLabel;
    pnlSelection: TPanel;
    selectionGrp: TGroupBox;
    Label3: TLabel;
    memSelection: TMemo;
    cmbDocuments: TComboBox;
    qryDocumentStructure: TFDQuery;
    chkbxAllDocuments: TCheckBox;
    chkbxMerge: TCheckBox;
    chkbxAttachTerms: TCheckBox;
    chkbxAttachColour: TCheckBox;
    qryGetMaterialDescription: TFDQuery;
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
  private
    FDefaultPrinter: string;
    FDefaultBin: integer;
    FSalesOrderCount: integer;
    FDefaultDocumentFolder: string;
    procedure SetDefaultPrinter(const Value: string);
    procedure EmailReport;
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
    // GDK ToDo: remover after testings
    // procedure PrintToAttachment(frmWTRRSOrder: TfrmWTRPSOrder; tempCode: string);
    procedure GetOrderDocuments(tmpOrder: integer; tmpFolder: string);
    procedure SetDefaultDocumentFolder(const Value: string);
    function GetSOColourFile(iOrder: integer): string;
    function GetSOMaterialDescription(iOrder: integer): string;
    function GetSOWarrantyDescription(iOrder: integer): string;
    function GetSOMaintenanceDescription(iOrder: integer): string;
    function GetNarrative(const iNarrative: integer): string;
  private
    bCancelledPrint: boolean;
    iIntSelCode: Integer;
    FActivated: boolean;
    FEmailAttachment : TstringList;
    sAttachmentType: string;
    sAvailabilityFile: string;
    sTermsAndConditionsFile: string;
    procedure ListOrderDocuments(strPath: string; ListBox: TListBox);
    procedure GetOrderQuotes(ListBox: TListBox);
    procedure RunReport(const bPreview: boolean);
    procedure PrintDocuments;
    procedure PrintDocument(const documentToPrint: string);
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultDocumentFolder: string read FDefaultDocumentFolder write SetDefaultDocumentFolder;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  public
    dtmdlFittingSales: TdtmdlSalesOrder;
    sOrderNumber: string;
    property SalesOrderCount: integer read FSalesOrderCount write SetSalesOrderCount;
  end;

var
  frmWTRSFittingConfirm: TfrmWTRSFittingConfirm;
  EmailArray: array[1..100, 1..11] of string;
  Obj: OleVariant;

implementation

uses
  wtDataModule, AllEmailHandler, wtEmailList, wtMain, Printer.Tools;

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

procedure TfrmWTRSFittingConfirm.ListOrderDocuments(strPath: string; ListBox: TListBox);
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
end;

procedure TfrmWTRSFittingConfirm.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.enabled := btnPrint.enabled
end;

procedure TfrmWTRSFittingConfirm.GetOrderQuotes(ListBox: TListBox);
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

procedure TfrmWTRSFittingConfirm.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSFittingConfirm.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
  if bCancelledPrint then exit;

  //Check if any additional documents need printing
  with lstbxDocuments do
    begin
      if selcount = 0 then
        exit
      else
        PrintDocuments;
    end;
  Printers.Printer.PrinterIndex := -1;
end;

procedure TfrmWTRSFittingConfirm.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSFittingConfirm.RunReport(const bPreview: boolean);
begin
  GetSelection;

  frmWTRPSOrder := TfrmWTRPSOrder.create(self);
  try
    with frmWTRPSOrder.qryReport do
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

    frmWTRPSOrder.bEndUser := false ;
    frmwtRPSOrder.bPrintLogo := true;
    frmwtRPSOrder.bDetailed := true;

    if bPreview then
      begin
        frmWTRPSOrder.bPreview := true;
        frmWTRPSOrder.qrpDetails.Preview;
      end
    else
      begin
        bCancelledPrint := false;
        frmWTRPSOrder.bPreview := false;
        frmWTRPSOrder.qrpDetails.PrinterSetup;
        if frmWTRPSOrder.qrpDetails.tag = 0 then
          begin
            frmWTRPSOrder.qrpDetails.Print;
            DefaultPrinter := Printers.Printer.Printers[Printers.Printer.PrinterIndex];
            DefaultBin := GetBinSelection;
          end
        else
          bCancelledPrint := true;
        close;
      end;
  finally
    frmWTRPSOrder.Free;
  end;
end;

procedure TfrmWTRSFittingConfirm.PrintDocuments;
var
  sPath, sFilename: string;
  i: integer;
begin
  sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + sOrderNumber + '\';

  for i := 0 to pred(lstbxDocuments.items.count) do
    begin
      if lstbxDocuments.Selected[i] then
        begin
          sfilename := sPath + lstbxDocuments.items[i];
          printDocument(sfilename);
        end;
    end;
end;

procedure TfrmWTRSFittingConfirm.PrintDocument(const documentToPrint : string) ;
var
  printCommand : string;
  printerInfo : string;
  Device, Driver, Port: array[0..255] of Char;
  hDeviceMode: THandle;
begin

(*  if Printers.Printer.PrinterIndex = cboPrinter.ItemIndex then
    begin
      printCommand := 'print';
      printerInfo := '';
    end
  else
    begin
      printCommand := 'printto';
      Printers.Printer.PrinterIndex := cboPrinter.ItemIndex;
      Printer.GetPrinter(Device, Driver, Port, hDeviceMode) ;
      printerInfo := Format('"%s" "%s" "%s"', [Device, Driver, Port]) ;
    end;
*)

  printCommand := 'print';
  printerInfo := '';

  ShellExecute(Application.Handle, PChar(printCommand), PChar(documentToPrint), PChar(printerInfo), nil, SW_HIDE) ;
end;

procedure TfrmWTRSFittingConfirm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
    begin
      if chkbxMerge.checked then
        WriteString('Order Confirmation', 'Merge to PDF', 'Y')
      else
        WriteString('Order Confirmation', 'Merge to PDF', 'N');

      if chkbxAlLDocuments.checked then
        WriteString('Order Confirmation', 'Select All Documents', 'Y')
      else
        WriteString('Order Confirmation', 'Select All Documents', 'N');

      if chkbxAttachTerms.checked then
        WriteString('Order Confirmation', 'Attach Terms', 'Y')
      else
        WriteString('Order Confirmation', 'Attach Terms', 'N');

      WriteString('Order Confirmation', 'Document Folder', cmbDocuments.Text);

      if chkbxAttachColour.checked then
        WriteString('Order Confirmation', 'Attach Colour', 'Y')
      else
        WriteString('Order Confirmation', 'Attach Colour', 'N');
    end;
  finally
    IniFile.Free;
  end;

  Obj:= Unassigned;
  FEmailAttachment.Free;
  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

procedure TfrmWTRSFittingConfirm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
  with IniFile do
    begin
      chkbxMerge.Checked := (ReadString('Order Confirmation', 'Merge to PDF', 'N') = 'Y');
      chkbxAllDocuments.Checked := (ReadString('Order Confirmation', 'Select All Documents', 'N') = 'Y');
      chkbxAttachTerms.Checked := (ReadString('Order Confirmation', 'Attach Terms', 'N') = 'Y');
      chkbxAttachColour.Checked := (ReadString('Order Confirmation', 'Attach Colour', 'N') = 'Y');
      DefaultDocumentFolder := ReadString('Order Confirmation', 'Document Folder', '<All>');
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

procedure TfrmWTRSFittingConfirm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmWTRSFittingConfirm.lstbxDocumentsDblClick(Sender: TObject);
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

procedure TfrmWTRSFittingConfirm.btnEmailClick(Sender: TObject);
var
  i: integer;
begin
  dtmdlFittingSales := TdtmdlSalesOrder.Create(self);
  try
    try
      sTermsAndConditionsFile := dtmdlWorktops.GetTermsAndConditionsFile;
      clearEmailArray(Self);
      EmailReport;
    finally
    end;
  finally
    dtmdlFittingSales.Free;
  end;
end;

procedure TfrmWTRSFittingConfirm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TfrmWTRSFittingConfirm.EmailReport;
var
  sKitchenPlan, sTemp, sSubject: string;
  sTo, sPath, sBodyText: string;
  i, icount, iRow: integer;
//  sfilename: string;
  sFilename: array[0..255] of Char;
  sAttachment: array[0..255] of Char;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sOrderNumber, sMergedPDF, sLocation, sMaterialDescription, sColourFile: string;
  tempDate: TDateTime;
  sMergedPDFList: TStringLIst;
  iSuccess: integer;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  frmWTEmailList := TfrmWTEmailList.Create(Self);
  try
    frmWTEmailList.CodeType := 'C';

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

    frmWTEmailList.Caption := 'Sales Order Fitting Confirmation';
    frmWTEmailList.EmailListGrid.Cells[0, 0] := 'Sales Order';
    frmWTEmailList.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    frmWTEmailList.EmailListGrid.Cells[2, 0] := 'Contact';

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

        frmWTRPSOrder := TfrmWTRPSOrder.create(self);
        try
          frmWTRPSOrder.bPrintLogo := true;
          frmwtRPSOrder.bDetailed := true;
          frmWTRPSOrder.qrpDetails.ShowProgress := false;
          frmWTRPSOrder.bPreview := false;
          frmWTRPSOrder.SalesOrder := strtoint(EmailArray[irow,1]);

          frmWTRPSOrder.GetDetails;

          sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);
          sSubject := 'Order Confirmation Details: ' + EmailArray[irow,1];

          sBodyText := dtmdlWorktops.GetEmailSalesConfirmFittingDetails;

          if trim(sBodyText) = '' then
            sBodyText := 'Please find attached your order confirmation documents for order ' + EmailArray[irow,1] + '.' + #13#10#13#10
                         +  'If you have any queries please contact me immediately' + #13#10#13#10;

          {Replace the time of day}
          if pos('<AMPM>', sBodyText) > 0 then
            begin
              tempDate := incHour(date,12);

              if now < tempDate then
                sBodyText := stringreplace(sBodyText, '<AMPM>', 'Morning', [rfIgnoreCase])
              else
                sBodyText := stringreplace(sBodyText, '<AMPM>', 'Afternoon', [rfIgnoreCase])
            end;

          {Replace the order number}
          if pos('<Number>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Number>', EmailArray[irow,1], [rfIgnoreCase])
            end;

          {Replace the order number}
          if pos('<Material Description>', sBodyText) > 0 then
            begin
              sMaterialDescription := GetSOMaterialDescription(strtoint(EmailArray[irow,1]));
              sBodyText := stringreplace(sBodyText, '<Material Description>', sMaterialDescription, [rfIgnoreCase])
            end;

          {Replace the order number}
          if pos('<Material Warranty>', sBodyText) > 0 then
            begin
              sMaterialDescription := GetSOWarrantyDescription(strtoint(EmailArray[irow,1]));
              sBodyText := stringreplace(sBodyText, '<Material Warranty>', sMaterialDescription, [rfIgnoreCase])
            end;

          {Replace the order number}
          if pos('<Material Maintenance>', sBodyText) > 0 then
            begin
              sMaterialDescription := GetSOMaintenanceDescription(strtoint(EmailArray[irow,1]));
              sBodyText := stringreplace(sBodyText, '<Material Maintenance>', sMaterialDescription, [rfIgnoreCase])
            end;

          {Replace the contact name}
          if pos('<Customer Contact>', sBodyText) > 0 then
            begin
              if trim(frmWTRPSOrder.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
                sBodyText := stringreplace(sBodyText, '<Customer Contact>', frmWTRPSOrder.qryReport.fieldbyname('Contact_Name').asstring, [rfIgnoreCase])
              else
                sBodyText := stringreplace(sBodyText, '<Customer Contact>', 'Sir/Madam', [rfIgnoreCase]);
            end;

          {Replace the order number}
          if pos('<Reference>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Reference>', frmWTRPSOrder.qryReport.fieldbyname('Reference').asstring, [rfIgnoreCase])
            end;

          {Replace the Date Type}
          if pos('<Date Type>', sBodyText) > 0 then
            begin
              if trim(frmWTRPSOrder.qryReport.fieldbyname('Date_Type').asstring) = 'P' then
                    sBodyText := stringreplace(sBodyText, '<Date Type>', 'provisional', [rfIgnoreCase])
              else
              if trim(frmWTRPSOrder.qryReport.fieldbyname('Date_Type').asstring) = 'C' then
                    sBodyText := stringreplace(sBodyText, '<Date Type>', 'confirmed', [rfIgnoreCase])
              else
                    sBodyText := stringreplace(sBodyText, '<Date Type>', 'to be confirmed', [rfIgnoreCase]);
            end;

          {Replace the Template Date}
          if pos('<Template Date>', sBodyText) > 0 then
            begin
              if trim(frmWTRPSOrder.qryReport.fieldbyname('Template_Date').asstring) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Template Date>', paDateStr(frmWTRPSOrder.qryReport.fieldbyname('Template_Date').asDateTime), [rfIgnoreCase])
              else
                    sBodyText := stringreplace(sBodyText, '<Template Date>', 'TBC', [rfIgnoreCase]);
            end;

          {Replace the Fitting Date}
          if pos('<Fitting Date>', sBodyText) > 0 then
            begin
              if trim(frmWTRPSOrder.qryReport.fieldbyname('Date_Required').asstring) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Fitting Date>', paDateStr(frmWTRPSOrder.qryReport.fieldbyname('Date_Required').asDateTime), [rfIgnoreCase])
              else
                    sBodyText := stringreplace(sBodyText, '<Fitting Date>', 'TBC', [rfIgnoreCase]);
            end;

          {Replace the description}
          if pos('<Description>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Description>', frmWTRPSOrder.qryReport.fieldbyname('Descriptive_Reference').asstring, [rfIgnoreCase])
            end;

          {Replace the office contact}
          if pos('<Office Contact>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Office Contact>', frmWTRPSOrder.qryReport.fieldbyname('Account_Manager_Name').asstring, [rfIgnoreCase]);
            end;

          {Replace the telephone}
          if pos('<Telephone>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Telephone>', frmWTRPSOrder.qryReport.fieldbyname('AM_Telephone_Number').asstring, [rfIgnoreCase]);
            end;

          sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
          var printFileName := 'OC' + sAttachmentType;
          PrinterTools.New.Printtoattachment(frmWTRPSOrder.qrpDetails, FEmailAttachment, printFileName, EmailArray[irow,1]);

          {Create the Terms and Conditions as an attachment}
          if self.chkbxAttachTerms.checked and (sTermsAndConditionsFile <> '') then
            FEmailAttachment.Add(sTermsAndConditionsFile);

          {Add any other selected documents as an attachment}
          if cmbDocuments.text <> '<None>' then
            begin
              GetOrderDocuments(strtoint(EmailArray[irow,1]), cmbDocuments.text);
            end;

(*          {If only one template sheet then add any documents listed}
          if SalesOrderCount = 1 then
            begin
              sPath := dtmdlWorktops.GetCompanySalesDirectory + '\' + EmailArray[irow,1] + '\';
              for i := 0 to pred(lstbxDocuments.items.count) do
                begin
                  if lstbxDocuments.Selected[i] then
                    begin
//                      sfilename := sPath + lstbxDocuments.items[i];
                      StrPCopy(sfilename, sPath + lstbxDocuments.items[i]);
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
          if chkbxMerge.checked then
            begin
              sMergedPDFList := TStringLIst.create;
              sLocation := GetWinTempDir;

              try
                {Merge all the PDF Documents into one}
                sMergedPDF := sLocation + 'OC' + sOrderNumber + '-' + inttostr(1) + '_Merged.PDF';
                for iCount := 0 to pred(FEmailAttachment.count) do
                  begin
                    if iCount = 0 then
                      sTemp := FEmailAttachment.strings[0]
                    else
                      sTemp := sTemp + '|' + FEmailAttachment.strings[iCount];
                  end;

                iSuccess:= obj.Merge(sTemp, sMergedPDF);

                if iSuccess = 1 then
                  begin
                    sMergedPDFList.Add(sMergedPDF);
                    for i := pred(FEmailAttachment.count) downto 0 do
                      begin
                        if pos(sPath,FEmailAttachment.strings[i]) > 0 then
                          continue;
                        if (pos(sTermsAndConditionsFile,FEmailAttachment.strings[i]) > 0) then
                          continue;
                        StrPCopy(sFilename, FEmailAttachment.strings[i]);
                        deletefile(sFilename);
                      end;
                    FEmailAttachment.clear;
                  end;

                if (sMergedPDFList.Count > 0) then
                  begin
                    for icount := 0 to pred(sMergedPDFList.Count) do
                      FEmailAttachment.Add(sMergedPDFList[icount]);
                  end;
              finally
                sMergedPDFList.Free;
              end;
            end;

          {Add the colour image as an attachment}
          if self.chkbxAttachColour.checked then
            begin
              sColourFile := (GetSOColourFile(strtoint(EmailArray[irow,1])));
              if sColourFile <> '' then
                begin
                  sColourFile := dtmdlWorktops.GetWebImageDirectory + '\' + sColourFile;
                  try
                    FEmailAttachment.Add(sColourFile);
                  except
                  end;
                end;
            end;

          EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);
        finally
          frmWTRPSOrder.free;

          {Clear attachments}
          for i := pred(FEmailAttachment.count) downto 0 do
            begin
              if pos(sPath,FEmailAttachment.strings[i]) > 0 then
                continue;
              if (pos(sTermsAndConditionsFile,FEmailAttachment.strings[i]) > 0) then
                continue;
              if (pos(sColourFile,FEmailAttachment.strings[i]) > 0) then
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

procedure TfrmWTRSFittingConfirm.BuildEmailDetails;
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
      EmailArray[irow, 2] := FieldByName('Contact_no').AsString;
      EmailArray[irow, 3] := FieldByName('Customer').AsString;
      EmailArray[irow, 4] := '';
      EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString);
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 8] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 9] := Trim(FieldByName('Contact_Name').AsString);
      inc(irow);
      Next;
    end;
  end;
end;

function TfrmWTRSFittingConfirm.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLTemplate;

  sTemp := sTemp + 'Sales_Order.Sales_Order = ' + memSelection.text;
  Result := sTemp
end;

function TfrmWTRSFittingConfirm.GetBinSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     bin: integer;
     DevMode : PDevMode;
begin
  Printers.Printer.GetPrinter(Device,Driver,Port,hDevMode);
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

procedure TfrmWTRSFittingConfirm.SetPrinterBin(BinCode : integer );
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printers.Printer.GetPrinter(Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        DevMode^.DMDEFAULTSOURCE := BinCode;
        GlobalUnlock (hDevMode);
  end;
end;

procedure TfrmWTRSFittingConfirm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmWTRSFittingConfirm.memSelectionKeyPress(Sender: TObject;
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

procedure TfrmWTRSFittingConfirm.SetSalesOrderCount(const Value: integer);
begin
  FSalesOrderCount := Value;

end;

procedure TfrmWTRSFittingConfirm.BuildSelection;
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

procedure TfrmWTRSFittingConfirm.GetSelection;
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

procedure TfrmWTRSFittingConfirm.BuildRange(sFirst: string; sLast: string);
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

Function TfrmWTRSFittingConfirm.IncrementNo(StartStr: String): String ;
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

procedure TfrmWTRSFittingConfirm.FormActivate(Sender: TObject);
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
        end
      else
        begin
          self.Height := 300;
        end;
      FActivated := true;
    end;
  memSelection.SetFocus;
end;

(*
procedure TfrmWTRSFittingConfirm.PrintToAttachment(frmWTRRSOrder: TfrmWTRPSOrder; tempCode: string);
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

  sFileName := 'OC'+tempCode;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRSOrder.qrpDetails.Prepare;
        frmWTRRSOrder.qrpDetails.ExportToFilter(RTFFilter);
      finally
        frmWTRRSOrder.qrpDetails.QRPrinter.Free;
        frmWTRRSOrder.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRSOrder.qrpDetails.Prepare;
        frmWTRRSOrder.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRSOrder.qrpDetails.QRPrinter.Free;
        frmWTRRSOrder.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRSOrder.qrpDetails.Prepare;
        frmWTRRSOrder.qrpDetails.ExportToFilter(PDFFilter);
      finally
        frmWTRRSOrder.qrpDetails.QRPrinter.Free;
        frmWTRRSOrder.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRSOrder.qrpDetails.Prepare;
        frmWTRRSOrder.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRSOrder.qrpDetails.QRPrinter.Free;
        frmWTRRSOrder.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRSOrder.qrpDetails.Prepare;
        frmWTRRSOrder.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRSOrder.qrpDetails.QRPrinter.Free;
        frmWTRRSOrder.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRRSOrder.qrpDetails.Prepare;
 //       ExportToRTF(frmWTRRSOrder.qrpDetails, sLocation + sFilename + '.bmp');
      frmWTRRSOrder.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRRSOrder.qrpDetails.QRPrinter.Free;
        frmWTRRSOrder.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

procedure TfrmWTRSFittingConfirm.memSelectionChange(Sender: TObject);
begin
  enableRun(self);
end;

procedure TfrmWTRSFittingConfirm.chkbxAllDocumentsClick(Sender: TObject);
var
  icount: integer;
begin
  if chkbxAllDocuments.checked then
    lstbxdocuments.SelectAll
  else
    lstbxDocuments.ClearSelection;
end;

procedure TfrmWTRSFittingConfirm.cmbDocumentsChange(Sender: TObject);
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

procedure TfrmWTRSFittingConfirm.GetOrderDocuments(tmpOrder: integer; tmpFolder: string);
var
  iCount: integer;
  SearchRec: TSearchRec;
  sSource, sFileName: string;
begin
  if tmpFolder = '<All>' then
    sSource :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(tmpOrder) + '\'
  else
    sSource :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(tmpOrder) + '\' + tmpFolder + '\';

(*  for iCount := 0 to pred(lstbxDocuments.items.count) do
    begin
      if lstbxDocuments.Selected[iCount] then
        begin
          sfilename := sSource + lstbxDocuments.items[iCount];
          if chkbxMerge.checked then
            begin
              if (pos('.pdf', lstbxDocuments.items[iCount]) > 0) or (pos('.PDF', lstbxDocuments.items[iCount]) > 0) then
                FEmailAttachment.add(sfilename)
            end
          else
            FEmailAttachment.add(sfilename);
        end;
    end;
*)

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

procedure TfrmWTRSFittingConfirm.SetDefaultDocumentFolder(
  const Value: string);
begin
  FDefaultDocumentFolder := Value;
end;

function TfrmWTRSFittingConfirm.GetSOMaterialDescription(iOrder: integer): string;
begin
  with qryGetMaterialDescription do
    begin
      close;
      parambyname('Sales_Order').asinteger := iOrder;
      open;

      result := fieldbyname('Material_Description').asstring;
    end;
end;

function TfrmWTRSFittingConfirm.GetSOWarrantyDescription(iOrder: integer): string;
begin
  with qryGetMaterialDescription do
    begin
      close;
      parambyname('Sales_Order').asinteger := iOrder;
      open;

      result := GetNarrative(fieldbyname('Warranty_Description').asinteger);
    end;
end;

function TfrmWTRSFittingConfirm.GetSOMaintenanceDescription(iOrder: integer): string;
begin
  with qryGetMaterialDescription do
    begin
      close;
      parambyname('Sales_Order').asinteger := iOrder;
      open;

      result := GetNarrative(fieldbyname('Maintenance_Description').asinteger);
    end;
end;

function TfrmWTRSFittingConfirm.GetSOColourFile(iOrder: integer): string;
begin
  with qryGetMaterialDescription do
    begin
      close;
      parambyname('Sales_Order').asinteger := iOrder;
      open;

      result := fieldbyname('Image_Path').asstring;
    end;
end;

function TfrmWTRSFittingConfirm.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

end.
