unit PBRSCustContDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, CCSCommon, Spin, ComCtrls, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSCustContDetFrm = class(TForm)
    qryCurrentContStatus: TFDQuery;
    dtsrcCurrentContStatus: TDataSource;
    pnlControls: TPanel;
    pnlPrintControl: TPanel;
    pnlStatusSelect: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    qryContStatus: TFDQuery;
    cmbbxContStatus: TComboBox;
    btnCancel: TBitBtn;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    cbSort3: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    TypeComboBox: TComboBox;
    Panel3: TPanel;
    Label7: TLabel;
    RepComboBox: TComboBox;
    QryContType: TFDQuery;
    QryRep: TFDQuery;
    QryRepName: TWideStringField;
    RadioGroup1: TRadioGroup;
    QryContTypeDescription: TWideStringField;
    qryContStatusContact_Status_descr: TWideStringField;
    Label8: TLabel;
    spnedtMarkup: TSpinEdit;
    chkbxCustomers: TCheckBox;
    qryCurrentContStatusPhone: TWideStringField;
    qryCurrentContStatusContact_Name: TWideStringField;
    qryCurrentContStatusEmail: TWideStringField;
    qryCurrentContStatusContact_Phone: TWideStringField;
    qryCurrentContStatusMobile_No: TWideStringField;
    qryCurrentContStatusContact_Fax: TWideStringField;
    qryCurrentContStatusContact_Type: TIntegerField;
    qryCurrentContStatusContact_Level: TIntegerField;
    qryCurrentContStatusContact_Status: TIntegerField;
    qryCurrentContStatusContact_Status_Descr: TWideStringField;
    qryCurrentContStatusBuilding_No_name: TWideStringField;
    qryCurrentContStatusStreet: TWideStringField;
    qryCurrentContStatusLocale: TWideStringField;
    qryCurrentContStatusTown: TWideStringField;
    qryCurrentContStatusPostcode: TWideStringField;
    qryCurrentContStatusCustomer_Phone: TWideStringField;
    qryCurrentContStatusCustomer_Fax: TWideStringField;
    qryCurrentContStatusCustomer_Name: TWideStringField;
    qryCurrentContStatusRep_Name: TWideStringField;
    qryCurrentContStatusCustomer: TIntegerField;
    qryCurrentContStatusBranch_no: TIntegerField;
    qryCurrentContStatusDef_Markup_Perc: TFloatField;
    qryCurrentContStatusAcc_Active: TWideStringField;
    qryCurrentContStatusContact_Level_Description: TWideStringField;
    qryCurrentContStatusContact_Type_Description: TWideStringField;
    chkbxContacts: TCheckBox;
    chkbxShowStatus: TCheckBox;
    stsbrDetails: TStatusBar;
    dbgrdContStatus: TDBGrid;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    qryExcel: TFDQuery;
    qryCurrentContStatusSalutation: TWideStringField;
    stdSQL: TFDQuery;
    qryCompany: TFDQuery;
    qryGetFY: TFDQuery;
    Panel4: TPanel;
    lblCustomerType: TLabel;
    CustTypeComboBox: TComboBox;
    Label9: TLabel;
    cbSort4: TComboBox;
    qryCustType: TFDQuery;
    qryCustTypeDescription: TWideStringField;
    qryCurrentContStatusCustomer_Type_Description: TWideStringField;
    qryCurrentContStatusAccount_Manager_Name: TWideStringField;
    Panel5: TPanel;
    Label6: TLabel;
    cmbbxCustStatus: TComboBox;
    qryCurrentContStatusCustomer_Status_Descr: TWideStringField;
    OldStdSQL: TFDQuery;
    oldqryCurrentContStatus: TFDQuery;
    StringField1: TWideStringField;
    StringField2: TWideStringField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    StringField5: TWideStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField6: TWideStringField;
    StringField7: TWideStringField;
    StringField8: TWideStringField;
    StringField9: TWideStringField;
    StringField10: TWideStringField;
    StringField11: TWideStringField;
    StringField12: TWideStringField;
    StringField13: TWideStringField;
    StringField14: TWideStringField;
    StringField15: TWideStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    FloatField1: TFloatField;
    StringField16: TWideStringField;
    StringField17: TWideStringField;
    StringField18: TWideStringField;
    StringField19: TWideStringField;
    StringField20: TWideStringField;
    StringField21: TWideStringField;
    StringField22: TWideStringField;
    StringField23: TWideStringField;
    qryCurrentContStatusSub_Rep_Name: TWideStringField;
    procedure cmbbxContStatusChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure RepComboBoxChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure spnedtMarkupExit(Sender: TObject);
    procedure qryCurrentContStatusPhoneGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnExcelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbbxCustStatusChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    bUseSubReps: boolean;
    iCurrentYear, iCurrentPeriod, iYear1, iYear2, iYear3: integer;
    FProspects: boolean;
    procedure FixQuery;
    function BuildQueryString: string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox: TComboBox): string;
    procedure ExportToFile(fileName: string; tempqry: TFDQuery);
    function GetYearDescription(iCode: integer): string;
    procedure SetProspects(const Value: boolean);
  public
    property Prospects: boolean read FProspects write SetProspects;
  end;

