unit STPartSuppDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPartSDM = class(TDataModule)
    PartSuppSQL: TFDQuery;
    PartNoSuppSQL: TFDQuery;
    PartWithSuppSQL: TFDQuery;
    qryInsertPart: TFDQuery;
    qryInsertPartSupp: TFDQuery;
    qryPartDtls: TFDQuery;
    dtsrcImportQueries: TDataSource;
    qryGetImpFieldDefs: TFDQuery;
    qryUpdatePart: TFDQuery;
    qryDeletePart: TFDQuery;
    qryDeletePartSupplier: TFDQuery;
    qryGetSuppDtls: TFDQuery;
    qryUpdatePartPurchPrice: TFDQuery;
    qryDoesPartExist: TFDQuery;
    qryUpdPartSuppDisc: TFDQuery;
    qryFindPartGroup: TFDQuery;
    qryNewPartGroup: TFDQuery;
    qryGetHighestPartGroup: TFDQuery;
    qrySelNoOfKFieldProdGrps: TFDQuery;
    qryInsertFormRef: TFDQuery;
    qryGetUOM: TFDQuery;
    qryAddUOM: TFDQuery;
    qryLastUOM: TFDQuery;
    qryLastFormRef: TFDQuery;
    qryUpdateFormRef: TFDQuery;
    qryInsertStkLevels: TFDQuery;
    qryGetPartStore: TFDQuery;
    qryLastStoreStock: TFDQuery;
    qryUpdateStkLevels: TFDQuery;
    qryGetCustWithAccCode: TFDQuery;
    qryGetContract: TFDQuery;
    qryAddCustDisc: TFDQuery;
    qryDelCustDisc: TFDQuery;
    qryAddPartAlloc: TFDQuery;
    qryGetStoreStock: TFDQuery;
    qryGetPartGroup: TFDQuery;
    qryDelCustStockDisc: TFDQuery;
    qryCheckPartSuppDisc: TFDQuery;
    qryGetPriceUnit: TFDQuery;
    qryGetVatCode: TFDQuery;
  private
    function GetStoreType(TempCode: integer): integer;
    function GetLotsInUse(TempCode: integer): boolean;
    { Private declarations }
  public
    { Public declarations }
    function GetData(iSelType: integer; ProdFrom, ProdTo: string; PreferenceFrom,
                    PreferenceTo: integer): integer;
    function GetPriceUnitID(PUFactor: integer): integer;
    function GetVatCode(tempDescription: string): integer;
    function FindUOM(TempUOM: string): integer;
    function FindPartGroup(PartGroupShortDesc: string): integer;
    function AddPartGroup(NewPartGroup: integer; PartGroupShortDesc, PartGroupLongDesc: string): integer;
    function NewPartGroup(PartGroupShortDesc, PartGroupLongDesc: string): integer;
    function NewUOM(TempUOM: string): integer;
    function UpdatePart(Part, Part_Description, Prod_Status, Discount_this_Part: string;
                      Supplier_Code, Vat_Code, Purch_Pack_Quantity, Part_Group : integer;
                      Part_Cost_List, Part_Purchase_Price : Double): boolean;
    function InsertPart(Part, Part_Description, Prod_Status, Discount_this_Part: string;
                      Supplier_Code, Vat_Code, Purch_Pack_Quantity, Part_Group : integer;
                      Part_Cost_List, Part_Purchase_Price : Double): boolean;
    function InsertCustPart(
                      Part, Part_Description, Prod_Status, Discount_this_Part, FormRef, Purchase_order, bin, Bin_Ref, Paid_Stock: string;
                      Delivery_Date: TDateTime;
                      Customer_Code, Vat_Code, Purch_Pack_Quantity, UOM_Code, Min_Stock, Warehouse, Stock_Bal, Age, Reorder_Level, Price_Unit: integer;
                      Part_Cost_List, Part_Purchase_Price: Double;
                      Import_Stock: boolean): boolean;
    function UpdateCustPart(
                      Part, Part_Description, Prod_Status, Discount_this_Part, FormRef, Bin, Bin_Ref, Paid_Stock: string;
                      Delivery_Date: TDateTime;
                      Customer_Code, Vat_Code, Purch_Pack_Quantity, UOM_Code, Min_Stock, Warehouse, Stock_Bal, Age: integer;
                      Part_Cost_List, Part_Purchase_Price: Double;
                      Import_Stock: boolean): boolean;
    function NoOfKFieldProdGroups: integer;
  end;

