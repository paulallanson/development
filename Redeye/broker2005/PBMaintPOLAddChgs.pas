unit PBMaintPOLAddChgs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, PBPOObjects;

type
  TPBMaintPOLAddChgsfrm = class(TForm)
    OKbitbtn: TBitBtn;
    Cancelbtn: TBitBtn;
    Label1: TLabel;
    edtDetails: TEdit;
    Label2: TLabel;
    memCost: TMemo;
    delLabel: TLabel;
    UpdSQL: TQuery;
    AddSQL: TQuery;
    GetLastSQL: TQuery;
    qryDel: TQuery;
    getLastProfitSQL: TQuery;
    addSalesProfitSQL: TQuery;
    updSalesProfitSQL: TQuery;
    qryDelSalesProfit: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKbitbtnClick(Sender: TObject);
    procedure memCostExit(Sender: TObject);
    procedure memCostEnter(Sender: TObject);
  private
    { Private declarations }
    sOldValue: string;
    procedure SaveDetails;
  public
    { Public declarations }
    sFuncMode: string;
    sDesc: string;
    icode, iSalesProfit: integer;
    rCost: real;
  end;

var
  PBMaintPOLAddChgsfrm: TPBMaintPOLAddChgsfrm;

implementation

uses PBLUPOLAddChgs;

{$R *.DFM}

procedure TPBMaintPOLAddChgsfrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (edtDetails.Text <> '') and
    (memCost.Text <> '');
end;

procedure TPBMaintPOLAddChgsfrm.FormActivate(Sender: TObject);
begin
  if sFuncMode = 'A' then
  begin
    begin
    {Empty details}
    edtDetails.Text := '';
    memCost.Text := '0.00';
    end
  end
  else
  begin
    edtDetails.Text := sDesc;
    memCost.text := formatfloat('0.00',rCost);
  end;

  {Enable or disable the buttons}
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);

end;

procedure TPBMaintPOLAddChgsfrm.OKbitbtnClick(Sender: TObject);
begin
  {Save all the details}
  SaveDetails;
end;

procedure TPBMaintPOLAddChgsfrm.SaveDetails;
var
  i: integer;
begin
  {Add to Purchase Order Add chgs}
  if sFuncMode = 'A' then
    begin
      with GetLastSQL do
      begin
        Close;
        ParamByName('Purchase_Order').Asfloat := PBLUPOLAddChgsfrm.PONumber;
        ParamByName('Line').AsInteger := PBLUPOLAddChgsfrm.Line;
        open;

        icode := fieldbyname('Last_Charge').asinteger + 1
      end;

      with GetLastProfitSQL do
      begin
        Close;
        open;

        iSalesProfit := fieldbyname('Last_Profit').asinteger + 1
      end;

      with AddSalesProfitSQL do
      begin
        for i := 0 to pred(params.count) do
          params[i].clear;
        close;
        ParamByName('Sales_Profit').AsInteger := iSalesProfit;
        ParamByName('Purchase_Order').Asfloat := PBLUPOLAddChgsfrm.PONumber;
        ParamByName('Line').AsInteger := PBLUPOLAddChgsfrm.Line;
        ParamByName('Period').AsInteger := PBLUPOLAddChgsfrm.Periodno;
        ParamByName('Customer').Asinteger := PBLUPOLAddChgsfrm.Customer;
        ParamByName('Branch_no0').Asinteger := PBLUPOLAddChgsfrm.CustomerBranch;
        ParamByName('Supplier').Asinteger := PBLUPOLAddChgsfrm.Supplier;
        ParamByName('Branch_no').Asinteger := PBLUPOLAddChgsfrm.SupplierBranch;
        ParamByName('Rep').Asinteger := PBLUPOLAddChgsfrm.Rep;
        if PBLUPOLAddChgsfrm.RepTeam = 0 then
          Parambyname('Rep_Team').clear
        else
          Parambyname('Rep_Team').AsInteger := PBLUPOLAddChgsfrm.RepTeam;

        ParambyName('Product_Type').AsInteger := PBLUPOLAddChgsfrm.ProductType;
        ParambyName('Category').AsInteger := PBLUPOLAddChgsfrm.Category;
        ParambyName('Office_Contact').asinteger := PBLUPOLAddChgsfrm.OfficeContact;
        if PBLUPOLAddChgsfrm.AccountTeam = 0 then
          ParambyName('Account_Team').clear
        else
          ParambyName('Account_Team').asinteger := PBLUPOLAddChgsfrm.AccountTeam;

        ParambyName('Job_Bag').asinteger := PBLUPOLAddChgsfrm.JobBag;
        Parambyname('Job_Bag_Line').asinteger := PBLUPOLAddChgsfrm.JobBagLine;

        parambyname('Total_Sales_Value').asfloat := 0.00;
        parambyname('Total_Cost_Value').asfloat := strtofloat(memCost.text);
        ExecSQL;
      end;
      with AddSQL do
      begin
        Close;
        ParamByName('Purchase_Order').Asfloat := PBLUPOLAddChgsfrm.PONumber;
        ParamByName('Line').AsInteger := PBLUPOLAddChgsfrm.Line;
        ParamByName('Additional_Charge').AsInteger := iCode;

        ParamByName('Details').AsString := edtDetails.text;
        ParamByName('Amount').Asfloat := strtofloat(memCost.text);
        ParamByName('Quotation_price').Asfloat := 0.00;
        ParamByName('Sales_Profit').Asfloat := iSalesProfit;
        ExecSQL;
      end;
    end
  else
  if sFuncMode = 'C' then
    begin
      {Update the Sales_Profit}
      with updSalesProfitSQL do
        begin
        close;
        ParamByName('Sales_Profit').AsInteger := iSalesProfit;
        parambyname('Total_Cost_Value').asfloat := strtofloat(memCost.text);
        ExecSQL;
        end;

      with UpdSQL do
      begin
        Close;
        ParamByName('Purchase_Order').Asfloat := PBLUPOLAddChgsfrm.PONumber;
        ParamByName('Line').AsInteger := PBLUPOLAddChgsfrm.Line;
        ParamByName('Additional_Charge').AsInteger := iCode;

        ParamByName('Details').AsString := edtDetails.text;
        ParamByName('Amount').Asfloat := strtofloat(memCost.text);
        ParamByName('Quotation_price').Asfloat := 0.00;
        ExecSQL;
      end;
    end
  else
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      begin
        with qryDelSalesProfit do
          begin
            close;
            ParamByName('Sales_profit').Asinteger := iSalesProfit;
            execsql;
          end;

        with qryDel do
          begin
            close;
            ParamByName('Purchase_Order').Asfloat := PBLUPOLAddChgsfrm.PONumber;
            ParamByName('Line').AsInteger := PBLUPOLAddChgsfrm.Line;
            ParamByName('Additional_Charge').AsInteger := iCode;
            execsql;
          end;
      end;
  end;
end;

procedure TPBMaintPOLAddChgsfrm.memCostExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintPOLAddChgsfrm.memCostEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

end.
