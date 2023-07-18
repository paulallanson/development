unit wtRSMaterialAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, OleCtnrs, QrCtrls, DB,
  DBTables, Spin, Menus, IniFiles;

type
  TfrmWTRSMaterialAnalysis = class(TForm)
    btnPrint: TButton;
    Button4: TButton;
    rdgrpReps: TRadioGroup;
    rdgrpCustomer: TRadioGroup;
    grpbxDate: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFrom: TEdit;
    edtDateTo: TEdit;
    btnDatefrom: TBitBtn;
    btnDateTo: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    btnExcel: TBitBtn;
    btnPreview: TButton;
    grpbxReps: TGroupBox;
    Label3: TLabel;
    cmbReps: TComboBox;
    qryReps: TQuery;
    dtsReps: TDataSource;
    rdgrpSortBy1: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    GroupBox3: TGroupBox;
    NoofCustSpin: TSpinEdit;
    rdgrpContacts: TRadioGroup;
    grpbxContacts: TGroupBox;
    Label6: TLabel;
    cmbContacts: TComboBox;
    qryReport: TQuery;
    rdgrpSortBy2: TRadioGroup;
    rdgrpDetailed: TRadioGroup;
    rdgrpCategory: TRadioGroup;
    qryContacts: TQuery;
    dtsContacts: TDataSource;
    qrySOReport: TQuery;
    grpbxCustomer: TGroupBox;
    Label4: TLabel;
    btnCustomer: TButton;
    lstbxCustomers: TListBox;
    lstbxCustomersCode: TListBox;
    pmnCustomers: TPopupMenu;
    Delete1: TMenuItem;
    rdgrpValueBy: TRadioGroup;
    qrySIReport: TQuery;
    procedure Button4Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure rdgrpCustomerClick(Sender: TObject);
    procedure enableOK(Sender: TObject);
    procedure btnDatefromClick(Sender: TObject);
    procedure edtDateFromExit(Sender: TObject);
    procedure btnDateToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure rdgrpRepsClick(Sender: TObject);
    procedure cmbRepsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rdgrpContactsClick(Sender: TObject);
    procedure cmbContactsClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
  private
    DateFrom, DateTo: TDateTime;
    iIntselcode: integer;
    rep, OfficeContact, customer: integer;
    FReportType: string;
    procedure RunReport(const bPreview: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure LoadReps;
    function BuildQueryString(report: Boolean): string;
    procedure FixQuery(rep: Boolean);
    procedure LoadContacts;
    procedure SetReportType(const Value: string);
    procedure BuildSelection;
  public
    property ReportType: string read FReportType write SetReportType;
  end;

var
  frmWTRSMaterialAnalysis: TfrmWTRSMaterialAnalysis;

implementation

uses allCommon, WTSrchCustomer, DateSelV5, wtDataModule, WTRPMaterialAnalysis;

{$R *.dfm}

const

  SQLSICore =

  'FROM (Int_Sel '+
  '    INNER JOIN (Operator '+
  '    INNER JOIN (Rep '+
  '    INNER JOIN (Customer '+
  '    INNER JOIN Sales_Invoice '+
  '      ON Customer.Customer = Sales_Invoice.Customer) '+
  '      ON Rep.Rep = Sales_Invoice.Rep) '+
  '      ON Operator.Operator = Sales_Invoice.Account_Manager) '+
  '      ON Int_Sel.Sel1 = Sales_Invoice.Sales_Invoice) '+
  '    INNER JOIN (Worktop_Type '+
  '    INNER JOIN (Material_Type '+
  '    INNER JOIN Worktop '+
  '      ON Material_Type.Material_Type = Worktop.Material_Type) '+
  '      ON Worktop_Type.Worktop_Type = Material_Type.Worktop_Type) '+
  '      ON Int_Sel.Sel2 = Worktop.Worktop ';

  SQLSOCore =

  'FROM (Int_Sel '+
  '    INNER JOIN (Operator '+
  '    INNER JOIN (Rep '+
  '    INNER JOIN (Customer '+
  '    INNER JOIN Sales_Order '+
  '      ON Customer.Customer = Sales_Order.Customer) '+
  '      ON Rep.Rep = Sales_Order.Rep) '+
  '      ON Operator.Operator = Sales_Order.Account_Manager) '+
  '      ON Int_Sel.Sel1 = Sales_Order.Sales_Order) '+
  '    INNER JOIN (Worktop_Type '+
  '    INNER JOIN (Material_Type '+
  '    INNER JOIN Worktop '+
  '      ON Material_Type.Material_Type = Worktop.Material_Type) '+
  '      ON Worktop_Type.Worktop_Type = Material_Type.Worktop_Type) '+
  '      ON Int_Sel.Sel2 = Worktop.Worktop ';

  SQLOfficeContactSelect =
  'SELECT Operator.Operator_Name as Office_Contact_Name, '+
  '      Worktop_Type.Description as Type_Description, '+
  '      Material_Type.Description as Material_Description, '+
  '      Worktop.Description as Worktop_Description, ';
//  '      Sum(Quote_Element.Unit_Price*((Quote_Element.Depth*Quote_Element.Length)/1000000)*Quote_Element.Quantity) AS Total_Value ';

  SQLRepSelect =
  'SELECT Rep.Rep_Name as Rep_Name, '+
  '      Worktop_Type.Description as Type_Description, '+
  '      Material_Type.Description as Material_Description, '+
  '      Worktop.Description as Worktop_Description, ';
//  '      Sum(Quote_Element.Unit_Price*((Quote_Element.Depth*Quote_Element.Length)/1000000)*Quote_Element.Quantity) AS Total_Value ';

  SQLCustomerSelect =
  'SELECT Customer.Customer_Name, '+
  '      Worktop_Type.Description as Type_Description, '+
  '      Material_Type.Description as Material_Description, '+
  '      Worktop.Description as Worktop_Description, ';
//  '      Sum(Quote_Element.Unit_Price*((Quote_Element.Depth*Quote_Element.Length)/1000000)*Quote_Element.Quantity) AS Total_Value ';

  SQLWorktopSelect =
  'SELECT  Worktop_Type.Description as Type_Description, '+
  '      Material_Type.Description as Material_Description, '+
  '      Worktop.Description as Worktop_Description, ';
//  '      Sum(Quote_Element.Unit_Price*((Quote_Element.Depth*Quote_Element.Length)/1000000)*Quote_Element.Quantity) AS Total_Value ';

  SQLOfficeContactGroupBy =
  'GROUP BY '+
  '      Operator.Operator_Name, '+
  '      Worktop_Type.Description, '+
  '      Material_Type.Description, '+
  '      Worktop.Description '+
  'ORDER BY '+
  '      Operator.Operator_Name, ';

  SQLRepGroupBy =
  'GROUP BY '+
  '      Rep.Rep_Name, '+
  '      Worktop_Type.Description, '+
  '      Material_Type.Description, '+
  '      Worktop.Description '+
  'ORDER BY '+
  '      Rep.Rep_Name, ';

  SQLCustomerGroupBy =
  'GROUP BY '+
  '      Customer.Customer_Name, '+
  '      Worktop_Type.Description, '+
  '      Material_Type.Description, '+
  '      Worktop.Description '+
  'ORDER BY '+
  '      Customer.Customer_Name, ';

  SQLWorktopGroupBy =
  'GROUP BY '+
  '      Worktop_Type.Description, '+
  '      Material_Type.Description, '+
  '      Worktop.Description '+
  'ORDER BY ';

  SQLCompoOrderBy =
  '      Worktop_Type.Description, ';
//  '      Sum(Quote_Element.Unit_Price*((Quote_Element.Depth*Quote_Element.Length)/1000000)*Quote_Element.Quantity) DESC ';

  SQLMaterialOrderBy =
  '      Material_Type.Description, ';
//  '      Sum(Quote_Element.Unit_Price*((Quote_Element.Depth*Quote_Element.Length)/1000000)*Quote_Element.Quantity) DESC ';

  SQLWorktopOrderBy = '';
//  '      Sum(Quote_Element.Unit_Price*((Quote_Element.Depth*Quote_Element.Length)/1000000)*Quote_Element.Quantity) DESC ';

  SQLValueByMaterial =
  '      Sum(Sel3) ';

  SQLValueByOrder =
  '      Sum(Sel4) ';

  SQLArea =
  '      Sum(Sel5) ';

  SQLCount =
  '      Count(Sel1) ';


procedure TfrmWTRSMaterialAnalysis.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTRSMaterialAnalysis.btnPrintClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TfrmWTRSMaterialAnalysis.FixQuery(rep: Boolean);
begin
  qryReport.DisableControls;
  try
    qryReport.Close;
    qryReport.SQL.Clear;
    qryReport.SQL.text := BuildQueryString(true);
//    qryReport.Open;
  finally
    qryReport.EnableControls;
  end;
end;


function TfrmWTRSMaterialAnalysis.BuildQueryString(report: Boolean): string;
var
  iCount: integer;
  sTemp : string;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
{rebuilds the query string depending on the sort selections}
  {Specify select rows}
  case rdgrpSortBy1.itemindex of
  0: stemp := SQLOfficeContactSelect;
  1: stemp := SQLRepSelect;
  2: stemp := SQLCustomerSelect;
  else
    stemp := SQLWorktopSelect;
  end;

  case rdgrpValueBy.itemindex of
  0: stemp := sTemp + SQLValueByOrder + ' AS Total_Value, ' + SQLCount + ' AS Total_Count, ' + SQLArea + ' AS Total_Area ';
  1: stemp := sTemp + SQLValueByMaterial + ' AS Total_Value, ' + SQLCount + ' AS Total_Count, ' + SQLArea + ' AS Total_Area ';
  end;


  if ReportType = 'SI' then
    begin
      sTemp := stemp + SQLSICore;

      sTemp := sTemp + ' WHERE Sales_Invoice.Sales_Invoice_Status > 10 ';
      sTemp := sTemp + ' AND Int_Sel.Int_Sel_Code = ' + inttostr(iIntselcode);
//      sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date >= ' + qDate(DateFrom);
//      sTemp := sTemp + ' AND Sales_Invoice.Invoice_Date <= ' + qDate(DateTo);
      sTemp := sTemp + ' AND ((Sales_Invoice.Inactive <> ''Y'') or (Sales_Invoice.Inactive is null))';

      if (OfficeContact <> 0) then
      begin
        sTemp := sTemp + ' AND Sales_invoice.Account_Manager = ' + IntToStr(OfficeContact) + ' ';
      end;

      if (Rep <> 0) then
      begin
        sTemp := sTemp + ' AND Sales_Invoice.Rep = ' + IntToStr(Rep) + ' ';
      end;

(*      if (Customer <> 0) then
      begin
        sTemp := sTemp + ' AND Sales_Invoice.Customer = ' + IntToStr(Customer) + ' ';
      end;
*)
      if lstbxCustomersCode.Items.count > 0 then
        begin
          sTemp := sTemp + ' AND (';
          for icount := 0 to pred(lstbxCustomersCode.Items.count) do
            begin
              if iCount = 0 then
                sTemp := sTemp + '(Sales_Invoice.Customer = ' + lstbxCustomersCode.items[iCount] + ')'
              else
                sTemp := sTemp + ' OR (Sales_Invoice.Customer = ' + lstbxCustomersCode.items[iCount] + ')';
            end;
          sTemp := sTemp + ')';
        end;
    end
  else
    begin
      sTemp := stemp + SQLSOCore;

      sTemp := sTemp + ' WHERE Sales_Order.Sales_Order_Status >= 10 ';
      sTemp := sTemp + ' AND Int_Sel.Int_Sel_Code = ' + inttostr(iIntselcode);
//      sTemp := sTemp + ' AND Sales_Order.Date_Raised >= ' + qDate(DateFrom);
//      sTemp := sTemp + ' AND Sales_Order.Date_Raised <= ' + qDate(DateTo);
      sTemp := sTemp + ' AND ((Sales_Order.Inactive <> ''Y'') or (Sales_Order.Inactive is null))';

      if (OfficeContact <> 0) then
      begin
        sTemp := sTemp + ' AND Sales_Order.Account_Manager = ' + IntToStr(OfficeContact) + ' ';
      end;

      if (Rep <> 0) then
      begin
        sTemp := sTemp + ' AND Sales_Order.Rep = ' + IntToStr(Rep) + ' ';
      end;

(*      if (Customer <> 0) then
      begin
        sTemp := sTemp + ' AND Sales_Order.Customer = ' + IntToStr(Customer) + ' ';
      end;
*)
      if lstbxCustomersCode.Items.count > 0 then
        begin
          sTemp := sTemp + ' AND (';
          for icount := 0 to pred(lstbxCustomersCode.Items.count) do
            begin
              if iCount = 0 then
                sTemp := sTemp + '(Sales_Order.Customer = ' + lstbxCustomersCode.items[iCount] + ')'
              else
                sTemp := sTemp + ' OR (Sales_Order.Customer = ' + lstbxCustomersCode.items[iCount] + ')';
            end;
          sTemp := sTemp + ')';
        end;
    end;


  case rdgrpSortBy1.itemindex of
  0: sTemp := sTemp + SQLOfficeContactGroupBy;
  1: sTemp := sTemp + SQLRepGroupBy;
  2: sTemp := sTemp + SQLCustomerGroupBy;
  else
    sTemp := sTemp + SQLWorktopGroupBy;
  end;

  case rdgrpSortBy2.itemindex of
  0: sTemp := sTemp + SQLCompoOrderBy;
  1: sTemp := stemp + SQLMaterialOrderBy;
  else
    sTemp := stemp + SQLWorktopOrderBy;
  end;

  case rdgrpValueBy.itemindex of
  0: Result := sTemp + SQLValueByOrder + ' DESC ';
  1: Result := sTemp + SQLValueByMaterial + ' DESC ';
  end;

end;

procedure TfrmWTRSMaterialAnalysis.BuildSelection;
var
	icount: integer;
begin
	dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
  with qryReport do
    begin
      close;
      if ReportType = 'SI' then
        sql.text := qrySIReport.SQL.Text
      else
        sql.text := qrySOReport.SQL.Text;

      parambyname('Date_From').asdatetime := datefrom;
      parambyname('Date_To').asdatetime := dateto;
      open;

      while EOF <> true do
        begin
          dtmdlWorktops.qryAddIntSelFull.Close;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Sel1').AsFloat := fieldbyname('Sales_Reference').asfloat;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Sel2').AsFloat := fieldbyname('Worktop').asfloat;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Sel3').AsFloat := fieldbyname('Worktop_Value').asfloat;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Sel4').AsFloat := fieldbyname('Goods_Value').asfloat;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Sel5').AsFloat := fieldbyname('Worktop_Area').asfloat;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Tag').clear;
          dtmdlWorktops.qryAddIntSelFull.ParamByName('Text100').clear;
          dtmdlWorktops.qryAddIntSelFull.execSQL;
          next;
        end;
    end;
