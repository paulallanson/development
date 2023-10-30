unit PBMaintSuppInvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ComCtrls, ExtCtrls, PBSupplierInvoiceDM, StdCtrls, Buttons, Menus,
  DBCtrls, CCSCommon, PBPOObjects, Math;

type
  TPBMaintSuppInvoicefrm = class(TForm)
    pnlHeader: TPanel;
    stbrDetails: TStatusBar;
    pnlBottom: TPanel;
    pnlFooter: TPanel;
    sgLines: TStringGrid;
    Label6: TLabel;
    Label7: TLabel;
    memSupplier: TMemo;
    edtAccountCode: TEdit;
    btnSupplier: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    edtInvoiceDate: TEdit;
    edtInvNumber: TEdit;
    edtPINRef: TEdit;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    sgCharges: TStringGrid;
    btnInvDate: TBitBtn;
    Label9: TLabel;
    lblDeleteprompt: TLabel;
    pmnCharges: TPopupMenu;
    mnAddChg: TMenuItem;
    mnChangeChg: TMenuItem;
    mnDeleteChg: TMenuItem;
    pmnLines: TPopupMenu;
    mnChangeLine: TMenuItem;
    mnDeleteLine: TMenuItem;
    N1: TMenuItem;
    mnAddfromOrder: TMenuItem;
    mnAddfromJobBag: TMenuItem;
    pmnDummy: TPopupMenu;
    dblkpOperator: TDBLookupComboBox;
    pnlTotals: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    memGoods: TMemo;
    memVAT: TMemo;
    memTotal: TMemo;
    Label10: TLabel;
    edtOrigInvoice: TEdit;
    lblOrigInvoice: TStaticText;
    pnlValues: TPanel;
    lblInvoiceValue: TLabel;
    lblOrderValue: TLabel;
    LblTotInvVal: TLabel;
    mnAddfromPO: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure btnInvDateClick(Sender: TObject);
    procedure edtInvoiceDateExit(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure sgLinesDblClick(Sender: TObject);
    procedure mnChangeLineClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtPINRefChange(Sender: TObject);
    procedure mnChangeChgClick(Sender: TObject);
    procedure mnAddChgClick(Sender: TObject);
    procedure mnDeleteChgClick(Sender: TObject);
    procedure edtInvNumberChange(Sender: TObject);
    procedure mnAddfromOrderClick(Sender: TObject);
    procedure mnAddfromJobBagClick(Sender: TObject);
    procedure pmnLinesPopup(Sender: TObject);
    procedure pmnChargesPopup(Sender: TObject);
    procedure memGoodsChange(Sender: TObject);
    procedure CheckKeyIsNumber(Sender: TObject; var Key: Char);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure memVATChange(Sender: TObject);
    procedure sgChargesDblClick(Sender: TObject);
    procedure mnDeleteLineClick(Sender: TObject);
    procedure sgLinesSelectCell(Sender: TObject; vCol, vRow: Integer;
      var CanSelect: Boolean);
    procedure mnAddfromPOClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FMode: TpiMode;
    FSupplierInvoice: TSuppInvoice;
    soldValue: string;
    sInvoiceorCredit: string;
    bJobBagsinUse: bytebool;
    bStockinUse: bytebool;
    AccountsPackage: string;
    procedure SetMode(const Value: TpiMode);
    procedure SetSupplierInvoice(const Value: TSuppInvoice);
    procedure ShowDetails;
    procedure ShowLineDetails;
    procedure BuildLineGrid;
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure BuildChargesGrid;
    procedure ShowCharges;
    procedure ShowTotals;
    procedure ShowTotalGoodsVAT;
    procedure SetLineHeaders;
    procedure CallMaintChgsScreen(aMode: TpicMode);
    procedure CallMaintScreen(aMode: TpilMode);
    procedure CallPOSelectScreen;
    procedure CallPurchSelectScreen;
    procedure CallJBSelectScreen;
    procedure SetComponentColours;
    { Private declarations }
  public
    FActivated : Boolean;
    FTotalsChanged: Boolean;
    bQueryInvoice: Boolean;
    property Mode: TpiMode read FMode write SetMode;
    property SupplierInvoice: TSuppInvoice read FSupplierInvoice write SetSupplierInvoice;
  end;

var
  PBMaintSuppInvoicefrm: TPBMaintSuppInvoicefrm;

implementation

uses Types, UITypes, PBMainMenu, PBLUSupp, DateSelV5, PBMaintSuppInvoiceLine, PBMaintSuppInvoiceChgs,
      PBLUSupplierInvoicePO, PBLUSupplierInvoiceJB, PBLUSupplierInvoicePurch, PBDatabase;

{$R *.DFM}

{ TPBMaintSuppInvoicefrm }

procedure TPBMaintSuppInvoicefrm.SetMode(const Value: TpiMode);
begin
  FMode := Value;
end;

procedure TPBMaintSuppInvoicefrm.SetSupplierInvoice(
  const Value: TSuppInvoice);
begin
  FSupplierInvoice := Value;
end;

procedure TPBMaintSuppInvoicefrm.FormActivate(Sender: TObject);
var
  sTemp: string;
  sGoods, sVAT: string;
begin
  if not FActivated then
  begin
    if SupplierInvoice.InvoiceorCredit = 'C' then
      sInvoiceorCredit := 'Credit Note'
    else
      sInvoiceorCredit := 'Invoice';

    with SupplierInvoice.DataModule do
    begin
      qryOperator.close;
      qryOperator.open;
    end;

    with SupplierInvoice.DataModule do
    begin
      qryCompany.close;
      qryCompany.open;
      bJobBagsinUse := (qryCompany.fieldbyname('Job_bag_in_use').asstring = 'Y');
      try
        bStockinUse := (qryCompany.fieldbyname('Use_Stock_system').asstring = 'Y');
      except
        bStockinUse := false;
      end;
    end;

    Label1.Visible := dmBroker.UseSuppInvPIN;
    edtPINRef.Visible := dmBroker.UseSuppInvPIN;

    case Mode of
    piAdd     : Caption := 'Add a Supplier '+sInvoiceorCredit;
    piChange  : Caption := 'Change a Supplier '+sInvoiceorCredit;
    piDelete  : Caption := 'Delete a Supplier '+sInvoiceorCredit;
    piRaise   : Caption := 'Raise a Supplier '+sInvoiceorCredit;
    end;  { case }
    if Mode = piAdd then
      sTemp := ' New Supplier '+sInvoiceorCredit
    else
      sTemp := ' Supplier '+sInvoiceorCredit + ' ' + IntToStr(SupplierInvoice.DbKey) + ' ';
    ShowDetails;
    ShowLineDetails;
    ShowCharges;

    ShowTotals;
    {Had to put this in because the components where losing the Listdatasource}
    dblkpOperator.ListSource := SupplierInvoice.DataModule.dsOperator;

    {Check for differences in totals}
    sGoods := formatfloat('0.00',SupplierInvoice.TotalGoods);
    sVAT := formatfloat('0.00',SupplierInvoice.TotalVAT);

    {Set components to red if credit note}
    if SupplierInvoice.InvoiceorCredit = 'C' then
      SetComponentColours;

    if (Mode <> piAdd) and (Mode <> piRaise) then
      begin
        if (formatfloat('0.00',SupplierInvoice.GoodsValue) <> sGoods) or
          (formatfloat('0.00',SupplierInvoice.VATValue) <> sVAT) then
          begin
            stbrDetails.panels[0].text := 'Invoice Goods or Vat totals have been modified.';
            FTotalsChanged := true;
          end
        else
          FTotalsChanged := False;
      end;

    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TPBMaintSuppInvoicefrm.ShowDetails;
begin
  if Mode = piAdd then
    begin
      edtInvNumber.text := '';
      edtInvoiceDate.text := PBDateStr(Date);
      memSupplier.text := '';
      edtAccountCode.text := '';
      edtPINRef.text := '';
      dblkpOperator.KeyValue := frmpbMainMenu.iOperator;
      edtOrigInvoice.text := '';
    end
  else
    begin
      if SupplierInvoice.SINumber = '' then
        edtInvNumber.text := ''
      else
        edtInvNumber.text := SupplierInvoice.SINumber;

      {Display when the invoice was raised}
      if SupplierInvoice.DateCreated <> 0 then
        stbrDetails.panels[1].Text := 'Invoice raised on: ' + PBDateStr(SupplierInvoice.DateCreated)
      else
        stbrDetails.panels[1].Text := '';

      edtInvoiceDate.text := PBDateStr(SupplierInvoice.SIDate);
      memSupplier.text := SupplierInvoice.SupplierName + #13#10 + SupplierInvoice.BranchName + #13#10
                          + SupplierInvoice.DataModule.GetSupplierAddress(SupplierInvoice.Supplier,SupplierInvoice.Branch);
      edtAccountCode.text := SupplierInvoice.AccountCode;
      edtPINRef.text := SupplierInvoice.PIReference;
      if SupplierInvoice.Operator = 0 then
        dblkpOperator.KeyValue :=  frmpbMainMenu.iOperator
      else
        dblkpOperator.KeyValue :=  SupplierInvoice.Operator;
      memGoods.text := formatfloat('0.00',SupplierInvoice.GoodsValue);
      memVAT.text := formatfloat('0.00',SupplierInvoice.VATValue);

      edtOrigInvoice.text := SupplierInvoice.OriginalSINumber;
    end;
  pnlHeader.enabled := not(Mode = piView) and not(Mode = piDelete);
  pnlTotals.enabled := not(Mode = piView) and not(Mode = piDelete);

  btnOK.Visible := not(Mode = piView);
  lbldeleteprompt.visible := (Mode = piDelete);

  lblOrigInvoice.Visible := (SupplierInvoice.InvoiceorCredit = 'C');
  edtOrigInvoice.Visible := (SupplierInvoice.InvoiceorCredit = 'C');

  if (Mode = piView) or (Mode = piDelete) then
    begin
      sgLines.popupMenu := pmnDummy;
      sgCharges.popupMenu := pmnDummy;
    end;
end;

procedure TPBMaintSuppInvoicefrm.ShowLineDetails;
begin
  if Mode = piAdd then
    begin
      ClearGrid(sgLines);  {Clear contents of Line grid}
      BuildLineGrid;
    end
  else
    begin
      BuildLineGrid;
    end;
end;

procedure TPBMaintSuppInvoicefrm.ShowCharges;
begin
  if Mode = piAdd then
    begin
      ClearGrid(sgCharges);  {Clear contents of Line grid}
      BuildChargesGrid;
    end
  else
    begin
      BuildChargesGrid;
    end;
end;

procedure TPBMaintSuppInvoicefrm.ShowTotalGoodsVAT;
begin
  if not FTotalsChanged then
    begin
      memGoods.text := FormatFloat('0.00',SupplierInvoice.TotalGoods);
      memVAT.text := FormatFloat('0.00',SupplierInvoice.TotalVAT);
    end;
end;

procedure TPBMaintSuppInvoicefrm.ShowTotals;
begin
(*  memGoods.text := FloatToStrF(SupplierInvoice.TotalGoods, ffCurrency, 15, 2);
  memVAT.text := FloatToStrF(SupplierInvoice.TotalVAT, ffCurrency, 15, 2);
*)
  memTotal.text := FormatFloat('0.00',(SupplierInvoice.GoodsValue+SupplierInvoice.VATValue));
end;

procedure TPBMaintSuppInvoicefrm.CheckOK(Sender : TObject);
begin
  btnOK.enabled := ((dblkpOperator.keyvalue <> 0) and
                    (edtAccountCode.text <> '') and
                    ((edtPINRef.text <> '') or (not dmBroker.UseSuppInvPIN)) and
                    (edtInvoiceDate.text <> '') and
                    (edtInvNumber.text <> '')) or
                   (Mode = piDelete);
end;

procedure TPBMaintSuppInvoicefrm.ClearGrid(TempGrid: TStringGrid);
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

procedure TPBMaintSuppInvoicefrm.BuildLineGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgLines, SupplierInvoice.datamodule do
    begin
      for i := 0 to pred(SupplierInvoice.Lines.count) do
        begin
        cells[0,i+1] := inttostr(SupplierInvoice.Lines[i].SILine);
        if SupplierInvoice.Lines[i].PONumber <> 0 then
          begin
            cells[1,i+1] := 'PO/'+floattostr(SupplierInvoice.Lines[i].PONumber);
            cells[2,i+1] := SupplierInvoice.Lines[i].Description;
            cells[3,i+1] := floattostr(SupplierInvoice.Lines[i].Quantity);
            cells[4,i+1] := SupplierInvoice.Lines[i].PriceUnitDescr;
            cells[5,i+1] := formatfloat('0.000',SupplierInvoice.Lines[i].GoodsValue);
          end
        else
        if SupplierInvoice.Lines[i].PurchNumber <> 0 then
          begin
            cells[1,i+1] := 'PO/'+ GetPurchOrdNumber(SupplierInvoice.Lines[i].PurchNumber);
            cells[2,i+1] := SupplierInvoice.Lines[i].Description;
            cells[3,i+1] := showinPacks(round(SupplierInvoice.Lines[i].Quantity),SupplierInvoice.Lines[i].PackQty);
            cells[4,i+1] := inttostr(SupplierInvoice.Lines[i].PackQty);
            cells[5,i+1] := formatfloat('0.000',(SupplierInvoice.Lines[i].GoodsValue*SupplierInvoice.Lines[i].PackQty));
          end
        else
        if SupplierInvoice.Lines[i].JBNumber <> 0 then
          begin
            cells[1,i+1] := 'JB/'+inttostr(SupplierInvoice.Lines[i].JBNumber);
            cells[2,i+1] := SupplierInvoice.Lines[i].Description;
            cells[3,i+1] := floattostr(SupplierInvoice.Lines[i].Quantity);
            cells[4,i+1] := SupplierInvoice.Lines[i].PriceUnitDescr;
            cells[5,i+1] := formatfloat('0.000',SupplierInvoice.Lines[i].GoodsValue);
          end;

        cells[6,i+1] := formatfloat('0.00',SupplierInvoice.Lines[i].TotalGoods);
        cells[7,i+1] := formatfloat('0.00%',SupplierInvoice.Lines[i].VATRate);
        cells[8,i+1] := SupplierInvoice.Lines[i].Nominal;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;

(*      lblOrderValue.visible := (SupplierInvoice.InvoiceorCredit <> 'C');
      lblInvoiceValue.visible := (SupplierInvoice.InvoiceorCredit <> 'C');
      lblTotInvVal.visible := (SupplierInvoice.InvoiceorCredit <> 'C');
*)
      pnlValues.visible := (SupplierInvoice.InvoiceorCredit <> 'C') and (SupplierInvoice.Lines[row-1].PONumber <> 0);
      lblOrderValue.caption := 'Total value of this order: ' + formatfloat('#,##0.00',SupplierInvoice.Lines[row-1].TotalOrderValue);
      lblInvoiceValue.caption := 'Total value of other invoices/credits for this order: ' + formatfloat('#,##0.00',SupplierInvoice.Lines[row-1].TotalPInvoiceValue);
      lblTotInvVal.Caption := 'Total value of invoices for this order including this invoice: '+ formatfloat('#,##0.00',SupplierInvoice.Lines[row-1].TotalPInvoiceValue+
                                                                                                                        SupplierInvoice.Lines[row-1].TotalGoods+
                                                                                                                        SupplierInvoice.POExtraCharges(SupplierInvoice.Lines[row-1].PONumber));
    end;
end;

procedure TPBMaintSuppInvoicefrm.BuildChargesGrid;
var
  i, icount: integer;
begin
  icount := 0;
  ClearGrid(sgCharges);
  with sgCharges do
    begin
      for i := 0 to pred(SupplierInvoice.Charges.count) do
        begin
        cells[0,i+1] := inttostr(SupplierInvoice.Charges[i].SICharge);
        cells[1,i+1] := SupplierInvoice.Charges[i].Details;
        cells[2,i+1] := formatfloat('0.00',SupplierInvoice.Charges[i].Amount);
        cells[3,i+1] := formatfloat('0.00%',SupplierInvoice.Charges[i].VATRate);
        cells[4,i+1] := SupplierInvoice.Charges[i].Nominal;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
end;

procedure TPBMaintSuppInvoicefrm.FormCreate(Sender: TObject);
begin
  stbrDetails.Top := Screen.Height - stbrDetails.Height;
  AccountsPackage := dmBroker.GetAccountsPackage;

  SetLineHeaders;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);

  for var i := 0 to sgLines.ColCount-1 do
  begin
    if not (i in [0,1,2]) then
      sgLines.ColAlignments[i] := taRightJustify;
  end;

  for var i := 0 to sgCharges.ColCount-1 do
  begin
    if not (i in [0,1]) then
      sgCharges.ColAlignments[i] := taRightJustify;
  end;