var
  PBRSCustContDetFrm: TPBRSCustContDetFrm;

implementation

uses
  PBRPCustContDet, pbDatabase;

{$R *.DFM}

const
  oldSQLCore =
  'SELECT  Customer_Contact.Name AS Contact_Name, '+
  '      Customer_Contact.Salutation, '+
  '      Customer_Contact.Customer, '+
  '      Customer_Contact.Branch_no, '+
  '      Customer_Contact.Email, '+
  '      Customer_Contact.Phone AS Contact_Phone, '+
  '      Customer_Contact.Mobile_No, '+
  '      Customer_Contact.Fax_Number AS Contact_Fax, '+
  '      Customer_Contact.Contact_Type, '+
  '      Customer_Contact.Contact_Level, '+
  '      Customer_Contact.Contact_Status, '+
  '      Contact_Level.Description as Contact_Level_Description, '+
  '      Contact_Status.Contact_Status_Descr, '+
  '      Contact_Type.Description as Contact_Type_Description, '+
  '      Customer_Branch.Building_No_name, '+
  '      Customer_Branch.Street, '+
  '      Customer_Branch.Locale, '+
  '      Customer_Branch.Town, '+
  '      Customer_Branch.Postcode, '+
  '      Customer_Branch.Phone AS Customer_Phone, '+
  '      Customer_Branch.Fax_Number AS Customer_Fax, '+
  '      Customer.Name AS Customer_Name, '+
  '      Rep.Name as Rep_Name '+
  '      customer_contact.inactive '+
  'FROM Rep '+
  ' RIGHT JOIN (((Customer '+
  ' INNER JOIN Customer_Branch ON '+
  '   Customer.Customer = Customer_Branch.Customer) '+
  ' LEFT JOIN Reps_Branches ON '+
  '  (Customer_Branch.Branch_no = Reps_Branches.Branch_no) AND '+
  '  (Customer_Branch.Customer = Reps_Branches.Customer)) '+
  ' INNER JOIN (Contact_Type '+
  ' INNER JOIN (Contact_Level '+
  ' RIGHT JOIN (Contact_Status '+
  ' RIGHT JOIN Customer_Contact ON '+
  '  Contact_Status.Contact_Status = Customer_Contact.Contact_Status) ON '+
  '  Contact_Level.Contact_Level = Customer_Contact.Contact_Level) ON '+
  '  Contact_Type.Contact_Type = Customer_Contact.Contact_Type) ON '+
  '  (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND '+
  '  (Customer_Branch.Customer = Customer_Contact.Customer)) ON '+
  '  Rep.Rep = Reps_Branches.Rep ';


  SQLCore =
  'SELECT  Customer_Contact.Name AS Contact_Name, '+
  '      Customer_Contact.Salutation, '+
  '      Customer_Contact.Customer, '+
  '      Customer_Contact.Branch_no, '+
  '      Customer_Contact.Email, '+
  '      Customer_Contact.Phone AS Contact_Phone, '+
  '      Customer_Contact.Mobile_No, '+
  '      Customer_Contact.Fax_Number AS Contact_Fax, '+
  '      Customer_Contact.Contact_Type, '+
  '      Customer_Contact.Contact_Level, '+
  '      Customer_Contact.Contact_Status, '+
  '      Contact_Level.Description as Contact_Level_Description, '+
  '      Contact_Status.Contact_Status_Descr, '+
  '      Contact_Type.Description as Contact_Type_Description, '+
  '      Customer_Branch.Building_No_name, '+
  '      Customer_Branch.Street, '+
  '      Customer_Branch.Locale, '+
  '      Customer_Branch.Town, '+
  '      Customer_Branch.Postcode, '+
  '      Customer_Branch.Phone AS Customer_Phone, '+
  '      Customer_Branch.Fax_Number AS Customer_Fax, '+
  '      Customer.Name AS Customer_Name, '+
  '      customer_contact.inactive '+
	'     (select top 1 Rep.Name '+
	'     from reps_branches, Rep '+
	'     where reps_branches.customer = customer_contact.customer and '+
	'           reps_branches.branch_no = customer_contact.branch_no and '+
	'           reps_branches.rep = Rep.rep) as Rep_Name '+
  'FROM (Customer '+
	'   INNER JOIN Customer_Branch ON Customer.Customer = Customer_Branch.Customer) '+
	'   INNER JOIN (Contact_Type '+
	'   INNER JOIN (Contact_Status '+
	'   RIGHT JOIN (Contact_Level '+
	'   RIGHT JOIN Customer_Contact '+
	'	    ON Contact_Level.Contact_Level = Customer_Contact.Contact_Level) '+
	'	    ON Contact_Status.Contact_Status = Customer_Contact.Contact_Status) '+
	'	    ON Contact_Type.Contact_Type = Customer_Contact.Contact_Type) '+
	'	    ON (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND (Customer_Branch.Customer = Customer_Contact.Customer) ';

