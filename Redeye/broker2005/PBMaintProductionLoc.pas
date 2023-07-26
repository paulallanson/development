unit PBMaintProductionLoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintProductionLocFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetLastSQL: TFDQuery;
    AddSQL: TFDQuery;
    UpdSQL: TFDQuery;
    DelSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    NameEdit: TEdit;
    BuildingEdit: TEdit;
    StreetEdit: TEdit;
    LocaleEdit: TEdit;
    TownEdit: TEdit;
    PostCodeEdit: TEdit;
    FlashTimer: TTimer;
    FlashDelivTimer: TTimer;
    qryZero: TFDQuery;
    UpdNotesOnlySQL: TFDQuery;
    UpdDelivNotesOnlySQL: TFDQuery;
    PrintBitBtn: TBitBtn;
    NotesBitBtn: TBitBtn;
    DelivNotesBitBtn: TBitBtn;
    Label1: TLabel;
    Label4: TLabel;
    dblkpWarehouse: TDBLookupComboBox;
    edtBin: TEdit;
    qryWarehouse: TFDQuery;
    dtsWarehouse: TDataSource;
    SearchBtn: TButton;
    chkbxForwardStock: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure FlashDelivTimerTimer(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
  private
    bDelivNotesFlash, bNotesFlash: ByteBool;
    procedure AddZero;
    procedure DeleteZero;
    function GetDbKey: Integer;
  public
    sFuncMode: string[1];
    iCode: Integer;
  end;

var
  PBMaintProductionLocFrm: TPBMaintProductionLocFrm;

implementation

uses PBDBMemo, PBImages, PBDelivNotes, ComObj, ActiveX,
  PBDatabase, pbMainMenu, CCSPrint, PBLUProductionLoc, PBMntPrtBin;

{$R *.DFM}

procedure TPBMaintProductionLocFrm.FormActivate(Sender: TObject);
begin
  {Create the delivery narrative form}
  PBDelivNotesFrm := TPBDelivNotesFrm.Create(Self);
  PBDelivNotesFrm.bAllow_Upd := True;
  {Create the memo form}
  PBDBMemoFrm := TPBDBMemoFrm.Create(Self);
  PBDBMemoFrm.bAllow_Upd := True;

  qryWarehouse.Active := false;
  qryWarehouse.Active := true;

  {Setup titles}
  if sFuncMode = 'A' then
    Caption := 'Add a new Production Location';
  if sFuncMode = 'C' then
    Caption := 'Change an Production Location';
  if sFuncMode = 'D' then
    Caption := 'Delete an Production Location';
  if sFuncMode = 'A' then
  begin
    {Empty details}
    NameEdit.Text := '';
    BuildingEdit.Text := '';
    StreetEdit.Text := '';
    LocaleEdit.Text := '';
    TownEdit.Text := '';
    PostCodeEdit.Text := '';
  end
  else
  begin
    with PBLUProductionLocFrm.DetsSRC.DataSet do
    begin
      iCode := FieldByName('Production_Location').AsInteger;
      NameEdit.Text := FieldByName('Production_Location_Name').AsString;
      BuildingEdit.Text := FieldByName('Building_No_Name').AsString;
      StreetEdit.Text := FieldByName('Street').AsString;
      LocaleEdit.Text := FieldByName('Locale').AsString;
      TownEdit.Text := FieldByName('Town').AsString;
      PostCodeEdit.Text := FieldByName('PostCode').AsString;
      dblkpWarehouse.KeyValue := fieldbyname('Part_Store').asinteger;
      edtBin.text := fieldbyname('Part_Bin').asstring;
      chkbxForwardStock.Checked := (fieldbyname('Receive_Forward_Stock').asstring = 'Y');
    end;
  end;
  {Enable or disable the buttons}
  DetsGrpBox.Enabled := (sFuncMode <> 'D');
  DelLabel.Visible := (sFuncMode = 'D');
  PrintBitBtn.Visible := (sFuncMode= 'C');
  CheckNotes(Self);
  CheckOK(Self);
  dmBroker.ScreenAccessControl(Self,'mnuProductionLocations',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintProductionLocFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  OKBitBtn.Enabled := (NameEdit.Text <> '');
end;

procedure TPBMaintProductionLocFrm.CancelBitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TPBMaintProductionLocFrm.NameEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProductionLocFrm.OKBitBtnClick(Sender: TObject);
begin
  if sFuncMode[1] in ['A', 'C'] then
  begin
    PBDBMemoFrm.UpdMemoData(Self);
    PBDelivNotesFrm.UpdMemoData(Self);
    if sFuncMode = 'A' then
      iCode := GetDbKey;
    with UpdSQL do
    begin
      Close;
      ParamByName('Production_Location').AsInteger := iCode;
      ParamByName('Production_Location_Name').AsString := NameEdit.Text + '';
      ParamByName('Building_No_Name').AsString := BuildingEdit.Text + '';
      ParamByName('Street').AsString := StreetEdit.Text + '';
      ParamByName('Locale').AsString := LocaleEdit.Text + '';
      ParamByName('Town').AsString := TownEdit.Text + '';
      ParamByName('PostCode').AsString := PostCodeEdit.Text + '';
      if dblkpWarehouse.text = '' then
        ParamByName('Part_Store').clear
      else
        ParamByName('Part_Store').Asinteger := dblkpWarehouse.keyvalue;
        
      ParamByName('Part_Bin').Asstring := edtBin.Text;
(*      if PBDBMemoFrm.iNarr = 0 then
        ParamByName('Narrative').Clear
      else
        ParamByName('Narrative').AsInteger := PBDBMemoFrm.iNarr;
      if PBDelivNotesFrm.iNarr = 0 then
        ParamByName('Delivery_Narrative').Clear
      else
        ParamByName('Delivery_Narrative').AsInteger := PBDelivNotesFrm.iNarr;
*)
      if chkbxForwardStock.Checked then
        Parambyname('Receive_Forward_Stock').asstring := 'Y'
      else
        Parambyname('Receive_Forward_Stock').asstring := 'N';
      ExecSQL;
    end;
  end
  else
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
      ParamByName('Production_Location').AsInteger := iCode;
      ExecSQL;
    end;
    // end;
    PBDBMemoFrm.DelMemoData(Self);
    PBDelivNotesFrm.DelMemoData(Self);
  end;
end;

procedure TPBMaintProductionLocFrm.PhoneEditChange(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBMaintProductionLocFrm.CheckNotes(Sender: TObject);
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
  if PBDelivNotesFrm.CheckNotes(Self) then
  begin
    FlashDelivTimer.Enabled := True;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashDelivTimer.Enabled := False;
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintProductionLocFrm.FlashDelivTimerTimer(Sender: TObject);
begin
  if bDelivNotesFlash then
    DelivNotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    DelivNotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bDelivNotesFlash := (not (bDelivNotesFlash));
end;

procedure TPBMaintProductionLocFrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    NotesBitBtn.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    NotesBitBtn.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintProductionLocFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PBDBMemoFrm.Free;
  PBDelivNotesFrm.Free;
end;

function TPBMaintProductionLocFrm.GetDbKey: Integer;
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
      Result := FieldByName('Production_Location').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TPBMaintProductionLocFrm.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Production_Location ' +
            '(Production_Location,Production_Location_Name,Building_No_Name,Street,' +
            'Locale,Town,PostCode) ' +
            'VALUES(0, '' '', NULL, '''', NULL, '''', '''')');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProductionLocFrm.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM Production_Location WHERE Production_Location=0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TPBMaintProductionLocFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
    PrinterSettings := TPrinterSettings.Create;
    if SetUpPrinter(PrinterSettings) then
        PBMaintProductionLocFrm.print;
      PrinterSettings.Free;
end;

procedure TPBMaintProductionLocFrm.SearchBtnClick(Sender: TObject);
begin
  PBMntPrtBinFrm := TPBMntPrtBinFrm.Create(Self);
  try
    PBMntPrtBinFrm.bAllow_Upd := True;
    PBMntPrtBinFrm.iStore := dblkpWarehouse.keyvalue;
    PBMntPrtBinFrm.ShowModal;
    if (PBMntPrtBinFrm.sSelBin <> '') then
       edtBin.Text := PBMntPrtBinFrm.sSelBin;
  finally
    PBMntPrtBinFrm.Free;
  end;
end;

end.

