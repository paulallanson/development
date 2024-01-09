unit WTRSCustContDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, Spin, ComCtrls, OleCtnrs, AllCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRSCustContDet = class(TForm)
    dtsrcCurrentContStatus: TDataSource;
    pnlControls: TPanel;
    pnlPrintControl: TPanel;
    pnlStatusSelect: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    qryCustType: TFDQuery;
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
    qryContType: TFDQuery;
    QryRep: TFDQuery;
    RadioGroup1: TRadioGroup;
    chkbxCustomers: TCheckBox;
    chkbxContacts: TCheckBox;
    stsbrDetails: TStatusBar;
    dbgrdContStatus: TDBGrid;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    qryExcel: TFDQuery;
    stdSQL: TFDQuery;
    qryCurrentContStatus: TFDQuery;
    qryCustTypeDescription: TWideStringField;
    qryContTypeContact_Type_Description: TWideStringField;
    QryRepRep_Name: TWideStringField;
    qryCurrentContStatusContact_Name: TWideStringField;
    qryCurrentContStatusTitle: TWideStringField;
    qryCurrentContStatusForename: TWideStringField;
    qryCurrentContStatusEmail_address: TWideStringField;
    qryCurrentContStatusContact_Phone: TWideStringField;
    qryCurrentContStatusMobile_Number: TWideStringField;
    qryCurrentContStatusContact_Fax: TWideStringField;
    qryCurrentContStatusContact_Type: TIntegerField;
    qryCurrentContStatusContact_Type_Description: TWideStringField;
    qryCurrentContStatusStreet: TWideStringField;
    qryCurrentContStatusLocale: TWideStringField;
    qryCurrentContStatusTown_City: TWideStringField;
    qryCurrentContStatusPostcode: TWideStringField;
    qryCurrentContStatusCounty_State: TWideStringField;
    qryCurrentContStatusCustomer_Phone: TWideStringField;
    qryCurrentContStatusCustomer_Fax: TWideStringField;
    qryCurrentContStatusCustomer_Name: TWideStringField;
    qryCurrentContStatusCustomer: TIntegerField;
    qryCurrentContStatusinactive: TWideStringField;
    qryCurrentContStatusRep: TIntegerField;
    qryCurrentContStatusCustomer_Type_Description: TWideStringField;
    qryCurrentContStatusPhone: TWideStringField;
    qryCurrentContStatusRep_Name: TWideStringField;
    procedure FormCreate(Sender: TObject);
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
  private
    iCurrentYear, iCurrentPeriod, iYear1, iYear2, iYear3: integer;
    procedure FixQuery;
    function BuildQueryString: string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox: TComboBox): string;
    procedure ExportToFile(fileName: string; tempqry: TFDQuery);
    function GetYearDescription(iCode: integer): string;
  public
    { Public declarations }
  end;

var
  frmWTRSCustContDet: TfrmWTRSCustContDet;

implementation

uses WTRPCustContDet;

{$R *.DFM}

procedure TfrmWTRSCustContDet.FormCreate(Sender: TObject);
begin
  qryCustType.Open;
  while not qryCustType.Eof do
  begin
    cmbbxContStatus.Items.Add(qryCustType.Fields[0].AsString);
    qryCustType.Next;
  end;
  cmbbxContStatus.Items.Add('Show All');
  qryContType.Open;
  while not qryContType.Eof do
  begin
    TypeComboBox.Items.Add(qryContType.fields[0].AsString);
    qryContType.Next;
  end;
  TypeComboBox.Items.Add('Show All');
  qryRep.Open;
  while not qryRep.Eof do
  begin
    RepComboBox.Items.Add(qryRep.Fields[0].AsString);
    qryRep.Next;
  end;
  RepComboBox.Items.Add('Show All');
  cbSort1.ItemIndex := 0;
  Screen.Cursor := crDefault;
  FixQuery;
end;

procedure TfrmWTRSCustContDet.cmbbxContStatusChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TfrmWTRSCustContDet.FormShow(Sender: TObject);
begin
  qryCustType.Active := True;
  qryRep.Active := True;
  qryContType.Active := True;
  //Active := True;
end;

procedure TfrmWTRSCustContDet.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TfrmWTRSCustContDet.btnPrintClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TfrmWTRSCustContDet.CallReport(const bPreview: Boolean);
var
  frmWTRPCustContDet: TfrmWTRPCustContDet;
