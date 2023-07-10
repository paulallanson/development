unit STPacks;

interface

Uses
        Dialogs, SysUtils;
        
Function ShowInPacks(iSinglesQty, iPackSize: Integer): String;
Function InpToSing(sInpStr: String; iPackSize: Integer): Integer;

implementation

Function ShowInPacks(iSinglesQty, iPackSize: Integer): String;
Var
iNoOfPacks: Integer;
begin
iNoofPacks := 0;
{Display output as <noofpacks> or <noofpacks>/<noofsingles>} ;
Try
        iNoOfPacks := Trunc(iSinglesQty/iPackSize) ;
Except
        Result := '' ;
        MessageDlg('Invalid Pack Size',mtError,[mbOK],0) ;
        end;
If iSinglesQty = (iPackSize*iNoOfPacks) then
        Result := IntToStr(iNoOfPacks)
else
        Result := IntToStr(iNoOfPacks) + ':' + IntToStr(iSinglesQty - (iPackSize*iNoOfPacks)) ;
end;

Function InpToSing(sInpStr: String; iPackSize: Integer): Integer;
Var
iSlashPos: Integer;
begin
{Convert <noofpacks> or <noofpacks>/<noofsingles> to singles quantity} ;
{Note that a -999999 is an error} ;
iSlashPos := Pos(':',sInpStr);
if sInpStr = '0' then
  begin
    result := 0;
    exit;
  end;
Try
        If iSlashPos > 0 then
                Result := (StrToInt(Copy(sInpStr,1,iSlashPos-1))*iPackSize) +
                                (StrToInt(Copy(sInpStr,iSlashPos+1, Length(sInpStr)-iSlashPos)))
        else
                Result := (StrToInt(sInpStr)*iPackSize) ;
Except
        MessageDlg('Quantity must be entered as <packs> or <packs>:<singles', mtError,[mbOK],0) ;
        Result := -99999 ;
        end;
end;

end.
