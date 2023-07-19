unit wtMaintJRemedial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, CRControls, ComCtrls, DBCtrls, Buttons, wtJobsDM, QrCtrls,
  ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintJRemedial = class(TForm)
    qryFitter: TFDQuery;
    srcFitter: TDataSource;
    SpeedButton1: TSpeedButton;
    qryOperator: TFDQuery;
    srcOperator: TDataSource;
    pnlbottom: TPanel;
    pnlTop: TPanel;
    Label6: TLabel;
    dblkpOperator: TDBLookupComboBox;
    Label7: TLabel;
    edtDateRaised: TEdit;
    btnDateRequired: TBitBtn;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    pnlfooter: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dblkpFitters: TDBLookupComboBox;
    edtPrice: TCREditMoney;
    edtInstallDate: TEdit;
    btnInstallDate: TBitBtn;
    Panel2: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    Label8: TLabel;
    memItemsToReturnToSite: TMemo;
    Label9: TLabel;
    memItemsStillOnSite: TMemo;
    Label10: TLabel;
    Label11: TLabel;
    memToolsRequired: TMemo;
    Label12: TLabel;
    memSiteRequirements: TMemo;
    Label13: TLabel;
    memAdditionalNotes: TMemo;
    Label14: TLabel;
    memManufacturingNotes: TMemo;
    Label15: TLabel;
    dblkpRemedialType: TDBLookupComboBox;
    Label16: TLabel;
    dblkpRemedialCategory: TDBLookupComboBox;
    Label17: TLabel;
    dblkpRemedialDept: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    qryRemedialType: TFDQuery;
    qryRemedialCategory: TFDQuery;
    qryRemedialDept: TFDQuery;
    dtsRemedialType: TDataSource;
    dtsRemedialCategory: TDataSource;
    dtsRemedailDept: TDataSource;
    StatusBar1: TStatusBar;
    BitBtn5: TBitBtn;
    Label2: TLabel;
    memRemedials: TMemo;
    Label1: TLabel;
    memMaterials: TMemo;
    Label18: TLabel;
    dblkpOriginalTemplater: TDBLookupComboBox;
    Label19: TLabel;
    dblkpOriginalFitter: TDBLookupComboBox;
    Label20: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    BitBtn6: TBitBtn;
    chkbxProduction: TCheckBox;
    chkbxCompleted: TCheckBox;
    SpeedButton6: TSpeedButton;
    btnInternalNotes: TBitBtn;
    IntFlashTimer: TTimer;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtDateRaisedExit(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
    procedure btnInstallDateClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure btnInternalNotesClick(Sender: TObject);
    procedure IntFlashTimerTimer(Sender: TObject);
  private
    bIntNotesFlash: ByteBool;
    iCustomer: integer;
    FActivated: boolean;
    FJRemedial: TJRemedial;
    FMode: TjremMode;
    procedure ShowDetails;
    procedure SetJRemedial(const Value: TJRemedial);
    procedure SetMode(const Value: TjremMode);
    procedure RefreshFitters;
    procedure RefreshOperators;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure RefreshRemedialCategory;
    procedure RefreshRemedialDept;
    procedure RefreshRemedialTypes;
    procedure CheckNotes(Sender: TObject);
    { Private declarations }
  public
    property Mode: TjremMode read FMode write SetMode;
    property JRemedial: TJRemedial read FJRemedial write SetJRemedial;
  end;

var
  frmWTMaintJRemedial: TfrmWTMaintJRemedial;

implementation

uses wtLUFitters, wtMain, AllCommon, DateSelV5, WTLURemedialType, wtDBMemo,
  wtLURemedialCategory, wtLURemedialDept, WTSrchCustomer, wtDataModule,
  AllImages;

{$R *.dfm}

procedure TfrmWTMaintJRemedial.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jremAdd     : Caption := 'Add a remedial work item';
    jremChange  : Caption := 'Change a remedial work item';
    jremDelete  : Caption := 'Delete a remedial work item';
    end;  { case }
    if Mode = jremAdd then
      sTemp := ' New remedial work item '
    else
      sTemp := ' remedial work ' + IntToStr(jremedial.Parent.DbKey) + ' ';

    RefreshFitters;
    RefreshOperators;
    RefreshRemedialTypes;
    RefreshRemedialDept;
    RefreshRemedialCategory;
    ShowDetails;

    Checknotes(Self);

    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintJRemedial.RefreshFitters;
var
  icode: integer;
begin
  with qryFitter do
    begin
      close;
      parambyname('Fitter').asinteger := jRemedial.fitter;
      open;
    end;
end;

procedure TfrmWTMaintJRemedial.RefreshOperators;
var
  icode: integer;
begin
  with qryOperator do
    begin
      close;
      open;
    end;
end;

procedure TfrmWTMaintJRemedial.RefreshRemedialCategory;
var
  icode: integer;
begin
  with qryRemedialCategory do
    begin
      close;
      open;
    end;
end;

procedure TfrmWTMaintJRemedial.RefreshRemedialDept;
var
  icode: integer;
begin
  with qryRemedialDept do
    begin
      close;
      open;
    end;
end;

procedure TfrmWTMaintJRemedial.RefreshRemedialTypes;
var
  icode: integer;
begin
  with qryRemedialType do
    begin
      close;
      open;
    end;
end;

procedure TfrmWTMaintJRemedial.ShowDetails;
begin
  if Mode <> jremAdd then
  begin
    dblkpFitters.keyvalue := jRemedial.fitter;

    dblkpOriginalTemplater.keyvalue := jRemedial.OriginalTemplater;
    dblkpOriginalFitter.keyvalue := jRemedial.OriginalFitter;

    dblkpOperator.keyvalue := jRemedial.Operator;

    edtDateRaised.Text := paDateStr(jRemedial.DateRaised);
    edtInstallDate.Text := paDateStr(jRemedial.InstallDate);
    
    edtPrice.text := formatfloat('0.00',jRemedial.Price);
    memMaterials.text := jRemedial.MaterialsRequired;
    memRemedials.text := jRemedial.Narrative.Data;
    dblkpRemedialType.KeyValue := JRemedial.RemedialType;
    dblkpRemedialDept.KeyValue := JRemedial.RemedialDept;
    dblkpRemedialCategory.KeyValue := JREmedial.RemedialCategory;

    memItemsToReturnToSite.Text := JRemedial.ItemsToReturnToSite;
    memItemsStillOnSite.Text := JRemedial.ItemsStillOnSite;

    memToolsRequired.Text := JRemedial.ToolsRequired;
    memSiteRequirements.Text := JRemedial.SiteRequirements;

    memAdditionalNotes.Text := JRemedial.AdditionalNotesText;
    memManufacturingNotes.Text := JRemedial.ManufacturingNotesText;

    chkbxCompleted.Checked := (jRemedial.Completed = 'Y');
    chkbxProduction.Checked := (jRemedial.ProductionRequired = 'Y');

    iCustomer := jRemedial.Customer;
    
    edtCustomer.Text := dtmdlWorktops.GetCustomerName(jRemedial.Customer);
  end
  else
  begin
    dblkpFitters.keyvalue := 0;
    dblkpOriginalTemplater.keyvalue := 0;
    dblkpOriginalFitter.keyvalue := 0;

    dblkpOperator.keyvalue := frmWTMain.Operator;

    edtDateRaised.Text := paDateStr(date);
//    edtInstallDate.text := paDateStr(date);
    edtInstallDate.text := '';
    edtPrice.text := formatfloat('0.00',0);
    memMaterials.lines.clear;
    memRemedials.lines.clear;

    iCustomer := 0;
    edtCustomer.Text := '';
  end;
end;

procedure TfrmWTMaintJRemedial.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtPrice.Text <> '') and
                    (memRemedials.Text <> '') and
                    (memMaterials.Text <> '') and
                    (dblkpOperator.KeyValue <> 0);
