unit PBLUStkHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Menus, pbFormReferenceDM;

type
  TPBLUStkHistoryfrm = class(TForm)
    Panel1: TPanel;
    detsDBGrid: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    edtStockRef: TEdit;
    edtFormDescr: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtCustomerName: TEdit;
    memoReorder: TMemo;
    memoStock: TMemo;
    Panel3: TPanel;
    CancelBitBtn: TBitBtn;
    RepeatBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DeliveryBitBtn: TBitBtn;
    pMnuStock: TPopupMenu;
    Repeat1: TMenuItem;
    Change1: TMenuItem;
    Delivery1: TMenuItem;
    Close1: TMenuItem;
    Close2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure RepeatBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DeliveryBitBtnClick(Sender: TObject);
    procedure detsDBGridDblClick(Sender: TObject);
    procedure detsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    dtmdlAllForms: TdtmdlForms;
    FActivated: boolean;
    iPOrdHeadStatus: Integer;
    procedure ShowGrid;
(*    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure CallMaintDelivScreen(sTempFuncMode: Char);
    procedure FindInGrid(rTempSel: real; iTempSelLine, iTempSelDeliv: integer);
*)
  public
    { Public declarations }
    SelCode: real;
    SelLine: Integer;
    iFormRef: integer;
    iCust, iBranch: integer;
    Selected: boolean;
  end;

var
  PBLUStkHistoryfrm: TPBLUStkHistoryfrm;
  rLastOrder: real;

implementation

uses PBMaintPOrd, PBPODataMod, PBMaintDeliv;

{$R *.DFM}

procedure TPBLUStkHistoryfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then { I shall say thees only wonce }
  begin
    DetsDBGrid.DataSource := dtmdlAllForms.dtsHistory;
    FActivated := true;
    ShowGrid;
  end;
end;

