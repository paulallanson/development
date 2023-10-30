unit pbLUCustQuotesJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, pbQuotesDM, Db;

type
  TfrmpbluCustQuotesJB = class(TForm)
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
  private
    dtmdlCustQuotes: TdtmdlQuotes;
    FDisableNameChangeEvent: boolean;
    FBranch: integer;
    FCustomer: integer;
    procedure SetDisableNameChangeEvent(const Value: boolean);
    procedure SetBranch(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetButtons(Sender: TObject; Field: TField);
    function CheckInput: boolean;
  public
    bNot_in_JB, Selected: boolean;
    CustomerName: string;
    SelCode: real;
    JobBagNo: integer;
    property Branch: integer read FBranch write SetBranch;
    property Customer: integer read FCustomer write SetCustomer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmpbluCustQuotesJB: TfrmpbluCustQuotesJB;

implementation

uses UITypes, PBAutoPO;

{$R *.DFM}

procedure TfrmpbluCustQuotesJB.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
  dtmdlCustQuotes := TdtmdlQuotes.create(self);
  dtmdlCustQuotes.dtsQuotesJB.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlCustQuotes.dtsQuotesJB;
end;

procedure TfrmpbluCustQuotesJB.FormDestroy(Sender: TObject);
begin
  dtmdlCustQuotes.free;
end;

procedure TfrmpbluCustQuotesJB.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustQuotes.refreshdataJB;
end;

procedure TfrmpbluCustQuotesJB.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustQuotes.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustQuotesJB.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustQuotesJB.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TfrmpbluCustQuotesJB.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmpbluCustQuotesJB.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustQuotes do
  begin
    btnSelect.Enabled := HeaderCountJB > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Quote').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderCountJB) + ' records displayed';
  end;
end;

procedure TfrmpbluCustQuotesJB.FormShow(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  dtmdlCustQuotes.Customer := FCustomer;
  dtmdlCustQuotes.refreshdataJB;
end;

procedure TfrmpbluCustQuotesJB.btnCloseClick(Sender: TObject);
begin
  selected := false;
  close;
end;

procedure TfrmpbluCustQuotesJB.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnSelectclick(self);


end;

procedure TfrmpbluCustQuotesJB.btnSelectClick(Sender: TObject);
var
  iTempSel: integer;
  iTempLine: integer;
  iStatus: integer;
begin
  if not CheckInput then
    exit;
  SelCode := dbgDetails.datasource.DataSet.FieldByName('Quote').asinteger;
  Selected := true;
  close;
end;

function TfrmpbluCustQuotesJB.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Quote', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Quote '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustQuotesJB.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Quote').asstring <> '' then
    btnSelectClick(self);
end;

end.
