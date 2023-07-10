unit PBMaintPOrdLView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, StdCtrls, Buttons;

type
  TPBMaintPOrdLViewFrm = class(TForm)
    pnlLines: TPanel;
    LineDetsStringGrid: TStringGrid;
    pnlButtons: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure LineDetsStringGridDrawCell(Sender: TObject; Col,
        Row: Longint; Rect: TRect; State: TGridDrawState);
    procedure LineDetsStringGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBMaintPOrdLViewFrm: TPBMaintPOrdLViewFrm;

implementation

{$R *.DFM}

procedure TPBMaintPOrdLViewFrm.LineDetsStringGridDrawCell(Sender: TObject; Col,
  Row: Longint; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {The following is code extracted from the Delphi Info Base}
  {Display the Columns Right justified in the cells}
  if (Col < 1) or (Col > 2) then
  begin
    StrPCopy(Txt, LineDetsStringGrid.Cells[Col, Row]);
    SetTextAlign(LineDetsStringGrid.Canvas.Handle,
      GetTextAlign(LineDetsStringGrid.Canvas.Handle)
      and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
    if ((Col > 2) and (Row > 0) and (LineDetsStringGrid.Cells[3, Row] <>
      LineDetsStringGrid.Cells[4, Row])) then
    begin
      LineDetsStringGrid.Canvas.Font.Color := clRed;
    end;
    ExtTextOut(LineDetsStringGrid.Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
      ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end
  else
  begin
    StrPCopy(Txt, LineDetsStringGrid.Cells[Col, Row]);
    SetTextAlign(LineDetsStringGrid.Canvas.Handle,
      GetTextAlign(LineDetsStringGrid.Canvas.Handle)
      and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
    ExtTextOut(LineDetsStringGrid.Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
      ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end;
end;

procedure TPBMaintPOrdLViewFrm.LineDetsStringGridDblClick(Sender: TObject);
begin
  Modalresult := mrOK;
end;

end.
