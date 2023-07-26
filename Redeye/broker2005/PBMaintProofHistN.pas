(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Proof History form.

VSS Info:
$Header: /PBL D5/PBMaintProofHistN.pas 9     20/06/03 9:53 Andrewh $
$History: PBMaintProofHistN.pas $
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:22
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 26/11/:1   Time: 16:01
 * Updated in $/PBL D5
 * Proof History is now updated with the time as well as date
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 26/07/:1   Time: 12:01
 * Updated in $/PBL D5
 * Changed to maintain Purchase Order proofs correctly
 * 
 * *****************  Version 9  *****************
 * User: Janiner      Date: 12/10/:0   Time: 11:47
 * Updated in $/PBL D5
 * Standardise formatdatetime to use PBDatestr in PBPOObjects, which
 * formats the date based on the selections in the control panel, regional
 * settings, data, short style.
 * 
 * *****************  Version 8  *****************
 * User: Janiner      Date: 5/10/:0    Time: 11:08
 * Updated in $/PBL D5
 * default ot today's date on add, and set focus to status
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 4/10/:0    Time: 13:25
 * Updated in $/PBL D5
 * Allow '' in date selection until checked in check routine
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 3/10/:0    Time: 11:38
 * Updated in $/PBL D5
 * Add routine to allow input of dates, as well as using the look-up
 * facility.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 15/09/:0   Time: 17:05
 * Updated in $/PBL D5
 * Correct problem with Access version where you could not add a History
 * record.
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 23/03/:0   Time: 16:36
 * Updated in $/PBL D5
 * Solve problem with date being set 2 days hence.  Date was being stored
 * as float and not datetime. (in updsql)
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 8/02/:0    Time: 15:56
 * Updated in $/PBL D5
 * New insert method to ensure unique keys on adding.  Locking convention
 * for the Company record to ensure no double updates on Last_PO_Number,
 * Last_Enquiry_Number and Last_Invoice_No fields.  
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 15:41
 * Updated in $/PBL D5
 * New method to ensure new keys are unique in multi-user environment.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
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

uses DateSelV5, PBLUProofHistN, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBMaintProofHistNFrm.FormActivate(Sender: TObject);
begin
  {Re-activate the lookup SQLs}
  GetStatSQL.Active := False;
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
