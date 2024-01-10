unit WTMaintContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, ExtCtrls, Grids, WTContractsDM,
  ToolWin, ImgList, Menus, wtNotesDM, wtQuotesDM, ShellAPI, DateSelV5, Inifiles,
  Activex, AxCtrls, Clipbrd, ComObj, taoMAPI,
  CRControls, System.ImageList;

type
  TfrmWTMaintContract = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    edtNumber: TEdit;
    dblkpOperator: TDBLookupComboBox;
    dtpckDate: TDateTimePicker;
    stsbrDetails: TStatusBar;
    pnlBottom: TPanel;
    lblDeleteprompt: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    pnlHeader: TPanel;
    Label16: TLabel;
    btnCustomer: TBitBtn;
    edtCustomerName: TEdit;
    Label3: TLabel;
    edtDeveloper: TEdit;
    Label4: TLabel;
    edtLocation: TEdit;
    pcDetails: TPageControl;
    tsQuotes: TTabSheet;
    tsDocuments: TTabSheet;
    sgDetails: TStringGrid;
    imgIcons: TImageList;
    imgDocuments: TImageList;
    Panel12: TPanel;
    Label44: TLabel;
    lblNotes: TLabel;
    lstvwDocuments: TListView;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    btnExcel: TToolButton;
    btnWord: TToolButton;
    btnEmail: TToolButton;
    btnAttach: TToolButton;
    chkbxInactive: TCheckBox;
    pmnLines: TPopupMenu;
    mnuAddDrawing: TMenuItem;
    mnuDeleteDrawing: TMenuItem;
    N1: TMenuItem;
    mnuInsertQuote: TMenuItem;
    pmnDummy: TPopupMenu;
    Label5: TLabel;
    edtDescription: TEdit;
    mnuChangeQuote: TMenuItem;
    N2: TMenuItem;
    mnuEditOption: TMenuItem;
    N3: TMenuItem;
    mnuAddOption: TMenuItem;
    mnuDeleteOption: TMenuItem;
    mnuCreateOrder: TMenuItem;
    mnuDeleteQuote: TMenuItem;
    btnSave: TBitBtn;
    svDlgOfficeDoc: TSaveDialog;
    DocOpenDialog: TOpenDialog;
    pnlNotes: TPanel;
    memNotes: TMemo;
    Panel2: TPanel;
    bynSpecialInstructions: TBitBtn;
    mnuLinkQuote: TMenuItem;
    Label6: TLabel;
    btnContactSearch: TBitBtn;
    btnContactClear: TSpeedButton;
    edtContact: TEdit;
    mnuReQuote: TMenuItem;
    NextOption1: TMenuItem;
    RemainingOptions1: TMenuItem;
    tsEvents: TTabSheet;
    Panel9: TPanel;
    pnlEventFunc: TPanel;
    btnAddEvents: TBitBtn;
    btnChangeEvents: TBitBtn;
    btnDeleteEvents: TBitBtn;
    pnlEvents: TPanel;
    memEventNotes: TMemo;
    sgEvents: TStringGrid;
    pnlDrawings: TPanel;
    Panel4: TPanel;
    lstvwLineDocuments: TListView;
    Panel3: TPanel;
    Label8: TLabel;
    edtSupplierReference: TEdit;
    Panel5: TPanel;
    btnLineAttach: TBitBtn;
    pmnuLineDocuments: TPopupMenu;
    pmnuOpenLineDocument: TMenuItem;
    MenuItem2: TMenuItem;
    mnuAddToOrder: TMenuItem;
    Label7: TLabel;
    edtQuoteValue: TMemo;
    cmbOptions: TComboBox;
    Label10: TLabel;
    lblExpiryDate: TLabel;
    edtExpiryDate: TEdit;
    btnExpiryDate: TBitBtn;
    SpeedButton4: TSpeedButton;
    mnuAddSingleDrawing: TMenuItem;
    mnuAddMultipleDrawings: TMenuItem;
    mnuCopyDrawing: TMenuItem;
    Label11: TLabel;
    memUnits: TMemo;
    pmnuDocuments: TPopupMenu;
    pmnuOpen: TMenuItem;
    pmnuPaste: TMenuItem;
    pmnuDelete: TMenuItem;
    MenuItem1: TMenuItem;
    pmnuSelectAll: TMenuItem;
    Paste1: TMenuItem;
    N4: TMenuItem;
    SelectAll1: TMenuItem;
    pnlPriceChange: TPanel;
    Label12: TLabel;
    edtMarkup: TCREditFloat;
    N5: TMenuItem;
    mnuPriceChange: TMenuItem;
    mnuPriceChangeOption: TMenuItem;
    mnuPriceOptionDrawing: TMenuItem;
    mnuPriceOptionAll: TMenuItem;
    N6: TMenuItem;
    mnuPriceOptionUndo: TMenuItem;
    Label13: TLabel;
    Label14: TLabel;
    edtSiteContact: TEdit;
    edtSitePhone: TEdit;
    pnlRevenueCentre: TPanel;
    Label59: TLabel;
    SpeedButton1: TSpeedButton;
    dblkpRevenueCentre: TDBLookupComboBox;
    chkbxOverridePrices: TCheckBox;
    procedure btnCustomerClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDeveloperChange(Sender: TObject);
    procedure edtLocationChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure pmnLinesPopup(Sender: TObject);
    procedure sgDetailsSelectCell(Sender: TObject; Col, Row: Integer;
      var CanSelect: Boolean);
    procedure sgDetailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure mnuEditOptionClick(Sender: TObject);
    procedure mnuAddOptionClick(Sender: TObject);
    procedure mnuDeleteDrawingClick(Sender: TObject);
    procedure sgDetailsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuDeleteOptionClick(Sender: TObject);
    procedure mnuInsertQuoteClick(Sender: TObject);
    procedure mnuChangeQuoteClick(Sender: TObject);
    procedure mnuCreateOrderClick(Sender: TObject);
    procedure mnuDeleteQuoteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAttachClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnWordClick(Sender: TObject);
    procedure lstvwDocumentsDblClick(Sender: TObject);
    procedure mnuDeleteDocumentClick(Sender: TObject);
    procedure mnuOpenDocumentClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure bynSpecialInstructionsClick(Sender: TObject);
    procedure mnuLinkQuoteClick(Sender: TObject);
    procedure btnContactSearchClick(Sender: TObject);
    procedure btnContactClearClick(Sender: TObject);
    procedure NextOption1Click(Sender: TObject);
    procedure RemainingOptions1Click(Sender: TObject);
    procedure sgEventsClick(Sender: TObject);
    procedure sgEventsDblClick(Sender: TObject);
    procedure btnAddEventsClick(Sender: TObject);
    procedure btnChangeEventsClick(Sender: TObject);
    procedure btnDeleteEventsClick(Sender: TObject);
    procedure edtSupplierReferenceChange(Sender: TObject);
    procedure btnLineAttachClick(Sender: TObject);
    procedure pmnuOpenLineDocumentClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure lstvwLineDocumentsDblClick(Sender: TObject);
    procedure mnuAddToOrderClick(Sender: TObject);
    procedure edtCustomerNameClick(Sender: TObject);
    procedure edtContactChange(Sender: TObject);
    procedure cmbOptionsClick(Sender: TObject);
    procedure edtExpiryDateExit(Sender: TObject);
    procedure btnExpiryDateClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure mnuAddSingleDrawingClick(Sender: TObject);
    procedure mnuAddMultipleDrawingsClick(Sender: TObject);
    procedure mnuCopyDrawingClick(Sender: TObject);
    procedure memUnitsChange(Sender: TObject);
    procedure memUnitsExit(Sender: TObject);
    procedure memUnitsEnter(Sender: TObject);
    procedure lstvwDocumentsColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure lstvwDocumentsCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure pmnuDocumentsPopup(Sender: TObject);
    procedure pmnuPasteClick(Sender: TObject);
    procedure pmnuDeleteClick(Sender: TObject);
    procedure pmnuSelectAllClick(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure mnuPriceChangeOptionClick(Sender: TObject);
    procedure mnuPriceOptionDrawingClick(Sender: TObject);
    procedure mnuPriceOptionAllClick(Sender: TObject);
    procedure mnuPriceOptionUndoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSiteContactChange(Sender: TObject);
    procedure edtSitePhoneChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dblkpRevenueCentreClick(Sender: TObject);
    procedure sgDetailsKeyPress(Sender: TObject; var Key: Char);
  private
    Descending: Boolean;
    SortedColumn: Integer;
    iLine: integer;
    FActivated: boolean;
    FContract: TContract;
    FMode: TcqMode;
    FContractLine: TContractLine;
    sOldValue: string;
    procedure SetContract(const Value: TContract);
    procedure SetMode(const Value: TcqMode);
    procedure SetGridHeaders;
    procedure ShowDetails;
    procedure ShowDocuments;
    procedure ShowLineDocuments;
    procedure ShowListViewDocuments(strPath: string; ListView: TListView;
      ImageList: TImageList);
    procedure BuildEventGrid;
    procedure BuildLineGrid;
    procedure ShowEvents;
    procedure ShowLineDetails;
    procedure CreateFirstLine;
    procedure ClearGrid(TempGrid: TStringGrid);
    function AddSOrderAddress(tempNotes: string): Integer;
    function UpdateNotes: Integer;
    procedure CallMaintScreen(aMode: TqMode);
    procedure SendAndSaveEmail(sTo, sSubject: string);
    procedure GetNotes(iNarrative: Integer);
    procedure CallMaintEvent(aMode: TcqevMode);
    procedure SetContractLine(const Value: TContractLine);
    procedure MoveContractLineDocuments(rContract: real; iLine: integer; rQuote: real);
    procedure MoveContractLineDocumentsToQuote(rContract: real; iLine: integer; rQuote: real);
    procedure MoveContractLineDocumentsToSalesOrder(rContract: real; iLine: integer; rSalesOrder: real);
    procedure MoveOriginalContractDocuments;
    procedure ConvertToTradeCustomer(ContractOption: TContractOption);
    procedure LoadOptionCombo;
    function InputDate(TempDate: TDateTime): TDateTime;
    function FormatDateasDateTime(sDate: string): TDateTime;
    function ParseDocumentFrom(tmpFrom: string): string;
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
    procedure CallMaintMarkup(MarkupType: string);
    procedure MarkupColumn(iCol: integer;  rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
    procedure MarkupQuote(iCol, iRow: integer; ContractOption: TContractOption; key: integer; rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
    procedure MarkupRow(iRow: integer;  rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
    procedure MarkupContract(rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
    procedure ParseInstallationAddress;
    { Private declarations }
  public
    sAddress: array [1..10] of string;
    bOK: boolean;
    OriginalReQuote: real;
    property Contract: TContract read FContract write SetContract;
    property ContractLine: TContractLine read FContractLine write SetContractLine;
    property Mode: TcqMode read FMode write SetMode;
  end;

var
  frmWTMaintContract: TfrmWTMaintContract;
  dtmdlAllQuote: TdtmdlQuote;

implementation

uses
  System.UITypes, System.Types,
  WTSrchCustomer, wtMain, wtDataModule, AllCommon, WTMaintContractOption, WtMaintQuote, WTMaintContractConvertOrder,
  WTSalesOrderDM, wtMaintSalesOrder, WTWordOLE, WTExcelOLE, WTMaintEmail, WTLUSpecialInstruction, WTLUContractQuotes,
  WTSrchCustContacts, WTMaintContractEvents, WTMaintContractAddress,
  WTMaintContractLines, WTMaintContractMarkup, WTLUCustomerSite;

{$R *.dfm}

procedure TfrmWTMaintContract.btnCustomerClick(Sender: TObject);
begin
  if (Mode = cqCopy) or (Mode = cqChange) then
    begin
      messagedlg('The customer cannot be changed as price options are specific to the existing customer.',mtWarning, [mbOK], 0);
      exit;
    end;

  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Contract.Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        Contract.Customer := frmwtSrchCustomer.CodeSelected;
        Contract.CustomerName := frmwtSrchCustomer.NameSelected;
        edtCustomerName.text := frmwtSrchCustomer.NameSelected;

        Contract.Speculative := frmwtSrchCustomer.Speculative;

        if (not Contract.Speculative) then
          begin
            edtCustomerName.readOnly := true;
          end
        else
          begin
            edtCustomerName.readOnly := true;
          end;
      end
  finally
    frmwtSrchCustomer.free;
  end;
end;

procedure TfrmWTMaintContract.SetContract(const Value: TContract);
begin
  FContract := Value;
end;

procedure TfrmWTMaintContract.SetMode(const Value: TcqMode);
begin
  FMode := Value;
end;

procedure TfrmWTMaintContract.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    with Contract.DataModule do
    begin
      qryOperator.close;
      qryOperator.open;
    end;

    with Contract.DataModule do
    begin
      dblkpRevenueCentre.listsource := dtsRevenueCentre;
      qryRevenueCentre.close;
      qryRevenueCentre.open;
      qryRevenueCentre.First;
    end;

    case Mode of
    cqAdd     : Caption := 'Add a Contract Quote';
    cqChange  : Caption := 'Change a Contract Quote';
    cqDelete  : Caption := 'Delete a Contract Quote';
    cqCopy   : Caption := 'Copy a Contract Quote';
    cqRequote   : Caption := 'Requote a Contract Quote';
    end;  { case }

    if (Mode = cqAdd)  or (Mode = cqCopy) or (Mode = cqRequote) then
      sTemp := ' New Contract Quote '
    else
      sTemp := ' Contract Quote ' + floatToStr(Contract.QuoteNumber) + ' ';

    if (Mode = cqCopy) or (Mode = cqRequote) then
      begin
        Contract.DbKey := 0;
        OriginalReQuote := Contract.QuoteNumber;
      end;

    ShowDetails;
    ShowLineDetails;
    ShowEvents;
    LoadOptionCombo;

    if Mode <> cqCopy then
      begin
        ShowDocuments;
      end;

(*    if (Mode = qRequote) then
      ShowDocuments(OriginalQuoteFromReQuote)
    else
      ShowDocuments(Quote.dbKey);
*)

    {Had to put this in because the components were losing the Listdatasource}
    dblkpOperator.ListSource := Contract.DataModule.dtsOperator;

    pnlPriceChange.visible := Contract.AllowPriceChange;
    
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintContract.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  iLine := 0;
  dtmdlAllQuote := TdtmdlQuote.create(Application);
  SetGridHeaders;

  pcDetails.ActivePage := tsQuotes;
  pnlRevenueCentre.Visible := dtmdlWorktops.UseRevenueCentres;

  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintContract.SetGridHeaders;
begin
  {Drawing header}
  sgDetails.cells[1,0] := 'Drawing No.';
  sgDetails.cells[2,0] := 'Option 1';
  sgDetails.cells[3,0] := 'Option 2';
  sgDetails.cells[4,0] := 'Option 3';
  sgDetails.cells[5,0] := 'Option 4';

  {Event header}
  sgEvents.cells[0,0] := 'No';
  sgEvents.cells[1,0] := 'Date/Time';
  sgEvents.cells[2,0] := 'Operator';
end;

procedure TfrmWTMaintContract.ShowDetails;
begin
  if Mode = cqAdd then
    begin
      edtNumber.text := '<New Order>';
      dtpckDate.Date := date;
      edtExpiryDate.Text := '';
      dblkpOperator.KeyValue := frmWtMain.Operator;
      edtLocation.Text := '';
      edtSiteContact.Text := '';
      edtSitePhone.Text := '';
      edtCustomerName.text := '';
      edtContact.text := '';

      btnLineAttach.Visible := false;

      if dtmdlWorktops.UseRevenueCentres then
        begin
          dblkpRevenueCentre.KeyValue := dtmdlWorktops.GetOperatorRevenueCentre(frmWTMain.Operator);
          Contract.RevenueCentre := dblkpRevenueCentre.KeyValue;
        end
      else
        begin
          dblkpRevenueCentre.KeyValue := 0;
          Contract.RevenueCentre := 0;
        end;

    end
  else
    begin
      if Contract.dbKey = 0 then
        begin
          edtNumber.text := '<New Order>';
          dtpckDate.Date := date;
          edtExpiryDate.text := '';
          Contract.Operator := frmWTMain.Operator;
          Contract.OperatorName := frmWTMain.OperatorName;
        end
      else
        begin
//          edtNumber.text := inttostr(Contract.dbKey);
          edtNumber.text := floattostr(Contract.QuoteNumber);
          dtpckDate.Date := Contract.ContractDate;
          edtExpiryDate.Text := paDateStr(Contract.ExpiryDate);
//          dtmdlWorktops.CreateContractDocDirectory(inttostr(Contract.dbKey));
          dtmdlWorktops.CreateContractDocDirectory(floattostr(Contract.QuoteNumber));
        end;
      edtCustomerName.text := Contract.CustomerName;
      edtContact.text := Contract.ContactName;
      edtDeveloper.text := Contract.Developer;

      edtLocation.text := Contract.SiteLocation;
      edtSiteContact.Text := Contract.SiteContact;
      edtSitePhone.Text := Contract.SitePhone;
      edtDescription.text := Contract.Description;

      memNotes.text := Contract.NarrativeText;

      if Contract.AccountManager = 0 then
        dblkpOperator.KeyValue :=  frmWTMain.Operator
      else
        dblkpOperator.KeyValue :=  Contract.AccountManager;

      dblkpRevenueCentre.keyvalue := Contract.RevenueCentre;

      chkbxinactive.Checked := (Contract.inactive = 'Y');

      btnLineAttach.Visible := true;
      stsbrDetails.Panels[0].Text := 'Created by: ' + Contract.OperatorName;
    end;

  pnlTop.enabled := not(Mode = cqView) and not(Mode = cqDelete);
  pnlHeader.enabled := not(Mode = cqView) and not(Mode = cqDelete);
  sgDetails.Enabled := not(Mode = cqView) and not(Mode = cqDelete);
  pnlDrawings.enabled := not(Mode = cqView) and not(Mode = cqDelete);
  tsDocuments.enabled := not(Mode = cqView) and not(Mode = cqDelete) and not(Mode = cqCopy) and not(Mode = cqRequote);
  tsEvents.enabled := not(Mode = cqView) and not(Mode = cqDelete) and not(Mode = cqCopy) and not(Mode = cqRequote);

  chkbxOverridePrices.Visible := Mode = cqChange;
  btnLineAttach.Visible := not(Mode = cqCopy)and not(Mode = cqRequote);
  btnOK.Visible := not(Mode = cqView);
  btnSave.Visible := (Mode = cqAdd) or (Mode = cqCopy) or (Mode = cqRequote);
  lbldeleteprompt.visible := (Mode = cqDelete);
  if (Mode = cqView) or (Mode = cqDelete) then
    begin
      sgDetails.popupMenu := pmnDummy;
    end;
end;

procedure TfrmWTMaintContract.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (dblkpOperator.keyvalue <> null) and
                    (edtCustomerName.Text <> '') and
                    (edtDeveloper.Text <> '') and
                    (edtLocation.Text <> '') and
                    (edtDescription.Text <> '');
  btnSave.enabled := btnOK.enabled;
end;

procedure TfrmWTMaintContract.edtDeveloperChange(Sender: TObject);
begin
  Contract.Developer := edtDeveloper.text;
  CheckOK(self);
end;

procedure TfrmWTMaintContract.edtLocationChange(Sender: TObject);
begin
  Contract.SiteLocation := edtLocation.text;
  CheckOK(self);
end;

procedure TfrmWTMaintContract.btnOKClick(Sender: TObject);
begin
  btnSaveClick(Self);
  if bOK then
    ModalResult := mrOK;
end;

procedure TfrmWTMaintContract.edtDescriptionChange(Sender: TObject);
begin
  Contract.Description := edtDescription.text;
  CheckOK(self);
end;

procedure TfrmWTMaintContract.ShowLineDetails;
begin
  if Mode = cqAdd then
    begin
      ClearGrid(sgDetails);  {Clear contents of Line grid}
      CreateFirstLine;
      BuildLineGrid;
    end
  else
    begin
      BuildLineGrid;
    end;
end;

procedure TfrmWTMaintContract.ShowEvents;
begin
  ClearGrid(sgEvents);  {Clear contents of Line grid}
  BuildEventGrid;
  sgEventsClick(self);
end;

procedure TfrmWTMaintContract.BuildEventGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEvents, Contract.datamodule do
    begin
      for i := 0 to pred(Contract.Events.count) do
        begin
        cells[0,i+1] := inttostr(Contract.Events[i].EventNumber);
        cells[1,i+1] := paDateStr(Contract.Events[i].DateEntered);
        cells[2,i+1] := Contract.Events[i].OperatorName;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeEvents.enabled := not (Contract.Events.count = 0);
  btnDeleteEvents.enabled := not (Contract.Events.count = 0);
end;

procedure TfrmWTMaintContract.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
    for irow := 1 to pred(rowcount) do
      for icol := 0 to pred(colcount) do
        cells[icol,irow] := '';
    rowcount := 2;
    end;
end;

procedure TfrmWTMaintContract.BuildLineGrid;
var
  irow, icol, icount: integer;
  aLine: TContractLine;
begin
  icount := 0;

  with sgDetails, Contract.datamodule do
    begin
      for irow := 0 to pred(Contract.Lines.count) do
        begin
          cells[0,irow+1] := inttostr(irow+1);
          cells[1,irow+1] := Contract.Lines[irow].DrawingNumber;

          aLine := Contract.Lines[irow];

          if irow = 0 then
            colcount := aLine.Options.count + 2;

          for icol := 0 to pred(aLine.Options.count) do
            begin
              if trim(aLine.Options[icol].Description) = '' then
                cells[icol+2,0] := 'Option ' + inttostr(icol+1)
              else
                cells[icol+2,0] := aLine.Options[icol].Description;

{This try.. except.. end wrapper put in to catch any corruption in the contract options - Added 20/2/2019
Bellagio had a problem where some lines had 2 options and others had 3
This code removes any options greater than in line 1}

              try
                colwidths[icol+2] := 150;

                cells[icol+2, irow+1] := formatfloat('£#,##0.00',(aLine.Options[icol].NettPrice + aLine.Options[icol].InstallPrice + aLine.Options[icol].SurveyPrice +
                                                                  aLine.Options[icol].DeliveryPrice - aLine.Options[icol].DiscountValue + aLine.Options[icol].MarkupValue));

//                if not AllowPriceChange then
//                  self.AllowPriceChange := (aLine.Options[icol].QuoteMarkup <> 0);
              except
                aLine.Options.delete(icol);
              end;
            end;

          dtmdlWorktops.CreateContractDocDirectory(floattostr(Contract.QuoteNumber) + '\' + inttostr(aLine.Line));
          icount := icount + 1;
        end;
{---------------------------------------------------------------}

      if icount = 0 then
        begin
          cells[0,1] := '1';
          rowcount := 2;
        end
      else
        rowcount := icount + 1;
    end;
end;

procedure TfrmWTMaintContract.pmnLinesPopup(Sender: TObject);
begin
  mnuInsertQuote.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
  mnuChangeQuote.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
  mnuDeleteQuote.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
  mnuReQuote.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
  mnuLinkQuote.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
  mnuPriceChange.Visible := (sgDetails.Col > 0) and (sgDetails.Row > 0) and Contract.AllowPriceChange;

  mnuCreateOrder.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
  mnuAddToOrder.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));

  mnuEditOption.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
//  mnuDeleteOption.Visible := (sgDetails.Col > 1) and ((Mode <> cqCopy) and (Mode <> cqRequote));
end;

procedure TfrmWTMaintContract.sgDetailsSelectCell(Sender: TObject; Col,
  Row: Integer; var CanSelect: Boolean);
begin
{Cell Override}
  if (Col = 1) then
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
  if chkbxOverridePrices.checked then
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing,goEditing]
  else
    sgDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing];
end;

function TfrmWTMaintContract.UpdateNotes: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := Contract.ExtraNotes;
    Notes.DataInfo := memNotes.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWTMaintContract.AddSOrderAddress(tempNotes: string): Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := 0;
    Notes.DataInfo := tempNotes;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

procedure TfrmWTMaintContract.sgDetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  irow, iCol: integer;
  bShowDocuments: boolean;
  ContractOption: TContractOption;
  S: string;
  SavedAlign: Cardinal;
begin
  bShowDocuments := (iLine <> ARow) and (Mode <> cqCopy);

  iLine := ARow;

  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (ACol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
    end;
  end;

  with Sender as TStringGrid, Canvas do
  begin
    if (gdselected in State) then
    begin
      //draw a box around the selected cell
      pen.Color := clred;
      pen.Width := 2;
      polyline([point(rect.left+1,rect.top+1),
                point(rect.right-2,rect.top+1),
                point(rect.right-2,rect.bottom-2),
                point(rect.left+1,rect.bottom-2),
                point(rect.left+1,rect.top+1)]);
    end;
    if (ARow = 0) then
    begin
      //default drawing has been switched off in the grid so we have
      //to draw the highlight and shadow on 3d boxes
      pen.color := clBtnHighlight;
      polyline([point(rect.left,rect.bottom-1),
                point(rect.left,rect.top),
                point(rect.right,rect.top)]);
      pen.color := clBtnShadow;
      polyline([point(rect.right-1,rect.top+1),
                point(rect.right-1,rect.bottom-1),
                point(rect.left,rect.bottom-1)]);
    end;
  end;

  irow := sgDetails.Row;
  iCol := sgDetails.Col;

  edtMarkup.Text := '';
  ContractLine := Contract.Lines[irow-1];
  if iCol > 1 then
  begin
    ContractOption := ContractLine.Options[iCol-2];
    edtMarkup.Text := formatfloat('0.00%',ContractOption.QuoteMarkup);
  end;

  if bShowDocuments then
  begin
    ShowLineDocuments;
    edtSupplierreference.Text := ContractLine.SupplierReference;
    memUnits.Text := formatfloat('0',ContractLine.NumberofUnits);
  end;

  if (ARow > 0) and (ACol > 1) then
  begin
    var Text := sgDetails.Cells[ACol,ARow];
    var WidthOfText := sgDetails.Canvas.TextWidth(Text);
    var WidthOfCell := sgDetails.ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText;

    sgDetails.Canvas.TextRect(Rect, Rect.Left+LeftOffset, Rect.Top, Text);
  end;
end;

procedure TfrmWTMaintContract.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
        begin
          if Col = pred(colcount) then
          begin
            col := 1;
            if row = pred(rowcount) then
              row := 1
            else
              row := row + 1;
            Exit;
          end
          else
          begin
            col := col + 1;
            Exit;
          end
        end;
end;

procedure TfrmWTMaintContract.FormDestroy(Sender: TObject);
begin
  dtmdlAllQuote.free;
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintContract.mnuEditOptionClick(Sender: TObject);
var
  frm: TfrmWTMaintContractOption;
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
  irow, icol: integer;
begin
  icol := sgdetails.Col;
  irow := sgDetails.Row;

  Frm := TfrmWTMaintContractOption.create(self);

  try
    ContractLine := Contract.lines[irow-1];
    ContractOption := ContractLine.Options[icol-2];

    frm.mode := cqoChange;

    if (ContractOption.Quote <> 0) and (Mode <> cqCopy) then
      begin
        if messagedlg('The drawing for this option has been quoted and therefore certain details cannot be edited. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            frm.mode := cqoRename;
          end
        else
          exit;
      end;

    frm.dblkpOptions.KeyValue := ContractOption.Group;
    frm.dblkpThickness.KeyValue := ContractOption.Thickness;
    frm.edtQuoteDescription.text := ContractOption.Quotedescription;
    frm.edtdescription.text := ContractOption.Description;

    frm.customer := Contract.Customer;
    frm.customerName := Contract.CustomerName;


    Frm.showmodal;
    if frm.bOK = true then
      begin
        for irow := 0 to pred(Contract.Lines.count) do
          begin
            ContractLine := Contract.lines[irow];
            ContractOption := ContractLine.Options[icol-2];
            ContractOption.Description := frm.edtDescription.text;
            ContractOption.Group := frm.dblkpOptions.keyvalue;
            ContractOption.Thickness := frm.dblkpThickness.keyvalue;
            ContractOption.QuoteDescription := frm.edtQuoteDescription.text;

            sgDetails.Cells[icol,0] := frm.edtDescription.text;
          end;
      end;
  finally
    Frm.free;
  end;
end;

procedure TfrmWTMaintContract.mnuAddOptionClick(Sender: TObject);
var
  frm: TfrmWTMaintContractOption;
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
  iCol, iRow, iCount: integer;
begin
  if ContractLine.Options.count = 7 then
    begin
      messagedlg('A new option cannot be added, there are a maximum of 7 options already.', mtWarning, [mbOk], 0);
      exit;
    end;

  Frm := TfrmWTMaintContractOption.create(self);

  try
    with sgDetails do
      begin
        icol := col;
        iRow := row;

        for icount := 0 to pred(Contract.Lines.count) do
          begin
            ContractLine := Contract.Lines[icount];

            with ContractLine do
              begin
                ContractOption := TContractOption.Create(ContractLine);
                ContractOption.OptionNumber := ContractLine.Options.count + 1;
                ContractOption.Description := 'Option ' + inttostr(ContractOption.OptionNumber);
                if ContractOption.OptionNumber > 1 then
                  ContractOption.Quotedescription := ContractLine.Options[ContractOption.OptionNumber-2].Quotedescription;
                Options.Add(ContractOption);
              end;
          end;

        frm.customer := Contract.Customer;
        frm.customerName := Contract.CustomerName;
        frm.edtDescription.Text := '';
        frm.edtQuoteDescription.text := ContractOption.Quotedescription;

        frm.mode := cqoAdd;

        Frm.showmodal;
        if frm.bOK = true then
          begin
            for iCount := 0 to pred(Contract.Lines.count) do
              begin
                ContractLine := Contract.lines[iCount];
                ContractOption := ContractLine.Options[pred(ContractLine.Options.count)];
                ContractOption.Description := frm.edtDescription.text;
                ContractOption.Group := frm.dblkpOptions.keyvalue;
                ContractOption.Thickness := frm.dblkpThickness.keyvalue;
                ContractOption.QuoteDescription := frm.edtQuoteDescription.text;
                ContractOption.MaterialType := frm.MaterialType;

                sgDetails.Cells[(ContractLine.Options.count)+1,0] := frm.edtDescription.text;

                LoadOptionCombo;
              end;
          end
        else
          begin
            for iCount := 0 to pred(Contract.Lines.count) do
              begin
                ContractLine := Contract.lines[iCount];
                ContractLine.Options.Delete(pred(ContractLine.Options.count));
              end;
          end;

        ClearGrid(sgDetails);
        BuildLineGrid;

        row := irow;
        col := icol;
      end;
    finally
      frm.Free;
    end;

end;

procedure TfrmWTMaintContract.LoadOptionCombo;
var
  icount, iLowest: integer;
  rLowestValue, rValue: real;
begin
  ContractLine := Contract.Lines[0];

  iLowest := 0;
  rLowestValue := 10000000;

  with cmbOptions do
    begin
      clear;
      for iCount := 0 to pred(ContractLine.Options.count) do
        begin
          try
            rValue := Contract.GetOptionTotals(iCount);
          except
            rValue := 0;
          end;
          
          cmbOptions.Items.Add(ContractLine.Options[iCount].Description + ' (' + formatfloat('£#,##0.00', rValue) + ')');

          if (rValue < rLowestValue) and (rValue <> 0) then
            begin
              iLowest := iCount;
              rLowestValue := rValue;
            end
        end;
    end;

  try
    cmbOptions.ItemIndex := iLowest;
    cmbOptionsClick(self);
  except
  end;
end;


procedure TfrmWTMaintContract.mnuDeleteDrawingClick(Sender: TObject);
var
  iColumn, iRow, iCount: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
  aQuote: TQuote;
  iReason: integer;
begin
  if messagedlg('Delete the selected drawing?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      iReason := dtmdlWorktops.GetContractInactiveReason;

      with sgDetails do
        begin
          icolumn := col;
          iRow := row;

          ContractLine := Contract.Lines[irow-1];

          for iCount := 0 to pred(ContractLine.options.count) do
            begin
              if ContractLine.Options[iCount].Quote <> 0 then
                begin
                  {Delete individual quotes}
                  aQuote := TQuote.Create(dtmdlAllQuote);
                  try
                    aQuote.DbKey := ContractLine.Options[iCount].Quote;
                    aQuote.LoadFromDB;
                    aQuote.inactive := 'Y';
                    aQuote.Reason := iReason;
                    aQuote.SaveToDB(true);
                  finally
                    aQuote.free;
                  end;
                end;
            end;

          {Delete any documents}
          for iCount := 0 to pred(lstvwLineDocuments.items.count) do
            begin
              ListItem := lstvwLineDocuments.items[iCount];
              sFileName := ListItem.caption;

              lstvwLineDocuments.Items.Delete(iCount);

              //Delete the actual file only if not Converting or adding as we don't know the directory name
//              sPath :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbkey) + '\' + inttostr(ContractLine.Line) + '\';
              sPath :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' + inttostr(ContractLine.Line) + '\';

              //copy the file
              deletefile(sPath+sfileName);
            end;

          ContractLine.Parent.Lines.Delete(iRow-1);

          ClearGrid(sgDetails);
          BuildLineGrid;

          try
            row := irow;
            col := icolumn;
          except
            row := irow - 1;
          end;
        end;
    end;
end;

procedure TfrmWTMaintContract.sgDetailsKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  irow, icolumn: integer;
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
begin
  with sgDetails do
    begin
      irow := row;
      ContractLine := Contract.Lines[irow-1];
      ContractLine.DrawingNumber := cells[1,irow];

{cell override}
      if iColumn > 1 then
        begin
          ContractOption := ContractLine.Options[iColumn-2];

          with ContractOption do
            begin
              try
                cellvalue := strtofloat(cells[icolumn, irow]);
              except
                cellvalue := NettPrice + InstallPrice + SurveyPrice + DeliveryPrice - DiscountValue + MarkupValue;
              end;
            end;
        end;
    end;

  edtSupplierreference.Text := ContractLine.SupplierReference;
  memUnits.Text := formatfloat('0',ContractLine.NumberOfUnits);
end;

procedure TfrmWTMaintContract.mnuDeleteoptionClick(Sender: TObject);
var
  iColumn, iRow, icount: integer;
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
  aQuote: TQuote;
  iReason: integer;
begin
  if messagedlg('Delete the selected material option?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      iReason := dtmdlWorktops.GetContractInactiveReason;

      with sgDetails do
        begin
          icolumn := col;
          iRow := row;

          for icount := 0 to pred(Contract.Lines.count) do
            begin
              ContractLine := Contract.Lines[icount];

              with ContractLine do
                begin
                  if Options[icolumn-2].Quote <> 0 then
                    begin
                      {Delete individual quotes}
                      aQuote := TQuote.Create(dtmdlAllQuote);
                      try
                        aQuote.DbKey := Options[icolumn-2].Quote;
                        aQuote.LoadFromDB;
                        aQuote.inactive := 'Y';
                        aQuote.Reason := iReason;
                        aQuote.SaveToDB(true);
                      finally
                        aQuote.free;
                      end;
                    end;

                  {Delete contract line}
                  try
                    ContractLine.Options.delete(icolumn-2);
                  except
                    exit
                  end;
                end;
            end;

          ClearGrid(sgDetails);
          BuildLineGrid;

          try
            row := irow;
            col := icolumn;
          except
            col := icolumn - 1;
          end;
        end;
    end;
end;

procedure TfrmWTMaintContract.CreateFirstLine;
var
  iCol: integer;
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
begin
  ContractLine := TContractLine.Create(Contract);
  ContractLine.Line := Contract.Lines.count + 1;
  ContractLine.Mode := 'A';
  ContractLine.DrawingNumber := '';
  Contract.Lines.Add(ContractLine);

  {Now add the option columns}
(*  for icol := 2 to pred(sgDetails.colcount) do
    begin
      ContractOption := TContractOption.Create(ContractLine);
      ContractOption.OptionNumber := ContractLine.Options.count + 1;
      ContractOption.Description := sgDetails.cells[icol,0];
      ContractLine.Options.Add(ContractOption);
    end;
*)
end;

procedure TfrmWTMaintContract.mnuInsertQuoteClick(Sender: TObject);
var
  iRow, iColumn: integer;
begin
  CallMaintScreen(qAdd)
end;

procedure TfrmWTMaintContract.CallMaintScreen(aMode : TqMode);
var
  iColumn, iRow, Key : integer;
//  ContractLine: TContractLine;
  ContractOption: TContractOption;

  frm : TfrmWtMaintQuote;
  aQuote : TQuote;
begin
  if Contract.dbKey = 0 then
    begin
      MessageDlg('Please save the contract details before adding the first price.', mtInformation, [mbOk], 0);
      exit;
    end;

  with sgDetails do
    begin
      iRow := row;
      iColumn := col;
      ContractLine := Contract.lines[irow-1];
      ContractOption := ContractLine.Options[iColumn-2];
    end;

  if (aMode = qAdd) and (ContractOption.Quote <> 0) then
    begin
      MessageDlg('A price has already been created for this option', mtInformation, [mbOk], 0);
      exit;
    end;

  if aMode = qAdd then
    Key := 0
  else
    Key := ContractOption.Quote;

  try
    aQuote := TQuote.Create(dtmdlAllQuote);
    try
      aQuote.DbKey := key;
      aQuote.qMode := aMode;
      aQuote.LoadFromDB;
      if aMode = qAdd then
        begin
          aQuote.Customer := Contract.Customer;
          aQuote.CustomerName := Contract.CustomerName;
          aQuote.Address := Contract.Address;
          aQuote.Speculative := Contract.Speculative;
          
          aQuote.Description := ContractOption.Quotedescription;
          aQuote.Material := ContractOption.MaterialType;
          aQuote.Reference := Contract.SiteLocation;

          aQuote.ContractQuoteNumber := Contract.dbKey;
          aQuote.ContractLine := ContractLine.Line;
          aQuote.ContractOption := ContractOption.OptionNumber;
          aQuote.ContractGroup := ContractOption.Group;
          aQuote.Thickness := ContractOption.Thickness;
        end
      else
        begin
          aQuote.ContractQuoteNumber := Contract.dbKey;
          aQuote.ContractLine := ContractLine.Line;
          aQuote.ContractOption := ContractOption.OptionNumber;
          aQuote.ContractGroup := ContractOption.Group;
          aQuote.Thickness := ContractOption.Thickness;
        end;

      Frm := TfrmwtMaintQuote.Create(Self);
      try
        Frm.Mode := aMode;
        Frm.Quote := aQuote;
        Frm.ContractQuote := true;
        Frm.ShowModal;
        Key := aQuote.DbKey;
        if Frm.bOK then
          begin
            sgDetails.Cells[icolumn, irow] := formatfloat('£#,##0.00',aQuote.TotalGross);
            ContractOption.Quote := key;
            ContractOption.NettPrice := aQuote.TotalPrice;
            ContractOption.DeliveryPrice := aQuote.DeliveryPrice;
            ContractOption.InstallPrice := aQuote.InstallPrice;
            ContractOption.SurveyPrice := aQuote.SurveyPrice;
            ContractOption.DiscountValue := aQuote.DiscountValue;
            ContractOption.MarkupValue := aQuote.MarkupValue;
            ContractOption.CellValue := aQuote.TotalGross;
            ContractOption.Incompatible := false;
          end;
      finally
        Frm.Free;
      end;
    finally
      aQuote.Free;
    end;
  finally
  end;
end;

procedure TfrmWTMaintContract.mnuChangeQuoteClick(Sender: TObject);
var
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
begin
  with sgDetails do
    begin
      if (col = 1) or (Mode = cqCopy) then exit;
      ContractLine := Contract.lines[row-1];
      ContractOption := ContractLine.Options[col-2];
      if (row > 0) and (col > 1) AND (ContractOption.Quote <> 0) then
        CallMaintScreen(qChange);
    end;
end;

procedure TfrmWTMaintContract.mnuCreateOrderClick(Sender: TObject);
var
  frm: TfrmWTMaintContractConvertOrder;
  frmSO: TfrmwtMaintSalesOrder;
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
  iCol, iRow, iCount, iOrders: integer;
  aQuote: TQuote;
  aSlab: TQSlab;
  aSOrder: TSOrder;
  iQuote: integer;
  iOldCustomer: integer;
  iQty: integer;
  rTotalArea, rSlabArea: real;
  sInstallationName: string;
begin
  if  (Contract.ExpiryDate <> 0) and
      (Contract.ExpiryDate < date) then
      if MessageDlg('This contract has expired. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

  Frm := TfrmWTMaintContractConvertOrder.create(self);
  iOldCustomer := 0;

  ParseInstallationAddress;

  try
    with sgDetails do
      begin
        icol := col;
        iRow := row;

        ContractLine := Contract.lines[irow-1];
        ContractOption := ContractLine.Options[icol-2];

        {If Speculative then prompt to create a new customer.}
        if (Contract.Speculative) then
          begin
            iOldCustomer := Contract.Customer;
            if MessageDlg('This contract is for a speculative trade customer, do you want to convert to a confirmed trade customer?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  ConvertToTradeCustomer(ContractOption);
          end;

        if ContractOption.Quote = 0 then
          begin
            messagedlg('This drawing/option combination has not been quoted and therefore cannot be converted to an order', mtInformation, [mbOk], 0);
            exit;
          end;

        if iOldCustomer <> 0 then
          frm.customer := iOldCustomer
        else
          frm.customer := Contract.Customer;

        frm.edtCustomerName.Text := Contract.CustomerName;
        if Contract.Speculative then
          frm.edtCustomerName.Text := '';

        frm.GroupNumber := ContractOption.Group;
        frm.Quote := ContractOption.Quote;
        frm.Thickness := ContractOption.Thickness;

        frm.edtDeveloper.Text := Contract.Developer;
        frm.edtSiteName.Text := '';
        frm.edtStreet.Text := sAddress[1];
        frm.edtLocale.Text := sAddress[2];
        frm.edtTown.Text := sAddress[3];
        frm.edtPostcode.text := sAddress[4];
        frm.edtCounty.text := sAddress[5];
        frm.edtSiteContact.Text := Contract.SiteContact;
        frm.edtSitePhone.Text := Contract.SitePhone;
        frm.edtReference.Text := '';
        frm.edtCustomerPO.Text := '';
        frm.Mode := 'C';
        Frm.showmodal;
        if frm.bOK = true then
          begin
            for iOrders := 1 to frm.spnNoOfOrders.value do
              begin
                {Copy the original contract quote}
                aQuote := TQuote.Create(dtmdlAllQuote);
                try
                  aQuote.DbKey := ContractOption.Quote;
                  aQuote.qMode := qCopy;
                  aQuote.LoadFromDB;

                  if Contract.Speculative then
                    begin
                      aQuote.speculative := false;
                      aQuote.Address := 0;
                    end;

                  if dtmdlWorktops.UseRevenueCentres then
                    begin
                      aQuote.RevenueCentre := dtmdlWorktops.GetOperatorRevenueCentre(frmWTMain.Operator);
                    end
                  else
                    aQuote.RevenueCentre := 0;

                  aQuote.Reference := frm.edtReference.text;
                  for icount := 0 to pred(aQuote.Elements.count) do
                    begin
                      aQuote.Elements[icount].worktop := frm.Worktop;
                      aQuote.Elements[icount].thickness := frm.thickness;
                    end;
                    
                  {Added the Slab details based on what has been selected - 2/12/2021}
                  for icount := 0 to pred(aQuote.Slabs.count) do
                    begin
                      aQuote.Slabs[icount].worktop := frm.Worktop;
                      aQuote.Slabs[icount].thickness := frm.thickness;
                    end;

                  for icount := 0 to pred(aQuote.Upstands.count) do
                    begin
                      aQuote.Upstands[icount].worktop := frm.Upstand;
                    end;

                  aQuote.dbKey := 0;
                  aQuote.Customer := frm.Customer;
                  aQuote.CustomerName := frm.edtCustomerName.Text;
                  aQuote.QDate := date;
                  aQuote.Inactive := 'N';
                  aQuote.ContractQuote := false;

                  aQuote.ContractQuoteNumber := Contract.dbKey;
                  aQuote.ContractLine := ContractLine.Line;
                  aQuote.ContractOption := ContractOption.OptionNumber;
                  aQuote.ContractGroup := ContractOption.Group;

                  {Add in slab details based on material/supplier and overall area}
                  rSlabArea := (frm.SlabLength * frm.Slabdepth)/1000000;

                  if (dtmdlWorktops.UseCostingSystem) and (aQuote.Slabs.count = 0) and (frm.Supplier <> 0) and (rSlabArea > 0) then
                    begin
                      rTotalArea := aQuote.Elements.TotalArea + aQuote.Upstands.TotalArea;

                      iQty := 0;

                      repeat
                        iQty := iQty + 1;
                      until (rSlabArea * iQty) > rTotalArea;

                      aSlab := TQSlab.create(aQuote);
                      aSlab.QSlabNo := 1;
                      aSlab.Material := aQuote.Material;
                      aSlab.worktop := frm.Worktop;
                      aSlab.thickness := frm.Thickness;
                      aSlab.Supplier := frm.Supplier;
                      aSlab.length := frm.SlabLength;
                      aSlab.Depth := frm.SlabDepth;
                      aSlab.Quantity := iQty;
                      aSlab.UnitCost := frm.UnitCost;
                      aSlab.PriceUnit := frm.PriceUnit;
                      aSlab.WasteMultiplier := 0;
                      aSlab.WastePercentage := 0;
                      aSlab.WasteValue := 0;
                      aQuote.slabs.Add(aSlab);
                    end;

                  aQuote.SaveToDB(true);
                  iQuote := aQuote.dbKey;

                  {Move any line documents to the quote}
                  try
//                    MoveContractLineDocuments(Contract.dbkey, ContractLine.Line, iQuote);
                    MoveContractLineDocumentsToQuote(Contract.QuoteNumber, ContractLine.Line, iQuote);
                  except
                  end;

                finally
                  aQuote.Free;
                end;

                {Create a new Sales Order}
                dtmdlSalesOrder := TdtmdlSalesOrder.create(application);

                try
                  aSOrder := TSOrder.Create(dtmdlSalesOrder);
                  try
                    aSOrder.DataModule.QuoteNo := iQuote;
                    aSOrder.DbKey := 0;
                    aSOrder.LoadFromQuote;

                    sInstallationName := frm.edtSiteName.text;
                    if trim(sInstallationName) = '' then
                      sInstallationName := frm.edtDeveloper.Text;

                    aSOrder.InstallationAddress := aSOrder.DataModule.SetAddress(aSOrder.InstallationAddress,
                                                sInstallationName,
                                                frm.edtStreet.text,
                                                frm.edtLocale.text,
                                                frm.edtTown.text,
                                                frm.edtPostcode.text,
                                                frm.edtCounty.text,
                                                '',
                                                edtSitePhone.text,
                                                'I');

                    aSOrder.InstallAddress := self.AddSOrderAddress(frm.edtSiteName.text + #13#10 + frm.edtStreet.text + #13#10 +
                                                                    frm.edtLocale.text + #13#10 + frm.edtTown.text + #13#10 +
                                                                    frm.edtPostcode.text + #13#10 + frm.edtCounty.text);

                    aSOrder.CustomerBranch := frm.CustomerBranch;

                    aSOrder.CustomerBranchName := frm.edtSiteName.text;
                    aSOrder.BranchExist := frm.BranchExist;

                    aSOrder.InstallName := frm.edtSiteContact.Text;
                    aSOrder.InstallPhone := frm.edtSitePhone.Text;

                    aSOrder.OrderReference := frm.edtCustomerPO.Text;
                    aSOrder.TemplateDate := date + 1;
                    aSOrder.DateRequired := date + 8;

                    {if any notes asscociated with this contract quote, then preface the quote notes}
                    aSOrder.NarrativeText := Contract.NarrativeText + #13#10#13#10 + aSOrder.NarrativeText;

                    if frm.spnNoOfOrders.Value = 1 then
                      begin
                        FrmSO := TfrmwtMaintSalesOrder.Create(Self);
                        try
                          FrmSO.Mode := sopConvert;
                          FrmSO.SOrder := aSOrder;
                          FrmSO.ShowModal;
                          if FrmSO.ModalResult = idOK then
                            dtmdlAllQuote.UpdateQStatusSO(aSOrder.DataModule.QuoteNo, 24);
                        finally
                          FrmSO.Free;
                        end;
                      end
                    else
                      begin
                        aSOrder.DateType := 'P';
                        aSOrder.SaveToDB(true);

                        {Move any line documents to the sales ordeer}
                        try
                          MoveContractLineDocumentsToSalesOrder(Contract.QuoteNumber, ContractLine.Line, aSOrder.dbKey);
                        except
                        end;
                      end;
                  finally
                    aSOrder.Free;
                  end;
                finally
                  dtmdlSalesOrder.free;
                end;
              end;
            if frm.spnNoOfOrders.Value > 1 then
              MessageDlg(inttostr(frm.spnNoOfOrders.Value) + ' new sales orders have been created.', mtInformation,[mbOk], 0);
          end;
        ClearGrid(sgDetails);
        BuildLineGrid;

        row := irow;
        col := icol;
      end;
  finally
    frm.Free;
  end;
end;

procedure TfrmWTMaintContract.ParseInstallationAddress;
var
  iStart, iLength, iPos, iCount: integer;
  sLocation: string;
begin
  iStart := 1;
  iCount := 1;
  sLocation := edtLocation.Text;
  iLength := length(sLocation);

  while pos(',',sLocation) > 0 do
    begin
      iPos := pos(',',sLocation);
      sAddress[icount] := copy(sLocation,iStart,(iPos-iStart));
      sLocation := stringReplace(sLocation,',','^',[]);
      iStart := iPos + 2;
      inc(iCount);
    end;

  if iLength > 0 then
    sAddress[icount] := copy(sLocation,iStart,(iLength-iStart+1));
end;

procedure TfrmWTMaintContract.MoveContractLineDocuments(rContract: real; iLine: integer; rQuote: real);
var
  sSource, sDest: string;
  irow: integer;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sFilename: string;
begin

  sSource := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(rContract) + '\' + inttostr(iLine) + '\';
  sDest :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(rQuote) + '\' + inttostr(iLine) + '\';

  // search for the first file
  irow := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while irow = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(sSource + SearchRec.Name), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);

          sFilename := SearchRec.Name;

          filecopy(sSource+sFilename, sDest+sFilename);
        end;
      irow := FindNext(SearchRec);
    end;
end;

procedure TfrmWTMaintContract.MoveContractLineDocumentsToQuote(rContract: real; iLine: integer; rQuote: real);
var
  sSource, sDest: string;
  irow: integer;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sFilename: string;
  sFolderName: string;
begin
  sFolderName := dtmdlWorktops.GetContractDrawingFolderName;
  sSource := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(rContract) + '\' + inttostr(iLine) + '\';

  if trim(sFolderName) <> '' then
    sDest :=  dtmdlWorktops.GetCompanyQuoteDirectory + '\' + floattostr(rQuote) + '\' + sFolderName + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanyQuoteDirectory + '\' + floattostr(rQuote) + '\';

  try
    CreateDir(sDest);
  except
  end;

  // search for the first file
  irow := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while irow = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(sSource + SearchRec.Name), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);

          sFilename := SearchRec.Name;

          filecopy(sSource+sFilename, sDest+sFilename);
        end;
      irow := FindNext(SearchRec);
    end;
end;

procedure TfrmWTMaintContract.mnuDeleteQuoteClick(Sender: TObject);
var
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
  iRow, iColumn: integer;
  aQuote: TQuote;
  iReason: integer;
begin
  with sgDetails do
    begin
      iRow := row;
      iColumn := col;
      ContractLine := Contract.lines[irow-1];
      ContractOption := ContractLine.Options[iColumn-2];
    end;

  if messagedlg('Delete the selected quoted price?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      iReason := dtmdlWorktops.GetContractInactiveReason;

      with sgDetails do
        begin
          aQuote := TQuote.Create(dtmdlAllQuote);
          try
            aQuote.DbKey := ContractOption.Quote;
            aQuote.LoadFromDB;
            aQuote.inactive := 'Y';
            aQuote.Reason := iReason;
            aQuote.SaveToDB(true);
          finally
            aQuote.free;
          end;

          ContractOption.Quote := 0;
          ContractOption.NettPrice := 0;
          ContractOption.DeliveryPrice := 0;
          ContractOption.InstallPrice := 0;
          ContractOption.SurveyPrice := 0;
          ContractOption.DiscountValue := 0;
          ContractOption.MarkupValue := 0;
          ContractOption.CellValue := 0;
          sgDetails.Cells[icolumn, irow] := formatfloat('£#,##0.00',0);

        end;
    end;
end;

procedure TfrmWTMaintContract.btnSaveClick(Sender: TObject);
var
  irow, icol, icount, iOption: integer;
begin
  bOK := false;
  if Mode = cqDelete then
    begin
      if MessageDlg('Are you sure you want to delete this contract?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

      Contract.Inactive := 'Y';
      Contract.SaveToDB(true);
//      Contract.DeleteFromDB;
      bOK := true;
    end
  else
    begin
      {Check that all drawing references have been entered}
      for icount := 1 to pred(sgDetails.rowcount) do
        begin
          if sgDetails.cells[1,icount] = '' then
            begin
              messagedlg('Drawing reference details must be entered for all prices', mtInformation, [mbOk], 0);

              sgDetails.setfocus;
              exit;
            end;
        end;

      {Check that all discrepancies have been addressed}
      for icount := 0 to pred(Contract.Lines.count) do
        begin
          for iOption := 0 to pred(Contract.Lines[iCount].Options.count) do
            begin
              if Contract.Lines[iCount].Options[iOption].Incompatible then
                begin
                  messagedlg('One or more options have cut-out or edge profile incompatibility issues. Please investigate.', mtInformation, [mbOk], 0);

                  sgDetails.setfocus;
                  exit;
                end;
            end;
        end;

      if (Mode = cqcopy) or (Mode = cqRequote) then
        begin
          Contract.Address := 0;
          Contract.ExtraNotes := 0;
        end;

      Contract.ExpiryDate := padatestr(edtExpiryDate.text);
      Contract.ContractDate := dtpckDate.date;
      Contract.AccountManager := dblkpOperator.KeyValue;
      Contract.Operator := frmWTMain.Operator;

      if chkbxInactive.checked then
        Contract.inactive := 'Y'
      else
        Contract.inactive := 'N';

      if Contract.Speculative then
        Contract.Address := Contract.DataModule.SetAddress(Contract.Address,
                                                Contract.CustomerName,
                                                Contract.Street,
                                                Contract.Locality,
                                                Contract.TownCity,
                                                Contract.Postcode,
                                                Contract.County,
                                                Contract.TelephoneNumber,
                                                Contract.EmailAddress);
      Contract.ExtraNotes := UpdateNotes;

      Contract.CustomerName := edtCustomerName.Text;
      Contract.ContractMode := Mode;
      Contract.SaveToDB(true);

      if Mode = cqRequote then
        begin
          MoveOriginalContractDocuments;

          for icount := 0 to pred(Contract.Lines.count) do
            begin
//              MoveContractLineDocuments(Contract.OriginalQuote, Contract.Lines[icount].Line, Contract.QuoteNumber);
              MoveContractLineDocuments(OriginalReQuote, Contract.Lines[icount].Line, Contract.QuoteNumber);
            end;
        end;

      bOK := true;
      if (Mode = cqAdd) or (Mode = cqCopy) or (Mode = cqRequote)  then
//          messagedlg('Contract Quote number '+ floattostr(Contract.dbKey)+ ' created', mtInformation, [mbOk], 0);
          messagedlg('Contract Quote number '+ floattostr(Contract.QuoteNumber)+ ' created', mtInformation, [mbOk], 0);
    end;

  Contract.AllowPriceChange := (Mode = cqRequote);

  Mode := cqChange;
  Contract.cqMode := cqChange;
  FActivated := false;
  FormActivate(Self);
end;

procedure TfrmWTMaintContract.ShowListViewDocuments(strPath: string; ListView: TListView; ImageList: TImageList);
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

procedure TfrmWTMaintContract.ShowDocuments;
var
  sPath: string;
begin
//  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey) + '\';
  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\';
  // Assign a Imagelist to the ListView
  lstvwDocuments.Clear;
  lstvwDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwDocuments.ViewStyle := vsReport;
//  lstvwDocuments.ViewStyle := vsIcon;
//  lstvwDocuments.Columns.Add;
//  lstvwDocuments.Columns.Add;
  ShowListViewDocuments(sPath, lstvwDocuments, imgDocuments);
end;

procedure TfrmWTMaintContract.ShowLineDocuments;
var
  sPath: string;
begin
//  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey) + '\' + inttostr(ContractLine.Line) + '\';
  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' + inttostr(ContractLine.Line) + '\';
  // Assign a Imagelist to the ListView
  lstvwLineDocuments.Clear;
  lstvwLineDocuments.LargeImages := imgDocuments;
  // Show Listview in Report Style and add 2 Columns
  lstvwLineDocuments.ViewStyle := vsReport;
//  lstvwDocuments.ViewStyle := vsIcon;
//  lstvwDocuments.Columns.Add;
//  lstvwDocuments.Columns.Add;
  ShowListViewDocuments(sPath, lstvwLineDocuments, imgDocuments);
  lstvwLineDocuments.ItemIndex := pred(lstvwLineDocuments.items.count);
end;

procedure TfrmWTMaintContract.lstvwDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
//  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey) + '\';
  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\';
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

procedure TfrmWTMaintContract.mnuOpenDocumentClick(Sender: TObject);
begin
  lstvwDocumentsDblClick(self);
end;

procedure TfrmWTMaintContract.mnuDeleteDocumentClick(Sender: TObject);
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
      if (Mode <> cqAdd) then
        begin
//          sPath :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbkey) + '\' ;
          sPath :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
end;

procedure TfrmWTMaintContract.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docdir, compdir, docExt: string;
begin
//  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey);
  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber);
  compDir := dtmdlWorktops.GetCompanyContractDirectory;

  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmWTMain.AppIniFile);
  try

  finally
    IniFile.Free;
  end;

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo, sSubject, sBody, sFilePath, okToSave, frmWTMain.EmailApplication, frmWTMain.EmailAccount);

  if okToSave then
    begin
       ShowDocuments;
    end;
end;

procedure TfrmWTMaintContract.btnWordClick(Sender: TObject);
var
  compdir, docdir, jobBagDir, docExt, sPAth: string;
  sFullFile, sFileName: string;
  iLength, ipos, i: integer;
  okToSave, userCancelled, docsaved: boolean;
begin
//  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey);
  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber);
  compDir := dtmdlWorktops.GetCompanyContractDirectory;

  okToSave := false;
  userCancelled := false;
  docsaved := false;

  if (Sender as TToolButton) = btnWord then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc; *.docx)|*.doc; *.docx';
    svDlgOfficeDoc.FileName := 'New Document';
  end
  else if (Sender as TToolButton) = btnExcel then
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
          MessageDlg('You can''t save a document outside the Job Document Directory',
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

procedure TfrmWTMaintContract.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  WTMaintEmailFrm := TWTMaintEmailFrm.create(self);
  try
    WTMaintEmailFrm.Supplier := 0;
    WTMaintEmailFrm.SupplierBranch := 0;
    WTMaintEmailFrm.SupplierContact := 0;
    WTMaintEmailFrm.AddressType := 0;
    WTMaintEmailFrm.Customer := Contract.customer;
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

procedure TfrmWTMaintContract.btnAttachClick(Sender: TObject);
var
  i, ipos, ilength, icount: integer;
  sFile, sFullFile, docDir: string;
begin
//  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey);
  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber);

  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  DocOpenDialog.Files.Clear;
  if DocOpenDialog.Execute then
  begin
    if DocOpenDialog.Files.Count > 0 then
      begin
        for icount := 0 to pred(DocOpenDialog.Files.Count) do
          begin
            sfullFile := DocOpenDialog.Files.Strings[icount];
            iLength := length(sFullFile);

            while i <> 0 do
              begin
                ipos := pos('\',sFullFile);

                sFullFile := stringreplace(sFullFile, '\', '!', []);

                i := pos('\',sFullFile);
              end;

            sFile := copy(DocOpenDialog.Files.Strings[icount], ipos+1, (iLength - ipos));

            FileCopy(DocOpenDialog.Files.Strings[icount], docDir + '\' + sFile) ;
          end;
        ShowDocuments;
      end;
  end;
end;

procedure TfrmWTMaintContract.FormResize(Sender: TObject);
begin
  self.pnlNotes.width := trunc((self.tsDocuments.width/2));
  self.lstvwDocuments.width := trunc((self.tsDocuments.width/2));
  lblNotes.left := pnlNotes.Left;
  self.pnlEvents.Width := trunc((self.tsEvents.width/2));
  self.sgEvents.width := trunc((self.tsDocuments.width/2));
end;

procedure TfrmWTMaintContract.GetNotes(iNarrative: Integer);
var
  Narrative: TNotes;
begin
  if iNarrative = 0 then Exit;
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    memNotes.Text := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TfrmWTMaintContract.bynSpecialInstructionsClick(Sender: TObject);
begin
  frmWTLUSpecialInstruction := TfrmWtLUSpecialInstruction.create(application);
  try
    frmWtLUSpecialInstruction.bAllow_Upd := true;
    frmWtLUSpecialInstruction.bIs_lookup := true;
    frmWtLUSpecialInstruction.showmodal;
    if frmWtLUSpecialInstruction.selected then
      begin
        GetNotes(frmWtLUSpecialInstruction.SelNarrative);
      end;
  finally
     frmWtLUSpecialInstruction.free;
  end;
end;

procedure TfrmWTMaintContract.mnuLinkQuoteClick(Sender: TObject);
var
//  ContractLine: TContractLine;
  ContractOption: TContractOption;
  iRow, iColumn: integer;
  frm: TfrmWTLUContractQuotes;
  aQuote: TQuote;
begin
  with sgDetails do
    begin
      iRow := row;
      iColumn := col;
      ContractLine := Contract.lines[irow-1];
      ContractOption := ContractLine.Options[iColumn-2];
    end;

  frm := TfrmWTLUContractQuotes.create(self);

  try
    frm.edtCustomerName.text := Contract.CustomerName;
    frm.Customer := Contract.Customer;
    Frm.ShowModal;
    if (Frm.ModalResult = mrOK) then
      begin
        aQuote := TQuote.Create(dtmdlAllQuote);
        try
          aQuote.DbKey := Frm.SelectedQuote;
          aQuote.LoadFromDB;
          sgDetails.Cells[icolumn, irow] := formatfloat('£#,##0.00',aQuote.TotalGross);
          ContractOption.Quote := aQuote.DbKey;
          ContractOption.NettPrice := aQuote.TotalPrice;
          ContractOption.DeliveryPrice := aQuote.DeliveryPrice;
          ContractOption.InstallPrice := aQuote.InstallPrice;
          ContractOption.SurveyPrice := aQuote.SurveyPrice;
          ContractOption.DiscountValue := aQuote.DiscountValue;
          ContractOption.MarkupValue := aQuote.MarkupValue;
          ContractOption.CellValue := aQuote.TotalGross;

          aQuote.ContractQuote := true;
          aQuote.ContractQuoteNumber := Contract.dbKey;
          aQuote.ContractLine := ContractLine.Line;
          aQuote.ContractOption := ContractOption.OptionNumber;

          aQuote.QuoteNumber := aQuote.GetNextContractQuoteNumber;
          aQuote.SaveToDB(true);
        finally
          aQuote.free;
        end;
      end;
  finally
    frm.free;
  end;
end;

procedure TfrmWTMaintContract.btnContactSearchClick(Sender: TObject);
begin
  {Don't display contact selection if spculative customer}
  if Contract.Speculative then
    exit;

  frmwtSrchCustContacts := TfrmwtSrchCustContacts.create(self);
  try
    frmwtSrchCustContacts.Customer := Contract.Customer;
    frmwtSrchCustContacts.isLookup := true;
    frmwtSrchCustContacts.showmodal;
    if frmwtSrchCustContacts.modalresult = idOK then
      begin
        Contract.ContactName := frmwtSrchCustContacts.ContactName;
        edtContact.Text := Contract.ContactName;
      end
  finally
    frmwtSrchCustContacts.free;
  end;
end;

procedure TfrmWTMaintContract.btnContactClearClick(Sender: TObject);
begin
  edtContact.clear;
  Contract.ContactName := edtContact.text;
end;

procedure TfrmWTMaintContract.NextOption1Click(Sender: TObject);
var
//  ContractLine: TContractLine;
  ContractOption, ContractOptionNext: TContractOption;
  iRow, iColumn: integer;
  iCount: integer;
  frm: TfrmWTLUContractQuotes;
  aQuote: TQuote;
  iMaterial, iWorktop, iThickness, iOriginalThickness, iSupplier: integer;
  iLength, iDepth: integer;
  rNewSell, rUnitSell, rUnitCost, rDiscount: real;
  bSlabFound, bUseSlabQuoting: boolean;
begin
  with sgDetails do
    begin
      iRow := row;
      iColumn := col;

      if (iColumn + 1) >= colcount then
        begin
          messagedlg('Error: No further options exist for this drawing', mtError, [mbOk], 0);
          exit;
        end;
    end;

  ContractLine := Contract.lines[irow-1];
  ContractOption := ContractLine.Options[iColumn-2];
  ContractOptionNext := ContractLine.Options[iColumn-1];

  if ContractOption.Quote = 0 then
    begin
      messagedlg('A quote hasn''t been created for this option yet!', mtError, [mbOk], 0);
      exit;
    end;

  if messagedlg('Requote for ' + ContractOptionNext.Description + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      bUseSlabQuoting := dtmdlWorktops.UseSlabContractQuoting;

      ContractOptionNext.Incompatible := false;

      aQuote := TQuote.Create(dtmdlAllQuote);
      try
        aQuote.DbKey := ContractOption.Quote;
        aQuote.qMode := qChange;
        aQuote.LoadFromDB;

        if (aQuote.elements.Count > 0) or (aQuote.Upstands.Count > 0) or (aQuote.Slabs.count > 0) then
          begin
            {Get the new material and worktop}
            iMaterial := ContractOptionNext.MaterialType;
            iWorktop := Contract.DataModule.GetCustomerGroupWorktop(Contract.Customer, ContractOptionNext.Group);
            iSupplier := Contract.DataModule.GetCustomerGroupSupplier(Contract.Customer, ContractOptionNext.Group);

            {Check if there any worktops}
            if aQuote.elements.Count > 0 then
              begin
                {Get the unit price for this thickness and add the new worktops}
                iThickness := aQuote.elements[0].thickness;

                if ContractOptionNext.Thickness <> 0 then
                  iThickness := ContractOptionNext.Thickness;

                if bUseSlabQuoting then
                  rUnitSell := 0.00
                else
                  rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness);

                for icount := 0 to pred(aQuote.elements.Count) do
                  begin
                    aQuote.Elements[icount].material := iMaterial;
                    aQuote.Elements[icount].worktop := iWorktop;
                    aQuote.Elements[icount].thickness := iThickness;
                    aQuote.Elements[icount].UnitPrice := rUnitSell;
                  end;
              end;

            {Check the upstands if there are any}
            if aQuote.Upstands.Count > 0 then
              begin
                {Get the unit price for this thickness and add the new upstands}
                iThickness := aQuote.Upstands[0].thickness;

                if bUseSlabQuoting then
                  rUnitSell := 0.00
                else
                  rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness);

                for icount := 0 to pred(aQuote.upstands.Count) do
                  begin
                    aQuote.Upstands[icount].material := iMaterial;
                    aQuote.Upstands[icount].worktop := iWorktop;
                    aQuote.Upstands[icount].thickness := iThickness;
                    aQuote.Upstands[icount].UnitPrice := rUnitSell;
                  end;
              end;

            {Check if there are any slabs}
            if (aQuote.slabs.count > 0) then
              begin
                if iSupplier <> 0 then
                  begin
                    {Get the unit price for this thickness and add the new worktops}
                    iOriginalThickness := aQuote.slabs[0].thickness;
                    iThickness := aQuote.slabs[0].thickness;

                    if ContractOptionNext.Thickness <> 0 then
                      iThickness := ContractOptionNext.Thickness;

                    rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness);
                    rUnitCost := Contract.DataModule.GetCustomerGroupCost(Contract.Customer, ContractOptionNext.Group, iThickness);

                    for icount := 0 to pred(aQuote.slabs.Count) do
                      begin
                        if aQuote.slabs[icount].thickness <> iOriginalThickness then
                          begin
                            if bUseSlabQuoting then
                              rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, aQuote.slabs[icount].thickness)
                            else
                              rUnitSell := 0.00;

                            rUnitCost := Contract.DataModule.GetCustomerGroupCost(Contract.Customer, ContractOptionNext.Group, aQuote.slabs[icount].thickness);
                          end
                        else
                          begin
                            aQuote.slabs[icount].thickness := iThickness;
                            if bUseSlabQuoting then
                              rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness)
                            else
                              rUnitSell := 0.00;
                            rUnitCost := Contract.DataModule.GetCustomerGroupCost(Contract.Customer, ContractOptionNext.Group, iThickness);
                          end;

                        if iMaterial <> aQuote.slabs[icount].material then
                          begin
                            iLength := aQuote.slabs[icount].length;
                            iDepth := aQuote.slabs[icount].depth;

                            bSlabFound := Contract.DataModule.GetMaterialSlabSize(iMaterial, iLength, iDepth);

                            if bSlabFound then
                              begin
                                aQuote.slabs[icount].length := iLength;
                                aQuote.slabs[icount].depth := iDepth;
                              end;
                          end;

                        aQuote.slabs[icount].material := iMaterial;
                        aQuote.slabs[icount].worktop := iWorktop;
                        aQuote.slabs[icount].UnitPrice := rUnitSell;
                        aQuote.slabs[icount].UnitCost := rUnitCost;
                        aQuote.slabs[icount].Supplier := iSupplier;
                        aQuote.slabs[icount].SlabSize := 0;
                      end;
                  end
                else
                  ContractOptionNext.Incompatible := true;
              end;

            {Re-price the cut outs}
            if aQuote.CutOuts.Count > 0 then
              begin
                for icount := pred(aQuote.cutouts.Count) downto 0 do
                  begin
                    rNewSell := aQuote.CutOuts[icount].UnitPrice;
                    if (aQuote.CutOuts[icount].Material <> iMaterial) then
                      begin
                        aQuote.CutOuts[icount].material := iMaterial;
                        rUnitSell := Contract.DataModule.GetCustomerCutOutPrice(Contract.Customer, iMaterial, aQuote.CutOuts[icount].EdgeType, aQuote.CutOuts[icount].CutOut);

                        if rUnitSell = -1 then
                          rUnitSell := Contract.DataModule.GetMaterialCutOutPrice(iMaterial, aQuote.CutOuts[icount].EdgeType, aQuote.CutOuts[icount].CutOut);
                        rDiscount := rUnitSell * (aQuote.CutOuts[icount].Discount/100.0000);
                        aQuote.CutOuts[icount].UnitPrice := rUnitSell - rDiscount;

                        {This overwrites the material cut out price by the original option cut out price}
                        aQuote.CutOuts[icount].UnitPrice := rNewSell;
                      end;

                    if rUnitSell < 0 then
                      begin
                        aQuote.CutOuts.Delete(icount);
                        ContractOptionNext.Incompatible := true;
                      end;
                  end;
              end;

            {Re-price the edges}
            if aQuote.Edges.Count > 0 then
              begin
                for icount := pred(aQuote.Edges.Count) downto 0 do
                  begin
                    rNewSell := aQuote.Edges[icount].UnitPrice;
                    if (aQuote.Edges[icount].Material <> iMaterial) then
                      begin
                        aQuote.Edges[icount].material := iMaterial;
                        rUnitSell := Contract.DataModule.GetCustomerEdgePrice(Contract.Customer, iMaterial, aQuote.Edges[icount].EdgeType, aQuote.Edges[icount].Edge);
                        if rUnitSell = -1 then
                          rUnitSell := Contract.DataModule.GetMaterialEdgePrice(iMaterial, aQuote.Edges[icount].EdgeType, aQuote.Edges[icount].Edge);
                        rDiscount := rUnitSell * (aQuote.Edges[icount].Discount/100.0000);
                        aQuote.Edges[icount].UnitPrice := rUnitSell - rDiscount;

                        {This overwrites the material cut out price by the original option cut out price}
                        aQuote.Edges[icount].UnitPrice := rNewSell;
                      end;

                    if rUnitSell < 0 then
                      begin
                        aQuote.Edges.Delete(icount);
                        ContractOptionNext.Incompatible := true;
                      end;
                  end;
              end;

            aQuote.Material := iMaterial;
            aQuote.Description := ContractOptionNext.Quotedescription;

            aQuote.DiscountValue := aQuote.TotalDiscount;

            aQuote.QMode := qAdd;
            aQuote.dbkey := 0;

            aQuote.ContractQuoteNumber := Contract.dbKey;
            aQuote.ContractLine := ContractLine.Line;
            aQuote.ContractOption := ContractOptionNext.OptionNumber;
            aQuote.ContractGroup := ContractOption.Group;

            aQuote.SaveToDB(true);

            ContractOptionNext.Quote := aQuote.dbKey;
            ContractOptionNext.NettPrice := aQuote.TotalPrice;
            ContractOptionNext.DeliveryPrice := aQuote.DeliveryPrice;
            ContractOptionNext.InstallPrice := aQuote.InstallPrice;
            ContractOptionNext.SurveyPrice := aQuote.SurveyPrice;
            ContractOptionNext.DiscountValue := aQuote.DiscountValue;
            ContractOptionNext.MarkupValue := aQuote.MarkupValue;
{Cell Override}
            ContractOptionNext.CellValue := aQuote.TotalGross;

            if ContractOptionNext.Incompatible then
              sgDetails.Cells[icolumn+1, irow] := 'ERROR'
            else
              sgDetails.Cells[icolumn+1, irow] := formatfloat('£#,##0.00',aQuote.TotalGross);
          end
        else
          begin
            messagedlg('No worktop or upstand elements exist for the original quote.', mtError, [mbOk], 0);
            exit;
          end;

      finally
        aQuote.free;
      end;
    end;
end;

procedure TfrmWTMaintContract.RemainingOptions1Click(Sender: TObject);
var
//  ContractLine: TContractLine;
  ContractOption, ContractOptionNext: TContractOption;
  iRow, iColumn: integer;
  iCount, iCount1, iCutOuts: integer;
  iOption: integer;
  frm: TfrmWTLUContractQuotes;
  aQuote: TQuote;
  iMaterial, iWorktop, iThickness, iOriginalThickness, iSupplier: integer;
  iLength, iDepth: integer;
  rNewSell, rUnitSell, rUnitCost, rDiscount: real;
  bSlabFound, bUseSlabQuoting: boolean;
begin
  with sgDetails do
    begin
      iRow := row;
      iColumn := col;

      if (iColumn + 1) > colcount then
        begin
          messagedlg('Error: No further options exist for this drawing', mtError, [mbOk], 0);
          exit;
        end;
    end;

  ContractLine := Contract.lines[irow-1];
  ContractOption := ContractLine.Options[iColumn-2];

  if ContractOption.Quote = 0 then
    begin
      messagedlg('A quote hasn''t been created for this option yet!', mtError, [mbOk], 0);
      exit;
    end;

  if messagedlg('Requote for all remaining options? Any existing values will be overwritten.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      bUseSlabQuoting := dtmdlWorktops.UseSlabContractQuoting;

      iCount1 := 1;

      For iOption := (iColumn-1) to pred(ContractLine.Options.count) do
        begin
          ContractOptionNext := ContractLine.Options[iOption];

          aQuote := TQuote.Create(dtmdlAllQuote);
          try
            {Reset aQuote to original characteristics}
            aQuote.DbKey := ContractOption.Quote;
            aQuote.qMode := qChange;
            aQuote.LoadFromDB;
            {END reset}

            if (aQuote.elements.Count > 0) or (aQuote.Upstands.Count > 0) or (aQuote.Slabs.Count > 0)then
              begin
                {Change the quote details to reflect the new material and colour options}
                iMaterial := ContractOptionNext.MaterialType;
                iWorktop := Contract.DataModule.GetCustomerGroupWorktop(Contract.Customer, ContractOptionNext.Group);
                iSupplier := Contract.DataModule.GetCustomerGroupSupplier(Contract.Customer, ContractOptionNext.Group);

                if aQuote.elements.Count > 0 then
                  begin
                    iThickness := aQuote.elements[0].thickness;

                    if ContractOptionNext.Thickness <> 0 then
                      iThickness := ContractOptionNext.Thickness;

                    if bUseSlabQuoting then
                      rUnitSell := 0.00
                    else
                      rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness);

                    for icount := 0 to pred(aQuote.elements.Count) do
                      begin
                        aQuote.Elements[icount].material := iMaterial;
                        aQuote.Elements[icount].worktop := iWorktop;
                        aQuote.Elements[icount].thickness := iThickness;
                        aQuote.Elements[icount].UnitPrice := rUnitSell;
                      end;
                  end;

                if aQuote.Upstands.Count > 0 then
                  begin
                    iThickness := aQuote.Upstands[0].thickness;

                    if bUseSlabQuoting then
                      rUnitSell := 0.00
                    else
                      rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness);

                    for icount := 0 to pred(aQuote.Upstands.Count) do
                      begin
                        aQuote.Upstands[icount].material := iMaterial;
                        aQuote.Upstands[icount].worktop := iWorktop;
                        aQuote.Upstands[icount].thickness := iThickness;
                        aQuote.Upstands[icount].UnitPrice := rUnitSell;
                      end;
                  end;


                {Check if there are any slabs}
                if (aQuote.slabs.count > 0) then
                  begin
                    if iSupplier <> 0 then
                      begin
                        {Get the unit price for this thickness and add the new worktops}

                        iOriginalThickness := aQuote.slabs[0].thickness;
                        iThickness := aQuote.slabs[0].thickness;

                        if ContractOptionNext.Thickness <> 0 then
                          iThickness := ContractOptionNext.Thickness;

                        rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness);
                        rUnitCost := Contract.DataModule.GetCustomerGroupCost(Contract.Customer, ContractOptionNext.Group, iThickness);

                        for icount := 0 to pred(aQuote.slabs.Count) do
                          begin
                            if aQuote.slabs[icount].thickness <> iOriginalThickness then
                              begin
                                if bUseSlabQuoting then
                                  rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, aQuote.slabs[icount].thickness)
                                else
                                  rUnitSell := 0.00;

                                rUnitCost := Contract.DataModule.GetCustomerGroupCost(Contract.Customer, ContractOptionNext.Group, aQuote.slabs[icount].thickness);
                              end
                            else
                              begin
                                aQuote.slabs[icount].thickness := iThickness;
                                if bUseSlabQuoting then
                                  rUnitSell := Contract.DataModule.GetCustomerGroupPrice(Contract.Customer, ContractOptionNext.Group, iThickness)
                                else
                                  rUnitSell := 0.00;
                                rUnitCost := Contract.DataModule.GetCustomerGroupCost(Contract.Customer, ContractOptionNext.Group, iThickness);
                              end;

                            if iMaterial <> aQuote.slabs[icount].material then
                              begin
                                iLength := aQuote.slabs[icount].length;
                                iDepth := aQuote.slabs[icount].depth;

                                bSlabFound := Contract.DataModule.GetMaterialSlabSize(iMaterial, iLength, iDepth);

                                if bSlabFound then
                                  begin
                                    aQuote.slabs[icount].length := iLength;
                                    aQuote.slabs[icount].depth := iDepth;
                                  end;
                              end;

                            aQuote.slabs[icount].material := iMaterial;
                            aQuote.slabs[icount].worktop := iWorktop;
                            aQuote.slabs[icount].UnitPrice := rUnitSell;
                            aQuote.slabs[icount].UnitCost := rUnitCost;
                            aQuote.slabs[icount].Supplier := iSupplier;
                            aQuote.slabs[icount].SlabSize := 0;
                          end;
                      end
                    else
                      ContractOptionNext.Incompatible := true;
                  end;

                {Re-price the cut outs}
                if aQuote.CutOuts.Count > 0 then
                  begin
                    for icount := pred(aQuote.cutouts.Count) downto 0 do
                      begin
                        rNewSell := aQuote.CutOuts[icount].UnitPrice;
                        if (aQuote.CutOuts[icount].Material <> iMaterial) then
                          begin
                            aQuote.CutOuts[icount].material := iMaterial;

                            rUnitSell := Contract.DataModule.GetCustomerCutOutPrice(Contract.Customer, iMaterial, aQuote.CutOuts[icount].EdgeType, aQuote.CutOuts[icount].CutOut);
                            if rUnitSell = -1 then
                              rUnitSell := Contract.DataModule.GetMaterialCutOutPrice(iMaterial, aQuote.CutOuts[icount].EdgeType, aQuote.CutOuts[icount].CutOut);
                            rDiscount := rUnitSell * (aQuote.CutOuts[icount].Discount/100.0000);
                            aQuote.CutOuts[icount].UnitPrice := rUnitSell - rDiscount;

                            {This overwrites the material cut out price by the original option cut out price}
                            aQuote.CutOuts[icount].UnitPrice := rNewSell;
                          end;

                        if rUnitSell < 0 then
                          begin
                            aQuote.CutOuts.Delete(icount);
                            ContractOptionNext.Incompatible := true;
                          end;
                      end;
                  end;

                {Re-price the edges}
                if aQuote.Edges.Count > 0 then
                  begin
                    for icount := pred(aQuote.Edges.Count) downto 0 do
                      begin
                        rNewSell := aQuote.Edges[icount].UnitPrice;
                        if (aQuote.Edges[icount].Material <> iMaterial) then
                          begin
                            aQuote.Edges[icount].material := iMaterial;

                            rUnitSell := Contract.DataModule.GetCustomerEdgePrice(Contract.Customer, iMaterial, aQuote.Edges[icount].EdgeType, aQuote.Edges[icount].Edge);
                            if rUnitSell = -1 then
                              rUnitSell := Contract.DataModule.GetMaterialEdgePrice(iMaterial, aQuote.Edges[icount].EdgeType, aQuote.Edges[icount].Edge);
                            rDiscount := rUnitSell * (aQuote.Edges[icount].Discount/100.0000);
                            aQuote.Edges[icount].UnitPrice := rUnitSell - rDiscount;

                            {This overwrites the material cut out price by the original option cut out price}
                            aQuote.Edges[icount].UnitPrice := rNewSell;
                          end;

                        if rUnitSell < 0 then
                          begin
                            aQuote.Edges.Delete(icount);
                            ContractOptionNext.Incompatible := true;
                          end;
                      end;
                  end;

                aQuote.Material := iMaterial;
                aQuote.Description := ContractOptionNext.Quotedescription;
                aQuote.DiscountValue := aQuote.TotalDiscount;

                aQuote.QMode := qAdd;
                aQuote.dbkey := 0;

                aQuote.ContractQuoteNumber := Contract.dbKey;
                aQuote.ContractLine := ContractLine.Line;
                aQuote.ContractOption := ContractOptionNext.OptionNumber;
                aQuote.ContractGroup := ContractOption.Group;

                aQuote.SaveToDB(true);

                ContractOptionNext.Quote := aQuote.dbKey;
                ContractOptionNext.NettPrice := aQuote.TotalPrice;
                ContractOptionNext.DeliveryPrice := aQuote.DeliveryPrice;
                ContractOptionNext.InstallPrice := aQuote.InstallPrice;
                ContractOptionNext.SurveyPrice := aQuote.SurveyPrice;
                ContractOptionNext.DiscountValue := aQuote.DiscountValue;
                ContractOptionNext.MarkupValue := aQuote.MarkupValue;
                ContractOptionNext.CellValue := aQuote.TotalGross;

                if ContractOptionNext.Incompatible then
                  sgDetails.Cells[icolumn+iCount1, irow] := 'ERROR'
                else
                  sgDetails.Cells[icolumn+iCount1, irow] := formatfloat('£#,##0.00',aQuote.TotalGross);
              end
            else
              begin
                messagedlg('No worktop elements exist for the original quote.', mtError, [mbOk], 0);
                exit;
              end;

            iCount1 := iCount1 + 1;
          finally
            aQuote.free;
          end;
        end;
    end;
end;

procedure TfrmWTMaintContract.sgEventsClick(Sender: TObject);
var
  aEvent: TContractEvent;
  inx: integer;
begin
  memEventNotes.Lines.Clear;
  if not Assigned(Contract.Events) then Exit;
  if Contract.Events.Count = 0 then Exit;

  inx := Contract.Events.IndexOf(sgEvents.row);
  aEvent := Contract.Events[inx];
  memEventNotes.Text := aEvent.Narrative.DataInfo;
end;

procedure TfrmWTMaintContract.sgEventsDblClick(Sender: TObject);
begin
  btnChangeEventsClick(self);
end;

procedure TfrmWTMaintContract.btnAddEventsClick(Sender: TObject);
begin
  CallMaintEvent(cqevAdd);
end;

procedure TfrmWTMaintContract.btnChangeEventsClick(Sender: TObject);
begin
  CallMaintEvent(cqevChange);
end;

procedure TfrmWTMaintContract.btnDeleteEventsClick(Sender: TObject);
begin
  CallMaintEvent(cqevDelete);
end;

procedure TfrmWTMaintContract.CallMaintEvent(aMode : TcqevMode);
var
  inx : integer;
  aEvent : TContractEvent;
  frm: TfrmWTMaintContractEvents;
begin
  inx := StrToIntDef(sgEvents.cells[0,sgEvents.row], 1);

  try
    frm := TfrmWTMaintContractEvents.Create(Self);
    try
      if aMode = cqevAdd then
        aEvent := TContractEvent.create(Contract)
      else
      begin
        inx := Contract.Events.IndexOf(inx);
        aEvent := Contract.Events[inx];
      end;
      Frm.ContractEvent := aEvent;
      Frm.Mode := aMode;
      Frm.OperatorName := frmWTMain.OperatorName;
      Frm.Operator := frmWTMain.Operator;
      Frm.ShowModal;
      if (aMode = cqevAdd) and (Frm.ModalResult <> mrOK) then
        aEvent.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEvents;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = cqevAdd then
      begin
        inx := pred(Contract.Events.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = cqevDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEvents.row := inx+1;
  end;
end;

procedure TfrmWTMaintContract.SetContractLine(const Value: TContractLine);
begin
  FContractLine := Value;
end;

procedure TfrmWTMaintContract.edtSupplierReferenceChange(Sender: TObject);
var
  irow: integer;
//  ContractLine: TContractLine;
begin
  ContractLine.SupplierReference := (Sender as TEdit).Text;
end;

procedure TfrmWTMaintContract.btnLineAttachClick(Sender: TObject);
var
  i, ipos, ilength, icount: integer;
  sFile, sFullFile, docDir: string;
begin
//  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey) + '\' + inttostr(ContractLine.Line);
  docdir := dtmdlWorktops.GetCompanyContractDirectory;

  if trim(docdir) = '' then
    exit
  else
    docDir := docdir + '\' + floattostr(Contract.QuoteNumber) + '\' + inttostr(ContractLine.Line);

  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  DocOpenDialog.Files.Clear;
  if DocOpenDialog.Execute then
  begin
    if DocOpenDialog.Files.Count > 0 then
      begin
        for icount := 0 to pred(DocOpenDialog.Files.Count) do
          begin
            sfullFile := DocOpenDialog.Files.Strings[icount];
            iLength := length(sFullFile);

            while i <> 0 do
              begin
                ipos := pos('\',sFullFile);

                sFullFile := stringreplace(sFullFile, '\', '!', []);

                i := pos('\',sFullFile);
              end;

            sFile := copy(DocOpenDialog.Files.Strings[icount], ipos+1, (iLength - ipos));

            FileCopy(DocOpenDialog.Files.Strings[icount], docDir + '\' + sFile) ;
          end;
        ShowLineDocuments;
      end;
  end;
end;

procedure TfrmWTMaintContract.pmnuOpenLineDocumentClick(Sender: TObject);
begin
  lstvwLineDocumentsDblClick(self);
end;

procedure TfrmWTMaintContract.MenuItem2Click(Sender: TObject);
var
  iRow: integer;
  sPath, sFileName: string;
  ListItem: TListItem;
begin
  iRow := lstvwLineDocuments.ItemIndex;
  if iRow = -1 then exit;
  if messagedlg('Delete the selected document?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ListItem := lstvwLineDocuments.items[irow];
      sFileName := ListItem.caption;

      lstvwLineDocuments.Items.Delete(iRow);

      //Delete the actual file only if not Converting or adding as we don't know the directory name
      if (Mode <> cqAdd) then
        begin
//          sPath :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbkey) + '\' + inttostr(ContractLine.Line) + '\';
          sPath :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' + inttostr(ContractLine.Line) + '\';

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
end;

procedure TfrmWTMaintContract.lstvwLineDocumentsDblClick(Sender: TObject);
var
  sPath, sDoc: string;
  FiName, Params: Array [0..255] of char ;
  itempResult: integer;
  sTempError: String ;
begin
//  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.dbKey) + '\' + inttostr(ContractLine.Line) +'\';
  sPath := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' + inttostr(ContractLine.Line) +'\';
  if sPath = '' then
    exit;

  if lstvwLineDocuments.ItemIndex = -1 then
    begin
      sDoc := '';
      exit;
    end
  else
    begin
      sDoc := lstvwLineDocuments.Items[lstvwLineDocuments.ItemIndex].caption;
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

procedure TfrmWTMaintContract.mnuAddToOrderClick(Sender: TObject);
var
  frm: TfrmWTMaintContractConvertOrder;
  frmSO: TfrmwtMaintSalesOrder;
  ContractOption: TContractOption;
  iCol, iRow, iCount: integer;
  aQuote: TQuote;
  aSlab: TQSlab;
  aSOrder: TSOrder;
  iQuote: integer;
  iQty: integer;
  rTotalArea, rSlabArea: real;
begin
  if  (Contract.ExpiryDate <> 0) and
      (Contract.ExpiryDate < date) then
      if MessageDlg('This contract has expired. Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;

  Frm := TfrmWTMaintContractConvertOrder.create(self);

  try
    with sgDetails do
      begin
        icol := col;
        iRow := row;

        ContractLine := Contract.lines[irow-1];
        ContractOption := ContractLine.Options[icol-2];

        if ContractOption.Quote = 0 then
          begin
            messagedlg('This drawing/option combination has not been quoted and therefore cannot be converted to an order', mtInformation, [mbOk], 0);
            exit;
          end;

        frm.customer := Contract.Customer;
        frm.edtCustomerName.Text := Contract.CustomerName;
        if Contract.Speculative then
          frm.edtCustomerName.Text := '';

        frm.GroupNumber := ContractOption.Group;
        frm.Quote := ContractOption.Quote;
        frm.Thickness := ContractOption.Thickness;

        frm.edtReference.Text := '';
        frm.Mode := 'A';
        Frm.showmodal;
        if frm.bOK = true then
          begin
            {Copy the original contract quote}
            aQuote := TQuote.Create(dtmdlAllQuote);
            try
              aQuote.DbKey := ContractOption.Quote;
              aQuote.qMode := qCopy;
              aQuote.LoadFromDB;
              aQuote.Reference := frm.edtReference.text;
              for icount := 0 to pred(aQuote.Elements.count) do
                begin
                  aQuote.Elements[icount].worktop := frm.Worktop;
                  aQuote.Elements[icount].thickness := frm.thickness;
                end;

              for icount := 0 to pred(aQuote.Upstands.count) do
                begin
                  aQuote.Upstands[icount].worktop := frm.Upstand;
                end;

              {Added the Slab details based on what has been selected - 28/10/2022}
              for icount := 0 to pred(aQuote.Slabs.count) do
                begin
                  aQuote.Slabs[icount].worktop := frm.Worktop;
                  aQuote.Slabs[icount].thickness := frm.thickness;
                end;

              aQuote.dbKey := 0;
              aQuote.Customer := frm.Customer;
              aQuote.CustomerName := frm.edtCustomerName.Text;
              aQuote.Inactive := 'N';
              aQuote.ContractQuote := false;

              aQuote.ContractQuoteNumber := Contract.dbKey;
              aQuote.ContractLine := ContractLine.Line;
              aQuote.ContractOption := ContractOption.OptionNumber;
              aQuote.ContractGroup := ContractOption.Group;

              {Add in slab details based on material/supplier and overall area}
              rSlabArea := (frm.SlabLength * frm.Slabdepth)/1000000;

              if (dtmdlWorktops.UseCostingSystem) and (aQuote.Slabs.count = 0) and (frm.Supplier <> 0) and (rSlabArea > 0) then
                begin
                  rTotalArea := aQuote.Elements.TotalArea + aQuote.Upstands.TotalArea;

                  iQty := 0;

                  repeat
                    iQty := iQty + 1;
                  until (rSlabArea * iQty) > rTotalArea;

                  aSlab := TQSlab.create(aQuote);
                  aSlab.QSlabNo := 1;
                  aSlab.Material := aQuote.Material;
                  aSlab.worktop := frm.Worktop;
                  aSlab.thickness := frm.Thickness;
                  aSlab.Supplier := frm.Supplier;
                  aSlab.length := frm.SlabLength;
                  aSlab.Depth := frm.SlabDepth;
                  aSlab.Quantity := iQty;
                  aSlab.UnitCost := frm.UnitCost;
                  aSlab.PriceUnit := frm.PriceUnit;
                  aSlab.WasteMultiplier := 0;
                  aSlab.WastePercentage := 0;
                  aSlab.WasteValue := 0;
                  aQuote.slabs.Add(aSlab);
                end;


              aQuote.SaveToDB(true);
              iQuote := aQuote.dbKey;

              {Move any line documents to the quote}
              try
//                MoveContractLineDocuments(Contract.dbKey, ContractLine.Line, iQuote);
                MoveContractLineDocumentsToQuote(Contract.QuoteNumber, ContractLine.Line, iQuote);
              except
              end;

            finally
              aQuote.Free;
            end;

            {Add to selected Sales Order}
            dtmdlSalesOrder := TdtmdlSalesOrder.create(application);

            try
              aSOrder := TSOrder.Create(dtmdlSalesOrder);
              try
                aSOrder.DbKey := frm.SalesOrder;
                aSOrder.LoadFromDB;

                aSOrder.DataModule.QuoteNo := iQuote;
                aSOrder.AddQuoteLine;
                aSOrder.MoveQuoteDocuments;
                
                FrmSO := TfrmwtMaintSalesOrder.Create(Self);
                try
                  FrmSO.Mode := sopChange;
                  FrmSO.SOrder := aSOrder;
                  FrmSO.ShowModal;
                  if FrmSO.ModalResult = idOK then
                    dtmdlAllQuote.UpdateQStatusSO(aSOrder.DataModule.QuoteNo, 24);
                finally
                  FrmSO.Free;
                end;
              finally
                aSOrder.Free;
              end;
            finally
              dtmdlSalesOrder.free;
            end;

          end;
        ClearGrid(sgDetails);
        BuildLineGrid;

        row := irow;
        col := icol;
      end;
  finally
    frm.Free;
  end;
end;

procedure TfrmWTMaintContract.edtCustomerNameClick(Sender: TObject);
begin
  if Contract.Speculative then
    begin
      frmWTMaintContractAddress := TfrmWTMaintContractAddress.create(self);
      try
        frmWTMaintContractAddress.Contract := Contract;
        frmWTMaintContractAddress.showmodal;
        if frmWTMaintContractAddress.bOK then
          begin
            edtCustomerName.Text := Contract.CustomerName;
            edtContact.Text := Contract.ContactName;
          end;
      finally
        frmWTMaintContractAddress.free;
      end;
    end;
end;

procedure TfrmWTMaintContract.edtContactChange(Sender: TObject);
begin
  Contract.ContactName := edtContact.Text;
end;

procedure TfrmWTMaintContract.ConvertToTradeCustomer(ContractOption: TContractOption);
var
  iOldCustomer, iAddress: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);

  try
    frmwtSrchCustomer.CodeSelected := Contract.Customer;
    frmwtSrchCustomer.Address := Contract.Address;

    frmwtSrchCustomer.edtSearch.Text := Contract.CustomerName;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
        iOldCustomer := Contract.Customer;
        Contract.Customer := frmwtSrchCustomer.CodeSelected;

        {Update Customer }
        Contract.SaveCustomerWorktopGroups(iOldCustomer);

        {Update quote with new customer details and remove address details}
        iAddress := Contract.Address;
        Contract.Address := 0;
        Contract.DataModule.UpdateQuoteAddress(Contract.dbKey, ContractOption.Quote, Contract.Customer, iAddress, frmwtSrchCustomer.NameSelected);
        Contract.Speculative := false;
      end;
  finally
    frmwtSrchCustomer.Free;
  end;
end;

procedure TfrmWTMaintContract.cmbOptionsClick(Sender: TObject);
begin
  if cmbOptions.ItemIndex >= 0 then
    edtQuoteValue.Text := formatfloat('£#,##0.00',Contract.GetOptionTotals(cmbOptions.ItemIndex)) else
    edtQuoteValue.Text := '';
end;

procedure TfrmWTMaintContract.edtExpiryDateExit(Sender: TObject);
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

procedure TfrmWTMaintContract.btnExpiryDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtExpiryDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtExpiryDate.text;

  edtExpiryDate.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

function TfrmWTMaintContract.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintContract.SpeedButton4Click(Sender: TObject);
begin
  edtExpiryDate.Text := '';
end;

procedure TfrmWTMaintContract.MoveOriginalContractDocuments;
var
  sSource, sDest: string;
  ListItem: TListItem;
  irow: integer;
begin
//  sSource := dtmdlWorktops.GetCompanyContractDirectory + '\' + inttostr(Contract.OriginalQuote) + '\' ;
  sSource := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(OriginalReQuote) + '\' ;
  sDest :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' ;

  for irow := 0 to pred(lstvwDocuments.items.count) do
    begin
      ListItem := lstvwDocuments.items[irow];
      //copy the file
      try
        filecopy(sSource+ListItem.Caption, sDest+ListItem.Caption);
      except
      end;
    end;
end;

procedure TfrmWTMaintContract.mnuAddSingleDrawingClick(Sender: TObject);
var
  iColumn, iRow: integer;
  icol: integer;
  PreviousLine: TContractLine;
  ContractOption: TContractOption;
begin
  with sgDetails do
    begin
      icolumn := col;
      iRow := row;

      ContractLine := TContractLine.Create(Contract);
      ContractLine.Line := Contract.Lines.count + 1;
      ContractLine.Mode := 'A';
      ContractLine.DrawingNumber := '';
      Contract.Lines.Add(ContractLine);

      {Now get the previous lines and add the option columns}
      PreviousLine := Contract.Lines[0];

      for icol := 2 to pred(sgDetails.colcount) do
        begin
          ContractOption := TContractOption.Create(ContractLine);
          ContractOption.OptionNumber := ContractLine.Options.count + 1;
          ContractOption.Group := PreviousLine.Options[icol-2].Group;
          ContractOption.Description := PreviousLine.Options[icol-2].Description;
          ContractOption.MaterialType := PreviousLine.Options[icol-2].MaterialType;
          ContractOption.Quotedescription := PreviousLine.Options[icol-2].QuoteDescription;
          ContractOption.Thickness := PreviousLine.Options[icol-2].Thickness;
          ContractLine.Options.Add(ContractOption);
        end;

      ClearGrid(sgDetails);
      BuildLineGrid;

      row := irow;
      col := icolumn;
    end;
end;

procedure TfrmWTMaintContract.mnuAddMultipleDrawingsClick(Sender: TObject);
var
  iCount, iColumn, iRow: integer;
  icol: integer;
  PreviousLine: TContractLine;
  ContractOption: TContractOption;
begin
  frmWTMaintContractLines := TfrmWTMaintContractLines.create(self);

  try
    frmWTMaintContractLines.showmodal;
    if frmWTMaintContractLines.bOK = true then
      begin
        icolumn := sgDetails.col;
        iRow := sgDetails.row;

        for icount := 1 to frmWTMaintContractLines.DrawingLines do
          begin
            ContractLine := TContractLine.Create(Contract);
            ContractLine.Line := Contract.Lines.count + 1;
            ContractLine.Mode := 'A';
            ContractLine.DrawingNumber := '';
            Contract.Lines.Add(ContractLine);

            {Now get the previous lines and add the option columns}
            PreviousLine := Contract.Lines[0];

            for icol := 2 to pred(sgDetails.colcount) do
              begin
                ContractOption := TContractOption.Create(ContractLine);
                ContractOption.OptionNumber := ContractLine.Options.count + 1;
                ContractOption.Group := PreviousLine.Options[icol-2].Group;
                ContractOption.Description := PreviousLine.Options[icol-2].Description;
                ContractOption.MaterialType := PreviousLine.Options[icol-2].MaterialType;
                ContractOption.Quotedescription := PreviousLine.Options[icol-2].QuoteDescription;
                ContractOption.Thickness := PreviousLine.Options[icol-2].Thickness;
                ContractLine.Options.Add(ContractOption);
              end;
          end;

        ClearGrid(sgDetails);
        BuildLineGrid;

        sgDetails.row := irow +1;
        sgDetails.col := 1;
      end;
  finally
    frmWTMaintContractLines.free
  end
end;

procedure TfrmWTMaintContract.mnuCopyDrawingClick(Sender: TObject);
var
  sDrawingNumber: string;
  iCount, iDrawingCount: integer;
  iColumn, iRow: integer;
  icol: integer;
  PreviousLine: TContractLine;
  ContractOption: TContractOption;
  aQuote: TQuote;
  iMaterial, iWorktop, iThickness: integer;
  rUnitSell, rDiscount: real;
begin
  with sgDetails do
    begin
      icolumn := col;
      iRow := row;

      sDrawingNumber := cells[1, iRow];

      if messagedlg('Copy Drawing ' + sDrawingNumber + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          iDrawingCount := 0;
          for iCount := 0 to pred(Contract.lines.count) do
            begin
              if sDrawingNumber = copy(Contract.lines[iCount].DrawingNumber,1,length(sDrawingNumber)) then
                inc(iDrawingCount);
            end;

          ContractLine := TContractLine.Create(Contract);
          ContractLine.Line := Contract.Lines.count + 1;
          ContractLine.Mode := 'A';
          ContractLine.DrawingNumber := sDrawingNumber + ' - Copy (' + inttostr(iDrawingCount) + ')';
          Contract.Lines.Add(ContractLine);

          {Now get the previous lines and add the option columns}
          PreviousLine := Contract.lines[irow-1];

          for icol := 2 to pred(sgDetails.colcount) do
            begin
              ContractOption := TContractOption.Create(ContractLine);
              ContractOption.OptionNumber := ContractLine.Options.count + 1;
              ContractOption.Group := PreviousLine.Options[icol-2].Group;
              ContractOption.Description := PreviousLine.Options[icol-2].Description;
              ContractOption.MaterialType := PreviousLine.Options[icol-2].MaterialType;
              ContractOption.Quotedescription := PreviousLine.Options[icol-2].QuoteDescription;
              ContractOption.Thickness := PreviousLine.Options[icol-2].Thickness;
              ContractLine.Options.Add(ContractOption);

              {Copy the option quote}
              aQuote := TQuote.Create(dtmdlAllQuote);
              try
                {Reset aQuote to original characteristics}
                aQuote.DbKey := PreviousLine.Options[iCol-2].Quote;
                aQuote.qMode := qChange;
                aQuote.LoadFromDB;
                {END reset}

                {Because we are copying the drawing then all we need to do is get original quote and re-number it}
                if (aQuote.elements.Count > 0) or (aQuote.Upstands.Count > 0) or (aQuote.Slabs.Count > 0) then
                  begin
                    aQuote.QMode := qAdd;
                    aQuote.dbkey := 0;
                    aQuote.ContractQuoteNumber := Contract.dbKey;
                    aQuote.ContractLine := ContractLine.Line;
                    aQuote.ContractOption := ContractOption.OptionNumber;
                    aQuote.ContractGroup := ContractOption.Group;
                    aQuote.SaveToDB(true);

                    ContractOption.Quote := aQuote.dbKey;
                    ContractOption.NettPrice := aQuote.TotalPrice;
                    ContractOption.DeliveryPrice := aQuote.DeliveryPrice;
                    ContractOption.InstallPrice := aQuote.InstallPrice;
                    ContractOption.SurveyPrice := aQuote.SurveyPrice;
                    ContractOption.DiscountValue := aQuote.DiscountValue;
                    ContractOption.MarkupValue := aQuote.MarkupValue;
                    ContractOption.CellValue := aQuote.TotalGross;

                    if ContractOption.Incompatible then
                      sgDetails.Cells[icolumn+iCol, irow] := 'ERROR'
                    else
                      sgDetails.Cells[icolumn+iCol, irow] := formatfloat('£#,##0.00',aQuote.TotalGross);
                  end
                else
                  begin
                    messagedlg('No worktop elements exist for the original quote.', mtError, [mbOk], 0);
                    break;
                  end;

              finally
                aQuote.free;
              end;
            end;

          ClearGrid(sgDetails);
          BuildLineGrid;

          row := irow;
          col := icolumn;
        end;
    end;
end;

procedure TfrmWTMaintContract.memUnitsChange(Sender: TObject);
begin
  try
    ContractLine.NumberOfUnits := strtoint((Sender as TMemo).Text);
  except
    ContractLine.NumberOfUnits := 0;
  end
end;

procedure TfrmWTMaintContract.memUnitsExit(Sender: TObject);
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
end;

procedure TfrmWTMaintContract.memUnitsEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintContract.ParseMessage(const AFileName: string; var ATo, AFrom,
  ASubject, ADate, ABody: string);
var
  iLength: integer;
  MyUnicode: Boolean;
  MyFileStream: TFileStream;
  MyFileSize: Integer;
  MyDataHandle: HGlobal;
  MyBuffer: Pointer;
  MyLockBytes: ILockBytes;
  MyStorage: IStorage;
  MyHeader: string;
  MyStrings: TStrings;

  function MyGetProperty(const AStorage: IStorage; AProperty: Word): string;
  const
    MyTString: array[Boolean] of Word = (PT_STRING8, PT_UNICODE);
  var
    MyIStream: IStream;
    MyStreamName: WideString;
    MyOleStream: TOleStream;
    MyStream: TMemoryStream;
    MySucceeded: Boolean;
  begin
{ Construct the predefined stream name }
    MyStreamName := Format('__substg1.0_%.4x%.4x', [AProperty, MyTString[MyUnicode]]);
{ Read a stream, if present, within the storage. }
    MySucceeded := Succeeded(AStorage.OpenStream(PWideChar(MyStreamName), nil,
      STGM_READ or STGM_SHARE_EXCLUSIVE, 0, MyIStream));
    if not MySucceeded then begin
{ Turn MyUnicode over }
      MyUnicode := not MyUnicode;
      MyStreamName := Format('__substg1.0_%.4x%.4x', [AProperty, MyTString[MyUnicode]]);
      MySucceeded := Succeeded(AStorage.OpenStream(PWideChar(MyStreamName), nil,
        STGM_READ or STGM_SHARE_EXCLUSIVE, 0, MyIStream));
    end;
    if MySucceeded then begin
      MyOleStream := TOleStream.Create(MyIStream);
      try
        MyStream := TMemoryStream.Create;
        try
          MyStream.CopyFrom(MyOleStream, 0);
          if MyUnicode then
            Result := PWideChar(MyStream.Memory)
          else
            Result := PChar(MyStream.Memory);
          SetLength(Result, StrLen(PChar(Result))); //  Remove the final #0
        finally
          MyStream.Free;
        end;
      finally
        MyOleStream.Free;
      end;
    end;
  end;

begin
{ Open the copy of the message stored in the project directory }
  MyFileStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyWrite);
  try
    MyFileSize := MyFileStream.Size;
{ Open the file as a Structured Storage }
    MyDataHandle := GlobalAlloc(GMEM_MOVEABLE, MyFileSize);
    try
      MyBuffer := GlobalLock(MyDataHandle);
      try
        MyFileStream.ReadBuffer(MyBuffer^, MyFileSize);
      finally
        GlobalUnlock(MyDataHandle);
      end;

      OleCheck(CreateILockBytesOnHGlobal(MyDataHandle, True, MyLockBytes));
      OleCheck(StgOpenStorageOnILockBytes(MyLockBytes, nil, STGM_READWRITE or
        STGM_SHARE_EXCLUSIVE, nil, 0, MyStorage));

{ Outlook 97/2000 return ANSI strings, Outlook XP/2003 return Unicode strings.
 MyUnicode will be turned on/off in MyGetProperty automatically. }
      MyUnicode := True;
{ If the message came from the Internet, it has got a RFC-compliant header }
      MyHeader := MyGetProperty(MyStorage, PR_TRANSPORT_MESSAGE_HEADERS);
{ Otherwise, construct a simple substitute from internal properties. }
      if MyHeader = '' then begin
        MyHeader :=
          'To: ' + MyGetProperty(MyStorage, PR_DISPLAY_TO) +
          ' ' + MyGetProperty(MyStorage, PR_DISPLAY_CC) +
          ' ' + MyGetProperty(MyStorage, PR_DISPLAY_BCC) + #13#10 +
          'From: ' + MyGetProperty(MyStorage, PR_SENDER_NAME) +
          ' ' + MyGetProperty(MyStorage, PR_SENDER_EMAIL_ADDRESS) + #13#10 +
          'Subject: ' + MyGetProperty(MyStorage, PR_SUBJECT) + #13#10 +
          'Date: ' + MyGetProperty(MyStorage, PR_LAST_MODIFICATION_TIME);
      end;
      ABody := MyGetProperty(MyStorage, PR_BODY);

    finally
      GlobalFree(MyDataHandle);
    end;
  finally
    MyFileStream.Free;
  end;

  { Parse the header as an RFC-compliant header. Exploit INI-files support buil-in in TStrings }
  MyHeader := StringReplace(MyHeader, 'To: ', 'To=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'From: ', 'From=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'Subject: ', 'Subject=', [rfReplaceAll, rfIgnoreCase]);
  MyHeader := StringReplace(MyHeader, 'Date: ', 'Date=', [rfReplaceAll, rfIgnoreCase]);
  MyStrings := TStringList.Create;
  try
    MyStrings.Text := MyHeader;
    ATo := MyStrings.Values['To'];
    AFrom := MyStrings.Values['From'];
    AFrom := ParseDocumentFrom(AFrom);
    ASubject := MyStrings.Values['Subject'];
    ADate := MyStrings.Values['Date'];
  finally
    MyStrings.Free;
  end;
{ Trancate the body text and remove line-ends }
  ABody := StringReplace(Copy(ABody, 0, 64), #13, ' ', [rfReplaceAll]);
  ABody := StringReplace(ABody, #10, ' ', [rfReplaceAll]) + ' ...';
end;

function TfrmWTMaintContract.ParseDocumentFrom(tmpFrom: string): string;
var
  icount: integer;
  Alphas, Numbers: string;
begin
  Alphas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ';
  Numbers := '01234567890.';

  Result := '';

  if pos('@',tmpFrom) = 0 then
    begin
      for icount := 1 to length(tmpFrom) do
        begin
          if pos(copy(tmpFrom,icount,1),Alphas) > 0 then
            begin
              Result := Result + copy(tmpFrom,icount,1);
              continue;
            end;
          if pos(copy(tmpFrom,icount,1),Numbers) > 0 then
            begin
              Result := Result + copy(tmpFrom,icount,1);
              continue;
            end;
        end;
    end
  else
    result := trim(stringreplace(tmpFrom,'"', ' ',[rfReplaceAll]));
end;

function TfrmWTMaintContract.FormatDateasDateTime(sDate: string): TDateTime;
var
  icount, iStart, iLength: integer;
  tmpDate: string;
  Months: array [1..2,1..12] of string;
begin
  iStart := pos(',',sDate)+1;
  iLength := length(sDate);
  tmpDate := copy(sDate,iStart,21);

  Months[1,1] := '01';
  Months[1,2] := '02';
  Months[1,3] := '03';
  Months[1,4] := '04';
  Months[1,5] := '05';
  Months[1,6] := '06';
  Months[1,7] := '07';
  Months[1,8] := '08';
  Months[1,9] := '09';
  Months[1,10] := '10';
  Months[1,11] := '11';
  Months[1,12] := '12';

  Months[2,1] := 'Jan';
  Months[2,2] := 'Feb';
  Months[2,3] := 'Mar';
  Months[2,4] := 'Apr';
  Months[2,5] := 'May';
  Months[2,6] := 'Jun';
  Months[2,7] := 'Jul';
  Months[2,8] := 'Aug';
  Months[2,9] := 'Sep';
  Months[2,10] := 'Oct';
  Months[2,11] := 'Nov';
  Months[2,12] := 'Dec';

  for icount := 1 to 12 do
    begin
      if pos(' '+Months[2,icount]+' ',tmpDate) > 0 then
        begin
          tmpDate := stringreplace(tmpDate,' '+Months[2,icount]+' ','/'+Months[1,icount]+'/',[]);
          break;
        end;
    end;
  iLength := length(tmpDate);
  result := padatestr(copy(trim(tmpDate),1,10));
end;

procedure TfrmWTMaintContract.lstvwDocumentsColumnClick(Sender: TObject;
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

procedure TfrmWTMaintContract.lstvwDocumentsCompare(Sender: TObject; Item1,
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

procedure TfrmWTMaintContract.pmnuDocumentsPopup(Sender: TObject);
begin
  if Mode = cqAdd then
    exit
  else
    begin
      pmnuDelete.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuOpen.Enabled := (lstvwDocuments.Items.count > 0);
      pmnuSelectAll.Enabled := (lstvwDocuments.Items.count > 0);
    end;

end;

procedure TfrmWTMaintContract.pmnuPasteClick(Sender: TObject);
var
  f: THandle;
  buffer: Array [0..MAX_PATH] of Char;
  i, numFiles: Integer;
  sFile, sFullFile, docdir: string;
  iCount, iPos, iLength: integer;
begin
  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber);
  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  Clipboard.Open;
  try
    f := Clipboard.GetAsHandle(CF_HDROP);
    if f <> 0 then
    begin
      numFiles := DragQueryFile(f, $FFFFFFFF, nil, 0);
//      memo1.Clear;
      for i:= 0 to numfiles - 1 do
      begin
        buffer[0] := #0;
        DragQueryFile( f, i, buffer, sizeof(buffer));

        sfullFile := buffer;
        iLength := length(sFullFile);

        iCount := 1;

        while iCount <> 0 do
          begin
            ipos := pos('\',sFullFile);

            sFullFile := stringreplace(sFullFile, '\', '!', []);

            iCount := pos('\',sFullFile);
          end;

        sFile := copy(buffer, ipos+1, (iLength - ipos));

        FileCopy(buffer, docDir + '\' + sfile) ;
      end;
    end;
  finally
    Clipboard.close;
  end;
  ShowDocuments;
end;

procedure TfrmWTMaintContract.pmnuDeleteClick(Sender: TObject);
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
      if (Mode <> cqAdd) then
        begin
          sPath :=  dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' ;

          //copy the file
          deletefile(sPath+sfileName);
        end;
    end;
end;

procedure TfrmWTMaintContract.pmnuSelectAllClick(Sender: TObject);
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

procedure TfrmWTMaintContract.Paste1Click(Sender: TObject);
var
  f: THandle;
  buffer: Array [0..MAX_PATH] of Char;
  i, numFiles: Integer;
  sFile, sFullFile, docdir: string;
  iCount, iPos, iLength: integer;
begin
  docDir := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(Contract.QuoteNumber) + '\' + inttostr(ContractLine.Line);
  {Find a document} ;

  if not DirectoryExists(docDir) then
  	begin
     	CreateDirectory(docDir);
  	end;

  Clipboard.Open;
  try
    f := Clipboard.GetAsHandle(CF_HDROP);
    if f <> 0 then
    begin
      numFiles := DragQueryFile(f, $FFFFFFFF, nil, 0);
//      memo1.Clear;
      for i:= 0 to numfiles - 1 do
      begin
        buffer[0] := #0;
        DragQueryFile( f, i, buffer, sizeof(buffer));

        sfullFile := buffer;
        iLength := length(sFullFile);

        iCount := 1;

        while iCount <> 0 do
          begin
            ipos := pos('\',sFullFile);

            sFullFile := stringreplace(sFullFile, '\', '!', []);

            iCount := pos('\',sFullFile);
          end;

        sFile := copy(buffer, ipos+1, (iLength - ipos));

        FileCopy(buffer, docDir + '\' + sfile) ;
      end;
    end;
  finally
    Clipboard.close;
  end;
  ShowLineDocuments;
end;

procedure TfrmWTMaintContract.SelectAll1Click(Sender: TObject);
var
  icount: integer;
begin
  with lstvwLineDocuments do
    begin
      Items.BeginUpdate;
      for icount := 0 to pred(items.count) do
        begin
          items[icount].selected := true ;
        end;
      Items.EndUpdate;
    end;
end;

procedure TfrmWTMaintContract.mnuPriceChangeOptionClick(Sender: TObject);
begin
  CallMaintMarkup('C');
end;

procedure TfrmWTMaintContract.mnuPriceOptionDrawingClick(Sender: TObject);
begin
  CallMaintMarkup('R');
end;

procedure TfrmWTMaintContract.mnuPriceOptionAllClick(Sender: TObject);
begin
  CallMaintMarkup('Q');
end;

procedure TfrmWTMaintContract.CallMaintMarkup(MarkupType: string);
var
  iMarkupType: integer;
  iRow, iColumn: integer;
  rMarkup: real;
  bMarkupCharges, bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting: boolean;
begin
  with sgDetails do
    begin
      iRow := row;
      iColumn := col;
    end;

  frmWTMaintContractMarkup := TfrmWTMaintContractMarkup.create(self);
  try
    frmWTMaintContractMarkup.MarkupType := MarkupType;
    frmWTMaintContractMarkup.showmodal;
    if frmWTMaintContractMarkup.ModalResult = mrOK then
      begin
        iMarkupType := frmWTMaintContractMarkup.rdgrpMarkupType.Itemindex;
        rMarkup := StrToFloatDef(frmWTMaintContractMarkup.edtMarkup.text, 0, FormatSettings);
        bMarkupCutOuts := frmWTMaintContractMarkup.MarkupCutOuts;
        bMarkupEdges := frmWTMaintContractMarkup.MarkupEdges;
        bMarkupMaterials := frmWTMaintContractMarkup.MarkupMaterials;
        bMarkupCharges := frmWTMaintContractMarkup.MarkupCharges;
        bMarkupFitting := frmWTMaintContractMarkup.MarkupFitting;

        case iMarkupType of
          0:  MarkupColumn(iColumn, rMarkup, bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges);
          1:  MarkupRow(iRow, rMarkup,  bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges);
        else
          MarkupContract(rMarkup, bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges);
        end;

      end;
  finally
    frmWTMaintContractMarkup.free;
  end;
end;

procedure TfrmWTMaintContract.MarkupColumn(iCol: integer; rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
var
  iRow, Key: integer;
  ContractOption: TContractOption;
begin
  for iRow := 0 to pred(Contract.Lines.count) do
    begin
      ContractLine := Contract.lines[irow];
      ContractOption := ContractLine.Options[icol-2];

      Key := ContractOption.Quote;

      if key > 0 then
        begin
          MarkupQuote(iCol, iRow+1, ContractOption, key, rMarkup, bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges);
          ContractOption.QuoteMarkup := rMarkup;
        end;
    end;
end;

procedure TfrmWTMaintContract.MarkupRow(iRow: integer;  rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
var
  iCol, Key: integer;
  ContractOption: TContractOption;
begin
  ContractLine := Contract.lines[irow-1];

  for iCol := 0 to pred(ContractLine.Options.count) do
    begin
      ContractOption := ContractLine.Options[icol];

      Key := ContractOption.Quote;

      if key > 0 then
        begin
          MarkupQuote(iCol+2, iRow, ContractOption, key, rMarkup, bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges);
          ContractOption.QuoteMarkup := rMarkup;
        end;
    end;
end;

procedure TfrmWTMaintContract.MarkupContract(rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
var
  iRow, iCol, Key: integer;
  ContractOption: TContractOption;
begin
  for iRow := 0 to pred(Contract.Lines.count) do
    begin
      ContractLine := Contract.lines[irow];

      for iCol := 0 to pred(ContractLine.Options.count) do
        begin
          ContractOption := ContractLine.Options[icol];

          Key := ContractOption.Quote;

          if key > 0 then
            begin
              MarkupQuote(iCol+2, iRow+1, ContractOption, key, rMarkup, bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges);
              ContractOption.QuoteMarkup := rMarkup;
            end;
        end;
    end;
end;

procedure TfrmWTMaintContract.MarkupQuote(iCol, iRow: integer; ContractOption: TContractOption; key: integer; rMarkup: real; bMarkupCutOuts, bMarkupEdges, bMarkupMaterials, bMarkupFitting, bMarkupCharges: boolean);
var
  aQuote: TQuote;
  iCount: integer;
begin
  aQuote := TQuote.Create(dtmdlAllQuote);

  try
    aQuote.DbKey := key;
    aQuote.qMode := qChange;
    aQuote.LoadFromDB;

    {Re-price the materials}
    if bMarkupMaterials then
      begin
        if (aQuote.elements.Count > 0) or (aQuote.Upstands.Count > 0) or (aQuote.Slabs.count > 0) then
          begin
            {Check if there any worktops}
            if aQuote.elements.Count > 0 then
              begin
                for icount := 0 to pred(aQuote.elements.Count) do
                  begin
                    aQuote.Elements[icount].UnitPrice := aQuote.Elements[icount].UnitPrice * (1+(rMarkup/100));
                  end;
              end;

            {Check the upstands if there are any}
            if aQuote.Upstands.Count > 0 then
              begin
                for icount := 0 to pred(aQuote.upstands.Count) do
                  begin
                    aQuote.Upstands[icount].UnitPrice := aQuote.Upstands[icount].UnitPrice * (1+(rMarkup/100));
                    aQuote.Upstands[icount].PolishPrice := aQuote.Upstands[icount].PolishPrice * (1+(rMarkup/100));
                  end;
              end;

            {Check if there are any slabs}
            if (aQuote.slabs.count > 0) then
              begin
                for icount := 0 to pred(aQuote.slabs.Count) do
                  begin
                    aQuote.slabs[icount].UnitPrice := aQuote.slabs[icount].UnitPrice * (1+(rMarkup/100));
                  end;
              end
          end;
      end;

    {Re-price the cut outs}
    if bMarkupCutOuts then
      begin
        if aQuote.CutOuts.Count > 0 then
          begin
            for icount := pred(aQuote.cutouts.Count) downto 0 do
              begin
                aQuote.CutOuts[icount].UnitPrice := aQuote.CutOuts[icount].UnitPrice * (1+(rMarkup/100));
              end;
          end;
      end;

    {Re-price the edges}
    if bMarkupCutOuts then
      begin
        if aQuote.Edges.Count > 0 then
          begin
            for icount := pred(aQuote.Edges.Count) downto 0 do
              begin
                aQuote.Edges[icount].UnitPrice := aQuote.Edges[icount].UnitPrice * (1+(rMarkup/100));
              end;
          end;
      end;

    {Re-price the edges}
    if bMarkupCharges then
      begin
        if aQuote.Extras.count > 0 then
          begin
            for icount := pred(aQuote.Extras.Count) downto 0 do
              begin
                aQuote.Extras[icount].UnitPrice := aQuote.Extras[icount].UnitPrice * (1+(rMarkup/100));
              end;
          end;
      end;

    {Reprice Template, Fitting and Delivery}
    if bMarkupFitting then
      begin
        aQuote.SurveyPrice := aQuote.SurveyPrice * (1+(rMarkup/100));
        aQuote.InstallPrice := aQuote.InstallPrice * (1+(rMarkup/100));
        aQuote.DeliveryPrice := aQuote.DeliveryPrice * (1+(rMarkup/100));
      end;

    {Recalculate Discount Value based on Discount Percntage}
     aQuote.DiscountValue := aQuote.TotalPrice * (aQuote.DiscountRate/100);
    {Save all the details}
     aQuote.SaveToDB(true);

     sgDetails.Cells[icol, irow] := formatfloat('£#,##0.00',aQuote.TotalGross);
     ContractOption.NettPrice := aQuote.TotalPrice;
     ContractOption.DeliveryPrice := aQuote.DeliveryPrice;
     ContractOption.InstallPrice := aQuote.InstallPrice;
     ContractOption.SurveyPrice := aQuote.SurveyPrice;
     ContractOption.DiscountValue := aQuote.DiscountValue;
     ContractOption.MarkupValue := aQuote.MarkupValue;
     ContractOption.CellValue := aQuote.TotalGross;
  finally
    aQuote.Free;
  end;
end;

procedure TfrmWTMaintContract.mnuPriceOptionUndoClick(Sender: TObject);
var
  iRow, iCol, OriginalKey, Key, iCount: integer;
  ContractOption: TContractOption;
  aOriginalQuote, aQuote: TQuote;
begin
  for iRow := 0 to pred(Contract.Lines.count) do
    begin
      ContractLine := Contract.lines[irow];

      for iCol := 0 to pred(ContractLine.Options.count) do
        begin
          ContractOption := ContractLine.Options[icol];

          Originalkey := ContractOption.OriginalQuote;
          key := ContractOption.Quote;

          if key = 0 then continue;

          aOriginalQuote := TQuote.Create(dtmdlAllQuote);
          aQuote := TQuote.Create(dtmdlAllQuote);

          try
            aOriginalQuote.DbKey := OriginalKey;
            aOriginalQuote.LoadFromDB;

            aQuote.DbKey := Key;
            aQuote.LoadFromDB;

            {Check if there any worktops}
            if aQuote.elements.Count > 0 then
              begin
                for icount := 0 to pred(aQuote.elements.Count) do
                  begin
                    aQuote.Elements[icount].UnitPrice := aOriginalQuote.Elements[icount].UnitPrice;
                  end;
              end;

            {Check the upstands if there are any}
            if aQuote.Upstands.Count > 0 then
              begin
                for icount := 0 to pred(aQuote.upstands.Count) do
                  begin
                    aQuote.Upstands[icount].UnitPrice := aOriginalQuote.Upstands[icount].UnitPrice;
                    aQuote.Upstands[icount].PolishPrice := aOriginalQuote.Upstands[icount].PolishPrice;
                  end;
              end;

            {Check if there are any slabs}
            if (aQuote.slabs.count > 0) then
              begin
                for icount := 0 to pred(aQuote.slabs.Count) do
                  begin
                    aQuote.slabs[icount].UnitPrice := aOriginalQuote.slabs[icount].UnitPrice;
                  end;
              end;

            {Re-price the cut outs}
            if aQuote.CutOuts.Count > 0 then
              begin
                for icount := pred(aQuote.cutouts.Count) downto 0 do
                  begin
                    aQuote.CutOuts[icount].UnitPrice := aOriginalQuote.CutOuts[icount].UnitPrice;
                  end;
              end;

            {Re-price the edges}
            if aQuote.Edges.Count > 0 then
              begin
                for icount := pred(aQuote.Edges.Count) downto 0 do
                  begin
                    aQuote.Edges[icount].UnitPrice := aOriginalQuote.Edges[icount].UnitPrice;
                  end;
              end;

            {Reprice Template, Fitting and Delivery}
            aQuote.SurveyPrice := aOriginalQuote.SurveyPrice;
            aQuote.InstallPrice := aOriginalQuote.InstallPrice;
            aQuote.DeliveryPrice := aOriginalQuote.DeliveryPrice;
            aQuote.DiscountRate := aOriginalQuote.DiscountRate;

            {Recalculate Discount Value based on Discount Percntage}
            aQuote.DiscountValue := aQuote.TotalPrice * (aOriginalQuote.DiscountRate/100);

            {Save all the details}
            aQuote.SaveToDB(true);

            sgDetails.Cells[icol+2, irow+1] := formatfloat('£#,##0.00',aQuote.TotalGross);
            ContractOption.NettPrice := aQuote.TotalPrice;
            ContractOption.DeliveryPrice := aQuote.DeliveryPrice;
            ContractOption.InstallPrice := aQuote.InstallPrice;
            ContractOption.SurveyPrice := aQuote.SurveyPrice;
            ContractOption.DiscountValue := aQuote.DiscountValue;
            ContractOption.MarkupValue := aQuote.MarkupValue;
            ContractOption.CellValue := aQuote.TotalGross;
            ContractOption.QuoteMarkup := 0;
          finally
            aOriginalQuote.free;
            aQuote.free;
          end;
        end;
    end;
end;

procedure TfrmWTMaintContract.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = cqView then exit;

  TempWord := MessageDlg('Do you want to save these quote details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    btnOKClick(self);
end;

procedure TfrmWTMaintContract.edtSiteContactChange(Sender: TObject);
begin
  Contract.SiteContact := edtSiteContact.text;
end;

procedure TfrmWTMaintContract.edtSitePhoneChange(Sender: TObject);
begin
  Contract.SitePhone := edtSitePhone.text;
end;

procedure TfrmWTMaintContract.MoveContractLineDocumentsToSalesOrder(
  rContract: real; iLine: integer; rSalesOrder: real);
var
  sSource, sDest: string;
  irow: integer;
  SearchRec: TSearchRec;
  FileInfo: SHFILEINFO;
  sFilename: string;
  sFolderName: string;
begin
  sFolderName := dtmdlWorktops.GetContractDrawingFolderName;

  sSource := dtmdlWorktops.GetCompanyContractDirectory + '\' + floattostr(rContract) + '\' + inttostr(iLine) + '\';

  if trim(sFolderName) <> '' then
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + floattostr(rSalesOrder) + '\' + sFolderName + '\'
  else
    sDest :=  dtmdlWorktops.GetCompanySalesDirectory + '\' + floattostr(rSalesOrder) + '\';

  // search for the first file
  irow := FindFirst(sSource + '*.*', faArchive, SearchRec);

  while irow = 0 do
    begin
      // On directories and volumes
      if ((SearchRec.Attr and FaDirectory <> FaDirectory) and
        (SearchRec.Attr and FaVolumeId <> FaVolumeID)) then
        begin
          //Get The DisplayName
          SHGetFileInfo(PChar(sSource + SearchRec.Name), 0, FileInfo, SizeOf(FileInfo), SHGFI_DISPLAYNAME);

          sFilename := SearchRec.Name;

          filecopy(sSource+sFilename, sDest+sFilename);
        end;
      irow := FindNext(SearchRec);
    end;
end;

procedure TfrmWTMaintContract.SpeedButton1Click(Sender: TObject);
begin
  dblkpRevenueCentre.KeyValue := 0;
  Contract.RevenueCentre := 0;
end;

procedure TfrmWTMaintContract.dblkpRevenueCentreClick(Sender: TObject);
begin
  Contract.RevenueCentre := dblkpREvenueCentre.KeyValue;
end;

procedure TfrmWTMaintContract.sgDetailsKeyPress(Sender: TObject;
  var Key: Char);
begin
  with sgDetails do
    begin
	    if (Col > 1) then
        begin
          case Ord(key) of
            $30..$39: ;
            vk_back: ;
            vk_return: ;
            vk_tab: ;
            VK_DECIMAL	: ;
            Ord('.'): ;
          else
            MessageBeep(0);
            key := #0;
          end;
        end;
    end;
end;

end.

