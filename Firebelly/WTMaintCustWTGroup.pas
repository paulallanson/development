unit WTMaintCustWTGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, QrCtrls, DB, CRControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintCustWTGroup = class(TForm)
    label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    Label2: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    qryMaterialType: TFDQuery;
    srcMaterialtype: TDataSource;
    Label3: TLabel;
    dblkpSupplier: TDBLookupComboBox;
    qrySupplier: TFDQuery;
    srcSupplier: TDataSource;
    SpeedButton4: TSpeedButton;
    btnSupplier: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    chkbxUseForGeneralQuoting: TCheckBox;
    edtDateEffective: TEdit;
    btnDateEffective: TBitBtn;
    edtDateInEffective: TEdit;
    btnDateInEffective: TBitBtn;
    edtGroupDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    lblGroupID: TLabel;
    edtID: TCREditInt;
    qryPatch: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure edtDateEffectiveExit(Sender: TObject);
    procedure btnDateEffectiveClick(Sender: TObject);
    procedure btnDateInEffectiveClick(Sender: TObject);
  private
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    procedure GetSuppliers;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    function AddPatchKey: integer;
    { Private declarations }
  public
    Customer: integer;
    iCode: integer;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintCustWTGroup: TfrmWTMaintCustWTGroup;

implementation

uses WTLUCustWTGroups, WTSrchSupplier, DateSelV5, AllCommon, ComObj, ActiveX;

{$R *.dfm}

{ TForm1 }

procedure TfrmWTMaintCustWTGroup.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
  edtID.Visible := FfunctionMode = 'P';
  lblGroupID.Visible := edtID.Visible;
end;

procedure TfrmWTMaintCustWTGroup.btnOKClick(Sender: TObject);
begin
  {validate dates}
  if edtDateInEffective.text <> '' then
    begin
      if (trim(edtDateEffective.text) <> '') AND (paDateStr(edtDateEffective.text) > paDateStr(edtDateInEffective.text)) then
        begin
          messagedlg('Invalid date range', mtError, [mbOk], 0);
          edtDateEffective.setfocus;
          exit;
        end;
    end;

  SaveToDB;

  self.ModalResult := mrOK;
  close;
end;

procedure TfrmWTMaintCustWTGroup.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtGroupDescription.Text <> '') and
                    (dblkpMaterialType.text <> '');
end;

procedure TfrmWTMaintCustWTGroup.FormShow(Sender: TObject);
begin
  EnableOK(Self);
end;

