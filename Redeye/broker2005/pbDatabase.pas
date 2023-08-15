unit PBDatabase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, stdctrls, buttons, dbctrls, spin, Grids, ComCtrls, DBGrids,
  ExtCtrls, ComObj, ActiveX,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait;

type
  TdmBroker = class(TDataModule)
    PBLDatabase: TFDConnection;
    AddIntSelQuery: TFDQuery;
    GetLastIntSelSQL: TFDQuery;
    DelWorkSQL: TFDQuery;
    AddWorkSQL: TFDQuery;
    GetButtonStatusSQL: TFDQuery;
    qryIsEnqQuickQuote: TFDQuery;
    qryGetOperator: TFDQuery;
    qryCompany: TFDQuery;
    qryGetButtons: TFDQuery;
    qryDeleteWorkStation: TFDQuery;
    qryDeleteWorkStations: TFDQuery;
    qryGetWorkStation: TFDQuery;
    qryAddWorkStation: TFDQuery;
    qryCheckWSLock: TFDQuery;
    qryGetLastWSLock: TFDQuery;
    qryAddWSLock: TFDQuery;
    qryDeleteWSLock: TFDQuery;
    qryDeleteWorkStationLock: TFDQuery;
    qryDeleteWorkStationsLocks: TFDQuery;
    qryFY: TFDQuery;
    qrySpare: TFDQuery;
    qryGetCust: TFDQuery;
    qryGetNextProductID: TFDQuery;
    qryDelTempID: TFDQuery;
    qryAddWithKey: TFDQuery;
    qryCompBranch: TFDQuery;
    qryGetOpCustomer: TFDQuery;
    qryUpCompanyDD: TFDQuery;
    qryAddReplEntity: TFDQuery;
    qryGetSupplierID: TFDQuery;
    qryGetCategory: TFDQuery;
    qryGetStoreStock: TFDQuery;
    qryGetPeriod: TFDQuery;
    qryCheckActivity: TFDQuery;
    qryCustomerSubRep: TFDQuery;
    qryGetDocumentNames: TFDQuery;
    qryZero: TFDQuery;
    qryUpdEmail: TFDQuery;
    qryAddEmail: TFDQuery;
    qryGetLastEmail: TFDQuery;
    qryAddEmailAttachment: TFDQuery;
    EmailDatabase: TFDConnection;
    qryGetCustomerRep: TFDQuery;
    qryGetRep: TFDQuery;
    qryGetCustomerSubRep: TFDQuery;
    qryCompanySupplier: TFDQuery;
    procedure PBLDatabaseAfterConnect(Sender: TObject);
    procedure PBLDatabaseLogin(AConnection: TFDCustomConnection;
      AParams: TFDConnectionDefParams);
    procedure EmailDatabaseLogin(AConnection: TFDCustomConnection;
      AParams: TFDConnectionDefParams);
    procedure PBLDatabaseBeforeConnect(Sender: TObject);
  private
    FUserName: string;
    FPassword: string;
    FIsSQL: Boolean;
    FUseSuppInvPIN: boolean;
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetUseSuppInvPIN(const Value: boolean);
    function GetNextEmailDbKey: integer;
  public
    bEmailSent: boolean;
    iAccCtrlMenu,iAccCtrl : Integer ;
    iOperator: integer;
    property UserName : string read FUserName write SetUserName;
    property Password : string read FPassword write SetPassword;
    property IsSQL : Boolean read FIsSQL;
    property UseSuppInvPIN: boolean read FUseSuppInvPIN write SetUseSuppInvPIN;
    procedure AddIntSelCode(iTempIntSelCode: Integer; rTemp: real;
      sTemp: string);
    function AccessControlOpRep(iTempAccCtrl,iOperator, iDataOp, iDataRep: integer): Integer;
    procedure AddReplicateEntity(tmpEntity, tmpCode1, tmpCode2, tmpCode3: integer; tmpAction: string);
    function AuthorisePOs: string;
    function AuthorisedMaxOrderLimit(tempCode: integer): real;
    function AutoAllocateStock: boolean;
    function AllowDeliveryImbalance: boolean;
    function AllowMultiCatInvoices(tmpCat: integer): boolean;
    function AllowOverPicking: boolean;
    function AllowStockVersions: boolean;
    function AuthorisedOrderLimit(tempCode: integer): real;
    function CanAuthorise(tempCode: integer): string;
    function CanChangeCreditDetails(tempCode: integer): boolean;
    function CanChangeInvoice: boolean;
    function CanMatchPOs: boolean;
    function CanOverridePaidStock(tempCode: integer): boolean;
    function CanUpdatePOinJobBag(tempCode: integer): boolean;
    function CheckOperatorCustomer(TempCust, TempOp: Integer): boolean;
    function ConfirmProduction: boolean;
    procedure CreateActivityDocDirectory(tempCode: string);
    procedure CreateContractDocDirectory(tempCode: string);
    procedure CreateJobBagDocDirectory(tempCode: string);
    procedure CreateEnquiryDocDirectory(tempCode: string);
    procedure CreateQuoteDocDirectory(tempCode: string);
    procedure CreateCustomerDocDirectory(tempCode: string);
    procedure CreateSupplierDocDirectory(tempCode: string);
    procedure CreatePurchaseOrderDocDirectory(tempCode: string);
    function CustAccountMandatory: boolean;
    function CustomerAccCodeUnique: boolean;
    procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    function DefaultCustomerAccCode: boolean;
    function DefaultDeliveryViaCompany: boolean;
    function DefaultVatCode: boolean;
    function DefaultSupplierAccCode: boolean;
    function DefaulttoLastDelivery: boolean;
    function DefaultPaymentTerms: integer;
    function DisplayWIPurchaseOrders: boolean;
    function DoesStockExist(sCode: string): boolean;
    procedure EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sRecipient, sSubject, sBody: string;
                                    sAttachment: Tstrings; EmailApplication, EmailAccount, OperatorName, Workstation: string);
    function GetAnalysisCode1: string;
    function GetAnalysisCode2: string;
    function GetAnalysisCode3: string;
    function GetAnalysisCode4: string;
    function GetCommissionType: string;
    function GetCurrentYearNoPeriods(tempCode: integer): integer;
    function GetCurrentYearStartPeriod(tempCode: integer): integer;
    function GetCurrentYearTitle(tempCode: integer): string;
    function GetCustomerCostCentreLevel(TempCust: Integer): string;
    function GetCustomerGDPRSigned(TempCust: Integer): boolean;
    function GetCustomerLogoFile(TempCust: Integer): string;
    function GetCustomerPaymentTerms(TempCust: integer): integer;
    function GetCustomerRep(tempCust, tempBranch: integer): integer;
    function GetCustomerSubRep(TempCust, TempRep: integer): integer;
    function GetCustomerSubRepCode(tempCust, tempBranch: integer): integer;
    function GetCustomerStatus(TempCust: Integer): string;
    function GetCustomerVATCode(TempCust: Integer): integer;
    function GetDefaultCostMarkupPerc: real;
    function GetDefaultEnquiryActivityType: integer;
    function GetDefaultOrderAckActivityType: integer;
    function GetDefaultOrderDeliveryActivityType: integer;
    function GetDefaultProofActivityType: integer;
    function GetDefaultQuoteActivityType: integer;
    function GetDefaultReorderActivityType: integer;
    function GetDocumentVersion: string;
    function GetFYCommissionType(tempCode: integer): string;
    function GetFYBudgetType(tempCode: integer): string;
    function GetNarrative(const iNarrative: integer): string;
    function GetNominalAccountLength: integer;
    function GetGlobalInvoiceEmail: string;
    function GetDefaultNominalLevel: string;
    function GetAccountsPackage: string;
    function GetSchedulePackage: string;
    function GetCheckSum: integer;
    function GetButtonStatus(iTempOp: Integer; sTempButtonName: String): Integer;
    function GetCompanyActivityDirectory: string;
    function GetCompanyDirectDebitAccountID: string;
    function GetCompanyContractDirectory: string;
    function GetCompanyEnquiryDirectory: string;
    function GetCompanyJobBagDirectory: string;
    function GetCompanyDocDirectory: string;
    function GetCompanyRegisteredAddress: string;
    function GetCompanyTransferDirectory: string;
    function GetCompanyQuoteDirectory: string;
    function GetCompanyPurchaseOrderDirectory: string;
    function GetCompanyVATRegistration: string;
    function GetCompanyCustomerDirectory: string;
    function GetCompanySupplierDirectory: string;
    function GetCompanySalesNominal: string;
    function GetCompanyPurchaseNominal: string;
    function GetCompanyPaymentNotes: integer;
    function GetCompanyName: string;
    function GetCompanySupplier: integer;
    function GetCompanySupplierBranch: integer;
    function GetCompanySupplierAccCode: string;
    function GetCompanyVatCode: integer;
    function GetCurrentYear: integer;
    function GetCurrentPeriod: integer;
    function GetDefaultPOrderLimit: real;
    function GetDefaultProductType: integer;
    function GetDefaultWarehouse: integer;
    function GetEmailAcknowledgementText: string;
    function GetEmailEnquiryText: string;
    function GetEmailInvoiceText: string;
    function GetEmailProformaText: string;
    function GetEmailPurchaseOrderText: string;
    function GetEmailQuotationText: string;
    function GetEmailStorageDirectory: string;
    function GetLastPaymentDate: TDateTime;
    function GetNextProductID: integer;
    function GetNextIntSelCode(Sender: TObject): Integer;
    function GetNextPalletID: integer;
    function GetNextDirectDebitFileNo: integer;
    function GetOperatorDocDirectory(iTempOp: integer): String;
    function GetOperatorReminders(Operator: integer; var bEnquiryReminder, bQuoteReminder, bReorderReminder, bProofReminder, bOrderAckReminder, bDeliveryReminder: boolean): boolean;
    function GetOperatorRep(iTempOp: Integer): Integer;
    function GetOperatorName(tempCode: integer): string;
    function GetPurchaseTermsFile: string;
    function GetReorderReminderInterval: integer;
    function GetReplicateDBAlias: string;
    function GetRepName(tempCode: integer): string;
    function GetSalesTermsFile: string;
    function GetStudioPriceListFile: string;
    function GetSupplierStatus(TempSupp: Integer): string;
    function IsSecurityUser(tempCode: integer): boolean;
    function IsCustomerOnStop(TempCust: Integer): boolean;
    function IsProspect(TempCust: Integer): boolean;
    function IsQuickQuote(EnqNo: integer): boolean;
    function MinimumReorderLimit: real;
    function MinimumSalesValue(tempCode: integer): real;
    function MinimumSalesValueType(tempCode: integer): string;
    function OperatorCanChangeInvoicedOrders(tempCode: integer): boolean;
    function OperatorCanDeleteJobBag(tempCode: integer): boolean;
    function OperatorCanDeletePurchaseOrders(tempCode: integer): boolean;
    function OperatorCanConfirmProduction(tempCode: integer): boolean;
    function OperatorCanDeactProduct(tempCode: integer): boolean;
    function OperatorCanConvertEnquiry(tempCode: integer): boolean;
    function OperatorCanDeletePOs(tempCode: integer): boolean;
    function OperatorCanDeleteQuoteCosts(tempCode: integer): boolean;
    function OperatorCanViewActivities(tempCode: integer): boolean;
    function OperatorCanViewPrices(tempCode: integer): boolean;
    function OperatorCannotChangeRep(tempCode: integer): boolean;
    function ProductPrefixRequired(TempCust: Integer): boolean;
    function RepIsSubRep(iTempRep: Integer): boolean;
    procedure FreeCompanyRecord;
    procedure LockCompanyRecord;
    function LockRecord(key1, key2, key3, key4, key5, tmpTable, tmpCaption: string; tmpWorkstation: integer;
                        bCanView: boolean): integer;
    function UnLockRecord(key1, key2, key3, key4, key5, tmpTable: string; tmpWorkstation: integer): integer;
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    procedure ScreenAccessControl(Sender: TObject; sButtonName: String;
                        iOperator, iDataOp, iDataRep: integer);
    function StockCodeMandatory: boolean;
    function SuppAccountMandatory: boolean;
    function SupplierAccCodeUnique: boolean;
    procedure UpdateDirectDebitFileNo;
    function UseAcquiredCustomers: boolean;
    function UseCompanyBranch: boolean;
    function UseConsolidatedInvoicing: boolean;
    function UseContracts: boolean;
    function UseCTRLPOrdering: boolean;
    function UseRevenueCentres: boolean;
    function UseCreditChecking: boolean;
    function UseJobBags: boolean;
    function UseAccountManagers: boolean;
    function UseDiscountInvoicing: boolean;
    function UseFSCClaim: boolean;
    function UseNonConformance: boolean;
    function UseGDPR: boolean;
    function UseNotesForTerms: boolean;
    function UseJobBagCosts: boolean;
    function UsePackPricing: boolean;
    function UseProduction: boolean;
    function UseCRM: boolean;
    function UseProspects: boolean;
    function UseReorderReminder: boolean;
    function UseSAPIntegration: boolean;
    function UseSubReps: boolean;
    function DefaultDeliveries: boolean;
    procedure AddWithKey(const Key: integer; Sel1, Sel2, Sel3, Sel4: real;
      const aTag, Text100: string);
    procedure DeleteRecord(const SelCode: integer);
  end;

