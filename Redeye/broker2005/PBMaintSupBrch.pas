(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Branches form.

VSS Info:
$Header: /PBL D5/PBMaintSupBrch.pas 14    20/06/03 9:53 Andrewh $
$History: PBMaintSupBrch.pas $
 * 
*******************************************************************************)
unit PBMaintSupBrch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintSupBrchFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    FlashTimer: TTimer;
    GetCompSQL: TFDQuery;
    CheckSuppAccExistsSQL: TFDQuery;
    CheckCustAccExistsSQL: TFDQuery;
    UpdNotesOnlySQL: TFDQuery;
    pgcntrlSupplier: TPageControl;
    tbshtDetails: TTabSheet;
    tbshtProductTypes: TTabSheet;
    DetsGrpBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SuppNameEdit: TEdit;
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
    AccCodeEdit: TEdit;
    PrintBitBtn: TBitBtn;
    qryGetBranch: TFDQuery;
    Label4: TLabel;
    chkbxActive: TCheckBox;
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
    procedure AccCodeEditChange(Sender: TObject);
    procedure AccCodeEditEnter(Sender: TObject);
    procedure AccCodeEditExit(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
  private
    SOldValue: string;
    bNotesFlash: ByteBool;
    SupCapGB: TGroupBox ;
  public
    sFuncMode: string[1];
    iCode, iSupp: Integer;
    sSuppName: string;
  end;

var
  PBMaintSupBrchFrm: TPBMaintSupBrchFrm;

implementation

uses PBDBMemo, PBMaintSuppCap, pbDatabase, pbMainMenu, PBImages, CCSPrint;

{$R *.DFM}

procedure TPBMaintSupBrchFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  {Create the Supplier Capabilities Form} ;
  PBMaintSuppCapFrm := TPBMaintSuppCapFrm.Create(Self) ;
  {Load the details even if we're deleting so the delete routine will work} ;
  If sFuncMode <> 'A' then
        begin
        PBMaintSuppCapFrm.iSupp := iSupp ;
        PBMaintSuppCapFrm.iBranch := icode ;
        end
  else
        begin
        PBMaintSuppCapFrm.iSupp := 0 ;
        PBMaintSuppCapFrm.iBranch := 0 ;
        end;
  {Put the panel onto this form, returns the group box pointer} ;
  SupCapGB := PBMaintSuppCapFrm.InitailiseGroupBox(tbshtProductTypes) ;
  PBDBMemoFrm.bAllow_Upd := True;
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
    AccCodeEdit.Text := '';
  end
  else
  begin
    with qryGetBranch do
    begin
      close;
      parambyname('Supplier').asinteger := iSupp;
      parambyname('Branch_no').asinteger := iCode;
      open;
      SuppNameEdit.text := fieldbyname('Supplier_Name').asstring;
      NameEdit.Text := FieldByName('Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PhoneEdit.Text := FieldByName('Phone').AsString;
      FaxEdit.Text := FieldByName('Fax_Number').AsString;
      EMailEdit.Text := FieldByName('EMail').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      AccCodeEdit.Text := FieldByName('Account_Code').AsString;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
    end;
  end;
  SuppNameEdit.Text := sSuppName;
  {Enable or disable the buttons};
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  PrintBitBtn.Visible := (sFuncMode= 'C');
  CheckNotes(Self);
  CheckOK(Self);
//  dmBroker.ScreenAccessControl(Self,'',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintSupBrchFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button};
  OKBitBtn.Enabled := (SuppNameEdit.Text <> '') and
    (NameEdit.Text <> '') and
    (PhoneEdit.Text <> '');
end;

procedure TPBMaintSupBrchFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintSupBrchFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSupBrchFrm.OKBitBtnClick(Sender: TObject);
var
  iTempNewCode: Integer;
begin
  if sFuncMode = 'A' then
  begin
    {Add a new code};
    {Add the branch narrative};
    PBDBMemoFrm.UpdMemoData(Self);
    {Get Next code};
    with GetLastSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      Open;
      First;
      iTempNewCode := FieldByName('Last_Code').AsInteger + 1;
      Close;
    end;
    with AddSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
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
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      ExecSQL;
    end;
    iCode := iTempNewCode;
  end;
  if sFuncMode = 'C' then
  begin
    {Update the branch narrative};
    PBDBMemoFrm.UpdMemoData(Self);
    {Update an existing code};
    with UpdSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Account_Code').AsString := AccCodeEdit.Text + '';
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
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';
      ExecSQL;
    end;
  {Update the supplier capabilities} ;
  {Note that the flag is false to say don't delete them} ;
  PBMaintSuppCapFrm.UpdateSuppCaps(iSupp,iCode,False) ;
  end;
  if sFuncMode = 'D' then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) <> mrYes then
    begin
      Close;
      Exit;
    end;
    {Note that the flag is TRUE to say delete them} ;
    PBMaintSuppCapFrm.UpdateSuppCaps(iCode,0,True) ;
    with DelSQL do
    begin
      Close;
      ParamByName('Supplier').AsInteger := iSupp;
      ParamByName('Branch_No').AsInteger := iCode;
      ExecSQL;
    end;
    {Delet the branch narrative};
    PBDBMemoFrm.DelMemoData(Self);
  end;

  {If replicating Supplier details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(3, iSupp, iCode, 0, sFuncMode);
    end;
end;

procedure TPBMaintSupBrchFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSupBrchFrm.NotesBitBtnClick(Sender: TObject);
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
                ParamByName('Supplier').AsInteger := iSupp;
                ParamByName('Branch_No').AsInteger := iCode;
                if PBDBMemoFrm.iNarr = 0 then
                        ParamByName('Narrative').Clear
                else
                        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
                ExecSQL ;
                end;
        MessageDlg('Notes have been updated',mtInformation,[mbOK],0) ;
        Close ;
        ModalResult := mrOK ;
        end;
end;

procedure TPBMaintSupBrchFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Clear the treeview} ;
  PBMaintSuppCapFrm.ClearTreeView(self) ;
  PBMaintSuppCapFrm.DeleteIntSel(Self) ;
  PBMaintSuppCapFrm.Free ;
  PBDBMemoFrm.Free;
end;

procedure TPBMaintSupBrchFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintSupBrchFrm.CheckNotes(Sender: TObject);
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
end;

procedure TPBMaintSupBrchFrm.AccCodeEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintSupBrchFrm.AccCodeEditEnter(Sender: TObject);
begin
  sOldValue := AccCodeEdit.Text;
end;

procedure TPBMaintSupBrchFrm.AccCodeEditExit(Sender: TObject);
begin
  if Trim(AccCodeEdit.Text) = '' then Exit;
  {Validate that the account code is unique};
  with GetCompSQL do
  begin
    Close;
    Open;
    First;
    if FieldByName('Acc_Code_Supp_Unique').AsString <> 'Y' then
      Exit;
  end;
  with CheckSuppAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
    ParamByName('Supplier').AsInteger := iSupp;
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
(*  with CheckCustAccExistsSQL do
  begin
    Close;
    ParamByName('Acc_Code').AsString := AccCodeEdit.Text;
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
*)
  CheckOK(Self);
end;

procedure TPBMaintSupBrchFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
    PrinterSettings := TPrinterSettings.Create;
    if SetUpPrinter(PrinterSettings) then
        PBMaintSupBrchFrm.print;
      PrinterSettings.Free;
end;

end.
