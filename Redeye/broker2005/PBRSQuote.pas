unit PBRSQuote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Inifiles, PBRPQuote,
  CCSCommon, QrExport,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBRSQuote = class(TForm)
    pnlButtons: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    FaxBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    EstNumLabel: TLabel;
    memSelection: TMemo;
    Label1: TLabel;
    edtCustomer: TMemo;
    Label2: TLabel;
    memDescription: TMemo;
    SelectLst: TListBox;
    qryGetRange: TFDQuery;
    qryGetQuote: TFDQuery;
    Label3: TLabel;
    memQuantity: TMemo;
    chkbxShowDetails: TCheckBox;
    qryBlank: TFDQuery;
    chkbxEndUser: TCheckBox;
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure rdgReportTypeClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FEmailAttachment : TstringList;
    iIntselcode: integer;
    sAttachmentType: string;
    procedure RunReport(Preview: boolean);
    procedure FaxReport;
    procedure EmailReport(Preview: boolean);
    procedure ClearFaxArray(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure GetSelection;
    function BuildQueryString: string;
    procedure BuildEmailDetails;
    procedure ClearEmailArray(Sender: TObject);
    procedure LoadAndEmailReport;
    procedure PrintToAttachment(frmPBRQuote: TfrmPBRPQuote;
      tempCode: string; EndUser: boolean);
    { Private declarations }
  public
    bProspect: boolean;
  end;

var
  frmPBRSQuote: TfrmPBRSQuote;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses
  pbDatabase, PBFaxList, PBSendFax, CCSemailHandler,
  pbMainMenu, PBEmailList, Printer.Tools;

{$R *.dfm}

const
  SQLCore =
  'SELECT Quote.Quote, '+
	'   Customer_Contact.Customer,  '+
	'   Customer_Contact.Branch_no,  '+
	'   Customer_Contact.Contact_no,  '+
	'   Quote.Customer_Name,  '+
	'   Customer_Branch.Name as Branch_Name,  '+
	'   Customer_Contact.Name as Contact_Name,  '+
	'   Customer_Contact.Email,  '+
	'   Customer_Contact.Salutation,  '+
	'   ExportFilter.Description as exportfilter_descr,  '+
	'   Customer_Contact.ExportFilter,  '+
	'   '' '' as CC_EMail  '+
  'FROM ExportFilter RIGHT JOIN ((Customer_Branch  '+
	'   INNER JOIN Quote ON  '+
	'   (Customer_Branch.Branch_no = Quote.Branch_No) AND  '+
	'   (Customer_Branch.Customer = Quote.Customer))  '+
	'   INNER JOIN Customer_Contact ON  '+
	'   (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND  '+
	'   (Customer_Branch.Customer = Customer_Contact.Customer)) ON  '+
	'   ExportFilter.ExportFilter = Customer_Contact.ExportFilter  '+
  'WHERE (Quote.Contact_no = Customer_Contact.contact_no) ';

  SQLCoreProspect =
  'SELECT Quote.Quote, '+
	'   Quote.Customer,  '+
	'   Quote.Branch_no,  '+
	'   Quote.Contact_no,  '+
	'   Quote.Customer_Name,  '+
	'   '' as Branch_Name,  '+
	'   Quote.Contact_Name as Contact_Name,  '+
	'   Quote.Email,  '+
	'   '' '' as Salutation,  '+
	'   ''Adobe Acrobat Document (*.pdf)'' as exportfilter_descr,  '+
	'   ''PDF'' as ExportFilter,  '+
	'   '' '' as CC_EMail  '+
  'FROM Quote '+
  'WHERE 1=1 ';

procedure TfrmPBRSQuote.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TfrmPBRSQuote.RunReport(Preview: boolean);
begin
  frmPBRPQuote := TfrmPBRPQuote.create(self);
  try
    frmPBRPQuote.Key := strtofloat(memSelection.text);
    frmPBRPQuote.bPrintLogo := true;
    frmPBRPQuote.ShowBreakdown := chkbxShowDetails.Checked;
    frmPBRPQuote.EndUserVersion := chkbxEndUSer.checked;

    if (frmPBRPQuote.GetDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        if not Preview then
          begin
            frmPBRPQuote.bPreview := false;
            frmPBRPQuote.qrpDetails.PrinterSetup;
            if frmPBRPQuote.qrpDetails.tag = 0 then
              frmPBRPQuote.qrpDetails.Print;
          end
        else
          begin
            frmPBRPQuote.bPreview := true;
            frmPBRPQuote.qrpDetails.Preview;

          end;
      end;
  finally
    frmPBRPQuote.free;
  end;
end;

procedure TfrmPBRSQuote.EmailReport(Preview: boolean);
var
  sTemp, sSubject, sBodyText, sSalutation, sContactName, sPrefix: string;
begin
  emailHandler := TemailHandler.Create(self);
  frmPBRPQuote := TfrmPBRPQuote.create(self);
  try
    frmPBRPQuote.key := strtofloat(memSelection.text);
    frmPBRPQuote.EndUserVersion := chkbxEndUser.checked;

    if (frmPBRPQuote.GetDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
    else
      begin
        frmPBRPQuote.bPreview := false;
        frmPBRPQuote.bPrintLogo := true;
        frmPBRPQuote.ShowBreakdown := chkbxShowDetails.Checked;

        sTemp := BuildQueryString;

        with qryBlank do
          begin
            close;
            sql.Text := sTemp;
            open;
            sSalutation := fieldbyname('Salutation').asstring;
            sContactName := fieldbyname('Name').asstring;
          end;

        sSubject := 'Quote: ' + memSelection.text + ', ' + memDescription.text;

        sBodyText := dmBroker.GetEmailQuotationText;

        if trim(sBodyText) = '' then
                sBodyText := 'Please find attached, quotation ' + memSelection.text + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;


        {Replace the Quote number}
        if pos('<Number>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Number>', memSelection.text, [rfIgnoreCase])
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
              if trim(sContactName) <> '' then
                sBodyText := stringreplace(sBodyText, '<Contact Name>', trim(sContactName), [rfIgnoreCase]);
            end;

        {Replace the description}
        if pos('<Description>', sBodyText) > 0 then
            begin
              sBodyText := stringreplace(sBodyText, '<Description>', memDescription.text, [rfIgnoreCase])
            end;
        if chkbxEndUser.checked then
          sPrefix := 'RSP'
        else
          sPrefix := 'QUOTE';

        emailHandler.Body := sBodyText;
        emailHandler.CreateEmail(frmPBRPQuote.qrpDetails, sTemp, sPrefix+memSelection.text, sSubject);
      end;
  finally
    frmPBRPQuote.free;
    emailHandler.Free;
  end;
end;

function TfrmPBRSQuote.BuildQueryString: string;
var
  sTemp: string;
begin
  if bProspect then
    stemp := SQLCoreProspect
  else
    sTemp := SQLCore;

  sTemp := sTemp + 'AND Quote.Quote = ' + memSelection.text;
  Result := sTemp
end;

procedure TfrmPBRSQuote.FaxReport;
var
  faxfound: boolean;
  icount, irow: integer;
begin
  ClearFaxArray(Self);

  dmBroker.DelIntSelCode(iIntSelCode, True);
  GetSelection;

  BuildFaxDetails;

  PBFaxListFrm := TPBFaxListFrm.Create(Self);
  try
    for icount := 1 to 100 do
      begin
        if FaxArray[icount, 1] = '' then Break;
        PBFaxListFrm.FaxListGrid.ColWidths[0] := 0;
        PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
        PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
      end;

    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'Quote Print - Fax List';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer';
    PBFaxListFrm.ShowModal;

    {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
      begin
        for irow := 1 to PBFaxListFrm.FaxlistGrid.Rowcount -1 do
          begin
            if Trim(PBFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;

            frmPBRPQuote := TfrmPBRPQuote.Create(Self);
            try
              frmPBRPQuote.bPreview := true;

              frmPBRPQuote.key := strtoint(memSelection.text);

              if (frmPBRPQuote.GetDetails = 0) then
                begin
                  MessageDlg('There are no Quotes to fax', mtError, [mbAbort], 0);
                  exit;
                end;

              FaxFound := PBSendFaxFrm.OutToFax(PBFaxListFrm.FaxListGrid.cells[2,irow],
                    'Q'+ FaxArray[irow,1] + ' to '+ FaxArray[irow,4], '');
              if (not FaxFound) then
                MessageDlg('The fax driver is not installed', mtError, [mbok], 0)
              else
                begin
                  frmPBRPQuote.qrpDetails.ShowProgress := false;
//                  frmPBRPQuote.qrpDetails.PrinterSettings.PrinterIndex := FaxFound;
                  frmPBRPQuote.qrpDetails.Print;
                  PBSendFaxFrm.WaitForFaxFinish(Self) ;
                end;
            finally
              frmPBRPQuote.free;
            end;
          end;
      end;
  finally
    PBFaxListFrm.free;
  end;
end;

procedure TfrmPBRSQuote.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false)
end;

procedure TfrmPBRSQuote.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dmBroker.DelIntSelCode(iIntSelCode, True);
  BuildSelection;
  if SelectLst.Items.Count > 100 then
    begin
      MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
      memSelection.Clear;
      memSelection.SetFocus;
    end;
   for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant quote number}
        if SelectLst.Items[icount] = '' then continue;

       	with dmBroker.AddIntSelQuery do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := strtoFloat(SelectLst.Items[icount]);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TfrmPBRSQuote.BuildSelection;
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

procedure TfrmPBRSQuote.BuildRange(sFirst, sLast: string);
begin
 	with qryGetRange do
    begin
      Close;
      ParamByName('From_Quote').AsFloat := StrtoFloat(sFirst);
      ParamByName('To_Quote').AsFloat := StrtoFloat(sLast);
      Open;
      First;
      While Not EOF do
        begin
          SelectLst.Items.Add(FloatToStr(FieldByName('Quote').AsFloat));
          Next;
        end;
    end;
end;

procedure TfrmPBRSQuote.BuildFaxDetails;
var
  irow: Integer;
begin
  with qryGetQuote do
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
      if FieldByName('Is_Retail_Customer').AsString = 'Y' then
        FaxArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        FaxArray[irow, 5] := FieldByName('Customer_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TfrmPBRSQuote.FormActivate(Sender: TObject);
begin
  iIntselcode := dmBroker.GetNextIntSelCode(Self);
end;

procedure TfrmPBRSQuote.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  try
    ClearEmailArray(Self);
//  EmailReport(false);
    LoadandEmailReport;
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
  close;
end;

procedure TfrmPBRSQuote.rdgReportTypeClick(Sender: TObject);
begin
  emailbitbtn.Enabled := ((Sender as TRadioGroup).itemindex = 1);
end;

procedure TfrmPBRSQuote.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmPBRSQuote.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sShowDetails: string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      sShowDetails := ReadString('Quoting', 'Show Quote Cost Breakdown', 'None');
    end;

  if (sShowDetails = 'None') or (sShowDetails = 'N') then
    chkbxShowDetails.checked := false
  else
    chkbxShowDetails.checked := true;

  FEmailAttachment := TStringList.create;
end;

procedure TfrmPBRSQuote.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sShowDetails: string;
begin
  if chkbxShowDetails.checked then
    sShowDetails := 'Y'
  else
    sShowDetails := 'N';

  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      WriteString('Quoting', 'Show Quote Cost Breakdown', sShowDetails);
      Free;
    end;
  FEmailAttachment.Free;
end;

procedure TfrmPBRSQuote.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TfrmPBRSQuote.BuildEmailDetails;
var
  irow: Integer;
  sTemp: string;
begin
  with qryBlank do
  begin
    Close;
    if bProspect then
      stemp := SQLCoreProspect
    else
      sTemp := SQLCore;

    sTemp := sTemp + 'AND Quote.Quote = ' + memSelection.text;
    SQL.Add(sTemp);
    Open;

    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Quote').AsString;
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

procedure TfrmPBRSQuote.LoadAndEmailReport;
var
  icount: integer;
  irow: integer;
  sTo, sSubject, sBodyText, sDescription, sSalutation: string;
  sSenderName, sSenderEmail, sRecipientName, sContactName, sPrefix: string;
begin
  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the customer invocies send an email}
  PBEmailListFrm := TPBEmailListFrm.Create(Self);
  try
    PBEmailListFrm.CodeType := 'I';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 3] = '' then Break;
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
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'ID';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.ShowModal;
    {If OK to do the emailing then send all the emails}
    if PBEmailListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBEmailListFrm.EmailListGrid.Rowcount -1 do
      begin
        if Trim(PBEmailListFrm.EmailListGrid.cells[3, irow]) = '' then continue;

        frmPBRPQuote := TfrmPBRPQuote.Create(Self);
        try
          frmPBRPQuote.Key := strtofloat(memSelection.text);
          frmPBRPQuote.bPreview := false;
          frmPBRPQuote.bPrintLogo := true;
          frmPBRPQuote.ShowBreakdown := chkbxShowDetails.Checked;
          frmPBRPQuote.EndUserVersion := false;

          if (frmPBRPQuote.GetDetails > 0) then
            begin
              sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];

              FEmailAttachment.clear;

              Printtoattachment(frmPBRPQuote, EmailArray[irow,1], false);

              if chkbxEndUser.checked then
                begin
                  frmPBRPQuote.EndUserVersion := true;
                  Printtoattachment(frmPBRPQuote, EmailArray[irow,1], true);
                end;

              sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
              sSalutation := EmailArray[irow,10];
              sContactName := EmailArray[irow,9];

              sSenderName := frmPBMainMenu.sOperator_Name;
              sSenderEmail := frmPBMainMenu.sOperator_Email;

              sRecipientName := EmailArray[irow,5];

              sSubject := 'Quote: ' + memSelection.text + ', ' + memDescription.text;

              sBodyText := dmBroker.GetEmailQuotationText;

              if trim(sBodyText) = '' then
                sBodyText := 'Please find attached, quotation ' + memSelection.text + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;


              {Replace the Quote number}
              if pos('<Number>', sBodyText) > 0 then
                begin
                    sBodyText := stringreplace(sBodyText, '<Number>', memSelection.text, [rfIgnoreCase])
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
                  if trim(sContactName) <> '' then
                    sBodyText := stringreplace(sBodyText, '<Contact Name>', trim(sContactName), [rfIgnoreCase]);
                end;

              {Replace the description}
              if pos('<Description>', sBodyText) > 0 then
                begin
                  sBodyText := stringreplace(sBodyText, '<Description>', memDescription.text, [rfIgnoreCase])
                end;

              if frmPBMainMenu.EmailApplication = 'GENERIC' then
                {Send to Email database}
                dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
              else
                EmailViaOutlook(sTo,sSubject,sBodyText, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.InvoiceEmailAccount);
            end;
        finally
          frmPBRPQuote.Free;
        end;
      end;
    end;
  finally
    PBEmailListFrm.free;
  end;
end;

procedure TfrmPBRSQuote.PrintToAttachment(frmPBRQuote: TfrmPBRPQuote; tempCode: string; EndUser: boolean);
var
  fileName: string;
begin
  if EndUser then
    fileName := 'RSP' + tempcode else
    fileName := 'QUOTE' + tempcode;
  PrinterTools.New.PrintToAttachment(frmPBRQuote.qrpDetails, FEmailAttachment, fileName, tempCode);
end;

(* GDK ToDo: remove after tests
procedure TfrmPBRSQuote.PrintToAttachment(frmPBRQuote: TfrmPBRPQuote; tempCode: string; EndUser: boolean);
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
  sLocation := GetWinTempDir;

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'Si' + Enquiry Number + Random Number}
  if EndUser then
    sFileName := 'RSP' + tempcode + '-' + sFilename
  else
    sFileName := 'QUOTE' + tempcode + '-' + sFilename;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      try
        frmPBRPQuote.qrpDetails.Prepare;

//        sFileName := 'SI'+frmPBRPQuote.InvoiceNumberlbl.caption;
        FEmailAttachment.add(sLocation + sFilename + '.rtf');
        RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[pred(FEmailAttachment.Count)]);

        frmPBRPQuote.qrpDetails.ExportToFilter(RTFFilter);
      finally
        frmPBRPQuote.qrpDetails.QRPrinter.Free;
        frmPBRPQuote.qrpDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      try
        frmPBRPQuote.qrpDetails.Prepare;

