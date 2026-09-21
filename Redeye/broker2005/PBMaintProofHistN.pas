unit PBMaintProofHistN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintProofHistNFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    Label6: TLabel;
    DateEdit: TEdit;
    StatDBLCB: TDBLookupComboBox;
    StatSRC: TDataSource;
    GetStatSQL: TFDQuery;
    SelDateBtn: TSpeedButton;
    PurchOrdLabel: TLabel;
    qryZero: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure TypeDBLUCBClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure StatDBLCBClick(Sender: TObject);
    procedure SelDateBtnClick(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
  private
    procedure AddZero;
    procedure DeleteZero;
  public
    sFuncMode: string[1];
    iCode, iPurchOrdLine: Integer;
    rPurchOrd: real;
    function GetNextDbKey : integer;
  end;

var
  PBMaintProofHistNFrm: TPBMaintProofHistNFrm;

implementation

uses UITypes, DateSelV5, PBLUProofHistN, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintProofHistNFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the lookup SQLs}
  GetStatSQL.Active := False;
  GetStatSQL.parambyname('Proof_Status').Asstring := PBLUProofHistNFrm.GetDetsSQL.FieldByName('Proof_Status').AsString;
  GetStatSQL.Active := True;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add new proof hist';
  if sFuncMode = 'C' then
    Caption := 'Change proof hist';
  if sFuncMode = 'D' then
    Caption := 'Delete proof hist';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DateEdit.Text := PBDatestr(Date);
    StatDBLCB.KeyValue := 0;
  end
  else
  begin
    with PBLUProofHistNFrm.GetDetsSQL do
    begin
      iCode := FieldByName('Proof_History').AsInteger;
      DateEdit.Text := DateToStr(FieldByName('Proof_Date').AsFloat);
      StatDBLCB.KeyValue := FieldByName('Proof_Status').AsString;
    end;
  end;
  PurchOrdLabel.Caption := 'For Purchase Order: ' + floatToStr(rPurchOrd) +
    '   Line: ' +
    IntToStr(iPurchOrdLine);
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckOK(Self);
  if (sFuncMode <> 'D') then
     StatDBLCB.setfocus ;
  dmBroker.ScreenAccessControl(Self,'',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintProofHistNFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DateEdit.Text <> '') and
    (StatDBLCB.text <> '');
end;

procedure TPBMaintProofHistNFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProofHistNFrm.TypeDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProofHistNFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A','C'] then
  begin
    if sFuncMode = 'A' then
      iCode := GetNextDbKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Proof_History').AsInteger := iCode;
      ParamByName('Purchase_Order').asfloat := rPurchOrd;
      ParamByName('Line').AsInteger := iPurchOrdLine;
      ParamByName('Proof_Date').AsDateTime := StrToDate(DateEdit.Text) + Time;
      ParamByName('Proof_Status').AsString := StatDBLCB.KeyValue;
      ParambyName('Operator').asinteger := frmPBMainMenu.iOperator;
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
        ParamByName('Proof_History').AsInteger := iCode;
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBMaintProofHistNFrm.StatDBLCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProofHistNFrm.SelDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(DateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      DateEdit.Text := DateToStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBMaintProofHistNFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Proof_History ' +
            '(Proof_History, Proof_Status, Proof_Date, Purchase_Order, Line) ' +
            'VALUES(0, ''D'', ''01/01/2000'',null,null)');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProofHistNFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Proof_History Where Proof_History=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintProofHistNFrm.GetNextDbKey: integer;
var
  aDouble : double;
begin
  { We can't use GUIDs here to be unique as there isn't a string
    field in the table so use the PC's current date/time and the
    PO Number/Line to be as unique as possible.  We have to be
    very, very unlucky for two users to hit this code at the identical
    minute on the same PO and Line. }
  AddZero;
  try
    aDouble := Now;
    with AddSQL do
    begin
      ParamByName('Date').AsDateTime := aDouble;
      ParamByName('Order').Asfloat := rPurchOrd;
      ParamByName('Line').AsInteger := iPurchOrdLine;
      ParamByName('Proof_Status').AsString := StatDBLCB.KeyValue;
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('Date').AsDateTime := aDouble;
      ParamByName('Order').Asfloat := rPurchOrd;
      ParamByName('Line').AsInteger := iPurchOrdLine;
      ParamByName('Proof_Status').AsString := StatDBLCB.KeyValue;
      Open;
      Result := FieldByName('Proof_History').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintProofHistNFrm.DateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateEdit.SetFocus;
      Exit;
    end;
  end;

  DateEdit.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;


end.
