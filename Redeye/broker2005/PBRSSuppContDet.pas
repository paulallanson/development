unit PBRSSuppContDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, DBCtrls, Buttons,
  Printers, CCSPrint, CCSCommon, Spin, ComCtrls, OleCtnrs;

type
  TPBRSSuppContDetFrm = class(TForm)
    qryCurrentContStatus: TQuery;
    dtsrcCurrentContStatus: TDataSource;
    pnlControls: TPanel;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    TypeComboBox: TComboBox;
    QryContType: TQuery;
    RadioGroup1: TRadioGroup;
    QryContTypeDescription: TStringField;
    chkbxSuppliers: TCheckBox;
    chkbxContacts: TCheckBox;
    stsbrDetails: TStatusBar;
    dbgrdContStatus: TDBGrid;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    qryExcel: TQuery;
    stdSQL: TQuery;
    qryCompany: TQuery;
    qryCurrentContStatusContact_Phone: TStringField;
    qryCurrentContStatusSupplier_Phone: TStringField;
    qryCurrentContStatusContact_Name: TStringField;
    qryCurrentContStatusSupplier_Name: TStringField;
    qryCurrentContStatusEmail: TStringField;
    qryCurrentContStatusContact_Type_Description: TStringField;
    qryCurrentContStatusinactive: TStringField;
    qryCurrentContStatusPhone: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cmbbxContStatusChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure RepComboBoxChange(Sender: TObject);
    procedure qryCurrentContStatusPhoneGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure FixQuery;
    function BuildQueryString: string;
    procedure CallReport(const bPreview : Boolean);
    procedure ExportToFile(fileName: string; tempqry: TQuery);
  public
    { Public declarations }
  end;

var
  PBRSSuppContDetFrm: TPBRSSuppContDetFrm;

implementation

uses
  PBRPSuppContDet;

{$R *.DFM}

procedure TPBRSSuppContDetFrm.FormCreate(Sender: TObject);
begin
  qryContType.Open;
  while not qryContType.Eof do
  begin
    TypeComboBox.Items.Add(qryContType.fields[0].AsString);
    qryContType.Next;
  end;
  TypeComboBox.Items.Add('Show All');
  Screen.Cursor := crDefault;
  FixQuery;
end;

procedure TPBRSSuppContDetFrm.cmbbxContStatusChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSSuppContDetFrm.FormShow(Sender: TObject);
begin
  qryContType.Active := True;
  qryCurrentContStatus.Close;
  qryCurrentContStatus.Open;
  //Active := True;
end;

procedure TPBRSSuppContDetFrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSSuppContDetFrm.btnPrintClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSSuppContDetFrm.CallReport(const bPreview: Boolean);
var
  PBRPSuppContDetfrm: TPBRPSuppContDetfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryCurrentContStatus.Close;

  PBRPSuppContDetfrm := TPBRPSuppContDetfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
          PBRPSuppContDetfrm.PrinterSettings := PrinterSettings;
          PBRPSuppContDetfrm.GetDetsQry.SQL.Clear;
          PBRPSuppContDetfrm.GetDetsQry.SQL.Text := qryCurrentContStatus.sql.Text;

          PBRPSuppContDetfrm.bIsSummary := RadioGroup1.ItemIndex = 0;
          PBRPSuppContDetfrm.showAddress := RadioGroup1.ItemIndex = 1;

          PBRPSuppContDetfrm.QRCustGroup.Expression := 'GetDetsQry.Contact_Type';
          PBRPSuppContDetfrm.Sel1TitleQRDBText.caption :=  'Contact Type:';
          PBRPSuppContDetfrm.Sel1QRDBText.datafield :=  'Contact_Type_Description';

          PBRPSuppContDetfrm.CustTypeQRLabel.Caption := 'Contact Type: '+TypeComboBox.Text;

          if bPreview then
            PBRPSuppContDetfrm.qrpCustStat.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPSuppContDetfrm.qrpCustStat.Print;
          PBRPSuppContDetfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryCurrentContStatus.Open;
  end;
end;

function TPBRSSuppContDetFrm.BuildQueryString: string;
var
  sTemp : string;
begin
  sTemp := StdSQL.SQL.Text;
  sTemp := sTemp + 'Where 1=1 ';

  if  (TypeComboBox.Text <> 'Show All') then
    begin
      sTemp := sTemp + ' and  Contact_Type.Description = ''' + TypeComboBox.Text + ' '' ';
    end;

  if chkbxSuppliers.checked then
    sTemp := sTemp + ' and ((Supplier.Acc_Active = ''Y'') or (Supplier.Acc_Active = ''N''))'
  else
    sTemp := sTemp + ' and ((Supplier.Acc_Active = ''Y''))';

  if chkbxContacts.checked = false then
  begin
    sTemp := sTemp + ' and ((supplier_branchcontacts.inactive = ''N'') or (supplier_branchcontacts.inactive is null))';
  end;


  sTemp := sTemp + ' ORDER BY Contact_Type.Description, Supplier.Name';

  Result := sTemp;
end;

procedure TPBRSSuppContDetFrm.FixQuery;
begin
  qryCurrentContStatus.DisableControls;
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

procedure TPBRSSuppContDetFrm.cbSortChange(Sender: TObject);
begin
(*  { Don't allow duplicate selections }
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
*)
  FixQuery;
end;

procedure TPBRSSuppContDetFrm.RepComboBoxChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSSuppContDetFrm.qryCurrentContStatusPhoneGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if qryCurrentContStatusContact_Phone.asstring = '' then
    text := qryCurrentContStatusSupplier_Phone.asstring
  else
    text := qryCurrentContStatusContact_Phone.asstring;
end;

procedure TPBRSSuppContDetFrm.btnExcelClick(Sender: TObject);
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

procedure TPBRSSuppContDetFrm.ExportToFile(fileName: string; tempqry: TQuery);
var
  tempStr: string;
  exportFile: textFile;
  i: integer;
begin
  assignFile(exportFile, fileName);
  rewrite(exportFile);

  tempStr := '"Contact Name"'
    + ',"Salutation"'
    + ',"Supplier Name"'
    + ',"Address 1"'
    + ',"Address 2"'
    + ',"Address 3"'
    + ',"Town"'
    + ',"Postcode"'
    + ',"Telephone"'
    + ',"Fax"'
    + ',"Mobile"'
    + ',"Email"'
    + ',"Contact Type"';

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
          tempStr := tempStr + ',"' + fieldbyname('Salutation').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Supplier_Name').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Building_No_name').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Street').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Locale').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Town').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Postcode').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Contact_Phone').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Contact_Fax').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Mobile_no').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Email').asstring + '"';
          tempStr := tempStr + ',"' + fieldbyname('Contact_Type_Description').asstring + '"';

          writeLn(exportFile, tempStr);
          prgbrExport.StepIt;
          next;
        end;
    end;
  CloseFile(exportFile);
end;

end.