(*procedure TPBLUStkHistoryfrm.CallMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  rTempSel: real;
begin
  if (iPOrdHeadStatus > 10) and (sTempFuncMode = 'C') then
  begin
    if MessageDlg('This order has been ' +
      dmLookUpPOrd.SelectedSQL.FieldByName('Status_Descr').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;
  {Call NEW Purchase Order Maintenance}
  PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
  try
    PBMaintPOrdfrm.FuncMode := sTempFuncMode;
    PurchaseOrder.POHeadStatus := iPOrdHeadStatus;
    PBMaintPOrdfrm.SetupDetails(Self);
    PBMaintPOrdfrm.ShowModal;
    bTempOK := PBMaintPOrdfrm.bOK;
    rTempSel := PurchaseOrder.PONumber;
  finally
    PBMaintPOrdfrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid;
    FindInGrid(rTempSel,1,1);
  end;
end;

*)
procedure TPBLUStkHistoryfrm.RepeatBitBtnClick(Sender: TObject);
begin
(*  SelectCode(Self);
  CallMaintScreen('M');
*)
end;

procedure TPBLUStkHistoryfrm.SelectCode(Sender: TObject);
begin
(*  SelCode := dtmdlAllForms.dtsHistory.DataSet.FieldByName('Purchase_Order').asfloat;
  SelLine := dtmdlAllForms.dtsHistory.DataSet.FieldByName('Line').AsInteger;
  with dmLookUpPOrd.SelectedSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := SelCode;
    Open;
    First;
  end;
  with dmLookUpPOrd.GetContactSQL do
  begin
    Close;
    ParamByName('Contact_No').AsInteger :=
      dmLookUpPOrd.SelectedSQL.FieldByName('Contact_No').AsInteger;
    ParamByName('Supplier').AsInteger :=
      dmLookUpPOrd.SelectedSQL.FieldByName('Supplier').AsInteger;
    ParamByName('Branch_No').AsInteger :=
      dmLookUpPOrd.SelectedSQL.FieldByName('Branch_No').AsInteger;
    Open;
    First;
  end;
  Selected := True;
  iPOrdHeadStatus :=
    dmLookUpPOrd.SelectedSQl.FieldByName('Purch_Ord_Head_Status').AsInteger;
*)
end;

procedure TPBLUStkHistoryfrm.FormCreate(Sender: TObject);
begin
  dtmdlAllForms := TdtmdlForms.Create(self);
//  dmLookUpPOrd := TdmLookUpPOrd.create(self);
end;

procedure TPBLUStkHistoryfrm.FormDestroy(Sender: TObject);
begin
//  dmLookUpPOrd.free;
end;

procedure TPBLUStkHistoryfrm.ChgBitBtnClick(Sender: TObject);
begin
(*  SelectCode(Self);
  CallMaintScreen('C');
*)
end;

procedure TPBLUStkHistoryfrm.ShowGrid;
begin
  with dtmdlAllForms do
  begin
    RefreshStock(iFormRef);
    dtsHistory.DataSet.Open;
    ChgBitBtn.Enabled := dtsHistory.DataSet.RecordCount > 0;
    DetsDBGrid.selectedRows.CurrentRowSelected := dtsHistory.DataSet.Recordcount > 0 ;
    memostock.text := inttoStr(GetTotalStock(iFormRef));
  end;
end;

(*procedure TPBLUStkHistoryfrm.FindInGrid(rTempSel: real; iTempSelLine, iTempSelDeliv: integer);
begin
  DetsDBGrid.DataSource := dtmdlAllForms.dtsNull;
  {Find the item you just changed}
  with dtmdlAllForms.dtsHistory.DataSet do
  begin
    First;
    if rTempSel <> 0 then
    begin
      while (not EOF) do
        begin
           if (FieldByName('Purchase_Order').asfloat = rTempSel) and
              (FieldByName('Line').AsInteger = iTempSelLine) and
              (FieldByName('Delivery_no').AsInteger = iTempSelDeliv) then
              break;
           Next;
        end;
    end;
    if not EOF then
       rLastOrder := dtmdlAllForms.GetFormHistSQl.fieldbyname('Purchase_Order').asfloat;
  end;

  DetsDBGrid.DataSource := dtmdlAllForms.dtsHistory;
end;
*)
procedure TPBLUStkHistoryfrm.DeliveryBitBtnClick(Sender: TObject);
begin
(*  SelectCode(Self);
  CallMaintDelivScreen('C');
*)
end;

(*
procedure TPBLUStkHistoryfrm.CallMaintDelivScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  rTempSel: real;
  iTempLineSel, iTempDelivSel: Integer;
  iFormRef: integer;
begin
  sTempFuncMode := 'C';
  if (dtmdlAllForms.dtsHistory.DataSet.FieldByName('Purch_Ord_line_Status').AsInteger >= 30) then
  begin
    if MessageDlg('This order has been ' +
      dtmdlAllForms.dtsHistory.dataset.FieldByName('Order_Status').AsString +
      ', you cannot change it - Continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        sTempFuncMode := 'S';
      end
    else
      exit;
  end;
  PBPODM := TPBPODM.Create(Self);
  dmLookUpDeliv := TdmLookUpDeliv.create(self);

  PBMaintDelivFrm := TPBMaintDelivFrm.Create(Self);
  try
    {Set up the Delivery Line Component}
    PBMaintDelivFrm.BuildDeliveryLine(dtmdlAllForms.dtsHistorydataset);

    PBMaintDelivFrm.PONumber := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Purchase_Order').asfloat;
    PBMaintDelivFrm.iLine := dtmdlAllForms.dtsHistory.fieldbyname('Line').asinteger;
    PBMaintDelivFrm.iDelivLine := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Delivery_no').asinteger;

    PBMaintDelivFrm.rOrigOrder := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Original_Order').asfloat;
    PBMaintDelivFrm.iOrigLine := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Original_OrderLine').asinteger;

    PBMaintDelivFrm.POrderLbl.caption := 'Purchase Order: '+dtmdlAllForms.dtsHistory.dataset.fieldbyname('Purchase_Order').asstring;
    PBMaintDelivFrm.CustomerLbl.caption := 'Customer: '+dtmdlAllForms.dtsHistory.dataset.fieldbyname('Customer_Name').asstring;

    PBMaintDelivFrm.iCustomer := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Order_Customer').asinteger;
    PBMaintDelivFrm.iBranch := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Customer_Branch').asinteger;
    PBMaintDelivFrm.iFormReference := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Form_Reference').asinteger;
    PBMaintDelivFrm.FuncMode := sTempFuncMode;

    {If this is a call off order}
    if frac(dtmdlAllForms.dtsHistory.dataset.fieldbyname('Purchase_Order').asfloat) <> 0 then
      PBMaintDelivFrm.CallOff := true;

    PBMaintDelivFrm.ShowModal;
    bTempOK := PBMaintDelivFrm.bOK;
    rTempSel := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Purchase_Order').asfloat;
    iTempLineSel := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Line').asinteger;
    iTempDelivSel := dtmdlAllForms.dtsHistory.dataset.fieldbyname('Delivery_no').asinteger;

    iFormRef := PBMaintDelivFrm.iFormReference;
    if bTempOK then
      begin
        PBMaintDelivFrm.SaveDeliveryLine(rTempSel,iTempLineSel,iTempDelivSel);
        {Update the Purchase Order with the Form Reference details}
        dmLookupDeliv.SavePurchaseOrderFormRef(rTempSel,iTempLineSel,iFormRef);

        {Update the status on the Purchase Order}
        dmLookupDeliv.SavePurchaseOrder(rTempSel,iTempLineSel);

        {Update with Stock info}
        if frac(rTempSel) = 0 then
          begin
            PBMaintDelivFrm.SaveDeliveryLocations(rTempSel,iTempLineSel,iTempDelivSel);
            dmLookupDeliv.UpdateStock(rTempSel,iTempLineSel)
          end
        else
          begin
            PBMaintDelivFrm.SavePickingLocations(rTempSel,iTempLineSel,iTempDelivSel);
            dmLookupDeliv.UpdateCallOffStock(rTempSel,iTempLineSel); {Call Offs}
          end;
      end;
  finally
    PBMaintDelivFrm.Free;
    PBPODM.free;
    dmLookUpDeliv.free;
  end;
  if bTempOK then
  begin
    ShowGrid;
    FindInGrid(rTempSel,iTempLineSel, iTempDelivSel);
  end;
end;
*)
procedure TPBLUStkHistoryfrm.detsDBGridDblClick(Sender: TObject);
begin
//  ChgBitBtnClick(self);
end;

procedure TPBLUStkHistoryfrm.detsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  TempRect: TRect;
  Txt: array [0..255] of Char;
  sValue, sTemp: string;
begin
  sTemp := (Sender as TDBGRid).fields[datacol].text;

  TempRect := Rect;
  if detsDBGrid.datasource.dataset.fieldbyname('Inactive').asstring = 'Y' then
    (Sender as TDBGrid).Canvas.font.Color := clRed;

  if  (Column.Title.Caption <> 'Order No') and
      (Column.Title.Caption <> 'Qty to Deliver') and
      (Column.Title.Caption <> 'Move In') and
      (Column.Title.Caption <> 'Move Out')then
  	begin
  		StrPCopy(txt, sTemp);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
    		WITH Sender AS TDBGrid DO
      		BEGIN
           	if  (Column.Title.Caption <> 'Order No') and
                (Column.Title.Caption <> 'Qty to Deliver') and
                (Column.Title.Caption <> 'Move In') and
                (Column.Title.Caption <> 'Move Out') then
              	begin
        			Canvas.Brush.Color := Color;
        			Canvas.Font.Color  := Font.Color;
        			Canvas.TextRect(Rect, Rect.Left+2, Rect.Top+2,sTemp);
                 end;
      		END;
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Qty to Deliver') or
          (Column.Title.Caption = 'Move In') or
          (Column.Title.Caption = 'Move Out') then
        try
          sValue := formatfloat('######0;(######0)',strtofloat(sTemp))
        except
          sValue := ''
        end
      else
        sValue := sTemp;
  		StrPCopy(Txt, sValue);

  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;

end;

end.
