unit wtMaintSalesInvoice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, wtSalesInvoiceDM,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBCtrls, Menus, allCommon, QrCtrls,
  FireDAC.Stan.Param;

type
  TfrmWTMaintSalesInvoice = class(TForm)
    stsbrDetails: TStatusBar;
    pnlBottom: TPanel;
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
    Panel6: TPanel;
    sgLines: TStringGrid;
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
    Label11: TLabel;
    dblkpRep: TDBLookupComboBox;
    btnNotes: TBitBtn;
    FlashTimer: TTimer;
    btnInternalNotes: TBitBtn;
    IntFlashTimer: TTimer;
    lblReference: TStaticText;
    mnNotPrinted: TMenuItem;
    N2: TMenuItem;
    Label10: TLabel;
    edtDescription: TEdit;
    Add1: TMenuItem;
    Panel1: TPanel;
    lblDeleteprompt: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    memDeposit: TMemo;
    lblDepositLabel: TLabel;
    lblPaymentTerms: TLabel;
    dblkpPaymentTerms: TDBLookupComboBox;
    btnPaymentTerms: TBitBtn;
    lblTotalPaid: TLabel;
    memTotalPaid: TMemo;
    memToPay: TMemo;
    Label12: TLabel;
    pnlRevenueCentre: TPanel;
    Label59: TLabel;
    SpeedButton2: TSpeedButton;
    dblkpRevenueCentre: TDBLookupComboBox;
    pnlCustomerBranch: TPanel;
    Label13: TLabel;
    edtSiteName: TEdit;
    btnCustomerBranch: TBitBtn;
    btnClearCustomerBranch: TSpeedButton;
    procedure CheckOK(Sender : TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnInvDateClick(Sender: TObject);
    procedure btnInvToCustomerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure pmnLinesPopup(Sender: TObject);
    procedure mnChangeLineClick(Sender: TObject);
    procedure sgLinesDblClick(Sender: TObject);
    procedure mnChangeChgClick(Sender: TObject);
    procedure mnAddChgClick(Sender: TObject);
    procedure sgLinesDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgChargesDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
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
    procedure edtDescriptionChange(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure memDepositChange(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure ValidateMoney(Sender: TObject);
    procedure dblkpPaymentTermsClick(Sender: TObject);
    procedure btnPaymentTermsClick(Sender: TObject);
    procedure dblkpRevenueCentreClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnCustomerBranchClick(Sender: TObject);
    procedure btnClearCustomerBranchClick(Sender: TObject);
  private
    bNotesFlash: ByteBool;
    bIntNotesFlash: ByteBool;
    bReverseCharge: boolean;
    FNominalLevel: string;
    FActivated : Boolean;
    FSalesInvoice: TSalesInvoice;
    FMode: TsiMode;
    sInvoiceorCredit: string;
    FRetailCustomer: bytebool;
    sOldValue: string;
    procedure BuildLineGrid;
    procedure CallMaintScreen(aMode : TsilMode);
    procedure CallMaintChgsScreen(aMode : TsicMode);
    procedure ClearGrid(tempGrid: TStringGrid);
    procedure GetInvoiceTo(tempcust, TempBranch: integer);
    procedure SetLineHeaders;
    procedure SetMode(const Value: TsiMode);
    procedure SetSalesInvoice(const Value: TSalesInvoice);
    procedure ShowDetails;
    procedure ShowLineDetails;
    procedure ShowTotals;
    procedure CallJBSelectScreen;
    procedure SetComponentColours;
    function DontPrintLine: boolean;
    procedure SetRetailCustomer(const Value: bytebool);
  public
    dLastPEDate: TDateTime;
    property SalesInvoice : TSalesInvoice read FSAlesInvoice write SetSalesInvoice;
    property Mode: TsiMode read FMode write SetMode;
    property RetailCustomer: bytebool read FRetailCustomer write SetRetailCustomer;
  end;

var
  frmWTMaintSalesInvoice: TfrmWTMaintSalesInvoice;

implementation

uses wtMain, DateSelV5, WTSrchCustomer, wtMaintSalesInvoiceLine, wtDBMemo,
  AllImages, WTLUPaymentTerms, wtDataModule, WTLUCustomerSite;

{$R *.DFM}

{ TPBMaintSalesInvoicefrm }

procedure TfrmWTMaintSalesInvoice.SetMode(const Value: TsiMode);
begin
  FMode := Value;
end;

procedure TfrmWTMaintSalesInvoice.SetSalesInvoice(
  const Value: TSalesInvoice);
begin
  FSAlesInvoice := Value;
end;

procedure TfrmWTMaintSalesInvoice.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    dblkpPaymentTerms.Visible := SalesInvoice.InvoiceorCredit <> 'C';
    btnPaymentTerms.Visible := dblkpPaymentTerms.Visible;
    lblPaymentTerms.Visible := dblkpPaymentTerms.Visible;

    if SalesInvoice.InvoiceorCredit = 'C' then
      sInvoiceorCredit := 'Credit'
    else
      begin
        sInvoiceorCredit := 'Invoice';
        sgLines.colwidths[9] := -1;
        sgLines.colwidths[10] := -1;
      end;

    with SalesInvoice.DataModule do
    begin
      qryOperator.close;
      qryOperator.open;
    end;

    with SalesInvoice.DataModule do
    begin
      qryCompany.close;
      qryCompany.open;
//      FNominalLevel := copy(qryCompany.fieldbyname('Nominal_level').asstring,1,1)
    end;

    with SalesInvoice.DataModule do
    begin
      qryRevenueCentre.close;
      qryRevenueCentre.open;
    end;
    dblkpRevenueCentre.listsource := SalesInvoice.DataModule.dtsRevenueCentre;

    with SalesInvoice.DataModule do
    begin
      qryRep.close;
      qryRep.open;

      qryPaymentTerms.close;
      qryPaymentTerms.open;
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

    ShowTotals;
    {Had to put this in because the components where losing the Listdatasource}
    dblkpOperator.ListSource := SalesInvoice.DataModule.dsOperator;
    dblkpRep.ListSource := SalesInvoice.DataModule.dsRep;
    dblkpPaymentTerms.ListSource := SalesInvoice.DataModule.dsPaymentTerms;

    {Set components to red if credit note}
    if SalesInvoice.InvoiceorCredit = 'C' then
      begin
        SetComponentColours;
        memTotalPaid.Visible := false;
        lblTotalPaid.Visible := false;
        memDeposit.Visible := false;
        lblDepositLabel.Visible := false;
      end;

    Checknotes(Self);
    CheckOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintSalesInvoice.ShowDetails;
begin
  if Mode = siAdd then
    begin
      edtInvNumber.text := '<New Invoice>';
      edtInvoiceDate.text := paDateStr(Date);
      memCustomer.text := '';
      edtAccountCode.text := '';
      edtSiteName.text := '';
      edtDescription.text := '';
      dblkpOperator.KeyValue := frmwtMain.Operator;
      lblReference.caption := '';
      self.RetailCustomer := false;
      memDeposit.Text := formatfloat('#0.00', 0);
      memTotalPaid.Text := formatfloat('#0.00', 0);
      dblkpRevenueCentre.KeyValue := 0;

      pnlCustomerBranch.Visible := false;
    end
  else
    begin
      if SalesInvoice.SINumber = '' then
        edtInvNumber.text := '<New Invoice>'
      else
        edtInvNumber.text := SalesInvoice.SINumber;
      edtInvoiceDate.text := paDateStr(SalesInvoice.SIDate);
      if (SalesInvoice.RetailCustomer = 'Y') OR (SalesInvoice.Speculative) then
        memCustomer.text := SalesInvoice.CustomerName + #13#10
                          + SalesInvoice.DataModule.GetInvoiceAddress(SalesInvoice.InvoiceAddress)
      else
        memCustomer.text := SalesInvoice.CustomerName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.Customer);

      bReverseCharge := SalesInvoice.DataModule.SetReverseCharge(SalesInvoice.Customer);
      if (SalesInvoice.RetailCustomer = 'Y') OR (SalesInvoice.Speculative) then
        memInvToCustomer.text := SalesInvoice.CustomerName + #13#10
                          + SalesInvoice.DataModule.GetInvoiceAddress(SalesInvoice.InvoiceAddress)
      else
        memInvToCustomer.text := SalesInvoice.CustomerName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.Customer);

      dblkpRep.keyvalue := SalesInvoice.Rep;
      dblkpRevenueCentre.KeyValue :=  SalesInvoice.RevenueCentre;

      dblkpPaymentTerms.KeyValue := SalesInvoice.PaymentTerms;

      edtSiteName.Text := SalesInvoice.CustomerBranchName;
      edtAccountCode.text := SalesInvoice.AccountCode;
      edtDescription.text := SalesInvoice.InvoiceDescription;

      if SalesInvoice.AccountManager = 0 then
        dblkpOperator.KeyValue :=  frmwtMain.Operator
      else
        dblkpOperator.KeyValue :=  SalesInvoice.AccountManager;

      lblReference.caption := 'Sales Order: '+ SalesInvoice.Reference;

      if SalesInvoice.InvoiceOrCredit = 'C' then
        lblReference.caption := 'Sales Invoice: '+SalesInvoice.Reference;
      self.RetailCustomer := (SalesInvoice.RetailCustomer = 'Y');

      try
        memDeposit.Text := formatfloat('#0.00',SalesInvoice.DepositAmount);
      except
        memDeposit.Text := formatfloat('#0.00', 0);
      end;

      try
        memTotalPaid.Text := formatfloat('#0.00',SalesInvoice.PaidAmount);
      except
        memTotalPaid.Text := formatfloat('#0.00', 0);
      end;

      pnlCustomerBranch.Visible := SalesInvoice.BranchExist;

      stsbrDetails.Panels[0].Text := 'Created by: ' + SalesInvoice.OperatorName;
    end;

  pnlTop.enabled := not(Mode = siView) and not(Mode = siDelete);
  pnlHeader.enabled := not(Mode = siView) and not(Mode = siDelete);
  btnOK.Visible := not(Mode = siView);
  lbldeleteprompt.visible := (Mode = siDelete);
  if (Mode = siView) or (Mode = siDelete) then
    begin
      sgLines.popupMenu := pmnDummy;
    end;
end;

procedure TfrmWTMaintSalesInvoice.ShowLineDetails;
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

procedure TfrmWTMaintSalesInvoice.ClearGrid(TempGrid: TStringGrid);
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

procedure TfrmWTMaintSalesInvoice.BuildLineGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgLines, SalesInvoice.datamodule do
    begin
      for i := 0 to pred(SalesInvoice.Lines.count) do
        begin
        cells[0,i+1] := inttostr(SalesInvoice.Lines[i].SILine);
        if SalesInvoice.Lines[i].Job <> 0 then
          begin
            cells[1,i+1] := 'JB/'+inttostr(SalesInvoice.Lines[i].Job);
            cells[2,i+1] := SalesInvoice.Lines[i].Description;
          end
        else
          begin
            cells[1,i+1] := GetSOPart(SalesInvoice.Lines[i].SONumber,SalesInvoice.Lines[i].SOLine);
            cells[2,i+1] := SalesInvoice.Lines[i].Description;
          end;

        cells[3,i+1] := formatfloat('0',SalesInvoice.Lines[i].Quantity);
        cells[4,i+1] := inttostr(SalesInvoice.Lines[i].SellUnit);
        cells[5,i+1] := formatfloat('0.00',(SalesInvoice.Lines[i].UnitPrice));
        cells[6,i+1] := formatfloat('0.00',(SalesInvoice.Lines[i].TotalGoods));
//        cells[7,i+1] := formatfloat('0.00%',SalesInvoice.Lines[i].VATRate);
        cells[7,i+1] := SalesInvoice.Lines[i].VATDescription;
        cells[8,i+1] := SalesInvoice.Lines[i].Nominal;
        cells[9,i+1] := SalesInvoice.Lines[i].CreditType;
        cells[10,i+1] := formatfloat('0.00',SalesInvoice.Lines[i].CostPrice);
        cells[11,i+1] := '';
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
end;

procedure TfrmWTMaintSalesInvoice.ShowTotals;
begin
  memGoods.text := FloatToStrF(SalesInvoice.TotalGoods, ffCurrency, 15, 2);
  memVAT.text := FloatToStrF(SalesInvoice.TotalVAT, ffCurrency, 15, 2);
  memTotal.text := FloatToStrF((SalesInvoice.TotalGoods+SalesInvoice.TotalVAT), ffCurrency, 15, 2);

  {Use deposit if no payments made}
  if SalesInvoice.PaidAmount = 0 then
    memToPay.text := FloatToStrF((SalesInvoice.TotalGoods+SalesInvoice.TotalVAT-SalesInvoice.DepositAmount), ffCurrency, 15, 2)
  else
    memToPay.text := FloatToStrF((SalesInvoice.TotalGoods+SalesInvoice.TotalVAT-SalesInvoice.PaidAmount), ffCurrency, 15, 2);
end;

procedure TfrmWTMaintSalesInvoice.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (dblkpOperator.keyvalue <> 0) and
                   (edtAccountCode.text <> '') and
                   (dblkpRep.text <> '') and
                   (edtDescription.text <> '');
end;

procedure TfrmWTMaintSalesInvoice.btnInvDateClick(Sender: TObject);
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
      if DateSelV5Form.Date < dLastPEDate then
        begin
          messagedlg('The date entered is for a closed period, enter a date later than '+ padatestr(dLastPEDate), mterror, [mbOK], 0);
          edtInvoiceDate.SetFocus;
        end
      else
        edtInvoicedate.Text := DateToStr(DateSelV5Form.Date);
  finally
    DateSelV5Form.Free;
  end;
  checkok(self);
end;

procedure TfrmWTMaintSalesInvoice.btnInvToCustomerClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.Create(self);
  try
    frmwtSrchCustomer.CodeSelected := SalesInvoice.Customer;

    frmwtSrchCustomer.ShowModal;
    if frmwtSrchCustomer.modalresult = idOK then
    begin
      SalesInvoice.Customer := frmwtSrchCustomer.CodeSelected;

      if (not frmwtSrchCustomer.RetailCustomer) AND (not SalesInvoice.Speculative) then
        begin
          SalesInvoice.CustomerName := frmwtSrchCustomer.NameSelected;
          memInvToCustomer.text := '';
          memInvToCustomer.text := SalesInvoice.CustomerName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.Customer);
        end;
      edtAccountCode.text := SalesInvoice.DataModule.GetAccountCode(SalesInvoice.Customer);
      SalesInvoice.AccountCode := edtAccountCode.Text;
      checkOK(self);
    end;
  finally
    frmwtSrchCustomer.Free;
  end;
