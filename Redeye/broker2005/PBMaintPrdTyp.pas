unit PBMaintPrdTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls, Mask, Spin, ComCtrls;

type
  TPBMaintPrdTypFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetCatsSQL: TQuery;
    CatsSRC: TDataSource;
    GetLastSQL: TQuery;
    AddSQL: TQuery;
    UpdSQL: TQuery;
    DelSQL: TQuery;
    DelLabel: TLabel;
    FlashTimer: TTimer;
    qryZero: TQuery;
    UpdNotesOnlySQL: TQuery;
    qryInsDefCap: TQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DetsGrpBox: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    CatDBLUCB: TDBLookupComboBox;
    NotesBitBtn: TBitBtn;
    ShortDescrEdit: TEdit;
    ProdTypeMaintBitBtn: TBitBtn;
    chkbxActive: TCheckBox;
    NomAccEdit: TMaskEdit;
    PurchNomAccEdt: TMaskEdit;
    spnSuppliers: TSpinEdit;
    lstbxMembers: TListBox;
    Label8: TLabel;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    lstbxNonMembersCodes: TListBox;
    lstbxMembersCodes: TListBox;
    Label1: TLabel;
    DescrEdit: TEdit;
    Label9: TLabel;
    qryMembers: TQuery;
    qryPriceUnit: TQuery;
    dtsPriceUnit: TDataSource;
    qryDummy: TQuery;
    qryDelete: TQuery;
    qryAdd: TQuery;
    Label10: TLabel;
    cmbDefaults: TComboBox;
    lblFSCProductType: TLabel;
    edtFSCProductType: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure CatDBLUCBClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesBitBtnClick(Sender: TObject);
    procedure ShortDescrEditChange(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure ProdTypeMaintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
    procedure edtFSCProductTypeKeyPress(Sender: TObject; var Key: Char);
  private
    bNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function  GetNextKey : integer;
    procedure DoDelete;
    procedure DeleteFromDB;
    procedure SavePriceUnits;
    procedure RefreshData;
    procedure RefreshNonMemberData;
    procedure RefreshDefaultList;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  PBMaintPrdTypFrm: TPBMaintPrdTypFrm;

implementation

uses PBDBMemo, PBLUPrdTyp, PBImages, PBNarrativeDM, ComObj, ActiveX,
  PBMaintGroups, PBDatabase, pbMainMenu;

{$R *.DFM}
const
  Space20 = '                    ';

procedure TPBMaintPrdTypFrm.FormActivate(Sender: TObject);
begin
  {Create the memo form}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;
  {Re-activate the lookup SQLs}
  GetCatsSQL.Active := False;
  GetCatsSQL.Active := True;
  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new product type';
  if sFuncMode = 'C' then
    Caption := 'Change a product type';
  if sFuncMode = 'D' then
    Caption := 'Delete a product type';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    DescrEdit.Text := '';
    ShortDescrEdit.Text := '';
    CatDBLUCB.KeyValue := 0;
    NomAccEdit.Text := '';
    PurchNomAccEdt.Text := '';
    edtFSCProductType.text := '';
    spnSuppliers.Value := 0;
    ChkBxActive.Checked := True;
  end
  else
  begin
    with PBLUPrdTypFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Product_Type').AsInteger;
      DescrEdit.Text := FieldByName('Description').AsString;
      CatDBLUCB.KeyValue := FieldByName('Category').AsInteger;
      ShortDescrEdit.Text := FieldByName('Short_Desc').AsString;
      NomAccEdit.Text := trim(FieldByName('Nominal').AsString) + copy(Space20,1,(dmBroker.GetNominalAccountLength-length(trim(FieldByName('Nominal').AsString))));
      PurchNomAccEdt.Text := trim(FieldByName('Purchase_Nominal').AsString) + copy(Space20,1,(dmBroker.GetNominalAccountLength-length(trim(FieldByName('Purchase_Nominal').AsString))));
      spnSuppliers.Value := FieldByName('Enquiry_Min_Suppliers').Asinteger;
      PBDBMemoFrm.LoadMemoData(FieldByName('Narrative').AsInteger);
      edtFSCProductType.text := FieldByName('FSC_Product_Type_Code').Asstring;
      ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
      cmbDefaults.Text := FieldByName('Default_Price_unit').Asstring;
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  CheckNotes(Self);
  {Load the price unit data}

  RefreshData;
  RefreshNonMemberData;
  RefreshDefaultList;

  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProductTypes',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintPrdTypFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (DescrEdit.Text <> '') and
    (CatDBLUCB.KeyValue <> 0);
end;

procedure TPBMaintPrdTypFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintPrdTypFrm.CatDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPrdTypFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPrdTypFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    PBDBMemoFrm.UpdMemoData(Self);
    if sFuncMode = 'A' then
    begin
      iCode := GetNextKey;
      //insert default capability
      with qryInsDefCap do
      begin
        ParamByName('Product_Type').asInteger := iCode;
        ParamByName('Description').AsString := DescrEdit.Text + '';
        ExecSQL;
      end;
    end;

    with UpdSQL do
    begin
      Close;
      ParamByName('Product_Type').AsInteger := iCode;
      ParamByName('Description').AsString := DescrEdit.Text + '';
      ParamByName('Short_Desc').AsString := copy(ShortDescrEdit.Text,1,15) + '';
      ParamByName('Nominal').AsString := trim(NomAccEdit.Text) + '';
      ParamByName('Purch_Nominal').AsString := trim(PurchNomAccEdt.Text) + '';
      ParamByName('Enquiry_Min_Suppliers').AsInteger := spnSuppliers.value;
      ParamByName('Category').AsString := CatDBLUCB.KeyValue;
      ParamByName('FSC_Product_Type_Code').asstring := edtFSCProductType.text;
      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;

      if ChkBxActive.checked then
        ParamByName('InActive').AsString := 'N'
      else
        ParamByName('InActive').AsString := 'Y';

      if cmbDefaults.ItemIndex = -1 then
        Parambyname('Default_Price_Unit').clear
      else
        begin
          if lstbxmembers.Count > 0 then
            Parambyname('Default_Price_Unit').asinteger := strtoint(lstbxMembersCodes.Items[cmbDefaults.itemindex])
          else
            Parambyname('Default_Price_Unit').asinteger := strtoint(lstbxNonMembersCodes.Items[cmbDefaults.itemindex]);
        end;

      ExecSQL;
    end;
    SavePriceUnits;
  end
  else
  if sFuncMode = 'D' then
  begin
    DetsGrpBox.Refresh;
    if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo,
      mbYes], 0) = mrYes then
      DoDelete;
  end;

  {If replicating Product Type details then save details to Replicate_Entity table}
  if dmBroker.GetReplicateDBAlias <> '' then
    begin
      dmBroker.AddReplicateEntity(7, iCode, 0, 0, sFuncMode);
    end;
