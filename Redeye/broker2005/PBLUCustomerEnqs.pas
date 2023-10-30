unit pbLUCustomerEnqs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, pbEnqsDM, Db;

type
  TPBLUCustomerEnqsFrm = class(TForm)
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    edtNumber: TEdit;
    stsbrDetails: TStatusBar;
    tmrSearch: TTimer;
    btnSelect: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    dtmdlCustEnqs: TdtmdlEnqs;
    FDisableNameChangeEvent: boolean;
    FBranch: integer;
    FCustomer: integer;
    FSearchType: string;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetBranch(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    function CheckInput: boolean;
    procedure SetSearchType(const Value: string);
  public
    bNot_in_JB, Selected: boolean;
    CustomerName: string;
    SelCode: integer;
    SelLine: integer;
    SelDescription: string;
    JobBagNo: integer;
    property Branch: integer read FBranch write SetBranch;
    property Customer: integer read FCustomer write SetCustomer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
    property SearchType: string read FSearchType write SetSearchType;
  end;

var
  PBLUCustomerEnqsFrm: TPBLUCustomerEnqsFrm;

implementation

uses UITypes, PBAutoPO;

{$R *.DFM}

procedure TPBLUCustomerEnqsFrm.FormCreate(Sender: TObject);
begin
  Selected := false;
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
  dtmdlCustEnqs := TdtmdlEnqs.create(self);
  dbgDetails.Datasource := dtmdlCustEnqs.dtsEnqsJB;
  dtmdlCustEnqs.dtsEnqsJB.OnDataChange := SetButtons;
end;

procedure TPBLUCustomerEnqsFrm.FormDestroy(Sender: TObject);
begin
  dtmdlCustEnqs.free;
end;

procedure TPBLUCustomerEnqsFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  if SearchType = 'A' then
    dtmdlCustEnqs.refreshdataCustomer
  else
    dtmdlCustEnqs.refreshdataJB;
end;

procedure TPBLUCustomerEnqsFrm.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustEnqs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TPBLUCustomerEnqsFrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBLUCustomerEnqsFrm.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TPBLUCustomerEnqsFrm.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TPBLUCustomerEnqsFrm.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustEnqs do
  begin
    btnSelect.Enabled := HeaderJBCount > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderJBCount) + ' records displayed';
  end;
end;

procedure TPBLUCustomerEnqsFrm.FormShow(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  dtmdlCustEnqs.Customer := FCustomer;
  dtmdlCustEnqs.Description := edtSearch.Text;
  if SearchType = 'A' then
    dtmdlCustEnqs.refreshdataCustomer
  else
    dtmdlCustEnqs.refreshdataJB;
end;

procedure TPBLUCustomerEnqsFrm.btnCloseClick(Sender: TObject);
begin
  selected := false;
  close;
end;

procedure TPBLUCustomerEnqsFrm.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnSelectclick(self);
end;

procedure TPBLUCustomerEnqsFrm.btnSelectClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  SelCode := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  SelLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  SelDescription := dbgDetails.datasource.DataSet.FieldByName('Description').asstring;
  Selected := true;
  close;
end;

function TPBLUCustomerEnqsFrm.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Enquiry', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Enquiry '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TPBLUCustomerEnqsFrm.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Enquiry').asstring <> '' then
    btnSelectClick(self);
end;

procedure TPBLUCustomerEnqsFrm.FormActivate(Sender: TObject);
begin
  dbgDetails.datasource := dtmdlCustEnqs.dtsEnqsJB;
end;

procedure TPBLUCustomerEnqsFrm.SetSearchType(const Value: string);
begin
  FSearchType := Value;
end;

end.