end;

procedure TfrmWTRSMaterialAnalysis.RunReport(const bPreview: boolean);
begin
  datefrom := padatestr(edtDateFrom.Text);
  dateto := padatestr(edtDateTo.Text);

  BuildSelection;
  FixQuery(true);

  frmWTRPMaterialAnalysis := TfrmWTRPMaterialAnalysis.create(self);
  try

//  Check if any records
    frmWTRPMaterialAnalysis.qryReport.sql.text := qryReport.SQL.text;
    frmWTRPMaterialAnalysis.SortBy1 := rdgrpSortBy1.itemindex;
    frmWTRPMaterialAnalysis.SortBy2 := rdgrpSortBy2.itemindex;

    if frmWTRPMaterialAnalysis.GetDetails = 0 then
      begin
        MessageDlg('No records to print', mtInformation, [mbOk], 0);
        exit;
      end;

    frmWTRPMaterialAnalysis.qrlblCaption.Caption := 'Sales by Material Report - Value by ' + rdgrpValueBy.Items[rdgrpValueBy.itemindex];
    frmWTRPMaterialAnalysis.qrlblDateRange.Caption := grpbxDate.caption + ' between ' + edtDateFrom.Text + ' to ' + edtDateTo.Text;
    frmWTRPMaterialAnalysis.qrlblSelection.Caption := 'Office Contact: ' + cmbContacts.Text + 'Reps: ' + cmbReps.Text + ' Customers: ' + lstbxCustomers.Items[0];
    frmWTRPMaterialAnalysis.qrbGroupHeader1.ForceNewPage := chkbxPageBreak.Checked;

    if rdgrpSortBy2.ItemIndex < 2 then
      frmWTRPMaterialAnalysis.Detailed := (rdgrpDetailed.itemindex = 0)
    else
      frmWTRPMaterialAnalysis.Detailed := true;

    if bPreview then
      begin
          frmWTRPMaterialAnalysis.qrpDetails.Preview;
      end
    else
      begin
          frmWTRPMaterialAnalysis.qrpDetails.PrinterSetup;
          if frmWTRPMaterialAnalysis.qrpDetails.tag = 0 then
            frmWTRPMaterialAnalysis.qrpDetails.Print;
      end;
  finally
    frmWTRPMaterialAnalysis.free;
  end;

