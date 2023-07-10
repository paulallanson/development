unit pbLUCustEnqsJB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, pbEnqsDM, Db, DBTables;

type
  TfrmpbluCustEnqsJB = class(TForm)
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
    dtmdlCustEnqs: TdtmdlEnqs;
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
    SelLine: integer;
    JobBagNo: integer;
    property Branch: integer read FBranch write SetBranch;
    property Customer: integer read FCustomer write SetCustomer;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmpbluCustEnqsJB: TfrmpbluCustEnqsJB;

implementation

uses PBAutoPO;

{$R *.DFM}

procedure TfrmpbluCustEnqsJB.FormCreate(Sender: TObject);
begin
  dtmdlCustEnqs := TdtmdlEnqs.create(self);
  dtmdlCustEnqs.dtsEnqsJB.OnDataChange := SetButtons;
  dbgDetails.datasource := dtmdlCustEnqs.dtsEnqsJB;
end;

procedure TfrmpbluCustEnqsJB.FormDestroy(Sender: TObject);
begin
  dtmdlCustEnqs.free;
end;

procedure TfrmpbluCustEnqsJB.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlCustEnqs.refreshdataJB;
end;

procedure TfrmpbluCustEnqsJB.edtSearchChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlCustEnqs.Description := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmpbluCustEnqsJB.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmpbluCustEnqsJB.SetBranch(const Value: integer);
begin
  FBranch := Value;
end;

procedure TfrmpbluCustEnqsJB.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmpbluCustEnqsJB.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlCustEnqs do
  begin
    btnSelect.Enabled := HeaderJBCount > 0;
    edtNumber.text := dbgDetails.datasource.dataset.fieldbyname('Enquiry').asstring;
    stsBrDetails.panels[0].text := inttostr(HeaderJBCount) + ' records displayed';
  end;
end;

procedure TfrmpbluCustEnqsJB.FormShow(Sender: TObject);
begin
  Caption := Caption + ' for ' + CustomerName;
  dtmdlCustEnqs.Customer := FCustomer;
  dtmdlCustEnqs.refreshdataJB;
end;

procedure TfrmpbluCustEnqsJB.btnCloseClick(Sender: TObject);
begin
  selected := false;
  close;
end;

procedure TfrmpbluCustEnqsJB.edtNumberKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    btnSelectclick(self);


end;

procedure TfrmpbluCustEnqsJB.btnSelectClick(Sender: TObject);
var
  iTempSel: integer;
  iTempLine: integer;
  iStatus: integer;
begin
  if not CheckInput then
    exit;


  iTempSel := dbgDetails.datasource.DataSet.FieldByName('Enquiry').asinteger;
  iTempLine := dbgDetails.datasource.DataSet.FieldByName('Line').asinteger;
  iStatus := dbgDetails.datasource.DataSet.FieldByName('enquiry_status').AsInteger;

  if iStatus < 45 then
    begin
      messagedlg('This enquiry has not had any prices set, cannot convert to an order', mtInformation,
      [mbOk], 0);
      exit;
    end
  else
  if iStatus > 85 then
    begin
      messagedlg('This enquiry has already been converted to an order', mtInformation,
     [mbOk], 0);
       exit;
    end;
  PBAutoPOFrm := TPBAutoPOFrm.Create(Self);
  try
    PBAutoPOFrm.TempEnqNo := iTempSel;
    PBAutoPOFrm.TempEnqLineNo := iTempLine;
    PBAutoPOFrm.JobBagNo := self.JobBagNo;
    PBAutoPOFrm.MainLoop(self);
    if PBAutoPOFrm.TempOK then
      begin
        Selcode := PBAutoPOFrm.tempPO;
        SelLine := 1;
        Selected := true;
        close;
      end
  finally
    PBAutoPOFrm.Free;
  end;
end;

function TfrmpbluCustEnqsJB.CheckInput: boolean;
begin
  result := true;
  if not dbgDetails.datasource.DataSet.locate('Enquiry', Variant(edtNumber.text),[lopartialKey]) then
    begin
      messagedlg('Enquiry '+ edtNumber.text + ' not found within this list', mterror,[mbOk], 0);
      Result := false;
    end;
end;

procedure TfrmpbluCustEnqsJB.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.FieldByName('Enquiry').asstring <> '' then
    btnSelectClick(self);
end;

end.
