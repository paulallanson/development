unit WTMaintCustTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, DBTables;

type
  TfrmWTMaintCustTypes = class(TForm)
    Label1: TLabel;
    Label10: TLabel;
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtDescription: TEdit;
    edtSalesNominal: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWTMaintCustTypes: TfrmWTMaintCustTypes;

implementation

uses wtLUCustType, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmWTMaintCustTypes.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintCustTypes.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintCustTypes.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtDescription.Text) <> '');
end;

procedure TfrmWTMaintCustTypes.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDescription.Text := '';
      edtSalesNominal.Text := '';
      chkbxInactive.Checked := false;

    end
  else
    with frmWTLUCustType.qryCustTypes do
      begin
        iCode := fieldbyname('Customer_Type').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;
        edtSalesNominal.Text := fieldbyname('Sales_Nominal').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintCustTypes.SaveToDB;
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
      parambyname('Customer_Type').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;
      parambyname('Sales_Nominal').asstring := edtSalesNominal.Text;
      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintCustTypes.GetNextKey: integer;
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
      Result := FieldByName('Customer_Type').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintCustTypes.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Type ' +
            '(Customer_Type, Description, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintCustTypes.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Type Where Customer_Type = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
