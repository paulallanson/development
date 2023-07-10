unit pbluCustomerSearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, pbCustomerDM;

type
  TfrmpbluCustomerSearch = class(TForm)
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
    Label4: TLabel;
    edtRep: TEdit;
    Label2: TLabel;
    edtFax: TEdit;
    ClearButton: TButton;
    Label5: TLabel;
    edtCounty: TEdit;
    Label7: TLabel;
    edtTerms: TEdit;
    edtRevenueCentre: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    edtAccountManager: TEdit;
    Label11: TLabel;
    edtImportance: TEdit;
    lblAnalysis1: TLabel;
    edtAnalysis1: TEdit;
    lblAnalysis2: TLabel;
    edtAnalysis2: TEdit;
    Label14: TLabel;
    edtCustomerType: TEdit;
    Label15: TLabel;
    edtCustomerStatus: TEdit;
    edtSubRep: TEdit;
    Label16: TLabel;
    lblAnalysis3: TLabel;
    lblAnalysis4: TLabel;
    edtAnalysis3: TEdit;
    edtAnalysis4: TEdit;
    procedure SearchButtonClick(Sender: TObject);
    procedure btnDateClick(Sender: TObject);
    procedure edtDateExit(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    FProspect: boolean;
    FEndUser: boolean;
    procedure SetProspect(const Value: boolean);
    procedure SetEndUser(const Value: boolean);
    { Private declarations }
  public
    dtmdlSearchCustomers: TdtmdlCustomers;
    property Prospect: boolean read FProspect write SetProspect;
    property EndUser: boolean read FEndUser write SetEndUser;
  end;

var
  frmpbluCustomerSearch: TfrmpbluCustomerSearch;

implementation

uses DateSelV5, CCSCommon;

{$R *.DFM}

procedure TfrmpbluCustomerSearch.SearchButtonClick(Sender: TObject);
begin
  dtmdlSearchCustomers.Town := Trim(edtTown.Text);
  dtmdlSearchCustomers.Postcode := Trim(edtPostcode.Text);
  dtmdlSearchCustomers.County := Trim(edtCounty.Text);
  dtmdlSearchCustomers.Telephone := Trim(edtTelephone.Text);
  dtmdlSearchCustomers.Fax := Trim(edtFax.Text);
  dtmdlSearchCustomers.RepName := Trim(edtRep.text);
  dtmdlSearchCustomers.SubRepName := Trim(edtSubRep.text);
  dtmdlSearchCustomers.AccountManager := Trim(edtAccountManager.text);

  dtmdlSearchCustomers.CustomerStatus := Trim(edtCustomerStatus.text);

  dtmdlSearchCustomers.CustomerType := Trim(edtCustomerType.text);

  dtmdlSearchCustomers.Terms := Trim(edtTerms.Text);
  dtmdlSearchCustomers.RevenueCentre := Trim(edtRevenueCentre.Text);
  dtmdlSearchCustomers.Importance := Trim(edtImportance.Text);
  dtmdlSearchCustomers.Analysis1 := Trim(edtAnalysis1.Text);
  dtmdlSearchCustomers.Analysis2 := Trim(edtAnalysis2.Text);
  dtmdlSearchCustomers.Analysis3 := Trim(edtAnalysis3.Text);
  dtmdlSearchCustomers.Analysis4 := Trim(edtAnalysis4.Text);

  if (edtDate.text = '') or (pbdatestr(edtDate.Text) <= '01/01/2000') then
    dtmdlSearchCustomers.DateCreated := PBDatestr('01/01/1800')
  else
    dtmdlSearchCustomers.DateCreated := PBDateStr(edtDate.Text);

  dtmdlSearchCustomers.ShowInactive := chkbxShowInactive.checked;

  if Prospect then
    dtmdlSearchCustomers.RefreshProspectData
  else
  if EndUser then
    dtmdlSearchCustomers.RefreshEndUserData
  else
    dtmdlSearchCustomers.refreshdata;
  close;
end;

procedure TfrmpbluCustomerSearch.btnDateClick(Sender: TObject);
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

procedure TfrmpbluCustomerSearch.edtDateExit(Sender: TObject);
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

procedure TfrmpbluCustomerSearch.ClearButtonClick(Sender: TObject);
var
  icount: integer;
begin
  for icount := 0 to pred(componentcount) do
    if components[icount] is TEdit then
      (components[icount] as TEdit).Text := '';
  searchbuttonclick(self);
end;

procedure TfrmpbluCustomerSearch.SetProspect(const Value: boolean);
begin
  FProspect := Value;
end;

procedure TfrmpbluCustomerSearch.SetEndUser(const Value: boolean);
begin
  FEndUser := Value;
end;

end.
