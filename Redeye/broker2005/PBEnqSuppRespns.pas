unit PBEnqSuppRespns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, PBEnquiryDataMod, Grids, DBCtrls, ExtCtrls;

type
  TPBEnqSuppRespnsFrm = class(TForm)
    pnlPriceGrid: TPanel;
    strgrdPrices: TStringGrid;
    lblRunOn: TLabel;
    edtRunOn: TEdit;
    cmbbxPriceUnit: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    btbtnAddQuantity: TBitBtn;
    pnlTop: TPanel;
    pnlHeader: TPanel;
    pnlExChrgs: TPanel;
    strgrdExChrgs: TStringGrid;
    pnlExChrgBtns: TPanel;
    Label2: TLabel;
    edtExChrgs: TEdit;
    btnExCharges: TButton;
    pnlHeaderTop: TPanel;
    lblContact: TLabel;
    lblRespDate: TLabel;
    lblSuppRef: TLabel;
    dtpckrRespDate: TDateTimePicker;
    edtRef: TEdit;
    pnlHeaderLeft: TPanel;
    lblDelComm2: TLabel;
    lblDelComm1: TLabel;
    pnlDelComm: TPanel;
    mmDelComm: TMemo;
    lblExCharges: TLabel;
    cmbbxContact: TDBLookupComboBox;
    pnlSupplier: TPanel;
    lblSupplierlbl: TLabel;
    cmbbxSupplierList: TComboBox;
    btnPrevSupp: TBitBtn;
    btbtnNextSupp: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure cmbbxContactChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExChargesClick(Sender: TObject);
    procedure strgrdPricesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cmbbxPriceUnitClick(Sender: TObject);
    procedure strgrdPricesSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure cmbbxPriceUnitCloseUp(Sender: TObject);
    procedure mmDelCommChange(Sender: TObject);
    procedure edtRefChange(Sender: TObject);
    procedure dtpckrRespDateChange(Sender: TObject);
    procedure cmbbxContactClick(Sender: TObject);
    procedure btnPrevSuppClick(Sender: TObject);
    procedure btbtnNextSuppClick(Sender: TObject);
    procedure cmbbxSupplierListChange(Sender: TObject);
    procedure btbtnAddQuantityClick(Sender: TObject);
    procedure edtRunOnChange(Sender: TObject);
    procedure edtRunOnKeyPress(Sender: TObject; var Key: Char);
  private
    //redisplaying is used when the supplier being displayed changes
    //the edit box contents and such are changed as the new supplier is being
    //displayed, but the details aren't changing during this process it's just
    //displaying different ones. so basically as each bit of info is being displayed
    //we have to disable the setting of modified fields to true otherwise the
    //enquiry will prompt for a save even if the user doesn't change anything.
    justDisplaying: boolean;
    procedure SetUpPriceUnitCombo();
    procedure SetUpContactCombo();
    procedure DisplayGeneralDetails();
    procedure DisplayPrices();
    procedure DisplayExCharges();
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    procedure SetUpSupplierList();
    procedure DisplayDetails();
    procedure ClearForm;
  public
    PriceUnit: string;
    ShowRunOn: boolean;
    Enquiry: TEnquiry;
    SuppInx: Integer;
  end;

var
  PBEnqSuppRespnsFrm: TPBEnqSuppRespnsFrm;


implementation

uses FireDAC.Stan.Param, PBLUEnqAddChg;

{$R *.DFM}

procedure TPBEnqSuppRespnsFrm.FormShow(Sender: TObject);
begin
  justDisplaying := true;
  Self.SetUpSupplierList;
  Self.SetUpPriceUnitCombo;
  Self.DisplayDetails;
  justDisplaying := false;
end;

procedure TPBEnqSuppRespnsFrm.cmbbxContactChange(Sender: TObject);
begin
  with PBEnqDM.qrySelSuppBrnchConts do
  begin
    Locate('Name', Variant(cmbbxContact.Text), []);
    Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ContactNo :=
      FieldByName('Contact_No').asInteger;
  end;
end;

procedure TPBEnqSuppRespnsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBEnqDM.qrySelPriceUnits.Close;
  PBEnqDM.qrySelSuppBrnchConts.Close;
end;

procedure TPBEnqSuppRespnsFrm.btnExChargesClick(Sender: TObject);
var
  chrgInx, rowInx: integer;
  anExtraCharge: TExtraCharge;
