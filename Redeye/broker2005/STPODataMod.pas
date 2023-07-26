unit STPODataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPODM = class(TDataModule)
    qryInsPO: TFDQuery;
    qryUpdPO: TFDQuery;
    qryDelPO: TFDQuery;
    qryGetLastPO: TFDQuery;
    qryInsPOLine: TFDQuery;
    qryUpdPOLine: TFDQuery;
    qryGetPOLines: TFDQuery;
    qryDelPOLine: TFDQuery;
    qryDelPOLines: TFDQuery;
    qryGetLastPOLine: TFDQuery;
    qryGetPartDet: TFDQuery;
    qryGetPOTypeDesc: TFDQuery;
    qryGetSupplierInfo: TFDQuery;
    qryLastCompnyPO: TFDQuery;
    qryIncLastPONum: TFDQuery;
    qryIncPOFileNo: TFDQuery;
    qryGetPO: TFDQuery;
    qryGetPOLines2: TFDQuery;
    qryGetSuppOrdTypeDesc: TFDQuery;
    qryNewPOs: TFDQuery;
    qryGetSuppPartInfo: TFDQuery;
    qryDelExChgs: TFDQuery;
    qryInsExChg: TFDQuery;
    qryGetExChgs: TFDQuery;
    qryGetVatRate: TFDQuery;
    qryGetCoDtls: TFDQuery;
    qryCompany: TFDQuery;
    qryUpd: TFDQuery;
    qryUpPOStatus: TFDQuery;
    qryCheckPart: TFDQuery;
    qryAddPart: TFDQuery;
    qryAddLevels: TFDQuery;
    qryGetLastSOLine: TFDQuery;
    qryInsSOLine: TFDQuery;
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
