(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Fax list Form

VSS Info:
$Header: /Broker Stock/STFaxList.pas 1     16/04/:3 12:32 Janiner $
$History: STFaxList.pas $
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 16/04/:3   Time: 12:32
 * Created in $/Broker Stock
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 2/05/:1    Time: 12:51
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit STFaxList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, ExtCtrls;

type
  TSTFaxListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    FaxListGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FaxListGridSelectCell(Sender: TObject; Col, Row: Longint;
      var CanSelect: Boolean);
    procedure FaxListGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STFaxListFrm: TSTFaxListFrm;

implementation

{$R *.DFM}

procedure TSTFaxListFrm.FormCreate(Sender: TObject);
begin
	FaxListgrid.cells[2,0] := 'Fax Number';
end;

procedure TSTFaxListFrm.FaxListGridSelectCell(Sender: TObject; Col,
  Row: Longint; var CanSelect: Boolean);
begin
	if Col = 2 then
   FaxListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
   FaxListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TSTFaxListFrm.FaxListGridKeyPress(Sender: TObject;
  var Key: Char);
begin
	case Ord(key) of
  	$30..$39:;
  	Ord('-'):;
  	vk_back:;
  	vk_return:;
  	vk_tab:;
  else
  	MessageBeep(0);
  	key := #0;
  end;
end;

end.
