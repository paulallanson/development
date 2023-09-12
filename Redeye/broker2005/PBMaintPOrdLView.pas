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
    procedure LineDetsStringGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
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

procedure TPBMaintPOrdLViewFrm.LineDetsStringGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    {The following is code extracted from the Delphi Info Base}
    {Display the Columns Right justified in the cells}
    if (ACol < 1) or (ACol > 2) then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := LineDetsStringGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;

      if ((Col > 2) and (Row > 0) and (LineDetsStringGrid.Cells[3, Row] <>
        LineDetsStringGrid.Cells[4, Row])) then
      begin
        LineDetsStringGrid.Canvas.Font.Color := clRed;
      end;

      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end
    else
    begin
      if gdFixed in State then
        Canvas.Brush.Color := LineDetsStringGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintPOrdLViewFrm.LineDetsStringGridDblClick(Sender: TObject);
begin
  Modalresult := mrOK;
end;

end.