var
  dmBroker: TdmBroker;

const
  cOnStop = 'This Customer is ON STOP, please check their current financial status.';
  cOverdue = 'This Customer''s status is OVERDUE, please check their current financial status.';

implementation

uses
  PBLogin, PBNarrativeDM, CCSCommon, System.UITypes;

{$R *.DFM}

procedure TdmBroker.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TdmBroker.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TdmBroker.PBLDatabaseAfterConnect(Sender: TObject);
var
  DriverName : string;
begin
  { Find out what kind of database this is, Access or SQL Server }
  DriverName := PBLDatabase.DriverName;
  if DriverName = 'MSSQL' then
    FIsSQL := true;
end;

procedure TdmBroker.PBLDatabaseBeforeConnect(Sender: TObject);
begin
  PBLDataBase.FormatOptions.OwnMapRules := True;
  PBLDataBase.FormatOptions.MapRules.Clear;
  PBLDataBase.FormatOptions.MapRules.Add(dtBCD, dtCurrency);
end;

procedure TdmBroker.PBLDatabaseLogin(AConnection: TFDCustomConnection;
  AParams: TFDConnectionDefParams);
begin
{$IFDEF DEMO}
  AParams.UserName := 'admin';
  AParams.Password := '';
  UserName := 'admin';
  Password := '';
{$ELSE}
  AParams.UserName := frmpbLogin.UserEdit.Text;
  AParams.Password := Trim(frmpbLogin.PasswordEdit.Text);
  UserName := frmpbLogin.UserEdit.Text;
  Password := Trim(frmpbLogin.PasswordEdit.Text);
{$ENDIF}
end;

procedure TdmBroker.AddIntSelCode(iTempIntSelCode: Integer; rTemp: real; sTemp: string);
begin
  with AddIntselQuery do
    begin
      Close ;
      ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
      ParamByName('Sel1').AsString := sTemp ;
      ParamByName('Text100').AsString := sTemp ;
      ExecSQL ;
    end;
