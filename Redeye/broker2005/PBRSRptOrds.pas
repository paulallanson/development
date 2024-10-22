unit PBRSRptOrds;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Grids,
  DBGrids, StdCtrls, Buttons, Db, Spin, ExtCtrls, CCSCommon, Menus, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSRptOrdsFrm = class(TForm)
    pnlTop: TPanel;
    AllOrOneRadioGroup: TRadioGroup;
    customerrg: TRadioGroup;
    pnlButton: TPanel;
    CancelBitBtn: TBitBtn;
    dbgDetails: TDBGrid;
    qryLive: TFDQuery;
    dtsrcLive: TDataSource;
    PopupMenu1: TPopupMenu;
    ResetGrid1: TMenuItem;
    cmbbxOrderBy1: TComboBox;
    lblOrderBy1: TLabel;
    qryBaseSQL: TFDQuery;
    btbtnRepeat: TBitBtn;
    btbtnChange: TBitBtn;
    Label1: TLabel;
    cmbbxOrderBy2: TComboBox;
    Label2: TLabel;
    UpDown1: TUpDown;
    edtDueDays: TEdit;
    Label3: TLabel;
    qryLivepurchase_order: TFloatField;
    qryLiveline: TIntegerField;
    qryLivecust_order_no: TWideStringField;
    qryLivecustomer: TIntegerField;
    qryLivebranch_no: TIntegerField;
    qryLivecustomers_desc: TWideStringField;
    qryLiveQuantity: TFloatField;
    qryLiveselling_price: TCurrencyField;
    qryLivesell_unit: TWideStringField;
    qryLiveorder_price: TCurrencyField;
    qryLiveorder_unit: TWideStringField;
    qryLiveoriginal_order: TFloatField;
    qryLiverepName: TWideStringField;
    qryLiveCustName: TWideStringField;
    qryLiveexpDate: TDateTimeField;
    qryLiveexpLife: TDateTimeField;
    qryLiveForm_Reference_ID: TWideStringField;
    qryLiveForm_Reference_Descr: TWideStringField;
    qryLiveDate_Point: TDateTimeField;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    StatusBar1: TStatusBar;
    grpbxReps: TGroupBox;
    lblRep: TLabel;
    edtRep: TEdit;
    LUSuppSpeedButton: TSpeedButton;
    grpbxCustomers: TGroupBox;
    Customerlbl: TLabel;
    CustEdit: TEdit;
    LUCustSpeedButton: TSpeedButton;
    qryLiveOrder_Status: TIntegerField;
    qryLiveStatus_Description: TWideStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ResetGrid1Click(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure customerrgClick(Sender: TObject);
    procedure LUCustSpeedButtonClick(Sender: TObject);
    procedure LUSuppSpeedButtonClick(Sender: TObject);
    procedure cmbbxOrderBy1Change(Sender: TObject);
    procedure btbtnRepeatClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btbtnChangeClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtDueDaysExit(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    dontSaveLayout: boolean;
    procedure ShowGrid;
    procedure SelectCode(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: Char);
    procedure FindInGrid(rTempSel: real; iTempSelLine: integer);
  public
    { Public declarations }
    SelCustomer, SelCustBranch, RepCode: Integer;
    SelCustName, RepText: string;
    selCode: real;
    selLine: integer;
    selected, bIs_Lookup: boolean;
  end;

var
  PBRSRptOrdsFrm: TPBRSRptOrdsFrm;
  rLastOrder: real;

implementation

uses
  System.UITypes,
  PBLUCust, PBLURep, pbDatabase, PBMaintPOrd, PBPOObjects, PBRPRptOrds,
  pbOrdersDm, pbMainMenu;

{$R *.DFM}

procedure TPBRSRptOrdsFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Self.dontSaveLayout then
  begin
    //dont do anything
  end
  else
  begin
    CCSCommon.SaveDBGridCols('', 'RepeatOrdRpt Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
    CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  end;
  self.qryLive.close;
end;

procedure TPBRSRptOrdsFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  dtmdlOrders := TdtmdlOrders.Create(Self);
  self.RepCode := -1;
  self.SelCustomer := -1;
  self.SelCustBranch := -1;
  CCSCommon.SetDBGridCols('', 'RepeatOrdRpt Col Order', frmPBMainMenu.AppIniFile, self.dbgDetails);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBRSRptOrdsFrm.FormShow(Sender: TObject);
begin
  self.cmbbxOrderBy1.ItemIndex := 0;
  self.showGrid;                                                      
end;

procedure TPBRSRptOrdsFrm.ResetGrid1Click(Sender: TObject);
begin
  CCSCommon.DeleteColSettings('RepeatOrdRpt Col Order', frmPBMainMenu.AppIniFile);
  Self.dontSaveLayout := true;
  self.Close;
end;

procedure TPBRSRptOrdsFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    lblRep.Visible := False;
    edtRep.Visible := False;
    LUSuppSpeedButton.Visible := False;
    edtRep.Text := '';
    self.RepCode := -1;
    self.ShowGrid;
  end
  else
  begin
    grpbxReps.visible := True;
    lblRep.Visible := True;
    edtRep.Visible := True;
    LUSuppSpeedButton.Visible := True;
  end;

end;

procedure TPBRSRptOrdsFrm.customerrgClick(Sender: TObject);
begin
  if customerrg.ItemIndex = 0 then
  begin
    Customerlbl.Visible := False;
    CustEdit.Visible := False;
    LUCustSpeedButton.Visible := False;
    CustEdit.Text := '';
    self.SelCustomer := -1;
    self.SelCustBranch := -1;
    self.ShowGrid;
  end
  else
  begin
    grpbxCustomers.visible := True;
    Customerlbl.Visible := True;
    CustEdit.Visible := True;
    LUCustSpeedButton.Visible := True;
    //DispCustBranch(Self);
  end;
end;

procedure TPBRSRptOrdsFrm.LUCustSpeedButtonClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  PBLUCustFrm.bIs_Lookup := True;
  PBLUCustFrm.bAllow_Upd := False;
  PBLUCustFrm.SelCode := SelCustomer;
  PBLUCustFrm.SelBranch := SelCustBranch;
  PBLUCustFrm.bSel_Branch := True;
  PBLUCustFrm.ShowModal;
  begin
    SelCustomer := PBLUCustFrm.SelCode;
    SelCustBranch := PBLUCustFrm.SelBranch;
    SelCustName := PBLUCustFrm.SelName;

    if SelCustomer <> 0 then
      CustEdit.Text := SelCustName
    else
      CustEdit.Text := '';
  end;
  PBLUCustFrm.Free;
  ShowGrid;
end;

procedure TPBRSRptOrdsFrm.LUSuppSpeedButtonClick(Sender: TObject);
begin
  {Lookup a rep}
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := True;
    PBLURepFrm.SelCode := RepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      RepCode := PBLURepFrm.SelCode;
      RepText := PBLURepFrm.SelName;

      self.edtRep.Text := RepText;
    end;
  finally
    PBLURepFrm.Free;
  end;
  ShowGrid;
end;

procedure TPBRSRptOrdsFrm.ShowGrid;
var
  tempStr: string;
begin
  self.qryLive.close;
  self.qryLive.SQL.Text := self.qryBaseSQL.SQL.Text;

  if self.SelCustomer <> -1 then
  begin
    self.qryLive.SQL.Add(' and (purchase_orderline.customer = ' + IntToStr(self.SelCustomer) + ')');
  end;

  if self.RepCode <> -1 then
  begin
    self.qryLive.SQL.Add(' and (purchase_orderline.rep = ' + IntToStr(self.RepCode) + ')');
  end;

  if (self.edtDueDays.text <> '0')
    and (self.edtDueDays.text <> '') then
  begin
    tempStr := self.edtDueDays.Text;
    if dmBroker.IsSQL then
    begin
      self.qryLive.SQL.Add(' and ( (dateadd(day, purchase_orderline.expected_life, cast(purchase_orderline.Goods_reqd_by_customer as datetime2))) - (getDate()) < '+ tempStr +'  )');
      self.qryLive.SQL.Add(' and ( (getDate() - (dateadd(day, purchase_orderline.expected_life, cast(purchase_orderline.Goods_reqd_by_customer as datetime2))))  < 0)');
    end
    else
    begin
      self.qryLive.SQL.Add(' and ( (purchase_orderline.Goods_reqd_by_customer + purchase_orderline.expected_life) - (Date()) < '+ tempStr +'  )');
      self.qryLive.SQL.Add(' and ( (Date() - (purchase_orderline.Goods_reqd_by_customer + purchase_orderline.expected_life))  < 0)');
    end;
  end;

  case self.cmbbxOrderBy1.ItemIndex of
    0: self.qryLive.SQL.Add(' order by rep.Name ');
    1: self.qryLive.SQL.Add(' order by customer.name ');
    2:
    begin
      if dmBroker.IsSQL then
        self.qryLive.SQL.Add(' order by (getDate() - (dateadd(day, purchase_orderline.expected_life, cast(purchase_orderline.Goods_reqd_by_customer as datetime2)))) ')
      else
        self.qryLive.SQL.Add(' order by (Date() - (purchase_orderline.Goods_reqd_by_customer + purchase_orderline.expected_life)) ');
    end;
  end;

  case self.cmbbxOrderBy2.ItemIndex of
    0: self.qryLive.SQL.Add(' , rep.Name ');
    1: self.qryLive.SQL.Add(' , customer.name ');
    2:
    begin
      if dmBroker.IsSQL then
        self.qryLive.SQL.Add(' , (getDate() - (dateadd(day, purchase_orderline.expected_life, cast(purchase_orderline.Goods_reqd_by_customer as datetime2)))) ')
      else
        self.qryLive.SQL.Add(' , (Date() - (purchase_orderline.Goods_reqd_by_customer + purchase_orderline.expected_life)) ');
    end;
  end;

  self.qryLive.open;
end;

procedure TPBRSRptOrdsFrm.cmbbxOrderBy1Change(Sender: TObject);
begin
  if self.cmbbxOrderBy1.ItemIndex = self.cmbbxOrderBy2.ItemIndex then
  begin
    self.cmbbxOrderBy2.ItemIndex := -1;
  end;
  self.ShowGrid;
end;

procedure TPBRSRptOrdsFrm.btbtnRepeatClick(Sender: TObject);
begin
//  SelectCode(Self);
  CallMaintScreen('M');
end;

procedure TPBRSRptOrdsFrm.FormDestroy(Sender: TObject);
begin
  dtmdlOrders.Free;
end;

procedure TPBRSRptOrdsFrm.SelectCode(Sender: TObject);
begin
(*  SelCode := self.qryLive.FieldByName('purchase_order').asFloat;
  SelLine := self.qryLive.FieldByName('line').asInteger;
  with dtmdlOrders.SelectedSQL do
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

procedure TPBRSRptOrdsFrm.CallMaintScreen(sTempFuncMode: Char);
var
  bTempOK: Boolean;
  rTempSel: real;
  iPOrdHeadStatus: Integer;
begin
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Purchase_Order').asfloat;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;

  iPOrdHeadStatus := dbgDetails.datasource.DataSet.FieldByName('Order_status').AsInteger;

  {Check whether the Purchase Order has been included in a invoice Period End}
  if dtmdlOrders.PeriodEndRun('PO',dbgDetails.datasource.dataset.FieldByName('Purchase_order').Asinteger,selline) and
                        (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
    begin
    if MessageDlg('This order has been included in a Period end, the cost and sales values cannot be modified' +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
    sTempFuncMode := 'T';
    end
  else
  if (iPOrdHeadStatus > 10) and (sTempFuncMode = 'C') and (dmBroker.iAccCtrlMenu = 1) then
  begin
    if MessageDlg('This order has been ' +
      dbgDetails.datasource.dataset.FieldByName('Status_Description').AsString +
      ' - Continue?', mtConfirmation, [mbNo, mbYes], 0) <> mrYes then
      Exit;
  end;

  PBMaintPOrdfrm := TPBMaintPOrdfrm.Create(Self);
  try
    PBMaintPOrdfrm.FuncMode := sTempFuncMode;
    PBMaintPOrdfrm.PurchaseOrderNo := SelCode;
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
    dtmdlOrders.Refreshdata;
    if sTempFuncMode <> 'D' then
    begin
      dbgDetails.datasource.DataSet.locate('purchase_order', Variant(floattostr(rTempSel)),[lopartialKey]) ;
    end;
  end;
(*
  if bTempOK then
  begin
    ShowGrid;
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(rTempSel,1);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
*)
end;

procedure TPBRSRptOrdsFrm.FindInGrid(rTempSel: real;
  iTempSelLine: integer);
begin
(*  DetsDBGrid.DataSource := dmLookUpPOrd.NullSRC;
  {Find the item you just changed}
  with self.qryLive do
  begin
    First;
    if rTempSel <> 0 then
    begin
      while (not EOF) do
        begin
           if (FieldByName('Purchase_Order').asfloat = rTempSel) and
              (FieldByName('Line').AsInteger = iTempSelLine) then
              break;
           Next;
        end;
    end;
  end;
*)
end;

procedure TPBRSRptOrdsFrm.btbtnChangeClick(Sender: TObject);
begin
  SelectCode(Self);
  CallMaintScreen('C');
end;

procedure TPBRSRptOrdsFrm.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ((self.dbgDetails.DataSource.DataSet.FieldByName('expLife').asFloat - trunc(Now()))* -1) > 0 then
  begin
    self.dbgDetails.Canvas.Font.Color := clRed;
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TPBRSRptOrdsFrm.edtDueDaysExit(Sender: TObject);
begin
  self.ShowGrid;
end;

procedure TPBRSRptOrdsFrm.UpDown1Click(Sender: TObject;
  Button: TUDBtnType);
begin
  self.ShowGrid;
end;

procedure TPBRSRptOrdsFrm.PrintBitBtnClick(Sender: TObject);
var
  PBRPRptOrdsFrm: TPBRPRptOrdsFrm;
begin
  PBRPRptOrdsFrm := TPBRPRptOrdsFrm.create(self);
  try
    case cmbbxOrderBy1.ItemIndex of
      0: PBRPRptOrdsFrm.groupField := 'repName';
      1: PBRPRptOrdsFrm.groupField := 'custName';
      2: PBRPRptOrdsFrm.groupField := 'expDate';
    end;
    PBRPRptOrdsFrm.QuickReport.Print;
  finally
    PBRPRptOrdsFrm.Free;
  end;
end;

procedure TPBRSRptOrdsFrm.PreviewBitBtnClick(Sender: TObject);
var
  PBRPRptOrdsFrm: TPBRPRptOrdsFrm;
begin
  PBRPRptOrdsFrm := TPBRPRptOrdsFrm.create(self);
  try
    case cmbbxOrderBy1.ItemIndex of
      0: PBRPRptOrdsFrm.groupField := 'repName';
      1: PBRPRptOrdsFrm.groupField := 'custName';
      2: PBRPRptOrdsFrm.groupField := 'expDate';
    end;
    PBRPRptOrdsFrm.QuickReport.Preview;
  finally
    PBRPRptOrdsFrm.Free;
  end;
end;

end.
