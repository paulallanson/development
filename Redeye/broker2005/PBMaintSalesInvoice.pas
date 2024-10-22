unit PBMaintSalesInvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, PBSalesInvoiceDM,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBCtrls, PBPOObjects, Menus, CCSCommon,
  FireDAC.Stan.Param;

type
  TPBMaintSalesInvoicefrm = class(TForm)
    stbrDetails: TStatusBar;
    pnlBottom: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    pnlTop: TPanel;
    pnlFooter: TPanel;
    pnlHeader: TPanel;
    Label1: TLabel;
    edtInvNumber: TEdit;
    Label2: TLabel;
    edtInvoiceDate: TEdit;
    btnInvDate: TBitBtn;
    Label9: TLabel;
    dblkpOperator: TDBLookupComboBox;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    memGoods: TMemo;
    memVAT: TMemo;
    memTotal: TMemo;
    Label6: TLabel;
    memInvToCustomer: TMemo;
    Label7: TLabel;
    edtAccountCode: TEdit;
    btnInvToCustomer: TBitBtn;
    Label8: TLabel;
    memCustomer: TMemo;
    Panel7: TPanel;
    sgCharges: TStringGrid;
    Panel8: TPanel;
    Label10: TLabel;
    btnCustomer: TBitBtn;
    pmnLines: TPopupMenu;
    pmnCharges: TPopupMenu;
    mnChangeLine: TMenuItem;
    mnDeleteLine: TMenuItem;
    N1: TMenuItem;
    mnAddfromOrder: TMenuItem;
    mnAddfromSalesOrder: TMenuItem;
    mnAddfromJobBag: TMenuItem;
    mnAddChg: TMenuItem;
    mnChangeChg: TMenuItem;
    mnDeleteChg: TMenuItem;
    pmnDummy: TPopupMenu;
    lblDeleteprompt: TLabel;
    Label11: TLabel;
    dblkpRep: TDBLookupComboBox;
    btnNotes: TBitBtn;
    FlashTimer: TTimer;
    btnInternalNotes: TBitBtn;
    IntFlashTimer: TTimer;
    lblReference: TStaticText;
    mnNotPrinted: TMenuItem;
    N2: TMenuItem;
    mnAddfromOtherJobBag: TMenuItem;
    pnlCreditReason: TPanel;
    Label13: TLabel;
    dblkpCreditReason: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    chkbxEInvoice: TCheckBox;
    sgLines: TStringGrid;
    pnlHeaderDesc: TPanel;
    Label12: TLabel;
    edtDesc: TEdit;
    Label14: TLabel;
    edtCustOrderNo: TEdit;
    lblJobRevenue: TLabel;
    dblkpJobRevenue: TDBLookupComboBox;
    chkbxCashSale: TCheckBox;
    btnDetails: TBitBtn;
    imgChkbxChecked: TImage;
    imgChkbxUnChecked: TImage;
    imgChkBxInvoiceAll: TImage;
    btnDelete: TBitBtn;
    chkbxDelNote: TCheckBox;
    pnlPackPrice: TPanel;
    Label51: TLabel;
    labUnitSell: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    FormRefClrBitBtn: TBitBtn;
    memQuantity: TMemo;
    pnlSubReps: TPanel;
    Label15: TLabel;
    dblkpSubRep: TDBLookupComboBox;
    btnClearClaim: TBitBtn;
    btnReps: TBitBtn;
    pnlEndUser: TPanel;
    Label53: TLabel;
    edtEndUser: TEdit;
    btnEndUser: TBitBtn;
    lblAltInvoiceNumber: TLabel;
    edtAltInvoiceNumber: TEdit;
    pnlBody: TPanel;
    procedure CheckOK(Sender : TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnInvDateClick(Sender: TObject);
    procedure btnInvToCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure pmnLinesPopup(Sender: TObject);
    procedure pmnChargesPopup(Sender: TObject);
    procedure mnChangeLineClick(Sender: TObject);
    procedure sgLinesDblClick(Sender: TObject);
    procedure mnChangeChgClick(Sender: TObject);
    procedure mnAddChgClick(Sender: TObject);
    procedure sgChargesDblClick(Sender: TObject);
    procedure sgLinesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sgChargesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure btnNotesClick(Sender: TObject);
    procedure CheckNotes(Sender: TObject);
    procedure FlashTimerTimer(Sender: TObject);
    procedure dblkpRepClick(Sender: TObject);
    procedure dblkpOperatorClick(Sender: TObject);
    procedure mnDeleteLineClick(Sender: TObject);
    procedure mnDeleteChgClick(Sender: TObject);
    procedure edtInvoiceDateExit(Sender: TObject);
    procedure mnAddfromJobBagClick(Sender: TObject);
    procedure IntFlashTimerTimer(Sender: TObject);
    procedure btnInternalNotesClick(Sender: TObject);
    procedure mnNotPrintedClick(Sender: TObject);
    procedure edtDescChange(Sender: TObject);
    procedure chkbxCashSaleClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblkpJobRevenueClick(Sender: TObject);
    procedure mnAddfromOtherJobBagClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblkpCreditReasonClick(Sender: TObject);
    procedure chkbxEInvoiceClick(Sender: TObject);
    procedure edtCustOrderNoChange(Sender: TObject);
    procedure btnDetailsClick(Sender: TObject);
    procedure sgLinesTopLeftChanged(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure chkbxDelNoteClick(Sender: TObject);
    procedure dblkpPriceUnitClick(Sender: TObject);
    procedure memQuantityChange(Sender: TObject);
    procedure memQuantityEnter(Sender: TObject);
    procedure memQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure ValidateQty(Sender: TObject);
    procedure FormRefClrBitBtnClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dblkpSubRepClick(Sender: TObject);
    procedure btnClearClaimClick(Sender: TObject);
    procedure btnRepsClick(Sender: TObject);
    procedure btnEndUserClick(Sender: TObject);
    procedure edtAltInvoiceNumberChange(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    bIntNotesFlash: ByteBool;
    FNominalLevel: string;
    sOldValue: string;
    FActivated : Boolean;
    FSalesInvoice: TSalesInvoice;
    FMode: TsiMode;
    sInvoiceorCredit: string;
    AccountsPackage: string;
    procedure BuildChargesGrid;
    procedure BuildLineGrid;
    procedure CallMaintScreen(aMode : TsilMode);
    procedure CallMaintChgsScreen(aMode : TsicMode);
    procedure ClearGrid(tempGrid: TStringGrid);
    procedure GetCustomerReps(tempno: integer);
    procedure GetInvoiceTo(tempcust, TempBranch: integer);
    procedure SetLineHeaders;
    procedure SetMode(const Value: TsiMode);
    procedure SetSalesInvoice(const Value: TSalesInvoice);
    procedure ShowDetails;
    procedure ShowCharges;
    procedure ShowLineDetails;
    procedure ShowTotals;
    procedure CallJBSelectScreen;
    procedure SetComponentColours;
    function DontPrintLine: boolean;
    procedure CallAllJBSelectScreen;
    function CheckforRelatedCharges(tmpLine: integer): boolean;
    procedure DeleteChargeLines(tmpLine: integer);
    procedure ImageClick(Sender: TObject);
    procedure InvoiceAllClick(Sender: TObject);
    procedure LoadImageChecked(tempRow, iChecked: integer);
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure ShowUnitPrice;
  public
    dLastPEDate: TDateTime;
    property SalesInvoice : TSalesInvoice read FSAlesInvoice write SetSalesInvoice;
    property Mode: TsiMode read FMode write SetMode;
  end;

var
  PBMaintSalesInvoicefrm: TPBMaintSalesInvoicefrm;

implementation

uses
  System.UITypes, System.Types,
  PBLUCust, PBImages, PBAuditDM, pbMainMenu, DateSelV5, PBMaintSalesInvoiceLine, PBMaintInvChgs,
  PBDBMemo, PBLUSalesInvoiceCustJB, PBLUSalesInvoiceJBL, pbDatabase,
  PBLUCreditReason, PBMaintSalesInvoiceDetail, PBLURep;

{$R *.DFM}

{ TPBMaintSalesInvoicefrm }

procedure TPBMaintSalesInvoicefrm.SetMode(const Value: TsiMode);
begin
  FMode := Value;
end;

procedure TPBMaintSalesInvoicefrm.SetSalesInvoice(
  const Value: TSalesInvoice);
begin
  FSAlesInvoice := Value;
end;

procedure TPBMaintSalesInvoicefrm.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    try
      PBAuditDataMod.WriteAudit(3, strtoint(SalesInvoice.SINumber), 0, 0, 0, self.caption);
    except
      PBAuditDataMod.WriteAudit(3,0, 0, 0, 0, self.Caption) ;
    end;

    pnlSubReps.Visible := dmBroker.UseSubReps;

    if SalesInvoice.InvoiceorCredit = 'C' then
      sInvoiceorCredit := 'Credit'
    else
      begin
        sInvoiceorCredit := 'Invoice';
        sgLines.colwidths[9] := -1;
        sgLines.colwidths[10] := -1;
      end;

//    chkbxCashSale.Visible := SalesInvoice.InvoiceorCredit <> 'C';

    dLastPEDate := salesinvoice.datamodule.GetLastPeriodEndDate;

    with SalesInvoice.DataModule do
    begin
      qryOperator.close;
      qryOperator.open;

      qryPriceUnits.close;
      qryPriceUnits.open;

      qryCreditReason.close;
      qryCreditReason.open;

      qryInvoiceLoc.close;
      qryInvoiceLoc.parambyname('Invoice_Location').asinteger := SalesInvoice.InvoiceLocation;
      qryInvoiceLoc.Open;
      
      if qryInvoiceLoc.RecordCount = 1 then
        dblkpJobRevenue.KeyValue := qryInvoiceLoc.fieldbyname('Invoice_Location').asinteger;
    end;

    with SalesInvoice.DataModule do
    begin
      qryCompany.close;
      qryCompany.open;
      FNominalLevel := copy(qryCompany.fieldbyname('Nominal_level').asstring,1,1)
    end;

    with SalesInvoice.DataModule do
    begin
      qryRep.close;
      qryRep.ParamByName('Rep').asinteger := SalesInvoice.Rep;
      qryRep.open;
    end;

    with SalesInvoice.DataModule do
    begin
      qrySubRep.close;
      qrySubRep.ParamByName('Rep').asinteger := SalesInvoice.SubRep;
      qrySubRep.open;
    end;

    case Mode of
    siAdd     : Caption := 'Add a Sales '+sInvoiceorCredit;
    siChange  : Caption := 'Change a Sales '+sInvoiceorCredit;
    siDelete  : Caption := 'Delete a Sales '+sInvoiceorCredit;
    siRaise   : Caption := 'Raise a Sales '+sInvoiceorCredit+ ' from order';
    end;  { case }
    if Mode = siAdd then
      sTemp := ' New Sales '+sInvoiceorCredit
    else
      sTemp := ' Sales '+sInvoiceorCredit + ' ' + IntToStr(SalesInvoice.DbKey) + ' ';
    ShowDetails;
    ShowLineDetails;
    ShowCharges;

    ShowTotals;
    {Had to put this in because the components where losing the Listdatasource}
    dblkpPriceUnit.listsource := SalesInvoice.DataModule.dtsPriceUnits;
    dblkpOperator.ListSource := SalesInvoice.DataModule.dsOperator;
    dblkpRep.ListSource := SalesInvoice.DataModule.dsRep;
    dblkpSubRep.ListSource := SalesInvoice.DataModule.dsSubRep;
    dblkpJobRevenue.ListSource := SalesInvoice.DataModule.dsInvoiceLoc;
    dblkpCreditReason.ListSource := SalesInvoice.DataModule.dtsCreditReason;

    {Set components to red if credit note}
    if SalesInvoice.InvoiceorCredit = 'C' then
      begin
        pnlCreditReason.Visible := true;
        SetComponentColours;
      end;

    dblkpRep.enabled := not dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator);
    dblkpSubRep.enabled := dblkpRep.enabled;

    Checknotes(Self);
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintSalesInvoicefrm.ShowDetails;
begin
  if Mode = siAdd then
    begin
      edtInvNumber.text := '<New Invoice>';
      edtInvoiceDate.text := PBDateStr(Date);
      memCustomer.text := '';
      edtAccountCode.text := '';
      dblkpOperator.KeyValue := frmpbMainMenu.iOperator;
      lblReference.caption := '';
      labUnitSell.Caption := '';
      memQuantity.Text := '';
      edtAltInvoiceNumber.Text := '';
    end
  else
    begin
      if SalesInvoice.SINumber = '' then
        edtInvNumber.text := '<New Invoice>'
      else
        edtInvNumber.text := SalesInvoice.SINumber;

      {Display when the invoice was raised}
      if SalesInvoice.DateCreated <> 0 then
        stbrDetails.panels[1].Text := 'Invoice raised on: ' + formatdatetime('dd"/"mm"/"yy " at " hh:mm:ss',SalesInvoice.DateCreated)
      else
        stbrDetails.panels[1].Text := '';

      edtDesc.Text := SalesInvoice.InvoiceDescription;
      edtCustOrderNo.Text := SalesInvoice.CustOrderNo;

      edtAltInvoiceNumber.Text := SalesInvoice.AltInvoiceNumber;

      edtInvoiceDate.text := PBDateStr(SalesInvoice.SIDate);
      memCustomer.text := SalesInvoice.CustomerName + #13#10 + SalesInvoice.BranchName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.Customer,SalesInvoice.Branch);
      memInvToCustomer.text := SalesInvoice.InvToCustomerName + #13#10 + SalesInvoice.InvToBranchName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.InvToCustomer,SalesInvoice.InvToBranch);
      GetCustomerReps(SalesInvoice.Rep);

      if SalesInvoice.AcquiredCustomer then
        begin
          pnlEndUser.Visible := true;
          edtEndUser.text := SalesInvoice.EndUserCustomerName; {Put Edn USer name here}
          sgLines.ColWidths[7] := 80;
        end
      else
        begin
          pnlEndUser.Visible := false;
          edtEndUser.text := '';
          sgLines.ColWidths[7] := -1;
        end;

      {Show Sub Reps}
      dblkpSubRep.KeyValue := SalesInvoice.SubRep;

      edtAccountCode.text := SalesInvoice.AccountCode;
      if SalesInvoice.Operator = 0 then
        dblkpOperator.KeyValue :=  frmpbMainMenu.iOperator
      else
        dblkpOperator.KeyValue :=  SalesInvoice.Operator;

      dblkpJobRevenue.KeyValue :=  SalesInvoice.InvoiceLocation;

      dblkpCreditReason.keyvalue := SalesInvoice.CreditReason;

      dblkpPriceUnit.keyvalue := SalesInvoice.PriceUnit;
      if SalesInvoice.Quantity = 0 then
        memQuantity.Text := ''
      else
        memQuantity.Text := inttostr(SalesInvoice.Quantity);

      if SalesInvoice.SIType = 'S' then
        lblReference.caption := 'Sales Order: '+SalesInvoice.Reference
      else
      if SalesInvoice.SIType = 'J' then
        lblReference.caption := 'Job Bag: '+SalesInvoice.Reference
      else
        lblReference.caption := 'Purchase Order: '+SalesInvoice.Reference;

      if SalesInvoice.InvoiceOrCredit = 'C' then
        lblReference.caption := 'Sales Invoice: '+SalesInvoice.Reference;

      chkbxDelNote.Checked := SalesInvoice.DeliveryNote;
      chkbxEInvoice.Checked := SalesInvoice.eInvoice;
      chkbxCashSale.Checked := SalesInvoice.CashSale;

      if SalesInvoice.CashSale
        and ((SalesInvoice.PaidStatus = 'Y') or (SalesInvoice.PaidStatus = 'P')) then
      begin
        //if the invoice is for a cash sale and any payment has been made
        //stop the user removing the cash sale flag
        chkbxCashSale.Enabled := false;
      end;
      if SalesInvoice.PaidStatus = 'Y' then
        stbrDetails.panels[0].Text := 'Invoice is Fully Paid'
      else
      if SalesInvoice.PaidStatus = 'p' then
        stbrDetails.panels[0].Text := 'Invoice is Part Paid'
      else
        stbrDetails.panels[0].Text := 'Invoice is UnPaid';
    end;

//  pnlTop.enabled := not(Mode = siView) and not(Mode = siDelete) and not(Mode = siHeader);
  pnlTop.enabled := not(Mode = siView) and not(Mode = siDelete);
  pnlHeader.enabled := not(Mode = siView) and not(Mode = siDelete);
  pnlCreditReason.enabled :=not(Mode = siView) and not(Mode = siDelete);
  edtInvoiceDate.Enabled := not(Mode = siView) and not(Mode = siDelete) and not(Mode = siHeader);
  btnInvDate.enabled := edtInvoiceDate.Enabled;
  
  {Enable these buttons if not in header mode. Header mode only allows changing Rep and Cash Sales option}
  btnCustomer.Enabled := not(Mode = siHeader);
  btnInvToCustomer.Enabled := btnCustomer.enabled;

  chkbxDelNote.visible := (SalesInvoice.InvoiceOrCredit <> 'C') and (SalesInvoice.SIType = 'S');
  chkbxEInvoice.enabled := SalesInvoice.DataModule.GetCustomerEInvoice(SalesInvoice.InvToCustomer);
  btnDetails.Visible := SalesInvoice.InvoiceDetailsExist;

//  btnOK.Visible := not(Mode = siView) or (chkbxEInvoice.Enabled);
  lbldeleteprompt.visible := (Mode = siDelete);
  if (Mode = siView) or (Mode = siDelete) or (Mode = siHeader) then
    begin
      sgLines.popupMenu := pmnDummy;
      sgCharges.popupMenu := pmnDummy;
      imgChkBxInvoiceAll.Visible := false;
      pnlPackPrice.enabled := false;
      btnDelete.Visible := false;
    end;
end;

procedure TPBMaintSalesInvoicefrm.ShowLineDetails;
begin
  if Mode = siAdd then
    begin
      ClearGrid(sgLines);  {Clear contents of Line grid}
      BuildLineGrid;
    end
  else
    begin
      BuildLineGrid;
    end;
end;

procedure TPBMaintSalesInvoicefrm.ShowCharges;
begin
  if Mode = siAdd then
    begin
      ClearGrid(sgCharges);  {Clear contents of Line grid}
      BuildChargesGrid;
    end
  else
    begin
      BuildChargesGrid;
    end;
end;

procedure TPBMaintSalesInvoicefrm.ClearGrid(TempGrid: TStringGrid);
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

procedure TPBMaintSalesInvoicefrm.BuildLineGrid;
var
  i, icount, iChecked, iLine: integer;
  myImage: TComponent;
begin
  icount := 0;

  {free any existing images}
  for iLine := 1 to pred(sgLines.RowCount) do
  begin
    for iChecked := 0 to 2 do
    begin
      myImage := nil;
      try
        myImage := findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked));
      finally
        if Assigned(myImage) and (myImage is TImage) then
          (myImage as TImage).Free;
      end;
    end;
  end;

  for i := 0 to pred(SalesInvoice.Lines.count) do
  begin
    sgLines.cells[0,i+1] := inttostr(SalesInvoice.Lines[i].SILine);
    if SalesInvoice.Lines[i].PONumber <> 0 then
    begin
      sgLines.cells[1,i+1] := 'PO/'+floattostr(SalesInvoice.Lines[i].PONumber);
      sgLines.cells[2,i+1] := SalesInvoice.Lines[i].Description;
    end
    else
    if (SalesInvoice.Lines[i].SONumber <> 0) and (SalesInvoice.Lines[i].JBNumber <> 0)then
    begin
      sgLines.cells[1,i+1] := 'JB/'+inttostr(SalesInvoice.Lines[i].JBNumber);
      sgLines.cells[2,i+1] := SalesInvoice.Lines[i].Description;
    end
    else
    if SalesInvoice.Lines[i].SONumber <> 0 then
    begin
      sgLines.cells[1,i+1] := 'SO/'+inttostr(SalesInvoice.Lines[i].SONumber);
      sgLines.cells[2,i+1] := SalesInvoice.Lines[i].Description;
    end
    else
    if SalesInvoice.Lines[i].JBNumber <> 0 then
    begin
      sgLines.cells[1,i+1] := 'JB/'+inttostr(SalesInvoice.Lines[i].JBNumber);
      sgLines.cells[2,i+1] := SalesInvoice.Lines[i].Description;
    end;

    if SalesInvoice.Lines[i].PackQty = 0 then
    begin
      sgLines.cells[3,i+1] := floattostr(SalesInvoice.Lines[i].Quantity);
      sgLines.cells[4,i+1] := SalesInvoice.Lines[i].PriceUnitDescr;
      sgLines.cells[5,i+1] := formatfloat('0.0000',SalesInvoice.Lines[i].GoodsValue);
    end
    else
    begin
      sgLines.cells[3,i+1] := showinPacks(round(SalesInvoice.Lines[i].Quantity),SalesInvoice.Lines[i].PackQty);
      sgLines.cells[4,i+1] := inttostr(SalesInvoice.Lines[i].PackQty);
      sgLines.cells[5,i+1] := formatfloat('0.0000',(SalesInvoice.Lines[i].GoodsValue*SalesInvoice.Lines[i].PackQty));
    end;

    sgLines.cells[6,i+1] := formatfloat('0.0000',SalesInvoice.Lines[i].TotalGoods);
    sgLines.cells[7,i+1] := formatfloat('0.0000',SalesInvoice.Lines[i].TotalReseller);
    sgLines.cells[8,i+1] := formatfloat('0.00%',SalesInvoice.Lines[i].VATRate);
    sgLines.cells[9,i+1] := SalesInvoice.Lines[i].Nominal;
    sgLines.cells[10,i+1] := SalesInvoice.Lines[i].CreditType;
    sgLines.cells[11,i+1] := formatfloat('0.000',SalesInvoice.Lines[i].CostPrice);
    sgLines.cells[12,i+1] := SalesInvoice.Lines[i].ProductTypeDesc;

    if (Mode <> siView) and (Mode <> siDelete) and (Mode <> siHeader) then
    begin
      if salesinvoice.lines[i].isChecked then
        LoadImageChecked(i+1, 1)
      else
        LoadImageChecked(i+1, 0);
    end;

    icount := icount + 1;
  end;
  if icount = 0 then
    sgLines.rowcount := 2
  else
    sgLines.rowcount := icount + 1;
