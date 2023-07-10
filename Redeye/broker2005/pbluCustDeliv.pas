unit pbluCustDeliv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, ccscommon, Variants;

type
  TfrmpbluOrderdeliv = class(TForm)
    Panel1: TPanel;
    btnDeliveryNotes: TButton;
    btnLabels: TButton;
    btnChange: TButton;
    btnClose: TButton;
    dbgDetails: TDBGrid;
    dbgSODetails: TDBGrid;
    btnBoxLabels: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDeliveryNotesClick(Sender: TObject);
    procedure btnLabelsClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBoxLabelsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgSODetailsDblClick(Sender: TObject);
  private
    FOrderType: string;
    FCanConfirm: boolean;
    procedure CallPOMaintScreen(sTempFuncMode: Char);
    procedure CallSOMaintScreen(sTempFuncMode: Char);
    procedure PrintPODelNote;
    procedure PrintPOLabels;
    procedure PrintSODelNote;
    procedure PrintSOLabels;
    procedure SetOrderType(const Value: string);
    procedure SetCanConfirm(const Value: boolean);
    { Private declarations }
  public
    OrderNumber: real;
    property CanConfirm: boolean read FCanConfirm write SetCanConfirm;
    property OrderType: string read FOrderType write SetOrderType;
  end;

var
  frmpbluOrderdeliv: TfrmpbluOrderdeliv;

implementation

uses pbluDeliveriesDm, PBRSDelivNote, PBRSBoxLabels, PBMaintDeliv,
  STRSBoxLabels, STRSDelivNote, STRSBoxLabelsDeliv, STMaintSOrdDel,
  pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TfrmpbluOrderdeliv.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluOrderdeliv.FormShow(Sender: TObject);
begin
  dtmdlDeliveries.OrderNumber := OrderNumber;
  if OrderType = 'PO' then
    dtmdlDeliveries.RefreshPOData
  else
    dtmdlDeliveries.RefreshSOData
end;

procedure TfrmpbluOrderdeliv.FormCreate(Sender: TObject);
begin
  dtmdlDeliveries := TdtmdlDeliveries.create(self);
  if (OrderType = 'PO') then
    dmBroker.ScreenAccessControl(Self,'mnuProduction',frmPBMainMenu.iOperator,0,0);
  CanConfirm := true;
end;

procedure TfrmpbluOrderdeliv.FormDestroy(Sender: TObject);
begin
  dtmdlDeliveries.free;
end;

procedure TfrmpbluOrderdeliv.btnDeliveryNotesClick(Sender: TObject);
begin
  if OrderType = 'PO' then
    PrintPODelNote
  else
    PrintSODelNote;
end;

procedure TfrmpbluOrderdeliv.PrintSODelNote;
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

procedure TfrmpbluOrderdeliv.PrintPODelNote;
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

procedure TfrmpbluOrderdeliv.btnLabelsClick(Sender: TObject);
begin
  if OrderType = 'PO' then
    PrintPOLabels
  else
    PrintSOLabels;
end;

procedure TfrmpbluOrderdeliv.PrintSOLabels;
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

procedure TfrmpbluOrderdeliv.PrintPOLabels;
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

procedure TfrmpbluOrderdeliv.btnChangeClick(Sender: TObject);
begin
  if OrderType = 'PO' then
    CallPOMaintScreen('C')
  else
    CallSOMaintScreen('C')
end;

