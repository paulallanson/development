unit WTMaintPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons, DBCtrls, ExtCtrls, Menus,
  wtPurchasesDM, FireDAC.Stan.Param;

type
  TfrmWTMaintPurchaseOrder = class(TForm)
    pnlTop: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    edtNumber: TEdit;
    dblkpOperator: TDBLookupComboBox;
    stsbrDetails: TStatusBar;
    pnlBottom: TPanel;
    lblDeleteprompt: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxonHold: TCheckBox;
    chkbxInactive: TCheckBox;
    pnlHeader: TPanel;
    Label7: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label28: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label20: TLabel;
    btnSupplier: TBitBtn;
    edtReference: TEdit;
    btnContact: TBitBtn;
    edtContact: TEdit;
    edtDescription: TMemo;
    pcDetails: TPageControl;
    tbDetails: TTabSheet;
    dbgLines: TStringGrid;
    tbEvents: TTabSheet;
    Panel3: TPanel;
    sgEvents: TStringGrid;
    Panel18: TPanel;
    btnAddEvents: TBitBtn;
    btnChangeEvents: TBitBtn;
    btnDeleteEvents: TBitBtn;
    Panel8: TPanel;
    memEventNotes: TMemo;
    Label24: TLabel;
    edtSupplierName: TEdit;
    edtStreet: TEdit;
    edtLocale: TEdit;
    edtTown: TEdit;
    edtPostcode: TEdit;
    edtCounty: TEdit;
    pmnLines: TPopupMenu;
    mnAddLine: TMenuItem;
    mnChangeLine: TMenuItem;
    mnDeleteLine: TMenuItem;
    pnlFooter: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    memGoods: TMemo;
    memVAT: TMemo;
    memTotal: TMemo;
    pmnDummy: TPopupMenu;
    Label3: TLabel;
    edtDateRequired: TEdit;
    btnDateRequired: TBitBtn;
    dtpckDate: TDateTimePicker;
    pnlFooterLeft: TPanel;
    rdgrpDelivery: TRadioGroup;
    pnlFooterAddress: TPanel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    edtdelPostcode: TEdit;
    Label14: TLabel;
    edtDelCounty: TEdit;
    edtDelName: TEdit;
    edtDelStreet: TEdit;
    edtDelLocale: TEdit;
    edtDelTown: TEdit;
    BitBtn1: TBitBtn;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    memNotes: TMemo;
    pnlFunctions: TPanel;
    btnAdd: TBitBtn;
    btnChange: TBitBtn;
    btnDelete: TBitBtn;
    btnProducts: TBitBtn;
    Products1: TMenuItem;
    btnInsert: TBitBtn;
    pnlBody: TPanel;
    procedure CheckOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure mnChangeLineClick(Sender: TObject);
    procedure btnSupplierClick(Sender: TObject);
    procedure mnAddLineClick(Sender: TObject);
    procedure pmnLinesPopup(Sender: TObject);
    procedure btnContactClick(Sender: TObject);
    procedure edtReferenceChange(Sender: TObject);
    procedure dbgLinesDblClick(Sender: TObject);
    procedure mnDeleteLineClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtDescriptionChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDateRequiredExit(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
    procedure rdgrpDeliveryClick(Sender: TObject);
    procedure memNotesChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnProductsClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure sgEventsClick(Sender: TObject);
    procedure sgEventsDblClick(Sender: TObject);
    procedure btnAddEventsClick(Sender: TObject);
    procedure btnChangeEventsClick(Sender: TObject);
    procedure btnDeleteEventsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FActivated : Boolean;
    FMode: TpopMode;
    FPOrder: TPOrder;
    procedure BuildEventGrid;
    procedure BuildLineGrid;
    procedure CallMaintEvent(aMode: TpoevMode);
    procedure CallMaintScreen(aMode: TpolMode);
    procedure CallMaintScreenProducts(aMode: TpolMode);
    procedure CheckNotes(Sender: TObject);
    procedure CheckContacts(tempCode: integer);
    procedure ClearGrid(TempGrid: TStringGrid);
    procedure SetMode(const Value: TpopMode);
    procedure SetPOrder(const Value: TPOrder);
    procedure ShowDetails;
    procedure ShowEvents;
    procedure ShowTotals;
    procedure ShowLineDetails;
    procedure ClearAddressFields;
    procedure SetAddressFields(tempCode: integer);
    procedure SetGridHeaders;
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure SetDeliveryAddressFields(tempCode: integer);
    procedure ClearDeliveryAddressFields;
    procedure SetReference;
    procedure CheckEvents(Sender: TObject);
  public
    bOK: boolean;
    property POrder: TPOrder read FPOrder write SetPOrder;
    property Mode: TpopMode read FMode write SetMode;
  end;

var
  frmWTMaintPurchaseOrder: TfrmWTMaintPurchaseOrder;

implementation

uses
  wtMain, AllCommon, WTSrchSupplier, WTLUSupplierContacts, WTMaintPurchaseOrderLine, DateSelV5,
  wtDataModule, WTMaintPurchaseOrderLineProd, WTLUPOrderSalesOrderLine, WTMaintPOEvents, System.UITypes;

{$R *.dfm}

{ TfrmWTMaintPurchaseOrder }

procedure TfrmWTMaintPurchaseOrder.SetMode(const Value: TpopMode);
begin
  FMode := Value;
end;

procedure TfrmWTMaintPurchaseOrder.SetPOrder(const Value: TPOrder);
begin
  FPOrder := Value;
end;

procedure TfrmWTMaintPurchaseOrder.ShowDetails;
var
  Year, Month, Day, DOW: Word;
  InstallAddress: TStringList;
  icount: integer;
  tmpDate: TDateTime;
begin
  if Mode = popAdd then
    begin
      edtNumber.text := '<New Order>';
      dtpckDate.Date := date;
      edtDateRequired.text := '';

      dblkpOperator.KeyValue := frmWtMain.Operator;
      edtDescription.Text := '';
      edtSupplierName.text := '';
      edtReference.text := '';
      edtContact.text := '';

      memNotes.Clear;
      rdgrpDelivery.itemindex := 0;
    end
  else
    begin
      if POrder.dbKey = 0 then
        begin
          edtNumber.text := '<New Order>';
          dtpckDate.Date := date;
          edtDateRequired.text := '';

          POrder.Operator := frmWTMain.Operator;
          POrder.OperatorName := frmWTMain.OperatorName;
        end
      else
        begin
          edtNumber.text := inttostr(POrder.dbKey);
          dtpckDate.Date := POrder.PODate;
          edtDateRequired.text := paDateStr(POrder.DateRequired);
        end;

      {Check for delivery address details}
      rdgrpDelivery.itemindex := 0;
      if POrder.DeliveryAddress <> 0 then
        begin
          rdgrpDelivery.itemindex := 1;
          pnlFooterAddress.Visible := true;

          SetDeliveryAddressFields(POrder.DeliveryAddress);
        end;

      edtSupplierName.text := POrder.SupplierName;

      edtContact.text := POrder.ContactName;

      memNotes.Text := POrder.Notes;
      
      if POrder.AccountManager = 0 then
        dblkpOperator.KeyValue :=  frmWTMain.Operator
      else
        dblkpOperator.KeyValue :=  POrder.AccountManager;

      chkbxOnHold.Checked := POrder.OnHold;
      chkbxinactive.Checked := (POrder.inactive = 'Y');

      edtDescription.Text := POrder.Description;

      edtReference.Text := POrder.Reference;

      SetAddressFields(POrder.Supplier);
      stsbrDetails.Panels[0].Text := 'Created by: ' + POrder.OperatorName;
    end;

  pnlTop.enabled := not(Mode = popView) and not(Mode = popDelete);
  pnlHeader.enabled := not(Mode = popView) and not(Mode = popDelete);
  btnOK.Visible := not(Mode = popView);
  pnlFunctions.enabled := not(Mode = popView);
  pnlFooter.enabled := not(Mode = popView);
  lbldeleteprompt.visible := (Mode = popDelete);
  if (Mode = popView) or (Mode = popDelete) then
    begin
      dbgLines.popupMenu := pmnDummy;
    end;
end;

procedure TfrmWTMaintPurchaseOrder.ShowLineDetails;
begin
  if (Mode = popAdd) then
    begin
      ClearGrid(dbgLines);  {Clear contents of Line grid}
      BuildLineGrid;
    end
  else
    begin
      BuildLineGrid;
    end;
end;

procedure TfrmWTMaintPurchaseOrder.ClearGrid(TempGrid: TStringGrid);
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

procedure TfrmWTMaintPurchaseOrder.BuildLineGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with dbgLines, POrder.datamodule do
    begin
      for i := 0 to pred(POrder.Lines.count) do
        begin
        cells[0,i+1] := inttostr(POrder.Lines[i].POLNumber);
        cells[1,i+1] := POrder.Lines[i].Description;
        cells[2,i+1] := POrder.Lines[i].SupplierStockCode;
        cells[3,i+1] := inttostr(POrder.Lines[i].SlabLength) + 'mm x ' + inttostr(POrder.Lines[i].SlabDepth) + 'mm ' + POrder.Lines[i].SlabDescription;
        cells[4,i+1] := floattostr(POrder.Lines[i].Quantity);
        cells[5,i+1] := inttostr(POrder.Lines[i].CostUnit);
        cells[6,i+1] := formatfloat('0.00',POrder.Lines[i].UnitCost);
        cells[7,i+1] := formatfloat('0.00',POrder.Lines[i].DiscountPercentage);
        cells[8,i+1] := formatfloat('0.00',POrder.Lines[i].TotalCost);
        cells[9,i+1] := floattostr(POrder.Lines[i].SalesOrder);
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
    
  btnChange.enabled := not (POrder.Lines.count = 0);
  btnDelete.enabled := not (POrder.Lines.count = 0);
end;

procedure TfrmWTMaintPurchaseOrder.ShowTotals;
var
  rDeposit: real;
begin
  memGoods.text := FloatToStrF(POrder.TotalCost, ffCurrency, 15, 2);
  memVAT.text := FloatToStrF(POrder.TotalVAT, ffCurrency, 15, 2);
  memTotal.text := FloatToStrF((POrder.TotalCost+POrder.TotalVAT), ffCurrency, 15, 2);
end;

procedure TfrmWTMaintPurchaseOrder.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (dblkpOperator.keyvalue <> null) and
                    (edtSupplierName.Text <> '') and
                    (edtContact.Text <> '') and
                    (edtDateRequired.Text <> '') and
                    (edtDescription.Text <> '') and
                    (edtReference.Text <> '');
end;

procedure TfrmWTMaintPurchaseOrder.btnOKClick(Sender: TObject);
var
  iCount: integer;
begin
  if Mode = popDelete then
    if MessageDlg('Are you sure you want to delete this purchase order?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      exit;


  POrder.PODate := dtpckDate.date;
  POrder.DateRequired := paDateStr(edtDateRequired.text);
  POrder.AccountManager := dblkpOperator.KeyValue;
  POrder.Operator := frmWTMain.Operator;
  POrder.OnHold := chkbxOnHold.checked;
  POrder.Notes := memNotes.Text;

  if chkbxInactive.checked then
    POrder.inactive := 'Y'
  else
    POrder.inactive := 'N';

//  POrder.ExtraNotes := UpdateNotes;

  if (Mode = popCopy) then
    begin
      POrder.Status := 10;
    end;

  if (Mode = popAdd) or (Mode = popChange) or (Mode = popCopy) or (Mode = popRaise) then
    begin
      POrder.SupplierName := edtSupplierName.Text;

      POrder.OrderMode := Mode;
      POrder.SaveToDB(true);

      if (Mode = popAdd) or (Mode = popCopy) or (Mode = popRaise) then
        begin
          messagedlg('Purchase Order number '+ floattostr(POrder.dbKey)+ ' created', mtInformation, [mbOk], 0);
        end;
    end
  else
  if (Mode = popDelete) then
    begin
      if POrder.dbkey = 0 then
        begin
          POrder.Inactive := 'Y';
          POrder.DeleteFromDB;
        end
      else
        begin
          POrder.Inactive := 'Y';
          POrder.DeleteFromDB;
        end;
    end;
    
  bOK := true;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintPurchaseOrder.mnChangeLineClick(Sender: TObject);
begin
  CallMaintScreen(polChange);
end;

procedure TfrmWTMaintPurchaseOrder.CallMaintScreen(aMode : TpolMode);
var
  iCol, iRow: integer;
  inx : integer;
  POLine : TPOLIne;
  frm: TfrmWTMaintPurchaseOrderLine;
begin
  icol := dbgLines.col;
  irow := dbgLines.row;
  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintPurchaseOrderLine.Create(Self);
    try
      if aMode = polAdd then
        POLine := TPOLine.Create(POrder)
      else
      begin
        inx := POrder.Lines.IndexOf(inx);
        POLine := POrder.Lines[inx];
      end;
      Frm.POLine := POLine;
      Frm.Mode := aMode;
      if POLine.QtyInvoiced > 0 then
        begin
          if MessageDlg('This line has been delivered and cannot be changed or deleted, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit
          else
            Frm.Mode := polView;
        end;
      Frm.ShowModal;
      if (aMode = polAdd) and (Frm.ModalResult <> mrOK) then
        POLine.Free;
    finally
      Frm.Free;
    end;

  finally
    ShowLineDetails;
    ShowTotals;
    checkok(self);
  end;
end;

procedure TfrmWTMaintPurchaseOrder.CallMaintScreenProducts(aMode : TpolMode);
var
  iCol, iRow: integer;
  inx : integer;
  POLine : TPOLIne;
  frm: TfrmWTMaintPurchaseOrderLineProd;
begin
  icol := dbgLines.col;
  irow := dbgLines.row;
  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1;
  end;

  try
    frm := TfrmWTMaintPurchaseOrderLineProd.Create(Self);
    try
      if aMode = polAdd then
        POLine := TPOLine.Create(POrder)
      else
      begin
        inx := POrder.Lines.IndexOf(inx);
        POLine := POrder.Lines[inx];
      end;
      Frm.POLine := POLine;
      Frm.Mode := aMode;
      if POLine.QtyInvoiced > 0 then
        begin
          if MessageDlg('This line has been delivered and cannot be changed or deleted, continue?',
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
            exit
          else
            Frm.Mode := polView;
        end;
      Frm.ShowModal;
      if (aMode = polAdd) and (Frm.ModalResult <> mrOK) then
        POLine.Free;
    finally
      Frm.Free;
    end;

  finally
    ShowLineDetails;
    ShowTotals;
    checkok(self);
  end;
end;

procedure TfrmWTMaintPurchaseOrder.btnSupplierClick(Sender: TObject);
begin
  frmwtSrchSupplier := TfrmwtSrchSupplier.create(self);
  try
    frmwtSrchSupplier.CodeSelected := POrder.Supplier;
    frmwtSrchSupplier.showmodal;
    if frmwtSrchSupplier.modalresult = idOK then
      begin
        POrder.Supplier := frmwtSrchSupplier.CodeSelected;
        POrder.SupplierName := frmwtSrchSupplier.NameSelected;
        edtSupplierName.text := frmwtSrchSupplier.NameSelected;

        SetAddressFields(POrder.Supplier);
        CheckContacts(POrder.Supplier);
//        ShowTotals;
      end
  finally
    frmwtSrchSupplier.free;
    CheckOK(self);
  end;
end;

procedure TfrmWTMaintPurchaseOrder.ClearAddressFields;
begin
  edtStreet.Clear;
  edtLocale.Clear;
  edtTown.Clear;
  edtPostcode.Clear;
  edtCounty.Clear;
end;

procedure TfrmWTMaintPurchaseOrder.ClearDeliveryAddressFields;
begin
  edtDelName.Clear;
  edtDelStreet.Clear;
  edtDelLocale.Clear;
  edtDelTown.Clear;
  edtDelPostcode.Clear;
  edtDelCounty.Clear;
end;

procedure TfrmWTMaintPurchaseOrder.SetAddressFields(tempCode: integer);
begin
  ClearAddressFields;

  edtStreet.text := POrder.dataModule.GetSupplierStreet(POrder.Supplier);
  edtLocale.text := POrder.dataModule.GetSupplierLocale(POrder.Supplier);
  edtTown.text := POrder.dataModule.GetSupplierTown(POrder.Supplier);
  edtPostcode.text := POrder.dataModule.GetSupplierPostcode(POrder.Supplier);
  edtCounty.text := POrder.dataModule.GetSupplierCounty(POrder.Supplier);
end;

procedure TfrmWTMaintPurchaseOrder.SetDeliveryAddressFields(tempCode: integer);
begin
  ClearDeliveryAddressFields;

  edtDelName.text := dtmdlWorktops.GetAddressName(tempCode);
  edtDelStreet.text := dtmdlWorktops.GetAddressStreet(tempCode);
  edtDelLocale.text := dtmdlWorktops.GetAddressLocale(tempCode);
  edtDelTown.text := dtmdlWorktops.GetAddressTown(tempCode);
  edtDelPostcode.text := dtmdlWorktops.GetAddressPostcode(tempCode);
  edtDelCounty.text := dtmdlWorktops.GetAddressCounty(tempCode);
end;

procedure TfrmWTMaintPurchaseOrder.mnAddLineClick(Sender: TObject);
begin
  CallMaintScreen(polAdd);
end;

procedure TfrmWTMaintPurchaseOrder.pmnLinesPopup(Sender: TObject);
var
  inx: integer;
  POLine: TPOLine;
begin
  if (POrder.Lines.count > 0) then
    begin
      inx := dbgLines.row;
      inx := strtoint(dbgLines.Cells[0,inx]);
      inx := POrder.Lines.IndexOf(inx);
      POLine := POrder.Lines[inx];

      mnChangeLine.enabled := (POrder.Lines.count > 0);
      mnDeleteLine.enabled := (POrder.Lines.count > 0) and (POLine.QtyInvoiced <= 0);
    end
  else
    begin
      mnChangeLine.enabled := (POrder.Lines.count > 0);
      mnDeleteLine.enabled := (POrder.Lines.count > 0);
    end;
end;

procedure TfrmWTMaintPurchaseOrder.btnContactClick(Sender: TObject);
begin
  frmWTLUSupplierContacts := TfrmWTLUSupplierContacts.create(self);
  try
    frmWTLUSupplierContacts.Supplier := POrder.Supplier;
    frmWTLUSupplierContacts.isLookup := true;
    frmWTLUSupplierContacts.showmodal;
    if frmWTLUSupplierContacts.modalresult = idOK then
      begin
        edtContact.Text := frmWTLUSupplierContacts.ContactName;
        POrder.ContactNo := frmWTLUSupplierContacts.ContactNo;
      end
  finally
    frmWTLUSupplierContacts.free;
    CheckOK(self);
  end;
end;

procedure TfrmWTMaintPurchaseOrder.edtReferenceChange(Sender: TObject);
begin
   POrder.Reference := edtReference.text;
   CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrder.dbgLinesDblClick(Sender: TObject);
begin
  if dbgLines.Cells[0,dbgLines.Row] <> '' then
    begin
      btnChangeClick(self);
    end;
end;

procedure TfrmWTMaintPurchaseOrder.mnDeleteLineClick(Sender: TObject);
begin
  if POrder.Lines.count = 1 then
    begin
      MessageDlg('You cannot delete the last line of an order', mtInformation,
        [mbOk], 0);
      exit;
    end;

  CallMaintScreen(polDelete);
end;

procedure TfrmWTMaintPurchaseOrder.FormDestroy(Sender: TObject);
begin
  AllCommon.SaveFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintPurchaseOrder.edtDescriptionChange(Sender: TObject);
begin
  POrder.Description := edtDescription.text;
  CheckOK(self);
end;

procedure TfrmWTMaintPurchaseOrder.CheckNotes(Sender: TObject);
begin
end;

procedure TfrmWTMaintPurchaseOrder.CheckEvents(Sender: TObject);
begin
  if POrder.Events.Count > 0 then
    messagedlg('Event details have been added to this purchase order.', mtInformation,[mbOk], 0);
end;

procedure TfrmWTMaintPurchaseOrder.FormActivate(Sender: TObject);
var
  sTemp: string;
  iLines: integer;
begin
  if not FActivated then
  begin
    with POrder.DataModule do
    begin
      qryOperator.close;
      qryOperator.open;
    end;

    case Mode of
    popAdd     : Caption := 'Add a Purchase Order';
    popChange  : Caption := 'Change a Purchase Order';
    popDelete  : Caption := 'Delete a Purchase Order';
    popCopy   : Caption := 'Copy a Purchase Order';
    end;  { case }
    if (Mode = popAdd)  or (Mode = popCopy) then
      sTemp := ' New Purchase Order '
    else
      sTemp := ' Purchase Order ' + IntToStr(POrder.DbKey) + ' ';

    if Mode = popCopy then
      begin
        POrder.DbKey := 0;
        for ilines := 0 to pred(POrder.lines.count) do
          begin
            POrder.Lines[iLines].QtyDelivered := 0;
            POrder.Lines[iLines].QtyInvoiced := 0;
          end;
      end;

    ShowDetails;
    ShowLineDetails;
    ShowEvents;

(*    if (Mode = popConvert) and (POrder.DataModule.QuoteNo <> 0) then
      ShowQuoteDocuments
    else
      ShowDocuments;
*)
    ShowTotals;
    {Had to put this in because the components where losing the Listdatasource}
    dblkpOperator.ListSource := POrder.DataModule.dtsOperator;

    Checknotes(Self);
    CheckOK(Self);

    CheckEvents(self);

    FActivated := true;
  end;
end;

procedure TfrmWTMaintPurchaseOrder.FormCreate(Sender: TObject);
begin
  bOK := false;
  SetGridHeaders;

  pcDetails.ActivePage := tbDetails;
  AllCommon.LoadFormLayout(TfrmWTMain.AppIniFile, self);
end;

procedure TfrmWTMaintPurchaseOrder.SetGridHeaders;
begin
  {Purchase Order header}
  dbgLines.cells[0,0] := 'Line';
  dbgLines.cells[1,0] := 'Description';
  dbgLines.cells[2,0] := 'Part Code';
  dbgLines.cells[3,0] := 'Slab Size (mm)';
  dbgLines.cells[4,0] := 'Quantity';
  dbgLines.cells[5,0] := 'Cost Unit';
  dbgLines.cells[6,0] := 'Unit Cost';
  dbgLines.cells[7,0] := 'Discount %';
  dbgLines.cells[8,0] := 'Total Cost';
  dbgLines.cells[9,0] := 'Sales Order';

  {Event header}
  sgEvents.cells[0,0] := 'No';
  sgEvents.cells[1,0] := 'Date/Time';
  sgEvents.cells[2,0] := 'Operator';

end;
procedure TfrmWTMaintPurchaseOrder.edtDateRequiredExit(Sender: TObject);
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

procedure TfrmWTMaintPurchaseOrder.btnDateRequiredClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateRequired.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateRequired.text;

  edtDateRequired.text := paDatestr(InputDate(paDateStr(tempdate)));
  CheckOK(self);
end;

function TfrmWTMaintPurchaseOrder.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTMaintPurchaseOrder.CheckContacts(tempCode: integer);
begin
  with POrder.DataModule.qryGetContacts do
    begin
      close;
      parambyname('Supplier').asinteger := tempCode;
      open;

      if recordcount = 1 then
        begin
          POrder.ContactNo := fieldbyname('Contact_no').asinteger;
          POrder.ContactName := fieldbyname('Contact_name').asstring;
          edtContact.Text := POrder.ContactName;
        end;
    end;
end;

procedure TfrmWTMaintPurchaseOrder.rdgrpDeliveryClick(Sender: TObject);
begin
  pnlFooterAddress.Visible := ((Sender as TRadioGroup).itemindex <> 0);
end;

procedure TfrmWTMaintPurchaseOrder.memNotesChange(Sender: TObject);
begin
  POrder.Notes := (Sender as TMemo).text;
end;

procedure TfrmWTMaintPurchaseOrder.btnAddClick(Sender: TObject);
begin
  POrder.DateRequired := paDateStr(edtDateRequired.text);
  CallMaintScreen(polAdd);
end;

procedure TfrmWTMaintPurchaseOrder.btnChangeClick(Sender: TObject);
var
  iCol, iRow, inx: integer;
  POLine: TPOLine;
begin
  icol := dbgLines.col;
  irow := dbgLines.row;
  try
    inx := strtoint(dbgLines.cells[0, iRow]);
  except
    inx := 1;
  end;

  inx := POrder.Lines.IndexOf(inx);
  POLine := POrder.Lines[inx];

  if POLine.SupplierStockCode <> '' then
    CallMaintScreenProducts(polChange)
  else
    CallMaintScreen(polChange);
end;

procedure TfrmWTMaintPurchaseOrder.btnDeleteClick(Sender: TObject);
begin
  if POrder.Lines.count = 1 then
    begin
      MessageDlg('You cannot delete the last line of an order', mtInformation,
        [mbOk], 0);
      exit;
    end;

  CallMaintScreen(polDelete);
end;

procedure TfrmWTMaintPurchaseOrder.btnProductsClick(Sender: TObject);
begin
  CallMaintScreenProducts(polAdd);
end;

procedure TfrmWTMaintPurchaseOrder.btnInsertClick(Sender: TObject);
begin
  POrder.DateRequired := paDateStr(edtDateRequired.text);
  frmWTLUPOrderSalesOrderLine := TfrmWTLUPOrderSalesOrderLine.create(self);
  try
    frmWTLUPOrderSalesOrderLine.POrder := POrder;
    frmWTLUPOrderSalesOrderLine.Mode := polAdd;
    frmWTLUPOrderSalesOrderLine.Supplier := POrder.Supplier;
    frmWTLUPOrderSalesOrderLine.edtsupplier.text := POrder.SupplierName;
    frmWTLUPOrderSalesOrderLine.DateRequired := POrder.DateRequired;
    frmWTLUPOrderSalesOrderLine.showmodal;

    if frmWTLUPOrderSalesOrderLine.ModalResult = mrOK then
      begin
        SetReference;
        ShowLineDetails;
        ShowTotals;
        checkok(self);
      end;
  finally
    frmWTLUPOrderSalesOrderLine.free;
  end;
end;

procedure TfrmWTMaintPurchaseOrder.SetReference;
var
  iCount: integer;
begin
  for icount := 0 to pred(POrder.Lines.count) do
    begin
      if pos(floattostr(POrder.lines[icount].salesOrder), edtReference.Text) > 0 then
        continue;
      if trim(edtReference.Text) = '' then
        edtReference.Text := floattostr(POrder.lines[icount].salesOrder)
      else
        edtReference.Text := edtReference.Text + ', ' + floattostr(POrder.lines[icount].salesOrder)
    end;
end;

procedure TfrmWTMaintPurchaseOrder.ShowEvents;
begin
  ClearGrid(sgEvents);  {Clear contents of Line grid}
  BuildEventGrid;
  sgEventsClick(self);
end;

procedure TfrmWTMaintPurchaseOrder.BuildEventGrid;
var
  i, icount: integer;
begin
  icount := 0;
  with sgEvents, POrder.datamodule do
    begin
      for i := 0 to pred(POrder.Events.count) do
        begin
        cells[0,i+1] := inttostr(POrder.Events[i].EventNumber);
        cells[1,i+1] := paDateStr(POrder.Events[i].DateEntered);
        cells[2,i+1] := POrder.Events[i].OperatorName;
        icount := icount + 1;
        end;
      if icount = 0 then
        rowcount := 2
      else
        rowcount := icount + 1;
    end;
  btnChangeEvents.enabled := not (POrder.Events.count = 0);
  btnDeleteEvents.enabled := not (POrder.Events.count = 0);
end;

procedure TfrmWTMaintPurchaseOrder.sgEventsClick(Sender: TObject);
var
  POEvent: TPOEvent;
  inx: integer;
begin
  inx := sgEvents.row;
  inx := POrder.Events.IndexOf(inx);
  if inx >= 0 then
  begin
    POEvent := POrder.Events[inx];
    memEventNotes.Text := POEvent.Narrative.DataInfo;
  end else
    memEventNotes.Lines.Clear;
end;

procedure TfrmWTMaintPurchaseOrder.sgEventsDblClick(Sender: TObject);
begin
  btnChangeEventsClick(self);
end;

procedure TfrmWTMaintPurchaseOrder.btnAddEventsClick(Sender: TObject);
begin
  CallMaintEvent(poevAdd);
end;

procedure TfrmWTMaintPurchaseOrder.btnChangeEventsClick(Sender: TObject);
begin
  CallMaintEvent(poevChange);
end;

procedure TfrmWTMaintPurchaseOrder.btnDeleteEventsClick(Sender: TObject);
begin
  CallMaintEvent(poevDelete);
end;

procedure TfrmWTMaintPurchaseOrder.CallMaintEvent(aMode : TpoevMode);
var
  inx : integer;
  POEvent : TPOEvent;
  frm: TfrmWTMaintPOEvents;
begin
//  inx := sgEvents.row;
  inx := StrToIntDef(sgEvents.cells[0,sgEvents.row], 1);

  try
    frm := TfrmWTMaintPOEvents.Create(Self);
    try
      if aMode = poevAdd then
        POEvent := TPOEvent.create(POrder)
      else
      begin
        inx := POrder.Events.IndexOf(inx);
        POEvent := POrder.Events[inx];
      end;
      Frm.POEvent := POEvent;
      Frm.Mode := aMode;
      Frm.OperatorName := frmWTMain.OperatorName;
      Frm.Operator := frmWTMain.Operator;
      Frm.ShowModal;
      if (aMode = poevAdd) and (Frm.ModalResult <> mrOK) then
        POEvent.Free;
      if Frm.ModalResult = mrOK then
        begin
          ShowEvents;
        end;
    finally
      Frm.Free;
    end;
  finally
    if aMode = poevAdd then
      begin
        inx := pred(POrder.Events.count);
        if inx < 0 then inx := 0;
      end
    else
    if aMode = poevDelete then
      begin
        inx := inx-1;
        if inx < 0 then inx := 0;
      end;
    sgEvents.row := inx+1;
  end;
end;

procedure TfrmWTMaintPurchaseOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if bOK then exit;

  if not(btnOK.enabled) then exit;

  if Mode = popView then exit;

  TempWord := MessageDlg('Do you want to save these order details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    btnOKClick(self);
end;

end.