end;

procedure TPBMaintSalesInvoicefrm.BuildChargesGrid;
var
  i, icount: integer;
begin
  icount := 0;
  ClearGrid(sgCharges);
  with sgCharges do
    begin
      for i := 0 to pred(SalesInvoice.Charges.count) do
        begin
        cells[0,i+1] := inttostr(SalesInvoice.Charges[i].SICharge);
        cells[1,i+1] := SalesInvoice.Charges[i].Details;
        cells[2,i+1] := formatfloat('0.00',SalesInvoice.Charges[i].Amount);
        cells[3,i+1] := formatfloat('0.00%',SalesInvoice.Charges[i].VATRate);
        cells[4,i+1] := SalesInvoice.Charges[i].Nominal;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
end;

procedure TPBMaintSalesInvoicefrm.ShowTotals;
var
  sGoods, sVat: string;
begin
  sGoods := formatfloat('#00.00',salesinvoice.TotalGoods);
  sVat := formatfloat('#00.00',salesinvoice.Totalvat);
  memGoods.text := FloatToStrF(SalesInvoice.TotalGoods, ffCurrency, 15, 2);
  memVAT.text := FloatToStrF(SalesInvoice.TotalVAT, ffCurrency, 15, 2);
//  memTotal.text := FloatToStrF((SalesInvoice.TotalGoods+SalesInvoice.TotalVAT), ffCurrency, 15, 2);
  memTotal.text := FloatToStrF((StrToFloatDef(sGoods, 0, FormatSettings)+StrToFloatDef(sVat, 0, FormatSettings)), ffCurrency, 15, 2);
  ShowUnitPrice;
