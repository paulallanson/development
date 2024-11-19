unit STMaintSOrdDel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Spin, DBCtrls, Db, Mask, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMaintSOrdDelfrm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    lblSalesOrder: TLabel;
    Label3: TLabel;
    dblkpCourier: TDBLookupComboBox;
    Label4: TLabel;
    edtDateDelivered: TEdit;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    lblDespatchNo: TLabel;
    edtConsignment: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    spnEdtBoxes: TSpinEdit;
    Label10: TLabel;
    Label11: TLabel;
    memInstructions: TMemo;
    Label12: TLabel;
    edtDatePicked: TEdit;
    Label13: TLabel;
    qryCourier: TFDQuery;
    dtsCourier: TDataSource;
    qryCourierService: TFDQuery;
    dblkpCourierService: TDBLookupComboBox;
    dtsCourierService: TDataSource;
    qryGetSODelivery: TFDQuery;
    qryUpSODelivery: TFDQuery;
    edtWeight: TEdit;
    btnCourier: TBitBtn;
    btnClear: TBitBtn;
    qryCompany: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCourierClick(Sender: TObject);
    procedure Enableok(Sender: TObject);
    procedure dblkpCourierClick(Sender: TObject);
  private
    FDeliveryNo: integer;
    FSalesOrder: integer;
    procedure SetDeliveryNo(const Value: integer);
    procedure SetSalesOrder(const Value: integer);
    procedure GetCourier;
    procedure GetServices(tempcode: integer);
    { Private declarations }
  public
    { Public declarations }
    bOK: boolean;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property DeliveryNo: integer read FDeliveryNo write SetDeliveryNo;
  end;

var
  STMaintSOrdDelfrm: TSTMaintSOrdDelfrm;

implementation

uses DateSelV5, STLUCourier;

{$R *.DFM}

{ TSTMaintSOrdDelfrm }

procedure TSTMaintSOrdDelfrm.SetDeliveryNo(const Value: integer);
begin
  FDeliveryNo := Value;
end;

procedure TSTMaintSOrdDelfrm.SetSalesOrder(const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TSTMaintSOrdDelfrm.btnOKClick(Sender: TObject);
var
  i: integer;
begin
  with qryUpSODelivery do
    begin
      for i := 0 to pred(params.count) do
        params[i].clear;
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      parambyname('Sales_Order_Delivery_no').asinteger := DeliveryNo;
      parambyname('Delivery_Date').asdatetime := pbdatestr(edtDateDelivered.text);
      parambyname('Delivery_Weight_Kilos').asinteger := strtoint(edtWeight.text);
      parambyname('No_of_Boxes').asinteger := spnEdtBoxes.value;
      parambyname('Delivery_instructions').asstring := memInstructions.text;
      parambyname('Consignment_number').asstring := edtConsignment.text;
      if dblkpCourier.text = '' then
        parambyname('Courier').clear
      else
        parambyname('Courier').asinteger := dblkpCourier.keyvalue;
      if dblkpCourierService.text = '' then
        parambyname('Service_no').clear
      else
        parambyname('Service_no').asinteger := dblkpCourierService.keyvalue;
      execsql;
    end;
  bOK := true;
end;

procedure TSTMaintSOrdDelfrm.btnCancelClick(Sender: TObject);
begin
  bOK := false;
end;

procedure TSTMaintSOrdDelfrm.FormActivate(Sender: TObject);
begin
  GetCourier;
  
  qryCompany.Close;
  qryCompany.open;

  dblkpCourier.keyvalue := qryCompany.fieldbyname('Courier').asinteger;

  bOK := false;
  with qryGetSODelivery do
    begin
      close;
      parambyname('Sales_Order').asinteger := SalesOrder;
      parambyname('Sales_Order_Delivery_no').asinteger := DeliveryNo;
      open;

      lblDespatchNo.caption := fieldbyname('Despatch_Note_no').asstring;
      lblSalesOrder.caption := fieldbyname('Sales_order').asstring;

      edtDateDelivered.text := pbDatestr(fieldbyname('Delivery_Date').asdatetime);
      edtDatePicked.text := pbDatestr(fieldbyname('Date_Picked').asdatetime);
      edtConsignment.text := fieldbyname('Consignment_number').asstring;
      edtWeight.text := fieldbyname('Delivery_Weight_Kilos').asstring;
      memInstructions.text := fieldbyname('Delivery_Instructions').asstring;
      spnEdtBoxes.value := fieldbyname('No_of_Boxes').asinteger;
      if fieldbyname('Courier').asinteger > 0 then
        begin
          dblkpCourier.keyvalue := fieldbyname('Courier').asinteger;
          getservices(dblkpCourier.KeyValue);
          dblkpCourierService.keyvalue := fieldbyname('Service_no').asinteger;
        end;
    end;
  enableok(self);
end;

procedure TSTMaintSOrdDelfrm.btnClearClick(Sender: TObject);
begin
  dblkpCourier.keyvalue := 0;
  dblkpCourierService.keyvalue := 0;
  enableOK(self);
end;

procedure TSTMaintSOrdDelfrm.BitBtn1Click(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(edtDateDelivered.Text);
    DateSelV5Form.ShowModal;
    edtDateDelivered.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
  Enableok(self);
end;

procedure TSTMaintSOrdDelfrm.btnCourierClick(Sender: TObject);
begin
  STLUCourierFrm := TSTLUCourierFrm.Create(Self);
  try
    STLUCourierFrm.bIs_Lookup := True;
    STLUCourierFrm.bAllow_Upd := True;
    STLUCourierFrm.SelCode := dblkpCourier.keyvalue;
    STLUCourierFrm.SelName := dblkpCourier.Text;
    STLUCourierFrm.ShowModal;
    if STLUCourierFrm.Selected then
    begin
      GetCourier;
      dblkpCourier.Keyvalue := STLUCourierFrm.SelCode;
      GetServices(dblkpCourier.KeyValue);
    end;
  finally
    STLUCourierFrm.Free;
  end;
  enableOK(self);
end;

procedure TSTMaintSOrdDelfrm.Enableok(Sender: TObject);
begin
  btnOK.enabled :=  (edtDatedelivered.text <> '') and
                    (edtConsignment.text <> '') and
                    (edtWeight.text <> '') and
                    (dblkpCourier.keyvalue <> 0) and
                    (dblkpCourierService.keyvalue <> 0);
end;

procedure TSTMaintSOrdDelfrm.GetCourier;
begin
  with qryCourier do
    begin
      close;
      open;
    end;
end;

procedure TSTMaintSOrdDelfrm.dblkpCourierClick(Sender: TObject);
begin
  getservices(dblkpCourier.KeyValue);
  EnableOK(self);
end;

procedure TSTMaintSOrdDelfrm.GetServices(tempcode: integer);
begin
  qryCourierService.Close;
  qryCourierService.ParamByName('Courier').asinteger := tempcode;
  qryCourierService.Open;
end;

end.