procedure TfrmpbluOrderdeliv.CallPOMaintScreen(sTempFuncMode: Char);
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
      if not frmPBMainMenu.UseStockSystem then
        begin
          if MessageDlg('This order has been ' +
            dbgDetails.datasource.dataset.FieldByName('Order_Status').AsString +
            ', only certain data can be changed - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              sTempFuncMode := 'T';
            end
          else
            exit;
        end
      else if (dbgDetails.datasource.dataset.FieldByName('Ready_to_invoice').asstring <> 'Y') then
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

    PBMaintDelivFrm.CourierCode := dbgDetails.datasource.dataset.fieldbyname('Supplier_Courier').asinteger;
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
            if PBMaintDelivFrm.DeliveryToStock = 'Y' then
              dtmdlDeliveries.SavePOInvoiceupfront(rTempSel,iTempLineSel,PBMaintDelivFrm.InvoiceUpfront);
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

procedure TfrmpbluOrderdeliv.CallSOMaintScreen(sTempFuncMode: Char);
var
  rTempSel: real;
  iTempDelivSel: Integer;
begin
  rtempSel := dbgSODetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
  iTempDelivSel := dbgSODetails.datasource.dataset.fieldbyname('Sales_Order_delivery_no').asinteger;

  STMaintSOrdDelFrm := TSTMaintSOrdDelFrm.create(self);
  try
    STMaintSOrdDelFrm.SalesOrder := dbgSODetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;
    STMaintSOrdDelFrm.DeliveryNo := dbgSODetails.datasource.dataset.fieldbyname('Sales_Order_delivery_no').asinteger;
    STMaintSOrdDelFrm.showmodal;
    if STMaintSOrdDelFrm.bOK then
  begin
    dtmdlDeliveries.RefreshSOData;
    dbgSODetails.datasource.DataSet.locate('Sales_order;Sales_Order_Delivery_no', VarArrayOf([rtempSel,iTempDelivSel]),[lopartialKey]) ;
  end;
  finally
    STMaintSOrdDelFrm.free;
  end;
end;

procedure TfrmpbluOrderdeliv.FormActivate(Sender: TObject);
begin
//  btnConfirm.visible := (OrderType = 'PO');
  btnBoxLabels.visible := (OrderType <> 'PO');
  dbgDetails.Align := alclient;
  dbgSODetails.Align := alclient;

  dbgDetails.visible := (OrderType = 'PO');
  dbgSODetails.visible := (OrderType <> 'PO');

  btnChange.visible := CanConfirm;

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

procedure TfrmpbluOrderdeliv.btnBoxLabelsClick(Sender: TObject);
var
  selcode: integer;
begin
  SelCode := dbgSODetails.datasource.dataset.fieldbyname('Sales_Order').asinteger;

  STRSBoxLabelsDelivFrm := TSTRSBoxLabelsDelivFrm.create(self);
  try
    STRSBoxLabelsDelivFrm.SONumber := SelCode;

    STRSBoxLabelsDelivFrm.lblDeliveryTo.caption := dbgSODetails.datasource.dataset.fieldbyname('DeliveryName').asstring;
    STRSBoxLabelsDelivFrm.lblCustomer.caption := dbgSODetails.datasource.dataset.fieldByname('Customer_Name').AsString + '/'
                                              + dbgSODetails.datasource.dataset.fieldbyname('Branch_Name').asstring;
    STRSBoxLabelsDelivFrm.lblOrderDate.caption := pbdatestr(dbgSODetails.datasource.dataset.fieldbyname('Date_Ordered').asstring);
    STRSBoxLabelsDelivFrm.lblCustomerRef.caption := dbgSODetails.datasource.dataset.fieldbyname('Cust_Order_No').asstring;
    STRSBoxLabelsDelivFrm.DeliveryDateEdit.text := pbdatestr(dbgSODetails.datasource.dataset.fieldbyname('Delivery_Date').asstring);
    STRSBoxLabelsDelivFrm.spnNoBoxes.value := dbgSODetails.datasource.dataset.fieldbyname('No_of_Boxes').asinteger;
    STRSBoxLabelsDelivFrm.showmodal;

  finally
    STRSBoxLabelsDelivFrm.free;
  end;


end;

procedure TfrmpbluOrderdeliv.SetOrderType(const Value: string);
begin
  FOrderType := Value;
  if FOrderType <> 'PO' then
    btnChange.Caption := 'Details';
end;

procedure TfrmpbluOrderdeliv.SetCanConfirm(const Value: boolean);
begin
  FCanConfirm := Value;
end;

procedure TfrmpbluOrderdeliv.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmpbluOrderdeliv.dbgSODetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

end.