end;

procedure TfrmWTRSMaterialAnalysis.btnCustomerClick(Sender: TObject);
var
  iCount: integer;
begin
  frmwtSrchCustomer := TfrmwtSrchCustomer.create(self);
  try
    frmwtSrchCustomer.CodeSelected := Customer;
    frmwtSrchCustomer.showmodal;
    if frmwtSrchCustomer.modalresult = idOK then
      begin
//        lstbxSelectedCustomers.Clear;
//        edtCustomer.Clear;
        for iCount := (frmwtSrchCustomer.dbgDetails.SelectedRows.Count - 1) downto 0 do
          begin
            frmwtSrchCustomer.dbgDetails.datasource.DataSet.GotoBookmark(TBookmark(frmwtSrchCustomer.dbgDetails.SelectedRows[iCount])) ;
            lstbxCustomersCode.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer').asstring);
            lstbxCustomers.Items.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
//            edtCustomer.Lines.Add(frmwtSrchCustomer.dbgDetails.datasource.DataSet.fieldbyname('Customer_Name').asstring);
          end;
      end;
  finally
    frmwtSrchCustomer.free;
  end;
  enableOK(self);
end;

procedure TfrmWTRSMaterialAnalysis.rdgrpCustomerClick(Sender: TObject);
begin
  case rdgrpCustomer.itemindex of
  0:  begin
        Customer := 0;
        lstbxCustomers.clear;
        lstbxCustomers.items.Add('All Customers');
        lstbxCustomersCode.Clear;
        grpbxCustomer.enabled := false;
      end;
  1:  begin
        lstbxCustomers.clear;
        grpbxCustomer.enabled := true;
      end;
  end;
  enableok(self);
