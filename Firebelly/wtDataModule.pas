unit wtDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ActiveX, Outlook_TLB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TdtmdlWorktops = class(TDataModule)
    dtbsWorktops: TFDConnection;
    qryNewPrice: TFDQuery;
    lkpPriceBasis: TFDTable;
    lkpPriceBasisPrice_Basis: TStringField;
    lkpPriceBasisDescription: TStringField;
    lkpPriceBasisQty_Basis_Required: TStringField;
    qryAddPrice: TFDQuery;
    qryAddPointer: TFDQuery;
    qryDelPrice: TFDQuery;
    qryDelPricePointer: TFDQuery;
    qryCompany: TFDQuery;
    qryGetLastIntSel: TFDQuery;
    qryDelWork: TFDQuery;
    qryAddWork: TFDQuery;
    qryAddIntSel: TFDQuery;
    qryUpCompany: TFDQuery;
    qryAddWorkStation: TFDQuery;
    qryGetWorkStation: TFDQuery;
    qryDeleteWorkStations: TFDQuery;
    qryDeleteWorkStation: TFDQuery;
    qryGetAddress: TFDQuery;
    qryCheckWSLock: TFDQuery;
    qryGetLastWSLock: TFDQuery;
    qryAddWSLock: TFDQuery;
    qryDeleteWSLock: TFDQuery;
    qryGetOperator: TFDQuery;
    qryGetCustomer: TFDQuery;
    qryCompanyNew: TFDQuery;
    qryGetOneCustomer: TFDQuery;
    qryGetCurrentPromo: TFDQuery;
    qryComp: TFDQuery;
    qryAddIntSelFull: TFDQuery;
    qryCheckSOLock: TFDQuery;
    qryGetLastSOLock: TFDQuery;
    qryAddSOLock: TFDQuery;
    qryDeleteSOLock: TFDQuery;
    qryGetDocumentNames: TFDQuery;
    qryGetRevenueCentre: TFDQuery;
    qryGetProduct: TFDQuery;
    qryGetCustomerBranch: TFDQuery;
    qryGetBranches: TFDQuery;
    procedure dtbsWorktopsAfterConnect(Sender: TObject);
    procedure dtbsWorktopsLogin(AConnection: TFDCustomConnection;
      AParams: TFDConnectionDefParams);
    procedure dtbsWorktopsBeforeConnect(Sender: TObject);
  private
    FIsSQL: Boolean;
    FUserName: string;
    FPassword: string;
    function GetNotes(const iNotes: integer): string;
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
  public
    property UserName : string read FUserName write SetUserName;
    property Password : string read FPassword write SetPassword;
    property IsSQL : Boolean read FIsSQL;
    function IsOutlookRunning: boolean;
    function CheckBalancePaid: boolean;
    function CheckMandatorySODates: boolean;
    procedure CreateContractDocDirectory(tempCode: string);
    procedure CreateCustomerDocDirectory(tempCode: string);
    procedure CreateCustomerSiteDocDirectory(tempCode, tempSite: string);
    procedure CreateJobDocDirectory(tempCode: string);
    procedure CreateSalesDocDirectory(tempCode: string);
    procedure CreateQuoteDirectory(tempCode: string);
    procedure DeletePrices(TempPointer: integer);
    procedure DeletePointer(TempPointer: integer);
    procedure DelIntSelCode(iTempIntSelCode: Integer;
      bTempDelCode: ByteBool);
    function DoesCustomerBranchExist(tmpCode: integer): boolean;
    procedure FreeCompanyRecord;
    procedure LockCompanyRecord;
    function GetSiteAddress(tmpCode: integer): string;
    function GetAddress(tmpCode: integer): string;
    function GetAddressCounty(tmpCode: integer): string;
    function GetAddressLocale(tmpCode: integer): string;
    function GetAddressName(tmpCode: integer): string;
    function GetAddressPostcode(tmpCode: integer): string;
    function GetAddressStreet(tmpCode: integer): string;
    function GetAddressTown(tmpCode: integer): string;
    function GetAddressEmail(tmpCode: integer): string;
    function GetAddressTelephone(tmpCode: integer): string;
    function GetCompanyContractDirectory: string;
    function GetCompanyCustomerDirectory: string;
    function GetCompanyJobDirectory: string;
    function GetCompanyPaymentNotes: integer;
    function GetCompanyQuoteDirectory: string;
    function GetCompanySalesDirectory: string;
    function GetCompanySupplierDirectory: string;
    function GetCompanySafetyDocumentFolder: string;
    function GetCompanyQuoteDocumentFolder: string;
    function GetContractDrawingFolderName: string;
    function GetContractInactiveReason: integer;
    function GetCustomerAccountCode(tmpCode: integer): string;
    function GetCustomerCount: integer;
    function GetCustomerCreditStatus(tmpCode: integer): string;
    function GetCustomerBranchName(tmpCode, tmpBranch: integer): string;
    function GetCustomerName(tmpCode: integer): string;
    function GetCustomerSalesLeadSource: integer;
    function GetCustomerVat(tmpCode: integer): integer;
    function GetCustomerVatRate(tmpCode: integer): real;
    function GetDefaultHandlingRate: real;
    function GetDefaultLabourRate: real;
    function GetDefaultMileageRate: real;
    function GetDefaultRemedialProductCode: integer;
    function GetDefaultVat: integer;
    function GetDiscountRate: real;
    function GetEmailInvoiceDetails: string;
    function GetEmailPurchaseOrderDetails: string;
    function GetEmailQuoteDetails: string;
    function GetEmailRetailQuoteDetails: string;
    function GetEmailSalesConfirmDetails: string;
    function GetEmailSalesConfirmFittingDetails: string;
    function GetEmailRetailSalesConfirmDetails: string;
    function GetNumberOfExpiryDays: integer;
    function GetNumberOfFollowUpDays: integer;
    function GetPromoFileName: string;
    function GetQuoteFollowUpReminder(tmpCode: integer): integer;
    function GetFactoredPaymentNotes: integer;
    function GetRetailPaymentNotes: integer;
    function GetNominalLevel: string;
    function GetNextIntSelCode(Sender: TObject): Integer;
    function GetOnlyCustomer: integer;
    function GetOperatorRevenueCentre(tmpCode: integer): integer;
    function GetProductDescription(iProduct: integer): string;
    function GetProductStockCode(iProduct: integer): string;
    function GetProductVat(iProduct: integer): integer;
    function GetTemplateConditionsFile: string;
    function GetAvailabilityFile: string;
    function GetTermsAndConditionsFile: string;
    function GetSoftwareCheckSum: real;
    function GetWasteMultiplier: integer;
    function GetWebImageDirectory: string;
    function LoadRevenueCentreLogo(iCode: integer): string;
    function LockAppointment(key1, tmpTable, Email:string; tmpWorkstation: integer; bCanView: boolean): integer;
    function UnLockAppointment(key1, tmpTable, Email: string): integer;
    { Private declarations }
    function LockRecord(key1, key2, key3, key4, key5, tmpTable,
      tmpCaption: string; tmpWorkstation: integer;
      bCanView: boolean): integer;
    function UnLockRecord(key1, key2, key3, key4, key5, tmpTable: string;
      tmpWorkstation: integer): integer;
    function OperatorCanUpdateSchedule(tmpCode: integer): boolean;
    function PricesAreTrade: boolean;
    function SchedulingSystem: string;
    function UseContractQuoting: boolean;
    function UseCostingSystem: boolean;
    function UseDocumentTransfer: boolean;
    function UsePurchaseOrdering: boolean;
    function UseRemedialsAsOrders: boolean;
    function UseRevenueCentres: boolean;
    function UseSlabContractQuoting: boolean;
    function UseTradeDetails: boolean;
  end;