var
  STPartSDM: TSTPartSDM;

implementation

uses STStockDM, pbDatabase;

{$R *.DFM}

function TSTPartSDM.FindPartGroup(PartGroupShortDesc: string): integer;
begin
  with qryFindPartGroup do
  begin
    close;
    ParamByName('part_group_descr_short').AsString := PartGroupShortDesc;
    open;
    if recordcount < 1 then
      Result := -1
    else
      Result := FieldByName('Part_Group').AsInteger;
    close;
  end;
end;

function TSTPartSDM.GetData(iSelType: integer; ProdFrom, ProdTo: string; PreferenceFrom, PreferenceTo: integer): integer;
begin
  if iSelType = 0 then
    begin
      PartSuppSQl.SQl := PartNoSuppSQL.SQL;
      with PartSuppSQl do
        begin
          close;
          parambyname('Part_From').asstring := ProdFrom;
          parambyname('Part_To').asstring := ProdTo;
          open;
        end
    end
  else
    begin
      PartSuppSQl.SQl := PartWithSuppSQL.SQL;
      with PartSuppSQl do
        begin
          close;
          parambyname('Part_From').asstring := ProdFrom;
          parambyname('Part_To').asstring := ProdTo;
          parambyname('Preference_From').asinteger := PreferenceFrom;
          parambyname('Preference_To').asinteger := PreferenceTo;
          open;
        end;
    end;

  Result := PartSuppSQl.recordcount;
end;

function TSTPartSDM.InsertPart(Part, Part_Description, Prod_Status, Discount_this_Part: string;
  Supplier_Code, Vat_Code, Purch_Pack_Quantity, Part_Group: integer;
  Part_Cost_List, Part_Purchase_Price: Double): boolean;
var
  iProductID: integer;
begin
  with qryInsertPart do
  begin
    paramByName('Part').AsString := Part;
    paramByName('Part_Description').AsString := Part_Description;
    paramByName('Part_Updated').AsString := '';
    paramByName('Part_Cost_List').AsCurrency := Part_Cost_List;
    paramByName('Part_Cost_Cat').AsCurrency := Part_Cost_List;
    paramByName('Vat_Code').asInteger := Vat_Code;
    paramByName('Part_group').AsInteger := Part_Group;
    paramByName('Purch_Pack_Quantity').AsInteger := Purch_Pack_Quantity;
    paramByName('Sell_Pack_Quantity').AsInteger := Purch_Pack_Quantity;
    paramByName('Part_Purchase_Price').AsCurrency := Part_Purchase_Price;
    paramByName('Part_Mark_Up_List').AsCurrency := 0.00;
    paramByName('Part_Mark_Up_Cat').AsCurrency := 0.00;
    paramByName('Part_Last_Move_Date').clear;
    paramByName('Last_Store_Lot').AsString := '';
    if (Prod_Status = 'D') or (Prod_Status = 'M') then
      paramByName('Not_In_Use').AsString := 'Y'
    else
      paramByName('Not_In_Use').AsString := 'N';

    paramByName('Track_Serial_No').AsString := 'N';
    paramByName('Auto_Update').AsString := 'N';
    parambyName('Product_Class').asstring := 'NSTK';
    parambyName('Customer').clear;
    parambyName('Branch_no').clear;
    parambyName('unit_of_Measure').clear;
    parambyname('Price_Unit').clear;
    iProductID := dmBroker.GetNextProductID;
    parambyname('Product_ID').asinteger := iProductID;
  end; //end with

  with qryInsertPartSupp do
  begin
    paramByName('Supplier').asInteger := Supplier_Code;
    paramByName('Branch_No').asInteger := 0;
    paramByName('Part').asString := Part;
    paramByName('Supplier_Preference_Order').asInteger := 0;
    paramByName('Supplier_Part_Code').asString := Part;
    paramByName('Discount_this_Part').AsString := Discount_this_Part;
  end;

  try
    qryInsertPart.ExecSQL;
    qryInsertPartSupp.ExecSQL;
    InsertPart := True;
  except
    qryDeletePartSupplier.Params[0].AsInteger := Supplier_Code;
    qryDeletePartSupplier.Params[1].AsString := Part;
    qryDeletePartSupplier.ExecSQL;
    qryDeletePart.Params[0].AsString := Part;
    qryDeletePart.ExecSQL;
    InsertPart := False;
  end; //end try