//  PrinterSettings: TPrinterSettings;
begin
  qryCurrentContStatus.Close;

  frmWTRPCustContDet := TfrmWTRPCustContDet.Create(Self);
  try
//    PrinterSettings := TPrinterSettings.Create;
    try
//          frmWTRPCustContDet.PrinterSettings := PrinterSettings;
          frmWTRPCustContDet.GetDetsQry.SQL.Clear;
          frmWTRPCustContDet.GetDetsQry.SQL.Text := qryCurrentContStatus.sql.Text;

          frmWTRPCustContDet.bIsSummary := RadioGroup1.ItemIndex = 0;
          frmWTRPCustContDet.showRep
            := (RadioGroup1.ItemIndex = 1) or (RadioGroup1.ItemIndex = 3);
          frmWTRPCustContDet.showAddress
            := (RadioGroup1.ItemIndex = 2) or (RadioGroup1.ItemIndex = 3);


          if cbsort1.Text = 'Customer Type' then
            begin
              frmWTRPCustContDet.QRCustGroup.Expression := 'GetDetsQry.Customer_Type_Description';
              frmWTRPCustContDet.Sel1TitleQRDBText.caption :=  'Customer Type:';
              frmWTRPCustContDet.Sel1QRDBText.datafield :=  'Customer_Type_Description';
            end
          else
            if cbsort1.Text = 'Job Title' then
            begin
              frmWTRPCustContDet.QRCustGroup.Expression := 'GetDetsQry.Contact_Type_Description';
              frmWTRPCustContDet.Sel1TitleQRDBText.caption :=  'Job_Title:';
              frmWTRPCustContDet.Sel1QRDBText.datafield :=  'Contact_Type_Description';
            end
            else
              begin
                frmWTRPCustContDet.QRCustGroup.Expression := 'GetDetsQry.Rep_Name';
                frmWTRPCustContDet.Sel1TitleQRDBText.caption :=  'Rep Name:';
                frmWTRPCustContDet.Sel1QRDBText.datafield :=  'Rep_Name';
              end;
          frmWTRPCustContDet.CustStateQRLabel.Caption := 'Customer Type: '+cmbbxContStatus.text;
          frmWTRPCustContDet.CustTypeQRLabel.Caption := 'Job Title: '+TypeComboBox.Text;
          frmWTRPCustContDet.RepQRLabel.Caption := 'Rep: '+RepComboBox.Text;
          frmWTRPCustContDet.SeqbyQRLabel.Caption := 'Sequenced Firstly By '+cbsort1.Text;
          if cbsort2.text <> '' then
            frmWTRPCustContDet.SeqbyQRLabel.Caption := frmWTRPCustContDet.SeqbyQRLabel.Caption + ' Secondly By '+cbsort2.Text;
          if cbsort3.text <> '' then
            frmWTRPCustContDet.SeqbyQRLabel.Caption := frmWTRPCustContDet.SeqbyQRLabel.Caption + ' Lastly By '+cbsort3.Text;
          if bPreview then
            frmWTRPCustContDet.qrpCustStat.Preview
          else
            begin
              frmWTRPCustContDet.qrpCustStat.PrinterSetup;
              if frmWTRPCustContDet.qrpCustStat.tag = 0 then
                begin
                  frmWTRPCustContDet.qrpCustStat.Print;
                end;
            end;
          frmWTRPCustContDet.Free;
    finally
//      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryCurrentContStatus.Open;
  end;

end;

function TfrmWTRSCustContDet.BuildQueryString: string;
var
  sTemp : string;
begin
  sTemp := StdSQL.SQL.Text;
  sTemp := sTemp + 'Where (1 = 1) ';

  if (cmbbxContStatus.Text <> '') then
  begin
    if  (cmbbxContStatus.Text <> 'Show All') then
    begin
      sTemp := sTemp + ' and Customer_Type.Description = ''' + cmbbxContStatus.Text + ' '' ';
    end;
  end;

  if (TypeComboBox.Text <> '') then
  begin
    if  (TypeComboBox.Text <> 'Show All') then
    begin
      sTemp := sTemp + ' and  Contact_Type.Contact_Type_Description = ''' + TypeComboBox.Text + ' '' ';
    end;
  end;

  if (RepComboBox.Text <> '') then
  begin
    if (RepComboBox.Text <> 'Show All') then
    begin
      sTemp := sTemp + ' and  Rep.Rep_Name = ''' + RepComboBox.Text + ' '' ';
    end;
  end;

  if chkbxCustomers.checked then
    sTemp := sTemp + ' and ((Customer.Not_Active = ''Y'') or (Customer.Not_Active = ''N''))'
  else
    sTemp := sTemp + ' and ((Customer.Not_Active = ''N''))';

  if chkbxContacts.checked = false then
  begin
    sTemp := sTemp + ' and ((customer_contact.inactive = ''N'') or (customer_contact.inactive is null))';
  end;


  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0)
  or (cbSort3.ItemIndex >= 0) then
  begin
    sTemp := sTemp + ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2) +
      Ordering(cbSort3);
  end;
  STemp := sTemp + 'Customer.Customer_Name';
  Result := sTemp;
