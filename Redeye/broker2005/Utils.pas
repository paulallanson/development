unit Utils;

interface

type
  TUtils = class(TObject)
    class function CheckSmallDateTime(const StrDate: string): string; overload;
    class function CheckSmallDateTime(const StrDate: TDateTime): TDateTime; overload;
  end;

implementation

uses
  System.SysUtils, Math;

class function TUtils.CheckSmallDateTime(const StrDate: string): string;
begin
  { SmallDateTime in SQL database starts date from 1900-01-01 to 2079-06-06 }
  var MinDate := EncodeDate(1900,1,1);
  var ValDate := StrToDateDef(StrDate, 0);
  Result := DateToStr(Max(ValDate, MinDate));
end;

class function TUtils.CheckSmallDateTime(const StrDate: TDateTime): TDateTime;
begin
  { SmallDateTime in SQL database starts date from 1900-01-01 to 2079-06-06 }
  var MinDate := EncodeDate(1900,1,1);
  Result := Max(StrDate, MinDate);
end;

end.
