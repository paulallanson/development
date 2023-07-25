unit STRSPODelivNote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBTables, Buttons, Printers, ExtCtrls, QrExport, STRPPODelivNote,
  IniFiles;

type
  TSTRSPODelivNoteFrm = class(TForm)
    PrintBtn: TBitBtn;
    PreviewBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    selectionGrp: TGroupBox;
    SelectionMemo: TMemo;
    SelectLst: TListBox;
    Label1: TLabel;
    AddIntSelQuery: TQuery;
    AddWorkSQL: TQuery;
    DelWorkSQL: TQuery;
    GetLastIntSelSQL: TQuery;
    EmailBitBtn: TBitBtn;
    rdgrpLogo: TRadioGroup;
    chkbxPrintlogo: TCheckBox;
    GetOrdHedQuery: TQuery;
    procedure FormShow(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure PreviewBtnClick(Sender: TObject);
    procedure GetSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    Function IncrementNo(StartStr: String): String ;
    procedure SelectionMemoKeyPress(Sender: TObject; var Key: Char);
    procedure BuildSelection;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    Function GetNextIntSelCode(Sender: TObject): Integer;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure FormCreate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure chkbxPrintlogoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure EmailReport(const bPreview: boolean);
    procedure ClearEmailArray(Sender: TObject);
    procedure BuildEmailDetails;
    procedure PrintToAttachment(STRPPODelivNoteFrm: TSTRPPODelivNoteFrm);
    { Private declarations }
  public
    { Public declarations }
    iIntSelCode: Integer;
  private
    bTooManyRecs: boolean;
    FEmailAttachment : TstringList;
    sAttachmentType: string;
    procedure CallReport(const bPreview: Boolean);
  end;

var
  STRSPODelivNoteFrm: TSTRSPODelivNoteFrm;
  EmailArray: array[1..100, 1..10] of string;

implementation

uses
  PBRPSalesInv, CCSPrint, CCSemailHandler, pbDatabase,
  PBEmailList, CCSCommon, pbMainMenu, Printer.Tools;

{$R *.DFM}

procedure TSTRSPODelivNoteFrm.FormShow(Sender: TObject);
begin
  SelectionMemo.SetFocus;
end;

procedure TSTRSPODelivNoteFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  STRPPODelivNoteFrm := TSTRPPODelivNoteFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      STRPPODelivNoteFrm.PrinterSettings := PrinterSettings;
      STRPPODelivNoteFrm.Preview := bPreview;
      STRPPODelivNoteFrm.Printlogo := chkbxPrintLogo.checked;
      case rdgrpLogo.itemindex of
        0:  STRPPODelivNoteFrm.Customerlogo := false;
      else
        STRPPODelivNoteFrm.Customerlogo := true;
      end;
      
      bTooManyRecs := false;
      GetSelection;
      if bTooManyRecs then
        begin
          messagedlg('The purchase order selection entered will return more than 50 records, please reduce the range specified.', mtInformation, [mbOk], 0);
          exit;
        end;
      STRPPODelivNoteFrm.GetOrdHedQuery.Close;
      STRPPODelivNoteFrm.GetOrdHedQuery.ParamBYName('Int_sel_code').AsInteger := iIntselcode;
      STRPPODelivNoteFrm.GetOrdHedQuery.ParamBYName('Supplier').AsInteger := 0;
      STRPPODelivNoteFrm.GetOrdHedQuery.ParamBYName('Branch_no').AsInteger := 0;
      STRPPODelivNoteFrm.GetOrdHedQuery.Open;
      if STRPPODelivNoteFrm.GetOrdHedQuery.recordCount = 0 then
  		    begin
          MessageDlg('No valid purchase orders in this selection',mterror,[mbOK],0);
          exit;
    	end;

      if bPreview then
        STRPPODelivNoteFrm.qrpDetails.Preview
      else
        if SetUpPrinter(PrinterSettings) then
          STRPPODelivNoteFrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    STRPPODelivNoteFrm.Free;
  end;
end;

procedure TSTRSPODelivNoteFrm.PrintBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TSTRSPODelivNoteFrm.PreviewBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TSTRSPODelivNoteFrm.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	selectLst.Clear;

	ilength := length(SelectionMemo.text);

 	stext := SelectionMemo.text;
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
           	{Build the list of possible values inbetween the range}
              sFirst := copy(sEvaluate,1,irange-1);
              sLast := copy(sEvaluate,irange+1,(iNewLength-irange));

              if length(sFirst) = length(sLast) then
                BuildRange(sFirst,sLast);
        		  stext[ifinish] := ':';
              continue;
           end;

        {Check that the item does not already exist}
        if SelectLst.Items.IndexOf(sEvaluate) < 0 then
        	begin
            if SelectLst.items.count >= 50 then
              begin
                bTooManyRecs := true;
                exit;
              end;

            SelectLst.Items.Add(sEvaluate);
          end;

        stext[ifinish] := ':';
     end;
end;

procedure TSTRSPODelivNoteFrm.GetSelection;
var
	icount: integer;
begin
  {Delete selection}
  DelIntSelCode(iIntSelCode, True);
	{When the constructing of the list is complete, write to the Report Selection file}
	buildselection;

  if bTooManyRecs then
    exit;

  for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant Invoice number}
        if SelectLst.Items[icount] = '' then continue;

       	with AddIntSelQuery do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsInteger := icount;
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TSTRSPODelivNoteFrm.BuildRange(sFirst: string; sLast: string);
var
  sinvoiceNo: string;