procedure TPBRSCustContDetFrm.cmbbxContStatusChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustContDetFrm.FormShow(Sender: TObject);
begin
(*  qrycontStatus.Active := True;
  qryRep.Active := True;
  qryContType.Active := True;
  qryCustType.Active := True;
  qryCurrentContStatus.Close;
  qryCurrentContStatus.Open;
  //Active := True;
*)
end;

procedure TPBRSCustContDetFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSCustContDetFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSCustContDetFrm.CallReport(const bPreview: Boolean);
var
  PBRPCustContDetfrm: TPBRPCustContDetfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryCurrentContStatus.Close;

  PBRPCustContDetfrm := TPBRPCustContDetfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
          PBRPCustContDetfrm.PrinterSettings := PrinterSettings;
          PBRPCustContDetfrm.GetDetsQry.SQL.Clear;
          PBRPCustContDetfrm.GetDetsQry.SQL.Text := qryCurrentContStatus.sql.Text;

          PBRPCustContDetfrm.GetDetsQry.parambyname('Year1').asinteger := iYear1;
          PBRPCustContDetfrm.GetDetsQry.parambyname('Year2').asinteger := iYear2;
          PBRPCustContDetfrm.GetDetsQry.parambyname('Year3').asinteger := iYear3;

          PBRPCustContDetfrm.bIsSummary := RadioGroup1.ItemIndex = 0;
          PBRPCustContDetfrm.showRep
            := (RadioGroup1.ItemIndex = 1) or (RadioGroup1.ItemIndex = 3);
          PBRPCustContDetfrm.showAddress
            := (RadioGroup1.ItemIndex = 2) or (RadioGroup1.ItemIndex = 3);
          PBRPCustContDetfrm.showStatus := chkbxShowStatus.Checked;


          if cbsort1.Text = 'Contact Type' then
            begin
              PBRPCustContDetfrm.QRCustGroup.Expression := 'GetDetsQry.Contact_Type';
              PBRPCustContDetfrm.Sel1TitleQRDBText.caption :=  'Contact Type:';
              PBRPCustContDetfrm.Sel1QRDBText.datafield :=  'Contact_Type_Description';
            end
          else
            if cbsort1.Text = 'Contact Status' then
            begin
              PBRPCustContDetfrm.QRCustGroup.Expression := 'GetDetsQry.Contact_Status';
              PBRPCustContDetfrm.Sel1TitleQRDBText.caption :=  'Contact Status:';
              PBRPCustContDetfrm.Sel1QRDBText.datafield :=  'Contact_Status_Descr';
            end
            else
              begin
                PBRPCustContDetfrm.QRCustGroup.Expression := 'GetDetsQry.Rep';
                PBRPCustContDetfrm.Sel1TitleQRDBText.caption :=  'Rep Name:';
                PBRPCustContDetfrm.Sel1QRDBText.datafield :=  'Rep_Name';
              end;
          PBRPCustContDetfrm.CustStateQRLabel.Caption := 'Contact Status: '+cmbbxContStatus.text;
          PBRPCustContDetfrm.CustTypeQRLabel.Caption := 'Contact Type: '+TypeComboBox.Text;
          PBRPCustContDetfrm.RepQRLabel.Caption := 'Rep: '+RepComboBox.Text;
          PBRPCustContDetfrm.SeqbyQRLabel.Caption := 'Sequenced Firstly By '+cbsort1.Text;
          if cbsort2.text <> '' then
            PBRPCustContDetfrm.SeqbyQRLabel.Caption := PBRPCustContDetfrm.SeqbyQRLabel.Caption + ' Secondly By '+cbsort2.Text;
          if cbsort3.text <> '' then
            PBRPCustContDetfrm.SeqbyQRLabel.Caption := PBRPCustContDetfrm.SeqbyQRLabel.Caption + ' Lastly By '+cbsort3.Text;
          if bPreview then
            PBRPCustContDetfrm.qrpCustStat.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPCustContDetfrm.qrpCustStat.Print;
          PBRPCustContDetfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryCurrentContStatus.Open;
  end;
