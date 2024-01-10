unit WTRSPOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSPOrder = class(TForm)
    memSelection: TMemo;
    SelectLst: TListBox;
    chkbxprintLogo: TCheckBox;
    btnPrint: TButton;
    btnPreview: TButton;
    btnEmail: TButton;
    Button4: TButton;
    qryGetRange: TFDQuery;
    qryGetSupplierEmailCCs: TFDQuery;
    procedure btnPrintClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure EnableRun(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    iIntselcode: integer;
    FPrintType: string;
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure EmailReport;
    procedure RunReport(const bPreview: boolean);
    procedure SetPrintType(const Value: string);
    procedure BuildRange(sFirst, sLast: string);
    procedure BuildSelection;
    procedure GetSelection;
    function BuildQueryString: string;
    function GetSupplierEmailCCs: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
    procedure SetPrinterBin(BinCode: integer);
  public
    Contact: integer;
    Supplier: integer;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property PrintType: string read FPrintType write SetPrintType;
  end;

var
  frmWTRSPOrder: TfrmWTRSPOrder;

implementation

uses Printers, 
  wtDataModule, wtRPPOrder, AllEmailHandler, System.UITypes, AllCommon, wtMain;

const
  SQLCore =
  'SELECT DISTINCT ' +
  '    Purchase_Order.Purchase_Order, ' +
  '    Supplier.Email_Address AS Email, ' +
  '    Supplier_Contact.Contact_Name AS Name, ' +
  '    ''Adobe Acrobat Document (*.pdf)'' AS export_filter_desc, ' +
  '    ''PDF'' AS ExportFilter, ' +
  '    '' '' AS CC_Email, ' +
  '    Supplier_Contact.Email_address AS Contact_Email ' +
  'FROM Supplier ' +
  '     INNER JOIN (Purchase_order ' +
  '     LEFT JOIN Supplier_contact ' +
  '       ON (Purchase_order.Contact_No = Supplier_contact.Contact_no) AND (Purchase_order.Supplier = Supplier_contact.Supplier)) ' +
  '       ON Supplier.Supplier = Purchase_order.Supplier ' +
  'WHERE (1=1) AND ';

{$R *.dfm}

procedure TfrmWTRSPOrder.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSPOrder.RunReport(const bPreview: boolean);
var
  PrinterSettings: TPrinterSettings;
  icount: integer;
begin
  frmwtRPPOrder := TfrmwtRPPOrder.create(self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      Printer.PrinterIndex := -1;
      for icount := 0 to pred(Printer.Printers.count) do
        begin
          if DefaultPrinter = Printer.printers[icount] then
            Printer.PrinterIndex := icount;
        end;

      if DefaultPrinter <> '' then
        begin
          SetPrinterBin(DefaultBin);
        end;

      frmwtRPPOrder.PurchaseOrder := strtoint(memSelection.text);
      frmwtRPPOrder.bPrintLogo := chkbxPrintLogo.checked;

      if (frmwtRPPOrder.GetDetails = 0) then
        MessageDlg('There are no purchase orders to print', mtError, [mbAbort], 0)
      else
        begin
          if bPreview then
            begin
              frmwtRPPOrder.bPreview := true;
              frmwtRPPOrder.qrpDetails.Preview;
            end
          else
            begin
              frmwtRPPOrder.bPreview := false;
(*              frmwtRPPOrder.qrpDetails.PrinterSetup;
              if frmwtRPPOrder.qrpDetails.tag = 0 then
                frmwtRPPOrder.qrpDetails.Print;
*)
              if SetUpPrinter(PrinterSettings) then
                begin
                  frmwtRPPOrder.qrpDetails.Print;
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
    frmwtRPPOrder.free;
  end;
end;

procedure TfrmWTRSPOrder.btnPreviewClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TfrmWTRSPOrder.btnEmailClick(Sender: TObject);
begin
  EmailReport;
end;

procedure TfrmWTRSPOrder.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSPOrder.EmailReport;
var
  sTemp, sSubject: string;
  AttachmentList: TStringList;
begin
  emailHandler := TemailHandler.Create(self);
  frmWTRPPOrder := TfrmWTRPPOrder.Create(Self);
  AttachmentList := TStringList.Create;
  try
    GetSelection;

    frmWTRPPOrder.bPreview := false;
    frmWTRPPOrder.PurchaseOrder := strtoint(memSelection.text);
    frmWTRPPOrder.bPrintLogo := true;
    frmWTRPPOrder.qrpDetails.ShowProgress := false;

    if (frmWTRPPOrder.GetDetails = 0) then
      begin
        MessageDlg('There are no orders to email', mtError, [mbAbort], 0);
        exit;
      end
    else
      begin
        sTemp := BuildQueryString;

        sSubject := 'Purchase Order: ' + memSelection.text;
        emailHandler.Body := dtmdlWorktops.GetEmailPurchaseOrderDetails;

        if trim(emailHandler.Body) = '' then
          emailHandler.Body := 'Please find attached our purchase order ' + memSelection.text + '.' + #13#10#13#10
                          +  'If you have any queries please contact me immediately' + #13#10#13#10;


        {Replace the order number}
        if pos('<Number>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Number>', frmWTRPPOrder.qryReport.fieldbyname('Purchase_Order').asstring, [rfIgnoreCase])
          end;

        {Replace the contact name}
        if pos('<Supplier Contact>', emailHandler.Body) > 0 then
          begin
            if trim(frmWTRPPOrder.qryReport.fieldbyname('Contact_Name').asstring) <> '' then
              emailHandler.Body := stringreplace(emailHandler.Body, '<Supplier Contact>', frmWTRPPOrder.qryReport.fieldbyname('Contact_Name').asstring, [rfIgnoreCase])
            else
              emailHandler.Body := stringreplace(emailHandler.Body, '<Supplier Contact>', 'Sir/Madam', [rfIgnoreCase]);
          end;

        {Replace the description}
        if pos('<Description>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Description>', frmWTRPPOrder.qryReport.fieldbyname('Descriptive_Reference').asstring, [rfIgnoreCase])
          end;

        {Replace the office contact}
        if pos('<Office Contact>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Office Contact>', frmWTRPPOrder.qryReport.fieldbyname('Office_Contact_Name').asstring, [rfIgnoreCase]);
          end;

        {Replace the telephone}
        if pos('<Telephone>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Telephone>', frmWTRPPOrder.qryReport.fieldbyname('Office_Contact_Telephone').asstring, [rfIgnoreCase]);
          end;

        emailHandler.ccEmail := GetSupplierEmailCCs;

        AttachmentList.clear;

        emailHandler.CreateEmail(frmWTRPPOrder.qrpDetails, sTemp, 'PO'+stringreplace(memSelection.text,'/','',[rfReplaceAll]), sSubject, AttachmentList);
      end;
  finally
    AttachmentList.Free;
    frmWTRPPOrder.free;
    emailHandler.Free;
  end;
end;

function TfrmWTRSPOrder.GetSupplierEmailCCs: string;
begin
  result := '';
  with qryGetSupplierEmailCCs do
    begin
      close;
      parambyname('Supplier').asinteger := Supplier;
      parambyname('Contact_no').asinteger := Contact;
      open;

      while eof <> true do
        begin
          Result := Result + fieldbyname('Email_Address').asstring + ';';
          next;
        end;

    end;
end;

procedure TfrmWTRSPOrder.FormActivate(Sender: TObject);
begin
  iIntselcode := dtmdlWorktops.GetNextIntSelCode(Self);
end;

procedure TfrmWTRSPOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;

procedure TfrmWTRSPOrder.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);

  try
    with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Purchase Order', 'Print Logo', 'N') = 'Y');
      DefaultPrinter := ReadString('Purchase Order', 'Default Printer', '');
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTRSPOrder.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try
    with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Purchase Order', 'Print Logo', 'Y')
      else
        WriteString('Purchase Order', 'Print Logo', 'N');
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmWTRSPOrder.EnableRun(Sender: TObject);
begin
  btnPrint.enabled := memSelection.text <> '';
  btnPreview.enabled := btnPrint.enabled;
  btnEmail.Enabled := btnPrint.enabled;
end;

procedure TfrmWTRSPOrder.SetPrintType(const Value: string);
begin
  FPrintType := Value;
end;

procedure TfrmWTRSPOrder.GetSelection;
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

procedure TfrmWTRSPOrder.BuildSelection;
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

procedure TfrmWTRSPOrder.BuildRange(sFirst, sLast: string);
begin
 	with qryGetRange do
    begin
      Close;
      ParamByName('From_Purchase_Order').AsFloat := StrToFloatDef(sFirst, 0, FormatSettings);
      ParamByName('To_Purchase_Order').AsFloat := StrToFloatDef(sLast, 0, FormatSettings);
      Open;
      First;
      While Not EOF do
        begin
          SelectLst.Items.Add(FloatToStr(FieldByName('Purchase_Order').AsFloat));
          Next;
        end;
    end;
end;

function TfrmWTRSPOrder.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'Purchase_Order.Purchase_Order = ' + memSelection.text;
  Result := sTemp
end;


procedure TfrmWTRSPOrder.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TfrmWTRSPOrder.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TfrmWTRSPOrder.SetPrinterBin(BinCode: integer);
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
