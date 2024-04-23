{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN TYPEINFO_IMPLICITLY_ADDED ON}
{$WARN RLINK_WARNING ON}
{$WARN IMPLICIT_STRING_CAST ON}
{$WARN IMPLICIT_STRING_CAST_LOSS ON}
{$WARN EXPLICIT_STRING_CAST OFF}
{$WARN EXPLICIT_STRING_CAST_LOSS OFF}
{$WARN CVT_WCHAR_TO_ACHAR ON}
{$WARN CVT_NARROWING_STRING_LOST ON}
{$WARN CVT_ACHAR_TO_WCHAR ON}
{$WARN CVT_WIDENING_STRING_LOST ON}
{$WARN NON_PORTABLE_TYPECAST ON}
{$WARN XML_WHITESPACE_NOT_ALLOWED ON}
{$WARN XML_UNKNOWN_ENTITY ON}
{$WARN XML_INVALID_NAME_START ON}
{$WARN XML_INVALID_NAME ON}
{$WARN XML_EXPECTED_CHARACTER ON}
{$WARN XML_CREF_NO_RESOLVE ON}
{$WARN XML_NO_PARM ON}
{$WARN XML_NO_MATCHING_PARM ON}
{$WARN IMMUTABLE_STRINGS OFF}
unit WTMaintSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, DBCtrls,
  Buttons, ExtCtrls, ComCtrls, DB, ShellAPI, ImgList, ToolWin, Grids, DBGrids, wtSupplierDM, Spin, Inifiles,
  DateSelV5, taoMapi, Activex, AxCtrls, Clipbrd, ComObj, Menus, CRControls, System.ImageList, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DragDrop, DragDropFile, DropTarget,
  DropComboTarget;

