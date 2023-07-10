unit STLUStStkNumbers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, Grids, ExtCtrls;

type
  TSTLUStStkNumbersFrm = class(TForm)
    pmnuMaint: TPopupMenu;
    Add1: TMenuItem;
    Change1: TMenuItem;
    Delete1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    sgDetail: TStringGrid;
    BitBtn1: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lblProduct: TLabel;
    lblDescription: TLabel;
    Label4: TLabel;
    lblQuantity: TLabel;
    lblSetsperPad: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FNumberedItems: integer;
    FSetsPerPad: integer;
    procedure EnableOK;
    procedure SetButtons;
    procedure CallMaintScreen(sTempFuncMode: String);
    function GetTotalQuantity: integer;
    procedure UpdateGrid(TEmpAction, tempStart, TempFinish, TempCount: string);
    procedure SetNumberedItems(const Value: integer);
    procedure SetLineQuantity;
    procedure SetSetsPerPad(const Value: integer);
  public
    MovementQty: integer;
    property NumberedItems: integer read FNumberedItems write SetNumberedItems;
    property SetsPerPad: integer read FSetsPerPad write SetSetsPerPad;
  end;

var
  STLUStStkNumbersFrm: TSTLUStStkNumbersFrm;

implementation

uses STMaintStStkNumbers;

{$R *.DFM}

procedure TSTLUStStkNumbersFrm.FormCreate(Sender: TObject);
begin
  sgDetail.cells[0,0] := 'From';
  sgDetail.cells[1,0] := 'To';
  sgDetail.cells[2,0] := 'Quantity';
end;

procedure TSTLUStStkNumbersFrm.EnableOK;
begin
  btnOK.enabled := (sgDetail.cells[1,1] <> '') and
                   (GetTotalQuantity = (MovementQty*SetsPerPad));
end;

procedure TSTLUStStkNumbersFrm.SetButtons;
begin
  btnChange.enabled := (sgDetail.cells[1,1] <> '');
  btnDelete.enabled := (sgDetail.cells[1,1] <> '');
end;

procedure TSTLUStStkNumbersFrm.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TSTLUStStkNumbersFrm.CallMaintScreen(sTempFuncMode: String);
begin
  stMaintStStkNumbersfrm := TstMaintStStkNumbersfrm.create(self);
  try
    stMaintStstkNumbersFrm.irow := 0;
    if sTempFuncMode <> 'A' then
      begin
        stMaintStStkNumbersFrm.edtFirst.text := sgDetail.cells[0,sgDetail.row];
        stMaintStStkNumbersFrm.edtLast.text := sgDetail.cells[1,sgDetail.row];
        stMaintStstkNumbersFrm.irow := sgDetail.row;
      end;
    stMaintStStkNumbersFrm.Mode := sTempFuncMode;
    stMaintStstkNumbersFrm.NumberLength := length(sgDetail.cells[0,sgDetail.row]);

    stMaintStStkNumbersfrm.showmodal;
    if stMaintStStkNumbersfrm.modalresult = idOK then
      begin
        UpdateGrid(sTempFuncMode,StMaintStStkNumbersFrm.edtFirst.text,
                  StMaintStStkNumbersFrm.edtLast.text, StMaintStSTkNumbersfrm.lblCount.caption);
      end;
  finally
    stMaintStStkNumbersfrm.free;
  end;
  SetButtons;
  EnableOK;
end;

procedure TSTLUStStkNumbersFrm.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TSTLUStStkNumbersFrm.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TSTLUStStkNumbersFrm.UpdateGrid(TEmpAction: string; tempStart, TempFinish, TempCount: string);
var
  irow, icol: integer;
begin
  if TempAction = 'A' then
    begin
      if (sgDetail.rowcount = 2) and
         (sgDetail.cells[0,1] = '') then
        sgDetail.rowcount := sgDetail.rowcount
      else
        sgDetail.rowcount := sgDetail.rowcount + 1;
      irow := sgDetail.rowcount - 1;
      sgDetail.cells[0,irow] := tempStart;
      sgDetail.cells[1,irow] := tempFinish;
      sgDetail.cells[2,irow] := tempCount;
      sgDetail.row := pred(sgDetail.rowcount);
    end
  else
  if TempAction = 'C' then
    begin
      irow := sgDetail.row;
      sgDetail.cells[0,irow] := tempStart;
      sgDetail.cells[1,irow] := tempFinish;
      sgDetail.cells[2,irow] := tempCount;
      sgDetail.row := irow;
    end
  else
  if TempAction = 'D' then
    begin
      with sgDetail do
        begin
          for irow := row to pred(rowcount) do
            for icol := 0 to 2 do
              cells[icol,irow] := cells[icol,irow+1];
          if rowcount > 2 then
            rowcount := rowcount - 1;
        end;
    end;
end;

function TSTLUStStkNumbersFrm.GetTotalQuantity: integer;
var
  irow, iTotal: integer;
begin
  iTotal := 0;
  with sgDetail do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if cells[2,irow] = '' then
            begin
              iTotal := 0;
              break;
            end;
          iTotal := iTotal + strtoint(cells[2,irow]);
        end;
    end;
  result := iTotal;
end;

procedure TSTLUStStkNumbersFrm.SetLineQuantity;
var
  icount, irow: integer;
begin
  with sgDetail do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if cells[0,irow] = '' then break;
          iCount := (strtoInt64(cells[1,irow]) - strtoInt64(cells[0,irow])+1);
          cells[2,irow] := inttostr(icount);
        end;
    end;
end;

procedure TSTLUStStkNumbersFrm.SetNumberedItems(const Value: integer);
begin
  FNumberedItems := Value;
  if FNumberedItems = 0 then
    sgDetail.rowcount := 2
  else
    sgDetail.rowcount := FNumberedItems + 1;
end;

procedure TSTLUStStkNumbersFrm.FormActivate(Sender: TObject);
begin
  SetLineQuantity;
  SetButtons;
  EnableOK;
end;


procedure TSTLUStStkNumbersFrm.SetSetsPerPad(const Value: integer);
begin
  FSetsPerPad := Value;
  lblSetsPerPad.caption := 'Sets per pad/book: '+inttostr(FSetsPerPad);
  
  lblSetsPerPad.visible := (FSetsPerPad > 1);
end;

end.