end;

function TPBRSCustContDetFrm.BuildQueryString: string;
var
  sTemp : string;
begin
  sTemp := StdSQL.SQL.Text;
  if spnedtMarkup.value > 0 then
    sTemp := sTemp + 'Where (Customer_Contact.Def_Markup_perc >= ' + inttostr(spnedtMarkup.value) + ') '
  else
    sTemp := sTemp + 'Where ((Customer_Contact.Def_Markup_perc >= ' + inttostr(spnedtMarkup.value)
                + ') or (Customer_Contact.Def_Markup_perc = null)) ';

  if (cmbbxContStatus.Text <> '') then
  begin
    if  (cmbbxContStatus.Text <> 'Show All') then
    begin
      sTemp := sTemp + ' and Contact_Status.Contact_Status_Descr = ''' + cmbbxContStatus.Text + ' '' ';
    end
    else
    begin
      sTemp := sTemp + ' and Contact_Status.Contact_Status > 5 ';
    end;
  end;

  if (TypeComboBox.Text <> '') then
  begin
    if  (TypeComboBox.Text <> 'Show All') then
    begin
      sTemp := sTemp + ' and  Contact_Type.Description = ''' + TypeComboBox.Text + ' '' ';
    end;
  end;

  if (RepComboBox.Text <> '') then
  begin
    if (RepComboBox.Text <> 'Show All') then
    begin