type
  TfrmWTMaintSupplier = class(TForm)
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    lblDelete: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    pnlDetails: TPanel;
    Label1: TLabel;
    tblOneSupplier: TFDTable;
    dtsOneSupplier: TDataSource;
    qryNewSupplier: TFDQuery;
    pgDetails: TPageControl;
    tsDetails: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    tsMaterials: TTabSheet;
    tsDocuments: TTabSheet;
    Panel12: TPanel;
    Label44: TLabel;
    Panel11: TPanel;
    lstvwDocuments: TListView;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    imgIcons: TImageList;
    Panel3: TPanel;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    btnAdd: TBitBtn;
    dbgDetails: TDBGrid;
    pnlMaterialsFooter: TPanel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtMaterial: TEdit;
    Panel4: TPanel;
    edtColour: TEdit;
    edtThickness: TEdit;
    edtGroup: TEdit;
    btnClear: TBitBtn;
    edtEffectiveDate: TEdit;
    btnEffectiveDate: TBitBtn;
    BitBtn5: TBitBtn;
    btnSweep: TBitBtn;
    Label15: TLabel;
    SpinEdit1: TSpinEdit;
    Label16: TLabel;
    btnMaterials: TBitBtn;
    Label17: TLabel;
    Label18: TLabel;
    tmrSearch: TTimer;
    btnCosts: TBitBtn;
    btnWorktops: TBitBtn;
    chkbxShowInactive: TCheckBox;
    tsProducts: TTabSheet;
    tmrProductSearch: TTimer;
    pnlProductsFooter: TPanel;
    dbgProductDetails: TDBGrid;
    Panel6: TPanel;
    btnProdChange: TBitBtn;
    btnProdDelete: TBitBtn;
    btnProdAdd: TBitBtn;
    Label19: TLabel;
    edtSearch: TEdit;
    btnProdClear: TBitBtn;
    btnProdSweep: TBitBtn;
    chkbxShowInactiveProducts: TCheckBox;
    tsWorktops: TTabSheet;
    Panel2: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    edtMaterial1: TEdit;
    Panel5: TPanel;
    edtColour1: TEdit;
    edtGroup1: TEdit;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    Panel7: TPanel;
    btnChangeWorktop: TBitBtn;
    btnDeleteWorktop: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    dbgWorktopDetails: TDBGrid;
    tmrWorktopSearch: TTimer;
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    N2: TMenuItem;
    pmnuSelectAll: TMenuItem;
    imgDocuments: TImageList;
    svDlgOfficeDoc: TSaveDialog;
    DocOpenDialog: TOpenDialog;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTownCity: TEdit;
    edtPostcode: TEdit;
    edtCountyState: TEdit;
    edtTelephoneNumber: TEdit;
    edtFaxNumber: TEdit;
    edtWebAddress: TEdit;
    edtEmailAddress: TEdit;
    edtSupplierName: TEdit;
    edtDiscountPercentage: TCREditFloat;
    edtAccountCode: TEdit;
    qryOneSupplier: TFDQuery;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryDelete: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    DropComboTarget1: TDropComboTarget;
    procedure tblOneSupplierNewRecord(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAddClick(Sender: TObject);
    procedure btnMaterialsClick(Sender: TObject);
    procedure tsMaterialsShow(Sender: TObject);
    procedure edtMaterialChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure edtColourChange(Sender: TObject);
    procedure edtThicknessChange(Sender: TObject);
    procedure edtGroupChange(Sender: TObject);
    procedure edtEffectiveDateExit(Sender: TObject);
    procedure edtEffectiveDateKeyPress(Sender: TObject; var Key: Char);
    procedure btnEffectiveDateClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnCostsClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnWorktopsClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure tsProductsShow(Sender: TObject);
    procedure tmrProductSearchTimer(Sender: TObject);
    procedure dbgProductDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure edtSearchChange(Sender: TObject);
    procedure btnProdClearClick(Sender: TObject);
    procedure btnProdSweepClick(Sender: TObject);
    procedure btnProdAddClick(Sender: TObject);
    procedure btnProdChangeClick(Sender: TObject);
    procedure btnProdDeleteClick(Sender: TObject);
    procedure chkbxShowInactiveProductsClick(Sender: TObject);
    procedure dbgProductDetailsDblClick(Sender: TObject);
    procedure tsWorktopsShow(Sender: TObject);
    procedure edtMaterial1Change(Sender: TObject);
    procedure edtColour1Change(Sender: TObject);
    procedure edtGroup1Change(Sender: TObject);
    procedure tmrWorktopSearchTimer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnChangeWorktopClick(Sender: TObject);
    procedure dbgWorktopDetailsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbgWorktopDetailsDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure pmnuDocumentsPopup(Sender: TObject);
    procedure pmnuOpenClick(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    bOK: boolean;
    FFunctionMode: string;
    FSupplier: integer;
    procedure SetFunctionMode(const Value: string);
    procedure SetSupplier(const Value: integer);
    procedure ShowDetails;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure CallMaintCostScreen;
    procedure CallMaintProductScreen(Mode: string);
    procedure DeleteFromDB(CodeID: integer);
    procedure AddSupplierWorktopsCost(tmpPricePointer: integer; tmpCost: double);
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure SupplierWorktopDelete(tmpSupplier, tmpWorktop: integer);
    procedure SupplierWorktopInactive(tmpSupplier, tmpWorktop: integer; inactive: boolean);
    procedure SetMaterialButtons(Sender: TObject; Field: TField);
    procedure SetMaterialButtonsFunction(Dataset: TDataset);
    procedure SetProductButtons(Sender: TObject; Field: TField);
    procedure SetProductButtonsFunction(Dataset: TDataset);
    procedure SetWorktopButtons(Sender: TObject; Field: TField);
    procedure ShowDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    function GetFilesPath: string;
  public
    procedure GetRecord(Key: integer);
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property Supplier: integer read FSupplier write SetSupplier;
  end;

var
  frmWTMaintSupplier: TfrmWTMaintSupplier;
  dtmdlOneSupplier: TdtmdlSuppliers;

implementation

uses
  AllCommon, WTMaintSupplierWorktops, wtLUMatType, WTMaintSupplierWorktopCost, WTMaintSupplierWTThicknessCost,
  wtDataModule, wtMain, wtLUworktops, WTMaintSupplierProduct, WTMaintSupplierWorktop, WTWordOLE, WTExcelOLE,
  WTMaintEmail, System.UITypes, Shared.DragDrop.Helper;

{$R *.dfm}

procedure TfrmWTMaintSupplier.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
  lblDelete.Visible := false;
  if Value = 'A' then
    begin
    chkbxinactive.checked := false;
//    tblOneSupplier.Insert;
    end
  else
  if Value = 'C' then
    begin
    if qryOneSupplier.fieldbyname('inActive').asstring = 'Y' then
      chkbxinactive.checked := true
    else
      chkbxinactive.checked := false;
//    tblOneSupplier.edit;
    end
  else
  if FunctionMode = 'D' then
    begin
      pnldetails.enabled := false;
      lblDelete.Visible := true;
    end;
end;

procedure TfrmWTMaintSupplier.tblOneSupplierNewRecord(DataSet: TDataSet);
begin
(*	qryNewSupplier.Close;
  qryNewSupplier.Open;

  tblOneSupplier.FieldByName('Supplier').asinteger := qryNewSupplier.Fields[0].asinteger + 1;
*)
end;

procedure TfrmWTMaintSupplier.btnOKClick(Sender: TObject);
begin
  bOK := true;

  if FunctionMode <> 'D' then
    begin
      SaveToDB;
//      Supplier := qryOneSupplier.FieldByName('Supplier').asinteger;
    end;
end;

procedure TfrmWTMaintSupplier.SetSupplier(const Value: integer);
begin
  FSupplier := Value;
end;

procedure TfrmWTMaintSupplier.GetRecord(Key: integer);
begin
  qryOneSupplier.Close;
  qryOneSupplier.parambyname('Supplier').asinteger := key;
  qryOneSupplier.Open;

(*  tblOneSupplier.Active := false;
  tblOneSupplier.Filter := 'Supplier = ' + inttostr(Key);
  tblOneSupplier.Active := true;
*)
  Supplier := key;
end;

procedure TfrmWTMaintSupplier.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWtMaintSupplier.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtSupplierName.Text <> '') and
                    (edtStreet.text <> '') and
                    (edtPostcode.text <> '') and
                    (edtTelephoneNumber.text <> '');
end;

procedure TfrmWTMaintSupplier.FormShow(Sender: TObject);
begin
  if FunctionMode <> 'D' then
    edtSupplierName.setfocus;
  enableOK(self);
end;

procedure TfrmWTMaintSupplier.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  dtmdlOneSupplier := TdtmdlSuppliers.create(application);

  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
  AllCommon.SetDBGridCols('', 'Supplier Material Costs Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  AllCommon.SetDBGridCols('', 'Supplier Product Costs Col Order', TfrmWTMain.AppIniFile, self.dbgProductDetails);
end;

procedure TfrmWTMaintSupplier.ShowDetails;
begin
  if FunctionMode = 'A' then
    begin
      edtSupplierName.Text := '';
      edtStreet.Text := '';
      edtLocale.Text := '';
      edtTownCity.Text := '';
      edtPostcode.Text := '';

      edtCountyState.Text := '';
      edtTelephoneNumber.Text := '';
      edtFaxNumber.Text := '';

      edtWebAddress.Text := '';
      edtEmailAddress.Text := '';

      edtDiscountPercentage.Text := '0.00';
      edtAccountCode.Text := '';

      chkbxInactive.Checked := false;
    end
  else
    begin
      if (FunctionMode = 'C') then
        self.Caption := self.Caption + ' - ' + qryOneSupplier.fieldbyname('Supplier_Name').asstring;

      edtSupplierName.Text := qryOneSupplier.fieldbyname('Supplier_Name').asstring;
      edtStreet.Text := qryOneSupplier.fieldbyname('Street').asstring;
      edtLocale.Text := qryOneSupplier.fieldbyname('Locale').asstring;
      edtTownCity.Text := qryOneSupplier.fieldbyname('Town_City').asstring;
      edtPostcode.Text := qryOneSupplier.fieldbyname('Postcode').asstring;

      edtCountyState.Text := qryOneSupplier.fieldbyname('County_State').asstring;
      edtTelephoneNumber.Text := qryOneSupplier.fieldbyname('Telephone_Number').asstring;
      edtFaxNumber.Text := qryOneSupplier.fieldbyname('Fax_Number').asstring;

      edtWebAddress.Text := qryOneSupplier.fieldbyname('Web_Address').asstring;
      edtEmailAddress.Text := qryOneSupplier.fieldbyname('Email_Address').asstring;

      edtDiscountPercentage.Text := formatfloat('#,##0.00',qryOneSupplier.fieldbyname('Discount_Percentage').asfloat);
      edtAccountCode.Text := qryOneSupplier.fieldbyname('Account_Code').asstring;

      chkbxInactive.Checked := (qryOneSupplier.fieldbyname('inActive').asstring = 'Y');

//      stsbrDetails.Panels[0].Text := 'Date Created: ' + paDateStr(qryOneSupplier.fieldbyname('Date_Created').asdatetime);
    end;
end;

procedure TfrmWTMaintSupplier.FormActivate(Sender: TObject);
begin
  bOK := false;
  dbgDetails.DataSource := dtmdlOneSupplier.dtsWorktopPrices;
  dbgDetails.DataSource.OnDataChange := SetMaterialButtons;
  dbgDetails.DataSource.dataset.AfterScroll := SetMaterialButtonsFunction;

  dbgProductDetails.DataSource := dtmdlOneSupplier.dtsProductPrices;
  dbgProductDetails.DataSource.OnDataChange := SetProductButtons;
  dbgProductDetails.DataSource.dataset.AfterScroll := SetProductButtonsFunction;

  dbgWorktopDetails.DataSource := dtmdlOneSupplier.dtsSupplierWorktops;
  dbgWorktopDetails.DataSource.OnDataChange := SetWorktopButtons;

  ShowDetails;
  ShowDocuments;
end;

procedure TfrmWTMaintSupplier.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
  AllCommon.SaveDBGridCols('', 'Supplier Material Costs Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  AllCommon.SaveDBGridCols('', 'Supplier Product Costs Col Order', TfrmWTMain.AppIniFile, self.dbgProductDetails);
end;

procedure TfrmWTMaintSupplier.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
    begin
//      tblOneSupplier.cancel;
      Exit
    end
  else
  if TempWord = mrCancel then
    begin
      Action := caNone;
    end
  else
    btnOKClick(self);
end;

procedure TfrmWTMaintSupplier.btnAddClick(Sender: TObject);
begin
  frmWTMaintSupplierWorktops := TfrmWTMaintSupplierWorktops.create(self);
  try
    frmWTMaintSupplierWorktops.Supplier := Supplier;
    frmWTMaintSupplierWorktops.dtmdlOneSupplier := dtmdlOneSupplier;
    frmWTMaintSupplierWorktops.showmodal;
    if frmWTMaintSupplierWorktops.bOK then
      begin
        dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
      end;
  finally
    frmWTMaintSupplierWorktops.free;
  end;
end;

procedure TfrmWTMaintSupplier.btnMaterialsClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUMatType := TfrmWTLUMatType.create(self);
  try
    frmWTLUMatType.showmodal;
  finally
    frmWTLUMatType.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintSupplier.tsMaterialsShow(Sender: TObject);
begin
  edtMaterial.Text := edtMaterial1.Text;
  edtColour.Text := edtColour1.Text;
  edtGroup.Text := edtGroup1.Text;
  dbgDetails.setfocus;
  dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
end;

procedure TfrmWTMaintSupplier.edtMaterialChange(Sender: TObject);
begin
  dtmdlOneSupplier.Material := edtMaterial.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTMaintSupplier.btnSweepClick(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TfrmWTMaintSupplier.btnClearClick(Sender: TObject);
begin
  edtColour.Clear;
  edtGroup.clear;
  edtMaterial.Clear;
  edtThickness.clear;
  edtEffectiveDate.Clear;
  dtmdlOneSupplier.EffectiveDate := 0;
end;

procedure TfrmWTMaintSupplier.edtColourChange(Sender: TObject);
begin
  dtmdlOneSupplier.Colour := edtColour.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.edtThicknessChange(Sender: TObject);
begin
  dtmdlOneSupplier.Thickness := edtThickness.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmWTMaintSupplier.edtGroupChange(Sender: TObject);
begin
  dtmdlOneSupplier.Group := edtGroup.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;

end;

procedure TfrmWTMaintSupplier.edtEffectiveDateExit(Sender: TObject);
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

  dtmdlOneSupplier.EffectiveDate := paDateStr((Sender as TEdit).Text);
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.edtEffectiveDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      btnEffectiveDate.setfocus;
    end;
end;

procedure TfrmWTMaintSupplier.btnEffectiveDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtEffectiveDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtEffectiveDate.text;

  edtEffectiveDate.text := paDatestr(InputDate(paDateStr(tempdate)));

  dtmdlOneSupplier.EffectiveDate := paDateStr(edtEffectiveDate.text);
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.BitBtn5Click(Sender: TObject);
begin
  edtEffectiveDate.Clear;
  dtmdlOneSupplier.EffectiveDate := 0;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

function TfrmWTMaintSupplier.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintSupplier.btnCostsClick(Sender: TObject);
begin
  CallMaintCostScreen;
end;

procedure TfrmWTMaintSupplier.CallMaintCostScreen;
var
  iCount: integer;
  rCost: double;
begin
  frmWTMaintSupplierWorktopCost := TfrmWTMaintSupplierWorktopCost.Create(self);

  try
    frmWTMaintSupplierWorktopCost.showmodal;

    if frmWTMaintSupplierWorktopCost.bOK then
      begin

        for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
          begin
            dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));

            if frmWTMaintSupplierWorktopCost.BasisGroup.itemindex = 1 then
  	          rCost := dbgDetails.DataSource.DataSet.fieldbyname('Unit_Cost').asfloat * (1+(StrToFloatDef(frmWTMaintSupplierWorktopCost.edtChange.text, 0, FormatSettings)/100))
            else
            if frmWTMaintSupplierWorktopCost.BasisGroup.itemindex = 2 then
  	          rCost := dbgDetails.DataSource.DataSet.fieldbyname('Unit_Cost').asfloat * (1-(StrToFloatDef(frmWTMaintSupplierWorktopCost.edtChange.text, 0, FormatSettings)/100))
            else
  	          rCost := StrToFloatDef(frmWTMaintSupplierWorktopCost.edtChange.text, 0, FormatSettings);

            AddSupplierWorktopsCost(dbgDetails.datasource.dataset.fieldbyname('Price_Pointer').asinteger, rCost);
          end;

        dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
      end;
  finally
    frmWTMaintSupplierWorktopCost.free;
  end;
end;

procedure TfrmWTMaintSupplier.btnChangeClick(Sender: TObject);
begin
  frmWTMaintSupplierWTThicknessCost := TfrmWTMaintSupplierWTThicknessCost.create(self);

  try
    frmWTMaintSupplierWTThicknessCost.lblSupplierName.caption := edtSupplierName.text;
    frmWTMaintSupplierWTThicknessCost.lblWorktop.caption := dbgDetails.datasource.dataset.fieldbyname('Worktop_Description').asstring;
    frmWTMaintSupplierWTThicknessCost.lblThickness.caption := dbgDetails.datasource.dataset.fieldbyname('Thickness_mm').asstring;
    frmWTMaintSupplierWTThicknessCost.CostPrice := dbgDetails.datasource.dataset.fieldbyname('Unit_Cost').asfloat;
    frmWTMaintSupplierWTThicknessCost.PricePointer := dbgDetails.datasource.dataset.fieldbyname('Price_Pointer').asinteger;
    frmWTMaintSupplierWTThicknessCost.showmodal;

    if frmWTMaintSupplierWTThicknessCost.bOK then
      begin
        dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
      end;
  finally
    frmWTMaintSupplierWTThicknessCost.free;
  end;

end;

procedure TfrmWTMaintSupplier.AddSupplierWorktopsCost(tmpPricePointer: integer; tmpCost: double);
begin
  dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := tmpPricePointer;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
  dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := tmpCost;
	dtmdlWorktops.qryAddPrice.execSQL;
end;

procedure TfrmWTMaintSupplier.btnWorktopsClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtLUWorktops := TfrmWtLUWorktops.create(application);
  try
    frmWtLUWorktops.showmodal;
  finally
    frmWtLUWorktops.free;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmWTMaintSupplier.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTMaintSupplier.btnDeleteClick(Sender: TObject);
var
  iCount: integer;
begin
  if trim(dbgDetails.DataSource.DataSet.fieldbyname('inactive').asstring) = 'Y' then
    begin
      if messagedlg('Do you want to re-activate the selected worktops?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
            begin
              dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));
              SupplierWorktopInactive(Supplier, dbgDetails.DataSource.DataSet.fieldbyname('Worktop').asinteger, false);
            end;
          dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
        end;
    end
  else
    begin
      if trim(dbgDetails.DataSource.DataSet.fieldbyname('Operator_Name').asstring) = '' then
        begin
          if messagedlg('Do you want to delete the selected worktops?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
                begin
                  dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));
                  SupplierWorktopDelete(Supplier, dbgDetails.DataSource.DataSet.fieldbyname('Worktop').asinteger);
                end;
              dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
            end;
        end
      else
        begin
          if messagedlg('Do you want to make the selected worktops inactive?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
                begin
                  dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));
                  SupplierWorktopInactive(Supplier, dbgDetails.DataSource.DataSet.fieldbyname('Worktop').asinteger, true);
                end;
              dtmdlOneSupplier.RefreshWorktopPrices(Supplier);
            end;
        end;
    end;