procedure TfrmWTMaintCustWTGroup.FormActivate(Sender: TObject);
begin
  {Retrieve the material types}
  with qryMaterialType do
    begin
      close;
      parambyname('Material_Type').asinteger := frmWTLUCustWTGroups.qryCustWTGroup.fieldbyname('Material_Type').asinteger;
      open;
    end;

  GetSuppliers;

  if (functionMode = 'A') or (functionMode = 'P') then
    begin
      iCode := 0;
      edtGroupDescription.Text := '';
      dblkpMaterialType.KeyValue := 0;
      dblkpSupplier.KeyValue := 0;
      edtID.text := '';
      edtDateEffective.text := '';
      edtDateInEffective.text := '';
      chkbxInactive.Checked := false;
      chkbxUseForGeneralQuoting.Checked := false;
    end
  else
    with frmWTLUCustWTGRoups.qryCustWTGroup do
      begin
        iCode := fieldbyname('Group_Number').asinteger;

        edtGroupDescription.Text := fieldbyname('Group_Description').asstring;
        dblkpMaterialType.KeyValue := fieldbyname('Material_Type').asinteger;
        dblkpSupplier.KeyValue := fieldbyname('Supplier').asinteger;
        edtDateEffective.text := paDateStr(fieldbyname('Effective_Date').asdatetime);
        edtDateInEffective.text := paDateStr(fieldbyname('InEffective_Date').asdatetime);
        chkbxUseForGeneralQuoting.Checked := (fieldbyname('Use_For_General_Quoting').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;

  EnableOK(self);
end;

procedure TfrmWTMaintCustWTGroup.dblkpMaterialTypeClick(Sender: TObject);
begin
  dblkpSupplier.keyValue := qryMaterialType.fieldbyname('Preferred_Supplier').asinteger;
  EnableOK(self);
end;

procedure TfrmWTMaintCustWTGroup.SpeedButton4Click(Sender: TObject);
begin
  dblkpSupplier.KeyValue := 0;
end;

procedure TfrmWTMaintCustWTGroup.btnSupplierClick(Sender: TObject);
begin
  frmwtSrchSupplier := TfrmwtSrchSupplier.create(self);
  try
    frmwtSrchSupplier.showmodal;
    if frmwtSrchSupplier.modalresult = idOK then
      begin
        GetSuppliers;
      end
  finally
    frmwtSrchSupplier.free;
  end;

end;

procedure TfrmWTMaintCustWTGroup.GetSuppliers;
begin
  {Retrieve the material types}
  with qrySupplier do
    begin
      close;
      parambyname('Supplier').asinteger := frmWTLUCustWTGroups.qryCustWTGroup.fieldbyname('Supplier').asinteger;
      open;
    end;
end;

procedure TfrmWTMaintCustWTGroup.edtDateEffectiveExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWTMaintCustWTGroup.btnDateEffectiveClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateEffective.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateEffective.text;

  edtDateEffective.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTMaintCustWTGroup.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTMaintCustWTGroup.btnDateInEffectiveClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateEffective.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateEffective.text;

  edtDateInEffective.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintCustWTGroup.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if FunctionMode[1] in ['A', 'C', 'P'] then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    if FunctionMode = 'P' then
    begin
      AddPatchKey;
      iCode := strtoint(edtID.Text);
    end;

    with qryUpdate do
      begin
        Close;
        parambyname('Customer').asinteger := Customer;
        parambyname('Group_Number').asinteger := iCode;

        parambyname('Group_Description').asstring := edtGroupDescription.Text;

        parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;

        if dblkpSupplier.Text = '' then
          Parambyname('Supplier').clear
        else
          Parambyname('Supplier').asinteger := dblkpSupplier.keyvalue;

        if chkbxInactive.Checked then
          ParamByName('inActive').asstring := 'Y'
        else
          ParamByName('inActive').asstring := 'N';

        {Set Use for quoting field}
        if chkbxUseForGeneralQuoting.Checked then
          ParamByName('Use_For_General_Quoting').asstring := 'Y'
        else
          ParamByName('Use_For_General_Quoting').asstring := 'N';

        {Set the effective and ineffective dates}
        ParamByName('Effective_Date').asdatetime := paDateStr(edtDateEffective.text);
        ParamByName('InEffective_Date').asdatetime := paDateStr(edtDateInEffective.text);

        ExecSQL;
      end;
  end;
end;

function TfrmWTMaintCustWTGroup.GetNextKey: integer;
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
      ParamByName('Material_Type').Asinteger := dblkpMaterialType.KeyValue;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('Customer').Asinteger := Customer;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Group_Number').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

function TfrmWTMaintCustWTGroup.AddPatchKey: integer;
begin
    //insert patch record
    with qryPatch do
    begin
      ParamByName('Customer').Asinteger := Customer;
      ParamByName('Material_Type').Asinteger := dblkpMaterialType.KeyValue;
      ParamByName('Group_Number').Asinteger := strtoint(edtID.text);
      ExecSQL;
    end;
end;

procedure TfrmWTMaintCustWTGroup.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Worktop_Group ' +
            '(Customer, Group_Number, Group_Description, Material_Type) ' +
            'VALUES(' + inttostr(Customer) + ', 0, ''Dummy''' + inttostr(dblkpMaterialType.KeyValue) + ') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintCustWTGroup.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Worktop_Group Where Customer = ' + inttostr(Customer) + ' AND Group_Number = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