end;

procedure TPBMaintSuppInvoicefrm.SetLineHeaders;
begin
  {Invoice Line header}
  sgLines.cells[0,0] := 'Line';
  sgLines.cells[1,0] := 'Order';
  sgLines.cells[2,0] := 'Description';
  sgLines.cells[3,0] := 'Quantity';
  sgLines.cells[4,0] := 'Price Unit';
  sgLines.cells[5,0] := 'Goods';
  sgLines.cells[6,0] := 'Total Goods';
  sgLines.cells[7,0] := 'VAT Rate';
  sgLines.cells[8,0] := 'Nominal';

  {Invoice Charges header}
  sgCharges.cells[0,0] := 'Line';
  sgCharges.cells[1,0] := 'Description';
  sgCharges.cells[2,0] := 'Goods';
  sgCharges.cells[3,0] := 'VAT';
  sgCharges.cells[4,0] := 'Nominal';
end;

procedure TPBMaintSuppInvoicefrm.btnSupplierClick(Sender: TObject);
begin
  PBLUSuppfrm := TPBLUSuppfrm.Create(self);
  try
    PBLUSuppfrm.bIs_Lookup := true;
    PBLUSuppfrm.bSel_Branch := True;
    PBLUSuppfrm.bAllow_Upd := true;

    PBLUSuppfrm.Selcode := SupplierInvoice.Supplier;
    PBLUSuppfrm.SelBranch := SupplierInvoice.Branch;

    PBLUSuppfrm.SelName := SupplierInvoice.SupplierName;
    PBLUSuppfrm.SelBranchName := SupplierInvoice.BranchName;

    PBLUSuppfrm.ShowModal;
    if PBLUSuppfrm.selected then
    begin
      SupplierInvoice.Supplier := PBLUSuppfrm.Selcode;
      SupplierInvoice.SupplierName := PBLUSuppfrm.SelName;
      SupplierInvoice.Branch := PBLUSuppfrm.SelBranch;
      SupplierInvoice.BranchName := PBLUSuppfrm.SelBranchName;

      memSupplier.text := '';
      memSupplier.text := SupplierInvoice.SupplierName + #13#10 + SupplierInvoice.BranchName + #13#10
                          + SupplierInvoice.DataModule.GetSupplierAddress(SupplierInvoice.Supplier,SupplierInvoice.Branch);
      edtAccountCode.text := SupplierInvoice.DataModule.GetAccountCode(SupplierInvoice.Supplier,SupplierInvoice.Branch);
      checkOK(self);
    end;
  finally
    PBLUSuppfrm.Free;
  end;
