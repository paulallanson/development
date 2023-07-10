(*******************************************************************************

Copyright (c) Centrereed Ltd 1999-2000

Comments
--------
  Export to accounts package.

VSS Info:
$Header: /PBL D5/PBAccExport4.pas 5     18/10/:1 12:38 Paul $
$History: PBAccExport4.pas $
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 18/10/:1   Time: 12:38
 * Updated in $/PBL D5
 * Changes to improve the import and export of data to and from Sage Line
 * 50
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 8/09/:0    Time: 16:43
 * Updated in $/PBL D5
 * Added functionality to import Sage Customer/Supplier/Currency
 * information
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 21/03/:0   Time: 15:05
 * Updated in $/PBL D5
 * Add standard header to new units.

*******************************************************************************)
unit PBAccExport4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBAccExport4Frm = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    RecordMemo: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iRecordCounter: integer;
  end;

var
  PBAccExport4Frm: TPBAccExport4Frm;

implementation

uses PBAccExport1;

{$R *.DFM}

procedure TPBAccExport4Frm.BitBtn1Click(Sender: TObject);
begin
  pbaccexport1frm.close;
end;

procedure TPBAccExport4Frm.FormShow(Sender: TObject);
begin
  Caption := PBAccExport1Frm.ActionListBox.Items[PBAccExport1Frm.ActionListBox.Itemindex];
  if PBAccExport1Frm.ActionListBox.Itemindex < 5 then
    RecordMemo.Text := inttostr(iRecordCounter) + ' records have been exported. Now perform the appropriate action within your preferred Accounting system'
  else
    RecordMemo.Text := inttostr(iRecordCounter) + ' new records have been imported.';
end;

end.
