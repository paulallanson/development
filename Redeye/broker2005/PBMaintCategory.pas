unit PBMaintCategory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, Mask, PBDBMemo,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCategoryFrm = class(TForm)
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    Label5: TLabel;
    DescrEdit: TEdit;
    NotesBitBtn: TBitBtn;
    FlashTimer: TTimer;
    qryZero: TFDQuery;
    UpdNotesOnlySQL: TFDQuery;
    chkbxInvoice: TCheckBox;
    chkbxHold: TCheckBox;
    chkbxInvoiceNumber: TCheckBox;
    qryAddCompPT: TFDQuery;
    qryUpdCompPT: TFDQuery;
    MemoCommRt: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    btnPayment: TBitBtn;
    FlashTimerPay: TTimer;
    chkbxActive: TCheckBox;
    Label4: TLabel;
    edtAnalysis: TEdit;
    chkbxMultiCatInvoices: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure ShortDescrEditChange(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure btnPaymentClick(Sender: TObject);
    procedure FlashTimerPayTimer(Sender: TObject);
    procedure chkbxInvoiceNumberClick(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    bPayNotesFlash: ByteBool;
    PBPayNotesFrm: TPBDBMemoFrm;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DoDelete;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  PBMaintCategoryFrm: TPBMaintCategoryFrm;

implementation

uses PBLUCategory, PBImages, PBNarrativeDM, ComObj, ActiveX,
  PBDatabase, pbMainMenu;

{$R *.DFM}
const
  Space20 = '                    ';

procedure TPBMaintCategoryFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;

  PBPayNotesFrm := TPBDBMemoFrm.Create(Self);
  PBPayNotesFrm.bAllow_Upd := True;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new category';
  if sFuncMode = 'C' then
    Caption := 'Change a category';
  if sFuncMode = 'D' then
    Caption := 'Delete a category';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    edtAnalysis.Text := '';
    memoCommRt.Text := '0.00';
    ChkBxInvoice.Checked := false;
    ChkBxInvoiceNumber.Checked := false;
    ChkBxMultiCatInvoices.Checked := false;
    ChkBxHold.Checked := false;
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUCategoryFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Category').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      edtAnalysis.Text := FieldByName('Analysis_Code').AsString;
      memoCommRT.Text := formatfloat('0.00',FieldByName('Commission_Rate').Asfloat);
      ChkBxInvoice.checked := (fieldByName('Invoice_Immediately').AsString = 'Y');
      ChkBxInvoiceNumber.checked := (fieldByName('Use_Separate_Invoice_Seq').AsString = 'Y');
      ChkBxMultiCatInvoices.checked := (fieldByName('Multiple_Category_Invoices').AsString = 'Y');
      ChkBxHold.checked := (fieldByName('Cleared_Funds_Required').AsString = 'Y');
      PBDBMemoFrm.LoadMemoData(FieldByName('inv_Narrative').AsInteger);
      PBPayNotesFrm.LoadMemoData(FieldByName('Payment_Narrative').AsInteger);
//      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;

  {Determine if Multi Category Invoice checkbox is enabled}
  chkbxInvoiceNumberClick(ChkBxInvoiceNumber);
  
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuCategories',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintCategoryFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and (memoCommRt.Text <> '');
end;

procedure TPBMaintCategoryFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintCategoryFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCategoryFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    PBDBMemoFrm.UpdMemoData(Self);
    PBPayNotesFrm.UpdMemoData(Self);
    if sFuncMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with UpdSQL do
    begin
      Close;
      ParamByName('Category').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      Parambyname('Analysis_Code').asstring := trim(edtAnalysis.text) ;
      ParamByName('Commission_Rate').Asfloat := StrToFloatDef(memoCommRt.text, 0, FormatSettings);
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Inv_Narrative').Clear
      else
        ParamByName('Inv_Narrative').AsInteger := PBDBMemoFrm.iNarr;

      if PBPayNotesFrm.iNarr = 0 then
        ParamByName('Payment_Narrative').Clear
      else
        ParamByName('Payment_Narrative').AsInteger := PBPayNotesFrm.iNarr;

      if ChkBxInvoice.checked then
        ParamByName('Invoice_immediately').AsString := 'Y'
      else
        ParamByName('Invoice_immediately').AsString := 'N';

      if ChkBxInvoiceNumber.checked then
        ParamByName('Use_Separate_Invoice_Seq').AsString := 'Y'
      else
        ParamByName('Use_Separate_Invoice_Seq').AsString := 'N';

      if ChkBxMultiCatInvoices.checked then
        ParamByName('Multiple_Category_Invoices').AsString := 'Y'
      else
        ParamByName('Multiple_Category_Invoices').AsString := 'N';

      if ChkBxHold.checked then
        ParamByName('Cleared_Funds_Required').AsString := 'Y'
      else
        ParamByName('Cleared_Funds_Required').AsString := 'N';

(*      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';
*)      ExecSQL;
    end;

    if ChkBxInvoiceNumber.checked then
      begin
        try
          qryAddCompPT.close;
          qryAddCompPT.parambyname('Company').asinteger := 1;
          qryAddCompPT.parambyname('Category').asinteger := iCode;
          qryAddCompPT.parambyname('Last_Invoice_no').asinteger := 0;
          qryAddCompPT.parambyname('Inactive').asstring := 'N';
          qryAddCompPT.execsql;
        except
          qryUpdCompPT.close;
          qryUpdCompPT.parambyname('Company').asinteger := 1;
          qryUpdCompPT.parambyname('Category').asinteger := iCode;
          qryUpdCompPT.parambyname('Inactive').asstring := 'N';
          qryUpdCompPT.execsql;
        end;
      end
    else
      begin
        try
          qryUpdCompPT.close;
          qryUpdCompPT.parambyname('Company').asinteger := 1;
          qryUpdCompPT.parambyname('Category').asinteger := iCode;
          qryUpdCompPT.parambyname('Inactive').asstring := 'Y';
          qryUpdCompPT.execsql;
        except
        end;
      end;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;

  {If replicating Category details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(6, iCode, 0, 0, sFuncMode);
    end;
end;

procedure TPBMaintCategoryFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBMemoFrm.Free;
  PBPayNotesFrm.Free;
end;

procedure TPBMaintCategoryFrm.NotesBitBtnClick(Sender: TObject);
begin
  PBDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBDBMemoFrm.ShowModal;
  CheckNotes(Self);
  If (dmBroker.iAccCtrl = 2) and (PBDBMemoFrm.bMemoUpd) then
        begin
        PBDBMemoFrm.UpdMemoData(Self) ;
        With UpdNotesOnlySQL do
                begin
                Close ;
                ParamByName('Category').AsInteger := iCode;
                if PBDBMemoFrm.iNarr = 0 then
                        ParamByName('Inv_Narrative').Clear
                else
                        ParamByName('Inv_Narrative').AsInteger := PBDBMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintCategoryFrm.ShortDescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintCategoryFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintCategoryFrm.CheckNotes(Sender: TObject);
begin
  if PBDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;


  if PBPayNotesFrm.CheckNotes(Self) then
  begin
    FlashTimerPay.Enabled := True;
    btnPayment.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimerPay.Enabled := False;
    btnPayment.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintCategoryFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Category ' +
            '(Category,Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintCategoryFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Category Where Category=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintCategoryFrm.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
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
      Result := FieldByName('Category').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintCategoryFrm.DoDelete;
begin
  with DelSQL do
  begin
    PBDBMemoFrm.DelMemoData(Self);  { Delete the narrative if any }
    PBPayNotesFrm.DelMemoData(Self);  { Delete the narrative if any }
    SQL.Clear;
    SQL.Add('Delete From Category ' +
            'Where Category=' + IntToStr(iCode));
    ExecSQL;
  end;
end;

procedure TPBMaintCategoryFrm.btnPaymentClick(Sender: TObject);
begin
  PBPayNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  PBPayNotesFrm.ShowModal;
  CheckNotes(Self);
  if (dmBroker.iAccCtrl = 2) and (PBPayNotesFrm.bMemoUpd) then
    begin
      PBPayNotesFrm.UpdMemoData(Self) ;
        With UpdNotesOnlySQL do
          begin
            Close ;
            ParamByName('Category').AsInteger := iCode;
            if PBPayNotesFrm.iNarr = 0 then
              ParamByName('Payment_Narrative').Clear
            else
              ParamByName('Payment_Narrative').AsInteger := PBPayNotesFrm.iNarr;
            ExecSQL ;
          end;
      MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
      Close ;
      ModalResult := mrOK ;
    end;
end;

procedure TPBMaintCategoryFrm.FlashTimerPayTimer(Sender: TObject);
begin
  if bPayNotesFlash then
    btnPayment.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnPayment.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bPayNotesFlash := (not (bPayNotesFlash));
end;

procedure TPBMaintCategoryFrm.chkbxInvoiceNumberClick(Sender: TObject);
begin
  chkbxMultiCatInvoices.Enabled := (sender as TCheckbox).Checked;
  if not (sender as TCheckbox).Checked then
    chkbxMultiCatInvoices.checked := false;
end;

end.
