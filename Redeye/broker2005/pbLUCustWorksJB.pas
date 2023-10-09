unit pbLUCustWorksJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Db, PBWOrdersDm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmpbluCustWorksJB = class(TForm)
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnClose: TButton;
    edtSearch: TEdit;
    edtOrder: TEdit;
    stsbrDetails: TStatusBar;
    tmrSearch: TTimer;
    Query1: TFDQuery;
    btnSelect: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtOrderKeyPress(Sender: TObject; var Key: Char);
    procedure btnSelectClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
  private
    dtmdlCustWOrders: TdtmdlWOrders;
    FDisableNameChangeEvent: boolean;
    FBranch: integer;
    FCustomer: integer;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetBranch(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    function CheckInput: boolean;
    function OKtoRepeat: boolean;
  public
    JobBag: integer;
    bNot_in_JB, Selected: boolean;
    CustomerName: string;
    SelCode: integer;
    SelNumber, SelQty: real;
    SelDescription: string;
    DateRequired, StartDate, SelDate: TDateTime;
    property Branch: integer read FBranch write SetBranch;
    property Customer: integer read FCustomer write SetCustomer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmpbluCustWorksJB: TfrmpbluCustWorksJB;

implementation

uses UITypes;
{$R *.DFM}

procedure TfrmpbluCustWorksJB.FormCreate(Sender: TObject);
begin
  dtmdlCustWOrders := TdtmdlWOrders.create(self);
  dtmdlCustWOrders.dtsWOHeaderGrid.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlCustWOrders.dtsWOHeaderGrid;
end;

procedure TfrmpbluCustWorksJB.FormDestroy(Sender: TObject);
begin
  dtmdlCustWOrders.free;
end;

procedure TfrmpbluCustWorksJB.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustWOrders.refreshJBdata;
end;

procedure TfrmpbluCustWorksJB.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustWOrders.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustWorksJB.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustWorksJB.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TfrmpbluCustWorksJB.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmpbluCustWorksJB.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustWOrders do
  begin
    btnSelect.Enabled := HeaderCount > 0;
    edtOrder.text := dbgDetails.datasource.dataset.fieldbyname('Works_Order_Number').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustWorksJB.FormShow(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  dtmdlCustWOrders.Customer := FCustomer;
  dtmdlCustWOrders.NotinJobBag := bNot_in_JB;
  dtmdlCustWOrders.JobBag := inttostr(JobBag);
  dtmdlCustWOrders.RefreshJBData;
end;

procedure TfrmpbluCustWorksJB.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluCustWorksJB.edtOrderKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnSelectclick(self);


end;

procedure TfrmpbluCustWorksJB.btnSelectClick(Sender: TObject);
begin
  if not CheckInput then
    exit;

  SelCode := dbgDetails.DataSource.dataset.fieldbyname('Works_Order').asinteger;
  SelNumber := dbgDetails.DataSource.dataset.fieldbyname('Works_Order_Number').asfloat;
  SelQty := dbgDetails.DataSource.dataset.fieldbyname('Actual_Quantity').asfloat;
  SelDescription := dbgDetails.DataSource.dataset.fieldbyname('Description').asstring;
  SelDate := dbgDetails.DataSource.dataset.fieldbyname('Date_Point').asdatetime;
  StartDate := dbgDetails.DataSource.dataset.fieldbyname('Date_Start').asdatetime;
  DateRequired := dbgDetails.DataSource.dataset.fieldbyname('Date_Required').asdatetime;

  if OKtoRepeat then
    begin
      Selected := true;
      close;
    end
  else messagedlg('Sorry, this Works Instruction contains inactive processes, therefore it cannot be repeated. Please create a new Works Instruction by selecting the relevant processes within the job bag.', mtInformation, [mbOk], 0);
end;

function TfrmpbluCustWorksJB.OKtoRepeat: boolean;
begin
  with dtmdlCustWOrders.qryGetWIProcess do
    begin
      close;
      parambyname('Works_Order').asinteger := selcode;
      open;

      while eof <> true do
        begin
          if fieldbyname('inactive').asstring = 'Y' then
            begin
              result := false;
              exit;
            end;
          next;
        end;
    end;
  result := true;
end;

function TfrmpbluCustWorksJB.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Works_Order_Number', Variant(edtOrder.text),[lopartialKey]) then
    begin
      messagedlg('Works Instruction '+ edtOrder.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustWorksJB.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Works_Order_Number').asstring <> '' then
    btnSelectClick(self);
end;

end.