end;

procedure TfrmWTMaintSupplier.SupplierWorktopDelete(tmpSupplier, tmpWorktop: integer);
begin
  {Delete Supplier Worktop Thickness}
  with dtmdlOneSupplier.qrySupplierWTThickDelete do
    begin
      close;
      parambyname('Supplier').asinteger := tmpSupplier;
      parambyname('Worktop').asinteger := tmpWorktop;
      execsql;
    end;

  {Delete Supplier Worktop}
  with dtmdlOneSupplier.qrySupplierWTDelete do
    begin
      close;
      parambyname('Supplier').asinteger := tmpSupplier;
      parambyname('Worktop').asinteger := tmpWorktop;
      execsql;
    end;
end;

procedure TfrmWTMaintSupplier.SupplierWorktopInactive(tmpSupplier, tmpWorktop: integer; inactive: boolean);
begin
  with dtmdlOneSupplier.qrySupplierWTInactive do
    begin
      close;
      parambyname('Supplier').asinteger := tmpSupplier;
      parambyname('Worktop').asinteger := tmpWorktop;

      if inactive then
        parambyname('inactive').asstring := 'Y'
      else
        parambyname('inactive').asstring := 'N';
      execsql;
    end;
end;

procedure TfrmWTMaintSupplier.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  sValue: string;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Unit Cost (sq m)')  and
      (Column.Title.Caption <> 'Effective Date')  and
      (Column.Title.Caption <> 'Date Changed') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
    begin
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Unit Cost (sq m)') then
        TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';

      Column.Alignment := taRightJustify;
     end;
