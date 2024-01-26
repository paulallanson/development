unit wtMaintStockSystem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, Data.DB, QrCtrls, Spin,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmWTMaintStockSystem = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    label1: TLabel;
    edtStockSystemDescription: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryZero: TFDQuery;
    Label2: TLabel;
    edtStockSystem: TEdit;
    pnlStockSystem: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtDatabaseAlias: TEdit;
    edtUsername: TEdit;
    edtPassword: TEdit;
    edtOrderImportDirectory: TEdit;
    chkbxExternalSystem: TCheckBox;
    Button3: TButton;
    Label7: TLabel;
    spnInterval: TSpinEdit;
    Label8: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkbxExternalSystemClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    customer: integer;
    FfunctionMode: string;
    procedure SetfunctionMode(const Value: string);
    procedure SaveToDB;
    { Private declarations }
  public
    sCode: string;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintStockSystem: TfrmWTMaintStockSystem;

implementation

uses wtLUStockSystem, ComObj, ActiveX, AllCommon;

{$R *.dfm}

{ TfrmWTMaintReps }

procedure TfrmWTMaintStockSystem.SetfunctionMode(const Value: string);
begin
  FfunctionMode := Value;
end;

procedure TfrmWTMaintStockSystem.btnOKClick(Sender: TObject);
begin
  SaveToDB;

end;

procedure TfrmWTMaintStockSystem.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (edtStockSystemDescription.Text <> '');
end;

procedure TfrmWTMaintStockSystem.FormShow(Sender: TObject);
begin
  EnableOK(Self);
end;

procedure TfrmWTMaintStockSystem.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      sCode := '';
      edtStockSystem.Text := '';
      edtStockSystemDescription.Text := '';

      chkbxExternalSystem.checked := true;
      pnlStockSystem.Enabled := true;
      edtDatabaseAlias.Text := '';
      edtUsername.Text := '';
      edtPassword.Text := '';

      spnInterval.Value := 0;
      
      edtOrderImportDirectory.Text := '';

    end
  else
    with frmWTLUStockSystem.qryStockSystem do
      begin
        sCode := fieldbyname('Stock_System').asstring;

        edtStockSystem.Text := fieldbyname('Stock_System').asstring;
        edtStockSystemDescription.Text := fieldbyname('Stock_System_Description').asstring;

        edtStockSystem.Enabled := false;

        chkbxExternalSystem.checked := (fieldbyname('External_System').asstring = 'Y');
        edtDatabaseAlias.Text := fieldbyname('Database_Alias_Name').asstring;
        edtUsername.Text := fieldbyname('Login_Username').asstring;
        edtPassword.Text := fieldbyname('Login_Password').asstring;

        spnInterval.Value := fieldbyname('Order_Process_Interval').asinteger;

        edtOrderImportDirectory.Text := fieldbyname('Sales_Order_Import_Directory').asstring;
      end;

  pnlStockSystem.Enabled := chkbxExternalSystem.checked;
  EnableOK(self);
end;

procedure TfrmWTMaintStockSystem.SaveToDB;
var
  aGuid: TGuid;
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      sCode := edtStockSystem.text;
      with qryAdd do
        begin
          close;
          ParamByName('Stock_System').AsString := sCode;
          parambyname('Stock_System_Description').asstring := edtStockSystemDescription.Text;
          ExecSQL;
        end;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Stock_System').asstring := sCode;
      parambyname('Stock_System_Description').asstring := edtStockSystemDescription.Text;

      if chkbxExternalSystem.checked then
        parambyname('External_System').asstring := 'Y'
      else
        parambyname('External_System').asstring := 'N';

      parambyname('Database_Alias_Name').asstring := edtDatabaseAlias.Text;
      parambyname('Login_Username').asstring := edtUsername.Text;
      parambyname('Login_Password').asstring := edtPassword.Text;

      parambyname('Sales_Order_Import_Directory').asstring := edtOrderImportDirectory.Text;

      parambyname('Order_Process_Interval').asinteger := spnInterval.Value;
      ExecSQL;
    end;
  end;
end;

procedure TfrmWTMaintStockSystem.chkbxExternalSystemClick(Sender: TObject);
begin
  pnlStockSystem.Enabled := (Sender as TCheckBox).Checked;
end;

procedure TfrmWTMaintStockSystem.Button3Click(Sender: TObject);
var
  DirDlg: TDirDlg;
begin
  DirDlg := TDirDlg.Create(Self);
  try
     DirDlg.InitialPath := edtOrderImportDirectory.Text;
    if DirDlg.Execute then
      edtOrderImportDirectory.Text := DirDlg.Pathname;
  finally
    DirDlg.Free;
  end;
end;

end.
