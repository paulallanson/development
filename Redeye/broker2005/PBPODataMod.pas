unit PBPODataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, PBPOObjects, ActnList, PBDocObjects, System.Actions,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBPODM = class(TDataModule)
    CurrSRC: TDataSource;
    GetCurrSQL: TFDQuery;
    InvMethSRC: TDataSource;
    GetInvMethSQL: TFDQuery;
    GetSuppAddrSQL: TFDQuery;
    GetCompAddrSQL: TFDQuery;
    GetCustAddrSQL: TFDQuery;
    GetRepAddrSQL: TFDQuery;
    AddrSRC: TDataSource;
    GetAddHocAddrSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    UpdPOLinesSQL: TFDQuery;
    DelPOLineSQL: TFDQuery;
    UpdPOLineSQL: TFDQuery;
    AddPOLineSQL: TFDQuery;
    GetPOLineSQL: TFDQuery;
    DelPODelivsSQL: TFDQuery;
    GetPODelivSQL: TFDQuery;
    UpdPODelivsSQL: TFDQuery;
    UpdPODelivSQL: TFDQuery;
    AddPODelivSQL: TFDQuery;
    GetLineDetsSQL: TFDQuery;
    GetDelDetsSQL: TFDQuery;
    AddProofSQL: TFDQuery;
    DelProofHistorySQL: TFDQuery;
    GetSuppContSQL: TFDQuery;
    GetDelPOLinesSQL: TFDQuery;
    GetLineMemoSQL: TFDQuery;
    GetExtChgSQL: TFDQuery;
    UpdExtChgsSQL: TFDQuery;
    GetExtChgsSQL: TFDQuery;
    AddExtChgSQL: TFDQuery;
    UpdExtChgSQL: TFDQuery;
    DelExtChgsSQL: TFDQuery;
    UpEnqHeadSQL: TFDQuery;
    GetStatusSQL: TFDQuery;
    UpEnqLineSQL: TFDQuery;
    DelJobBagDetsSQL: TFDQuery;
    UpdJobBagSQL: TFDQuery;
    CopyEnqPartDetSQL: TFDQuery;
    CopyEnqAdditionalsSQL: TFDQuery;
    DelPOLinePartsSQL: TFDQuery;
    DelPOAdditionalsSQL: TFDQuery;
    GetSupplierSQL: TFDQuery;
    VATSRC: TDataSource;
    GetPriceUnitSQL: TFDQuery;
    PriceUnitSRC: TDataSource;
    GetProofStatSQL: TFDQuery;
    ProofStatSRC: TDataSource;
    GetJobBagDetsSQL: TFDQuery;
    GetFormRefSQL: TFDQuery;
    GetCustSQL: TFDQuery;
    GetCustBranchSQL: TFDQuery;
    GetRepSQL: TFDQuery;
    GetProdTypesSQL: TFDQuery;
    GetCustRepsSQL: TFDQuery;
    GetPartDetsSQL: TFDQuery;
    GetAddDetsSQL: TFDQuery;
    AddPartDetSQL: TFDQuery;
    AddAddDetsSQL: TFDQuery;
    NCRSQL: TFDQuery;
    ProductSQL: TFDQuery;
    StdSizeSQL: TFDQuery;
    NCRSRC: TDataSource;
    OperatorSQL: TFDQuery;
    OperatorSRC: TDataSource;
    GetPOSQL: TFDQuery;
    PriceUnitLUSQL: TFDQuery;
    CustContactSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    UpdLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    qryCompany: TFDQuery;
    GetSuppBranchSQL: TFDQuery;
    GetQuestionsSQL: TFDQuery;
    DelPOQuestionsSQL: TFDQuery;
    AddPOQuestionSQL: TFDQuery;
    GetNCRDescSQL: TFDQuery;
    AnyQuestions: TFDQuery;
    PaperDetailSQL: TFDQuery;
    qryGeneral: TFDQuery;
    GetLineProdTypeSQL: TFDQuery;
    GetPOQuestionSQL: TFDQuery;
    GetOffContactSQL: TFDQuery;
    GetSuppContactSQL: TFDQuery;
    GetLineCallOffsSQL: TFDQuery;
    GetCompanySQL: TFDQuery;
    CustContactSRC: TDataSource;
    GetLastJBSQL: TFDQuery;
    UpdLastJBSQL: TFDQuery;
    AddJobBagHeadSQL: TFDQuery;
    AddJobBagSQL: TFDQuery;
    PriceUnitSQL: TFDQuery;
    GetDelivLocsSQL: TFDQuery;
    GetPickLocsSQL: TFDQuery;
    GetPickSQL: TFDQuery;
    GetPickQtySQL: TFDQuery;
    GetPickCallOffSQL: TFDQuery;
    GetTotPickSQL: TFDQuery;
    QuestListSQL: TFDQuery;
    QryStock: TFDQuery;
    GetLastJBLineSQL: TFDQuery;
    qryCheckJobBag: TFDQuery;
    qryGetPOLineIntNotes: TFDQuery;
    qryInsIntNote: TFDQuery;
    qryDelPOLineIntNotes: TFDQuery;
    UpdJobBagHeadSQL: TFDQuery;
    ChkJobBagLnSQL: TFDQuery;
    ActionList1: TActionList;
    qryDelExpLife: TFDQuery;
    updSILineSQL: TFDQuery;
    GetJBPOStatii: TFDQuery;
    UpdJobBagHeadStat: TFDQuery;
    qryVatCode: TFDQuery;
    dtsVatCode: TDataSource;
    qryVatCodeVat_Code: TIntegerField;
    qryVatCodeVat_Rate: TFloatField;
    qryVatCodeDescription: TWideStringField;
    qryVatCodeVAT_Ref: TWideStringField;
    qryGetPOLineDocs: TFDQuery;
    qryDelPOLineDocs: TFDQuery;
    qryInsPOLineDocs: TFDQuery;
    UpJobBagSQL: TFDQuery;
    CountJBLinesSQL: TFDQuery;
    VatRateSQL: TFDQuery;
    qryPOSInvs: TFDQuery;
    qryPOPInvs: TFDQuery;
    qryJobType: TFDQuery;
    dtsJobType: TDataSource;
    qryGetJobType: TFDQuery;
    qryGetBranchRep: TFDQuery;
    qrySelActiveCCont: TFDQuery;
    qryGetAccountMgr: TFDQuery;
    qryGetProdType: TFDQuery;
    qryGetAccountTeam: TFDQuery;
    qryGetOperator: TFDQuery;
    GetOrigPriceUnitSQL: TFDQuery;
    qryCheckPI: TFDQuery;
    qryGetProdTypePriceUnit: TFDQuery;
    qryPartMvmnts: TFDQuery;
    qryPartMvmntsDate_received: TDateTimeField;
    qryPartMvmntsPart_Store_Name: TWideStringField;
    qryPartMvmntsPart_Movement_Bin: TWideStringField;
    qryPartMvmntsPart_Store_Lot: TWideStringField;
    qryPartMvmntsPart_Move_Type_Descr: TWideStringField;
    qryPartMvmntsPart_Movement_Reference: TWideStringField;
    qryPartMvmntsStock_Pack_Quantity: TIntegerField;
    qryPartMvmntsStore_Quantity: TIntegerField;
    qryPartMvmntsStore_cost: TCurrencyField;
    qryPartMvmntsPart_Store_Total_Quantity: TFloatField;
    qryPartMvmntsAudit_User: TWideStringField;
    dtsrcPartMvmnts: TDataSource;
    qryPartStoreBins: TFDQuery;
    dtsrcPartStoreBins: TDataSource;
    qryGetTotalUsage: TFDQuery;
    qryGetTotalStock: TFDQuery;
    qryUpdPOHist: TFDQuery;
    GetFldChgTypSQL: TFDQuery;
    qryGetLastPOHistory: TFDQuery;
    qryGetPOPriceHist: TFDQuery;
    dtsGetPOPriceHist: TDataSource;
    qryGetPOPriceHistDate_point: TDateTimeField;
    qryGetPOPriceHistOperator: TIntegerField;
    qryGetPOPriceHistOperator_Name: TWideStringField;
    qryGetPOPriceHistOrder_Price: TCurrencyField;
    qryGetPOPriceHistSelling_Price: TCurrencyField;
    qryGetPOPriceHistQuantity: TFloatField;
    qryGetPOPriceHistOrder_Unit: TIntegerField;
    qryGetPOPriceHistOrder_Unit_Description: TWideStringField;
    qryGetPOPriceHistSell_Unit: TIntegerField;
    qryGetPOPriceHistSell_Unit_Description: TWideStringField;
    qryGetPOPriceHistGoods_Reqd_by_Customer: TDateTimeField;
    qryGetPOPriceHistGoods_Required: TDateTimeField;
    qryGetPOPriceHistOn_Hold: TWideStringField;
    GetCompBrAddrSQL: TFDQuery;
    qryCompBranch: TFDQuery;
    UpdStoreStockSQL: TFDQuery;
    qryGetPOPriceHistInvoice_Upfront: TWideStringField;
    qryGetPOProof: TFDQuery;
    DelPOPriceHistorySQL: TFDQuery;
    qryFSCClaim: TFDQuery;
    dtsFSCClaim: TDataSource;
    qryGetCustCC: TFDQuery;
    qryGetBranchCC: TFDQuery;
    qryGetFSCClaim: TFDQuery;
    qryCourierService: TFDQuery;
    qryPackageType: TFDQuery;
    dtsCourierService: TDataSource;
    dtsPackageType: TDataSource;
    qryGetCustomerContact: TFDQuery;
    GetNCADetsSQL: TFDQuery;
    qryGetLastNC: TFDQuery;
    qryUpdateLastNC: TFDQuery;
    qryDeleteNCA: TFDQuery;
    qryAddNonConform: TFDQuery;
    qryGetProduct: TFDQuery;
    GetStockCodesSQL: TFDQuery;
    DelPOStockCodesSQL: TFDQuery;
    qryAddStockCode: TFDQuery;
    qryGetActiveSupplierContact: TFDQuery;
    UpdateContactStatusSQL: TFDQuery;
    qryProofStatus: TFDQuery;
    qryGetCustomerSubRep: TFDQuery;
    qryJBAddLine: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FNoDelInstruct : Boolean;
    function GetCustomerDefVAT(tempcode: integer): integer;
    procedure LoadLineDets(var PurchaseOrder : TPurchaseOrder);
    procedure LoadDelDets(var PurchaseOrder : TPurchaseOrder);
    procedure LoadPartDets(var PurchaseOrder : TPurchaseOrder);
    procedure LoadAddDets(var PurchaseOrder : TPurchaseOrder);
    procedure LoadExtChg(var PurchaseOrder : TPurchaseOrder);
    procedure LoadQuestions(var PurchaseOrder : TPurchaseOrder);
    procedure LoadCallOffOrders(var PurchaseOrder : TPurchaseOrder);
    procedure LoadNCADets(var PurchaseOrder : TPurchaseOrder);
    procedure LoadStockCodes(var PurchaseOrder: TPurchaseOrder);
    procedure LoadPurchaseOrder(var PurchaseOrder : TPurchaseOrder);
    procedure LoadIntNotes(PONum: real; var OrderLine: TOrderLine);
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    function BuildAddress(Query : TFDQuery) : string;
    function BuildBranchAddress(Query: TFDQuery): string;
    procedure CheckDatabase;
    procedure FixParameters(aQuery : TFDQuery);
    procedure SaveIntNote(poNum: real; lineNo, noteNum: integer; intNote: TIntNote);
    procedure GetCurrentCustomerRep(OrderLine: TOrderLine);
    function GetNextPOHistory(tempPO: real; tempLine: integer): integer;
    function POMatched(TempType: string; TempPO: real; TempLine: integer): boolean;
  public
    function CheckJobBagExist(TempCode: integer): boolean;
    function CountJobBagLines(TempJB: Integer): integer;
    function CreateIntSelMemo(const cMode: Char; iTempPO: real): Integer;
    procedure DeleteNonConforms(PONumber: real);
    procedure DeleteStockCodes(PONumber: real);
    function GetAuthorisedByName(tempno: integer): string;
    function GetOpsAccountTeam(tempno: integer): integer;
    function GetOpsAccountTeamName(tempno: integer): string;
    function GetAccountTeamName(tempno: integer): string;
    function GetActiveSupplierContact(tempSupp, tempBranch, tempCode: integer): integer;
    function GetAddressString(const iType : TAddressType;
      iCode, iBranch: integer) : string;
    function GetAddressSpecInstr(const iType : TAddressType;
      iCode, iBranch: integer): string;
    function GetContactAccountNo(tempCust, tempBranch, tempCode: integer): string;
    function UseCompanyBranch: boolean;
    function GetDelivNarr(const iType : TAddressType;
      iCode, iBranch: integer): integer;
    function GetDelivDescr(iTempCode, iTempBranch, iTempType: Integer): string;
    function GetPriceUnitDescr(PriceUnit : integer) : string;
    function GetPriceUnitShowTotal(PriceUnit: integer): string;
    function GetPriceUnitFactor(PriceUnit: integer): integer;
    function GetProdTypePUnits(TempProdType: integer): boolean;
    function GetTotalStock(tempCode: real): integer;
    function GetTotalStockUsage(tempCode: real): integer;
    function GetNextPONumber: real;
    function GetNextJBNonConformNo: integer;
    function GetNextJobBagNumber: integer;
    function GetNextJobBagLineNumber(tempNo: integer): integer;
    procedure ResetEnquiryStatus(const Enquiry, Line: Integer);
    procedure ResetIsUpdateLine(PONumber: real);
    procedure ResetIsUpdateDelivery(PONumber: real);
    procedure ResetIsUpdateCharge(PONumber: real);
    procedure SetJobBagInactive(TempJB: Integer);
    procedure DeleteDeliveries(PONumber: real);
    procedure DeleteCharges(PONumber: real);
    procedure DeleteNarrative(const iTempNarr: Integer);
    procedure DeletePurchaseOrder(PONumber: real);
    procedure DeleteIntSelMemo(const key: Integer);
    procedure DelJobBags(TempPO: real; TempPOLine: Integer);
    procedure DeletePriceHistory(TempPO: real; TempPOLine: Integer);
    procedure DeletePOLines(TempPO: real);
    function GetStatusDescr(TempStat: Integer): string;
    procedure AddProofHist(TempPPO: real; TempPPOLine: Integer; TempDate:
      TDateTime; TempStat: string; TempOp: integer);
    procedure CopyEnquiryParts(const iEnquiry: integer; rPONumber: real; iEnqLine,
      iPOLine: Integer);
    procedure CopyEnquiryAdditionals(const iEnquiry: integer; rPONumber: real; iEnqLine,
      iPOLine: Integer);
    procedure DeletePOPart(const rPONumber: real; iLine: Integer);
    procedure DeletePOParts(const rPONumber: real);
    procedure DeletePOAdditional(const rPONumber: real; iLine: Integer);
    procedure DeletePOAdditionals(const rPONumber: real);
    procedure DeletePOQuestion(const rPONumber: real; iLine: Integer);
    procedure DeletePOQuestions(const rPONumber: real);
    function GetInvoiceUpfront(TempPO: real; TempLine: integer): string;
    function GetJobBagNumber(TempPO: real; TempLine: integer): integer;
    function GetCurrentProofStatus(TempPO: real; TempLine: integer): string;
    function GetCurrentProofStatusDate(TempPO: real; TempLine: integer): TDateTime;
    function GetCustName(TempCust: Integer): string;
    function GetCostCentre(tempCust, tempBranch: integer; tempCC, tempCCLevel: string): string;
    function IsCustomerOnStop(TempCust: Integer): boolean;
    function IsCustomerInvoicedUpfront(tempCust: integer): string;
    function IsCustomerActive(TempCust: integer): boolean;
    function IsSupplierActive(TempSupp: integer): boolean;
    function IsSupplierContactActive(const iSupp, iBranch, iContact: integer): boolean;
    function IsPartNumbered(tmpPart: string): boolean;
    function GetCustVAT(TempCust: Integer): integer;
    function GetVatRate(TempVatCode: Integer): string;
    function GetCustomerSubRep(tempCust, tempBranch: integer): integer;
    function GetCustBranchName(TempCust, TempBranch: Integer): string;
    function GetCustContactName(Cust, Branch, Contact: Integer): string;
    function GetProdType(TempProdType: integer): boolean;
    function GetProdTypeCategory(TempProdType: Integer): string;
    function GetProdTypeCashSale(TempProdType: integer): boolean;
    function GetProdTypeDesc(TempProdType: Integer): string;
    function GetProdTypeShouldInvoice(TempProdType: integer): boolean;
    function GetFormRef(TempRef: Integer): string;
    function GetStockRef(TempRef: Integer): string;
    function GetFormDesc(TempRef: Integer): string;
    function GetRepDesc(TempRep: Integer): string;
    function GetOfficeContact(TempContact: Integer): string;
    function GetOfficeContactEmail(TempContact: Integer): string;
    function GetOfficeContactPhone(TempContact: Integer): string;
    function GetRepPosition(TempRep: Integer): string;
    function GetPickQuantity(TempOrder: real; TempLine, TempDel, TempLoc: integer;
                    TempCOOrder: real; TempCOLine, TempCODel: integer): integer;
    function GetTotalPickQty(TempCOOrder: real; TempCOLine, TempCODel: integer): integer;
    function GetBinAllocatedQty(TempOrder: real; TempLine, TempDel, TempLoc: integer): integer;
    function GetRepNominal(TempRep: Integer): string;
    function GetRepSuffixPrefix(TempRep: Integer): string;
    function GetSuppName(const iSupp : integer) : string;
    function GetSuppBranchName(const iSupp, iBranch : integer) : string;
    function GetSuppContactName(const iSupp, iBranch, iContact: integer): string;
    function DefaultRep(iTempCust, iTempBranch: Integer): Integer;
    function GetNarrative(const iNarrative: Integer): string;
    function GetNCRDesc(TempNCR: string): string;
    function ProofAccepted(TempCode: string): boolean;
    function StockSystemInUse : Boolean;
    function StockCodeInactive(tmpCode: string): boolean;
    procedure SaveFieldChanges(tempTable: string; DSFrom: TDataSet; SQLTo: TFDQuery);
    procedure SaveNarrative(var iNarrative: Integer; const Data: string);
    procedure GetSupplierDefaults(const aSupplier: Integer;
      var iVatCode, iCurrency: Integer);
    procedure LoadPOFromDatabase(var PurchaseOrder : TPurchaseOrder);
    procedure SaveQuestions(var PurchaseOrder: TPurchaseOrder;
      const aLine : integer);
    property NoDelInstruct : Boolean read FNoDelInstruct;
    procedure SaveIntNotes(PONum: real; OrderLine: TOrderLine);
    function CalcPOLineExpectedLife(PONum: double; OrderLine: TOrderLine): integer;
    procedure ClearPOExpectedLife(PONum: double; lineNo: integer);
    procedure GetPOSInvList(PONum: real; Line: integer; var invList: TStringList);
    procedure GetPOPInvList(PONum: real; Line: integer; var invList: TStringList);
  end;

