(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  A datamodule to clean up the clutter of the Maintain Group Details
  form which was unreadable.

VSS Info:
$Header: /PBL D5/PBGroupsDM.pas 5     26/07/:1 11:53 Paul $
$History: PBGroupsDM.pas $
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:53
 * Updated in $/PBL D5
 * Changed to incorporate maintenance or Enquiry and Purchase Order
 * reasons.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 13/10/00   Time: 12:08
 * Updated in $/PBL D5
 * Added the queries and procedures required for the maintenance of the
 * Contact levels table.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 15/02/:0   Time: 12:29
 * Updated in $/PBL D5
 * Added functionality to maintain Paper Colours, Weight, Brands and
 * Materials
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 3/02/:0    Time: 15:38
 * Updated in $/PBL D5
 * Add code to create/delete zero-keyed records so the GUID inserts work
 * on empty tables.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 3/02/:0    Time: 14:11
 * Created in $/PBL D5
 * First check-in.

*******************************************************************************)
unit PBGroupsDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmGroups = class(TDataModule)
    GetLastContTypeSQL: TQuery;
    GetLastCurrencySQL: TQuery;
    UpdPTCatSQL: TQuery;
    GetLastCustTypeSQL: TQuery;
    UpdCountrySQL: TQuery;
    GetLastPTCatSQL: TQuery;
    AddCustTypeSQL: TQuery;
    AddPTCatSQL: TQuery;
    GetLastCountrySQL: TQuery;
    AddCurrencySQL: TQuery;
    UpdContTypeSQL: TQuery;
    AddCountrySQL: TQuery;
    DelCustTypeSQL: TQuery;
    DelCountrySQL: TQuery;
    UpdCustTypeSQL: TQuery;
    UpdCurrencySQL: TQuery;
    DelIntrastatSQL: TQuery;
    UpdIntrastatSQL: TQuery;
    DelPTCatSQL: TQuery;
    AddIntrastatSQL: TQuery;
    DelCurrencySQL: TQuery;
    AddContTypeSQL: TQuery;
    GetLastIntrastatSQL: TQuery;
    DelContTypeSQL: TQuery;
    qryZero: TQuery;
    AddColourSQL: TQuery;
    UpdColourSQL: TQuery;
    DelColourSQL: TQuery;
    GetLastColourSQL: TQuery;
    AddWeightSQL: TQuery;
    UpdWeightSQL: TQuery;
    DelWeightSQL: TQuery;
    GetLastWeightSQL: TQuery;
    AddBrandSQL: TQuery;
    AddMaterialSQL: TQuery;
    UpdBrandSQL: TQuery;
    UpdMaterialSQL: TQuery;
    DelBrandSQL: TQuery;
    DelMaterialSQL: TQuery;
    GetLastBrandSQL: TQuery;
    GetLastMaterialSQL: TQuery;
    AddContLevelSQL: TQuery;
    UpdContLevelSQL: TQuery;
    DelContLevelSQL: TQuery;
    GetLastContLevelSQL: TQuery;
    AddEnqReasonSQL: TQuery;
    UpdEnqReasonSQL: TQuery;
    DelEnqReasonSQL: TQuery;
    GetLastEnqReasonSQL: TQuery;
    AddPOReasonSQL: TQuery;
    UpdPOReasonSQL: TQuery;
    DelPOReasonSQL: TQuery;
    GetLastPOReasonSQL: TQuery;
  private
    procedure AddZero(const tabName : string);
    procedure DelZero(const tabName : string);
    function GenericReserve(const tabName : string;
      AddQry, GetQry : TQuery) : integer;
  public
    function GetNextContactType : integer;
    function GetNextCountryId : integer;
    function GetNextCategory : integer;
    function GetNextCustType : integer;
    function GetNextEnqReason : integer;
    function GetNextPOReason : integer;
    function GetNextCurrency : integer;
    function GetNextIntrastat : integer;
    function GetNextColour : integer;
    function GetNextWeight : integer;
    function GetNextBrand : integer;
    function GetNextMaterial : integer;
    procedure SaveContactType(const Key : integer; const Data : string);
    procedure SaveCountryId(const Key : integer; const Data : string);
    procedure SaveCategory(const Key : integer; const Data : string; const CommRt : real);
    procedure SaveCustType(const Key : integer; const Data : string; Color, FontColor: integer);
    procedure SaveEnqReason(const Key : integer; const Data : string);
    procedure SavePOReason(const Key : integer; const Data : string);
    procedure SaveCurrency(const Key : integer; const Data : string);
    procedure SaveIntrastat(const Key : integer; const Data : string);
    procedure SaveColour(const Key : integer; const Data : string);
    procedure SaveWeight(const Key : integer; const Data : string);
    procedure SaveBrand(const Key : integer; const Data : string);
    procedure SaveMaterial(const Key : integer; const Data : string);
    procedure DeleteContactType(const Key : integer);
    procedure DeleteCountryId(const Key : integer);
    procedure DeleteCategory(const Key : integer);
    procedure DeleteCustType(const Key : integer);
    procedure DeleteEnqReason(const Key : integer);
    procedure DeletePOReason(const Key : integer);
    procedure DeleteCurrency(const Key : integer);
    procedure DeleteIntrastat(const Key : integer);
    procedure DeleteColour(const Key : integer);
    procedure DeleteWeight(const Key : integer);
    procedure DeleteBrand(const Key : integer);
    procedure DeleteMaterial(const Key : integer);
    procedure DeleteContactLevel(const Key: integer);
    function GetNextContactLevel: integer;
    procedure SaveContactLevel(const Key: integer; const Data: string);
  end;

