unit pbluSupplierSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, pbSupplierDM;

type
  TfrmpbluSupplierSearch = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    edtTelephone: TEdit;
    edtPostcode: TEdit;
    chkbxShowInactive: TCheckBox;
    SearchButton: TButton;
    Label3: TLabel;
    edtTown: TEdit;
    Label1: TLabel;
    edtDate: TEdit;
    btnDate: TBitBtn;
    Label2: TLabel;
    edtFax: TEdit;
    ClearButton: TButton;
    Label5: TLabel;
    edtCounty: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    dtmdlSearchSuppliers: TdtmdlSuppliers;
  end;

var
  frmpbluSupplierSearch: TfrmpbluSupplierSearch;

implementation

uses DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluSupplierSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchSuppliers.Town := Trim(edtTown.Text);
  dtmdlSearchSuppliers.Postcode := Trim(edtPostcode.Text);
  dtmdlSearchSuppliers.County := Trim(edtCounty.Text);
  dtmdlSearchSuppliers.Telephone := Trim(edtTelephone.Text);
  dtmdlSearchSuppliers.Fax := Trim(edtFax.Text);
  if (edtDate.text = '') or (pbdatestr(edtDate.Text) <= '01/01/2000') then
    dtmdlSearchSuppliers.DateCreated := PBDatestr('01/01/1800')
  else
    dtmdlSearchSuppliers.DateCreated := PBDateStr(edtDate.Text);

  dtmdlSearchSuppliers.ShowInactive := chkbxShowInactive.checked;

  dtmdlSearchSuppliers.refreshdata;
  close;
end;

procedure TfrmpbluSupplierSearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluSupplierSearch.edtDateExit(Sender: TObject);
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

procedure TfrmpbluSupplierSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

end.