end;

function TSTPartSDM.InsertCustPart(
  Part, Part_Description, Prod_Status, Discount_this_Part, FormRef, Purchase_order, bin, Bin_Ref, Paid_Stock: string;
  Delivery_Date: TDateTime;
  Customer_Code, Vat_Code, Purch_Pack_Quantity, UOM_Code, Min_Stock, Warehouse, Stock_Bal, Age, Reorder_Level, Price_Unit: integer;
  Part_Cost_List, Part_Purchase_Price: Double; Import_Stock: boolean): boolean;
var
  sDescription, sTempLot, sTempType, sTempRef: string;
  sTempDate: TdateTime;
  LastFormRef: integer;
  iProductID: integer;
begin
// insert the part
  with qryInsertPart do
  begin
    paramByName('Part').AsString := Part;
    paramByName('Part_Description').AsString := Part_Description;
    paramByName('Part_Updated').AsString := '';
    paramByName('Part_Cost_List').AsCurrency := Part_Cost_List;
    paramByName('Part_Cost_Cat').AsCurrency := Part_Cost_List;
    paramByName('Vat_Code').asInteger := GetVatCode(inttostr(Vat_Code));
    paramByName('Part_group').clear;
    paramByName('Purch_Pack_Quantity').AsInteger := Purch_Pack_Quantity;
    paramByName('Sell_Pack_Quantity').AsInteger := Purch_Pack_Quantity;
    paramByName('Part_Purchase_Price').AsCurrency := Part_Purchase_Price;
    paramByName('Part_Mark_Up_List').AsCurrency := 0.00;
    paramByName('Part_Mark_Up_Cat').AsCurrency := 0.00;
    paramByName('Part_Last_Move_Date').clear;
    paramByName('Last_Store_Lot').AsString := 'LOT00000';
    paramByName('Not_In_Use').AsString := 'N';
    paramByName('Track_Serial_No').AsString := 'N';
    paramByName('Auto_Update').AsString := 'N';
    parambyName('Product_Class').asstring := 'STK';

    if Customer_Code = 0 then
      begin
        parambyName('Customer').clear;
        parambyName('Branch_no').clear;
      end
    else
      begin
        parambyName('Customer').asinteger := Customer_Code;
        parambyName('Branch_no').asinteger := 0;
      end;

    parambyName('Unit_of_Measure').asinteger := UOM_Code;
    parambyname('Price_unit').AsInteger := GetPriceUnitID(Price_Unit);
    iProductID := dmBroker.GetNextProductID;
    parambyname('Product_ID').asinteger := iProductID;
  end; //end with

