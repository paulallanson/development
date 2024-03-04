unit wtCommon;

interface

uses
  Classes, Forms;

  { If passed a date, wtDateStr will return a string;  if passed a
  string, it will return a date. }
function wtDateStr(const vIn: variant): variant;

implementation

Uses
  Dialogs, SysUtils;
  
function wtDateStr(const vIn: variant): variant;
begin
(*  if VarType(vIn) = VarDate then
  begin
    if vIn = 0 then
      Result := ''
    else
      Result := DateToStr(vIn);
  end
  else
    if (VarType(vIn) = VarString) or (VarType(vIn) = VarUString) then
  begin
    if Trim(vIn) = '' then
      Result := 0
    else
      Result := StrToDate(vIn);
  end
  else
    Result := Unassigned;
*)
end;

end.