end;

procedure TfrmWTRSMaterialAnalysis.enableOK(Sender: TObject);
begin
  btnPrint.enabled := (cmbContacts.text <> '') and (lstbxCustomers.count > 0) and (cmbReps.text <> '');
  btnPreview.Enabled := btnPrint.enabled;
  btnExcel.enabled := btnPrint.enabled;
end;

procedure TfrmWTRSMaterialAnalysis.btnDatefromClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateFrom.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateFrom.text;

  edtDateFrom.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSMaterialAnalysis.edtDateFromExit(Sender: TObject);
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

function TfrmWTRSMaterialAnalysis.InputDate(TempDate: TDateTime): TDateTime;
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

procedure TfrmWTRSMaterialAnalysis.btnDateToClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateto.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateto.text;

  edtDateto.text := paDatestr(InputDate(paDateStr(tempdate)));
end;

procedure TfrmWTRSMaterialAnalysis.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  try
  with IniFile do
    begin
      rdgrpValueBy.ItemIndex := strtoint(ReadString('Material Analysis Report', 'Value By', '0'));
    end;
  finally
    IniFile.Free;
  end;

  officeContact := 0;
  customer := 0;
  rep := 0;
  DateFrom := Date - 30;
  DateTo := Date;
  edtdateFrom.Text := paDateStr(datefrom);
  edtDateTo.Text := paDateStr(dateto);
  iIntselcode := dtmdlWorktops.GetNextIntSelCode(Self);