end;

procedure TdmBroker.AddReplicateEntity(tmpEntity, tmpCode1, tmpCode2, tmpCode3: integer; tmpAction: string);
var
  iCode: integer;
begin
  iCode := tmpCode1;

  {Using the Supplier code get the SupplierID}
  if tmpEntity = 1 then
    begin
      with qryGetSupplierID do
      begin
        close;
        parambyname('Supplier').asinteger := tmpCode1;
        open;

        iCode := fieldbyname('Supplier_id').asinteger;
      end;
    end;

  with qryAddReplEntity do
    begin
      close;
      parambyname('Entity').asinteger := tmpEntity;
      parambyname('Code1').asinteger := iCode;
      parambyname('Code2').asinteger := tmpCode2;
      parambyname('Code3').asinteger := tmpCode3;
      parambyname('Replicate_Action').asstring := tmpAction;
      execsql;
    end;
end;

function TdmBroker.GetNextIntSelCode(Sender: TObject): Integer;
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

procedure TdmBroker.DelIntSelCode(iTempIntSelCode: Integer;
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

procedure TdmBroker.ScreenAccessControl(Sender: TObject; sButtonName: String;
                        iOperator, iDataOp, iDataRep: integer);
Var
TempComponent: TComponent;
TempContr: TControl ;
iCount, iTempAccCtrl: Integer;
TempGridOptions: TGridOptions ;
sTempType: String;
begin
{This routine ENABLES/DISABLES MAKES VISIBLE/MAKES INVISIBLE various screen components} ;
{based on the access control} ;
{iAccCtrl:      0=Block - can't get into program} ;
{               1=Full - unlimited access} ;
{               2=Notes - can enquiry and update notes} ;
{               3=Enquiry - can enquire only} ;
{               4=Rep - THIS FUNCTION ALLOWS ACCESS TO ALL} ;
{               5=Operator - THIS FUNCTION ALLOWS ACCESS TO ALL} ;
If sButtonName <> '' then
        begin
        {Use setting for specific button} ;
        iAccCtrl := GetButtonStatus(iOperator,sButtonName) ;
        end
else
        begin
        {Use setting for button clicked from menu} ;
        iAccCtrl := iAccCtrlMenu ;
        end;
sTempType := '' ;
If iAccCtrl = 5 then
        sTempType := 'Operator' ;
If iAccCtrl = 4 then
        sTempType := 'Rep' ;
{Convert the access level to it's simpler version} ;
iTempAccCtrl := AccessControlOpRep(iAccCtrl,iOperator, iDataOp, iDataRep) ;
{ACH 12/06/03 - Only opt out with everything enables if access level is FULL} ;
If iTempAccCtrl = 1 then
        exit ;
TempComponent := (Sender as TComponent) ;
{ if access is set to notes, but this is the events logging let it be updated}
if (iTempAccCtrl = 2) and (((TempComponent.Name = 'PBLUCContaEventsFrm') or
    (TempComponent.Name = 'PBMaintCContaEventsFrm')) or ((TempComponent.Name = 'frmPBLUCustEvents') or
    (TempComponent.Name = 'frmPBMaintContactEvents'))) then
  exit;
{If we're controlling access to a FORM, add the access details into the form's caption} ;
If (Sender is TForm) then
        begin
        If Pos('(View',(Sender as TForm).Caption) = 0 then
                begin
                (Sender as TForm).Caption := (Sender as TForm).Caption + ' (View Only' ;
                If sTempType <> '' then
                        (Sender as TForm).Caption := (Sender as TForm).Caption + ' - Different ' + sTempType ;
                (Sender as TForm).Caption := (Sender as TForm).Caption + ')' ;
                end;
        end;
  For icount := 0 to TempComponent.ComponentCount-1 do
        begin
        {Loop through the components on the screen} ;
        If TempComponent.Components[icount] is TControl then
                begin
                TempContr := TempComponent.Components[icount] as TControl;
                {Don't disbale anything in a search group box} ;
                If Assigned(TempContr.Parent) then
                        If (TempContr.Parent.Name = 'SearchGrpBox') or
                           (TempContr.Parent.Name = 'GoToGrpBox') then
                                continue ;
                {Don't disable anything in a notes tabsheet} ;
                if assigned(TempContr.parent) then
                  If (TempContr.parent.Name = 'tsIntNotes') and
                     (iTempAccCtrl <> 3) then
                    continue ;

                {Don't disable anything in a panel on a notes tabsheet} ;
                if assigned(TempContr.parent) then
                  If Assigned(TempContr.parent.parent) then
                    If (TempContr.Parent.parent.Name = 'tsIntNotes') and
                       (iTempAccCtrl <> 3) then
                      continue ;

                If (TempContr is TEdit) then
                        begin
                        if ((TempContr as TEdit).Name = 'edtSearch') or
                           ((TempContr as TEdit).Name = 'edtNumber') then
                          Continue;
                        (TempContr as TEdit).Enabled := False ;
                        continue ;
                        end;
                If TempContr is TBitBtn then
                        begin
                        If ((TempContr as TBitBtn).Name = 'CancelBitBtn') or
                           ((TempContr as TBitBtn).Name = 'btnCancel') or
                           ((TempContr as TBitBtn).Name = 'CloseBitBtn') or
                           ((TempContr as TBitBtn).Name = 'PrintBitBtn') or
                           ((TempContr as TBitBtn).Name = 'LabelsBitBtn') or
                           ((TempContr as TBitBtn).Name = 'OKBitBtn') or
                           ((TempContr as TBitBtn).Name = 'btnSearch') or
                           ((TempContr as TBitBtn).Name = 'btnSweep') or
                           (Copy((TempContr as TBitBtn).Name,1,3) = 'Sel') or
                           (Pos('NOTES',UpperCase((TempContr as TBitBtn).Name)) > 0)     then
                                continue ;
                        If ((TempContr as TBitBtn).Name = 'AddBitBtn') or
                           ((TempContr as TBitBtn).Name = 'DelBitBtn') then
                                begin
                                (TempContr as TBitBtn).Visible := False ;
                                continue ;
                                end;
                        If ((TempContr as TBitBtn).Name = 'NotesBitBtn') then
                                begin
                                {Processing for NOTES button} ;
                                (TempContr as TBitBtn).Enabled := (iTempAccCtrl = 2) ;
                                continue ;
                                end;
                        If ((TempContr as TBitBtn).Name = 'btnOK') then
                                begin
                                {Processing for OK button} ;
                                (TempContr as TBitBtn).Enabled := (iTempAccCtrl <> 3) ;
                                continue ;
                                end;
                        If ((TempContr as TBitBtn).Name = 'ChgBitBtn') or
                           ((TempContr as TBitBtn).Name = 'ChangeLineBitBtn') then
                                begin
                                {Processing for CHANGE button} ;
                                (TempContr as TBitBtn).Caption := '    &View    ' ;
                                {ACH 12/06/03 - Don't make CHANGE/VIEW button visible if status is BLOCK} ;
                                (TempContr as TBitBtn).Visible := (iTempAccCtrl <> 0) ;
                                continue ;
                                end;
                        (TempContr as TBitBtn).Enabled := False ;
                        end;
                If TempContr is TToolButton then
                        begin
                        If ((TempContr as TToolButton).Name = 'btnCancel') or
                           ((TempContr as TToolButton).Name = 'btnClose') or
                           ((TempContr as TToolButton).Name = 'btnLabels') or
                           (Copy((TempContr as TToolButton).Name,1,3) = 'Sel') or
                           (Pos('NOTES',UpperCase((TempContr as TToolButton).Name)) > 0)     then
                                continue ;
                        If ((TempContr as TToolButton).Name = 'btnAdd') or
                           ((TempContr as TToolButton).Name = 'btnQuick') or
                           ((TempContr as TToolButton).Name = 'btnCopy') or
                           ((TempContr as TToolButton).Name = 'btnRepeat') or
                           ((TempContr as TToolButton).Name = 'btnConvert') or
                           ((TempContr as TToolButton).Name = 'btnDelete') then
                                begin
                                (TempContr as TToolButton).Visible := False ;
                                continue ;
                                end;
                        If ((TempContr as TToolButton).Name = 'btnNotes') then
                                begin
                                {Processing for NOTES button} ;
                                (TempContr as TToolButton).Enabled := (iTempAccCtrl = 2) ;
                                continue ;
                                end;
                        If ((TempContr as TToolButton).Name = 'btnChange') then
                                begin
                                {Processing for CHANGE button} ;
                                (TempContr as TToolButton).Caption := '    &View    ' ;
                                {ACH 12/06/03 - Don't make CHANGE/VIEW button visible if status is BLOCK} ;
                                (TempContr as TToolButton).Visible := (iTempAccCtrl <> 0) ;
                                continue ;
                                end;
                        (TempContr as TToolButton).Enabled := False ;
                        end;
                If TempContr is TButton then
                        begin
                        If ((TempContr as TButton).Name = 'btnClose') or
                           ((TempContr as TButton).Name = 'btnSearch')then
                          Continue;
                        If ((TempContr as TButton).Name = 'btnAdd') or
                           ((TempContr as TButton).Name = 'btnDelete') then
                                begin
                                (TempContr as TButton).Visible := False ;
                                continue ;
                                end;
                        If ((TempContr as TButton).Name = 'btnNotes') then
                                begin
                                {Processing for NOTES button} ;
                                (TempContr as TButton).Enabled := (iTempAccCtrl = 2) ;
                                continue ;
                                end;
                        If ((TempContr as TButton).Name = 'btnChange') then
                                begin
                                {Processing for CHANGE button} ;
                                (TempContr as TButton).Caption := '    &View    ' ;
                                {ACH 12/06/03 - Don't make CHANGE/VIEW button visible if status is BLOCK} ;
                                (TempContr as TButton).Visible := (iTempAccCtrl <> 0) ;
                                continue ;
                                end;
                        (TempContr as TButton).Enabled := False ;
                        continue ;
                        end;
                If TempContr is TSpeedButton then
                        begin
                        (TempContr as TSpeedButton).Enabled := False ;
                        continue ;
                        end;
                If TempContr is TDBLookupComboBox then
                        begin
                        (TempContr as TDBLookupComboBox).Enabled := false ;
                        end;
                If TempContr is TCheckBox then
                        begin
                        If ((TempContr as TCheckBox).Name = 'chkbxShowInactive') then
                          continue;
                        If ((TempContr as TCheckBox).Name = 'chkbxShowArchived') then
                          continue;
                        If ((TempContr as TCheckBox).Name = 'chkbxShowStocked') then
                          continue;
                        (TempContr as TCheckBox).Enabled := false ;
                        continue;
                        end;
                If (TempContr is TMemo) then
                        begin
                        (TempContr as TMemo).ReadOnly := True ;
                        continue ;
                        end;
                If (TempContr is TSpinEdit) then
                        begin
                        (TempContr as TSpinEdit).Enabled := False ;
                        continue ;
                        end;
                If (TempContr is TGroupBox) then
                        begin
                        If ((TempContr as TGroupBox).Name = 'FuncGrpBox') and (iTempAccCtrl = 0) then
                                (TempContr as TGroupBox).Visible := False ;
                        continue ;
                        end;
                If (TempContr is TComboBox) then
                        begin
                        (TempContr as TComboBox).Enabled := False ;
                        continue ;
                        end;
                If (TempContr is TRadioGroup) then
                        begin
                        (TempContr as TRadioGroup).Enabled := False ;
                        continue ;
                        end;
                If (TempContr is TStringGrid) then
                        begin
                        TempGridOptions := (TempContr as TStringGrid).Options ;
                        If (goEditing in TempGridOptions) then
                                Exclude(TempGridOptions,goEditing) ;
                        (TempContr as TStringGrid).Options := TempGridOptions ;
                        (TempContr as TStringGrid).PopUpMenu := Nil ;
                        continue ;
                        end;
                If (TempContr is TDBGrid) then
                        begin
                        if (TempContr as TDBGrid).name = 'dbgLines' then
                          (TempContr as TDBGrid).enabled := false;
                        continue ;
                        end;
                end;
        end;
end;

function TdmBroker.GetButtonStatus(iTempOp: Integer; sTempButtonName: String): Integer;
begin
{Check what's allowed for the OPERATOR/OPTION} ;
        With GetButtonStatusSQL do
                begin
                Close ;
                ParamByName('Operator').AsInteger := iTempOp ;
                ParamByName('Button_Name').AsString := sTempButtonName ;
                Open ;
                First ;
                {To be compatible with old button_status file, no entry means blocked but zero entry means} ;
                {full access} ;
                If EOF then
                        Result := 0
                else
                        If FieldByName('Button_Status').AsString = '' then
                                Result := 1
                        else
                        Result := Pos(FieldByName('Button_Status').AsString,'BFNEROAS') - 1 ;
                end;
end;

function TdmBroker.IsQuickQuote(EnqNo: integer): boolean;
begin
  with qryIsEnqQuickQuote do
  begin
    Close;
    ParamByName('enquiry').asinteger := EnqNo;
    Open;
    if FieldByName('Enquiry_Type').asString = 'Q' then
    begin
      //quick quote indeed
      Result := true;
    end
    else
    begin
      Result := false;
    end;
    Close;
  end;
end;

function TdmBroker.GetOperatorRep(iTempOp: Integer): Integer;
begin
With qryGetOperator do
        begin
        Close ;
        ParamByName('Operator').AsInteger := iTempOp ;
        Open ;
        First ;
        Result := FieldByName('Rep').AsInteger ;
        Close ;
        end;
end;

function TdmBroker.RepIsSubRep(iTempRep: Integer): boolean;
begin
  Result := false;

  with qryGetRep do
    begin
      Close ;
      ParamByName('Rep').AsInteger := iTempRep ;
      Open ;
      First ;
      Result := (FieldByName('Rep_is_sub_rep').AsString = 'Y') ;
    end;
end;

Function TdmBroker.AccessControlOpRep(iTempAccCtrl,iOperator, iDataOp, iDataRep: integer): Integer;
begin
{Check access control for REP and OPERATOR levels} ;
Result := iTempAccCtrl ;
{ACH 20/06/03 - Deal with OPERATOR setting} ;
If iTempAccCtrl = 5 then
        begin
       If (iOperator = iDataOp) or (iDataOp = 0) then
                Result := 1
        else
                Result := 3 ;
        end;
{ACH 20/06/03 - Deal with REP setting} ;
If iTempAccCtrl = 4 then
        begin
        If (GetOperatorRep(iOperator) = iDataRep) or (iDataRep = 0) then
                Result := 1
        else
                Result := 3 ;
        end;
end;

procedure TdmBroker.SetUseSuppInvPIN(const Value: boolean);
begin
  FUseSuppInvPIN := Value;
end;

function TdmBroker.GetOperatorDocDirectory(iTempOp: integer): String;
begin
  With qryGetOperator do
  begin
    Close;
    ParamByName('Operator').AsInteger := iTempOp;
    Open;
    First;
    Result := trim(FieldByName('Document_Directory').AsString);
    Close;
  end;
end;

function TdmBroker.GetOperatorName(tempCode: integer): string;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempcode;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TdmBroker.GetCompanySupplier: integer;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Supplier').Asinteger;
  end;
end;

function TdmBroker.GetCompanyName: string;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Name').Asstring;
  end;
end;

function TdmBroker.GetDefaultWarehouse: integer;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Default_Warehouse').AsInteger
  end;
end;

function TdmBroker.GetNextPalletID: integer;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Last_Pallet_ID').AsInteger + 1;
  end;
end;

function TdmBroker.CanMatchPOs: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Match_Purchase_Orders').Asstring = 'Y';
  end;
end;

function TdmBroker.CanChangeInvoice: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Change_Invoice_After_Print').Asstring = 'Y';
  end;
end;

function TdmBroker.GetCommissionType: string;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Performance_target_type').Asstring;
  end;
end;

function TdmBroker.GetFYCommissionType(tempCode: integer): string;
begin
  with qryFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := tempCode;
      open;
      Result := FieldByName('Commission_Basis').Asstring;
    end;
end;

function TdmBroker.GetFYBudgetType(tempCode: integer): string;
begin
  with qryFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := tempCode;
      open;
      Result := FieldByName('Performance_target_type').Asstring;
    end;
end;

function TdmBroker.CanUpdatePOinJobBag(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
  begin
    close;
    parambyname('Operator').asinteger := tempCode;
    Open;
    Result := FieldByName('Maintain_PO_in_Job_Bag').Asstring = 'Y';
  end;
end;

function TdmBroker.UsePackPricing: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Pack_Pricing').Asstring = 'Y';
  end;
end;

function TdmBroker.UseRevenueCentres: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Revenue_Centres').Asstring = 'Y';
  end;
end;

function TdmBroker.UseConsolidatedInvoicing: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Consolidated_Invoicing').Asstring = 'Y';
  end;
end;

function TdmBroker.UseSAPIntegration: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_SAP_Integration').Asstring = 'Y';
  end;
end;

function TdmBroker.UseCreditChecking: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Credit_Checking').Asstring = 'Y';
  end;
end;

function TdmBroker.UseNotesForTerms: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Invoice_Notes_for_Terms').Asstring = 'Y';
  end;
end;

function TdmBroker.UseProduction: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Production').Asstring = 'Y';
  end;
end;

function TdmBroker.ConfirmProduction: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := (FieldByName('Use_Production').Asstring = 'Y') and (FieldByName('Confirm_Production').Asstring = 'Y');
  end;
end;

function TdmBroker.UseJobBags: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Job_Bag_in_Use').Asstring = 'Y';
  end;
end;

function TdmBroker.UseProspects: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Prospect_System').Asstring = 'Y';
  end;
end;

function TdmBroker.UseCRM: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_CRM_System').Asstring = 'Y';
  end;
end;

function TdmBroker.UseCompanyBranch: boolean;
begin
  with qryCompBranch do
    begin
      close;
      open;
      result := (recordcount > 0);
    end;
end;

function TdmBroker.UseDiscountInvoicing: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Discount_Invoice').Asstring = 'Y';
  end;
end;

function TdmBroker.UseAccountManagers: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Account_Managers').Asstring = 'Y';
  end;
end;

function TdmBroker.UseJobBagCosts: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Include_Job_Bag_Costs').Asstring = 'Y';
  end;
end;

function TdmBroker.GetCompanySupplierBranch: integer;
begin
 with qryCompany do
  begin
    Close;
    Open;
    Result := FieldByName('Branch_no').AsInteger;
  end;
end;

function TdmBroker.GetCompanySupplierAccCode: string;
begin
  with qryCompanySupplier do
    begin
      close;
      open;
      result := fieldbyname('Account_Code').asstring;
    end;
end;

function TdmBroker.GetCompanyVatCode: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Vat_Code').asinteger;
    end;
end;

function TdmBroker.GetCurrentYear: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Financial_Year').asinteger;
    end;
end;

function TdmBroker.GetCompanyVATRegistration: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('VAT_Registration_no').asstring;
    end;
end;

function TdmBroker.GetCompanyRegisteredAddress: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Registered_Office_Address').asstring;
    end;
end;

function TdmBroker.GetCurrentYearNoPeriods(tempCode: integer): integer;
begin
  with qryFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := tempCode;
      open;
      result := fieldbyname('No_of_Periods').asinteger;
    end;
end;

function TdmBroker.GetCurrentYearStartPeriod(tempCode: integer): integer;
begin
  with qryGetPeriod do
    begin
      close;
      parambyname('Financial_Year').asinteger := tempCode;
      open;
      result := fieldbyname('Period').asinteger;
    end;
end;

function TdmBroker.GetCurrentYearTitle(tempCode: integer): string;
begin
  with qryFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := tempCode;
      open;
      result := fieldbyname('Title').asstring;
    end;
end;

function TdmBroker.GetCurrentPeriod: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Period').asinteger;
    end;
end;

function TdmBroker.AuthorisePOs: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Authorise_POrders').asstring;
    end;
end;

function TdmBroker.GetDefaultPOrderLimit: real;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_PO_Limit').asfloat;
    end;
end;

function TdmBroker.OperatorCanViewActivities(tempCode: integer): boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := (fieldbyname('Activity_Administrator').asstring = 'Y');
    end;
end;

function TdmBroker.OperatorCanViewPrices(tempCode: integer): boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := not (fieldbyname('Cannot_View_Enq_Prices').asstring = 'Y');
    end;
end;

function TdmBroker.OperatorCannotChangeRep(tempCode: integer): boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := (fieldbyname('Cannot_Change_Rep').asstring = 'Y');
    end;
end;

function TdmBroker.DisplayWIPurchaseOrders: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Show_WI_Purchase_Orders').asstring = 'Y');
    end;
end;

function TdmBroker.IsSecurityUser(tempCode: integer): boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := (fieldbyname('Security_User').asstring = 'Y');
    end;
end;

function TdmBroker.CanAuthorise(tempCode: integer): string;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := (fieldbyname('Can_Authorise_PO').asstring);
    end;
end;

function TdmBroker.CanOverridePaidStock(tempCode: integer): boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := (fieldbyname('Override_Paid_Stock').asstring = 'Y');
    end;
end;

function TdmBroker.CanChangeCreditDetails(tempCode: integer): boolean;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := (fieldbyname('Can_Update_Credit_Details').asstring = 'Y');
    end;
end;

function TdmBroker.AuthorisedOrderLimit(tempCode: integer): real;
var
  rPOLimit, rLimit: real;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      rPOLimit := fieldbyname('Max_UnAuthorised_PO_Value').asfloat;
    end;

  rLimit := GetDefaultPOrderLimit;

  if rPOLimit <> 0 then
    rLimit := rPOLimit;

  result := rLimit;
end;

function TdmBroker.AuthorisedMaxOrderLimit(tempCode: integer): real;
var
  rPOLimit, rLimit: real;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Authorised_PO_Cost_Limit').asfloat;
    end;

(*  rLimit := GetDefaultPOrderLimit;

  if rPOLimit <> 0 then
    rLimit := rPOLimit;

  result := rLimit;
*)
end;

function TdmBroker.MinimumSalesValue(tempCode: integer): real;
var
  rPOLimit, rLimit: real;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Min_PO_Sales_Value').asfloat;
    end;
end;

function TdmBroker.MinimumSalesValueType(tempCode: integer): string;
var
  rPOLimit, rLimit: real;
begin
  result := 'F';
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Min_PO_Sales_Value_Type').asstring;
    end;
end;

function TdmBroker.OperatorCanChangeInvoicedOrders(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Can_Change_Invoiced_Orders').asstring = 'Y';
    end;
end;

function TdmBroker.OperatorCanDeletePOs(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Delete_PO_From_Job_Bag').asstring = 'Y';
    end;
end;

function TdmBroker.OperatorCanDeleteQuoteCosts(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Can_Delete_Quote_Costs').asstring = 'Y';
    end;
end;

function TdmBroker.OperatorCanDeletePurchaseOrders(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Can_Delete_Purchase_Orders').asstring = 'Y';
    end;
end;

function TdmBroker.OperatorCanDeleteJobBag(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Can_Delete_Job_Bags').asstring = 'Y';
    end;
end;

function TdmBroker.OperatorCanConvertEnquiry(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Can_Convert_Enquiry').asstring = 'Y';
    end;
end;

function TdmBroker.OperatorCanDeactProduct(tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Can_Deactivate_Products').asstring = 'Y';
    end;
end;

function TdmBroker.GetNominalAccountLength: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      if fieldbyname('Accounts_Package').AsString = 'SAGEMMS' then
        result := 14
      else
        result := 8;
    end;
end;

function TdmBroker.CustAccountMandatory: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Cust_Acc_Code_Mandatory').asstring = 'Y');
    end;
end;

function TdmBroker.SuppAccountMandatory: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Supp_Acc_Code_Mandatory').asstring = 'Y');
    end;
end;

function TdmBroker.UseFSCClaim: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_FSC_Claim').asstring = 'Y');
    end;
end;

function TdmBroker.UseGDPR: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_GDPR').asstring = 'Y');
    end;
end;

function TdmBroker.UseAcquiredCustomers: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Acquired_Customers').asstring = 'Y');
    end;
end;

function TdmBroker.UseCTRLPOrdering: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_CTRLP_Ordering').asstring = 'Y');
    end;
end;

function TdmBroker.UseNonConformance: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Non_Conformance').asstring = 'Y');
    end;
end;

function TdmBroker.UseContracts: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Contract_Module').asstring = 'Y');
    end;
end;

function TdmBroker.UseSubReps: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Use_Sub_Reps').asstring = 'Y');
    end;
end;

function TdmBroker.GetAccountsPackage: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Accounts_Package').AsString;
    end;
end;

function TdmBroker.GetReplicateDBAlias: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Replicate_DBAlias').AsString;
    end;
end;

function TdmBroker.GetSchedulePackage: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Schedule_Package').AsString;
    end;
end;

procedure TdmBroker.CreateActivityDocDirectory(tempCode: string);
var
  tempDir: string;
begin
	if GetCompanyActivityDirectory = '' then
    exit;
  tempDir := GetCompanyActivityDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

procedure TdmBroker.CreateCustomerDocDirectory(tempCode: string);
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

procedure TdmBroker.CreateSupplierDocDirectory(tempCode: string);
var
  tempDir: string;
begin
	if GetCompanySupplierDirectory = '' then
    exit;
  tempDir := GetCompanySupplierDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

procedure TdmBroker.CreateJobBagDocDirectory(tempCode: string);
var
  tempDir: string;
  DocumentDir: string;
begin
	if GetCompanyJobBagDirectory = '' then
    exit;
  tempDir := GetCompanyJobBagDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);

        {If there are any further document folders then create them}
        with qryGetDocumentNames do
          begin
            close;
            parambyname('Module_Id').asinteger := 40;  {Job Bags}
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
  	end;
end;

procedure TdmBroker.CreatePurchaseOrderDocDirectory(tempCode: string);
var
  tempDir: string;
begin
	if GetCompanyPurchaseOrderDirectory = '' then
    exit;
  tempDir := GetCompanyPurchaseOrderDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

procedure TdmBroker.CreateQuoteDocDirectory(tempCode: string);
var
  tempDir: string;
begin
	if GetCompanyQuoteDirectory = '' then
    exit;
  tempDir := GetCompanyQuoteDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

procedure TdmBroker.CreateContractDocDirectory(tempCode: string);
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

procedure TdmBroker.CreateEnquiryDocDirectory(tempCode: string);
var
  tempDir: string;
begin
	if GetCompanyEnquiryDirectory = '' then
    exit;
  tempDir := GetCompanyEnquiryDirectory+'\'+tempCode ;
  if not DirectoryExists(tempDir) then
  	begin
      try
     	  CreateDir(tempDir);
      except
      end;
  	end;
end;

function TdmBroker.GetCompanyDocDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Document_Directory').asstring);
    end;
end;

function TdmBroker.GetAnalysisCode1: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Analysis_Code_1_Caption').asstring);
    end;
end;

function TdmBroker.GetAnalysisCode2: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Analysis_Code_2_Caption').asstring);
    end;
end;

function TdmBroker.GetAnalysisCode3: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Analysis_Code_3_Caption').asstring);
    end;
end;

function TdmBroker.GetAnalysisCode4: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Analysis_Code_4_Caption').asstring);
    end;
end;

function TdmBroker.GetDocumentVersion: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Document_Version').asstring);
    end;
end;

function TdmBroker.GetCompanyJobBagDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Job_Bag_Document_Directory').asstring);
    end;
end;

function TdmBroker.GetCompanyPurchaseOrderDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Document_Directory').asstring);
    end;
end;

function TdmBroker.GetCompanyTransferDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Data_Transfer_Directory').asstring);
    end;
end;

function TdmBroker.GetCompanyQuoteDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Quote_Document_Directory').asstring);
    end;
end;

function TdmBroker.GetCompanyEnquiryDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Enquiry_Document_Directory').asstring);
    end;
end;

function TdmBroker.GetSalesTermsFile: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Sales_Order_Terms_File').asstring);
    end;
end;

function TdmBroker.GetPurchaseTermsFile: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Purchase_Order_Terms_File').asstring);
    end;
end;

function TdmBroker.GetStudioPriceListFile: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Studio_Price_Guide_File').asstring);
    end;
end;

function TdmBroker.LockRecord(key1, key2, key3, key4, key5, tmpTable, tmpCaption:string; tmpWorkstation: integer;
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
              if messagedlg(tmpTable + ' number ' + trim(key1) + ' is locked for updating by '+ qryCheckWSLock.fieldbyname('Operator_Name').asstring +
                        ' in ' + qryCheckWSLock.fieldbyname('Form_Title').asstring + ', you can only view the details. ' +
                        'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                result := 1
              else
                result := 2;
            end
          else
            begin
              messagedlg(tmpTable + ' number ' + trim(key1) + ' is locked for updating by '+ qryCheckWSLock.fieldbyname('Operator_Name').asstring +
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

function TdmBroker.UnLockRecord(key1, key2, key3, key4, key5, tmpTable: string; tmpWorkstation: integer): integer;
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

function TdmBroker.DefaultDeliveries: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := (FieldByName('Dont_default_PO_Deliveries').Asstring <> 'Y');
  end;
end;

function TdmBroker.DefaultDeliveryViaCompany: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := (FieldByName('Default_Delivery_Via_Company').Asstring = 'Y');
  end;
end;

procedure TdmBroker.FreeCompanyRecord;
begin
  with qrySpare do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TdmBroker.LockCompanyRecord;
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
  MySelf := iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qrySpare do
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

function TdmBroker.IsCustomerOnStop(TempCust: Integer): boolean;
begin
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := (FieldByName('Credit_Status').AsString = 'S');
    Close;
  end;
end;

function TdmBroker.IsProspect(TempCust: Integer): boolean;
begin
  with qryGetCust do
    begin
      Close;
      ParamByName('Customer').AsInteger := TempCust;
      Open;
      {Prospect if customer_Status is > 1 and < 100}
      result := ((fieldbyname('Customer_Status').asinteger > 1) and (fieldbyname('Customer_Status').asinteger < 100));
  end;
end;

function TdmBroker.GetCustomerGDPRSigned(TempCust: Integer): boolean;
begin
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    result := (FieldByName('GDPR_Letter_Signed').AsString = 'Y');
  end;
end;

function TdmBroker.GetCustomerStatus(TempCust: Integer): string;
begin
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    if (FieldByName('Credit_Status').AsString = 'S') and (qryCompany.fieldbyname('OnStop').asstring = 'Y') then
      result := 'B'
    else
      result := (FieldByName('Credit_Status').AsString);
  end;
end;

function TdmBroker.GetSupplierStatus(TempSupp: Integer): string;
begin
  with qryGetSupplierID do
  begin
    Close;
    ParamByName('Supplier').AsInteger := TempSupp;
    Open;
    result := (FieldByName('Acc_Active').AsString);
  end;
end;

function TdmBroker.CheckOperatorCustomer(TempCust, TempOp: Integer): boolean;
begin
  with qryGetOpCustomer do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    ParamByName('Operator').AsInteger := TempOp;
    Open;
    result := (recordcount > 0);
  end;
end;

function TdmBroker.ProductPrefixRequired(TempCust: Integer): boolean;
begin
  result := true;
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    result := (FieldByName('Product_Prefix_not_Required').AsString <> 'Y');
  end;
end;

function TdmBroker.GetCustomerCostCentreLevel(TempCust: Integer): string;
begin
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    result := (FieldByName('Cost_Centre_Level').AsString);
  end;
end;

function TdmBroker.GetCustomerLogoFile(TempCust: Integer): string;
begin
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    result := (FieldByName('Customer_Logo_File').AsString);
  end;
end;

function TdmBroker.GetCustomerVATCode(TempCust: Integer): integer;
begin
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    result := (FieldByName('VAT_Code_Def').Asinteger);
  end;
end;

function TdmBroker.AllowOverPicking: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Allow_OverPicking').Asstring = 'Y';
  end;
end;

function TdmBroker.GetNextProductID: integer;
begin
  with qryGetNextProductID do
    begin
      close;
      open;
      result := fieldbyname('Last_Product_ID').asinteger + 1;
    end;
end;

function TdmBroker.GetCompanyCustomerDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Customer_Document_Directory').asstring);
    end;
end;

function TdmBroker.GetCompanyDirectDebitAccountID: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Direct_Debit_Account_ID').asstring);
    end;
end;

function TdmBroker.GetCompanySupplierDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Supplier_Document_Directory').asstring);
    end;
end;

function TdmBroker.AutoAllocateStock: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Auto_Allocate_Stock').Asstring = 'Y';
  end;

end;

function TdmBroker.GetCompanyPaymentNotes: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Invoice_Payment_Notes').asinteger;
    end;
end;

function TdmBroker.GetLastPaymentDate: TDateTime;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Last_Payment_Update').asdatetime;
    end;
end;

function TdmBroker.GetCheckSum: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Company_CheckSum').Asinteger;
    end;
end;

function TdmBroker.DefaulttoLastDelivery: boolean;
begin
  result := false;
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Default_SO_Last_Delivery').asstring = 'Y');
    end;
end;

procedure TdmBroker.AddWithKey(const Key: integer; Sel1, Sel2, Sel3,
  Sel4: real; const aTag, Text100: string);
begin
  with qryAddWithKey do
  begin
    ParamByName('Key').AsInteger := Key;
    ParamByName('Sel1').Asfloat := Sel1;
    ParamByName('Sel2').Asfloat := Sel2;
    ParamByName('Sel3').Asfloat := Sel3;
    ParamByName('Sel4').Asfloat := Sel4;
    ParamByName('Tag').AsString := aTag;
    ParamByName('Text100').AsString := Text100;
    ExecSQL;
  end;
end;

procedure TdmBroker.DeleteRecord(const SelCode: integer);
begin
  with qryDelTempID do
  begin
    ParamByName('Int_Sel_Code').AsInteger := SelCode;
    ExecSQL;
  end;
end;

function TdmBroker.OperatorCanConfirmProduction(
  tempCode: integer): boolean;
begin
  result := false;
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempCode;
      open;
      result := fieldbyname('Can_Confirm_Production').asstring = 'Y';
    end;

end;

function TdmBroker.GetNarrative(const iNarrative: integer): string;
var
  Narrative : TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

function TdmBroker.GetEmailEnquiryText: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNarrative(FieldByName('Email_Enquiry_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdmBroker.GetEmailPurchaseOrderText: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNarrative(FieldByName('Email_Purchase_Order_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdmBroker.GetEmailAcknowledgementText: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNarrative(FieldByName('Email_Acknowledgement_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdmBroker.GetEmailQuotationText: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNarrative(FieldByName('Email_Quotation_Notes').Asinteger) + #13#10#13#10;
    end;
end;

function TdmBroker.GetEmailInvoiceText: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNarrative(FieldByName('Email_Invoice_Notes').Asinteger) + #13#10#13#10;;
    end;
end;

function TdmBroker.GetEmailProformaText: string;
begin
  with qryCompany do
    begin
      close;
      Open;
      Result := GetNarrative(FieldByName('Email_Proforma_Notes').Asinteger) + #13#10#13#10;;
    end;
end;

function TdmBroker.AllowStockVersions: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Allow_Stock_Versions').Asstring = 'Y';
  end;

end;

function TdmBroker.GetNextDirectDebitFileNo: integer;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Last_File_No_Direct_Debit').AsInteger + 1;
  end;
end;

procedure TdmBroker.UpdateDirectDebitFileNo;
begin
 with qryUpCompanyDD do
  begin
    close;
    execsql;
  end;
end;

function TdmBroker.CustomerAccCodeUnique: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Acc_Code_Cust_Unique').AsString = 'Y');
    end;
end;

function TdmBroker.SupplierAccCodeUnique: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Acc_Code_Supp_Unique').AsString = 'Y');
    end;
end;

function TdmBroker.DefaultCustomerAccCode: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Default_Customer_Account_Code').AsString = 'Y');
    end;
end;

function TdmBroker.DefaultSupplierAccCode: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Default_Supplier_Account_Code').AsString = 'Y');
    end;
end;

function TdmBroker.DefaultVatCode: boolean;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Default_Buy_Print_Vat_Code').AsString = 'Y');
    end;
end;

function TdmBroker.DefaultPaymentTerms: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := (fieldbyname('Default_Payment_Terms').Asinteger);
    end;
end;

function TdmBroker.AllowMultiCatInvoices(tmpCat: integer): boolean;
begin
  with qryGetCategory do
    begin
      close;
      parambyname('Category').asinteger := tmpCat;
      open;
      result := (fieldbyname('Multiple_Category_invoices').asstring = 'Y');
    end;
end;

function TdmBroker.DoesStockExist(sCode: string): boolean;
begin
  with qryGetStoreStock do
    begin
      close;
      parambyname('Part').asstring := sCode;
      open;
      result := (fieldbyname('Total_Stock').asinteger > 0);
    end;
end;

function TdmBroker.GetDefaultNominalLevel: string;
begin
  result := '';
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Nominal_Level').asstring;
    end;
end;

function TdmBroker.GetGlobalInvoiceEmail: string;
begin
  result := '';
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Global_Invoice_Email').asstring;
    end;
end;

function TdmBroker.GetDefaultProductType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Product_Type').asinteger;
    end;
end;

function TdmBroker.GetDefaultQuoteActivityType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Quote_Reminder_Activity_Type').asinteger;
    end;
end;

function TdmBroker.GetDefaultEnquiryActivityType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Enquiry_Reminder_Activity_Type').asinteger;
    end;
end;

function TdmBroker.GetDefaultOrderAckActivityType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Order_Ack_Activity_Type').asinteger;
    end;
end;

function TdmBroker.GetDefaultCostMarkupPerc: real;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Default_Quote_Cost_markup_perc').asfloat;
    end;
end;

function TdmBroker.GetDefaultOrderDeliveryActivityType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Order_Delivery_Activity_Type').asinteger;
    end;
end;

function TdmBroker.GetDefaultReorderActivityType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Reorder_Activity_Type').asinteger;
    end;
end;

function TdmBroker.GetDefaultProofActivityType: integer;
begin
  with qryCompany do
    begin
      close;
      open;
      result := fieldbyname('Proof_Status_Activity_Type').asinteger;
    end;
end;

function TdmBroker.GetCompanySalesNominal: string;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Sales_Nom_Def').Asstring;
  end;
end;

function TdmBroker.GetCompanyPurchaseNominal: string;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Purch_Nom_Def').Asstring;
  end;
end;

function TdmBroker.AllowDeliveryImbalance: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Allow_Delivery_Imbalance').Asstring = 'Y';
  end;
end;

function TdmBroker.StockCodeMandatory: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Stock_Ref_Mandatory').Asstring = 'Y';
  end;
end;

function TdmBroker.GetReorderReminderInterval: integer;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Reorder_Reminder_Interval').AsInteger;
  end;
end;

function TdmBroker.UseReorderReminder: boolean;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Use_Reorder_Reminder').Asstring = 'Y';
  end;
end;

function TdmBroker.MinimumReorderLimit: real;
begin
 with qryCompany do
  begin
    close;
    Open;
    Result := FieldByName('Reorder_Reminder_Min_Value').Asfloat;
  end;
end;

procedure TdmBroker.SaveNarrative(var iNarrative: Integer; const Data: string);
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.DataInfo := Data;
    Narrative.SaveToDB;
    iNarrative := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

function TdmBroker.GetCompanyActivityDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Activity_Document_Directory').asstring);
    end;
end;

function TdmBroker.GetCustomerRep(tempCust, tempBranch: integer): integer;
begin
  with qryGetCustomerRep do
    begin
      close;
      parambyname('Customer').asinteger := tempcust;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      result := fieldbyname('Rep').asinteger;
    end;
end;

function TdmBroker.GetRepName(tempCode: integer): string;
begin
  with qryGetRep do
    begin
      close;
      parambyname('Rep').asinteger := tempcode;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TdmBroker.GetCustomerSubRepCode(tempCust, tempBranch: integer): integer;
begin
  with qryGetCustomerSubRep do
    begin
      close;
      parambyname('Customer').asinteger := tempcust;
      parambyname('Branch_no').asinteger := tempBranch;
      open;
      result := fieldbyname('Rep').asinteger;
    end;
end;

function TdmBroker.GetCustomerSubRep(TempCust, TempRep: integer): integer;
begin
  result := 0;
  with qryCustomerSubRep do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Rep').asinteger := tempRep;
      open;

      result := fieldbyname('Rep').asinteger;
    end;
end;

function TdmBroker.GetOperatorReminders(Operator: integer;
  var bEnquiryReminder, bQuoteReminder, bReorderReminder, bProofReminder,
  bOrderAckReminder, bDeliveryReminder: boolean): boolean;
begin
  With qryGetOperator do
    begin
      Close ;
      ParamByName('Operator').AsInteger := Operator ;
      Open ;

      First ;
      Result := recordcount > 0;
      if result then
        begin
          bEnquiryReminder := (fieldbyname('Set_Enquiry_Reminder').AsString = 'Y');
          bQuoteReminder := (fieldbyname('Set_Quote_Reminder').AsString = 'Y');
          bProofReminder := (fieldbyname('Set_Proof_Reminder').AsString = 'Y');
          bReorderReminder := (fieldbyname('Set_Reorder_Reminder').AsString = 'Y');
          bOrderAckReminder := (fieldbyname('Set_Order_Ack_Reminder').AsString = 'Y');
          bDeliveryReminder := (fieldbyname('Set_Delivery_Reminder').AsString = 'Y');
        end;
      Close ;
    end;
end;

procedure TdmBroker.EmailDatabaseLogin(AConnection: TFDCustomConnection;
  AParams: TFDConnectionDefParams);
begin
  AParams.UserName := Self.UserName;
  AParams.Password := Self.Password;
end;

procedure TdmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sRecipient, sSubject, sBody: string;
                                    sAttachment: Tstrings; EmailApplication, EmailAccount, OperatorName, Workstation: string);
var
  iCode, iCount, iLength, iFileLength: integer;
  sLocation, sTarget, sFilename: string;
//  PBMaintainEmailfrm: TPBMaintainEmailfrm;
begin
(*  {Show the email}
  PBMaintainEmailfrm := TPBMaintainEmailfrm.create(application);
  try
    PBMaintainEmailfrm.Recipient := sRecipient;
    PBMaintainEmailfrm.Subject := sSubject;
    PBMaintainEmailfrm.Body := sBody;
    PBMaintainEmailfrm.showmodal;
    if PBMaintainEmailfrm.bOK then
      begin
        sRecipient := PBMaintainEmailfrm.Recipient;
        sSubject := PBMaintainEmailfrm.Subject;
        sBody := PBMaintainEmailfrm.Body;
      end
    else
      exit;
  finally
    PBMaintainEmailfrm.Free;
  end;

  sLocation := GetWinTempDir;
  iLength := length(sLocation);

  sTarget := dmBroker.GetEmailStorageDirectory;

  if sTarget = '' then
    sTarget := 'Z:\'
  else
    sTarget := sTarget + '\';

  iCode := GetNextEmailDbKey;

  with qryUpdEmail do
    begin
      Close;
      ParamByName('Email_ID').Asinteger := iCode;
      ParamByName('Email_Subject').Asstring := sSubject;
      ParamByName('Sender_Name').AsString := sSenderName;
      ParamByName('Sender_Email').AsString := sSenderEmail;
      ParamByName('Recipient_Name').AsString := sRecipientName;
      ParamByName('Recipient_Email').AsString := sRecipient;
      ParamByName('Body_Text').AsString := sBody;
      ParamByName('Operator_Name').Asstring := OperatorName;
      ParamByName('Workstation_Name').AsString := Workstation;
      ExecSQL;
    end;

  for icount := 0 to pred(sAttachment.count) do
    begin
      iFileLength := (length(sAttachment.Strings[iCount]) - iLength);
      sFilename := copy(sAttachment.Strings[iCount], iLength+1, iFileLength);

      FileCopy(sAttachment.Strings[iCount], sTarget + sFilename) ;

      with qryAddEmailAttachment do
        begin
          close;
          parambyname('Email_ID').asinteger := iCode;
          parambyname('Attachment_Filename').asstring := sTarget + sFilename;
          execsql;
        end;
    end;
  bEmailSent := true;
*)
end;

function TdmBroker.GetNextEmailDbKey: integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  try
    with qryAddEmail do
    begin
      ParamByName('Date_Created').Asdatetime := now;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLastEmail do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Email_Id').AsInteger;
      Close;
    end;
  finally
  end;
end;

function TdmBroker.GetEmailStorageDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Email_Storage_Directory').asstring);
    end;
end;

function TdmBroker.GetCompanyContractDirectory: string;
begin
  with qryCompany do
    begin
      close;
      open;
      result := trim(fieldbyname('Contract_Document_Directory').asstring);
    end;
end;

function TdmBroker.GetCustomerPaymentTerms(TempCust: integer): integer;
begin
  with qryGetCust do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    result := (FieldByName('Payment_Terms').Asinteger);
  end;
end;

end.
