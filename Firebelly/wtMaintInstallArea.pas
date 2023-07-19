unit wtMaintInstallArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, CRControls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintInstallArea = class(TForm)
    Label1: TLabel;
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    dblkpCountry: TDBLookupComboBox;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryCountry: TFDQuery;
    dtsCountry: TDataSource;
    edtDescription: TEdit;
    edtTemplatingPrice: TCREditMoney;
    edtFittingPrice: TCREditMoney;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryGetLast: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FFunctionMode: string;
    FTempatePrice: currency;
    FFittingPrice: currency;
    FDefaultCountry: integer;
    procedure SetFunctionMode(const Value: string);
    procedure SetDefaultCountry(const Value: integer);
    function GetLastKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    iCode: integer;
    property DefaultCountry: integer read FDefaultCountry write SetDefaultCountry;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWTMaintInstallArea: TfrmWTMaintInstallArea;

implementation

uses wtLUInstallArea, wtLUCountry, wtDataModule;

{$R *.dfm}

procedure TfrmWTMaintInstallArea.btnOKClick(Sender: TObject);
begin
  SaveToDB;

end;

procedure TfrmWTMaintInstallArea.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;

end;

procedure TfrmWTMaintInstallArea.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtDescription.Text) <> '');
end;

procedure TfrmWTMaintInstallArea.FormActivate(Sender: TObject);
begin
  qryCountry.Active := false;
  qryCountry.Active := true;

  dblkpCountry.KeyValue := DefaultCountry;

  if FunctionMode = 'A' then
    begin
      iCode := 0;

      edtDescription.Text := '';
      dblkpCountry.KeyValue := 0;
      edtTemplatingPrice.Text := '0.00';
      edtFittingPrice.Text := '0.00';
      chkbxInactive.Checked := false;

    end
  else
    with frmWtLUInstallArea.qryInstallationArea do
      begin
        iCode := fieldbyname('Installation_Area').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;
        dblkpCountry.keyvalue := fieldbyname('Country').asinteger;
        edtTemplatingPrice.Text := formatfloat('0.00',fieldbyname('Templating_Price').asfloat);
        edtFittingPrice.Text := formatfloat('0.00',fieldbyname('Fitting_Price').asfloat);

        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');
      end;
  EnableOK(self);
end;

procedure TfrmWTMaintInstallArea.Button2Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUCountry := TfrmWTLUCountry.Create( Application );
  try
    frmWTLUCountry.showmodal;
    
    qryCountry.Active := false;
    qryCountry.Active := true;
  finally
    frmWTLUCountry.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintInstallArea.SetDefaultCountry(const Value: integer);
begin
  FDefaultCountry := Value;
end;

procedure TfrmWTMaintInstallArea.SaveToDB;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          Close;
          parambyname('Description').asstring := edtDescription.Text;
          if dblkpCountry.KeyValue = 0 then
            parambyname('Country').clear
          else
            parambyname('Country').asinteger := dblkpCountry.keyvalue;
          parambyname('Templating_Price').asfloat := strtofloat(edtTemplatingPrice.Text);
          parambyname('Fitting_Price').asfloat := strtofloat(edtFittingPrice.Text);

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
          parambyname('Installation_Area').asinteger := iCode;

          parambyname('Description').asstring := edtDescription.Text;
          if dblkpCountry.KeyValue = 0 then
            parambyname('Country').clear
          else
            parambyname('Country').asinteger := dblkpCountry.keyvalue;

          parambyname('Templating_Price').asfloat := strtofloat(edtTemplatingPrice.Text);
          parambyname('Fitting_Price').asfloat := strtofloat(edtFittingPrice.Text);

          if chkbxInactive.Checked then
            ParamByName('inActive').asstring := 'Y'
          else
            ParamByName('inActive').asstring := 'N';

          ExecSQL;
        end;
    end;
  end;
end;

function TfrmWTMaintInstallArea.GetLastKey: integer;
begin
  with qryGetLast do
    begin
      Close;
      Open;
      Result := FieldByName('Installation_Area').AsInteger;
    end;
end;

end.