// find last form reference record
  if Customer_Code <> 0 then
    begin
      with qryLastFormRef do
        begin
          close;
          open;
          LastFormRef := fieldbyname('Last_Form_Ref').asinteger;
        end;  //end with

      // insert the form reference details
        with qryInsertFormRef do
        begin
          close;
          paramByName('Form_Reference').Asinteger := LastFormRef+1;
          parambyName('Customer').asinteger := Customer_Code;
          parambyName('Branch_no').asinteger := 0;
          paramByName('Form_Reference_ID').AsString := FormRef;
          paramByName('Form_Reference_Descr').AsString := Part_Description;
          paramByName('Stocked_Item').AsString := 'Y';
          paramByName('Reorder_Level').Asinteger := Reorder_Level;
          paramByName('Customer_reference').Asstring := FormRef;
          paramByName('Stock_Reference').Asstring := Part;

        end;  //end with
    end;

// insert the part/store stock levels
  with qryInsertStkLevels do
    begin
      close;
      parambyname('Part').asstring := Part;
      parambyname('Part_Store_type').asinteger := GetStoreType(Warehouse);
      parambyname('Minimum_Stock').asinteger := Min_Stock;
      parambyname('Maximum_Stock').asinteger := Min_Stock;
      parambyname('Reorder_Level').asinteger := Reorder_Level;
      parambyname('Purchase_or_Store').asstring := 'P';
      parambyname('Replenish_Store').clear;
    end;  // end with

  try
    qryInsertPart.ExecSQL;
    if Customer_Code <> 0 then
      qryInsertFormRef.ExecSQL;
    qryInsertStkLevels.ExecSQL;
    InsertCustPart := True;
  except
    InsertCustPart := False;
    exit;
  end; //end try

  if not import_stock then exit;

(*  sTempRef := 'Malago: '+Bin_Ref;
  sDescription := 'Malago: '+Bin_Ref;
*)

  if Bin_Ref <> '' then
    Bin := Bin_Ref;

  sTempRef := 'Imported Stock: ' + Bin_Ref;
  sDescription := 'Imported Stock: ' + Bin_Ref;

  sTempLot := '';
//  sTempDate := date-Age;
  if Delivery_Date > 0 then
    sTempDate := Delivery_Date-Age
  else
    sTempDate := date-Age;
    
  sTempType := 'O';

// add the stock details
  try
    if Stock_Bal <> 0 then
      begin
        if GetLotsInUse(Warehouse) then
          sTempLot := STStockDataMod.GetNextLot(Part);

        STStockDataMod.AddStoreStock(Part, Warehouse, Bin, sTempLot,
          sTempType, sTempRef, sTempDate, sTempDate, Stock_Bal, 0, Purch_Pack_Quantity,
          ((Stock_Bal/Purch_Pack_Quantity)*Part_Purchase_Price), sDescription, Paid_Stock, 1,
          StrToFloatDef(Purchase_Order, 0, FormatSettings), 0, 'N');

      end;
    InsertCustPart := True;
  except
    InsertCustPart := False;
  end;
end;

function TSTPartSDM.NewPartGroup(PartGroupShortDesc,
  PartGroupLongDesc: string): integer;
var
  NextPartGroup: integer;
begin
  with qryGetHighestPartGroup do
  begin
    close;
    open;
    NextPartGroup := FieldByName('max_Part_Group').AsInteger + 1;
    close;
  end;

  with qryNewPartGroup do
  begin
    close;
    paramByName('Part_Group').AsInteger := NextPartGroup;
    paramByName('part_group_descr_short').AsString := PartGroupShortDesc;
    paramByName('part_group_descr').AsString := PartGroupLongDesc;
    ExecSQL;
  end;

  Result := NextPartGroup;
end;

function TSTPartSDM.AddPartGroup(NewPartGroup: integer; PartGroupShortDesc,
  PartGroupLongDesc: string): integer;
begin
  with qryNewPartGroup do
  begin
    close;
    paramByName('Part_Group').AsInteger := NewPartGroup;
    paramByName('part_group_descr_short').AsString := PartGroupShortDesc;
    paramByName('part_group_descr').AsString := PartGroupLongDesc;
    ExecSQL;
  end;

  Result := NewPartGroup;