//	    sTemp := sTemp + ' and Rep_Name = ''' + RepComboBox.Text + ' '' ';
      sTemp := sTemp + ' and (select top 1 Rep.Name ';
	    sTemp := sTemp + 'FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep ';
	    sTemp := sTemp + 'WHERE (Reps_Branches.Customer = Customer_Branch.Customer AND ';
	    sTemp := sTemp + '  Reps_Branches.Branch_no = Customer_Branch.Branch_No) AND ';
	    sTemp := sTemp + '  ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Branches.Is_Main_Rep = ''Y'')) ';
	    sTemp := sTemp + '  ORDER BY Reps_Branches.Is_Main_Rep DESC) = ''' + RepComboBox.Text + ' '' ';
    end;
  end;

  if (CustTypeComboBox.Text <> '') then
  begin
    if  (CustTypeComboBox.Text <> 'Show All') then
    begin
      sTemp := sTemp + ' and  Customer_Type.Description = ''' + CustTypeComboBox.Text + ' '' ';
    end;
  end;

  if chkbxCustomers.checked then
    sTemp := sTemp + ' and ((Customer.Acc_Active = ''Y'') or (Customer.Acc_Active = ''N''))'
  else
    sTemp := sTemp + ' and ((Customer.Acc_Active = ''Y''))';

  if chkbxContacts.checked = false then
  begin
    sTemp := sTemp + ' and ((customer_contact.inactive = ''N'') or (customer_contact.inactive is null))';
  end;

  if Prospects then
    begin
      if cmbbxCustStatus.itemindex = 0 then
        sTemp := sTemp + ' and ((Customer.Customer_Status >= 80) and (Customer.Customer_Status < 100))'
      else
      if cmbbxCustStatus.itemindex = 1 then
        sTemp := sTemp + ' and ((Customer.Customer_Status = 80))'
      else
      if cmbbxCustStatus.itemindex = 2 then
        sTemp := sTemp + ' and ((Customer.Customer_Status = 90))'
      else
        sTemp := sTemp + ' and ((Customer.Customer_Status >= 80) and (Customer.Customer_Status < 100))'
    end
  else
    sTemp := sTemp + ' and ((Customer.Customer_Status = 100))';

  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0)
  or (cbSort3.ItemIndex >= 0) or (cbSort4.ItemIndex >= 0) then
  begin
    sTemp := sTemp + ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2) + Ordering(cbSort3)+ Ordering(cbSort4);
  end;
  STemp := sTemp + 'Customer.Name';
  Result := sTemp;
end;

procedure TPBRSCustContDetFrm.FixQuery;
begin
  qryCurrentContStatus.DisableControls;
  try
    qryCurrentContStatus.Close;
    qryCurrentContStatus.SQL.Clear;
    qryCurrentContStatus.SQL.text := BuildQueryString;

    qryCurrentContStatus.parambyname('Year1').asinteger := iYear1;
    qryCurrentContStatus.parambyname('Year2').asinteger := iYear2;
    qryCurrentContStatus.parambyname('Year3').asinteger := iYear3;

    qryCurrentContStatus.Open;
    stsbrDetails.panels[0].text := ' ' + IntToStr(qryCurrentContStatus.RecordCount) + ' records processed';
    btnPrint.Enabled := (qryCurrentContStatus.RecordCount > 0);
    btnPreview.Enabled := btnPrint.enabled;
    btnExcel.Enabled := btnPrint.enabled;
  finally
    qryCurrentContStatus.EnableControls;
  end;
end;

function TPBRSCustContDetFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
//  0:   Result := ' Contact_Status.Contact_Status_Descr,';
  0:   Result := ' Contact_Status.Contact_Status,';
  1:   Result := ' Contact_Type.Description,';
  2:   Result := ' Rep_Name,';
  3:   Result := ' Customer_Type.Description,';
  else Result := ' ';
  end;
end;