begin
  PBLUEnqAddChgFrm := TPBLUEnqAddChgFrm.Create(Self);
  try
    //display the existing extra charges
    with Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse do
    begin
      for chrgInx := 0 to (NoOfExtraCharges - 1) do
      begin
        PBLUEnqAddChgFrm.AddChargesGrid.RowCount := NoOfExtraCharges + 1;
        PBLUEnqAddChgFrm.AddChargesGrid.Cells[0, chrgInx+1] :=
          ExtraCharges[chrgInx].Details;
        PBLUEnqAddChgFrm.AddChargesGrid.Cells[1, chrgInx+1] :=
          FloatToStrF(ExtraCharges[chrgInx].Cost, ffFixed, 15, 2);
        PBLUEnqAddChgFrm.AddChargesGrid.Cells[2, chrgInx+1] :=
          FloatToStrF(ExtraCharges[chrgInx].Price, ffFixed, 15, 2);
      end;
      PBLUEnqAddChgFrm.ShowModal;

      if PBLUEnqAddChgFrm.ModalResult = mrOK then
      begin
        //drop exisiting extra charges
        ClearExtraCharges;
        //recreate extra charges based on contents of grid
        for rowInx := 1 to (PBLUEnqAddChgFrm.AddChargesGrid.RowCount - 1) do
        begin
          anExtraCharge := TExtraCharge.Create;
          anExtraCharge.Details :=
            PBLUEnqAddChgFrm.AddChargesGrid.Cells[0, rowInx];
          anExtraCharge.Cost :=
            StrToFloat(PBLUEnqAddChgFrm.AddChargesGrid.Cells[1, rowInx]);
          anExtraCharge.Price :=
            StrToFloat(PBLUEnqAddChgFrm.AddChargesGrid.Cells[2, rowInx]);
          AddExtraCharge(anExtraCharge);
        end;

        if not justDisplaying then
        begin
          Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
          Enquiry.DetailsModified := true;
        end;
        Self.DisplayExCharges;
      end;
    end;
  finally
    PBLUEnqAddChgFrm.Free;
  end;
end;

procedure TPBEnqSuppRespnsFrm.SetUpPriceUnitCombo;
begin
  PBEnqDM.GetPriceUnitSQL.Open;
end;

procedure TPBEnqSuppRespnsFrm.SetUpContactCombo;
begin
    //fill contact combobox
  with PBEnqDM.qrySelSuppBrnchConts do
  begin
    Close;
    ParamByName('Supplier').asInteger := Enquiry.Line.QuotingSuppliers[suppInx].SupplierNo;
    ParamByName('Branch_No').asInteger := Enquiry.Line.QuotingSuppliers[suppInx].Branch.BranchNo;
    Open;
    //the query is going to be left open until the form closes so that it can be
    //used to look up contact nos / contact names. It will be closed in the Form.OnClose event.
    Locate('Contact_No', variant(Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ContactNo), []);
  end;
end;

procedure TPBEnqSuppRespnsFrm.DisplayGeneralDetails;
begin
  cmbbxContact.KeyValue := Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ContactNo;
  if Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ActResponseDate <> 0 then
    Self.dtpckrRespDate.DateTime := Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ActResponseDate
  else
    Self.dtpckrRespDate.DateTime := Now();

  Self.edtRef.Text := Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.SupplierReference;
  Self.mmDelComm.Text := Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.DeliveryComment;
  Self.edtRunOn.Text := FloatToStrF(Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.RunOnPrice, ffFixed, 15, 2);
end;

procedure TPBEnqSuppRespnsFrm.DisplayExCharges;
var
  chrgInx: integer;
begin
  with Enquiry.Line.QuotingSuppliers[SuppInx].SupplierResponse, strgrdExChrgs do
  begin
    RowCount := NoOfExtraCharges + 1;
    ColWidths[0] := 20;
    ColWidths[1] := 200;
    ColWidths[2] := 60;
    Cells[1,0] := 'Details';
    Cells[2,0] := 'Cost';
    for chrgInx := 0 to (NoOfExtraCharges - 1) do
    begin
      Cells[0, chrgInx+1] := IntToStr(chrgInx + 1);
      Cells[1, chrgInx+1] := ExtraCharges[chrgInx].Details;
      Cells[2, chrgInx+1] :=
      FloatToStrF(ExtraCharges[chrgInx].Cost, ffFixed, 15,2);
      
    end;
    Self.edtExChrgs.Text := FloatToStrF(CalcExtraChargeCosts, ffFixed, 15, 2);
  end;
end;

procedure TPBEnqSuppRespnsFrm.DisplayPrices;
var
  qtyInx: integer;
begin
  edtRunOn.Visible := ShowRunOn;
  lblRunOn.Visible := ShowRunOn;

  with strgrdPrices, Enquiry.Line do
  begin
    ColCount := NoOfQuantities + 1;
    ColWidths[0] := 150;
    Cells[0,0] := 'Quantities';
    Cells[0,1] := 'Supplier Prices';
    Cells[0,2] := 'Price Unit';
    for qtyInx := 0 to (NoOfQuantities - 1) do
    begin
      Cells[qtyInx+1,0] := FloatToStr(Quantities[qtyInx].Quantity);
      Cells[qtyInx+1,1] := FloatToStrF(PriceGrid[qtyInx, suppInx].SupplierPrice, ffFixed, 15, 2);
      Cells[qtyInx+1,2] := PriceGrid[qtyInx, suppInx].PriceUnitDesc;
    end;
  end;