end;

procedure TPBMaintPrdTypFrm.SavePriceUnits;
var
  i: integer;
begin
  DeleteFromDB;

  for i := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAdd do
      begin
        close;
        parambyname('Product_Type').asinteger := iCode;
        parambyname('Price_Unit').asinteger := strtoint(lstbxMembersCodes.items[i]);
        parambyname('Inactive').asstring := 'N';
        execsql;
      end;
    end;
end;

procedure TPBMaintPrdTypFrm.DeleteFromDB;
var
  i: integer;
begin
  with qryDelete do
    begin
      close;
      parambyname('Product_Type').asinteger := iCode;
      execsql;
    end;
end;

procedure TPBMaintPrdTypFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBMemoFrm.Free;
end;

procedure TPBMaintPrdTypFrm.NotesBitBtnClick(Sender: TObject);
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
                ParamByName('Product_Type').AsInteger := iCode;
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

procedure TPBMaintPrdTypFrm.ShortDescrEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintPrdTypFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintPrdTypFrm.CheckNotes(Sender: TObject);
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

procedure TPBMaintPrdTypFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Product_Type ' +
            '(Product_Type,Description,Short_Desc,Nominal,Category) ' +
            'VALUES(0, ''Dummy'', '' '', '' '',' +
            IntToStr(CatDBLUCB.KeyValue) + ') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintPrdTypFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Product_Type Where Product_Type=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TPBMaintPrdTypFrm.GetNextKey: integer;
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
      ParamByname('Category').AsInteger := CatDBLUCB.KeyValue;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with GetLastSQL do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Product_Type').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintPrdTypFrm.DoDelete;
begin
  with DelSQL do
  begin
    SQL.Clear;
    SQL.Add('Delete From Product_TypeCapability ' +
            'Where Product_Type=' + IntToStr(iCode));
    ExecSQL;
    SQL.Clear;
    SQL.Add('Delete From Product_TypeQuestion ' +
            'Where Product_Type=' + IntToStr(iCode));
    ExecSQL;
    PBDBMemoFrm.DelMemoData(Self);  { Delete the narrative if any }
    SQL.Clear;
    SQL.Add('Delete From Product_TypePrice_Unit ' +
            'Where Product_Type=' + IntToStr(iCode));
    ExecSQL;
    SQL.Clear;
    SQL.Add('Delete From Product_Type ' +
            'Where Product_Type=' + IntToStr(iCode));
    ExecSQL;
  end;
