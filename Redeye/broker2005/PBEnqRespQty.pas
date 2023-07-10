(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Add Supplier Response Quantity form.

VSS Info:
$Header: /PBL D5/PBEnqRespQty.pas 1     7/12/99 9:41 Roddym $
$History: PBEnqRespQty.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqRespQty;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBEnqRespQtyFrm = class(TForm)
    Label1: TLabel;
    ResponseQtyMemo: TMemo;
    Label2: TLabel;
    PriceMemo: TMemo;
    Label3: TLabel;
    PUnitCombo: TComboBox;
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure ResponseQtyMemoKeyPress(Sender: TObject; var Key: Char);
    procedure PriceMemoKeyPress(Sender: TObject; var Key: Char);
    procedure PUnitComboClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PriceMemoExit(Sender: TObject);
    procedure ResponseQtyMemoExit(Sender: TObject);
  private
    procedure EnableOK;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBEnqRespQtyFrm: TPBEnqRespQtyFrm;

implementation

{$R *.DFM}

procedure TPBEnqRespQtyFrm.ResponseQtyMemoKeyPress(Sender: TObject; var Key:
  Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;

end;

procedure TPBEnqRespQtyFrm.PriceMemoKeyPress(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  with PriceMemo do
  begin
    P := Pos('.', Lines[0]);
  end;

  case key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBEnqRespQtyFrm.EnableOK;
var
  icount: Integer;
begin
  for icount := 0 to ComponentCount - 1 do
  begin
    {If either of the edit boxes are empty then not ready to enable OK}
    if Components[icount] is TMemo then
      if TMemo(Components[icount]).Lines[0] = '' then
      begin
        Exit;
      end;

    {If Combo box empty then not ready to enable OK}
    if Components[icount] is TComboBox then
      if TComboBox(Components[icount]).Text = '' then
      begin
        Exit;
      end;
  end;
  OKBtn.Enabled := True;
end;

procedure TPBEnqRespQtyFrm.PUnitComboClick(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBEnqRespQtyFrm.FormShow(Sender: TObject);
begin
  ResponseQtyMemo.SetFocus;
end;

procedure TPBEnqRespQtyFrm.PriceMemoExit(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBEnqRespQtyFrm.ResponseQtyMemoExit(Sender: TObject);
begin
  EnableOK;
end;

end.
