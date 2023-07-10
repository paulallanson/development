unit PBMaintCustomerCats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, DBCtrls, StdCtrls, Buttons, Spin, ExtCtrls;

type
  TPBMaintCustomerCatsFrm = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    dblkpCategories: TDBLookupComboBox;
    qryCategories: TQuery;
    dtsCategories: TDataSource;
    btnOperators: TBitBtn;
    AddSQL: TQuery;
    qryDelete: TQuery;
    radType: TRadioGroup;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    spnMin: TSpinEdit;
    spnMax: TSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure btnOperatorsClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    procedure ShowDetails;
    procedure GetCategories;
    { Private declarations }
  public
    iCust, iCat: integer;
    iOperator: integer;
    sFuncMode: string;
  end;

var
  PBMaintCustomerCatsFrm: TPBMaintCustomerCatsFrm;

implementation

uses PBLUCategory, PBLUCustomerCats;

{$R *.dfm}

procedure TPBMaintCustomerCatsFrm.FormActivate(Sender: TObject);
begin
  GetCategories;

  ShowDetails;
end;

procedure TPBMaintCustomerCatsFrm.ShowDetails;
begin
  if sFuncMode = 'A' then
    begin
      dblkpCategories.KeyValue := 0;
    end
  else
    begin
      with PBLUCustomerCatsFrm.DetsSRC.DataSet do
      begin
        iCat := FieldByName('Category').AsInteger;
        spnMin.Value := FieldByName('KPI_Min_Value').Asinteger;
        spnMax.Value := FieldByName('KPI_Max_Value').Asinteger;
        radType.ItemIndex := FieldByName('Category_KPI').Asinteger;
      end;
      dblkpCategories.KeyValue := iCat;
      dblkpCategories.enabled := false;
    end;
  checkok(self);
end;

procedure TPBMaintCustomerCatsFrm.CheckOK(Sender: TObject);
begin
  btnOK.enabled := dblkpCategories.keyvalue <> 0;
end;

procedure TPBMaintCustomerCatsFrm.btnOperatorsClick(Sender: TObject);
begin
  PBLUCategoryFrm := TPBLUCategoryFrm.Create(Self);
  try
    PBLUCategoryFrm.bIs_Lookup := True;
    PBLUCategoryFrm.bAllow_Upd := True;
    PBLUCategoryFrm.SelCode := dblkpCategories.Keyvalue;
    PBLUCategoryFrm.ShowModal;
    if PBLUCategoryFrm.Selected then
    begin
      GetCategories;
      dblkpCategories.keyvalue := PBLUCategoryFrm.SelCode;
    end;
  finally
    PBLUCategoryFrm.Free;
  end;

end;

procedure TPBMaintCustomerCatsFrm.GetCategories;
begin
  with qryCategories do
    begin
      close;
      parambyname('Customer').AsInteger := iCust;
      parambyname('Category').AsInteger := iCat;
      open;
    end;
end;

procedure TPBMaintCustomerCatsFrm.btnOKClick(Sender: TObject);
begin
  iCat := dblkpCategories.keyvalue;
  if (sFuncMode = 'A') or (sFuncMode = 'C') then
    begin
      with qryDelete do
        begin
          close;
          parambyname('Customer').asinteger := iCust;
          parambyname('Category').asinteger := iCat;
          execsql;
        end;
      with addSQL do
      begin
          parambyname('Customer').asinteger := iCust;
          parambyname('Category').asinteger := iCat;
          parambyname('Category_KPI').asinteger := radType.ItemIndex;
          parambyname('KPI_Min_Value').asinteger := spnMin.value;
          parambyname('KPI_Max_Value').asinteger := spnMax.value;
        ExecSQL;
      end;
    end
  else
    begin
      with qryDelete do
        begin
          close;
          parambyname('Customer').asinteger := iCust;
          parambyname('Category').asinteger := iCat;
          execsql;
        end;
    end;
end;

end.
