unit wtRSSODeliveryNote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, DB, DBTables, CheckLst, printers, IniFiles,
  wtRPSODeliveryNote, gtQrExport, wtRPQuote, AllCommon, ComObj, DBCtrls, ExtCtrls;

type
  TfrmWTRSSODeliveryNote = class(TForm)
    SelectLst: TListBox;
    qryGetSalesOrderEmailsOlder: TQuery;
    qryGetSalesOrderEmailsOld: TQuery;
    pnlFooter: TPanel;
    btnPrint: TButton;
    btnPreview: TButton;
    btnEmail: TButton;
    Button4: TButton;
    pnlSelection: TPanel;
    selectionGrp: TGroupBox;
    Label3: TLabel;
    memSelection: TMemo;
    qryGetSalesOrders: TQuery;
    qryGetSalesOrderEmails: TQuery;
    qryGetSalesOrderEmail: TQuery;
    procedure EnableRun(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure memSelectionKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure memSelectionChange(Sender: TObject);
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
    procedure PrintToAttachment(frmWTRPSODeliveryNote: TfrmWTRPSODeliveryNote; tempCode: string);
    procedure PrintQuoteToAttachment(frmwtRPQuote: TfrmwtRPQuote;
      tempCode, tmpOrder: string);
    procedure SetDefaultDocumentFolder(const Value: string);
  private
    bCancelledPrint: boolean;
    iIntSelCode: Integer;
    FActivated: boolean;
    FEmailAttachment : TstringList;
    sAttachmentType: string;
    procedure ListOrderDocuments(strPath: string; ListBox: TListBox);
    procedure RunReport(const bPreview: boolean);
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultDocumentFolder: string read FDefaultDocumentFolder write SetDefaultDocumentFolder;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  public
    sOrderNumber: string;
    property SalesOrderCount: integer read FSalesOrderCount write SetSalesOrderCount;
  end;

var
  frmWTRSSODeliveryNote: TfrmWTRSSODeliveryNote;
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

procedure TfrmWTRSSODeliveryNote.ListOrderDocuments(strPath: string; ListBox: TListBox);
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
end;

procedure TfrmWTRSSODeliveryNote.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.enabled := btnPrint.enabled
end;

procedure TfrmWTRSSODeliveryNote.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSODeliveryNote.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
  if bCancelledPrint then exit;
end;

procedure TfrmWTRSSODeliveryNote.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSSODeliveryNote.RunReport(const bPreview: boolean);
begin
  GetSelection;

  frmWTRPSODeliveryNote := TfrmWTRPSODeliveryNote.create(self);
  try
    with frmWTRPSODeliveryNote.qryReport do
      begin
        close;
        sql.Text := qryGetSalesOrders.sql.Text;

        ParamBYName('Int_sel').AsInteger := iIntselcode;
        Open;
        if recordCount = 0 then
  	      begin
            MessageDlg('There are no valid delivery notes to print in this selection',mterror,[mbOK],0);
            exit;
    	    end;
      end;

    if bPreview then
      begin
        frmWTRPSODeliveryNote.bPreview := true;
        frmWTRPSODeliveryNote.qrpDetails.Preview;
      end
    else
      begin
        bCancelledPrint := false;
        frmWTRPSODeliveryNote.bPreview := false;
        frmWTRPSODeliveryNote.qrpDetails.PrinterSetup;
        if frmWTRPSODeliveryNote.qrpDetails.tag = 0 then
          begin
            frmWTRPSODeliveryNote.qrpDetails.Print;
            DefaultPrinter := printer.Printers[printer.printerindex];
            DefaultBin := GetBinSelection;
          end
        else
          bCancelledPrint := true;
        close;
      end;
  finally
    frmWTRPSODeliveryNote.Free;
  end;
end;

procedure TfrmWTRSSODeliveryNote.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      Free;
    end;
  FEmailAttachment.Free;
  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

procedure TfrmWTRSSODeliveryNote.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
    end;
  finally
    IniFile.Free;
  end;

  FEmailAttachment := TStringList.create;
  iIntSelCode := dtmdlWorktops.GetNextIntSelCode(Self) ;
end;

procedure TfrmWTRSSODeliveryNote.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmWTRSSODeliveryNote.btnEmailClick(Sender: TObject);
var
  i: integer;
begin
  try
    ClearEmailArray(Self);
    EmailReport;
  finally
  end;
end;

procedure TfrmWTRSSODeliveryNote.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TfrmWTRSSODeliveryNote.EmailReport;
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
    frmWTEmailList.CodeType := 'D';

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

    frmWTEmailList.Caption := 'Delivery Notes';
    frmWTEmailList.EmailListGrid.Cells[0, 0] := 'Postcode';
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
        FEmailAttachment.clear;

        frmWTRPSODeliveryNote := TfrmWTRPSODeliveryNote.create(self);
        try
          frmWTRPSODeliveryNote.qrpDetails.ShowProgress := false;
          frmWTRPSODeliveryNote.bPreview := false;

          frmWTRPSODeliveryNote.qryReport.sql.Text := qryGetSalesOrderEmail.sql.Text;

          frmWTRPSODeliveryNote.qryReport.close;
          frmWTRPSODeliveryNote.qryReport.ParamBYName('Int_sel').AsInteger := iIntselcode;
          frmWTRPSODeliveryNote.qryReport.ParamBYName('Postcode').Asstring := EmailArray[irow,1];
          frmWTRPSODeliveryNote.qryReport.open;

          sTo := Trim(frmWTEmailList.EmailListGrid.Cells[3, irow]);
          sSubject := Trim(frmWTEmailList.EmailListGrid.Cells[2, irow]) + ' ' + 'Delivery Notes: ' + EmailArray[irow,1];
          sBodyText := 'Please find attached Delivery Note.' + #13#10#13#10;

          sAttachmentType := frmWTEmailList.EmailListGrid.Cells[5, irow];
          Printtoattachment(frmWTRPSODeliveryNote, EmailArray[irow,1]);

          EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmWTMain.EmailApplication, frmWTMain.EmailAccount);
        finally
          frmWTRPSODeliveryNote.free;

          {Clear attachments}
          for i := pred(FEmailAttachment.count) downto 0 do
            begin
              if pos(sPath,FEmailAttachment.strings[i]) > 0 then
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

