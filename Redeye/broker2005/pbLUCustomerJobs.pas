unit pbLUCustomerJobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, pbJobsDm;

type
  TPBLUCustomerJobsFrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    edtJobBag: TEdit;
    stsbrDetails: TStatusBar;
    tmrSearch: TTimer;
    btnSelect: TButton;
    dbgDetails: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtJobBagKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    dtmdlCustJobs: TdtmdlJobs;
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
    Selected: boolean;
    CustomerName: string;
    SelCode: real;
    SelLine: integer;
    SelDescription: string;
    property Branch: integer read FBranch write SetBranch;
    property Customer: integer read FCustomer write SetCustomer;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property Quantity: integer read FQuantity write SetQuantity;
  end;

var
  PBLUCustomerJobsFrm: TPBLUCustomerJobsFrm;

implementation

{$R *.DFM}

procedure TPBLUCustomerJobsFrm.FormCreate(Sender: TObject);
begin
  dtmdlCustJobs := TdtmdlJobs.create(self);
  dtmdlCustJobs.dtsJobs.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlCustJobs.dtsJobs;
end;

procedure TPBLUCustomerJobsFrm.FormDestroy(Sender: TObject);
begin
  dtmdlCustJobs.free;
end;

procedure TPBLUCustomerJobsFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustJobs.refreshdata;
end;

procedure TPBLUCustomerJobsFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustJobs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUCustomerJobsFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUCustomerJobsFrm.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TPBLUCustomerJobsFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBLUCustomerJobsFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustJobs do
  begin
    btnSelect.Enabled := HeaderCount > 0;
    edtJobBag.text := dbgDetails.datasource.dataset.fieldbyname('Job_Bag').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TPBLUCustomerJobsFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBLUCustomerJobsFrm.edtJobBagKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnSelectclick(self);
end;

procedure TPBLUCustomerJobsFrm.btnSelectClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  SelCode := dbgDetails.DataSource.dataset.fieldbyname('Job_Bag').asfloat;
  SelDescription := dbgDetails.DataSource.dataset.fieldbyname('Job_bag_Descr').asstring;
  Selected := true;

  close;
end;

function TPBLUCustomerJobsFrm.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Job_Bag', Variant(edtJobBag.text),[lopartialKey]) then
    begin
      messagedlg('Job Bag '+ edtJobBag.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TPBLUCustomerJobsFrm.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Job_Bag').asstring <> '' then
    btnSelectClick(self);
end;

procedure TPBLUCustomerJobsFrm.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TPBLUCustomerJobsFrm.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TPBLUCustomerJobsFrm.FormActivate(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  dtmdlCustJobs.Customer := FCustomer;
  dtmdlCustJobs.JobDate := 32874;
  dtmdlCustJobs.RefreshData;
end;

end.
