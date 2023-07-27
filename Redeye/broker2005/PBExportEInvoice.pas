unit PBExportEInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, IniFiles, CCSCommon,
  pbDatabase, pbSalesInvoiceDM, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBExportEInvoiceFrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCustomer: TEdit;
    btnSelection: TButton;
    dtsEInvoice: TDataSource;
    OpenDialog1: TOpenDialog;
    qrySIHeader: TFDQuery;
    FTP: TIdFTP;
    qryCustEInvoice: TFDQuery;
    qryUpdSIStatus: TFDQuery;
    qryUpdCustomer: TFDQuery;
    rdgrpFileType: TRadioGroup;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlFTP: TPanel;
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtFTP: TEdit;
    lstbxFiles: TListBox;
    lstbxInvoices: TListBox;
    lstbxStatus: TListBox;
    dbgDetails: TDBGrid;
    btnSelect: TBitBtn;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    edtExpFile: TEdit;
    btnBrowse: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnExcel: TBitBtn;
    qryUpdSInvoice: TFDQuery;
    procedure btnSelectionClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rdgrpFileTypeClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    Customer: integer;
    CustomerFileNo: integer;
    CustomerName: string;
    dmEInvoice: TdmSalesInvoice;
    ExportFile: textFile;
    procedure ShowDetails;
    function GetPath: string;
    procedure SavePath;
    procedure ExportInvoice(tempCode: integer);
    procedure ShowEInvoiceDetails;
    procedure UpdateExportedInvoices(tmpFilename: string);
    { Private declarations }
  public
    bOK: boolean;
    { Public declarations }
  end;

var
  PBExportEInvoiceFrm: TPBExportEInvoiceFrm;

implementation

uses PBLUCust, pbMainMenu;

{$R *.dfm}

procedure TPBExportEInvoiceFrm.btnSelectionClick(Sender: TObject);
begin
 PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.SelCode := Customer;
    PBLUCustFrm.SelBranch := 0;
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bSel_Branch := False;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      Customer := PBLUCustFrm.SelCode;
      CustomerName := PBLUCustFrm.SelName;
      edtCustomer.text := PBLUCustFrm.SelName;
      ShowEInvoiceDetails;
      ShowDetails;
      enableOK(self);
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBExportEInvoiceFrm.ShowDetails;
begin
  with qrySIHeader do
    begin
      close;
      parambyname('Customer').asinteger := customer;
      case rdgrpFileType.itemindex of
        0: begin
            parambyname('Status_From').asinteger := 11;
            parambyname('Status_To').asinteger := 20;
           end;
        1: begin
            parambyname('Status_From').asinteger := 20;
            parambyname('Status_To').asinteger := 50;
           end;
      end;
      open;

      if recordcount = 1 then
        dbgDetails.SelectedRows.CurrentRowSelected := True
      else
        dbgDetails.SelectedRows.CurrentRowSelected := false;

      btnSelect.enabled := (recordcount > 0);
      btnExcel.enabled := (recordcount > 0);
    end;
end;

procedure TPBExportEInvoiceFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (btnSelect.enabled) and
                    (edtFTP.text <> '') and
                    (edtUsername.text <> '') and
                    (edtPassword.text <> '');
end;

procedure TPBExportEInvoiceFrm.ShowEInvoiceDetails;
begin
  with qryCustEInvoice do
    begin
      close;
      parambyname('Customer').asinteger := customer;
      open;

      edtFTP.Text := fieldbyname('Transfer_Site_URL').asstring;
      edtUserName.Text := fieldbyname('Connection_Username').asstring;
      edtPassword.Text := fieldbyname('Connection_Password').asstring;

      CustomerFileNO := fieldbyname('Electronic_Invoice_File_no').asinteger + 1;
      pnlFTP.Visible := (fieldbyname('Transfer_Protocol_Type').asstring = 'FTP');
      lstbxStatus.Items.Clear;
    end;
end;

procedure TPBExportEInvoiceFrm.FormActivate(Sender: TObject);
begin
  edtCustomer.Text := '';
end;

procedure TPBExportEInvoiceFrm.btnOKClick(Sender: TObject);
var
  tempFileName, tempDir, sFileName, Filename, tempstr: string;
  bSuccess: boolean;
  icount, i: integer;
