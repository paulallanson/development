(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Initialisation Error Form

VSS Info:
$Header: /PBL D5/PBLoginError.pas 1     7/12/99 9:41 Roddym $
$History: PBLoginError.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit wtLoginError;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, gtQrCtrls;

type
  TfrmWTLoginError = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLoginError: TfrmWTLoginError;

implementation

{$R *.DFM}

end.