procedure TPBRSCustContDetFrm.cbSortChange(Sender: TObject);
begin
  { Don't allow duplicate selections }
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort1.ItemIndex then
      cbSort3.ItemIndex := -1;
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;
    if cbSort4.ItemIndex = cbSort3.ItemIndex then
      cbSort4.ItemIndex := -1;
  end
  else
  if cbSort2.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
  if (cbSort4.ItemIndex >= 0) and (cbSort3.ItemIndex < 0) then
  begin
    cbSort3.ItemIndex := cbSort4.ItemIndex;
    cbSort4.ItemIndex := -1;
  end;
  if (cbSort3.ItemIndex >= 0) and (cbSort2.ItemIndex < 0) then
  begin
    cbSort2.ItemIndex := cbSort3.ItemIndex;
    cbSort3.ItemIndex := -1;
  end;
  if (cbSort2.ItemIndex >= 0) and (cbSort1.ItemIndex < 0) then
  begin
    cbSort1.ItemIndex := cbSort2.ItemIndex;
    cbSort2.ItemIndex := -1;
  end;
  FixQuery;
end;

procedure TPBRSCustContDetFrm.RepComboBoxChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustContDetFrm.RadioGroup1Click(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustContDetFrm.spnedtMarkupExit(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustContDetFrm.qryCurrentContStatusPhoneGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qryCurrentContStatusContact_Phone.asstring = '' then
    text := qryCurrentContStatusCustomer_Phone.asstring
  else
    text := qryCurrentContStatusContact_Phone.asstring;
end;

procedure TPBRSCustContDetFrm.btnExcelClick(Sender: TObject);
var
  tempFileName: string;
begin
  tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
  self.pnlExportPrgrss.Visible := true;
  self.pnlExportPrgrss.Repaint;

  ExportToFile(tempFileName,qryCurrentContStatus);
  self.pnlExportPrgrss.visible := false;
  self.Repaint;
  self.prgbrExport.Position := 0;

  self.OleContainer1.CreateLinkToFile(tempFileName, false);
  self.OleContainer1.DoVerb(0);
end;

function TPBRSCustContDetFrm.GetYearDescription(iCode: integer): string;
begin
  with qryGetFY do
    begin
      close;
      parambyname('Financial_Year').asinteger := iCode;
      open;
      result := fieldbyname('Title').asstring;
    end;
end;

procedure TPBRSCustContDetFrm.ExportToFile(fileName: string; tempqry: TFDQuery);
var
  tempStr: string;
  exportFile: textFile;
  sYear1, sYear2, sYear3: string;
  i: integer;
begin
  assignFile(exportFile, fileName);
  rewrite(exportFile);

  sYear1 := GetYearDescription(iYear1);
  sYear2 := GetYearDescription(iYear2);
  sYear3 := GetYearDescription(iYear3);

  tempStr := '"Contact Name"'
    + ',"Salutation"'
    + ',"Customer Name"'
    + ',"Address 1"'
    + ',"Address 2"'
    + ',"Address 3"'
    + ',"Town"'
    + ',"Postcode"'
    + ',"Telephone"'
    + ',"Fax"'
    + ',"Mobile"'
    + ',"Email"'
    + ',"Rep Name"';

    if bUseSubReps then
      tempStr := tempstr + ',"Sub-Rep Name"';

    tempstr := tempstr
    + ',"Account Manager"'
    + ',"Contact Level"'
    + ',"Contact Status"'
    + ',"Contact Type"'
    + ',"Customer Type"'
    + ',"Customer Status"'
    + ',"Last Invoice Date"'
    + ',"Last Invoice Value"';

  if (iCurrentPeriod <> 0) and (iCurrentYear <> 0) then
    begin
      tempstr := tempstr + ',"Invoiced "' + sYear1
                         + ',"Invoiced "' + sYear2
                         + ',"Invoiced "' + sYear3;
    end;
  writeLn(exportFile, tempStr);

  with qryExcel do
    begin
      close;
      sql.Clear;
      sql.text := tempqry.SQL.Text;
      parambyname('Year1').asinteger := iYear1;
      parambyname('Year2').asinteger := iYear2;
      parambyname('Year3').asinteger := iYear3;
      open;
      prgbrExport.Max := recordcount;
      
      while eof <> true do
        begin
          tempStr := '"' + stringreplace(fieldbyname('Contact_Name').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Salutation').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Customer_Name').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Building_No_name').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Street').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Locale').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Town').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Postcode').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Contact_Phone').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Contact_Fax').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Mobile_no').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Email').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Rep_Name').asstring,',','',[rfReplaceAll]) + '"';

          if bUseSubReps then
            begin
              if (fieldbyname('Rep_Name').asstring <> fieldbyname('Sub_Rep_Name').asstring) then
                tempStr := tempstr + ',"' + stringreplace(fieldbyname('Sub_Rep_Name').asstring,',','',[rfReplaceAll]) + '"'
              else
                tempStr := tempstr + ',"' + '' + '"';
            end;

          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Account_Manager_Name').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Contact_Level_Description').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Contact_Status_Descr').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Contact_Type_Description').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Customer_Type_Description').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Customer_Status_Descr').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Date_Last_Invoiced').asstring,',','',[rfReplaceAll]) + '"';
          tempStr := tempStr + ',"' + stringreplace(fieldbyname('Last_Invoice_Value').asstring,',','',[rfReplaceAll]) + '"';

          if (iCurrentPeriod <> 0) and (iCurrentYear <> 0) then
            begin
              tempStr := tempStr + ',"' + fieldbyname('Customer_Sales_1').asstring + '"';
              tempStr := tempStr + ',"' + fieldbyname('Customer_Sales_2').asstring + '"';
              tempStr := tempStr + ',"' + fieldbyname('Customer_sales_3').asstring + '"';
            end;

          writeLn(exportFile, tempStr);
          prgbrExport.StepIt;
          next;
        end;
    end;
  CloseFile(exportFile);
