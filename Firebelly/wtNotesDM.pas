unit wtNotesDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlNotes = class(TDataModule)
    qryReserveslot: TFDQuery;
    qryGetReservedSlot: TFDQuery;
    qryReadNotes: TFDQuery;
    qryZero: TFDQuery;
    qryDelete: TFDQuery;
    qryUpdateLine1: TFDQuery;
    qryAddLine: TFDQuery;
    qryGetNextSlot: TFDQuery;
    qryReserveNotesSlot: TFDQuery;
    qryGetReservedNotesSlot: TFDQuery;
  end;

  TNotes        = class
  private
    dtmdlNotes: TdtmdlNotes;
    FdbKey: integer;
    FData: string;
    FUpdated: boolean;
    procedure AddZero;
    procedure DeleteZero;
    function ReserveASlot: integer;
    function GetNextSlot: integer;
    procedure SetdbKey(const Value: integer);
    procedure SetData(const Value: string);
    procedure SetUpdated(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure delete;
    procedure LoadfromDB;
    procedure SavetoDB;
    property DBKey: integer read FDbKey write SetDbKey;
    property Data: string read FData write SetData;
    property Updated: Boolean read FUpdated write SetUpdated;
  end;

var
  dtmdlNotes: TdtmdlNotes;

implementation
uses
  ActiveX, ComObj;

const
  Data_Lump_Length         = 100;
  Max_Copy_Length          = 9999;

{$R *.DFM}

{ TNotes }

constructor TNotes.Create;
begin
  dtmdlNotes := TdtmdlNotes.Create(nil);
end;

procedure TNotes.Delete;
begin
  with dtmdlNotes.qryDelete do
  begin
    ParamByName('Notes_Code').AsInteger := DbKey;
    ExecSQL;
  end;
end;

destructor TNotes.Destroy;
begin
  dtmdlNotes.Free;
  inherited;
end;

procedure TNotes.LoadFromDB;
var
  sTemp : string;
begin
  with dtmdlNotes.qryReadNotes do
  begin
    Close;
    ParamByName('Notes_Code').AsInteger := DbKey;
    Open;
    sTemp := '';
    if FieldByName('Notes_Line_Updated').AsString <> '' then
      Updated := FieldByName('Notes_Line_Updated').AsString[1] = 'Y';
    while not EOF do
    begin
      sTemp := sTemp + FieldByName('Notes_Text').AsString;
      if Length(FieldByName('Notes_Text').AsString) < Data_Lump_Length then
        sTemp := sTemp + ' ';
      Next;
    end;
    Close;
    Self.Data := sTemp;
  end;
end;

function TNotes.ReserveASlot: integer;
var
  aGuid : TGuid;
begin
  { Use clever query to create a slot in the narrative_line
    table then read it back to find out the number }
  if CoCreateGuid(aGuid) <> S_OK then
    Raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with dtmdlNotes.qryReserveNotesSlot do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
  finally
    DeleteZero;
  end;
  with dtmdlNotes.qryGetReservedNotesSlot do
  begin
    ParamByName('GUID').AsString := GuidToString(aGuid);
    Open;
    Result := FieldByName('Notes_code').AsInteger;
    Close;
  end;
end;

function TNotes.GetNextSlot: integer;
begin
  with dtmdlNotes.qryGetNextSlot do
    begin
      close;
      open;
      Result := FieldByName('Last_Notes_code').AsInteger+1;
    end;

  with dtmdlNotes.qryReserveSlot do
    begin
      close;
      parambyname('Notes_code').asinteger := Result;
      execsql;
    end;
end;

procedure TNotes.SaveToDB;
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

//    DbKey := GetNextSlot;

    dtmdlNotes.qryUpdateLine1.ParamByName('Notes_code').AsInteger := DbKey;
    dtmdlNotes.qryUpdateLine1.ParamByName('Notes_Text').AsString := Copy(Data, 1, Data_Lump_Length);
    dtmdlNotes.qryUpdateLine1.ParamByname('Notes_Line_Updated').AsString := upChar;
    dtmdlNotes.qryUpdateLine1.ExecSQL;

    if Length(Data) > Data_Lump_Length then
    begin
      i := 2;
      lump := Copy(Data, Data_Lump_Length+1, Max_Copy_Length);
      while Length(Lump) > 0 do
      begin
        with dtmdlNotes.qryAddLine do
        begin
          ParamByName('Notes_Code').AsInteger := DbKey;
          ParamByName('Notes_Text').AsString := Copy(lump, 1, Data_Lump_Length);
          ParamByName('Notes_Line').AsInteger := i;
          ParamByname('Notes_Line_Updated').AsString := upChar;
          ExecSQL;
          Inc(i);
          lump := Copy(lump, Data_Lump_Length+1, Max_Copy_Length);
        end;
      end;
    end;
  end;
end;

procedure TNotes.SetDbKey(const Value: integer);
begin
  FDbKey := Value;
end;

procedure TNotes.SetData(const Value: string);
begin
  FData := Trim(Value);
end;

procedure TNotes.SetUpdated(const Value: Boolean);
begin
  FUpdated := Value;
end;

procedure TNotes.AddZero;
begin
  { To overcome problems with empty tables and NULL values,
    we write a dummy record with key value zero which will
    be deleted at the end of reserving a slot. }
  with dtmdlNotes.qryZero do
  try
    SQL.Clear;
    SQL.Add('INSERT INTO Notes(Notes_Code, Notes_Line)');
    SQL.Add('VALUES(0,0)');
    ExecSQL;
  except
  end;
end;

procedure TNotes.DeleteZero;
begin
  with dtmdlNotes.qryZero do
  try
    SQL.Clear;
    SQL.Add('DELETE FROM Notes WHERE Notes_Code=0');
    ExecSQL;
  except
  end;
end;

end.
