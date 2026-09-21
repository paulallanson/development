unit PBFaxList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, ExtCtrls;

type
  TPBFaxListFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    FaxListGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FaxListGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FaxListGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBFaxListFrm: TPBFaxListFrm;

implementation

{$R *.DFM}

procedure TPBFaxListFrm.FormCreate(Sender: TObject);
begin
	FaxListgrid.cells[2,0] := 'Fax Number';
end;

procedure TPBFaxListFrm.FaxListGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
	if ACol = 2 then
   FaxListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
   FaxListGrid.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
end;

procedure TPBFaxListFrm.FaxListGridKeyPress(Sender: TObject;
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
