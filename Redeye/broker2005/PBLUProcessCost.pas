unit PBLUProcessCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus, DB, DBCtrls, Grids, DBGrids, Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUProcessCostFrm = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    lblCategory: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pmnDescription: TPopupMenu;
    btnAddPCost: TMenuItem;
    btnChgPCost: TMenuItem;
    btnDelPCost: TMenuItem;
    pmnCategory: TPopupMenu;
    MenuItem1: TMenuItem;
    btnChgPCostCat: TMenuItem;
    btnDelPCostCat: TMenuItem;
    pmnSubCategory: TPopupMenu;
    MenuItem4: TMenuItem;
    btnChgPCostSub: TMenuItem;
    btnDelPCostSub: TMenuItem;
    lblTask: TLabel;
    qryProcessCosts: TFDQuery;
    dtsProcessCosts: TDataSource;
    qryProcessCostCat: TFDQuery;
    qryProcessCostSub: TFDQuery;
    dtsProcessCostCat: TDataSource;
    dtsProcessCostSub: TDataSource;
    dblstProcessCosts: TDBLookupListBox;
    dbPriceUnit: TDBText;
    dbedtUnitCost: TDBEdit;
    dbedtUnitSell: TDBEdit;
    dblstProcessCostCat: TDBLookupListBox;
    dblstProcessCostSub: TDBLookupListBox;
    btnClose: TBitBtn;
    dbtxtPriceUnit: TDBText;
    rgCustomer: TRadioGroup;
    pnlCustSearch: TPanel;
    lblCustBran: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    Label2: TLabel;
    lblProcessDescription: TLabel;
    lblDescription: TLabel;
    btnCopyPCost: TMenuItem;
    qryAddProcessCost: TFDQuery;
    qryAddProcessCostCat: TFDQuery;
    qryLastCostNumber: TFDQuery;
    qryLastCatNumber: TFDQuery;
    qryAddProcessCostSub: TFDQuery;
    qryDelete: TFDQuery;
    dblkpProcess: TDBLookupComboBox;
    qryProcess: TFDQuery;
    dtsProcess: TDataSource;
    qryGetPTProcess: TFDQuery;
    qryGetProcess: TFDQuery;
    grpbxCopy: TGroupBox;
    edtCopyCustomer: TEdit;
    btnRep: TButton;
    btnCopy: TButton;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblstProcessCostsClick(Sender: TObject);
    procedure dblstProcessCostsCatClick(Sender: TObject);
    procedure pmnDescriptionPopup(Sender: TObject);
    procedure pmnCategoryPopup(Sender: TObject);
    procedure pmnSubCategoryPopup(Sender: TObject);
    procedure btnAddPCostClick(Sender: TObject);
    procedure btnChgPCostClick(Sender: TObject);
    procedure btnDelPCostClick(Sender: TObject);
    procedure dblstProcessCostsDblClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure btnChgPCostCatClick(Sender: TObject);
    procedure btnDelPCostCatClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure btnChgPCostSubClick(Sender: TObject);
    procedure btnDelPCostSubClick(Sender: TObject);
    procedure dblstProcessCostCatClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure dblstProcessCostSubClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rgCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblstProcessCostCatDblClick(Sender: TObject);
    procedure dblstProcessCostSubDblClick(Sender: TObject);
    procedure btnCopyPCostClick(Sender: TObject);
    procedure dblkpProcessClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    FProcessCode: integer;
    FCustomer: integer;
    FCustomerName: string;
    FPriceUnitDefault: integer;
    FSelectProcess: boolean;
    FProductType: integer;
    FCopyCustomer: integer;
    procedure CallMaintProcessCost(sFuncMode: string);
    procedure CallMaintProcessCostCat(sFuncMode: string);
    procedure CallMaintProcessCostSub(sFuncMode: string);
    procedure SetProcessCode(const Value: integer);
    procedure ShowProcessCosts;
    procedure ShowProcessCostCategory;
    procedure ShowProcessCostSubCategory;
    procedure SetCustomer(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure LoadCosts;
    procedure SetPriceUnitDefault(const Value: integer);
    procedure ShowDescription;
    procedure CreateSubCategories(OldCostNumber, OldCatNumber, CostNumber, fromCustomer, toCustomer: integer);
    procedure SetSelectProcess(const Value: boolean);
    procedure SetProductType(const Value: integer);
    procedure SetCopyCustomer(const Value: integer);
    procedure CopyAProcessCost(fromCustomer, toCustomer: integer);
    procedure CopyCosts;
    { Private declarations }
  public
    SelDescription: string;
    SelUnitCost: double;
    SelUnitSell: double;
    SelPriceUnit: integer;
    SelCostNumber, SelCatNumber, SelSubNumber: integer;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    newCustomer, SelCustCode: integer;
    SelCustName: string;
    property CopyCustomer: integer read FCopyCustomer write SetCopyCustomer;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property PriceUnitDefault: integer read FPriceUnitDefault write SetPriceUnitDefault;
    property ProcessCode: integer read FProcessCode write SetProcessCode;
    property ProductType: integer read FProductType write SetProductType;
    property SelectProcess: boolean read FSelectProcess write SetSelectProcess;
  end;

var
  PBLUProcessCostFrm: TPBLUProcessCostFrm;

implementation

uses UITypes, PBMaintProcessCost, PBMaintProcessCostCat, PBMaintProcessCostSub,
  PBLUCust;

{$R *.dfm}

procedure TPBLUProcessCostFrm.FormActivate(Sender: TObject);
begin
  Selected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Process operation cost';
    btnOK.Visible := True;
    btnCancel.Visible := True;
    btnClose.visible := false;
    grpbxCopy.Visible := false;
    dblstprocessCosts.PopupMenu := nil;
    dblstprocessCostCat.PopupMenu := nil;
    dblstprocessCostSub.PopupMenu := nil;
  end
  else
  begin
    Caption := 'Maintain Process operation costs';
    btnOK.Visible := false;
    btnCancel.Visible := false;
    btnClose.visible := true;
    grpbxCopy.Visible := true;
    dblstprocessCosts.PopupMenu := pmnDescription;
    dblstprocessCostCat.PopupMenu := pmnCategory;
    dblstprocessCostSub.PopupMenu := pmnSubCategory;
  end;
  LoadCosts;
end;

procedure TPBLUProcessCostFrm.LoadCosts;
begin
  ShowProcessCosts;
  ShowProcessCostCategory;
  ShowProcessCostSubCategory;
end;

procedure TPBLUProcessCostFrm.ShowProcessCosts;
begin
  with qryProcessCosts do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Process').asinteger := ProcessCode;
      open;

      first;
      if recordcount > 0 then
        begin
          dblstProcessCosts.KeyValue := fieldbyname('Cost_Number').asinteger;
          dblstProcessCostsClick(self);
          dblstProcessCostCat.PopupMenu := pmncategory;
        end
      else
        begin
          dblstProcessCostCat.PopupMenu := nil;
          dblstProcessCostSub.PopupMenu := nil;
        end;
    end;
  checkOK(self);
end;

procedure TPBLUProcessCostFrm.ShowProcessCostCategory;
begin
  qryProcessCostSub.Active := false;
  qryProcessCostCat.Active := false;

  with qryProcessCostCat do
    begin
      close;
      parambyname('Customer').asinteger := qryProcessCosts.FieldByName('Customer').asinteger;
      parambyname('Process').asinteger := qryProcessCosts.FieldByName('Process').asinteger;
      parambyname('Cost_Number').asinteger := qryProcessCosts.FieldByName('Cost_Number').asinteger;
      open;
      first;
      if recordcount > 0 then
        begin
          dblstProcessCostCat.KeyValue := fieldbyname('Category_Number').asinteger;
          dblstProcessCostCatClick(self);
          dblstProcessCostSub.PopupMenu := pmnSubCategory;
        end
      else
        begin
          dblstProcessCostSub.PopupMenu := nil;
        end;
    end;
  checkok(self);
end;

procedure TPBLUProcessCostFrm.ShowProcessCostSubCategory;
begin
  with qryProcessCostSub do
    begin
      close;
      parambyname('Customer').asinteger := qryProcessCostCat.FieldByName('Customer').asinteger;
      parambyname('Process').asinteger := qryProcessCostCat.FieldByName('process').asinteger;
      parambyname('Cost_Number').asinteger := qryProcessCostCat.FieldByName('Cost_Number').asinteger;
      parambyname('Category_Number').asinteger := qryProcessCostCat.FieldByName('Category_Number').asinteger;
      open;

      first;
      if recordcount > 0 then
        begin
          dblstProcessCostSub.KeyValue := fieldbyname('Sub_Category').asinteger;
          dblstProcessCostSubClick(self);
        end;
    end;
  checkok(self);
end;

procedure TPBLUProcessCostFrm.dblstProcessCostsClick(Sender: TObject);
begin
  if qryProcessCosts.recordcount > 0 then
    begin
      dbedtunitCost.DataSource := dtsProcessCosts;
      dbEdtUnitSell.DataSource := dtsProcessCosts;
      dbPriceUnit.DataSource := dtsProcessCosts;
      ShowProcessCostCategory;
    end;
  ShowDescription;
  CheckOK(self);
end;

procedure TPBLUProcessCostFrm.dblstProcessCostsCatClick(Sender: TObject);
begin
  ShowProcessCostSubCategory;
  CheckOK(self);
end;

procedure TPBLUProcessCostFrm.pmnDescriptionPopup(Sender: TObject);
begin
  btnChgPCost.Enabled := (qryprocessCosts.RecordCount > 0);
  btnDelPCost.Enabled := (qryprocessCosts.RecordCount > 0);
end;

procedure TPBLUProcessCostFrm.CheckOK(Sender: TObject);
begin
  {Check if can click OK}
  if dblstProcessCostSub.SelectedItem <> '' then
    btnOK.Enabled := (dblstProcessCostSub.keyvalue <> 0)
  else
  if dblstProcessCostCat.selecteditem <> '' then
    btnOK.Enabled := (dblstProcessCostCat.keyvalue <> 0)
  else
  if dblstProcessCosts.selecteditem <> '' then
    btnOK.Enabled := (dblstProcessCosts.keyvalue <> 0)
  else
    btnOK.enabled := false;
end;

procedure TPBLUProcessCostFrm.ShowDescription;
var
  sSubtext, sCatText, sText: string;
begin
  sSubtext := '';
  sCattext := '';
  stext := '';

  {Construct the selected description}
  if dblstProcessCostSub.SelectedItem <> '' then
    sSubtext := ', '+ dblstprocessCostSub.selectedItem;

  if dblstProcessCostCat.selecteditem <> '' then
    sCattext := ', '+ dblstprocessCostCat.selectedItem;

  if dblstProcessCosts.selecteditem <> '' then
    sText := dblstprocessCosts.selectedItem;

  lblDescription.caption := stext + sCatText + sSubtext;
end;

procedure TPBLUProcessCostFrm.pmnCategoryPopup(Sender: TObject);
begin
  btnChgPCostCat.Enabled := (qryprocessCostCat.RecordCount > 0);
  btnDelPCostCat.Enabled := (qryprocessCostCat.RecordCount > 0);

end;

procedure TPBLUProcessCostFrm.pmnSubCategoryPopup(Sender: TObject);
begin
  btnChgPCostSub.Enabled := (qryprocessCostSub.RecordCount > 0);
  btnDelPCostSub.Enabled := (qryprocessCostSub.RecordCount > 0);
end;

procedure TPBLUProcessCostFrm.btnAddPCostClick(Sender: TObject);
begin
  CallMaintProcessCost('A');
end;

procedure TPBLUProcessCostFrm.CallMaintProcessCost(sFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintProcessCostFrm := TPBMaintProcessCostFrm.Create(Self);
  try
    PBMaintProcessCostFrm.lblProcessDescription.caption := lblProcessDescription.caption;
    PBMaintProcessCostFrm.Customer := Customer;
    PBMaintProcessCostFrm.ProcessCode := ProcessCode;
    PBMaintProcessCostFrm.PriceUnit := PriceUnitDefault;
    PBMaintProcessCostFrm.iCode := qryProcessCosts.fieldbyname('Cost_Number').asinteger;
    PBMaintProcessCostFrm.sFuncMode := sFuncMode;
    PBMaintProcessCostFrm.ShowModal;
    bTempOK := (PBMaintProcessCostFrm.ModalResult = mrOK);
    iTempSel := PBMaintProcessCostFrm.iCode;
  finally
    PBMaintProcessCostFrm.Free;
  end;
  if bTempOK then
  begin
    ShowProcessCosts;
    if sFuncMode <> 'D' then
    begin
//      dblstProcessCosts.ListSource.DataSet.Locate('Process;Cost_Number', VarArrayOf([ProcessCode,iTempSel]),[lopartialKey]) ;
      dblstProcessCosts.keyvalue := iTempSel;
    end;
  end;
end;

procedure TPBLUProcessCostFrm.SetProcessCode(const Value: integer);
begin
  FProcessCode := Value;
  dblkpProcess.keyvalue := FProcessCode;
end;

procedure TPBLUProcessCostFrm.btnChgPCostClick(Sender: TObject);
begin
  CallMaintProcessCost('C');
end;

procedure TPBLUProcessCostFrm.btnDelPCostClick(Sender: TObject);
var
  ProcessCost: integer;
begin
  if messagedlg('Delete the selected Process Operation?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ProcessCost := qryProcessCosts.fieldbyname('Cost_Number').asinteger;
      {Delete the sub categories}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost_Category_Sub where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode) + ' AND Cost_Number = ' + inttostr(ProcessCost);
          execsql;
        end;

      {Delete the categories}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost_Category where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode) + ' AND Cost_Number = ' + inttostr(ProcessCost);
          execsql;
        end;

      {Delete the process costs}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode) + ' AND Cost_Number = ' + inttostr(ProcessCost);
          execsql;
        end;
      ShowProcessCosts;
    end;
