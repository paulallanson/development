unit WTMaintContractConvertOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, DB, Grids, DBGrids,
  ExtCtrls, wtDataModule, Spin,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintContractConvertOrder = class(TForm)
    qryWorktops1: TFDQuery;
    dtsWorktops1: TDataSource;
    qryGetQElement: TFDQuery;
    qryGetWTThickness: TFDQuery;
    qryThickness: TFDQuery;
    dtsThickness: TDataSource;
    pnlFooter: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    pnlReference: TPanel;
    Label1: TLabel;
    edtReference: TEdit;
    pnlHeader: TPanel;
    Label2: TLabel;
    dblkpWorktops: TDBLookupComboBox;
    dblkpThickness: TDBLookupComboBox;
    Label3: TLabel;
    dtsSalesOrders: TDataSource;
    qrySalesOrders: TFDQuery;
    dbgDetails: TDBGrid;
    qryGetMaterialSlabSize: TFDQuery;
    qryGetQSlab: TFDQuery;
    Label9: TLabel;
    edtCustomerPO: TEdit;
    lblNoOfOrders: TLabel;
    spnNoOfOrders: TSpinEdit;
    pnlSiteLocation: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtDeveloper: TEdit;
    edtSitePhone: TEdit;
    edtSiteContact: TEdit;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    edtCounty: TEdit;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label8: TLabel;
    dblkpUpstand: TDBLookupComboBox;
    Label13: TLabel;
    edtCustomerName: TEdit;
    btnCustomer: TBitBtn;
    pnlCustomerBranch: TPanel;
    Label14: TLabel;
    edtSiteName: TEdit;
    btnCustomerBranch: TBitBtn;
    btnClearCustomerBranch: TSpeedButton;
    qryWorktops2: TFDQuery;
    dtsWorktops2: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpThicknessClick(Sender: TObject);
    procedure rktopsClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnCustomerBranchClick(Sender: TObject);
    procedure btnClearCustomerBranchClick(Sender: TObject);
  private
    FMaterial: integer;
    FQuote: integer;
    FWorktop: integer;
    FGroupNumber: integer;
    FCustomer: integer;
    FThickness: integer;
    FMode: string;
    FSalesOrder: integer;
    FSupplier: integer;
    FUnitCost: real;
    FSlabLength: integer;
    FSlabDepth: integer;
    FPriceUnit: integer;
    FUpstand: integer;
    FCustomerBranch: integer;
    FBranchExist: boolean;
    procedure SetMaterial(const Value: integer);
    procedure SetQuote(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetGroupNumber(const Value: integer);
    procedure SetThickness(const Value: integer);
    procedure SetMode(const Value: string);
    procedure ShowSalesOrders;
    procedure SetSalesOrder(const Value: integer);
    procedure SetSupplier(const Value: integer);
    procedure SetUnitCost(const Value: real);
    procedure SetSlabDepth(const Value: integer);
    procedure SetSlabLength(const Value: integer);
    procedure SetPriceUnit(const Value: integer);
    procedure SetUpstand(const Value: integer);
    procedure SetCustomerBranch(const Value: integer);
    procedure SetBranchExist(const Value: boolean);
    { Private declarations }
  public
    bOK: boolean;
    property BranchExist: boolean read FBranchExist write SetBranchExist;
    property Customer: integer read FCustomer write SetCustomer;
    property CustomerBranch: integer read FCustomerBranch write SetCustomerBranch;
    property GroupNumber: integer read FGroupNumber write SetGroupNumber;
    property Material: integer read FMaterial write SetMaterial;
    property Mode: string read FMode write SetMode;
    property PriceUnit: integer read FPriceUnit write SetPriceUnit;
    property Quote: integer read FQuote write SetQuote;
    property SalesOrder: integer read FSalesOrder write SetSalesOrder;
    property SlabDepth: integer read FSlabDepth write SetSlabDepth;
    property SlabLength: integer read FSlabLength write SetSlabLength;
    property Supplier: integer read FSupplier write SetSupplier;
    property Thickness: integer read FThickness write SetThickness;
    property UnitCost: real read FUnitCost write SetUnitCost;
    property Upstand: integer read FUpstand write SetUpstand;
    property Worktop: integer read FWorktop write SetWorktop;
  end;

var
  frmWTMaintContractConvertOrder: TfrmWTMaintContractConvertOrder;

implementation

{$R *.dfm}

uses
  System.UITypes,
  AllCommon, WTSrchCustomer, WTLUCustomerSite, wtMain;

{ TfrmWTMaintContractConvertOrder }

procedure TfrmWTMaintContractConvertOrder.SetMaterial(
  const Value: integer);
begin
  FMaterial := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetQuote(const Value: integer);
begin
  FQuote := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintContractConvertOrder.FormActivate(Sender: TObject);
var
  sText: string;
begin
  if FMode = 'C' then
    begin
      AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
      self.Caption := 'Convert to Order';
      dbgDetails.visible := false;
      self.Height := 532;
      self.Width := 620;
      self.BorderStyle := bsDialog;
    end
  else
    begin
      AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
      self.Caption := 'Add to Order';
      dbgDetails.visible := true;
      pnlReference.Visible := false;
      pnlSiteLocation.Visible := false;
      self.Height := 670;
      lblNoOfOrders.Visible := false;
      spnNoOfOrders.Visible := false;

      ShowSalesOrders;
    end;

  with qryWorktops1 do
    begin
      close;
      parambyname('Customer').asinteger := self.Customer;
      parambyname('Group_Number').asinteger := GroupNumber;
      open;
      first;

      if recordcount = 1 then
        begin
          dblkpWorktops.KeyValue := fieldbyname('Worktop').asinteger;
        end;

      Supplier := fieldbyname('Supplier').asinteger;
      Material := fieldbyname('Material_Type').asinteger;
    end;

  with qryWorktops2 do
    begin
      close;
      parambyname('Customer').asinteger := self.Customer;
      parambyname('Group_Number').asinteger := GroupNumber;
      open;
      first;

      if recordcount = 1 then
        begin
          dblkpUpstand.KeyValue := fieldbyname('Worktop').asinteger;
        end;

    end;


  with qryThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Customer').asinteger := Customer;
      parambyname('Group_Number').asinteger := GroupNumber;
      open;
    end;

  with qryGetMaterialSlabSize do
    begin
      close;
      parambyname('Material_Type').asinteger := Material;
      open;

      first;
      SlabLength := fieldbyname('Length').asinteger;
      SlabDepth := fieldbyname('Depth').asinteger;
    end;

  dblkpThickness.KeyValue := Self.Thickness;
  dblkpThicknessClick(self);
end;

procedure TfrmWTMaintContractConvertOrder.ShowSalesOrders;
begin
  with qrySalesOrders do
    begin
      close;
      parambyname('Customer').asinteger := Customer;
      open;
    end;
end;

procedure TfrmWTMaintContractConvertOrder.SetCustomer(
  const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetGroupNumber(
  const Value: integer);
begin
  FGroupNumber := Value;
end;

procedure TfrmWTMaintContractConvertOrder.btnOKClick(Sender: TObject);
var
  iThickness: integer;
begin
  if (Mode = 'A') and (messagedlg('Confirm that you want to add theses details to the selected sales order', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    begin
      exit;
    end;


  Worktop := dblkpWorktops.keyvalue;
  Thickness := dblkpThickness.keyvalue;
  Upstand := dblkpUpstand.keyvalue;

  if Mode = 'A' then
    begin
      SalesOrder := qrySalesOrders.fieldbyname('Sales_Order').asinteger;
      edtReference.text := qrySalesOrders.fieldbyname('Reference').asstring;
    end
  else
    SalesOrder := 0;

  {Check the thickness in the quote}
  if dtmdlWorktops.UseSlabContractQuoting then
    begin
      with qryGetQSlab do
        begin
          close;
          parambyname('Quote').asinteger := self.Quote;
          open;
          if recordcount > 0 then
            iThickness := fieldbyname('Thickness').asinteger
          else
            iThickness := self.Thickness;
        end;
    end
  else
    begin
      with qryGetQElement do
        begin
          close;
          parambyname('Quote').asinteger := self.Quote;
          open;

          if recordcount > 0 then
            iThickness := fieldbyname('Thickness').asinteger
          else
            iThickness := self.Thickness;
        end;
    end;

  {Now check that a worktop/thickness record exists so that we can replace the original quote and maintain data integrity}
  with qryGetWTThickness do
    begin
      close;
      parambyname('Worktop').asinteger := Worktop;
      parambyname('Thickness').asinteger := iThickness;
      open;
      if recordcount = 0 then
        begin
          messagedlg('This worktop colour doesn''t have a corresponding thickness as defined in the contract quote. ' +
                      'Please add the relevant size for this colour.', mtInformation, [mbOk], 0);
          exit;
        end;
    end;
  bOK := true;
  close;
end;

procedure TfrmWTMaintContractConvertOrder.EnableOK(Sender: TObject);
begin
  if Mode = 'C' then
    btnOK.enabled :=  (dblkpWorktops.Text <> '') and
                      (dblkpThickness.text <> '') and
                      (edtStreet.text <> '') and
                      (edtCustomerName.text <> '') and
                      (edtPostcode.text <> '') and
                      (edtSiteContact.text <> '') and
                      (edtSitePhone.text <> '') and
                      (edtReference.text <> '') and
                      (edtCustomerPO.text <> '')
  else
    btnOK.enabled :=  (dblkpWorktops.Text <> '') and
                      (dblkpThickness.text <> '');
end;

procedure TfrmWTMaintContractConvertOrder.BitBtn2Click(Sender: TObject);
begin
  bOK := false;
  close;
end;

procedure TfrmWTMaintContractConvertOrder.SetThickness(
  const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TfrmWTMaintContractConvertOrder.FormCreate(Sender: TObject);
begin
  self.Caption := 'Convert to Order';
  dbgDetails.visible := false;
  self.Height := 175;
  self.Width := 560;
  self.BorderStyle := bsDialog;
  Customer := 0;
end;

procedure TfrmWTMaintContractConvertOrder.FormDestroy(Sender: TObject);
begin
//  if Mode = 'A' then
    AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintContractConvertOrder.SetSalesOrder(
  const Value: integer);
begin
  FSalesOrder := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetSupplier(
  const Value: integer);
begin
  FSupplier := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetUnitCost(const Value: real);
begin
  FUnitCost := Value;
end;

procedure TfrmWTMaintContractConvertOrder.dblkpThicknessClick(
  Sender: TObject);
begin
  UnitCost := qryThickness.fieldbyname('Unit_Cost').asfloat;
  PriceUnit := qryThickness.fieldbyname('Price_unit').asinteger;
  EnableOK(self);
end;

procedure TfrmWTMaintContractConvertOrder.SetSlabDepth(
  const Value: integer);
begin
  FSlabDepth := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetSlabLength(
  const Value: integer);
begin
  FSlabLength := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetPriceUnit(
  const Value: integer);
begin
  FPriceUnit := Value;
end;

procedure TfrmWTMaintContractConvertOrder.rktopsClick(
  Sender: TObject);
begin
  dblkpUpstand.keyvalue := dblkpWorktops.keyvalue;
  EnableOK(self);
end;

procedure TfrmWTMaintContractConvertOrder.SetUpstand(const Value: integer);
begin
  FUpstand := Value;
end;

procedure TfrmWTMaintContractConvertOrder.btnCustomerClick(
  Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := self.Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        self.Customer := frmwtSrchCustomer.CodeSelected;
//        self.CustomerName := frmwtSrchCustomer.NameSelected;
        edtCustomerName.text := frmwtSrchCustomer.NameSelected;
      end
  finally
    frmwtSrchCustomer.free;
  end;

  if Mode <> 'C' then
    ShowSalesOrders;
end;

procedure TfrmWTMaintContractConvertOrder.btnCustomerBranchClick(
  Sender: TObject);
var
  sInstallName, sInstallPhone: string;
begin
  frmWTLUCustomerSite := TfrmWTLUCustomerSite.create(self);
  try
    frmWTLUCustomerSite.Customer := self.Customer;
    frmWTLUCustomerSite.isLookup := true;
    frmWTLUCustomerSite.showmodal;
    if frmWTLUCustomerSite.selected then
      begin
        self.CustomerBranch := frmWTLUCustomerSite.SelectedCode;
        self.BranchExist := dtmdlWorktops.DoesCustomerBranchExist(self.Customer);
        edtSiteName.Text := dtmdlWorktops.GetAddressName(frmWTLUCustomerSite.SelectedAddress);
        edtStreet.Text := dtmdlWorktops.GetAddressStreet(frmWTLUCustomerSite.SelectedAddress);
        edtLocale.Text := dtmdlWorktops.GetAddressLocale(frmWTLUCustomerSite.SelectedAddress);
        edtTown.Text := dtmdlWorktops.GetAddressTown(frmWTLUCustomerSite.SelectedAddress);
        edtPostcode.Text := dtmdlWorktops.GetAddressPostcode(frmWTLUCustomerSite.SelectedAddress);
        edtCounty.Text := dtmdlWorktops.GetAddressCounty(frmWTLUCustomerSite.SelectedAddress) ;

        sInstallName := frmWTLUCustomerSite.SelectedInstallName;
        sInstallPhone := frmWTLUCustomerSite.SelectedInstallMobile;

      end;
  finally
    frmWTLUCustomerSite.free;
  end;

  if (trim(edtSiteContact.Text) <> '') or (trim(edtSitePhone.Text) <> '') then
    begin
      if messagedlg('Overwite the existing site contact details?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          edtSiteContact.Text := sInstallName;
          edtSitePhone.Text := sInstallPhone;
        end;
    end
  else
    begin
      edtSiteContact.Text := sInstallName;
      edtSitePhone.Text := sInstallPhone;
    end;
end;

procedure TfrmWTMaintContractConvertOrder.SetCustomerBranch(
  const Value: integer);
begin
  FCustomerBranch := Value;
end;

procedure TfrmWTMaintContractConvertOrder.SetBranchExist(
  const Value: boolean);
begin
  FBranchExist := Value;
end;

procedure TfrmWTMaintContractConvertOrder.btnClearCustomerBranchClick(
  Sender: TObject);
begin
  self.CustomerBranch := 0;
  edtSiteName.Text := '';
end;

end.
