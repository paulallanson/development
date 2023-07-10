(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  A Data Module to handle the IntSel table.

VSS Info:
$Header: /PBL D5/PBIntSelDM.pas 4     2/05/:1 12:52 Paul $
$History: PBIntSelDM.pas $
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 2/05/:1    Time: 12:52
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 23/02/:0   Time: 13:41
 * Updated in $/PBL D5
 * Speed up Delivery Note printing by overriding the CR Record Selection
 * criteria at runtime.  Fix bug where label printing wasn't writing
 * required number of Int_Sel records.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 16/02/:0   Time: 17:20
 * Updated in $/PBL D5
 * Complete Delete procedure and add new AddWithKey method.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 9/02/:0    Time: 11:39
 * Created in $/PBL D5
 * First check in

*******************************************************************************)
unit PBIntSelDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmIntSel = class(TDataModule)
    GetLastTempIDSQL: TQuery;
    AddTempIDSQL: TQuery;
    DelTempIDSQL: TQuery;
    UpdTempIDSQL: TQuery;
    qryZero: TQuery;
    AddWithKeySQL: TQuery;
    AddWithKey5SQL: TQuery;
  private
    procedure AddZero;
    procedure DeleteZero;
  public
    function AddRecord(const Sel1, Sel2, Sel3, Sel4 : integer;
      const aTag, Text100 : string) : integer;
    procedure DeleteRecord(const SelCode : integer);
    function GetNextDbKey : integer;
    procedure AddWithKey(const Key: integer; Sel1, Sel2, Sel3, Sel4 : real;
      const aTag, Text100 : string);
    procedure AddWithKey5(const Key: integer; Sel1, Sel2, Sel3, Sel4,
      Sel5: real; const aTag, Text100: string);
  end;

var
  dmIntSel: TdmIntSel;

implementation
uses
  ComObj, ActiveX;

{$R *.DFM}

{ TdmIntSel }

function TdmIntSel.AddRecord(const Sel1, Sel2, Sel3, Sel4: integer;
  const aTag, Text100: string): integer;
begin
  Result := GetNextDbKey;
  with UpdTempIDSQL do
  begin
    ParamByName('Int_Sel_Code').AsInteger := Result;
    ParamByName('Sel1').AsInteger := Sel1;
    ParamByName('Sel2').AsInteger := Sel2;
    ParamByName('Sel3').AsInteger := Sel3;
    ParamByName('Sel4').AsInteger := Sel4;
    ParamByName('Tag').AsString := aTag;
    ParamByName('Text100').AsString := Text100;
    ExecSQL;
  end;
end;

procedure TdmIntSel.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Int_Sel(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4) ' +
            'VALUES(0,0,0,0,0)');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TdmIntSel.DeleteRecord(const SelCode: integer);
begin
  with DelTempIDSQL do
  begin
    ParamByName('Int_Sel_Code').AsInteger := SelCode;
    ExecSQL;
  end;
end;

procedure TdmIntSel.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Int_Sel Where Int_Sel_Code=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TdmIntSel.GetNextDbKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddTempIDSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastTempIDSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Int_Sel_Code').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TdmIntSel.AddWithKey(const Key: integer; Sel1, Sel2, Sel3,
  Sel4: real; const aTag, Text100: string);
begin
  with AddWithKeySQL do
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

procedure TdmIntSel.AddWithKey5(const Key: integer; Sel1, Sel2, Sel3,
  Sel4, Sel5: real; const aTag, Text100: string);
begin
  with AddWithKey5SQL do
  begin
    ParamByName('Key').AsInteger := Key;
    ParamByName('Sel1').Asfloat := Sel1;
    ParamByName('Sel2').Asfloat := Sel2;
    ParamByName('Sel3').Asfloat := Sel3;
    ParamByName('Sel4').Asfloat := Sel4;
    ParamByName('Sel5').Asfloat := Sel5;
    ParamByName('Tag').AsString := aTag;
    ParamByName('Text100').AsString := Text100;
    ExecSQL;
  end;
end;

end.
