unit PBMaintJobReturns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBMaintJobReturns = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lblProduct: TLabel;
    lblProductDescription: TLabel;
    Label4: TLabel;
    lblJobBag: TLabel;
    Label6: TLabel;
    lblCustomer: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    memReturns: TMemo;
    Label9: TLabel;
    Label10: TLabel;
    memWastage: TMemo;
    btnReturns: TButton;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    memOvers: TMemo;
    qryJobReturns: TFDQuery;
    procedure btnReturnsClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    iCustomer: integer;
    procedure CallMoveScreen(TempMoveType: String);
    procedure CalculateWaste;
  public
    procedure LoadtheScreen(tempJob: integer; tempPart: string);
  end;

var
  frmPBMaintJobReturns: TfrmPBMaintJobReturns;

implementation

uses PBPartTransfer;

{$R *.dfm}

procedure TfrmPBMaintJobReturns.btnReturnsClick(Sender: TObject);
begin
  CallMoveScreen('P');
end;

procedure TfrmPBMaintJobReturns.CallMoveScreen(TempMoveType: String);
var
  bTempOK: boolean;
  tempPart: string;
begin
  tempPart := lblProduct.caption;
  PBPartTransferFrm := TPBPartTransferFrm.Create(Self);
  try
    PBPartTransferFrm.LastPart := tempPart;
    PBPartTransferFrm.PartEdit.text := tempPart;
    PBPartTransferFrm.PartDescrEdit.Text := lblProductDescription.Caption;
//    PBPartTransferFrm.edtFormReference.Text := dbgLineDetails.dataSource.DataSet.FieldByName('Form_Reference_ID').AsString;
    PBPartTransferFrm.Customer := iCustomer;
    PBPartTransferFrm.sMoveType := TempMoveType ;
    PBPartTransferFrm.iJobBag := strtoint(trim(lblJobBag.caption));

    PBPartTransferFrm.ShowModal;
    bTempOK := PBPartTransferFrm.bOK;
    if bTempOK then
      begin
        memReturns.Text := inttostr((strtoint(memReturns.Text)) + (PBPartTransferFrm.totalReturned));
        calculatewaste;
      end;

  finally
    PBPartTransferFrm.Free;
  end;
end;

procedure TfrmPBMaintJobReturns.CalculateWaste;
begin
  memWastage.text := inttostr(strtoint(memOvers.text) - strtoint(memReturns.Text));
end;

procedure TfrmPBMaintJobReturns.LoadtheScreen(tempJob: integer; tempPart: string);
begin
  with qryJobReturns do
    begin
      close;
      parambyname('Job_Bag').asinteger := tempJob;
      parambyname('Part').asstring := tempPart;
      open;
      lblProduct.caption := tempPart;
      lblProductDescription.caption := fieldbyname('Part_description').asstring;

      lblCustomer.caption := fieldbyname('Customer_Name').asstring;
      lblJobBag.caption := fieldbyname('Job_Bag').asstring;

      btnReturns.Enabled := (fieldbyname('Quantity_to_Return').asinteger <> 0);
      memOvers.text := fieldbyname('Quantity_to_Return').asstring;
      memReturns.text := '0';

      CalculateWaste;
      iCustomer := fieldbyname('Customer').asinteger;
    end;
end;

procedure TfrmPBMaintJobReturns.OKBitBtnClick(Sender: TObject);
begin
  if strtoint(memWastage.text) > 0 then
    begin
(*      STStockDataMod.updstock(StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Store_Stock').asinteger,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part').asstring,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part_Store').asinteger,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part_Bin').asstring,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Part_Store_lot').asstring,
                                  'J',
                                  sReference,
                                  date,
                                  date,
                                  (iMoveQty*-1),
                                  0,
                                  StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Stock_pack_Quantity').asinteger,
                                  (StSalesOrdDM.GetPartAllocationSQL.fieldbyname('Store_Cost').asfloat*-1));

*)
    end;
end;

end.
