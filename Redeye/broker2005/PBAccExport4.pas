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
