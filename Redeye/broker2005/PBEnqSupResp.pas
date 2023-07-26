(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Update Supplier Responses form.

VSS Info:
$Header: /PBL D5/PBEnqSupResp.pas 17    6/08/:3 12:41 Janiner $
$History: PBEnqSupResp.pas $
 * 
 * *****************  Version 17  *****************
 * User: Janiner      Date: 6/08/:3    Time: 12:41
 * Updated in $/PBL D5
 * Bug when saving responses .
 * Was using count from supplieritems as loop when the number of suppliers
 * for the various enquiry lines may differ.  i.e. was saving the count
 * from the last line (number of suppliers) and tried to relate that to
 * each enquiry line thus resulting in '' is not a valid integer value.
 * 
 * *****************  Version 16  *****************
 * User: Andrewh      Date: 20/06/03   Time: 15:10
 * Updated in $/PBL D5
 * Screen access permissions for Rep and Operator.
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 15/05/:3   Time: 16:43
 * Updated in $/PBL D5
 * Added Decline to Quote functionality
 * 
 * *****************  Version 14  *****************
 * User: Paul         Date: 13/05/:3   Time: 16:20
 * Updated in $/PBL D5
 * Can now delete a supplier response
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 6/01/:3    Time: 14:53
 * Updated in $/PBL D5
 * Changed to display and to maintain optional charges
 * 
 * *****************  Version 12  *****************
 * User: Paul         Date: 16/10/:2   Time: 14:14
 * Updated in $/PBL D5
 * Added functionality to use the default markup from the Customer Default
 * Markup
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 16/10/:2   Time: 11:46
 * Updated in $/PBL D5
 * Changed to show the Supplier phone number alongside the name
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 12/09/:2   Time: 10:26
 * Updated in $/PBL D5
 * Added facility to maintain Run On Qty
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 17/10/:0   Time: 14:01
 * Updated in $/PBL D5
 * Changed to format the values on Selectcell event
 * 
 * *****************  Version 8  *****************
 * User: Janiner      Date: 12/10/:0   Time: 11:47
 * Updated in $/PBL D5
 * Standardise formatdatetime to use PBDatestr in PBPOObjects, which
 * formats the date based on the selections in the control panel, regional
 * settings, data, short style.
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 4/10/:0    Time: 13:18
 * Updated in $/PBL D5
 * allow '' in date till checked in checkok
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 3/10/:0    Time: 14:07
 * Updated in $/PBL D5
 * Allow input of response date, ensure that the date is set correctly to
 * enable responses to be saved.
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 28/09/:0   Time: 11:22
 * Updated in $/PBL D5
 * Changed to use a standard Additional Charges maintenance and lookup
 * selection form
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 30/06/:0   Time: 9:43
 * Updated in $/PBL D5
 * Changed to set the Enquiry Line status to 45 if only part prices set.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 17/01/:0   Time: 10:59
 * Updated in $/PBL D5
 * Removed the Enquiry Lookup button which was not required
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 13/01/:0   Time: 15:00
 * Updated in $/PBL D5
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqSupResp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, DB, ExtCtrls, PBPOObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqSupRespFrm = class(TForm)
    Label1: TLabel;
    EnquiryEdit: TEdit;
    Label2: TLabel;
    CustNameEdit: TEdit;
    Label3: TLabel;
    BranchNameEdit: TEdit;
    Label4: TLabel;
    DescEdit: TEdit;
    EnquiryLineListBox: TListBox;
    Label5: TLabel;
    SupplierPricesGrid: TStringGrid;
    Label7: TLabel;
    SaveBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    BitBtn3: TBitBtn;
    PUnitCombo: TComboBox;
    PUnitSQL: TFDQuery;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label12: TLabel;
    ResponseList: TListBox;
    ResponseCodeList: TListBox;
    UpEnqSuppSQL: TFDQuery;
    UpEnqSuppQtySQL: TFDQuery;
    EnquiryLineGrid: TStringGrid;
    EnqHeadSQL: TFDQuery;
    SelectedSuppliersGroup: TGroupBox;
    Label6: TLabel;
    SupplierCombo: TComboBox;
    Label9: TLabel;
    SuppBranchEdit: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    SuppDateEdit: TEdit;
    SuppRefEdit: TEdit;
    Label13: TLabel;
    ResponseDateBtn: TSpeedButton;
    Label8: TLabel;
    SupplierMemo: TMemo;
    Bevel3: TBevel;
    AddChargesEdit: TMemo;
    AddEnqSuppQtySQL: TFDQuery;
    AddEnqQtySQL: TFDQuery;
    UpEnqLineSQL: TFDQuery;
    UpEnqHeadSQL: TFDQuery;
    SpeedButton3: TButton;
    SpeedButton2: TBitBtn;
    AddChargesGrid: TStringGrid;
    lblRunOnQty: TLabel;
    edtRunOnQty: TEdit;
    lblRunOnCost: TLabel;
    memRunOnCost: TMemo;
    btnDelete: TBitBtn;
    DelEnqSuppQtySQL: TFDQuery;
    chkbxDecline: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SupplierPricesGridDrawCell(Sender: TObject; vCol,
      vRow: Longint; Rect: TRect; State: TGridDrawState);
    procedure PUnitComboDropDown(Sender: TObject);
    procedure SupplierPricesGridClick(Sender: TObject);
    procedure PUnitComboClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure PUnitComboExit(Sender: TObject);
    procedure EnquiryLineListBoxClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SupplierPricesGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SupplierMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ResponseDateBtnClick(Sender: TObject);
    procedure SupplierComboChange(Sender: TObject);
    procedure SuppRefEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ResponseListClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SaveBitBtnClick(Sender: TObject);
    procedure PUnitComboKeyPress(Sender: TObject; var Key: Char);
    procedure EnquiryEditKeyPress(Sender: TObject; var Key: Char);
    procedure SupplierPricesGridKeyPress(Sender: TObject; var Key: Char);
    procedure SupplierPricesGridSelectCell(Sender: TObject; Col,
      Row: Longint; var CanSelect: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EnquiryLineGridClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PUnitComboEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GetEnquiryDetails;
    procedure SuppDateEditExit(Sender: TObject);
    procedure SupplierPricesGridExit(Sender: TObject);
    procedure memRunOnCostKeyPress(Sender: TObject; var Key: Char);
    procedure memRunOnCostExit(Sender: TObject);
    procedure memRunOnCostEnter(Sender: TObject);
    procedure memRunOnCostChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure chkbxDeclineClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    sOldValue: string;
    procedure ClearPrices;
    procedure Initialise;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
    procedure GetEnquiryHeadDetails;
    procedure GetEnquiryLineDetails;
    procedure ClearScreen;
    procedure CreateSupplierGrid;
    procedure GetEnquiryLineSuppliers;
    procedure CreateSupplierQtyGrid(irow: Integer);
    procedure CreateSupplierChargesGrid(irow: Integer);
    procedure GetEnquirySupplierQtys(irow: Integer);
    procedure CheckResponses;
    procedure UpSupplierAddCharges(iline: Integer; irow: Integer);
    procedure UpSupplierQtyDetails(iline: Integer; irow: Integer);
    function ExistingEnquiry(iEnquiry: Integer): boolean;
    procedure LoadPriceUnitCombo(MyCombo: TComboBox);
    procedure UpEnquiryLine(iLine: Integer; istatus: integer);
    procedure UpEnquiryHeader(iStatus: Integer);
    function QtyExists(iNewQty: Integer): boolean;
    procedure GetEnquirySupplierAddCharges(irow: integer);
    procedure UpdateAddChargesGrid;
    procedure ClearAddChargesGrid;

  public
    { Public declarations }
    iEnqNumber, iDataRep, iDataOp: Integer;
    EnqStatus: integer;
  end;

var
  PBEnqSupRespFrm: TPBEnqSupRespFrm;
  dResponse_Date: TDateTime;

implementation

uses PBEnqSuppDataMod, PBEnqSupTmp, DateSelV5, PBLUEnqAddChg, PBEnqRespQty,
  pbDatabase, pbMainMenu;

var
  iline: Integer;
  QtyGrid, SuppGrid, ChargesGrid: TStringGrid;
  bMoved: boolean;

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

procedure TPBEnqSupRespFrm.Initialise;
begin
  dResponse_Date := Now;

  {Set the headings for the Supplier Qty Grid}
  SupplierPricesGrid.Cells[0, 0] := 'Quantity';
  {  SupplierPricesGrid.Cells[1,0] := 'Response Qty';
   } SupplierPricesGrid.Cells[1, 0] := 'Price';
  SupplierPricesGrid.Cells[2, 0] := 'Price Unit';

  EnquiryLineGrid.Cells[1, 0] := 'Description';

  SelectedSuppliersGroup.Enabled := False;
  SupplierPricesGrid.Enabled := False;

  SaveBitBtn.Enabled := False;
  CancelBitBtn.Enabled := False;
  {  EnquiryEdit.setfocus;
  }
end;

procedure TPBEnqSupRespFrm.FormShow(Sender: TObject);
begin
  {	Initialise;
  }
end;

procedure TPBEnqSupRespFrm.SupplierPricesGridDrawCell(Sender: TObject; vCol,
  vRow: Longint; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (vRow <> 0) and (vCol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
    end;
  end;
  {If Heading Display Left justified in the cells}
  with SupplierPricesGrid do
  begin
    if vCol = 0 then
    begin
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;

end;

procedure TPBEnqSupRespFrm.GetEnquiryDetails;
begin
  Initialise;
  GetEnquiryHeadDetails;
  GetEnquiryLineDetails;

  {Now select the first line of the enquiry}
  if EnquirylineListBox.Items.Count > 0 then
  begin
    EnquiryLineGrid.Row := 1;
    EnquirylineListBox.itemindex := 0;
    EnquiryLineListBoxClick(Self);

    SelectedSuppliersGroup.Enabled := True;
    SupplierPricesGrid.Enabled := True;
    SaveBitBtn.Enabled := True;
    CancelBitBtn.Enabled := True;
  end;
end;

procedure TPBEnqSupRespFrm.GetEnquiryHeadDetails;
begin
  {Retrieve the Header details and display}
  PBEnqSuppDataModFrm.EnqHeadSQL.Close;
  PBEnqSuppDataModFrm.EnqHeadSQL.ParamByName('enquiry').AsInteger :=
    StrToInt(EnquiryEdit.Text);
  PBEnqSuppDataModFrm.EnqHeadSQL.Open;

  CustNameEdit.Text :=
    PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Customer_Name').AsString;
  BranchNameEdit.Text :=
    PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Branch_Name').AsString;
  DescEdit.Text :=
    PBEnqSuppDataModFrm.EnqHeadSQl.FieldByName('Description').AsString;

end;

procedure TPBEnqSupRespFrm.GetEnquiryLineDetails;
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
    EnquiryLineGrid.Cells[2, iline] :=
      PBEnqSuppDataModFrm.EnqLineSQL.FieldByName('Enquiry_Status').AsString;

    {Get the Supplier details for this line}
    CreateSupplierGrid;
    GetEnquiryLineSuppliers;
    PBEnqSuppDataModFrm.EnqLineSQL.Next;
  end;
end;

procedure TPBEnqSupRespFrm.GetEnquiryLineSuppliers;
var
  icount: Integer;
  SuppGrid: TStringGrid;
begin
  SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 + iline),
    2, 2)) as TStringGrid;
  SuppGrid.RowCount := PBEnqSuppDataModFrm.EnqSuppSQL.RecordCount + 1;

  PBEnqSuppDataModFrm.EnqSuppSQL.First;

  icount := 1;
  while (not PBEnqSuppDataModFrm.EnqSuppSQL.EOF) do
  begin
    SuppGrid.Cells[0, icount] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Name').AsString;
    if PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Act_Response_date').AsString
      =
      '' then
      SuppGrid.Cells[1, icount] := ''
    else
      SuppGrid.Cells[1, icount] :=
        PBDatestr(PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Act_Response_date').AsDateTime);

    SuppGrid.Cells[2, icount] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Supplier_Reference').AsString;
    SuppGrid.Cells[3, icount] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Supplier').AsString;
    SuppGrid.Cells[4, icount] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Branch_No').AsString;
    SuppGrid.Cells[5, icount] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Delivery_Comment').AsString;
    SuppGrid.Cells[6, icount] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Name_1').AsString;
    SuppGrid.Cells[7, icount] := formatfloat('0.000',
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Amount').AsFloat);
    SuppGrid.Cells[8, icount] :=
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Run_On_Quantity').AsString;
    SuppGrid.Cells[9, icount] := formatfloat('0.000',
      PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Run_on_Price').AsFloat);
    SuppGrid.Cells[10, icount] := PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Phone').Asstring;
    SuppGrid.Cells[11, icount] := PBEnqSuppDataModFrm.EnqSuppSQL.FieldByName('Decline_to_Quote').Asstring;

    {Get the Additional charges}
    CreateSupplierChargesGrid(icount);
    GetEnquirySupplierAddCharges(icount);

    {Get the Supplier Qty Grid}
    CreateSupplierQtyGrid(icount);
    GetEnquirySupplierQtys(icount);
    PBEnqSuppDataModFrm.EnqSuppSQL.Next;
    inc(icount);
  end;
end;

procedure TPBEnqSupRespFrm.GetEnquirySupplierAddCharges(irow: integer);
var
  icount: integer;
begin
  with PBEnqSuppDataModFrm.EnqSuppChgsSQL do
    begin
      ChargesGrid := PBEnqSupTmpFrm.findcomponent('Charges' + Copy(IntToStr(100 + iline), 2,
            2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;
      ChargesGrid.RowCount := RecordCount + 1;

      First;
      icount := 0;
      while (not EOF) do
        begin
          inc(icount);
          ChargesGrid.cells[0,icount] := fieldbyname('Additional_Charge').asstring;
          ChargesGrid.cells[1,icount] := fieldbyname('Details').asstring;
          ChargesGrid.cells[2,icount] := formatfloat('0.000',fieldbyname('Amount').asfloat);
          ChargesGrid.cells[3,icount] := formatfloat('0.000',fieldbyname('Quotation_Price').asfloat);
          ChargesGrid.cells[4,icount] := fieldbyname('Charge_type').asstring;
          next;
        end;
    end;
end;

procedure TPBEnqSupRespFrm.CheckResponses;
var
  irow: Integer;
begin
  {Compile a list of those suppliers yet to respond}
  ResponseList.Clear;
  ResponseCodeList.Clear;
  for irow := 1 to suppgrid.RowCount do
  begin
    if SuppGrid.Cells[0, irow] = '' then Continue;
    if (SuppGrid.Cells[1, irow] <> '') or (SuppGrid.Cells[11, irow] = 'Y') then
      Continue
    else
    begin
      ResponseList.Items.Add(suppGrid.Cells[0, irow] + ' - ' + suppGrid.Cells[10, irow]);
      ResponseCodeList.Items.Add(IntToStr(irow - 1));
    end;
  end;
end;

procedure TPBEnqSupRespFrm.GetEnquirySupplierQtys(irow: Integer);
var
  icount: Integer;
  QtyGrid: TStringGrid;
begin
  QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;
  QtyGrid.RowCount := PBEnqSuppDataModFrm.EnqSuppQtySQL.RecordCount + 1;

  PBEnqSuppDataModFrm.EnqSuppQtySQL.First;

  icount := 1;
  while (not PBEnqSuppDataModFrm.EnqSuppQtySQL.EOF) do
  begin
    {Update the Qty Grid with the associated values}
    QtyGrid.Cells[0, icount] :=
      PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Quantity').AsString;
    {        QtyGrid.cells[1,icount] := PBEnqSuppDataModFrm.EnqSuppQtySQL.fieldbyname('Response_Quantity').asstring;
    }
    if PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Supplier_Price').AsString
      <> '' then
      QtyGrid.Cells[1, icount] := formatfloat('0.000',
        PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Supplier_Price').AsFloat)
    else
      QtyGrid.Cells[1, icount] :=
        PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Supplier_Price').AsString;

    QtyGrid.Cells[2, icount] :=
      PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Price_Unit_Description').AsString;
    QtyGrid.Cells[3, icount] :=
      PBEnqSuppDataModFrm.EnqSuppQtySQL.FieldByName('Price_Unit').AsString;
    PBEnqSuppDataModFrm.EnqSuppQtySQL.Next;
    inc(icount);
  end;
end;

procedure TPBEnqSupRespFrm.CreateSupplierGrid;
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
      DefaultColWidth := 160;
      DefaultRowHeight := 20;
      FixedCols := 0;
      FixedRows := 1;
      Colcount := 8;
      RowCount := 2;
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

procedure TPBEnqSupRespFrm.CreateSupplierQtyGrid(irow: Integer);
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
      FixedRows := 1;
      Colcount := 5;
      RowCount := 2;
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

procedure TPBEnqSupRespFrm.CreateSupplierChargesGrid(irow: Integer);
var
  MyStringGrid: TStringGrid;
begin
  {create the Suppliers Grid}
  MyStringGrid := TStringGrid.Create(PBEnqSupTmpFrm);
  try
    with MyStringGrid do
    begin
      Parent := PBEnqSupTmpFrm;
      Name := 'Charges' + Copy(IntToStr(100 + iline), 2, 2) + Copy(IntToStr(100 +
        irow), 2, 2);
      Left := 360;
      DefaultColWidth := 160;
      DefaultRowHeight := 20;
      FixedCols := 1;
      FixedRows := 1;
      Colcount := 5;
      RowCount := 2;
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

procedure TPBEnqSupRespFrm.ClearScreen;
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

  {Clear down all the Supplier Price details}
  for irow := 0 to SupplierPricesGrid.RowCount - 1 do
  begin
    for icol := 0 to SupplierPricesGrid.colcount - 1 do
    begin
      SupplierPricesGrid.Cells[icol, irow] := '';
    end;
  end;
  SupplierPricesGrid.RowCount := 2;

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

procedure TPBEnqSupRespFrm.PUnitComboDropDown(Sender: TObject);
begin
  LoadPriceUnitCombo(PUnitCombo);
end;

procedure TPBEnqSupRespFrm.LoadPriceUniTCombo(MyCombo: TComboBox);
var
  stext: string;
begin
  PUnitSQL.Close;
  // Check against the status to see whether need to list all price units
  // if status is zero then will show all price units
  // if status is 75 then purchase order raised
  if EnqStatus >= 75 then
    PUnitSQL.SQL.Text := OrigPriceUnit
  else
    PUnitSQL.SQL.Text := PriceUnit;
  PUnitSQL.Open;

  stext := MyCombo.Text;

  MyCombo.Clear;

  PUnitSQL.First;

  while (not PUnitSQL.EOF) do
  begin
    MyCombo.Items.Add(PUnitSQL.FieldByName('Description').AsString);
    PUnitSQL.Next;
  end;

  MyCombo.Itemindex := MyCombo.Items.IndexOf(sText);
end;

procedure TPBEnqSupRespFrm.SupplierPricesGridClick(Sender: TObject);
begin
  with SupplierPricesGrid do
  begin
    if Col = 2 then
    begin
      PUnitCombo.Top := celltop(SupplierPricesGrid, Row);
      PUnitCombo.Left := cellleft(SupplierPricesGrid, Col);

      if SupplierPricesGrid.Cells[Col, Row] = '' then
      begin
        Cells[2, Row] := PunitCombo.Text;
        QtyGrid.Cells[2, Row] := Cells[2, Row];
        {Get the Price Unit code}
        PUnitSQL.First;
        PUnitSQl.moveby(PUnitCombo.itemindex);
        QtyGrid.Cells[3, Row] := PUnitSQl.FieldByName('Price_Unit').AsString;
      end;
      PUnitCombo.bringtofront;
      PUnitCombo.Visible := True;
      If PUnitCombo.Enabled then
        PUnitCombo.SetFocus;
    end
    else
    begin
      PUnitCombo.sendtoback;
      PUnitCombo.Visible := False;
    end
  end;
end;

function TPBEnqSupRespFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;
  for i := 0 to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t
end;

function TPBEnqSupRespFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t;

end;

procedure TPBEnqSupRespFrm.PUnitComboClick(Sender: TObject);
begin
  SupplierPricesGrid.Cells[2, SupplierPricesGrid.Row] :=
    PUnitCombo.Items[PunitCombo.Itemindex];
  QtyGrid.Cells[2, SupplierPricesGrid.Row] := SupplierPricesGrid.Cells[2,
    SupplierPricesGrid.Row];

  {Get the Price Unit code}
  PUnitSQL.First;
  PUnitSQl.moveby(PUnitCombo.itemindex);
  QtyGrid.Cells[3, SupplierPricesGrid.Row] :=
    PUnitSQl.FieldByName('Price_Unit').AsString;
end;

procedure TPBEnqSupRespFrm.CancelBitBtnClick(Sender: TObject);
begin
  {	ClearScreen;
  } Close;
end;

procedure TPBEnqSupRespFrm.PUnitComboExit(Sender: TObject);
begin
  PUnitCombo.Visible := False;
end;

procedure TPBEnqSupRespFrm.EnquiryLineListBoxClick(Sender: TObject);
var
  icount: Integer;
begin
  {Don't try to get any details if there are no lines on the enquiry}
  if EnquiryLineListbox.Items.Count = 0 then Exit;

  iline := EnquiryLineListBox.itemindex + 1;

  {Get the relevant Supplier Grid and feed the details into the main grid}
  SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 + iline),
    2, 2)) as TStringGrid;

  SupplierCombo.Clear;

  with SuppGrid do
  begin
    for icount := 1 to SuppGrid.RowCount do
    begin
      if SuppGrid.Cells[0, icount] = '' then Continue;
      SupplierCombo.Items.Add(SuppGrid.Cells[0, icount] + ' - ' + SuppGrid.Cells[10, icount]);
    end;
  end;
  {Display the Supplier details}
  SupplierCombo.itemindex := 0;
  SupplierComboChange(Self);

  Checkresponses;
end;

procedure TPBEnqSupRespFrm.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TPBEnqSupRespFrm.FormCreate(Sender: TObject);
begin
  PBEnqSupTmpFrm := TPBEnqSupTmpFrm.Create(Self);
  {Create the form which gets all the enquiry data}
  PBEnqSuppDataModFrm := TPBEnqSuppDataModFrm.Create(Self);

  PUnitComboDropDown(Self);
end;

procedure TPBEnqSupRespFrm.FormDestroy(Sender: TObject);
begin
  PBEnqSupTmpFrm.Free;

end;

procedure TPBEnqSupRespFrm.SupplierPricesGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  irow: Integer;
begin
  irow := SupplierCombo.itemindex + 1;

  QtyGrid.Cells[supplierPricesGrid.Col, supplierPricesGrid.Row] :=
    SupplierPricesGrid.Cells[supplierPricesGrid.Col, supplierPricesGrid.Row];

  {Default the date to todays date if date doesn't exist}
  if SuppDateEdit.Text = '' then
  begin
    SuppDateEdit.Text := PBDateStr(Date);
    SuppGrid.Cells[1, irow] := SuppDateEdit.Text;
  end;
end;

procedure TPBEnqSupRespFrm.SupplierMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  irow: Integer;
begin
  irow := SupplierCombo.itemindex + 1;
  {	SuppGrid.cells[5,supplierGrid.row] := SupplierMemo.text;
  }
  SuppGrid.Cells[5, irow] := SupplierMemo.Text;

end;

procedure TPBEnqSupRespFrm.ResponseDateBtnClick(Sender: TObject);
var
  irow: Integer;
  DateSelV5Form: TDateSelV5Form;
begin
  irow := SupplierCombo.itemindex + 1;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := dResponse_Date;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      dResponse_Date := DateSelV5Form.Date;
      SuppDateEdit.Text := PBDatestr(dResponse_Date);
      SuppGrid.Cells[1, irow] := SuppDateEdit.Text;
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBEnqSupRespFrm.SupplierComboChange(Sender: TObject);
var
  irow, icount: Integer;
  iTotValue: real;
begin
  if SupplierCombo.Items.Count = 0 then
  begin
    ClearPrices;
    Exit;
  end;
  SupplierPricesGrid.Enabled := True;
  SelectedSuppliersGroup.Enabled := True;
  irow := SupplierCombo.itemindex + 1;

  SuppBranchEdit.Text := suppGrid.Cells[6, irow];
  SuppRefEdit.Text := suppGrid.Cells[2, irow];
  SuppDateEdit.Text := suppGrid.Cells[1, irow];
  SupplierMemo.Text := SuppGrid.Cells[5, irow];
  chkBxDecline.checked := (suppgrid.cells[11, irow] = 'Y');

  edtRunOnQty.Text := SuppGrid.Cells[8, irow];
  memRunOnCost.Text := SuppGrid.Cells[9, irow];

  {Find the relevant Qty Grid}
  QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;

  SupplierPricesGrid.RowCount := QtyGrid.RowCount;
  with QtyGrid do
  begin
    for icount := 1 to QtyGrid.RowCount do
    begin
      SupplierPricesGrid.Cells[0, icount] := QtyGrid.Cells[0, icount];
      SupplierPricesGrid.Cells[1, icount] := QtyGrid.Cells[1, icount];
      SupplierPricesGrid.Cells[2, icount] := QtyGrid.Cells[2, icount];
      SupplierPricesGrid.Cells[3, icount] := QtyGrid.Cells[3, icount];
    end;
  end;

  lblRunOnQty.visible := (QtyGrid.rowcount = 2) and (QtyGrid.cells[0,1] <> '');
  edtRunOnQty.visible := (QtyGrid.rowcount = 2) and (QtyGrid.cells[0,1] <> '');
  lblRunOnCost.visible := (QtyGrid.rowcount = 2) and (QtyGrid.cells[0,1] <> '');
  memRunOnCost.visible := (QtyGrid.rowcount = 2) and (QtyGrid.cells[0,1] <> '');

  {Find the relevant Charges Grid}
  ChargesGrid := PBEnqSupTmpFrm.findcomponent('Charges' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;

  {Build up the additional charges and total}
  if AddChargesGrid.rowcount > 1 then
  begin
    for icount := 1 to pred(AddChargesGrid.rowcount) do
    begin
      AddChargesGrid.Cells[0, icount] := '';
      AddChargesGrid.Cells[1, icount] := '';
      AddChargesGrid.Cells[2, icount] := '';
      AddChargesGrid.Cells[3, icount] := '';
      AddChargesGrid.Cells[4, icount] := '';
    end;
  end;

  AddChargesGrid.RowCount := ChargesGrid.RowCount;
  iTotValue := 0.000;
  with ChargesGrid do
  begin
    for icount := 1 to ChargesGrid.RowCount - 1 do
    begin
      if ChargesGrid.cells[1, icount] = '' then break;
      AddChargesGrid.Cells[0, icount] := ChargesGrid.Cells[0, icount];
      AddChargesGrid.Cells[1, icount] := ChargesGrid.Cells[1, icount];
      AddChargesGrid.Cells[2, icount] := ChargesGrid.Cells[2, icount];
      AddChargesGrid.Cells[3, icount] := ChargesGrid.Cells[3, icount];
      AddChargesGrid.Cells[4, icount] := ChargesGrid.Cells[4, icount];
      iTotValue := iTotValue + StrToFloat(AddChargesGrid.Cells[2, icount]);
    end;
  end;
  AddChargesEdit.Text := formatfloat('0.000',iTotValue);
  btnDelete.enabled := (SuppDateEdit.Text <> '');
end;

procedure TPBEnqSupRespFrm.ClearPrices;
var
  irow, icol, icount: Integer;
begin
  with SupplierPricesGrid do
  begin
    for irow := 1 to RowCount - 1 do
      for icol := 0 to colcount - 1 do
        Cells[icol, irow] := '';
    Enabled := False;
  end;

  for icount := ComponentCount - 1 downto 0 do
  begin
    if Components[icount].tag <> 1 then Continue;
    if Components[icount] is TMemo then
      TMemo(Components[icount]).Clear;

    if Components[icount] is TEdit then
      TEdit(Components[icount]).Clear;
  end;
  SelectedSuppliersGroup.Enabled := False;
end;

procedure TPBEnqSupRespFrm.SuppRefEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  irow: Integer;
begin
  irow := SupplierCombo.itemindex + 1;
  SuppGrid.Cells[2, irow] := SuppRefEdit.Text;

  {Default the date to todays date if date doesn't exist}
  if SuppDateEdit.Text = '' then
  begin
    SuppDateEdit.Text := PBDateStr(Date);
    SuppGrid.Cells[1, irow] := SuppDateEdit.Text;
  end;
end;

procedure TPBEnqSupRespFrm.ResponseListClick(Sender: TObject);
begin
  SupplierCombo.itemindex :=
    StrToInt(ResponseCodeList.Items[ResponseList.itemindex]);
  SupplierCombochange(Self)
end;

procedure TPBEnqSupRespFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      with TStringGrid(ActiveControl) do
      begin
        if bMoved then
        begin
          bMoved := False;
          Exit;
        end;
        if Cells[1, Row] = '' then
        begin
          Key := #0; { eat enter key }
          Perform(WM_NEXTDLGCTL, 0, 0); { move to next control }
          Exit;
        end
        else
          (*           	if (Row = (Rowcount-1)) and (col = 2) then  { increment the field }
                         begin
                       Row := 1;
                           col := 1;
                           exit;
                           end
                        else
                       *) if Col < 2 then
          begin
            Col := Col + 1;
            Exit;
          end
            (*              else
                          if col = 2 then
                           begin
                             col := 1;
                           row := row + 1;
                             exit;
                             end;
                      *)
      end;

end;

procedure TPBEnqSupRespFrm.SaveBitBtnClick(Sender: TObject);
var
  irow, myLine: Integer;
  iResponded: integer;
begin
  if MessageDlg('Do you want to save these Supplier responses?', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
  begin
    Exit;
  end;

  Checkresponses;

  {Update the Enquiry Supplier and Enquiry Supplier Quantity tables}
  for myLine := 1 to enquiryLineListBox.Items.Count do
  begin
    iLine := myLine;
    {Get the relevant Supplier Grid and feed the details into the main grid}
    SuppGrid := PBEnqSupTmpFrm.findcomponent('Grid' + Copy(IntToStr(100 +
      iline), 2, 2)) as TStringGrid;

    iresponded := 0;

    for irow := 1 to SuppGrid.Rowcount - 1 do
    //Suppliercombo.Items.Count do
    // bug : cannot use count above as this is the count of the suppliers of the last
    // enquiry line which may be more than the no. of suppliers for this line
    begin
//      if SuppGrid.Cells[1, irow] = '' then Continue;
      UpEnqSuppSQL.Close;
      UpEnqSuppSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);
      UpEnqSuppSQL.ParamByName('Line').AsInteger := iline;
      UpEnqSuppSQL.ParamByName('Supplier').AsInteger := StrToInt(SuppGrid.Cells[3, irow]);
      UpEnqSuppSQL.ParamByName('Branch').AsInteger := StrToInt(SuppGrid.Cells[4,
        irow]);
      if SuppGrid.Cells[1,irow] = '' then
        begin
          UpEnqSuppSQL.ParamByName('Date').clear
        end
      else
        begin
          iresponded := iresponded + 1;
          UpEnqSuppSQL.ParamByName('Date').AsDateTime := StrToDate(SuppGrid.Cells[1,irow]);
        end;
      UpEnqSuppSQL.ParamByName('Comment').AsString := SuppGrid.Cells[5, irow] +
        ' ';
      UpEnqSuppSQL.ParamByName('Reference').AsString := SuppGrid.Cells[2, irow]
        +
        ' ';
      if SuppGrid.Cells[9, irow] = '' then
        UpEnqSuppSQL.ParamByName('Run_on_Price').clear
      else
        UpEnqSuppSQL.ParamByName('Run_on_Price').Asfloat := strtofloat(SuppGrid.Cells[9, irow]);

      UpEnqSuppSQL.ParamByName('Decline_to_Quote').asstring := SuppGrid.cells[11,irow];
      UpEnqSuppSQL.ExecSQL;

      UpSupplierAddCharges(iline, irow);
      {Update the Enquiry Supplier Qty details}
      UpSupplierQtyDetails(iline, irow);
    end;
    if strtoint(EnquiryLineGrid.cells[2,iLine]) <= 40 then
      begin
        if iresponded = 0 then
          UpEnquiryLine(iline,30)
        else
        if iresponded < SuppGrid.Rowcount -1 then
        //Suppliercombo.Items.Count then
          UpEnquiryLine(iLine,35)
        else
          UpEnquiryLine(iLine,40);
      end;
  end;

  {Determine if all Responses have been recieved and update Enquiry header accordingly}
  if ResponseList.Items.Count = 0 then
    {fully received all responses}
    UpEnquiryHeader(40)
  else
  if ResponseList.Items.Count = SupplierCombo.items.count then
    {No one responded}
    UpEnquiryHeader(30)
  else
    {part received responses}
    UpEnquiryHeader(35);

  {Clear the screen and prompt for enquiry}
{  clearscreen;
} PBEnqSupRespFrm.ModalResult := mrOK;
end;

procedure TPBEnqSupRespFrm.UpEnquiryLine(iLine: Integer; istatus: integer);
begin
  UpEnqLineSQL.Close;
  UpEnqLineSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);
  UpEnqLineSQL.ParamByName('Line').AsInteger := iline;
  UpEnqLineSQL.ParamByName('Status').AsInteger := istatus;
  UpEnqLineSQl.ExecSQL;
end;

procedure TPBEnqSupRespFrm.UpEnquiryHeader(iStatus: Integer);
begin
  UpEnqHeadSQL.Close;
  UpEnqHeadSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);
  UpEnqHeadSQL.ParamByName('Status').AsInteger := iStatus;
  UpEnqHeadSQl.ExecSQL;
end;

procedure TPBEnqSupRespFrm.UpSupplierAddCharges(iline: Integer; irow: Integer);
var
  i: Integer;
begin
  {Find the relevant Qty Grid}
  ChargesGrid := PBEnqSupTmpFrm.findcomponent('Charges' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;

  {Delete the existing Additional Charges}
  with PBEnqSuppDataModfrm.DelChargeSQL do
    begin
      close;
      parambyname('Supplier').asinteger := StrToInt(SuppGrid.Cells[3, irow]);
      parambyname('Branch_no').asinteger := StrToInt(SuppGrid.Cells[4, irow]);
      parambyname('Enquiry').asinteger := StrToInt(EnquiryEdit.Text);
      parambyname('Line').asinteger := iLine;
      execsql;
    end;

  {Now create the Charges again}
  for i := 1 to ChargesGrid.RowCount do
  begin
    if (ChargesGrid.Cells[2,i] = '') or (ChargesGrid.Cells[1,i] = '') then
      Continue;
      {Insert into Supplier Qtys}
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.Close;
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Enquiry').AsInteger :=
        StrToInt(EnquiryEdit.Text);
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Line').AsInteger := iline;
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Supplier').AsInteger :=
        StrToInt(SuppGrid.Cells[3, irow]);
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Branch_no').AsInteger :=
        StrToInt(SuppGrid.Cells[4, irow]);
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Additional_Charge').AsInteger := i;
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Details').Asstring :=
        ChargesGrid.Cells[1, i];
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Amount').Asfloat :=
        strtofloat(ChargesGrid.Cells[2, i]);
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Quotation_Price').Asfloat :=
        StrTofloat(ChargesGrid.Cells[3, i]);
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ParamByName('Charge_type').Asstring :=
        ChargesGrid.Cells[4, i];
      PBEnqSuppDataModfrm.AddEnqSuppChgsSQL.ExecSQL;
  end;
end;

procedure TPBEnqSupRespFrm.UpSupplierQtyDetails(iline: Integer; irow: Integer);
var
  iqty: Integer;
begin
  {Find the relevant Qty Grid}
  QtyGrid := PBEnqSupTmpFrm.findcomponent('Qty' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;

  for iqty := 1 to QtyGrid.RowCount - 1 do
  begin
    if ((QtyGrid.Cells[2, iqty] = '') or (QtyGrid.Cells[1, iqty] = '')) and
       (QtyGrid.Cells[4, iqty] <> 'd') then
    begin
      UpEnqSuppQtySQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);
      UpEnqSuppQtySQL.ParamByName('Line').AsInteger := iline;
      UpEnqSuppQtySQL.ParamByName('Supplier').AsInteger := StrToInt(SuppGrid.Cells[3, irow]);
      UpEnqSuppQtySQL.ParamByName('Branch').AsInteger := StrToInt(SuppGrid.Cells[4, irow]);
      UpEnqSuppQtySQL.ParamByName('Quantity').AsInteger := StrToInt(QtyGrid.Cells[0, iqty]);
      UpEnqSuppQtySQL.ParamByName('Price').clear;
      UpEnqSuppQtySQL.ParamByName('Unit').clear;
      UpEnqSuppQtySQL.ParamByName('Response').clear;
      UpEnqSuppQtySQL.ExecSQL;
      continue;
    end;

    {If any new quantities to add then insert into the following}
    if QtyGrid.Cells[4, iqty] = 'a' then
    begin
      {Insert into Enquiry Qtys}
      AddEnqQtySQL.Close;
      AddEnqQtySQL.ParamByName('Enquiry').AsInteger :=
        StrToInt(EnquiryEdit.Text);
      AddEnqQtySQL.ParamByName('Line').AsInteger := iline;
      AddEnqQtySQL.ParamByName('Quantity').AsInteger :=
        StrToInt(QtyGrid.Cells[0, iqty]);
      AddEnqQtySQL.ExecSQL;

      {Insert into Supplier Qtys}
      AddEnqSuppQtySQL.Close;
      AddEnqSuppQtySQL.ParamByName('Enquiry').AsInteger :=
        StrToInt(EnquiryEdit.Text);
      AddEnqSuppQtySQL.ParamByName('Line').AsInteger := iline;
      AddEnqSuppQtySQL.ParamByName('Supplier').AsInteger :=
        StrToInt(SuppGrid.Cells[3, irow]);
      AddEnqSuppQtySQL.ParamByName('Branch').AsInteger :=
        StrToInt(SuppGrid.Cells[4, irow]);
      AddEnqSuppQtySQL.ParamByName('Quantity').AsInteger :=
        StrToInt(QtyGrid.Cells[0, iqty]);
      AddEnqSuppQtySQL.ParamByName('Price').AsFloat :=
        StrToFloat(QtyGrid.Cells[1, iqty]);
      AddEnqSuppQtySQL.ParamByName('Unit').AsString := QtyGrid.Cells[3, iqty];
      AddEnqSuppQtySQL.ParamByName('Response').AsInteger :=
        StrToInt(QtyGrid.Cells[0, iqty]);
      AddEnqSuppQtySQL.ExecSQL;
    end
    else
    begin
      UpEnqSuppQtySQL.Close;
      UpEnqSuppQtySQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryEdit.Text);
      UpEnqSuppQtySQL.ParamByName('Line').AsInteger := iline;
      UpEnqSuppQtySQL.ParamByName('Supplier').AsInteger := StrToInt(SuppGrid.Cells[3, irow]);
      UpEnqSuppQtySQL.ParamByName('Branch').AsInteger := StrToInt(SuppGrid.Cells[4, irow]);
      UpEnqSuppQtySQL.ParamByName('Quantity').AsInteger := StrToInt(QtyGrid.Cells[0, iqty]);
      if QtyGrid.Cells[1, iqty] = '' then
        UpEnqSuppQtySQL.ParamByName('Price').clear
      else
        UpEnqSuppQtySQL.ParamByName('Price').AsFloat := StrToFloat(QtyGrid.Cells[1, iqty]);
      if QtyGrid.cells[3, iqty] = '' then
        UpEnqSuppQtySQL.ParamByName('Unit').clear
      else
        UpEnqSuppQtySQL.ParamByName('Unit').AsString := QtyGrid.Cells[3, iqty];
      UpEnqSuppQtySQL.ParamByName('Response').AsInteger := StrToInt(QtyGrid.Cells[0, iqty]);
      UpEnqSuppQtySQL.ExecSQL;
    end;

  end;
end;

procedure TPBEnqSupRespFrm.PUnitComboKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is Tcombobox) then
    begin
      PUnitComboClick(Self);
      with SupplierPricesGrid do
      begin
        bMoved := True;
        if (SupplierPricesGrid.Row = SupplierPricesGrid.RowCount - 1) then
          { increment the field }
        begin
          If SupplierPricesGrid.Enabled then
                SupplierPricesGrid.SetFocus;
          SupplierPricesGrid.Col := 1;
          SupplierPricesGrid.Row := 1;
          Exit;
        end
        else
        begin
          If SupplierPricesGrid.Enabled then
                SupplierPricesGrid.SetFocus;
          SupplierPricesGrid.Col := 1;
          SupplierPricesGrid.Row := SupplierPricesGrid.Row + 1;
          Exit;
        end;
      end;
    end;
end;

procedure TPBEnqSupRespFrm.EnquiryEditKeyPress(Sender: TObject;
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
    ClearScreen; { if it's an enter key }
    GetEnquiryDetails;
  end;

end;

function TPBEnqSupRespFrm.ExistingEnquiry(iEnquiry: Integer): boolean;
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

procedure TPBEnqSupRespFrm.SupplierPricesGridKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;

  case key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBEnqSupRespFrm.SupplierPricesGridSelectCell(Sender: TObject;
  Col, Row: Longint; var CanSelect: Boolean);
var
//  ifloat: Real;
  irow: integer;
begin
  {Set the numeric values}
  with Sender as TStringGrid do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if cells[1, irow] = '' then continue;
          cells[1, irow] := formatfloat('0.000',strtofloat(cells[1,irow]));
        end;
    end;

(*  with SupplierPricesGrid do
  begin
    {Don't display if any of these}
    if (Cells[1, Row] = '') or
      (Row = 0) or
      (Col = 0) then Exit;

    ifloat := StrToFloat(Cells[1, Row]);
    Cells[1, Row] := formatfloat('0.000', ifloat);
    QtyGrid.Cells[1, Row] := formatfloat('0.000', ifloat);
  end;
*)
end;

procedure TPBEnqSupRespFrm.SpeedButton3Click(Sender: TObject);
var
  irow: integer;
begin
(*  irow := SupplierCombo.Itemindex + 1;
  PBEnqAddChgfrm := TPBEnqAddChgfrm.Create(Self);
  try
    PBEnqAddChgfrm.iEnquiry := StrToInt(EnquiryEdit.Text);
    PBEnqAddChgfrm.iLine := iline;
    PBEnqAddChgfrm.iSupplier := StrToInt(SuppGrid.Cells[3, irow]);
    PBEnqAddChgfrm.iBranch := StrToInt(SuppGrid.Cells[4, irow]);
    PBEnqAddChgfrm.smode := 'a';
    PBEnqAddChgfrm.ShowModal;
    if PBEnqAddChgfrm.ModalResult = idok then
      AddChargesEdit.Text := formatfloat('0.000', PBEnqAddChgfrm.iTotValue);
  finally
    PBEnqAddChgfrm.Free;
  end;
*)
  irow := SupplierCombo.itemindex + 1;

  {Find the relevant Charges Grid}
  ChargesGrid := PBEnqSupTmpFrm.findcomponent('Charges' + Copy(IntToStr(100 + iline), 2,
    2) + Copy(IntToStr(100 + irow), 2, 2)) as TStringGrid;

  PBLUEnqAddChgFrm := TPBLUEnqAddChgFrm.Create(Self);
  for irow := 1 to AddChargesGrid.RowCount - 1 do
    begin
      PBLUEnqAddChgFrm.AddChargesGrid.Cells[0, irow] :=
        AddChargesGrid.Cells[1, irow];
      PBLUEnqAddChgFrm.AddChargesGrid.Cells[1, irow] :=
        AddChargesGrid.Cells[2, irow];
      PBLUEnqAddChgFrm.AddChargesGrid.Cells[2, irow] :=
        AddChargesGrid.Cells[3, irow];
      PBLUEnqAddChgFrm.AddChargesGrid.Cells[3, irow] :=
        AddChargesGrid.Cells[4, irow];
    end;

  if AddChargesGrid.cells[1,1] = '' then
    PBLUEnqAddChgFrm.AddChargesGrid.RowCount := AddChargesGrid.RowCount + 1
  else
    PBLUEnqAddChgFrm.AddChargesGrid.RowCount := AddChargesGrid.RowCount;

  try
    PBLUEnqAddChgFrm.ShowModal;
    if PBLUEnqAddChgFrm.ModalResult = idok then
      UpdateAddChargesGrid;
  finally
    PBLUEnqAddChgFrm.Free;
  end;
end;

procedure TPBEnqSupRespFrm.UpdateAddChargesGrid;
var
  irow: Integer;
  itotvalue: Real;
begin
  ClearAddChargesGrid;
  iTotValue := 0.000;
  for irow := 1 to PBLUEnqAddChgFrm.AddChargesGrid.RowCount - 1 do
  begin
    if PBLUEnqAddChgFrm.AddChargesGrid.Cells[0, irow] = '' then Continue;

    {Update the Visible Additional Charges grid}
    AddChargesGrid.Cells[1, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[0,
      irow];
    AddChargesGrid.Cells[2, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[1,
      irow];
    AddChargesGrid.Cells[3, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[2,
      irow];
    AddChargesGrid.Cells[4, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[3,
      irow];

    {Update the hidden Additional Charges grid}
    ChargesGrid.Cells[1, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[0,
      irow];
    ChargesGrid.Cells[2, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[1,
      irow];
    ChargesGrid.Cells[3, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[2,
      irow];
    ChargesGrid.Cells[4, irow] := PBLUEnqAddChgFrm.AddChargesGrid.Cells[3,
      irow];
    iTotValue := iTotValue +
      StrToFloat(PBLUEnqAddChgFrm.AddChargesGrid.Cells[1, irow]);
  end;
  AddChargesGrid.RowCount := PBLUEnqAddChgFrm.AddChargesGrid.RowCount;
  ChargesGrid.RowCount := PBLUEnqAddChgFrm.AddChargesGrid.RowCount;

  AddChargesEdit.text := formatfloat('0.000', iTotvalue);
end;

procedure TPBEnqSupRespFrm.ClearAddChargesGrid;
var
  irow, icol: Integer;
begin
  {Clear down the existing Invoice Line Additional details}
  for irow := 0 to AddChargesGrid.RowCount - 1 do
  begin
    for icol := 0 to 5 do
    begin
      AddChargesGrid.Cells[icol, irow] := '';
      ChargesGrid.Cells[icol, irow] := '';
    end;
  end;
  AddChargesGrid.RowCount := 1;
end;

procedure TPBEnqSupRespFrm.EnquiryLineGridClick(Sender: TObject);
begin
  EnquiryLineListBox.itemindex := EnquiryLineGrid.Row - 1;
  EnquiryLineListBoxClick(Self);
end;

procedure TPBEnqSupRespFrm.SpeedButton2Click(Sender: TObject);
var
  irow: Integer;
begin
  irow := SupplierCombo.itemindex + 1;

  {Insert another line in the Supplier Prices Grid}
  PBEnqRespQtyFrm := TPBEnqRespQtyFrm.Create(Self);
  try
    {Load the combo box with the Price Unit details}
    LoadPriceUnitCombo(PBEnqRespQtyFrm.PUnitCombo);
    PBEnqRespQtyFrm.ShowModal;
    if PBEnqRespQtyFrm.ModalResult = idok then
    begin
      {Default the date to todays date if date doesn't exist}
      if SuppDateEdit.Text = '' then
        begin
        SuppDateEdit.Text := PBDatestr(Date);
        SuppGrid.Cells[1, irow] := SuppDateEdit.Text;
        end;

      if QtyExists(StrToInt(PBEnqRespQtyFrm.ResponseQtyMemo.Text)) then
      begin
        MessageDlg('Quantity ' + PBEnqRespQtyFrm.ResponseQtyMemo.Text +
          ' already exists', mtError, [mbOk], 0);
        Exit;
      end;

      SupplierPricesGrid.RowCount := SupplierPricesGrid.RowCount + 1;
      QtyGrid.RowCount := SupplierPricesGrid.RowCount;

      {Update the visible Prices Grid}
      SupplierPricesGrid.Cells[0, SupplierPricesGrid.RowCount - 1] :=
        PBEnqRespQtyFrm.ResponseQtyMemo.Text;
      SupplierPricesGrid.Cells[1, SupplierPricesGrid.RowCount - 1] :=
        PBEnqRespQtyFrm.PriceMemo.Text;
      SupplierPricesGrid.Cells[2, SupplierPricesGrid.RowCount - 1] :=
        PBEnqRespQtyFrm.PUnitCombo.Text;

      {Update the hidden Qty Prices Grid}
      QtyGrid.Cells[0, SupplierPricesGrid.RowCount - 1] :=
        PBEnqRespQtyFrm.ResponseQtyMemo.Text;
      QtyGrid.Cells[1, SupplierPricesGrid.RowCount - 1] :=
        PBEnqRespQtyFrm.PriceMemo.Text;
      QtyGrid.Cells[2, SupplierPricesGrid.RowCount - 1] :=
        PBEnqRespQtyFrm.PUnitCombo.Text;

      PUnitSQL.First;
      PUnitSQl.Moveby(PBEnqRespQtyFrm.PUnitCombo.Itemindex);
      QtyGrid.Cells[3, SupplierPricesGrid.RowCount - 1] :=
        IntToStr(PUnitSQL.FieldByName('Price_Unit').AsInteger);

      {Because this is a new Quantity, flag it for when updating}
      QtyGrid.Cells[4, SupplierPricesGrid.RowCount - 1] := 'a';
    end;
  finally
    PBEnqRespQtyFrm.Free;
  end;
end;

function TPBEnqSupRespFrm.QtyExists(iNewQty: Integer): boolean;
var
  irow: Integer;
begin
  Result := False;
  with SupplierPricesGrid do
  begin
    for irow := 1 to RowCount - 1 do
    begin
      if StrToInt(Cells[0, irow]) = iNewQty then
      begin
        Result := True;
        Exit;
      end;
    end;
  end;
end;

procedure TPBEnqSupRespFrm.PUnitComboEnter(Sender: TObject);
begin
  if SupplierPricesGrid.Cells[2, SupplierPricesGrid.Row] = '' then Exit;
  PUnitComboDropDown(Self);
  PUnitCombo.itemindex := PUnitCombo.Items.indexof(SupplierPricesGrid.Cells[2,
    SupplierPricesGrid.Row]);
end;

procedure TPBEnqSupRespFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {Destroy the form which gets all the enquiry data}
  PBEnqSuppDataModFrm.Free;
end;

procedure TPBEnqSupRespFrm.SuppDateEditExit(Sender: TObject);
var
  irow: Integer;
  NewDate: TDateTime;
begin
    If SuppDateEdit.Text = '' then
    Exit;
    try
    NewDate := StrToDate(SuppDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      If SuppDateEdit.Enabled then
        SuppDateEdit.SetFocus;
      Exit;
    end;
  end;

  irow := SupplierCombo.itemindex + 1;
  SuppDateEdit.Text := PBDatestr(NewDate);
  SuppGrid.Cells[1, irow] := SuppDateEdit.Text;
  dResponse_Date := NewDate;
end;

procedure TPBEnqSupRespFrm.SupplierPricesGridExit(Sender: TObject);
var
  irow: integer;
begin
  {Set the numeric values}
  with Sender as TStringGrid do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if cells[1, irow] = '' then continue;
          cells[1, irow] := formatfloat('0.000',strtofloat(cells[1,irow]));
        end;
    end;
end;
procedure TPBEnqSupRespFrm.memRunOnCostKeyPress(Sender: TObject;
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

procedure TPBEnqSupRespFrm.memRunOnCostExit(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoney((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    If (Sender as TMemo).Enabled then
        (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBEnqSupRespFrm.memRunOnCostEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBEnqSupRespFrm.memRunOnCostChange(Sender: TObject);
var
  irow: Integer;
begin
  irow := SupplierCombo.itemindex + 1;
  SuppGrid.Cells[9, irow] := memRunOnCost.Text;
end;

procedure TPBEnqSupRespFrm.btnDeleteClick(Sender: TObject);
var
  irow,icol,i: integer;
begin
  i := SupplierCombo.itemindex + 1;
  {Delete all the Supplier response details}
  if MessageDlg('Really delete the supplier pricing details ?', mtConfirmation, [mbNo, mbYes],
      0) = mrYes then
    begin
      {clear the QtyGrid }
      with QtyGrid do
        begin
        for irow := 1 to pred(rowcount) do
          for icol := 1 to 3 do
            begin
              cells[4,irow] := 'd';
              cells[icol,irow] := '';
              SupplierPricesGrid.cells[icol,irow] := cells[icol,irow];
            end;
        end;
      {Clear the SuppGrid settings}
      SuppGrid.cells[1,i] := '';
      SuppGrid.cells[2,i] := '';
      SuppGrid.cells[5,i] := '';
      SuppGrid.cells[7,i] := '';
      SuppGrid.cells[9,i] := '';
      SuppGrid.cells[11,i] := '';

      SuppRefedit.text := '';
      Suppdateedit.text := '';
      suppliermemo.text := '';
      memRunOnCost.text := '';
      AddChargesEdit.text := '0.000';
      chkbxDecline.checked := false;

      CheckResponses;
    end;
end;

procedure TPBEnqSupRespFrm.chkbxDeclineClick(Sender: TObject);
var
  irow: Integer;
begin
  irow := SupplierCombo.itemindex + 1;
  with chkbxDecline do
    begin
      if checked then
        begin
          SuppGrid.Cells[11, irow] := 'Y';
        end
      else
        SuppGrid.cells[11,irow] := 'N';
    end
end;

procedure TPBEnqSupRespFrm.FormActivate(Sender: TObject);
begin
{Do the screen access stuff} ;
  dmBroker.ScreenAccessControl(Self,'mnuEnquiries',frmPBMainMenu.iOperator,iDataOp,iDataRep) ;
end;

end.
