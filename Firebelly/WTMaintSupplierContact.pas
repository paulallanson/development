unit WTMaintSupplierContact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintSupplierContact = class(TForm)
    pnlDetails: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    lbldelete: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    dblkpJobTitle: TDBLookupComboBox;
    SpeedButton4: TSpeedButton;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    chkbxSendPurchaseOrders: TCheckBox;
    edtTitle: TEdit;
    edtForename: TEdit;
    edtSurname: TEdit;
    edtContactName: TEdit;
    edtTelephoneNumber: TEdit;
    edtMobileNumber: TEdit;
    edtEmailAddress: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryDelete: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtSurnameChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure edtFirstNameEnter(Sender: TObject);
  private
    bOK2Change: boolean;
    FActivated: boolean;
    FFunctionMode: string;
    sOldName: string;
    FSupplier: integer;
    procedure SetfunctionMode(const Value: string);
    procedure ChangeContactName;
    procedure GetContactTypes;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    procedure SetSupplier(const Value: integer);
    { Private declarations }
  public
    iCode: Integer;
    property Supplier: integer read FSupplier write SetSupplier;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintSupplierContact: TfrmWTMaintSupplierContact;

implementation

uses WTLUSupplierContacts, WTLUContactType, ComObj, ActiveX;

{$R *.dfm}

{ TfrmWTMaintSupplierContact }

procedure TfrmWTMaintSupplierContact.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
  lblDelete.Visible := false;
  if Value = 'D' then
    begin
      pnldetails.enabled := false;
      lblDelete.Visible := true;
    end;
end;

procedure TfrmWTMaintSupplierContact.btnOKClick(Sender: TObject);
begin
  SaveToDB;
(*  if chkbxSendPurchaseOrders.Checked then
    frmWTLUSupplierContacts.tblContacts.FieldByName('Receive_Purchase_Order').asstring := 'Y'
  else
    frmWTLUSupplierContacts.tblContacts.FieldByName('Receive_Purchase_Order').asstring := 'N';

  frmWTLUSupplierContacts.tblContacts.Post;
*)
end;

procedure TfrmwtMaintSupplierContact.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtContactName.Text) <> '') and
                    (trim(edtForeName.Text) <> '')  and
                    (dblkpJobTitle.Text <> '');
end;

procedure TfrmWTMaintSupplierContact.FormShow(Sender: TObject);
begin
  edtTitle.setfocus;
end;

procedure TfrmWTMaintSupplierContact.FormActivate(Sender: TObject);
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
          edtEmailAddress.Text := '';
          edtMobileNumber.Text := '';

          dblkpJobTitle.keyvalue := 0;

          chkbxSendPurchaseOrders.Checked := false;
        end
      else
        with frmWTLUSupplierContacts.qryDetails do
          begin
            Supplier := fieldbyname('Supplier').asinteger;
            iCode := fieldbyname('Contact_no').asinteger;

            edtTitle.Text := fieldbyname('Title').asstring;
            edtForename.Text := fieldbyname('Forename').asstring;
            edtSurname.Text := fieldbyname('Surname').asstring;
            edtContactName.Text := fieldbyname('Contact_Name').asstring;
            edtTelephoneNumber.Text := fieldbyname('Telephone_Number').asstring;
            edtEmailAddress.Text := fieldbyname('Email_Address').asstring;
            edtMobileNumber.Text := fieldbyname('Mobile_Number').asstring;

            dblkpJobTitle.keyvalue := fieldbyname('Contact_Type').asinteger;
            chkbxSendPurchaseOrders.Checked := (fieldbyname('Receive_Purchase_Order').asstring = 'Y');
          end;
    end;
  FActivated := true;
  EnableOK(self);
end;

procedure TfrmWTMaintSupplierContact.edtSurnameChange(Sender: TObject);
begin
  if FActivated = true then
    ChangeContactName;
  enableOK(self);
end;

procedure TfrmWTMaintSupplierContact.ChangeContactName;
begin
  if bOK2Change then
    begin
      edtContactName.Text := edtForename.text + ' ' + edtSurname.text;
    end;
end;

procedure TfrmWTMaintSupplierContact.SpeedButton4Click(Sender: TObject);
begin
  frmWTLUContactType := TfrmWTLUContactType.create(application);
  try
    frmWTLUContactType.showmodal;
  finally
    frmWTLUContactType.free;
  end;
  GetContactTypes;

end;

procedure TfrmWTMaintSupplierContact.GetContactTypes;
begin
  frmWTLUSupplierContacts.qryContactType.Close;
  frmWTLUSupplierContacts.qryContactType.Open;
end;

procedure TfrmWTMaintSupplierContact.edtFirstNameEnter(Sender: TObject);
begin
  bOK2Change := false;
  sOldName := edtContactName.text;
  if trim(sOldName) = trim(edtForename.text + ' ' + edtSurname.text) then
    bOK2Change := true;
end;

procedure TfrmwtMaintSupplierContact.SaveToDB;
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
      parambyname('Supplier').asinteger := Supplier;
      parambyname('Contact_no').asinteger := iCode;

      parambyname('Title').asstring := edtTitle.Text;
      parambyname('Forename').asstring := edtForename.Text;
      parambyname('Surname').asstring := edtSurname.Text;
      parambyname('Contact_Name').asstring := edtContactName.Text;
      parambyname('Telephone_Number').asstring := edtTelephoneNumber.Text;
      parambyname('Mobile_Number').asstring := edtMobileNumber.Text;
      parambyname('Email_Address').asstring := edtEmailAddress.Text;

      parambyname('Contact_Type').asinteger := dblkpJobTitle.KeyValue;
      ExecSQL;
    end;
  end;
end;

function TfrmwtMaintSupplierContact.GetNextKey: integer;
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
      ParamByName('Supplier').Asinteger := Supplier;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('Supplier').Asinteger := Supplier;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Contact_no').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmwtMaintSupplierContact.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Supplier_Contact ' +
            '(Supplier, Contact_No, Contact_Name, Email_Address) ' +
            'VALUES(' + inttostr(Supplier) + ', 0, ''Dummy'', ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmwtMaintSupplierContact.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Supplier_Contact Where Supplier = ' + inttostr(Supplier) + ' AND Contact_No = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintSupplierContact.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

end.