var
  PBPODM: TPBPODM;

implementation

uses UITypes, PBNarrativeDM, PBAuditDM, PBIntSelDM, pbMainMenu, pbDatabase,
  PBMaintProofHistN;

{$R *.DFM}

procedure TPBPODM.AddProofHist(TempPPO: real; TempPPOLine: Integer; TempDate:
  TDateTime; TempStat: string; TempOp: integer);
var
  iTempNewProofCode: Integer;
begin
  {Add a detail line to the proof history}
  PBMaintProofHistNFrm := TPBMaintProofHistNFrm.Create(Self);
  try
    PBMaintProofHistNFrm.rPurchOrd := TempPPO;
    PBMaintProofHistNFrm.iPurchOrdLine := TempPPOLine;
    PBMaintProofHistNFrm.StatDBLCB.KeyValue := tempStat;
    iTempNewProofCode := PBMaintProofHistNFrm.GetNextDbKey;
  finally
    PBMaintProofHistNFrm.Free;
  end;
  with AddProofSQL do
  begin
    ParamByName('Proof_History').AsInteger := iTempNewProofCode;
    ParamByName('Purchase_Order').asfloat := TempPPO;
    ParamByName('Line').AsInteger := TempPPOLine;
    ParamByName('Proof_Date').Asdatetime := TempDate;
    ParamByName('Proof_Status').AsString := TempStat;
    ParambyName('Operator').asinteger := TempOp;
    ExecSQL;
  end;
end;

function TPBPODM.GetStatusDescr(TempStat: Integer): string;
begin
  with GetStatusSQL do
  begin
    Close;
    ParamByName('Purch_Ord_Line_Status').AsInteger := TempStat;
    Open;
    Result := FieldByName('Description').AsString;
    Close;
  end;
end;

procedure TPBPODM.DeletePOLines(TempPO: real);
var
  iLine: Integer;
begin
  with GetDelPOLinesSQL do
  begin {Find all PO Lines with Is_Updated = 'N' }
    Close;
    ParamByName('Purchase_Order').asfloat := TempPO;
    Open;
    while not EOF do
    begin
      iLine := FieldByName('Line').AsInteger;
      with DelProofHistorySQL do
      begin {Delete any proof history for the PO Line}
        ParamByName('Purchase_Order').asfloat := TempPO;
        ParamByName('Line').AsInteger := iLine;
        ExecSQL;
      end;
      with DelPOLineSQL do
      begin {Delete the PO Line}
        ParamByName('Purchase_Order').asfloat := TempPO;
        ParamByName('Line').AsInteger := iLine;
        ExecSQL;
        {Update the audit trail with the file DELETE} ;
        PBAuditDataMod.WriteAudit(3101,Trunc(TempPO),iLine,0,0,
                        FloatToStr(TempPO) + '/' + IntToStr(iLine)) ;
      end;
      DeletePOPart(TempPO, iLine);
      DeletePOAdditional(TempPO, iLine);
      if FieldByName('Enquiry').AsInteger <> 0 then
        ResetEnquiryStatus(FieldByName('Enquiry').AsInteger, iLine);
      Next;
    end;
    Close;
  end;
end;

function TPBPODM.CountJobBagLines(TempJB: Integer): integer;
begin
  {Count the Job Bag line Details}
  with CountJBLinesSQL do
  begin
    close;
    ParamByName('Job_Bag').asinteger := TempJB;
    open;
    result := fieldbyname('Line_Count').asinteger;
  end;
end;

procedure TPBPODM.SetJobBagInactive(TempJB: Integer);
begin
  {Count the Job Bag line Details}
  with UpJobBagSQL do
  begin
    close;
    ParamByName('Job_Bag').asinteger := TempJB;
    ExecSQL;
  end;
end;

procedure TPBPODM.DelJobBags(TempPO: real; TempPOLine: Integer);
begin
  {Delete the Job Bag Details}
  with DelJobBagDetsSQL do
  begin
    ParamByName('Purchase_Order').asfloat := TempPO;
    ParamByName('Line').AsInteger := TempPOLine;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeletePriceHistory(TempPO: real; TempPOLine: Integer);
begin
  {Delete the Job Bag Details}
  with DelPOPriceHistorySQL do
  begin
    ParamByName('Purchase_Order').asfloat := TempPO;
    ParamByName('Line').AsInteger := TempPOLine;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeleteIntSelMemo(const key: Integer);
begin
  dmIntSel.DeleteRecord(key);
end;

function TPBPODM.CreateIntSelMemo(const cMode: Char;
  iTempPO: real): Integer;
begin
  { Create a unqiue int_sel_code and put all the memo details for the PO into
    the table.  Return a unique int_sel code }
  Result := dmIntSel.GetNextDbKey;
  {No point in looking for existing notes lines if not amending}
  if cMode = poChange then {Add the notes lines into the temp file}
    with GetLineMemoSQL do
    begin
      ParamByName('Int_Sel_Code').AsInteger := Result;
      ParamByName('Purchase_Order').asfloat := iTempPO;
      ExecSQL;
    end;
end;

function TPBPODM.GetDelivDescr(iTempCode, iTempBranch, iTempType:
  Integer): string;
begin
  { Some callers depend on the dataset being left open after the call
    so leave it dangling. }
  {Build a suitable description for the delivery}
  if iTempType = 0 then {Ad-hoc address}
  begin
    AddrSRC.DataSet := GetAddHocAddrSQL;
    with GetAddHocAddrSQL do
    begin
      Close;
      ParamByName('Ad_Hoc_Address').AsInteger := iTempCode;
      Open;
      Result := 'Ad Hoc:  ' + FieldByName('Name').AsString;
    end;
  end
  else
    if iTempType = 2 then {Rep address}
    begin
      AddrSRC.DataSet := GetRepAddrSQL;
      with GetRepAddrSQL do
      begin
        Close;
        ParamByName('Rep').AsInteger := iTempCode;
        Open;
        Result := 'Rep   :  ' + FieldByName('Name').AsString;
      end;
    end
    else
      if iTempType = 3 then {Customer address}
      begin
        AddrSRC.DataSet := GetCustAddrSQL;
        with GetCustAddrSQL do
        begin
          Close;
          ParamByName('Customer').AsInteger := iTempcode;
          ParamByName('Branch_No').AsInteger := iTempBranch;
          Open;
          Result := 'Cust/Br:  ' + Trim(FieldByName('Name').AsString) + ', ' +
            Trim(FieldByName('Branch_Name').AsString);
        end;
      end
      else
        if iTempType = 1 then {Supplier address}
        begin
          AddrSRC.DataSet := GetSuppAddrSQL;
          with GetSuppAddrSQL do
          begin
            Close;
            ParamByName('Supplier').AsInteger := iTempcode;
            ParamByName('Branch_No').AsInteger := iTempBranch;
            Open;
            Result := 'Supp/Br:  ' + Trim(FieldByName('Name').AsString) + ', ' +
              Trim(FieldByName('Branch_Name').AsString);
          end;
        end
      else
        begin
          if iTempBranch <> 0 then
            begin
              AddrSRC.DataSet := GetCompBrAddrSQL;
              with GetCompBrAddrSQL do
              begin
                Close;
                ParamByName('Branch_No').AsInteger := iTempBranch;
                Open;
                Result := 'Here:  ' + Trim(FieldByName('Name').AsString) + ', ' +
                  Trim(FieldByName('Branch_Name').AsString);
              end;
            end
          else
            begin
              AddrSRC.DataSet := GetCompAddrSQL;
              with GetCompAddrSQL do
              begin
                Close;
                Open;
                Result := 'Here:  ' + FieldByName('Name').AsString;
              end;
            end;
        end;
end;

function TPBPODM.GetNextPONumber: real;
begin
  LockCompanyRecord;
  try
    try
      with GetLastSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_PO_Number').AsInteger + 1;
        Close;
      end;
      with UpdLastSQL do
      begin
        ParamByName('Last_PO_Number').Asfloat := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next PO number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

