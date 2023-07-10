(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  A datamodule to take care of the narrative_line table.  Declares the
  TNarrative object which auto-creates the datamodule.

VSS Info:
$Header: /PBL D5/PBNarrativeDM.pas 3     7/02/02 17:11 Davidn $
$History: PBNarrativeDM.pas $
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 7/02/02    Time: 17:11
 * Updated in $/PBL D5
 * Corrected Error,When PO Line narrative was removed the relevent lines
 * were deleted from the narrative_lines table but the narrative reference
 * number was still left in the PurchaseOrder_Lines table.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 31/01/:0   Time: 16:35
 * Updated in $/PBL D5
 * Add code to write a dummy first record if the database is empty (to
 * overcome problem with NULL values).
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 31/01/:0   Time: 13:10
 * Created in $/PBL D5
 * New TNarrative object to centralise access to the Narrative_Line table
 * and improve allocation of next key value.

*******************************************************************************)
unit PBNarrativeDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmNarrative = class(TDataModule)
    qryReserveSlot: TQuery;
    qryGetReservedSlot: TQuery;
    qryDelete: TQuery;
    qryUpdateLine1: TQuery;
    qryAddLine: TQuery;
    qryReadNarrative: TQuery;
    qryZero: TQuery;
  end;

  TNarrative   = class
  private
    dmNarrative: TdmNarrative;
    FDbKey: integer;
    FData: string;
    FUpdated: Boolean;
    procedure AddZero;
    procedure DeleteZero;
    function  ReserveASlot : integer;
    procedure SetDbKey(const Value: integer);
    procedure SetData(const Value: string);
    procedure SetUpdated(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Delete;
    procedure LoadFromDB;
    procedure SaveToDB;
    property DbKey : integer read FDbKey write SetDbKey;
    property Data : string read FData write SetData;
    property Updated : Boolean read FUpdated write SetUpdated;
  end;

implementation
uses
  ActiveX, ComObj;

const
  Data_Lump_Length         = 100;
  Max_Copy_Length          = 9999;

{$R *.DFM}

{ TNarrative }

constructor TNarrative.Create;
begin
  dmNarrative := TdmNarrative.Create(nil);
end;

procedure TNarrative.Delete;
begin
  with dmNarrative.qryDelete do
  begin
    ParamByName('Narrative').AsInteger := DbKey;
    ExecSQL;
  end;
end;

destructor TNarrative.Destroy;
begin
  dmNarrative.Free;
  inherited;
end;

procedure TNarrative.LoadFromDB;
var
  sTemp : string;
begin
  with dmNarrative.qryReadNarrative do
  begin
    Close;
    ParamByName('Narrative').AsInteger := DbKey;
    Open;
    sTemp := '';
    if FieldByName('Narrative_Line_Updated').AsString <> '' then
      Updated := FieldByName('Narrative_Line_Updated').AsString[1] = 'Y';
    while not EOF do
    begin
      sTemp := sTemp + FieldByName('Narrative_Text').AsString;
      if Length(FieldByName('Narrative_Text').AsString) < Data_Lump_Length then
        sTemp := sTemp + ' ';
      Next;
    end;
    Close;
    Self.Data := sTemp;
  end;
end;

function TNarrative.ReserveASlot: integer;
var
  aGuid : TGuid;
begin
  { Use clever query to create a slot in the narrative_line
    table then read it back to find out the number }
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with dmNarrative.qryReserveSlot do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
  finally
    DeleteZero;
  end;
  with dmNarrative.qryGetReservedSlot do
  begin
    ParamByName('GUID').AsString := GuidToString(aGuid);
    Open;
    Result := FieldByName('Narrative').AsInteger;
    Close;
  end;
end;

procedure TNarrative.SaveToDB;
var
  i : integer;
  lump : string;
  upChar : char;
begin
  { Narrative Data is stored in lumps of 100 characters }
  if DbKey <> 0 then
    Delete;
  if Data = '' then
  begin
    DbKey := 0;
  end
  else
  begin
    if Updated then
      upChar := 'Y'
    else
      upChar := 'N';
    DbKey := ReserveASlot;
    with dmNarrative.qryUpdateLine1 do
    begin
      ParamByName('Narrative').AsInteger := DbKey;
      ParamByName('Text').AsString := Copy(Data, 1, Data_Lump_Length);
      ParamByname('Updated').AsString := upChar;
      ExecSQL;
    end;
    if Length(Data) > Data_Lump_Length then
    begin
      i := 2;
      lump := Copy(Data, Data_Lump_Length+1, Max_Copy_Length);
      while Length(Lump) > 0 do
      begin
        with dmNarrative.qryAddLine do
        begin
          ParamByName('Narrative').AsInteger := DbKey;
          ParamByName('Text').AsString := Copy(lump, 1, Data_Lump_Length);
          ParamByName('Line').AsInteger := i;
          ParamByname('Updated').AsString := upChar;
          ExecSQL;
          Inc(i);
          lump := Copy(lump, Data_Lump_Length+1, Max_Copy_Length);
        end;
      end;
    end;
  end;
end;

procedure TNarrative.SetDbKey(const Value: integer);
begin
  FDbKey := Value;
end;

procedure TNarrative.SetData(const Value: string);
begin
  FData := Trim(Value);
end;

procedure TNarrative.SetUpdated(const Value: Boolean);
begin
  FUpdated := Value;
end;

procedure TNarrative.AddZero;
begin
  { To overcome problems with empty tables and NULL values,
    we write a dummy record with key value zero which will
    be deleted at the end of reserving a slot. }
  with dmNarrative.qryZero do
  try
    SQL.Clear;
    SQL.Add('INSERT INTO Narrative_line(Narrative, Narrative_Line)');
    SQL.Add('VALUES(0,0)');
    ExecSQL;
  except
  end;
end;

procedure TNarrative.DeleteZero;
begin
  with dmNarrative.qryZero do
  try
    SQL.Clear;
    SQL.Add('DELETE FROM Narrative_line WHERE Narrative=0');
    ExecSQL;
  except
  end;
end;

{ TdmNarrative }

end.
