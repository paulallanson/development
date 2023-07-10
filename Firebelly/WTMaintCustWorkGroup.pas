unit WTMaintCustWorkGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons, DBCtrls;

type
  TfrmWTMaintCustWorkGroup = class(TForm)
    Label1: TLabel;
    edtGroupDescription: TEdit;
    Label2: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryMatTypes: TQuery;
    dtsMatTypes: TDataSource;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FFuncMode: string;
    procedure SetFuncMode(const Value: string);
    procedure ShowDetails;
    { Private declarations }
  public
    iCustomer: integer;
    iGroup: integer;
    sDescription: string;
    MaterialType: integer;
    bInactive: boolean;
    property FuncMode: string read FFuncMode write SetFuncMode;
  end;

var
  frmWTMaintCustWorkGroup: TfrmWTMaintCustWorkGroup;

implementation

{$R *.dfm}

procedure TfrmWTMaintCustWorkGroup.FormActivate(Sender: TObject);
begin
  with qryMatTypes do
    begin
      close;
      parambyname('Material_Type').asinteger := MaterialType;
      open;
    end;

  ShowDetails;
end;

procedure TfrmWTMaintCustWorkGroup.SetFuncMode(const Value: string);
begin
  FFuncMode := Value;
  if FFuncMode = 'D' then
    begin
      edtGroupDescription.enabled := false;
      dblkpMaterialType.enabled := false;
      chkbxInactive.enabled := false;
    end;
end;

procedure TfrmWTMaintCustWorkGroup.ShowDetails;
begin
  if FuncMode = 'A' then
    begin
      edtGroupDescription.text := '';
      dblkpMaterialType.keyvalue := 0;
      chkbxInactive.checked := false;
    end
  else
    begin
      edtGroupDescription.text := sDescription;
      dblkpMaterialType.KeyValue := MaterialType;
      chkbxInactive.checked := bInactive;
    end;
end;

procedure TfrmWTMaintCustWorkGroup.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  BtnOK.Enabled := ((edtGroupDescription.Text <> '')  and (dblkpMaterialType.text <> '')) or (FuncMode = 'D');
end;

procedure TfrmWTMaintCustWorkGroup.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintCustWorkGroup.btnOKClick(Sender: TObject);
begin
  sDescription := edtGroupDescription.text;
  iGroup := 1;
  MaterialType := dblkpMaterialType.KeyValue;
end;

end.
