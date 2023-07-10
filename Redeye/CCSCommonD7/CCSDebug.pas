(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
	   This unit provides a simple mechanism for dumping debug text to a file.
	   To use this, you should set a project compile-time variable of DEBUG.

VSS Info:
$Header: /CCSCommon/CCSDebug.pas 1     7/12/99 10:15 Roddym $
$History: CCSDebug.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 10:15
 * Created in $/CCSCommon
 * First check-in of new printing routines for Broker as well as some
 * useful objects and functions.

*******************************************************************************)
unit CCSDebug;

interface

{$IFDEF DEBUG}
procedure Trace(const msg : string);
function BoolToStr(const Value : Boolean) : string;
{$ENDIF}

implementation
{$IFDEF DEBUG}
uses
	SysUtils, Windows;
var
	TraceFile	: TextFile;
	TraceOK		: Boolean;

function BoolToStr(const Value : Boolean) : string;
begin
  if Value then
    Result := 'true'
  else
    Result := 'false';
end;  {function BoolToStr}


procedure Trace(const msg : string);
begin
	if TraceOK then
	try
		WriteLn(TraceFile, TimeToStr(Time) + '> ' + msg);
		Flush(TraceFile);
	except
	end;
end;

function TraceName : string;
var
	aName	: string;
	aDir	: string;
	inx		: integer;
	inp	: array[0..255] of char;
	otp	: array[0..255] of char;
begin
	FillChar(inp, SizeOf(inp), 0);
	FillChar(otp, SizeOf(otp), 0);
	StrPCopy(inp, '%Temp%');
	ExpandEnvironmentStrings(@inp, @otp, 255);
	aDir:= StrPas(otp);
	for inx:= 0 to 99 do
	begin
		aName:= aDir+'\Trace_' + IntToStr(inx) + '.txt';
		if not FileExists(aName) then
		begin
			Result:= aName;
			Break;
		end;
	end;
end;

initialization
	try
		AssignFile(TraceFile, TraceName);
		Rewrite(TraceFile);
		WriteLn(TraceFile, 'Start run ' + DateTimeToStr(Now));
		Flush(TraceFile);
		TraceOK:= true;
	except
		TraceOK:= false;
	end;
finalization
	if TraceOK then
	try
		WriteLn(TraceFile, 'End run ' + DateTimeToStr(Now));
		Flush(TraceFile);
		CloseFile(TraceFile);
	except
	end;
{$ENDIF}
end.
