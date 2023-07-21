unit wtRSContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, QrCtrls, IniFiles, printers,
  Buttons, OleCtnrs, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSContract = class(TForm)
    Label1: TLabel;
    memSelection: TMemo;
    btnPrint: TButton;
    Button4: TButton;
    chkbxprintLogo: TCheckBox;
    SelectLst: TListBox;
    qryGetQuotes: TFDQuery;
    qryGetRange: TFDQuery;
    btnPreview: TButton;
    btnEmail: TButton;
    qryQuoteMaterial: TFDQuery;
    chkbxIncludeTemplating: TCheckBox;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    chkbxValue: TCheckBox;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure EnableRun(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    iIntselcode: integer;
    FPrintType: string;
    procedure RunReport(const bPreview: boolean);
    procedure EmailReport;
    procedure BuildEmailDetails;
    procedure ClearEmailArray(Sender: TObject);
    procedure GetSelection;
    procedure BuildSelection;
    procedure BuildRange(sFirst, sLast: string);
    function BuildQueryString: string;
    function GetQuoteMaterial(tempQuote: integer): string;
    { Private declarations }
  public
    bRetail: boolean;
    key: integer;
  end;

var
  frmWTRSContract: TfrmWTRSContract;
  FaxArray: array[1..100, 1..6] of string;
  EMailArray: array[1..100, 1..10] of string;

implementation

uses wtDataModule, AllEmailHandler, wtRPContract, AllCommon;

const

  SQLCore =
  'SELECT DISTINCT ' +
  '    Contract_Quote.Contract_Quote, ' +
  '    Customer.Email_Address AS Email, ' +
  '    Contract_Quote.Contact_Name AS Name, ' +
  '    ''Adobe Acrobat Document (*.pdf)'' AS export_filter_desc, ' +
  '    ''PDF'' AS ExportFilter, ' +
  '    '' '' AS CC_Email, ' +
  '    Customer_contact.Email_address AS Contact_Email ' +
  'FROM (Customer ' +
  '      INNER JOIN Contract_Quote ' +
  '        ON Customer.Customer = Contract_Quote.Customer) ' +
  '      LEFT JOIN Customer_contact ' +
  '        ON (Contract_Quote.Customer = Customer_contact.Customer) AND (Contract_Quote.Contact_Name = Customer_contact.Contact_name) ' +
  'WHERE 1 = 1 AND ';

{$R *.dfm}

procedure TfrmWTRSContract.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSContract.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSContract.EmailReport;
var
  sTemp, sSubject, sMaterial: string;
  AttachmentList: TStringList;
begin
  emailHandler := TemailHandler.Create(self);
  frmWTRPContract := TfrmWTRPContract.Create(Self);
  AttachmentList := TStringList.Create;
  try
    GetSelection;

    frmWTRPContract.bPreview := false;
//    frmWTRPContract.ContractQuote := strtoint(memSelection.text);
    frmWTRPContract.ContractQuote := key;
    frmWTRPContract.bPrintLogo := chkbxPrintLogo.checked;
    frmWTRPContract.bIncludeTemplating := chkbxIncludeTemplating.checked;
    frmWTRPContract.bValuebyUnits := chkbxValue.checked;

    frmWTRPContract.qrpDetails.ShowProgress := false;

    if (frmWTRPContract.GetDetails = 0) then
      begin
        MessageDlg('There are no contract quotes to email', mtError, [mbAbort], 0);
        exit;
      end
    else
      begin
        {Change to Landscape or Portrait depending on number of options}
        if frmWTRPContract.GetOptionCount > 4 then
          frmWTRPContract.qrpDetails.Page.Orientation := poLandscape
        else
          frmWTRPContract.qrpDetails.Page.Orientation := poPortrait;

        sTemp := BuildQueryString;
        sSubject := 'Contract Quotation: ' + memSelection.text;
        emailHandler.Body := dtmdlWorktops.GetEmailQuoteDetails;

        if trim(emailHandler.Body) = '' then
                emailHandler.Body := 'Please find attached, quote ' + memSelection.text + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;

        {Replace the quote number}
        if pos('<Number>', emailHandler.Body) > 0 then
          begin
//            emailHandler.Body := stringreplace(emailHandler.Body, '<Number>', frmWTRPContract.qryReport.fieldbyname('Contract_Quote').asstring, [rfIgnoreCase])
            emailHandler.Body := stringreplace(emailHandler.Body, '<Number>', frmWTRPContract.qryReport.fieldbyname('Quote_Number').asstring, [rfIgnoreCase])
          end;

        {Replace the contact name}
        if pos('<Customer Contact>', emailHandler.Body) > 0 then
          begin
            if trim(frmWTRPContract.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
              emailHandler.Body := stringreplace(emailHandler.Body, '<Customer Contact>', frmWTRPContract.qryReport.fieldbyname('Contact_Name').asstring, [rfIgnoreCase])
            else
              emailHandler.Body := stringreplace(emailHandler.Body, '<Customer Contact>', 'Sir/Madam', [rfIgnoreCase]);
          end;

        {Replace the description}
        if pos('<Description>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Description>', frmWTRPContract.qryReport.fieldbyname('Contract_Description').asstring, [rfIgnoreCase])
          end;

        {Replace the material}
        if pos('<Material>', emailHandler.Body) > 0 then
          begin
            sMaterial := GetQuoteMaterial(frmWTRPContract.qryReport.fieldbyname('Contract_Quote').asinteger);

            emailHandler.Body := stringreplace(emailHandler.Body, '<Material>', sMaterial, [rfIgnoreCase])
          end;

        {Replace the description}
        if pos('<Office Contact>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Office Contact>', frmWTRPContract.qryReport.fieldbyname('Account_Manager_Name').asstring, [rfIgnoreCase]);
          end;

        {Replace the description}
        if pos('<Telephone>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Telephone>', frmWTRPContract.qryReport.fieldbyname('AM_Telephone_Number').asstring, [rfIgnoreCase]);
          end;
        emailHandler.ccEmail := '';

        AttachmentList.clear;
        emailHandler.CreateEmail(frmWTRPContract.qrpDetails, sTemp, 'CQ'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
      end;
  finally
    AttachmentList.Free;
    frmWTRPContract.free;
    emailHandler.Free;
  end;
end;

function TfrmWTRSContract.GetQuoteMaterial(tempQuote: integer): string;
begin
  result := '';
  with qryQuoteMaterial do
    begin
      close;
      parambyname('Quote').asinteger := tempQuote;
      open;

      if recordcount > 0 then
//        result := fieldbyname('Thickness_mm').asstring + ' ' + fieldbyname('Colour_Description').asstring + ' ' + fieldbyname('Material_Description').asstring
        result := fieldbyname('Worktop_Material').asstring
      else
        result := '';
    end;
end;

procedure TfrmWTRSContract.RunReport(const bPreview: boolean);
begin
  frmWTRPContract := TfrmWTRPContract.create(self);
  try
//    frmWTRPContract.ContractQuote := strtoint(memSelection.text);
    frmWTRPContract.ContractQuote := Key;
    frmWTRPContract.bPrintLogo := chkbxPrintLogo.checked;
    frmWTRPContract.bIncludeTemplating := chkbxIncludeTemplating.checked;
    frmWTRPContract.bValuebyUnits := chkbxValue.checked;

    if (frmWTRPContract.GetDetails = 0) then
      MessageDlg('There are no quotes to print', mtError, [mbAbort], 0)
    else
      begin
        {Change to Landscape or Portrait depending on number of options}
        if frmWTRPContract.GetOptionCount > 4 then
          frmWTRPContract.qrpDetails.Page.Orientation := poLandscape
        else
          frmWTRPContract.qrpDetails.Page.Orientation := poPortrait;

        if bPreview then
          begin
              frmWTRPContract.bPreview := true;
              frmWTRPContract.qrpDetails.Preview;
          end
        else
          begin
              frmWTRPContract.bPreview := false;
              frmWTRPContract.qrpDetails.PrinterSetup;

              if frmWTRPContract.qrpDetails.tag = 0 then
                frmWTRPContract.qrpDetails.Print;
              close;
          end;
      end;
  finally
    frmWTRPContract.free;
  end;
end;

procedure TfrmWTRSContract.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.Enabled;
  btnEmail.Enabled := btnPrint.enabled;
end;

procedure TfrmWTRSContract.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TfrmWTRSContract.GetSelection;
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
          ParamByName('Sel1').AsFloat := strtoFloat(SelectLst.Items[icount]);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

procedure TfrmWTRSContract.BuildSelection;
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

procedure TfrmWTRSContract.BuildRange(sFirst, sLast: string);
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
          SelectLst.Items.Add(FloatToStr(FieldByName('Purchase_Order').AsFloat));
          Next;
        end;
    end;
end;

procedure TfrmWTRSContract.BuildEmailDetails;
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
      EmailArray[irow, 2] := FieldByName('Customer').AsString;
      EmailArray[irow, 3] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Customer_Name').AsString);
      if FieldByName('Is_Retail_Customer').AsString = 'Y' then
        EmailArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        EmailArray[irow, 5] := FieldByName('Customer_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TfrmWTRSContract.FormActivate(Sender: TObject);
begin
  iIntselcode := dtmdlWorktops.GetNextIntSelCode(Self);
end;

procedure TfrmWTRSContract.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

function TfrmWTRSContract.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'Contract_Quote.Contract_Quote = ' + inttostr(self.key);
  Result := sTemp
end;

procedure TfrmWTRSContract.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSContract.btnEmailClick(Sender: TObject);
begin
  EmailReport;
end;

procedure TfrmWTRSContract.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  var fileName := ExtractFilePath(Application.ExeName) + myWorktops_INIFILE;
  IniFile := TIniFile.Create(fileName);

  try
    with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Contract Quote', 'Print Logo', 'Y')
      else
        WriteString('Contract Quote', 'Print Logo', 'N');

      if chkbxIncludeTemplating.checked then
        WriteString('Contract Quote', 'Include Temp and Fitting', 'Y')
      else
        WriteString('Contract Quote', 'Include Temp and Fitting', 'N');

      if chkbxValue.checked then
        WriteString('Contract Quote', 'Value based on units', 'Y')
      else
        WriteString('Contract Quote', 'Value based on units', 'N');
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTRSContract.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  var fileName := ExtractFilePath(Application.ExeName) + myWorktops_INIFILE;
  IniFile := TIniFile.Create(fileName);

  try
  with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Contract Quote', 'Print Logo', 'N') = 'Y');
      chkbxIncludeTemplating.Checked := (ReadString('Contract Quote', 'Include Temp and Fitting', 'N') = 'Y');
      chkbxValue.Checked := (ReadString('Contract Quote', 'Value based on units', 'N') = 'Y');
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTRSContract.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  frmWTRPContract := TfrmWTRPContract.create(self);
  try
//    frmWTRPContract.ContractQuote := strtoint(memSelection.text);
    frmWTRPContract.ContractQuote := key;
    frmWTRPContract.bPrintLogo := false;
    frmWTRPContract.bIncludeTemplating := chkbxIncludeTemplating.checked;
    frmWTRPContract.bValuebyUnits := chkbxValue.checked;

//  Check if any records exist
    reccount := frmWTRPContract.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPContract.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPContract.Free;
    Application.ProcessMessages;
  end;
end;

end.

