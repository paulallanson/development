unit pbluSalesInvoiceSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, PBSalesInvoiceDM, Buttons, inifiles;

type
  TfrmpbluSalesInvoiceSearch = class(TForm)
    chkbxShowDeleted: TCheckBox;
    SearchButton: TButton;
    Label9: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    lblDescription: TLabel;
    edtDescription: TEdit;
    edtJobNumber: TEdit;
    lblJobNumber: TLabel;
    lblStatus: TLabel;
    edtStatus: TEdit;
    ClearButton: TButton;
    chkbxShowArchived: TCheckBox;
    Label1: TLabel;
    edtRep: TEdit;
    Label3: TLabel;
    edtSubRep: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    FSearchType: string;
    procedure SetSearchType(const Value: string);
    { Private declarations }
  public
    dmSearchSalesInvoices: TdmSalesInvoice;
    property SearchType: string read FSearchType write SetSearchType;
  end;

var
  frmpbluSalesInvoiceSearch: TfrmpbluSalesInvoiceSearch;

implementation

uses DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluSalesInvoiceSearch.SearchButtonClick(Sender: TObject);
begin
  dmSearchSalesInvoices.Status := trim(edtStatus.text);
  if edtDate.text = '' then
    dmSearchSalesInvoices.InvoiceDate := pbDatestr('01/01/1990')
  else
    dmSearchSalesInvoices.InvoiceDate := PBDateStr(edtDate.Text);

  dmSearchSalesInvoices.DisplayInactive := chkbxShowDeleted.checked;
  dmSearchSalesInvoices.DisplayArchived := chkbxShowArchived.checked;

  dmSearchSalesInvoices.RepName := Trim(edtRep.text);
  dmSearchSalesInvoices.SubRepName := Trim(edtSubRep.text);
  dmSearchSalesInvoices.Description := Trim(edtDescription.text);
  dmSearchSalesInvoices.Status := Trim(edtStatus.text);

  dmSearchSalesInvoices.refreshdata;
  close;
end;

procedure TfrmpbluSalesInvoiceSearch.FormCreate(Sender: TObject);
begin
  dmSearchSalesInvoices := TdmSalesInvoice.create(self);
end;

procedure TfrmpbluSalesInvoiceSearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluSalesInvoiceSearch.edtDateExit(Sender: TObject);
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

procedure TfrmpbluSalesInvoiceSearch.SetSearchType(const Value: string);
begin
  FSearchType := Value;
end;

procedure TfrmpbluSalesInvoiceSearch.ClearButtonClick(Sender: TObject);
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