end;

procedure TPBLUProcessCostFrm.dblstProcessCostsDblClick(Sender: TObject);
begin
  if bIs_lookup then
    begin
      if dblstProcessCosts.ListSource.DataSet.FieldByName('Cost_Description').asstring <> '' then
        btnOKClick(self);
    end
  else
    begin
      if dblstProcessCosts.ListSource.DataSet.FieldByName('Cost_Description').asstring <> '' then
        btnChgPCostClick(self);
    end;
end;

procedure TPBLUProcessCostFrm.CallMaintProcessCostCat(sFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
  CostNumber: integer;
begin
  CostNumber := qryProcessCosts.fieldbyname('Cost_Number').asinteger;
  PBMaintProcessCostCatFrm := TPBMaintProcessCostCatFrm.Create(Self);
  try
    PBMaintProcessCostCatFrm.lblProcessDescription.caption := lblProcessDescription.caption;
    PBMaintProcessCostCatFrm.Customer := Customer;
    PBMaintProcessCostCatFrm.ProcessCode := ProcessCode;
    PBMaintProcessCostCatFrm.PriceUnit := PriceUnitDefault;
    PBMaintProcessCostCatFrm.CostNumber := CostNumber;
    PBMaintProcessCostCatFrm.iCode := qryProcessCostCat.fieldbyname('Category_Number').asinteger;
    PBMaintProcessCostCatFrm.sFuncMode := sFuncMode;
    PBMaintProcessCostCatFrm.ShowModal;
    bTempOK := (PBMaintProcessCostCatFrm.ModalResult = mrOK);
    iTempSel := PBMaintProcessCostCatFrm.iCode;
  finally
    PBMaintProcessCostCatFrm.Free;
  end;
  if bTempOK then
  begin
    ShowProcessCostCategory;
    if sFuncMode <> 'D' then
    begin
//      dblstProcessCostCat.ListSource.DataSet.Locate('Process;Cost_Number;Category_Number', VarArrayOf([ProcessCode,CostNumber,iTempSel]),[lopartialKey]) ;
      dblstProcessCostCat.keyvalue := iTempSel;
    end;
  end;
end;

procedure TPBLUProcessCostFrm.MenuItem1Click(Sender: TObject);
begin
  CallMaintProcessCostCat('A');
end;

procedure TPBLUProcessCostFrm.btnChgPCostCatClick(Sender: TObject);
begin
  CallMaintProcessCostCat('C');
end;

procedure TPBLUProcessCostFrm.btnDelPCostCatClick(Sender: TObject);
var
  ProcessCost, ProcessCat: integer;
begin
  if messagedlg('Delete the selected Operation Category?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ProcessCost := qryProcessCosts.fieldbyname('Cost_Number').asinteger;
      ProcessCat := qryProcessCostCat.fieldbyname('Category_Number').asinteger;
      {Delete the sub categories}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost_Category_Sub where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode) + ' AND Cost_Number = ' + inttostr(ProcessCost)+ ' AND Category_Number = ' + inttostr(ProcessCat);
          execsql;
        end;

      {Delete the categories}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost_Category where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode) + ' AND Cost_Number = ' + inttostr(ProcessCost) + ' AND Category_Number = ' + inttostr(ProcessCat);
          execsql;
        end;

      ShowProcessCostCategory;
    end;
