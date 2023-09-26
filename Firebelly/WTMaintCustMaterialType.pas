unit WTMaintCustMaterialType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, QrCtrls, DB, CRControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintCustMaterialType = class(TForm)
    label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    qryUpdate: TFDQuery;
    qryZero: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    Label2: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    edtRetailMultiplier: TCREditFloat;
    qryMaterialType: TFDQuery;
    dftsMaterialType: TDataSource;
    qryGetMaterialType: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FfunctionMode: string;
    FCustomerName: string;
    procedure SetfunctionMode(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    procedure SaveToDB;
    function GetLastKey: integer;
    procedure SetCustomerName(const Value: string);
    { Private declarations }
  public
    bOK: boolean;
    iCode: integer;
    iCustomer: integer;
    property CustomerName: string read FCustomerName write SetCustomerName;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintCustMaterialType: TfrmWTMaintCustMaterialType;

implementation

uses WTLURemedialDept, ComObj, ActiveX;

{$R *.dfm}

{ TForm1 }

procedure TfrmWTMaintCustMaterialType.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintCustMaterialType.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintCustMaterialType.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpMaterialType.Text <> '') and
                    (edtRetailMultiplier.text <> '');
end;

procedure TfrmWTMaintCustMaterialType.FormActivate(Sender: TObject);
begin
  bOK := false;
  
  with qryMaterialType do
    begin
      close;
      open;
    end;

  if FunctionMode = 'A' then
    begin
      iCode := 0;

      dblkpMaterialType.keyvalue := -1;
      edtRetailMultiplier.Text := '0.000';
      chkbxInactive.Checked := false;
    end
  else
      with qryGetMaterialType do
        begin
          close;
          parambyname('ID').asinteger := iCode;
          open;

        dblkpMaterialType.keyvalue := fieldbyname('Material_Type').asinteger;
        edtRetailMultiplier.Text := formatfloat('0.000',fieldbyname('Retail_Multiplier').asfloat);
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintCustMaterialType.SaveToDB;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Customer').asinteger := iCustomer;
          parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
          parambyname('Retail_Multiplier').asfloat := StrToFloatDef(edtRetailMultiplier.Text, 0, FormatSettings);

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('ID').asinteger := iCode;

          parambyname('Retail_Multiplier').asfloat := StrToFloatDef(edtRetailMultiplier.Text, 0, FormatSettings);

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;

  bOK := true;
end;

procedure TfrmWTMaintCustMaterialType.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Remedial_Dept ' +
            '(Remedial_Dept, Remedial_Dept_Descr, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintCustMaterialType.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Remedial_Dept Where Remedial_Dept = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TfrmWTMaintCustMaterialType.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('ID').AsInteger;
    end;
end;


procedure TfrmWTMaintCustMaterialType.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

end.
