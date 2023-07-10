unit PBMaintCustProductTemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TPBMaintCustProductTempFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    DetsSRC: TDataSource;
    qryZero: TQuery;
    CustLabel: TLabel;
    edtPrefix: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    sFuncMode: string[1];
    iCode: integer;
    iCust: integer;
    sPrefix: string;
  end;

var
  PBMaintCustProductTempFrm: TPBMaintCustProductTempFrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUCustProductTemp;

{$R *.DFM}

procedure TPBMaintCustProductTempFrm.FormActivate(Sender: TObject);
begin
  CustLabel.Caption := 'Customer: ' + PBLUCustProductTempFrm.sCustName;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Product Template';
  if sFuncMode = 'C' then
    Caption := 'Change a Product Template';
  if sFuncMode = 'D' then
    Caption := 'Delete a Product Template';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    edtPrefix.Text := sPrefix;
    DescrEdit.Text := '';
  end
  else
  begin
    with PBLUCustProductTempFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Template_no').AsInteger;
      edtPrefix.Text := FieldByName('Product_Code_Prefix').AsString;
      DescrEdit.Text := FieldByName('Product_Template').AsString;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
end;

procedure TPBMaintCustProductTempFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintCustProductTempFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCustProductTempFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCustProductTempFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCustProductTempFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: integer;
begin
if sFuncMode[1] in ['A','C'] then
  begin
    if sFuncMode = 'A' then
    begin
      with GetLastSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCust;
        Open;
        First;
        iTempNewCode := FieldByName('Last_Code').AsInteger + 1;
        Close;
      end;

      with AddSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCust;
        ParamByName('Template_No').AsInteger := iTempNewCode;
        ParamByName('Product_Code_Prefix').AsString := edtPrefix.Text + '';
        ParamByName('Product_Template').AsString := DescrEdit.Text + '';
        execsql;
      end;
    end
    else
    begin
      with UpdSQL do
      begin
        ParamByName('Customer').AsInteger := iCust;
        ParamByName('Template_no').AsInteger := iCode;
        ParamByName('Product_Code_Prefix').AsString := edtPrefix.Text + '';
        ParamByName('Product_Template').AsString := DescrEdit.Text + '';
        ExecSQL;
      end;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
    begin
      with DelSQL do
      begin
        Close;
        ParamByName('Customer').AsInteger := iCust;
        ParamByName('Template_no').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintCustProductTempFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Customer_Product_Template ' +
            '(Customer, Template_no, Product_Template) ' +
            'VALUES(''0'',''0'',''Dummy'')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCustProductTempFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Customer_Product_Template Where Customer = ''0'' and Template_no = ''0''');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintCustProductTempFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Template_no').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
