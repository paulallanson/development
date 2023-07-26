unit PBRSEInvoice;

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
  TPBRSEInvoiceFrm = class(TForm)
    FTP: TIdFTP;
    qryCustEInvoice: TFDQuery;
    qryUpdSIStatus: TFDQuery;
    qryUpdCustomer: TFDQuery;
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
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryUpdSInvoice: TFDQuery;
    Panel1: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    qryGetInvoice: TFDQuery;
    edtInvoiceNo: TEdit;
    edtInvoiceDate: TEdit;
    edtCustomer: TEdit;
    edtDescription: TEdit;
    memTotalValue: TMemo;
    memVATValue: TMemo;
    memGoodsValue: TMemo;
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    Customer: integer;
    CustomerFileNo: integer;
    dmEInvoice: TdmSalesInvoice;
    ExportFile: textFile;
    FActivated: boolean;
    FSalesInvoice: integer;
    procedure ExportInvoice(tempCode: integer);
    procedure ShowEInvoiceDetails;
    procedure UpdateExportedInvoices(tmpFilename: string);
    procedure SetSalesInvoice(const Value: integer);
    procedure ShowDetails;
    procedure GetInvoiceDetails;
  public
    bOK: boolean;
    property SalesInvoice: integer read FSalesInvoice write SetSalesInvoice;
    { Public declarations }
  end;

var
  PBRSEInvoiceFrm: TPBRSEInvoiceFrm;

implementation

uses pbMainMenu;

{$R *.dfm}

procedure TPBRSEInvoiceFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtFTP.text <> '') and
                    (edtUsername.text <> '') and
                    (edtPassword.text <> '');
end;

procedure TPBRSEInvoiceFrm.ShowEInvoiceDetails;
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

procedure TPBRSEInvoiceFrm.btnOKClick(Sender: TObject);
var
  tempFileName, tempDir, sFileName, Filename, tempstr: string;
  bSuccess: boolean;
  icount: integer;
