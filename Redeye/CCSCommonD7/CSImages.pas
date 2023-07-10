(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Images Form

VSS Info:
$Header: /CCSCommon/CSImages.pas 1     10/01/:1 12:58 Paul $
$History: CSImages.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 12:58
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSImages;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TCSImagesFrm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ReportImage: TImage;
    OffBitBtn: TBitBtn;
    OnBitBtn: TBitBtn;
    procedure LoadReportLogo(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CSImagesFrm: TCSImagesFrm;

implementation

{$R *.DFM}

procedure TCSImagesFrm.LoadReportLogo(Sender: TObject);
begin
  try
    ReportImage.Picture.LoadFromFile('PBRepLogo.bmp');
  except
    {If there is an error, use the Centrereed one};
  end;
end;

end.
