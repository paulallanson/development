(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Environment Selection

VSS Info:
$Header: /PBL D5/PBEnvSel.pas 2     18/09/:0 10:51a Andrewh $
$History: PBEnvSel.pas $
 * 
*******************************************************************************)
unit WTEnvSel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, gtQrCtrls;

type
  TfrmWTEnvSel = class(TForm)
    DBRadioGroup: TRadioGroup;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    FaxSystemRadioGroup: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTEnvSel: TfrmWTEnvSel;

implementation

{$R *.DFM}

end.