end;

procedure TPBMaintSalesInvoicefrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (dblkpOperator.keyvalue <> 0) and
                   (edtAccountCode.text <> '') and
                   (edtDesc.text <> '');
end;

procedure TPBMaintSalesInvoicefrm.btnInvDateClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(edtInvoicedate.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      if DateSelV5Form.Date <= dLastPEDate then
        begin
          messagedlg('The date entered is for a closed period, enter a date later than '+ pbdatestr(dLastPEDate), mterror, [mbOK], 0);
          edtInvoiceDate.SetFocus;
        end
      else
        edtInvoicedate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
  checkok(self);
end;

procedure TPBMaintSalesInvoicefrm.btnInvToCustomerClick(Sender: TObject);
begin
  PBLUCustfrm := TPBLUCustfrm.Create(self);
  try
    PBLUCustfrm.bIs_Lookup := true;
    PBLUCustfrm.bSel_Branch := True;
    PBLUCustfrm.bAllow_upd := true;

    PBLUCustfrm.Selcode := SalesInvoice.InvToCustomer;
    PBLUCustfrm.SelBranch := SalesInvoice.InvToBranch;

    PBLUCustfrm.SelName := SalesInvoice.InvToCustomerName;
    PBLUCustfrm.SelBranchName := SalesInvoice.InvToBranchName;

    PBLUCustFrm.ShowModal;
    if PBLUCustfrm.selected then
    begin
      SalesInvoice.InvToCustomer := PBLUCustfrm.Selcode;
      SalesInvoice.InvToCustomerName := PBLUCustfrm.SelName;
      SalesInvoice.InvToBranch := PBLUCustfrm.SelBranch;
      SalesInvoice.InvToBranchName := PBLUCustfrm.SelBranchName;

      memInvToCustomer.text := '';
      memInvToCustomer.text := SalesInvoice.InvToCustomerName + #13#10 + SalesInvoice.InvToBranchName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.InvToCustomer,SalesInvoice.InvToBranch);
      edtAccountCode.text := SalesInvoice.DataModule.GetAccountCode(SalesInvoice.InvToCustomer,SalesInvoice.InvToBranch);
      checkOK(self);
    end;
  finally
    PBLUCustfrm.Free;
  end;
end;

procedure TPBMaintSalesInvoicefrm.FormCreate(Sender: TObject);
begin
  stbrDetails.Top := Screen.Height - stbrDetails.Height;
  AccountsPackage := dmBroker.GetAccountsPackage;

  lblJobRevenue.Visible := dmBroker.UseRevenueCentres;
  dblkpJobRevenue.Visible := dmBroker.UseRevenueCentres;
  pnlPackPrice.Visible := dmBroker.UsePackPricing;
  edtAltInvoiceNumber.visible := dmBroker.UseSAPIntegration;
  lblAltInvoiceNumber.visible := edtAltInvoiceNumber.visible;
  SetLineHeaders;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  btnDelete.Top := sgLines.Top + 2;

  for var i := 0 to sgCharges.ColCount-1 do
  begin
    if not (i in [0,1]) then
      sgLines.ColAlignments[i] := taRightJustify;
  end;
end;

procedure TPBMaintSalesInvoicefrm.SetLineHeaders;
begin
  {Invoice Line header}
//  sgLines.cells[0,0] := 'Line';
  sgLines.cells[0,0] := '';
  sgLines.cells[1,0] := 'Order';
  sgLines.cells[2,0] := 'Description';
  sgLines.cells[3,0] := 'Quantity';
  sgLines.cells[4,0] := 'Price Unit';
  sgLines.cells[5,0] := 'Goods';
  sgLines.cells[6,0] := 'Total Goods';
  sgLines.cells[7,0] := 'Total Reseller';
  sgLines.cells[8,0] := 'VAT Rate';
  sgLines.cells[9,0] := 'Nominal';
  sgLines.cells[10,0] := 'Credit Type';
  sgLines.cells[11,0] := 'Cost';
  sgLines.cells[12,0] := 'Product Type';

  {Invoice Charges header}
  sgCharges.cells[0,0] := 'Line';
  sgCharges.cells[1,0] := 'Description';
  sgCharges.cells[2,0] := 'Goods';
  sgCharges.cells[3,0] := 'VAT';
  sgCharges.cells[4,0] := 'Nominal';

  imgChkbxInvoiceAll.parent := sgLines;
  imgChkbxInvoiceAll.left := cellleft(sgLines,0);
  imgChkbxInvoiceAll.Top := 1;
  imgChkbxInvoiceAll.Tag := 0;
  imgChkbxInvoiceAll.visible := true;
  imgChkbxInvoiceAll.OnClick := InvoiceAllClick;
end;

procedure TPBMaintSalesInvoicefrm.btnOKClick(Sender: TObject);
var
  i: integer;
  sTypeLabel: string;
begin
  if SalesInvoice.InvoiceOrCredit = 'I' then
    sTypeLabel := 'Invoice'
  else
    sTypelabel := 'Credit Note';

(*  if (Mode = siChange) then
    begin
      {Check that the invoice number hasn't been used previously}
      if not SalesInvoice.DataModule.CheckInvoiceUnique(trim(edtInvNumber.text), SalesInvoice.dbKey) then
        begin
          messagedlg('This invoice number is not unique, please review and change accordingly',mterror,
                    [mbAbort], 0);
          exit;
        end;

(*      if (trim(edtInvNumber.text) <> (SalesInvoice.SINumber)) and (trim(edtInvNumber.text) <> '') and (SalesInvoice.SIStatus <> 10) then
        begin
          messagedlg('You''ve changed the invoice number on this invoice manually, please ensure ' + #13 +
                     'that the last invoice number used is updated correctly in the Company Settings.',mtWarning,
                    [mbOK], 0);
        end;
    end;
*)

  if ((Mode = siAdd) or (Mode = siRaise)) then
    begin
      if pbdatestr(edtInvoiceDate.text) <= dLastPEDate then
        begin
          messagedlg('The date entered is for a closed period, enter a date later than '+ pbdatestr(dLastPEDate), mterror, [mbOK], 0);
          edtInvoiceDate.SetFocus;
          exit;
        end;
    end;

  if ((Mode = siAdd) or (Mode = siRaise)) and (SalesInvoice.InvoiceOrCredit = 'C') then
    begin
      for i := 0 to pred(SalesInvoice.Lines.count) do
      begin
        if Salesinvoice.Lines[i].LineChecked <> true then
          begin
            messagedlg('The Credit Note cannot be saved, the credit type for each line must be checked.',mterror,
                    [mbAbort], 0);
            exit;
          end;
      end;
      if SalesInvoice.CreditReason = 0 then
      begin
        messagedlg('Please enter a reason for the credit note', mterror,
                      [mbAbort], 0);
        dblkpCreditReason.setfocus;
        exit;
      end;
    end;

  if (Mode = siAdd) or (Mode = siRaise) or (Mode = siChange) then
    begin
    if (trim(edtInvoiceDate.text) = '') then
      begin
        messagedlg('Please enter a valid date before saving the ' + sTypelabel, mterror,
                      [mbAbort], 0);
        exit;
      end;

    if (SalesInvoice.DataModule.GetAccountCodeInactive(SalesInvoice.InvToCustomer)) then
      begin
        messagedlg('The ' + sTypeLabel + ' cannot be saved, the account is inactive',mterror,
                      [mbAbort], 0);
        exit;
      end;

    if (dmBroker.UseRevenueCentres) and (dblkpJobRevenue.Text = '') then
      begin
        messagedlg('The ' + sTypeLabel + ' cannot be saved, a revenue centre must be selected.',mterror,
                      [mbAbort], 0);
        exit;

      end;

    for i := 0 to pred(SalesInvoice.Lines.count) do
      begin
        if (Salesinvoice.Lines[i].inactive = 'N') and (trim(Salesinvoice.Lines[i].Nominal) = '') then
          begin
            messagedlg('The ' + sTypeLabel + ' cannot be saved, line '+inttostr(Salesinvoice.Lines[i].SILine)+' has an invalid nominal code',mterror,
                    [mbAbort], 0);
            exit;
          end;
      end;

    // Check whether a separate invoice is required for certain product types
    if (SalesInvoice.Category <> 0) and (not dmBroker.AllowMultiCatInvoices(SalesInvoice.Category)) then
      begin
        for i := 0 to pred(SalesInvoice.Lines.count) do
          begin
            if (Salesinvoice.Lines[i].inactive = 'N') and (Salesinvoice.Lines[i].ProductTypeCat <> SalesInvoice.Category) then
              begin
                messagedlg('All '+SalesInvoice.CategoryDesc+' categories must be invoiced on a separate invoice, '
                            + 'please remove all other invoice lines',mterror, [mbAbort], 0);
                exit;
              end;
          end;
      end;
    end;

  SalesInvoice.SIDate := PBDateStr(edtInvoiceDate.text);
  SalesInvoice.Mode := Mode;

  if (Mode = siRaise) or (Mode = siChange) or (Mode = siHeader) then
    begin
      {If changed from electronic invoice to standard then make sure the status is set to printed}
      if not SalesInvoice.eInvoice and (salesinvoice.SIStatus = 15) then
        salesinvoice.SIStatus := 20;

(*      // New bit added to allow changing of invoice number.
      if SalesInvoice.SIStatus < 25 then
        begin
          if (trim(edtInvNumber.text) = '') or (pos('New', trim(edtInvNumber.text)) > 0) then
            begin
              SalesInvoice.SINumber := ' ';
              SalesInvoice.SIStatus := 10;
            end
          else
            begin
              SalesInvoice.SINumber := trim(edtInvNumber.text);
              SalesInvoice.SIStatus := 20;
            end;
        end;
*)
      if SalesInvoice.InvoiceorCredit = 'C' then
        SalesInvoice.SaveCreditToDB(true)
      else
        SalesInvoice.SaveToDB(true);

      if (Mode = siRaise) then
        begin
          {Write Update sales invoice number to audit trail}
          try
            PBAuditDataMod.WriteAudit(1300, SalesInvoice.dbkey, 0, 0, 0, SalesInvoice.SINumber)
          except
          end;
        end
      else
        begin
          {Write Update sales invoice number to audit trail}
          try
            PBAuditDataMod.WriteAudit(2300, SalesInvoice.dbkey, strtoint(SalesInvoice.SINumber), 0, 0, SalesInvoice.SINumber) ;
          except
          end;
        end
    end
  else
  if (Mode = siDelete) then
    begin
      if trim(SalesInvoice.SINumber) = '' then
      begin
        SalesInvoice.Inactive := 'Y';
        if SalesInvoice.InvoiceorCredit = 'C' then
          SalesInvoice.DeleteCreditFromDB
        else
          SalesInvoice.DeleteFromDB;
      end
      else
      begin
        SalesInvoice.Inactive := 'Y';
        if SalesInvoice.InvoiceorCredit = 'C' then
          SalesInvoice.SaveCredittoDB(true)
        else
          SalesInvoice.SavetoDB(true);
      end;

      try
        PBAuditDataMod.WriteAudit(3300, SalesInvoice.dbkey, strtoint(SalesInvoice.SINumber), 0, 0, SalesInvoice.SINumber) ;
      except
        PBAuditDataMod.WriteAudit(3300, SalesInvoice.dbkey, 0, 0, 0, SalesInvoice.SINumber) ;
      end;
    end
  else
  if (Mode = siView) then
    begin
      SalesInvoice.SaveEInvoice;
    end;

  ModalResult := mrOK;
end;

procedure TPBMaintSalesInvoicefrm.btnCustomerClick(Sender: TObject);
begin
  PBLUCustfrm := TPBLUCustfrm.Create(self);
  try
    PBLUCustfrm.bIs_Lookup := true;
    PBLUCustfrm.bSel_Branch := True;
    PBLUCustfrm.bAllow_upd := true;

    PBLUCustfrm.Selcode := SalesInvoice.Customer;
    PBLUCustfrm.SelBranch := SalesInvoice.Branch;

    PBLUCustfrm.SelName := SalesInvoice.CustomerName;
    PBLUCustfrm.SelBranchName := SalesInvoice.BranchName;

    PBLUCustFrm.ShowModal;
    if PBLUCustfrm.selected then
    begin
      SalesInvoice.Customer := PBLUCustfrm.Selcode;
      SalesInvoice.CustomerName := PBLUCustfrm.SelName;
      SalesInvoice.Branch := PBLUCustfrm.SelBranch;
      SalesInvoice.BranchName := PBLUCustfrm.SelBranchName;

      memCustomer.text := '';
      memCustomer.text := SalesInvoice.CustomerName + #13#10 + SalesInvoice.BranchName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.Customer,SalesInvoice.Branch);

      if dblkpRep.keyvalue = 0 then
        GetCustomerReps(0)
      else
        GetCustomerReps(dblkpRep.keyvalue);

      SalesInvoice.AcquiredCustomer := PBLUCustFrm.AcquiredCustomer;
      if SalesInvoice.AcquiredCustomer then
        begin
          pnlEndUser.Visible := true;
//          sgLines.ColWidths[6] := 80;
        end
      else
        begin
          pnlEndUser.Visible := false;
          edtEndUser.text := '';
//          sgLines.ColWidths[6] := -1;
        end;

      if Mode = siAdd then
        GetInvoiceTo(SalesInvoice.Customer,SalesInvoice.Branch);
      checkOK(self);
    end;
  finally
    PBLUCustfrm.Free;
  end;
end;

procedure TPBMaintSalesInvoicefrm.GetCustomerReps(tempno: integer);
begin
  with SalesInvoice.Datamodule.qryCustReps do
    begin
      close;
      parambyname('Customer').asinteger := SalesInvoice.Customer;
      parambyname('Branch_no').asinteger := SalesInvoice.Branch;
      open;

      if (recordcount = 1) then
        begin
         if tempno = 0 then
           dblkpRep.keyvalue := fieldbyname('Rep').asinteger
         else
           dblkpRep.keyvalue := tempno
        end
      else
        begin
          if tempno = 0 then
            dblkpRep.keyvalue := 0
          else
            dblkpRep.keyvalue := tempno
        end;
      SalesInvoice.Rep := dblkpRep.keyvalue;
    end;
end;

procedure TPBMaintSalesInvoicefrm.pmnLinesPopup(Sender: TObject);
begin
  mnChangeLine.enabled := not (SalesInvoice.Lines.count = 0);
  mnDeleteLine.enabled := not (SalesInvoice.Lines.count = 0);
//  mnAddfromOrder.visible := (SalesInvoice.SIType = '');
  mnAddfromJobBag.visible := (SalesInvoice.SIType = 'J');
  mnAddfromOtherJobBag.visible := (SalesInvoice.SIType = 'J');
//  mnAddfromSalesOrder.visible := (SalesInvoice.SIType = 'S');
  mnNotPrinted.Checked := DontPrintLine;
end;

function TPBMaintSalesInvoicefrm.DontPrintLine: boolean;
var
  inx: integer;
  SalesInvoiceLine: TSalesInvoiceLine;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  inx := SalesInvoice.Lines.IndexOf(inx);
  SalesInvoiceLine := SalesInvoice.Lines[inx];
  result := (SalesInvoiceLine.NotPrinted = 'Y');
end;

procedure TPBMaintSalesInvoicefrm.pmnChargesPopup(Sender: TObject);
begin
  mnChangeChg.enabled := not (SalesInvoice.Charges.count = 0);
  mnDeleteChg.enabled := not (SalesInvoice.Charges.count = 0);
end;

procedure TPBMaintSalesInvoicefrm.mnChangeLineClick(Sender: TObject);
begin
  CallMaintScreen(silChange);
end;

procedure TPBMaintSalesInvoicefrm.CallMaintScreen(aMode : TsilMode);
var
  inx, LineNo : integer;
  SalesInvoiceLine : TSalesInvoiceLIne;
  frm: TPBMaintSalesInvoiceLineFrm;
  DeleteCharges: boolean;
begin
  DeleteCharges := False;
//  inx := sgLines.row;
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  try
    frm := TPBMaintSalesInvoiceLineFrm.Create(Self);
    try
      if aMode = silAdd then
        SalesInvoiceLine := TSalesInvoiceLine.Create(SalesInvoice)
      else
      begin
        inx := SalesInvoice.Lines.IndexOf(inx);
        SalesInvoiceLine := SalesInvoice.Lines[inx];
      end;

      LineNo := SalesInvoiceLine.SILine;

// Check for any additional charges related to this line
      if aMode = silDelete then
        begin
          DeleteCharges := CheckForRelatedCharges(SalesInvoiceLine.SILine);
          if DeleteCharges then
            begin
              if messagedlg('Sundry Charges exist for this invoice line, deleting this line will also remove the associated sundry charges. Continue?',
                mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
            end;
        end;

      if (Mode = siView) or (Mode = siHeader) then
        aMode := silView;
      if SalesInvoiceLine.Inactive = 'Y' then
        begin
          messagedlg('This line has NOT been selected to be invoiced and therefore cannot be changed', mtInformation, [mbOk], 0);
          amode := silView;
        end;
      Frm.SalesInvoiceLine := SalesInvoiceLine;
      Frm.NominalType := FNominalLevel;
      Frm.AccountsPackage := AccountsPackage;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if (aMode = silAdd) and (Frm.ModalResult <> mrOK) then
        SalesInvoiceLine.Free
      {delete the associated charge lines}
      else
      if (aMode = silDelete) and (DeleteCharges) then
        begin
          DeleteChargeLines(LineNo);
        end;
    finally
      Frm.Free;
    end;
  finally
    ShowLineDetails;
    ShowTotals;
  end;
end;

procedure TPBMaintSalesInvoicefrm.DeleteChargeLines(tmpLine: integer);
var
  iCharges: integer;
begin
  for icharges := pred(SalesInvoice.Charges.Count) downto 0 do
    begin
      if (SalesInvoice.Charges[icharges].SILine = tmpLine) then
        begin
//    inx := SalesInvoiceChg.Parent.Charges.IndexOf(SalesInvoiceChg.SICharge);
          SalesInvoice.Charges.Delete(icharges);
          SalesInvoice.Charges.Renumber;
        end;
    end;
  ShowCharges;
end;

function TPBMaintSalesInvoicefrm.CheckforRelatedCharges(tmpLine: integer): boolean;
var
  iCharges: integer;
begin
  Result := false;
  for icharges := 0 to pred(SalesInvoice.Charges.Count) do
    begin
      if (SalesInvoice.Charges[icharges].SILine = tmpLine) then
        begin
          Result := true;
          exit;
        end;
    end;
end;

procedure TPBMaintSalesInvoicefrm.sgLinesDblClick(Sender: TObject);
begin
  if (SalesInvoice.Lines.count = 0) or (sgLines.row = 0) then
    exit;
  if (Mode <> siDelete) then
    mnChangeLineClick(self);
end;

procedure TPBMaintSalesInvoicefrm.mnChangeChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(sicChange);
end;

procedure TPBMaintSalesInvoicefrm.CallMaintChgsScreen(aMode : TsicMode);
var
  inx : integer;
  SalesInvoiceChg : TSalesInvoiceChg;
  frm: TPBMaintInvChgsFrm;
begin
  inx := sgCharges.row;
  try
    frm := TPBMaintInvChgsFrm.Create(Self);
    try
      if aMode = sicAdd then
        SalesInvoiceChg := TSalesInvoiceChg.create(SalesInvoice)
      else
      begin
        inx := SalesInvoice.Charges.IndexOf(inx);
        SalesInvoiceChg := SalesInvoice.Charges[inx];
      end;
      Frm.SalesInvoiceChg := SalesInvoiceChg;
      Frm.AccountsPackage := AccountsPackage;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if (aMode = sicAdd) and (Frm.ModalResult <> mrOK) then
        SalesInvoiceChg.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowCharges;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = sicAdd then
      begin
        inx := pred(SalesInvoice.Charges.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = sicDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgCharges.row := inx+1;
  end;
end;

procedure TPBMaintSalesInvoicefrm.mnAddChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(sicAdd);
end;

procedure TPBMaintSalesInvoicefrm.sgChargesDblClick(Sender: TObject);
begin
  if (SalesInvoice.Charges.count = 0) then
    exit;
  if (Mode <> siView) and (Mode <> siDelete) and (Mode <> siHeader) then
    mnChangeChgClick(self);
end;

procedure TPBMaintSalesInvoicefrm.sgLinesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  SavedAlign: integer;
begin
  if SalesInvoice.Lines.Count > 0 then
  begin
    if (ARow > 0) and (SalesInvoice.Lines[ARow-1].Inactive = 'Y') then
        begin
          (Sender as TStringGrid).Canvas.font.color := clGray;
          (Sender as TStringGrid).Canvas.font.style := Font.Style + [fsstrikeout];
        end;

    if (ACol = 0) or (ACol = 1) or (ACol = 2) or (ACol = 12) then
  	begin
      if (ARow > 0) and (SalesInvoice.Lines[ARow-1].NotPrinted = 'Y') then
        (Sender as TStringGrid).Canvas.font.Color := clRed;
      SavedAlign := SetTextAlign((Sender as TStringGrid).Canvas.Handle, TA_LEFT);
      SetTextAlign((Sender as TStringGrid).Canvas.Handle, SavedAlign);
    end
    else
  	begin
			{Display the Columns Right justified in the cells}
      if (ARow > 0) and (SalesInvoice.Lines[ARow-1].NotPrinted = 'Y') then
        (Sender as TStringGrid).Canvas.font.Color := clRed;
      SavedAlign := SetTextAlign((Sender as TStringGrid).Canvas.Handle, TA_RIGHT);
      SetTextAlign((Sender as TStringGrid).Canvas.Handle, SavedAlign);
    end;
  end;
end;

procedure TPBMaintSalesInvoicefrm.sgChargesDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  with Sender as TStringGrid do
  begin
    if ARow <> 0 then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2, Cells[ACol, ARow]);
    end;

    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    if (ACol = 0) or (ACol = 1) then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end else
    begin
      {Display the Columns Right justified in the cells}
      if gdFixed in State then
        Canvas.Brush.Color := FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end;
  end;
end;

procedure TPBMaintSalesInvoicefrm.btnNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    if Mode = siView then
      PBDBInvMemoFrm.bAllow_Upd := false
    else
      PBDBInvMemoFrm.bAllow_Upd := true;

    PBDBInvMemoFrm.Datamemo.text := SalesInvoice.NarrativeText;
    PBDBInvMemoFrm.ShowModal;
    SalesInvoice.Narrativetext := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TPBMaintSalesInvoicefrm.CheckNotes(Sender: TObject);
begin
  if trim(SalesInvoice.NarrativeText) <> '' then
  begin
    FlashTimer.Enabled := True;
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;

  {Now check for internal notes}
  if trim(SalesInvoice.IntNarrativeText) <> '' then
  begin
    IntFlashTimer.Enabled := True;
    btnInternalNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph;
  end
  else
  begin
    IntFlashTimer.Enabled := False;
    btnInternalNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  end;
end;

procedure TPBMaintSalesInvoicefrm.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TPBMaintSalesInvoicefrm.GetInvoiceTo(tempcust, TempBranch: integer);
begin
  with SalesInvoice.Datamodule.qryCustInvTo do
    begin
      close;
      parambyname('Customer').asinteger := TempCust;
      parambyname('Branch_no').asinteger := TempBranch;
      open;
      first;

      SalesInvoice.InvToCustomer := fieldbyname('Inv_to_Customer').asinteger;
      SalesInvoice.InvToBranch := fieldbyname('Inv_To_Branch').asinteger;
      SalesInvoice.InvToCustomerName := fieldbyname('Customer_Name').asstring;
      SalesInvoice.InvToBranchName := fieldbyname('Branch_Name').asstring;

      memInvToCustomer.text := '';
      memInvToCustomer.text := SalesInvoice.InvToCustomerName + #13#10 + SalesInvoice.InvToBranchName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.InvToCustomer,SalesInvoice.InvToBranch);

      SalesInvoice.AccountCode := fieldbyname('Account_code').asstring;
      edtAccountCode.text := fieldbyname('Account_code').asstring;
    end;
end;

procedure TPBMaintSalesInvoicefrm.dblkpRepClick(Sender: TObject);
begin
  SalesInvoice.Rep := dblkpRep.keyvalue;
  checkok(self);
end;

procedure TPBMaintSalesInvoicefrm.dblkpOperatorClick(Sender: TObject);
begin
  SalesInvoice.Operator := dblkpOperator.keyvalue;
end;

procedure TPBMaintSalesInvoicefrm.mnDeleteLineClick(Sender: TObject);
var
  iCount, iLines, iSelected: integer;
  inx: integer;
  bSelected: boolean;
  SalesInvoiceLine: TSalesInvoiceLine;
begin
(*  if SalesInvoice.Lines.count = 1 then
    begin
      MessageDlg('Cannot delete this line, there must be at least one line on an invoice/credit note.', mtInformation,[mbOk], 0);
      exit;
    end;
  else
    CallMaintScreen(silDelete);
*)
  bSelected := false;
  iSelected := 0;

  for iLines := 0 to pred(SalesInvoice.Lines.count) do
    begin
      if SalesInvoice.lines[iLines].isChecked then
        begin
          bSelected := true;
          iSelected := iselected + 1;
        end;
    end;

  if not bSelected then
    begin
      MessageDlg('Please select a line to delete', mtInformation,[mbOk], 0);
      exit;
    end;

  if SalesInvoice.Lines.count = 1 then
    begin
      MessageDlg('Cannot delete this line, there must be at least one line on an invoice/credit note.', mtInformation,[mbOk], 0);
      exit;
    end;

  if SalesInvoice.Lines.count = iSelected then
    begin
      MessageDlg('Cannot delete all lines, there must be at least one line on an invoice/credit note.', mtInformation,[mbOk], 0);
      exit;
    end;

  {delete those lines selected}
  for iLines := pred(SalesInvoice.Lines.count) downto 0 do
    begin
      if SalesInvoice.lines[iLines].ischecked then
        begin
          SalesInvoiceLine := SalesInvoice.Lines[iLines];
          inx := SalesInvoiceLine.Parent.Lines.IndexOf(SalesInvoiceLine.SILine);

          {Delete any extra charges associated with this line}
          for icount := pred(SalesInvoice.Charges.count) downto 0 do
            begin
              if SalesInvoice.Charges[icount].PONumber = SalesInvoiceLine.PONumber then
                begin
                  SalesInvoice.Charges.Delete(iCount);
                end;
            end;
          SalesInvoiceLine.SaveDeletedQty;
          SalesInvoiceLine.Parent.Lines.Delete(inx);
        end;
    end;
  ShowLineDetails;
  ShowCharges;
end;

procedure TPBMaintSalesInvoicefrm.mnDeleteChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(sicDelete);
end;

procedure TPBMaintSalesInvoicefrm.edtInvoiceDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If edtInvoiceDate.Text = '' then
    Exit;
  try
    NewDate := StrToDate(edtInvoiceDate.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      edtInvoiceDate.SetFocus;
      Exit;
    end;
  end;

  if pbdatestr(edtInvoiceDate.text) <= dLastPEDate then
    begin
      messagedlg('The date entered is for a closed period, enter a date later than '+ pbdatestr(dLastPEDate), mterror, [mbOK], 0);
      edtInvoiceDate.SetFocus;
      Exit;
    end;

  edtInvoiceDate.Text := PBDatestr(NewDate);
end;

procedure TPBMaintSalesInvoicefrm.mnAddfromJobBagClick(Sender: TObject);
begin
  CallJBSelectScreen;
end;

procedure TPBMaintSalesInvoicefrm.CallJBSelectScreen;
var
  SalesInvoiceLine : TSalesInvoiceLine;
  frm: TPBLUSalesInvoiceJBLFrm;
begin
  frm := TPBLUSalesInvoiceJBLFrm.Create(Self);
  try
    SalesInvoiceLine := TSalesInvoiceLine.Create(SalesInvoice);
    frm.JBNumber := strtoint(SalesInvoice.Reference);
    frm.lblCustomer.caption := 'Customer: '+ SalesInvoice.CustomerName;
    frm.lblJobBag.caption := 'Job Bag No: '+ SalesInvoice.Reference;
    frm.lblDescription.caption := 'Description '+ SalesInvoice.InvoiceDescription;
    frm.SalesInvoiceLine := SalesInvoiceLine;
    Frm.ShowModal;
    if (Frm.ModalResult <> mrOK) then
      SalesInvoiceLine.Free;
    if Frm.ModalResult = mrOK then
      begin
        ShowLineDetails;
        ShowTotals;
        sgLines.Row := pred(sgLines.RowCount);
      end;
  finally
    Frm.Free;
  end;
end;

procedure TPBMaintSalesInvoicefrm.CallAllJBSelectScreen;
var
  SalesInvoiceLine : TSalesInvoiceLine;
  frm: TPBLUSalesInvoiceCustJBFrm;
begin
  frm := TPBLUSalesInvoiceCustJBFrm.Create(Self);
  try
    SalesInvoiceLine := TSalesInvoiceLine.Create(SalesInvoice);
    frm.customer := SalesInvoice.customer;
    frm.lblCustomer.caption := 'Customer: '+ SalesInvoice.CustomerName;
    frm.SalesInvoiceLine := SalesInvoiceLine;
    Frm.ShowModal;
    if (Frm.ModalResult <> mrOK) then
      SalesInvoiceLine.Free;
    if Frm.ModalResult = mrOK then
      begin
        ShowLineDetails;
        ShowTotals;
        sgLines.Row := pred(sgLines.RowCount);
      end;
  finally
    Frm.Free;
  end;
end;

procedure TPBMaintSalesInvoicefrm.SetComponentColours;
var
  i: integer;
begin
  for i := 0 to pred(componentcount) do
    begin
      if Components[i] is TStringGrid then
        TStringGrid(Components[i]).Font.color := clred
      else
      if Components[i] is TEdit then
        TEdit(Components[i]).Font.color := clred
      else
      if Components[i] is TMemo then
        TMemo(Components[i]).Font.color := clred
      else
      if Components[i] is TDBLookupComboBox then
        TDBLookupComboBox(Components[i]).Font.color := clred
      else
      if Components[i] is TLabel then
        TLabel(Components[i]).caption := stringreplace(TLabel(Components[i]).caption,'Invoice',sInvoiceorCredit,[rfReplaceAll]);
    end;
end;

procedure TPBMaintSalesInvoicefrm.IntFlashTimerTimer(Sender: TObject);
begin
  if bIntNotesFlash then
    btnInternalNotes.Glyph := PBImagesFrm.OnBitBtn.Glyph
  else
    btnInternalNotes.Glyph := PBImagesFrm.OffBitBtn.Glyph;
  bIntNotesFlash := (not (bIntNotesFlash));
end;

procedure TPBMaintSalesInvoicefrm.btnInternalNotesClick(Sender: TObject);
var
  PBDBInvMemoFrm: TPBDBMemoFrm;
begin
  PBDBInvMemofrm := TPBDBMemoFrm.create(self);
  try
    if Mode = siView then
      PBDBInvMemoFrm.bAllow_Upd := false
    else
      PBDBInvMemoFrm.bAllow_Upd := true;

    PBDBInvMemoFrm.Datamemo.text := SalesInvoice.IntNarrativeText;
    PBDBInvMemoFrm.ShowModal;
    SalesInvoice.IntNarrativetext := PBDBInvMemofrm.Datamemo.text;
  finally
    PBDBInvMemofrm.free;
  end;
  checknotes(Self);
end;

procedure TPBMaintSalesInvoicefrm.mnNotPrintedClick(Sender: TObject);
var
  inx: integer;
  SalesInvoiceLine: TSalesInvoiceLine;
begin
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  inx := SalesInvoice.Lines.IndexOf(inx);
  SalesInvoiceLine := SalesInvoice.Lines[inx];
  if SalesInvoiceLine.TotalGoods <> 0 then
    begin
      messagedlg('Only lines of zero value can be set to Not Printed', mtError, [mbOk], 0);
      exit;
    end;

  if mnNotPrinted.checked then
    SalesInvoiceLine.NotPrinted := 'N'
  else
    SalesInvoiceLine.NotPrinted := 'Y';

  ShowLineDetails;
end;

procedure TPBMaintSalesInvoicefrm.edtDescChange(Sender: TObject);
begin
  salesinvoice.InvoiceDescription := edtDesc.Text;
  checkOK(self);
end;

procedure TPBMaintSalesInvoicefrm.chkbxCashSaleClick(Sender: TObject);
begin
  salesinvoice.CashSale := chkbxCashSale.Checked;
end;

procedure TPBMaintSalesInvoicefrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);

  try
    PBAuditDataMod.WriteAudit(4,strtoint(SalesInvoice.SINumber), 0, 0, 0, self.Caption) ;
  except
    PBAuditDataMod.WriteAudit(4,0, 0, 0, 0, self.Caption) ;
  end;
end;

procedure TPBMaintSalesInvoicefrm.dblkpJobRevenueClick(Sender: TObject);
begin
  SalesInvoice.InvoiceLocation := dblkpJobRevenue.KeyValue;
end;

procedure TPBMaintSalesInvoicefrm.mnAddfromOtherJobBagClick(
  Sender: TObject);
begin
  CallAllJBSelectScreen;
end;

procedure TPBMaintSalesInvoicefrm.BitBtn1Click(Sender: TObject);
begin
  PBLUCreditReasonFrm := TPBLUCreditReasonFrm.Create(Self);
  try
    PBLUCreditReasonFrm.bIs_Lookup := False;
    PBLUCreditReasonFrm.bAllow_Upd := True;
    PBLUCreditReasonFrm.ShowModal;

    with SalesInvoice.DataModule do
      begin
        qryCreditReason.Close;
        qryCreditReason.Open;
      end;

  finally
    PBLUCreditReasonFrm.Free;
  end;
end;

procedure TPBMaintSalesInvoicefrm.dblkpCreditReasonClick(Sender: TObject);
begin
  SalesInvoice.CreditReason := dblkpCreditReason.KeyValue;
end;

procedure TPBMaintSalesInvoicefrm.chkbxEInvoiceClick(Sender: TObject);
begin
  salesinvoice.eInvoice := chkbxeInvoice.Checked;

end;

procedure TPBMaintSalesInvoicefrm.edtCustOrderNoChange(Sender: TObject);
begin
  salesinvoice.CustOrderNo := edtCustOrderNo.Text;
  checkOK(self);
end;

procedure TPBMaintSalesInvoicefrm.btnDetailsClick(Sender: TObject);
begin
  PBMaintSalesInvoiceDetailFrm := TPBMaintSalesInvoiceDetailFrm.create(self);
  try
    PBMaintSalesInvoiceDetailFrm.SINumber := SalesInvoice.dbKey;
    PBMaintSalesInvoiceDetailFrm.showmodal;
  finally
    PBMaintSalesInvoiceDetailFrm.free;
  end;
end;

procedure TPBMaintSalesInvoicefrm.LoadImageChecked(tempRow, iChecked: integer);
var
  myImage: TImage;
  tempName: string;
begin
    myImage := TImage.Create(Self);
    tempName := 'img' + Copy((IntToStr(1000 + temprow)),2,3)+'I'+inttostr(iChecked);
    myImage.name := tempname;
    myImage.Parent := sgLines;
    myImage.Left := cellleft(sgLines,0);
    myImage.Top := celltop(sgLines,tempRow);
    myImage.Width := imgChkbxChecked.width;
    myImage.Height := imgChkbxChecked.height;
    if iChecked = 0 then
      myImage.picture := imgChkbxUnChecked.picture
    else
      myImage.picture := imgChkBxChecked.picture;
    myImage.Tag := iChecked;
    myImage.visible := true;
    myimage.BringToFront;
    myImage.OnClick := ImageClick
end;

procedure TPBMaintSalesInvoicefrm.ImageClick(Sender: TObject);
var
  iLine: integer;
  iChecked: integer;
  myImage: TImage;
begin
  if dmBroker.iAccCtrlMenu = 3 then exit;
  iLine := strtoint(copy((Sender as TImage).name,4,3));

  for iChecked := 0 to 2 do
    if iChecked <> (Sender as TImage).tag then
      begin
        myImage :=  findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
        myImage.Free;
      end;

  {Setting Checked}
  if (Sender as TImage).tag = 0 then
    begin
      LoadImageChecked(iLine,1);
      (Sender as TImage).sendtoback;
      (Sender as TImage).visible := false;
      SalesInvoice.Lines[iLine-1].isChecked := true;
    end
  else
  {Unchecking}
  if (Sender as TImage).tag = 1 then
    begin
      LoadImageChecked(iLine,0);
      (Sender as TImage).sendtoback;
      (Sender as TImage).visible := false;
      SalesInvoice.Lines[iLine-1].isChecked := false;
    end
  else
    begin
      exit;
    end;
end;

procedure TPBMaintSalesInvoicefrm.InvoiceAllClick(Sender: TObject);
var
  iLine, iChecked: integer;
  myImage: TImage;
  bCheckedOn: boolean;
begin
  if dmBroker.iAccCtrlMenu = 3 then exit;

  with (Sender as TImage) do
    begin
      visible := false;
      if Tag = 0 then
        begin
          picture := imgChkbxChecked.picture;
          tag := 1;
          bCheckedOn := true;
        end
      else
        begin
          picture := imgChkbxUnChecked.picture;
          tag := 0;
          bCheckedOn := false;
        end;

      for iline := 1 to SalesInvoice.Lines.count do
        begin
          if not bCheckedOn and (SalesInvoice.Lines[iLine-1].isChecked) then
            begin
              for iChecked := 0 to 2 do
                begin
                  myImage := self.findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
                  try
                    myImage.Free;
                  except
                  end;
                end;
              LoadImageChecked(iLine,0);
              SalesInvoice.Lines[iLine-1].isChecked := false;
            end
          else
          if bCheckedOn and ((SalesInvoice.Lines[iLine-1].isChecked = false)) then
            begin
              for iChecked := 0 to 2 do
                begin
                  myImage := self.findcomponent('img'+Copy((IntToStr(1000 + iLine)),2,3)+'I'+inttostr(iChecked)) as TImage;
                  try
                    myImage.Free;
                  except
                  end;
                end;
              LoadImageChecked(iLine,1);
              SalesInvoice.Lines[iLine-1].isChecked := true;
            end;
        end;
      visible := true;
    end;

end;

procedure TPBMaintSalesInvoicefrm.sgLinesTopLeftChanged(Sender: TObject);
var
  icount: Integer;
  iRow: Integer;
  myImage: TImage;
begin
  for icount := 0 to pred(componentcount) do
  begin
    if (Components[icount] is TImage) then
    begin
      myImage := (Components[icount] as TImage);
      myImage.Left := cellleft(sgLines,0);
      iRow := strtoint(copy(myImage.name,4,3));
      if iRow >= sgLines.TopRow then
      begin
        myImage.Top := celltop(sgLines,iRow);
        myImage.Visible := true;
      end
      else
        myImage.Visible := False;
    end;
  end;
end;

function TPBMaintSalesInvoicefrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;

  {this is for the fixed column}
//  t := t + grid.ColWidths[0] + grid.gridlinewidth;
  t := t + grid.gridlinewidth;
  for i := 0 to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t + grid.gridlinewidth;
end;

function TPBMaintSalesInvoicefrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth;

  t := t + grid.RowHeights[0] + grid.gridlinewidth;
  for i := grid.toprow to Row - 1 do
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  Result := t + grid.gridlinewidth;
end;

procedure TPBMaintSalesInvoicefrm.btnDeleteClick(Sender: TObject);
var
  iCount, iLines, iSelected: integer;
  inx: integer;
  bSelected: boolean;
  SalesInvoiceLine: TSalesInvoiceLine;
begin
(*  if SalesInvoice.Lines.count = 1 then
    begin
      MessageDlg('Cannot delete this line, there must be at least one line on an invoice/credit note.', mtInformation,[mbOk], 0);
      exit;
    end;
  else
    CallMaintScreen(silDelete);
*)
  bSelected := false;
  iSelected := 0;

  for iLines := 0 to pred(SalesInvoice.Lines.count) do
    begin
      if SalesInvoice.lines[iLines].isChecked then
        begin
          bSelected := true;
          iSelected := iselected + 1;
        end;
    end;

  if not bSelected then
    begin
      MessageDlg('Please select a line to delete', mtInformation,[mbOk], 0);
      exit;
    end;

  if SalesInvoice.Lines.count = 1 then
    begin
      MessageDlg('Cannot delete this line, there must be at least one line on an invoice/credit note.', mtInformation,[mbOk], 0);
      exit;
    end;

  if SalesInvoice.Lines.count = iSelected then
    begin
      MessageDlg('Cannot delete all lines, there must be at least one line on an invoice/credit note.', mtInformation,[mbOk], 0);
      exit;
    end;

  {delete those lines selected}
  for iLines := pred(SalesInvoice.Lines.count) downto 0 do
    begin
      if SalesInvoice.lines[iLines].ischecked then
        begin
          SalesInvoiceLine := SalesInvoice.Lines[iLines];
          inx := SalesInvoiceLine.Parent.Lines.IndexOf(SalesInvoiceLine.SILine);

          {Delete any extra charges associated with this line}
          for icount := pred(SalesInvoice.Charges.count) downto 0 do
            begin
              if SalesInvoice.Charges[icount].PONumber = SalesInvoiceLine.PONumber then
                begin
                  SalesInvoice.Charges.Delete(iCount);
                end;
            end;

          SalesInvoiceLine.SaveDeletedQty;
          SalesInvoiceLine.Parent.Lines.Delete(inx);
        end;
    end;
  ShowLineDetails;
  ShowCharges;
end;

procedure TPBMaintSalesInvoicefrm.chkbxDelNoteClick(Sender: TObject);
begin
  salesinvoice.DeliveryNote := chkbxDelNote.Checked;
end;

procedure TPBMaintSalesInvoicefrm.dblkpPriceUnitClick(Sender: TObject);
begin
  try
    SalesInvoice.PriceUnit := dblkpPriceUnit.KeyValue;
    SalesInvoice.PriceUnitFactor := SalesInvoice.DataModule.GetPUnitFactor(SalesInvoice.PriceUnit);
  except
    SalesInvoice.PriceUnit := 0;
    SalesInvoice.PriceUnitFactor := 0;
  end;
  ShowUnitPrice;
  CheckOK(self);

end;

procedure TPBMaintSalesInvoicefrm.ShowUnitPrice;
begin
  labUnitSell.Caption := '@ ' + FloatToStrF(SalesInvoice.UnitSell, ffCurrency, 15, 3);
end;

procedure TPBMaintSalesInvoicefrm.memQuantityChange(Sender: TObject);
begin
  try
    SalesInvoice.Quantity := strtoint(memQuantity.text)
  except
    SalesInvoice.Quantity := 0;
  end;

  dblkpPriceUnitClick(self);
end;

procedure TPBMaintSalesInvoicefrm.memQuantityEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintSalesInvoicefrm.ValidateQty(Sender: TObject);
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

procedure TPBMaintSalesInvoicefrm.memQuantityKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBMaintSalesInvoicefrm.FormRefClrBitBtnClick(Sender: TObject);
begin
  dblkpPriceUnit.KeyValue := 0;
  SalesInvoice.PriceUnit := dblkpPriceUnit.KeyValue;
  SalesInvoice.PriceUnitFactor := 0;
  ShowUnitPrice;
end;

procedure TPBMaintSalesInvoicefrm.BitBtn2Click(Sender: TObject);
begin
  {reset any deleted lines}
  SalesInvoice.UndoDeletedLines;
end;

procedure TPBMaintSalesInvoicefrm.dblkpSubRepClick(Sender: TObject);
begin
  SalesInvoice.SubRep := dblkpSubRep.keyvalue;
end;

procedure TPBMaintSalesInvoicefrm.btnClearClaimClick(Sender: TObject);
begin
  dblkpSubREp.KeyValue := 0;
  SalesInvoice.SubRep := dblkpSubRep.keyvalue;
end;

procedure TPBMaintSalesInvoicefrm.btnRepsClick(Sender: TObject);
begin
  {Lookup a rep}
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := false;
    PBLURepFrm.bAllow_Upd := True;
    PBLURepFrm.SelCode := SalesInvoice.Rep;
    PBLURepFrm.ShowModal;

    {Update Rep List}
    with SalesInvoice.DataModule do
    begin
      qryRep.close;
      qryRep.ParamByName('Rep').asinteger := SalesInvoice.Rep;
      qryRep.open;
    end;

    {Update Sub Rep List}
    with SalesInvoice.DataModule do
    begin
      qrySubRep.close;
      qrySubRep.ParamByName('Rep').asinteger := SalesInvoice.SubRep;
      qrySubRep.open;
    end;

  finally
    PBLURepFrm.Free;
  end;
end;

procedure TPBMaintSalesInvoicefrm.btnEndUserClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := True;
    PBLUCustFrm.SelCode := SalesInvoice.EndUserCustomer;
    PBLUCustFrm.SelBranch := SalesInvoice.EndUserBranch;
    PBLUCustFrm.bEndUsers := true;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
      begin
        SalesInvoice.EndUserCustomer := PBLUCustFrm.SelCode;
        SalesInvoice.EndUserBranch := PBLUCustFrm.SelBranch;
        edtEndUser.Text := PBLUCustFrm.SelName + '/' + PBLUCustFrm.SelBranchName;
      end;
  finally
    PBLUCustFrm.Free;
  end;

end;

procedure TPBMaintSalesInvoicefrm.edtAltInvoiceNumberChange(Sender: TObject);
begin
  salesinvoice.AltInvoiceNumber := edtAltInvoiceNumber.Text;
end;

end.

