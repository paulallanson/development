unit PBenquiry;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ComCtrls, Grids, Spin, DB, PBPOObjects,
  OleCtnrs, PBEnqObjects, PBMaintEnquiryDoc, ShellAPI, PBMaintPOEmail,
  INIFiles, CCSCommon, PBDocObjects, PBDocObjectsDM, ActiveX,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnquiryFrm = class(TForm)
    Label8: TLabel;
    EnqLineList: TListBox;
    LineGrid: TStringGrid;
    CapabilitySQL: TFDQuery;
    QuestionSQL: TFDQuery;
    InsEnqLineQtySQL: TFDQuery;
    UpEnqLineCapSQL: TFDQuery;
    UpEnqLineQSQL: TFDQuery;
    UpEnqLineAddSQL: TFDQuery;
    UpEnqLinePartSQL: TFDQuery;
    UpCompanySQL: TFDQuery;
    GetCompanySQL: TFDQuery;
    DelEnqSQL: TFDQuery;
    EnquiryLbl: TLabel;
    AddEnqSupplierSQL: TFDQuery;
    DelEnqLineSQL: TFDQuery;
    DelEnqLineQtySQL: TFDQuery;
    DelEnqQStSQL: TFDQuery;
    DelEnqLineAddSQL: TFDQuery;
    DelEnqPartSQL: TFDQuery;
    DelEnqCapSQL: TFDQuery;
    DelEnqSuppSQL: TFDQuery;
    DelEnqSuppQtySQL: TFDQuery;
    DelEnqSuppAddSQL: TFDQuery;
    EnquiryMessageLbl: TLabel;
    GetLastNarrSQL: TFDQuery;
    AddNarrSQL: TFDQuery;
    AddEnqLineSQL: TFDQuery;
    DelEnqSupplierSQL: TFDQuery;
    DelAllEnqSuppQtysSQL: TFDQuery;
    CheckEnqSuppSQL: TFDQuery;
    CheckEnqSuppQtySQL: TFDQuery;
    CheckEnqQtySQL: TFDQuery;
    PaperDetailSQL: TFDQuery;
    qryCompany: TFDQuery;
    DelEnqOneSuppAddSQL: TFDQuery;
    UpEnqSupplierSQL: TFDQuery;
    QuestListSQL: TFDQuery;
    OptionsSQL: TFDQuery;
    UpEnqLineOptSQL: TFDQuery;
    DelEnqOptSQL: TFDQuery;
    AddEnqSuppOChgsSQL: TFDQuery;
    GetLastAddChgSQL: TFDQuery;
    CheckEnqSuppOChgsSQL: TFDQuery;
    DelEnqSuppOChgsSQL: TFDQuery;
    svDlgOfficeDoc: TSaveDialog;
    qryGetLooseEnqLineQtys: TFDQuery;
    qryDelEnqLineParts: TFDQuery;
    qryGetActiveCustomerContact: TFDQuery;
    stsbrDetails: TStatusBar;
    pnlFooter: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    custreps: TFDQuery;
    QCustomer: TFDQuery;
    ContactSQL: TFDQuery;
    AddEnqSuppQtySQL: TFDQuery;
    CustRepSQL: TFDQuery;
    OperatorSQL: TFDQuery;
    AddEnqHeaderSQL: TFDQuery;
    UpEnqLineSQL: TFDQuery;
    UpEnqHeaderSQL: TFDQuery;
    GetEnqSupplierSQL: TFDQuery;
    DelEnqSupplierQtySQL: TFDQuery;
    DelEnqQtySQL: TFDQuery;
    qryProductType: TFDQuery;
    DocOpenDialog: TOpenDialog;
    pnlLineDetails: TPanel;
    EnquiryLinePage: TPageControl;
    PartTabSheet: TTabSheet;
    Bevel3: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    SameAsLbl: TLabel;
    PartList: TListBox;
    HeadEdit: TEdit;
    PartPageControl: TPageControl;
    PaperTabSheet: TTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    ColourComboBox: TComboBox;
    WeightComboBox: TComboBox;
    BrandComboBox2: TComboBox;
    MaterialComboBox: TComboBox;
    BitBtn2: TBitBtn;
    InkTabSheet: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    PlateChangeLbl: TLabel;
    FaceEdit: TEdit;
    RevEdit: TEdit;
    PlateChangeSpin: TSpinEdit;
    MarginsTabSheet: TTabSheet;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    LWMarginEdit: TEdit;
    LMarginTypeEdit: TEdit;
    RWMarginEdit: TEdit;
    RMarginTypeEdit: TEdit;
    BitBtn1: TBitBtn;
    SameAsPartEdit: TEdit;
    SameAsPartSpin: TUpDown;
    TabSheet2: TTabSheet;
    Bevel4: TBevel;
    AddNotesMemo: TMemo;
    TabSheet3: TTabSheet;
    Bevel5: TBevel;
    Label12: TLabel;
    AddDetailsList: TListBox;
    GroupBox2: TGroupBox;
    AddDetailsMemo: TMemo;
    AddSupNtsBitBtn: TBitBtn;
    ChangeSupNtsBitBtn: TBitBtn;
    DeleteSupNtsBitBtn: TBitBtn;
    CapabilityTabSheet: TTabSheet;
    Bevel6: TBevel;
    Label11: TLabel;
    ProductCLbl: TLabel;
    CapabilityScrollBox: TScrollBox;
    QuestionTabSheet: TTabSheet;
    Bevel8: TBevel;
    Label10: TLabel;
    ProductQLbl: TLabel;
    ScrollBox1: TScrollBox;
    TabSheet6: TTabSheet;
    Bevel9: TBevel;
    SupplierGrid: TStringGrid;
    SuppSelectBtn: TBitBtn;
    ContactSelBitBtn: TBitBtn;
    OptionsTabSheet: TTabSheet;
    Bevel10: TBevel;
    lblPTOptions: TLabel;
    Label14: TLabel;
    OptionsScrollBox: TScrollBox;
    tbsDocuments: TTabSheet;
    pnlDocs: TPanel;
    lblDocs: TLabel;
    strgrdDocs: TStringGrid;
    ocWord: TOleContainer;
    ocExcel: TOleContainer;
    btbtnAddDoc: TBitBtn;
    btbtnChangeDoc: TBitBtn;
    btbtnDeleteDoc: TBitBtn;
    btbtnOpen: TBitBtn;
    btbtnWordDoc: TBitBtn;
    btbtnExcelSheet: TBitBtn;
    btnEmail: TBitBtn;
    pnlLines: TPanel;
    pnlHeader: TPanel;
    Label7: TLabel;
    EnqDateEdit: TEdit;
    EnqDateBtn: TSpeedButton;
    Label9: TLabel;
    OfficeComboBox: TComboBox;
    Label3: TLabel;
    ReqByDateEdit: TEdit;
    DateBtn: TSpeedButton;
    lblQuoteNo: TLabel;
    edtEnquiryNo: TEdit;
    pnlCustomer: TPanel;
    lblCustomerLabel: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CustomerEdit: TEdit;
    CustRepCombo: TComboBox;
    ContactCombo: TComboBox;
    BranchEdit: TEdit;
    DescriptionEdit: TEdit;
    CustomerSpeedButton: TButton;
    BranchSpeedButton: TButton;
    ContactSpeedButton: TButton;
    RepSpeedButton: TButton;
    rdgType: TRadioGroup;
    Panel1: TPanel;
    AddLineBitBtn: TBitBtn;
    ChangeLineBitBtn: TBitBtn;
    DeleteLineBitBtn: TBitBtn;
    EnquiryLineGrid: TStringGrid;
    oldCapabilitySQL: TFDQuery;
    procedure DateBtnClick(Sender: TObject);
    procedure ContactComboDropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddLineBitBtnClick(Sender: TObject);
    procedure LineDescEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EnqLineListClick(Sender: TObject);
    procedure CustomerSpeedButtonClick(Sender: TObject);
    procedure HeadEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PartListClick(Sender: TObject);
    procedure PlateChangeSpinChange(Sender: TObject);
    procedure EnterLineGrid(itag: Integer; sText: string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ChangeLineBitBtnClick(Sender: TObject);
    procedure ReqByDateEditExit(Sender: TObject);
    procedure AddSupNtsBitBtnClick(Sender: TObject);
    procedure AddDetailsListClick(Sender: TObject);
    procedure ChangeSupNtsBitBtnClick(Sender: TObject);
    procedure AddDetailsListDblClick(Sender: TObject);
    procedure DeleteSupNtsBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure BranchSpeedButtonClick(Sender: TObject);
    procedure DeleteLineBitBtnClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ContactSpeedButtonClick(Sender: TObject);
    procedure RepSpeedButtonClick(Sender: TObject);
    procedure CustRepComboDropDown(Sender: TObject);
    procedure EnquiryLineGridClick(Sender: TObject);
    procedure EnqDateBtnClick(Sender: TObject);
    procedure EnqDateEditExit(Sender: TObject);
    procedure SameAsPartEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SameAsPartEditKeyPress(Sender: TObject; var Key: Char);
    procedure SameAsPartSpinClick(Sender: TObject; Button: TUDBtnType);
    procedure CustomerEditChange(Sender: TObject);
    procedure BranchEditChange(Sender: TObject);
    procedure ContactComboChange(Sender: TObject);
    procedure CustRepComboChange(Sender: TObject);
    procedure DescriptionEditChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ChangeEnquiry;
    procedure CopyEnquiry;
    procedure ViewEnquiry;
    procedure ConvertPOtoEnquiry;
    procedure ClearScreen;
    procedure ColourComboBoxEnter(Sender: TObject);
    procedure ColourComboBoxExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PartListDblClick(Sender: TObject);
    procedure EnquiryLineGridDblClick(Sender: TObject);
    procedure SupplierGridDblClick(Sender: TObject);
    procedure ContactSelBitBtnClick(Sender: TObject);
    procedure CapabilityClick(Sender: TObject);
    procedure QuestionClick(Sender: TObject);
    procedure QuestionChange(Sender: TObject);
    procedure QuestionDropDown(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddNotesMemoChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btbtnAddDocClick(Sender: TObject);
    procedure btbtnChangeDocClick(Sender: TObject);
    procedure btbtnDeleteDocClick(Sender: TObject);
    procedure btbtnOpenClick(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btbtnWordDocClick(Sender: TObject);
    procedure btbtnExcelSheetClick(Sender: TObject);
    procedure strgrdDocsDblClick(Sender: TObject);
    procedure rdgTypeClick(Sender: TObject);
    procedure SupplierGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    DroppedEmailFile: string;
    FEmailApplication : string;
    FSelectedLineIndex: Integer;
    function UpdateNarrative: Integer;
    //    function getcust(cust: Integer; Branch: Integer): string;
    procedure InitialiseNew;
    procedure AddNewEnquiryLine;
    function GetLineForm(sPartNo: string): TForm;
    procedure EnterPartGrid(itag: Integer; sText: string);
    procedure EnterAddNotes(sMemo: string);
    //    procedure ClearAllDetails;
    procedure SetDefaultPartDetails;
    procedure EditLineDetails;
    procedure ChangeEnqLineList;
    procedure DisplayPartDetails(iNewPart: Integer);
    procedure DisplaySameAsDetails(iOrigPart: Integer);
    procedure UpdatePartDetails(iNewPart: Integer);
    procedure GetCapabilities;
    procedure GetQuestions;
    procedure GetOptions;
    procedure LoadCapabilities(iProduct: Integer);
    procedure LoadQuestions(iProduct: Integer);
    procedure LoadOptions(iProduct: Integer);
    procedure GetAdditionalDetails;
    procedure DeleteLineForms;
    procedure UpdateEnqHeader(EnqHeaderSQL: TFDQuery);
    procedure GetEnquiryNumber;
    procedure UpdateEnqLine;
    procedure UpdateLine(EnqLineSQL: TFDQuery; iNewLine: Integer);
    procedure UpdateEnqLineQuestions(iline: Integer);
    procedure UpdateEnqLineAdds(iline: Integer);
    procedure UpdateEnqLineParts(iline: Integer);
    procedure UpdateEnqLineCaps(iline: Integer);
    procedure UpdateEnqLineOptions(iline: Integer);
    procedure AddEnqSuppliers(iline: Integer);
    procedure UpEnqSuppliers(iline: Integer);
    procedure GetEnqHeader;
    procedure GetEnqLine;
    procedure GetEnqLineQuestions;
    procedure GetEnqLineAdds;
    procedure GetEnqLineParts;
    procedure GetEnqLineCaps;
    procedure GetEnqLineOptions;
    procedure InitialiseLineDetails(iNewLine: Integer);
    procedure DeleteLineScrollbox;
    procedure ClearLineDetails(iOldLine: Integer);
    procedure DeleteEnquiry;
    procedure RenameLineDetails(iNewLine: Integer);
    procedure GetSuppliers;
    procedure GetEnqLineSupps;
    procedure EnableOK;
    function CheckEnquiryLines: boolean;
    procedure ClearSupplierGrids;
    procedure GetSupplierContacts;
    procedure EnableCustomerBtns;
    procedure DisplayOperators;
    procedure GetNotes;
    procedure GetEnqLineNotes(iNarrative: Integer);
    function GetSelectedLine: TOrderLine;
    procedure SetEnquiryHeader;
    procedure SetEnquiryLine;
    procedure setEnqLineQuestions;
    procedure setEnqLineAdds;
    procedure setEnqLineParts;
    procedure SetEnqLineSupps;
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    procedure DisplayDocumentList;
    procedure ResetDocumentListDisplay;
    procedure SendAndSaveEmail(sTo, sSubject: string);
    function SuppliersOK: boolean;
    function ProductTypeMinSuppliers(ProdType: integer): integer;
    procedure ParseMessage(const AFileName: string; var ATo, AFrom,
      ASubject, ADate, ABody: string);
    procedure AddDocumentToEnquiry;
    function GetActiveCustomerContact(tempCust, tempBranch,
      tempCode: integer): integer;
  public
    { Public declarations }
    sEnqFuncMode: string[1];
    iEnqNumber: Integer;
    rPONumber: real;
    iPOLine: Integer;
    ICustomer: Integer;
    IBranch_No: Integer;
    iContact: Integer;
    Enquiry: TEnquiry;
    compdir, docDir, opDir: string;
    property SelectedLine: TOrderLine read GetSelectedLine;
    procedure GetCustReps;
  end;

var
  PBEnquiryFrm: TPBEnquiryFrm;
  IDateval: TDateTime;
  Irequired_ByVal: TDateTime;
  iRep: Integer;
  Ioperator: Integer;
  Goperator: Integer;
  enqrep: Integer;
  sFuncMode, sAddDetailMode: string[1];
  iline, iAddLine: Integer;
  iEnquiryStatus: Integer;
  OrderLine: TOrderLine;

implementation

uses
  System.UITypes,
  PBEnqLineDtls, PBenqline, PBLUCust, PBEnqAddDtls, pbDatabase,
  PBEnqDataMod, PBPODataMod, PBPOToEnq, DateSelV5, pbMainMenu, PBNarrativeDM,
  PBLUBranch, PBEnqSelSup, PBLUCConta, PBLUCRep, PBMaintPaper, PBLUSConta, PBPartDescDg,
  PBWordOLE, PBExcelOLE, TaoMapi, AxCtrls, ComObj;

var
  ipart: Integer;
  SupplierArray: array[1..20, 0..6] of string;

{$R *.DFM}

procedure TPBEnquiryFrm.DateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := Irequired_byval;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      Irequired_byval := DateSelV5Form.Date;
      ReqByDateEdit.Text := PBDateStr(Irequired_byval);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBEnquiryFrm.getcustreps;
var
  repidx, counter: Integer;
begin
  CustRepCombo.Items.Clear;
  custreps.Close;
  custreps.ParamByName('custid').AsInteger := Icustomer;
  custreps.ParamByName('branchid').AsInteger := IBranch_No;
  custreps.Open;
  custreps.First;
  repidx := 0;
  counter := 0;
  while not custreps.EOF do
  begin
    CustRepCombo.Items.Add(custreps.FieldByName('name').AsString);
    if custreps.FieldByName('Is_main_rep').asboolean then
    begin
      repidx := counter;
      enqrep := custreps.FieldByName('rep').AsInteger;
    end;
    inc(counter);
    custreps.Next;
  end;
  CustRepCombo.Itemindex := repidx;
  {  CustRepCombo.text:=CustRepCombo.items[repidx];
  }
end;

{function TPBEnquiryFrm.getcust(cust: Integer; Branch: Integer): string;
begin
  Qcustomer.Close;
  qcustomer.ParamByName('customer').AsInteger := Cust;
  qcustomer.ParamByName('Branch_No').AsInteger := Branch;
  qcustomer.Open;
  Result := qcustomer.FieldByName('name').AsString;
  qcustomer.Close;
end;}

procedure TPBEnquiryFrm.ContactComboDropDown(Sender: TObject);
var
  stext: string;
begin
  ContactSQL.Close;
  ContactSQL.ParamByName('Customer').AsInteger := iCustomer;
  ContactSQL.ParamByName('Branch').AsInteger := iBranch_No;
  ContactSQL.ParamByName('Contact_no').AsInteger := iContact;
  ContactSQL.Open;

  stext := ContactCombo.Text;

  ContactCombo.Clear;

  ContactSQL.First;

  while (not ContactSQL.EOF) do
  begin
    ContactCombo.Items.Add(Trim(ContactSQl.FieldByName('Name').AsString));
    ContactSQL.Next;
  end;

  if ContactCombo.Items.Count = 1 then
    ContactCombo.Itemindex := 0
  else
    ContactCombo.Itemindex := ContactCombo.Items.IndexOf(stext);

  if ContactCombo.Itemindex = -1 then ContactCombo.Text := stext;
end;

procedure TPBEnquiryFrm.InitialiseNew;
begin
  edtEnquiryNo.Text := '<New Enquiry>';
  EnqDateEdit.Text := PBDatestr(Date);
  ReqByDateEdit.Text := PBDatestr(Date);
  Idateval := Now;
  Irequired_byval := Now;
  EnqDateEdit.ReadOnly := False;
  EnqDateBtn.Enabled := True;

  ioperator := goperator;
  ICustomer := 0;
  IBranch_No := 0;

  {Initialise the Line details}
  iline := 0;
  ipart := 0;

  {Disable the line Change and Delete buttons}
  ChangeLineBitBtn.Enabled := False;
  DeleteLineBitBtn.Enabled := False;

  EnquiryMessageLbl.Caption := 'Adding new enquiry';

  sEnqFuncMode := 'a';

  // hide the document tab until an enquiry exists
  EnquiryLinePage.Pages[6].tabVisible := false;

  SupplierGrid.Cells[0, 0] := 'Supplier';
  SupplierGrid.Cells[1, 0] := 'Branch';
  SupplierGrid.Cells[2, 0] := 'Contact';

  EnquiryLineGrid.Cells[1, 0] := 'Description';
  EnquiryLineGrid.Cells[2, 0] := 'Product Type';
  EnquiryLineGrid.Cells[3, 0] := 'Depth';
  EnquiryLineGrid.Cells[4, 0] := 'Width';

  iEnquiryStatus := 10;
  DisplayOperators;
end;

procedure TPBEnquiryFrm.FormShow(Sender: TObject);
begin
  {	ClearScreen;
  }
  EnableCustomerBtns;
  EnableOK;
  If CustomerEdit.Enabled then
        CustomerEdit.SetFocus;
end;

procedure TPBEnquiryFrm.DisplayOperators;
begin
  with OperatorSQL do
  begin
    Close;
    Open;
    First;
    OfficeComboBox.Clear;
    while (not EOF) do
    begin
      OfficeComboBox.Items.Add(FieldByName('Name').AsString);
      Next;
    end;
    OfficeComboBox.itemindex :=
      OfficeComboBox.Items.indexof(frmPBMainMenu.sOperator_name);
  end;
end;

procedure TPBEnquiryFrm.EnableCustomerBtns;
begin
  BranchSpeedButton.Enabled := (CustomerEdit.Text <> '');
  ContactSpeedButton.Enabled := (BranchEdit.Text <> '');
  RepSpeedButton.Enabled := (BranchEdit.Text <> '');
end;

procedure TPBEnquiryFrm.AddLineBitBtnClick(Sender: TObject);
begin
  sFuncMode := 'a';
  AddNewEnquiryLine;
  EnableOK;
end;

procedure TPBEnquiryFrm.AddNewEnquiryLine;
var
  EnquiryLine: TEnquiryLine;
begin
  iline := EnqLineList.Items.Count + 1;

  PBEnqLineDtlsFrm := TPBEnqLineDtlsFrm.Create(Self);
  try
    PBEnqLineDtlsFrm.ShowModal;
    if PBEnqLineDtlsFrm.ModalResult = idok then
    begin
      {Set up the temporary details for the individual parts}
      InitialiseLineDetails(iline);

      EnquiryLine := TEnquiryLine.create;
      EnquiryLine.JobType := PBEnqLineDtlsFrm.jobType;
      Enquiry.Lines.Add(EnquiryLine);
    end;
  finally
    PBEnqLineDtlsFrm.Free;
  end;
end;

{procedure TPBEnquiryFrm.ClearAllDetails;
var
  icount: Integer;
begin
  for icount := 0 to ComponentCount - 1 do
  begin
    if (Components[icount] as TComponent).tag = 0 then Continue;

    if Components[icount] is TEdit then
      TEdit(Components[icount]).Clear
    else
      if Components[icount] is TComboBox then
        TComboBox(Components[icount]).Text := ''
      else
        if Components[icount] is TRadioGroup then
          TRadioGroup(Components[icount]).itemindex := 0
        else
          if Components[icount] is TSpinedit then
            TSpinEdit(Components[icount]).value := 0
  end;
end; }

procedure TPBEnquiryFrm.SetDefaultPartDetails;
var
  icount: Integer;
begin
  for icount := 0 to StrToInt(LineGrid.Cells[7, iline - 1]) do
  begin
    {Basically Don't set defaults if they already set to different values}
    if (PBenqlinetmp.PartGrid.Cells[8, icount] = '0') or
      (PBenqlinetmp.PartGrid.Cells[8, icount] = '') then
      PBenqlinetmp.PartGrid.Cells[8, icount] := '0';

    if (PBenqlinetmp.PartGrid.Cells[13, icount] = '0') or
      (PBenqlinetmp.PartGrid.Cells[13, icount] = '') then
      PBenqlinetmp.PartGrid.Cells[13, icount] := '0';
  end;
end;

procedure TPBEnquiryFrm.LineDescEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  EnterLineGrid((Sender as TEdit).tag, (Sender as TEdit).Text);
end;

procedure TPBEnquiryFrm.EnterLineGrid(itag: Integer; sText: string);
begin
  {If the tag number is greater than the number of columns of the grid
   then extend the grid}
  if itag > LineGrid.colcount then
    LineGrid.colcount := itag;

  {Feed the contents of the relevant edit box into the line grid}
  LineGrid.Cells[itag, iline - 1] := stext;
end;

procedure TPBEnquiryFrm.EnqLineListClick(Sender: TObject);
var
  icount: Integer;
begin
  {Decide which buttons should be displayed}
  if EnqLineList.Items.Count < 1 then
  begin
    ChangeLineBitBtn.Enabled := False;
    DeleteLineBitBtn.Enabled := False;
  end
  else
  begin
    ChangeLineBitBtn.Enabled := True;
    DeleteLineBitBtn.Enabled := True;
  end;

  {Don't try to get any details if there are no lines on the enquiry}
  if EnqLineList.Items.Count = 0 then Exit;

  iline := EnqLineList.Itemindex + 1;

  PBenqlinetmp := GetLineForm(IntToStr(iline)) as TPBenqlinetmp;

  {Load the part list box with the correct part details if at least one exists}
  PartList.Clear;
  PartTabSheet.Enabled := False;
  if StrToInt(LineGrid.Cells[7, (iline - 1)]) > 0 then
  begin
    for icount := 1 to StrToInt(LineGrid.Cells[7, (iline - 1)]) do
    begin
      if trim(PBenqLinetmp.PartGrid.cells[0,icount-1]) = '' then
        PartList.Items.Add('Part ' + IntToStr(icount))
      else
        PartList.Items.Add(trim(PBenqLinetmp.PartGrid.cells[0,icount-1]));
    end;
    PartTabSheet.Enabled := True;
    PartList.Itemindex := 0;
    PartListClick(Self);
  end;

  {Display all the Additional details, Capabilities and Questions for this line}
  GetAdditionalDetails;
  GetCapabilities;
  GetQuestions;
  GetOptions;
  GetSuppliers;
  GetNotes;
end;

procedure TPBEnquiryFrm.GetAdditionalDetails;
var
  irow: Integer;
begin
  AddDetailsList.Clear;
  for irow := 0 to PBenqlinetmp.AddGrid.RowCount - 1 do
  begin
    if PBenqlinetmp.AddGrid.Cells[1, irow] = '' then Continue;

    if StrToInt(PBenqlinetmp.AddGrid.Cells[1, irow]) = 0 then
      AddDetailsList.Items.Add('Supplier Only')
    else
      if StrToInt(PBenqlinetmp.AddGrid.Cells[1, irow]) = 1 then
        AddDetailsList.Items.Add('Customer Only')
      else
        AddDetailsList.Items.Add('Both Suppliers and Customers');
  end;

  {Display the relevant Buttons and Text}
  if AddDetailsList.Items.Count > 0 then
  begin
    AddDetailsList.itemindex := 0;
  end;
  AddDetailsListClick(Self);
end;

procedure TPBEnquiryFrm.GetCapabilities;
var
  Scrollbox: TScrollBox;
begin
  scrollbox := CapabilityTabSheet.findComponent('CapabilityScrollBox' +
    IntToStr(iline)) as Tscrollbox;
  ProductCLbl.Caption := LineGrid.Cells[2, iline - 1];
  scrollbox.bringtofront;
end;

procedure TPBEnquiryFrm.GetQuestions;
var
  Scrollbox: TScrollBox;
begin
  scrollbox := QuestionTabSheet.findComponent('QuestionScrollBox' +
    IntToStr(iline)) as Tscrollbox;
  ProductQLbl.Caption := LineGrid.Cells[2, iline - 1];
  scrollbox.bringtofront;

end;

procedure TPBEnquiryFrm.GetSuppliers;
var
  irow, icol: Integer;
begin
  {Clear down the existsing details in trhe Supplier Grid}
  for irow := 1 to SupplierGrid.RowCount - 1 do
  begin
    for icol := 0 to SupplierGrid.colcount - 1 do
    begin
      SupplierGrid.Cells[icol, irow] := '';
    end;
  end;

  for irow := 0 to PBenqlinetmp.SupplierGrid.RowCount do
  begin
    if PBenqlinetmp.SupplierGrid.Cells[1, irow] = '' then Continue;

    SupplierGrid.Cells[0, irow + 1] := PBenqlinetmp.SupplierGrid.Cells[3, irow];
    SupplierGrid.Cells[1, irow + 1] := PBenqlinetmp.SupplierGrid.Cells[4, irow];
    SupplierGrid.Cells[2, irow + 1] := PBenqlinetmp.SupplierGrid.Cells[6, irow];
  end;

  SupplierGrid.RowCount := PBenqlinetmp.SupplierGrid.RowCount + 1;

end;

procedure TPBEnquiryFrm.GetNotes;
begin
  AddNotesMemo.Text := PBenqlinetmp.NotesMemo.Text;
end;

procedure TPBEnquiryFrm.CustomerSpeedButtonClick(Sender: TObject);
begin
  if rdgType.ItemIndex = 0 then
    begin
      PBLUCustfrm := TPBLUCustfrm.Create(Owner);
      try
        PBLUCustfrm.bIs_Lookup := True;
        PBLUCustfrm.bAllow_Upd := True;
        PBLUCustfrm.bSel_Branch := True;

        PBLUCustfrm.Selcode := iCustomer;
        PBLUCustfrm.SelBranch := iBranch_No;

        PBLUCustfrm.SelName := CustomerEdit.Text;
        PBLUCustfrm.SelBranchName := BranchEdit.Text;

        PBLUCustFrm.ShowModal;
        if PBLUCustfrm.selected then
        begin
          Icustomer := PBLUCustfrm.Selcode;
          CustomerEdit.Text := PBLUCustfrm.SelName;
          IBranch_no := PBLUCustfrm.SelBranch;
          BranchEdit.Text := PBLUCustfrm.SelBranchName;
          ContactComboDropDown(Self);
          getcustreps;
          EnableCustomerBtns;
        end;
      finally
        PBLUCustfrm.Free;
      end;
    end
  else
    begin
      PBLUCustfrm := TPBLUCustfrm.Create(Owner);
      try
        PBLUCustfrm.bIs_Lookup := True;
        PBLUCustfrm.bAllow_Upd := True;
        PBLUCustfrm.bSel_Branch := True;

        PBLUCustfrm.Selcode := iCustomer;
        PBLUCustfrm.SelBranch := iBranch_No;

        PBLUCustfrm.SelName := CustomerEdit.Text;
        PBLUCustfrm.SelBranchName := BranchEdit.Text;

        PBLUCustFrm.bProspects := true;

        PBLUCustFrm.ShowModal;
        if PBLUCustfrm.selected then
        begin
          Icustomer := PBLUCustfrm.Selcode;
          CustomerEdit.Text := PBLUCustfrm.SelName;
          IBranch_no := PBLUCustfrm.SelBranch;
          BranchEdit.Text := PBLUCustfrm.SelBranchName;
          ContactComboDropDown(Self);
          getcustreps;
          EnableCustomerBtns;
        end;
      finally
        PBLUCustfrm.Free;
      end;
    end;

  EnableOK;
end;

procedure TPBEnquiryFrm.EnterPartGrid(itag: Integer; sText: string);
begin
  {Feed the contents of the relevant edit box into the line grid}
  PBenqlinetmp.PartGrid.Cells[itag, ipart - 1] := stext;
end;

procedure TPBEnquiryFrm.EnterAddNotes(sMemo: string);
begin
  {Feed the contents of the Memo box into the line memo box}
  PBenqlinetmp.NotesMemo.Text := sMemo;
end;

function TPBEnquiryFrm.GetLineForm(sPartNo: string): TForm;
var
  icount: Integer;
  stext: string;
begin
  Result := nil;
  stext := 'PBenqlinetmp' + spartno;
  for icount := 0 to application.ComponentCount - 1 do
  begin
    if application.Components[icount] is TForm then
    begin
      if TForm(application.Components[icount]).Name = stext then
      begin
        Result := TForm(application.Components[icount]) as TPBenqlinetmp;
      end;
    end;
  end;
end;

procedure TPBEnquiryFrm.DeleteLineForms;
var
  icount: Integer;
begin
  for icount := application.ComponentCount - 1 downto 0 do
  begin
    if application.Components[icount] is TForm then
    begin
      if Copy(TForm(application.Components[icount]).Name, 1, 12) = 'PBenqlinetmp'
        then
      begin
        TForm(application.Components[icount]).Free;
      end;
    end;
  end;
end;

procedure TPBEnquiryFrm.DeleteLineScrollbox;
var
  icount: Integer;
begin
  for icount := ComponentCount - 1 downto 0 do
  begin
    if Components[icount] is TScrollbox then
    begin
      TScrollbox(Components[icount]).Free;
    end;
  end;
end;

procedure TPBEnquiryFrm.HeadEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  EnterPartGrid(((Sender as TEdit).tag - 100), (Sender as TEdit).Text);

end;

procedure TPBEnquiryFrm.PartListClick(Sender: TObject);
begin
  {Determine how the Same as labels are Displayed}
  if PartList.Itemindex = 0 then
  begin
    SameAsLbl.Visible := False;
    SameAsPartEdit.Visible := False;
    SameAsPartSpin.Visible := False;
    PlateChangeLbl.Visible := False;
    PlateChangeSpin.Visible := False;
  end
  else
  begin
    SameAsLbl.Visible := True;
    SameAsPartEdit.Visible := True;
    SameAsPartSpin.Visible := True;
    PlateChangeLbl.Visible := True;
    PlateChangeSpin.Visible := True;

    {Set the Maximum Value for the Same as Part Spin button}
{  		SameAsPartSpin.MaxValue := PartList.Itemindex;
}
  end;

  ipart := PartList.itemindex + 1;

  DisplayPartDetails(PartList.Itemindex);
end;

procedure TPBEnquiryFrm.DisplayPartDetails(iNewPart: Integer);
var
  icount: Integer;
begin
  for icount := 0 to ComponentCount - 1 do
  begin
    if ((Components[icount] as TComponent).tag < 100) or ((Components[icount] as
      TComponent).tag > 199) then Continue;
    if Components[icount] is TEdit then
      TEdit(Components[icount]).Text :=
        PBenqlinetmp.PartGrid.Cells[TEdit(Components[icount]).tag - 100,
          iNewPart]
    else
      if Components[icount] is TComboBox then
        TComboBox(Components[icount]).Text :=
          PBenqlinetmp.PartGrid.Cells[TComboBox(Components[icount]).tag - 100,
          iNewPart]
      else
        if Components[icount] is TRadioGroup then
          TRadioGroup(Components[icount]).itemindex :=
            StrToInt(PBenqlinetmp.PartGrid.Cells[TRadioGroup(Components[icount]).tag - 100, iNewPart])
        else
          if Components[icount] is TSpinedit then
            TSpinEdit(Components[icount]).value :=
              StrToInt(PBenqlinetmp.PartGrid.Cells[TSpinEdit(Components[icount]).tag - 100, iNewPart])
  end;
end;

procedure TPBEnquiryFrm.DisplaySameAsDetails(iOrigPart: Integer);
var
  icount: Integer;
begin
  if iOrigPart = 0 then Exit;

  for icount := 0 to ComponentCount - 1 do
  begin
    {Skip the Same as part component}
    if (Components[icount] as TComponent).tag = 113 then Continue;

    if ((Components[icount] as TComponent).tag < 100) or ((Components[icount] as
      TComponent).tag > 199) then Continue;
    if Components[icount] is TEdit then
      TEdit(Components[icount]).Text :=
        PBenqlinetmp.PartGrid.Cells[TEdit(Components[icount]).tag - 100,
          iOrigPart
        - 1]
    else
      if Components[icount] is TComboBox then
        TComboBox(Components[icount]).Text :=
          PBenqlinetmp.PartGrid.Cells[TComboBox(Components[icount]).tag - 100,
          iOrigPart - 1]
      else
        if Components[icount] is TRadioGroup then
          TRadioGroup(Components[icount]).itemindex :=
            StrToInt(PBenqlinetmp.PartGrid.Cells[TRadioGroup(Components[icount]).tag - 100, iOrigPart - 1])
        else
          if Components[icount] is TSpinedit then
          begin
            if TSpinEdit(Components[icount]).Name = 'SameAsPartSpin' then
              Continue
            else
              TSpinEdit(Components[icount]).value :=
                StrToInt(PBenqlinetmp.PartGrid.Cells[TSpinEdit(Components[icount]).tag - 100, iOrigPart - 1]);
          end;
  end;
end;

procedure TPBEnquiryFrm.UpdatePartDetails(iNewPart: Integer);
var
  icount: Integer;
begin
  for icount := 0 to ComponentCount - 1 do
  begin
    if ((Components[icount] as TComponent).tag < 100) or ((Components[icount] as
      TComponent).tag > 199) then Continue;
    if Components[icount] is TEdit then
      PBenqlinetmp.PartGrid.Cells[TEdit(Components[icount]).tag - 100, iNewPart]
        := TEdit(Components[icount]).Text
    else
      if Components[icount] is TComboBox then
        PBenqlinetmp.PartGrid.Cells[TComboBox(Components[icount]).tag - 100,
          iNewPart] := TComboBox(Components[icount]).Text
      else
        if Components[icount] is TRadioGroup then
          PBenqlinetmp.PartGrid.Cells[TRadioGroup(Components[icount]).tag - 100,
            iNewPart] := IntToStr(TRadioGroup(Components[icount]).itemindex)
        else
          if Components[icount] is TSpinedit then
            PBenqlinetmp.PartGrid.Cells[TSpinEdit(Components[icount]).tag - 100,
              iNewPart] := IntToStr(TSpinEdit(Components[icount]).value)
  end;
end;

procedure TPBEnquiryFrm.PlateChangeSpinChange(Sender: TObject);
begin
  EnterPartGrid((Sender as TSpinEdit).tag - 100, IntToStr((Sender as
    TSpinEdit).value));
end;

procedure TPBEnquiryFrm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TempWord: Word;
begin
  if modalResult = mrok then exit;

  if not(OKBitBtn.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these enquiry details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    OKBitBtnClick(self);
//  DeleteLineForms
end;

procedure TPBEnquiryFrm.EditLineDetails;
begin
  iline := EnqLineList.Itemindex + 1;

  PBenqlinetmp := GetLineForm(IntToStr(iline)) as TPBenqlinetmp;

  PBEnqLineDtlsFrm := TPBEnqLineDtlsFrm.Create(Self);
  try
    PBEnqLineDtlsFrm.Caption := 'Edit Enquiry line details';
    PBEnqLineDtlsFrm.ShowModal;

    if PBEnqLineDtlsFrm.ModalResult = idok then
    begin
      PBenqlinetmp.PartGrid.RowCount := PBEnqLineDtlsFrm.NoPartSpin.value; 
      PBenqlinetmp.noOfParts := PBEnqLineDtlsFrm.NoPartSpin.value;

      {Load the Capability and Question Details}
      if PBEnqLineDtlsFrm.FProductTypeChanged then
        begin
          LoadCapabilities(StrToInt(LineGrid.Cells[0, EnqLineList.Itemindex]));
          LoadQuestions(StrToInt(LineGrid.Cells[0, EnqLineList.Itemindex]));
          LoadOptions(StrToInt(LineGrid.Cells[0, EnqLineList.Itemindex]));
        end;

      SetDefaultPartDetails;
      EnqLineListClick(Self);
      PBEnquiryFrm.Enquiry.Lines[PBEnquiryFrm.EnquiryLineGrid.Row-1].JobType
        := PBEnqLineDtlsFrm.jobType;
    end;
  finally
    PBEnqLineDtlsFrm.Free;
  end;
end;

procedure TPBEnquiryFrm.ChangeLineBitBtnClick(Sender: TObject);
begin
  if EnquiryLineGrid.cells[0,1] = '' then exit;
  sFuncMode := 'c';
  EditLineDetails;
  ChangeEnqLineList;
end;

procedure TPBEnquiryFrm.ChangeEnqLineList;
begin
  EnqLineList.Items.insert(EnqLineList.itemindex, LineGrid.Cells[1, (iline -
      1)]);
  EnqLineList.itemindex := EnqLineList.itemindex - 1;
  EnqLineList.Items.delete(EnqLineList.itemindex + 1);
  EnquiryLineGrid.Cells[1, iline] := LineGrid.Cells[1, (iline - 1)];
  EnquiryLineGrid.Cells[2, iline] := LineGrid.Cells[2, (iline - 1)];
// Roddy : The next four lines have been added, the grid was not displaying
// updates to depth and/or width.
  EnquiryLineGrid.Cells[3, iLine] := LineGrid.Cells[3, iLine - 1] + ' ' +
    LineGrid.Cells[5, iLine - 1];
  EnquiryLineGrid.Cells[4, iLine] := LineGrid.Cells[4, iLine - 1] + ' ' +
    LineGrid.Cells[6, iLine - 1];
end;

procedure TPBEnquiryFrm.ReqByDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(ReqByDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      ReqByDateEdit.SetFocus;
      Exit;
    end;
  end;

  ReqByDateEdit.Text := PBDatestr(NewDate);
  Irequired_byval := NewDate;

end;

procedure TPBEnquiryFrm.AddSupNtsBitBtnClick(Sender: TObject);
begin
  sAddDetailMode := 'a';
  PBEnqAddDtlsfrm := TPBEnqAddDtlsfrm.Create(Self);
  try
    iAddLine := AddDetailsList.Items.Count;
    PBEnqAddDtlsfrm.ShowModal;
    if PBEnqAddDtlsfrm.ModalResult = idok then
    begin
      PBEnqlinetmp.AddGrid.RowCount := iAddLine + 1;
      AddDetailsList.Items.Add(PBEnqAddDtlsfrm.ToWhomRadioGroup.Items[PBEnqAddDtlsfrm.ToWhomRadioGroup.itemindex]);
      AddDetailsList.itemindex := iAddLine;
      AddDetailsListClick(Self);
    end;
  finally
    PBEnqAddDtlsfrm.Free;
  end;
end;

procedure TPBEnquiryFrm.AddDetailsListClick(Sender: TObject);
begin
    AddDetailsMemo.Clear;
  if AddDetailsList.Items.Count < 1 then
  begin
    ChangeSupNtsBitBtn.Enabled := False;
    DeleteSupNtsBitBtn.Enabled := False;
  end
  else
  begin
    ChangeSupNtsBitBtn.Enabled := AddSupNtsBitBtn.Enabled;
    DeleteSupNtsBitBtn.Enabled := AddSupNtsBitBtn.Enabled;
    AddDetailsMemo.Text := PBenqlinetmp.AddGrid.Cells[2,
      AddDetailsList.itemindex];
  end;
end;

procedure TPBEnquiryFrm.ChangeSupNtsBitBtnClick(Sender: TObject);
begin
  sAddDetailMode := 'c';
  PBEnqAddDtlsfrm := TPBEnqAddDtlsfrm.Create(Self);
  try
    iAddLine := AddDetailsList.itemindex;
    PBEnqAddDtlsfrm.Caption := 'Change Additional details';
    PBEnqAddDtlsfrm.ShowModal;
    if PBEnqAddDtlsfrm.ModalResult = idok then
    begin
      AddDetailsList.Items[iAddline] :=
        PBEnqAddDtlsfrm.ToWhomRadioGroup.Items[PBEnqAddDtlsfrm.ToWhomRadioGroup.itemindex];
      AddDetailsList.itemindex := iAddline;
      AddDetailsListClick(Self);
    end;
  finally
    PBEnqAddDtlsfrm.Free;
  end;
end;

procedure TPBEnquiryFrm.AddDetailsListDblClick(Sender: TObject);
begin
If ChangeSupNtsBitBtn.Enabled then
  ChangeSupNtsBitBtnClick(Self);
end;

procedure TPBEnquiryFrm.DeleteSupNtsBitBtnClick(Sender: TObject);
var
  irow, icol: Integer;
begin
  iAddLine := AddDetailsList.Itemindex;

  if MessageDlg('Confirm deletion.', mtConfirmation, [mbYes, mbNo], 0) = mrYes
    then
  begin
    AddDetailsList.Items.Delete(iAddLine);
    AddDetailsMemo.Text := '';

    {Now delete the row from the Additional Details grid}
    for irow := iAddLine to PBenqlinetmp.AddGrid.RowCount - 1 do
    begin
      for icol := 0 to 2 do
      begin
        PBenqlinetmp.AddGrid.Cells[icol, irow] :=
          PBenqlinetmp.AddGrid.Cells[icol, irow + 1];
      end;
    end;
    PBenqlinetmp.AddGrid.RowCount := PBenqlinetmp.AddGrid.RowCount - 1;

    {Set the next item to focus on}
    if AddDetailsList.Items.Count > 0 then
    begin
      AddDetailsList.itemindex := 0;
    end;
    AddDetailsListClick(Self);
  end;
end;

procedure TPBEnquiryFrm.LoadCapabilities(iProduct: Integer);
var
  MyCheckBox: TCheckBox;
  MyScrollBox, scrollbox: TScrollbox;
  ipos: Integer;
  sTempName: string;
  icount: Integer;
  iEnquiry: integer;
begin
  try
    iEnquiry := strtoint(edtEnquiryNo.text);
  except
    iEnquiry := 0;
  end;

  CapabilitySQL.Close;
  CapabilitySQL.ParamByName('Product').AsInteger := iProduct;
  CapabilitySQL.ParamByName('Enquiry').AsInteger := iEnquiry;
  CapabilitySQL.ParamByName('Line').AsInteger := iLine;
  CapabilitySQL.Open;

  CapabilitySQL.First;

  ipos := 2;

  PBenqlinetmp.CapGrid.RowCount := CapabilitySQL.RecordCount;

  try
    Scrollbox := CapabilityTabSheet.findComponent('CapabilityScrollBox' +
      IntToStr(iline)) as Tscrollbox;
    Scrollbox.free;
  except
  end;

  {Create the Scrollbox for the Capabilities for the relevant line}
  MyScrollbox := TScrollBox.Create(CapabilityTabSheet);
  try
    with MyScrollbox do
    begin
      Parent := CapabilityTabSheet;
      Font.Size := 8;
      Left := 16;
      Top := 32;
      Name := 'CapabilityScrollBox' + IntToStr(iline);
      Width := 417;
      Height := 145;
      Visible := True;
      HorzScrollBar.Visible := False;
    end;
  except
    MyScrollbox.Free;
  end;

  icount := 0;
  while (not CapabilitySQL.EOF) do
  begin
    MyCheckBox := TCheckBox.Create(MyScrollbox);
    stempname := 'chk' + Copy((IntToStr(1000 +
      CapabilitySQL.FieldByName('Capability').AsInteger)), 2, 3) + 'Line' +
      IntToStr(iline);
    MyCheckBox.Name := stempname;
    MyCheckBox.Caption := CapabilitySQL.FieldByName('Description').AsString;
    MyCheckBox.Parent := MyScrollbox;
    MyCheckBox.Left := 5;
    MyCheckBox.Top := ipos;
    MyCheckBox.Font.Size := 8;
    Mycheckbox.Width := 400;
    MyCheckBox.OnClick := CapabilityClick;

    if CapabilitySQL.FieldByName('Default_for_all').AsString = 'Y' then
      begin
        MyCheckBox.visible := false;
        MyCheckBox.checked := true;
      end
    else
      ipos := ipos + MyCheckBox.Height;

    {Update this Line Capability Grid}
    PBenqlinetmp.CapGrid.Cells[1, icount] :=
      CapabilitySQL.FieldByName('Description').AsString;
    PBenqlinetmp.CapGrid.Cells[2, icount] :=
      CapabilitySQL.FieldByName('Capability').AsString;
    PBenqlinetmp.CapGrid.Cells[3, icount] := 'False';

    CapabilitySQL.Next;
    inc(icount);
  end;

  CapabilitySQL.Close;
  {Do the access control for the capabilities. It is set in PNLUEnq} ;
  dmBroker.ScreenAccessControl(MyScrollBox,'',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBEnquiryFrm.LoadQuestions(iProduct: Integer);
var
  MyLabel: TLabel;
  MyScrollbox, scrollbox: TScrollBox;
  MyEdit: TEdit;
  MyComboBox: TComboBox;
  MySpinEdit: TSpinEdit;
  MyCheckBox: TCheckBox;
  icount: Integer;
  ipos: Integer;
  sTempName: string;
begin
  QuestionSQL .Close;
  QuestionSQL.ParamByName('Product').AsInteger := iProduct;
  QuestionSQL.Open;
  QuestionSQL.First;

  ipos := 5;
  PBenqlinetmp.QuestionGrid.RowCount := QuestionSQL.RecordCount;

  try
    Scrollbox := QuestionTabSheet.findComponent('QuestionScrollBox' +
      IntToStr(iline)) as Tscrollbox;
    Scrollbox.free;
  except
  end;

  {Recreate the Complexity Header Scroll Box}
  MyScrollbox := TScrollBox.Create(QuestionTabSheet);
  try
    with MyScrollbox do
    begin
      Parent := QuestionTabSheet;
      Font.Size := 8;
      Name := 'QuestionScrollBox' + IntToStr(iline);
      Left := 16;
      Top := 24;
      Width := 649;
      Height := 185;
      Visible := True;
      HorzScrollBar.Visible := False;
    end;
  except
    MyScrollbox.Free;
  end;

  icount := 0;
  while (not QuestionSQL.EOF) do
  begin
    if QuestionSQL.FieldByName('Prompt_Type').Asstring = 'cbo' then
      begin
        MyLabel := TLabel.Create(MyScrollbox);
        MyComboBox := TComboBox.Create(MyScrollbox);
        stempname := 'cbo' + Copy((IntToStr(1000 +
          QuestionSQL.FieldByName('Question').AsInteger)), 2, 3) + 'Line' +
          IntToStr(iline);
        Mylabel.autosize := False;
        MyComboBox.Name := stempname;
        MyLabel.Caption := QuestionSQL.FieldByName('Question_Text').AsString;
        MyComboBox.Parent := MyScrollbox;
        MyLabel.Parent := MyScrollbox;
        MyLabel.Left := 5;
//      MyLabel.Width := (MyScrollbox.Width - 35) div 2;
        MyLabel.Width := 200;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 8;
//        MyComboBox.Width := (MyScrollbox.Width - 35) - Mylabel.Width;
        MyComboBox.Width := 250;
        myComboBox.Left := mylabel.Left + mylabel.Width + 5;
        myComboBox.Text := '';
        MyComboBox.OnChange := QuestionChange;
        MyComboBox.OnDropDown := QuestionDropDown;
        mylabel.Height := myComboBox.Height;
        myComboBox.Top := mylabel.Top;
        ipos := ipos + MyComboBox.Height + 5;
      end
    else
    if QuestionSQL.FieldByName('Prompt_Type').Asstring = 'chk' then
      begin
        MyLabel := TLabel.Create(MyScrollbox);
        MyCheckBox := TCheckBox.Create(MyScrollbox);
        stempname := 'chk' + Copy((IntToStr(1000 +
          QuestionSQL.FieldByName('Question').AsInteger)), 2, 3) + 'Line' +
          IntToStr(iline);
        MyCheckBox.Name := stempname;
        MyCheckBox.Caption := '';
        MyCheckBox.Parent := MyScrollbox;

        Mylabel.autosize := False;
        MyLabel.Caption := QuestionSQL.FieldByName('Question_Text').AsString;
        MyLabel.Parent := MyScrollbox;
        MyLabel.Left := 5;
//      MyLabel.Width := (MyScrollbox.Width - 35) div 2;
        MyLabel.Width := 200;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 8;
        MyLabel.Height := 15;

        myCheckBox.Left := mylabel.Left + mylabel.Width + 5;
//        MyCheckBox.Width := (MyScrollbox.Width - 35) - Mylabel.Width;
        MyCheckBox.Width := 200;
        MyCheckBox.Top := ipos+8;
        MyCheckBox.Font.Size := 8;
        MyCheckBox.checked := false;
        MyCheckBox.OnClick := QuestionClick;
        MyCheckBox.Height := 17;
        MyLabel.Top := MyCheckBox.Top;
        ipos := ipos + MyCheckBox.Height + 12;
      end
    else
    if QuestionSQL.FieldByName('Prompt_Type').Asstring = 'spn' then
      begin
        MyLabel := TLabel.Create(MyScrollbox);
        MySpinEdit := TSpinEdit.Create(MyScrollbox);
        stempname := 'spn' + Copy((IntToStr(1000 +
          QuestionSQL.FieldByName('Question').AsInteger)), 2, 3) + 'Line' +
          IntToStr(iline);
        Mylabel.autosize := False;
        MySpinEdit.Name := stempname;
        MyLabel.Caption := QuestionSQL.FieldByName('Question_Text').AsString;
        MySpinEdit.Parent := MyScrollbox;
        MyLabel.Parent := MyScrollbox;
        MyLabel.Left := 5;
//      MyLabel.Width := (MyScrollbox.Width - 35) div 2;
        MyLabel.Width := 200;
        MySpinEdit.Top := ipos;
        Mylabel.Font.Size := 8;
        MySpinEdit.Width := 100;
//        MySpinEdit.Width := (MyScrollbox.Width - 35) - Mylabel.Width;
        mySpinEdit.Left := mylabel.Left + mylabel.Width + 5;
        mySpinEdit.value := 0;
        MySpinEdit.OnChange := QuestionChange;
        MyLabel.Height := 15;
        MySpinEdit.Height := 24;
        MySpinEdit.MaxValue := 999999;
        MyLabel.top := MySpinEdit.top+9;
        ipos := ipos + MySpinEdit.Height + 5;
      end
    else
      begin
        MyLabel := TLabel.Create(MyScrollbox);
        MyEdit := TEdit.Create(MyScrollbox);
        stempname := 'edit' + Copy((IntToStr(1000 +
          QuestionSQL.FieldByName('Question').AsInteger)), 2, 3) + 'Line' +
          IntToStr(iline);
        Mylabel.autosize := False;
        MyEdit.Name := stempname;
        MyLabel.Caption := QuestionSQL.FieldByName('Question_Text').AsString;
        MyEdit.Parent := MyScrollbox;
        MyLabel.Parent := MyScrollbox;
        MyLabel.Left := 5;
//      MyLabel.Width := (MyScrollbox.Width - 35) div 2;
        MyLabel.Width := 200;
        MyLabel.Top := ipos;
        Mylabel.Font.Size := 8;
        MyEdit.Width := (MyScrollbox.Width - 35) - Mylabel.Width;
        myedit.Left := mylabel.Left + mylabel.Width + 5;
        myedit.Text := '';
        mylabel.Height := myedit.Height;
        myedit.Top := mylabel.Top;
        ipos := ipos + Myedit.Height + 5;
      end;
    {Update this Line Capability Grid}
    PBenqlinetmp.QuestionGrid.Cells[1, icount] :=
      QuestionSQL.FieldByName('Question_Text').AsString;
    PBenqlinetmp.QuestionGrid.Cells[2, icount] :=
      QuestionSQL.FieldByName('Question').AsString;
    PBenqlinetmp.QuestionGrid.Cells[3, icount] := '';

    QuestionSQL.Next;
  end;
  QuestionSQL.Close;
  dmBroker.ScreenAccessControl(MyScrollbox,'',frmPBMainMenu.iOperator,0,0);
end;

procedure TPBEnquiryFrm.OKBitBtnClick(Sender: TObject);
begin
  {Check that all the screen details have been entered}
  if iCustomer = 0 then
  begin
    MessageDlg('Customer details have not been entered', mtError, [mbOk], 0);
    Exit;
  end;

  if (iEnquiryStatus < 35) and not SuppliersOK then
    exit;

  {Update the Enquiry details}
  GetEnquiryNumber;
  if (sEnqFuncMode = 'a') or (sEnqFuncMode = 'r') then
    UpdateEnqHeader(AddEnqHeaderSQL)
  else
    UpdateEnqHeader(UpEnqHeaderSQL);

  UpdateEnqLine;
  PBEnqDataModFrm.Save(Enquiry);

  ClearScreen;

  EnquiryMessageLbl.Caption := 'Last processed enquiry: ' + EnquiryLbl.Caption;
  PBEnquiryFrm.ModalResult := mrOK;
end;

procedure TPBEnquiryFrm.CapabilityClick(Sender: TObject);
var
  MyScrollbox: TScrollBox;
  icount: integer;
  bSetDefault: boolean;
begin
  with Sender as TCheckBox do
    begin
      myScrollbox := (parent as TScrollbox);
      bSetDefault := true;

      {Find all the capability check boxes and see if any have been set}
      for icount := 0 to pred(myscrollbox.componentcount) do
        begin
          if myscrollbox.Components[icount] is Tcheckbox then
            if (TCheckbox(myScrollbox.Components[icount]).checked) and
              (TCheckbox(myScrollbox.Components[icount]).visible) then
              begin
                bSetDefault := false;
                break;
              end;
        end;
      {Find the default capability and set it to whatever}
      for icount := 0 to pred(myscrollbox.componentcount) do
        begin
          if myscrollbox.Components[icount] is Tcheckbox then
            if not (TCheckbox(myScrollbox.Components[icount]).visible) then
              begin
              TCheckbox(myScrollbox.Components[icount]).checked := bsetDefault;
              exit;
              end;
        end;
    end;
end;

procedure TPBEnquiryFrm.QuestionClick(Sender: TObject);
begin
(* if Sender is TCheckBox then
  with Sender as TCheckBox do
    if Checked then
      SelectedLine.Questions[Tag-999999].Answer := 'Y'
    else
      SelectedLine.Questions[Tag-999999].Answer := 'N'
*)
end;

procedure TPBEnquiryFrm.QuestionChange(Sender: TObject);
begin
(* if Sender is TEDit then
  with Sender as TEdit do
    SelectedLine.Questions[Tag-999999].Answer := (Sender as TEdit).Text
 else
 if Sender is TComboBox then
  with Sender as TComboBox do
    SelectedLine.Questions[Tag-999999].Answer := (Sender as TComboBox).Text
 else
 if Sender is TSpinEdit then
  with Sender as TSpinEdit do
*)
end;

procedure TPBEnquiryFrm.QuestionDropDown(Sender: TObject);
var
  stext: string;
begin
  QuestListSQL.Close;
  QuestListSQL.ParamByName('Product_Type').AsInteger := strtoint(LineGrid.cells[0,iLine-1]);
  QuestListSQL.ParamByName('Question').AsInteger := strtoint(copy((Sender as TComboBox).Name,4,3));
  QuestListSQL.Open;
  stext := (Sender as TComboBox).Text;
  (Sender as TComboBox).Items.Clear;
  while (not QuestListSQL.EOF) do
  begin
    (Sender as TComboBox).Items.Add(Trim(QuestListSQL.FieldByName('Question_LIst_Descr').AsString));
    QuestListSQL.Next;
  end;

  if (Sender as TComboBox).items.count = 1 then
    (Sender as TComboBox).Itemindex := 0
  else
    (Sender as TComboBox).Itemindex := (Sender as TComboBox).Items.IndexOf(stext);
  if (Sender as TComboBox).Itemindex = -1 then
    (Sender as TComboBox).Text := stext;
  QuestListSQL.Close;
end;

procedure TPBEnquiryFrm.GetEnquiryNumber;
begin
  {Determine the enquiry code to use if Adding or Replicating}
  if (sEnqFuncMode = 'a') or (sEnqFuncMode = 'r') then
  begin
    LockCompanyRecord;
    try
      UpCompanySQL.Close;
      UpCompanySQl.ExecSQL;
      GetCompanySQL.Close;
      GetCompanySQL.Open;
      {Set the Enquiry number to the new number}
      iEnqNumber := GetCompanySQL.FieldByName('Last_Enquiry_Number').AsInteger;
      EnquiryLbl.Caption := inttostr(iEnqNumber);
      edtEnquiryNo.Text := inttostr(iEnqNumber);
      GetCompanySQL.Close;
    finally
      FreeCompanyRecord;
    end;
  end
  else
  begin
    {Delete the enquiry details if editing}
    DeleteEnquiry;
  end;
end;

procedure TPBEnquiryFrm.DeleteEnquiry;
begin
  {Delete all the associated Enquiry records}
 {  DelEnqSuppAddSQL.Close;
   DelEnqSuppAddSQL.ParamByName('Enquiry').AsInteger := strtoint(EnquiryLbl.Caption);
   DelEnqSuppAddSQL.ExecSQL;

   DelEnqSuppQtySQL.Close;
   DelEnqSuppQtySQL.ParamByName('Enquiry').AsInteger := strtoint(EnquiryLbl.Caption);
   DelEnqSuppQtySQL.ExecSQL;

   DelEnqSuppSQL.Close;
   DelEnqSuppSQL.ParamByName('Enquiry').AsInteger := strtoint(EnquiryLbl.Caption);
   DelEnqSuppSQL.ExecSQL;

  } DelEnqCapSQL.Close;
  DelEnqCapSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
  DelEnqCapSQL.ExecSQL;

  DelEnqPartSQL.Close;
  DelEnqPartSQL.ParamByName('Enquiry').AsInteger :=
    StrToInt(EnquiryLbl.Caption);
  DelEnqPartSQL.ExecSQL;

  DelEnqLineAddSQL.Close;
  DelEnqLineAddSQL.ParamByName('Enquiry').AsInteger :=
    StrToInt(EnquiryLbl.Caption);
  DelEnqLineAddSQL.ExecSQL;

  DelEnqQstSQL.Close;
  DelEnqQstSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
  DelEnqQstSQL.ExecSQL;

  {Delete the Enquiry options}
  DelEnqOptSQL.Close;
  DelEnqOptSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
  DelEnqOptSQL.ExecSQL;
  {
    DelEnqLineQtySQL.Close;
    DelEnqLineQtySQL.ParamByName('Enquiry').AsInteger := strtoint(EnquiryLbl.Caption);
    DelEnqLineQtySQL.ExecSQL;

    DelEnqLineSQL.Close;
    DelEnqLineSQL.ParamByName('Enquiry').AsInteger := strtoint(EnquiryLbl.Caption);
    DelEnqLineSQL.ExecSQL;

    DelEnqSQL.Close;
    DelEnqSQL.ParamByName('Enquiry').AsInteger := strtoint(EnquiryLbl.Caption);
    DelEnqSQL.ExecSQL;
  }
end;

procedure TPBEnquiryFrm.EnableOK;
begin
  {Check to enable OK button}
  if (CustomerEdit.Text = '') or
    (BranchEdit.Text = '') or
    (ContactCombo.Text = '') or
    (DescriptionEdit.Text = '') or
    (CustRepCombo.Text = '') or
    (sEnqFuncMode = 'x') or
    (not (CheckEnquiryLines)) then
    OKBitBtn.Enabled := False
  else
    OKBitBtn.Enabled := True;
end;

function TPBEnquiryFrm.CheckEnquiryLines: boolean;
var
  irow: Integer;
begin
  {Check to see if any quantities have been entered}
  for irow := 1 to EnquiryLineGrid.RowCount - 1 do
  begin
    if EnquiryLineGrid.Cells[0, irow] <> '' then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;


procedure TPBEnquiryFrm.UpdateEnqHeader(EnqHeaderSQL: TFDQuery);
begin
  {Update the Enquiry Header details}
  with EnqHeaderSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
    ParamByName('Enq_Date').AsDateTime := StrToDate(EnqDateEdit.Text);

    if (sEnqFuncMode = 'a')  or (sEnqFuncMode = 'r') then
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator
    else
      ParamByName('Operator').AsInteger := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Operator').asinteger;

    ParamByName('Contact').AsString := ContactCombo.Text + '';
    ParamByName('Req_date').AsDateTime := StrToDate(ReqByDateEdit.Text);
    ParamByName('Customer').AsInteger := iCustomer;
    ParamByName('Branch_No').AsInteger := iBranch_No;
    ParamByName('Desc').AsString := DescriptionEdit.Text;

    case rdgType.itemindex of
      0: ParamByName('Prospect_Quote').AsString := 'N';
      1: ParamByName('Prospect_Quote').AsString := 'Y';
    end;

    {Find the Customer Rep Code}
    custreps.First;
    custreps.moveby(CustRepCombo.itemindex);
    ParamByName('Rep').AsInteger := custreps.FieldByName('rep').AsInteger;
    ParamByName('Status').AsInteger := iEnquiryStatus;

    OperatorSQL.First;
    OperatorSQL.moveby(OfficeComboBox.itemindex);
    ParamByName('Office_Contact').AsInteger :=
      OperatorSQL.FieldByName('Operator').AsInteger;

    ContactSQL.First;
    ContactSQL.moveby(ContactCombo.itemindex);
    ParamByName('Contact_no').AsInteger :=
      ContactSQL.FieldByName('Contact_no').AsInteger;
    ExecSQL;
  end;
end;

procedure TPBEnquiryFrm.UpdateEnqLine;
var
  iLine: Integer;
begin
  {Update the Enquiry Line details}
  for iLine := 0 to LineGrid.RowCount - 1 do
  begin
    if LineGrid.Cells[1, iline] = '' then Break;

    {Locate the temporary form for this line}
    PBenqlinetmp := GetLineForm(IntToStr(iline + 1)) as TPBenqlinetmp;
    {Update the Enquiry Line}
    if PBEnqLinetmp.sLineMode = 'A' then
      UpdateLine(AddEnqLineSQL, iLine)
    else
      UpdateLine(UpEnqLineSQL, iLine);

    {Update everything for this line}
    UpdateEnqLineParts(iline);
    UpdateEnqLineQuestions(iline);
    UpdateEnqLineAdds(iline);
    UpdateEnqLineCaps(iline);
    UpdateEnqLineOptions(iline);

    if PBEnqLinetmp.sLineMode = 'A' then
      AddEnqSuppliers(iline)
    else
      UpEnqSuppliers(iline);
  end;
end;

function TPBEnquiryFrm.ProductTypeMinSuppliers(ProdType: integer): integer;
begin
  with qryProductType do
    begin
      close;
      parambyname('Product_Type').asinteger := ProdType;
      open;
      result := fieldbyname('Enquiry_Min_Suppliers').asinteger;
    end;
end;

function TPBEnquiryFrm.SuppliersOK: boolean;
var
  iLine, iSuppliers, iMinSuppliers: Integer;
begin
  result := true;
  {Check that enough suppliers have been added for the selected product type}
  for iLine := 0 to LineGrid.RowCount - 1 do
  begin
    if LineGrid.Cells[1, iline] = '' then Break;

    {Locate the temporary form for this line}
    PBenqlinetmp := GetLineForm(IntToStr(iline + 1)) as TPBenqlinetmp;

    iSuppliers := PBenqLineTmp.SupplierGrid.rowcount;
    iMinSuppliers := ProductTypeMinSuppliers(StrToInt(LineGrid.Cells[0, iLine]));

    if iSuppliers < iMinSuppliers then
      begin
        messagedlg('The number of suppliers assigned to line '+inttostr(iLine+1) +
                    ', is less than the minimum of ' + inttostr(iMinSuppliers) +
                    ', required for the selected product type', mtError, [mbOk], 0);
        result := false;
        exit;
      end;
  end;
end;

procedure TPBEnquiryFrm.UpdateLine(EnqLineSQL: TFDQuery; iNewLine: Integer);
begin
  with EnqLineSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
    ParamByName('Line').AsInteger := iNewLine + 1;

    ParamByName('Desc').AsString := LineGrid.Cells[1, iNewLine] + '';
    ParamByName('Parts').AsInteger := StrToInt(LineGrid.Cells[7, iNewLine]);
    if LineGrid.Cells[11, iNewLine] = '' then
      ParamByName('NCR').AsString := 'X'
    else
      ParamByName('NCR').AsString := LineGrid.Cells[11, iNewLine] + '';
    ParamByName('Depth').AsFloat := StrToFloatDef(LineGrid.Cells[3, iNewLine], 0, FormatSettings);
    ParamByName('D_Unit').AsString := Copy(LineGrid.Cells[5, iNewLine], 1, 2) +
      '';
    ParamByName('Width').AsFloat := StrToFloatDef(LineGrid.Cells[4, iNewLine], 0, FormatSettings);
    ParamByName('W_Unit').AsString := Copy(LineGrid.Cells[6, iNewLine], 1, 2) +
      '';
    ParamByName('Artwork').AsString := LineGrid.Cells[9, iNewLine] + '';
    ParamByName('Forms').AsString := LineGrid.Cells[8, iNewLine] + '';
    ParamByName('Plates').AsInteger := StrToInt(LineGrid.Cells[12, iNewLine]);
    ParamByName('Product').AsInteger := StrToInt(LineGrid.Cells[0, iNewLine]);
    ParamByName('Status').AsInteger := PBenqlinetmp.iStatus;
    ParamByName('Response').AsDateTime := StrToDate(ReqByDateEdit.Text);
    ParamByName('Firm_Order').AsString := LineGrid.Cells[13, iNewLine];

    {Determine whether any narrative was entered against the line}
    ParamByName('Narrative').AsInteger := UpdateNarrative;
    if LineGrid.Cells[16,iNewLine] = '' then
     ParamByName('Form_Reference').clear
    else
     ParamByName('Form_Reference').asinteger := StrToInt(LineGrid.Cells[16, iNewLine]);
    if LineGrid.Cells[17,iNewLine] = '' then
     ParamByName('Run_on_Quantity').asinteger := 0
    else
     ParamByName('Run_on_Quantity').asinteger := StrToInt(LineGrid.Cells[17, iNewLine]);

    ParamByName('job_type').clear;
    if assigned(self.enquiry) then
      if assigned(self.enquiry.Lines) then
        if self.enquiry.Lines.Count > (iNewLine) then
          if (self.enquiry.Lines[iNewLine].JobType > 0) then
            ParamByName('job_type').asInteger := self.enquiry.Lines[iNewLine].JobType;

    ExecSQL;
  end;
end;

function TPBEnquiryFrm.UpdateNarrative: Integer;
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := PBenqlinetmp.iNarrative;
    Narrative.DataInfo := PBenqlinetmp.NotesMemo.Text;
    Narrative.SaveToDB;
    Result := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

procedure TPBEnquiryFrm.UpdateEnqLineQuestions(iline: Integer);
var
  icount: Integer;
  scrollbox: TScrollbox;
  sAnswer: string;
  iQuestion: integer;
begin
  iQuestion := 0;
  {Find the Question scrollbox for the relevant Line}
  scrollbox := QuestionTabSheet.findComponent('QuestionScrollBox' +
    IntToStr(iline + 1)) as Tscrollbox;
  for icount := 0 to scrollbox.ComponentCount - 1 do
  begin
    if scrollbox.Components[icount] is TEdit then
    begin
      if TEdit(scrollbox.Components[icount]).Text = '' then
        Continue
      else
        begin
          iQuestion := StrToInt(Copy(TEdit(scrollbox.Components[icount]).Name, 5, 3));
          sAnswer := TEdit(scrollbox.Components[icount]).Text;
        end
    end
    else
    if scrollbox.Components[icount] is TCheckBox then
    begin
      iQuestion := StrToInt(Copy(TCheckBox(scrollbox.Components[icount]).Name, 4, 3));
      if TCheckBox(scrollbox.Components[icount]).checked then
        sAnswer := 'Y'
      else
        sAnswer := '';
    end
    else
    if scrollbox.Components[icount] is TComboBox then
    begin
      iQuestion := StrToInt(Copy(TComboBox(scrollbox.Components[icount]).Name, 4, 3));
      sAnswer := TComboBox(scrollbox.Components[icount]).Text;
    end
    else
    if scrollbox.Components[icount] is TSpinEdit then
    begin
      iQuestion := StrToInt(Copy(TSpinEdit(scrollbox.Components[icount]).Name, 4, 3));

      if TSpinEdit(scrollbox.Components[icount]).value = 0 then
        sAnswer := ''
      else
        sAnswer := TSpinEdit(scrollbox.Components[icount]).Text;
    end
    else
      continue;

    with UpEnqLineQSQL do
      begin
        Close;

        ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
        ParamByName('Line').AsInteger := iLine + 1;
        ParamByName('Question').AsInteger := iQuestion;
        ParamByName('Product').AsInteger := StrToInt(LineGrid.Cells[0, iLine]);
        ParamByName('Answer').AsString := sAnswer;

        ExecSQL;
      end;
    end;
end;

procedure TPBEnquiryFrm.UpdateEnqLineCaps(iline: Integer);
var
  icount: Integer;
  scrollbox: TScrollbox;
begin
  {Find the Capability scrollbox for the relevant line}
  scrollbox := CapabilityTabSheet.findComponent('CapabilityScrollBox' +
    IntToStr(iline + 1)) as Tscrollbox;
  for icount := 0 to scrollbox.ComponentCount - 1 do
  begin
    if scrollbox.Components[icount] is TCheckBox then
    begin
      if (not TCheckBox(scrollbox.Components[icount]).Checked) then Continue;
      with UpEnqLineCapSQL do
      begin
        Close;

        ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
        ParamByName('Line').AsInteger := iLine + 1;

        ParamByName('Product').AsInteger := StrToInt(LineGrid.Cells[0, iLine]);
        ParamByName('Cap').AsInteger :=
          StrToInt(Copy(TCheckBox(scrollbox.Components[icount]).Name, 4, 3));
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBEnquiryFrm.UpdateEnqLineAdds(iline: Integer);
var
  irow: Integer;
begin

  for irow := 0 to PBenqLineTmp.AddGrid.RowCount - 1 do
  begin
    if PBenqLineTmp.AddGrid.Cells[1, irow] = '' then Continue;

    with UpEnqLineAddSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
      ParamByName('Line').AsInteger := iLine + 1;
      ParamByName('Code').AsInteger := irow + 1;

      {Determine which values to set the parameters}
      if StrToInt(PBenqlinetmp.AddGrid.Cells[1, irow]) = 0 then
        ParamByName('FAO').AsString := 'S'
      else
        if StrToInt(PBenqlinetmp.AddGrid.Cells[1, irow]) = 1 then
          ParamByName('FAO').AsString := 'C'
        else
          ParamByName('FAO').AsString := 'B';

      ParamByName('Details').AsString := PBenqlinetmp.AddGrid.Cells[2, irow];
      ExecSQL;
    end;
  end;
end;

procedure TPBEnquiryFrm.UpdateEnqLineParts(iline: Integer);
var
  irow: Integer;
begin
  //delete any previous part details that are no longer needed
  qryDelEnqLineParts.ParamByName('enquiry').asInteger :=StrToInt(EnquiryLbl.Caption);
  qryDelEnqLineParts.ParamByName('line').asInteger := iLine + 1;
  qryDelEnqLineParts.ParamByName('part_no').asInteger := PBenqLineTmp.noOfParts;
  qryDelEnqLineParts.ExecSQL;

  for irow := 0 to PBenqLineTmp.noOfParts - 1 do
  begin
    with UpEnqLinePartSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
      ParamByName('Line').AsInteger := iLine + 1;
      ParamByName('Part').AsInteger := irow + 1;

      ParamByName('Part_Description').AsString := PBEnqLineTmp.PartGrid.Cells[0, irow] +
        '';
      ParamByName('Heading').AsString := PBEnqLineTmp.PartGrid.Cells[1, irow] +
        '';
      ParamByName('Same_As').AsInteger :=
        StrToInt(PBEnqLineTmp.PartGrid.Cells[13, irow]);
      ParamByName('Brand').AsString := PBEnqLineTmp.PartGrid.Cells[3, irow] +
        '';
      ParamByName('Material').AsString := PBEnqLineTmp.PartGrid.Cells[2, irow] +
        '';
      ParamByName('Weight').AsString := PBEnqLineTmp.PartGrid.Cells[4, irow] +
        '';
      ParamByName('Colour').AsString := PBEnqLineTmp.PartGrid.Cells[5, irow] +
        '';
      ParamByName('Face').AsString := PBEnqLineTmp.PartGrid.Cells[6, irow] +
        '';
      ParamByName('Reverse').AsString := PBEnqLineTmp.PartGrid.Cells[7, irow] +
        '';
      ParamByName('L_Type').AsString := PBEnqLineTmp.PartGrid.Cells[10, irow] +
        '';
      ParamByName('L_Width').AsString := PBEnqLineTmp.PartGrid.Cells[9, irow] +
        '';
      ParamByName('R_Type').AsString := PBEnqLineTmp.PartGrid.Cells[12, irow] +
        '';
      ParamByName('R_Width').AsString := PBEnqLineTmp.PartGrid.Cells[11, irow] +
        '';
      ParamByName('Plates').AsInteger := StrToInt(PBEnqLineTmp.PartGrid.Cells[8,
        irow]);
      ExecSQL;
    end;
  end;
end;

procedure TPBEnquiryFrm.AddEnqSuppliers(iline: Integer);
var
  icol, irow, icount, icharge: Integer;
  scrollbox: TScrollbox;
begin
  {Add all the Quantities}
  for icol := 20 to LineGrid.colcount do
  begin
    if LineGrid.Cells[icol, iline] = '' then Continue;
    with InsEnqLineQtySQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
      ParamByName('Line').AsInteger := iLine + 1;
      ParamByName('Qty').AsFloat := StrToFloatDef(LineGrid.Cells[icol, iline], 0, FormatSettings);
      ExecSQL;
    end;
  end;

  for irow := 0 to PBenqLineTmp.SupplierGrid.RowCount - 1 do
  begin
    if PBenqLineTmp.SupplierGrid.Cells[1, irow] = '' then Continue;

    with AddEnqSupplierSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
      ParamByName('Line').AsInteger := iLine + 1;
      ParamByName('Supplier').AsInteger :=
        StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
      ParamByName('Branch').AsInteger :=
        StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);

      if PBenqLineTmp.SupplierGrid.Cells[5, irow] = '' then
        ParamByName('Contact_no').clear
      else
        ParamByName('Contact_no').AsInteger :=
          StrToInt(PBenqLineTmp.SupplierGrid.Cells[5, irow]);
      if LineGrid.cells[17, iLine] = '' then
        ParamByName('Run_on_Quantity').AsInteger := 0
      else
        ParamByName('Run_on_Quantity').AsInteger := strtoint(LineGrid.cells[17, iLine]);
      ExecSQL;

      {For each Supplier add the additional Charges based on the Options selected}
      icharge := 0;
      scrollbox := OptionsTabSheet.findComponent('OptionsScrollBox' + IntToStr(iline + 1)) as Tscrollbox;
      for icount := 0 to scrollbox.ComponentCount - 1 do
        begin
          if scrollbox.Components[icount] is TCheckBox then
            begin
              if (not TCheckBox(scrollbox.Components[icount]).Checked) then Continue;
                with AddEnqSuppOChgsSQL do
                  begin
                    inc(icharge);
                    Close;
                    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
                    ParamByName('Line').AsInteger := iLine + 1;
                    ParamByName('Supplier').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
                    ParamByName('Branch_no').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
                    ParamByName('Additional_Charge').asinteger := icharge;
                    Parambyname('Details').asstring := TCheckBox(scrollbox.Components[icount]).Caption;
                    ExecSQL;
                  end;
            end;
        end;

      {For each Supplier update the Enquiry Supplier Qty table}
      for icol := 20 to LineGrid.colcount do
      begin
        if LineGrid.Cells[icol, iline] = '' then Continue;
        {Update the Enquiry Qty Details}
        with AddEnqSuppQtySQL do
        begin
          Close;
          ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
          ParamByName('Line').AsInteger := iLine + 1;
          ParamByName('Supplier').AsInteger :=
            StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
          ParamByName('Branch').AsInteger :=
            StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
          ParamByName('Qty').AsFloat := StrToFloatDef(LineGrid.Cells[icol, iline], 0, FormatSettings);
          ExecSQL;
        end;

      end;
    end;
  end;
end;

procedure TPBEnquiryFrm.UpEnqSuppliers(iline: Integer);
var
  icol, irow, icharge, icount: Integer;
  iSupplier, iBranch: Integer;
  bfound, bSupplierfound: boolean;
  scrollbox: Tscrollbox;
  tempStr: string;
begin
  with GetEnqSupplierSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
    ParamByName('Line').AsInteger := iLine + 1;
    Open;
    First;

    iSupplier := FieldByName('Supplier').AsInteger;
    iBranch := FieldByName('Branch_no').AsInteger;
    bSupplierFound := False;

    while (not EOF) do
    begin
      if (iSupplier <> FieldByName('Supplier').AsInteger) or
        (iBranch <> FieldByName('Branch_no').AsInteger) then
      begin
        {Delete all Supplier Enquiry Qtys and Supplier Enquiry Header
          if Supplier does not exist}
        if (not bSupplierFound) then
        begin
          {Delete all the Supplier Enquiry Quantities}
          DelAllEnqSuppQtysSQL.Close;
          DelAllEnqSuppQtysSQL.ParamByName('Enquiry').AsInteger :=
            FieldByName('Enquiry').AsInteger;
          DelAllEnqSuppQtysSQL.ParamByName('Line').AsInteger :=
            FieldByName('Line').AsInteger;
          DelAllEnqSuppQtysSQL.ParamByName('Supplier').AsInteger := iSupplier;
          DelAllEnqSuppQtysSQL.ParamByName('Branch_no').AsInteger := iBranch;
          DelAllEnqSuppQtysSQL.ExecSQL;

          {Delete the Supplier Enquiry Additional Charges}
          DelEnqOneSuppAddSQL.Close;
          DelEnqOneSuppAddSQL.ParamByName('Enquiry').AsInteger :=
            FieldByName('Enquiry').AsInteger;
          DelEnqOneSuppAddSQL.ParamByName('Line').AsInteger :=
            FieldByName('Line').AsInteger;
          DelEnqOneSuppAddSQL.ParamByName('Supplier').AsInteger := iSupplier;
          DelEnqOneSuppAddSQL.ParamByName('Branch_no').AsInteger := iBranch;
          DelEnqOneSuppAddSQL.ExecSQL;

          {Delete the Supplier Enquiry record}
          DelEnqSupplierSQL.Close;
          DelEnqSupplierSQL.ParamByName('Enquiry').AsInteger :=
            FieldByName('Enquiry').AsInteger;
          DelEnqSupplierSQL.ParamByName('Line').AsInteger :=
            FieldByName('Line').AsInteger;
          DelEnqSupplierSQL.ParamByName('Supplier').AsInteger := iSupplier;
          DelEnqSupplierSQL.ParamByName('Branch_no').AsInteger := iBranch;
          DelEnqSupplierSQL.ExecSQL;
        end;
        iSupplier := FieldByName('Supplier').AsInteger;
        iBranch := FieldByName('Branch_no').AsInteger;
        bSupplierFound := False;
      end;
      bfound := False;
      {Delete any records from the Database which are not required}
      for irow := 0 to PBenqLineTmp.SupplierGrid.RowCount - 1 do
      begin
        if (PBenqLineTmp.SupplierGrid.Cells[1, irow] =
          FieldByName('Supplier').AsString) and
          (PBenqLineTmp.SupplierGrid.Cells[2, irow] =
          FieldByName('Branch_no').AsString) then
        begin
          for icol := 20 to LineGrid.colcount do
          begin
            if FieldByName('Quantity').AsString = LineGrid.Cells[icol, iline]
              then
            begin
              bSupplierFound := True;
              bFound := True;
              Break;
            end;
          end;
          if (not bfound) then
          begin
            {Delete the Supplier Enquiry Quantity}
            DelEnqSupplierQtySQL.Close;
            DelEnqSupplierQtySQL.ParamByName('Enquiry').AsInteger :=
              FieldByName('Enquiry').AsInteger;
            DelEnqSupplierQtySQL.ParamByName('Line').AsInteger :=
              FieldByName('Line').AsInteger;
            DelEnqSupplierQtySQL.ParamByName('Supplier').AsInteger :=
              FieldByName('Supplier').AsInteger;
            DelEnqSupplierQtySQL.ParamByName('Branch_no').AsInteger :=
              FieldByName('Branch_no').AsInteger;
            DelEnqSupplierQtySQL.ParamByName('Quantity').AsFloat :=
              FieldByName('Quantity').AsFloat;
            DelEnqSupplierQtySQL.ExecSQL;

            DelEnqQtySQL.Close;
            DelEnqQtySQL.ParamByName('Enquiry').AsInteger :=
              FieldByName('Enquiry').AsInteger;
            DelEnqQtySQL.ParamByName('Line').AsInteger :=
              FieldByName('Line').AsInteger;
            DelEnqQtySQL.ParamByName('Quantity').AsFloat :=
              FieldByName('Quantity').AsFloat;
            DelEnqQtySQL.ExecSQL;
          end;
        end;
        if bfound then
          Break;
      end;
      Next;
      {Delete all Supplier Enquiry Qtys and Supplier Enquiry Header
         if Supplier does not exist}
      if (not bSupplierFound) then
        begin
        {Delete all the Supplier Enquiry Quantities}
        DelAllEnqSuppQtysSQL.Close;
        DelAllEnqSuppQtysSQL.ParamByName('Enquiry').AsInteger :=
          FieldByName('Enquiry').AsInteger;
        DelAllEnqSuppQtysSQL.ParamByName('Line').AsInteger :=
          FieldByName('Line').AsInteger;
        DelAllEnqSuppQtysSQL.ParamByName('Supplier').AsInteger := iSupplier;
        DelAllEnqSuppQtysSQL.ParamByName('Branch_no').AsInteger := iBranch;
        DelAllEnqSuppQtysSQL.ExecSQL;

        {Delete the Supplier Enquiry Additional Charges}
        DelEnqOneSuppAddSQL.Close;
        DelEnqOneSuppAddSQL.ParamByName('Enquiry').AsInteger :=
          FieldByName('Enquiry').AsInteger;
        DelEnqOneSuppAddSQL.ParamByName('Line').AsInteger :=
          FieldByName('Line').AsInteger;
        DelEnqOneSuppAddSQL.ParamByName('Supplier').AsInteger := iSupplier;
        DelEnqOneSuppAddSQL.ParamByName('Branch_no').AsInteger := iBranch;
        DelEnqOneSuppAddSQL.ExecSQL;

        {Delete the Supplier Enquiry record}
        DelEnqSupplierSQL.Close;
        DelEnqSupplierSQL.ParamByName('Enquiry').AsInteger :=
          FieldByName('Enquiry').AsInteger;
        DelEnqSupplierSQL.ParamByName('Line').AsInteger :=
          FieldByName('Line').AsInteger;
        DelEnqSupplierSQL.ParamByName('Supplier').AsInteger := iSupplier;
        DelEnqSupplierSQL.ParamByName('Branch_no').AsInteger := iBranch;
        DelEnqSupplierSQL.ExecSQL;
        end;
    end;
  end;

  for icol := 20 to LineGrid.colcount do
  begin
    if LineGrid.Cells[icol, iline] = '' then Continue;
    with CheckEnqQtySQl do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
      ParamByName('Line').AsInteger := iLine + 1;
      ParamByName('Quantity').AsFloat := StrToFloatDef(LineGrid.Cells[icol,iline], 0, FormatSettings);
      Open;

      if CheckEnqQtySQl.RecordCount > 0 then
        Continue;
    end;

    //the quantity is not in the database so INSERT it.
    with InsEnqLineQtySQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
      ParamByName('Line').AsInteger := iLine + 1;
      ParamByName('Qty').AsFloat := StrToFloatDef(LineGrid.Cells[icol, iline], 0, FormatSettings);
      ExecSQL;
    end;
  end;

  //check for quantities in the database that are no longer in the enquiry
  tempStr := '';
  for icol := 20 to LineGrid.colcount do
  begin
    if LineGrid.Cells[icol, iline] = '' then Continue;
    if tempStr = '' then
      tempStr := tempStr + LineGrid.Cells[icol, iline]
    else
      tempStr := tempStr + ', ' + LineGrid.Cells[icol, iline];
  end;

  qryGetLooseEnqLineQtys.Close;
  qryGetLooseEnqLineQtys.ParamByName('enquiry').asInteger := StrToInt(EnquiryLbl.Caption);
  qryGetLooseEnqLineQtys.ParamByName('Line').AsInteger := iLine + 1;
  qryGetLooseEnqLineQtys.SQL.Add('and quantity not in (' + tempStr + ')');
  qryGetLooseEnqLineQtys.Open;

  tempStr := '';
  while not qryGetLooseEnqLineQtys.EOF do
  begin
    //the row returned are quantities that are in the database but not in the
    //enquiry any more so delete them
    DelEnqQtySQL.ParamByName('enquiry').asInteger := StrToInt(EnquiryLbl.Caption);
    DelEnqQtySQL.ParamByName('Line').AsInteger := iLine + 1;
    DelEnqQtySQL.ParamByName('quantity').asFloat := qryGetLooseEnqLineQtys.FieldByName('quantity').asFloat;
    DelEnqQtySQL.ExecSQL;
    qryGetLooseEnqLineQtys.next;
  end;
  qryGetLooseEnqLineQtys.Close;
  

  {For each Supplier Check the Enquiry Supplier Qty table}
  for irow := 0 to PBenqLineTmp.SupplierGrid.RowCount - 1 do
  begin
    if PBenqLineTmp.SupplierGrid.Cells[1, irow] = '' then Continue;

    with CheckEnqSuppSQL do
    begin
      Close;
      ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
      ParamByName('Line').AsInteger := iLine + 1;
      ParamByName('Supplier').AsInteger :=
        StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
      ParamByName('Branch_no').AsInteger :=
        StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
      Open;

      if CheckEnqSuppSQL.RecordCount = 0 then
      begin
        AddEnqSupplierSQL.Close;
        AddEnqSupplierSQL.ParamByName('Enquiry').AsInteger :=
          StrToInt(EnquiryLbl.Caption);
        AddEnqSupplierSQL.ParamByName('Line').AsInteger := iLine + 1;
        AddEnqSupplierSQL.ParamByName('Supplier').AsInteger :=
          StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
        AddEnqSupplierSQL.ParamByName('Branch').AsInteger :=
          StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);

        {Add the Contact number if added}
        if PBenqLineTmp.SupplierGrid.Cells[5, irow] = '' then
          AddEnqSupplierSQL.ParamByName('Contact_no').clear
        else
          AddEnqSupplierSQL.ParamByName('Contact_no').asinteger :=
              StrToInt(PBenqLineTmp.SupplierGrid.Cells[5, irow]);
        if LineGrid.cells[17, iLine] = '' then
          AddEnqSupplierSQL.ParamByName('Run_on_Quantity').AsInteger := 0
        else
          AddEnqSupplierSQL.ParamByName('Run_on_Quantity').AsInteger := strtoint(LineGrid.cells[17, iLine]);
        AddEnqSupplierSQL.ExecSQL;

      end
      else
      begin
        {Update the Supplier Enquiry with the Contact details}
        UpEnqSupplierSQL.close;
        UpEnqSupplierSQL.ParamByName('Enquiry').AsInteger :=
          StrToInt(EnquiryLbl.Caption);
        UpEnqSupplierSQL.ParamByName('Line').AsInteger := iLine + 1;
        UpEnqSupplierSQL.ParamByName('Supplier').AsInteger :=
          StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
        UpEnqSupplierSQL.ParamByName('Branch').AsInteger :=
          StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
        if PBenqLineTmp.SupplierGrid.Cells[5, irow] = '' then
          UpEnqSupplierSQL.ParamByName('Contact_no').clear
        else
          UpEnqSupplierSQL.ParamByName('Contact_no').asinteger :=
            StrToInt(PBenqLineTmp.SupplierGrid.Cells[5, irow]);
        if LineGrid.cells[17, iLine] = '' then
          UpEnqSupplierSQL.ParamByName('Run_on_Quantity').AsInteger := 0
        else
          UpEnqSupplierSQL.ParamByName('Run_on_Quantity').AsInteger := strtoint(LineGrid.cells[17, iLine]);
        UpEnqSupplierSQL.execsql;
      end;

      {For each Supplier add the additional Charges based on the Options selected}
      scrollbox := OptionsTabSheet.findComponent('OptionsScrollBox' + IntToStr(iline + 1)) as Tscrollbox;
      for icount := 0 to scrollbox.ComponentCount - 1 do
        begin
          if scrollbox.Components[icount] is TCheckBox then
            begin
              {Check if the Optional charge exists}
              CheckEnqSuppOChgsSQL.close;
              CheckEnqSuppOChgsSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
              CheckEnqSuppOChgsSQL.ParamByName('Line').AsInteger := iLine + 1;
              CheckEnqSuppOChgsSQL.ParamByName('Supplier').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
              CheckEnqSuppOChgsSQL.ParamByName('Branch_no').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
              CheckEnqSuppOChgsSQL.ParamByName('Details').Asstring := TCheckBox(scrollbox.Components[icount]).Caption;
              CheckEnqSuppOChgsSQL.open;
              if CheckEnqSuppOChgsSQL.recordcount = 0 then  {this optional charge doesn't exist}
                begin
                  if TCheckBox(scrollbox.Components[icount]).Checked then
                    begin
                      {Get the next Charge number}
                      GetLastAddChgSQL.close;
                      GetLastAddChgSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
                      GetLastAddChgSQL.ParamByName('Line').AsInteger := iLine + 1;
                      GetLastAddChgSQL.ParamByName('Supplier').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
                      GetLastAddChgSQL.ParamByName('Branch_no').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
                      GetLastAddChgSQL.open;
                      iCharge := GetLastAddChgSQL.fieldbyname('Last_Charge_number').asinteger + 1;

                      {Add the Additional charge}
                      AddEnqSuppOChgsSQL.Close;
                      AddEnqSuppOChgsSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
                      AddEnqSuppOChgsSQL.ParamByName('Line').AsInteger := iLine + 1;
                      AddEnqSuppOChgsSQL.ParamByName('Supplier').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
                      AddEnqSuppOChgsSQL.ParamByName('Branch_no').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
                      AddEnqSuppOChgsSQL.ParamByName('Additional_Charge').asinteger := icharge;
                      AddEnqSuppOChgsSQL.Parambyname('Details').asstring := TCheckBox(scrollbox.Components[icount]).Caption;
                      AddEnqSuppOChgsSQL.ExecSQL;
                    end
                end
              else
                begin
                  if TCheckBox(scrollbox.Components[icount]).Checked then
                    continue
                  else
                    begin
                      {Delete the optional charge}
                      DelEnqSuppOChgsSQL.close;
                      DelEnqSuppOChgsSQL.ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
                      DelEnqSuppOChgsSQL.ParamByName('Line').AsInteger := iLine + 1;
                      DelEnqSuppOChgsSQL.ParamByName('Supplier').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
                      DelEnqSuppOChgsSQL.ParamByName('Branch_no').AsInteger := StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
                      DelEnqSuppOChgsSQL.ParamByName('Details').Asstring := TCheckBox(scrollbox.Components[icount]).Caption;
                      DelEnqSuppOChgsSQL.execsql;
                    end;
                end;
            end;
        end;

      {For each Supplier Check the Enquiry Supplier Qty table}
      for icol := 20 to LineGrid.colcount do
      begin
        if LineGrid.Cells[icol, iline] = '' then Continue;

        {Checkthe Enquiry Qty Details}
        with CheckEnqSuppQtySQL do
        begin
          Close;
          ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
          ParamByName('Line').AsInteger := iLine + 1;
          ParamByName('Supplier').AsInteger :=
            StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
          ParamByName('Branch_no').AsInteger :=
            StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
          ParamByName('Quantity').AsFloat := StrToFloatDef(LineGrid.Cells[icol,iline], 0, FormatSettings);
          Open;

          if CheckEnqSuppQtySQL.RecordCount > 0 then Continue;
        end;
        {Update the Enquiry Qty Details}
        with AddEnqSuppQtySQL do
        begin
          Close;
          ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
          ParamByName('Line').AsInteger := iLine + 1;
          ParamByName('Supplier').AsInteger :=
            StrToInt(PBenqLineTmp.SupplierGrid.Cells[1, irow]);
          ParamByName('Branch').AsInteger :=
            StrToInt(PBenqLineTmp.SupplierGrid.Cells[2, irow]);
          ParamByName('Qty').AsFloat := StrToFloatDef(LineGrid.Cells[icol, iline], 0, FormatSettings);
          ExecSQL;
        end;
      end;
    end;
  end;
end;

procedure TPBEnquiryFrm.ClearScreen;
var
  irow, icol, icount, icount1: Integer;
  sheet: TTabSheet;
  MyPage: TPageControl;
begin
  for icount := ComponentCount - 1 downto 0 do
  begin
    if Components[icount] is TEdit then
      TEdit(Components[icount]).Clear;

    if Components[icount] is TListBox then
      TListBox(Components[icount]).Clear;

    if Components[icount] is TSpinEdit then
      TSpinEdit(Components[icount]).value := 0;

    if Components[icount] is TScrollbox then
      TScrollbox(Components[icount]).Free;

    if Components[icount] is TPageControl then
    begin
      if TPageControl(Components[icount]).Name = 'PartPageControl' then
        Continue;
      {Find the Capability Tabsheet}
      MyPage := TPageControl(Components[icount]);
      sheet := MyPage.pages[2] as TTabsheet;

      for icount1 := sheet.ComponentCount - 1 downto 0 do
      begin
        if sheet.Components[icount1] is TScrollbox then
        begin
          TScrollbox(sheet.Components[icount1]).Free;
        end;
      end;
      {Find the Question Tabsheet}
      sheet := MyPage.pages[3] as TTabsheet;

      for icount1 := sheet.ComponentCount - 1 downto 0 do
      begin
        if sheet.Components[icount1] is TScrollbox then
        begin
          TScrollbox(sheet.Components[icount1]).Free;
        end;
      end;
    end;

    if Components[icount] is TComboBox then
    begin
      TComboBox(Components[icount]).Text := '';
      TComboBox(Components[icount]).ItemIndex := -1;
    end;
  end;

  {reSet the Enquiry Page component}
  EnquiryLinePage.Enabled := False;
  EnquiryLinePage.ActivePage := EnquiryLinePage.Pages[0];

  PartPageControl.activepage := PartPageControl.pages[0];

  {REmove all the temporary screens}
  DeleteLineForms;

  {Remove all the scrollbox components}
  DeleteLineScrollbox;

  {Clear down all the existing line details}
  for irow := 0 to LineGrid.RowCount - 1 do
  begin
    for icol := 0 to LineGrid.colcount - 1 do
    begin
      LineGrid.Cells[icol, irow] := '';
    end;
  end;

  {Clear down all the Enquiry line details}
  for irow := 1 to EnquiryLineGrid.RowCount - 1 do
  begin
    for icol := 0 to EnquiryLineGrid.colcount - 1 do
    begin
      EnquiryLineGrid.Cells[icol, irow] := '';
    end;
  end;
  EnquiryLineGrid.RowCount := 2;
  LineGrid.colcount := 20;

  {Initialise and variables used}
  InitialiseNew;

end;

procedure TPBEnquiryFrm.CancelBitBtnClick(Sender: TObject);
begin
  {	ClearScreen;
    } Close
end;

procedure TPBEnquiryFrm.ClearLineDetails(iOldLine: Integer);
var
  icount: Integer;
  sheet: TTabSheet;
  MyPage: TPageControl;
begin
  for icount := ComponentCount - 1 downto 0 do
  begin
    if ((Components[icount] as TComponent).tag < 100) or ((Components[icount] as
      TComponent).tag > 199) then Continue;
    if Components[icount] is TEdit then
      TEdit(Components[icount]).Clear;

    if Components[icount] is TListBox then
      TListBox(Components[icount]).Clear;

    if Components[icount] is TSpinEdit then
      TSpinEdit(Components[icount]).value := 0;

    if Components[icount] is TScrollbox then
      TScrollbox(Components[icount]).Free;

    if Components[icount] is TPageControl then
    begin
      if TPageControl(Components[icount]).Name = 'PartPageControl' then
        Continue;
      {Find the Capability Tabsheet}
      MyPage := TPageControl(Components[icount]);

      sheet := MyPage.pages[3] as TTabsheet;
      (sheet.findcomponent('CapabilityScrollBox' + IntToStr(iOldline)) as
        Tscrollbox).Free;

      {Find the Question Tabsheet}
      sheet := MyPage.pages[4] as TTabsheet;
      (sheet.findcomponent('QuestionScrollBox' + IntToStr(iOldline)) as
        Tscrollbox).Free;
    end;

    if Components[icount] is TComboBox then
    begin
      TComboBox(Components[icount]).Text := '';
      TComboBox(Components[icount]).ItemIndex := -1;
    end;
  end;

end;

procedure TPBEnquiryFrm.ChangeEnquiry;
begin
  {Clear the screen prior to loading all the screen fields}
  ClearScreen;

  sEnqFuncMode := 'c'; {copy}
  {Don't allow change of date if editing enquiry}
//  EnqDateEdit.ReadOnly := True;
//  EnqDateBtn.Enabled := False;
  EnquiryMessageLbl.Caption := 'Changing enquiry number: ' +
      IntToStr(iEnqNumber);

  dmBroker.CreateEnquiryDocDirectory(inttostr(iEnqNumber));
  // make the document tab visible
  EnquiryLinePage.Pages[6].tabVisible := true;

(*  compDir := dmBroker.qryCompany.FieldByName('Document_Directory').AsString;
  docDir := dmBroker.qryCompany.FieldByName('Document_Directory').AsString;
  opDir := dmBroker.GetOperatorDocDirectory(frmPBMainMenu.iOperator);
  if opDir <> '' then
    docDir := docDir + '\' + opDir + '\';
*)
  compDir := dmBroker.GetCompanyEnquiryDirectory;
  docDir := dmBroker.GetCompanyEnquiryDirectory + '\' + inttostr(iEnqNumber);

  {Retrieve all the Enquiry details}
  GetEnqHeader;
  GetEnqLine;
  Enquiry.EnquiryNo := iEnqNumber;
  PBEnqDataModFrm.Load(Enquiry);
  self.DisplayDocumentList;

  EnableOK;

  EnquiryLineGrid.Row := 1;
  EnquiryLineGridClick(Self);
end;

procedure TPBEnquiryFrm.CopyEnquiry;
begin
  {Clear the screen prior to loading all the screen fields}
  ClearScreen;

  try
    EnquiryMessageLbl.Caption := 'Copying enquiry number: ' +
      IntToStr(iEnqNumber);

    {Retrieve all the Enquiry details}
    GetEnqHeader;
    sEnqFuncMode := 'r'; {copy}
    GetEnqLine;
    Enquiry.EnquiryNo := iEnqNumber;
    PBEnqDataModFrm.Load(Enquiry);


    EnableOK;
  finally

  end;
  EnquiryLineGrid.Row := 1;
  EnquiryLineGridClick(Self);
end;

procedure TPBEnquiryFrm.ConvertPOtoEnquiry;
var
  EnqLine: TEnquiryLine;
begin
  {Clear the screen prior to loading all the screen fields}
  ClearScreen;
  {Create the PO Data Module}
  PBPODM := TPBPODM.Create(Self);
  try
     EnquiryMessageLbl.Caption := 'Converting Purchase Order ' + floattostr(rPONumber) + ' to Enquiry';
     { Create objects we need }
     PurchaseOrder := TPurchaseOrder.Create(PBPODM);
     {Get the Purchase Order line details}
     PurchaseOrder.PONumber := rPONumber;
     PBPODM.LoadPOFromDatabase(PurchaseOrder);
     FSelectedLineIndex := iPOLine-1;
     OrderLine := SelectedLine.clone;

     {Create all the Enquiry Header Details}
     SetEnquiryHeader;
     SetEnquiryLine;
     
     EnqLine := TEnquiryLine.Create;
     EnqLine.JobType := OrderLine.JobType;
     Enquiry.Lines.Add(EnqLine);

     EnableOK;
  finally
     {Now destroy the PO Objects and Data Module}
     PBPODM.Free;
     PurchaseOrder.Free;
  end;
  EnquiryLineGrid.Row := 1;
  EnquiryLineGridClick(Self);
end;

procedure TPBEnquiryFrm.ViewEnquiry;
begin
  {Clear the screen prior to loading all the screen fields}
  ClearScreen;

  try
    sEnqFuncMode := 'x'; {copy}
    {Don't allow change of date if editing enquiry}
    EnqDateEdit.ReadOnly := True;
    EnqDateBtn.Enabled := False;

    ReqByDateEdit.ReadOnly := True;
    DateBtn.Enabled := False;
    EnquiryMessageLbl.Caption := 'Viewing enquiry number: ' +
      IntToStr(iEnqNumber);

    dmBroker.CreateEnquiryDocDirectory(inttostr(iEnqNumber));
    // make the document tab visible
    EnquiryLinePage.Pages[6].tabVisible := true;

    compDir := dmBroker.GetCompanyEnquiryDirectory;
    docDir := dmBroker.GetCompanyEnquiryDirectory + '\' + inttostr(iEnqNumber);

    {Retrieve all the Enquiry details}
    GetEnqHeader;
    GetEnqLine;
    EnableOK;
  finally

  end;
  EnquiryLineGrid.Row := 1;
  EnquiryLineGridClick(Self);
end;

procedure TPBEnquiryFrm.SetEnquiryHeader;
var
  sText : string;
begin
  DisplayOperators;

  with Orderline do
     begin
       {Load all the Enquiry Header screen fields}
        CustomerEdit.Text := PBPODM.GetCustName(Customer);
        iCustomer := Customer;
        BranchEdit.Text := PBPODM.GetCustBranchName(Customer, BranchNo);
        iBranch_no := Branchno;
        iContact := CustomerContact;

        ContactComboDropDown(Self);
        sText := PBPODM.GetCustContactName(Customer, BranchNo, CustomerContact);
        ContactCombo.Itemindex := ContactCombo.Items.IndexOf(trim(stext));

        DescriptionEdit.Text := CustomersDesc;

        {Find the reps associated with the Customer and Branch}
        getcustreps;
        sText := PBPODM.GetRepDesc(Rep);
        CustRepCombo.itemindex := custrepcombo.Items.indexof(stext);

        {Load the date fields}
        EnqDateEdit.Text := PBDateStr(strtodate(PBPOToEnqfrm.EnqDateEdit.text));
        Idateval := date;
        ReqByDateEdit.Text := PBDateStr(strtodate(PBPOToEnqfrm.ReqByDateEdit.text));
        Irequired_byval := date;
        iEnquiryStatus := 10;
     end;

  Enquirylbl.Caption := '';
  edtEnquiryNo.Text := '<New Enquiry>';

  DeleteLineBitBtn.Visible := true;
end;

procedure TPBEnquiryFrm.SetEnquiryLine;
var
  icount, i: Integer;
begin
  icount := 0;
  with OrderLine do
     begin
        iline := icount + 1;
        {Load the Line Grid with the line details}
        LineGrid.Cells[0, icount] := inttostr(ProductType);
        LineGrid.Cells[1, icount] := CustomersDesc;
        LineGrid.Cells[2, icount] := PBPODM.GetProdTypeDesc(ProductType);
        LineGrid.Cells[3, icount] := PBFloatStr(Depth);
        LineGrid.Cells[4, icount] := PBFloatStr(Width);
        if DepthUnit = '' then
           DepthUnit := cMillimetres;
        LineGrid.Cells[5, icount] := DepthUnit;
        if WidthUnit = '' then
           WidthUnit := cMillimetres;
        LineGrid.Cells[6, icount] := WidthUnit;
        LineGrid.Cells[7, icount] := inttostr(PartDetails.Count);
        LineGrid.Cells[8, icount] := FormsPerBox;;
        LineGrid.Cells[9, icount] := Artwork;
        if NCROTCMix = '' then
           LineGrid.Cells[10, icount] := ''
        else
           LineGrid.Cells[10, icount] := PBPODM.GetNCRDesc(NCROTCMix);

        LineGrid.Cells[11, icount] := NCROTCMix;
        LineGrid.Cells[12, icount] := inttostr(NoOfPlateChanges);
        LineGrid.Cells[13, icount] := 'Y';
        LineGrid.Cells[14, icount] := PBPODM.GetFormRef(FormReference);
        LineGrid.Cells[15, icount] := '';
        if FormReference = 0 then
           LineGrid.Cells[16, icount] :=  ''
        else
           LineGrid.Cells[16, icount] := inttostr(FormReference);

        LineGrid.colcount := 21 + (PBPOToEnqfrm.QtyGrid.rowcount - 2);

        for i := 1 to PBPOToEnqfrm.QtyGrid.rowcount -1 do
           begin
              LineGrid.Cells[19+i, icount] := PBPOToEnqfrm.QtyGrid.cells[0,i];
           end;

        {Create the Line details temporary form}
        InitialiseLineDetails(iline);

        GetEnqLineNotes(Narrative);

        PBEnqlinetmp.iNarrative := 0;

        SetEnqLineQuestions;
        SetEnqLineAdds;
        SetEnqLineParts;
        SetEnqLineSupps;
     end;

end;

procedure TPBEnquiryFrm.SetEnqLineQuestions;
var
  scrollbox: TScrollbox;
  sCode: string;
  i: integer;
  myEdit: TEdit;
  myComboBox: TComboBox;
  myCheckBox: TCheckBox;
  mySpinEdit: TSpinEdit;
begin
  scrollbox := QuestionTabSheet.findComponent('QuestionScrollBox' +
    IntToStr(iline)) as Tscrollbox;
  scrollbox.bringtofront;
  ProductQLbl.Caption := LineGrid.Cells[2, iline - 1];

  for i := 0 to Pred(OrderLine.Questions.Count) do
     with OrderLine.Questions[i] do
        begin
          sCode := Copy(IntToStr((1000 + QuestionNo)), 2, 3);
          myEdit := (scrollbox.findcomponent('edit' + sCode + 'Line' + IntToStr(iline)) as TEdit);

          if myEdit <> nil then
            begin
              myEdit.text := Answer;
              continue;
            end;

          myComboBox := (scrollbox.findcomponent('cbo' + sCode + 'Line' + IntToStr(iline)) as TComboBox);

          if myComboBox <> nil then
            begin
              myComboBox.text := Answer;
              continue;
            end;

           myCheckBox := (scrollbox.findcomponent('chk' + sCode + 'Line' + IntToStr(iline)) as TCheckBox);

           if myCheckBox <> nil then
             begin
               myCheckBox.checked := (Answer = 'Y');
               continue;
             end;

           mySpinEdit := (scrollbox.findcomponent('spn' + sCode + 'Line' + IntToStr(iline)) as TSpinEdit);

           if mySpinEdit <> nil then
             begin
               mySpinEdit.value := strtoint(Answer);
               continue;
             end;
        end;
end;

procedure TPBEnquiryFrm.SetEnqLineAdds;
var
  i: Integer;
begin
  with Orderline do
     begin
        PBEnqlinetmp.AddGrid.RowCount := AdditionalDetails.Count;
        for i := 0 to Pred(AdditionalDetails.Count) do
           with AdditionalDetails[i] do
              begin
              {Determine which values should be set for the 'To Whom'}
              if FAOFlag = 'S' then
                 begin
                    PBEnqlinetmp.AddGrid.Cells[1,i] := '0';
                    AddDetailsList.Items.Add('Supplier Only');
                 end
              else
              if FAOFlag = 'C'
              then
                 begin
                    PBEnqlinetmp.AddGrid.Cells[1,i] := '1';
                    AddDetailsList.Items.Add('Customer Only');
                 end
              else
              if FAOFlag = 'B'
              then
                 begin
                    PBEnqlinetmp.AddGrid.Cells[1,i] := '2';
                    AddDetailsList.Items.Add('Both Customers and Suppliers');
                 end;

              PBEnqlinetmp.AddGrid.Cells[2,i] := Detail;
           end;
     end;

  AddDetailsList.itemindex := 0;
  AddDetailsListClick(Self);

end;

procedure TPBEnquiryFrm.SetEnqLineParts;
var
  i: Integer;
begin
  with OrderLine do
     begin
        PBEnqlinetmp.PartGrid.RowCount := PartDetails.Count;
        for i := 0 to Pred(PartDetails.Count) do
           begin
              PBEnqlinetmp.PartGrid.Cells[0, i] := PartDetails[i].PartNoStr;
              PBEnqlinetmp.PartGrid.Cells[1, i] := PartDetails[i].Heading;
              PBEnqlinetmp.PartGrid.Cells[2, i] := PartDetails[i].PaperMaterial;
              PBEnqlinetmp.PartGrid.Cells[3, i] := PartDetails[i].PaperBrand;
              PBEnqlinetmp.PartGrid.Cells[4, i] := PartDetails[i].PaperWeight;
              PBEnqlinetmp.PartGrid.Cells[5, i] := PartDetails[i].PaperColour;
              PBEnqlinetmp.PartGrid.Cells[6, i] := PartDetails[i].FaceInks;
              PBEnqlinetmp.PartGrid.Cells[7, i] := PartDetails[i].ReverseInks;

              {Number of Plate changes}
              PBEnqlinetmp.PartGrid.Cells[8, i] := '0';
              PBEnqlinetmp.PartGrid.Cells[9, i] := PartDetails[i].LeftMarginWidth;
              PBEnqlinetmp.PartGrid.Cells[10, i] := PartDetails[i].LeftMarginType;
              PBEnqlinetmp.PartGrid.Cells[11, i] := PartDetails[i].RightMarginWidth;
              PBEnqlinetmp.PartGrid.Cells[12, i] := PartDetails[i].RightMarginType;
              PBEnqlinetmp.PartGrid.Cells[13, i] := PBIntStr(PartDetails[i].SameAsPart);
           end;
     end;

  if PartList.Items.Count > 0 then
  begin
    PartList.itemindex := 0;
    PartListClick(Self);
  end;
end;

procedure TPBEnquiryFrm.SetEnqLineSupps;
begin
  if PBPODM.IsSupplierActive(PurchaseOrder.Supplier) then
    begin
      PBEnqlinetmp.SupplierGrid.Cells[1, 0] := inttostr(PurchaseOrder.Supplier);
      PBEnqlinetmp.SupplierGrid.Cells[2, 0] := inttostr(PurchaseOrder.Branchno);
      PBEnqlinetmp.SupplierGrid.Cells[3, 0] := PBPODM.GetSuppName(PurchaseOrder.Supplier);
      PBEnqlinetmp.SupplierGrid.Cells[4, 0] := PBPODM.GetSuppBranchName(PurchaseOrder.Supplier, PurchaseOrder.Branchno);

      if PBPODM.IsSupplierContactActive(PurchaseOrder.Supplier, PurchaseOrder.Branchno, PurchaseOrder.SupplierContactNo) then
        begin
          PBEnqlinetmp.SupplierGrid.Cells[5, 0] := inttostr(PurchaseOrder.SupplierContactNo);
          PBEnqlinetmp.SupplierGrid.Cells[6, 0] := PBPODM.GetSuppContactName(PurchaseOrder.Supplier, PurchaseOrder.Branchno, PurchaseOrder.SupplierContactNo);
        end
      else
        begin
          PBEnqlinetmp.SupplierGrid.Cells[5, 0] := '';
          PBEnqlinetmp.SupplierGrid.Cells[6, 0] := '';
        end;
    end
  else
    begin
      PBEnqlinetmp.SupplierGrid.Cells[1, 0] := '';
      PBEnqlinetmp.SupplierGrid.Cells[2, 0] := '';
      PBEnqlinetmp.SupplierGrid.Cells[3, 0] := '';
      PBEnqlinetmp.SupplierGrid.Cells[4, 0] := '';
      PBEnqlinetmp.SupplierGrid.Cells[5, 0] := '';
      PBEnqlinetmp.SupplierGrid.Cells[6, 0] := '';
    end;
end;

procedure TPBEnquiryFrm.GetEnqHeader;
var
  sCustomerContact: string;
begin
  DisplayOperators;

  PBEnqDataModFrm.EnqHeadSQL.Close;
  PBEnqDataModFrm.EnqHeadSQL.ParamByName('Enquiry').AsInteger := iEnqNumber;
  PBEnqDataModFrm.EnqHeadSQL.Open;

  with OfficeComboBox do
  begin
    itemindex :=
      OfficeComboBox.Items.indexof(PBEnqDataModFrm.EnqHeadSQL.FieldByName('Office_Name').AsString);
    if itemindex < 0 then
      itemindex := OfficeComboBox.Items.indexof(frmPBMainMenu.sOperator_name);
  end;
  {Is this a prospect of customer}
  if PBEnqDataModFrm.EnqHeadSQL.FieldByName('Prospect_Quote').AsString = 'Y' then
    rdgType.ItemIndex := 1
  else
    rdgType.ItemIndex := 0;

  {Load all the Enquiry Header screen fields}
  CustomerEdit.Text := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Name').AsString;
  iCustomer := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Customer').AsInteger;
  BranchEdit.Text := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Name_1').AsString;
  iBranch_no := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Branch_no').AsInteger;
  self.iContact := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Contact_no').AsInteger;
  sCustomerContact := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Cust_est_contact').AsString;

  if sEnqFuncMode = 'a' then
    begin
      iContact := getActiveCustomerContact(iCustomer, iBranch_no, iContact);
      if iContact = 0 then
        sCustomerContact := '';
    end;
    
  ContactComboDropDown(Self);
  {  ContactCombo.Text := PBEnqDataModFrm.EnqHeadSQL.fieldbyname('Cust_est_contact').asstring;
   } ContactCombo.itemindex :=
  ContactCombo.Items.indexof(Trim(sCustomerContact));

  DescriptionEdit.Text :=
    PBEnqDataModFrm.EnqHeadSQL.FieldByName('Description').AsString;

  {Find the reps associated with the Customer and Branch}
  getcustreps;
  {	CustRepCombo.Text := PBEnqDataModFrm.EnqHeadSQL.fieldbyname('Name_2').asstring;
  } CustRepCombo.itemindex :=
  custrepcombo.Items.indexof(PBEnqDataModFrm.EnqHeadSQL.FieldByName('Name_2').AsString);

  {Load the date fields}
  if (sEnqFuncMode = 'c') or (sEnqFuncMode = 'x') then
  begin
    EnqDateEdit.Text := PBDatestr(PBEnqDataModFrm.EnqHeadSQL.FieldByName('Date_Point').AsDateTime);
    Idateval := PBEnqDataModFrm.EnqHeadSQL.FieldByName('Date_Point').AsDateTime;
    ReqByDateEdit.Text := PBDatestr(PBEnqDataModFrm.EnqHeadSQL.FieldByName('Quote_Required_by').AsDateTime);
    Irequired_byval :=
      PBEnqDataModFrm.EnqHeadSQL.FieldByName('Quote_Required_by').AsDateTime;
    iEnquiryStatus :=
      PBEnqDataModFrm.EnqHeadSQL.FieldByName('enquiry_status').AsInteger;
  end;

  Enquirylbl.Caption := PBEnqDataModFrm.EnqHeadSQL.FieldByName('enquiry').AsString;

  edtEnquiryNo.Text := PBEnqDataModFrm.EnqHeadSQL.FieldByName('enquiry').AsString;
  
  (*  if PBEnqDataModFrm.EnqHeadSQL.fieldbyname('enquiry_status').asinteger > 30 then
     sEnqFuncMode := 'x';	{Change not allowed}
  *)
  if (sEnqFuncMode <> 'a') and (sEnqFuncMode <> 'r') then
    DeleteLineBitBtn.Visible := False;
end;

procedure TPBEnquiryFrm.GetEnqLine;
var
  icount, iqty: Integer;
begin
  PBEnqDataModFrm.EnqLineSQL.First;

  icount := 0;
  while (not PBEnqDataModFrm.EnqLineSQL.EOF) do
  begin
    iline := icount + 1;
    {Load the Line Grid with the line details}
    LineGrid.Cells[0, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Product_Type').AsString;
    LineGrid.Cells[1, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Form_Description').AsString;
    LineGrid.Cells[2, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Description').AsString;
    LineGrid.Cells[3, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Depth').AsString;
    LineGrid.Cells[4, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Width').AsString;
    LineGrid.Cells[5, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Depth_unit').AsString;
    LineGrid.Cells[6, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Width_unit').AsString;
    LineGrid.Cells[7, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('No_of_parts').AsString;
    LineGrid.Cells[8, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Forms_per_box').AsString;
    LineGrid.Cells[9, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Artwork_instructions').AsString;
    LineGrid.Cells[10, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('NCR_OTC_Descr').AsString;
    LineGrid.Cells[11, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('NCR_OTC_Mix').AsString;
    LineGrid.Cells[12, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('No_of_Plates').AsString;
    LineGrid.Cells[13, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Firm_Order').AsString;
    LineGrid.Cells[14, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Form_Reference_ID').AsString;
    LineGrid.Cells[15, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Form_Reference_Descr').AsString;
    LineGrid.Cells[16, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Form_Reference').AsString;
    LineGrid.Cells[17, icount] :=
      PBEnqDataModFrm.EnqLineSQL.FieldByName('Run_On_Quantity').AsString;

    {Update the Line Grid with the Qty details}
    if LineGrid.colcount < (21 + (PBEnqDataModFrm.EnqLineQtySQL.RecordCount - 1))
      then
      LineGrid.colcount := 21 + (PBEnqDataModFrm.EnqLineQtySQL.RecordCount - 1);

    PBEnqDataModFrm.EnqLineQtySQL.First;
    iqty := 0;
    while (not PBEnqDataModFrm.EnqLineQtySQL.EOF) do
    begin
      LineGrid.Cells[20 + iqty, iline - 1] :=
        PBEnqDataModFrm.EnqLineQtySQL.FieldByName('Quantity').AsString;
      PBEnqDataModFrm.EnqLineQtySQL.Next;
      inc(iqty);
    end;
    {Create the Line details temporary form}
    InitialiseLineDetails(iline);

    GetEnqLineNotes(PBEnqDataModFrm.EnqLineSQL.FieldByName('Narrative').AsInteger);

    if sEnqFuncMode = 'r' then
      PBEnqlinetmp.iNarrative := 0;

    if sEnqFuncMode = 'c' then
    begin
      PBEnqlinetmp.sLineMode := 'C';
      PBEnqlinetmp.istatus :=
        PBEnqDataModFrm.EnqLineSQL.FieldByName('Enquiry_Status').AsInteger;
    end;

    GetEnqLineQuestions;
    GetEnqLineAdds;
    GetEnqLineParts;
    GetEnqLineCaps;
    GetEnqLineSupps;
    GetEnqLineOptions;

    PBEnqDataModFrm.EnqLineSQL.Next;
    inc(icount);
  end;
end;

procedure TPBEnquiryFrm.GetEnqLineNotes(iNarrative: Integer);
var
  Narrative: TNarrative;
begin
  PBEnqlinetmp.iNarrative := 0;
  if iNarrative = 0 then Exit;
  PBEnqlinetmp.iNarrative := iNarrative;
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    PBEnqlinetmp.NotesMemo.Text := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

procedure TPBEnquiryFrm.GetEnqLineQuestions;
var
  scrollbox: TScrollbox;
  sCode: string;
begin
  scrollbox := QuestionTabSheet.findComponent('QuestionScrollBox' +
    IntToStr(iline)) as Tscrollbox;
  scrollbox.bringtofront;
  ProductQLbl.Caption := LineGrid.Cells[2, iline - 1];

  with PBEnqDataModFrm.EnqLineQSQL do
    begin
      First;
      while (not EOF) do
      begin
        if  (fieldbyname('Prompt_type').asstring = 'edt') or
            (fieldbyname('Prompt_type').asstring = '') then
          begin
            sCode := Copy(IntToStr((1000 + FieldByName('Question').AsInteger)), 2, 3);
            (scrollbox.findcomponent('edit' + sCode + 'Line' + IntToStr(iline)) as TEdit).Text :=
              FieldByName('Product_Answer').AsString;
          end
        else
        if fieldbyname('Prompt_type').asstring = 'chk' then
          begin
            sCode := Copy(IntToStr((1000 + FieldByName('Question').AsInteger)), 2, 3);
            (scrollbox.findcomponent('chk' + sCode + 'Line' + IntToStr(iline)) as TCheckBox).checked :=
              (FieldByName('Product_Answer').AsString = 'Y');
          end
        else
        if fieldbyname('Prompt_type').asstring = 'cbo' then
          begin
            sCode := Copy(IntToStr((1000 + FieldByName('Question').AsInteger)), 2, 3);
            (scrollbox.findcomponent('cbo' + sCode + 'Line' + IntToStr(iline)) as TComboBox).Text :=
              FieldByName('Product_Answer').AsString;
          end
        else
        if fieldbyname('Prompt_type').asstring = 'spn' then
          begin
            sCode := Copy(IntToStr((1000 + FieldByName('Question').AsInteger)), 2, 3);
            (scrollbox.findcomponent('spn' + sCode + 'Line' + IntToStr(iline)) as TSpinEdit).Text :=
              FieldByName('Product_Answer').AsString;
          end;
        Next;
      end;
    end;
end;

procedure TPBEnquiryFrm.GetEnqLineAdds;
var
  icount: Integer;
begin
  PBEnqlinetmp.AddGrid.RowCount := PBEnqDataModFrm.EnqLineAddSQL.RecordCount;
  PBEnqDataModFrm.EnqLineAddSQL.First;
  icount := 0;
  while (not PBEnqDataModFrm.EnqLineAddSQL.EOF) do
  begin
    {Determine which values should be set for the 'To Whom'}
    if PBEnqDataModFrm.EnqLineAddSQL.FieldByName('FAO_Flag').AsString = 'S' then
    begin
      PBEnqlinetmp.AddGrid.Cells[1, icount] := '0';
      AddDetailsList.Items.Add('Supplier Only');
    end
    else
      if PBEnqDataModFrm.EnqLineAddSQL.FieldByName('FAO_Flag').AsString = 'C'
        then
      begin
        PBEnqlinetmp.AddGrid.Cells[1, icount] := '1';
        AddDetailsList.Items.Add('Customer Only');
      end
      else
        if PBEnqDataModFrm.EnqLineAddSQL.FieldByName('FAO_Flag').AsString = 'B'
          then
        begin
          PBEnqlinetmp.AddGrid.Cells[1, icount] := '2';
          AddDetailsList.Items.Add('Both Customers and Suppliers');
        end;

    PBEnqlinetmp.AddGrid.Cells[2, icount] :=
      PBEnqDataModFrm.EnqLineAddSQL.FieldByName('Details').AsString;
    PBEnqDataModFrm.EnqLineAddSQL.Next;
    inc(icount);
  end;

  AddDetailsList.itemindex := 0;
  AddDetailsListClick(Self);

end;

procedure TPBEnquiryFrm.GetEnqLineParts;
var
  icount: Integer;
begin
  PBEnqlinetmp.PartGrid.RowCount := PBEnqDataModFrm.EnqLinePartSQL.RecordCount;
  PBEnqDataModFrm.EnqLinePartSQL.First;
  icount := 0;
  while (not PBEnqDataModFrm.EnqLinePartSQL.EOF) do
  begin
    PBEnqlinetmp.PartGrid.Cells[0, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Part_Description').AsString;
    PBEnqlinetmp.PartGrid.Cells[1, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Heading').AsString;
    PBEnqlinetmp.PartGrid.Cells[2, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Paper_Material').AsString;
    PBEnqlinetmp.PartGrid.Cells[3, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Paper_Brand').AsString;
    PBEnqlinetmp.PartGrid.Cells[4, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Paper_Weight').AsString;
    PBEnqlinetmp.PartGrid.Cells[5, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Paper_Colour').AsString;
    PBEnqlinetmp.PartGrid.Cells[6, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Face_Inks').AsString;
    PBEnqlinetmp.PartGrid.Cells[7, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Reverse_Inks').AsString;
    PBEnqlinetmp.PartGrid.Cells[8, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('No_of_Plate_Changes').AsString;
    PBEnqlinetmp.PartGrid.Cells[9, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Left_Margin_Width').AsString;
    PBEnqlinetmp.PartGrid.Cells[10, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Left_Margin_Type').AsString;
    PBEnqlinetmp.PartGrid.Cells[11, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Right_Margin_Width').AsString;
    PBEnqlinetmp.PartGrid.Cells[12, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Right_Margin_Type').AsString;
    PBEnqlinetmp.PartGrid.Cells[13, icount] :=
      PBEnqDataModFrm.EnqLinePartSQL.FieldByName('Same_as_Part').AsString;
    PBEnqDataModFrm.EnqLinePartSQL.Next;
    inc(icount);
  end;

  if PartList.Items.Count > 0 then
  begin
    PartList.itemindex := 0;
    PartListClick(Self);
  end;
end;

procedure TPBEnquiryFrm.GetEnqLineCaps;
var
  scrollbox: TScrollbox;
  sCode: string;
begin
  scrollbox := CapabilityTabSheet.findComponent('CapabilityScrollBox' +
    IntToStr(iline)) as Tscrollbox;
  scrollbox.bringtofront;
  ProductCLbl.Caption := LineGrid.Cells[2, iline - 1];

  PBEnqDataModFrm.EnqLineCapSQL.First;
  while (not PBEnqDataModFrm.EnqLineCapSQL.EOF) do
  begin
    sCode := Copy(IntToStr((1000 +
      PBEnqDataModFrm.EnqLineCapSQL.FieldByName('Capability').AsInteger)), 2,
        3);
    (scrollbox.findcomponent('chk' + sCode + 'Line' + IntToStr(iline)) as
      TCheckBox).Checked := True;
    PBEnqDataModFrm.EnqLineCapSQL.Next;
  end;
end;

procedure TPBEnquiryFrm.GetEnqLineSupps;
var
  icount: Integer;
begin
  PBEnqlinetmp.SupplierGrid.RowCount :=
    PBEnqDataModFrm.EnqLineSuppSQL.RecordCount;
  PBEnqDataModFrm.EnqLineSuppSQL.First;
  icount := 0;
  while (not PBEnqDataModFrm.EnqLineSuppSQL.EOF) do
  begin
    if (sEnqFuncMode = 'r') and (PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Acc_Active').AsString = 'N') then
      begin
        PBEnqDataModFrm.EnqLineSuppSQL.Next;
        continue;
      end;

    PBEnqlinetmp.SupplierGrid.Cells[1, icount] :=
      PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Supplier').AsString;
    PBEnqlinetmp.SupplierGrid.Cells[2, icount] :=
      PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Branch_no').AsString;
    PBEnqlinetmp.SupplierGrid.Cells[3, icount] :=
      PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Name').AsString;
    PBEnqlinetmp.SupplierGrid.Cells[4, icount] :=
      PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Branch_Name').AsString;

    {If copying an enquiry and the contact is inactive then don't display}
    if (sEnqFuncMode = 'r') and (PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Contact_inactive').AsString = 'Y') then
      begin
        PBEnqlinetmp.SupplierGrid.Cells[5, icount] := '';
        PBEnqlinetmp.SupplierGrid.Cells[6, icount] := '';
      end
    else
      begin
        PBEnqlinetmp.SupplierGrid.Cells[5, icount] :=
          PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Contact_no').AsString;
        PBEnqlinetmp.SupplierGrid.Cells[6, icount] :=
          PBEnqDataModFrm.EnqLineSuppSQL.FieldByName('Contact_Name').AsString;
      end;

    PBEnqDataModFrm.EnqLineSuppSQL.Next;
    inc(icount);
  end;
  PBEnqlinetmp.SupplierGrid.RowCount := icount;
end;

procedure TPBEnquiryFrm.InitialiseLineDetails(iNewLine: Integer);
var
  ipages: Integer;
begin
  {Create the temporary line form}
  PBenqlinetmp := TPBenqlinetmp.Create(application);
  PBenqlinetmp.Name := 'PBenqlinetmp' + IntToStr(iNewLine);

  PBenqlinetmp.PartGrid.RowCount := StrToInt(LineGrid.Cells[7, iNewLine - 1]);
  PBenqlinetmp.noOfParts := StrToInt(LineGrid.Cells[7, iNewLine - 1]);
  SetDefaultPartDetails;

  EnquiryLinePage.Enabled := True;
  EnquiryLinePage.ActivePage := EnquiryLinePage.Pages[0];

  EnqLineList.Items.Add(LineGrid.Cells[1, iNewLine - 1]);
  EnqLineList.itemindex := EnqLineList.Items.Count - 1;

  {Increase the number of items in the line string grids}
  lineGrid.RowCount := linegrid.RowCount + 1;

  {Set up the Enquiry Line Details Grid}
  EnquiryLineGrid.Cells[0, iNewLine] := IntToStr(inewline);
  EnquiryLineGrid.Cells[1, iNewLine] := LineGrid.Cells[1, iNewLine - 1];
  EnquiryLineGrid.Cells[2, iNewLine] := LineGrid.Cells[2, iNewLine - 1];
  EnquiryLineGrid.Cells[3, iNewLine] := LineGrid.Cells[3, iNewLine - 1] + ' ' +
    LineGrid.Cells[5, iNewLine - 1];
  EnquiryLineGrid.Cells[4, iNewLine] := LineGrid.Cells[4, iNewLine - 1] + ' ' +
    LineGrid.Cells[6, iNewLine - 1];

  EnquiryLineGrid.RowCount := EnqLineList.Items.Count + 1;

  {Make all enquiry line pages available}
  for ipages := 1 to EnquiryLinePage.Pagecount - 1 do
  begin
    EnquiryLinePage.Pages[ipages].Enabled := True;
  end;

  {Load the Capability and Question Details}
  LoadCapabilities(StrToInt(LineGrid.Cells[0, iNewLine - 1]));
  LoadQuestions(StrToInt(LineGrid.Cells[0, iNewLine - 1]));
  LoadOptions(StrToInt(LineGrid.Cells[0, iNewLine - 1]));

  EnquiryLineGrid.Row := EnquiryLineGrid.RowCount - 1;

  EnqLineListClick(Self);
end;

procedure TPBEnquiryFrm.BranchSpeedButtonClick(Sender: TObject);
begin
  PBLUBranchFrm := TPBLUBranchFrm.Create(Owner);
  try
    PBLUBranchFrm.bIs_Lookup := True;
    PBLUBranchFrm.bAllow_Upd := True;

    PBLUBranchFrm.Selcode := iBranch_no;
    PBLUBranchFrm.iCust := iCustomer;

    PBLUBranchFrm.sCustName := CustomerEdit.Text;
    PBLUBranchFrm.SelName := BranchEdit.Text;

    PBLUBranchFrm.ShowModal;
    if PBLUBranchFrm.bselected then
    begin
      IBranch_no := PBLUBranchFrm.SelCode;
      BranchEdit.Text := PBLUBranchFrm.SelName;
      ContactComboDropDown(Self);
      getcustreps;
      EnableCustomerBtns;
    end;
  finally
    PBLUBranchFrm.Free;
  end;
  EnableOK;
end;

procedure TPBEnquiryFrm.DeleteLineBitBtnClick(Sender: TObject);
var
  irow, icol: Integer;
  icount: Integer;
begin
  if MessageDlg('Confirm deletion of this enquiry line.', mtConfirmation,
    [mbYes, mbNo], 0) = mrNo then
  begin
    Exit;
  end;

  {Delete the temporary form which holds all the line details}
  PBenqlinetmp := GetLineForm(IntToStr(iline)) as TPBenqlinetmp;
  PBenqlinetmp.Free;

  {Delete the line from the Line Grid}
  for irow := (iLine - 1) to LineGrid.RowCount - 1 do
  begin
    for icol := 0 to LineGrid.colcount - 1 do
    begin
      LineGrid.Cells[icol, irow] := LineGrid.Cells[icol, irow + 1];
    end;
  end;

  LineGrid.RowCount := LineGrid.RowCount - 1;

  {Delete the line from the visible Line Grid}
  for irow := (iLine) to EnquiryLineGrid.RowCount - 1 do
  begin
    for icol := 0 to EnquiryLineGrid.colcount - 1 do
    begin
      if icol = 0 then
        EnquiryLineGrid.Cells[icol, irow] := EnquiryLineGrid.Cells[icol, irow]
      else
        EnquiryLineGrid.Cells[icol, irow] := EnquiryLineGrid.Cells[icol, irow +
          1];
    end;
  end;

  if EnquiryLineGrid.RowCount > 2 then
    EnquiryLineGrid.RowCount := EnquiryLineGrid.RowCount - 1;

  ClearLineDetails(iLine);
  Enquiry.Lines.Delete(iLine-1);

  {Rename the existing Line forms}
  for icount := iline to EnqLineList.Items.Count - 1 do
  begin
    RenameLineDetails(icount);
  end;

  {Reselect the previous line}
  EnqLineList.Items.Delete(iLine - 1);

  {reset the Enquiry Page component}
  if EnqLineList.Items.Count = 0 then
    begin
      EnquiryLinePage.Enabled := False;
      EnquiryLinePage.ActivePage := EnquiryLinePage.Pages[0];
      EnqLineList.itemindex := -1
    end
  else
    begin
      if iLine = 1 then
        EnqLineList.itemindex := 0
      else
        EnqLineList.itemindex := (iline - 2)
    end;


  EnqLineListClick(Self);
end;

procedure TPBEnquiryFrm.RenameLineDetails(iNewLine: Integer);
var
  scrollbox: TScrollbox;
begin
  {rename the temporary forms}
  PBenqlinetmp := GetLineForm(IntToStr(iNewLine + 1)) as TPBenqlinetmp;
  PBenqlinetmp.Name := 'PBenqlinetmp' + IntToStr(iNewLine);

  {Rename the Capability Scrollboxes}
  scrollbox := CapabilityTabSheet.findComponent('CapabilityScrollBox' +
    IntToStr(iNewline + 1)) as Tscrollbox;
  scrollbox.Name := 'CapabilityScrollBox' + IntToStr(iNewline);


  {Rename the Question Scrollboxes}
  scrollbox := QuestionTabSheet.findComponent('QuestionScrollBox' +
    IntToStr(iNewline + 1)) as Tscrollbox;
  scrollbox.Name := 'QuestionScrollBox' + IntToStr(iNewline);
end;

procedure TPBEnquiryFrm.BitBtn4Click(Sender: TObject);
var
  icount, iItem: Integer;
  scrollbox: Tscrollbox;
begin
  {Create the Supplier Selection form}
  PBEnqSelSupfrm := TPBEnqSelSupfrm.Create(application);
  try
    PBEnqSelSupfrm.iEnqNo := 0;
    PBEnqSelSupfrm.iEnqLine := iLine;
    PBEnqSelSupfrm.LoadSupps(Self);

    PBEnqSelSupFrm.iProdType := StrToInt(LineGrid.Cells[0, iline - 1]);

    {Load the capabilities array with the selected capabilites}
    scrollbox := CapabilityTabSheet.findComponent('CapabilityScrollBox' +
      IntToStr(iline)) as Tscrollbox;

    iItem := 0;
    for icount := 0 to scrollbox.ComponentCount - 1 do
    begin
      if scrollbox.Components[icount] is TCheckBox then
      begin
        if (not TCheckBox(scrollbox.Components[icount]).Checked) then Continue;
        PBEnqSelSupFrm.iCaps[iItem] :=
          StrToInt(Copy(TCheckBox(scrollbox.Components[icount]).Name, 4, 3));
        inc(iItem);
      end;
    end;
    {  PBEnqSelSupFrm.icapcount := iItem + 1;
    }
    PBEnqSelSupFrm.icapcount := iItem;

    {Load the Selected supplier grid with those suppliers already selected}
    PBEnqSelSupFrm.iselcount := 0;
    for icount := 0 to PBenqlinetmp.SupplierGrid.RowCount do
    begin
      if PBenqlinetmp.SupplierGrid.Cells[1, icount] = '' then Continue;
      PBEnqSelSupFrm.iselsupp[icount] :=
        StrToInt(PBenqlinetmp.SupplierGrid.Cells[1, icount]);
      PBEnqSelSupFrm.iselBranch[icount] :=
        StrToInt(PBenqlinetmp.SupplierGrid.Cells[2, icount]);
      inc(PBEnqSelSupFrm.iselcount);
    end;

    PBEnqSelSupFrm.ShowModal;

    if PBEnqSelSupFrm.ModalResult = idok then
    begin
      {Clear the Supplier selection grids}
      ClearSupplierGrids;
      PBenqlinetmp.SupplierGrid.RowCount :=
        PBEnqSelSupFrm.selsupSRC.Dataset.RecordCount;
      if PBEnqSelSupFrm.selsupSRC.Dataset.RecordCount = 0 then
        SupplierGrid.RowCount := 2
      else
        SupplierGrid.RowCount := PBEnqSelSupFrm.selsupSRC.Dataset.RecordCount +
          1;

      PBEnqSelSupFrm.selsupSRC.Dataset.First;
      icount := 0;
      while (not PBEnqSelSupFrm.selsupSRC.Dataset.EOF) do
      begin
        {Save the Supplier code}
        PBenqlinetmp.SupplierGrid.Cells[1, icount] :=
          PBEnqSelSupFrm.selsupSRC.Dataset.FieldByName('Supplier').AsString;
        PBenqlinetmp.SupplierGrid.Cells[3, icount] :=
          PBEnqSelSupFrm.selsupSRC.Dataset.FieldByName('Supp_Name').AsString;
        SupplierGrid.Cells[0, icount + 1] :=
          PBEnqSelSupFrm.selsupSRC.Dataset.FieldByName('Supp_Name').AsString;
        {Save the Supplier/Branch code}
        PBenqlinetmp.SupplierGrid.Cells[2, icount] :=
          PBEnqSelSupFrm.selsupSRC.Dataset.FieldByName('Branch_No').AsString;
        ;
        PBenqlinetmp.SupplierGrid.Cells[4, icount] :=
          PBEnqSelSupFrm.selsupSRC.Dataset.FieldByName('Branch_Name').AsString;
        SupplierGrid.Cells[1, icount + 1] :=
          PBEnqSelSupFrm.selsupSRC.Dataset.FieldByName('Branch_Name').AsString;

        PBEnqSelSupFrm.selsupSRC.Dataset.Next;
        inc(icount);
      end;
      {Set the Contacts up (again, if needed)}
      GetSupplierContacts;
    end;
  finally
    PBEnqSelSupFrm.Free;
  end;
end;

procedure TPBEnquiryFrm.ClearSupplierGrids;
var
  irow, icol: Integer;
begin
  {Clear the Supplier array}
  for irow := 1 to 20 do
    begin
      for icol := 1 to 4 do
        begin
          SupplierArray[irow,icol] := '';
        end;
    end;

  {Clear all the grids}
  for irow := 1 to SupplierGrid.RowCount - 1 do
  begin
    for icol := 0 to 6 do
    begin
      {Save the original details to Supplier array}
      SupplierArray[irow,icol] := PBenqlinetmp.SupplierGrid.Cells[icol, irow-1];

      SupplierGrid.Cells[icol, irow] := '';
      PBenqlinetmp.SupplierGrid.Cells[icol, irow-1] := '';
    end;
  end;

end;

procedure TPBEnquiryFrm.GetSupplierContacts;
var
  iline, irow: Integer;
begin
  {Check whether any of the Supplier Contacts already exist}
  for iline := 0 to pred(PBenqlinetmp.SupplierGrid.rowcount) do
  begin
    for irow := 1 to 20 do
    begin
      {Save the original details to Supplier array}
      if (SupplierArray[irow,1] = PBenqlinetmp.SupplierGrid.Cells[1, iline]) and
         (SupplierArray[irow,2] = PBenqlinetmp.SupplierGrid.Cells[2, iline]) then
      begin
        PBenqlinetmp.SupplierGrid.Cells[5, iline] := SupplierArray[irow,5];
        PBenqlinetmp.SupplierGrid.Cells[6, iline] := SupplierArray[irow,6];
        SupplierGrid.Cells[2, iline+1] := SupplierArray[irow,6];
        break;
      end;
    end;
  end;

end;

procedure TPBEnquiryFrm.ContactSpeedButtonClick(Sender: TObject);
begin
  PBLUCContaFrm := TPBLUCContaFrm.Create(Owner);
  try
    PBLUCContaFrm.bIs_Lookup := True;
    PBLUCContaFrm.bAllow_Upd := True;

    PBLUCContaFrm.icust := iCustomer;
    PBLUCContaFrm.iBranch := iBranch_no;
    PBLUCContaFrm.sCustName := Customeredit.Text;
    PBLUCContaFrm.sBranchName := Branchedit.Text;
    PBLUCContaFrm.ShowModal;
    if PBLUCContaFrm.bselected then
    begin
      iContact := PBLUCContaFrm.SelCode;
      ContactComboDropDown(Self);
      ContactCombo.Itemindex :=
        ContactCombo.Items.Indexof(PBLUCContaFrm.SelName);
    end;
  finally
    PBLUCContaFrm.Free;
  end;
  EnableOK;
end;

procedure TPBEnquiryFrm.RepSpeedButtonClick(Sender: TObject);
begin
  PBLUCRepFrm := TPBLUCRepFrm.Create(Owner);
  try
    PBLUCRepFrm.bIs_Lookup := True;
    if dmBroker.OperatorCannotChangeRep(frmPBMainMenu.iOperator) then
      PBLUCRepFrm.bAllow_Upd := false
    else
      PBLUCRepFrm.bAllow_Upd := True;

    PBLUCRepFrm.iCust := iCustomer;
    PBLUCRepFrm.iBranch := iBranch_No;
    PBLUCRepFrm.sCustName := Customeredit.Text;
    PBLUCRepFrm.sBranchName := Branchedit.Text;
    PBLUCRepFrm.ShowModal;
    if PBLUCRepFrm.bselected then
    begin
      iRep := PBLUCRepFrm.SelCode;
      getcustreps;
      CustRepCombo.Items.indexof(PBLUCRepFrm.SelName);
    end;
  finally
    PBLUCRepFrm.Free;
  end;
  EnableOK;
end;

procedure TPBEnquiryFrm.CustRepComboDropDown(Sender: TObject);
var
  stext: string;
begin
  CustRepSQL.Close;
  CustRepSQL.ParamByName('Customer').AsInteger := iCustomer;
  CustRepSQL.ParamByName('Branch').AsInteger := iBranch_No;
  CustRepSQL.Open;

  stext := CustRepCombo.Text;

  CustRepCombo.Clear;

  CustRepSQL.First;

  while (not CustRepSQL.EOF) do
  begin
    CustRepCombo.Items.Add(CustRepSQl.FieldByName('Rep_Name').AsString);
    CustRepSQL.Next;
  end;

  CustRepCombo.Itemindex := CustRepCombo.Items.IndexOf(stext);

  if CustRepCombo.Itemindex = -1 then CustRepCombo.Text := stext;

end;

procedure TPBEnquiryFrm.EnquiryLineGridClick(Sender: TObject);
begin
  EnqLineList.itemindex := EnquiryLineGrid.Row - 1;
  EnqLineListClick(Self);
  DisplayDocumentList;
end;

procedure TPBEnquiryFrm.EnqDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := IDateVal;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      IDateVal := DateSelV5Form.Date;
      EnqDateEdit.Text := PBDatestr(Idateval);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBEnquiryFrm.EnqDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  try
    NewDate := StrToDate(EnqDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      EnqDateEdit.SetFocus;
      Exit;
    end;
  end;

  EnqDateEdit.Text := PBDatestr(NewDate);
  Idateval := NewDate;
end;

procedure TPBEnquiryFrm.SameAsPartEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  EnterPartGrid((Sender as TEdit).tag - 100, (Sender as TEdit).Text);

  DisplaySameAsDetails(StrToInt((Sender as TEdit).Text));
  UpdatePartDetails(PartList.Itemindex);
end;

procedure TPBEnquiryFrm.SameAsPartEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBEnquiryFrm.SameAsPartSpinClick(Sender: TObject; Button:
  TUDBtnType);
begin
  if Button = btnext then
    {Increment same as value upto 100}
  begin
    if StrToInt(SameAsPartEdit.Text) = 100 then
      Exit
    else
      SameAsPartEdit.Text := IntToStr(StrToInt(SameAsPartEdit.Text) + 1);
  end
  else
  begin
    {Increment same as value downto 0}
    if StrToInt(SameAsPartEdit.Text) = 0 then
      Exit
    else
      SameAsPartEdit.Text := IntToStr(StrToInt(SameAsPartEdit.Text) - 1);
  end;

  EnterPartGrid(SameAsPartEdit.tag - 100, SameAsPartEdit.Text);

  DisplaySameAsDetails(StrToInt(SameAsPartEdit.Text));
  UpdatePartDetails(PartList.Itemindex);
end;

procedure TPBEnquiryFrm.CustomerEditChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBEnquiryFrm.BranchEditChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnquiryFrm.ContactComboChange(Sender: TObject);
begin
  if ContactSQL.Locate('name', ContactCombo.Text, []) then
  begin
    iContact := ContactSQL.FieldByName('contact_no').asInteger;
  end;
  EnableOK;
end;

procedure TPBEnquiryFrm.CustRepComboChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnquiryFrm.DescriptionEditChange(Sender: TObject);
begin
  with LineGrid do
    begin
      if (rowcount = 2) and (cells[1,0] <> '') then
        begin
          cells[1,0] := DescriptionEdit.text;
          enquiryLineGrid.cells[1,1] := cells[1,0];
        end;
    end;
  EnableOK;
end;

procedure TPBEnquiryFrm.BitBtn1Click(Sender: TObject);
begin
  LWMarginEdit.Text := '1/2"';
  PBenqlinetmp.PartGrid.Cells[9, ipart - 1] := '1/2"';
  RWMarginEdit.Text := '1/2"';
  PBenqlinetmp.PartGrid.Cells[11, ipart - 1] := '1/2"';
  LMarginTypeEdit.Text := 'Std';
  PBenqlinetmp.PartGrid.Cells[10, ipart - 1] := 'Std';
  RMarginTypeEdit.Text := 'Std';
  PBenqlinetmp.PartGrid.Cells[12, ipart - 1] := 'Std';

end;

function TPBEnquiryFrm.GetSelectedLine: TOrderLine;
begin
  if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := PurchaseOrder.OrderLines[FSelectedLineIndex];
end;

procedure TPBEnquiryFrm.ColourComboBoxEnter(Sender: TObject);
var
  stext: string;
begin
  PaperDetailSQL.SQL.clear;
  PaperDetailSQL.SQL.Add('Select * from ');
  PaperDetailSQL.SQL.Add((Sender as TComboBox).hint);
  PaperDetailSQL.SQL.Add('Order by');
  PaperDetailSQL.SQL.Add((Sender as TComboBox).hint + '_Description');
  PaperDetailSQL.close;
  PaperDetailSQL.open;

  stext := (Sender as TComboBox).Text;

  (Sender as TComboBox).Clear;

  PaperDetailSQL.First;

  while (not PaperDetailSQL.EOF) do
  begin
    (Sender as TComboBox).Items.Add(PaperDetailSQL.Fields[1].AsString);
    PaperDetailSQL.Next;
  end;

  (Sender as TComboBox).Itemindex := (Sender as TComboBox).Items.IndexOf(stext);

  if (Sender as TComboBox).Itemindex = -1 then (Sender as TComboBox).Text := stext;

end;

procedure TPBEnquiryFrm.ColourComboBoxExit(Sender: TObject);
begin
  EnterPartGrid(((Sender as TComboBox).tag - 100), (Sender as TComboBox).Text);
end;

procedure TPBEnquiryFrm.BitBtn2Click(Sender: TObject);
begin
  {Start up the groupings program}
  PBMaintpaperFrm := TPBMaintpaperFrm.Create(Self);
  try
    PBMaintPaperFrm.ShowModal;
  finally
    PBMaintPaperFrm.Free;
  end;
end;

procedure TPBEnquiryFrm.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TPBEnquiryFrm.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := frmPBMainMenu.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;
procedure TPBEnquiryFrm.PartListDblClick(Sender: TObject);
var
  PBPartDescDlg: TPBPartDescDlg;
  sPartDescr: string;
begin
  sPartDescr := PartList.Items[PartList.itemindex];
  if PartList.ItemIndex >= 0 then
//    with SelectedLine.PartDetails[PartList.ItemIndex] do
    begin
      PBPartDescDlg := TPBPartDescDlg.Create(Self);
      try
        PBPartDescDlg.Description := sPartDescr;
        if PBPartDescDlg.ShowModal = mrOK then
        begin
          PBenqlinetmp.PartGrid.Cells[0, ipart - 1] := PBPartDescDlg.Description;
//          PartDescription := PBPartDescDlg.Description;
          PartList.Items[PartList.ItemIndex] := PBPartDescDlg.Description;
        end;
      finally
        PBPartDescDlg.Free;
      end;
    end;
end;

procedure TPBEnquiryFrm.EnquiryLineGridDblClick(Sender: TObject);
begin
  ChangeLineBitBtnClick(Self);
end;

procedure TPBEnquiryFrm.SupplierGridDblClick(Sender: TObject);
begin
  If ContactSelBitBtn.Enabled then
        ContactSelBitBtnClick(self);
end;

procedure TPBEnquiryFrm.SupplierGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
//(*  {Code extracted from the Delphi Info base No 609}
//  if Sender = ActiveControl then Exit;
//  if not (gdSelected in State) then Exit;
//  with Sender as TStringGrid do
//  begin
//    Canvas.Brush.Color := Color;
//    Canvas.Font.Color := Font.Color;
//    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
//      Cells[Col, Row]);
//  end;
//*)
end;

procedure TPBEnquiryFrm.ContactSelBitBtnClick(Sender: TObject);
var
  irow: integer;
begin
  iRow := SupplierGrid.row;
  {Don't do anything if row selected has nothing in it or if it's the heading row}
  if (SupplierGrid.cells[0,irow] = '') or (irow = 0) then exit;

  PBLUSContaFrm := TPBLUSContaFrm.Create(Self);
  try
    PBLUSContaFrm.bIs_Lookup := True;
    PBLUSContaFrm.bAllow_Upd := True;
    try
      PBLUSContaFrm.SelCode := strtoint(PBenqlinetmp.SupplierGrid.Cells[5, irow-1]);
    except
      PBLUSContaFrm.SelCode := 0;
    end;

    PBLUSContaFrm.iSupp := strtoint(PBenqlinetmp.SupplierGrid.Cells[1, irow-1]);
    PBLUSContaFrm.iBranch := strtoint(PBenqlinetmp.SupplierGrid.Cells[2, irow-1]);
    PBLUSContaFrm.sSuppName := SupplierGrid.Cells[0,irow];
    PBLUSContaFrm.sBranchName := SupplierGrid.Cells[1,irow];
    PBLUSContaFrm.ShowModal;
    if PBLUSContaFrm.bSelected then
    begin
      PBenqlinetmp.SupplierGrid.Cells[5,irow-1] := inttostr(PBLUSContaFrm.SelCode);
      PBenqlinetmp.SupplierGrid.Cells[6,irow-1] := PBLUSContaFrm.SelName;
      SupplierGrid.Cells[2,irow] := PBLUSContaFrm.SelName;
    end;
  finally
    PBLUSContaFrm.Free;
  end;
end;

procedure TPBEnquiryFrm.GetOptions;
var
  Scrollbox: TScrollBox;
begin
  scrollbox := OptionsTabSheet.findComponent('OptionsScrollBox' +
    IntToStr(iline)) as Tscrollbox;
  lblPTOptions.Caption := LineGrid.Cells[2, iline - 1];
  scrollbox.bringtofront;
end;

procedure TPBEnquiryFrm.LoadOptions(iProduct: Integer);
var
  MyCheckBox: TCheckBox;
  MyScrollBox, scrollbox: TScrollbox;
  ipos: Integer;
  sTempName: string;
  icount: Integer;
begin
  OptionsSQL.close;
  OptionsSQL.ParamByName('Product').AsInteger := iProduct;
  OptionsSQL.Open;
  OptionsSQL.First;

  ipos := 2;

  PBenqlinetmp.OptionsGrid.RowCount := OptionsSQL.RecordCount;

  try
    Scrollbox := OptionsTabSheet.findComponent('OptionsScrollBox' +
      IntToStr(iline)) as Tscrollbox;
    Scrollbox.free;
  except
  end;

  {Create the Scrollbox for the Options for the relevant line}
  MyScrollbox := TScrollBox.Create(OptionsTabSheet);
  try
    with MyScrollbox do
    begin
      Parent := OptionsTabSheet;
      Font.Size := 8;
      Left := 16;
      Top := 32;
      Name := 'OptionsScrollBox' + IntToStr(iline);
      Width := 417;
      Height := 145;
      Visible := True;
      HorzScrollBar.Visible := False;
    end;
  except
    MyScrollbox.Free;
  end;

  icount := 0;
  while (not OptionsSQL.EOF) do
  begin
    MyCheckBox := TCheckBox.Create(MyScrollbox);
    stempname := 'chkOC' + Copy((IntToStr(1000 +
      OptionsSQL.FieldByName('Optional_Charge').AsInteger)), 2, 3) + 'Line' +
      IntToStr(iline);
    MyCheckBox.Name := stempname;
    MyCheckBox.Caption := OptionsSQL.FieldByName('Description').AsString;
    MyCheckBox.Parent := MyScrollbox;
    MyCheckBox.Left := 5;
    MyCheckBox.Top := ipos;
    MyCheckBox.Font.Size := 8;
    Mycheckbox.Width := 400;

    ipos := ipos + MyCheckBox.Height;

    {Update this Line Optional Charge Grid}
    PBenqlinetmp.OptionsGrid.Cells[1, icount] :=
      OptionsSQL.FieldByName('Description').AsString;
    PBenqlinetmp.OptionsGrid.Cells[2, icount] :=
      OptionsSQL.FieldByName('Optional_Charge').AsString;
    PBenqlinetmp.OptionsGrid.Cells[3, icount] := 'False';

    OptionsSQL.Next;
    inc(icount);
  end;

  OptionsSQL.Close;
  {Do the access control for the Options} ;
  dmBroker.ScreenAccessControl(MyScrollBox,'',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBEnquiryFrm.UpdateEnqLineOptions(iline: Integer);
var
  icount: Integer;
  scrollbox: TScrollbox;
begin
  {Find the Options scrollbox for the relevant line}
  scrollbox := OptionsTabSheet.findComponent('OptionsScrollBox' +
    IntToStr(iline + 1)) as Tscrollbox;
  for icount := 0 to scrollbox.ComponentCount - 1 do
  begin
    if scrollbox.Components[icount] is TCheckBox then
    begin
      if (not TCheckBox(scrollbox.Components[icount]).Checked) then Continue;
      with UpEnqLineOptSQL do
      begin
        Close;

        ParamByName('Enquiry').AsInteger := StrToInt(EnquiryLbl.Caption);
        ParamByName('Line').AsInteger := iLine + 1;

        ParamByName('Product').AsInteger := StrToInt(LineGrid.Cells[0, iLine]);
        ParamByName('Optional_Charge').AsInteger :=
          StrToInt(Copy(TCheckBox(scrollbox.Components[icount]).Name, 6, 3));
        ExecSQL;
      end;
    end;
  end;
end;

procedure TPBEnquiryFrm.GetEnqLineOptions;
var
  scrollbox: TScrollbox;
  sCode: string;
begin
  scrollbox := OptionsTabSheet.findComponent('OptionsScrollBox' +
    IntToStr(iline)) as Tscrollbox;
  scrollbox.bringtofront;
  lblPTOptions.Caption := LineGrid.Cells[2, iline - 1];

  PBEnqDataModFrm.EnqLineOptSQL.First;
  while (not PBEnqDataModFrm.EnqLineOptSQL.EOF) do
  begin
    sCode := Copy(IntToStr((1000 +
      PBEnqDataModFrm.EnqLineOptSQL.FieldByName('Optional_Charge').AsInteger)), 2,
        3);
    (scrollbox.findcomponent('chkOC' + sCode + 'Line' + IntToStr(iline)) as
      TCheckBox).Checked := True;
    PBEnqDataModFrm.EnqLineOptSQL.Next;
  end;
end;

procedure TPBEnquiryFrm.FormActivate(Sender: TObject);
begin
  {Do the access control for the entire form} ;
  dmBroker.ScreenAccessControl(Self,'mnuEnquiries',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBEnquiryFrm.FormCreate(Sender: TObject);
begin
//  AutoSize := true;

  {Create the form which gets all the enquiry data}
  PBEnqDataModFrm := TPBEnqDataModFrm.Create(Self);
  dmPBDocObjects := TdmPBDocObjects.Create(self);
  Enquiry := TEnquiry.Create;
  CCSCommon.LoadFormLayout(myRedeye_INIFILE, self);
end;

procedure TPBEnquiryFrm.AddNotesMemoChange(Sender: TObject);
begin
  EnterAddNotes(AddNotesMemo.Text);
end;

procedure TPBEnquiryFrm.FormDestroy(Sender: TObject);
begin
  DeleteLineForms;

  if assigned(PBEnqDataModFrm) then
    PBEnqDataModFrm.free;

  if assigned(dmPBDocObjects) then
    dmPBDocObjects.free;

  if assigned(Enquiry) then
    Enquiry.Free;
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBEnquiryFrm.DisplayDocumentList;
var
  docInx: integer;
  tempStr: string;
  line: TEnquiryLine;
begin
  ResetDocumentListDisplay;

  if enquiry.Lines.Count = 0 then
    exit;

  try
    if EnquiryLineGrid.Row > 0 then
      line := Enquiry.Lines[EnquiryLineGrid.Row-1]
    else
      line := Enquiry.Lines[0];
  except
    exit;
  end;
  
  if line.DocumentList.Count > 0 then
  begin
    strgrdDocs.RowCount := line.DocumentList.Count + 1;
    btbtnChangeDoc.Enabled := true;
    btbtnDeleteDoc.enabled := true;
    btbtnOpen.Enabled := true;
  end
  else
  begin
    strgrdDocs.RowCount := 2;
    btbtnChangeDoc.Enabled := false;
    btbtnDeleteDoc.enabled := false;
    btbtnOpen.Enabled := false;
  end;

  for docInx := 0 to (line.DocumentList.Count - 1) do
  begin
    strgrdDocs.cells[0, docInx + 1] := line.DocumentList[docInx].Title;
    tempStr :=  line.DocumentList[docInx].Path;
    
    if copy(tempStr, 1 ,1) = '\' then
      strgrdDocs.cells[1, docInx + 1] := copy(tempStr,2, length(tempStr))
    else
      strgrdDocs.cells[1, docInx + 1] := tempStr;
  end;
end;

procedure TPBEnquiryFrm.ResetDocumentListDisplay;
begin
  strgrdDocs.cells[0, 0] := 'Title';
  strgrdDocs.cells[1, 0] := 'Location';
  strgrdDocs.cells[0, 1] := '';
  strgrdDocs.cells[1, 1] := '';
  strgrdDocs.ColWidths[0] := 200;
  strgrdDocs.ColWidths[1] := strgrdDocs.Width - 205;

  strgrdDocs.RowCount := 2;
end;

procedure TPBEnquiryFrm.btbtnAddDocClick(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
//  PBMaintEnquiryDocFrm: TPBMaintEnquiryDocFrm;
  document: TDocument;
  icount: integer;
begin
  docDir := dmBroker.GetCompanyEnquiryDirectory + '\' + inttostr(iEnqNumber);
  tempStr2 := docDir;

  tempStr := '';

  {Find a document} ;
  With DocOpenDialog do
  begin
    InitialDir := tempStr2;
    FileName := tempStr ;
    ForceCurrentDirectory := false;
    If Execute then
    begin
      {Check that they have NOT gone out of document directory} ;
      If Lowercase(Copy(FileName,1, Length(docDir))) <> Lowercase(docDir) then
      begin
        MessageDlg('You can''t select a document outside the Enquiry Document Directory',
                                                mtError,[mbOK],0) ;
      end
      else
      begin
        for icount := 0 to pred(Files.Count) do
          begin
            Document := TDocument.Create;
            Document.Title := Copy(Files.Strings[icount], Length(docDir)+2,100);
            Document.Path := Copy(Files.Strings[icount], length(dmBroker.GetCompanyEnquiryDirectory)+1,255);
            if assigned(document) then
              Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList.add(document);
          end;
      end;
      self.DisplayDocumentList;
    end;
  end;
(*  PBMaintEnquiryDocFrm := TPBMaintEnquiryDocFrm.create(self);
  try
    PBMaintEnquiryDocFrm.dirext := '\'+inttostr(iEnqNumber);
    document := PBMaintEnquiryDocFrm.New;
    if assigned(document) then
    begin
      Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList.add(document);
      self.DisplayDocumentList;
    end;
  finally
    PBMaintEnquiryDocFrm.free;
  end;
*)
end;

procedure TPBEnquiryFrm.btbtnChangeDocClick(Sender: TObject);
var
  PBMaintEnquiryDocFrm: TPBMaintEnquiryDocFrm;
begin
  PBMaintEnquiryDocFrm := TPBMaintEnquiryDocFrm.create(self);
  try
    PBMaintEnquiryDocFrm.edit(Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList[strgrdDocs.row - 1]);
    if PBMaintEnquiryDocFrm.ModalResult = mrOK then
    begin
      self.DisplayDocumentList;
    end;
  finally
    PBMaintEnquiryDocFrm.free;
  end;
end;

procedure TPBEnquiryFrm.btbtnDeleteDocClick(Sender: TObject);
var
  PBMaintEnquiryDocFrm: TPBMaintEnquiryDocFrm;
begin
  PBMaintEnquiryDocFrm := TPBMaintEnquiryDocFrm.create(self);
  try
    PBMaintEnquiryDocFrm.Delete(Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList[strgrdDocs.row - 1]);
    if PBMaintEnquiryDocFrm.ModalResult = mrOK then
    begin
      Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList.Delete(strgrdDocs.row - 1);
      self.DisplayDocumentList;
    end;
  finally
    PBMaintEnquiryDocFrm.free;
  end;
end;

procedure TPBEnquiryFrm.btbtnOpenClick(Sender: TObject);
var
  iTempResult: Integer;
  FiName, DiName, Params: Array [0..255] of char ;
  document: TDocument;
  sTempError: String ;
  tempdir: string;
begin
  if strgrdDocs.Cells[1, strgrdDocs.row] = '' then
    exit;

  document := Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList[strgrdDocs.row - 1];

  if (copy(compdir,length(compdir),1) <> '\') and
      (compdir <> '') then
    tempdir := compDir + '\'
  else
    tempdir := trim(compDir);

  {NOT a PDF so just open the document} ;
  Params := '' ;
  StrPCopy(FiName, compDir + document.path) ;

(*  If UpperCase(Copy(document.path, Length(document.path)-3,4)) <> '.PDF' then
  begin
    {NOT a PDF so just open the document} ;
    Params := '' ;
    StrPCopy(FiName, compDir + document.path) ;
  end
  else
  begin
    {IS a PDF so just open it in internet explorer} ;
    StrPCopy(Params, compDir + document.path) ;
    StrPCopy(FiName,'iExplore.exe') ;
  end;
*)
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

procedure TPBEnquiryFrm.btnEmailClick(Sender: TObject);
var
  sTo, sSubject, sBody, sFilePath: string;
begin
  PBMaintPOEmailfrm := TPBMaintPOEmailfrm.create(self);
  try
    PBMaintPOEmailfrm.AddressType := atCustomerOnly;
    PBMaintPOEmailfrm.Customer := ICustomer;
    PBMaintPOEmailfrm.CustomerBranch := IBranch_No;
    PBMaintPOEmailfrm.CustomerContact := iContact;
    PBMaintPOEmailfrm.showmodal;
    if PBMaintPOEmailfrm.modalresult = idOK then
      begin
        sTo := PBMaintPOEmailfrm.edtEmail.text;
        sSubject := PBMaintPOEmailfrm.edtSubject.text;
        SendAndSaveEmail(sTo, sSubject);
      end;
  finally
    PBMaintPOEmailfrm.free;
  end;
end;

procedure TPBEnquiryFrm.SendAndSaveEmail(sTo, sSubject: string);
var
  sBody, sFilePath: string;
  okToSave: boolean;
  IniFile: TIniFile;
  docExt: string;
  document: TDocument;
  inx: integer;
begin
  docExt := '.msg';
  svDlgOfficeDoc.Filter := 'Outlook Email (*.msg)|*.msg';

  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    FEmailApplication := IniFile.ReadString('Email', 'Application', 'None');
  finally
    IniFile.Free;
  end;

  sBody := '';
  sfilePath := docdir;
  okToSave := false;

  EmailAndSaveViaOutlook(sTo,sSubject,sBody,sFilePath,okToSave, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

  if okToSave then
  begin
    document := TDocument.create;
    try
      document.New(sFilePath, docExt);

      document.Path := trim(copy(sFilePath, length(compDir)+1, length(sFilePath)));
      document.Title := document.Path;

      //add the file extention if it is missing or remove it from the title if it is there
      if copy(document.path, length(document.path) - 3, 4) <> docExt then
          document.path := document.path + docExt
      else
          document.Title := copy(document.Title, 1, length(document.Title) - 4);

      inx := pos('\', document.Title);
      while inx <> 0 do
      begin
          document.Title := copy(document.Title, inx+1, length(document.Title));
          inx := pos('\', document.Title);
      end;

      Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList.add(document);
      self.DisplayDocumentList;

      self.strgrdDocs.row := self.strgrdDocs.RowCount - 1; //choose the newest item in the list
    except
        if assigned(document) then
          document.free;
    end;
  end;
end;

procedure TPBEnquiryFrm.btbtnWordDocClick(Sender: TObject);
var
  document: TDocument;
  docExt: String;
  okToSave, userCancelled, docSaved: boolean;
  inx: integer;
begin
  okToSave := false;
  userCancelled := false;
  docSaved := false;

  if (Sender as TBitBtn) = btbtnWordDoc then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc)|*.doc';
  end
  else if (Sender as TBitBtn) = btbtnExcelSheet then
  begin
    docExt := '.xls';
    svDlgOfficeDoc.Filter := 'Excel Worksheet(*.xls)|*.xls';
  end
  else
  begin
    exit; //go no further
  end;

  document := TDocument.create;
  try
    document.New(docDir, docExt);
    svDlgOfficeDoc.InitialDir := docDir;
    svDlgOfficeDoc.FileName := document.Path;
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
            MessageDlg('This file name already exists and may be linked to a Purchase Order. Please choose another file name.', mtWarning, [mbOK], 0);
            okToSave := false;
          end
          else
          begin
            okToSave := true;
          end;
        end
        else
        begin
          MessageDlg('You can''t save a document outside the Company Document Directory',
                                                mtError,[mbOK],0) ;
          svDlgOfficeDoc.FileName := document.Path;
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
      //ok so the user didn't cancel the save dialogue and has chosen a valid
      //save location
      document.Path := copy(svDlgOfficeDoc.FileName, length(compDir)+1, length(svDlgOfficeDoc.FileName));
      document.Title := document.Path;

      //add the file extention if it is missing or remove it from the title if it is there
      if copy(document.path, length(document.path) - 3, 4) <> docExt then
        document.path := document.path + docExt
      else
        document.Title := copy(document.Title, 1, length(document.Title) - 4);

      inx := pos('\', document.Title);
      while inx <> 0 do
      begin
        document.Title := copy(document.Title, inx+1, length(document.Title));
        inx := pos('\', document.Title);
      end;

      Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList.add(document);
      self.DisplayDocumentList;

      if docExt = '.doc' then
      begin
        try
          PBWordOLEFrm := TPBWordOLEFrm.Create(self);
          PBWordOLEFrm.SaveAsDocument(compDir+document.Path);
          docSaved := true;
        finally
          PBWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          PBExcelOLEFrm := TPBExcelOLEFrm.Create(self);
          PBExcelOLEFrm.SaveAsDocument(compDir+document.Path);
          docSaved := true;
        finally
          PBExcelOLEFrm.Free;
        end;
      end;

      if docSaved then
      begin
        self.strgrdDocs.row := self.strgrdDocs.RowCount - 1; //choose the newest item in the list
        self.btbtnOpenClick(Self);
      end;
    end
    else
    begin
      document.free;
    end;
  except
    if assigned(document) then
      document.free;
  end;
end;

procedure TPBEnquiryFrm.btbtnExcelSheetClick(Sender: TObject);
var
  document: TDocument;
  docExt: String;
  okToSave, userCancelled, docSaved: boolean;
  inx: integer;
begin
  okToSave := false;
  userCancelled := false;
  docSaved := false;

  if (Sender as TBitBtn) = btbtnWordDoc then
  begin
    docExt := '.doc';
    svDlgOfficeDoc.Filter := 'Word Document(*.doc)|*.doc';
  end
  else if (Sender as TBitBtn) = btbtnExcelSheet then
  begin
    docExt := '.xls';
    svDlgOfficeDoc.Filter := 'Excel Worksheet(*.xls)|*.xls';
  end
  else
  begin
    exit; //go no further
  end;

  document := TDocument.create;
  try
    document.New(docDir, docExt);
    svDlgOfficeDoc.InitialDir := docDir;
    svDlgOfficeDoc.FileName := document.Path;
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
            MessageDlg('This file name already exists and may be linked to a Purchase Order. Please choose another file name.', mtWarning, [mbOK], 0);
            okToSave := false;
          end
          else
          begin
            okToSave := true;
          end;
        end
        else
        begin
          MessageDlg('You can''t save a document outside the Company Document Directory',
                                                mtError,[mbOK],0) ;
          svDlgOfficeDoc.FileName := document.Path;
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
      //ok so the user didn't cancel the save dialogue and has chosen a valid
      //save location
      document.Path := copy(svDlgOfficeDoc.FileName, length(compDir)+1, length(svDlgOfficeDoc.FileName));
      document.Title := document.Path;

      //add the file extention if it is missing or remove it from the title if it is there
      if copy(document.path, length(document.path) - 3, 4) <> docExt then
        document.path := document.path + docExt
      else
        document.Title := copy(document.Title, 1, length(document.Title) - 4);

      inx := pos('\', document.Title);
      while inx <> 0 do
      begin
        document.Title := copy(document.Title, inx+1, length(document.Title));
        inx := pos('\', document.Title);
      end;

      Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList.add(document);
      self.DisplayDocumentList;

      if docExt = '.doc' then
      begin
        try
          PBWordOLEFrm := TPBWordOLEFrm.Create(self);
          PBWordOLEFrm.SaveAsDocument(compDir+document.Path);
          docSaved := true;
        finally
          PBWordOLEFrm.Free;
        end;
      end
      else
      begin
        try
          PBExcelOLEFrm := TPBExcelOLEFrm.Create(self);
          PBExcelOLEFrm.SaveAsDocument(compDir+document.Path);
          docSaved := true;
        finally
          PBExcelOLEFrm.Free;
        end;
      end;

      if docSaved then
      begin
        self.strgrdDocs.row := self.strgrdDocs.RowCount - 1; //choose the newest item in the list
        self.btbtnOpenClick(Self);
      end;
    end
    else
    begin
      document.free;
    end;
  except
    if assigned(document) then
      document.free;
  end;
end;

procedure TPBEnquiryFrm.strgrdDocsDblClick(Sender: TObject);
begin
  btbtnOpenClick(self);
end;

procedure TPBEnquiryFrm.ParseMessage(const AFileName: string; var ATo, AFrom,
  ASubject, ADate, ABody: string);
var
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
    ASubject := MyStrings.Values['Subject'];
    ADate := MyStrings.Values['Date'];
  finally
    MyStrings.Free;
  end;
{ Trancate the body text and remove line-ends }
  ABody := StringReplace(Copy(ABody, 0, 64), #13, ' ', [rfReplaceAll]);
  ABody := StringReplace(ABody, #10, ' ', [rfReplaceAll]) + ' ...';
end;

procedure TPBEnquiryFrm.AddDocumentToEnquiry;
var
  MyFileName, MyTo, MyFrom, MySubject, MyDate, MyBody: string;
  Document: TDocument;
begin
  MyFileName := DroppedEmailFile;
  ParseMessage(MyFileName, MyTo, MyFrom, MySubject, MyDate, MyBody);
  Document := TDocument.Create;
  Document.Title := MySubject;
  Document.Path := Copy(MyFileName, length(dmBroker.GetCompanyEnquiryDirectory)+1,255);

  if assigned(document) then
    begin
      Enquiry.Lines[EnquiryLineGrid.Row - 1].DocumentList.add(document);
      self.DisplayDocumentList;
    end;
end;

function TPBEnquiryFrm.GetActiveCustomerContact(tempCust, tempBranch,
  tempCode: integer): integer;
begin
  result := 0;
  with qryGetActiveCustomerContact do
    begin
      close;
      parambyname('Customer').asinteger := tempCust;
      parambyname('Branch_no').asinteger := tempBranch;
      parambyname('Contact_no').asinteger := tempCode;
      open;
      result := fieldbyname('Contact_no').asinteger;
    end;
end;

procedure TPBEnquiryFrm.rdgTypeClick(Sender: TObject);
begin
  case (Sender as TRadioGroup).itemindex of
    0:  lblCustomerLabel.caption := 'Customer';
    1:  lblCustomerLabel.Caption := 'Prospect';
  end;
end;

end.
