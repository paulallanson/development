unit STLUPartBinLot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, DBTables, ExtCtrls, Buttons;

type
  TSTLUPartBinLotFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TQuery;
    DetsDBGrid: TDBGrid;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure FindInGrid(sTempSel: string);
    procedure FormCreate(Sender: TObject);
    procedure SelectCode(Sender: TObject);
  private
  public
    Part, PartBin, sPartLot: string;
    bIs_Lookup, bAllow_Upd, Selected, PaidStock: ByteBool ;
  end;

  var
  STLUPartBinLotFrm: TSTLUPartBinLotFrm;

implementation

uses STMntStorTyp, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TSTLUPartBinLotFrm.FormActivate(Sender: TObject);
begin
  Selected := False ;
  If bIs_Lookup = True then
    begin
    Caption := 'Lookup a Part Lot Number' ;
    SelectBitBtn.Visible := True ;
    end
  else
    begin
    Caption := 'Maintain Part Lot Number' ;
    SelectBitBtn.Visible := False ;
    end;

  {Load up the string grid} ;
  ShowGrid(Self) ;
  if (sPartLot <> '') then FindInGrid(sPartLot) ;
end;

procedure TSTLUPartBinLotFrm.ShowGrid(Sender: TObject);
begin
With GetDetsSQL do
     begin
     Close ;
     ParamByName('Part').AsString := Part ;
     ParamByName('Part_Bin').AsString := PartBin ;
     Open ;
     SelectBitBtn.Enabled := RecordCount > 0 ;
     end;
end;

procedure TSTLUPartBinLotFrm.DetsDBGridColEnter(Sender: TObject);
begin
{Item selected, enable OK button} ;
SelectBitBtn.Enabled := True ;
end;

procedure TSTLUPartBinLotFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(self);
  Close ;
end;

procedure TSTLUPartBinLotFrm.FindInGrid(sTempSel: string);
begin
{Find the item you just changed} ;
  With DetsSRC.DataSet do
     begin
     First ;
     If sTempSel = '' then exit ;
     While (EOF = False) and (FieldByName('Part_Store_Lot').Asstring <> sTempSel) do
           Next ;
     end;
end;

procedure TSTLUPartBinLotFrm.FormCreate(Sender: TObject);
begin
  sPartLot := '';
end;

procedure TSTLUPartBinLotFrm.SelectCode(Sender: TObject);
begin
  sPartLot := DetsSRC.DataSet.FieldByName('Part_Store_Lot').Asstring;
  PaidStock := (DetsSRC.DataSet.FieldByName('Invoice_upfront').Asstring = 'Y');
  Selected := True ;
  Close ;
end;

end.