end;

procedure TfrmWTMaintJRemedial.SetJRemedial(const Value: TJRemedial);
begin
  FJRemedial := Value;
end;

procedure TfrmWTMaintJRemedial.SetMode(const Value: TjremMode);
begin
  FMode := Value;
  lblDelete.visible := (FMode = jremDelete);
end;

procedure TfrmWTMaintJRemedial.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  jRemedial.Operator := dblkpOperator.KeyValue;
  jRemedial.Fitter := dblkpFitters.KeyValue;
  jRemedial.Narrative.Data := memRemedials.Text;
  jRemedial.FitterName := dblkpFitters.Text;
  jRemedial.InstallDate := paDateStr(edtInstallDate.text);
  jRemedial.DateRaised := paDateStr(edtDateRaised.text);
  jRemedial.MaterialsRequired := memMaterials.text;
  jRemedial.Price := strtofloat(edtPrice.text);

  jRemedial.OriginalFitter := dblkpOriginalFitter.KeyValue;
  jRemedial.OriginalTemplater := dblkpOriginalTemplater.KeyValue;

  JRemedial.Customer := iCustomer;
  
  if dblkpRemedialType.text = '' then
    jRemedial.RemedialType := 0
  else
    jRemedial.RemedialType := dblkpRemedialType.keyvalue;
  if dblkpRemedialDept.text = '' then
    jRemedial.RemedialDept := 0
  else
    jRemedial.RemedialDept := dblkpRemedialDept.keyvalue;
  if dblkpRemedialCategory.text = '' then
    jRemedial.RemedialCategory := 0
  else
    jRemedial.RemedialCategory := dblkpRemedialCategory.keyvalue;

  jRemedial.ItemsToReturnToSite := memItemsToReturnToSite.Text;
  jRemedial.ItemsStillOnSite := memItemsStillOnSite.Text;

  jRemedial.ToolsRequired := memToolsRequired.Text;
  jRemedial.SiteRequirements := memSiteRequirements.Text;

  jRemedial.AdditionalNotesText := memAdditionalNotes.Text;
  jRemedial.ManufacturingNotesText := memManufacturingNotes.Text;

  if chkbxCompleted.checked then
    jremedial.Completed := 'Y'
  else
    jremedial.Completed := 'N';

  if chkbxProduction.checked then
    jremedial.ProductionRequired := 'Y'
  else
    jremedial.ProductionRequired := 'N';

  if Mode = jremAdd then
  begin
    jRemedial.RemedialNumber := jRemedial.Parent.Remedials.Count + 1;
    jRemedial.Parent.Remedials.Add(jRemedial);
  end
  else
  if Mode = jremDelete then
  begin
    inx := jRemedial.Parent.Remedials.IndexOf(jRemedial.RemedialNumber);
    jRemedial.Parent.Remedials.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintJRemedial.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUFitters := TfrmWTLUFitters.create(self);
  try
    frmWTLUFitters.showmodal;
    RefreshFitters;
  finally
    frmWTLUFitters.free;
  end;