begin
  if MessageDlg('You are about to raise and send an electronic invoice for invoice ' + edtInvoiceNo.text +#10#13+
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

  exportInvoice(SalesInvoice);
  lstbxInvoices.Items.Add(inttostr(SalesInvoice));

  CloseFile(self.exportFile);
  icount := 1;

(*  try
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
*)

  lstbxStatus.Items.Add(inttostr(icount)+' electronic invoice created successfully.');

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

      enableOK(self);

      bOK := true;
      ShowMessage('Electronic invoices have been sent successfully.');
    end;
end;

procedure TPBRSEInvoiceFrm.UpdateExportedInvoices(tmpFilename: string);
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

procedure TPBRSEInvoiceFrm.ExportInvoice(tempCode: integer);
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

    tempStr := '"' + 'A' + '"';                                                   {Record header}
    tempstr := tempStr + ',"' + aInvoice.InvoiceOrCredit + '"';                   {Invoice / Credit Note}
    tempStr := tempStr + ',"' + aInvoice.SINumber + '"';                          {invoice Number}
    tempStr := tempStr + ',"' + pbDateStr(aInvoice.SIDate) + '"';                 {Invoice Date}

    tempStr := tempStr + ',"' + '' + '"';                                         {Despatch Date}

    tempStr := tempStr + ',"' + formatstring(aInvoice.InvoiceDescription) + '"';                {Project description}
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
        tempStr := tempStr + ',"' + formatstring(aInvoice.Lines[icount].Description) + '"';             {Description}
        tempStr := tempStr + ',"' + aInvoice.Lines[icount].PriceUnitDescr + '"';                        {Price Unit}

        tempStr := tempStr + ',"' + floattostr(aInvoice.Lines[icount].Quantity) + '"';                  {Invoice Quantity}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Lines[icount].GoodsValue) + '"';       {Unit Price}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Lines[icount].TotalGoods) + '"';       {Total Value}                                {Total Nett Price}
        tempStr := tempStr + ',"' + formatfloat('0.00',aInvoice.Lines[icount].VATRate) + '"';           {VAT Rate}
        tempStr := tempStr + ',"' + '' + '"';      {VAT Code}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Lines[icount].TotalGoods * (aInvoice.Lines[icount].VATRate/100)) + '"';         {VAT Value}
        tempStr := tempStr + ',"' + '0.00' + '"';                                                       {Discount %}
        tempStr := tempStr + ',"' + '0.00' + '"';                                                       {Discount Value}
        writeln(self.exportFile, tempStr);
      end;

    {Additional Charges}
    for icount := 0 to pred(aInvoice.Charges.Count) do
      begin
        tempstr := '';

        tempstr := '"' + 'B' + '"';  {Line Record header}

        tempStr := tempStr + ',"' + '' + '"';                                                           {Product Code}
        tempStr := tempStr + ',"' + formatstring(aInvoice.Charges[icount].Details) + '"';               {Description}
        tempStr := tempStr + ',"' + '' + '"';                                                           {Price Unit}

        tempStr := tempStr + ',"' + '1' + '"';                                                          {Invoice Quantity}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Charges[icount].Amount) + '"';         {Unit Price}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Charges[icount].Amount) + '"';         {Total Value}                                {Total Nett Price}
        tempStr := tempStr + ',"' + formatfloat('0.00',aInvoice.Charges[icount].VATRate) + '"';         {VAT Rate}
        tempStr := tempStr + ',"' + '' + '"';                                                           {VAT Code}
        tempStr := tempStr + ',"' + formatfloat('0.000',aInvoice.Charges[icount].VATAmount) + '"';      {VAT Value}
        tempStr := tempStr + ',"' + '0.00' + '"';                                                       {Discount %}
        tempStr := tempStr + ',"' + '0.00' + '"';                                                       {Discount Value}
        writeln(self.exportFile, tempStr);
      end;
    {Invoice Summary & Amount}

    tempstr := '';
    tempStr := '"' + 'C' + '"';                                                                             {Summary Record Header}
    tempStr := tempStr + ',"' + formatfloat('0.00000',aInvoice.TotalGoods) + '"';                           {Total Net}
    tempStr := tempStr + ',"' + formatfloat('0.00000',aInvoice.TotalVAT) + '"';                             {Total Vat}
    tempStr := tempStr + ',"' + formatfloat('0.00000',((aInvoice.TotalGoods + aInvoice.TotalVat))) + '"';   {Total Gross}
    writeln(self.exportFile, tempStr);

  finally
    aInvoice.Free;
  end;

end;

procedure TPBRSEInvoiceFrm.FormCreate(Sender: TObject);
begin
  bOK := false;
  dmEInvoice := TdmSalesInvoice.Create(Self);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSEInvoiceFrm.FormDestroy(Sender: TObject);
begin
  dmEInvoice.free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSEInvoiceFrm.SetSalesInvoice(const Value: integer);
begin
  FSalesInvoice := Value;
end;

procedure TPBRSEInvoiceFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    GetInvoiceDetails;
    ShowDetails;
    ShowEInvoiceDetails;
    FActivated := true;
    enableok(self);
  end;
end;

procedure TPBRSEInvoiceFrm.ShowDetails;
begin
  edtCustomer.text := qryGetInvoice.fieldbyname('Customer_Name').asstring;
  edtInvoiceNo.text := qryGetInvoice.fieldbyname('Sales_Invoice_no').asstring;
  edtInvoiceDate.text := pbDateStr(qryGetInvoice.fieldbyname('Invoice_Date').asdatetime);
  edtDescription.text := qryGetInvoice.fieldbyname('Invoice_Description').asstring;
  memGoodsValue.text := FloatToStrF(qryGetInvoice.fieldbyname('Goods_Value').asfloat, ffCurrency, 15, 2);
  memVATValue.text := FloatToStrF(qryGetInvoice.fieldbyname('VAT_Value').asfloat, ffCurrency, 15, 2);
  memTotalValue.text := FloatToStrF(qryGetInvoice.fieldbyname('Total_Value').asfloat, ffCurrency, 15, 2);

  Customer := qryGetInvoice.fieldbyname('Customer').asinteger;

end;

procedure TPBRSEInvoiceFrm.GetInvoiceDetails;
begin
  with qryGetInvoice do
    begin
      close;
      parambyname('Sales_invoice').asinteger := SalesInvoice;
      open;
    end;
end;

end.
