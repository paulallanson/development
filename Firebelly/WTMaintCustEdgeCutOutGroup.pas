unit WTMaintCustEdgeCutOutGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, DBCtrls;

type
  TfrmWTMaintCustEdgeCutOutGroup = class(TForm)
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    edtDescription: TEdit;
    qryAdd: TQuery;
    qryUpd: TQuery;
    Label2: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    qryMaterialType: TQuery;
    srcMaterialtype: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    edtDateEffective: TEdit;
    btnDateEffective: TBitBtn;
    edtDateInEffective: TEdit;
    btnDateInEffective: TBitBtn;
    qryGetLast: TQuery;
    chkbxUseForGeneralQuoting: TCheckBox;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtDateEffectiveExit(Sender: TObject);
    procedure btnDateEffectiveClick(Sender: TObject);
    procedure btnDateInEffectiveClick(Sender: TObject);
  private
    FMode: string;
    FCode: integer;
    FCustomer: integer;
    FMaterialType: integer;
    procedure SetMode(const Value: string);
    procedure SetCode(const Value: integer);
    procedure SetCustomer(const Value: integer);
    procedure SetMaterialType(const Value: integer);
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  public
    property Code: integer read FCode write SetCode;
    property Customer: integer read FCustomer write SetCustomer;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property Mode: string read FMode write SetMode;
  end;

var
  frmWTMaintCustEdgeCutOutGroup: TfrmWTMaintCustEdgeCutOutGroup;

implementation

uses WTLUCustEdgeCutOutGroup, DateSelV5, AllCommon;

{$R *.dfm}

{ TfrmWTMaintCustEdgeCutOutGroup }

procedure TfrmWTMaintCustEdgeCutOutGroup.SetCode(const Value: integer);
begin
  FCode := Value;
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.SetMode(const Value: string);
begin
  FMode := Value;
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.FormActivate(Sender: TObject);
begin
  {Setup titles}
  if Mode = 'A' then
    Caption := 'Add a customer group';
  if Mode = 'C' then
    Caption := 'Change a customer group';
  if Mode = 'D' then
    Caption := 'Delete a customer group';

  {Retrieve the material types}
  with qryMaterialType do
    begin
      close;
      parambyname('Material_Type').asinteger := MaterialType;
      open;
    end;

  if Mode = 'A' then
  begin
    {Empty details}
    edtDescription.Text := '';
    chkbxInActive.Checked := false;
    chkbxUseForGeneralQuoting.Checked := false;
    edtDateEffective.text := '';
    edtDateInEffective.text := '';
  end
  else
  begin
    with frmWTLUCustEdgeCutOutGroup.dtsGetGroups.DataSet do
    begin
      Code := FieldByName('Group_Id').AsInteger;
      edtDescription.Text := FieldByName('Group_Description').AsString;
      dblkpMaterialType.keyvalue := FieldByName('Material_Type').AsInteger;
      chkbxUseForGeneralQuoting.Checked := (fieldbyname('Use_For_General_Quoting').asstring = 'Y');
      chkbxInactive.checked := (fieldByName('InActive').AsString = 'Y');
      edtDateEffective.text := paDateStr(fieldbyname('Effective_Date').asdatetime);
      edtDateInEffective.text := paDateStr(fieldbyname('InEffective_Date').asdatetime);
    end;
  end;
  {Enable or disable the buttons}
  CheckOK(Self);
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  btnOK.Enabled := (edtDescription.Text <> '') and
                   (dblkpMaterialType.Text <> '');
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.btnOKClick(Sender: TObject);
begin
  {validate dates}
  if edtDateInEffective.text <> '' then
    begin
      if (trim(edtDateEffective.text) <> '') AND (paDateStr(edtDateEffective.text) > paDateStr(edtDateInEffective.text)) then
        begin
          messagedlg('Invalid date range', mtError, [mbOk], 0);
          edtDateEffective.setfocus;
          exit;
        end;
    end;

  if Mode[1] in ['A'] then
    begin
      with qryAdd do
        begin
          close;
          ParamByName('Group_Description').AsString := edtDescription.Text + '';
          ParamByName('Customer').AsInteger := self.Customer;
          ParamByName('Material_Type').AsInteger := dblkpMaterialType.keyvalue;

          {Set the effective and ineffective dates}
          ParamByName('Effective_Date').asdatetime := paDateStr(edtDateEffective.text);
          ParamByName('InEffective_Date').asdatetime := paDateStr(edtDateInEffective.text);

          {Set Use for quoting field}
          if chkbxUseForGeneralQuoting.Checked then
            ParamByName('Use_For_General_Quoting').asstring := 'Y'
          else
            ParamByName('Use_For_General_Quoting').asstring := 'N';

          ExecSQL;
        end;
        
      with qryGetLast do
        begin
          close;
          open;
          Code := fieldbyname('Max_Group_Id').AsInteger;
        end;
    end
  else
    begin
      with qryUpd do
        begin
          close;
          ParamByName('Group_ID').Asinteger := Code;
          ParamByName('Group_Description').AsString := edtDescription.Text + '';
          ParamByName('Material_Type').AsInteger := dblkpMaterialType.keyvalue;

          {Set the effective and ineffective dates}
          ParamByName('Effective_Date').asdatetime := paDateStr(edtDateEffective.text);
          ParamByName('InEffective_Date').asdatetime := paDateStr(edtDateInEffective.text);

          {Set Use for quoting field}
          if chkbxUseForGeneralQuoting.Checked then
            ParamByName('Use_For_General_Quoting').asstring := 'Y'
          else
            ParamByName('Use_For_General_Quoting').asstring := 'N';

          if chkbxInActive.checked then
            ParamByName('InActive').AsString := 'Y'
          else
            ParamByName('InActive').AsString := 'N';
          ExecSQL;
        end
    end;
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.SetMaterialType(
  const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.edtDateEffectiveExit(
  Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.btnDateEffectiveClick(
  Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateEffective.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateEffective.text;

  edtDateEffective.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTMaintCustEdgeCutOutGroup.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTMaintCustEdgeCutOutGroup.btnDateInEffectiveClick(
  Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateEffective.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateEffective.text;

  edtDateInEffective.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

end.