var
  dmGroups: TdmGroups;

implementation
uses
  ComObj, ActiveX;

{$R *.DFM}

{ TdmGroups }

procedure TdmGroups.AddZero(const tabName: string);
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO ' + tabName + ' VALUES(0, ''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TdmGroups.DeleteCategory(const Key: integer);
begin
  with DelPTCatSQL do
  begin
    ParamByName('Category').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteContactType(const Key: integer);
begin
  with DelContTypeSQL do
  begin
    ParamByName('Contact_Type').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteCountryId(const Key: integer);
begin
  with DelCountrySQL do
  begin
    ParamByName('Country_Id').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteCurrency(const Key: integer);
begin
  with DelCurrencySQL do
  begin
    ParamByName('Currency_Code').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteCustType(const Key: integer);
begin
  with DelCustTypeSQL do
  begin
    ParamByName('Customer_Type').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteEnqReason(const Key: integer);
begin
  with DelEnqReasonSQL do
  begin
    ParamByName('Enq_Inactive_Reason').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeletePOReason(const Key: integer);
begin
  with DelPOReasonSQL do
  begin
    ParamByName('Inactive_Reason').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteIntrastat(const Key: integer);
begin
  with DelIntraStatSQL do
  begin
    ParamByName('Intrastat_Id').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteColour(const Key: integer);
begin
  with DelColourSQL do
  begin
    ParamByName('Paper_Colour').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteWeight(const Key: integer);
begin
  with DelWeightSQL do
  begin
    ParamByName('Paper_Weight').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteBrand(const Key: integer);
begin
  with DelBrandSQL do
  begin
    ParamByName('Paper_Brand').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteMaterial(const Key: integer);
begin
  with DelMaterialSQL do
  begin
    ParamByName('Paper_Material').AsInteger := Key;
    ExecSQL;
  end;
end;

procedure TdmGroups.DelZero(const tabName: string);
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM ' + tabName + ' WHERE ' + tabName + '=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TdmGroups.GenericReserve(const tabName : string;
  AddQry, GetQry : TQuery) : integer;
var
  aGuid : TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero(tabName);
  try
    with AddQry do
    begin
      Params[0].AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetQry do
    begin
      Close;
      Params[0].AsString := GuidToString(aGuid);
      Open;
      Result := Fields[0].AsInteger;
      Close;
    end;
  finally
    DelZero(tabName);
  end;
end;

function TdmGroups.GetNextCategory: integer;
begin
  Result := GenericReserve('Category', AddPTCatSQL, GetLastPTCatSQL);
end;

function TdmGroups.GetNextContactType: integer;
begin
  Result := GenericReserve('Contact_Type', AddContTypeSQL, GetLastContTypeSQL);
end;

function TdmGroups.GetNextCountryId: integer;
begin
  Result := GenericReserve('Country_Id', AddCountrySQL, GetLastCountrySQL);
end;

function TdmGroups.GetNextCurrency: integer;
begin
  Result := GenericReserve('Currency_Code', AddCurrencySQL, GetLastCurrencySQL);
end;

function TdmGroups.GetNextCustType: integer;
begin
  Result := GenericReserve('Customer_Type', AddCustTypeSQL, GetLastCustTypeSQL);
end;

function TdmGroups.GetNextEnqReason: integer;
begin
  Result := GenericReserve('Enq_Inactive_reason', AddEnqReasonSQL, GetLastEnqReasonSQL);
end;

function TdmGroups.GetNextPOReason: integer;
begin
  Result := GenericReserve('Inactive_Reason', AddPOReasonSQL, GetLastPOReasonSQL);
end;

function TdmGroups.GetNextIntrastat: integer;
begin
  Result := GenericReserve('Intrastat_Id', AddIntrastatSQL, GetLastIntrastatSQL);
end;

function TdmGroups.GetNextColour: integer;
begin
  Result := GenericReserve('Paper_Colour', AddColourSQL, GetLastColourSQL);
end;

function TdmGroups.GetNextWeight: integer;
begin
  Result := GenericReserve('Paper_Weight', AddWeightSQL, GetLastWeightSQL);
end;

function TdmGroups.GetNextBrand: integer;
begin
  Result := GenericReserve('Paper_Brand', AddBrandSQL, GetLastBrandSQL);
end;

function TdmGroups.GetNextMaterial: integer;
begin
  Result := GenericReserve('Paper_Material', AddMaterialSQL, GetLastMaterialSQL);
end;

procedure TdmGroups.SaveCategory(const Key: integer; const Data: string; const CommRt : Real);
begin
  with UpdPTCatSQL do
  begin
    ParamByName('Category').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ParamByName('Comm_Rt').Asfloat := CommRt;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveContactType(const Key: integer;
  const Data: string);
begin
  with UpdContTypeSQL do
  begin
    ParamByName('Contact_Type').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveCountryId(const Key: integer; const Data: string);
begin
  with UpdCountrySQL do
  begin
    ParamByName('Country_Id').AsInteger := Key;
    ParamByName('Country_Id_Descr').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveCurrency(const Key: integer; const Data: string);
begin
  with UpdCurrencySQL do
  begin
    ParamByName('Currency_Code').AsInteger := Key;
    ParamByName('Currency_Code_Descr').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveCustType(const Key: integer; const Data: string; Color, FontColor: integer);
begin
  with UpdCustTypeSQL do
  begin
    ParamByName('Customer_Type').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ParamByName('Color').Asinteger := Color;
    ParamByName('Font_Color').Asinteger := FontColor;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveEnqReason(const Key: integer; const Data: string);
begin
  with UpdEnqReasonSQL do
  begin
    ParamByName('Enq_Inactive_Reason').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SavePOReason(const Key: integer; const Data: string);
begin
  with UpdPOReasonSQL do
  begin
    ParamByName('Inactive_reason').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveIntrastat(const Key: integer; const Data: string);
begin
  with UpdIntrastatSQL do
  begin
    ParamByName('Intrastat_Id').AsInteger := Key;
    ParamByName('Intrastat_Id_Descr').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveColour(const Key: integer; const Data: string);
begin
  with UpdColourSQL do
  begin
    ParamByName('Paper_Colour').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveWeight(const Key: integer; const Data: string);
begin
  with UpdWeightSQL do
  begin
    ParamByName('Paper_Weight').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveBrand(const Key: integer; const Data: string);
begin
  with UpdBrandSQL do
  begin
    ParamByName('Paper_Brand').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.SaveMaterial(const Key: integer; const Data: string);
begin
  with UpdMaterialSQL do
  begin
    ParamByName('Paper_Material').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;
end;

procedure TdmGroups.DeleteContactLevel(const Key: integer);
begin
  with DelContLevelSQL do
  begin
    ParamByName('Contact_Level').AsInteger := Key;
    ExecSQL;
  end;
end;

function TdmGroups.GetNextContactLevel: integer;
begin
  Result := GenericReserve('Contact_Level', AddContLevelSQL, GetLastContLevelSQL);
end;

procedure TdmGroups.SaveContactLevel(const Key: integer;
  const Data: string);
begin
  with UpdContLevelSQL do
  begin
    ParamByName('Contact_Level').AsInteger := Key;
    ParamByName('Description').AsString := Data;
    ExecSQL;
  end;

end;

end.
