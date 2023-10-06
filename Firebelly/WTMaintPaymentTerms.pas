unit WTMaintPaymentTerms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, CRControls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintPaymentTerms = class(TForm)
    Label1: TLabel;
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    edtNumberofDays: TCREditInt;
    edtPaymentTermsDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
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
  frmWTMaintPaymentTerms: TfrmWTMaintPaymentTerms;

implementation

uses WTLUPaymentTerms, ComObj, ActiveX;

{$R *.dfm}

procedure TfrmWTMaintPaymentTerms.btnOKClick(Sender: TObject);
begin
  SavetoDB;
end;

procedure TfrmWTMaintPaymentTerms.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintPaymentTerms.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtPaymentTermsDescription.Text := '';
      edtNumberofDays.text := '';

    end
  else
    with frmWTLUPaymentTerms.qryPaymentTerms do
      begin
        iCode := fieldbyname('Payment_Terms').asinteger;

        edtPaymentTermsDescription.Text := fieldbyname('Payment_Terms_Description').asstring;
        edtNumberofDays.text := fieldbyname('Number_of_Days').asstring;
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintPaymentTerms.EnableOK(Sender: TObject);
begin
  btnOK.enabled := edtPaymentTermsDescription.text <> '';
end;

procedure TfrmWTMaintPaymentTerms.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Payment_terms').asinteger := iCode;
      parambyname('Payment_terms_Description').asstring := edtPaymentTermsDescription.Text;
      parambyname('Number_of_Days').asinteger := StrToIntDef(edtNumberOfDays.Text, 0);
      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintPaymentTerms.GetNextKey: integer;
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
      Result := FieldByName('Payment_terms').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintPaymentTerms.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Payment_Terms ' +
            '(Payment_Terms, Payment_terms_Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintPaymentTerms.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Payment_Terms Where Payment_Terms = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
