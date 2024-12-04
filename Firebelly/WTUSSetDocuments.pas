unit WTUSSetDocuments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, Buttons, DB, QrExport, ShellAPI, QRPDFFilt,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTUSSetDocuments = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDateFrom: TEdit;
    btnDatefrom: TBitBtn;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryGetOrders: TFDQuery;
    Label3: TLabel;
    prgbrRecords: TProgressBar;
    lblnoRecords: TLabel;
    procedure enableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
  private
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CreateQuoteDocument(iSOrder, iQuote: integer);
    procedure MoveSiteDocuments(iSOrder: integer; CustomerName, CustomerBranchName: string);
    procedure UpdateOrders;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTUSSetDocuments: TfrmWTUSSetDocuments;

implementation

uses
  System.UITypes,
  AllCommon, DateSelV5, wtDataModule, wtRPQuote;

{$R *.dfm}

procedure TfrmWTUSSetDocuments.enableOK(Sender: TObject);
begin
  btnOK.enabled := (edtDateFrom.Text <> '');
end;

procedure TfrmWTUSSetDocuments.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Do you want to allocate documents to scheduled orders from the selected date?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      exit;

  UpdateOrders;
end;

procedure TfrmWTUSSetDocuments.edtDateFromExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWTUSSetDocuments.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTUSSetDocuments.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTUSSetDocuments.UpdateOrders;
var
  imax, icount: integer;
begin
  with qryGetOrders do
    begin
      close;
      parambyname('Date_Required').asdatetime := padatestr(edtDateFrom.text);
      open;

      lblNoRecords.caption := inttostr(qryGetOrders.recordcount) + ' records';

      iMax := qryGetOrders.recordcount;
      prgbrRecords.Position := 0;
      iCount := 0;

      first;

      while eof <> true do
        begin
          dtmdlWorktops.CreateSalesDocDirectory(inttostr(fieldbyname('Sales_Order').asinteger));
          if fieldbyname('Quote').asinteger > 0 then
            CreateQuoteDocument(fieldbyname('Sales_Order').asinteger, fieldbyname('Quote').asinteger);
          MoveSiteDocuments(fieldbyname('Sales_Order').asinteger, fieldbyname('Customer_Name').asstring, fieldbyname('Branch_Name').asstring);

          inc(icount);
          prgbrRecords.Position := Round( icount / iMax * 100);
          Application.ProcessMessages;

          next;
        end;
    end;
end;

procedure TfrmWTUSSetDocuments.CreateQuoteDocument(iSOrder, iQuote: integer);
var
  FEmailAttachment : TstringList;
  sAttachment: array[0..255] of Char;
  iCount: integer;
  sLocation, sDest, sQuoteFolder, sFileName: string;
  PDFFilter: TQRPDFDocumentFilter;
begin
  sQuoteFolder := dtmdlWorktops.GetCompanyQuoteDocumentFolder;

  if sQuoteFolder <> '' then
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\' + sQuoteFolder + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\';

  FEmailAttachment := TStringList.create;
  FEmailAttachment.clear;

  frmwtRPQuote := TfrmwtRPQuote.create(self);
  try
    frmwtRPQuote.Quote := iQuote;
    frmwtRPQuote.bPrintLogo := false;
    frmwtRPQuote.bPrintDetail := false;
    frmwtRPQuote.bPrintAcceptance := false;
    frmwtRPQuote.bOnlyGrandTotal := false;
    frmwtRPQuote.bPrintTotals := false;
    frmwtRPQuote.bEndUser := false ;
    frmWTRPQuote.bPreview := false;
    frmWTRPQuote.qrpDetails.ShowProgress := false;

    if (frmwtRPQuote.GetDetails = 0) then
      exit;

    sLocation := GetWinTempDir;

    {Delete previous quotation order file}
    sFileName := 'Q' + inttostr(iSorder);

    deletefile(sDest + sFilename + '.pdf');

    sFileName := 'Q' + inttostr(iQuote);

    FEmailAttachment.add(sLocation + sFilename + '.pdf');
    PDFFilter := TQRPDFDocumentFilter.Create(FEmailAttachment[pred(FEmailAttachment.count)]);
    try
      frmwtRPQuote.qrpDetails.Prepare;
      frmwtRPQuote.qrpDetails.ExportToFilter(PDFFilter);
    finally
      frmwtRPQuote.qrpDetails.QRPrinter.Free;
      frmwtRPQuote.qrpDetails.QRPrinter := nil;
      PDFFilter.Free;
    end;
  finally
    {Now move the Quote as PDF to the new Sales order folder}
    try
      filecopy(sLocation + sFilename + '.pdf', sDest + sFilename + '.pdf');
    except
    end;

    for iCount := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sAttachment, FEmailAttachment.strings[iCount]);
        deletefile(sAttachment);
      end;

    FEmailAttachment.Free;
    frmWTRPQuote.Free;
  end;
end;

procedure TfrmWTUSSetDocuments.MoveSiteDocuments(iSOrder: integer; CustomerName, CustomerBranchName: string);
var
  sDest, sSource, sSafetyFolder, SiteName: string;
  irow: integer;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sFilename: string;
begin
  if trim(CustomerBranchName) = '' then
    exit;

  sSource := dtmdlWorktops.GetCompanyCustomerDirectory + '\' + CustomerName + '\' + CustomerBranchName + '\';

  sSafetyFolder := dtmdlWorktops.GetCompanySafetyDocumentFolder;

  if sSafetyFolder <> '' then
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\' + sSafetyFolder + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + inttostr(iSorder) + '\';

  // search for the first file
  irow := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while irow = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(sSource + SearchRec.Name), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);

          sFilename := SearchRec.Name;
          try
            filecopy(sSource+sFilename, sDest+sFilename);
          except
          end;
        end;
      irow := FindNext(SearchRec);
    end;
end;

end.