end;

procedure TfrmWTMaintJRemedial.edtDateRaisedExit(Sender: TObject);
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

procedure TfrmWTMaintJRemedial.btnDateRequiredClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateRaised.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateRaised.text;

  edtDateRaised.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTMaintJRemedial.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintJRemedial.btnInstallDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtInstallDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateRaised.text;

  edtInstallDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTMaintJRemedial.BitBtn1Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLURemedialType := TfrmwtLURemedialType.Create( Application );
  try
    frmwtLURemedialType.showmodal;
  finally
    frmwtLURemedialType.free;
    RefreshRemedialTypes;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintJRemedial.BitBtn3Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLURemedialCategory := TfrmwtLURemedialCategory.Create( Application );
  try
    frmwtLURemedialCategory.showmodal;
  finally
    frmwtLURemedialCategory.free;
    RefreshRemedialCategory;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintJRemedial.BitBtn4Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLURemedialDept := TfrmwtLURemedialDept.Create( Application );
  try
    frmwtLURemedialDept.showmodal;
  finally
    frmwtLURemedialDept.free;
    RefreshRemedialDept;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintJRemedial.BitBtn5Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtLUFitters := TfrmwtLUFitters.Create( Application );
  try
    frmwtLUFitters.showmodal;
  finally
    frmwtLUFitters.free;
    RefreshFitters;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintJRemedial.btnCustomerClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := iCustomer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        iCustomer := frmwtSrchCustomer.CodeSelected;
        edtCustomer.Text := frmwtSrchCustomer.NameSelected;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
end;

procedure TfrmWTMaintJRemedial.SpeedButton6Click(Sender: TObject);
begin
  iCustomer := 0;
  edtCustomer.Text := '';
end;

procedure TfrmWTMaintJRemedial.btnInternalNotesClick(Sender: TObject);
var
  frmWTDBInvMemo: TfrmWTDBMemo;
begin
  frmWTDBInvMemo := TfrmWTDBMemo.create(self);
  try
    if Mode = jremView then
      frmWTDBInvMemo.bAllow_Upd := false
    else
      frmWTDBInvMemo.bAllow_Upd := true;

    frmWTDBInvMemo.Datamemo.text := jRemedial.OfficeNotesText;
    frmWTDBInvMemo.ShowModal;
    jRemedial.OfficeNotesText := frmWTDBInvMemo.Datamemo.text;
  finally
    frmWTDBInvMemo.free;
  end;
  checknotes(Self);
end;

procedure TfrmWTMaintJRemedial.CheckNotes(Sender: TObject);
begin
  {Check for internal notes}
  if trim(jRemedial.OfficeNotesText) <> '' then
  begin
    IntFlashTimer.Enabled := True;
    btnInternalNotes.Glyph := frmAllImages.OnBitBtn.Glyph;
  end
  else
  begin
    IntFlashTimer.Enabled := False;
    btnInternalNotes.Glyph := frmAllImages.OffBitBtn.Glyph;
  end;
end;

procedure TfrmWTMaintJRemedial.IntFlashTimerTimer(Sender: TObject);
begin
  if bIntNotesFlash then
    btnInternalNotes.Glyph := frmAllImages.OnBitBtn.Glyph
  else
    btnInternalNotes.Glyph := frmAllImages.OffBitBtn.Glyph;
  bIntNotesFlash := (not (bIntNotesFlash));

end;

end.
