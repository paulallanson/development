unit wtMaintSalesLead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintSalesLead = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    label1: TLabel;
    chkbxInactive: TCheckBox;
    edtSalesleadSourceDescr: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  frmWTMaintSalesLead: TfrmWTMaintSalesLead;

implementation

uses wtLUSalesLead, ComObj, ActiveX;

{$R *.dfm}

{ TfrmWTMaintReps }

procedure TfrmWTMaintSalesLead.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintSalesLead.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintSalesLead.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtSalesLeadSourceDescr.Text <> '');
end;

function TfrmWTMaintSalesLead.GetCustomerName(tempCust: integer): string;
begin
end;

procedure TfrmWTMaintSalesLead.FormShow(Sender: TObject);
begin
  EnableOK(Self);
end;

procedure TfrmWTMaintSalesLead.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtSalesLeadSourceDescr.Text := '';
      chkbxInactive.Checked := false;
    end
  else
    with frmWTLUSalesLead.qrySalesLeads do
      begin
        iCode := fieldbyname('Sales_Lead_Source').asinteger;

        edtSalesLeadSourceDescr.Text := fieldbyname('Sales_Lead_Source_Descr').asstring;
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintSalesLead.SaveToDB;
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
      parambyname('Sales_Lead_Source').asinteger := iCode;

      parambyname('Sales_Lead_Source_Descr').asstring := edtSalesLeadSourceDescr.Text;

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      ExecSQL;
    end;
  end;
end;

function TfrmWTMaintSalesLead.GetNextKey: integer;
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
      Result := FieldByName('Sales_Lead_Source').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintSalesLead.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Sales_Lead_Source ' +
            '(Sales_Lead_Source, Sales_Lead_Source_Descr, inactive) ' +
            'VALUES(0, ''Dummy'', ''N'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintSalesLead.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Sales_Lead_Source Where Sales_Lead_Source = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
