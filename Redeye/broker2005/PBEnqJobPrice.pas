unit PBEnqJobPrice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, DBCtrls, DBGrids, Grids, Buttons, ExtCtrls, Menus,
  Mask, ComCtrls, printers,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqJobPriceFrm = class(TForm)
    EnquiryLineListBox: TListBox;
    SuppQtySQL: TFDQuery;
    EnqQtySQL: TFDQuery;
    SelectPopUpMenu: TPopupMenu;
    mnuSelectThis1: TMenuItem;
    UpEnqQtySQL: TFDQuery;
    EnqHeadSQL: TFDQuery;
    UpEnqLineSQL: TFDQuery;
    UpEnqHeadSQL: TFDQuery;
    UpSuppEnqQtySQL: TFDQuery;
    PUnitSQL: TFDQuery;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    AddCostsSpeedBtn: TSpeedButton;
    SupplierEdit: TEdit;
    BranchEdit: TEdit;
    SupplierMemo: TMemo;
    AddCostsMemo: TMemo;
    mnuSelectAll: TMenuItem;
    Panel1: TPanel;
    SaveBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    EnquiryEdit: TEdit;
    CustNameEdit: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    EnquiryLineGrid: TStringGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    Panel7: TPanel;
    SupplierPricesGrid: TStringGrid;
    Panel9: TPanel;
    GroupBox2: TGroupBox;
    PUnitCombo: TComboBox;
    Panel8: TPanel;
    Panel10: TPanel;
    SelectedPricesGrid: TStringGrid;
    PrintBitBtn: TBitBtn;
    Label6: TLabel;
    JobUnitcombo: TComboBox;
    grpBxSupplierRunOn: TGroupBox;
    grpBxSelectedRunOn: TGroupBox;
    Panel11: TPanel;
    SupplierROPricesGrid: TStringGrid;
    Panel12: TPanel;
    SelectedROPricesGrid: TStringGrid;
    PricesPopUp: TPopupMenu;
    Applysamemarkup: TMenuItem;
    ApplysamePriceUnit: TMenuItem;
    qrySupplier: TFDQuery;
    Label3: TLabel;
    edtContact: TEdit;
    ResetSuppEnqQtySQL: TFDQuery;
    qryGetPriceUnit: TFDQuery;
    qryPTPriceUnit: TFDQuery;
    qryProdType: TFDQuery;
    procedure EnquiryEditKeyPress(Sender: TObject; var Key: Char);
    procedure EnquiryLineListBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SupplierPricesGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure SupplierPricesGridClick(Sender: TObject);
    procedure SelectedPricesGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure mnuSelectThis1Click(Sender: TObject);
    procedure SupplierPricesGridMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SelectedPricesGridKeyPress(Sender: TObject; var Key: Char);
    procedure SelectedPricesGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectedPricesGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure SaveBitBtnClick(Sender: TObject);
    procedure AddCostsSpeedBtnClick(Sender: TObject);
    procedure SupplierPricesGridTopLeftChanged(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure EnquiryLineGridClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectPopUpMenuPopup(Sender: TObject);
    procedure PUnitComboDropDown(Sender: TObject);
    procedure PUnitComboEnter(Sender: TObject);
    procedure PUnitComboExit(Sender: TObject);
    procedure SelectedPricesGridClick(Sender: TObject);
    procedure PUnitComboChange(Sender: TObject);
    procedure JobUnitcomboDropDown(Sender: TObject);
    procedure JobUnitcomboClick(Sender: TObject);
    procedure mnuSelectAllClick(Sender: TObject);
    procedure SupplierPricesGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure SelectedPricesGridExit(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure SupplierPricesGridDblClick(Sender: TObject);
    procedure ApplysamemarkupClick(Sender: TObject);
    procedure ApplysamePriceUnitClick(Sender: TObject);
    procedure PricesPopUpPopup(Sender: TObject);
    procedure SupplierROPricesGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure SelectedROPricesGridDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure SelectedROPricesGridExit(Sender: TObject);
    procedure SelectedROPricesGridKeyPress(Sender: TObject; var Key: Char);
    procedure SelectedROPricesGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectedROPricesGridSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure SelectedPricesGridTopLeftChanged(Sender: TObject);
    procedure SupplierPricesGridMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SelectedPricesGridMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    FDefaultMarkup: real;
    procedure SetDefaultMarkup(const Value: real);
    function GetProdTypePUnit(tempcode: integer): integer;
    function GetProdTypeDefaultPUnit(tempCode: integer): string;
    procedure PrintForm;
  private
    { Private declarations }
    bPriceUnitInActive: boolean;
    iEnqStatus: integer;
    SameMarkupForAll: boolean;
    SamePriceUnitForAll: boolean;
    procedure ClearScreen;
    procedure Initialise;
    procedure GetEnquiryDetails;
    procedure GetEnquiryHeadDetails;
    procedure GetEnquiryLineDetails;
    procedure CreateSupplierGrid;
    procedure GetEnquiryLineSuppliers;
    procedure GetEnquiryQtys;
    procedure CreateSupplierQtyGrid(irow: Integer);
    procedure GetEnquirySupplierQtys(irow: Integer);
    procedure CreatePricesGrid;
    procedure CalcMarkup(iType: Integer; iNewMarkup: Real; icolumn: Integer);
    procedure CalcROMarkup(iType: Integer; iNewMarkup: Real; icolumn: Integer);
    function ExistingEnquiry(iEnquiry: Integer): boolean;
    //    function ThisOneselected(iScol: Integer; iSrow: Integer;
    //      ivalue: Real; isupplier: Integer; iBranch: Integer): boolean;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure ChangeAllUnits(iNewUnitIndex: Integer);
    procedure CalcSupplierPrices;
    procedure BuildCheapest;
    procedure DisplaySelectedCost(icol: Integer; irow: Integer);
    function GetSupplierPhone(TempSupplier, TempBranch: integer): string;
    property DefaultMarkup: real read FDefaultMarkup write SetDefaultMarkup;
  public
    { Public declarations }
    iEnqNumber, iDataOp, iDataRep: Integer;
    EnqStatus: integer;
  end;

var
  PBEnqJobPriceFrm: TPBEnqJobPriceFrm;
  MyRow, MyCol: Integer;
  iline: Integer;
  JobUnitArray: array[1..100] of Integer;
  CheapestArray: array[1..100, 1..100] of Real;

implementation

uses PBEnqJobDtls, PBEnqSuppDataMod, PBEnqSupTmp, PBEnqAddChg, pbDatabase, CCSPrint,
  pbMainMenu;

var
  SuppGrid, QtyGrid, PriceGrid: TStringGrid;
  iOldUnitIndex: Integer;

const

  PriceUnit =
  'SELECT * '+
  'FROM Price_unit '+
  'WHERE ((Price_unit_Inactive is NULL) or (Price_unit_inactive = ''N'')) '+
  'ORDER BY Description ';


  OrigPriceUnit =
  'SELECT * '+
  'FROM Price_unit '+
  'ORDER BY Description ';
  
{$R *.DFM}

procedure TPBEnqJobPriceFrm.EnquiryEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0; { eat enter key }

    {Check that the enquiry entered is valid}
    if (not ExistingEnquiry(StrToInt(EnquiryEdit.Text))) then
    begin
      MessageDlg('Enquiry number does not exist', mtError, [mbOk], 0);
      Exit;
    end;
    ClearScreen;
    GetEnquiryDetails;
  end;
end;

function TPBEnqJobPriceFrm.ExistingEnquiry(iEnquiry: Integer): boolean;
begin
  with EnqHeadSQL do
  begin
    Close;
    ParamByName('enquiry').AsInteger := iEnquiry;
    Open;

    if RecordCount = 0 then
      Result := False
    else
      Result := True;
  end;
end;

procedure TPBEnqJobPriceFrm.GetEnquiryDetails;
begin
  GetEnquiryHeadDetails;
  GetEnquiryLineDetails;

  {Now select the first line of the enquiry}
  if EnquirylineListBox.Items.Count > 0 then
  begin
    EnquirylineListBox.itemindex := 0;
    EnquiryLineListBoxClick(Self);

    {Enable the Relevant grids}
    SupplierPricesGrid.Enabled := True;
    SelectedPricesGrid.Enabled := True;

    SupplierROPricesGrid.Enabled := True;
    SelectedROPricesGrid.Enabled := True;

    AddCostsSpeedBtn.Enabled := True;
    PBEnqJobDtlsFrm.AddCostsSpeedBtn.Enabled := True;

    SaveBitBtn.Enabled := True;
    CancelBitBtn.Enabled := True;
  end;
end;

procedure TPBEnqJobPriceFrm.GetEnquiryHeadDetails;
begin
  {Retrieve the Header details and display}
  PBEnqSuppDataModFrm.EnqHeadSQL.Close;
  PBEnqSuppDataModFrm.EnqHeadSQL.ParamByName('enquiry').AsInteger :=
    StrToInt(EnquiryEdit.Text);
  PBEnqSuppDataModFrm.EnqHeadSQL.Open;

  CustNameEdit.Text :=
    PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Customer_Name').AsString + '/' +
    PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Branch_Name').AsString;
(*  DescEdit.Text :=
    PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Description').AsString;
*)
  edtContact.Text :=
    PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Contact_Name').AsString;
  iEnqStatus := PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Enquiry_Status').Asinteger;
  DefaultMarkup := 0.000;
  try
    DefaultMarkup := PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Def_Markup_Perc').Asfloat;
  except
    DefaultMarkup := 0.000;
  end;

(*  {Set the Price Unit default}
  PUnitSQL.First;
  PUnitSQL.MoveBy(1);

  bPriceUnitInactive := (PUnitSQl.FieldByName('Price_Unit_Inactive').AsString = 'Y');
*)
end;

procedure TPBEnqJobPriceFrm.GetEnquiryLineDetails;
begin
  iline := 0;

  EnquiryLineGrid.RowCount := PBEnqSuppDataModFrm.EnqLineSQL.RecordCount + 1;

  PBEnqSuppDataModFrm.EnqLineSQL.First;

  while (not PBEnqSuppDataModFrm.EnqLineSQL.EOF) do
  begin
    inc(iline);
    EnquiryLineListBox.Items.Add(PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Form_Description').AsString);
    EnquiryLineGrid.Cells[0, iline] := IntToStr(iline);
    EnquiryLineGrid.Cells[1, iline] :=
      PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Form_Description').AsString;

    {Run On Quantity and Price stored on  the line grid}
    EnquiryLineGrid.Cells[2, iline] :=
      PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Run_On_Quantity').Asstring;
    EnquiryLineGrid.Cells[3, iline] := formatfloat('0.000',
      PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Run_On_Cost').Asfloat);
    EnquiryLineGrid.Cells[4, iline] := formatfloat('0.000',
      PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Run_On_Price').Asfloat);
    EnquiryLineGrid.Cells[5, iline] := PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Enquiry_status').Asstring;
    EnquiryLineGrid.Cells[6, iline] := PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Product_Type').Asstring;

    SelectedROPricesGrid.cells[0,0] := EnquiryLineGrid.Cells[3, iline];
    SelectedROPricesGrid.cells[0,1] := EnquiryLineGrid.Cells[4, iline];
    CalcROMarkup(1, 0.000, 0);

    JobUnitComboDropDown(self);
    try
      JobUnitArray[iline] := JobUnitCombo.itemindex;
    except
      JobUnitArray[iline] := 0;
    end;

    PUnitSQL.first;
    PUnitSQl.MoveBy(JobUnitArray[iline]);

    {Get the Supplier details for this line}
    CreatePricesGrid;
    GetEnquiryQtys;
    CreateSupplierGrid;
    GetEnquiryLineSuppliers;
    PBEnqSuppDataModFrm.EnqLineSQL.Next;
  end;
end;

procedure TPBEnqJobPriceFrm.GetEnquiryQtys;
var
  icol: Integer;
begin
  {Update the Price grid with the quantity and price details for each supplier}
  PriceGrid := PBEnqSupTmpFrm.findcomponent('Price' + Copy(IntToStr(100 +
    iline), 2, 2)) as TStringGrid;

  EnqQtySQL.Close;
  EnqQtySQL.ParamByName('enquiry').AsInteger := StrToInt(Enquiryedit.Text);
  EnqQtySQL.ParamByName('line').AsInteger := iline;
  EnqQtySQL.Open;

  EnqQtySQL.First;

  SupplierPricesGrid.colcount := EnqQtySQL.RecordCount + 1;
  SelectedPricesGrid.colcount := SupplierPricesGrid.colcount;

  if SelectedPricesGrid.GridWidth >= selectedPricesGrid.ClientWidth then
  begin
    self.Panel2.Height := 146;
  end;

  PriceGrid.colcount := EnqQtySQL.RecordCount + 1;

  icol := 1;
  while (not EnqQtySQL.EOF) do
  begin
    {     	SupplierPricesGrid.cells[icol,0] := EnqQtySQL.FieldbyName('Quantity').asstring;
    }
       {Set the Quantity fields for this enquiry line}
    PriceGrid.Cells[icol, 6] := EnqQtySQL.FieldByName('Quantity').AsString;
    if EnqQtySQL.FieldByName('Supplier_Price').AsString <> '' then
      PriceGrid.Cells[icol, 0] := formatfloat('0.000',
        EnqQtySQL.FieldByName('Supplier_Price').AsFloat)
    else
      PriceGrid.Cells[icol, 0] :=
        EnqQtySQL.FieldByName('Supplier_Price').AsString;

    if EnqQtySQL.FieldByName('Quotation_Price').AsString <> '' then
      PriceGrid.Cells[icol, 1] := formatfloat('0.000',
        EnqQtySQL.FieldByName('Quotation_Price').AsFloat)
    else
      PriceGrid.Cells[icol, 1] :=
        EnqQtySQL.FieldByName('Quotation_Price').AsString;

    {			PriceGrid.cells[icol,2] := formatfloat('0.000',EnqQtySQL.FieldbyName('Supplier_Price').asfloat);
       PriceGrid.cells[icol,3] := formatfloat('0.000',PriceGrid.cells[icol,1];
    }
    PriceGrid.Cells[icol, 4] :=
      IntToStr(EnqQtySQL.FieldByName('Supplier').AsInteger);
    PriceGrid.Cells[icol, 5] :=
      IntToStr(EnqQtySQL.FieldByName('Branch_no').AsInteger);
    if EnqQtySQL.FieldByName('Price_Unit').AsString <> '' then
      PriceGrid.Cells[icol, 7] :=
        IntToStr(EnqQtySQL.FieldByName('Price_Unit').AsInteger)
    else
      PriceGrid.Cells[icol, 7] := EnqQtySQL.FieldByName('Price_Unit').AsString;

    PriceGrid.Cells[icol, 8] :=
      EnqQtySQL.FieldByName('Price_Unit_Description').AsString;

    CalcMarkup(1, 0.000, 0);
    inc(icol);
    EnqQtySQL.Next;
  end;

end;

procedure TPBEnqJobPriceFrm.GetEnquiryLineSuppliers;
var
  irow: Integer;
begin
  SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 + iline),
    2, 2)) as TStringGrid;
  SuppGrid.RowCount := PBEnqSuppDataModFrm.EnqSuppSQL.RecordCount + 1;

  PBEnqSuppDataModFrm.EnqSuppSQL.First;

  irow := 1;
  while (not PBEnqSuppDataModFrm.EnqSuppSQL.EOF) do
  begin
    SuppGrid.Cells[0, irow] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Name').AsString;

    SuppGrid.Cells[1, irow] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Supplier').AsString;
    SuppGrid.Cells[2, irow] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Branch_No').AsString;
    SuppGrid.Cells[3, irow] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Delivery_Comment').AsString;
    SuppGrid.Cells[4, irow] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Name_1').AsString;
    if PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Amount').AsString = '' then
      SuppGrid.Cells[5, irow] := '0.000'
    else
      SuppGrid.Cells[5, irow] := formatfloat('0.000',
        PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Amount').AsFloat);
    SuppGrid.Cells[6, irow] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Run_on_Quantity').AsString;
    SuppGrid.Cells[7, irow] := formatfloat('0.000',
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Run_on_Price').Asfloat);

    SuppGrid.Cells[8, irow] := PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Decline_to_Quote').asstring;

    CreateSupplierQtyGrid(irow);
    GetEnquirySupplierQtys(irow);
    PBEnqSuppDataModFrm.EnqSuppSQL.Next;
    inc(irow);
  end;
end;

procedure TPBEnqJobPriceFrm.GetEnquirySupplierQtys(irow: Integer);
var
  icount: Integer;
  QtyGrid: TStringGrid;
  icost: Real;
begin
  QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;
  QtyGrid.RowCount := PBEnqSuppDataModFrm.EnqSuppQtySQL.RecordCount + 1;

  PBEnqSuppDataModFrm.EnqSuppQtySQL.First;

  icount := 0;
  while (not PBEnqSuppDataModFrm.EnqSuppQtySQL.EOF) do
  begin
    {Update the Qty Grid with the associated values}
    QtyGrid.Cells[0, icount] :=
      PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Quantity').AsString;
    QtyGrid.Cells[1, icount] :=
      PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Response_Quantity').AsString;

    if PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Supplier_Price').AsString
      <> '' then
    begin
      {Determine the cost in what ever Default Units}
      icost :=
        PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Supplier_Price').AsFloat;
      if
        PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
      begin
        icost :=
          PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Supplier_Price').AsFloat
          *
          PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Quantity').AsFloat /
          PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Price_Unit_Factor').AsInteger;
      end;

      if PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
      begin
        icost := icost /
          (PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Quantity').AsFloat /
          PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
      end;
      {              QtyGrid.cells[2,icount] := formatfloat('0.000',PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Supplier_Price').asfloat)
                   } QtyGrid.Cells[2, icount] := formatfloat('0.00000', icost)
    end
    else
      QtyGrid.Cells[2, icount] :=
        PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Supplier_Price').AsString;

    {        if PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Price_Unit_Factor').asinteger <> 0 then
             QtyGrid.cells[2,icount] := formatfloat('0.000',((PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Response_Quantity').asinteger /
                        PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Price_Unit_Factor').asinteger) * StrToFloatDef(QtyGrid.cells[2,icount])), 0, FormatSettings);

            QtyGrid.cells[3,icount] := PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Price_Unit_Description').asstring;
            QtyGrid.cells[4,icount] := PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Price_Unit').asstring;
            QtyGrid.cells[5,icount] := inttostr(PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Price_Unit_Factor').asinteger);
    }
    QtyGrid.Cells[3, icount] := PUnitSQL.FieldByName('Description').AsString;
    QtyGrid.Cells[4, icount] := PUnitSQL.FieldByName('Price_Unit').AsString;
    QtyGrid.Cells[5, icount] :=
      IntToStr(PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
    PBEnqSuppDataModFrm.EnqSuppQtySQL.Next;
    inc(icount);
  end;
end;

procedure TPBEnqJobPriceFrm.CreateSupplierGrid;
var
  MyStringGrid: TStringGrid;
begin
  {create the Suppliers Grid}
  MyStringGrid := TStringGrid.Create(PBEnqSupTmpFrm);
  try
    with MyStringGrid do
    begin
      Parent := PBEnqSupTmpFrm;
      Name := 'Grid' + Copy(IntToStr(100 + iline), 2, 2);
      Left := 8;
      DefaultColWidth := 195;
      DefaultRowHeight := 20;
      FixedCols := 0;
      FixedRows := 1;
      Colcount := 2;
      RowCount := 1;
      Top := 144;
      Width := 345;
      Height := 121;
      Visible := False;
      Scrollbars := ssboth;
    end;
  except
    MyStringGrid.Free;
  end;
end;

procedure TPBEnqJobPriceFrm.CreateSupplierQtyGrid(irow: Integer);
var
  MyStringGrid: TStringGrid;
begin
  {create the Suppliers Grid}
  MyStringGrid := TStringGrid.Create(PBEnqSupTmpFrm);
  try
    with MyStringGrid do
    begin
      Parent := PBEnqSupTmpFrm;
      Name := 'Qty' + Copy(IntToStr(100 + iline), 2, 2) + Copy(IntToStr(100 +
        irow), 2, 2);
      Left := 360;
      DefaultColWidth := 160;
      DefaultRowHeight := 20;
      FixedCols := 1;
      FixedRows := 0;
      Colcount := 5;
      RowCount := 1;
      Top := 144;
      Width := 345;
      Height := 121;
      Visible := False;
      Scrollbars := ssboth;
    end;
  except
    MyStringGrid.Free;
  end;
end;

procedure TPBEnqJobPriceFrm.CreatePricesGrid;
var
  MyStringGrid: TStringGrid;
begin
  {create the Prices Grid for this line}
  MyStringGrid := TStringGrid.Create(PBEnqSupTmpFrm);
  try
    with MyStringGrid do
    begin
      Parent := PBEnqSupTmpFrm;
      Name := 'Price' + Copy(IntToStr(100 + iline), 2, 2);
      Left := 8;
      DefaultColWidth := 60;
      DefaultRowHeight := 20;
      FixedCols := 1;
      FixedRows := 1;
      Colcount := 1;
      RowCount := 6;
      Top := 50;
      Width := 200;
      Height := 90;
      Visible := False;
      Scrollbars := ssboth;
    end;
  except
    MyStringGrid.Free;
  end;
end;

procedure TPBEnqJobPriceFrm.ClearScreen;
var
  irow, icol, icount: Integer;
begin
  for icount := ComponentCount - 1 downto 0 do
  begin
    if Components[icount] is TMemo then
      TMemo(Components[icount]).Clear;

    if Components[icount] is TEdit then
      if TEdit(Components[icount]).Name = 'EnquiryEdit' then
        Continue
      else
        TEdit(Components[icount]).Clear;

    if Components[icount] is TListBox then
      TListBox(Components[icount]).Clear;

    if Components[icount] is TScrollbox then
      TScrollbox(Components[icount]).Free;

    if Components[icount] is TComboBox then
    begin
      TComboBox(Components[icount]).Text := '';
      TComboBox(Components[icount]).ItemIndex := -1;
    end;
  end;

  {Clear all the details on Additional Details form}
  for icount := PBEnqJobDtlsFrm.ComponentCount - 1 downto 0 do
  begin
    if PBEnqJobDtlsFrm.Components[icount] is TMemo then
      TMemo(PBEnqJobDtlsFrm.Components[icount]).Clear;

    if PBEnqJobDtlsFrm.Components[icount] is TEdit then
      if TEdit(PBEnqJobDtlsFrm.Components[icount]).Name = 'EnquiryEdit' then
        Continue
      else
        TEdit(PBEnqJobDtlsFrm.Components[icount]).Clear;

    if PBEnqJobDtlsFrm.Components[icount] is TListBox then
      TListBox(PBEnqJobDtlsFrm.Components[icount]).Clear;

    if PBEnqJobDtlsFrm.Components[icount] is TScrollbox then
      TScrollbox(PBEnqJobDtlsFrm.Components[icount]).Free;

    if PBEnqJobDtlsFrm.Components[icount] is TComboBox then
    begin
      TComboBox(PBEnqJobDtlsFrm.Components[icount]).Text := '';
      TComboBox(PBEnqJobDtlsFrm.Components[icount]).ItemIndex := -1;
    end;
  end;

  {Clear down all the Supplier Price details}
  for irow := 0 to SupplierPricesGrid.RowCount - 1 do
  begin
    for icol := 0 to SupplierPricesGrid.colcount - 1 do
    begin
      SupplierPricesGrid.Cells[icol, irow] := '';
    end;
  end;
  SupplierPricesGrid.RowCount := 2;
  SupplierPricesGrid.colcount := 2;

  {Clear down all the Selected Price details}
  for irow := 0 to SelectedPricesGrid.RowCount - 1 do
  begin
    for icol := 0 to SelectedPricesGrid.colcount - 1 do
    begin
      SelectedPricesGrid.Cells[icol, irow] := '';
    end;
  end;
  SelectedPricesGrid.RowCount := 2;
  SelectedPricesGrid.colcount := 2;

  {Clear down all the Enquiry Line details}
  for irow := 1 to EnquiryLineGrid.RowCount - 1 do
  begin
    for icol := 0 to EnquiryLineGrid.colcount - 1 do
    begin
      EnquiryLineGrid.Cells[icol, irow] := '';
    end;
  end;
  EnquiryLineGrid.RowCount := 2;

  {Remove all the temporary components in the temporary form}
  for icount := PBEnqSupTmpFrm.ComponentCount - 1 downto 0 do
  begin
    if PBEnqSupTmpFrm.Components[icount] is TStringGrid then
      TStringGrid(PBEnqSupTmpFrm.Components[icount]).Free;
  end;

  {Initialise and variables used}
  Initialise;

end;

procedure TPBEnqJobPriceFrm.Initialise;
begin
  {Set the headings for the Supplier Qty Grid}
  SupplierPricesGrid.Cells[0, 0] := 'Supplier';
  SupplierPricesGrid.Enabled := False;
  SelectedPricesGrid.Enabled := False;
  SupplierROPricesGrid.Enabled := False;
  SelectedROPricesGrid.Enabled := False;

  EnquiryLineGrid.Cells[1, 0] := 'Description';

  {Set the headings for the Selected Prices Qty Grid}
  SelectedPricesGrid.Cells[0, 0] := 'Cost Price';
  SelectedPricesGrid.Cells[0, 1] := 'Sell Price';
  SelectedPricesGrid.Cells[0, 2] := 'Markup %';
  SelectedPricesGrid.Cells[0, 3] := 'Markup';
  SelectedPricesGrid.Cells[0, 4] := 'Price Unit';

  SameMarkupForAll := true;
  SamePriceUnitForAll := true;

  SaveBitBtn.Enabled := False;
  CancelBitBtn.Enabled := False;
//  JobUnitcomboDropDown(Self);
end;

procedure TPBEnqJobPriceFrm.EnquiryLineListBoxClick(Sender: TObject);
var
  icol, irow: Integer;
  iqtycol: Integer;
begin
  {Don't try to get any details if there are no lines on the enquiry}
  if EnquiryLineListbox.Items.Count = 0 then Exit;

  iline := EnquiryLineListBox.itemindex + 1;

  {Get the relevant Supplier Grid and feed the details into the main grid}
  SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 + iline),
    2, 2)) as TStringGrid;

  JobUnitComboDropDown(self);
  try
    JobUnitArray[iline] := JobUnitCombo.itemindex;
  except
    JobUnitArray[iline] := 0;
  end;

  PUnitSQL.first;
  PUnitSQl.MoveBy(JobUnitArray[iline]);

(*  try
    JobUnitCombo.itemindex := JobUnitArray[iline];
  except
    exit;
  end;
*)

  {Get the relevant Prices Grid and feed the details into the Selected Prices grid}
  PriceGrid := PBEnqSupTmpFrm.findcomponent('Price' + Copy(IntToStr(100 +
    iline), 2, 2)) as TStringGrid;
  with PriceGrid do
    for icol := 1 to PriceGrid.colcount - 1 do
    begin
      SupplierPricesGrid.Cells[icol, 0] := PriceGrid.Cells[icol, 6];
    end;

  {Clear down all the Supplier Price details}
  for irow := 1 to SupplierPricesGrid.RowCount - 1 do
  begin
    for icol := 1 to SupplierPricesGrid.colcount - 1 do
    begin
      SupplierPricesGrid.Cells[icol, irow] := '';
    end;
  end;

  {Clear down all the Selected Price details}
  for irow := 1 to SelectedPricesGrid.RowCount - 1 do
  begin
    for icol := 1 to SelectedPricesGrid.colcount - 1 do
    begin
      SelectedPricesGrid.Cells[icol, irow] := '';
    end;
  end;

  {Clear down all the Selected Run On Price details}
  for irow := 0 to SelectedROPricesGrid.RowCount - 1 do
  begin
    for icol := 0 to SelectedROPricesGrid.colcount - 1 do
    begin
      SelectedROPricesGrid.Cells[icol, irow] := '';
    end;
  end;

  {If no suppliers then just set the number of rows and columns to 2}
  if SuppGrid.RowCount < 2 then
  begin
    SupplierPricesGrid.RowCount := 2;
    SupplierPricesGrid.colcount := 2;

    SelectedPricesGrid.colcount := 2;

    Exit;
  end;

  SupplierPricesGrid.RowCount := SuppGrid.RowCount;
  SupplierROPricesGrid.RowCount := SuppGrid.RowCount;
  SupplierPricesGrid.colcount := PriceGrid.colcount;

  with SuppGrid do
  begin
    for irow := 1 to SuppGrid.RowCount - 1 do
    begin
      if SuppGrid.Cells[0, irow] = '' then Continue;
      SupplierPricesGrid.Cells[0, irow] := SuppGrid.Cells[0, irow];
      SupplierROPricesGrid.Cells[0,irow] :=  SuppGrid.cells[7,irow];
      SupplierROPricesGrid.Cells[0,0] :=  SuppGrid.cells[6,irow];

      {Find the relevant QtyGrid for this supplier}
      QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 +
        iline), 2, 2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;
      for icol := 0 to QtyGrid.RowCount - 1 do
      begin
        for iqtycol := 1 to SupplierPricesGrid.colcount - 1 do
        begin
          if QtyGrid.Cells[0, icol] = SupplierPricesGrid.Cells[iqtycol, 0] then
          begin
            if QtyGrid.Cells[2, icol] = '' then
              SupplierPricesGrid.Cells[iqtycol, irow] := QtyGrid.Cells[2, icol]
            else
              SupplierPricesGrid.Cells[iqtycol, irow] := formatfloat('0.000',
                StrToFloatDef(QtyGrid.Cells[2, icol], 0, FormatSettings));
            if SuppGrid.cells[8,irow] = 'Y' then
              SupplierPricesGrid.Cells[iqtycol, irow] := 'DTQ';
           Continue;
          end;
        end;
      end;
    end;
  end;

  {Setup the correct column widths}
  SupplierPricesGrid.colwidths[0] := 190;
  for icol := 1 to SupplierPricesGrid.colcount - 1 do
    SupplierPricesGrid.colwidths[icol] := 80;

  {Display the details for the first line of the Supplier Prices Grid}
  SupplierPricesGrid.Row := 1;
  SupplierPricesGridClick(Self);

  {Display the Quotation Prices}
  with PriceGrid do
  begin
    for icol := 1 to PriceGrid.colcount - 1 do
    begin
      SelectedPricesGrid.Cells[icol, 0] := PriceGrid.Cells[icol, 0];
      SelectedPricesGrid.Cells[icol, 1] := PriceGrid.Cells[icol, 1];
      SelectedPricesGrid.Cells[icol, 2] := PriceGrid.Cells[icol, 2];
      SelectedPricesGrid.Cells[icol, 3] := PriceGrid.Cells[icol, 3];
      SelectedPricesGrid.Cells[icol, 4] := PriceGrid.Cells[icol, 8];
    end;
  end;

  {Display the Quotation Prices}
  if SelectedPricesGrid.Cells[1, 1] <> '' then
    begin
      with SelectedROPricesGrid do
        begin
          cells[0,0] := EnquiryLineGrid.Cells[3,iline];
          cells[0,1] := EnquiryLineGrid.Cells[4,iline];
          CalcROMarkup(1, 0.000, 0);
        end;
    end;

  {Set the Selected Prices Grid column widths}
  SelectedPricesGrid.colcount := SupplierPricesGrid.colcount;
  SelectedPricesGrid.colwidths[0] := 190;
  SelectedPricesGrid.RowCount := 5;

  for icol := 1 to SelectedPricesGrid.colcount - 1 do
    SelectedPricesGrid.colwidths[icol] := 80;

  {Determine whether to show the Run on grid}
  grpBxSupplierRunOn.Visible := (SupplierPricesGrid.colcount = 2) and
        ((trim(EnquiryLineGrid.cells[2,iLine]) <> '') and (trim(EnquiryLineGrid.cells[2,iLine]) <> '0'));
  grpBxSelectedRunOn.Visible := grpBxSupplierRunOn.Visible;

  {Go and build into the Cheapest price array the cheapest prices}
  BuildCheapest;
end;

procedure TPBEnqJobPriceFrm.FormShow(Sender: TObject);
begin
  Initialise;
  {Create the lines form}
  PBEnqJobDtlsFrm := TPBEnqJobDtlsFrm.Create(Self);
  GetEnquiryDetails;
  SupplierPricesGrid.SetFocus;
end;

procedure TPBEnqJobPriceFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
      begin
      end;
end;

procedure TPBEnqJobPriceFrm.FormDestroy(Sender: TObject);
begin
  PBEnqSupTmpFrm.Free;
  Application.HintHidePause := 2500;
end;

procedure TPBEnqJobPriceFrm.FormCreate(Sender: TObject);
begin
  PBEnqSupTmpFrm := TPBEnqSupTmpFrm.Create(Self);

  {Prevent viewing of price details}
  savebitbtn.Visible := dmbroker.OperatorCanViewPrices(frmpbmainmenu.iOperator);
  groupbox2.Visible := dmbroker.OperatorCanViewPrices(frmpbmainmenu.iOperator);
  grpbxselectedRunOn.visible := groupbox2.Visible;

  {Create the form which gets all the enquiry data}
  PBEnqSuppDataModFrm := TPBEnqSuppDataModFrm.Create(Self);
  Application.HintHidePause := 10000;

end;

procedure TPBEnqJobPriceFrm.SupplierPricesGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
  lrow, lcol: Longint;
begin
  lRow := ARow;
  lCol := ACol;

  with Sender as TStringGrid, Canvas do
  //set the background colour of the box and the text style depending
  //on which cell is begin drawn
  begin
    if (lRow < FixedRows) or (lCol < FixedCols) then
    begin
      //if its the left and top fixed column/row headers
      Brush.Color := clbtnFace;
      font.name := SupplierPricesGrid.Font.name;
      font.size := SupplierPricesGrid.Font.size;
      font.style := [];
    end
    else
    if suppgrid.cells[8,lRow] = 'Y' then
    begin
      //Show in red if declined to quote
      brush.color := clred;
      font.style := [fsbold];
    end
    else
    if Cells[lCol, lRow] = formatfloat('0.000', cheapestArray[iline, lcol]) then
    begin
      //if its the lowest price
      brush.color := clyellow;
      font.style := [fsbold];
    end
    else
    begin
      //otherwise....
      Brush.Color := clWhite;
      Font.Color := Font.Color;
      font.style := [];
    end;
  end;

  {If Heading Display Left justified in the cells}
  with SupplierPricesGrid do
  begin
    if ACol = 0 then
    begin
      StrPCopy(Txt, Cells[ACol, ARow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[ACol, ARow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 3, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;

  with Sender as TStringGrid, Canvas do
  begin
    if (gdselected in State) then
    begin
      //draw a box around the selected cell
      pen.Color := clHighlight;
      pen.Width := 1;
      polyline([point(rect.left+1,rect.top+1),
                point(rect.right-2,rect.top+1),
                point(rect.right-2,rect.bottom-2),
                point(rect.left+1,rect.bottom-2),
                point(rect.left+1,rect.top+1)]);
      end;
    if (lCol = 0) or (lRow = 0) then
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
end;

procedure TPBEnqJobPriceFrm.SupplierPricesGridClick(Sender: TObject);
var
  irow, icol: Integer;
begin
  {This combo box can only be disabled if the screen is in view mode} ;
  If not JobUnitCombo.Enabled then
        exit ;
  with SupplierPricesGrid do
  begin
    if (Col = 0) or (Cells[Col, Row] = '') then
      mnuSelectThis1.Enabled := False
    else
      mnuSelectAll.Enabled := True;
  end;

  irow := SupplierPricesGrid.Row;
  icol := SupplierPricesGrid.Col;

  QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;

  SupplierMemo.Text := SuppGrid.Cells[3, irow];
  SupplierEdit.Text := SuppGrid.Cells[0, irow];
  BranchEdit.Text := SuppGrid.Cells[4, irow];
  AddCostsMemo.Lines[0] := SuppGrid.Cells[5, irow];

  PBEnqJobDtlsFrm.SupplierMemo.Text := SuppGrid.Cells[3, irow];
  PBEnqJobDtlsFrm.SupplierEdit.Text := SuppGrid.Cells[0, irow];
  PBEnqJobDtlsFrm.BranchEdit.Text := SuppGrid.Cells[4, irow];
  PBEnqJobDtlsFrm.PriceUnitEdit.Text := QtyGrid.Cells[3, icol];
  PBEnqJobDtlsFrm.AddCostsMemo.Lines[0] := SuppGrid.Cells[5, irow];

  if icol <> 0 then
    PBEnqJobDtlsFrm.PriceUnitEdit.Text := QtyGrid.Cells[3, icol - 1];
end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridDrawCell(Sender: TObject;
  ACol, ARow: Longint; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) and (ACol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      if (ARow = 1) then
        Canvas.font.Color := clRed
      else
        Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[ACol, ARow]);
    end;
  end;
  {If Heading Display Left justified in the cells}
  with SelectedPricesGrid do
  begin
    if ACol = 0 then
    begin
      StrPCopy(Txt, Cells[ACol, ARow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[ACol, ARow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;
end;

procedure TPBEnqJobPriceFrm.mnuSelectThis1Click(Sender: TObject);
var
  irow, icol: Integer;
begin
  irow := SupplierPricesGrid.Row;
  icol := SupplierPricesGrid.Col;

  if bPriceUnitInactive then
    begin
      messagedlg('The currently selected price unit is flagged as inactive, this cannot be used for quotations, please select an alternative.',
                  mtError, [mbOk], 0);
      exit;
    end
  else
    DisplaySelectedCost(icol, irow);
end;

procedure TPBEnqJobPriceFrm.SupplierPricesGridMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  {	if SupplierPricesGrid.col = 0 then
    SelectPopUpMenu.AutoPopUp := false
    else
    SelectPopUpMenu.AutoPopUp := true;
  }
end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {    				'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;
    }
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;

end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  icol, irow: Integer;
begin
  irow := SelectedPricesGrid.Row;
  icol := SelectedPricesGrid.Col;

  with SelectedPricesGrid do
  begin

    if (Cells[iCol, iRow] = '') or
      (Cells[iCol, iRow] = '.')
      then Cells[iCol, iRow] := FloatToStr(0.000);

    if (Cells[iCol, iRow] = '-') then Exit;

    PriceGrid.Cells[icol, irow] := Cells[icol, irow];

    {Change Run On Markup if being used}
    if (irow = 2) and (SameMarkupForAll) and (SelectedROPricesGrid.Cells[0, 0]<>'') then
      begin
        SelectedROPricesGrid.Cells[0, 2] := formatfloat('0.000',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
        CalcROMarkup(2,StrToFloatDef(SelectedROPricesGrid.Cells[0, 2], 0, FormatSettings), 0);
        EnquiryLineGrid.Cells[3,iline] := SelectedROPricesGrid.cells[0,0];
        EnquiryLineGrid.Cells[4,iline] := SelectedROPricesGrid.cells[0,1];
      end;

    if (iRow = 0) or (iRow = 1) then {Changing Selling Price}
      CalcMarkup(1, 0.000, 0)
    else
      if iRow = 2 then {Changing Markup %}
        CalcMarkup(2, StrToFloatDef(Cells[icol, irow], 0, FormatSettings), icol)
      else
        CalcMarkup(3, 0.000, 0); {Changing Markup Value}
  end;
end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  irow, icol: integer;
begin
  with selectedPricesGrid do
  begin
    if (Cells[Col, 0] = '') or (not JobUnitCombo.Enabled) then
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing]
    else
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing, goEditing]
  end;

  {Format any numeric values}
  with Sender as TStringGrid do
    begin
    for icol := 1 to pred(colcount) do
      for irow := 1 to 3 do
        begin
          if cells[icol, irow] = '' then continue;
          cells[icol, irow] := formatfloat('0.000',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
        end;
    end;
end;

procedure TPBEnqJobPriceFrm.SaveBitBtnClick(Sender: TObject);
var
  icol, myLine: Integer;
  bAllUpdated, bLineUpdated: boolean;
begin
  if MessageDlg('Do you want to save these price details', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
  begin
    Exit;
  end;

  bAllUpdated := True;

  {Update the Enquiry Supplier and Enquiry Supplier Quantity tables}
  for myLine := 1 to enquiryLineListBox.Items.Count do
  begin
    iLine := myLine;
    bLineUpdated := True;
    {Get the relevant Supplier Grid and feed the details into the main grid}
    SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 +
      iline), 2, 2)) as TStringGrid;

    {Get the relevant Price Grid and feed the details into the main grid}
    PriceGrid := PBEnqSupTmpFrm.findcomponent('Price' + Copy(IntToStr(100 +
      iline), 2, 2)) as TStringGrid;
    for icol := 1 to PriceGrid.colcount - 1 do
    begin
      {Don't save anything if no supplier prices selected}
      if PriceGrid.Cells[icol, 0] = '' then
      begin
        bLineUpdated := False;
        bAllUpdated := False;
        Continue;
      end;
      UpEnqQtySQL.Close;
      UpEnqQtySQL.ParamByName('Enquiry').AsInteger :=
        StrToInt(EnquiryEdit.Text);
      UpEnqQtySQL.ParamByName('Line').AsInteger := iline;
      UpEnqQtySQL.ParamByName('Quantity').AsInteger :=
        StrToInt(PriceGrid.Cells[icol, 6]);
      UpEnqQtySQL.ParamByName('Cost').AsFloat :=
        StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings);
      UpEnqQtySQL.ParamByName('Price').AsFloat :=
        StrToFloatDef(PriceGrid.Cells[icol, 1], 0, FormatSettings);
      UpEnqQtySQL.ParamByName('Supplier').AsInteger :=
        StrToInt(PriceGrid.Cells[icol, 4]);
      UpEnqQtySQL.ParamByName('Branch').AsInteger :=
        StrToInt(PriceGrid.Cells[icol, 5]);
      UpEnqQtySQL.ParamByName('Unit').AsInteger :=
        StrToInt(PriceGrid.Cells[icol, 7]);
      UpEnqQtySQL.ExecSQL;

      {Reset the Selected price field for all the suppliers}
      ResetSuppEnqQtySQL.close;
      ResetSuppEnqQtySQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);
      ResetSuppEnqQtySQL.ParamByName('Line').AsInteger := iline;
      ResetSuppEnqQtySQL.ParamByName('Quantity').AsInteger := StrToInt(PriceGrid.Cells[icol, 6]);
      ResetSuppEnqQtySQL.execsql;

      {Update the Supplier Enquiry Quantity table with the selected details}
      UpSuppEnqQtySQL.Close;
      UpSuppEnqQtySQL.ParamByName('Enquiry').AsInteger :=
        StrToInt(EnquiryEdit.Text);
      UpSuppEnqQtySQL.ParamByName('Line').AsInteger := iline;
      UpSuppEnqQtySQL.ParamByName('Quantity').AsInteger :=
        StrToInt(PriceGrid.Cells[icol, 6]);
      UpSuppEnqQtySQL.ParamByName('Price').AsFloat :=
        StrToFloatDef(PriceGrid.Cells[icol, 1], 0, FormatSettings);
      UpSuppEnqQtySQL.ParamByName('Supplier').AsInteger :=
        StrToInt(PriceGrid.Cells[icol, 4]);
      UpSuppEnqQtySQL.ParamByName('Branch').AsInteger :=
        StrToInt(PriceGrid.Cells[icol, 5]);
      UpSuppEnqQtySQL.ExecSQL;
    end;

    {Update the line status}
    UpEnqLineSQL.Close;
    UpEnqLineSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);
    UpEnqLineSQL.ParamByName('Line').AsInteger := iline;

    {Determine if all the line has been updated}
    if bLineUpdated then
      UpEnqLineSQL.ParamByName('Status').AsInteger := 50
    else
      UpEnqLineSQL.ParamByName('Status').AsInteger := 45;

    if strtoint(EnquiryLineGrid.cells[5,iLine]) >= UpEnqLineSQL.ParamByName('status').AsInteger then
      UpEnqLineSQL.ParamByName('Status').AsInteger := strtoint(EnquiryLineGrid.cells[5,iLine]);

    UpEnqLineSQL.ParamByName('Run_on_Cost').Asfloat := StrToFloatDef(EnquiryLineGrid.cells[3,iLine], 0, FormatSettings);
    UpEnqLineSQL.ParamByName('Run_on_Price').Asfloat := StrToFloatDef(EnquiryLineGrid.cells[4,iLine], 0, FormatSettings);

    UpEnqLineSQL.ExecSQL;
  end;
  {Update the Enquiry Header}
  UpEnqHeadSQL.Close;
  UpEnqHeadSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);

  {Determine if fully or part updated}
  if bAllUpdated then
    UpEnqHeadSQL.ParamByName('status').AsInteger := 50
  else
    UpEnqHeadSQL.ParamByName('status').AsInteger := 45;

  {only update the status if the new status is greater than the current enquiry status}
  if UpEnqHeadSQL.ParamByName('status').AsInteger >= iEnqStatus then
    UpEnqHeadSQL.ExecSQL;

  {Clear the screen and prompt for enquiry}
{  clearscreen;
}
  PBEnqJobPriceFrm.ModalResult := mrOK;
end;

procedure TPBEnqJobPriceFrm.CalcMarkup(iType: Integer; iNewMarkup: Real;
  icolumn: Integer);
var
  icol: Integer;
  ivalue: Real;
begin
  for icol := 1 to SelectedPricesGrid.colcount - 1 do
  begin
    {Don't calculate Markup if no cost}
    if  (PriceGrid.Cells[icol, 0] = '') then
      continue;

    if StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings) = 0.000 then
      begin
        PriceGrid.Cells[icol, 2] := '99999.999';
        SelectedPricesGrid.Cells[icol, 2] := '99999.999';
        PriceGrid.Cells[icol, 3] := PriceGrid.Cells[icol, 1];
        SelectedPricesGrid.Cells[icol, 3] := SelectedPricesGrid.Cells[icol, 1];
        Continue;
      end;

    {If no sell price then Markup = 0.000}
    if (PriceGrid.Cells[icol, 1] = '') then
    begin
      PriceGrid.Cells[icol, 1] := '0.000';
      SelectedPricesGrid.Cells[icol, 1] := '0.000';
    end;

    {Changing Selling Price}
    if iType = 1 then
    begin
      {Calculate Markup}
      ivalue := StrToFloatDef(PriceGrid.Cells[icol, 1], 0, FormatSettings) -
        StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings);
      SelectedPricesGrid.Cells[icol, 3] := formatfloat('0.000', iValue);
      PriceGrid.Cells[icol, 3] := formatfloat('0.000', iValue);

      if StrToFloatDef(PriceGrid.Cells[icol, 1], 0, FormatSettings) = 0 then
      begin
        {Calculate Markup %}
        ivalue := -99999.999;
        SelectedPricesGrid.Cells[icol, 2] := formatfloat('0.000', iValue);
        PriceGrid.Cells[icol, 2] := formatfloat('0.000', iValue);
      end
      else
      begin
        {Calculate Markup %}
        ivalue := ((ivalue / StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings)) * 100);
        SelectedPricesGrid.Cells[icol, 2] := formatfloat('0.000', iValue);
        PriceGrid.Cells[icol, 2] := formatfloat('0.000', iValue);
      end;
    end
    else {Changing Markup %}
      if iType = 2 then
      begin
        if SameMarkupForAll then
          if icol <> icolumn then
          begin
            PriceGrid.Cells[iCol, 2] := formatfloat('0.000', iNewMarkup);
            SelectedPricesGrid.Cells[iCol, 2] := formatfloat('0.000',
              iNewMarkup);
          end;

        {Calculate the Sell Price from the Markup %}
        ivalue := (StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings) *
          (1 + StrToFloatDef(PriceGrid.Cells[iCol, 2], 0, FormatSettings) / 100));

        SelectedPricesGrid.Cells[icol, 1] := formatfloat('0.000', iValue);
        PriceGrid.Cells[iCol, 1] := formatfloat('0.000', ivalue);

        {Calculate the Markup}
        ivalue := StrToFloatDef(PriceGrid.Cells[iCol, 1], 0, FormatSettings) -
          StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings);
        SelectedPricesGrid.Cells[icol, 3] := formatfloat('0.000', iValue);
        PriceGrid.Cells[icol, 3] := formatfloat('0.000', ivalue);
      end
      else {Changing Markup Value}
        if iType = 3 then
        begin
          {Calculate the total Price}
          ivalue := StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings) +
            StrToFloatDef(PriceGrid.Cells[icol, 3], 0, FormatSettings);
          SelectedPricesGrid.Cells[icol, 1] := formatfloat('0.000', iValue);
          PriceGrid.Cells[iCol, 1] := formatfloat('0.000', ivalue);

          {Calculate the Markup %}
          if StrToFloatDef(PriceGrid.Cells[icol, 1], 0, FormatSettings) = 0 then
          begin
            {Calculate Markup %}
            ivalue := -99999.999;
            SelectedPricesGrid.Cells[icol, 2] := formatfloat('0.000', iValue);
            PriceGrid.Cells[icol, 2] := formatfloat('0.000', iValue);
          end
          else
          begin
            {     					ivalue := ((StrToFloatDef(PriceGrid.Cells[iCol,1], 0, FormatSettings) - StrToFloatDef(PriceGrid.cells[icol,0]), 0, FormatSettings)
                          / StrToFloatDef(PriceGrid.Cells[iCol,1]) * 100, 0, FormatSettings);
                     } ivalue := ((StrToFloatDef(PriceGrid.Cells[iCol, 1], 0, FormatSettings) -
                                   StrToFloatDef(PriceGrid.Cells[icol, 0], 0, FormatSettings)) /
                                   StrToFloatDef(PriceGrid.Cells[iCol, 0], 0, FormatSettings) * 100);

            SelectedPricesGrid.Cells[icol, 2] := formatfloat('0.000', iValue);
            PriceGrid.Cells[iCol, 2] := formatfloat('0.000', ivalue);
          end;
        end;

  end;
end;

procedure TPBEnqJobPriceFrm.CalcROMarkup(iType: Integer; iNewMarkup: Real;
  icolumn: Integer);
var
  ivalue: Real;
begin

  with SelectedROPricesGrid do
    begin
    {Don't calculate Markup if no cost}
    if  (Cells[0, 0] = '') then
      exit;

    if (StrToFloatDef(Cells[0, 0], 0, FormatSettings) = 0.000) and
       (StrToFloatDef(Cells[0, 0], 0, FormatSettings) <> 0.000) then
      begin
        Cells[0, 2] := '99999.999';
        Cells[0, 3] := Cells[0, 1];
        exit;
      end;

    if (StrToFloatDef(Cells[0, 0], 0, FormatSettings) = 0.000) then
      begin
        Cells[0, 2] := '0.000';
        Cells[0, 3] := Cells[0, 1];
        exit;
      end;

    {If no sell price then Markup = 0.000}
    if (Cells[0, 1] = '') then
    begin
      Cells[0, 1] := '0.000';
    end;

    {Changing Selling Price}
    if iType = 1 then
    begin
      {Calculate Markup}
      ivalue := StrToFloatDef(Cells[0, 1], 0, FormatSettings) -
        StrToFloatDef(Cells[0, 0], 0, FormatSettings);
      Cells[0, 3] := formatfloat('0.000', iValue);

      if StrToFloatDef(Cells[0, 1], 0, FormatSettings) = 0 then
      begin
        {Calculate Markup %}
        ivalue := -99999.999;
        Cells[0, 2] := formatfloat('0.000', iValue);
      end
      else
      begin
        {Calculate Markup %}
        ivalue := ((ivalue / StrToFloatDef(Cells[0, 0], 0, FormatSettings)) * 100);
        Cells[0, 2] := formatfloat('0.000', iValue);
      end;
    end
    else {Changing Markup %}
      if iType = 2 then
      begin
(*        if SameMarkupForAll then
          begin
            Cells[0, 2] := formatfloat('0.000', iNewMarkup);
          end;
*)
        {Calculate the Sell Price from the Markup %}
        ivalue := (StrToFloatDef(Cells[0, 0], 0, FormatSettings) *
          (1 + StrToFloatDef(Cells[0, 2], 0, FormatSettings) / 100));

        Cells[0, 1] := formatfloat('0.000', ivalue);

        {Calculate the Markup}
        ivalue := StrToFloatDef(Cells[0, 1], 0, FormatSettings) -
          StrToFloatDef(Cells[0, 0], 0, FormatSettings);
        Cells[0, 3] := formatfloat('0.000', ivalue);
      end
      else {Changing Markup Value}
        if iType = 3 then
        begin
          {Calculate the total Price}
          ivalue := StrToFloatDef(Cells[0, 0], 0, FormatSettings) +
            StrToFloatDef(Cells[0, 3], 0, FormatSettings);
          Cells[0, 1] := formatfloat('0.000', ivalue);

          {Calculate the Markup %}
          if StrToFloatDef(Cells[0, 1], 0, FormatSettings) = 0 then
          begin
            {Calculate Markup %}
            ivalue := -99999.999;
            Cells[0, 2] := formatfloat('0.000', iValue);
          end
          else
          begin
            ivalue := ((StrToFloatDef(Cells[0, 1], 0, FormatSettings) -
                        StrToFloatDef(Cells[0, 0], 0, FormatSettings)) /
                        StrToFloatDef(Cells[0, 0], 0, FormatSettings) * 100);

            Cells[0, 2] := formatfloat('0.000', ivalue);
          end;
        end;

  end;
end;

procedure TPBEnqJobPriceFrm.AddCostsSpeedBtnClick(Sender: TObject);
var
  irow: Integer;
begin
  irow := SupplierPricesGrid.Row;
  PBEnqAddChgfrm := TPBEnqAddChgfrm.Create(Self);
  try
    PBEnqAddChgfrm.iEnquiry := StrToInt(EnquiryEdit.Text);
    PBEnqAddChgfrm.iLine := iline;
    PBEnqAddChgfrm.iSupplier := StrToInt(SuppGrid.Cells[1, irow]);
    PBEnqAddChgfrm.iBranch := StrToInt(SuppGrid.Cells[2, irow]);

    PBEnqAddChgfrm.smode := 'c';
    PBEnqAddChgfrm.ShowModal;
  finally
    PBEnqAddChgfrm.Free;
  end;
end;

procedure TPBEnqJobPriceFrm.SupplierPricesGridTopLeftChanged(
  Sender: TObject);
begin
  SelectedPricesGrid.LeftCol := SupplierPricesGrid.LeftCol;
end;

procedure TPBEnqJobPriceFrm.CancelBitBtnClick(Sender: TObject);
begin
  {	ClearSCreen;
  } Close;
end;

procedure TPBEnqJobPriceFrm.EnquiryLineGridClick(Sender: TObject);
begin
  EnquiryLineListBox.itemindex := EnquiryLineGrid.Row - 1;
  EnquiryLineListBoxClick(Self);
end;

procedure TPBEnqJobPriceFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Destroy the form which gets all the enquiry data}
  PBEnqSuppDataModFrm.Free;
  PBEnqJobDtlsFrm.Free;
end;

procedure TPBEnqJobPriceFrm.SelectPopUpMenuPopup(Sender: TObject);
var
  icol, irow: Integer;
begin
  {If the cell on which the Popup has been activated is empty
   then disable the selection option}
  icol := SupplierPricesGrid.Col;
  irow := SupplierPricesGrid.Row;

  if  (SupplierPricesGrid.Cells[icol, irow] = '') or
      (SupplierPricesGrid.Cells[icol, irow] = 'DTQ') or
      (icol = 0) then
    mnuSelectThis1.Enabled := False
  else
    mnuSelectThis1.Enabled := True;
end;

function TPBEnqJobPriceFrm.GetProdTypePUnit(tempcode: integer): integer;
begin
  with qryPTPriceUnit do
    begin
      close;
      parambyname('Product_Type').asinteger := tempcode;
      open;
      result := recordcount;
      close;
    end;
end;

procedure TPBEnqJobPriceFrm.PUnitComboDropDown(Sender: TObject);
var
  stext: string;
begin
  PUnitSQL.Close;
  // Check against the status to see whether need to list all price units
  // if status is zero then will show all price units
  if EnqStatus >= 75 then
    PUnitSQL.SQL.Text := OrigPriceUnit
  else
    begin
      if GetProdTypePUnit(strtoint(EnquiryLineGrid.Cells[6, iline])) > 0 then
        begin
          PUnitSQL.params.clear;
          PUnitSQL.SQL.Text := qryPTPriceUnit.sql.text;
          PUnitSQL.ParamByName('Product_Type').asinteger := strtoint(EnquiryLineGrid.Cells[6, iline]);
        end
      else
        PUnitSQL.SQL.Text := PriceUnit;
    end;

  PUnitSQL.Open;

  stext := PUnitCombo.Text;

  PUnitCombo.Clear;

  PUnitSQL.First;

  while (not PUnitSQL.EOF) do
  begin
    pUnitCombo.Items.Add(PUnitSQL.FieldByName('Description').AsString);
    PUnitSQL.Next;
  end;

  pUnitCombo.Itemindex := pUnitCombo.Items.IndexOf(sText);
  iOldUnitIndex := PUnitCombo.itemindex;
end;

procedure TPBEnqJobPriceFrm.PUnitComboEnter(Sender: TObject);
begin
  PUnitComboDropDown(Self);
  PUnitCombo.itemindex :=
    PUnitCombo.Items.indexof(SelectedPricesGrid.Cells[SelectedPricesGrid.Col,
      4]);
end;

procedure TPBEnqJobPriceFrm.PUnitComboExit(Sender: TObject);
begin
  PUnitCombo.Visible := False;
end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridClick(Sender: TObject);
begin
  {This combo box can only be disabled if the screen is in view mode} ;
  If not JobUnitCombo.Enabled then
        exit ;
  if SelectedPricesGrid.Cells[SelectedPricesGrid.Col, 0] = '' then Exit;
  with SelectedPricesGrid do
  begin
    if Row = 4 then
    begin
      PUnitCombo.Top := celltop(SelectedPricesGrid, Row);
      PUnitCombo.Left := cellleft(SelectedPricesGrid, Col);

      PUnitCombo.bringtofront;
      PUnitCombo.Visible := True;
      PUnitCombo.SetFocus;
    end
    else
    begin
      PUnitCombo.sendtoback;
      PUnitCombo.Visible := False;
    end
  end;
end;

function TPBEnqJobPriceFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.Left + grid.ColWidths[0] + 4;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.GridLineWidth;

  Result := t
end;

function TPBEnqJobPriceFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.Top + grid.RowHeights[0] + 2;
  for i := grid.toprow to Row  do
  begin
    t := t + grid.rowheights[i];
  end;
  Result := t;

end;

procedure TPBEnqJobPriceFrm.PUnitComboChange(Sender: TObject);
var
  icol: Integer;
  icost, isell: Real;
begin
  icol := SelectedPricesGrid.Col;

  {Initially determine the total value using the original Price Unit}
  PUnitSQL.First;
  PUnitSQl.moveby(iOldUnitIndex);

  icost := StrToFloatDef(SelectedPricesGrid.Cells[icol, 0], 0, FormatSettings);
  isell := StrToFloatDef(SelectedPricesGrid.Cells[icol, 1], 0, FormatSettings);

  if PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
  begin
    icost := StrToFloatDef(SelectedPricesGrid.Cells[icol, 0], 0, FormatSettings) *
      (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
      PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
    isell := StrToFloatDef(SelectedPricesGrid.Cells[icol, 1], 0, FormatSettings) *
      (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
      PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
  end;

  {Now calculate the new values using the new Price Unit}
  PUnitSQL.First;
  PUnitSQl.moveby(PUnitCombo.Itemindex);

  if PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
  begin
    icost := icost / (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
      PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
    isell := isell / (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
      PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
  end;

  {Set the values into the Grids}
  PriceGrid.Cells[icol, 0] := formatfloat('0.000', icost);
  SelectedPricesGrid.Cells[icol, 0] := formatfloat('0.000', icost);
  PriceGrid.Cells[icol, 1] := formatfloat('0.000', isell);
  SelectedPricesGrid.Cells[icol, 1] := formatfloat('0.000', isell);

  {Set the Price Unit details}
  SelectedPricesGrid.Cells[icol, 4] := PUnitCombo.Items[PunitCombo.Itemindex];
  PriceGrid.Cells[icol, 8] := SelectedPricesGrid.Cells[icol, 4];

  PUnitSQL.First;
  PUnitSQl.moveby(PUnitCombo.itemindex);
  PriceGrid.Cells[icol, 7] := PUnitSQl.FieldByName('Price_Unit').AsString;

  if SamePriceUnitForAll then
    ChangeAllUnits(PUnitCombo.Itemindex);

  CalcMarkup(1, 0.000, 0);
end;

procedure TPBEnqJobPriceFrm.ChangeAllUnits(iNewUnitIndex: Integer);
var
  icol, iOldUnitIndex: Integer;
  icost, isell: Real;
begin
  for icol := 1 to SelectedPricesGrid.colcount - 1 do
  begin
    iOldUnitIndex := PUnitCombo.Items.IndexOf(SelectedPricesGrid.Cells[icol,
      4]);

    {Initially determine the total value using the original Price Unit}
    PUnitSQL.First;
    PUnitSQl.moveby(iOldUnitIndex);

    if trim(SelectedPricesGrid.Cells[icol, 0]) = '' then
      continue
    else
      icost := StrToFloatDef(SelectedPricesGrid.Cells[icol, 0], 0, FormatSettings);

    if trim(SelectedPricesGrid.Cells[icol, 1]) = '' then
      continue
    else
      isell := StrToFloatDef(SelectedPricesGrid.Cells[icol, 1], 0, FormatSettings);

    if PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
    begin
      icost := StrToFloatDef(SelectedPricesGrid.Cells[icol, 0], 0, FormatSettings) *
        (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
        PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);

      isell := StrToFloatDef(SelectedPricesGrid.Cells[icol, 1], 0, FormatSettings) *
        (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
        PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
    end;

    {Now calculate the new values using the new Price Unit}
    PUnitSQL.First;
    PUnitSQl.moveby(iNewUnitIndex);

    if PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
    begin
      icost := icost / (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
        PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
      isell := isell / (StrToFloatDef(SupplierPricesGrid.Cells[icol, 0], 0, FormatSettings) /
        PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
    end;

    {Set the values into the Grids}
    PriceGrid.Cells[icol, 0] := formatfloat('0.000', icost);
    SelectedPricesGrid.Cells[icol, 0] := formatfloat('0.000', icost);
    PriceGrid.Cells[icol, 1] := formatfloat('0.000', isell);
    SelectedPricesGrid.Cells[icol, 1] := formatfloat('0.000', isell);

    {Set the Price Unit details}
    SelectedPricesGrid.Cells[icol, 4] := PUnitCombo.Items[PunitCombo.Itemindex];
    PriceGrid.Cells[icol, 8] := SelectedPricesGrid.Cells[icol, 4];
    PriceGrid.Cells[icol, 7] := PUnitSQl.FieldByName('Price_Unit').AsString;
  end;
end;

procedure TPBEnqJobPriceFrm.JobUnitcomboDropDown(Sender: TObject);
var
  stext: string;
begin
(*  PUnitSQL.Close;
  PUnitSQL.SQL.Text := OrigPriceUnit;
  PUnitSQL.Open;
*)
  PUnitSQL.Close;
  // Check against the status to see whether need to list all price units
  // if status is zero then will show all price units
  if EnqStatus >= 500 then
    PUnitSQL.SQL.Text := OrigPriceUnit
  else
    begin
      if GetProdTypePUnit(strtoint(EnquiryLineGrid.Cells[6, iline])) > 0 then
        begin
          PUnitSQL.params.clear;
          PUnitSQL.SQL.Text := qryPTPriceUnit.sql.text;
          PUnitSQL.ParamByName('Product_Type').asinteger := strtoint(EnquiryLineGrid.Cells[6, iline]);
        end
      else
        PUnitSQL.SQL.Text := PriceUnit;
    end;

  PUnitSQL.Open;

//  stext := JobUnitCombo.Text;

  if sText = '' then
    sText := GetProdTypeDefaultPUnit(strtoint(EnquiryLineGrid.Cells[6, iline]));

  JobUnitCombo.Clear;

  PUnitSQL.First;

  while (not PUnitSQL.EOF) do
  begin
    JobUnitCombo.Items.Add(PUnitSQL.FieldByName('Description').AsString);
    PUnitSQL.Next;
  end;

  JobUnitCombo.Itemindex := JobUnitCombo.Items.IndexOf(sText);

  if JobUnitCombo.Itemindex < 0 then
    JobUnitCombo.Itemindex := 0;
end;

function TPBEnqJobPriceFrm.GetProdTypeDefaultPUnit(tempCode: integer): string;
begin
  result := '';
  with qryProdType do
    begin
      close;
      parambyname('Product_Type').asinteger := tempCode;
      open;
      result := fieldbyname('Price_Unit_Description').asstring;
    end;
end;

procedure TPBEnqJobPriceFrm.CalcSupplierPrices;
var
  irow, icol, iqtycol: Integer;
  icost: Real;
begin
  PunitSQl.First;
  PUnitSQl.moveby(JobUnitCombo.Itemindex);
  bPriceUnitInActive := (PUnitSQL.fieldbyname('Price_Unit_Inactive').asstring = 'Y');

  {Initialise the cheapest array}
  for irow := 1 to 100 do
    CheapestArray[iline, irow] := 99999999.999;

  {Get the relevant Supplier Grid and feed the details into the main grid}
  SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 + iline),
    2, 2)) as TStringGrid;

  with SuppGrid do
  begin
    for irow := 1 to SuppGrid.RowCount - 1 do
    begin
      if SuppGrid.Cells[0, irow] = '' then Continue;

      {Find the relevant QtyGrid for this supplier}
      QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 +
        iline), 2, 2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;
      for icol := 0 to QtyGrid.RowCount - 1 do
      begin
        for iqtycol := 1 to SupplierPricesGrid.colcount - 1 do
        begin
          if QtyGrid.Cells[0, icol] = SupplierPricesGrid.Cells[iqtycol, 0] then
          begin
            if (SupplierPricesGrid.Cells[iqtycol, irow] = '') or
               (SupplierPricesGrid.Cells[iqtycol, irow] = 'DTQ') then Break;

            icost := StrToFloatDef(SupplierPricesGrid.Cells[iqtycol, irow], 0, FormatSettings);

            {Determine the Total based on the original Price Unit}
            PunitSQl.First;
            PUnitSQl.moveby(JobUnitArray[iline]);
            if PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
              icost := StrToFloatDef(QtyGrid.Cells[2, icol], 0, FormatSettings) *
                (StrToFloatDef(SupplierPricesGrid.Cells[iqtycol, 0], 0, FormatSettings) /
                PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);

            {Determine the Total based on the new Price Unit}
            PunitSQl.First;
            PUnitSQl.moveby(JobUnitCombo.Itemindex);
            if PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger <> 0 then
              icost := icost / (StrToFloatDef(SupplierPricesGrid.Cells[iqtycol, 0], 0, FormatSettings)
                / PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);

            QtyGrid.Cells[2, icol] := formatfloat('0.000000', icost);
            QtyGrid.Cells[3, icol] :=
              PUnitSQL.FieldByName('Description').AsString;
            QtyGrid.Cells[4, icol] :=
              PUnitSQL.FieldByName('Price_Unit').AsString;
            QtyGrid.Cells[5, icol] :=
              IntToStr(PUnitSQL.FieldByName('Price_Unit_Factor').AsInteger);
            if StrToFloatDef(formatfloat('0.000', icost), 0, FormatSettings) < CheapestArray[iline,
              iqtycol] then
              CheapestArray[iline, iqtycol] := StrToFloatDef(formatfloat('0.000',icost), 0, FormatSettings);

            SupplierPricesGrid.Cells[iqtycol, irow] := formatfloat('0.000',
              icost);
            Break;
          end;
        end;
      end;
    end;
  end;
end;

procedure TPBEnqJobPriceFrm.JobUnitcomboClick(Sender: TObject);
begin
  CalcSupplierPrices;
  JobUnitArray[iline] := JobUnitCombo.Itemindex;
end;

procedure TPBEnqJobPriceFrm.BuildCheapest;
var
  irow, icol, iqtycol: Integer;
begin
  {Initialise the cheapest array}
  for irow := 1 to 100 do
    CheapestArray[iline, irow] := 99999999.999;

  {Get the relevant Supplier Grid and feed the details into the main grid}
  SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 + iline),
    2, 2)) as TStringGrid;
  with SuppGrid do
  begin
    for irow := 1 to SuppGrid.RowCount - 1 do
    begin
      if SuppGrid.Cells[0, irow] = '' then Continue;
      SupplierPricesGrid.Cells[0, irow] := SuppGrid.Cells[0, irow];

      {Find the relevant QtyGrid for this supplier}
      QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 +
        iline), 2, 2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;
      for icol := 0 to QtyGrid.RowCount - 1 do
      begin
        for iqtycol := 1 to SupplierPricesGrid.colcount - 1 do
        begin
          if QtyGrid.Cells[0, icol] = SupplierPricesGrid.Cells[iqtycol, 0] then
          begin
            if QtyGrid.Cells[2, icol] <> '' then
              if StrToFloatDef(QtyGrid.Cells[2, icol], 0, FormatSettings) < CheapestArray[iline,
                iqtycol] then
                CheapestArray[iline, iqtycol] := StrToFloatDef(QtyGrid.Cells[2,icol], 0, FormatSettings);
            Continue;
          end;
        end;
      end;
    end;
  end;
end;

procedure TPBEnqJobPriceFrm.mnuSelectAllClick(Sender: TObject);
var
  irow, icol: Integer;
begin
  if bPriceUnitInactive then
    begin
      messagedlg('The currently selected price unit is flagged as inactive, this cannot be used for quotations, please select an alternative.',
                  mtError, [mbOk], 0);
      exit;
    end;

  for icol := 1 to SupplierPricesGrid.colcount - 1 do
  begin
    for irow := 1 to SupplierPricesGrid.RowCount - 1 do
    begin
      if SupplierPricesGrid.Cells[icol, irow] = formatfloat('0.000',
        cheapestArray[iline, icol]) then
      begin
        {Determine which has been selected and display in the price grid}
        DisplaySelectedCost(icol, irow);
      end;
    end;
  end;
end;

function TPBEnqJobPriceFrm.GetSupplierPhone(TempSupplier, TempBranch: integer): string;
begin
  with qrySupplier do
    begin
      close;
      parambyname('Supplier').asinteger := TempSupplier;
      parambyname('Branch_no').asinteger := TempBranch;
      open;
      result := fieldbyname('Phone').asstring;
    end;
end;

procedure TPBEnqJobPriceFrm.DisplaySelectedCost(icol: Integer; irow: Integer);
begin
  QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;

  {Update the PriceGrid with the selected supplier price}
  PriceGrid.Cells[icol, 0] := SupplierPricesGrid.Cells[icol, irow];

  {Update the PriceGrid with the selected supplier and branch}
  PriceGrid.Cells[icol, 4] := SuppGrid.Cells[1, irow];
  PriceGrid.Cells[icol, 5] := SuppGrid.Cells[2, irow];
  SelectedPricesGrid.Cells[icol, 0] := SupplierPricesGrid.Cells[icol, irow];

  SelectedROPricesGrid.Cells[0, 0] := SupplierROPricesGrid.Cells[0, irow];

  if SelectedROPricesGrid.Cells[0, 1] = '' then
    SelectedROPricesGrid.Cells[0, 1] := SelectedROPricesGrid.Cells[0, 0];

  SelectedROPricesGrid.cells[icol,2] := formatfloat('0.000',DefaultMarkup);

  if SelectedPricesGrid.Cells[icol, 1] = '' then
  begin
    SelectedPricesGrid.Cells[icol, 1] := SupplierPricesGrid.Cells[icol, irow];
    PriceGrid.Cells[icol, 1] := SupplierPricesGrid.Cells[icol, irow];
  end;
  PriceGrid.Cells[icol, 8] := QtyGrid.Cells[3, icol - 1];
  SelectedPricesGrid.Cells[icol, 4] := QtyGrid.Cells[3, icol - 1];
  PriceGrid.Cells[icol, 7] := QtyGrid.Cells[4, icol - 1];

  PriceGrid.cells[icol,2] := formatfloat('0.000',DefaultMarkup);
  SelectedPricesGrid.cells[icol,2] := formatfloat('0.000',DefaultMarkup);

  if SelectedPricesGrid.cells[icol,2] = '0.000' then
    begin
      CalcMarkup(1, 0.000, 0);
      CalcROMarkup(1, 0.000, 0);
    end
  else
    begin
      CalcMarkup(2, DefaultMarkup, 0);
      CalcROMarkup(2, DefaultMarkup, 0);
    end;
  EnquiryLineGrid.Cells[3,iline] := SelectedROPricesGrid.cells[0,0];
  EnquiryLineGrid.Cells[4,iline] := SelectedROPricesGrid.cells[0,1];
end;

procedure TPBEnqJobPriceFrm.SupplierPricesGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  with SupplierPricesGrid do
  begin
    if (Col = 0) or (Cells[Col, Row] = '') then
      MnuSelectThis1.Enabled := False
    else
      MnuSelectThis1.Enabled := True;

    Hint := 'Supplier: '+SupplierPricesGrid.cells[0,ARow] + ', Phone Number: '+GetSupplierPhone(strtoint(SuppGrid.Cells[1,ARow]),strtoint(SuppGrid.Cells[2,ARow]));
  end;
end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridExit(Sender: TObject);
var
  icol, irow: integer;
begin
  {Format any numeric values}
  with Sender as TStringGrid do
    begin
    for icol := 1 to pred(colcount) do
      for irow := 1 to 3 do
        begin
          if cells[icol, irow] = '' then continue;
          cells[icol, irow] := formatfloat('0.000',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
          PriceGrid.Cells[icol, irow] := cells[icol, irow];
        end;
    end;

end;

procedure TPBEnqJobPriceFrm.PrintBitBtnClick(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
  PrinterSettings := TPrinterSettings.Create;

  try
    if SetUpPrinter(PrinterSettings) then
        PBEnqJobPriceFrm.print;
  finally
    PrinterSettings.Free;
  end;

(*  PrinterSettings := TPrinterSettings.Create;

  try
    if SetUpPrinter(PrinterSettings) then
      begin
        sleep(500);
        PrintForm;
      end
  finally
    PrinterSettings.free;
  end;
*)
end;

procedure TPBEnqJobPriceFrm.PrintForm;
var
  DC: HDC;
  isDcPalDevice: Bool;
  MemDC: HDC;
  MemBitmap: HBITMAP;
  OldMemBitmap: HBITMAP;
  hDibHeader: THandle;
  pDibHeader: Pointer;
  hBits: THandle;
  pBits: Pointer;
  ScaleX: Double;
  ScaleY: Double;
  pPal: PLOGPALETTE;
  pal: HPALETTE;
  OldPal: HPALETTE;
  i: Integer;
begin
  {Get the screen dc}
  DC := GetDC(0);
  {Create a compatible dc}
  MemDC := CreateCompatibleDC(DC);
  {create a bitmap}
  MemBitmap := CreateCompatibleBitmap(DC, Self.Width, Self.Height);
  {select the bitmap into the dc}
  OldMemBitmap := SelectObject(MemDC, MemBitmap);

  {Lets prepare to try a fixup for broken video drivers}
  isDcPalDevice := False;
  if GetDeviceCaps(DC, RASTERCAPS) and RC_PALETTE=RC_PALETTE then
  begin
    GetMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    FillChar(pPal^, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)),
             #0);
    pPal^.palVersion := $300;
    pPal^.palNumEntries := GetSystemPaletteEntries(DC, 0, 256, pPal^.palPalEntry);
    if pPal^.palNumEntries<>0 then
    begin
      pal := CreatePalette(pPal^);
      OldPal := SelectPalette(MemDC, pal, False);
      isDcPalDevice := True
    end
    else
      FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
  end;
  {copy from the screen to the memdc/bitmap}
  BitBlt(MemDC, 0, 0, Self.Width, Self.Height, DC, Self.Left, Self.Top, SRCCOPY);

  if isDcPalDevice=True then
  begin
    SelectPalette(MemDC, OldPal, False);
    DeleteObject(pal);
  end;
  {unselect the bitmap}
  SelectObject(MemDC, OldMemBitmap);
  {delete the memory dc}
  DeleteDC(MemDC);
  {Allocate memory for a DIB structure}
  hDibHeader := GlobalAlloc(GHND, SizeOf(TBITMAPINFO)+(SizeOf(TRGBQUAD)*
                            256));
  {get a pointer to the alloced memory}
  pDibHeader := GlobalLock(hDibHeader);

  {fill in the dib structure with info on the way we want the DIB}
  FillChar(pDibHeader^, SizeOf(TBITMAPINFO)+(SizeOf(TRGBQUAD)*
           256), #0);
  PBITMAPINFOHEADER(pDibHeader)^.biSize := SizeOf(TBITMAPINFOHEADER);
  PBITMAPINFOHEADER(pDibHeader)^.biPlanes := 1;
  PBITMAPINFOHEADER(pDibHeader)^.biBitCount := 8;
  PBITMAPINFOHEADER(pDibHeader)^.biWidth := Self.Width;
  PBITMAPINFOHEADER(pDibHeader)^.biHeight := Self.Height;
  PBITMAPINFOHEADER(pDibHeader)^.biCompression := BI_RGB;

  {find out how much memory for the bits}
  GetDIBits(DC, MemBitmap, 0, Self.Height, nil, TBITMAPINFO(pDibHeader^),
            DIB_RGB_COLORS);

  {Alloc memory for the bits}
  hBits := GlobalAlloc(GHND, PBITMAPINFOHEADER(pDibHeader)^.BiSizeImage);

  {Get a pointer to the bits}
  pBits := GlobalLock(hBits);

  {Call fn again, but this time give us the bits!}
  GetDIBits(DC, MemBitmap, 0, Self.Height, pBits, PBitmapInfo(pDibHeader)^,
            DIB_RGB_COLORS);

  {Lets try a fixup for broken video drivers}
  if isDcPalDevice=True then
  begin
    for i := 0 to (pPal^.palNumEntries-1) do
    begin
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbRed := pPal^.palPalEntry[i].peRed;
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbGreen := pPal^.palPalEntry[i].peGreen;
      PBitmapInfo(pDibHeader)^.bmiColors[i].rgbBlue := pPal^.palPalEntry[i].peBlue;
    end;
    FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
  end;
  {Release the screen dc}
  ReleaseDC(0, DC);
  {Delete the bitmap}
  DeleteObject(MemBitmap);

  {Start print job}
  Printer.BeginDoc;

  {Scale print size }
  ScaleX := Self.Width*3;
  ScaleY := Self.Height*3;

  {Just incase the printer drver is a palette device}
  isDcPalDevice := False;
  if GetDeviceCaps(Printer.Canvas.Handle, RASTERCAPS) and RC_PALETTE=RC_PALETTE
                   then
  begin
    {Create palette from dib}
    GetMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    FillChar(pPal^, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)),
             #0);
    pPal^.palVersion := $300;
    pPal^.palNumEntries := 256;
    for i := 0 to (pPal^.palNumEntries-1) do
    begin
      pPal^.palPalEntry[i].peRed := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbRed;
      pPal^.palPalEntry[i].peGreen := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbGreen;
      pPal^.palPalEntry[i].peBlue := PBitmapInfo(pDibHeader)^.bmiColors[i].rgbBlue;
    end;
    pal := CreatePalette(pPal^);
    FreeMem(pPal, SizeOf(TLOGPALETTE)+(255*SizeOf(TPALETTEENTRY)));
    OldPal := SelectPalette(Printer.Canvas.Handle, pal, False);
    isDcPalDevice := True
  end;
  {send the bits to the printer}
  StretchDiBits(Printer.Canvas.Handle, 0, 0, Round(ScaleX), Round(ScaleY),
                0, 0, Self.Width, Self.Height, pBits, PBitmapInfo(pDibHeader)^,
                DIB_RGB_COLORS, SRCCOPY);

  {Just incase you printer drver is a palette device}
  if isDcPalDevice=True then
  begin
    SelectPalette(Printer.Canvas.Handle, OldPal, False);
    DeleteObject(pal);
  end;
  {Clean up allocated memory}
  GlobalUnlock(hBits);
  GlobalFree(hBits);
  GlobalUnlock(hDibHeader);
  GlobalFree(hDibHeader);

  {end the print job}
  Printer.EndDoc;
end;

procedure TPBEnqJobPriceFrm.SupplierPricesGridDblClick(Sender: TObject);
begin
  {This combo box can only be disabled if the screen is in view mode} ;      
  If not JobUnitCombo.Enabled then
        exit ;
  PBEnqJobDtlsFrm.show;
end;

procedure TPBEnqJobPriceFrm.ApplysamemarkupClick(Sender: TObject);
begin
  SameMarkupForAll := not (ApplySameMarkup.checked);
end;

procedure TPBEnqJobPriceFrm.ApplysamePriceUnitClick(
  Sender: TObject);
begin
  SamePriceUnitForAll := not (ApplySamePriceUnit.checked);
end;

procedure TPBEnqJobPriceFrm.PricesPopUpPopup(Sender: TObject);
begin
  Applysamemarkup.Checked := (SameMarkupForAll);
  ApplysamePriceUnit.Checked := (SamePriceUnitForAll);
end;

procedure TPBEnqJobPriceFrm.SupplierROPricesGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[ACol, ARow]);
    end;
  end;
  {If Heading Display Left justified in the cells}
  with SupplierROPricesGrid do
  begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[ACol, ARow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end;
end;

procedure TPBEnqJobPriceFrm.SelectedROPricesGridDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (ARow <> 0) then
    begin
      Canvas.Brush.Color := Color;
      if (ARow = 1) then
        Canvas.font.Color := clRed
      else
        Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[ACol, ARow]);
    end;
  end;

  {If Heading Display Left justified in the cells}
  with SelectedROPricesGrid do
  begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[ACol, ARow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end;

end;

procedure TPBEnqJobPriceFrm.SelectedROPricesGridExit(Sender: TObject);
var
  icol, irow: integer;
begin
  {Format any numeric values}
  with Sender as TStringGrid do
    begin
    for icol := 0 to pred(colcount) do
      for irow := 1 to 3 do
        begin
          if cells[icol, irow] = '' then continue;
          cells[icol, irow] := formatfloat('0.000',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
        end;
    end;

end;

procedure TPBEnqJobPriceFrm.SelectedROPricesGridKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;
  case key of
    {    				'0'..'9' : IF (P>0) AND (L-P>1) THEN Key := #0;
    }
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    '-':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBEnqJobPriceFrm.SelectedROPricesGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  icol, irow: Integer;
begin
  irow := SelectedROPricesGrid.Row;
  icol := SelectedROPricesGrid.Col;

  with SelectedROPricesGrid do
  begin

    if (Cells[iCol, iRow] = '') or
      (Cells[iCol, iRow] = '.')
      then Cells[iCol, iRow] := FloatToStr(0.000);

    if (Cells[iCol, iRow] = '-') then Exit;

    if (iRow = 0) or (iRow = 1) then {Changing Selling Price}
      CalcROMarkup(1, 0.000, 0)
    else
      if iRow = 2 then {Changing Markup %}
        CalcROMarkup(2, StrToFloatDef(Cells[icol, irow], 0, FormatSettings), icol)
      else
        CalcROMarkup(3, 0.000, 0); {Changing Markup Value}
    EnquiryLineGrid.Cells[3,iline] := cells[0,0];
    EnquiryLineGrid.Cells[4,iline] := cells[0,1];
  end;
end;

procedure TPBEnqJobPriceFrm.SelectedROPricesGridSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  irow, icol: integer;
begin
  with selectedROPricesGrid do
  begin
    if (Cells[0, 0] = '') or (not JobUnitCombo.Enabled)  then
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing]
    else
      Options := [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine,
        goColSizing, goEditing]
  end;

  {Format any numeric values}
  with Sender as TStringGrid do
    begin
    for icol := 0 to pred(colcount) do
      for irow := 1 to 3 do
        begin
          if cells[icol, irow] = '' then continue;
          cells[icol, irow] := formatfloat('0.000',StrToFloatDef(cells[icol,irow], 0, FormatSettings));
        end;
    end;
end;

procedure TPBEnqJobPriceFrm.SetDefaultMarkup(const Value: real);
begin
  FDefaultMarkup := Value;
end;

procedure TPBEnqJobPriceFrm.FormActivate(Sender: TObject);
begin
{Do the screen access stuff} ;
  dmBroker.ScreenAccessControl(Self,'mnuEnquiries',frmpbMainMenu.iOperator,iDataOp,iDataRep) ;
end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridTopLeftChanged(
  Sender: TObject);
begin
  SupplierPricesGrid.LeftCol := SelectedPricesGrid.LeftCol;
end;

procedure TPBEnqJobPriceFrm.SupplierPricesGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  icol: integer;
begin
  for icol := 0 to SupplierPricesGrid.colcount - 1 do
    SelectedPricesGrid.colwidths[icol] := SupplierPricesGrid.colwidths[icol];
end;

procedure TPBEnqJobPriceFrm.SelectedPricesGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  icol: integer;
begin
  for icol := 0 to SelectedPricesGrid.colcount - 1 do
    SupplierPricesGrid.colwidths[icol] := SelectedPricesGrid.colwidths[icol];
end;

end.