end;

function TSTPartSDM.GetStoreType(TempCode: integer): integer;
begin
  with qryGetPartStore do
    begin
      close;
      parambyname('Part_Store').asinteger := TempCode;
      open;
      result := fieldbyname('Part_Store_Type').asinteger;
    end;
end;

function TSTPartSDM.GetLotsInUse(TempCode: integer): boolean;
begin
  with qryGetPartStore do
    begin
      close;
      parambyname('Part_Store').asinteger := TempCode;
      open;
      result := (fieldbyname('Stock_lots_in_Use').asstring = 'Y');
    end;
end;

function TSTPartSDM.NoOfKFieldProdGroups: integer;
begin
  with self.qrySelNoOfKFieldProdGrps do
  begin
    active := false;
    active := true;

    result := FieldByName('NoOfGroups').asInteger;

    active := false;
  end;
end;

function TSTPartSDM.UpdatePart(Part, Part_Description, Prod_Status, Discount_this_Part: string;
  Supplier_Code, Vat_Code, Purch_Pack_Quantity, Part_Group: integer;
  Part_Cost_List, Part_Purchase_Price: Double): boolean;
var
  bSuppExists: boolean;
begin
  with qryUpdatePart do
  begin
    paramByName('Part_Description').AsString := Part_Description;
    paramByName('Part_Cost_List').AsFloat := Part_Cost_List;
    paramByName('Part_Cost_Cat').AsFloat := Part_Cost_List;
    paramByName('Vat_Code').AsInteger := Vat_Code;
    if Part_Group = 0 then
      paramByName('Part_Group').clear
    else
      paramByName('Part_Group').AsInteger := Part_Group;
    paramByName('Purch_Pack_Quantity').AsInteger := Purch_Pack_Quantity;
    paramByName('Part_Purchase_Price').AsFloat := Part_Purchase_Price;
    paramByName('Not_In_Use').AsString := Prod_Status;
    paramByName('Sell_Pack_Quantity').AsInteger := Purch_Pack_Quantity;
    paramByName('Part').AsString := Part;
    parambyName('Customer').clear;
    parambyName('Branch_no').clear;
    parambyName('unit_of_Measure').clear;
    ExecSQL;
  end;

  if Supplier_Code = 0 then
    begin
      Result := True;
      exit;
    end;

  with qryCheckPartSuppDisc do
    begin
      close;
      paramByName('Supplier').asInteger := Supplier_Code;
      paramByName('Branch_No').asInteger := 0;
      paramByName('Part').asString := Part;
      open;
      bSuppExists := (recordcount > 0);
    end;

  if bSuppExists then
    begin
      with qryUpdPartSuppDisc do
      begin
        paramByName('Discount_this_Part').AsString := Discount_this_Part;
        paramByName('Supplier').asInteger := Supplier_Code;
        paramByName('Branch_No').asInteger := 0;
        paramByName('Part').asString := Part;
      end;
    end
  else
    begin
      with qryInsertPartSupp do
      begin
        paramByName('Supplier').asInteger := Supplier_Code;
        paramByName('Branch_No').asInteger := 0;
        paramByName('Part').asString := Part;
        paramByName('Supplier_Preference_Order').asInteger := 0;
        paramByName('Supplier_Part_Code').asString := Part;
        paramByName('Discount_this_Part').AsString := Discount_this_Part;
      end;
    end;
    
  try
    if bSuppExists then
      qryUpdPartSuppDisc.ExecSQL
    else
      qryInsertPartSupp.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TSTPartSDM.UpdateCustPart(Part, Part_Description, Prod_Status, Discount_this_Part, FormRef, Bin, Bin_Ref, Paid_Stock: string;
                      Delivery_Date: TDateTime;
                      Customer_Code, Vat_Code, Purch_Pack_Quantity, UOM_Code, Min_Stock, Warehouse, Stock_Bal, Age: integer;
                      Part_Cost_List, Part_Purchase_Price: Double;
                      Import_Stock: boolean): boolean;
