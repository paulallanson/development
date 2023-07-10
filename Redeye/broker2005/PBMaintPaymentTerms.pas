unit PBMaintPaymentTerms;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls, Spin;

type
  TPBMaintPaymentTermsFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    UpdSQL: TQuery;
    GetLastSQL: TQuery;
    DelSQL: TQuery;
    AddSQL: TQuery;
    DetsSRC: TDataSource;
    qryZero: TQuery;
    Label2: TLabel;
    spnDays: TSpinEdit;
    rdgrpPaymentType: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure spnDaysChange(Sender: TObject);
    procedure rdgrpPaymentTypeClick(Sender: TObject);
  private
    FActivated: boolean;
    procedure AddZero;
    procedure DeleteZero;
    procedure DoDelete;
    function GetNextKey: integer;
    procedure ConstructTerms;
  public
    iCode: integer;
    sFuncMode: string[1];
  end;

var
  PBMaintPaymentTermsFrm: TPBMaintPaymentTermsFrm;

implementation

uses ComObj, ActiveX, PBDatabase, pbMainMenu, PBLUPaymentTerms;

{$R *.DFM}

procedure TPBMaintPaymentTermsFrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    {Create the memo form}
    {Re-activate the lookup SQLs}
    {Setup titles}
    if sFuncMode = 'A' then
      Caption := 'Add new payment terms';
    if sFuncMode = 'C' then
      Caption := 'Change payment terms';
    if sFuncMode = 'D' then
      Caption := 'Delete payment terms';
    if sFuncMode = 'A' then
    begin
      {Empty details}
      DescrEdit.Text := '';
      spnDays.Value := 0;
      rdgrpPaymentType.ItemIndex := 0;
    end
    else
    begin
      with PBLUPaymentTermsFrm.DetsSRC.DataSet do
      begin
        iCode := FieldByName('Payment_Terms').Asinteger;
        DescrEdit.Text := FieldByName('Payment_Terms_Description').AsString;
        spnDays.Value := fieldbyname('Number_of_Days').asinteger;
        if fieldbyname('Payment_Type').asstring = 'A' then
          rdgrpPaymentType.itemindex := 0
        else
        if fieldbyname('Payment_Type').asstring = 'DD' then
          rdgrpPaymentType.itemindex := 1
        else
        if fieldbyname('Payment_Type').asstring = 'CC' then
          rdgrpPaymentType.itemindex := 2
        else
          rdgrpPaymentType.itemindex := 3;
      end;
    end;
    {Enable or disable the buttons}

    FActivated := true;

    DetsGrpBox.Enabled := (sFuncMode <> 'D');
    DelLabel.Visible := (sFuncMode = 'D');
    CheckOK(Self);
    dmBroker.ScreenAccessControl(Self,'mnuPaymentTerms',frmPBMainMenu.iOperator,0,0);
  end;
end;

procedure TPBMaintPaymentTermsFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '');
end;

procedure TPBMaintPaymentTermsFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPaymentTermsFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPaymentTermsFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPaymentTermsFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;

    with UpdSQL do
    begin
      Close;
      ParamByName('Payment_Terms').AsInteger := iCode;
      ParamByName('Payment_Terms_Description').AsString := DescrEdit.Text + '';
      ParamByName('Number_of_Days').Asinteger := spnDays.value;

      case rdgrpPaymentType.ItemIndex of
        0: ParamByName('Payment_Type').AsString := 'A';
        1: ParamByName('Payment_Type').AsString := 'DD';
        2: ParamByName('Payment_Type').AsString := 'CC';
      else
        ParamByName('Payment_Type').AsString := 'UP';
      end;

      ExecSQL;
    end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      try
        DoDelete;
      except
        messagedlg('Cannot delete, this Payment Type is associated with a customer.', mtError, [mbOk], 0);
        exit;
      end;
  end;
end;

procedure TPBMaintPaymentTermsFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Payment_Terms ' +
            '(Payment_Terms,Payment_Terms_Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintPaymentTermsFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Payment_terms Where Payment_Terms=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintPaymentTermsFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Payment_Terms').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintPaymentTermsFrm.DoDelete;
begin
  with DelSQL do
  begin
    SQL.Clear;
    SQL.Add('Delete From Payment_Terms ' +
            'Where Payment_Terms = ' + IntToStr(iCode));
    ExecSQL;
  end;
end;

procedure TPBMaintPaymentTermsFrm.ConstructTerms;
var
  sPayment: string;
begin
  if not FActivated then exit;

  if rdgrpPaymentType.itemindex = 0 then
    sPayment := inttostr(spnDays.value) + ' days'
  else
  if rdgrpPaymentType.itemindex = 3 then
    sPayment := 'Payment Upfront'
  else
    sPayment := inttostr(spnDays.value) + ' days' + ' ' + rdgrpPaymentType.Items[rdgrpPaymentType.itemindex];

  descredit.Text := sPayment;
end;

procedure TPBMaintPaymentTermsFrm.spnDaysChange(Sender: TObject);
begin
  ConstructTerms;
end;

procedure TPBMaintPaymentTermsFrm.rdgrpPaymentTypeClick(Sender: TObject);
begin
  ConstructTerms;
end;

end.