//        sFileName := 'SI'+frmPBRPQuote.InvoiceNumberlbl.caption;
        FEmailAttachment.add(sLocation + sFilename + '.htm');
        HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[pred(FEmailAttachment.Count)]);

        frmPBRPQuote.qrpDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmPBRPQuote.qrpDetails.QRPrinter.Free;
        frmPBRPQuote.qrpDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      try
        frmPBRPQuote.qrpDetails.Prepare;

//        sFileName := 'SI'+frmPBRPQuote.InvoiceNumberlbl.caption;
        FEmailAttachment.add(sLocation + sFilename + '.pdf');
        PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[pred(FEmailAttachment.Count)]);

        frmPBRPQuote.qrpDetails.ExportToFilter(PDFFilter);
      finally
        frmPBRPQuote.qrpDetails.QRPrinter.Free;
        frmPBRPQuote.qrpDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      try
        frmPBRPQuote.qrpDetails.Prepare;

//        sFileName := 'SI'+frmPBRPQuote.InvoiceNumberlbl.caption;
        FEmailAttachment.add(sLocation + sFilename + '.gif');
        GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[pred(FEmailAttachment.Count)]);

        frmPBRPQuote.qrpDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmPBRPQuote.qrpDetails.QRPrinter.Free;
        frmPBRPQuote.qrpDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      try
        frmPBRPQuote.qrpDetails.Prepare;

//        sFileName := 'SI'+frmPBRPQuote.InvoiceNumberlbl.caption;
        FEmailAttachment.add(sLocation + sFilename + '.jpg');
        JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[pred(FEmailAttachment.Count)]);

        frmPBRPQuote.qrpDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmPBRPQuote.qrpDetails.QRPrinter.Free;
        frmPBRPQuote.qrpDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      try
        frmPBRPQuote.qrpDetails.Prepare;

//        sFileName := 'SI'+frmPBRPQuote.InvoiceNumberlbl.caption;
        FEmailAttachment.add(sLocation + sFilename + '.bmp');
        BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[pred(FEmailAttachment.Count)]);

        frmPBRPQuote.qrpDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        frmPBRPQuote.qrpDetails.QRPrinter.Free;
        frmPBRPQuote.qrpDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;
  AFilters.free;
end;
*)

end.