end;

procedure TPBLUProcessCostFrm.MenuItem4Click(Sender: TObject);
begin
  CallMaintProcessCostSub('A');
end;

procedure TPBLUProcessCostFrm.btnChgPCostSubClick(Sender: TObject);
begin
  CallMaintProcessCostSub('C');
end;

procedure TPBLUProcessCostFrm.btnDelPCostSubClick(Sender: TObject);
var
  ProcessCost, ProcessCat, ProcessSub: integer;
begin
  if messagedlg('Delete the selected Sub Category?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ProcessCost := qryProcessCosts.fieldbyname('Cost_Number').asinteger;
      ProcessCat := qryProcessCostCat.fieldbyname('Category_Number').asinteger;
      ProcessSub := qryProcessCostSub.fieldbyname('Sub_Category').asinteger;
      {Delete the sub categories}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost_Category_Sub where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode) + ' AND Cost_Number = ' + inttostr(ProcessCost)+ ' AND Category_Number = '
                      + inttostr(ProcessCat) + ' AND Sub_Category = ' + inttostr(ProcessSub);
          execsql;
        end;
    end;
  ShowProcessCostSubCategory;

end;

procedure TPBLUProcessCostFrm.CallMaintProcessCostSub(sFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
  CostNumber, CatNumber: integer;
begin
  CostNumber := qryProcessCosts.fieldbyname('Cost_Number').asinteger;
  CatNumber := qryProcessCostCat.fieldbyname('Category_Number').asinteger;
  PBMaintProcessCostSubFrm := TPBMaintProcessCostSubFrm.Create(Self);
  try
    PBMaintProcessCostSubFrm.lblProcessDescription.caption := lblProcessDescription.caption;
    PBMaintProcessCostSubFrm.Customer := Customer;
    PBMaintProcessCostSubFrm.ProcessCode := ProcessCode;
    PBMaintProcessCostSubFrm.PriceUnit := PriceUnitDefault;
    PBMaintProcessCostSubFrm.CostNumber := CostNumber;
    PBMaintProcessCostSubFrm.CatNumber := CatNumber;
    PBMaintProcessCostSubFrm.iCode := qryProcessCostSub.fieldbyname('Sub_Category').asinteger;
    PBMaintProcessCostSubFrm.sFuncMode := sFuncMode;
    PBMaintProcessCostSubFrm.ShowModal;
    bTempOK := (PBMaintProcessCostSubFrm.ModalResult = mrOK);
    iTempSel := PBMaintProcessCostSubFrm.iCode;
  finally
    PBMaintProcessCostSubFrm.Free;
  end;
  if bTempOK then
  begin
    ShowProcessCostSubCategory;
    if sFuncMode <> 'D' then
    begin
//      dblstProcessCostSub.ListSource.DataSet.Locate('Process;Cost_Number;Category_Number;Sub_Category', VarArrayOf([ProcessCode,CostNumber,CatNumber,iTempSel]),[lopartialKey]) ;
      dblstProcessCostSub.keyvalue := iTempSel;
    end;
  end;
end;

procedure TPBLUProcessCostFrm.dblstProcessCostCatClick(Sender: TObject);
begin
  if qryProcessCostCat.recordcount > 0 then
    begin
      dbedtunitCost.DataSource := dtsProcessCostCat;
      dbEdtUnitSell.DataSource := dtsProcessCostCat;
      dbPriceUnit.DataSource := dtsProcessCostCat;
      ShowProcessCostSubCategory;
    end;
  ShowDescription;
end;

procedure TPBLUProcessCostFrm.btnOKClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUProcessCostFrm.SelectCode(Sender: TObject);
begin
  SelDescription := lblDescription.Caption;
  SelUnitCost := dbedtUnitCost.DataSource.DataSet.fieldbyname('Unit_Cost').asfloat;
  SelUnitSell := dbedtUnitSell.DataSource.DataSet.fieldbyname('Unit_Sell').asfloat;
  SelPriceUnit := strtoint(dbtxtPriceUnit.caption);

  SelCostNumber := 0;
  SelCatNumber := 0;
  SelSubNumber := 0;
  
  if dblstProcessCostSub.SelectedItem <> '' then
    SelSubNumber := dblstProcessCostSub.keyvalue;

  if dblstProcessCostCat.selecteditem <> '' then
    SelCatNumber := dblstProcessCostCat.keyvalue;

  SelCostNumber := dblstProcessCosts.KeyValue;

  Selected := True;
  Close;
end;

procedure TPBLUProcessCostFrm.dblstProcessCostSubClick(Sender: TObject);
begin
  if qryProcessCostSub.recordcount > 0 then
    begin
      dbedtunitCost.DataSource := dtsProcessCostSub;
      dbEdtUnitSell.DataSource := dtsProcessCostSub;
      dbPriceUnit.DataSource := dtsProcessCostSub;
    end;
  ShowDescription;
end;

procedure TPBLUProcessCostFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
  if Customer = 0 then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
    rgCustomer.ItemIndex := 0;
  end
  else
  begin
    pnlCustSearch.Visible := True;
    edtCustomer.Text := CustomerName;
    rgCustomer.ItemIndex := 1;
  end;

end;

procedure TPBLUProcessCostFrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := Customer;
    PBLUCustFrm.bSel_Branch := false;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      CustomerName := PBLUCustFrm.SelName;
      Customer := PBLUCustFrm.SelCode;
      SelCustCode := Customer;
      edtCustomer.text := PBLUCustFrm.SelName;
      LoadCosts;
    end;
  finally
    PBLUCustFrm.Free;
  end;

end;

procedure TPBLUProcessCostFrm.rgCustomerClick(Sender: TObject);
begin
  if (rgCustomer.ItemIndex = 0) then
  begin
    pnlCustSearch.Visible := False;
    EdtCustomer.Text := '';
    Customer := 0;
    LoadCosts;
  end
  else
  begin
    pnlCustSearch.Visible := True;
    if SelCustCode <> 0 then
      Customer := SelCustCode;
    LoadCosts;
  end;
end;

procedure TPBLUProcessCostFrm.FormCreate(Sender: TObject);
begin
  Customer := 0;
  lblDescription.caption := '';
end;

procedure TPBLUProcessCostFrm.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TPBLUProcessCostFrm.SetPriceUnitDefault(const Value: integer);
begin
  FPriceUnitDefault := Value;
end;

procedure TPBLUProcessCostFrm.dblstProcessCostCatDblClick(Sender: TObject);
begin
  if bIs_lookup then
    begin
      if dblstProcessCostCat.ListSource.DataSet.FieldByName('Cost_Description').asstring <> '' then
        btnOKClick(self);
    end
  else
    if dblstProcessCostCat.ListSource.DataSet.FieldByName('Cost_Description').asstring <> '' then
      btnChgPCostCatClick(self);
end;

procedure TPBLUProcessCostFrm.dblstProcessCostSubDblClick(Sender: TObject);
begin
  if bIs_lookup then
    begin
      if dblstProcessCostSub.ListSource.DataSet.FieldByName('Cost_Description').asstring <> '' then
        btnOKClick(self);
    end
  else
    if dblstProcessCostSub.ListSource.DataSet.FieldByName('Cost_Description').asstring <> '' then
      btnChgPCostSubClick(self);
end;

procedure TPBLUProcessCostFrm.btnCopyPCostClick(Sender: TObject);
begin
  CopyAProcessCost(Customer, Customer);
  ShowProcessCosts;
end;

procedure TPBLUProcessCostFrm.CopyAProcessCost(fromCustomer, toCustomer: integer);
var
  sDescription: string;
  rCost, rSell: double;
  PriceUnit: integer;
  CostNumber, OldCostNumber, OldCatNumber: integer;
begin
  OldCostNumber := qryprocessCosts.fieldbyname('Cost_Number').asinteger;
  sDescription := 'Copy of ' + qryprocessCosts.fieldbyname('Cost_Description').asstring;
  rCost := qryprocessCosts.fieldbyname('Unit_Cost').asfloat;
  rSell := qryprocessCosts.fieldbyname('Unit_Sell').asfloat;
  PriceUnit := qryprocessCosts.fieldbyname('Price_Unit').asinteger;

  with qryAddProcessCost do
    begin
      close;
      parambyname('Customer').asinteger := toCustomer;
      parambyname('Process').asinteger := ProcessCode;
      parambyname('Cost_Description').asstring := sDescription;
      parambyname('Unit_Cost').asfloat := rCost;
      parambyname('Unit_Sell').asfloat := rSell;
      parambyname('Price_Unit').asinteger := PriceUnit;
      execsql;
    end;

  with qryLastCostNumber do
    begin
      close;
      parambyname('Customer').asinteger := toCustomer;
      parambyname('Process').asinteger := ProcessCode;
      open;

      CostNumber := fieldbyname('Last_Number').asinteger;
    end;

  with qryProcessCostCat do
    begin
      close;
      parambyname('Customer').asinteger := fromCustomer;
      parambyname('Process').asinteger := ProcessCode;
      parambyname('Cost_Number').asinteger := OldCostNumber;
      open;
      first;

      while eof <> true do
        begin
          OldCatNumber := fieldbyname('Category_Number').asinteger;
          qryAddProcessCostCat.close;
          qryAddProcessCostCat.parambyname('Customer').asinteger := toCustomer;
          qryAddProcessCostCat.parambyname('Process').asinteger := ProcessCode;
          qryAddProcessCostCat.parambyname('Cost_Number').asinteger := CostNumber;
          qryAddProcessCostCat.parambyname('Cost_Description').asstring := fieldbyname('Cost_Description').asstring;
          qryAddProcessCostcat.parambyname('Unit_Cost').asfloat := fieldbyname('Unit_Cost').asfloat;
          qryAddProcessCostcat.parambyname('Unit_Sell').asfloat := fieldbyname('Unit_Sell').asfloat;
          qryAddProcessCostCat.parambyname('Price_Unit').asinteger := fieldbyname('Price_Unit').asinteger;
          qryAddProcessCostCat.execsql;

          CreateSubCategories(OldCostNumber, OldCatNumber, CostNumber, fromCustomer, toCustomer);
          next;
        end;
    end;
end;

procedure TPBLUProcessCostFrm.CreateSubCategories(OldCostNumber, OldCatNumber, CostNumber, fromCustomer, toCustomer: integer);
var
  sDescription: string;
  rCost, rSell: double;
  PriceUnit: integer;
  CatNumber: integer;
begin
  with qryLastCatNumber do
    begin
      close;
      parambyname('Customer').asinteger := toCustomer;
      parambyname('Process').asinteger := ProcessCode;
      parambyname('Cost_Number').asinteger := CostNumber;
      open;

      CatNumber := fieldbyname('Last_Number').asinteger;
    end;

  with qryProcessCostSub do
    begin
      close;
      parambyname('Customer').asinteger := fromCustomer;
      parambyname('Process').asinteger := ProcessCode;
      parambyname('Cost_Number').asinteger := OldCostNumber;
      parambyname('Category_Number').asinteger := OldCatNumber;
      open;
      first;

      while eof <> true do
        begin

          qryAddProcessCostSub.close;
          qryAddProcessCostSub.parambyname('Customer').asinteger := toCustomer;
          qryAddProcessCostSub.parambyname('Process').asinteger := ProcessCode;
          qryAddProcessCostSub.parambyname('Cost_Number').asinteger := CostNumber;
          qryAddProcessCostSub.parambyname('Category_Number').asinteger := CatNumber;
          qryAddProcessCostSub.parambyname('Cost_Description').asstring := fieldbyname('Cost_Description').asstring;
          qryAddProcessCostSub.parambyname('Unit_Cost').asfloat := fieldbyname('Unit_Cost').asfloat;
          qryAddProcessCostSub.parambyname('Unit_Sell').asfloat := fieldbyname('Unit_Sell').asfloat;
          qryAddProcessCostSub.parambyname('Price_Unit').asinteger := fieldbyname('Price_Unit').asinteger;
          qryAddProcessCostSub.execsql;

          next;
        end;
    end;
end;

procedure TPBLUProcessCostFrm.dblkpProcessClick(Sender: TObject);
begin
  ProcessCode := dblkpProcess.KeyValue;
  LoadCosts;
end;

procedure TPBLUProcessCostFrm.SetSelectProcess(const Value: boolean);
begin
  FSelectProcess := Value;
  if FSelectProcess then
    begin
      with qryProcess do
        begin
          close;
          sql.Text := qryGetPTProcess.sql.Text;
          parambyname('Product_Type').AsInteger := ProductType;
          open;

          if recordcount = 1 then
            begin
              dblkpProcess.KeyValue := fieldbyname('Process').asinteger;
              ProcessCode := fieldbyname('Process').asinteger;
            end;
        end;
    end
  else
    begin
      with qryProcess do
        begin
          close;
          sql.Text := qryGetProcess.sql.Text;
          open;
          if recordcount = 1 then
            begin
              dblkpProcess.KeyValue := fieldbyname('Process').asinteger;
              ProcessCode := fieldbyname('Process').asinteger;
            end;
        end;
    end;
end;

procedure TPBLUProcessCostFrm.SetProductType(const Value: integer);
begin
  FProductType := Value;
end;

procedure TPBLUProcessCostFrm.btnRepClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.bSel_Branch := false;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      edtCopyCustomer.Text := PBLUCustFrm.SelName;
      CopyCustomer := PBLUCustFrm.selcode;
    end;
  finally
    PBLUCustFrm.Free;
  end;
end;

procedure TPBLUProcessCostFrm.SetCopyCustomer(const Value: integer);
begin
  FCopyCustomer := Value;
end;

procedure TPBLUProcessCostFrm.btnCopyClick(Sender: TObject);
begin
  if messagedlg('Confirm you want to replace the existing process charges for this customer?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost_Category_Sub where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode);
          execsql;
        end;

      {Delete the categories}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost_Category where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode);
          execsql;
        end;

      {Delete the process costs}
      with qryDelete do
        begin
          close;
          SQL.clear;
          sql.text := 'Delete from Process_Cost where Customer = ' + inttostr(Customer) + ' AND Process = '
                      + inttostr(ProcessCode);
          execsql;
        end;
      newCustomer := Customer;
      Customer := CopyCustomer;
      LoadCosts;
      CopyCosts;
      Customer := NewCustomer;
      ShowProcessCosts;
    end;
end;

procedure TPBLUProcessCostFrm.CopyCosts;
begin
  with qryProcessCosts do
    begin
      first;
      while eof <> true do
        begin
          CopyAProcessCost(Customer, NewCustomer);
          next;
        end;
    end;
end;

end.
