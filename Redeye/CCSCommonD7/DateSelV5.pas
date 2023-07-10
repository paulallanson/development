(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Scribe Date selection form for use with Delphi5. Replaces the
  earlier TDateSelect component.

VSS Info:
$Header: /CCSCommon/DateSelV5.pas 1     13/03/03 14:10 Paul $
$History: DateSelV5.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 13/03/03   Time: 14:10
 * Created in $/CCSCommon
 * 
 * *****************  Version 1  *****************
 * User: Andrewh      Date: 9/11/99    Time: 2:02p
 * Created in $/Scribe D3
 * Form renamed from DateSelV5Frm.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 9/11/99    Time: 11:28
 * Updated in $/Scribe D3
 * New header added to source files.  Source reformatted.  Try..finally
 * put round forms creation/free.  Boolean checks changed.

*******************************************************************************)
unit DateSelV5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TDateSelV5Form = class(TForm)
    MonthCalendar1: TMonthCalendar;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
  private
    function GetDate: TDateTime;
    procedure SetDate(const Value: TDateTime);
    { Private declarations }
  public
    property Date: TDateTime read GetDate write SetDate;
  end;

var
  DateSelV5Form: TDateSelV5Form;

implementation

{$R *.DFM}

{ TDateSelV5Form }

function TDateSelV5Form.GetDate: TDateTime;
begin
  Result := MonthCalendar1.Date;
end;

procedure TDateSelV5Form.SetDate(const Value: TDateTime);
begin
  MonthCalendar1.Date := Value;
end;

end.