end;

procedure TfrmWTMaintSupplier.chkbxShowInactiveClick(Sender: TObject);
begin
  dtmdlOneSupplier.ShowInactive := (Sender as TCheckBox).Checked;
  dtmdlOneSupplier.RefreshWorktopPrices(Supplier);

end;

procedure TfrmWTMaintSupplier.SetMaterialButtons(Sender: TObject; Field: TField);
begin
  with dbgDetails.datasource.dataset do
  begin
    btnChange.Enabled := recordCount > 0;
    btnDelete.Enabled := recordCount > 0;
    btnCosts.Enabled := recordCount > 0;
    stsBrDetails.panels[0].text := inttostr(recordCount) + ' records displayed';
  end;
end;

procedure TfrmWTMaintSupplier.SetWorktopButtons(Sender: TObject; Field: TField);
begin
  with dbgWorktopDetails.datasource.dataset do
  begin
    btnChangeWorktop.Enabled := recordCount > 0;
    btnDeleteWorktop.Enabled := recordCount > 0;
    stsBrDetails.panels[0].text := inttostr(recordCount) + ' records displayed';
  end;
end;

procedure TfrmWTMaintSupplier.SetMaterialButtonsFunction(Dataset: TDataset);
begin
  with Dataset do
  begin
    if fieldbyname('inactive').asstring = 'Y' then
      btnDelete.caption := '&ReActivate'
    else
      btnDelete.caption := '&Delete';
  end;
