unit PBMaintProcessCostCat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintProcessCostCatFrm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    lblProcessDescription: TLabel;
    Panel2: TPanel;
    pnlDetails: TPanel;
    Label1: TLabel;
    lblCostPrice: TLabel;
    memCostPrice: TMemo;
    memSellPrice: TMemo;
    Label6: TLabel;
    Label4: TLabel;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryPriceUnit: TFDQuery;
    dtsPriceUnit: TDataSource;
    qryGetCost: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    qryZero: TFDQuery;
    qryDelete: TFDQuery;
    GetLastSQL: TFDQuery;
    dblkpPriceUnit: TDBLookupComboBox;
    memDescription: TMemo;
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney3DP(Sender: TObject);
    procedure CheckKeyIsFloat(Sender: TObject; var Key: Char);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    FOldValue : string;
    procedure DeleteFromDB;
    function GetNextKey: integer;
    procedure AddZero;
    procedure DeleteZero;
  public
    sFuncMode: string[1];
    Customer: integer;
    ProcessCode: integer;
    PriceUnit: integer;
    CostNumber: integer;
    iCode: Integer;
  end;

var
  PBMaintProcessCostCatFrm: TPBMaintProcessCostCatFrm;

implementation

uses UITypes, pbDatabase, pbMainMenu, CCSCommon, ComObj, ActiveX;

{$R *.dfm}

procedure TPBMaintProcessCostCatFrm.FormActivate(Sender: TObject);
var
  irecs: integer;
begin
  with qryPriceUnit do
    begin
      close;
      open;
      irecs := recordcount;
    end;

  if sFuncMode = 'A' then
    Caption := 'Add a new Process Category Cost';
  if sFuncMode = 'C' then
    Caption := 'Change a Process Category Cost';
  if sFuncMode = 'D' then
    Caption := 'Delete a Process Category Cost';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    memDescription.Text := '';
    memCostPrice.Text := '0.000';
    memSellPrice.Text := '0.000';
    dblkpPriceUnit.KeyValue := PriceUnit;
  end
  else
  begin
    with qryGetCost do
      begin
        close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Process').asinteger := ProcessCode;
        parambyname('Cost_Number').asinteger := CostNumber;
        parambyname('Category_Number').asinteger := iCode;
        open;
        memDescription.Text := fieldbyname('Cost_Description').asstring;
        memCostPrice.Text := formatfloat('##0.000',fieldbyname('Unit_Cost').asfloat);
        memSellPrice.Text := formatfloat('##0.000',fieldbyname('Unit_sell').asfloat);
        dblkpPriceUnit.KeyValue := fieldbyname('Price_Unit').asinteger;
      end;
  end;
  {Enable or disable the buttons}
  pnlDetails.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');

  CheckOK(Self);
end;

procedure TPBMaintProcessCostCatFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (memDescription.Text <> '') and
                      (memCostPrice.text <> '') and
                      (memSellPrice.text <> '') and
                      (dblkpPriceUnit.KeyValue <> 0);
end;

procedure TPBMaintProcessCostCatFrm.SaveValue(Sender: TObject);
begin
  if Sender is TMemo then
    FOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintProcessCostCatFrm.ValidateMoney3DP(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := FOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintProcessCostCatFrm.CheckKeyIsFloat(Sender: TObject; var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;
procedure TPBMaintProcessCostCatFrm.CancelBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBMaintProcessCostCatFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with UpdSQL do
    begin
      Close;
      parambyname('Customer').asinteger := Customer;
      ParamByName('Process').AsInteger := ProcessCode;
      ParamByName('Cost_Number').AsInteger := CostNumber;
      ParamByName('Category_Number').AsInteger := iCode;
      ParamByName('Cost_Description').AsString := memDescription.Text + '';
      ParamByName('Unit_Cost').Asfloat := StrToFloatDef(memCostPrice.text, 0, FormatSettings);
      ParamByName('Unit_Sell').Asfloat := StrToFloatDef(memSellPrice.text, 0, FormatSettings);
      ParamByName('Price_Unit').Asinteger := dblkpPriceUnit.keyvalue;
      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    pnlDetails.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DeleteFromDB;
  end;
end;

procedure TPBMaintProcessCostCatFrm.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Process').asinteger := ProcessCode;
      parambyname('Cost_Number').asinteger := CostNumber;
      parambyname('Category_Number').asinteger := iCode;
      execsql;
    end;
end;

procedure TPBMaintProcessCostCatFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Process_Cost_Category ' +
            '(Customer, Process, Cost_Number, Category_Number, Cost_Description) ' +
            'VALUES(' + inttostr(Customer) + ', ' + inttostr(ProcessCode) + ', ' + inttostr(CostNumber) + ', 0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProcessCostCatFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Process_Cost_Category Where Customer = ' + inttostr(Customer) + ' AND Process = ' + inttostr(ProcessCode) + ' AND Cost_Number = ' + inttostr(CostNumber) +
            ' AND Category_Number = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintProcessCostCatFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert process cost record
    with AddSQL do
    begin
      ParamByname('Customer').AsInteger := Customer;
      ParamByname('Process').AsInteger := ProcessCode;
      ParamByname('Cost_Number').AsInteger := CostNumber;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByname('Customer').AsInteger := Customer;
      ParamByname('Process').AsInteger := ProcessCode;
      ParamByname('Cost_Number').AsInteger := CostNumber;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Category_Number').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