end;

procedure TPBMaintPrdTypFrm.ProdTypeMaintBitBtnClick(Sender: TObject);
begin
  PBMaintGroupsFrm := TPBMaintGroupsFrm.Create(self) ;
  try
    PBMaintGroupsFrm.iGroupselect := 2;
    PBMaintGroupsFrm.ShowModal ;
  Finally;
    PBMaintGroupsFrm.Free ;
  end;
  GetCatsSQL.Active := False;
  GetCatsSQL.Active := True;
end;

procedure TPBMaintPrdTypFrm.FormCreate(Sender: TObject);
begin
  if dmBroker.GetAccountsPackage = 'SAGEMMS' then
    begin
      NomAccEdit.editMask := '!00009999/AAA/AAA;0;_';
      NomAccEdit.MaxLength := 16;

      PurchNomAccEdt.editMask := '!00009999/AAA/AAA;0;_';
      PurchNomAccEdt.MaxLength := 16;
    end
  else
    begin
      NomAccEdit.editMask := '';
      NomAccEdit.MaxLength := 8;

      PurchNomAccEdt.editMask := '';
      PurchNomAccEdt.MaxLength := 8;
    end;

  edtFSCProductType.Visible := dmBroker.UseFSCClaim;
  lblFSCProductType.Visible := edtFSCProductType.Visible;
end;

procedure TPBMaintPrdTypFrm.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Product_Type').asinteger := iCode;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Price_Unit_Description').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Price_Unit').asstring);
          next;
        end;
    end;
end;

procedure TPBMaintPrdTypFrm.RefreshDefaultList;
var
  icount: integer;
  stext: string;
begin
  stext := cmbDefaults.text;
  cmbDefaults.clear;
  if lstbxMembers.items.count > 0 then
    begin
      for icount := 0 to pred(lstbxMembers.items.count) do
        begin
          cmbDefaults.items.add(lstbxMembers.Items[icount]);
        end;
    end
  else
    begin
      for icount := 0 to pred(lstbxNonMembers.items.count) do
        begin
          cmbDefaults.items.add(lstbxNonMembers.Items[icount]);
        end;
    end;

  cmbDefaults.ItemIndex := cmbDefaults.Items.IndexOf(stext);
  if cmbDefaults.ItemIndex < 0 then
    cmbDefaults.ItemIndex := 0;
end;

procedure TPBMaintPrdTypFrm.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryPriceUnit do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add(' AND Price_Unit.Price_Unit NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');
(*      sql.add(' AND ');
      sql.add('Work_Centre_Group.Work_Centre_Group NOT IN (select Work_Centre_Group from Process_Work_Centre_Group ');
      sql.add('where Process <> ' + inttostr(ProcessCode) + ')');
*)
      sql.Add('ORDER BY Price_Unit_Description');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Price_Unit_Description').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Price_Unit').asstring);
          next;
        end;
    end;

end;

procedure TPBMaintPrdTypFrm.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonMembers.items.count) do
    begin
      if lstbxNonMembers.Selected[i] then
        begin
          lstbxMembers.Items.Add(lstbxNonMembers.items[i]);
          lstbxMembersCodes.Items.Add(lstbxNonMembersCodes.items[i]);
        end;
    end;
  RefreshNonMemberData;
  RefreshDefaultList;
end;

procedure TPBMaintPrdTypFrm.btnRemoveClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxMembers.items.count) downto 0 do
    begin
      if lstbxMembers.Selected[i] then
        begin
          lstbxMembers.Items.Delete(i);
          lstbxMembersCodes.Items.Delete(i);
        end;
    end;
  RefreshNonMemberData;
  RefreshDefaultList;
end;

procedure TPBMaintPrdTypFrm.lstbxMembersClick(Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TPBMaintPrdTypFrm.lstbxNonMembersClick(Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TPBMaintPrdTypFrm.lstbxNonMembersDblClick(Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TPBMaintPrdTypFrm.lstbxMembersDblClick(Sender: TObject);
begin
  btnRemoveClick(self);
end;

procedure TPBMaintPrdTypFrm.edtFSCProductTypeKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
    begin
      P := Pos('.', Text);
    end;

  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

end.