end;

procedure TPBMaintSuppInvoicefrm.btnInvDateClick(Sender: TObject);
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
      edtInvoicedate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
    checkOK(self);
  end;
end;

procedure TPBMaintSuppInvoicefrm.edtInvoiceDateExit(Sender: TObject);
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

  edtInvoiceDate.Text := PBDatestr(NewDate);
end;

procedure TPBMaintSuppInvoicefrm.sgLinesDblClick(Sender: TObject);
begin
  if (Mode <> piView) and (Mode <> piDelete) then
    mnChangeLineClick(self);
end;

procedure TPBMaintSuppInvoicefrm.mnChangeLineClick(Sender: TObject);
begin
  CallMaintScreen(pilChange);
end;

procedure TPBMaintSuppInvoicefrm.btnOKClick(Sender: TObject);
var
  TempWord: Word;
  sTemp: string;
  sGoods, sVAT: string;
  i: integer;
begin
  SupplierInvoice.SIDate := PBDateStr(edtInvoiceDate.text);
  SupplierInvoice.Operator := dblkpOperator.KeyValue;

  if (Mode = piAdd) or (Mode = piRaise) or (Mode = piChange) then
    begin
    for i := 0 to pred(SupplierInvoice.Lines.count) do
      begin
        if (trim(Supplierinvoice.Lines[i].Nominal) = '') then
          begin
            messagedlg('The Invoice cannot be saved, line '+inttostr(Supplierinvoice.Lines[i].SILine)+' has an invalid nominal code',mterror, [mbAbort], 0);
            exit;
          end;
      end;
    end;

  if dmBroker.UseSuppInvPIN then
    begin
      sTemp := trim(SupplierInvoice.CheckPIN(SupplierInvoice.dbKey,SupplierInvoice.PIReference));

      if (stemp <> '') and (Mode <> piDelete) then
        begin
          messagedlg(sTemp, mtError, [mbAbort], 0);
          exit;
        end;
    end;

  if SupplierInvoice.InvoiceorCredit <> 'C' then
    begin
    {Check that the value of the lines is not greater than the order value}
    for i := 0 to pred(SupplierInvoice.Lines.count) do
      begin
        if SupplierInvoice.Lines[i].PONumber = 0 then continue;
        if roundTo((SupplierInvoice.Lines[i].TotalGoods + SupplierInvoice.Lines[i].TotalPInvoiceValue),-2) >
            roundTo(SupplierInvoice.Lines[i].TotalOrderValue,-2) then
            begin
              if SupplierInvoice.DataModule.CanPassInvoices then
                begin
                  TempWord := MessageDlg('The total value of invoices received for line ' + inttostr(SupplierInvoice.Lines[i].SILine) +
                          ' is greater than the original order total, do you want to flag the invoice for query?', mtConfirmation,
                      [mbYes, mbNo, mbCancel], 0) ;
                  if TempWord = mrNo then
                    begin
                      SupplierInvoice.QueryThisInvoice := false;
                    end
                  else
                  if TempWord = mrCancel then
                    exit
                  else
                    begin
                      SupplierInvoice.QueryThisInvoice := true;
                    end;
                end
              else
                if messagedlg('The total value of invoices received for line ' + inttostr(SupplierInvoice.Lines[i].SILine) +
                          ' is greater than the original order total, the invoice will be flagged as query, continue?',
                          mtConfirmation, [mbYes, mbNo], 1) = mrNo then
                  exit
                else
                  SupplierInvoice.QueryThisInvoice := true;
            end;
      end;
    end
  else
    begin
      stemp := trim(SupplierInvoice.CheckSInvoice(SupplierInvoice.Supplier, SupplierInvoice.Branch, SupplierInvoice.OriginalSINumber));

      if (sTemp <> '') and (Mode <> piDelete) then
        begin
          if MessageDlg(sTemp, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              SupplierInvoice.PassSInvoice(SupplierInvoice.Supplier, SupplierInvoice.Branch, SupplierInvoice.OriginalSINumber)
            end;
        end;

    end;

  if (SupplierInvoice.SIStatus < 20) and (SupplierInvoice.QueryThisInvoice) then
    SupplierInvoice.SIStatus := 15;

  sGoods := formatfloat('0.00',Supplierinvoice.TotalGoods);
  sVAT := formatfloat('0.00',SupplierInvoice.TotalVAT);

  if (memGoods.text <> sGoods) or
     (memVAT.text <> sVAT) then
     if messagedlg('Totals for the invoice do not match the totals for all the lines - continue?',
          mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
     exit;


  if (Mode = piAdd) or (Mode = piRaise) or (Mode = piChange) then
    begin
      if SupplierInvoice.InvoiceorCredit = 'C' then
        SupplierInvoice.SaveCreditToDB(true)
      else
        SupplierInvoice.SaveToDB(true);
    end
  else
  if (Mode = piDelete) then
    begin
      SupplierInvoice.Inactive := 'Y';
      SupplierInvoice.DeleteFromDB;
    end;

  ModalResult := mrOK;
end;

procedure TPBMaintSuppInvoicefrm.CallMaintScreen(aMode : TpilMode);
var
  inx : integer;
  SuppInvoiceLine : TSuppInvoiceLine;
  frm: TPBMaintSuppInvoiceLineFrm;
begin
//  inx := sgLines.row;
  inx := StrToIntDef(sgLines.cells[0,sgLines.row], 0);
  try
    frm := TPBMaintSuppInvoiceLineFrm.Create(Self);
    try
      if aMode = pilAdd then
        SuppInvoiceLine := TSuppInvoiceLine.Create(SupplierInvoice)
      else
      begin
        inx := SupplierInvoice.Lines.IndexOf(inx);
        SuppInvoiceLine := SupplierInvoice.Lines[inx];
      end;
      Frm.SuppInvoiceLine := SuppInvoiceLine;
      Frm.Mode := aMode;
      Frm.AccountsPackage := AccountsPackage;
      Frm.ShowModal;
      if (aMode = pilAdd) and (Frm.ModalResult <> mrOK) then
        SuppInvoiceLine.Free;
    finally
      Frm.Free;
    end;
  finally
    ShowLineDetails;
    ShowTotalGoodsVat;
    ShowTotals;
  end;
end;

procedure TPBMaintSuppInvoicefrm.edtPINRefChange(Sender: TObject);
begin
  SupplierInvoice.PIReference := edtPINRef.text;
  CheckOK(self);
end;

procedure TPBMaintSuppInvoicefrm.mnChangeChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(picChange);
end;

procedure TPBMaintSuppInvoicefrm.CallMaintChgsScreen(aMode : TpicMode);
var
  inx : integer;
  SuppInvoiceChg : TSuppInvoiceChg;
  frm: TPBMaintSuppInvoiceChgsFrm;
begin
  inx := sgCharges.row;
  try
    frm := TPBMaintSuppInvoiceChgsFrm.Create(Self);
    try
      if aMode = picAdd then
        SuppInvoiceChg := TSuppInvoiceChg.create(SupplierInvoice)
      else
      begin
        inx := SupplierInvoice.Charges.IndexOf(inx);
        SuppInvoiceChg := SupplierInvoice.Charges[inx];
      end;
      Frm.SuppInvoiceChg := SuppInvoiceChg;
      Frm.AccountsPackage := AccountsPackage;
      Frm.Mode := aMode;
      Frm.ShowModal;
      if (aMode = picAdd) and (Frm.ModalResult <> mrOK) then
        SuppInvoiceChg.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowCharges;
          ShowTotalGoodsVat;
          ShowTotals;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = picAdd then
      begin
        inx := pred(SupplierInvoice.Charges.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = picDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgCharges.row := inx+1;
  end;
end;

procedure TPBMaintSuppInvoicefrm.mnAddChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(picAdd);
end;

procedure TPBMaintSuppInvoicefrm.mnDeleteChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(picDelete);
end;

procedure TPBMaintSuppInvoicefrm.edtInvNumberChange(Sender: TObject);
begin
  SupplierInvoice.SINumber := edtInvNumber.text;
  CheckOK(self);
end;

procedure TPBMaintSuppInvoicefrm.mnAddfromOrderClick(Sender: TObject);
begin
  CallPOSelectScreen;
end;

procedure TPBMaintSuppInvoicefrm.CallPOSelectScreen;
var
  SuppInvoiceLine : TSuppInvoiceLine;
  frm: TPBLUSupplierInvoicePOFrm;
begin
  frm := TPBLUSupplierInvoicePOFrm.Create(Self);
  try
    SuppInvoiceLine := TSuppInvoiceLine.Create(SupplierInvoice);
    frm.SuppInvoiceLine := SuppInvoiceLine;
    frm.Mode := 'A';
    Frm.ShowModal;
    if (Frm.ModalResult <> mrOK) then
      SuppInvoiceLine.Free;
    if Frm.ModalResult = mrOK then
      begin
        SupplierInvoice.AddPOLineCharges(SuppInvoiceLine.PONumber, SuppInvoiceLine.POLine);
        ShowLineDetails;
        ShowTotalGoodsVAT;
        ShowTotals;
        ShowCharges;
      end;
  finally
    Frm.Free;
  end;
end;

procedure TPBMaintSuppInvoicefrm.CallJBSelectScreen;
var
  SuppInvoiceLine : TSuppInvoiceLine;
  frm: TPBLUSupplierInvoiceJBFrm;
begin
  frm := TPBLUSupplierInvoiceJBFrm.Create(Self);
  try
    SuppInvoiceLine := TSuppInvoiceLine.Create(SupplierInvoice);
    frm.SuppInvoiceLine := SuppInvoiceLine;
    frm.Mode := 'A';
    Frm.ShowModal;
    if (Frm.ModalResult <> mrOK) then
      SuppInvoiceLine.Free;
    if Frm.ModalResult = mrOK then
      begin
        ShowLineDetails;
        ShowTotalGoodsVAT;
        ShowTotals;
      end;
  finally
    Frm.Free;
  end;
end;

procedure TPBMaintSuppInvoicefrm.mnAddfromJobBagClick(Sender: TObject);
begin
  CallJBSelectScreen;
end;

procedure TPBMaintSuppInvoicefrm.pmnLinesPopup(Sender: TObject);
begin
  mnChangeLine.enabled := not (SupplierInvoice.Lines.count = 0);
  mnDeleteLine.enabled := not (SupplierInvoice.Lines.count = 0);
  mnAddfromOrder.Enabled := not (Mode = piRaise);
  mnAddfromJobBag.Enabled := not (Mode = piRaise);
  mnAddfromPO.Enabled := not (Mode = piRaise);

  mnAddfromOrder.visible := not (SupplierInvoice.InvoiceorCredit = 'C');
  mnAddfromJobBag.visible := not (SupplierInvoice.InvoiceorCredit = 'C') and (bJobBagsinUse);
  mnAddfromPO.visible := not (SupplierInvoice.InvoiceorCredit = 'C') and (bstockinUse);
end;

procedure TPBMaintSuppInvoicefrm.pmnChargesPopup(Sender: TObject);
begin
  mnChangeChg.enabled := not (SupplierInvoice.Charges.count = 0);
  mnDeleteChg.enabled := not (SupplierInvoice.Charges.count = 0);
end;

procedure TPBMaintSuppInvoicefrm.memGoodsChange(Sender: TObject);
begin
  if FActivated then
    begin
      try
        SupplierInvoice.GoodsValue := StrToFloatDef(memGoods.text, 0, FormatSettings);
      except
        SupplierInvoice.GoodsValue := 0.00;
      end;
      ShowTotals;
    end;
end;

procedure TPBMaintSuppInvoicefrm.CheckKeyIsNumber(Sender: TObject; var Key: Char);
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

procedure TPBMaintSuppInvoicefrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintSuppInvoicefrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  if (SupplierInvoice.GoodsValue <> roundfloat(SupplierInvoice.TotalGoods,2)) or
     (SupplierInvoice.VATValue <> roundfloat(SupplierInvoice.TotalVAT,2)) then
     FTotalsChanged := true
  else
    FTotalsChanged := False;
end;

procedure TPBMaintSuppInvoicefrm.memVATChange(Sender: TObject);
begin
  if FActivated then
    begin
      try
        SupplierInvoice.VATValue := StrToFloatDef(memVAT.text, 0, FormatSettings);
      except
        SupplierInvoice.VATValue := 0.00
      end;
      ShowTotals;
    end;
end;

procedure TPBMaintSuppInvoicefrm.sgChargesDblClick(Sender: TObject);
begin
  mnChangeChgClick(Self);
end;

procedure TPBMaintSuppInvoicefrm.mnDeleteLineClick(Sender: TObject);
begin
  if SupplierInvoice.Lines.count = 1 then
    begin
      MessageDlg('Cannot delete this line, there must be at least one line on an invoice/credit note, change the prices to zero to have the same effect.', mtInformation,[mbOk], 0);
      exit;
    end
  else
    CallMaintScreen(pilDelete);
end;

procedure TPBMaintSuppInvoicefrm.SetComponentColours;
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
procedure TPBMaintSuppInvoicefrm.sgLinesSelectCell(Sender: TObject; vCol,
  vRow: Integer; var CanSelect: Boolean);
begin
  lblOrderValue.caption := 'Total value of this order: ' + formatfloat('#,##0.00',SupplierInvoice.Lines[vRow-1].TotalOrderValue);
  lblInvoiceValue.caption := 'Total value of other invoices/credits for this order: ' + formatfloat('#,##0.00',SupplierInvoice.Lines[vRow-1].TotalPInvoiceValue);
  lblTotInvVal.Caption := 'Total value of invoices for this order including this invoice: '+ formatfloat('#,##0.00',SupplierInvoice.Lines[vrow-1].TotalPInvoiceValue+
                                                                                                                    SupplierInvoice.Lines[vrow-1].TotalGoods+
                                                                                                                    SupplierInvoice.POExtraCharges(SupplierInvoice.Lines[vrow-1].PONumber));
end;

procedure TPBMaintSuppInvoicefrm.CallPurchSelectScreen;
var
  frm: TPBLUSupplierInvoicePurchFrm;
begin
  frm := TPBLUSupplierInvoicePurchFrm.Create(Self);
  try
    frm.SupplierInvoice := SupplierInvoice;
    frm.Mode := 'A';
    Frm.ShowModal;
    if Frm.ModalResult = mrOK then
      begin
        ShowLineDetails;
        ShowTotalGoodsVAT;
        ShowTotals;
      end;
  finally
    Frm.Free;
  end;
end;

procedure TPBMaintSuppInvoicefrm.mnAddfromPOClick(Sender: TObject);
begin
  CallPurchSelectScreen;
end;

procedure TPBMaintSuppInvoicefrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

end.