var
  sDescription, sTempLot, sTempType, sTempRef: string;
  sTempDate: TdateTime;
  iStoreStock: integer;
begin
  if not import_stock then exit;

//  sTempRef := 'Malago: '+Bin_Ref;
  sTempRef := 'Imported Stock: ' + Bin_Ref;
//  sDescription := 'Malago: '+ Bin_Ref;
  sDescription := 'Imported Stock: ' + Bin_Ref;
  sTempLot := '';

  if Delivery_Date > 0 then
    sTempDate := Delivery_Date
  else
    sTempDate := date-Age;

  sTempType := 'O';

  if Bin_Ref <> '' then
    Bin := Bin_Ref;

// add the stock details
  try
    if Stock_Bal <> 0 then
      begin
        if GetLotsInUse(Warehouse) then
          sTempLot := STStockDataMod.GetNextLot(Part);

        STStockDataMod.AddStoreStock(Part, Warehouse, Bin, sTempLot,
          sTempType, sTempRef, sTempDate, sTempDate, Stock_Bal, 0, Purch_Pack_Quantity, ((Stock_Bal/Purch_Pack_Quantity)*Part_Purchase_Price), sDescription, Paid_Stock, 1, 0, 0, 'N');

        {Get the latest Store Stock record}
        with qryGetStoreStock do
          begin
            close;
            parambyname('Part').asstring := Part;
            parambyname('Part_Store').asinteger := Warehouse;
            parambyname('Part_Bin').asstring := Bin;
            parambyname('Part_Store_Lot').asstring := sTempLot;
            parambyname('Store_Quantity').asinteger := Stock_Bal;
            parambyname('Date_Received').asdatetime := sTempDate;
            open;

            iStoreStock := fieldbyname('Store_Stock').asinteger;
          end;

(*        {insert Part_Allocation record}
        with qryAddPartAlloc do
          begin
            close;
            parambyname('Store_Stock').AsInteger := iStoreStock;
            parambyname('Part').asstring := Part;
            parambyname('Quantity_Allocated').Asinteger := Stock_Bal;
            execsql;
          end;
*)
      end;
    UpdateCustPart := True;
  except
    UpdateCustPart := False;
  end;
end;

function TSTPartSDM.FindUOM(TempUOM: string): integer;
begin
  with qryGetUOM do
    begin
      close;
      parambyname('UOM_Description').asstring := trim(TempUOM);
      open;
      Result := fieldbyname('Unit_of_measure').asinteger;
    end;
end;

function TSTPartSDM.NewUOM(TempUOM: string): integer;
var
  LastUOM: integer;
begin
// find last UOM
  with qryLastUOM do
    begin
      close;
      open;
      LastUOM := fieldbyname('Last_UOM').asinteger;
    end;

// Add the details
  with qryAddUOM do
    begin
      close;
      parambyname('unit_of_Measure').asinteger := LastUOM+1;
      parambyname('UOM_Description').asstring := trim(TempUOM);
      execsql;
    end;
  Result := LastUOM+1;
end;

function TSTPartSDM.GetPriceUnitID(PUFactor: integer): integer;
begin
  with qryGetPriceUnit do
    begin
      close;
      parambyname('Price_Unit_Factor').asinteger := PUFactor;
      open;
      result := fieldbyname('Price_Unit').asinteger;
    end;
end;

function TSTPartSDM.GetVatCode(tempDescription: string): integer;
begin
  result := 0;
  with qryGetVatCode do
    begin
      close;
      parambyname('Vat_Ref').asstring := tempDescription;
      open;

      if recordcount = 0 then
        result := -1
      else
        result := fieldbyname('Vat_Code').asinteger;
    end;
end;

end.
