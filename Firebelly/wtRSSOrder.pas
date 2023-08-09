unit wtRSSOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, QrCtrls, IniFiles, allCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSSOrder = class(TForm)
    Label1: TLabel;
    memSelection: TMemo;
    btnPrint: TButton;
    Button4: TButton;
    SelectLst: TListBox;
    qryGetQuotes: TFDQuery;
    qryGetRange: TFDQuery;
    btnPreview: TButton;
    qryGetSOQuote: TFDQuery;
    qryGetSOQuotes: TFDQuery;
    btnEmail: TButton;
    chkbxprintLogo: TCheckBox;
    rdgrpType: TRadioGroup;
    chkbxAttachTemplate: TCheckBox;
    chkbxAttachTerms: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure EnableRun(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    iIntselcode: integer;
    FPrintType: string;
    sTemplateConditionsFile: string;
    sAvailabilityFile: string;
    sTermsAndConditionsFile: string;
    procedure RunReport(const bPreview: boolean);
    procedure RunQuoteReport(const bPreview: boolean);
    procedure RunTemplateReport(const bPreview: boolean);
    procedure ClearFaxArray(Sender: TObject);
    procedure GetSelection;
    procedure BuildSelection;
    procedure BuildRange(sFirst, sLast: string);
    procedure SetPrintType(const Value: string);
    function GetQuoteNumber(tmpNo: integer): integer;
    procedure EmailReport;
    function BuildQueryString: string;
    { Private declarations }
  public
    bRetail: boolean;
    bSpeculative: boolean;
    iCustomer: integer;
    property PrintType: string read FPrintType write SetPrintType;
  end;

var
  frmWTRSSOrder: TfrmWTRSSOrder;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses
  wtRPQuote, wtDataModule, wtSendFax, wtFaxList, wtRPSOrder, AllEmailHandler,
  wtRPTemplate, wtMain;

const
  SQLCore =
  'SELECT DISTINCT ' +
  '    Sales_Order.Sales_Order, ' +
  '    Customer.Email_Address AS Email, ' +
  '    Sales_Order.Contact_Name AS Name, ' +
  '    ''Adobe Acrobat Document (*.pdf)'' AS export_filter_desc, ' +
  '    ''PDF'' AS ExportFilter, ' +
  '    '' '' AS CC_Email, ' +
  '    Customer_contact.Email_address AS Contact_Email ' +
  'FROM (Customer ' +
  '      INNER JOIN Sales_Order ' +
  '        ON Customer.Customer = Sales_Order.Customer) ' +
  '      LEFT JOIN Customer_contact ' +
  '        ON (Sales_Order.Customer = Customer_contact.Customer) AND (Sales_Order.Contact_Name = Customer_contact.Contact_name) ' +
  'WHERE 1 = 1 AND ';

  SQLRetailCore =
  'SELECT DISTINCT Sales_Order.Sales_Order, '+
  'Address.Email_Address as Email, '+
  'Address.Address_Name as Name, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email, ' +
  'Address.Email_Address as Contact_Email '+
  'FROM (Address '+
  'INNER JOIN Sales_Order ON '+
  'Address.Address = Sales_Order.Address) '+
  'WHERE 1=1 AND ';

  SQLCoreOld =
  'SELECT DISTINCT Sales_Order.Sales_Order, '+
  'Customer.Email_Address as Email, '+
  'Sales_Order.Contact_Name as Name, '+
  '''Adobe Acrobat Document (*.pdf)'' as export_filter_desc, '+
	'''PDF'' as ExportFilter, '+
  ''' '' as CC_Email ' +
  'FROM (Customer '+
  'INNER JOIN Sales_Order ON '+
  'Customer.Customer = Sales_Order.Customer) '+
  'WHERE 1=1 AND ';

{$R *.dfm}

procedure TfrmWTRSSOrder.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSSOrder.btnPrintClick(Sender: TObject);
begin
  if PrintType = 'T' then
    begin
      RunTemplateReport(false);
      RunQuoteReport(false);
    end
  else
    RunReport(false);
end;


procedure TfrmWTRSSOrder.RunQuoteReport(const bPreview: boolean);
begin
  with qryGetSOQuotes do
    begin
      close;
      parambyname('Sales_Order').asinteger := strtoint(memSelection.text);
      open;

      first;
      while eof <> true do
        begin
          frmwtRPQuote := TfrmwtRPQuote.create(self);
          try
            frmwtRPQuote.Quote := qryGetSOQuotes.fieldbyname('Quote').asinteger;
            frmwtRPQuote.bPrintLogo := false;
            frmwtRPQuote.bPrintDetail := false;
            frmwtRPQuote.bPrintAcceptance := false;
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
//                  frmwtRPQuote.qrpDetails.PrinterSetup;
//                  if frmwtRPQuote.qrpDetails.tag = 0 then
                    frmwtRPQuote.qrpDetails.Print;
//                    close;
                  end;
              end;
          finally
            frmwtRPQuote.free;
          end;
          next;
        end;
    end;
end;

procedure TfrmWTRSSOrder.RunReport(const bPreview: boolean);
begin
  frmwtRPSOrder := TfrmwtRPSOrder.create(self);
  try
    frmwtRPSOrder.SalesOrder := strtoint(memSelection.text);
    frmwtRPSOrder.PrintType := self.PrintType;
    frmwtRPSOrder.bPrintLogo := chkbxPrintLogo.checked;
    frmwtRPSOrder.bDetailed := (rdgrpType.itemindex = 1);

    if (frmwtRPSOrder.GetDetails = 0) then
      MessageDlg('There are no sales orders to print', mtError, [mbAbort], 0)
    else
      begin
// decide which address to show on quote
        frmwtRPSOrder.bEndUser := false ;
        if bPreview then
          begin
              frmwtRPSOrder.bPreview := true;
              frmwtRPSOrder.qrpDetails.Preview;
          end
        else
          begin
              frmwtRPSOrder.bPreview := false;
              frmwtRPSOrder.qrpDetails.PrinterSetup;
              if frmwtRPSOrder.qrpDetails.tag = 0 then
                frmwtRPSOrder.qrpDetails.Print;
              close;
          end;
      end;
  finally
    frmwtRPSOrder.free;
  end;
end;

procedure TfrmWTRSSOrder.RunTemplateReport(const bPreview: boolean);
begin
  frmwtRPTemplate := TfrmwtRPTemplate.create(self);
  try
    frmwtRPTemplate.SalesOrder := strtoint(memSelection.text);
//    frmwtRPTemplate.bPrintLogo := chkbxPrintLogo.checked;

    if (frmwtRPTemplate.GetDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
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
                frmwtRPTemplate.qrpDetails.Print;
              close;
          end;
      end;
  finally
    frmwtRPTemplate.free;
  end;
end;

function TfrmWTRSSOrder.GetQuoteNumber(tmpNo: integer): integer;
begin
  with qryGetSOQuote do
    begin
      close;
      parambyname('Sales_order').asinteger := tmpNo;
      open;
      result := fieldbyname('Quote').asinteger;
    end;
end;

procedure TfrmWTRSSOrder.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.Enabled := btnPrint.enabled;
end;

procedure TfrmWTRSSOrder.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TfrmWTRSSOrder.GetSelection;
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

procedure TfrmWTRSSOrder.BuildSelection;
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

procedure TfrmWTRSSOrder.BuildRange(sFirst, sLast: string);
begin
 	with qryGetRange do
    begin
      Close;
      ParamByName('From_Quote').AsFloat := StrToFloatDef(sFirst, 0, FormatSettings);
      ParamByName('To_Quote').AsFloat := StrToFloatDef(sLast, 0, FormatSettings);
      Open;
      First;
      While Not EOF do
        begin
          SelectLst.Items.Add(FloatToStr(FieldByName('Purchase_Order').AsFloat));
          Next;
        end;
    end;
end;

procedure TfrmWTRSSOrder.FormActivate(Sender: TObject);
begin
  iIntselcode := dtmdlWorktops.GetNextIntSelCode(Self);
end;

procedure TfrmWTRSSOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

procedure TfrmWTRSSOrder.SetPrintType(const Value: string);
begin
  FPrintType := Value;
  if FPrintType = 'T' then
    caption := 'Print Template Check List'
  else
  if FPrintType = 'I' then
    begin
      caption := 'Print Proforma Invoice';
      chkbxAttachTemplate.Visible := false;
      chkbxAttachTerms.Visible := false;
    end
  else
    caption := 'Print Sales Order';

  rdgrpType.visible := (FPrintType <> 'T');
end;

procedure TfrmWTRSSOrder.btnPreviewClick(Sender: TObject);
begin
  if PrintType = 'T' then
    begin
      RunTemplateReport(true);
    end
  else
    RunReport(true);

end;

function TfrmWTRSSOrder.BuildQueryString: string;
var
  sTemp: string;
begin
  if bRetail OR bSpeculative then
    sTemp := SQLRetailCore
  else
    sTemp := SQLCore;

  sTemp := sTemp + 'Sales_Order.Sales_order = ' + memSelection.text;
  Result := sTemp
end;

procedure TfrmWTRSSOrder.btnEmailClick(Sender: TObject);
begin
  sTemplateConditionsFile := dtmdlWorktops.GetTemplateConditionsFile;
  sAvailabilityFile := dtmdlWorktops.GetAvailabilityFile;
  sTermsAndConditionsFile := dtmdlWorktops.GetTermsAndConditionsFile;

  EmailReport;
end;

procedure TfrmWTRSSOrder.EmailReport;
var
  sTemp, sSubject: string;
  AttachmentList: TStringList;
begin
  emailHandler := TemailHandler.Create(self);
  frmWTRPSOrder := TfrmWTRPSOrder.Create(Self);
  AttachmentList := TStringList.Create;
  try
    GetSelection;

    frmWTRPSOrder.bPreview := false;
    frmWTRPSOrder.SalesOrder := strtoint(memSelection.text);
    frmwtRPSOrder.PrintType := self.PrintType;
    frmWTRPSOrder.bPrintLogo := true;
    frmWTRPSOrder.qrpDetails.ShowProgress := false;
    frmwtRPSOrder.bDetailed := (rdgrpType.itemindex = 1);

    if (frmWTRPSOrder.GetDetails = 0) then
      begin
        MessageDlg('There are no orders to email', mtError, [mbAbort], 0);
        exit;
      end
    else
      begin
        sTemp := BuildQueryString;

        if PrintType = 'I' then
          begin
            sSubject := 'Proforma Invoice: ' + memSelection.text;
            emailHandler.Body := '';

            if trim(emailHandler.Body) = '' then
                emailHandler.Body := 'Please find attached Proforma Invoice ' + memSelection.text + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;
          end
        else
          begin
            sSubject := 'Order Confirmation: ' + memSelection.text;

            emailHandler.Body := '';

            if bRetail or bSpeculative or (dtmdlWorktops.GetCustomerCreditStatus(iCustomer) = 'P') then
              emailHandler.Body := dtmdlWorktops.GetEmailRetailSalesConfirmDetails
            else
              emailHandler.Body := dtmdlWorktops.GetEmailSalesConfirmDetails;

            if trim(emailHandler.Body) = '' then
                emailHandler.Body := 'Please find attached Order Confirmation ' + memSelection.text + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;
          end;


        {Replace the order number}
        if pos('<Number>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Number>', frmWTRPSOrder.qryReport.fieldbyname('Sales_Order').asstring, [rfIgnoreCase])
          end;

        {Replace the contact name}
        if pos('<Customer Contact>', emailHandler.Body) > 0 then
          begin
            if trim(frmWTRPSOrder.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
              emailHandler.Body := stringreplace(emailHandler.Body, '<Customer Contact>', frmWTRPSOrder.qryReport.fieldbyname('Contact_Name').asstring, [rfIgnoreCase])
            else
              emailHandler.Body := stringreplace(emailHandler.Body, '<Customer Contact>', 'Sir/Madam', [rfIgnoreCase]);
          end;

        {Replace the Date Type}
        if pos('<Date Type>', emailHandler.Body) > 0 then
          begin
            if trim(frmWTRPSOrder.qryReport.fieldbyname('Date_Type').asstring) = 'P' then
              emailHandler.Body := stringreplace(emailHandler.Body, '<Date Type>', 'provisional', [rfIgnoreCase])
            else
            if trim(frmWTRPSOrder.qryReport.fieldbyname('Date_Type').asstring) = 'C' then
              emailHandler.Body := stringreplace(emailHandler.Body, '<Date Type>', 'confirmed', [rfIgnoreCase])
            else
              emailHandler.Body := stringreplace(emailHandler.Body, '<Date Type>', 'to be confirmed', [rfIgnoreCase]);
          end;

        {Replace the Template Date}
        if pos('<Template Date>', emailHandler.Body) > 0 then
          begin
            if trim(frmWTRPSOrder.qryReport.fieldbyname('Template_Date').asstring) <> '' then
              emailHandler.Body := stringreplace(emailHandler.Body, '<Template Date>', paDateStr(frmWTRPSOrder.qryReport.fieldbyname('Template_Date').asDateTime), [rfIgnoreCase])
            else
              emailHandler.Body := stringreplace(emailHandler.Body, '<Template Date>', 'TBC', [rfIgnoreCase]);
          end;

        {Replace the Fitting Date}
        if pos('<Fitting Date>', emailHandler.Body) > 0 then
          begin
            if trim(frmWTRPSOrder.qryReport.fieldbyname('Date_Required').asstring) <> '' then
              emailHandler.Body := stringreplace(emailHandler.Body, '<Fitting Date>', paDateStr(frmWTRPSOrder.qryReport.fieldbyname('Date_Required').asDateTime), [rfIgnoreCase])
            else
              emailHandler.Body := stringreplace(emailHandler.Body, '<Fitting Date>', 'TBC', [rfIgnoreCase]);
          end;

        {Replace the description}
        if pos('<Description>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Description>', frmWTRPSOrder.qryReport.fieldbyname('Descriptive_Reference').asstring, [rfIgnoreCase])
          end;

        {Replace the office contact}
        if pos('<Office Contact>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Office Contact>', frmWTRPSOrder.qryReport.fieldbyname('Account_Manager_Name').asstring, [rfIgnoreCase]);
          end;

        {Replace the telephone}
        if pos('<Telephone>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Telephone>', frmWTRPSOrder.qryReport.fieldbyname('AM_Telephone_Number').asstring, [rfIgnoreCase]);
          end;

        emailHandler.ccEmail := '';

        AttachmentList.clear;
        
        if PrintType = 'I' then
          begin
            {Proforma Invoice}
            emailHandler.CreateEmail(frmWTRPSOrder.qrpDetails, sTemp, 'PRF'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
          end
        else
          begin
            if chkbxAttachTemplate.Checked and (sTemplateConditionsFile <> '') then
              Attachmentlist.Add(sTemplateConditionsFile);

            if chkbxAttachTerms.Checked and (sTermsAndConditionsFile <> '') then
              Attachmentlist.Add(sTermsAndConditionsFile);

            emailHandler.CreateEmail(frmWTRPSOrder.qrpDetails, sTemp, 'SO'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
          end;

      end;
  finally
    AttachmentList.Free;
    frmWTRPSOrder.free;
    emailHandler.Free;
  end;
end;

procedure TfrmWTRSSOrder.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try
    with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Sales Order', 'Print Logo', 'Y')
      else
        WriteString('Sales Order', 'Print Logo', 'N');

      if chkbxAttachTemplate.checked then
        WriteString('Sales Order', 'Attach Template', 'Y')
      else
        WriteString('Sales Order', 'Attach Template', 'N');

      if chkbxAttachTerms.checked then
        WriteString('Sales Order', 'Attach Terms', 'Y')
      else
        WriteString('Sales Order', 'Attach Terms', 'N');

      if rdgrpType.ItemIndex = 1 then
        WriteString('Sales Order', 'Detailed Print', 'Y')
      else
        WriteString('Sales Order', 'Detailed Print', 'N');
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTRSSOrder.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try
    with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Sales Order', 'Print Logo', 'N') = 'Y');
      chkbxAttachTemplate.Checked := (ReadString('Sales Order', 'Attach Template', 'N') = 'Y');
      chkbxAttachTerms.Checked := (ReadString('Sales Order', 'Attach Terms', 'N') = 'Y');

      if ReadString('Sales Order', 'Detailed Print', 'N') = 'Y' then
        rdgrpType.itemindex := 1
      else
        rdgrpType.itemindex := 0
    end;
  finally
    IniFile.Free;
  end;
end;

end.

