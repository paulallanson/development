(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Branch Details.

VSS Info:
$Header: /CCSCommon/CSMaintBranch.pas 1     10/01/:1 13:00 Paul $
$History: CSMaintBranch.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:00
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 4/09/:0    Time: 17:22
 * Updated in $/PBL D5
 * Changed so that spaces are not added to the text fields, specifically
 * when maintaining the Access database.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 31/07/:0   Time: 10:56
 * Updated in $/PBL D5
 * Fixed bug whereby the Customer Status was not being updated
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 16/03/:0   Time: 12:32
 * Updated in $/PBL D5
 * Added two new status's:
 * 
 * I - Sales Invoice Pending
 * O - Purchase Invoice Pending
 * 
 * These are loaded into the ProspectComboBox
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 14/03/:0   Time: 17:33
 * Updated in $/PBL D5
 * Changed to display the new Account Code on Ledger status.
 * U = Pending Update
 * I = Invoice Pending
 * O = Purchase Order update pending
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintBranch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCSMaintBranchFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CustNameEdit: TEdit;
    NotesBitBtn: TBitBtn;
    NameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    EMailEdit: TEdit;
    PostCodeEdit: TEdit;
    GetCustNameSQL: TFDQuery;
    GetBranchNameSQL: TFDQuery;
    FlashTimer: TTimer;
    Label11: TLabel;
    AccCodeEdit: TEdit;
    InvToGrpBox: TGroupBox;
    InvToCustLabel: TLabel;
    InvToBranchLabel: TLabel;
    InvCustBtn: TButton;
    InvToBranch: TButton;
    CheckCustAccExistsSQL: TFDQuery;
    GetCompSQL: TFDQuery;
    CheckSuppAccExistsSQL: TFDQuery;
    Label4: TLabel;
    ProspectComboBox: TComboBox;
    DelivNotesBitBtn: TBitBtn;
    FlashDelivTimer: TTimer;
    edtShortCode: TEdit;
    lblShortCode: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure InvCustBtnClick(Sender: TObject);
    procedure InvToBranchClick(Sender: TObject);
    procedure ShowCustName(Sender: TObject);
    procedure ShowBranchName(Sender: TObject);
    procedure AccCodeEditEnter(Sender: TObject);
    procedure AccCodeEditExit(Sender: TObject);
    procedure DelivNotesBitBtnClick(Sender: TObject);
    procedure FlashDelivTimerTimer(Sender: TObject);
  private
    sOldValue: string;
    iInvToCust, iInvToBranch: Integer;
    bNotesFlash, bDelivNotesFlash: ByteBool;
  public
    sFuncMode: string[1];
    iCode, iCust: Integer;
    sCustName: string;
  end;

var
  CSMaintBranchFrm: TCSMaintBranchFrm;

implementation

uses CSLUCust, CSLUBranch, CSDBMemo, CSImages, CSDelivNotes;

var
  InvToCustFrm: TCSLUCustFrm;
  InvToBranchFrm: TCSLUBranchFrm;

{$R *.DFM}

procedure TCSMaintBranchFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  CSDBMemoFrm := TCSDBMemoFrm.Create(Self);
  CSDBMemoFrm.bAllow_Upd := True;
  {Create the delivery notes form}
  CSDelivNotesFrm := TCSDelivNotesFrm.Create(Self);
  CSDelivNotesFrm.bAllow_Upd := True;
  {Setup titles};
  if sFuncMode = 'A' then
    Caption := 'Add a new branch';
  if sFuncMode = 'C' then
    Caption := 'Change a branch';
  if sFuncMode = 'D' then
    Caption := 'Delete a branch';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
    PhoneEdit.Text := '';
    FaxEdit.Text := '';
    EMailEdit.Text := '';
    iInvToCust := iCust;
    iInvToBranch := 0;
    AccCodeEdit.Text := '';
    self.edtShortCode.Text := '';
    {Initially setup as a prospect}
    with ProspectComboBox do
    begin
      itemindex := 0;
      Enabled := True;
    end;
  end
  else
  begin
    with CSLUBranchFrm.DetsSRC.DataSet do
    begin
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      EMailEdit.Text := FieldByName('EMail').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      CSDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      CSDelivNotesFrm.LoadMemoData(FieldByName('Delivery_Narrative').AsInteger);
      iInvToCust := FieldByName('Inv_To_Customer').AsInteger;
      iInvToBranch := FieldByName('Inv_To_Branch').AsInteger;
      AccCodeEdit.Text := FieldByName('Account_Code').AsString;
      self.edtShortCode.Text := FieldByName('short_code').asString;

      {Initially set the combo Box to 'Prospect'}
      with ProspectComboBox do
      begin
        itemindex := 0;
        Enabled := True;
        {Change to Actual Customer if Account is on Ledger}
        if FieldByName('Account_Code_on_Ledger').AsString = 'Y' then
        begin
          Items.Add('Account on Ledger');
          itemindex := 2;
          Enabled := False;
        end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'P' then
          begin
            itemindex := 1;
            Enabled := True;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'U' then
          begin
          Items.Add('Ledger Update Pending');
          itemindex := 2;
          Enabled := False;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'I' then
          begin
          Items.Add('Sales Invoice Pending');
          itemindex := 2;
          Enabled := False;
          end
        else
          if FieldByName('Account_Code_on_Ledger').AsString = 'O' then
          begin
          Items.Add('Purchase Invoice Pending');
          itemindex := 2;
          Enabled := False;
          end;
      end;
    end;
  end;
  CustNameEdit.Text := sCustName;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  {Show the invoice to details};
  ShowCustName(Self);
  ShowBranchName(Self);
  CheckNotes(Self);
  CheckOK(Self);
end;

procedure TCSMaintBranchFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (CustNameEdit.Text <> '') and
    (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '');
end;

procedure TCSMaintBranchFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TCSMaintBranchFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintBranchFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  if sFuncMode = 'A' then
  begin
    {Add a new code};
    {Add the branch narrative};
    CSDBMemoFrm.UpdMemoData(Self);
    CSDelivNotesFrm.UpdMemoData(Self);
    {Get Next code};
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
      ParamByName('Branch_No').AsInteger := iTempNewCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      if CSDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := CSDelivNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      {Update Account code on Ledger}
      case self.ProspectComboBox.ItemIndex of
        0: ParamByName('Account_Code_on_ledger').AsString := 'N';
        1: ParamByName('Account_Code_on_ledger').AsString := 'P';
        2: ParamByName('Account_Code_on_ledger').AsString := 'U';
        3: ParamByName('Account_Code_on_ledger').AsString := 'I';
        4: ParamByName('Account_Code_on_ledger').AsString := 'O';
      else
        ParamByName('Account_Code_on_ledger').AsString := 'Y';
      end;

      if self.edtShortCode.Text <> '' then
        ParamByName('short_code').asString := self.edtShortCode.text
      else
        ParamByName('short_code').clear;

      ExecSQL;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    {Update the branch narrative};
    CSDBMemoFrm.UpdMemoData(Self);
    {Update the delivery narrative};
    CSDelivNotesFrm.UpdMemoData(Self);
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iCode;
      ParamByName('Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('Phone').AsString := PhoneEdit.Text + '';
      ParamByName('Fax_Number').AsString := FaxEdit.Text + '';
      ParamByName('EMail').AsString := EMailEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      if CSDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := CSDBMemoFrm.iNarr;
      if CSDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := CSDelivNotesFrm.iNarr;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
      if iInvToCust = 0 then
        ParamByName('Inv_To_Customer').Clear
      else
        ParamByName('Inv_To_Customer').AsInteger := iInvToCust;
      if (iInvToBranch = 0) and (iInvToCust = 0) then
        ParamByName('Inv_To_Branch').Clear
      else
        ParamByName('Inv_To_Branch').AsInteger := iInvToBranch;

      {Update Account code on Ledger}
      case self.ProspectComboBox.ItemIndex of
        0: ParamByName('Account_Code_on_ledger').AsString := 'N';
        1: ParamByName('Account_Code_on_ledger').AsString := 'P';
        2: ParamByName('Account_Code_on_ledger').AsString := 'U';
        3: ParamByName('Account_Code_on_ledger').AsString := 'I';
        4: ParamByName('Account_Code_on_ledger').AsString := 'O';
      else
        ParamByName('Account_Code_on_ledger').AsString := 'Y';
      end;

      if self.edtShortCode.Text <> '' then
        ParamByName('short_code').asString := self.edtShortCode.text
      else
        ParamByName('short_code').clear;
      ExecSQL;
    end;
  end;
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    with DelSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iCust;
      ParamByName('Branch_No').AsInteger := iCode;
      ExecSQL;
    end;
    {Delet the branch narrative};
    CSDBMemoFrm.DelMemoData(Self);
    CSDelivNotesFrm.DelMemoData(Self);
  end;
end;

procedure TCSMaintBranchFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TCSMaintBranchFrm.NotesBitBtnClick(Sender: TObject);
begin
  CSDBMemoFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDBMemoFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintBranchFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CSDBMemoFrm.Free;
  CSDelivNotesFrm.Free;
end;

procedure TCSMaintBranchFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TCSMaintBranchFrm.CheckNotes(Sender: TObject);
begin
  if CSDBMemoFrm.CheckNotes(Self) then
  begin
    FlashTimer.Enabled := True;
    NotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    NotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
  if CSDelivNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TCSMaintBranchFrm.InvCustBtnClick(Sender: TObject);
var
  iTempInvToCust: Integer;
begin
  iTempInvToCust := iInvToCust;
  {Activate the customer lookup screen};
  InvToCustFrm := TCSLUCustFrm.Create(Self);
  try
    InvToCustFrm.iThisCode := iCode;
    if iInvToCust <> 0 then
      InvToCustFrm.SelCode := iInvToCust
    else
      InvToCustFrm.SelCode := iCode;
    InvToCustFrm.bIs_Lookup := True;
    InvToCustFrm.bAllow_upd := False;
    InvToCustFrm.ShowModal;
    if InvToCustFrm.ModalResult = mrOK then
    begin
      if (InvToCustFrm.SelCode <> iCode) then
        iInvToCust := InvToCustFrm.SelCode;
      {		else
            iInvToCust := 0 ;
       } ShowCustName(Self);
      if iTempInvToCust <> iInvToCust then
      begin
        iInvToBranch := 0;
        ShowBranchName(Self);
      end;
    end;
  finally
    InvToCustFrm.Free;
  end;
end;

procedure TCSMaintBranchFrm.InvToBranchClick(Sender: TObject);
begin
  {Activate the branch lookup screen};
  InvToBranchFrm := TCSLUBranchFrm.Create(Self);
  try
    if iInvToCust <> 0 then
      InvToBranchFrm.iCust := iInvToCust
    else
      InvToBranchFrm.iCust := iCode;
    InvToBranchFrm.sCustName := InvToCustLabel.Caption;
    InvToBranchFrm.SelCode := iInvToBranch;
    InvToBranchFrm.bIs_Lookup := True;
    InvToBranchFrm.bAllow_upd := False;
    InvToBranchFrm.ShowModal;
    iInvToBranch := InvToBranchFrm.SelCode;
  finally
    InvToBranchFrm.Free;
  end;
  ShowBranchName(Self);
  CheckOK(Self);
end;

procedure TCSMaintBranchFrm.ShowCustName(Sender: TObject);
begin
  if (iInvToCust = 0) then
  begin
    InvToCustLabel.Caption := 'This Customer';
  end
  else
  begin
    with GetCustNameSQL do
    begin
      Close;
      ParamByName('Customer').AsInteger := iInvToCust;
      Open;
      First;
      InvToCustLabel.Caption := FieldByName('Name').AsString;
    end;
  end;
end;

procedure TCSMaintBranchFrm.ShowBranchName(Sender: TObject);
begin
  if (iInvToBranch = 0) then
  begin
    InvToBranchLabel.Caption := 'Head Office';
  end
  else
  begin
    with GetBranchNameSQL do
    begin
      Close;
      ParamByName('Branch_No').AsInteger := iInvToBranch;
      if iInvToCust <> 0 then
        ParamByName('Customer').AsInteger := iInvToCust
      else
        ParamByName('Customer').AsInteger := iCode;
      Open;
      First;
      InvToBranchLabel.Caption := FieldByName('Name').AsString;
    end;
  end;
  CheckOK(Self);
end;

procedure TCSMaintBranchFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
end;

procedure TCSMaintBranchFrm.AccCodeEditExit(Sender: TObject);
begin
  {Don't check if blank}
  if Trim(AccCodeEdit.Text) = '' then Exit;
  {Validate that the account code is unique};
  with GetCompSQL do
  begin
    Close;
    Open;
    First;
    if FieldByName('Acc_Code_Cust_Unique').AsString <> 'Y' then
      Exit;
  end;
  with CheckCustAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    ParamByName('Customer').AsInteger := iCust;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on customer: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
  with CheckSuppAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    Open;
    First;
    if (not EOF) then
    begin
      MessageDlg('The account code: ' + AccCodeEdit.Text +
        ' is already in use on supplier: ' +
        FieldByName('Name').AsString, mtError, [mbOK], 0);
      AccCodeEdit.Text := sOldValue;
      AccCodeEdit.SetFocus;
    end;
  end;
end;

procedure TCSMaintBranchFrm.DelivNotesBitBtnClick(Sender: TObject);
begin
  CSDelivNotesFrm.bAllow_Upd := (sFuncMode <> 'D');
  CSDelivNotesFrm.ShowModal;
  CheckNotes(Self);
end;

procedure TCSMaintBranchFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := CSImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := CSImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

end.
