unit CSCommon;

interface

uses
  Classes, SysUtils, Windows, ShellAPI, ShlObj, ActiveX,
  Controls, Messages, Forms, Buttons, Dialogs;

function TestButton(sTempButton: string): ByteBool;

implementation

function TestButton(sTempButton: string): ByteBool;
begin
  {Test if a button is activated}
  try
    Result := true;
    {$IFDEF Broker}
    Result := (PBMenuMainFrm.FindComponent(sTempButton) as TBitBtn).Enabled;
    {$ELSEIF SOP}
    Result := (STMenuMainFrm.FindComponent(sTempButton) as TBitBtn).Enabled;
    {$ENDIF}
  except
    MessageDlg('Security check failed on : ' + sTempButton, mtInformation,
      [mbOK], 0);
    Result := False;
  end;
end;

end.
 