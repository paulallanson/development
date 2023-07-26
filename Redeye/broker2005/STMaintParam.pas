unit STMaintParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, DBCtrls, Buttons, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintParamFrm = class(TForm)
    SeqNoGroupBox: TGroupBox;
    Label1: TLabel;
    PONoSpinEdit: TSpinEdit;
    Label2: TLabel;
    SoNoSpinEdit: TSpinEdit;
    ReplGroupBox: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    POPercMemo: TMemo;
    SOPercMemo: TMemo;
    Label5: TLabel;
    WhouseDBLookupComboBox: TDBLookupComboBox;
    Label6: TLabel;
    PickRefEdit: TEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    SearchTimerSpinEdit: TSpinEdit;
    ProdLUGridGroupBox: TGroupBox;
    DescrCheckBox: TCheckBox;
    GroupCheckBox: TCheckBox;
    CostCatCheckBox: TCheckBox;
    CostListCheckBox: TCheckBox;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdCompSQL: TFDQuery;
    SOrdLbl: TLabel;
    SOPNoSpinEdit: TSpinEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    DBLUcmbPriceUnit: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    ChkBxStkSystm: TCheckBox;
    LblCour: TLabel;
    DBLUCmbBXCourier: TDBLookupComboBox;
    btbtnClearCourier: TBitBtn;
    chkbxOverPicking: TCheckBox;
    chkbxAutoAllocate: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure EnterValueField(Sender: TObject);
    procedure ExitValueField(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btbtnClearCourierClick(Sender: TObject);
  private
    { Private declarations }
    sOldValue: String;
  public
    { Public declarations }
  end;

var
  STMaintParamFrm: TSTMaintParamFrm;

implementation

uses STStockDM, pbDatabase, CCSCommon, pbMainMenu, PBLUPriceUnit;

{$R *.DFM}

procedure TSTMaintParamFrm.FormActivate(Sender: TObject);
Var
bTempLUG: ByteBool ;
iTempCount: Integer ;
begin
With STStockDataMod.GetStoresSQL do
     begin
     Close ;
     Open ;
     end;
With STStockDataMod.GetCouriersSQL do
     begin
     Close ;
     Open ;
     end;
With STStockDataMod.GetPriceUnitSQL do
     begin
     Close ;
     Open ;
     end;
  with dmBroker.qryCompany do
    begin
     Close ;
     Open ;
     First ;
     PONoSpinEdit.Value := FieldByName('Last_PO_Number').AsInteger ;
     SONoSpinEdit.Value := FieldByName('Last_Store_Ord_No').AsInteger ;
     SOPNoSpinEdit.Value := FieldByName('Last_SO_Number').AsInteger;
     POPercMemo.Text := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(FieldByName('Purch_Ord_Perc_Pack').AsFloat)) ;
     SOPercMemo.Text := CurrencyDisp(frmPBMainMenu.sCurrencyMask,FloatToStr(FieldByName('Store_Ord_Perc_Pack').AsFloat)) ;
     WhouseDBLookupComboBox.KeyValue := FieldByName('Default_Warehouse').AsInteger ;
     if fieldByName('Courier').Asinteger <> 0 then
      DBLUCmbBxCourier.KeyValue := FieldByName('Courier').AsInteger;
     DBLUcmbPriceUnit.KeyValue := FieldByName('Price_Unit').AsInteger ;
     PickRefEdit.Text := FieldByName('Picking_List_Ref').AsString ;
     SearchTimerSpinEdit.Value := FieldByName('Search_Timer').AsInteger ;
     ChkBxStksystm.Checked := FieldByname('Use_Stock_System').AsString = 'Y';
     ChkBxOverPicking.Checked := FieldByname('Allow_Overpicking').AsString = 'Y';

     chkbxAutoAllocate.Checked := (fieldbyname('Auto_Allocate_Stock').asstring = 'Y');

     For iTempCount := 1 to 6 do
        begin
        bTempLUG := (Copy(FieldByName('Parts_LUG_Fields').AsString, iTempCount,1) = 'Y') ;
        {NOTE: number 3 was the Primary Product from SCRIBE (not used in BROKER)} ;
        Case iTempCount of
             1:     DescrCheckBox.Checked := bTempLUG ;
             2:     GroupCheckBox.Checked := bTempLUG ;
             4:     CostCatCheckBox.Checked := bTempLUG ;
             5:     CostListCheckBox.Checked := bTempLUG ;
             end;
        end;
    end;
  dmBroker.ScreenAccessControl(Self,'mnuStockPrefs',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TSTMaintParamFrm.EnterValueField(Sender: TObject);
begin
sOldValue := (Sender as TMemo).Text;
end;

procedure TSTMaintParamFrm.ExitValueField(Sender: TObject);
var
  TempVal: string[10];
begin
  TempVal := CurrencyDisp(frmPBMainMenu.sCurrencyMask,(Sender as TMemo).Text);
  if TempVal = 'X' then
    (Sender as TMemo).Text := sOldValue
  else
    begin
    If (StrToFloat(TempVal) < 0) or (StrToFloat(TempVal) >= 100) then
       begin
       MessageDlg('Must be between 0.00% and 99.99%', mtError, [mbOK],0) ;
       (Sender as TMemo).Text := sOldValue ;
       end
    else
       (Sender as TMemo).Text := TempVal;
    end;
end;

procedure TSTMaintParamFrm.FormCreate(Sender: TObject);
begin
STStockDataMod := TSTStockDataMod.Create(Self);
end;

procedure TSTMaintParamFrm.FormDestroy(Sender: TObject);
begin
STStockDataMod.Free ;
end;


procedure TSTMaintParamFrm.OKBitBtnClick(Sender: TObject);
Var
sTempLUG: String;
begin
With UpdCompSQL do
     begin
     Close ;
     ParamByName('Last_PO_Number').AsInteger := PONoSpinEdit.Value ;
     ParamByName('Last_Store_Ord_No').AsInteger := SONoSpinEdit.Value ;
     ParamByName('Last_SO_Number').AsInteger := SOPNOSpinEdit.Value;
     ParamByName('Purch_Ord_Perc_Pack').AsFloat := StrToFloat(POPercMemo.Text) ;
     ParamByName('Store_Ord_Perc_Pack').AsFloat := StrToFloat(SOPercMemo.Text) ;
     If WhouseDBLookupComboBox.text = '' then
           ParamByName('Default_Warehouse').Clear
     else
           ParamByName('Default_Warehouse').AsInteger := WhouseDBLookupComboBox.KeyValue ;
     If ((DBLUCmbBxCourier.text = '') or (DBLUCmbBxCourier.KeyValue = 0)) then
           ParamByName('Courier').Clear
     else
           ParamByName('Courier').AsInteger := DBLUCmbBxCourier.KeyValue ;

     If DBLUcmbPriceUnit.text = '' then
           ParamByName('Price_Unit').Clear
     else
           ParamByName('Price_Unit').AsInteger := DBLUcmbPriceUnit.KeyValue ;
     ParamByName('Picking_List_Ref').AsString := PickRefEdit.Text ;
     ParamByName('Search_Timer').AsInteger := SearchTimerSpinEdit.Value ;
    If DescrCheckBox.Checked = True then
       sTempLUG := sTempLUG + 'Y'
    else
       sTempLUG := sTempLUG + 'N' ;
    If GroupCheckBox.Checked = True then
       sTempLUG := sTempLUG + 'Y'
    else
       sTempLUG := sTempLUG + 'N' ;
    sTempLUG := sTempLUG + 'N' ;
    If CostCatCheckBox.Checked = True then
       sTempLUG := sTempLUG + 'Y'
    else
       sTempLUG := sTempLUG + 'N' ;
    If CostListCheckBox.Checked = True then
       sTempLUG := sTempLUG + 'Y'
    else
       sTempLUG := sTempLUG + 'N' ;
     ParamByName('Parts_LUG_Fields').AsString := sTempLUG ;
    if ChkBxStkSystm.Checked = True then
      ParamByName('Use_Stock_System').AsString := 'Y'
    else
      ParamByName('Use_Stock_System').AsString := 'N';

    if ChkBxOverPicking.Checked = True then
      ParamByName('Allow_Overpicking').AsString := 'Y'
    else
      ParamByName('Allow_Overpicking').AsString := 'N';

    {Auto Allocate Stock}
    if chkbxAutoAllocate.Checked then
    begin
      ParamByName('Auto_Allocate_Stock').asString := 'Y';
    end
    else
    begin
      ParamByName('Auto_Allocate_Stock').asString := 'N';
    end;

    ExecSql ;
    end;
  With dmBroker.qryCompany do
     begin
     Close ;
     Open ;
     First ;
     end;
Close ;
end;

procedure TSTMaintParamFrm.BitBtn1Click(Sender: TObject);
begin
  pbLUPriceUnitfrm := TpbLUPriceUnitfrm.create(self);
  try
    pbLUPriceUnitfrm.showmodal;
  finally
    pbLUPriceUnitfrm.free
  end;
  With STStockDataMod.GetPriceUnitSQL do
    begin
      Close ;
      Open ;
    end;
end;

procedure TSTMaintParamFrm.btbtnClearCourierClick(Sender: TObject);
begin
  self.DBLUCmbBXCourier.KeyValue := 0;
end;

end.