end;

procedure TfrmWTRSCustContDet.FixQuery;
begin
  try
    qryCurrentContStatus.Close;
    qryCurrentContStatus.SQL.Clear;
    qryCurrentContStatus.SQL.text := BuildQueryString;

    qryCurrentContStatus.Open;
    stsbrDetails.panels[0].text := ' ' + IntToStr(qryCurrentContStatus.RecordCount) + ' records processed';
    btnPrint.Enabled := (qryCurrentContStatus.RecordCount > 0);
    btnPreview.Enabled := btnPrint.enabled;
    btnExcel.Enabled := btnPrint.enabled;
  finally
    qryCurrentContStatus.EnableControls;
  end;
end;

function TfrmWTRSCustContDet.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Customer_Type.Description,';
  1:   Result := ' Contact_Type.Contact_Type_Description,';
  2:   Result := ' Rep_Name,';
  else Result := ' ';
  end;
end;

procedure TfrmWTRSCustContDet.cbSortChange(Sender: TObject);
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
  end
  else
  if cbSort2.ItemIndex >= 0 then
  begin
    if cbSort3.ItemIndex = cbSort2.ItemIndex then
      cbSort3.ItemIndex := -1;
  end;
  { Shuffle up any gaps }
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

procedure TfrmWTRSCustContDet.RepComboBoxChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TfrmWTRSCustContDet.RadioGroup1Click(Sender: TObject);
begin
  FixQuery;
end;

procedure TfrmWTRSCustContDet.spnedtMarkupExit(Sender: TObject);
begin
  FixQuery;
end;

procedure TfrmWTRSCustContDet.qryCurrentContStatusPhoneGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qryCurrentContStatusContact_Phone.asstring = '' then
    text := qryCurrentContStatusCustomer_Phone.asstring
  else
    text := qryCurrentContStatusContact_Phone.asstring;
end;

procedure TfrmWTRSCustContDet.btnExcelClick(Sender: TObject);
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

function TfrmWTRSCustContDet.GetYearDescription(iCode: integer): string;
begin
end;

procedure TfrmWTRSCustContDet.ExportToFile(fileName: string; tempqry: TFDQuery);
var
  tempStr: string;
  exportFile: textFile;
  i: integer;
begin
  assignFile(exportFile, fileName);
  rewrite(exportFile);

  tempStr := '"Contact Name"'
    + ',"Title"'
    + ',"First Name"'
    + ',"Customer Name"'
    + ',"Address 1"'
    + ',"Address 2"'
    + ',"Town"'
    + ',"Postcode"'
    + ',"County"'
    + ',"Telephone"'
    + ',"Fax"'
    + ',"Mobile"'
    + ',"Email"'
    + ',"Rep Name"'
    + ',"Contact Type"'
    + ',"Customer Type"'
    + ',"Last Invoice Date"'
    + ',"Last Invoice Value"';

  writeLn(exportFile, tempStr);

  with qryExcel do
    begin
      close;
      sql.Clear;
      sql.text := tempqry.SQL.Text;
      open;
      prgbrExport.Max := recordcount;

      while eof <> true do
        begin
          tempStr := '"' + fieldbyname('Contact_Name').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Title').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Forename').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Customer_Name').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Street').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Locale').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Town_City').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Postcode').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('County_State').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Contact_Phone').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Contact_Fax').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Mobile_number').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Email_address').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Rep_Name').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Contact_Type_Description').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Customer_Type_Description').asstring + '"';
//          tempStr := tempStr + ',"' + fieldbyname('Date_Last_Invoiced').asstring + '"';
//          tempStr := tempStr + ',"' + fieldbyname('Last_Invoice_Value').asstring + '"';

          writeLn(exportFile, tempStr);
          prgbrExport.StepIt;
          next;
        end;
    end;
  CloseFile(exportFile);
end;

end.