end;

procedure TfrmWTMaintSupplier.SetProductButtons(Sender: TObject; Field: TField);
begin
  with dbgProductDetails.datasource.dataset do
  begin
    btnProdChange.Enabled := recordCount > 0;
    btnProdDelete.Enabled := recordCount > 0;
  end;
end;

procedure TfrmWTMaintSupplier.SetProductButtonsFunction(Dataset: TDataset);
begin
  with Dataset do
  begin
    if fieldbyname('inactive').asstring = 'Y' then
      btnProdDelete.caption := '&ReActivate'
    else
      btnProdDelete.caption := '&Delete';
  end;
end;

procedure TfrmWTMaintSupplier.tsProductsShow(Sender: TObject);
begin
  dbgProductDetails.setfocus;
  dtmdlOneSupplier.RefreshProductPrices(Supplier);
end;

procedure TfrmWTMaintSupplier.tmrProductSearchTimer(Sender: TObject);
begin
  tmrProductSearch.Enabled := False;
  dtmdlOneSupplier.RefreshProductPrices(Supplier);
  with dbgProductDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTMaintSupplier.dbgProductDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  sValue: string;
begin
  if(dbgProductDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Unit Cost')  and
      (Column.Title.Caption <> 'Effective Date')  and
      (Column.Title.Caption <> 'Date Changed') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
     end
  else
    begin
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Unit Cost') then
        TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';

      Column.Alignment := taRightJustify;
    end;
end;

procedure TfrmWTMaintSupplier.edtSearchChange(Sender: TObject);
begin
  dtmdlOneSupplier.ProductCode := edtSearch.Text;
  tmrProductSearch.Enabled := False;
  tmrProductSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.btnProdClearClick(Sender: TObject);
begin
  edtSearch.Text := '';
  dtmdlOneSupplier.ProductCode := '';
  tmrProductSearch.Enabled := false;
  tmrProductSearch.Enabled := true;
end;

procedure TfrmWTMaintSupplier.btnProdSweepClick(Sender: TObject);
begin
  with dbgProductDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgProductDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;

end;

procedure TfrmWTMaintSupplier.btnProdAddClick(Sender: TObject);
begin
  CallMaintProductScreen('A');
end;

procedure TfrmWTMaintSupplier.CallMaintProductScreen(Mode: string);
var
  key: integer;
begin
  frmWTMaintSupplierProduct := TfrmWTMaintSupplierProduct.create(self);
  try
    frmWTMaintSupplierProduct.Supplier := Supplier;
    frmWTMaintSupplierProduct.dtmdlOneSupplier := dtmdlOneSupplier;
    if Mode = 'A' then
      begin
        frmWTMaintSupplierProduct.CodeID := 0;
      end
    else
      begin
        frmWTMaintSupplierProduct.CodeID := dbgProductDetails.datasource.dataset.fieldbyname('Supplier_Product').asinteger;
      end;
    frmWTMaintSupplierProduct.Mode := Mode;
    frmWTMaintSupplierProduct.showmodal;
    if frmWTMaintSupplierProduct.bOK then
      begin
        key := frmWTMaintSupplierProduct.PricePointer;
        dtmdlOneSupplier.RefreshProductPrices(Supplier);
        dbgProductDetails.datasource.DataSet.locate('Price_Pointer', Variant(inttostr(key)),[lopartialKey]) ;
      end;
  finally
    frmWTMaintSupplierProduct.free;
  end;
end;

procedure TfrmWTMaintSupplier.btnProdChangeClick(Sender: TObject);
begin
  CallMaintProductScreen('C');
end;

procedure TfrmWTMaintSupplier.btnProdDeleteClick(Sender: TObject);
var
  iCode: integer;
begin
  iCode := dbgProductDetails.datasource.DataSet.fieldbyname('Supplier_Product').asinteger;
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DeleteFromDB(iCode);
        dtmdlOneSupplier.RefreshProductPrices(Supplier);
      except
        messagedlg('This product' + ' has related data, therefore cannot be deleted. Make the product inactive', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTMaintSupplier.DeleteFromDB(CodeID: integer);
begin
  with dtmdlOneSupplier.qryDelete do
    begin
      sql.text := 'DELETE FROM Supplier_Product WHERE Supplier_Product = ' + inttostr(CodeID);
      close;
      execsql;
    end;

  with dtmdlWorktops.qryDelPrice do
    begin
      close;
      parambyname('Price_Pointer').asinteger := dbgProductDetails.datasource.DataSet.fieldbyname('Price_Pointer').asinteger;
      execsql;
    end;

  with dtmdlWorktops.qryDelPricePointer do
    begin
      close;
      parambyname('Price_Pointer').asinteger := dbgProductDetails.datasource.DataSet.fieldbyname('Price_Pointer').asinteger;
      execsql;
    end;
end;

procedure TfrmWTMaintSupplier.chkbxShowInactiveProductsClick(
  Sender: TObject);
begin
  dtmdlOneSupplier.ShowInactiveProducts := (Sender as TCheckBox).Checked;
  dtmdlOneSupplier.RefreshProductPrices(Supplier);
end;

procedure TfrmWTMaintSupplier.dbgProductDetailsDblClick(Sender: TObject);
begin
  btnProdChangeClick(self);
end;

procedure TfrmWTMaintSupplier.tsWorktopsShow(Sender: TObject);
begin
  edtMaterial1.Text := edtMaterial.Text;
  edtColour1.Text := edtColour.Text;
  edtGroup1.Text := edtGroup.Text;
  dbgWorktopDetails.setfocus;
  dtmdlOneSupplier.RefreshSupplierWorktops(Supplier);
end;

procedure TfrmWTMaintSupplier.edtMaterial1Change(Sender: TObject);
begin
  dtmdlOneSupplier.Material := (Sender as TEdit).Text;
  tmrWorktopSearch.Enabled := False;
  tmrWorktopSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.edtColour1Change(Sender: TObject);
begin
  dtmdlOneSupplier.Colour := (Sender as TEdit).Text;
  tmrWorktopSearch.Enabled := False;
  tmrWorktopSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.edtGroup1Change(Sender: TObject);
begin
  dtmdlOneSupplier.Group := (Sender as TEdit).Text;
  tmrWorktopSearch.Enabled := False;
  tmrWorktopSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplier.tmrWorktopSearchTimer(Sender: TObject);
begin
  tmrWorktopSearch.Enabled := False;
  dtmdlOneSupplier.RefreshSupplierWorktops(Supplier);
  with dbgWorktopDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;

end;

procedure TfrmWTMaintSupplier.CheckBox1Click(Sender: TObject);
begin
  dtmdlOneSupplier.ShowInactive := (Sender as TCheckBox).Checked;
  dtmdlOneSupplier.RefreshSupplierWorktops(Supplier);
end;

procedure TfrmWTMaintSupplier.btnChangeWorktopClick(Sender: TObject);
begin
  frmWTMaintSupplierWorktop := TfrmWTMaintSupplierWorktop.create(self);

  try
    frmWTMaintSupplierWorktop.lblSupplierName.caption := edtSupplierName.text;
    frmWTMaintSupplierWorktop.lblWorktop.caption := dbgWorktopDetails.datasource.dataset.fieldbyname('Worktop_Description').asstring;
    frmWTMaintSupplierWorktop.Supplier := Supplier;
    frmWTMaintSupplierWorktop.Worktop := dbgWorktopDetails.datasource.dataset.fieldbyname('Worktop').asinteger;
    frmWTMaintSupplierWorktop.showmodal;
  finally
    frmWTMaintSupplierWorktop.free;
  end;


end;

procedure TfrmWTMaintSupplier.dbgWorktopDetailsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  sValue: string;
begin
  if(dbgWorktopDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  if  (Column.Title.Caption <> 'Unit Cost (sq m)')  and
      (Column.Title.Caption <> 'Effective Date')  and
      (Column.Title.Caption <> 'Date Changed') then
  	begin
      if Assigned(Column.Field) then
        Column.Alignment := taLeftJustify;
    end
  else
    begin
			{Display the Columns Right justified in the cells}
      if  (Column.Title.Caption = 'Unit Cost (sq m)') then
        TNumericField(Column.Field).DisplayFormat := '£#,###,##0.00';

      Column.Alignment := taRightJustify;
    end;
end;

procedure TfrmWTMaintSupplier.dbgWorktopDetailsDblClick(Sender: TObject);
begin
  btnChangeWorktopClick(self);

end;

procedure TfrmWTMaintSupplier.BitBtn1Click(Sender: TObject);
begin
  edtColour1.Clear;
  edtGroup1.clear;
  edtMaterial1.Clear;
end;

procedure TfrmWTMaintSupplier.BitBtn6Click(Sender: TObject);
var
  BMark: TBookmark;
begin
  with dbgDetails.DataSource.dataset do
  begin
    BMark := Bookmark ;
    DisableControls ;
    try
      first ;
      while not Eof do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
    finally
      Bookmark := BMark ;
      EnableControls ;
    end;
  end;
end;

procedure TfrmWtMaintSupplier.ShowDocuments;
var
  sPath: string;
begin
  sPath := GetFilesPath;

  lstvwDocuments.Clear;
  // Assign a Imagelist to the ListView
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TfrmWtMaintSupplier.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
var
  i: Integer;
  Icon: TIcon;
  SearchRec: TSearchRec;
  ListItem: TListItem;
  FileInfo: SHFILEINFO;
begin
  // Create a temporary TIcon
  Icon := TIcon.Create;
  ListView.Items.BeginUpdate;
  try
    // search for the first file
    i := FindFirst(strPath + '*.*', faArchive, SearchRec);
    while i = 0 do
    begin
      with ListView do
      begin
        // On directories and volumes
        if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
          (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          ListItem := ListView.Items.Add;
          //Get The DisplayName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_DISPLAYNAME);
//          Listitem.Caption := FileInfo.szDisplayName;
          Listitem.Caption := SearchRec.Name;
          // Get The TypeName
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_TYPENAME);
          ListItem.SubItems.Add(FileInfo.szTypeName);
          // Get The DateModified
          try
            ListItem.SubItems.Add(DatetimeToStr(FileDateToDateTime(fileage(strPath + ListItem.Caption))));
          except
            ListItem.SubItems.Add('');
          end;

          //Get The Icon That Represents The File
          SHGetFileInfo(PChar(strPath + SearchRec.Name), 0, FileInfo,
            SizeOf(FileInfo), SHGFI_ICON or SHGFI_SMALLICON);
          icon.Handle := FileInfo.hIcon;
          ListItem.ImageIndex := ImageList.AddIcon(Icon);
          // Destroy the Icon
          DestroyIcon(FileInfo.hIcon);
        end;
      end;
      i := FindNext(SearchRec);
    end;
  finally
    Icon.Free;
    ListView.Items.EndUpdate;
  end;
end;

procedure TfrmWTMaintSupplier.pmnuDocumentsPopup(Sender: TObject);
begin
  if FunctionMode = 'A' then
    exit
  else
    begin
      pmnuDelete.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuOpen.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuSelectAll.Enabled := (lstvwDocuments.Items.count > 0);
    end;
end;

procedure TfrmWTMaintSupplier.pmnuOpenClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dtmdlWorktops.GetCompanySupplierDirectory + '\' + edtSupplierName.text + '\';
  if sPath = '' then
    exit;

  if lstvwDocuments.ItemIndex = -1 then
    begin
      sDoc := '';
      exit;
    end
  else
    begin
      sDoc := lstvwDocuments.Items[lstvwDocuments.ItemIndex].caption;
    end;

  Params := '' ;
  StrPCopy(FiName, sPath + sDoc) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  If iTempResult <= 32 then
  begin
    {There was an error} ;
    sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
    Case iTempResult of
      ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
      ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
      ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
      SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
      SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
      SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
      SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
      SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
      SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
      SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
      SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
      SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
    end;
    MessageDlg(sTempError,mtError,[mbOK],0) ;
  end;
end;

procedure TfrmWTMaintSupplier.pmnuPasteClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanySupplierDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + edtSupplierName.text;

  {Find a document}
  CopyDocumentsFromClipboard(DocDir,
    procedure
    begin
      ShowDocuments;
    end);
end;

procedure TfrmWTMaintSupplier.pmnuDeleteClick(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
  iRow := lstvwDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (FunctionMode <> 'A') then
        begin
          sPath :=  dtmdlWorktops.GetCompanySupplierDirectory + '\' + edtSupplierName.Text + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
end;

procedure TfrmWTMaintSupplier.pmnuSelectAllClick(Sender: TObject);
var
  icount: integer;
begin
  with lstvwDocuments do
    begin
      Items.BeginUpdate;
      for icount := 0 to pred(items.count) do
        begin
          items[icount].selected := true ;
        end;
      Items.EndUpdate;
    end;
end;

procedure TfrmWTMaintSupplier.lstvwDocumentsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  TListView(Sender).SortType := stNone;
  if Column.Index <> SortedColumn then
    begin
      SortedColumn := Column.Index;
      Descending := False;
    end
  else
    Descending := not Descending;

  TListView(Sender).SortType := stText;

end;

procedure TfrmWTMaintSupplier.lstvwDocumentsCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if SortedColumn = 0 then
    Compare := CompareText(Item1.Caption, Item2.Caption)
  else
  if SortedColumn <> 0 then
    Compare := CompareText(Item1.SubItems[SortedColumn-1], Item2.SubItems[SortedColumn-1]);

  if Descending then
    Compare := -Compare;
end;

procedure TfrmWTMaintSupplier.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
  sPath := dtmdlWorktops.GetCompanySupplierDirectory + '\' + edtSupplierName.text + '\';
  if sPath = '' then
    exit;

  if lstvwDocuments.ItemIndex = -1 then
    begin
      sDoc := '';
      exit;
    end
  else
    begin
      sDoc := lstvwDocuments.Items[lstvwDocuments.ItemIndex].caption;
    end;

  Params := '' ;
  StrPCopy(FiName, sPath + sDoc) ;

  {Use the WINDOWS SHELL to open the document};
  iTempResult := ShellExecute(0,'open',FiName,Params, '', 1) ;
  If iTempResult <= 32 then
  begin
    {There was an error} ;
    sTempError := 'An error occured opening the document - (' + IntToStr(iTempResult) + ')' ;
    Case iTempResult of
      ERROR_FILE_NOT_FOUND : sTempError := 'Document not found' ;
      ERROR_PATH_NOT_FOUND: sTempError := 'Document directory not found' ;
      ERROR_BAD_FORMAT: sTempError := 'The document format is corrupt' ;
      SE_ERR_ACCESSDENIED: sTempError := 'You''re not allowed to access the document' ;
      SE_ERR_ASSOCINCOMPLETE: sTempError := 'The document association is incomplete' ;
      SE_ERR_DDEBUSY: sTempError := 'The document is being used (DDE)' ;
      SE_ERR_DDEFAIL: sTempError :=  'Could not access the document (DDE)' ;
      SE_ERR_DDETIMEOUT: sTempError :=  'Accessing the document took too long (DDE)' ;
      SE_ERR_DLLNOTFOUND: sTempError :=  'A missing DDE is required to access the document' ;
      SE_ERR_NOASSOC: sTempError := 'There is no application on your PC that can open this document' ;
      SE_ERR_OOM: sTempError := 'Your PC does not have enough memory to open this document' ;
      SE_ERR_SHARE: sTempError := 'The document is being accessed by someone else' ;
    end;
    MessageDlg(sTempError,mtError,[mbOK],0) ;
  end;
end;

procedure TfrmWTMaintSupplier.btnExcelClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
  docDir := dtmdlWorktops.GetCompanySupplierDirectory + '\' + edtSupplierName.text;
  compDir := dtmdlWorktops.GetCompanySupplierDirectory;

  okToSave := false;
  userCancelled := false;
  docsaved := false;

  if ((Sender as TToolButton) = btnWord) then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc; *.docx)|*.doc; *.docx';
    svDlgOfficeDoc.FileName := 'New Document';
  end
  else if ((Sender as TToolButton) = btnExcel) then
  begin
    docExt := '.xls';
    svDlgOfficeDoc.Filter := 'Excel Worksheet(*.xls)|*.xls';
    svDlgOfficeDoc.FileName := 'New Book';
  end
  else
  begin
    exit; //go no further
  end;

  svDlgOfficeDoc.InitialDir := docDir;
  svDlgOfficeDoc.DefaultExt := copy(docExt, 2, 3);

  while (okToSave = false) and (userCancelled = false) do
    begin
      //prompt user for file name
      if svDlgOfficeDoc.execute then
      begin
        //is file in default directory
        if (copy(svDlgOfficeDoc.FileName, 1, length(docDir)) = docDir) then
        begin
          //does file exists
          if fileExists(svDlgOfficeDoc.FileName) then
          begin
            MessageDlg('This file name already exists, please choose another file name.', mtWarning, [mbOK], 0);
            okToSave := false;
          end
          else
          begin
            okToSave := true;
          end;
        end
        else
        begin
          MessageDlg('You can''t save a document outside the Supplier Document Directory',
                                                mtError,[mbOK],0) ;
          svDlgOfficeDoc.FileName := '';
          svDlgOfficeDoc.InitialDir := docDir;
          okToSave := false;
        end;
      end
      else
      begin
        userCancelled := true;  //the user cancelled the save dialogue
      end;
    end;

  if (userCancelled = false) then
    begin
      sPath := copy(svDlgOfficeDoc.FileName, length(compdir)+1, length(svDlgOfficeDoc.FileName));

      {get file name}
      sfullFile := sPath;

      iLength := length(sFullFile);

      while i <> 0 do
        begin
          ipos := pos('\',sFullFile);
          sFullFile := stringreplace(sFullFile, '\', '!', []);

          i := pos('\',sFullFile);
        end;

      sFileName := copy(sPath, ipos+1, (iLength - ipos));

      if docExt = '.doc' then
      begin
        try
          WTWordOLEFrm := TWTWordOLEFrm.Create(self);
          WTWordOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          WTWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          WTExcelOLEFrm := TWTExcelOLEFrm.Create(self);
          WTExcelOLEFrm.SaveAsDocument(compDir+sPath);
          docSaved := true;
        finally
          WTExcelOLEFrm.Free;
        end;
      end;

      ShowDocuments;
      
      if docSaved then
      begin
        lstvwDocuments.itemindex := -1;
        for i := 0 to pred(lstvwDocuments.Items.count) do
          begin
            if lstvwDocuments.Items[i].caption = sFileName then
              lstvwDocuments.itemindex := i;
          end;
        if lstvwDocuments.itemindex >= 0 then
          lstvwDocumentsDblClick(self);
      end;
    end
    else
    begin
    end;
end;

procedure TfrmWTMaintSupplier.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  WTMaintEmailFrm := TWTMaintEmailFrm.create(self);
  try
    WTMaintEmailFrm.Supplier := Supplier;
    WTMaintEmailFrm.SupplierBranch := 0;
    WTMaintEmailFrm.SupplierContact := 0;
    WTMaintEmailFrm.AddressType := 1;
    WTMaintEmailFrm.Customer := 0;
    WTMaintEmailFrm.CustomerBranch := 0;
    WTMaintEmailFrm.CustomerContact := 0;
    WTMaintEmailFrm.showmodal;
    if WTMaintEmailFrm.modalresult = idOK then
      begin
        sTo := WTMaintEmailFrm.edtEmail.text;
        sSubject := WTMaintEmailFrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    WTMaintEmailFrm.free;
  end;
end;

procedure TfrmWTMaintSupplier.btnAttachClick(Sender: TObject);
var
  DocDir: string;
begin
  DocDir := dtmdlWorktops.GetCompanySupplierDirectory;
  DocDir := IncludeTrailingPathDelimiter(DocDir) + edtSupplierName.Text;

  CopyDocuments(DocOpenDialog, DocDir,
    procedure
    begin
      ShowDocuments;
    end);
end;

procedure TfrmWTMaintSupplier.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
begin
  docDir := dtmdlWorktops.GetCompanySupplierDirectory + '\' + edtSupplierName.text;
  compDir := dtmdlWorktops.GetCompanySupplierDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try

  finally
    IniFile.Free;
  end;

  sBody := '';
  sfilePath := trim(docdir);
  okToSave := false;

  EmailAndSaveViaOutlook(sTo, sSubject, sBody, sFilePath, okToSave, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

  if okToSave then
    begin
       ShowDocuments;
    end;
end;

procedure TfrmWtMaintSupplier.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      Supplier := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      parambyname('Supplier').asinteger := Supplier;
      parambyname('Supplier_Name').asstring := edtSupplierName.Text;
      parambyname('Street').asstring := edtStreet.Text;
      parambyname('Locale').asstring := edtLocale.Text;
      parambyname('Town_City').asstring := edtTownCity.Text;
      parambyname('Postcode').asstring := edtPostcode.Text;

      parambyname('County_State').asstring := edtCountyState.Text;
      parambyname('Telephone_Number').asstring := edtTelephoneNumber.Text;
      parambyname('Fax_Number').asstring := edtFaxNumber.Text;

      parambyname('Web_Address').asstring := edtWebAddress.Text;
      parambyname('Email_Address').asstring := edtEmailAddress.Text;

      parambyname('Discount_Percentage').asfloat := StrToFloatDef(edtDiscountPercentage.Text, 0, FormatSettings);

      parambyname('Account_Code').asstring := edtAccountCode.Text;

      if chkbxInactive.Checked then
        parambyname('inActive').asstring := 'Y'
      else
        parambyname('inActive').asstring := 'N';

      execsql;
    end;
  end;
end;

function TfrmWTMaintSupplier.GetFilesPath: string;
begin
  Result := dtmdlWorktops.GetCompanySupplierDirectory + '\' + edtSupplierName.text +'\';
end;

function TfrmWtMaintSupplier.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert Supplier record
    with qryAdd do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Supplier').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintSupplier.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Supplier ' +
            '(Supplier, Supplier_Name) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintSupplier.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Supplier Where Supplier = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintSupplier.DropComboTarget1Drop(Sender: TObject; ShiftState: TShiftState; APoint: TPoint;
  var Effect: Integer);
begin
  var TargetPath := GetFilesPath;
  DropComboTarget1.SaveDroppedFiles(TargetPath, ShowDocuments);
end;

end.
