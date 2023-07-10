(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Enquiry Line Temp Form

VSS Info:
$Header: /PBL D5/PBenqline.pas 3     22/08/03 16:34 Paul $
$History: PBenqline.pas $
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 22/08/03   Time: 16:34
 * Updated in $/PBL D5
 * Changed to correctly resize when using Windows XP display type.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 6/01/:3    Time: 14:52
 * Updated in $/PBL D5
 * Changed to allow maintenance of optional charges
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 23/12/:2   Time: 16:27
 * Updated in $/PBL D5
 * Added the Optional Charges selection
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBenqline;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls;

type
  TPBEnqLineTmp = class(TForm)
    PartGrid: TStringGrid;
    AddGrid: TStringGrid;
    CapGrid: TStringGrid;
    QuestionGrid: TStringGrid;
    SupplierGrid: TStringGrid;
    NotesMemo: TMemo;
    OptionsGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iNarrative: Integer;
    sLineMode: string[1];
    iStatus: Integer;
    noOfParts: integer;
  end;

var
  PBEnqLineTmp: TPBEnqLineTmp;

implementation

{$R *.DFM}

procedure TPBEnqLineTmp.FormCreate(Sender: TObject);
begin
  iNarrative := 0;
  sLineMode := 'A';
  iStatus := 10;  
  noOfParts := 0;
end;

end.
