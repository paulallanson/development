unit PBLUPOLAddChgs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUPOLAddChgsfrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DelBitBtn: TBitBtn;
    chgBitBtn: TBitBtn;
    AddBitBtn: TBitBtn;
    lblPONumber: TLabel;
    GetDetsSQL: TFDQuery;
    DetsSRC: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblCustomer: TLabel;
    lblSupplier: TLabel;
    GetPOSQL: TFDQuery;
    qryPeriod: TFDQuery;
    btnClose: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure chgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure GetPOrderDetails;
  public
    { Public declarations }
    PONumber: real;
    SelCode, Line: Integer;
    Customer, Supplier, Rep, CustomerBranch, SupplierBranch: integer;
    OfficeContact, AccountTeam, RepTeam: integer;
    ProductType, Category: integer;
    JobBag, JobBagLine: integer;
    PeriodNo: integer;
  end;

var
  PBLUPOLAddChgsfrm: TPBLUPOLAddChgsfrm;

implementation

uses PBMaintPOLAddChgs, pbDatabase;

{$R *.DFM}

procedure TPBLUPOLAddChgsfrm.FormActivate(Sender: TObject);
begin
  lblPONumber.caption := floattostr(PONumber) + '/' + inttostr(Line);
(*  with qryPeriod do
    begin
      close;
      open;
      PeriodNo := fieldbyname('Period').asinteger;
    end;
*)
  PeriodNo := dmBroker.GetCurrentPeriod;

  ShowGrid(Self);
  if (SelCode <> 0) then FindInGrid(SelCode);
end;

procedure TPBLUPOLAddChgsfrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    parambyname('Purchase_order').asfloat := PONumber;
    parambyname('Line').asinteger := Line;
    parambyname('Period').asinteger := PeriodNo;
    Open;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
  end;
end;

procedure TPBLUPOLAddChgsfrm.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (not (EOF)) and (FieldByName('Additional_Charge').AsInteger <> iTempSel)
      do
      Next;
  end;
end;

procedure TPBLUPOLAddChgsfrm.AddBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('A');

end;

procedure TPBLUPOLAddChgsfrm.chgBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('C');
end;

procedure TPBLUPOLAddChgsfrm.DelBitBtnClick(Sender: TObject);
begin
  {Change a Product_Type}
  CallMaintScreen('D');
end;

procedure TPBLUPOLAddChgsfrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintPOLAddChgsFrm := TPBMaintPOLAddChgsFrm.Create(Self);
  try
    PBMaintPOLAddChgsFrm.sFuncMode := sTempFuncMode;
    PBMaintPOLAddChgsFrm.icode := DetsSRC.dataset.fieldbyname('Additional_charge').asinteger;
    PBMaintPOLAddChgsFrm.sDesc := DetsSRC.dataset.fieldbyname('Details').asstring;
    PBMaintPOLAddChgsFrm.rCost := DetsSRC.dataset.fieldbyname('Amount').asfloat;
    PBMaintPOLAddChgsFrm.iSalesProfit := DetsSRC.dataset.fieldbyname('Sales_profit').asinteger;

    PBMaintPOLAddChgsFrm.ShowModal;
    bTempOK := (PBMaintPOLAddChgsFrm.ModalResult = mrOK);
    iTempSel := PBMaintPOLAddChgsFrm.iCode;
  finally
    PBMaintPOLAddChgsFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
    end;
  end;
end;

procedure TPBLUPOLAddChgsfrm.FormShow(Sender: TObject);
begin
  GetPOrderDetails;
end;

procedure TPBLUPOLAddChgsfrm.GetPOrderDetails;
begin
  with GetPOsql do
    begin
      close;
      parambyname('Purchase_Order').asfloat := PONumber;
      parambyname('Line').asinteger := Line;
      open;

      Customer := fieldbyname('Customer').asinteger;
      CustomerBranch := fieldbyname('Customer_Branch').asinteger;
      Supplier := fieldbyname('Supplier').asinteger;
      SupplierBranch := fieldbyname('Supplier_Branch').asinteger;
      Rep := fieldbyname('Rep').asinteger;

      OfficeContact := fieldbyname('Office_Contact').asinteger;
      AccountTeam := fieldbyname('Account_Team').asinteger;
      ProductType := fieldbyname('Product_Type').asinteger;
      Category := fieldbyname('Category').asinteger;

      lblCustomer.caption := fieldbyname('Customer_Name').asstring;
      lblSupplier.caption := fieldbyname('Supplier_Name').asstring;
    end;
end;

end.
