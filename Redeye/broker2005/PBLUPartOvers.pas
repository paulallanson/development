unit PBLUPartOvers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TPBLUPartOversFrm = class(TForm)
    pnlBottom: TPanel;
    pnlTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblProduct: TLabel;
    lblDescription: TLabel;
    btnSelect: TBitBtn;
    btnCancel: TBitBtn;
    qryOvers: TQuery;
    sgDetails: TStringGrid;
    Label3: TLabel;
    lblQuantity: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
  private
    FPart: string;
    FOversQty: integer;
    FPartDescription: string;
    FSalesOrder: integer;
    FJobBag: integer;
    FPartLot: string;
    procedure SetPart(const Value: string);
    procedure BuildOversGrid;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure SetOversQty(const Value: integer);
    procedure SetPartDescription(const Value: string);
    procedure SetJobBag(const Value: integer);
    procedure SetPartLot(const Value: string);
    procedure SetSalesOrder(const Value: integer);
    { Private declarations }
  public
    property JobBag: integer read FJobBag write SetJobBag;
    property PartLot: string read FPartLot write SetPartLot;
    property OversQty: integer read FOversQty write SetOversQty;
    property Part: string read FPart write SetPart;
    property PartDescription: string read FPartDescription write SetPartDescription;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
  end;

var
  PBLUPartOversFrm: TPBLUPartOversFrm;

implementation

uses CCSCommon;

{$R *.dfm}

procedure TPBLUPartOversFrm.FormCreate(Sender: TObject);
begin
  with sgDetails do
    begin
      cells[0,0] := 'Item';
      cells[1,0] := 'Date';
      cells[2,0] := 'Job bag';
      cells[3,0] := 'Stock Request';
      cells[4,0] := 'Quantity';
      cells[5,0] := 'Lot No.';
    end;
end;

procedure TPBLUPartOversFrm.SetPart(const Value: string);
begin
  FPart := Value;
  lblProduct.caption := FPart;
end;

procedure TPBLUPartOversFrm.FormActivate(Sender: TObject);
begin
  ClearGrid(sgDetails);
  BuildOversGrid;
end;

procedure TPBLUPartOversFrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
//    rowcount := 2;
    end;
end;

procedure TPBLUPartOversFrm.BuildOversGrid;
var
  iTmpQty, icount, iend, iStart: integer;
  sJobBag, sSalesOrder: string;
begin
  icount := 0;
  iTmpQty := OversQty;
  with sgDetails, qryOvers do
    begin
      close;
      parambyname('Part').asstring := Part;
      parambyname('Date_Received').asdatetime := (date - 1);
      open;
      first;

      while eof <> true do
        begin
          icount := icount + 1;
          istart := pos('(',fieldbyname('Part_Movement_Reference').asstring);
          iend := pos(')',fieldbyname('Part_Movement_Reference').asstring);
          cells[0,icount] := inttostr(icount);
          cells[1,icount] := pbDateStr(fieldbyname('Date_Received').asdatetime);
          cells[2,icount] := copy(fieldbyname('Part_Movement_Reference').asstring,10,iStart-10);
          cells[3,icount] := copy(fieldbyname('Part_Movement_Reference').asstring,iStart+4,((iend)-(istart+4)));
          cells[5,icount] := fieldbyname('Part_Store_Lot').asstring;
          if (fieldbyname('Store_Quantity').asinteger * -1) >= iTmpQty then
            begin
              cells[4,icount] := inttostr(iTmpQty);
              break;
            end
          else
            begin
              cells[4,icount] := inttostr((fieldbyname('Store_Quantity').asinteger * -1));
              iTmpQty := iTmpQty - (fieldbyname('Store_Quantity').asinteger * -1);
            end;
          next;
        end;

      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnSelect.enabled := (icount > 0);
end;

procedure TPBLUPartOversFrm.SetOversQty(const Value: integer);
begin
  FOversQty := Value;
  lblQuantity.Caption := inttostr(FOversQty);
end;

procedure TPBLUPartOversFrm.SetPartDescription(const Value: string);
begin
  FPartDescription := Value;
  lblDescription.caption := FPartDescription;
end;

procedure TPBLUPartOversFrm.SetJobBag(const Value: integer);
begin
  FJobBag := Value;
end;

procedure TPBLUPartOversFrm.SetPartLot(const Value: string);
begin
  FPartLot := Value;
end;

procedure TPBLUPartOversFrm.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TPBLUPartOversFrm.btnSelectClick(Sender: TObject);
var
  irow: integer;
begin
  with sgDetails do
    begin
      irow := row;
      PartLot := cells[5,irow];
      SalesOrder := strtoint(cells[3,irow]);
      JobBag := strtoint(cells[2,irow]);
    end;
  Modalresult := mrOK;
end;

end.
