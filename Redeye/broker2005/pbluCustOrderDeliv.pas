unit pbluCustOrderDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, ccscommon;

type
  TfrmpbluCustOrderdeliv = class(TForm)
    Panel1: TPanel;
    btnDeliveryNotes: TButton;
    btnLabels: TButton;
    btnConfirm: TButton;
    btnClose: TButton;
    dbgDetails: TDBGrid;
    dbgSODetails: TDBGrid;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDeliveryNotesClick(Sender: TObject);
    procedure btnLabelsClick(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure CallPOMaintScreen(sTempFuncMode: Char);
    procedure PrintPODelNote;
    procedure PrintPOLabels;
    procedure PrintSODelNote;
    procedure PrintSOLabels;
    { Private declarations }
  public
    OrderNumber: real;
    OrderType: string;
  end;

var
  frmpbluCustOrderdeliv: TfrmpbluCustOrderdeliv;

implementation

uses pbluDeliveriesDm, PBRSDelivNote, PBRSBoxLabels, PBMaintDeliv,
  STRSBoxLabels, STRSDelivNote;

{$R *.DFM}

procedure TfrmpbluCustOrderdeliv.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustOrderdeliv.FormShow(Sender: TObject);
begin
  dtmdlDeliveries.OrderNumber := OrderNumber;
  if OrderType = 'PO' then
    dtmdlDeliveries.RefreshPOData
  else
    dtmdlDeliveries.RefreshSOData
end;

procedure TfrmpbluCustOrderdeliv.FormCreate(Sender: TObject);
begin
  dtmdlDeliveries := TdtmdlDeliveries.create(self);
end;

procedure TfrmpbluCustOrderdeliv.FormDestroy(Sender: TObject);
begin
  dtmdlDeliveries.free;
end;

procedure TfrmpbluCustOrderdeliv.btnDeliveryNotesClick(Sender: TObject);
begin
  if OrderType = 'PO' then
    PrintPODelNote
  else
    PrintSODelNote;
end;

procedure TfrmpbluCustOrderdeliv.PrintSODelNote;
var
  Reprint: ByteBool;
  iTempSel: integer;
  bTempOK: Bytebool;
begin
  Reprint := false;
  iTempSel := dbgSODetails.datasource.Dataset.fieldbyname('Sales_Order').asinteger;

  if (dbgSODetails.datasource.Dataset.fieldbyname('Sales_Order_Head_Status').asinteger < 50) then
    begin
      messagedlg('Cannot print a Despatch Note, stock has not been allocated to the order.', mtWarning,
      [mbOk], 0);
      exit
    end;

  if (dbgSODetails.datasource.Dataset.fieldbyname('Replenish_Source').asinteger = 1) then
    begin
      messagedlg('Despatch Notes cannot be printed for Direct Supply orders', mtInformation,
      [mbOk], 0);
      exit;
    end;

  STRSDelivNotefrm := TSTRSDelivNotefrm.create(self);
  try
    STRSDelivNotefrm.OrderGroupBox.caption := STRSDelivNotefrm.OrderGroupBox.caption + ' ' + inttoStr(iTempSel);
    STRSDelivNotefrm.Customerlbl.caption := dbgSODetails.datasource.Dataset.fieldbyname('Customer_Name').asstring;
    STRSDelivNotefrm.OrderDateLbl.caption := dbgSODetails.datasource.Dataset.fieldbyname('Date_Ordered').asstring;
    STRSDelivNotefrm.DeliveryDateEdit.text := dbgSODetails.datasource.Dataset.fieldbyname('Date_Required').asstring;
    STRSDelivNotefrm.SONumber := iTempSel;
    STRSDelivNotefrm.DateRequired := dbgSODetails.datasource.Dataset.fieldbyname('Date_Required').asdatetime;
    STRSDelivNotefrm.Reprint := Reprint;
    STRSDelivNotefrm.showmodal;
    bTempOK := STRSDelivNotefrm.bOK;
  finally
    STRSDelivNotefrm.free;
  end;
  if bTempOK then
    begin
      dtmdlDeliveries.RefreshSOData;
      dbgSODetails.datasource.DataSet.locate('Sales_order', Variant(inttostr(itempSel)),[lopartialKey]) ;
    end;
end;

procedure TfrmpbluCustOrderdeliv.PrintPODelNote;
var
  bTempOK: Boolean;
  rTempSel: real;
  iTempLineSel, iTempDelivSel: Integer;
begin
  if dbgDetails.datasource.Dataset.fieldbyname('Delivery_Note_Printed').asstring = 'Y' then
  begin
    if MessageDlg('This Delivery Note has already been printed - Continue?', mtConfirmation,
        [mbNo, mbYes], 0) <> mrYes then
    Exit;
  end;
  PBRSDelivNoteFrm := TPBRSDelivNoteFrm.create(self);

  try
    PBRSDelivNoteFrm.PONumber := dbgDetails.datasource.Dataset.fieldbyname('Purchase_Order').asfloat;
    PBRSDelivNoteFrm.POLine := dbgDetails.datasource.Dataset.fieldbyname('Line').asinteger;
    PBRSDelivNoteFrm.Delivery := dbgDetails.datasource.Dataset.fieldbyname('Delivery_no').asinteger;
    PBRSDelivNoteFrm.CustName := dbgDetails.datasource.Dataset.fieldbyname('Customer_Name').asstring;
    PBRSDelivNoteFrm.Quantity := dbgDetails.datasource.Dataset.fieldbyname('Qty_to_Deliver').asstring;

    {If Delivery Date already exists then show it and confirm delivery}
    if PBDateStr(dbgDetails.datasource.Dataset.fieldbyname('Date_Deliv_Actual').asdatetime) = '' then
      begin
      PBRSDelivNoteFrm.DeliveryDate := PBDateStr(dbgDetails.datasource.Dataset.fieldbyname('Date_Point').asdatetime);
      PBRSDelivNoteFrm.ConfirmChkBox.checked := false;
      end
    else
      begin
      PBRSDelivNoteFrm.DeliveryDate := PBDateStr(dbgDetails.datasource.Dataset.fieldbyname('Date_Deliv_Actual').asdatetime);
      PBRSDelivNoteFrm.ConfirmChkBox.checked := true;
      end;
    PBRSDelivNoteFrm.ActualDeliveryDate := PBDateStr(dbgDetails.datasource.Dataset.fieldbyname('Date_Deliv_Actual').asdatetime);
    PBRSDelivNoteFrm.Description := dbgDetails.datasource.Dataset.fieldbyname('Suppliers_Desc').asstring;
    PBRSDelivNoteFrm.showmodal;
    bTempOK := PBRSDelivNoteFrm.bOK;
    rTempSel := dbgDetails.datasource.dataset.fieldbyname('Purchase_Order').asfloat;
    iTempLineSel := dbgDetails.datasource.dataset.fieldbyname('Line').asinteger;
    iTempDelivSel := dbgDetails.datasource.dataset.fieldbyname('Delivery_no').asinteger;
  finally
    PBRSDelivNoteFrm.free;
  end;

  if bTempOK then
    begin
      dtmdlDeliveries.RefreshPOData;
    dbgDetails.datasource.DataSet.locate('Purchase_order;Line;Delivery_no', VarArrayOf([rtempSel,iTempLineSel,iTempDelivSel]),[lopartialKey]) ;
    end;
end;

procedure TfrmpbluCustOrderdeliv.btnLabelsClick(Sender: TObject);
begin
  if OrderType = 'PO' then
    PrintPOLabels
  else
    PrintSOLabels;
end;

procedure TfrmpbluCustOrderdeliv.PrintSOLabels;
var
  selcode: integer;
begin
  SelCode := dbgSODetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  STRSBoxLabelsFrm := TSTRSBoxLabelsFrm.create(self);

  try
    STRSBoxLabelsFrm.SONumber := selcode;

    {If Delivery Date already exists then show it and confirm delivery}
    if PBDateStr(dbgSODetails.datasource.dataset.fieldbyname('Date_Required').asdatetime) = '' then
      begin
      STRSBoxLabelsFrm.DeliveryDate := PBDateStr(Date);
      end
    else
      begin
      STRSBoxLabelsFrm.DeliveryDate := dbgSODetails.datasource.dataset.fieldbyname('Date_Required').asstring;
      end;
    STRSBoxLabelsFrm.CustomerLbl.Caption := dbgSODetails.datasource.dataset.fieldByname('Customer_Name').AsString;
    STRSBoxLabelsFrm.showmodal;

  finally
    STRSBoxLabelsFrm.free;
  end;
end;

procedure TfrmpbluCustOrderdeliv.PrintPOLabels;
begin
  PBRSBoxLabelsFrm := TPBRSBoxLabelsFrm.create(self);

  try
    PBRSBoxLabelsFrm.PONumber := dbgDetails.datasource.DataSet.fieldbyname('Purchase_Order').asfloat;
    PBRSBoxLabelsFrm.POLine := dbgDetails.datasource.DataSet.fieldbyname('Line').asinteger;
    PBRSBoxLabelsFrm.Delivery := dbgDetails.datasource.DataSet.fieldbyname('Delivery_no').asinteger;
    PBRSBoxLabelsFrm.CustName := dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring;
    PBRSBoxLabelsFrm.Quantity := dbgDetails.datasource.DataSet.fieldbyname('Qty_to_Deliver').asstring;

    {If Delivery Date already exists then show it and confirm delivery}
    if PBDateStr(dbgDetails.datasource.DataSet.fieldbyname('Date_Deliv_Actual').asdatetime) = '' then
      begin
      PBRSBoxLabelsFrm.DeliveryDate := PBDateStr(dbgDetails.datasource.DataSet.fieldbyname('Date_Point').asdatetime);
      end
    else
      begin
      PBRSBoxLabelsFrm.DeliveryDate := PBDateStr(dbgDetails.datasource.DataSet.fieldbyname('Date_Deliv_Actual').asdatetime);
      end;
    PBRSBoxLabelsFrm.Description := dbgDetails.datasource.DataSet.fieldbyname('Suppliers_Desc').asstring;
    PBRSBoxLabelsFrm.BoxQuantity := dbgDetails.datasource.DataSet.fieldbyname('Forms_per_Box').asstring;
    PBRSBoxLabelsFrm.NoOfSets := dbgDetails.datasource.DataSet.fieldbyname('No_of_sets').asstring;
    PBRSBoxLabelsFrm.NoOfBoxes := dbgDetails.datasource.DataSet.fieldbyname('No_of_boxes').asinteger;
    PBRSBoxLabelsFrm.stocked := dbgDetails.datasource.DataSet.fieldbyname('Delivery_to_Stock').asstring;
    PBRSBoxLabelsFrm.showmodal;

  finally
    PBRSBoxLabelsFrm.free;
  end;
end;

procedure TfrmpbluCustOrderdeliv.btnConfirmClick(Sender: TObject);
begin
  CallPOMaintScreen('C');
end;

procedure TfrmpbluCustOrderdeliv.CallPOMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  rTempSel: real;
  iTempLineSel, iTempDelivSel: Integer;
  iFormRef: integer;
  iOrderStatus: integer;
begin
  iOrderStatus := dbgDetails.datasource.dataset.FieldByName('purch_ord_line_Status').asinteger;
  if (iOrderStatus >= 30) then
  begin
    if MessageDlg('This order has been ' +
      dbgDetails.datasource.dataset.FieldByName('Order_Status').AsString +
      ', you cannot change it - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        sTempFuncMode := 'S';
      end
    else
      exit;
  end;

  PBMaintDelivFrm := TPBMaintDelivFrm.Create(Self);
  try
    {Set up the Delivery Line Component}
    PBMaintDelivFrm.BuildDeliveryLine(dbgDetails.datasource.dataset);

    PBMaintDelivFrm.PONumber := dbgDetails.datasource.dataset.fieldbyname('Purchase_Order').asfloat;
    PBMaintDelivFrm.iLine := dbgDetails.datasource.dataset.fieldbyname('Line').asinteger;
    PBMaintDelivFrm.iDelivLine := dbgDetails.datasource.dataset.fieldbyname('Delivery_no').asinteger;

    PBMaintDelivFrm.rOrigOrder := dbgDetails.datasource.dataset.fieldbyname('Original_Order').asfloat;
    PBMaintDelivFrm.iOrigLine := dbgDetails.datasource.dataset.fieldbyname('Original_OrderLine').asinteger;
    PBMaintDelivFrm.OrigOrdQty := dbgDetails.datasource.dataset.fieldbyname('Orig_Ord_Qty').asinteger;

    PBMaintDelivFrm.bNumbered := (dbgDetails.datasource.dataset.fieldbyname('Number_instructions').asstring <> '');

    PBMaintDelivFrm.POrderLbl.caption := 'Purchase Order: '+dbgDetails.datasource.dataset.fieldbyname('Purchase_Order').asstring;
    PBMaintDelivFrm.CustomerLbl.caption := 'Customer: '+dbgDetails.datasource.dataset.fieldbyname('Customer_Name').asstring;

    PBMaintDelivFrm.iCustomer := dbgDetails.datasource.dataset.fieldbyname('Order_Customer').asinteger;
    PBMaintDelivFrm.iBranch := dbgDetails.datasource.dataset.fieldbyname('Customer_Branch').asinteger;
    PBMaintDelivFrm.iFormReference := dbgDetails.datasource.dataset.fieldbyname('Form_Reference').asinteger;
    PBMaintDelivFrm.FuncMode := sTempFuncMode;

    {If this is a call off order}
    if frac(dbgDetails.datasource.dataset.fieldbyname('Purchase_Order').asfloat) <> 0 then
      PBMaintDelivFrm.CallOff := true;

    PBMaintDelivFrm.ShowModal;
    bTempOK := PBMaintDelivFrm.bOK;
    rTempSel := dbgDetails.datasource.dataset.fieldbyname('Purchase_Order').asfloat;
    iTempLineSel := dbgDetails.datasource.dataset.fieldbyname('Line').asinteger;
    iTempDelivSel := dbgDetails.datasource.dataset.fieldbyname('Delivery_no').asinteger;

    iFormRef := PBMaintDelivFrm.iFormReference;
    if bTempOK then
      begin
        PBMaintDelivFrm.SaveDeliveryLine(rTempSel, iTempLineSel, iTempDelivSel);
        {Update the Purchase Order with the Form Reference details}
        if PBMaintDelivFrm.ResetQty then
          PBMaintDelivFrm.ResetOrderQty(rTempSel, iTempLineSel, iTempDelivSel);

        dtmdlDeliveries.SavePurchaseOrderFormRef(rTempSel,iTempLineSel,iFormRef);

        {Update the status on the Purchase Order}
        dtmdlDeliveries.SavePurchaseOrder(rTempSel,iTempLineSel);


        {Update with Stock info}
        if frac(rTempSel) = 0 then
          begin
            PBMaintDelivFrm.SaveDeliveryLocations(rTempSel,iTempLineSel,iTempDelivSel);
            dtmdlDeliveries.UpdateStock(rTempSel,iTempLineSel)
          end
        else
          begin
            PBMaintDelivFrm.SavePickingLocations(rTempSel,iTempLineSel,iTempDelivSel);
            dtmdlDeliveries.UpdateCallOffStock(rTempSel,iTempLineSel); {Call Offs}
          end;
      end;
  finally
    PBMaintDelivFrm.Free;
  end;
  if bTempOK then
  begin
    dtmdlDeliveries.RefreshPOData;
    dbgDetails.datasource.DataSet.locate('Purchase_order;Line;Delivery_no', VarArrayOf([rtempSel,iTempLineSel,iTempDelivSel]),[lopartialKey]) ;
  end;
end;
procedure TfrmpbluCustOrderdeliv.FormActivate(Sender: TObject);
begin
  btnConfirm.visible := (OrderType = 'PO');
  dbgDetails.Align := alclient;
  dbgSODetails.Align := alclient;

  dbgDetails.visible := (OrderType = 'PO');
  dbgSODetails.visible := (OrderType <> 'PO');

(*  if OrderType = 'PO' then
    begin
      dbgDetails.datasource := dtmdlDeliveries.dtsDetails;
    end
  else
    begin
      dbgSODetails.datasource := dtmdlDeliveries.dtsSODetails;
    end;
*)
end;

end.