end;

procedure TfrmWTMaintSalesInvoice.FormCreate(Sender: TObject);
begin
  SetLineHeaders;
  pnlRevenueCentre.Visible := dtmdlWorktops.UseRevenueCentres;
  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintSalesInvoice.SetLineHeaders;
begin
  {Invoice Line header}
  sgLines.cells[0,0] := 'Line';
  sgLines.cells[1,0] := 'Job/Product';
  sgLines.cells[2,0] := 'Description';
  sgLines.cells[3,0] := 'Quantity';
  sgLines.cells[4,0] := 'Price Unit';
  sgLines.cells[5,0] := 'Unit Price';
  sgLines.cells[6,0] := 'Total Price';
  sgLines.cells[7,0] := 'VAT Rate';
  sgLines.cells[8,0] := 'Nominal';
  sgLines.cells[9,0] := 'Credit Type';
  sgLines.cells[10,0] := 'Cost';
end;

procedure TfrmWTMaintSalesInvoice.btnOKClick(Sender: TObject);
var
  i: integer;
  sNominal: string;
begin
  if (Mode = siChange) then
    begin
      {Check that the invoice number hasn't been used previously}
      if not SalesInvoice.DataModule.CheckInvoiceUnique(trim(edtInvNumber.text), SalesInvoice.dbKey) then
        begin
          messagedlg('This invoice number is not unique, please review and change accordingly',mterror,
                    [mbAbort], 0);
          exit;
        end;

      if (trim(edtInvNumber.text) <> (SalesInvoice.SINumber)) and (trim(edtInvNumber.text) <> '') and (SalesInvoice.SIStatus <> 10) then
        begin
          messagedlg('You''ve changed the invoice number on this invoice manually, please ensure ' + #13 +
                     'that the last invoice number used is updated correctly in the Company Settings.',mtWarning,
                    [mbOK], 0);
        end;
    end;

  {Check whether reverse charge VAT applies}
  if (Mode = siAdd) or (Mode = siRaise) or (Mode = siChange) then
    begin
      if bReverseCharge then
        for i := 0 to pred(SalesInvoice.Lines.count) do
          begin
            if not Salesinvoice.Lines[i].VATReverseCharge then
              begin
                if messagedlg('This invoice requires reverse charging. The VAT for line ' + inttostr(Salesinvoice.Lines[i].SILine) +
                              ' is not set to the relevant rate. Make changes to the invoice?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                  begin
                    exit;
                  end;
              end;
          end;
    end;

  if (Mode = siAdd) or (Mode = siRaise) or (Mode = siChange) then
    begin
      {Check that invoice is positive value and credit is negative}
      if ((SalesInvoice.InvoiceOrCredit = 'I') and (Salesinvoice.TotalGoods < 0)) then
        begin
          messagedlg('The Goods total for an invoice cannot be negative.',mterror, [mbAbort], 0);
          exit;
        end;

      for i := 0 to pred(SalesInvoice.Lines.count) do
        begin
          if trim(Salesinvoice.Lines[i].Nominal) = '' then
            begin
              messagedlg('Invoice can not be saved, line '+inttostr(Salesinvoice.Lines[i].SILine)+' has no nominal code',mterror,
                    [mbAbort], 0);
              exit;
            end;
        end;
    end;

  {Check to see if different nominal code}
  if (Mode = siAdd) or (Mode = siRaise) or (Mode = siChange) then
    begin
      for i := 0 to pred(SalesInvoice.Lines.count) do
        begin
          if ((SalesInvoice.InvoiceOrCredit = 'I') and (Salesinvoice.Lines[i].GoodsValue >= 0)) OR
             ((SalesInvoice.InvoiceOrCredit = 'C') and (Salesinvoice.Lines[i].GoodsValue <= 0)) then
            begin
              sNominal := Salesinvoice.Lines[i].Nominal;
              break;
            end;
        end;

      for i := 0 to pred(SalesInvoice.Lines.count) do
        begin
          if ((SalesInvoice.InvoiceOrCredit = 'I') and (Salesinvoice.Lines[i].UnitPrice < 0) and (trim(Salesinvoice.Lines[i].Nominal) <> sNominal)) OR
             ((SalesInvoice.InvoiceOrCredit = 'C') and (Salesinvoice.Lines[i].UnitPrice > 0) and (trim(Salesinvoice.Lines[i].Nominal) <> sNominal)) then
            begin
              if messagedlg('A different nominal code has been used for discounted items to the main items. Change? ',mtWarning, [mbYes, mbNo], 0) <> mrNo then
                exit;
            end;
        end;
    end;

  SalesInvoice.SIDate := paDateStr(edtInvoiceDate.text);
  if (Mode = siRaise) or (Mode = siChange) then
    begin
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

      if SalesInvoice.InvoiceorCredit = 'C' then
        SalesInvoice.SaveCreditToDB(true)
      else
        SalesInvoice.SaveToDB(true);
    end
  else
  if (Mode = siDelete) then
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


  ModalResult := mrOK;

end;

procedure TfrmWTMaintSalesInvoice.btnCustomerClick(Sender: TObject);
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.Create(self);
  try
    frmwtSrchCustomer.CodeSelected := SalesInvoice.Customer;

    frmwtSrchCustomer.ShowModal;
    if frmwtSrchCustomer.modalresult = idOK then
    begin
      SalesInvoice.Customer := frmwtSrchCustomer.CodeSelected;
      if (not frmwtSrchCustomer.RetailCustomer) AND (not SalesInvoice.Speculative) then
        begin
          SalesInvoice.CustomerName := frmwtSrchCustomer.NameSelected;

          memInvToCustomer.text := '';
          memInvToCustomer.text := SalesInvoice.CustomerName + #13#10
                          + SalesInvoice.DataModule.GetCustomerAddress(SalesInvoice.Customer);
        end;
        
      edtAccountCode.text := SalesInvoice.DataModule.GetAccountCode(SalesInvoice.Customer);
      bReverseCharge := SalesInvoice.DataModule.SetReverseCharge(SalesInvoice.Customer);
      checkOK(self);
    end;
  finally
    frmwtSrchCustomer.Free;
  end;
end;

procedure TfrmWTMaintSalesInvoice.pmnLinesPopup(Sender: TObject);
begin
  mnChangeLine.enabled := not (SalesInvoice.Lines.count = 0);
  mnDeleteLine.enabled := not (SalesInvoice.Lines.count = 0);
//  mnAddfromOrder.visible := (SalesInvoice.SIType = '');
  mnAddfromJobBag.visible := (SalesInvoice.SIType = 'J');
//  mnAddfromSalesOrder.visible := (SalesInvoice.SIType = 'S');
  mnNotPrinted.Checked := DontPrintLine;
end;

function TfrmWTMaintSalesInvoice.DontPrintLine: boolean;
var
  inx: integer;
  SalesInvoiceLine: TSalesInvoiceLine;
begin
  inx := strtoint(sgLines.cells[0,sgLines.row]);
  inx := SalesInvoice.Lines.IndexOf(inx);
  SalesInvoiceLine := SalesInvoice.Lines[inx];
  result := (SalesInvoiceLine.NotPrinted = 'Y');
end;

procedure TfrmWTMaintSalesInvoice.mnChangeLineClick(Sender: TObject);
begin
  CallMaintScreen(silChange);
end;

procedure TfrmWTMaintSalesInvoice.CallMaintScreen(aMode : TsilMode);
var
  inx : integer;
  SalesInvoiceLine : TSalesInvoiceLIne;
  frm: TfrmwtMaintSalesInvoiceLine;
begin
//  inx := sgLines.row;
  inx := strtoint(sgLines.cells[0,sgLines.row]);
  try
    frm := TfrmwtMaintSalesInvoiceLine.Create(Self);
    try
      if aMode = silAdd then
        SalesInvoiceLine := TSalesInvoiceLine.Create(SalesInvoice)
      else
      begin
        inx := SalesInvoice.Lines.IndexOf(inx);
        SalesInvoiceLine := SalesInvoice.Lines[inx];
      end;
      if Mode = siView then
        aMode := silView;
      Frm.SalesInvoiceLine := SalesInvoiceLine;
      Frm.NominalType := FNominalLevel;
      Frm.Mode := aMode;
      Frm.ProductCode := sglines.cells[1,sgLines.row];
      Frm.ShowModal;
      if (aMode = silAdd) and (Frm.ModalResult <> mrOK) then
        SalesInvoiceLine.Free;
    finally
      Frm.Free;
    end;
  finally
    ShowLineDetails;
    ShowTotals;
  end;
end;

procedure TfrmWTMaintSalesInvoice.sgLinesDblClick(Sender: TObject);
begin
  if (SalesInvoice.Lines.count = 0) then
    exit;
  if (Mode <> siDelete) then
    mnChangeLineClick(self);
end;

procedure TfrmWTMaintSalesInvoice.mnChangeChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(sicChange);
end;

procedure TfrmWTMaintSalesInvoice.CallMaintChgsScreen(aMode : TsicMode);
begin
end;

procedure TfrmWTMaintSalesInvoice.mnAddChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(sicAdd);
end;

procedure TfrmWTMaintSalesInvoice.sgLinesDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (vCol = 0) or (vCol = 1) or (vCol = 2) or (vCol = 11) then
  	begin
      if (vrow > 0) and (SalesInvoice.Lines.count > 0) and (SalesInvoice.Lines[vRow-1].NotPrinted = 'Y') then
        (Sender as TStringGrid).Canvas.font.Color := clRed;
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
      if (vrow > 0) and (SalesInvoice.Lines.count > 0) and (SalesInvoice.Lines[vRow-1].NotPrinted = 'Y') then
        (Sender as TStringGrid).Canvas.font.Color := clRed;

  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
end;

procedure TfrmWTMaintSalesInvoice.sgChargesDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if (vCol = 0) or (vCol = 1)then
  	begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end
  else
  	begin
			{Display the Columns Right justified in the cells}
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[vCol, vRow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
end;

procedure TfrmWTMaintSalesInvoice.btnNotesClick(Sender: TObject);
var
  frmwtDBInvMemo: TfrmwtDBMemo;
begin
  frmwtDBInvMemo := TfrmwtDBMemo.create(self);
  try
    if Mode = siView then
      frmwtDBInvMemo.bAllow_Upd := false
    else
      frmwtDBInvMemo.bAllow_Upd := true;

    frmwtDBInvMemo.Datamemo.text := SalesInvoice.NarrativeText;
    frmwtDBInvMemo.ShowModal;
    SalesInvoice.Narrativetext := frmwtDBInvMemo.Datamemo.text;
  finally
    frmwtDBInvMemo.free;
  end;
  checknotes(Self);
end;

procedure TfrmWTMaintSalesInvoice.CheckNotes(Sender: TObject);
begin
  if trim(SalesInvoice.NarrativeText) <> '' then
  begin
    FlashTimer.Enabled := True;
    btnNotes.Glyph := frmAllImages.OnBitBtn.Glyph;
  end
  else
  begin
    FlashTimer.Enabled := False;
    btnNotes.Glyph := frmAllImages.OffBitBtn.Glyph;
  end;

  {Now check for internal notes}
  if trim(SalesInvoice.IntNarrativeText) <> '' then
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

procedure TfrmWTMaintSalesInvoice.FlashTimerTimer(Sender: TObject);
begin
  if bNotesFlash then
    btnNotes.Glyph := frmAllImages.OnBitBtn.Glyph
  else
    btnNotes.Glyph := frmAllImages.OffBitBtn.Glyph;
  bNotesFlash := (not (bNotesFlash));
end;

procedure TfrmWTMaintSalesInvoice.GetInvoiceTo(tempcust, TempBranch: integer);
begin
  with SalesInvoice.Datamodule.qryCustInvTo do
    begin
      close;
      parambyname('Customer').asinteger := TempCust;
      open;
      first;

      memInvToCustomer.text := '';
      SalesInvoice.AccountCode := fieldbyname('Account_code').asstring;
      edtAccountCode.text := fieldbyname('Account_code').asstring;
    end;
end;

procedure TfrmWTMaintSalesInvoice.dblkpRepClick(Sender: TObject);
begin
  SalesInvoice.Rep := dblkpRep.keyvalue;
  checkok(self);
end;

procedure TfrmWTMaintSalesInvoice.dblkpOperatorClick(Sender: TObject);
begin
  SalesInvoice.AccountManager := dblkpOperator.keyvalue;
end;

procedure TfrmWTMaintSalesInvoice.mnDeleteLineClick(Sender: TObject);
begin
  if SalesInvoice.Lines.count = 1 then
    begin
      MessageDlg('Cannot delete this line, there must be at least one line on an invoice/credit note.', mtInformation,[mbOk], 0);
      exit;
    end
  else
    CallMaintScreen(silDelete);
end;

procedure TfrmWTMaintSalesInvoice.mnDeleteChgClick(Sender: TObject);
begin
  CallMaintChgsScreen(sicDelete);
end;

procedure TfrmWTMaintSalesInvoice.edtInvoiceDateExit(Sender: TObject);
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

  if padatestr(edtInvoiceDate.text) < dLastPEDate then
    begin
      messagedlg('The date entered is for a closed period, enter a date later than '+ padatestr(dLastPEDate), mterror, [mbOK], 0);
      edtInvoiceDate.SetFocus;
      Exit;
    end;

  edtInvoiceDate.Text := PaDatestr(NewDate);
end;

procedure TfrmWTMaintSalesInvoice.mnAddfromJobBagClick(Sender: TObject);
begin
  CallJBSelectScreen;
end;

procedure TfrmWTMaintSalesInvoice.CallJBSelectScreen;
begin
end;

procedure TfrmWTMaintSalesInvoice.SetComponentColours;
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

procedure TfrmWTMaintSalesInvoice.IntFlashTimerTimer(Sender: TObject);
begin
  if bIntNotesFlash then
    btnInternalNotes.Glyph := frmAllImages.OnBitBtn.Glyph
  else
    btnInternalNotes.Glyph := frmAllImages.OffBitBtn.Glyph;
  bIntNotesFlash := (not (bIntNotesFlash));
end;

procedure TfrmWTMaintSalesInvoice.btnInternalNotesClick(Sender: TObject);
var
  frmWTDBInvMemo: TfrmWTDBMemo;
begin
  frmWTDBInvMemo := TfrmWTDBMemo.create(self);
  try
    if Mode = siView then
      frmWTDBInvMemo.bAllow_Upd := false
    else
      frmWTDBInvMemo.bAllow_Upd := true;

    frmWTDBInvMemo.Datamemo.text := SalesInvoice.IntNarrativeText;
    frmWTDBInvMemo.ShowModal;
    SalesInvoice.IntNarrativetext := frmWTDBInvMemo.Datamemo.text;
  finally
    frmWTDBInvMemo.free;
  end;
  checknotes(Self);
end;

procedure TfrmWTMaintSalesInvoice.mnNotPrintedClick(Sender: TObject);
var
  inx: integer;
  SalesInvoiceLine: TSalesInvoiceLine;
begin
  inx := strtoint(sgLines.cells[0,sgLines.row]);
  inx := SalesInvoice.Lines.IndexOf(inx);
  SalesInvoiceLine := SalesInvoice.Lines[inx];
  if mnNotPrinted.checked then
    SalesInvoiceLine.NotPrinted := 'N'
  else
    SalesInvoiceLine.NotPrinted := 'Y';

  ShowLineDetails;
end;

procedure TfrmWTMaintSalesInvoice.edtDescriptionChange(Sender: TObject);
begin
  SalesInvoice.InvoiceDescription := edtDescription.Text;

end;

procedure TfrmWTMaintSalesInvoice.SetRetailCustomer(const Value: bytebool);
begin
  FRetailCustomer := Value;
end;

procedure TfrmWTMaintSalesInvoice.Add1Click(Sender: TObject);
begin
  CallMaintScreen(silAdd);
end;

procedure TfrmWTMaintSalesInvoice.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintSalesInvoice.memDepositChange(Sender: TObject);
begin
  try
    SalesInvoice.DepositAmount := StrToFloatDef((Sender as TMemo).text, 0, FormatSettings);
  except
    SalesInvoice.DepositAmount := 0;
  end;
  ShowTotals;
end;

procedure TfrmWTMaintSalesInvoice.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TfrmWTMaintSalesInvoice.ValidateMoney(Sender: TObject);
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
end;

procedure TfrmWTMaintSalesInvoice.dblkpPaymentTermsClick(Sender: TObject);
begin
  SalesInvoice.PaymentTerms := dblkpPaymentTerms.keyvalue;
end;

procedure TfrmWTMaintSalesInvoice.btnPaymentTermsClick(Sender: TObject);
begin
  frmWTLUPaymentTerms := TfrmWTLUPaymentTerms.create(self);
  try
    frmWTLUPaymentTerms.showmodal;
  finally
    frmWTLUPaymentTerms.free;
  end;

  SalesInvoice.DataModule.qryPaymentTerms.close;
  SalesInvoice.DataModule.qryPaymentTerms.open;

end;

procedure TfrmWTMaintSalesInvoice.dblkpRevenueCentreClick(Sender: TObject);
begin
  SalesInvoice.RevenueCentre := dblkpRevenueCentre.keyvalue;
end;

procedure TfrmWTMaintSalesInvoice.SpeedButton2Click(Sender: TObject);
begin
  dblkpRevenueCentre.KeyValue := 0;
  SalesInvoice.RevenueCentre := 0;
end;

procedure TfrmWTMaintSalesInvoice.btnCustomerBranchClick(Sender: TObject);
begin
  frmWTLUCustomerSite := TfrmWTLUCustomerSite.create(self);
  try
    frmWTLUCustomerSite.Customer := SalesInvoice.Customer;
    frmWTLUCustomerSite.isLookup := true;
    frmWTLUCustomerSite.showmodal;
    if frmWTLUCustomerSite.selected then
      begin
        edtSiteName.Text := frmWTLUCustomerSite.SelectedName;
        SalesInvoice.CustomerBranch := frmWTLUCustomerSite.SelectedCode;
      end;
  finally
    frmWTLUCustomerSite.free;
  end;

end;

procedure TfrmWTMaintSalesInvoice.btnClearCustomerBranchClick(Sender: TObject);
begin
  edtSiteName.Text := '';
  SalesInvoice.CustomerBranch := 0;
end;

end.
