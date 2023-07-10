unit pbLUContractCustomerJobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, pbJobsDm;

type
  TPBLUContractCustomerJobsFrm = class(TForm)
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
    FContract: integer;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetBranch(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    function CheckInput: boolean;
    procedure SetCustOrderNo(const Value: string);
    procedure SetQuantity(const Value: integer);
    procedure SetContract(const Value: integer);
    procedure AddToContract(iJobBag: integer);
    procedure AddPOToContract(iJobBag: integer);
  public
    CustomerName: string;
    Selected: boolean;
    SelCode: real;
    SelLine: integer;
    SelDescription: string;
    property Branch: integer read FBranch write SetBranch;
    property Contract: integer read FContract write SetContract;
    property Customer: integer read FCustomer write SetCustomer;
    property CustOrderNo: string read FCustOrderNo write SetCustOrderNo;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property Quantity: integer read FQuantity write SetQuantity;
  end;

var
  PBLUContractCustomerJobsFrm: TPBLUContractCustomerJobsFrm;

implementation

{$R *.DFM}

procedure TPBLUContractCustomerJobsFrm.FormCreate(Sender: TObject);
begin
  dtmdlCustJobs := TdtmdlJobs.create(self);
  dtmdlCustJobs.dtsContractJobs.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlCustJobs.dtsContractJobs;
end;

procedure TPBLUContractCustomerJobsFrm.FormDestroy(Sender: TObject);
begin
  dtmdlCustJobs.free;
end;

procedure TPBLUContractCustomerJobsFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustJobs.RefreshContractJobs;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TPBLUContractCustomerJobsFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustJobs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUContractCustomerJobsFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUContractCustomerJobsFrm.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TPBLUContractCustomerJobsFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBLUContractCustomerJobsFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustJobs do
  begin
    btnSelect.Enabled := HeaderContractJobCount > 0;
    edtJobBag.text := dbgDetails.datasource.dataset.fieldbyname('Job_Bag').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderContractJobCount) + ' records displayed';
  end;
end;

procedure TPBLUContractCustomerJobsFrm.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TPBLUContractCustomerJobsFrm.edtJobBagKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnSelectclick(self);
end;

procedure TPBLUContractCustomerJobsFrm.btnSelectClick(Sender: TObject);
var
  icount: integer;
begin
  if dbgDetails.SelectedRows.Count = 1 then
    begin
      AddToContract(dbgDetails.datasource.DataSet.fieldbyname('Job_Bag').asinteger);
      AddPOToContract(dbgDetails.datasource.DataSet.fieldbyname('Job_Bag').asinteger);
    end
  else
    begin
      if MessageDlg('Do you want to inserted the selected jobs into the contract?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
            begin
              dbgDetails.datasource.DataSet.GotoBookmark(Pointer(dbgDetails.SelectedRows[iCount])) ;
              AddToContract(dbgDetails.datasource.DataSet.fieldbyname('Job_Bag').asinteger);
              AddPOToContract(dbgDetails.datasource.DataSet.fieldbyname('Job_Bag').asinteger);
            end;
        end;
    end;
  Selected := true;
  close;
end;

function TPBLUContractCustomerJobsFrm.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Job_Bag', Variant(edtJobBag.text),[lopartialKey]) then
    begin
      messagedlg('Job Bag '+ edtJobBag.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TPBLUContractCustomerJobsFrm.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Job_Bag').asstring <> '' then
    btnSelectClick(self);
end;

procedure TPBLUContractCustomerJobsFrm.SetCustOrderNo(const Value: string);
begin
  FCustOrderNo := Value;
end;

procedure TPBLUContractCustomerJobsFrm.SetQuantity(const Value: integer);
begin
  FQuantity := Value;
end;

procedure TPBLUContractCustomerJobsFrm.FormActivate(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  dtmdlCustJobs.Customer := FCustomer;
  dtmdlCustJobs.Contract := FContract;
  dtmdlCustJobs.RefreshContractJobs;
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
  edtJobBag.setfocus;
end;

procedure TPBLUContractCustomerJobsFrm.SetContract(const Value: integer);
begin
  FContract := Value;
end;

procedure TPBLUContractCustomerJobsFrm.AddToContract(iJobBag: integer);
begin
  with dtmdlCustJobs.qryAddToContract do
    begin
      close;
      parambyname('Contract').asinteger := self.Contract;
      parambyname('Job_Bag').asinteger := iJobBag;
      execsql;
    end;
end;

procedure TPBLUContractCustomerJobsFrm.AddPOToContract(iJobBag: integer);
begin
  with dtmdlCustJobs.qryGetJobBagPOs do
    begin
      close;
      parambyname('Contract').asinteger := self.Contract;
      parambyname('Job_Bag').asinteger := iJobBag;
      open;

      if recordcount > 0 then
        begin
          first;
          while eof <> true do
            begin
              dtmdlCustJobs.qryAddPOtoContract.close;
              dtmdlCustJobs.qryAddPOtoContract.parambyname('Contract').asinteger := self.Contract;
              dtmdlCustJobs.qryAddPOtoContract.parambyname('Purchase_Order').asfloat := dtmdlCustJobs.qryGetJobBagPOs.fieldbyname('Purchase_Order').asfloat;
              dtmdlCustJobs.qryAddPOtoContract.execsql;
              next;
            end;
        end;
    end;
end;

end.
