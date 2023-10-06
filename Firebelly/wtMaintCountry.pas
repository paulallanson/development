unit wtMaintCountry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintCountry = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    edtDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWTMaintCountry: TfrmWTMaintCountry;

implementation

uses wtLUCountry;

{$R *.dfm}

procedure TfrmWTMaintCountry.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWTMaintCountry.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintCountry.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtDescription.Text) <> '');
end;

procedure TfrmWTMaintCountry.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDescription.Text := '';
    end
  else
    with frmWtLUCountry.qryCountry do
      begin
        iCode := fieldbyname('Country').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintCountry.SaveToDB;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Description').asstring := edtDescription.Text;

          ExecSQL;
          iCode := GetLastKey;
        end;
    end
    else
    begin
      with qryUpdate do
        begin
          Close;
          parambyname('Country').asinteger := iCode;

          parambyname('Description').asstring := edtDescription.Text;

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmWTMaintCountry.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Country').AsInteger;
    end;
end;

end.
