unit STPrtEnqMov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, Grids, DBGrids, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPrtEnqMovFrm = class(TForm)
    PartLabel: TLabel;
    StoreLabel: TLabel;
    DateLabel: TLabel;
    PartEdit: TEdit;
    StoreNameEdit: TEdit;
    FromEdit: TEdit;
    ToEdit: TEdit;
    Label1: TLabel;
    PartDescrEdit: TEdit;
    GetDetsSQL: TFDQuery;
    DetsDataSource: TDataSource;
    DetsDBGrid: TDBGrid;
    Label2: TLabel;
    BinEdit: TEdit;
    Label3: TLabel;
    lotEdit: TEdit;
    CloseBitBtn: TBitBtn;
    GetDetsSQLDate_Received: TDateTimeField;
    GetDetsSQLPart_Move_Type_Descr: TStringField;
    GetDetsSQLPart_Store_Name: TStringField;
    GetDetsSQLPart_Movement_Bin: TStringField;
    GetDetsSQLPart_Store_Lot: TStringField;
    GetDetsSQLPart_Movement_Reference: TStringField;
    GetDetsSQLStore_Cost: TCurrencyField;
    GetDetsSQLStore_Quantity: TIntegerField;
    GetDetsSQLStock_Pack_Quantity: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure GetDetsSQLStore_QuantityGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    sPart, sBin, sLot: String ;
    dFrom, dTo: TDateTime ;
    iStore: Integer;
  end;

var
  STPrtEnqMovFrm: TSTPrtEnqMovFrm;

implementation

uses STStockDM, STPacks;

{$R *.DFM}

procedure TSTPrtEnqMovFrm.FormActivate(Sender: TObject);
begin
With STStockDataMod.GetPartSQL do
    begin
    Close ;
    ParamByName('Part').AsString := sPart ;
    Open ;
    First ;
    PartEdit.Text := sPart ;
    PartDescrEdit.Text := FieldByName('Part_Description').AsString ;
    end;
If iStore <> 0 then
    begin
    With STStockDataMod.GetStoreSQL do
         begin
         Close ;
         ParamByName('Part_Store').AsInteger := iStore ;
         Open ;
         First ;
         StoreNameEdit.Text := FieldByName('Part_Store_Name').AsString ;
         end;
    end
else
    StoreNameEdit.Text := 'All Stores' ;
If dFrom <> 0 then
    FromEdit.Text := DateToStr(dFrom)
else
    FromEdit.Text := 'Start' ;
If dTo  <> 0 then
    ToEdit.Text := DateToStr(dTo)
else
    ToEdit.Text := 'End' ;
BinEdit.Text := sBin ;
LotEdit.Text := sLot ;
With GetDetsSQL do
     begin
     Close ;
     ParamByName('Part').AsString := sPart ;
     ParamByName('Part_Store').AsInteger := iStore ;
     ParamByName('Part_Bin').AsString := sBin ;
     ParamByName('Part_Store_Lot').AsString := sLot ;
     Open ;
     end;
end;

procedure TSTPrtEnqMovFrm.FormCreate(Sender: TObject);
begin
STStockDataMod := TSTStockDataMod.Create(Self) ;
end;

procedure TSTPrtEnqMovFrm.FormDestroy(Sender: TObject);
begin
STStockDataMod.Free ;
end;

procedure TSTPrtEnqMovFrm.CloseBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TSTPrtEnqMovFrm.GetDetsSQLStore_QuantityGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
{Convert to packs and singles} ;
Text := ShowInPacks(Sender.AsInteger, GetDetsSQL.FieldByName('Stock_Pack_Quantity').AsInteger) ;
end;

end.