procedure TfrmWTRSSODeliveryNote.BuildEmailDetails;
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
      EmailArray[irow, 1] := FieldByName('Postcode').AsString;
      EmailArray[irow, 2] := FieldByName('Fitter').AsString;
      EmailArray[irow, 3] := FieldByName('Customer').AsString;
      EmailArray[irow, 4] := '';
      EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString);
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 8] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 9] := FieldByName('Fitter_Name').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

function TfrmWTRSSODeliveryNote.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLTemplate;

  sTemp := sTemp + 'Sales_Order.Sales_Order = ' + memSelection.text;
  Result := sTemp
end;

function TfrmWTRSSODeliveryNote.GetBinSelection: integer;
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

procedure TfrmWTRSSODeliveryNote.SetPrinterBin(BinCode : integer );
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

procedure TfrmWTRSSODeliveryNote.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmWTRSSODeliveryNote.memSelectionKeyPress(Sender: TObject;
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

procedure TfrmWTRSSODeliveryNote.SetSalesOrderCount(const Value: integer);
begin
  FSalesOrderCount := Value;

end;

procedure TfrmWTRSSODeliveryNote.BuildSelection;
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

procedure TfrmWTRSSODeliveryNote.GetSelection;
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

procedure TfrmWTRSSODeliveryNote.BuildRange(sFirst: string; sLast: string);
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

Function TfrmWTRSSODeliveryNote.IncrementNo(StartStr: String): String ;
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

procedure TfrmWTRSSODeliveryNote.FormActivate(Sender: TObject);
var
  sPath: string;
begin
  if not FActivated then
    begin
      FActivated := true;
    end;
  memSelection.SetFocus;
end;

procedure TfrmWTRSSODeliveryNote.PrintToAttachment(frmWTRPSODeliveryNote: TfrmWTRPSODeliveryNote; tempCode: string);
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
        frmWTRPSODeliveryNote.qrpDetails.Prepare;
        frmWTRPSODeliveryNote.qrpDetails.ExportToFilter(RTFFilter);
      finally
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter.Free;
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSODeliveryNote.qrpDetails.Prepare;
        frmWTRPSODeliveryNote.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter.Free;
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSODeliveryNote.qrpDetails.Prepare;
        frmWTRPSODeliveryNote.qrpDetails.ExportToFilter(PDFFilter);
      finally
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter.Free;
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSODeliveryNote.qrpDetails.Prepare;
        frmWTRPSODeliveryNote.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter.Free;
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSODeliveryNote.qrpDetails.Prepare;
        frmWTRPSODeliveryNote.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter.Free;
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
      try
        frmWTRPSODeliveryNote.qrpDetails.Prepare;
 //       ExportToRTF(frmWTRPSODeliveryNote.qrpDetails, sLocation + sFilename + '.bmp');
      frmWTRPSODeliveryNote.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter.Free;
        frmWTRPSODeliveryNote.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;

procedure TfrmWTRSSODeliveryNote.PrintQuoteToAttachment(frmwtRPQuote: TfrmwtRPQuote; tempCode, tmpOrder: string);
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

procedure TfrmWTRSSODeliveryNote.memSelectionChange(Sender: TObject);
begin
  enableRun(self);
end;


procedure TfrmWTRSSODeliveryNote.SetDefaultDocumentFolder(
  const Value: string);
begin
  FDefaultDocumentFolder := Value;
end;

end.