end;

procedure TPBEnqSuppRespnsFrm.strgrdPricesSelectCell(Sender: TObject;
      ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if ARow = 2 then
  begin
    with cmbbxPriceUnit, Enquiry.Line.PriceGrid[ACol-1, suppInx] do
    begin
      KeyValue := PriceUnit;
      left := cellleft(strgrdPrices, ACol);
      top := celltop(strgrdPrices, ARow);
      width := strgrdPrices.ColWidths[ACol];

      bringtofront;
      Visible := True;
      SetFocus;
    end;
  end;
end;

procedure TPBEnqSuppRespnsFrm.cmbbxPriceUnitClick(Sender: TObject);
begin
  strgrdPrices.Cells[strgrdPrices.Col, 2] := cmbbxPriceUnit.Text;
  cmbbxPriceUnit.Visible := false;
  cmbbxPriceUnit.SendToBack;
end;

function TPBEnqSuppRespnsFrm.cellleft(grid: TStringGrid;
  Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := grid.leftcol to Col-1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  t := t + grid.ColWidths[0] + 4;
  Result := t
end;

function TPBEnqSuppRespnsFrm.celltop(grid: TStringGrid;
  Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t + 2;
end;

procedure TPBEnqSuppRespnsFrm.strgrdPricesSetEditText(Sender: TObject;
  ACol, ARow: Integer; const Value: String);
var
  tempFlt: double;
begin
  case ARow of
    1:
      begin
        try
          tempFlt := StrToFloat(value);
        except
          tempFlt := 0.00;
        end;
        Enquiry.Line.PriceGrid[ACol-1, suppInx].SupplierPrice := tempFlt;
        Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
        Enquiry.DetailsModified := true;
      end;
  end;
end;

procedure TPBEnqSuppRespnsFrm.cmbbxPriceUnitCloseUp(Sender: TObject);
begin
  strgrdPrices.Cells[strgrdPrices.Col, 2] := cmbbxPriceUnit.Text;
  Enquiry.Line.PriceGrid[strgrdPrices.Col-1,suppInx].PriceUnit :=
          PBEnqDM.GetPriceUnitSQL.FieldByName('Price_Unit').AsInteger;

  Enquiry.Line.PriceGrid[strgrdPrices.Col-1,suppInx].PriceUnitDesc :=
          PBEnqDM.GetPriceUnitSQL.FieldByName('Description').AsString;

  Enquiry.Line.PriceGrid[strgrdPrices.Col-1,suppInx].PriceUnitFactor :=
          PBEnqDM.GetPriceUnitSQL.FieldByName('Price_Unit_Factor').AsFloat;

  //prices have been modofied so
  Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
  Enquiry.DetailsModified := true;

  cmbbxPriceUnit.Visible := false;
  cmbbxPriceUnit.SendToBack;
end;

procedure TPBEnqSuppRespnsFrm.mmDelCommChange(Sender: TObject);
begin
  Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.DeliveryComment :=
    mmDelComm.Text;
  if not justDisplaying then
  begin
    Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
    Enquiry.DetailsModified := true;
  end;
end;

procedure TPBEnqSuppRespnsFrm.edtRefChange(Sender: TObject);
begin
  Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.SupplierReference :=
    edtRef.Text;
  if not justDisplaying then
  begin
    Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
    Enquiry.DetailsModified := true;
  end;
end;

procedure TPBEnqSuppRespnsFrm.dtpckrRespDateChange(Sender: TObject);
begin
  Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ActResponseDate :=
    dtpckrRespDate.DateTime;
  if not justDisplaying then
  begin
    Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
    Enquiry.DetailsModified := true;
  end;
end;

procedure TPBEnqSuppRespnsFrm.cmbbxContactClick(Sender: TObject);
begin
  Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.ContactNo :=
    PBEnqDM.qrySelSuppBrnchConts.FieldByName('contact_no').asInteger;
  if not justDisplaying then
  begin
    Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.Modified := true;
    Enquiry.DetailsModified := true;
  end;
end;

procedure TPBEnqSuppRespnsFrm.SetUpSupplierList;
var
  tempInx: integer;
  tempStr: string;
begin
  for tempInx := 0 to (Enquiry.Line.NoOfQuotingSuppliers - 1) do
  begin
    tempStr := Enquiry.Line.QuotingSuppliers[tempInx].Name + ' / ' +
               Enquiry.Line.QuotingSuppliers[tempInx].Branch.Name;
    cmbbxSupplierList.Items.Add(tempStr);
  end;
  cmbbxSupplierList.ItemIndex := suppInx;
end;

procedure TPBEnqSuppRespnsFrm.btnPrevSuppClick(Sender: TObject);
begin
  //justDisplaying is used because we're just changing the supplier that's being
  //displayed, we don't want the onChange event handlers for each edit box etc to
  //set modified & detailsmodified to true on the enquiry object
  justDisplaying := true;
  if suppInx = 0 then
    suppInx := Enquiry.Line.NoOfQuotingSuppliers - 1
  else
    suppInx := suppInx - 1;
  cmbbxSupplierList.ItemIndex := suppInx;
  Self.DisplayDetails;
  justDisplaying := false;
end;

procedure TPBEnqSuppRespnsFrm.DisplayDetails;
begin
  Self.SetUpContactCombo;
  Self.DisplayGeneralDetails;
  Self.DisplayPrices;
  Self.DisplayExCharges;
end;

procedure TPBEnqSuppRespnsFrm.btbtnNextSuppClick(Sender: TObject);
begin
  //justDisplaying is used because we're just changing the supplier that's being
  //displayed, we don't want the onChange event handlers for each edit box etc to
  //set modified & detailsmodified to true on the enquiry object
  justDisplaying := true;
  if suppInx = Enquiry.Line.NoOfQuotingSuppliers - 1 then
    suppInx := 0
  else
    suppInx := suppInx + 1;
  cmbbxSupplierList.ItemIndex := suppInx;
  Self.DisplayDetails;
  justDisplaying := false;
end;

procedure TPBEnqSuppRespnsFrm.ClearForm;
begin
  Self.DisplayDetails;
end;

procedure TPBEnqSuppRespnsFrm.cmbbxSupplierListChange(Sender: TObject);
begin
  justDisplaying := true;
  suppInx := cmbbxSupplierList.ItemIndex;
  Self.DisplayDetails;
  justDisplaying := false;
end;

procedure TPBEnqSuppRespnsFrm.btbtnAddQuantityClick(Sender: TObject);
var
  aLineQuantity: TLineQuantity;
  newQty: double;
  tempStr: string;
  qtyInx: integer;
begin
  tempStr := InputBox('Add Quantity', 'Enter the quantity to add.', '');

  try
    newQty := StrToFloat(tempStr);
  except
    newQty := 0.00;
  end;

  //check to see if qty already exists
  for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
  begin
    if newQty = Enquiry.Line.Quantities[qtyInx].Quantity then
    begin
      //qty already exists so just drop out of procedure
      exit;
    end;
  end;

  if newQty <> 0.00 then
  begin
    //new quantity, create it and put it in in the correct place,
    //quantities are added in ascending order.
    aLineQuantity := TLineQuantity.Create;
    aLineQuantity.Quantity := newQty;
    aLineQuantity.SupplierPrice := 0.00;
    aLineQuantity.QuotePrice := 0.00;
    aLineQuantity.PriceUnit.PriceUnit := 1;
    aLineQuantity.LowestPriceIndex := 0;
    aLineQuantity.NewLineQuantity := true;
    aLineQuantity.Modified := false;
    aLineQuantity.Deleted := false;

    if Enquiry.Line.NoOfQuantities = 0 then
    begin
      //no other quantities so just put new one at the start.
      Enquiry.Line.InsertQuantity(0, aLineQuantity);
      Enquiry.Line.InsertPrices(0);
    end
    else
    begin
      if aLineQuantity.Quantity > Enquiry.Line.Quantities[Enquiry.Line.NoOfQuantities - 1].Quantity then
      begin
        //new one is  bigger than all of the others so stick it at the end
        Enquiry.Line.AddQuantity(aLineQuantity);
        Enquiry.Line.InsertPrices(Enquiry.Line.NoOfQuantities - 1);
      end
      else
      begin
        for qtyInx := 0 to (Enquiry.Line.NoOfQuantities - 1) do
        begin
          if aLineQuantity.Quantity < Enquiry.Line.Quantities[qtyInx].Quantity then
          begin
            //have to loop thru to see where new quantity fits in, some where
            //in the middle.
            Enquiry.Line.InsertQuantity(qtyInx, aLineQuantity);
            Enquiry.Line.InsertPrices(qtyInx);
            break;
          end;
        end;
      end;
    end;
    Self.DisplayPrices;
    Enquiry.DetailsModified := true;
  end;
end;

procedure TPBEnqSuppRespnsFrm.edtRunOnChange(Sender: TObject);
var
  tmpFlt: double;
begin
  try
    tmpFlt := strToFloat(edtRunOn.Text);
  except
    tmpFlt := 0.00;
  end;

  Enquiry.Line.QuotingSuppliers[suppInx].SupplierResponse.RunOnPrice := tmpFlt;
end;

procedure TPBEnqSuppRespnsFrm.edtRunOnKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;}
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
