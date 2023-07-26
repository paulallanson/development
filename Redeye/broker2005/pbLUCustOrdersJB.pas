unit pbLUCustOrdersJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, pbOrdersDM, Db;

type
  TfrmpbluCustOrdersJB = class(TForm)
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    edtOrder: TEdit;
    stsbrDetails: TStatusBar;
    tmrSearch: TTimer;
    btnSelect: TButton;
    chkbxShowAll: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtOrderKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowAllClick(Sender: TObject);
  private
    dtmdlCustOrders: TdtmdlOrders;
    FDisableNameChangeEvent: boolean;
    FBranch: integer;
    FCustomer: integer;
    FQuantity: integer;
    FCustOrderNo: string;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetBranch(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    function CheckInput: boolean;
    procedure SetCustOrderNo(const Value: string);
    procedure SetQuantity(const Value: integer);
  public
    bNot_in_JB, Selected, bShowInvoiced: boolean;
    CustomerName: string;
    ExistingOrders: string;
    SelCode: real;
    SelLine: integer;
    property Branch: integer read FBranch write SetBranch;
    property Customer: integer read FCustomer write SetCustomer;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property Quantity: integer read FQuantity write SetQuantity;
  end;

var
  frmpbluCustOrdersJB: TfrmpbluCustOrdersJB;

implementation

{$R *.DFM}

procedure TfrmpbluCustOrdersJB.FormCreate(Sender: TObject);
begin
  dtmdlCustOrders := TdtmdlOrders.create(self);
  dtmdlCustOrders.dtsOrders.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlCustOrders.dtsOrders;
end;

procedure TfrmpbluCustOrdersJB.FormDestroy(Sender: TObject);
begin
  dtmdlCustOrders.free;
end;

procedure TfrmpbluCustOrdersJB.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustOrders.ExistingOrders := ExistingOrders;
  dtmdlCustOrders.refreshJBdata;
end;

procedure TfrmpbluCustOrdersJB.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustOrders.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustOrdersJB.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustOrdersJB.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TfrmpbluCustOrdersJB.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmpbluCustOrdersJB.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustOrders do
  begin
    btnSelect.Enabled := HeaderCount > 0;
    edtOrder.text := dbgDetails.datasource.dataset.fieldbyname('Sales_order').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustOrdersJB.FormShow(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  dtmdlCustOrders.Customer := FCustomer;
  dtmdlCustOrders.Branch := FBranch;
  dtmdlCustOrders.NotinJobBag := bNot_in_JB;
  dtmdlCustOrders.ShowInvoiced := bShowInvoiced;
  dtmdlCustOrders.ExistingOrders := ExistingOrders;
  dtmdlCustOrders.RefreshJBData;
end;

procedure TfrmpbluCustOrdersJB.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustOrdersJB.edtOrderKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnSelectclick(self);


end;

procedure TfrmpbluCustOrdersJB.btnSelectClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  SelCode := dbgDetails.DataSource.dataset.fieldbyname('sales_Order').asfloat;
  SelLine := dbgDetails.DataSource.dataset.fieldbyname('Line').asinteger;
  Selected := true;
  
  close;
end;

function TfrmpbluCustOrdersJB.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('sales_Order', Variant(edtOrder.text),[lopartialKey]) then
    begin
      messagedlg('Order '+ edtOrder.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustOrdersJB.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Sales_order').asstring <> '' then
    btnSelectClick(self);
end;

procedure TfrmpbluCustOrdersJB.chkbxShowAllClick(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustOrders.ShowInvoiced := (sender as TCheckbox).Checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustOrdersJB.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TfrmpbluCustOrdersJB.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

end.
