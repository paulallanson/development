unit pbluOrdersSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, pbOrdersDM, Buttons, inifiles;

type
  TfrmpbluOrdersSearch = class(TForm)
    Label4: TLabel;
    lblFormReference: TLabel;
    Label6: TLabel;
    lblQuantity: TLabel;
    lblProductCode: TLabel;
    edtBranch: TEdit;
    edtCustOrderNo: TEdit;
    edtProductCode: TEdit;
    edtFormReference: TEdit;
    edtQuantity: TEdit;
    chkbxShowCancelled: TCheckBox;
    SearchButton: TButton;
    Label9: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    lblDescription: TLabel;
    edtDescription: TEdit;
    lblSupplier: TLabel;
    edtSupplier: TEdit;
    lblDescriptiveRef: TLabel;
    edtDescriptiveRef: TEdit;
    edtJobNumber: TEdit;
    lblJobNumber: TLabel;
    lblStatus: TLabel;
    edtStatus: TEdit;
    ClearButton: TButton;
    chkbxShowWIP: TCheckBox;
    Label1: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtRep: TEdit;
    edtAccountMgr: TEdit;
    edtOperator: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    FSearchType: string;
    procedure SetSearchType(const Value: string);
    { Private declarations }
  public
    dtmdlSearchOrders: TdtmdlOrders;
    property SearchType: string read FSearchType write SetSearchType;
  end;

var
  frmpbluOrdersSearch: TfrmpbluOrdersSearch;

implementation

uses UITypes, DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluOrdersSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchOrders.BranchName := Trim(edtBranch.Text);
  dtmdlSearchOrders.ProductCode := Trim(edtProductCode.Text);
  dtmdlSearchOrders.FormReference := Trim(edtFormReference.Text);
  dtmdlSearchOrders.CustomerRef := Trim(edtCustOrderNo.Text);
  dtmdlSearchOrders.OrdQtyDesc := Trim(edtQuantity.Text);
  dtmdlSearchOrders.Description := Trim(edtDescription.Text);
  dtmdlSearchOrders.DescriptiveRef := Trim(edtDescriptiveRef.Text);
  dtmdlSearchOrders.SupplierName := Trim(edtSupplier.Text);
  dtmdlSearchOrders.JobNumber := Trim(edtJobNumber.Text);
  dtmdlSearchOrders.Status := trim(edtStatus.text);
  if Trim(edtDate.text).IsEmpty then
    dtmdlSearchOrders.OrderDate := pbDatestr('01/01/1990')
  else
    dtmdlSearchOrders.OrderDate := PBDateStr(edtDate.Text);

  dtmdlSearchOrders.Showinactive := chkbxShowCancelled.checked;
  dtmdlSearchOrders.ShowWIP := chkbxShowWIP.checked;

  dtmdlSearchOrders.RepName := Trim(edtRep.text);
  dtmdlSearchOrders.AccountMgr := Trim(edtAccountMgr.text);
  dtmdlSearchOrders.OperatorName := Trim(edtOperator.text);

  if SearchType = 'PO' then
    dtmdlSearchOrders.refreshPOdata
  else
  if SearchType = 'SO' then
    dtmdlSearchOrders.refreshSOdata
  else
  if SearchType = 'SOL' then
    dtmdlSearchOrders.refreshSOdata
  else
    dtmdlSearchOrders.refreshdata;
  close;
end;

procedure TfrmpbluOrdersSearch.FormCreate(Sender: TObject);
begin
  dtmdlSearchOrders := TdtmdlOrders.create(self);
end;

procedure TfrmpbluOrdersSearch.btnDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtDate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      edtDate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmpbluOrdersSearch.edtDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if edtDate.Text = '' then
    Exit;
  try
    NewDate := StrToDate(edtDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      if edtDate.Enabled then
        edtDate.SetFocus;
      exit;
    end;
  end;

  edtDate.Text := PBDatestr(NewDate);
end;

procedure TfrmpbluOrdersSearch.FormShow(Sender: TObject);
begin
  if dtmdlSearchOrders.Customer <> 0 then
    begin
//      edtDate.text := '';
      edtDescription.visible := false;
      lblDescription.visible := false;
    end;
end;

procedure TfrmpbluOrdersSearch.SetSearchType(const Value: string);
begin
  FSearchType := Value;
  edtDescriptiveRef.enabled := FSearchType = 'PO';
  lblDescriptiveRef.enabled := edtDescriptiveRef.enabled;

  edtProductCode.enabled := (FSearchType = 'PO') or (FSearchType = 'SOL');
  lblProductCode.enabled := edtProductCode.enabled;

  edtFormReference.enabled := (FSearchType = 'PO') or (FSearchType = 'SOL');
  lblFormReference.enabled := edtFormReference.enabled;

  edtQuantity.enabled := (FSearchType = 'PO') or (FSearchType = 'SOL');
  lblQuantity.enabled := edtQuantity.enabled;

  edtDescription.enabled := (FSearchType = 'PO') or (FSearchType = 'SOL');
  lblDescription.enabled := edtDescription.enabled;
end;

procedure TfrmpbluOrdersSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      if (components[icount] as TEdit).Name <> 'edtDate' then
        (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

end.
