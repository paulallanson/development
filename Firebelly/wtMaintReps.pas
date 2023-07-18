unit wtMaintReps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, CRControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintReps = class(TForm)
    lblName: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxIsCustomer: TCheckBox;
    Label1: TLabel;
    lblCommissionRate: TLabel;
    Label3: TLabel;
    cmbCommissionType: TComboBox;
    edtCustomerName: TEdit;
    btnCustomerSearch: TBitBtn;
    qryGetCustomer: TFDQuery;
    lblCommissionPerc: TLabel;
    chkbxInactive: TCheckBox;
    edtRepName: TEdit;
    edtCommissionRate: TCREditFloat;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure chkbxIsCustomerClick(Sender: TObject);
    procedure btnCustomerSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbCommissionTypeClick(Sender: TObject);
  private
    customer: integer;
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    function GetCustomerName(tempCust: integer): string;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintReps: TfrmWTMaintReps;

implementation

uses wtLUReps, WTSrchCustomer, ComObj, ActiveX;

{$R *.dfm}

{ TfrmWTMaintReps }

procedure TfrmWTMaintReps.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;

  if Value = 'A' then
    begin
      chkbxIsCustomer.checked := false;
      cmbCommissionType.ItemIndex := -1;
    end
  else
  if Value = 'C' then
    begin
      Customer := frmwtLUReps.srcReps.DataSet.fieldbyname('customer').Asinteger;
      chkbxIsCustomer.Checked := (frmwtLUReps.srcReps.DataSet.fieldbyname('rep_is_customer').AsString = 'Y');
      cmbCommissionType.ItemIndex := frmwtLUReps.srcReps.DataSet.fieldbyname('commission_type').Asinteger;

      edtCustomerName.Text := GetCustomerName(Customer);
    end
end;

procedure TfrmWTMaintReps.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintReps.EnableOK(Sender: TObject);
begin
  if chkbxisCustomer.checked then
    begin
      btnOK.enabled := (edtRepName.Text <> '') and
                    (cmbCommissiontype.ItemIndex > -1) and
                    (edtCustomerName.Text <> '');
    end
  else
    begin
      btnOK.enabled := (edtRepName.Text <> '') and
                    (cmbCommissiontype.ItemIndex > -1);
    end;
end;

procedure TfrmWTMaintReps.chkbxIsCustomerClick(Sender: TObject);
begin
  if chkbxIsCustomer.Checked then
    begin
      btnCustomerSearch.enabled := true;
    end
  else
    begin
      btnCustomerSearch.enabled := false;
      edtCustomerName.Text := '';
      Customer := 0;
    end;
  EnableOK(self);
end;

procedure TfrmWTMaintReps.btnCustomerSearchClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := self.Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        self.Customer := frmwtSrchCustomer.CodeSelected;
        edtCustomerName.text := frmwtSrchCustomer.NameSelected;
      end
  finally
    frmwtSrchCustomer.free;
  end;
  enableOK(self);
end;

function TfrmWTMaintReps.GetCustomerName(tempCust: integer): string;
begin
  result := '';
  with qryGetCustomer do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      open;
      result := fieldbyname('Customer_Name').asstring;
    end;
end;

procedure TfrmWTMaintReps.FormShow(Sender: TObject);
begin
  edtRepName.setfocus;
end;

procedure TfrmWTMaintReps.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtRepName.Text := '';
      edtCommissionRate.Text := '0.00';
      chkbxInactive.Checked := false;

    end
  else
    with frmWTLUReps.qryReps do
      begin
        iCode := fieldbyname('Rep').asinteger;

        edtRepName.Text := fieldbyname('Rep_Name').asstring;
        edtCommissionRate.Text := formatfloat('0.00',fieldbyname('Commission_Rate').asfloat);

        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  cmbCommissionTypeClick(self);
  EnableOK(self);
end;

procedure TfrmWTMaintReps.cmbCommissionTypeClick(Sender: TObject);
begin
  case cmbCommissionType.ItemIndex of
      0..1:   begin
                lblCommissionRate.caption := 'Commission Rate';
                lblCommissionPerc.caption := '%';
              end;
      2:      begin
                lblCommissionRate.caption := 'Commission Amount';
                lblCommissionPerc.caption := '';
              end;
  end;
end;

procedure TfrmWTMaintReps.SaveToDB;
var
  iPathLength, iFileLength: integer;
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
      parambyname('Rep').asinteger := iCode;

      parambyname('Rep_Name').asstring := edtRepName.Text;

      if chkbxisCustomer.Checked then
        begin
          parambyname('Rep_is_Customer').AsString := 'Y';
          parambyname('Customer').Asinteger := self.Customer;
        end
      else
        begin
          parambyname('rep_is_Customer').AsString := 'N';
          parambyname('Customer').Asinteger := 0;
        end;

      parambyname('Commission_type').Asinteger := cmbCommissionType.ItemIndex;
      parambyname('Commission_Rate').Asfloat := strtofloat(edtCommissionRate.text);

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintReps.GetNextKey: integer;
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
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Rep').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintReps.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Rep ' +
            '(Rep,Rep_Name, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintReps.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Rep Where Rep = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
