(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Enquiry/Supplier Temp Form

VSS Info:
$Header: /PBL D5/PBEnqSupTmp.pas 2     28/09/:0 11:22 Paul $
$History: PBEnqSupTmp.pas $
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 28/09/:0   Time: 11:22
 * Updated in $/PBL D5
 * Changed to use a standard Additional Charges maintenance and lookup
 * selection form
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqSupTmp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids;

type
  TPBEnqSupTmpFrm = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBEnqSupTmpFrm: TPBEnqSupTmpFrm;

implementation

{$R *.DFM}

end.