begin
  if dbgDetails.SelectedRows.Count = 0 then
    begin
      MessageDlg('No invoices have been selected to send!', mtError, [mbOk], 0);
      exit;
    end;

  if MessageDlg('You are about to raise and send an electronic invoice for the ' + inttostr(dbgDetails.SelectedRows.Count) + ' invoices selected'+#10#13+
                'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  tempDir := dmBroker.GetCompanyTransferDirectory+'\out\';

  if not DirectoryExists(tempDir) then
    begin
      try
        CreateDir(tempDir);
      except
        exit
      end;
    end;

  sFileName := 'EI'+formatdatetime('yyyymmdd',date)+'('+inttostr(Customer)+')'+inttostr(CustomerfileNo) + '.csv';

  tempFileName := TempDir+sFileName;
  assignFile(self.exportFile, tempfileName);
  rewrite(self.exportFile);

  lstbxInvoices.Clear;
  lstbxStatus.clear;

  try
    for icount := 0 to (dbgDetails.SelectedRows.Count - 1) do
    begin
      dtsEInvoice.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
      with dtsEInvoice.DataSet do
        begin
          exportInvoice(fieldbyname('Sales_invoice').asinteger);
          lstbxInvoices.Items.Add(fieldbyname('Sales_invoice').asstring);
        end;
    end;
  finally
    CloseFile(self.exportFile);
  end;

  //display message showing number of invoices exported
  if icount = 0 then
    begin
      ShowMessage('NO invoices created. Please check that you have selected at least one invoice or contact the system administrator');
      exit;
    end
  else
  if icount = 1 then
    lstbxStatus.Items.Add(inttostr(icount)+' electronic invoice created successfully.')
  else
    lstbxStatus.Items.Add(inttostr(icount)+' electronic invoices created successfully.');

  //Connect and put the file
  lstbxStatus.Items.Add('Sending Invoice File');

  bSuccess := true;
  try
    if FTP.Connected then
      begin
        FTP.Disconnect;
      end
    else
      begin
        FTP.Host := edtFTP.Text;
        FTP.Username := edtUserName.Text;
        FTP.Password := edtPassword.Text;

        FTP.Connect;

        FTP.ChangeDir('DX001');

        tempstr := sfilename;
        Filename := tempFilename;

        FTP.Put(Filename, tempstr);

//      sleep(5000);

        lstbxFiles.clear;
        FTP.List(lstbxFiles.items, '', false);
        bSuccess := false;
        for icount := 0 to pred(lstbxFiles.items.count) do
        begin
          if trim(lstbxFiles.Items[icount]) = trim(tempstr) then
            begin
              bSuccess := true;
              break;
            end;
        end;
        FTP.Disconnect;
      end;
  except
    ShowMessage('There are problems with the FTP service, please contact your system administrator');
    exit;
  end;

  if not bSuccess then
    begin
      if not DirectoryExists(tempdir+'error\') then
        begin
          try
            CreateDir(tempdir+'error\');
          except
            exit
          end;
        end;

      // move the file to error directory
      if FileExists(tempdir+'error\'+tempStr) then
        DeleteFile(tempdir+'error\'+tempStr);

      RenameFile(filename,tempdir+'error\'+tempStr);

      Filename := tempdir+'error\'+tempStr;

      lstbxStatus.Items.Add('Sending Invoices FAILED !!!');
      exit;
    end
  else
    begin
      if not DirectoryExists(tempdir+'archive\') then
        begin
          try
            CreateDir(tempdir+'archive\');
          except
            exit
          end;
        end;

      // move the file to archive directory
      if FileExists(tempdir+'archive\'+tempStr) then
        DeleteFile(tempdir+'archive\'+tempStr);

      RenameFile(filename,tempdir+'archive\'+tempStr);

      Filename := tempdir+'archive\'+tempStr;

      lstbxStatus.Items.Add('Sending Invoices SUCCESSFUL !!!');

      UpdateExportedInvoices(filename);

      ShowDetails;
      enableOK(self);

      bOK := true;
      ShowMessage('Electronic invoices have been sent successfully.');
    end;
end;

procedure TPBExportEInvoiceFrm.UpdateExportedInvoices(tmpFilename: string);
var
  icount: integer;
begin
  for icount := 0 to pred(lstbxInvoices.items.Count) do
    begin
      with qryUpdSIStatus do
        begin
          close;
          parambyname('Sales_Invoice').asinteger := strtoint(lstbxInvoices.items[icount]);
          parambyname('Sales_Invoice_Status').asinteger := 20;
          execsql;
        end;
      with qryUpdSInvoice do
        begin
          close;
          parambyname('Sales_Invoice').asinteger := strtoint(lstbxInvoices.items[icount]);
          parambyname('Electronic_Invoice_Filename').asstring := tmpFilename;
          parambyname('Electronic_Invoice_Date').asdatetime := now;
          execsql;
        end;
    end;

  with qryUpdCustomer do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Electronic_Invoice_File_no').asinteger := CustomerFileNo;
      execsql;
    end;
end;

procedure TPBExportEInvoiceFrm.ExportInvoice(tempCode: integer);
var
  aInvoice: TSalesInvoice;
  tempStr: string;
  icount: integer;
begin
  tempstr := '';

  aInvoice := TSalesInvoice.Create(dmEInvoice);
  try
    aInvoice.DbKey := tempCode;
    aInvoice.LoadFromDB;

    tempStr := '"' + 'A' + '"';  {Record header}
    tempstr := tempStr + ',"' + aInvoice.InvoiceOrCredit + '"';                   {Invoice / Credit Note}
    tempStr := tempStr + ',"' + aInvoice.SINumber + '"';                          {invoice Number}
    tempStr := tempStr + ',"' + pbDateStr(aInvoice.SIDate) + '"';                 {Invoice Date}

    tempStr := tempStr + ',"' + '' + '"';                                         {Despatch Date}

    tempStr := tempStr + ',"' + aInvoice.InvoiceDescription + '"';                {Project description}
    if aInvoice.InvoiceOrCredit = 'C' then
      tempStr := tempStr + ',"' + aInvoice.Reference + '"'
    else
      tempStr := tempStr + ',"' + '' + '"';                                       {Original Invoice Number - if credit note}

    tempStr := tempStr + ',"' + aInvoice.OrderNumber + '"';                        {Purchase Order Number}
    if aInvoice.InvoiceOrCredit = 'C' then
      tempStr := tempStr + ',"' + '' + '"'
    else
      tempStr := tempStr + ',"' + aInvoice.Reference + '"';                         {Supplier Order Number}
    tempStr := tempStr + ',"' + aInvoice.ClientAccountCode + '"';                 {Client Account}
    tempStr := tempStr + ',"' + aInvoice.AccountCode + '"';                       {Account Code}
    tempStr := tempStr + ',"' + aInvoice.CustomerName + '"';                      {Invoice Name}

    {Invoice address}
    aInvoice.datamodule.qryGetCustBranch.close;
    aInvoice.datamodule.qryGetCustBranch.parambyname('Customer').asinteger := aInvoice.InvToCustomer;
    aInvoice.datamodule.qryGetCustBranch.parambyname('Branch_no').asinteger := aInvoice.InvToBranch;
    aInvoice.datamodule.qryGetCustBranch.open;

    for icount := 1 to 5 do
      begin
        tempStr := tempStr + ',"' + trim(aInvoice.datamodule.qryGetCustBranch.fields[icount].asstring)+ '"';
      end;
    writeln(self.exportFile, tempStr);

    for icount := 0 to pred(aInvoice.Lines.Count) do
      begin
        tempstr := '';

        tempstr := '"' + 'B' + '"';  {Line Record header}

        tempStr := tempStr + ',"' + '' + '"';                                                           {Product Code}
        tempStr := tempStr + ',"' + aInvoice.Lines[icount].Description + '"';                           {Description}
        tempStr := tempStr + ',"' + aInvoice.Lines[icount].PriceUnitDescr + '"';                        {Price Unit}

        tempStr := tempStr + ',"' + floattostr(aInvoice.Lines[icount].Quantity) + '"';                  {Invoice Quantity}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Lines[icount].GoodsValue) + '"';       {Unit Price}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Lines[icount].TotalGoods) + '"';       {Total Value}                                {Total Nett Price}
        tempStr := tempStr + ',"' + formatfloat('0.00',aInvoice.Lines[icount].VATRate) + '"';           {VAT Rate}
        tempStr := tempStr + ',"' + '' + '"';      {VAT Code}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Lines[icount].TotalGoods * (aInvoice.Lines[icount].VATRate/100)) + '"';         {VAT Value}
        tempStr := tempStr + ',"' + '0.00' + '"';                               {Discount %}
        tempStr := tempStr + ',"' + '0.00' + '"';                               {Discount Value}
        writeln(self.exportFile, tempStr);
      end;

    {Additional Charges}
    for icount := 0 to pred(aInvoice.Charges.Count) do
      begin
        tempstr := '';

        tempstr := '"' + 'B' + '"';  {Line Record header}

        tempStr := tempStr + ',"' + '' + '"';                                                             {Product Code}
        tempStr := tempStr + ',"' + aInvoice.Charges[icount].Details + '"';                               {Description}
        tempStr := tempStr + ',"' + '' + '"';                                                             {Price Unit}

        tempStr := tempStr + ',"' + '1' + '"';                  {Invoice Quantity}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Charges[icount].Amount) + '"';       {Unit Price}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Charges[icount].Amount) + '"';       {Total Value}                                {Total Nett Price}
        tempStr := tempStr + ',"' + formatfloat('0.00',aInvoice.Charges[icount].VATRate) + '"';           {VAT Rate}
        tempStr := tempStr + ',"' + '' + '"';      {VAT Code}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Charges[icount].VATAmount) + '"';         {VAT Value}
        tempStr := tempStr + ',"' + '0.00' + '"';                               {Discount %}
        tempStr := tempStr + ',"' + '0.00' + '"';                               {Discount Value}
        writeln(self.exportFile, tempStr);
      end;
    {Invoice Summary & Amount}

    tempstr := '';
    tempStr := '"' + 'C' + '"';                                                                  {Summary Record Header}
    tempStr := tempStr + ',"' + formatfloat('0.00000',aInvoice.TotalGoods) + '"';                           {Total Net}
    tempStr := tempStr + ',"' + formatfloat('0.00000',aInvoice.TotalVAT) + '"';                             {Total Vat}
    tempStr := tempStr + ',"' + formatfloat('0.00000',((aInvoice.TotalGoods + aInvoice.TotalVat))) + '"';     {Total Gross}
    writeln(self.exportFile, tempStr);


//    aInvoice.SaveEInvoiceStatus(20);
  finally
    aInvoice.Free;
  end;

end;

procedure TPBExportEInvoiceFrm.btnSelectClick(Sender: TObject);
begin
  with qrySIHeader do
    begin
      First ;
      while eof <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := True ;
          next ;
        end;
    end;
end;

procedure TPBExportEInvoiceFrm.btnBrowseClick(Sender: TObject);
begin
  if self.OpenDialog1.Execute then
    self.edtExpFile.Text := self.OpenDialog1.Files[0];
end;

procedure TPBExportEInvoiceFrm.FormCreate(Sender: TObject);
begin
  bOK := false;
  self.edtExpFile.Text := self.GetPath;
  dmEInvoice := TdmSalesInvoice.Create(Self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBExportEInvoiceFrm.SavePath;
var
  tempStr: String;
  IniFile : TIniFile;
begin
  tempStr := edtExpFile.text;

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    IniFile.WriteString('Electronic Invoicing', 'File Path', tempStr);
  finally
    IniFile.Free;
  end;
end;

function TPBExportEInvoiceFrm.GetPath: string;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    Result := IniFile.ReadString('Electronic Invoicing', 'File Path', '');
  finally
    IniFile.Free;
  end;
end;

procedure TPBExportEInvoiceFrm.FormDestroy(Sender: TObject);
begin
  dmEInvoice.free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBExportEInvoiceFrm.rdgrpFileTypeClick(Sender: TObject);
begin
  ShowDetails;
  EnableOK(self);
end;

procedure TPBExportEInvoiceFrm.btnExcelClick(Sender: TObject);
begin
  frmpbMainMenu.ExportToExcel(PBExportEInvoiceFrm);
end;

end.