var
  dtmdlWorktops: TdtmdlWorktops;

const
  cBlock = 'This Customer is currently On Stop.'+#10#13+'Orders cannot be processed for customers On Stop.';
  cOnStop = 'This Customer is ON STOP, please check their current financial status.';
  cOverdue = 'This Customer''s status is OVERDUE, please check their current financial status.';

implementation

uses
  WTLogin, wtNotesDM, wtMain;

{$R *.DFM}

{ TdtmdlWorktops }

procedure TdtmdlWorktops.DeletePointer(TempPointer: integer);
begin
  with qryDelPricePointer do
    begin
      close;
      parambyname('Price_Pointer').asinteger := TempPointer;
      execsql;
    end;
end;

procedure TdtmdlWorktops.DeletePrices(TempPointer: integer);
begin
  with qryDelPrice do
    begin
      close;
      parambyname('Price_Pointer').asinteger := TempPointer;
      execsql;
    end;
end;

function TdtmdlWorktops.GetAddressName(tmpCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := fieldbyname('Address_Name').asstring;
    end;
end;

function TdtmdlWorktops.GetAddressStreet(tmpCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := fieldbyname('Street').asstring;
    end;
end;

function TdtmdlWorktops.GetAddressLocale(tmpCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := fieldbyname('Locale').asstring;
    end;
end;

function TdtmdlWorktops.GetAddressTown(tmpCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := fieldbyname('Town_City').asstring;
    end;
end;

function TdtmdlWorktops.GetAddressPostcode(tmpCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := fieldbyname('Postcode').asstring;
    end;
end;

function TdtmdlWorktops.GetAddressCounty(tmpCode: integer): string;
begin
  result := '';
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := fieldbyname('County_State').asstring;
    end;
end;

function TdtmdlWorktops.GetAddressTelephone(tmpCode: integer): string;
begin
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := trim(fieldbyname('Telephone_Number').asstring);
    end;
end;

function TdtmdlWorktops.GetAddressEmail(tmpCode: integer): string;
begin
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      result := trim(fieldbyname('Email_Address').asstring);
    end;
end;

function TdtmdlWorktops.GetAddress(tmpCode: integer): string;
var
  ifield: integer;
begin
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      for ifield := 1 to 6 do
        begin
          if fields[ifield].asstring = '' then
            continue;
          if ifield = 1 then
            result := trim(fields[ifield].asstring)
          else
            result := result + #13#10 + trim(fields[ifield].asstring);
        end;
    end;
end;

function TdtmdlWorktops.GetSiteAddress(tmpCode: integer): string;
var
  ifield: integer;
begin
  with qryGetAddress do
    begin
      close;
      parambyname('Address').asinteger := tmpCode;
      open;
      for ifield := 1 to 6 do
        begin
          if fields[ifield].asstring = '' then
            continue;
          if ifield = 1 then
            result := trim(fields[ifield].asstring)
          else
            result := result + ', ' + trim(fields[ifield].asstring);
        end;
    end;
end;

function TdtmdlWorktops.GetQuoteFollowUpReminder(tmpCode: integer): integer;
var
  ifield: integer;
begin
  result := 0;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tmpCode;
      open;
      result := fieldbyname('Quote_Follow_Up_Reminder').asinteger;
    end;
end;

function TdtmdlWorktops.GetOperatorRevenueCentre(tmpCode: integer): integer;
var
  ifield: integer;
begin
  result := 0;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tmpCode;
      open;
      result := fieldbyname('Revenue_Centre').asinteger;
    end;
end;

function TdtmdlWorktops.IsOutlookRunning: boolean;
var
	Unknown		 : IUnknown;
begin
  {Check if Outlook is already running, this uses Outlook 2000}
  if FindWindow('mspim_wnd32','Microsoft Outlook') <> 0 then
    result := true
  else
    result := false;
end;

function TdtmdlWorktops.OperatorCanUpdateSchedule(tmpCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tmpCode;
      open;
      result := (fieldbyname('Can_Update_Schedule').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.GetCompanyJobDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Job_Document_Directory').asstring);
    end;
end;

function TdtmdlWorktops.GetCompanySalesDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Sales_Document_Directory').asstring);
    end;
end;

function TdtmdlWorktops.GetCompanyQuoteDocumentFolder: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Quotation_Document_Folder').asstring);
    end;
end;

function TdtmdlWorktops.GetCompanySafetyDocumentFolder: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Safety_Document_Folder').asstring);
    end;
end;

function TdtmdlWorktops.GetWebImageDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Website_Image_Directory').asstring);
    end;
end;

function TdtmdlWorktops.GetTemplateConditionsFile: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Template_Conditions_File').asstring);
    end;
end;

function TdtmdlWorktops.GetAvailabilityFile: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Sales_Availability_File').asstring);
    end;
end;

function TdtmdlWorktops.GetTermsAndConditionsFile: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Sales_Order_Terms_File').asstring);
    end;
end;

function TdtmdlWorktops.GetCompanyPaymentNotes: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Invoice_Payment_Notes').asinteger;
    end;
end;

function TdtmdlWorktops.GetRetailPaymentNotes: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Retail_Payment_Notes').asinteger;
    end;
end;

function TdtmdlWorktops.GetFactoredPaymentNotes: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Factored_Payment_Notes').asinteger;
    end;
end;

function TdtmdlWorktops.GetCompanyContractDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Contract_Document_Directory').asstring);
    end;
end;

function TdtmdlWorktops.GetContractDrawingFolderName: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Contract_Drawing_Folder_Name').asstring);
    end;
end;

function TdtmdlWorktops.GetContractInactiveReason: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Contract_Inactive_Reason').asinteger;
    end;
end;

function TdtmdlWorktops.GetCustomerCount: integer;
begin
  with qryGetCustomer do
    begin
      close;
      open;
      result := recordcount;
    end;
end;

function TdtmdlWorktops.GetOnlyCustomer: integer;
begin
  with qryGetCustomer do
    begin
      close;
      open;
      result := fieldbyname('Customer').asinteger;
    end;
end;

function TdtmdlWorktops.GetCompanyCustomerDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Customer_Document_Directory').asstring);
    end;
end;

function TdtmdlWorktops.GetCompanySupplierDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Supplier_Document_Directory').asstring);
    end;
end;

procedure TdtmdlWorktops.CreateContractDocDirectory(tempCode: string);
var
  tempDir: string;
begin
	if GetCompanyContractDirectory = '' then
    exit;
  tempDir := GetCompanyContractDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

procedure TdtmdlWorktops.CreateCustomerDocDirectory(tempCode: string);
var
  tempDir: string;
begin
	if GetCompanyCustomerDirectory = '' then
    exit;
  tempDir := GetCompanyCustomerDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

procedure TdtmdlWorktops.CreateCustomerSiteDocDirectory(tempCode, tempSite: string);
var
  tempDir: string;
begin
	if GetCompanyCustomerDirectory = '' then
    exit;
  tempDir := GetCompanyCustomerDirectory+'\'+tempCode+'\'+tempSite ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

procedure TdtmdlWorktops.CreateJobDocDirectory(tempCode: string);
var
  tempDir: string;
  DocumentDir: string;
begin
	if GetCompanyJobDirectory = '' then
    exit;
  tempDir := GetCompanyJobDirectory+'\'+tempCode ;
//  if not DirectoryExists(tempDir) then
//  	begin
      try
     	  CreateDir(tempDir);
        {If there are any further document folders then create them}
        with qryGetDocumentNames do
          begin
            close;
            parambyname('Module_Id').asinteger := 50;  {sales orders}
            open;

            first;

            while eof <> true do
              begin
                DocumentDir := tempDir + '\' + fieldbyname('Folder_Name').asstring;
     	          CreateDir(DocumentDir);
                next;
              end;
          end;
      except
      end;
//  	end;
end;

procedure TdtmdlWorktops.CreateSalesDocDirectory(tempCode: string);
var
  tempDir: string;
  DocumentDir: string;
begin
	if GetCompanySalesDirectory = '' then
    exit;
  tempDir := GetCompanySalesDirectory+'\'+tempCode ;
//  if not DirectoryExists(tempDir) then
//  	begin
      try
     	  CreateDir(tempDir);

        {If there are any further document folders then create them}
        with qryGetDocumentNames do
          begin
            close;
            parambyname('Module_Id').asinteger := 40;  {sales orders}
            open;

            first;

            while eof <> true do
              begin
                DocumentDir := tempDir + '\' + fieldbyname('Folder_Name').asstring;
     	          CreateDir(DocumentDir);
                next;
              end;
          end;
      except
      end;
//  	end;
end;

procedure TdtmdlWorktops.CreateQuoteDirectory(tempCode: string);
var
  tempDir: string;
  DocumentDir: string;
begin
	if GetCompanyQuoteDirectory = '' then
    exit;
  tempDir := GetCompanyQuoteDirectory+'\'+tempCode ;
//  if not DirectoryExists(tempDir) then
//  	begin
      try
     	  CreateDir(tempDir);
        {If there are any further document folders then create them}
        with qryGetDocumentNames do
          begin
            close;
            parambyname('Module_Id').asinteger := 30;  {quotes }
            open;

            first;

            while eof <> true do
              begin
                DocumentDir := tempDir + '\' + fieldbyname('Folder_Name').asstring;
     	          CreateDir(DocumentDir);
                next;
              end;
          end;
      except
      end;
//  	end;
end;

function TdtmdlWorktops.GetNextIntSelCode(Sender: TObject): Integer;
var
  iIntSelCode: Integer ;
begin
  {Get the next int_sel_code to use} ;
  with qryGetLastIntSel do
    begin
      Close ;
      Open ;
      First;
      iIntSelCode := FieldByName('Last_Code').AsInteger + 1 ;
    end;
  {Reserve it on the int_sel file} ;
  with qryAddWork do
    begin
      Close ;
      ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
      ParamByName('Text100').AsString := '' ;
      ExecSQL ;
    end;
  Result := iIntSelCode ;
end;

procedure TdtmdlWorktops.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
begin
  {Delete ALL entries on the workfile for the int_sel_code} ;
  with qryDelWork do
    begin
      Close;
      ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
      ExecSQL;
    end;

  {Add the reserving one back in} ;
  if not bTempDelCode then
    begin
      With qryAddWork do
        begin
          Close ;
          ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
          ParamByName('Text100').AsString := '' ;
          ExecSQL ;
        end;
    end;
end;

procedure TdtmdlWorktops.dtbsWorktopsAfterConnect(Sender: TObject);
var
  DriverName : string;
begin
  { Find out what kind of database this is, Access or SQL Server }
  DriverName := dtbsWorktops.DriverName;

  if DriverName = 'MSSQL' then
    FIsSQL := true;
end;

procedure TdtmdlWorktops.dtbsWorktopsBeforeConnect(Sender: TObject);
begin
  dtbsWorktops.FormatOptions.OwnMapRules := True;
  dtbsWorktops.FormatOptions.MapRules.Clear;
  dtbsWorktops.FormatOptions.MapRules.Add(dtDateTimeStamp, dtDateTime);
end;

procedure TdtmdlWorktops.dtbsWorktopsLogin(AConnection: TFDCustomConnection; AParams: TFDConnectionDefParams);
begin
{$IFDEF DEMO}
  UserName := 'admin';
  Password := '';
  AParams.UserName := Username;
  AParams.Password := Password;
{$ELSE}
  UserName := frmWTLogin.UserEdit.Text;
  Password := Trim(frmWTLogin.PasswordEdit.Text);
  AParams.UserName := Username;
  AParams.Password := Password;
{$ENDIF}
end;

function TdtmdlWorktops.UseRemedialsAsOrders: boolean;
begin
  try
    with qryCompany do
      begin
        close;
        open;
        result := (fieldbyname('Use_Remedials_As_Orders').asstring = 'Y');
      end;
  except
  end;
end;

function TdtmdlWorktops.UseRevenueCentres: boolean;
begin
  try
    with qryCompany do
      begin
        close;
        open;
        result := (fieldbyname('Use_Revenue_Centres').asstring = 'Y');
      end;
  except
  end;
end;

function TdtmdlWorktops.UseCostingSystem: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Costing_System').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.UseDocumentTransfer: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Document_Transfer').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.UseContractQuoting: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Contract_Quoting').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.GetPromoFileName: string;
begin
  with qryGetCurrentPromo do
    begin
      close;
      parambyname('Current_Date').asdatetime := date;
      open;
      result := (fieldbyname('image_path').asstring);
    end;
end;

function TdtmdlWorktops.UsePurchaseOrdering: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Purchase_Ordering').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.SchedulingSystem: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Schedule_Package').asstring;
    end;
end;

function TdtmdlWorktops.UseTradeDetails: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Trade_Layout').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.CheckBalancePaid: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Balance_Required_Before_Fit').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.GetDiscountRate: real;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Discount_Rate').asfloat;
    end;
end;

function TdtmdlWorktops.GetDefaultHandlingRate: real;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_Handling_Rate').asfloat;
    end;
end;

function TdtmdlWorktops.GetDefaultMileageRate: real;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_Mileage_Rate').asfloat;
    end;
end;

function TdtmdlWorktops.GetDefaultLabourRate: real;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_Labour_Rate').asfloat;
    end;
end;

function TdtmdlWorktops.GetDefaultVat: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_Vat').asinteger;
    end;
end;

function TdtmdlWorktops.GetDefaultRemedialProductCode: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Def_Remedial_Product_Code').asinteger;
    end;
end;

function TdtmdlWorktops.GetProductDescription(iProduct: integer): string;
begin
  with qryGetProduct do
    begin
      close;
      parambyname('Product').asinteger := iProduct;
      open;
      result := fieldbyname('Product_Description').asstring;
    end;
end;

function TdtmdlWorktops.GetProductStockCode(iProduct: integer): string;
begin
  with qryGetProduct do
    begin
      close;
      parambyname('Product').asinteger := iProduct;
      open;
      result := fieldbyname('Product_Code').asstring;
    end;
end;

function TdtmdlWorktops.GetProductVat(iProduct: integer): integer;
begin
  with qryGetProduct do
    begin
      close;
      parambyname('Product').asinteger := iProduct;
      open;
      result := fieldbyname('Vat').asinteger;
    end;
end;

function TdtmdlWorktops.GetSoftwareCheckSum: real;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Software_CheckSum').asinteger;
    end;
end;

function TdtmdlWorktops.LockAppointment(key1, tmpTable, Email:string; tmpWorkstation: integer;
                          bCanView: boolean): integer;
var
  icount: integer;
  iLastRecord: integer;
begin
  result := 0;
  // First of all check that the record isn't already locked
  with qryCheckSOLock do
    begin
      close;
      for icount := 0 to pred(params.count) do
        params[icount].Clear;

      parambyname('Id').asstring := key1;
      parambyname('User').asstring := Email;

      open;
      if recordcount > 0 then
        begin
          if bCanView then
            begin
              if messagedlg('This ' + tmpTable + ' is locked for updating of the schedule by '+ qryCheckSOLock.fieldbyname('User').asstring +
                        ', you can only view the details. ' +
                        'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                result := 1
              else
                result := 2;
            end
          else
            begin
              messagedlg('This ' + tmpTable + ' is locked for updating of the schedule by '+ qryCheckSOLock.fieldbyname('User').asstring +
                        ', you cannot continue?', mtError, [mbAbort], 0);
              result := 2;
            end;
          exit;
        end;
    end;

(*  // This record hasn't been locked so let's do it now
  with qryGetLastSOLock do
    begin
      close;
      parambyname('Workstation').asstring := inttostr(tmpWorkstation);
      open;
      iLastRecord := fieldbyname('Last_lock_no').asinteger + 1;
    end;
*)

  with qryAddSOLock do
    begin
      close;
      for icount := 0 to pred(params.count) do
        params[icount].Clear;

      parambyname('Id').asstring := key1;
      parambyname('Is_Opened').asstring := 'Y';
      parambyname('User').asstring := Email;
      parambyname('Workstation').asinteger := frmWTMain.workstation;

      execsql;
      result := 0;
    end;
end;

function TdtmdlWorktops.UnLockAppointment(key1, tmpTable, Email: string): integer;
var
  icount: integer;
begin
  with qryDeleteSOLock do
    begin
      close;
      for icount := 0 to pred(params.count) do
        params[icount].Clear;

      parambyname('Id').asstring := key1;
//      parambyname('User').asstring := Email;
      parambyname('Workstation').asinteger := frmWTMain.Workstation;
      execsql;
    end;
end;

function TdtmdlWorktops.LockRecord(key1, key2, key3, key4, key5, tmpTable, tmpCaption:string; tmpWorkstation: integer;
                              bCanView: boolean): integer;
var
  icount: integer;
  iLastRecord: integer;
begin
  result := 0;
  // First of all check that the record isn't already locked
  with qryCheckWSLock do
    begin
      close;
      for icount := 0 to pred(params.count) do
        params[icount].Clear;

      parambyname('Table_Name').asstring := tmpTable;
      parambyname('Workstation').asstring := inttostr(tmpWorkstation);

      parambyname('Key_Value_1').asstring := key1;
      parambyname('Key_Value_2').asstring := key2;
      parambyname('Key_Value_3').asstring := key3;
      parambyname('Key_Value_4').asstring := key4;
      parambyname('Key_Value_5').asstring := key5;

      open;
      if recordcount > 0 then
        begin
          if bCanView then
            begin
              if messagedlg('This ' + tmpTable + ' is locked for updating by '+ qryCheckWSLock.fieldbyname('Operator_Name').asstring +
                        ' in ' + qryCheckWSLock.fieldbyname('Form_Title').asstring + ', you can only view the details. ' +
                        'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                result := 1
              else
                result := 2;
            end
          else
            begin
              messagedlg('This ' + tmpTable + ' is locked for updating by '+ qryCheckWSLock.fieldbyname('Operator_Name').asstring +
                        ' in ' + qryCheckWSLock.fieldbyname('Form_Title').asstring + ', you cannot continue?', mtError, [mbAbort], 0);
              result := 2;
            end;
          exit;
        end;
    end;

  // This record hasn't been locked so let's do it now
  with qryGetLastWSLock do
    begin
      close;
      parambyname('Workstation').asstring := inttostr(tmpWorkstation);
      open;
      iLastRecord := fieldbyname('Last_lock_no').asinteger + 1;
    end;

  with qryAddWSLock do
    begin
      close;
      for icount := 0 to pred(params.count) do
        params[icount].Clear;

      parambyname('Workstation').asstring := inttostr(tmpWorkstation);
      parambyname('Lock_no').asinteger := iLastRecord;
      parambyname('Table_Name').asstring := tmpTable;
      parambyname('Form_Title').asstring := tmpCaption;

      parambyname('Key_Value_1').asstring := key1;
      parambyname('Key_Value_2').asstring := key2;
      parambyname('Key_Value_3').asstring := key3;
      parambyname('Key_Value_4').asstring := key4;
      parambyname('Key_Value_5').asstring := key5;

      execsql;
      result := 0;
    end;
end;

function TdtmdlWorktops.UnLockRecord(key1, key2, key3, key4, key5, tmpTable: string; tmpWorkstation: integer): integer;
var
  icount: integer;
begin
  with qryDeleteWSLock do
    begin
      close;
      for icount := 0 to pred(params.count) do
        params[icount].Clear;

      parambyname('Table_Name').asstring := tmpTable;
      parambyname('Workstation').asstring := inttostr(tmpWorkstation);

      parambyname('Key_Value_1').asstring := key1;
      parambyname('Key_Value_2').asstring := key2;
      parambyname('Key_Value_3').asstring := key3;
      parambyname('Key_Value_4').asstring := key4;
      parambyname('Key_Value_5').asstring := key5;
      execsql;
    end;
end;

function TdtmdlWorktops.GetNominalLevel: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Nominal_Level').asstring;
    end;
end;

function TdtmdlWorktops.GetCompanyQuoteDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Quote_Document_Directory').asstring);
    end;
end;

function TdtmdlWorktops.PricesAreTrade: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Prices_Are_Trade').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.GetEmailQuoteDetails: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNotes(FieldByName('Email_Quotation_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdtmdlWorktops.GetEmailRetailQuoteDetails: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNotes(FieldByName('Email_Retail_Quote_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdtmdlWorktops.GetEmailSalesConfirmDetails: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNotes(FieldByName('Email_Sales_Confirm_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdtmdlWorktops.GetEmailPurchaseOrderDetails: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNotes(FieldByName('Email_Purchase_Order_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdtmdlWorktops.GetEmailSalesConfirmFittingDetails: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNotes(FieldByName('Email_Fitting_Confirm_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdtmdlWorktops.GetEmailRetailSalesConfirmDetails: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNotes(FieldByName('Email_Retail_SO_Confirm_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdtmdlWorktops.GetEmailInvoiceDetails: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNotes(FieldByName('Email_Invoice_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdtmdlWorktops.GetNotes(const iNotes: integer): string;
var
  Notes : TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iNotes;
    Notes.LoadFromDB;
    Result := Notes.Data;
  finally
    Notes.Free;
  end;
end;

function TdtmdlWorktops.GetWasteMultiplier: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Waste_Cost_Multiplier').asInteger;
    end;
end;

function TdtmdlWorktops.GetNumberOfExpiryDays: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_Quote_Valid_days').asinteger;
    end;
end;

function TdtmdlWorktops.GetNumberOfFollowUpDays: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_Quote_Follow_Up_days').asinteger;
    end;
end;

procedure TdtmdlWorktops.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TdtmdlWorktops.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

function TdtmdlWorktops.CheckMandatorySODates: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Mandatory_Temp_Fit_Dates').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.GetCustomerCreditStatus(tmpCode: integer): string;
begin
  with qryGetOneCustomer do
  begin
    Close;
    ParamByName('Customer').AsInteger := tmpCode;
    Open;
    if (FieldByName('Credit_Status').AsString = 'S') and (qryCompany.fieldbyname('Use_OnStop').asstring = 'Y') then
      result := 'B'
    else
    if (FieldByName('Credit_Status').AsString = 'L') and (FieldByName('Credit_Limit').Asinteger = 0) then
      result := 'P'
    else
      result := (FieldByName('Credit_Status').AsString);
  end;
end;

function TdtmdlWorktops.GetCustomerVatRate(tmpCode: integer): real;
begin
  with qryGetOneCustomer do
  begin
    Close;
    ParamByName('Customer').AsInteger := tmpCode;
    Open;
    result := (FieldByName('Vat_Rate').AsInteger);
  end;
end;

function TdtmdlWorktops.GetCustomerName(tmpCode: integer): string;
begin
  with qryGetOneCustomer do
  begin
    Close;
    ParamByName('Customer').AsInteger := tmpCode;
    Open;
    result := (FieldByName('Customer_Name').Asstring);
  end;
end;

function TdtmdlWorktops.GetCustomerVat(tmpCode: integer): integer;
begin
  with qryGetOneCustomer do
  begin
    Close;
    ParamByName('Customer').AsInteger := tmpCode;
    Open;
    result := (FieldByName('Vat').AsInteger);
  end;
end;

function TdtmdlWorktops.GetCustomerBranchName(tmpCode, tmpBranch: integer): string;
begin
  with qryGetCustomerBranch do
  begin
    Close;
    ParamByName('Customer').AsInteger := tmpCode;
    ParamByName('Branch_No').AsInteger := tmpBranch;
    Open;
    result := (FieldByName('Branch_Name').Asstring);
  end;
end;

procedure TdtmdlWorktops.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := frmwtMain.Operator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryComp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;

procedure TdtmdlWorktops.FreeCompanyRecord;
begin
  with qryComp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

function TdtmdlWorktops.UseSlabContractQuoting: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Contract_Quote_By_Slab').asstring = 'Y');
    end;
end;

function TdtmdlWorktops.GetCustomerSalesLeadSource: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Customer_Sales_Lead_Source').asinteger;
    end;
end;

function TdtmdlWorktops.LoadRevenueCentreLogo(iCode: integer): string;
begin
  with qryGetRevenueCentre do
    begin
      close;
      parambyname('Revenue_Centre').asinteger := iCode;
      open;
      result := fieldbyname('Logo_Path').asstring;
    end;
end;

function TdtmdlWorktops.GetCustomerAccountCode(tmpCode: integer): string;
begin
  with qryGetOneCustomer do
  begin
    Close;
    ParamByName('Customer').AsInteger := tmpCode;
    Open;
    result := (FieldByName('Account_Code').Asstring);
  end;
end;

function TdtmdlWorktops.DoesCustomerBranchExist(tmpCode: integer): boolean;
begin
  with qryGetBranches do
  begin
    Close;
    ParamByName('Customer').AsInteger := tmpCode;
    Open;
    result := recordcount > 0
  end;
end;

end.