begin
	if sFirst > sLast then exit;

  sInvoiceNo := sFirst;

  {Continue adding invoice lines until the last in the range is reached}
	repeat
      if SelectLst.Items.IndexOf(sInvoiceNo) < 0 then
        	SelectLst.Items.Add(sInvoiceNo);
     sInvoiceNo := incrementno(sInvoiceNo);
  until sInvoiceNo > sLast;

end;

Function TSTRSPODelivNoteFrm.IncrementNo(StartStr: String): String ;
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

procedure TSTRSPODelivNoteFrm.SelectionMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
	case Ord(key) of
  	$30..$39:;
  	$41..$86:;
  	Ord(','):;
  	Ord('-'):;
  	Ord('/'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;
end;

procedure TSTRSPODelivNoteFrm.FormActivate(Sender: TObject);
begin
  iIntSelCode := GetNextIntSelCode(Self) ;
end;

procedure TSTRSPODelivNoteFrm.FormDeactivate(Sender: TObject);
begin
DelIntSelCode(iIntSelCode, True);
end;

procedure TSTRSPODelivNoteFrm.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
begin
{Delete ALL entries on the workfile for the int_sel_code} ;
With DelWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
     ExecSQL ;
     end;
{Add the reserving one back in} ;
If not bTempDelCode then
     begin
     With AddWorkSQL do
          begin
          Close ;
          ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
          ParamByName('Text100').AsString := '' ;
          ExecSQL ;
          end;
     end;
end;

function TSTRSPODelivNoteFrm.GetNextIntSelCode(Sender: TObject): Integer;
Var
iIntSelCode: Integer ;
begin
{Get the next int_sel_code to use} ;
With GetLastIntSelSQL do
     begin
     Close ;
     Open ;
     First;
     iIntSelCode := FieldByName('Last_Code').AsInteger + 1 ;
     end;
{Reserve it on the int_sel file} ;
With AddWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
     ParamByName('Text100').AsString := '' ;
     ExecSQL ;
     end;
Result := iIntSelCode ;
end;

procedure TSTRSPODelivNoteFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  try
  with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Redeye', 'PO Delivery Note - Print Logo', 'N') = 'Y');

      if (ReadString('Redeye', 'PO Delivery Note - Customer Logo', 'N') = 'Y') then
        rdgrpLogo.itemindex := 1
      else
        rdgrplogo.Itemindex := 0;
    end;
  finally
    IniFile.Free;
  end;

  FEmailAttachment := TStringList.create;
  TEdit(selectionMemo).charcase := ecUpperCase;
end;

procedure TSTRSPODelivNoteFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  try
    clearEmailarray(self);
    EmailReport(true);
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
end;

procedure TSTRSPODelivNoteFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TSTRSPODelivNoteFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  GetSelection;
  if bTooManyRecs then
    begin
      messagedlg('The purchase order selection entered will return more than 50 records, please reduce the range specified.', mtInformation, [mbOk], 0);
      exit;
    end;

  with GetOrdHedQuery do
    begin
      Close;
      ParamBYName('Int_sel_code').AsInteger := iIntselcode;
      Open;

      if recordCount = 0 then
        begin
          MessageDlg('No valid purchase orders in this selection',mterror,[mbOK],0);
          exit;
        end;

      First;
      irow := 1;
      while (not EOF) do
      begin
        EmailArray[irow, 1] := '0';
        EmailArray[irow, 2] := FieldByName('Supplier').AsString;
        EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
        EmailArray[irow, 4] := Trim(FieldByName('Supplier_Name').AsString)+' '+Trim(FieldByName('Branch_name').AsString);
        EmailArray[irow, 5] := FieldByName('Email').AsString;
        EmailArray[irow, 6] := 'Adobe Acrobat Document (*.pdf)';
        EmailArray[irow, 7] := 'PDF';
        EmailArray[irow, 8] := '';
        inc(irow);
        Next;
      end;
    end;
end;

procedure TSTRSPODelivNoteFrm.EmailReport(const bPreview: boolean);
var
  PrinterSettings: TPrinterSettings;
  icount, irow: integer;
  sTo, sSubject, sBody, sSalutation: string;
begin
  {Build the Enquiry and Supplier details}
  BuildEmailDetails;
  {For each of the Enquiry/Supplier details send an email}
  PrinterSettings := TPrinterSettings.Create;
  try
    PBEmailListFrm := TPBEmailListFrm.Create(Self);
    try
    PBEmailListFrm.CodeType := 'S';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
      PBEmailListFrm.EmailListGrid.ColWidths[0] := 0;
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 8];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 7];


      {Set up the Email Array with the Supplier/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 1];
    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Purchase Order Delivery Notes';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Supplier/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';
    PBEmailListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if PBEmailListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBEmailListFrm.EmailListGrid.Rowcount -1 do
      begin
      if Trim(PBEmailListFrm.EmailListGrid.cells[3, irow]) = '' then continue;
      STRPPODelivNoteFrm := TSTRPPODelivNoteFrm.Create(Self);
      try
        STRPPODelivNoteFrm.PrinterSettings := PrinterSettings;
        STRPPODelivNoteFrm.Preview := false;
        STRPPODelivNoteFrm.Printlogo := chkbxPrintLogo.checked;
        case rdgrpLogo.itemindex of
          0:  STRPPODelivNoteFrm.Customerlogo := false;
        else
          STRPPODelivNoteFrm.Customerlogo := true;
        end;

        STRPPODelivNoteFrm.GetOrdHedQuery.Close;
        STRPPODelivNoteFrm.GetOrdHedQuery.ParamBYName('Int_sel_code').AsInteger := iIntselcode;
        STRPPODelivNoteFrm.GetOrdHedQuery.ParamBYName('Supplier').AsInteger := StrToInt(EmailArray[irow,2]);
        STRPPODelivNoteFrm.GetOrdHedQuery.ParamBYName('Branch_no').AsInteger := StrToInt(EmailArray[irow,3]);
        STRPPODelivNoteFrm.GetOrdHedQuery.Open;

        STRPPODelivNoteFrm.qrpDetails.Showprogress := False;
        {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
        sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
        Printtoattachment(STRPPODelivNoteFrm);
        sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
        sSubject := 'Purchase Orders Delivery Notes';
        sBody := 'Please find attached ' + sSubject + '.'#13#10#13#10;

        EmailViaOutlook(sTo,sSubject,sBody, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

      finally
        STRPPODelivNoteFrm.Free;
      end;
    end;
  end;
  finally;
  PBEmailListFrm.Free;
    end;
  finally
  PrinterSettings.Free;
  Application.ProcessMessages;
  end;
end;

procedure TSTRSPODelivNoteFrm.PrintToAttachment(STRPPODelivNoteFrm: TSTRPPODelivNoteFrm);
begin
  var fileName := 'PO_Delivery_Note' + STRPPODelivNoteFrm.DeliveryNo.ToString;
  PrinterTools.New.PrintToAttachment(STRPPODelivNoteFrm.qrpDetails, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TSTRSPODelivNoteFrm.PrintToAttachment(STRPPODelivNoteFrm: TSTRPPODelivNoteFrm);
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
  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

  sFileName := 'PO_Delivery_Note';

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        STRPPODelivNoteFrm.qrpDetails.Prepare;
        STRPPODelivNoteFrm.qrpDetails.ExportToFilter(RTFFilter);
      finally
        STRPPODelivNoteFrm.qrpDetails.QRPrinter.Free;
        STRPPODelivNoteFrm.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        STRPPODelivNoteFrm.qrpDetails.Prepare;
        STRPPODelivNoteFrm.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPPODelivNoteFrm.qrpDetails.QRPrinter.Free;
        STRPPODelivNoteFrm.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        STRPPODelivNoteFrm.qrpDetails.Prepare;
        STRPPODelivNoteFrm.qrpDetails.ExportToFilter(PDFFilter);
      finally
        STRPPODelivNoteFrm.qrpDetails.QRPrinter.Free;
        STRPPODelivNoteFrm.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        STRPPODelivNoteFrm.qrpDetails.Prepare;
        STRPPODelivNoteFrm.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPPODelivNoteFrm.qrpDetails.QRPrinter.Free;
        STRPPODelivNoteFrm.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        STRPPODelivNoteFrm.qrpDetails.Prepare;
        STRPPODelivNoteFrm.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPPODelivNoteFrm.qrpDetails.QRPrinter.Free;
        STRPPODelivNoteFrm.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        STRPPODelivNoteFrm.qrpDetails.Prepare;
 //       ExportToRTF(STRPPODelivNoteFrm.qrpDetails, sLocation + sFilename + '.bmp');
      STRPPODelivNoteFrm.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPPODelivNoteFrm.qrpDetails.QRPrinter.Free;
        STRPPODelivNoteFrm.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;

  AFilters.free;
end;
*)

procedure TSTRSPODelivNoteFrm.chkbxPrintlogoClick(Sender: TObject);
begin
  rdgrplogo.Enabled := (sender as Tcheckbox).Checked;
end;

procedure TSTRSPODelivNoteFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Redeye', 'PO Delivery Note - Print Logo', 'Y')
      else
        WriteString('Redeye', 'PO Delivery Note - Print Logo', 'N');

      case rdgrpLogo.itemindex of
        0:  WriteString('Redeye', 'PO Delivery Note - Customer Logo', 'N')
      else
        WriteString('Redeye', 'PO Delivery Note - Customer Logo', 'Y')
      end;

      Free;
    end;
  FEmailAttachment.free;
end;

end.