function TPBPODM.GetNextJobBagNumber: integer;
begin
  LockCompanyRecord;
  try
    try
      with GetLastJBSQL do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Job_Bag_Number').AsInteger + 1;
        Close;
      end;
      with UpdLastJBSQL do
      begin
        ParamByName('Last_Job_Bag_Number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Job Bag number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

function TPBPODM.GetNextJobBagLineNumber(tempNo: integer): integer;
begin
  with GetLastJBLineSQL do
    begin
      Close;
      parambyname('Job_Bag').asinteger := tempNo;
      Open;
      Result := FieldByName('Last_JB_Line_Number').AsInteger + 1;
      Close;
    end;
end;

procedure TPBPODM.ResetEnquiryStatus(const Enquiry, Line: Integer);
begin
  { If a purchase order is being deleted then we have to reset the
    status on each of the originating enquiry lines (if there is an
    originating enquiry. }
  with UpEnqLineSQL do
  begin
    ParamByName('Enquiry').AsInteger := Enquiry;
    ParamByName('Line').AsInteger := Line;
    ParamByName('Status').AsInteger := esAllPricesSet;
    ExecSQL;
  end;
  { Now Update the Enquiry Header}
  with UpEnqHeadSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := Enquiry;
    ParamByName('status').AsInteger := esAllPricesSet;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeleteDeliveries(PONumber: real);
begin
  with DelPODelivsSQL do
  begin {Delete any PO deliveries with Is_Updated = 'N' }
    ParamByName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeleteStockCodes(PONumber: real);
begin
  with DelPOStockCodesSQL do
  begin
    ParamByName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeleteCharges(PONumber: real);
begin
  with DelExtChgsSQL do
  begin
    {Delete any PO extra charges with Is_Updated = 'N' }
    Close;
    ParamByName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeleteNarrative(const iTempNarr: Integer);
var
  Narrative: TNarrative;
begin
  {Delete a specific narrative}
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iTempNarr;
    Narrative.Delete;
  finally
    Narrative.Free;
  end;
end;

procedure TPBPODM.ResetIsUpdateLine(PONumber: real);
begin
  with UpdPOLinesSQL do
  begin {set all the lines to Is_Update = 'N'}
    ParamByName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.ResetIsUpdateDelivery(PONumber: real);
begin
  with UpdPODelivsSQL do
  begin {set all the lines to Is_Update = 'N'}
    ParamByName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.ResetIsUpdateCharge(PONumber: real);
begin
  with UpdExtChgsSQL do
  begin {set all the lines to Is_Update = 'N'}
    ParamByName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeleteNonConforms(PONumber: real);
begin
  with qryDeleteNCA do
  begin
    close;
    parambyname('Purchase_order').asfloat := PONumber;
    execsql;
  end;
end;

procedure TPBPODM.DeletePurchaseOrder(PONumber: real);
begin
  with DelSQL do
  begin
    ParamByName('Purchase_Order').asfloat := PONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.CopyEnquiryParts(const iEnquiry: integer; rPONumber: real;
  iEnqLine, iPOLine: Integer);
begin
  with CopyEnqPartDetSQL do
  begin
    ParamByName('Enquiry').AsInteger := iEnquiry;
    ParamByName('PONumber').Asfloat := rPONumber;
    ParamByName('POLine').AsInteger := iPOLine;
    ParamByName('EnqLine').AsInteger := iEnqLine;
    ExecSQL;
  end;
end;

procedure TPBPODM.CopyEnquiryAdditionals(const iEnquiry: integer; rPONumber: real;
  iEnqLine, iPOLine: Integer);
begin
  with CopyEnqAdditionalsSQL do
  begin
    ParamByName('Enquiry').AsInteger := iEnquiry;
    ParamByName('PONumber').Asfloat := rPONumber;
    ParamByName('POLine').AsInteger := iPOLine;
    ParamByName('EnqLine').AsInteger := iEnqLine;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeletePOPart(const rPONumber: real; iLine: Integer);
begin
  with DelPOLinePartsSQL do
  begin
    ParamByName('AllLines').AsString := 'N';
    ParamByName('PONumber').Asfloat := rPONumber;
    ParamByName('POLine').AsInteger := iLine;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeletePOParts(const rPONumber: real);
begin
  with DelPOLinePartsSQL do
  begin
    ParamByName('AllLines').AsString := 'Y';
    ParamByName('PONumber').Asfloat := rPONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeletePOAdditional(const rPONumber: real; iLine: Integer);
begin
  with DelPOAdditionalsSQL do
  begin
    ParamByName('AllLines').AsString := 'N';
    ParamByName('PONumber').Asfloat := rPONumber;
    ParamByName('POLine').AsInteger := iLine;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeletePOAdditionals(const rPONumber: real);
begin
  with DelPOAdditionalsSQL do
  begin
    ParamByName('AllLines').AsString := 'Y';
    ParamByName('PONumber').Asfloat := rPONumber;
    ExecSQL;
  end;
end;

function TPBPODM.GetCustName(TempCust: Integer): string;
begin
  with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TPBPODM.IsCustomerOnStop(TempCust: Integer): boolean;
begin
  with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := (FieldByName('Credit_Status').AsString = 'S');
    Close;
  end;
end;

function TPBPODM.GetCustVAT(TempCust: Integer): integer;
begin
  with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := FieldByName('Vat_Code_Def').Asinteger;
    Close;
  end;
end;

function TPBPODM.GetCustBranchName(TempCust, TempBranch: Integer):
  string;
begin
  with GetCustBranchSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    ParamByName('Branch_No').AsInteger := TempBranch;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TPBPODM.StockCodeInactive(tmpCode: string): boolean;
begin
  with qryGetProduct do
  begin
    Close;
    ParamByName('Part').Asstring := tmpCode;
    Open;
    Result := (FieldByName('Not_in_Use').AsString = 'Y');
    Close;
  end;
end;

function TPBPODM.GetProdTypeDesc(TempProdType: Integer): string;
begin
  with GetProdTypesSQL do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := TempProdType;
    Open;
    Result := FieldByName('Description').AsString;
    Close;
  end;
end;

function TPBPODM.GetProdTypeCategory(TempProdType: Integer): string;
begin
  with GetProdTypesSQL do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := TempProdType;
    Open;
    Result := FieldByName('Category_Description').AsString;
    Close;
  end;
end;

function TPBPODM.GetRepDesc(TempRep: Integer): string;
begin
  with GetRepSQL do
  begin
    Close;
    ParamByName('Rep').AsInteger := TempRep;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TPBPODM.GetRepSuffixPrefix(TempRep: Integer): string;
begin
  with GetRepSQL do
  begin
    Close;
    ParamByName('Rep').AsInteger := TempRep;
    Open;
    Result := FieldByName('Rep_Suffix_or_Prefix').AsString;
    Close;
  end;
end;

function TPBPODM.GetRepPosition(TempRep: Integer): string;
begin
  with GetRepSQL do
  begin
    Close;
    ParamByName('Rep').AsInteger := TempRep;
    Open;
    Result := FieldByName('Position').AsString;
    Close;
  end;
end;

function TPBPODM.GetPickQuantity(TempOrder: real; TempLine, TempDel, TempLoc: integer;
                                  TempCOOrder: real; TempCOLine, TempCODel: integer): integer;
begin
  with GetPickSQL do
  begin
    Close;
    ParamByName('Purchase_order').Asfloat := TempOrder;
    ParamByName('Line').Asinteger := TempLine;
    ParamByName('Delivery_no').Asinteger := TempDel;
    ParamByName('Location_no').Asinteger := Temploc;
    ParamByName('Calloff_order').Asfloat := TempCOOrder;
    ParamByName('Calloff_Line').Asinteger := TempCOLine;
    ParamByName('Calloff_Delivery').Asinteger := TempCODel;
    Open;
    Result := FieldByName('Quantity_Picked').Asinteger;
    Close;
  end;
end;

function TPBPODM.GetTotalPickQty(TempCOOrder: real; TempCOLine, TempCODel: integer): integer;
begin
  with GetTotPickSQL do
  begin
    Close;
    ParamByName('Calloff_order').Asfloat := TempCOOrder;
    ParamByName('Calloff_Line').Asinteger := TempCOLine;
    ParamByName('Calloff_Delivery').Asinteger := TempCODel;
    Open;
    Result := FieldByName('Total_Picked').Asinteger;
    Close;
  end;
end;

function TPBPODM.GetBinAllocatedQty(TempOrder: real; TempLine, TempDel, TempLoc: integer): integer;
begin
  with GetPickQtySQL do
  begin
    Close;
    ParamByName('Purchase_order').Asfloat := TempOrder;
    ParamByName('Line').Asinteger := TempLine;
    ParamByName('Delivery_no').Asinteger := TempDel;
    ParamByName('Location_no').Asinteger := Temploc;
    Open;
    Result := FieldByName('Total_Picked').Asinteger;
    Close;
  end;
end;

function TPBPODM.GetRepNominal(TempRep: Integer): string;
begin
  with GetRepSQL do
  begin
    Close;
    ParamByName('Rep').AsInteger := TempRep;
    Open;
    Result := FieldByName('Product_Nominal_Def').AsString;
    Close;
  end;
end;

function TPBPODM.GetOfficeContact(TempContact: Integer): string;
begin
  with GetOffContactSQL do
  begin
    Close;
    ParamByName('Operator').AsInteger := TempContact;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TPBPODM.GetOfficeContactEmail(TempContact: Integer): string;
begin
  with GetOffContactSQL do
  begin
    Close;
    ParamByName('Operator').AsInteger := TempContact;
    Open;
    Result := FieldByName('Email').AsString;
    Close;
  end;
end;

function TPBPODM.GetOfficeContactPhone(TempContact: Integer): string;
begin
  with GetOffContactSQL do
  begin
    Close;
    ParamByName('Operator').AsInteger := TempContact;
    Open;
    Result := FieldByName('Phone').AsString;
    Close;
  end;
end;

function TPBPODM.GetFormRef(TempRef: Integer): string;
begin
  with GetFormRefSQL do
  begin
    Close;
    ParamByName('Form_Reference').AsInteger := TempRef;
    Open;
    Result := FieldByName('Form_Reference_ID').AsString;
    Close;
  end;
end;

function TPBPODM.GetStockRef(TempRef: Integer): string;
begin
  with GetFormRefSQL do
  begin
    Close;
    ParamByName('Form_Reference').AsInteger := TempRef;
    Open;
    Result := FieldByName('Stock_Reference').AsString;
    Close;
  end;
end;

function TPBPODM.GetFormDesc(TempRef: Integer): string;
begin
  with GetFormRefSQL do
  begin
    Close;
    ParamByName('Form_Reference').AsInteger := TempRef;
    Open;
    Result := FieldByName('Form_Reference_Descr').AsString;
    Close;
  end;
end;
function TPBPODM.GetNCRDesc(TempNCR: string): string;
begin
  with GetNCRDescSQL do
  begin
    Close;
    ParamByName('NCR_OTC_Mix').Asstring := TempNCR;
    Open;
    Result := FieldByName('NCR_OTC_Descr').AsString;
    Close;
  end;
end;

function TPBPODM.DefaultRep(iTempCust, iTempBranch: Integer): Integer;
begin
  {Work out what the default rep should be, either the ONLY rep or the MAIN rep}
  {or nothing}
  with GetCustRepsSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := iTempCust;
    ParamByName('Branch_No').AsInteger := iTempBranch;
    Open;
    if (RecordCount = 1) or
      ((FieldByName('Is_Main_Rep').AsString = 'Y') and (not EOF)) then
      Result := FieldByName('Rep').AsInteger
    else
      Result := 0;
  end;
end;

function TPBPODM.POMatched(TempType: string; TempPO: real; TempLine: integer): boolean;
begin
  Result := false;
  with qryCheckPI do
  begin
    close;
    ParamByName('Purchase_Order').Asfloat := TempPO;
    ParamByName('Line').Asinteger := TempLine;
    open;
    if (recordcount > 0) and (fieldbyname('Qty_Invoiced').AsInteger > 0) then
    begin
      Result := true;
    end;
    close;
  end;
end;

function TPBPODM.GetNarrative(const iNarrative: Integer): string;
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

procedure TPBPODM.SaveNarrative(var iNarrative: Integer;
  const Data: string);
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

procedure TPBPODM.GetSupplierDefaults(const aSupplier: Integer;
  var iVatCode, iCurrency: Integer);
begin
  with GetSupplierSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := aSupplier;
    Open;
    iVatCode := FieldByName('Vat_Code_Def').AsInteger;
    iCurrency := FieldByName('Currency_Code_Def').AsInteger;
    Close;
  end;
end;

procedure TPBPODM.LoadAddDets(var PurchaseOrder: TPurchaseOrder);
var
  anAdd: TAdditionalDetail;
  OrdInx: Integer;
begin
  {Load the additional details}
  with PBPODM.GetAddDetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      anAdd := TAdditionalDetail.Create;
      with anAdd do
      begin
        Line := FieldByName('Line').AsInteger;
        DetailNo := FieldByName('Additional_Details').AsInteger;
        FAOFlag := FieldByName('FAO_Flag').AsString[1];
        Detail := FieldByName('Details').AsString;
        Narrative := FieldByName('Narrative').AsInteger;
        NarrativeText := PBPODM.GetNarrative(Narrative);
      end;
      { Fit the delivery into the correct order line }
      OrdInx := PurchaseOrder.OrderLines.IndexFromLineNo(anAdd.Line);
      PurchaseOrder.OrderLines[OrdInx].AdditionalDetails.Add(anAdd);
      Next;
    end;
    Close;
  end;
end;

procedure TPBPODM.LoadDelDets(var PurchaseOrder: TPurchaseOrder);
var
  aLine: TDeliveryLine;
  OrdInx: Integer;
begin
  {Load the delivery details}
  {Load the line details for order number TempOrd}
  with PBPODM.GetDelDetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      aLine := TDeliveryLine.Create;
      with aLine do
      begin
        Line := FieldByName('Line').AsInteger;
        DeliveryNo := FieldByName('Delivery_No').AsInteger;
        AdHocAddress := FieldByName('Ad_Hoc_Address').AsInteger;
        Supplier := FieldByName('Supplier').AsInteger;
        BranchNo := FieldByName('Branch_No').AsInteger;
        Rep := FieldByName('Rep').AsInteger;
        QtyToDeliver := FieldByName('Qty_To_Deliver').AsFloat;
        FAO := FieldByName('Contact_Name').asString;
        {If Copying a PO then don't copy the Qty Delivered ann Invoiced}
        if (PurchaseOrder.FuncMode <> poCopy) and
           (PurchaseOrder.FuncMode <> poRepeat) then
          begin
            QtyDelivered := FieldByName('Qty_Delivered').AsFloat;
            QtyInvoiced := FieldByName('Qty_Invoiced').AsFloat;
            DateDelivActual := FieldByName('Date_Deliv_Actual').AsDateTime;
            DeliveryNotePrinted := FieldByName('Delivery_Note_Printed').Asstring;
            DatePoint := FieldByName('Date_Point').AsDateTime;
            if FieldbyName('Goods_reqd_by_Customer').asstring = '' then
              GoodsRequiredbyCust := FieldByName('Date_Point').AsDateTime
            else
              GoodsRequiredbyCust := FieldByName('Goods_reqd_by_Customer').AsDateTime;
          end
        else
          begin
            QtyDelivered := 0;
            QtyInvoiced := 0;
            DateDelivActual := PBDateStr('');
            DeliveryNotePrinted := '';
            DatePoint := date;
            GoodsRequiredbyCust := date;
          end;
        Customer := FieldByName('Customer').AsInteger;
        CompanyBranch := Fieldbyname('Company_Branch').asinteger;
        BranchNoZero := FieldByName('Branch_No0').AsInteger;
        NoOfBoxes := FieldByName('No_Of_Boxes').AsInteger;
        Weight := fieldbyname('Delivery_Weight_Kilos').asfloat;
        PackType := fieldbyname('Package_Type').AsInteger;
        Courier := fieldbyname('Courier').AsInteger;
        Service := fieldbyname('Service_no').AsInteger;
      { Database change, take the exception }
        try
          Instructions := FieldByName('Delivery_Instructions').AsString;
        except
          Instructions := '';
        end;
      { Database change, take the exception }
        try
          DeliverViaCompany := FieldByName('Deliver_Via_Company').AsString;
        except
          DeliverViaCompany := '';
        end;

        DeliveryToStock := FieldByName('Delivery_to_Stock').Asstring;
       end;
      { Fit the delivery into the correct order line }
      OrdInx := PurchaseOrder.OrderLines.IndexFromLineNo(aLine.Line);
      PurchaseOrder.OrderLines[OrdInx].DeliveryLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TPBPODM.LoadExtChg(var PurchaseOrder: TPurchaseOrder);
var
  aCharge: TExtraCharge;
  inx : integer;
begin
  {Load the extra charges}
  with PBPODM.GetExtChgsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      aCharge := TExtraCharge.Create;
      with aCharge do
      begin
        Line := FieldByName('Line').AsInteger;
        AdditionalCharge := FieldByName('Additional_Charge').AsInteger;
        Details := FieldByName('Details').AsString;
        Amount := FieldByName('Amount').AsFloat;
        QuotationPrice := FieldByName('Quotation_Price').AsFloat;
        VatCode := FieldByName('Vat_Code').asInteger;
      end;
      inx := PurchaseOrder.OrderLines.IndexFromLineNo(aCharge.Line);
      PurchaseOrder.OrderLines[inx].ExtraCharges.Add(aCharge);
      Next;
    end;
    Close;
  end;
end;

procedure TPBPODM.LoadLineDets(var PurchaseOrder: TPurchaseOrder);
var
  aLine: TOrderLine;
begin
  PurchaseOrder.OrderLines.Clear;
  {Load the line details for order number TempOrd}
  with PBPODM.GetLineDetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      aLine := TOrderLine.Create;
      with aLine do
      begin
        Line := FieldByName('Line').AsInteger;
        Customer := FieldByName('Customer').AsInteger;
        CustomerContact := FieldByName('Contact_No').AsInteger;
        BranchNo := FieldByName('Branch_No').AsInteger;
        CostCentre := fieldbyname('Cost_Centre').AsString;
        if (PurchaseOrder.FuncMode = poCopy) or
           (PurchaseOrder.FuncMode = poRepeat) then
          Enquiry := 0
        else
          Enquiry := FieldByName('Enquiry').AsInteger;
        LineZero := FieldByName('Line0').AsInteger;
        SupplierReference := FieldByName('Supplier_Reference').AsString;
        SupplierJobRef := FieldByName('Supplier_Job_Ref').AsString;

        FSCClaim := fieldbyname('FSC_Material_Claim').asinteger;
        FSCMixed := fieldbyname('FSC_Mixed_Percentage').asinteger;

        if (PurchaseOrder.FuncMode <> poCopy) and
           (PurchaseOrder.FuncMode <> poRepeat) then
          begin
            AltPurchaseOrder := FieldByName('Alt_Purchase_Order').AsString;
            CustOrderNo := FieldByName('Cust_Order_No').AsString;
            GoodsRequired := FieldByName('Goods_Required').AsDateTime;
            if FieldByName('Goods_Reqd_by_Customer').AsString = '' then
              GoodsRequiredbyCust := FieldByName('Goods_Required').AsDateTime
            else
              GoodsRequiredbyCust := FieldByName('Goods_Reqd_by_Customer').AsDateTime;
            ProofRequired := FieldByName('Proof_Required').AsString = 'Y';
            if ProofRequired then
              ProofDate := FieldByName('Proof_Date').AsDateTime;
            ProofStatus := PBPODM.GetCurrentProofStatus(PurchaseOrder.PONumber,Line);
            ProofStatusDate := PBPODM.GetCurrentProofStatusDate(PurchaseOrder.PONumber,Line);

            FileCopiesReceived := fieldbyname('File_Copies_Received_Date').asdatetime;
            FileCopiesReceivedName := PBPODm.GetOfficeContact(fieldbyname('File_Copies_Received_by').asinteger);
            FileCopiesReceivedBy := fieldbyname('File_Copies_Received_by').asinteger;
          end
        else
          begin
            CustOrderNo := '';
(*            GoodsRequired := date+1;
            GoodsRequiredbyCust := date+1;
*)
            GoodsRequired := 0;
            GoodsRequiredbyCust := 0;

            ProofRequired := false;
            ProofDate := 0;
            ProofStatus := '';
            ProofStatusDate := 0;

            FileCopiesReceived := 0;
            FileCopiesReceivedBy := 0;
          end;

        CashSale := FieldByName('Cash_Sale').asstring;
        if (PurchaseOrder.FuncMode <> poCopy) and
           (PurchaseOrder.FuncMode <> poRepeat) then
          POLineStatus := FieldByName('Purch_Ord_Line_Status').AsInteger
        else
          begin
          POLineStatus := plNotYetSent;
          end;

        Quantity := FieldByName('Quantity').AsFloat;

        if purchaseOrder.FuncMode = poRepeat then
        begin
          ExpectedLife := self.CalcPOLineExpectedLife(purchaseOrder.PONumber, aLine);
        end
        else
        if (purchaseOrder.FuncMode = poCopy) or (purchaseOrder.FuncMode = poAdd) then
        begin
          ExpectedLife := 0;
        end
        else
        begin
          ExpectedLife := FieldByName('Expected_Life').AsInteger;
        end;

        if FieldByName('Vat_Code').Asstring = '' then
          VATCode := GetCustomerDefVAT(Customer)
        else
          VATCode := FieldByName('Vat_Code').Asinteger;

        if (PurchaseOrder.FuncMode = poCopy) or
           (PurchaseOrder.FuncMode = poRepeat) then
          VATCode := GetCustomerDefVAT(Customer);

        SuppliersDesc := FieldByName('Suppliers_Desc').AsString;
        CustomersDesc := FieldByName('Customers_Desc').AsString;
        DescriptiveRef := FieldByName('Description_Reference').AsString;
        QtyinStock := fieldbyname('Qty_in_Stock').asfloat;
        if (PurchaseOrder.FuncMode <> poCopy) and
           (PurchaseOrder.FuncMode <> poRepeat) then
          QtyInvoiced := fieldbyname('Qty_Invoiced').asfloat
        else
          QtyInvoiced := 0;

        OrderPrice := FieldByName('Order_Price').AsCurrency;
        SellingPrice := FieldByName('Selling_Price').AsCurrency;
        ListPrice := FieldByName('List_Price').AsCurrency;
        ProductType := FieldByName('Product_Type').AsInteger;
        if (PurchaseOrder.FuncMode = poCopy) or
           (PurchaseOrder.FuncMode = poRepeat) then
           if PBPODM.GetProdType(ProductType) = false then
            ProductType := 0;

        PrintedPO := FieldByName('Printed_PO').AsString = 'Y';
        OrderUnit := FieldByName('Order_Unit').AsInteger;
        SellUnit := FieldByName('Sell_Unit').AsInteger;
        SuppInvRecd := FieldByName('Supp_Inv_Recd').AsString = 'Y';
        Rep := FieldByName('Rep').AsInteger;
        Narrative := FieldByName('Narrative').AsInteger;
        NarrativeText := PBPODM.GetNarrative(Narrative);
        if (PurchaseOrder.FuncMode = poCopy) or
           (PurchaseOrder.FuncMode = poRepeat) then
          JobBagNumber := 0
        else
          JobBagNumber := PBPODM.GetJobBagNumber(PurchaseOrder.PONumber,Line);
        JobType := Fieldbyname('Job_Type').asinteger;
        if (PurchaseOrder.FuncMode <> poCopy) and
           (PurchaseOrder.FuncMode <> poRepeat) then
          Narrative := FieldByName('Narrative').AsInteger
        else
          Narrative := 0;

        FormReference := FieldByName('Form_Reference').AsInteger;
        FormsPerBox := FieldByName('Forms_per_box').AsString;
        NCROTCMix := FieldByName('NCR_OTC_Mix').AsString;
        Depth := FieldByName('Depth').AsFloat;
        DepthUnit := FieldByName('Depth_Unit').AsString;
        Width := FieldByName('Width').AsFloat;
        WidthUnit := FieldByName('Width_Unit').AsString;
        ArtWork := FieldByName('Artwork_Instructions').AsString;
        Numbering := FieldByName('Number_Instructions').AsString;
        NoOfPlateChanges := FieldByName('No_of_plates').AsInteger;
        OnHold := FieldByName('On_hold').Asstring;
        NoOfSets := FieldByName('No_of_Sets').Asstring;
        NoOfCallOffs := FieldByName('No_of_CallOffs').Asstring;
        InActive := FieldByName('Inactive').Asstring;
        InActiveReason := FieldByName('Inactive_Reason').Asinteger;
        InActiveDate := FieldByName('Inactive_Date').Asdatetime;

        if (PurchaseOrder.FuncMode <> poCopy) and
           (PurchaseOrder.FuncMode <> poRepeat) then
          begin
            InvoiceUpfront := fieldbyname('Invoice_upfront').asstring;
            InvoiceBeforeDelivery := fieldbyname('Ready_to_Invoice').asstring = 'Y';
          end
        else
          begin
            InvoiceUpFront := PBPODM.IsCustomerInvoicedUpfront(Customer);
            InvoiceBeforeDelivery := false;
          end;

        CalloffInvoicedUpfront := fieldbyname('Calloff_Invoiced_upfront').asstring;

        {Check whether a purchase invoice has been raised against this order}
        Matched := false;
        if (PurchaseOrder.FuncMode <> poCopy) and
           (PurchaseOrder.FuncMode <> poRepeat) then
        begin
          OriginalOrder := FieldByName('Original_Order').Asfloat;
          OriginalOrderLine := FieldByName('Original_OrderLine').AsInteger;

          {If this user has access to Ourchase Invoicing program then they have access to change order price}
          if (not frmPBMainMenu.mnuPurchaseInvoicing.Enabled) or (pos('Only Access',frmPBMainMenu.mnuPurchaseInvoicing.caption) > 0) then
            Matched := POMatched('PO',PurchaseOrder.PONumber,Line);
        end
        else if (PurchaseOrder.FuncMode = poRepeat) then
        begin
          OriginalOrder := PurchaseOrder.PONumber;
          OriginalOrderLine := FieldByName('Line').AsInteger;
          Matched := false;
        end;

        DocumentList.PONum := PurchaseOrder.PONumber;
        DocumentList.Line := aLine.Line;
{ TODO : Fix this bug. The DocObject datamodule hasn't always been created at this point. }
//if copying an order DO NOT load the document list.
        if PurchaseOrder.FuncMode <> 'P' then
        begin
          try
            DocumentList.Load;
          except

          end;
        end;
      end;

      self.LoadIntNotes(PurchaseOrder.PONumber, aLine);

      PurchaseOrder.OrderLines.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TPBPODM.LoadPartDets(var PurchaseOrder: TPurchaseOrder);
var
  aPart: TPartDetail;
  OrdInx: Integer;
begin
  {Load the parts details}
  with PBPODM.GetPartDetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      aPart := TPartDetail.Create;
      with aPart do
      begin
        Line := FieldByName('Line').AsInteger;
        PartNo := FieldByName('Part_No').AsInteger;
        PartDescription := FieldByName('Part_Description').AsString;
        Heading := FieldByName('Heading').AsString;
        SameAsPart := FieldByName('Same_As_Part').AsInteger;
        PaperBrand := FieldByName('Paper_Brand').AsString;
        PaperMaterial := FieldByName('Paper_Material').AsString;
        PaperWeight := FieldByName('Paper_Weight').AsString;
        PaperColour := FieldByName('Paper_Colour').AsString;
        PlateChanges := FieldByName('No_of_plate_changes').AsInteger;
        FaceInks := FieldByName('Face_Inks').AsString;
        ReverseInks := FieldByName('Reverse_Inks').AsString;
        LeftMarginType := FieldByName('Left_Margin_Type').AsString;
        LeftMarginWidth := FieldByName('Left_Margin_Width').AsString;
        RightMarginType := FieldByName('Right_Margin_Type').AsString;
        RightMarginWidth := FieldByName('Right_Margin_Width').AsString;
      end;
      { Fit the delivery into the correct order line }
      OrdInx := PurchaseOrder.OrderLines.IndexFromLineNo(aPart.Line);
      PurchaseOrder.OrderLines[OrdInx].PartDetails.Add(aPart);
      Next;
    end;
    Close;
  end;
end;

procedure TPBPODM.LoadPOFromDatabase(var PurchaseOrder: TPurchaseOrder);
var
  inx: integer;
begin
  LoadPurchaseOrder(PurchaseOrder);
  LoadLineDets(PurchaseOrder);
  if dmBroker.defaultDeliveries then
    LoadDelDets(PurchaseOrder)
  else
    begin
      if (PurchaseOrder.FuncMode <> poCopy) and
        (PurchaseOrder.FuncMode <> poRepeat) then
        LoadDelDets(PurchaseOrder);
    end;
  LoadExtChg(PurchaseOrder);
  LoadPartDets(PurchaseOrder);
  LoadAddDets(PurchaseOrder);
  LoadQuestions(PurchaseOrder);
  LoadCallOffOrders(PurchaseOrder);
  LoadNCADets(PurchaseOrder);
  LoadStockCodes(PurchaseOrder);

//  when copying or repeating get the current rep associated with the customer
  if (PurchaseOrder.FuncMode = poCopy) or (PurchaseOrder.FuncMode = poRepeat) then
    begin
      for inx := 0 to pred(PurchaseOrder.OrderLines.count) do
        begin
          GetCurrentCustomerRep(PurchaseOrder.OrderLines[inx]);
        end;
    end;
end;

procedure TPBPODM.LoadPurchaseOrder(var PurchaseOrder: TPurchaseOrder);
var
  iVatCode, iCurrency: Integer;
begin
  with GetPOSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    PurchaseOrder.Supplier := FieldByName('Supplier').AsInteger;
    GetSupplierDefaults(PurchaseOrder.Supplier, iVatCode, iCurrency);
    PurchaseOrder.DefaultVatCode := iVatCode;
    PurchaseOrder.BranchNo := FieldByName('Branch_No').AsInteger;
    PurchaseOrder.Operator := FieldByName('Operator').AsInteger;
    PurchaseOrder.DatePoint := FieldByName('Date_Point').AsDateTime;
    PurchaseOrder.SupplierContactNo := FieldByName('Contact_No').AsInteger;
    PurchaseOrder.TheirContact := FieldByName('TheirContact').AsString;

    {Check whether the contact is active when copying or repeating}
    if (PurchaseOrder.FuncMode = poCopy) or (PurchaseOrder.FuncMode = poRepeat) then
      begin
        PurchaseOrder.SupplierContactNo := GetActiveSupplierContact(PurchaseOrder.Supplier, PurchaseOrder.BranchNo, PurchaseOrder.SupplierContactNo);
        if PurchaseOrder.SupplierContactNo = 0 then
          PurchaseOrder.TheirContact := '';
      end;

    if (PurchaseOrder.FuncMode <> poCopy) and
      (PurchaseOrder.FuncMode <> poRepeat) then
      begin
        PurchaseOrder.OfficeContact := FieldByName('Office_Contact').AsInteger;
        PurchaseOrder.POHeadStatus := FieldByName('Purch_Ord_Head_Status').AsInteger;
      end
    else
      begin
        PurchaseOrder.POHeadStatus := phCreated;
        PurchaseOrder.OfficeContact := frmPBMainMenu.iOperator;
      end;

    PurchaseOrder.Courier := fieldbyname('Courier').asinteger;
    PurchaseOrder.CurrencyCode := FieldByName('Currency_Code').AsInteger;
    PurchaseOrder.SupplierName := FieldByName('SupplierName').AsString;
    PurchaseOrder.BranchName := FieldByName('BranchName').AsString;
    PurchaseOrder.NoDelInstruct := FNoDelInstruct;
    PurchaseOrder.Salutation := FieldByName('Salutation').AsString;
    PurchaseOrder.OurContact := FieldByName('OurContact').AsString;

    PurchaseOrder.AccountTeam := Fieldbyname('Account_Team').asinteger;
    if PurchaseOrder.AccountTeam = 0 then
      begin
        PurchaseOrder.AccountTeam := GetOpsAccountTeam(PurchaseOrder.OfficeContact);
        PurchaseOrder.AccountTeamName := GetOpsAccountTeamName(PurchaseOrder.OfficeContact);
      end
    else
      begin
        PurchaseOrder.AccountTeamName := GetAccountTeamName(PurchaseOrder.AccountTeam);
      end;

    if (PurchaseOrder.FuncMode <> poCopy) and
      (PurchaseOrder.FuncMode <> poRepeat) then
      begin
        PurchaseOrder.AuthorisedBy := fieldbyname('Authorised_By').asinteger;
        if PurchaseOrder.AuthorisedBy <> 0 then
          PurchaseOrder.AuthorisedByName := GetAuthorisedByName(PurchaseOrder.AuthorisedBy)
        else
          PurchaseOrder.AuthorisedByName := '';

        PurchaseOrder.Narrative := FieldByName('Authorised_Reason').AsInteger;
        PurchaseOrder.NarrativeText :=  GetNarrative(PurchaseOrder.Narrative);
        PurchaseOrder.NeedsAuthorising := (FieldByName('Needs_Authorising').Asstring = 'Y');
      end
    else
      begin
        PurchaseOrder.AuthorisedBy := 0;
        PurchaseOrder.AuthorisedByName := '';

        PurchaseOrder.Narrative := 0;
        PurchaseOrder.NarrativeText := '';
        PurchaseOrder.NeedsAuthorising := false;
      end;

//    Close;
  end;
end;

function TPBPODM.GetAccountTeamName(tempno: integer): string;
begin
  with qryGetAccountTeam do
    begin
      close;
      parambyname('Account_Team').asinteger := tempno;
      open;
      result := fieldbyname('Account_Team_Name').asstring;
    end;
end;

function TPBPODM.GetPriceUnitDescr(PriceUnit: integer): string;
begin
  with PriceUnitLUSQL do
  begin
    Close;
    ParamByName('Price_Unit').AsInteger := PriceUnit;
    Open;
    Result := FieldByName('Description').AsString;
    Close;
  end;
end;

function TPBPODM.GetPriceUnitShowTotal(PriceUnit: integer): string;
begin
  with PriceUnitLUSQL do
  begin
    Close;
    ParamByName('Price_Unit').AsInteger := PriceUnit;
    Open;
    Result := FieldByName('show_on_report').AsString;
    Close;
  end;
end;

function TPBPODM.GetPriceUnitFactor(PriceUnit: integer): integer;
begin
  with PriceUnitLUSQL do
  begin
    Close;
    ParamByName('Price_Unit').AsInteger := PriceUnit;
    Open;
    Result := FieldByName('Price_Unit_Factor').Asinteger;
    Close;
  end;
end;

function TPBPODM.GetAddressString(const iType : TAddressType;
  iCode, iBranch: integer): string;
begin
  case iType of
    atAdHoc:
    begin
      with GetAddHocAddrSQL do
      begin
        Close;
        ParamByName('Ad_Hoc_Address').AsInteger := iCode;
        Open;
        Result := BuildAddress(GetAddHocAddrSQL);
        Close;
      end;
    end;
    atSupplier:
    begin
      with GetSuppAddrSQL do
      begin
        Close;
        ParamByName('Supplier').AsInteger := iCode;
        ParamByName('Branch_No').AsInteger := iBranch;
        Open;
        Result := BuildAddress(GetSuppAddrSQL);
      end;
    end;
    atRep:
    begin
      with GetRepAddrSQL do
      begin
        Close;
        ParamByName('Rep').AsInteger := iCode;
        Open;
        Result := BuildAddress(GetRepAddrSQL);
      end;
    end;
    atCustomer:
    begin
      with GetCustAddrSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCode;
        ParamByName('Branch_No').AsInteger := iBranch;
        Open;
        Result := BuildAddress(GetCustAddrSQL);
      end;
    end;
    atCompany:
    begin
      if iBranch <> 0 then
        begin
          with GetCompBrAddrSQL do
          begin
            Close;
            ParamByName('Branch_No').AsInteger := iBranch;
            Open;
            Result := BuildBranchAddress(GetCompBrAddrSQL);
          end;
        end
      else
        begin
          with GetCompAddrSQL do
          begin
            Close;
            Open;
            Result := BuildAddress(GetCompAddrSQL);
          end;
        end;
    end;
  end;  { case }
end;

function TPBPODM.BuildAddress(Query: TFDQuery): string;
begin
  Result := '';
  with Query do
  begin
    try
      if fieldbyname('Use_Branch_Name').asstring = 'Y' then
        begin
          if Trim(FieldByName('Name').AsString) <> '' then
            Result := Result + Trim(FieldByName('Branch_Name').AsString) + #13#10
        end
      else
        begin
          if Trim(FieldByName('Name').AsString) <> '' then
            Result := Result + Trim(FieldByName('Name').AsString) + #13#10;
        end;
    except
      if Trim(FieldByName('Name').AsString) <> '' then
        Result := Result + Trim(FieldByName('Name').AsString) + #13#10;
    end;
    if Trim(FieldByName('Building_No_name').AsString) <> '' then
      Result := Result + Trim(FieldByName('Building_No_name').AsString) + #13#10;
    if Trim(FieldByName('Street').AsString) <> '' then
      Result := Result + Trim(FieldByName('Street').AsString) + #13#10;
    if Trim(FieldByName('Locale').AsString) <> '' then
      Result := Result + Trim(FieldByName('Locale').AsString) + #13#10;
    if Trim(FieldByName('Town').AsString) <> '' then
      Result := Result + Trim(FieldByName('Town').AsString) + #13#10;
    if Trim(FieldByName('County').AsString) <> '' then
      Result := Result + Trim(FieldByName('County').AsString) + #13#10;
    if Trim(FieldByName('Postcode').AsString) <> '' then
      Result := Result + Trim(FieldByName('Postcode').AsString) + #13#10;
  end;
end;

function TPBPODM.BuildBranchAddress(Query: TFDQuery): string;
begin
  Result := '';
  with Query do
  begin
    if Trim(FieldByName('Name').AsString) <> '' then
      Result := Result + Trim(FieldByName('Name').AsString) + #13#10;
    if Trim(FieldByName('Branch_Name').AsString) <> '' then
      Result := Result + Trim(FieldByName('Branch_Name').AsString) + #13#10;
    if Trim(FieldByName('Building_No_name').AsString) <> '' then
      Result := Result + Trim(FieldByName('Building_No_name').AsString) + #13#10;
    if Trim(FieldByName('Street').AsString) <> '' then
      Result := Result + Trim(FieldByName('Street').AsString) + #13#10;
    if Trim(FieldByName('Locale').AsString) <> '' then
      Result := Result + Trim(FieldByName('Locale').AsString) + #13#10;
    if Trim(FieldByName('Town').AsString) <> '' then
      Result := Result + Trim(FieldByName('Town').AsString) + #13#10;
    if Trim(FieldByName('Postcode').AsString) <> '' then
      Result := Result + Trim(FieldByName('Postcode').AsString) + #13#10;
  end;
end;

function TPBPODM.GetAddressSpecInstr(const iType : TAddressType;
  iCode, iBranch: integer): string;
var
  branchNarr: string;
begin
  case iType of
    atAdHoc:
    begin
      with GetAddHocAddrSQL do
      begin
        Close;
        ParamByName('Ad_Hoc_Address').AsInteger := iCode;
        Open;
        Result := GetNarrative(fieldbyname('Delivery_Narrative').asinteger);
        Close;
      end;
    end;
    atSupplier:
    begin
      {No Delivery Narrative field for Supplier}
      Result := '';
    end;
    atRep:
    begin
      {No Delivery Narrative field for Rep}
      Result := '';
    end;
    atCustomer:
    begin
      with GetCustAddrSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCode;
        ParamByName('Branch_No').AsInteger := iBranch;
        Open;
        Result := GetNarrative(fieldbyname('Delivery_Narrative').asinteger);
      end;
    end;
    atCompany:
    begin
      branchNarr := '';
      if iBranch <> 0 then
        begin
          with GetCompBrAddrSQL do
          begin
            Close;
            ParamByName('Branch_No').AsInteger := iBranch;
            Open;
            branchNarr := GetNarrative(fieldbyname('Delivery_Narrative').asinteger);
          end;
        end;

      with GetCompAddrSQL do
        begin
          Close;
          Open;
          Result := trim(GetNarrative(fieldbyname('Delivery_Narrative').asinteger)) + #13#10 + trim(branchNarr);
        end;
    end;
  end;  { case }
end;

function TPBPODM.GetCustContactName(Cust, Branch,
  Contact: Integer): string;
begin
  Result := '';
  CustContactSQL.Close;
  CustContactSQL.ParamByName('Customer').AsInteger := Cust;
  CustContactSQL.ParamByName('Branch').AsInteger := Branch;
  CustContactSQL.Open;
  while (not CustContactSQL.EOF) do
  begin
    if CustContactSQL.FieldByName('Contact_No').AsInteger = Contact then
      Result := CustContactSQL.FieldByName('Name').AsString;
    CustContactSQL.Next;
  end;
  CustContactSQL.Close;
end;

procedure TPBPODM.DataModuleCreate(Sender: TObject);
begin
  dmIntSel := TdmIntSel.Create(Self);
  CheckDatabase;
end;

procedure TPBPODM.DataModuleDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

procedure TPBPODM.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TPBPODM.LockCompanyRecord;
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
  MySelf := frmPBMainMenu.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
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

function TPBPODM.GetSuppContactName(const iSupp, iBranch, iContact: integer): string;
begin
  with GetSuppContactSQL do
  begin
    Close;
    ParamByname('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := iBranch;
    ParamByName('Contact_No').AsInteger := iContact;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

function TPBPODM.GetSuppBranchName(const iSupp, iBranch: integer): string;
begin
  with GetSuppBranchSQL do
  begin
    Close;
    ParamByname('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := iBranch;
    Open;
    Result := FieldByName('Branch_Name').AsString;
    Close;
  end;
end;

function TPBPODM.GetSuppName(const iSupp: integer): string;
begin
  with GetSuppBranchSQL do
  begin
    Close;
    ParamByname('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := 0;
    Open;
    Result := FieldByName('Name').AsString;
    Close;
  end;
end;

(*
procedure TPBPODM.LoadQuestions(var PurchaseOrder: TPurchaseOrder);
var
  aQuestion: TQuestion;
  Line, inx : integer;
begin
  {Load the questions and answers if any}
  with PBPODM.GetQuestionsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      aQuestion := TQuestion.Create;
      with aQuestion do
      begin
        Line := FieldByName('Line').AsInteger;
        QuestionNo := FieldByName('Question').AsInteger;
        QuestionText := FieldByName('Question_Text').AsString;
        Answer := FieldByName('Product_Answer').AsString;
        ProductType := FieldByName('Product_Type').AsInteger;
      end;
      inx := PurchaseOrder.OrderLines.IndexFromLineNo(Line);
      PurchaseOrder.OrderLines[inx].Questions.Add(aQuestion);
      Next;
    end;
    Close;
  end;
end;
*)

procedure TPBPODM.LoadQuestions(var PurchaseOrder: TPurchaseOrder);
var
  aQuestion: TQuestion;
  Line, inx : integer;
begin
  {Get the Purchase Order Line Product Type details}
  with GetLineProdTypeSQL do
    begin
      close;
      parambyname('Purchase_Order').asfloat := PurchaseOrder.PONumber;
      open;

      first;
      while not EOF do
        begin
          GetPOQuestionSQL.close;
          GetPOQuestionSQL.parambyname('Purchase_Order').asfloat := PurchaseOrder.PONumber;
          GetPOQuestionSQL.parambyname('Line').asinteger := fieldbyname('Line').asinteger;
          GetPOQuestionSQL.parambyname('Product_Type').asinteger := fieldbyname('Product_Type').asinteger;
          GetPOQuestionSQL.parambyname('Question').asinteger := fieldbyname('Question').asinteger;
          GetPOQuestionSQL.open;

          GetPOQuestionSQL.first;

          {Add a question to the Purchase Order Line}
          aQuestion := TQuestion.Create;
          with aQuestion do
            begin
              Line := FieldByName('Line').AsInteger;
              QuestionNo := FieldByName('Question').AsInteger;
              QuestionText := FieldByName('Question_Text').AsString;
              Answer := GetPOQuestionSQL.FieldByName('Product_Answer').AsString;
              ProductType := FieldByName('Product_Type').AsInteger;
              PromptType := fieldbyname('Prompt_Type').asstring;
            end;
          inx := PurchaseOrder.OrderLines.IndexFromLineNo(Line);
          PurchaseOrder.OrderLines[inx].Questions.Add(aQuestion);
          Next;
        end;
      close;
    end;
end;

procedure TPBPODM.LoadCallOffOrders(var PurchaseOrder: TPurchaseOrder);
var
  aLine: TCallOffOrder;
  OrdInx, icount: Integer;
begin
  {Don't get Call Offs when copying or repeating an order}
  if (PurchaseOrder.FuncMode = poCopy) or
     (PurchaseOrder.FuncMode = poRepeat) then exit;

  {Load the Call Off details}
  icount:=0;
  with PBPODM.GetLineCallOffsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      {Call Offs are orders with decimal places so don't process any other orders}
      if frac(FieldByName('Purchase_Order').Asfloat) = 0 then
        begin
          next;
          continue;
        end;

      aLine := TCallOffOrder.Create;
      with aLine do
      begin
        Line := FieldByName('Original_OrderLine').AsInteger;
        PONumber := FieldByName('Purchase_Order').Asfloat;
        CallOffNo := FieldByName('Delivery_no').Asinteger;
        POLine := FieldByName('Line').Asinteger;
        Supplier := FieldByName('Supplier').AsInteger;
        SuppBranch := FieldByName('Supplier_Branch').Asinteger;
        SuppContact := FieldByName('Supplier_Contact').Asinteger;
        Customer := FieldByName('Customer').AsInteger;
        CustBranch := FieldByName('Customer_Branch').Asinteger;
        CustContact := FieldByName('Customer_Contact').Asinteger;
        OrderDate := FieldByName('Date_Point').Asdatetime;
        RequiredDate := FieldByName('Schedule_Date').Asdatetime;
        OrderQty := FieldByName('Qty_to_Deliver').Asinteger;

        AdhocAddress := FieldByName('Ad_hoc_Address').Asinteger;
        DelSuppBranchNo := FieldByName('Delivery_SBranch').Asinteger;
        DelCustBranchNo := FieldByName('Delivery_CBranch').AsInteger;
        DelCustomer := FieldByName('Delivery_Customer').Asinteger;
        DelSupplier := FieldByName('Delivery_Supplier').Asinteger;
        DelRep := FieldByName('Delivery_Rep').Asinteger;
        Instructions := FieldByName('Delivery_Instructions').Asstring;
        NoOfBoxes := FieldByName('No_of_Boxes').Asinteger;
        QtyDelivered := FieldByName('Qty_Delivered').Asinteger;
        Rep := FieldByName('Rep').Asinteger;
        DateDelivActual := FieldByName('Date_Deliv_Actual').Asdatetime;
        Status := FieldByName('purch_ord_line_status').Asinteger;
        inc(icount);
        CallOffSeq := icount;
        BoxQty := Fieldbyname('Forms_per_box').asstring;
        SellPrice := Fieldbyname('Selling_Price').asfloat;
        CostPrice := Fieldbyname('Order_price').asfloat;
        SellUnit := Fieldbyname('Sell_Unit').asinteger;
        CostUnit := Fieldbyname('Order_Unit').asinteger;
        Description := Fieldbyname('Customers_Desc').asstring;
        CustOrderNo := Fieldbyname('Cust_Order_no').asstring;
        FormReference := Fieldbyname('Form_reference').asinteger;
        NumberInstructions := Fieldbyname('Number_instructions').asstring;
        InActive := Fieldbyname('Inactive').asstring;
        InActiveReason := FieldByName('Inactive_Reason').Asinteger;
        InActiveDate := FieldByName('Inactive_Date').Asdatetime;
        InvoiceUpfront := fieldbyname('Invoice_upfront').asstring;
        CalloffInvoicedUpfront := fieldbyname('Calloff_invoiced_upfront').asstring;
        FAO := fieldByName('contact_name').asString;
      end;
      { Fit the Call Off into the correct order line }
      OrdInx := PurchaseOrder.OrderLines.IndexFromLineNo(aLine.Line);
      PurchaseOrder.OrderLines[OrdInx].CallOffOrders.Add(aLine);
      Next;
    end;
    Close;
  end;
end;

procedure TPBPODM.DeletePOQuestion(const rPONumber: real; iLine: Integer);
begin
  with DelPOQuestionsSQL do
  begin
    ParamByName('AllLines').AsString := 'N';
    ParamByName('PONumber').Asfloat := rPONumber;
    ParamByName('POLine').AsInteger := iLine;
    ExecSQL;
  end;
end;

procedure TPBPODM.DeletePOQuestions(const rPONumber: real);
begin
  with DelPOQuestionsSQL do
  begin
    ParamByName('AllLines').AsString := 'Y';
    ParamByName('PONumber').Asfloat := rPONumber;
    ExecSQL;
  end;
end;

procedure TPBPODM.SaveQuestions(var PurchaseOrder: TPurchaseOrder;
  const aLine : integer);
var
  i : integer;
begin
  { Delete any existing records then write back any still existing
    in the PurchaseOrder object }
  DeletePOQuestions(PurchaseOrder.PONumber);
  with PurchaseOrder.OrderLines[aLine] do
  begin
    for i := 0 to Pred(Questions.Count) do
    with AddPOQuestionSQL, Questions[i] do
    begin
      if trim(Answer) = '' then continue;
      ParamByName('Product_Type').AsInteger := ProductType;
      ParamByName('Question').AsInteger := QuestionNo;
      ParamByName('PONumber').Asfloat := PurchaseOrder.PONumber;
      ParamByName('POLine').AsInteger := Line;
      ParamByName('Product_Answer').AsString := Answer;
      ExecSQL;
    end;
  end;
end;

procedure TPBPODM.CheckDatabase;
begin
  with qryGeneral do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT Delivery_Instructions FROM Delivery_Detail');
    try
      Open;
      FNoDelInstruct := false;
    except
      FNoDelInstruct := true;
    end;
    Close;
  end;
  if FNoDelInstruct then
  begin
    AddPODelivSQL.SQL.Clear;
    AddPODelivSQL.SQL.Add('Insert Into Delivery_Detail ');
    AddPODelivSQL.SQL.Add('(Purchase_Order, Line,Delivery_No,Ad_Hoc_Address,Supplier,Branch_No, ');
    AddPODelivSQL.SQL.Add('Rep,Qty_To_Deliver, ');
    AddPODelivSQL.SQL.Add('Qty_Delivered,Qty_Invoiced,Date_Point,Customer,Branch_No0, ');
    AddPODelivSQL.SQL.Add('Is_Updated, No_Of_boxes, Deliver_Via_Company) ');
    AddPODelivSQL.SQL.Add('Values  ');
    AddPODelivSQL.SQL.Add('(:Purchase_Order,:Line,:Delivery_No,:Ad_Hoc_Address,:Supplier,:Branch_No, ');
    AddPODelivSQL.SQL.Add(':Rep,:Qty_To_Deliver,  ');
    AddPODelivSQL.SQL.Add(':Qty_Delivered,:Qty_Invoiced,:Date_Point,:Customer,:Branch_No0, ');
    AddPODelivSQL.SQL.Add('''Y'', :No_Of_boxes, :Deliver_Via_Company)  ');
    FixParameters(AddPODelivSQL);
    UpdPODelivSQL.SQL.Clear;
    UpdPODelivSQL.SQL.Add('Update Delivery_Detail Set Ad_Hoc_Address = :Ad_Hoc_Address, ');
    UpdPODelivSQL.SQL.Add('Supplier = :Supplier, Branch_No = :Branch_No, Rep = :Rep, ');
    UpdPODelivSQL.SQL.Add('Qty_To_Deliver = :Qty_To_Deliver, Qty_Delivered = :Qty_Delivered, ');
    UpdPODelivSQL.SQL.Add('Qty_Invoiced = :Qty_Invoiced, Date_Point = :Date_Point, ');
    UpdPODelivSQL.SQL.Add('Customer = :Customer, Branch_No0 = :Branch_No0, ');
    UpdPODelivSQL.SQL.Add('Is_Updated = ''Y'', No_Of_boxes = :No_Of_boxes, Deliver_Via_Company = :Deliver_Via_Company ');
    UpdPODelivSQL.SQL.Add('Where (Purchase_Order = :Purchase_Order) and ');
    UpdPODelivSQL.SQL.Add('(Line = :Line) and (Delivery_No = :Delivery_No) ');
    FixParameters(UpdPODelivSQL);
  end;
end;

procedure TPBPODM.FixParameters(aQuery : TFDQuery);
var
  i : integer;
begin
  with aQuery do
  begin
    for i := 0 to Pred(Params.Count) do
      Params[i].ParamType := ptInput;
    ParamByName('Ad_Hoc_Address').DataType := ftInteger;
    ParamByName('Supplier').DataType := ftInteger;
    ParamByName('Branch_No').DataType := ftInteger;
    ParamByName('Rep').DataType := ftInteger;
    ParamByName('Qty_To_Deliver').DataType := ftFloat;
    ParamByName('Qty_Delivered').DataType := ftFloat;
    ParamByName('Qty_Invoiced').DataType := ftFloat;
    ParamByName('Date_Point').DataType := ftDateTime;
    ParamByName('Customer').DataType := ftInteger;
    ParamByName('Branch_No0').DataType := ftInteger;
    ParamByName('No_Of_boxes').DataType := ftString;
    ParamByName('Purchase_Order').DataType := ftInteger;
    ParamByName('Line').DataType := ftInteger;
    ParamByName('Delivery_No').DataType := ftInteger;
  end;
end;

function TPBPODM.StockSystemInUse: Boolean;
begin
with qrystock do
try
  close;
  sql.Clear;
  SQL.Add('Select Use_Stock_System from Company');
  open;
  Result := FieldByName('Use_Stock_System').AsString = 'Y';
except
  Result := False;
end;
end;

function TPBPODM.CheckJobBagExist(TempCode: integer): boolean;
begin
  with qryCheckJobBag do
    begin
      close;
      parambyname('Job_Bag').asinteger := TempCode;
      open;
      Result := (recordcount > 0);
    end;
end;

function TPBPODM.GetCustomerDefVAT(tempcode: integer): integer;
begin
  with GetCustSQL do
    begin
      close;
      parambyname('Customer').asinteger := tempcode;
      open;
      result := fieldbyname('Vat_Code_Def').asinteger;
    end;
end;

function TPBPODM.GetJobBagNumber(TempPO: real; TempLine: integer): integer;
begin
  with GetJobBagdetsSQL do
    begin
      close;
      parambyname('Purchase_order').asfloat := TempPO;
      parambyname('Line').asinteger := TempLine;
      open;
      result := fieldbyname('Job_Bag').asinteger;
    end;
end;

function TPBPODM.GetInvoiceUpfront(TempPO: real; TempLine: integer): string;
begin
  with GetPOLineSQL do
    begin
      close;
      parambyname('Purchase_order').asfloat := TempPO;
      parambyname('Line').asinteger := TempLine;
      open;
      result := fieldbyname('Invoice_upfront').asstring;
    end;
end;

function TPBPODM.GetDelivNarr(const iType: TAddressType; iCode,
  iBranch: integer): integer;
begin
  Result := 0;
  case iType of
    atAdHoc:
    begin
      with GetAddHocAddrSQL do
      begin
        Close;
        ParamByName('Ad_Hoc_Address').AsInteger := iCode;
        Open;
        Result := fieldbyname('Delivery_Narrative').asinteger;
        Close;
      end;
    end;
    atSupplier:
    begin
      {No Delivery Narrative field for Supplier}
      Result := 0;
    end;
    atRep:
    begin
      {No Delivery Narrative field for Rep}
      Result := 0;
    end;
    atCustomer:
    begin
      with GetCustAddrSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCode;
        ParamByName('Branch_No').AsInteger := iBranch;
        Open;
        Result := fieldbyname('Delivery_Narrative').asinteger;
      end;
    end;
    atCompany:
      begin
      with GetCompanySQL do
      begin
        Close;
        Open;
        Result := fieldbyname('Delivery_Narrative').asinteger;
        Close;
      end;
    end;
  end;  { case }
end;

procedure TPBPODM.LoadIntNotes(PONum: real; var OrderLine: TOrderLine);
var
  IntNote: TIntNote;
begin
  self.qryGetPOLineIntNotes.Active := false;
  self.qryGetPOLineIntNotes.ParamByName('purchase_order').asFloat := PONum;
  self.qryGetPOLineIntNotes.ParamByName('line').asInteger := OrderLine.Line;
  self.qryGetPOLineIntNotes.Active := true;

  while not self.qryGetPOLineIntNotes.eof do
  begin
    IntNote := TIntNote.Create;
    IntNote.DateEntered :=
      self.qryGetPOLineIntNotes.FieldByName('Date_Time_Entered').asDateTime;
    IntNote.Narrative.DbKey :=
      self.qryGetPOLineIntNotes.FieldByName('Narrative').asInteger;
    IntNote.Narrative.LoadFromDB;
    IntNote.Operator :=
      self.qryGetPOLineIntNotes.FieldByName('Operator').asInteger;
    IntNote.OperatorName :=
      self.qryGetPOLineIntNotes.FieldByName('name').asString;

    orderLine.IntNoteList.Add(IntNote);
    self.qryGetPOLineIntNotes.next;
  end;
end;

procedure TPBPODM.SaveIntNotes(PONum: real; OrderLine: TOrderLine);
var
  inx: integer;
begin
  //delete existing notes
  self.qryDelPOLineIntNotes.ParamByName('purchase_order').asFloat := PONum;
  self.qryDelPOLineIntNotes.ParamByName('line').asInteger := orderline.Line;
  self.qryDelPOLineIntNotes.ExecSQL;
  
  //recreate notes
  for inx := 0 to (OrderLine.IntNoteList.Count - 1) do
  begin
    orderLine.IntNoteList[inx].Narrative.SaveToDB;
    self.SaveIntNote(PONum, orderLine.Line, inx, orderLine.intNoteList[inx]);
  end;
end;

procedure TPBPODM.SaveIntNote(poNum: real; lineNo, noteNum: integer; intNote: TIntNote);
begin
  self.qryInsIntNote.ParamByName('Purchase_Order').asFloat := poNum;
  self.qryInsIntNote.ParamByName('Line').asInteger := lineNo;
  self.qryInsIntNote.ParamByName('Internal_Notes').asInteger := noteNum;
  self.qryInsIntNote.ParamByName('Date_Time_Entered').asDateTime := intNote.DateEntered;
  self.qryInsIntNote.ParamByName('Narrative').asInteger := intNote.Narrative.DbKey;
  self.qryInsIntNote.ParamByName('Operator').asInteger := intNote.Operator;
  self.qryInsIntNote.ExecSQL;
end;

function TPBPODM.CalcPOLineExpectedLife(PONum: double;
  OrderLine: TOrderLine): integer;
var
  expectedLife: double;
  currentOrderDate: TDateTime;
begin
  currentOrderDate := date+1;
  self.GetPOLineSQL.close;
  self.GetPOLineSQL.paramByName('Purchase_Order').asFloat := PONum;
  self.GetPOLineSQL.paramByName('line').asInteger := orderLine.Line;
  self.GetPOLineSQL.open;


  //work out how many days each unit of the job lasted
  expectedLife :=
      ((currentOrderDate - self.GetPOLineSQL.FieldByName('Goods_reqd_by_customer').asDateTime)+1)/
      self.GetPOLineSQL.FieldByName('quantity').asFloat;

  self.GetPOLineSQL.close;
  //work out how many days the new order quantity should last for based on
  //previous order life history
  Result := trunc(expectedLife * OrderLine.Quantity);
end;

procedure TPBPODM.ClearPOExpectedLife(PONum: double; lineNo: integer);
begin
  //this procdure is used to clear the expected life field from a purchase orderline
  //this is done when an order is repeated. the expected life field holds data
  //saying when the order is likely to be repeated - so when it is actually repeated
  //the data can be cleared out.
  self.qryDelExpLife.ParamByName('purchase_order').asFloat := PONum;
  self.qryDelExpLife.ParamByName('line').asInteger := lineNo;
  self.qryDelExpLife.ParamByName('expLife').clear;
  self.qryDelExpLife.ExecSQL;
end;

function TPBPODM.IsCustomerActive(TempCust: integer): boolean;
begin
  with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := (FieldByName('Acc_Active').AsString = 'Y');
    Close;
  end;
end;

function TPBPODM.GetVatRate(TempVatCode: Integer): string;
begin
  with VatRateSQL do
  begin
    Close;
    ParamByName('Vat_Code').AsInteger := TempVatCode;
    Open;
    Result := FieldByName('Vat_Rate').AsString;
    Close;
  end;
end;

procedure TPBPODM.GetPOSInvList(PONum: real; Line: integer; var invList: TStringList);
var
  tempStr: string;
  qty, priceUnitFact, price, vatRate, charges, chargesVAT: real;
begin
  qryPOSInvs.close;
  qryPOSInvs.ParamByName('Purchase_order').asFloat := PONum;
  qryPOSInvs.ParamByName('Line').asFloat := Line;
  qryPOSInvs.open;

  while not qryPOSInvs.eof do
  begin
    qty := qryPOSInvs.FieldByName('Qty_Invoiced').asFloat;
    priceUnitFact := qryPOSInvs.FieldByName('Price_Unit_Factor').asFloat;
    price := qryPOSInvs.FieldByName('Goods_Value').asFloat;
    vatRate := qryPOSInvs.FieldByName('Vat_Rate').asFloat;

    charges := qryPOSInvs.FieldByName('additional_charges').asFloat;
    chargesVAT := qryPOSInvs.FieldByName('additional_charges_vat').asFloat;

    tempStr := qryPOSInvs.FieldByName('Sales_invoice_no').asString + '#';
    tempStr := tempStr + qryPOSInvs.FieldByName('Invoice_Date').asString + '#';

    if qryPOSInvs.FieldByName('credit_type').asString = 'P' then
      tempStr := tempStr + '0#'
    else
      tempStr := tempStr + FloatToStrF(qty, ffFixed, 15, 0) + '#';

    if priceUnitFact <> 0.00 then
    begin
      tempStr := tempStr + FloatToStrF(((abs(qty)/priceUnitFact) * price), ffFixed, 15, 2) + '#';
      tempStr := tempStr + FloatToStrF(((abs(qty)/priceUnitFact) * (vatRate/100) * Price), ffFixed, 15, 2) + '#';
    end
    else
    begin
      tempStr := tempStr + FloatToStrF(price, ffFixed, 15, 2) + '#';
      tempStr := tempStr + FloatToStrF(((vatRate/100) * Price), ffFixed, 15, 2) + '#';
    end;

    tempStr := tempStr + FloatToStrF(charges, ffFixed, 15, 2) + '#';
    tempStr := tempStr + FloatToStrF(chargesvat, ffFixed, 15, 2) + '#';

    tempStr := tempStr + qryPOSInvs.FieldByName('Sales_invoice').asString;
    invList.Add(tempStr);
    qryPOSInvs.next;
  end;
  qryPOSInvs.close;
end;

procedure TPBPODM.GetPOPInvList(PONum: real; Line: integer;
  var invList: TStringList);
var
  tempStr: string;
  qty, priceUnitFact, price, vatRate, Charges, ChargesVat: real;
begin
  qryPOPInvs.close;
  qryPOPInvs.ParamByName('Purchase_order').asFloat := PONum;
  qryPOPInvs.ParamByName('Line').asFloat := Line;
  qryPOPInvs.open;

  while not qryPOPInvs.eof do
  begin

    qty := qryPOPInvs.FieldByName('Qty_Invoiced').asFloat;
    priceUnitFact := qryPOPInvs.FieldByName('Price_Unit_Factor').asFloat;
    price := qryPOPInvs.FieldByName('Goods_Value').asFloat;
    vatRate := qryPOPInvs.FieldByName('Vat_Rate').asFloat;

    charges := qryPOPInvs.FieldByName('Additional_Charges').asFloat;
    chargesVat := qryPOPInvs.FieldByName('Additional_Charges_Vat').asFloat;

    tempStr := qryPOPInvs.FieldByName('Supplier_invoice_no').asString + '#';
    tempStr := tempStr + qryPOPInvs.FieldByName('Invoice_Date').asString + '#';

    if qryPOPInvs.FieldByName('credit_type').asString = 'P' then
      tempStr := tempStr + '0#'
    else
      tempStr := tempStr + FloatToStrF(qty, ffFixed, 15, 0) + '#';

    if priceUnitFact <> 0.00 then
    begin
      tempStr := tempStr + FloatToStrF(((abs(qty)/priceUnitFact) * price), ffFixed, 15, 2) + '#';
      tempStr := tempStr + FloatToStrF(((abs(qty)/priceUnitFact) * (vatRate/100) * Price), ffFixed, 15, 2) + '#';
    end
    else
    begin
      tempStr := tempStr + FloatToStrF(price, ffFixed, 15, 2) + '#';
      tempStr := tempStr + FloatToStrF(((vatRate/100) * Price), ffFixed, 15, 2) + '#';
    end;

    tempStr := tempStr + FloatToStrF(charges, ffFixed, 15, 2) + '#';
    tempStr := tempStr + FloatToStrF(chargesvat, ffFixed, 15, 2) + '#';

    tempStr := tempStr + qryPOPInvs.FieldByName('Supplier_invoice').asString;
    invList.Add(tempStr);
    qryPOPInvs.next;
  end;
  qryPOPInvs.close;
end;

procedure TPBPODM.GetCurrentCustomerRep(OrderLine: TOrderLine);
var
  tempRep: integer;
begin
  qryGetBranchRep.Close;
  qryGetBranchRep.ParamByName('Customer').asInteger := OrderLine.Customer;
  qryGetBranchRep.ParamByName('Branch_No').asInteger := OrderLine.BranchNo;
  qryGetBranchRep.Open;

  qryGetBranchRep.first;
  tempRep := qryGetBranchRep.fieldbyname('Rep').asinteger;

  while qryGetBranchRep.eof <> true do
    begin
      if qryGetBranchRep.fieldbyname('Rep').asinteger = OrderLine.Rep then
        begin
          tempRep := OrderLine.Rep;
          break;
        end;
      qryGetBranchRep.next;
    end;

  OrderLine.Rep := tempRep;
end;

function TPBPODM.GetOpsAccountTeamName(tempno: integer): string;
begin
  with qryGetAccountMgr do
    begin
      close;
      parambyname('Operator').asinteger := tempno;
      open;
      result := fieldbyname('Account_Team_Name').asstring;
    end;
end;

function TPBPODM.GetOpsAccountTeam(tempno: integer): integer;
begin
  with qryGetAccountMgr do
    begin
      close;
      parambyname('Operator').asinteger := tempno;
      open;
      result := fieldbyname('Account_Team').asinteger;
    end;
end;

function TPBPODM.GetProdTypeShouldInvoice(TempProdType: integer): boolean;
begin
  with GetProdTypesSQL do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := TempProdType;
    Open;
    Result := (FieldByName('Invoice_immediately').AsString = 'Y');
    Close;
  end;
end;

function TPBPODM.GetProdTypeCashSale(TempProdType: integer): boolean;
begin
  with GetProdTypesSQL do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := TempProdType;
    Open;
    Result := (FieldByName('Cleared_Funds_Required').AsString = 'Y');
    Close;
  end;
end;

function TPBPODM.GetProdType(TempProdType: integer): boolean;
begin
  with qryGetProdType do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := TempProdType;
    Open;
    Result := (recordcount > 0);
    Close;
  end;

end;

function TPBPODM.GetProdTypePUnits(TempProdType: integer): boolean;
begin
  with qryGetProdTypePriceUnit do
  begin
    Close;
    ParamByName('Product_Type').AsInteger := TempProdType;
    Open;
    result := (recordcount > 0);
  end;
end;

function TPBPODM.GetAuthorisedByName(tempno: integer): string;
begin
  with qryGetOperator do
    begin
      close;
      parambyname('Operator').asinteger := tempNo;
      open;
      result := fieldbyname('Name').asstring;
    end;
end;

function TPBPODM.IsCustomerInvoicedUpfront(tempCust: integer): string;
begin
 with GetCustSQL do
  begin
    Close;
    ParamByName('Customer').AsInteger := TempCust;
    Open;
    Result := FieldByName('Invoice_Upfront').AsString;
    Close;
  end;
end;

function TPBPODM.GetTotalStockUsage(tempCode: real): integer;
begin
  with qryGetTotalUsage do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      open;

      result := fieldbyname('Store_Quantity').asinteger;
    end;
end;

function TPBPODM.GetTotalStock(tempCode: real): integer;
begin
  with qryGetTotalStock do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempCode;
      open;

      result := fieldbyname('Free_Stock').asinteger;
    end;
end;

procedure TPBPODM.SaveFieldChanges(tempTable: string; DSFrom: TDataSet; SQLTo: TFDQuery);
var
  iparam: integer;
  iCount: Integer ;
  tempField: TField ;
  tempParam: TFDParam;
  tempFieldType: TFieldType;
  sTempFrom, sTempTo: String;
begin
  for iCount := 0 to SQLTo.ParamCount - 1 do
    begin
      tempParam := SQLTo.Params[iCount] ;
      {Try to find the same field name in the INPUT dataset} ;
      try
        tempField := DSFrom.FieldByName(TempParam.Name) ;
      except
        continue ;
      end;

      {If found OK, access the field type. Currently this only handles STRINGS, FLOATS and INTEGERS} ;
      {Any other types brings up a message} ;
      tempFieldType := TempParam.DataType ;
      if tempFieldType = ftString then
        begin
          sTempFrom := Trim(tempField.AsString) ;
          sTempTo := Trim(tempParam.AsString) ;
        end
      else
        if (TempFieldType = ftCurrency) then
          begin
            sTempFrom := FormatFloat('######0.000',TempField.AsFloat) ;
            sTempTo := FormatFloat('######0.000',TempParam.AsFloat) ;
          end
      else
        if tempFieldType = ftInteger then
          begin
            sTempFrom := IntToStr(TempField.AsInteger) ;
            sTempTo :=IntToStr(TempParam.AsInteger) ;
          end
      else
        if TempFieldType = ftDateTime then
          begin
            sTempFrom := DateToStr(TempField.AsDateTime) ;
            sTempTo :=DateToStr(TempParam.AsDateTime) ;
          end
      else
        if (TempFieldType = ftFloat) then
          begin
            sTempFrom := FloatToStr(TempField.AsFloat) ;
            sTempTo := FloatToStr(TempParam.AsFloat) ;
          end
      else MessageDlg('Audit trail does not know type: ',mtinformation,[mbOK],0) ;

      {Compare the field with the parameter} ;
      if sTempFrom <> sTempTo then
        begin
          with GetFldChgTypSQL do
            begin
              Close ;
              paramByName('Audit_Table_Name').AsString := tempTable ;
              paramByName('Audit_Code_1_Field').AsString := TempParam.Name ;
              Open ;
              first ;
              if eof then
                continue;
            end;

          with qryUpdPOHist do
            begin
              close;
              for iparam := 0 to pred(paramcount) do
                params[iparam].clear;

              parambyname('Purchase_Order').asfloat := SQLTo.parambyname('Purchase_Order').asfloat;
              parambyname('Line').asinteger := SQLTo.parambyname('Line').asinteger;
              parambyname('History_no').asinteger := GetNextPOHistory(SQLTo.parambyname('Purchase_Order').asfloat, SQLTo.parambyname('Line').asinteger)+1;
              parambyname('Operator').asinteger := frmPBMainMenu.iOperator;
              parambyname('Date_Point').asdatetime := now;
              parambyname('Customer').asinteger := SQLTo.parambyname('Customer').asinteger;
              parambyname('Cust_Branch_no').asinteger := SQLTo.parambyname('Branch_no').asinteger;
              parambyname('Rep').asinteger := SQLTo.parambyname('Rep').asinteger;
              parambyname('Order_Price').asfloat := SQLTo.parambyname('Order_Price').asfloat;
              parambyname('Selling_Price').asfloat := SQLTo.parambyname('Selling_Price').asfloat;
              parambyname('Quantity').asinteger := SQLTo.parambyname('Quantity').asinteger;
              parambyname('Order_Unit').asinteger := SQLTo.parambyname('Order_Unit').asinteger;
              parambyname('Sell_unit').asinteger := SQLTo.parambyname('Sell_Unit').asinteger;
              parambyname('On_Hold').asstring := SQLTo.parambyname('On_Hold').asString;
              parambyname('Invoice_Upfront').asstring := SQLTo.parambyname('Invoice_upfront').asstring;
              parambyname('Goods_Required').asdatetime := SQLTo.parambyname('Goods_Required').asdatetime;
              parambyname('Goods_Reqd_by_Customer').asdatetime := SQLTo.parambyname('Goods_Reqd_by_Customer').asdatetime;
              parambyname('Product_Type').asinteger := SQLTo.parambyname('Product_Type').asinteger;
              execsql;
            end;
          break;
        end;
    end;

end;

function TPBPODM.GetNextPOHistory(tempPO: real; tempLine: integer): integer;
begin
  with qryGetLastPOHistory do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Last_POL_History').asinteger;
    end;
end;

function TPBPODM.UseCompanyBranch: boolean;
begin
  with qryCompBranch do
    begin
      close;
      open;
      result := (recordcount > 0);
    end;
end;

function TPBPODM.GetCurrentProofStatus(TempPO: real;
  TempLine: integer): string;
begin
  result := '';
  with qryGetPOProof do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Proof_Status').AsString;
    end;
end;

function TPBPODM.GetCurrentProofStatusDate(TempPO: real;
  TempLine: integer): TDateTime;
begin
  result := 0;
  with qryGetPOProof do
    begin
      close;
      parambyname('Purchase_Order').asfloat := tempPO;
      parambyname('Line').asinteger := tempLine;
      open;
      result := fieldbyname('Proof_Date').AsDateTime;
    end;
end;

function TPBPODM.GetCostCentre(tempCust, tempBranch: integer; tempCC, tempCCLevel: string): string;
begin
  if tempCCLevel = 'C' then
    begin
      with qryGetCustCC do
        begin
          Close;
          ParamByName('Customer').AsInteger := TempCust;
          ParamByName('Cost_Centre').Asstring := tempCC;
          Open;
          Result := FieldByName('Description').AsString;
        end;
    end
  else
  if tempCCLevel = 'B' then
    begin
      with qryGetBranchCC do
        begin
          Close;
          ParamByName('Customer').AsInteger := TempCust;
          ParamByName('Branch_no').AsInteger := TempBranch;
          ParamByName('Cost_Centre').Asstring := tempCC;
          Open;
          Result := FieldByName('Description').AsString;
        end;
    end
  else
    Result := '';
end;

function TPBPODM.GetContactAccountNo(tempCust, tempBranch,
  tempCode: integer): string;
begin
  with qryGetCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Branch_no').asinteger := tempBranch;
      parambyname('Contact_no').asinteger := tempCode;
      open;
      result := fieldbyname('Account_Number').asstring;
    end;
end;

procedure TPBPODM.LoadNCADets(var PurchaseOrder: TPurchaseOrder);
var
  aNonConform: TNonConform;
  OrdInx, icount: integer;
begin
  {Load the NCA details}
  with PBPODM.GetNCADetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').Asfloat := PurchaseOrder.PONumber;
    Open;
    while not(EOF) do
    begin
      inc(icount);
      aNonConform := TNonConform.Create;
      aNonConform.Line := fieldbyname('Line').asinteger;
      aNonConform.NCNumber := fieldbyname('Job_Bag_Non_Conform').asinteger;
      aNonConform.NonConformNo := icount;
      aNonConform.DatePoint := fieldbyname('Date_Point').asdatetime;
      aNonConform.JobRePrinted := fieldbyname('Job_reprinted').asstring ;
      aNonConform.SamplesAvailable := fieldbyname('Samples_Available').asstring;
      aNonConform.Operator := fieldbyname('Operator').asinteger;
      aNonConform.OperatorName := fieldbyname('Operator_Name').asstring;
      aNonConform.RaisedBy := fieldbyname('raised_By_Dept').asinteger;
      aNonConform.RaisedbyName := fieldbyname('Raised_by_dept_Descr').asstring;
      aNonConform.NCCategory := fieldbyname('Non_Conform_Category').asinteger;
      aNonConform.NCCategoryDescription := fieldbyname('Non_Conform_Category_Descr').asstring;
      aNonConform.NCDepartment := fieldbyname('Non_Conform_Dept').asinteger;
      aNonConform.NCDepartmentName := fieldbyname('Non_Conform_Dept_Descr').asstring;
      aNonConform.NCType := fieldbyname('Non_Conform_Type').asinteger;
      aNonConform.NCTypeDescription := fieldbyname('Non_Conform_Type_Descr').asstring;
      aNonConform.QAOperator := fieldbyname('QA_Operator').asinteger;
      aNonConform.QAOperatorName := fieldbyname('QA_Operator_Name').asstring;
      aNonConform.QASignOffDate := fieldbyname('QA_Sign_Off_Date').asDateTime;
      aNonConform.TotalCost := fieldbyname('Total_Cost').asfloat;
      aNonConform.CosttoClient := fieldbyname('Total_Cost_to_Client').asfloat;
      aNonConform.Inactive := fieldbyname('inactive').asstring;
      aNonConform.InactiveDate := fieldbyname('inactive_date').asdatetime;
      aNonConform.Narrative := fieldbyname('Non_conform_Notes').asinteger;
      aNonConform.NarrativeText := PBPODM.GetNarrative(aNonConform.Narrative);
      aNonConform.Response := fieldbyname('Response_Notes_id').asinteger;
      aNonConform.ResponseNotes := PBPODM.GetNarrative(aNonConform.Response);
      aNonConform.Corrective := fieldbyname('Corrective_Notes_id').asinteger;
      if aNonConform.Corrective = 0 then
        aNonConform.CorrectiveNotes := fieldbyname('Corrective_Notes').asstring
      else
        aNonConform.CorrectiveNotes := PBPODM.GetNarrative(aNonConform.Corrective);
      aNonConform.Preventative := fieldbyname('Preventative_Notes_id').asinteger;
      aNonConform.PreventativeNotes := PBPODM.GetNarrative(aNonConform.Preventative);
      aNonConform.ResponseDate := fieldbyname('Response_Date').asdatetime;
      aNonConform.CorrectiveDate := fieldbyname('Corrective_Date').asdatetime;
      aNonConform.PreventativeDate := fieldbyname('Preventative_Date').asdatetime;

      aNonConform.Status := fieldbyname('Non_Conform_Status').asinteger;
      OrdInx := PurchaseOrder.OrderLines.IndexFromLineNo(aNonConform.Line);
      PurchaseOrder.OrderLines[OrdInx].NonConformDocs.Add(aNonConform);
      next;
    end;
  end;
end;

function TPBPODM.GetNextJBNonConformNo: integer;
begin
  LockCompanyRecord;
  try
    try
      with qryGetLastNC do
      begin
        Close;
        Open;
        Result := FieldByName('Last_Non_Conform_Number').AsInteger + 1;
        Close;
      end;
      with qryUpdateLastNC do
      begin
        ParamByName('Last_Non_Conform_Number').Asinteger := Result;
        ExecSQL;
      end;
    except on E: Exception do
    begin
      Result := -1;
      Raise Exception.Create('Failed to get next Non Conformance number:' + #13 + E.Message);
    end;
    end;
  finally
    FreeCompanyRecord;
  end;
end;

procedure TPBPODM.LoadStockCodes(var PurchaseOrder: TPurchaseOrder);
var
  aStockCode: TStockCode;
  inx : integer;
begin
  {Load the extra charges}
  with PBPODM.GetStockCodesSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := PurchaseOrder.PONumber;
    Open;
    while not EOF do
    begin
      aStockCode := TStockCode.Create;
      with aStockCode do
      begin
        Line := FieldByName('Line').AsInteger;
        CodeNo := FieldByName('Stock_Code_No').AsInteger;
        FormReference := FieldByName('Form_Reference').Asinteger;
        FormReferenceID := FieldByName('Form_Reference_ID').Asstring;
        StockReference := FieldByName('Stock_Reference').Asstring;
        Description := FieldByName('Form_Reference_Descr').Asstring;
        QtyOrdered := FieldByName('Quantity_Ordered').AsFloat;
        if (PurchaseOrder.FuncMode = poCopy) or
           (PurchaseOrder.FuncMode = poRepeat) then
          QtyDelivered := 0
        else
          QtyDelivered := FieldByName('Quantity_Delivered').AsFloat;
      end;
      inx := PurchaseOrder.OrderLines.IndexFromLineNo(aStockCode.Line);
      PurchaseOrder.OrderLines[inx].StockCodes.Add(aStockCode);
      Next;
    end;
    Close;
  end;
end;

function TPBPODM.GetActiveSupplierContact(tempSupp, tempBranch,
  tempCode: integer): integer;
begin
  result := 0;
  with qryGetActiveSupplierContact do
    begin
      close;
      parambyname('Supplier').asinteger := tempSupp;
      parambyname('Branch_no').asinteger := tempBranch;
      parambyname('Contact_no').asinteger := tempCode;
      open;
      result := fieldbyname('Contact_no').asinteger;
    end;

end;

function TPBPODM.IsPartNumbered(tmpPart: string): boolean;
begin
  Result := true;
  with qryGetProduct do
    begin
      close;
      parambyname('Part').asString := tmpPart;
      open;
      if recordcount = 0 then
        exit;
      result := (fieldbyname('Numbered').asstring = 'Y');
    end;
end;

function TPBPODM.IsSupplierActive(TempSupp: integer): boolean;
begin
  with GetSupplierSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := TempSupp;
    Open;
    Result := (FieldByName('Acc_Active').AsString = 'Y');
    Close;
  end;
end;

function TPBPODM.IsSupplierContactActive(const iSupp, iBranch,
  iContact: integer): boolean;
begin
  with GetSuppContactSQL do
  begin
    Close;
    ParamByname('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := iBranch;
    ParamByName('Contact_No').AsInteger := iContact;
    Open;
    Result := (FieldByName('inactive').AsString <> 'Y');
    Close;
  end;

end;

function TPBPODM.ProofAccepted(TempCode: string): boolean;
begin
  result := false;
  with qryProofStatus do
    begin
      close;
      parambyname('Proof_Status').asstring := TempCode;
      open;
      result := (fieldbyname('Proof_Approved').asstring = 'Y')
    end;
end;

function TPBPODM.GetCustomerSubRep(tempCust, tempBranch: integer): integer;
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

end.