end;

procedure TPBRSCustContDetFrm.FormActivate(Sender: TObject);
begin
  bUseSubReps := dmBroker.UseSubReps;

  qryContStatus.close;
  qryContStatus.Open;
  while not qrycontStatus.Eof do
  begin
    cmbbxContStatus.Items.Add(qrycontStatus.Fields[0].AsString);
    qrycontStatus.Next;
  end;
  cmbbxContStatus.Items.Add('Show All');

  qryContType.close;
  qryContType.Open;
  while not qryContType.Eof do
  begin
    TypeComboBox.Items.Add(qryContType.fields[0].AsString);
    qryContType.Next;
  end;
  TypeComboBox.Items.Add('Show All');

  qryRep.Close;
  qryRep.Open;
  while not qryRep.Eof do
  begin
    RepComboBox.Items.Add(qryRep.Fields[0].AsString);
    qryRep.Next;
  end;
  RepComboBox.Items.Add('Show All');

  qryCustType.Close;
  qryCustType.Open;
  while not qryCustType.Eof do
  begin
    CustTypeComboBox.Items.Add(qryCustType.Fields[0].AsString);
    qryCustType.Next;
  end;
  CustTypeComboBox.Items.Add('Show All');
  cbSort1.ItemIndex := 0;
  Screen.Cursor := crDefault;

  FixQuery;

  qryCurrentContStatus.Close;
  qryCurrentContStatus.Open;

  with qryCompany do
    begin
      close;
      open;
      iCurrentYear := fieldbyname('Financial_Year').asinteger;
      iCurrentperiod := fieldbyname('Period').asinteger;
    end;
  iYear1 := iCurrentYear - 1;
  iYear2 := iCurrentYear - 2;
  iYear3 := iCurrentYear - 3;
end;

procedure TPBRSCustContDetFrm.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TPBRSCustContDetFrm.SetProspects(const Value: boolean);
begin
  FProspects := Value;

  if FProspects then
    begin
      self.Caption := 'Prospect Contact Details';
      chkbxCustomers.caption := 'Include inactive prospects';
      lblCustomerType.caption := 'Prospect Type';
      cmbbxCustStatus.Enabled := true;
    end
  else
    begin
      self.Caption := 'Customer Contact Details';
      chkbxCustomers.caption := 'Include inactive customers';
      lblCustomerType.caption := 'Customer Type';
      cmbbxCustStatus.Enabled := false;
    end;
end;

procedure TPBRSCustContDetFrm.cmbbxCustStatusChange(Sender: TObject);
begin
  FixQuery;
end;

end.
