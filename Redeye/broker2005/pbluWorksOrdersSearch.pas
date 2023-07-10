unit pbluWorksOrdersSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, pbOrdersDM, Buttons, inifiles, PBWOrdersDM;

type
  TfrmpbluWorksOrdersSearch = class(TForm)
    Label4: TLabel;
    Label6: TLabel;
    lblQuantity: TLabel;
    edtBranch: TEdit;
    edtCustOrderNo: TEdit;
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
    edtJobBag: TEdit;
    Label1: TLabel;
    ClearButton: TButton;
    Label3: TLabel;
    edtStatus: TEdit;
    chkbxShowWIP: TCheckBox;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchWOrders: TdtmdlWOrders;
  end;

var
  frmpbluWorksOrdersSearch: TfrmpbluWorksOrdersSearch;

implementation

uses DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluWorksOrdersSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchWOrders.BranchName := Trim(edtBranch.Text);
  dtmdlSearchWOrders.Status := Trim(edtStatus.Text);
  dtmdlSearchWOrders.CustomerRef := Trim(edtCustOrderNo.Text);
  dtmdlSearchWOrders.OrdQtyDesc := Trim(edtQuantity.Text);
  dtmdlSearchWOrders.Description := Trim(edtDescription.Text);
  dtmdlSearchWOrders.JobBag := Trim(edtJobBag.Text);
  if edtDate.text = '' then
    dtmdlSearchWOrders.OrderDate := pbDatestr('01/01/1990')
  else
    dtmdlSearchWOrders.OrderDate := PBDateStr(edtDate.Text);

  dtmdlSearchWOrders.Showinactive := chkbxShowCancelled.checked;
  dtmdlSearchWOrders.ShowWIP := chkbxShowWIP.checked;

  dtmdlSearchWOrders.refreshdata;
  close;
end;

procedure TfrmpbluWorksOrdersSearch.FormCreate(Sender: TObject);
begin
  dtmdlSearchWOrders := TdtmdlWOrders.create(self);
end;

procedure TfrmpbluWorksOrdersSearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluWorksOrdersSearch.edtDateExit(Sender: TObject);
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

procedure TfrmpbluWorksOrdersSearch.FormShow(Sender: TObject);
begin
  if dtmdlSearchWOrders.Customer <> 0 then
    begin
//      edtDate.text := '';
      edtDescription.visible := false;
      lblDescription.visible := false;
    end;
end;

procedure TfrmpbluWorksOrdersSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

end.