end;

procedure TfrmWTRSMaterialAnalysis.btnExcelClick(Sender: TObject);
var
  reccount: integer;
  tmpFileName: string;
begin
  datefrom := padatestr(edtDateFrom.Text);
  dateto := padatestr(edtDateTo.Text);

  BuildSelection;
  FixQuery(true);

  frmWTRPMaterialAnalysis := TfrmWTRPMaterialAnalysis.create(self);
  try

//  Check if any records
    frmWTRPMaterialAnalysis.qryReport.sql.text := qryReport.SQL.text;
    frmWTRPMaterialAnalysis.SortBy1 := rdgrpSortBy1.itemindex;
    frmWTRPMaterialAnalysis.SortBy2 := rdgrpSortBy2.itemindex;

    reccount := frmWTRPMaterialAnalysis.GetDetails;
    if reccount = 0 then
      begin
        MessageDlg('No records to export', mtInformation, [mbOk], 0);
        exit;
      end;

    if rdgrpSortBy2.ItemIndex < 2 then
      frmWTRPMaterialAnalysis.Detailed := (rdgrpDetailed.itemindex = 0)
    else
      frmWTRPMaterialAnalysis.Detailed := true;

    self.prgbrExport.Max := recCount;
    tmpFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    frmWTRPMaterialAnalysis.ExportToFile(tmpFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;

    self.OleContainer1.CreateLinkToFile(tmpFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    frmWTRPMaterialAnalysis.Free;
    Application.ProcessMessages;
  end;
end;

procedure TfrmWTRSMaterialAnalysis.btnPreviewClick(Sender: TObject);
begin
  runreport(true);
end;

procedure TfrmWTRSMaterialAnalysis.rdgrpRepsClick(Sender: TObject);
begin
  case rdgrpReps.itemindex of
  0:  begin
        Rep := 0;
        cmbReps.clear;
        cmbReps.items.add('All Reps');
        cmbReps.itemindex := 0;
        cmbReps.enabled := false;
        cmbReps.color := clbtnFace;
        grpbxReps.enabled := false;
      end;
  1:  begin
        loadReps;
        cmbReps.Text := '';
        cmbReps.color := clWindow;
        cmbReps.enabled := true;
        grpbxReps.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmWTRSMaterialAnalysis.LoadReps;
begin
  cmbReps.clear;
  with qryReps do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbReps.Items.Add(fieldbyname('Rep_Name').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSMaterialAnalysis.LoadContacts;
begin
  cmbContacts.clear;
  with qryContacts do
    begin
      close;
      open;

      while eof <> true do
        begin
          cmbContacts.Items.Add(fieldbyname('Operator_Name').asstring);
          next;
        end
    end;
end;

procedure TfrmWTRSMaterialAnalysis.cmbRepsClick(Sender: TObject);
begin
  qryReps.First;
  qryReps.MoveBy(cmbReps.itemindex);
  Rep := qryReps.fieldbyname('Rep').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSMaterialAnalysis.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create('myWorktops.ini');

  with IniFile do
    begin
      WriteString('Material Analysis Report', 'Value By', inttostr(rdgrpValueBy.itemindex))
    end;

  dtmdlWorktops.DelIntSelCode(iIntSelCode, True);
end;


procedure TfrmWTRSMaterialAnalysis.rdgrpContactsClick(Sender: TObject);
begin
  case rdgrpContacts.itemindex of
  0:  begin
        OfficeContact := 0;
        cmbContacts.clear;
        cmbContacts.items.add('All Contacts');
        cmbContacts.itemindex := 0;
        cmbContacts.enabled := false;
        cmbContacts.color := clbtnFace;
        grpbxContacts.enabled := false;
      end;
  1:  begin
        loadContacts;
        cmbContacts.Text := '';
        cmbContacts.color := clWindow;
        cmbContacts.enabled := true;
        grpbxContacts.enabled := true;
      end;
  end;
  enableok(self);

end;

procedure TfrmWTRSMaterialAnalysis.cmbContactsClick(Sender: TObject);
begin
  qryContacts.First;
  qryContacts.MoveBy(cmbContacts.itemindex);
  OfficeContact := qryContacts.fieldbyname('Operator').AsInteger;
  enableok(self);
end;

procedure TfrmWTRSMaterialAnalysis.SetReportType(const Value: string);
begin
  FReportType := Value;
  if FReportType = 'SI' then
    begin
      self.caption := 'Sales Invoice Material Analysis';
      grpbxDate.Caption := 'Invoice Date';
    end
  else
    begin
      self.caption := 'Sales Order Material Analysis';
      grpbxDate.Caption := 'Order Date';
    end;
end;

procedure TfrmWTRSMaterialAnalysis.Delete1Click(Sender: TObject);
var
  iCount: integer;
begin
  for iCount := pred(lstbxCustomers.items.count) downto 0 do
    begin
      if lstbxCustomers.Selected[iCount] then
        begin
          lstbxCustomers.Items.Delete(iCount);
          lstbxCustomersCode.Items.Delete(iCount);
        end;
    end;
  enableOK(self);
end;

end.
