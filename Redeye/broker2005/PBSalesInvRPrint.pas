unit PBSalesInvRPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Buttons, Printers, PBRPSalesInv, QrExport,
  IniFiles, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBSalesInvRPrintFrm = class(TForm)
    PrintBtn: TBitBtn;
    PreviewBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    selectionGrp: TGroupBox;
    SelectionMemo: TMemo;
    SelectLst: TListBox;
    Label1: TLabel;
    AddIntSelQuery: TFDQuery;
    AddWorkSQL: TFDQuery;
    DelWorkSQL: TFDQuery;
    GetLastIntSelSQL: TFDQuery;
    InvRPrintSQL: TFDQuery;
    EmailBitBtn: TBitBtn;
    GetInvCustSQL: TFDQuery;
    qryInvEmail: TFDQuery;
    qryInvPrint: TFDQuery;
    qryCreditPrint: TFDQuery;
    qryCreditEmail: TFDQuery;
    GetCreditCustSQL: TFDQuery;
    qryGetCustomers: TFDQuery;
    chkbxPrintLogo: TCheckBox;
    chkbxShowZeroValues: TCheckBox;
    InvLineSQL: TFDQuery;
    chkbxAttachCSVFile: TCheckBox;
    InvLineCSVSQL: TFDQuery;
    qryPO: TFDQuery;
    qryJBLine: TFDQuery;
    qryPOLine: TFDQuery;
    InvCSVSQL: TFDQuery;
    OleContainer1: TOleContainer;
    btbtnExcel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure PreviewBtnClick(Sender: TObject);
    procedure GetSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    Function IncrementNo(StartStr: String): String ;
    procedure SelectionMemoKeyPress(Sender: TObject; var Key: Char);
    procedure BuildSelection;
    procedure FormActivate(Sender: TObject);
    Function GetNextIntSelCode(Sender: TObject): Integer;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure FormCreate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure SelectionMemoChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    private
    FInvoicePrint: boolean;
    FCreditNotePrint: boolean;
    procedure SetInvoicePrint(const Value: boolean);
    procedure CallReport(const bPreview: Boolean);
    procedure EmailReport(const bPreview: boolean);
    function BuildQueryString: string;
    procedure BuildEmailDetails;
    procedure ClearEmailArray(Sender: TObject);
    procedure SetCreditNotePrint(const Value: boolean);
    procedure ExportAllInvoicesToCSV;
    procedure ExportInvoice(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
    procedure ExportInvoiceToCSV(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
    function GetPODate(tempCode: real): string;
    function GetPOSupplier(tempCode: real): string;
    function GetPOCostUnit(tempCode: real; tempLine: integer): string;
    function GetPOPriceUnitFactor(tempCode: real; tempLine: integer): integer;
    function GetPOProductType(tempCode: real; tempLine: integer): string;
    function GetJBSupplier(tempCode, tempLine: integer): string;
    function GetJBCostUnit(tempCode, tempLine: integer): string;
    function GetJBUnitCost(tempCode, tempLine: integer): real;
    function GetJBPriceUnitFactor(tempCode, tempLine: integer): integer;
    function GetJBProductType(tempCode, tempLine: integer): string;
    { Private declarations }
  private
    bTooManyRecs: boolean;
    FActivated: boolean;
    FCustomerName: string;
    FEmailAttachment : TstringList;
    FEmailSent: boolean;
    sAttachmentType: string;
    procedure PrintToAttachment(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
  public
    { Public declarations }
    iIntSelCode: Integer;
    property CreditNotePrint: boolean read FCreditNotePrint write SetCreditNotePrint;
    property InvoicePrint: boolean read FInvoicePrint write SetInvoicePrint;
  end;

var
  PBSalesInvRPrintFrm: TPBSalesInvRPrintFrm;
  EmailArray: array[1..100, 1..11] of string;

implementation

uses
  CCSPrint, pbDatabase, PBEmailList, CCSCommon, pbMainMenu, Printer.Tools;

{$R *.DFM}

const SQLCore =
  'SELECT DISTINCT sales_invoice.sales_invoice_no, '+
  '   customer_contact.name, '+
  '   customer_contact.email, '+
	'''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM (Customer_Branch '+
	'INNER JOIN sales_invoice ON (Customer_Branch.Customer = sales_invoice.Inv_to_Customer) '+
	'	AND (Customer_Branch.Branch_no = sales_invoice.Inv_to_Branch)) '+
	'INNER JOIN (ExportFilter RIGHT JOIN Customer_Contact '+
	'	ON ExportFilter.ExportFilter = Customer_Contact.ExportFilter) '+
	'	ON (Customer_Branch.Branch_no = Customer_Contact.Branch_no) '+
	'	AND (Customer_Branch.Customer = Customer_Contact.Customer) '+
  'WHERE (sales_invoice.Inv_to_Customer = customer_branch.customer) AND (sales_invoice.Inv_to_Branch = customer_branch.branch_no) ';

procedure TPBSalesInvRPrintFrm.FormShow(Sender: TObject);
begin
  SelectionMemo.SetFocus;
//  AddSelected(Self);
end;

procedure TPBSalesInvRPrintFrm.CallReport(const bPreview: Boolean);
var
  PrinterSettings: TPrinterSettings;
begin
  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);

  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      if chkbxShowZeroValues.checked then
        PBRPSalesInvFrm.ShowZeroValues := 'Y'
      else
        PBRPSalesInvFrm.ShowZeroValues := 'N';

      {Print all lines of credit note}
      if self.CreditNotePrint then
        PBRPSalesInvFrm.ShowZeroValues := 'Y';

      PBRPSalesInvFrm.bInvoice := InvoicePrint;
      PBRPSalesInvfrm.bPreview := bPreview;
      PBRPSalesInvFrm.bPrintLogo := chkbxPrintLogo.Checked;
      PBRPSalesInvfrm.bReprint := true;
      bTooManyRecs := false;
      GetSelection;
      if bTooManyRecs then
        begin
          messagedlg('The invoice selection entered will return more than 50 records, please reduce the range specified.', mtInformation, [mbOk], 0);
          exit;
        end;
      InvRPrintSQL.Close;
      if InvoicePrint then
        InvRPrintSQL.SQL := qryInvPrint.SQL
      else
        InvRPrintSQL.SQL := qryCreditPrint.SQL;
        
      InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
      InvRPrintSQL.Open;
      if InvRPrintSQL.recordCount = 0 then
  		    begin
          MessageDlg('No valid invoices in this selection',mterror,[mbOK],0);
          exit;
    	end;
      PBRPSalesInvFrm.InvoiceReport.Dataset := InvRPrintSQL;
      PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'Sales_invoice';
      PBRPSalesInvFrm.InvHeadSRC.dataset := InvRPrintSQL;
      if bPreview then
        PBRPSalesInvfrm.InvoiceReport.Preview
      else
        if SetUpPrinter(PrinterSettings) then
          PBRPSalesInvfrm.InvoiceReport.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSalesInvfrm.Free;
  end;
end;

procedure TPBSalesInvRPrintFrm.PrintBtnClick(Sender: TObject);
begin
  CallReport(false);
(*  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      PBRPSalesInvfrm.bReprint := True;
      GetSelection;
      InvRPrintSQL.Close;
      InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
      InvRPrintSQL.Open;
      if InvRPrintSQL.recordCount = 0 then
  		    begin
          MessageDlg('No valid invoices in this selection',mterror,[mbOK],0);
          exit;
    	end;
      PBRPSalesInvFrm.InvoiceReport.Dataset := InvRPrintSQL;
      PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'Sales_invoice';
      PBRPSalesInvFrm.InvHeadSRC.dataset := InvRPrintSQL;
      if SetUpPrinter(PrinterSettings) then
        PBRPSalesInvfrm.InvoiceReport.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSalesInvfrm.Free;
  end;
*)
end;

procedure TPBSalesInvRPrintFrm.PreviewBtnClick(Sender: TObject);
begin
  CallReport(true);
(*  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPSalesInvfrm.PrinterSettings := PrinterSettings;
      PBRPSalesInvfrm.bReprint := True;
      GetSelection;
    InvRPrintSQL.Close;
    InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
    InvRPrintSQL.Open;
    if InvRPrintSQL.recordCount = 0 then
  		    begin
          MessageDlg('No valid invoices in this selection',mterror,[mbOK],0);
          exit;
    	end;
    PBRPSalesInvFrm.InvoiceReport.Dataset := InvRPrintSQL;
    PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'InvRPrintSQL.Sales_invoice';
    PBRPSalesInvFrm.InvHeadSRC.dataset := InvRPrintSQL;
    PBRPSalesInvfrm.InvoiceReport.Preview;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPSalesInvfrm.Free;
  end;
*)
end;

procedure TPBSalesInvRPrintFrm.BuildSelection;
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
(*            if SelectLst.items.count > 100 then
              begin
                bTooManyRecs := true;
                exit;
              end;
*)
            SelectLst.Items.Add(sEvaluate);
          end;

        stext[ifinish] := ':';
     end;
end;

procedure TPBSalesInvRPrintFrm.GetSelection;
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
//          ParamByName('Sel1').AsInteger := strtoint(SelectLst.Items[icount]);
          ParamByName('Sel1').AsInteger := icount;
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TPBSalesInvRPrintFrm.BuildRange(sFirst: string; sLast: string);
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

Function TPBSalesInvRPrintFrm.IncrementNo(StartStr: String): String ;
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

procedure TPBSalesInvRPrintFrm.SelectionMemoKeyPress(Sender: TObject;
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

procedure TPBSalesInvRPrintFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      iIntSelCode := GetNextIntSelCode(Self) ;
      FActivated := true;
    end;
end;

procedure TPBSalesInvRPrintFrm.DelIntSelCode(iTempIntSelCode: Integer;
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

function TPBSalesInvRPrintFrm.GetNextIntSelCode(Sender: TObject): Integer;
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

procedure TPBSalesInvRPrintFrm.SetInvoicePrint(const Value: boolean);
begin
  FInvoicePrint := Value;
  if InvoicePrint then
    begin
      caption := 'Invoice Re-print selection';
      selectionGrp.caption := 'Invoice Number Selection';
    end
  else
    begin
      caption := 'Credit Note Re-print selection';
      selectionGrp.caption := 'Credit Note Number Selection';
    end;
end;

procedure TPBSalesInvRPrintFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  try
  with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Redeye', 'Invoice Print - Print Logo', 'N') = 'Y');
      chkbxShowZeroValues.Checked := (ReadString('Redeye', 'Invoice Print - Show Zero Values', 'N') = 'Y');
      chkbxAttachCSVFile.Checked := (ReadString('Redeye', 'Invoice Print - Attach CSV File', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;
  FEmailAttachment := TStringList.create;
  TEdit(selectionMemo).charcase := ecUpperCase;
end;

procedure TPBSalesInvRPrintFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  dmBroker.bEmailSent := false;
  try
    ClearEmailArray(Self);
    EmailReport(false);
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
    if (frmPBMainMenu.EmailApplication = 'GENERIC') and dmBroker.bEmailSent then
      begin
        messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
        close;
      end;
  end;
end;

procedure TPBSalesInvRPrintFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TPBSalesInvRPrintFrm.EmailReport(const bPreview: boolean);
var
  icount: integer;
  irow: integer;
  sTo, sSubject, sBodyText, sDescription, sSalutation: string;
  sSenderName, sSenderEmail, sRecipientName: string;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  PBEmailListFrm := TPBEmailListFrm.Create(Self);
  try
    PBEmailListFrm.CodeType := 'I';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
//      PBEmailListFrm.EmailListGrid.ColWidths[0] := 0;
      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 9];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 7];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];


      {Set up the Email Array with the Customer/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 4];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 2];
      PBEmailListFrm.EmailListGrid.Cells[6, icount] := EmailArray[icount, 2];
    end;
    if icount = 1 then
      PBEmailListFrm.EmailListGrid.RowCount := 2
    else
      PBEmailListFrm.EmailListGrid.RowCount := icount;

    PBEmailListFrm.Caption := 'Sales Invoice Customer List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Invoice';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.ShowModal;

    FEmailSent := false;

    {If OK to do the emailing then send all the emails}
    if PBEmailListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBEmailListFrm.EmailListGrid.Rowcount -1 do
      begin
        if Trim(PBEmailListFrm.EmailListGrid.cells[3, irow]) = '' then continue;

        PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
        try
          if chkbxShowZeroValues.checked then
            PBRPSalesInvFrm.ShowZeroValues := 'Y'
          else
            PBRPSalesInvFrm.ShowZeroValues := 'N';

          {Print all lines of credit note}
          if self.CreditNotePrint then
            PBRPSalesInvFrm.ShowZeroValues := 'Y';

          PBRPSalesInvFrm.bInvoice := InvoicePrint;
          PBRPSalesInvfrm.bPreview := bPreview;
          PBRPSalesInvfrm.bReprint := true;
          PBRPSalesInvfrm.bPrintLogo := true;

//          GetSelection; {Added this because I have no idea why after printing one set of invoices the Int_Sel table is cleared}
          InvRPrintSQL.Close;
          if InvoicePrint then
            InvRPrintSQL.SQL := qryInvEmail.SQL
          else
            InvRPrintSQL.SQL := qryCreditEmail.SQL;

          InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
          InvRPrintSQL.ParamBYName('Inv_To_Customer').AsInteger := StrToInt(EmailArray[irow,3]);
          InvRPrintSQL.ParamBYName('Inv_To_Branch').AsInteger := StrToInt(EmailArray[irow,4]);
          InvRPrintSQL.ParamBYName('Sales_Invoice_no').Asstring := EmailArray[irow,1];
          InvRPrintSQL.Open;

          if InvRPrintSQL.recordcount > 0 then
            begin
              PBRPSalesInvFrm.InvoiceReport.Dataset := InvRPrintSQL;
              PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'Sales_invoice';
              PBRPSalesInvFrm.InvHeadSRC.dataset := InvRPrintSQL;

              sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
              Printtoattachment(PBRPSalesInvFrm, sAttachmentType);

              if PBRPSalesInvFrm.bCustomerisReseller then
                ExportInvoice(PBRPSalesInvFrm, EmailArray[irow,1])
              else
              if chkbxAttachCSVFile.checked then
                ExportInvoiceToCSV(PBRPSalesInvFrm, EmailArray[irow,1]);

              FCustomerName := PBEmailListFrm.EmailListGrid.Cells[1, irow];

              sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
              sDescription := InvRPrintSQL.fieldbyName('Invoice_Description').Asstring;
              sSalutation := EmailArray[irow,10];

              sSenderName := frmPBMainMenu.sOperator_Name;
              sSenderEmail := frmPBMainMenu.sOperator_Email;

              sRecipientName := EmailArray[irow,5];

              if InvoicePrint then
                sSubject := 'Invoice: ' + EmailArray[irow,1]
              else
                sSubject := 'Credit Note:' + EmailArray[irow,1];

              sBodyText := dmBroker.GetEmailInvoiceText;
              if trim(sBodytext) = '' then
                sBodytext := 'Please find attached your ' + sSubject + '.'#13#10#13#10
                          +  'If you have any queries please contact me immediately'#13#10#13#10;

              {Replace the invoice number}
              if pos('<Number>', sBodytext) > 0 then
                begin
                  sBodytext := stringreplace(sBodytext, '<Number>', EmailArray[irow,1], [rfIgnoreCase])
                end;

              {Replace the Salutation}
              if pos('<Salutation>', sBodyText) > 0 then
                begin
                  if trim(sSalutation) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Salutation>', sSalutation, [rfIgnoreCase])
                  else
                    sBodyText := stringreplace(sBodyText, '<Salutation>', '', [rfIgnoreCase]);
                end;

              {Replace the contact name}
              if pos('<Contact Name>', sBodyText) > 0 then
                begin
                  if trim(EmailArray[irow,9]) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Contact Name>', EmailArray[irow,9], [rfIgnoreCase]);
                end;

              {Replace the description}
              if pos('<Description>', sBodyText) > 0 then
                  begin
                    sBodyText := stringreplace(sBodyText, '<Description>', sDescription, [rfIgnoreCase])
                  end;

              if frmPBMainMenu.EmailApplication = 'GENERIC' then
                {Send to Email database}
                dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
              else
                EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.InvoiceEmailAccount);
              FEmailSent := true;
            end;
        finally
          PBRPSalesInvfrm.Free;
        end;
      end;
    end;
  finally
    PBEmailListFrm.free;
  end;
end;

(*procedure TPBSalesInvRPrintFrm.EmailReport(const bPreview: boolean);
var
  sTemp, sSubject, sBodyText: string;
begin
  emailHandler := TemailHandler.Create(self);
  PBRPSalesInvfrm := TPBRPSalesInvfrm.Create(Self);
  try
    PBRPSalesInvFrm.bInvoice := InvoicePrint;
    PBRPSalesInvfrm.bPreview := bPreview;
    PBRPSalesInvfrm.bReprint := true;
    PBRPSalesInvfrm.bPrintLogo := true;

    GetSelection;
    InvRPrintSQL.Close;
    if not InvoicePrint then
      InvRPrintSQL.SQL := CrNoteRPrintSQL.SQL;

    InvRPrintSQL.ParamBYName('Int_sel').AsInteger := iIntselcode;
    InvRPrintSQL.Open;
    if InvRPrintSQL.recordCount = 0 then
  	  begin
        MessageDlg('No valid invoices in this selection',mterror,[mbOK],0);
        exit;
    	end
    else
      begin
        PBRPSalesInvFrm.InvoiceReport.Dataset := InvRPrintSQL;
        PBRPSalesInvFrm.InvoiceGroupHeader.Expression := 'Sales_invoice';
        PBRPSalesInvFrm.InvHeadSRC.dataset := InvRPrintSQL;
        sTemp := BuildQueryString;
        sSubject := dmBroker.GetCompanyName + ' - Invoice No: ' + SelectionMemo.text;
//        sSubject := inttostr(round(StrToFloatDef(memSelection.text)), 0, FormatSettings) + ' ' + edtCustomer.Text + ' ' + memDescription.text + ' - New Job';

        sBodyText := dmBroker.GetEmailInvoiceText;
        if trim(sBodytext) = '' then
          sBodytext := 'Please find attached your invoice: ' + SelectionMemo.text + '.'#13#10#13#10
                          +  'If you have any queries please contact me immediately'#13#10#13#10;

        emailHandler.Body := sBodyText;
        emailHandler.ccEmail := '';
        emailHandler.CreateEmail(PBRPSalesInvFrm.InvoiceReport, sTemp, 'SI'+stringreplace(SelectionMemo.text,'/','',[rfReplaceAll]), sSubject);
      end;
  finally
    PBRPSalesInvFrm.free;
    emailHandler.Free;
  end;
end;
*)

procedure TPBSalesInvRPrintFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with qryGetCustomers do
  begin
    Close;
    if InvoicePrint then
      SQL := GetInvCustSQL.SQL
    else
      SQL := GetCreditCustSQL.SQL;

    ParamBYName('Int_sel').AsInteger := iIntselcode;
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Sales_Invoice_no').AsString;
      EmailArray[irow, 2] := FieldByName('Contact_no').AsString;
      EmailArray[irow, 3] := FieldByName('Customer').AsString;
      EmailArray[irow, 4] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 5] := Trim(FieldByName('Customer_Name').AsString)+' '+Trim(FieldByName('Branch_name').AsString);
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('exportfilter_descr').AsString;
      EmailArray[irow, 8] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 9] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 10] := FieldByName('Salutation').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBSalesInvRPrintFrm.SelectionMemoChange(Sender: TObject);
begin
//  emailbitbtn.Enabled := (pos(',',selectionMemo.text) = 0) and (pos('-',selectionMemo.text) = 0);
end;

function TPBSalesInvRPrintFrm.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'AND Sales_Invoice.Sales_Invoice_no = ''' + SelectionMemo.text + '''';
  Result := sTemp
end;

procedure TPBSalesInvRPrintFrm.PrintToAttachment(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
var
  fileName: string;
begin
  if self.CreditNotePrint then
    fileName := 'SC' + tempcode else
    fileName := 'SI' + tempcode;
  TPrinterTools.New.PrintToAttachment(PBRPSalesInvFrm.InvoiceReport, FEmailAttachment, fileName, tempCode);
end;

(*
procedure TPBSalesInvRPrintFrm.PrintToAttachment(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
var
  i: integer;
  sLocation, sFileName: string;
  zLocation, zFileName: array[0..255] of char;
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

//  sFileName := 'SI'+tempCode;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'Si' + Enquiry Number + Random Number}
  if self.CreditNotePrint then
    sFileName := 'SC' + tempcode + '-' + sFilename
  else
    sFileName := 'SI' + tempcode + '-' + sFilename;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(RTFFilter);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(PDFFilter);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;
        PBRPSalesInvFrm.InvoiceReport.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        PBRPSalesInvFrm.InvoiceReport.Prepare;
 //       ExportToRTF(PBRPSalesInvFrm.InvoiceReport, sLocation + sFilename + '.bmp');
      PBRPSalesInvFrm.InvoiceReport.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPSalesInvFrm.InvoiceReport.QRPrinter.Free;
        PBRPSalesInvFrm.InvoiceReport.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

procedure TPBSalesInvRPrintFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Redeye', 'Invoice Print - Print Logo', 'Y')
      else
        WriteString('Redeye', 'Invoice Print - Print Logo', 'N');

      if chkbxShowZeroValues.checked then
        WriteString('Redeye', 'Invoice Print - Show Zero Values', 'Y')
      else
        WriteString('Redeye', 'Invoice Print - Show Zero Values', 'N');

      if chkbxAttachCSVFile.checked then
        WriteString('Redeye', 'Invoice Print - Attach CSV File', 'Y')
      else
        WriteString('Redeye', 'Invoice Print - Attach CSV File', 'N');
      Free;
    end;

  DelIntSelCode(iIntSelCode, True);
  FEmailAttachment.Free;
end;

procedure TPBSalesInvRPrintFrm.SetCreditNotePrint(const Value: boolean);
begin
  FCreditNotePrint := Value;
  self.chkbxShowZeroValues.Visible := not Value;
end;

procedure TPBSalesInvRPrintFrm.ExportInvoice(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
var
  sLocation, sFileName: string;
  zLocation, zFileName: array[0..255] of char;
  sDescription, tempStr: string;
  CSVFile: TextFile;
  rLineTotal, rResellerLineTotal, rLineMargin, rLineMarginPerc: real;
  rTotal, rResellerTotal, rMargin, rMarginPerc: real;
  iCount: integer;
begin
  sLocation := GetWinTempDir;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'Si' + Enquiry Number + Random Number}
  if self.CreditNotePrint then
    sFileName := 'SC' + tempcode + '-' + sFilename
  else
    sFileName := 'SI' + tempcode + '-' + sFilename;

  assignFile(CSVFile, sLocation + sFilename + '.csv');
  rewrite(CSVFile);

  tempstr := '';

  {write away the column headings}
  tempstr     := '"Account Number"'
              + ',"Invoice Date"'
              + ',"Invoice Number"'
              + ',"Line"'
              + ',"Description"'
              + ',"Quantity"'
              + ',"Invoice Price"'
              + ',"Reseller Price"'
              + ',"Price Unit"'
              + ',"Vat Rate"'
              + ',"Line Total"'
              + ',"Reseller Total"'
              + ',"Margin Value"'
              + ',"Margin %"';

  WriteLn(CSVFile, tempStr);

  with InvLineSQL do
    begin
      close;
      if chkbxShowZeroValues.checked then
        parambyname('Show_Zero_Values').asstring := 'Y'
      else
        parambyname('Show_Zero_Values').asstring := 'N';

      {Print all lines of credit note}
      if self.CreditNotePrint then
        parambyname('Show_Zero_Values').asstring := 'Y';

      parambyname('Sales_invoice_No').asstring := tempCode;
      open;

      rTotal := 0;
      rResellerTotal := 0;
      iCount := 0;
      
      while eof <> true do
      begin
        if fieldbyname('Price_Unit_Factor').asinteger = 0 then
          begin
            rLineTotal := fieldbyname('Goods_Value').asfloat;
            rResellerLineTotal := fieldbyname('Reseller_Price').asfloat;
          end
        else
          begin
            rLineTotal := (fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_Unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat;
            rResellerLineTotal := (fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_Unit_Factor').asinteger) * fieldbyname('Reseller_Price').asfloat;
          end;

        sDescription := '';
        if Assigned(PBRPSalesInvFrm) then
        begin
          if fieldbyname('Purchase_Order').asfloat <> 0 then
            begin
              sDescription := PBRPSalesInvFrm.GetPOLineDesc(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            end
          else
          if fieldbyname('Sales_Order').asinteger <> 0 then
            begin
              sDescription := PBRPSalesInvFrm.GetSOLineDesc(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_order_Line_no').asinteger);
            end
          else
            begin
              sDescription := PBRPSalesInvFrm.GetJBLineDesc(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            end;
        end;

        rLineMargin := rResellerLineTotal - rLineTotal;
        try
          rLineMarginPerc := ((rLineMargin/rLineTotal)*100);
        except
          rLineMarginPerc := 999.99;
        end;

        iCount := iCount + 1;
        tempStr := fieldbyname('End_User_Account_Code').asstring;
        tempStr := tempstr + ',' + fieldbyname('Invoice_Date').asstring;
        tempStr := tempstr + ',' + fieldbyname('Sales_invoice_no').asstring;
        tempStr := tempstr + ',' + inttostr(icount);
        tempStr := tempstr + ',' + stringreplace(sDescription,',','',[rfReplaceAll]);
        tempStr := tempStr + ',' + fieldbyname('Qty_Invoiced').asstring;
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.0000',fieldbyname('Goods_Value').asfloat) + '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.0000',fieldbyname('Reseller_Price').asfloat)+ '"';
        tempStr := tempStr + ',' + fieldbyname('Sales_Unit_Desc').asstring;
        tempStr := tempStr + ',' + formatfloat('0.00%',fieldbyname('Vat_Rate').asfloat);
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rLineTotal)+ '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rResellerLineTotal)+ '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rLineMargin)+ '"';
        tempStr := tempStr + ',' + formatfloat('0.00%',rLineMarginPerc);

        WriteLn(CSVFile, tempStr);

        {Recalculate line totals to add to invoice totals}
        rResellerLineTotal := StrToFloatDef(formatfloat('##0.00',rResellerLineTotal), 0, FormatSettings);
        rLineTotal := StrToFloatDef(formatfloat('##0.00',rLineTotal), 0, FormatSettings);

        rTotal := rTotal + rLineTotal;
        rResellerTotal := rResellerTotal + rResellerLineTotal;

        next;
      end;
    end;

  rMargin := rResellerTotal - rTotal;
  try
    rMarginPerc := ((rMargin/rTotal)*100);
  except
    rMarginPerc := 999.99;
  end;

  {write away blank line}
  tempstr     := '""';
  WriteLn(CSVFile, tempStr);

  {write away the Company Totals}
  tempstr     := '"' + '","' + '","' + '","' + '","' + '","'+ '","'+ 'Totals' + '","' + '","' + '","' + '","' + formatfloat('£#,##0.00',rTotal) + '","' + formatfloat('£#,##0.00',rResellerTotal)
              + '","' + formatfloat('£#,##0.00',rMargin) + '","' + formatfloat('#,##0.00%',rMarginPerc) + '"';
  WriteLn(CSVFile, tempStr);

  FEmailAttachment.add(sLocation + sFilename + '.csv');
  CloseFile(CSVFile);
end;

procedure TPBSalesInvRPrintFrm.ExportInvoiceToCSV(PBRPSalesInvFrm: TPBRPSalesInvFrm; tempCode: string);
var
  sLocation, sFileName: string;
  zLocation, zFileName: array[0..255] of char;
  sProductTypeDescription, sSupplierName, sCostUnit, sDescription, sOrderDate, tempStr: string;
  CSVFile: TextFile;
  rLineTotal, rResellerLineTotal, rLineMargin, rLineMarginPerc: real;
  rTotal, rResellerTotal, rMargin, rMarginPerc, rCostPrice, rTotalCost: real;
  iCount: integer;
  iPriceUnitFactor: integer;
begin
  sLocation := GetWinTempDir;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'Si' + Enquiry Number + Random Number}
  if self.CreditNotePrint then
    sFileName := 'SC' + tempcode + '-' + sFilename
  else
    sFileName := 'SI' + tempcode + '-' + sFilename;

  assignFile(CSVFile, sLocation + sFilename + '.csv');
  rewrite(CSVFile);

  tempstr := '';

  {write away the column headings}
  tempstr     := '"Customer"'
              + ',"Account Code"'
              + ',"Customer Order Ref"'
              + ',"Project Name"'
              + ',"Job Number"'
              + ',"Redeye Invoice Number"'
              + ',"Order Date"'
              + ',"Invoice Date"'
              + ',"Order Track Number"'
              + ',"Supplier"'
              + ',"PO Number"'
              + ',"PO Quantity"'
              + ',"Cost Unit"'
              + ',"Unit Cost"'
              + ',"Total Cost"'
              + ',"Line No"'
              + ',"Product"'
              + ',"Description"'
              + ',"Quantity"'
              + ',"Price Unit"'
              + ',"Unit Price"'
              + ',"Invoice Price"'
              + ',"Vat Rate"';

  WriteLn(CSVFile, tempStr);

  with InvLineCSVSQL do
    begin
      close;
      if chkbxShowZeroValues.checked then
        parambyname('Show_Zero_Values').asstring := 'Y'
      else
        parambyname('Show_Zero_Values').asstring := 'N';

      {Print all lines of credit note}
      if self.CreditNotePrint then
        parambyname('Show_Zero_Values').asstring := 'Y';

      parambyname('Sales_invoice_No').asstring := tempCode;
      open;

      rTotal := 0;
      rResellerTotal := 0;
      iCount := 0;

      while eof <> true do
      begin
        if fieldbyname('Price_Unit_Factor').asinteger = 0 then
          begin
            rLineTotal := fieldbyname('Goods_Value').asfloat;
//            rResellerLineTotal := fieldbyname('Reseller_Price').asfloat;
          end
        else
          begin
            rLineTotal := (fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_Unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat;
//            rResellerLineTotal := (fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_Unit_Factor').asinteger) * fieldbyname('Reseller_Price').asfloat;
          end;

        sOrderDate := '';

        if fieldbyname('Purchase_Order').asfloat <> 0 then
          begin
            sDescription := PBRPSalesInvFrm.GetPOLineDesc(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            sSupplierName := GetPOSupplier(fieldbyname('Purchase_Order').asfloat);
            sCostUnit := GetPOCostUnit(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            iPriceUnitFactor := GetPOPriceUnitFactor(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            rCostPrice := fieldbyname('Order_Price').asfloat;
            sProductTypeDescription := GetPOProductType(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            sOrderDate := GetPODate(fieldbyname('Purchase_Order').asfloat);
          end
        else
        if fieldbyname('Sales_Order').asinteger <> 0 then
          begin
            sDescription := PBRPSalesInvFrm.GetSOLineDesc(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_order_Line_no').asinteger);
            sSupplierName := GetJBSupplier(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sCostUnit := GetJBCostUnit(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            iPriceUnitFactor := GetJBPriceUnitFactor(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            rCostPrice := GetJBUnitCost(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sProductTypeDescription := GetJBProductType(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
          end
        else
          begin
            sDescription := PBRPSalesInvFrm.GetJBLineDesc(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sSupplierName := GetJBSupplier(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sCostUnit := GetJBCostUnit(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            iPriceUnitFactor := GetJBPriceUnitFactor(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            rCostPrice := GetJBUnitCost(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sProductTypeDescription := GetJBProductType(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
          end;

        if iPriceUnitFactor = 0 then
          begin
            rTotalCost := rCostPrice;
          end
        else
          begin
            rTotalCost := (fieldbyname('Qty_Invoiced').asinteger/iPriceUnitFactor) * rCostPrice;
          end;

        rLineMargin := rResellerLineTotal - rLineTotal;
        try
          rLineMarginPerc := ((rLineMargin/rLineTotal)*100);
        except
          rLineMarginPerc := 999.99;
        end;

        iCount := iCount + 1;
        tempStr := fieldbyname('Customer_Name').asstring;
        tempStr := tempstr + ',' + fieldbyname('Account_Code').asstring;
        tempStr := tempstr + ',' + fieldbyname('Cust_Order_No').asstring;
        tempStr := tempstr + ',' + fieldbyname('Invoice_Description').asstring;
        tempStr := tempstr + ',' + fieldbyname('Job_Reference').asstring;
        tempStr := tempstr + ',' + fieldbyname('Sales_Invoice_No').asstring;
        tempStr := tempstr + ',' + sOrderDate;
        tempStr := tempstr + ',' + fieldbyname('Invoice_Date').asstring;
        tempStr := tempstr + ',' + fieldbyname('Purchase_Order').asstring;
        tempStr := tempstr + ',' + sSupplierName;
        tempStr := tempstr + ',' + fieldbyname('Alt_Purchase_Order').asstring;
        tempStr := tempStr + ',' + fieldbyname('Qty_Invoiced').asstring;
        tempStr := tempstr + ',' + sCostUnit;
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rCostPrice)+ '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rTotalCost)+ '"';
        tempStr := tempstr + ',' + inttostr(icount);
        tempStr := tempstr + ',' + sProductTypeDescription;
        tempStr := tempstr + ',' + stringreplace(sDescription,',','',[rfReplaceAll]);
        tempStr := tempStr + ',' + fieldbyname('Qty_Invoiced').asstring;
        tempStr := tempStr + ',' + fieldbyname('Sales_Unit_Desc').asstring;
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.0000',fieldbyname('Goods_Value').asfloat) + '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rLineTotal)+ '"';
        tempStr := tempStr + ',' + formatfloat('0.00%',fieldbyname('Vat_Rate').asfloat);

        WriteLn(CSVFile, tempStr);

        {Recalculate line totals to add to invoice totals}
        rLineTotal := StrToFloatDef(formatfloat('##0.00',rLineTotal), 0, FormatSettings);

        rTotal := rTotal + rLineTotal;
        next;
      end;
    end;

(*  rMargin := rResellerTotal - rTotal;
  try
    rMarginPerc := ((rMargin/rTotal)*100);
  except
    rMarginPerc := 999.99;
  end;

  {write away blank line}
  tempstr     := '""';
  WriteLn(CSVFile, tempStr);

  {write away the Company Totals}
  tempstr     := '"' + '","' + '","' + '","' + '","' + '","'+ '","'+ 'Totals' + '","' + '","' + '","' + '","' + formatfloat('£#,##0.00',rTotal) + '","' + formatfloat('£#,##0.00',rResellerTotal)
              + '","' + formatfloat('£#,##0.00',rMargin) + '","' + formatfloat('#,##0.00%',rMarginPerc) + '"';

  WriteLn(CSVFile, tempStr);
*)
  FEmailAttachment.add(sLocation + sFilename + '.csv');
  CloseFile(CSVFile);
end;

procedure TPBSalesInvRPrintFrm.ExportAllInvoicesToCSV;
var
  sTo, sSubject, sBodyText, sLocation, sFileName: string;
  zLocation, zFileName: array[0..255] of char;
  sProductTypeDescription, sSupplierName, sCostUnit, sDescription, sOrderDate, tempStr: string;
  CSVFile: TextFile;
  rLineTotal, rResellerLineTotal, rLineMargin, rLineMarginPerc: real;
  rTotal, rResellerTotal, rMargin, rMarginPerc, rCostPrice, rTotalCost: real;
  iCount: integer;
  iPriceUnitFactor: integer;
  tempCode: string;
begin
  sLocation := GetWinTempDir;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  tempCode := 'REDEYE';

  {Format is 'Si' + Enquiry Number + Random Number}
  if self.CreditNotePrint then
    sFileName := 'SC' + tempcode + '-' + sFilename
  else
    sFileName := 'SI' + tempcode + '-' + sFilename;

  assignFile(CSVFile, sLocation + sFilename + '.csv');
  rewrite(CSVFile);

  tempstr := '';

  {write away the column headings}
  tempstr     := '"Customer"'
              + ',"Account Code"'
              + ',"Customer Order Ref"'
              + ',"Project Name"'
              + ',"Job Number"'
              + ',"Redeye Invoice Number"'
              + ',"Order Date"'
              + ',"Invoice Date"'
              + ',"Order Track Number"'
              + ',"Supplier"'
              + ',"PO Number"'
              + ',"PO Quantity"'
              + ',"Cost Unit"'
              + ',"Unit Cost"'
              + ',"Total Cost"'
              + ',"Line No"'
              + ',"Product"'
              + ',"Description"'
              + ',"Quantity"'
              + ',"Price Unit"'
              + ',"Unit Price"'
              + ',"Invoice Price"'
              + ',"Vat Rate"';

  WriteLn(CSVFile, tempStr);

  with InvCSVSQL do
    begin
      close;
      if chkbxShowZeroValues.checked then
        parambyname('Show_Zero_Values').asstring := 'Y'
      else
        parambyname('Show_Zero_Values').asstring := 'N';

      {Print all lines of credit note}
      if self.CreditNotePrint then
        parambyname('Show_Zero_Values').asstring := 'Y';

      parambyname('Int_Sel').asinteger := iIntSelCode;
      open;

      rTotal := 0;
      rResellerTotal := 0;
      iCount := 0;

      PBRPSalesInvFrm := TPBRPSalesInvFrm.create(self);

      try
      while eof <> true do
      begin
        if fieldbyname('Price_Unit_Factor').asinteger = 0 then
          begin
            rLineTotal := fieldbyname('Goods_Value').asfloat;
          end
        else
          begin
            rLineTotal := (fieldbyname('Qty_Invoiced').asinteger/fieldbyname('Price_Unit_Factor').asinteger) * fieldbyname('Goods_Value').asfloat;
          end;

        sOrderDate := '';

        if fieldbyname('Purchase_Order').asfloat <> 0 then
          begin
            sDescription := PBRPSalesInvFrm.GetPOLineDesc(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            sSupplierName := GetPOSupplier(fieldbyname('Purchase_Order').asfloat);
            sCostUnit := GetPOCostUnit(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            iPriceUnitFactor := GetPOPriceUnitFactor(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            rCostPrice := fieldbyname('Order_Price').asfloat;
            sProductTypeDescription := GetPOProductType(fieldbyname('Purchase_Order').asfloat, fieldbyname('Line').asinteger);
            sOrderDate := GetPODate(fieldbyname('Purchase_Order').asfloat);
          end
        else
        if fieldbyname('Sales_Order').asinteger <> 0 then
          begin
            sDescription := PBRPSalesInvFrm.GetSOLineDesc(fieldbyname('Sales_Order').asinteger, fieldbyname('Sales_order_Line_no').asinteger);
            sSupplierName := GetJBSupplier(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sCostUnit := GetJBCostUnit(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            iPriceUnitFactor := GetJBPriceUnitFactor(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            rCostPrice := GetJBUnitCost(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sProductTypeDescription := GetJBProductType(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
          end
        else
          begin
            sDescription := PBRPSalesInvFrm.GetJBLineDesc(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sSupplierName := GetJBSupplier(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sCostUnit := GetJBCostUnit(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            iPriceUnitFactor := GetJBPriceUnitFactor(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            rCostPrice := GetJBUnitCost(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
            sProductTypeDescription := GetJBProductType(fieldbyname('Job_Bag').asinteger, fieldbyname('Job_Bag_Line').asinteger);
          end;

        if iPriceUnitFactor = 0 then
          begin
            rTotalCost := rCostPrice;
          end
        else
          begin
            rTotalCost := (fieldbyname('Qty_Invoiced').asinteger/iPriceUnitFactor) * rCostPrice;
          end;

        rLineMargin := rResellerLineTotal - rLineTotal;
        try
          rLineMarginPerc := ((rLineMargin/rLineTotal)*100);
        except
          rLineMarginPerc := 999.99;
        end;

        iCount := iCount + 1;
        tempStr := fieldbyname('Customer_Name').asstring;
        tempStr := tempstr + ',' + fieldbyname('Account_Code').asstring;
        tempStr := tempstr + ',' + fieldbyname('Cust_Order_No').asstring;
        tempStr := tempstr + ',' + fieldbyname('Invoice_Description').asstring;
        tempStr := tempstr + ',' + fieldbyname('Job_Reference').asstring;
        tempStr := tempstr + ',' + fieldbyname('Sales_Invoice_no').asstring;
        tempStr := tempstr + ',' + sOrderDate;
        tempStr := tempstr + ',' + fieldbyname('Invoice_Date').asstring;
        tempStr := tempstr + ',' + fieldbyname('Purchase_Order').asstring;
        tempStr := tempstr + ',' + sSupplierName;
        tempStr := tempstr + ',' + fieldbyname('Alt_Purchase_Order').asstring;
        tempStr := tempStr + ',' + fieldbyname('Qty_Invoiced').asstring;
        tempStr := tempstr + ',' + sCostUnit;
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rCostPrice)+ '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rTotalCost)+ '"';
//        tempStr := tempstr + ',' + inttostr(icount);
        tempStr := tempstr + ',' + fieldbyname('Invoice_Line_no').asstring;
        tempStr := tempstr + ',' + sProductTypeDescription;
        tempStr := tempstr + ',' + stringreplace(sDescription,',','',[rfReplaceAll]);
        tempStr := tempStr + ',' + fieldbyname('Qty_Invoiced').asstring;
        tempStr := tempStr + ',' + fieldbyname('Sales_Unit_Desc').asstring;
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.0000',fieldbyname('Goods_Value').asfloat) + '"';
        tempStr := tempStr + ',' + '"' + formatfloat('£#,##0.00',rLineTotal)+ '"';
        tempStr := tempStr + ',' + formatfloat('0.00%',fieldbyname('Vat_Rate').asfloat);

        WriteLn(CSVFile, tempStr);

        {Recalculate line totals to add to invoice totals}
        rLineTotal := StrToFloatDef(formatfloat('##0.00',rLineTotal), 0, FormatSettings);

        rTotal := rTotal + rLineTotal;
        next;
      end;
      finally
        PBRPSalesInvFrm.free;
      end;
    end;

  FEmailAttachment.add(sLocation + sFilename + '.csv');
  CloseFile(CSVFile);

  sTo := dmBroker.GetGlobalInvoiceEmail;
  
  if InvoicePrint then
    sSubject := 'Invoices'
  else
    sSubject := 'Credit Notes';

  sBodytext := 'Please find attached your ' + sSubject + '.'#13#10#13#10
                          +  'If you have any queries please contact me immediately'#13#10#13#10;

  EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.InvoiceEmailAccount);
  FEmailSent := true;

//  self.OleContainer1.CreateLinkToFile(sLocation + sFilename + '.csv', false);
//  self.OleContainer1.DoVerb(0);

end;

function TPBSalesInvRPrintFrm.GetPODate(tempCode: real): string;
begin
  Result := '';
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      open;

      Result := pbdatestr(fieldbyname('Date_Point').asdatetime);
    end;
end;

function TPBSalesInvRPrintFrm.GetPOSupplier(tempCode: real): string;
begin
  Result := '';
  with qryPO do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      open;

      Result := fieldbyname('Supplier_Name').asstring;
    end;
end;

function TPBSalesInvRPrintFrm.GetPOCostUnit(tempCode: real; tempLine: integer): string;
begin
  Result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Cost_Unit_Description').asstring;
    end;
end;

function TPBSalesInvRPrintFrm.GetPOPriceUnitFactor(tempCode: real; tempLine: integer): integer;
begin
  Result := 0;
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TPBSalesInvRPrintFrm.GetPOProductType(tempCode: real; tempLine: integer): string;
begin
  Result := '';
  with qryPOLine do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      parambyname('Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Product_type_Description').asstring;
    end;
end;

function TPBSalesInvRPrintFrm.GetJBSupplier(tempCode, tempLine: integer): string;
begin
  Result := '';
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Supplier_Name').asstring;
    end;
end;

function TPBSalesInvRPrintFrm.GetJBCostUnit(tempCode, tempLine: integer): string;
begin
  Result := '';
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Cost_unit_Description').asstring;
    end;
end;

function TPBSalesInvRPrintFrm.GetJBPriceUnitFactor(tempCode, tempLine: integer): integer;
begin
  Result := 0;
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Price_Unit_Factor').asinteger;
    end;
end;

function TPBSalesInvRPrintFrm.GetJBUnitCost(tempCode, tempLine: integer): real;
begin
  Result := 0.00;
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Unit_Cost').asfloat;
    end;
end;

function TPBSalesInvRPrintFrm.GetJBProductType(tempCode, tempLine: integer): string;
begin
  Result := '';
  with qryJBLine do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempCode;
      parambyname('Job_Bag_Line').asinteger := tempLine;
      open;

      Result := fieldbyname('Product_Type_Description').asstring;
    end;
end;

procedure TPBSalesInvRPrintFrm.BitBtn1Click(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  try
    ClearEmailArray(Self);
    GetSelection;

    self.ExportAllInvoicesToCSV;
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;

end;

end.
