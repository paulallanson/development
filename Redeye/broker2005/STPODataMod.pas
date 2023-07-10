unit STPODataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TSTPODM = class(TDataModule)
    qryInsPO: TQuery;
    qryUpdPO: TQuery;
    qryDelPO: TQuery;
    qryGetLastPO: TQuery;
    qryInsPOLine: TQuery;
    qryUpdPOLine: TQuery;
    qryGetPOLines: TQuery;
    qryDelPOLine: TQuery;
    qryDelPOLines: TQuery;
    qryGetLastPOLine: TQuery;
    qryGetPartDet: TQuery;
    qryGetPOTypeDesc: TQuery;
    qryGetSupplierInfo: TQuery;
    qryLastCompnyPO: TQuery;
    qryIncLastPONum: TQuery;
    qryIncPOFileNo: TQuery;
    qryGetPO: TQuery;
    qryGetPOLines2: TQuery;
    qryGetSuppOrdTypeDesc: TQuery;
    qryNewPOs: TQuery;
    qryGetSuppPartInfo: TQuery;
    qryDelExChgs: TQuery;
    qryInsExChg: TQuery;
    qryGetExChgs: TQuery;
    qryGetVatRate: TQuery;
    qryGetCoDtls: TQuery;
    qryCompany: TQuery;
    qryUpd: TQuery;
    qryUpPOStatus: TQuery;
    qryCheckPart: TQuery;
    qryAddPart: TQuery;
    qryAddLevels: TQuery;
    qryGetLastSOLine: TQuery;
    qryInsSOLine: TQuery;
  private
    { Private declarations }
  public
    function GetNextPORef(bTempRecom, bTempStoreOrd: ByteBool): String;
    function GetPartPurchPackQuant(Part: String): integer;
    function GetPOTypeDesc(POType: integer): string;
    function GetSuppOrdTypeDesc(SuppOrderType, Supplier : integer): string;
    function GetSupplierInfo(Supplier: integer; var SIDN,
      CIDN: string): boolean;
    function DeleteExtraChargeRecords(PONum: integer): boolean;
    function GetVatRate(VatCode: integer): double;
    function GetPODefNom: string;
  end;

var
  STPODM: TSTPODM;

implementation

{$R *.DFM}

{ TSTPODM }

function TSTPODM.DeleteExtraChargeRecords(PONum: integer): boolean;
begin
  Result := True;
  with qryDelExChgs do
  begin
    ParamByName('Purch_Ord').AsInteger := PONum;
    ExecSQL;
  end;
end;

function TSTPODM.GetPartPurchPackQuant(Part: String): integer;
begin
  with qryGetPartDet do
  begin
    params[0].AsString := Part;
    try
      open;
      GetPartPurchPackQuant := FieldByName('Purch_Pack_Quantity').AsInteger;
      close;
    except
      GetPartPurchPackQuant := -1;
    end;
  end;
end;

function TSTPODM.GetPODefNom: string;
begin
  with qryGetCoDtls do
  begin
    close;
    open;
    Result := FieldByName('Purch_Nom_Def').AsString;
    close;
  end;
end;

function TSTPODM.GetPOTypeDesc(POType: integer): string;
begin
  with qryGetPOTypeDesc do
  begin
    params[0].AsInteger := POType;
    try
      open;
      Result := FieldByName('Purch_ord_type_ID').AsString;
      close;
    except
      Result := 'Failed';
    end;
  end;
end;

function TSTPODM.GetSupplierInfo(Supplier: integer; var SIDN, CIDN: string): boolean;
begin
  with qryGetSupplierInfo do
  begin
    Params[0].AsInteger := Supplier;
    Open;
    SIDN := FieldByName('EAN_Code').AsString;
    CIDN := FieldByName('Our_Account_Code').AsString;
    Result := True;
    Close;
  end;
end;

function TSTPODM.GetSuppOrdTypeDesc(SuppOrderType, Supplier: integer): string;
begin
  with qryGetSuppOrdTypeDesc do
  begin
    params[0].AsInteger := Supplier;
    params[1].AsInteger := SuppOrderType;
    try
      open;
      Result := FieldByName('Supp_ord_type_ID').AsString;
      close;
    except
      Result := 'Failed';
    end;
  end;
end;

function TSTPODM.GetVatRate(VatCode: integer): double;
begin
  with qryGetVatRate do
  begin
    close;
    ParamByName('Vat_Code').AsInteger := VatCode;
    Open;
    Result := FieldByName('Vat_Rate').AsFloat;
    close;
  end;
end;

function TSTPODM.GetNextPORef(bTempRecom, bTempStoreOrd: ByteBool): String;
var
  sTempField: String;
  iTempRef: Integer ;
begin
  if bTempRecom then
    if bTempStoreOrd then
      sTempField := 'Last_Rec_Store_Ord_No'
    else
      sTempField := 'Last_Rec_PO_Number'
  else
    if bTempStoreOrd then
      sTempField := 'Last_Store_Ord_No'
    else
      sTempField := 'Last_PO_Number'
  {Get the next PO Reference no. If flag is TRUE, use next RECOMMENDED ref} ;
  With qryCompany do
     begin
     Close ;
     Open ;
     First ;
     iTempRef := FieldByName(sTempField).AsInteger + 1 ;
     end;

  With qryUpd do
     begin
     Close ;
     SQL.Clear ;
     SQL.Add('Update Company') ;
     SQL.Add('Set ' + sTempField + ' = ' + IntToStr(iTempRef)) ;
     ExecSQL ;
     end;
  Result := intToStr(iTempRef) ;
end;

end.
