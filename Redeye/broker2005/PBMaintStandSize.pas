unit PBMaintStandSize;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintStandSizeFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DescrEdit: TEdit;
    Label2: TLabel;
    DetsSRC: TDataSource;
    Label3: TLabel;
    WidthMemo: TMemo;
    DepthMemo: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    qryZero: TFDQuery;
    edtShort: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    MultiplierMemo: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure UnitFactorEditChange(Sender: TObject);
    function IncrementNo(StartStr: string): string;
    procedure SaveValue(Sender: TObject);
    procedure ValidateQty(Sender: TObject);
    function FormatQty(TempQty: string): string;
  private
    sOldValue: string;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
  public
    { Public declarations }
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  PBMaintStandSizeFrm: TPBMaintStandSizeFrm;

implementation

uses UITypes, PBLUPriceUnit, PBLUStandSize, ComObj, ActiveX, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintStandSizeFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  {Re-activate the lookup SQLs}
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new standard size';
  if sFuncMode = 'C' then
    Caption := 'Change a standard size';
  if sFuncMode = 'D' then
    Caption := 'Delete a standard size';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    edtShort.Text := '';
    WidthMemo.Text := '';
    DepthMemo.Text := '';
    MultiplierMemo.Text := '';
  end
  else
  begin
    with PBLUStandSizeFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Paper_Size').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      edtShort.Text := Fieldbyname('Short_Description').asstring;
      WidthMemo.Text := IntToStr(FieldByName('Paper_Width_mm').AsInteger);
      DepthMemo.Text := IntToStr(FieldByName('Paper_Depth_mm').AsInteger);
      multiplierMemo.Text := formatfloat('0.00',FieldByName('A4_multiplier').Asfloat);
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuPaperSizes',frmPbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintStandSizeFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
    (WidthMemo.Text <> '') and
    (DepthMemo.Text <> '') and
    (MultiplierMemo.Text <> '');
end;

procedure TPBMaintStandSizeFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintStandSizeFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintStandSizeFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintStandSizeFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A','C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Paper_Size').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      Parambyname('Short_Description').asstring := edtShort.Text;
      ParamByName('Paper_Width_mm').AsInteger := StrToInt(WidthMemo.Text);
      ParamByName('Paper_Depth_mm').AsInteger := StrToInt(DepthMemo.Text);
      ParamByName('A4_Multiplier').Asfloat := StrToFloatDef(MultiplierMemo.Text, 0, FormatSettings);
      ExecSQL;
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
        ParamByName('Paper_Size').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintStandSizeFrm.UnitFactorEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

function TPBMaintStandSizeFrm.IncrementNo(StartStr: string): string;
var
  StrLength, Count, Id: Integer;
  Alphas: string[27];
  Numbers: string[11];
  CurrChar: string[1];
begin
  Alphas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZA';
  Numbers := '01234567890';
  {Increment a string value by 1}
  StrLength := Length(StartStr);
  for Count := StrLength downto 1 do
  begin
    CurrChar := Copy(StartStr, Count, 1);
    Id := Pos(CurrChar, Numbers);
    if Id > 0 then
    begin
      StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Numbers, (Id + 1), 1) +
        Copy(StartStr, (Count + 1), (StrLength - Count));
      IncrementNo := StartStr;
      if Id < 10 then Exit;
    end
    else
    begin
      Id := Pos(CurrChar, Alphas);
      if Id > 0 then
      begin
        StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Alphas, (Id + 1), 1) +
          Copy(StartStr, (Count + 1), (StrLength - Count));
        IncrementNo := StartStr;
        if Id < 27 then Exit;
      end;
    end;
  end;
end;

procedure TPBMaintStandSizeFrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintStandSizeFrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

function TPBMaintStandSizeFrm.FormatQty(TempQty: string): string;
begin
  {Format the qunatity}
  if Trim(TempQty) = '' then
  begin
    Result := '';
    Exit;
  end;
  try
    begin
      Result := FormatFloat('######0', StrToFloatDef(TempQty, 0, FormatSettings));
      if StrToFloatDef(Result, 0, FormatSettings) < 0 then
      begin
        MessageDlg('Cannot be -ve', mtError, [mbOK], 0);
        Result := 'X';
      end;
    end;
  except MessageDlg('Invalid quantity - ' + TempQty, mtError, [mbOK], 0);
    Result := 'X';
  end;
end;

procedure TPBMaintStandSizeFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Paper_Size(Paper_Size,Description,' +
            'Paper_Width_mm,Paper_Depth_mm) VALUES(0,'''',0,0)');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintStandSizeFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Paper_Size WHERE Paper_Size=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintStandSizeFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  { Guid strings are 38 characters, Paper_Size Description field is
    only 30 so we can only use the first 30 chars of the guid.  This
    should be OK because it still gives some guarantee of uniqueness. }
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    with AddSQL do
    begin
      ParamByName('GUID').AsString := Copy(GuidToString(aGuid), 1, 30);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := Copy(GuidToString(aGuid), 1, 30);
      Open;
      Result := FieldByName('Paper_Size').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

end.
