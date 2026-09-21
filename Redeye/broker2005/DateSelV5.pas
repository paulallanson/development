unit DateSelV5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Vcl.ExtCtrls;

type
  TDateSelV5Form = class(TForm)
    MonthCalendar1: TMonthCalendar;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    Panel1: TPanel;
  private
    function GetDate: TDateTime;
    procedure SetDate(const Value: TDateTime);
    { Private declarations }
  public
    property Date: TDateTime read GetDate write SetDate;
  end;

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
