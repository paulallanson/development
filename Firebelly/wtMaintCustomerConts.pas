unit wtMaintCustomerConts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Buttons, DB, DBTables, ExtCtrls, gtQrCtrls;

type
  TfrmwtMaintCustomerConts = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    lbldelete: TLabel;
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    dblkpJobTitle: TDBLookupComboBox;
    edtTitle: TEdit;
    edtForename: TEdit;
    edtSurname: TEdit;
    edtContactName: TEdit;
    edtTelephoneNumber: TEdit;
    edtFaxNumber: TEdit;
    edtMobileNumber: TEdit;
    edtEmailAddress: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryDelete: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure edtSurnameChange(Sender: TObject);
    procedure edtFirstNameEnter(Sender: TObject);
    procedure dblkpJobTitleClick(Sender: TObject);
  private
    bOK2Change: boolean;
    FActivated: boolean;
    FfunctionMode: string;
    sOldName: string;
    FCustomer: integer;
    procedure SetfunctionMode(const Value: string);
    procedure GetContactTypes;
    procedure ChangeContactName;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    procedure SetCustomer(const Value: integer);
    { Private declarations }
  public
    iCode: Integer;
    property Customer: integer read FCustomer write SetCustomer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmwtMaintCustomerConts: TfrmwtMaintCustomerConts;

implementation

uses WTSrchCustContacts, WTLUContactType, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmwtMaintCustomerConts.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
  lblDelete.Visible := false;
  if Value = 'D' then
    begin
      pnldetails.enabled := false;
      lblDelete.Visible := true;
    end;
end;

procedure TfrmwtMaintCustomerConts.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmwtMaintCustomerConts.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtContactName.Text) <> '') and
                    (trim(edtForeName.Text) <> '') and
                    (trim(edtTelephoneNumber.Text) <> '') and
                    (dblkpJobTitle.KeyValue <> 0);
end;

procedure TfrmwtMaintCustomerConts.FormShow(Sender: TObject);
begin
  edtTitle.setfocus;
end;

procedure TfrmwtMaintCustomerConts.FormActivate(Sender: TObject);
begin
  if FActivated = false then
    begin
      GetContactTypes;

      if FunctionMode = 'A' then
        begin
          iCode := 0;

          edtTitle.Text := '';
          edtForename.Text := '';
          edtSurname.Text := '';
          edtContactName.Text := '';
          edtTelephoneNumber.Text := '';
          edtFaxNumber.Text := '';
          edtEmailAddress.Text := '';
          edtMobileNumber.Text := '';

          dblkpJobTitle.keyvalue := 0;

        end
      else
        with frmWTSrchCustContacts.qryDetails do
          begin
            Customer := fieldbyname('Customer').asinteger;
            iCode := fieldbyname('Contact_no').asinteger;

            edtTitle.Text := fieldbyname('Title').asstring;
            edtForename.Text := fieldbyname('Forename').asstring;
            edtSurname.Text := fieldbyname('Surname').asstring;
            edtContactName.Text := fieldbyname('Contact_Name').asstring;
            edtTelephoneNumber.Text := fieldbyname('Telephone_Number').asstring;
            edtFaxNumber.Text := fieldbyname('Fax_Number').asstring;
            edtEmailAddress.Text := fieldbyname('Email_Address').asstring;
            edtMobileNumber.Text := fieldbyname('Mobile_Number').asstring;

            dblkpJobTitle.keyvalue := fieldbyname('Contact_Type').asinteger;
          end;
    end;
  FActivated := true;
  EnableOK(self);
end;

procedure TfrmwtMaintCustomerConts.SpeedButton4Click(Sender: TObject);
begin
  frmWTLUContactType := TfrmWTLUContactType.create(application);
  try
    frmWTLUContactType.showmodal;
  finally
    frmWTLUContactType.free;
  end;
  GetContactTypes;
end;

procedure TfrmwtMaintCustomerConts.GetContactTypes;
begin
  frmWTSrchCustContacts.qryContactType.Close;
  frmWTSrchCustContacts.qryContactType.Open;
end;

procedure TfrmwtMaintCustomerConts.edtSurnameChange(Sender: TObject);
begin
  if FActivated = true then
    ChangeContactName;
  enableOK(self);
end;

procedure TfrmwtMaintCustomerConts.ChangeContactName;
begin
  if bOK2Change then
    begin
      edtContactName.Text := edtForename.text + ' ' + edtSurname.text;
    end;
end;

procedure TfrmwtMaintCustomerConts.edtFirstNameEnter(Sender: TObject);
begin
  bOK2Change := false;
  sOldName := edtContactName.text;
  if trim(sOldName) = trim(edtForename.text + ' ' + edtSurname.text) then
    bOK2Change := true;
  EnableOK(self);
end;

procedure TfrmwtMaintCustomerConts.dblkpJobTitleClick(Sender: TObject);
begin
  enableOK(self);
end;

procedure TfrmwtMaintCustomerConts.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Customer').asinteger := Customer;
      parambyname('Contact_no').asinteger := iCode;

      parambyname('Title').asstring := edtTitle.Text;
      parambyname('Forename').asstring := edtForename.Text;
      parambyname('Surname').asstring := edtSurname.Text;
      parambyname('Contact_Name').asstring := edtContactName.Text;
      parambyname('Telephone_Number').asstring := edtTelephoneNumber.Text;
      parambyname('Fax_Number').asstring := edtFaxNumber.Text + ' ';
      parambyname('Mobile_Number').asstring := edtMobileNumber.Text + ' ';
      parambyname('Email_Address').asstring := edtEmailAddress.Text + ' ';

      parambyname('Contact_Type').asinteger := dblkpJobTitle.KeyValue;
      ExecSQL;
    end;
  end;
end;

function TfrmwtMaintCustomerConts.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
    with qryAdd do
    begin
      ParamByName('Customer').Asinteger := Customer;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('Customer').Asinteger := Customer;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Contact_no').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmwtMaintCustomerConts.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Contact ' +
            '(Customer, Contact_No, Contact_Name, Email_Address) ' +
            'VALUES(' + inttostr(Customer) + ', 0, ''Dummy'', ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmwtMaintCustomerConts.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Contact Where Customer = ' + inttostr(customer) + ' AND Contact_No = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmwtMaintCustomerConts.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

end.
