unit PBRSCustDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, CCSCommon, ComCtrls, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSCustDetFrm = class(TForm)
    qryCurrentCustStatus: TFDQuery;
    dtsrcCurrentCustStatus: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    pnlStatusSelect: TPanel;
    Label1: TLabel;
    qryCustStatus: TFDQuery;
    dbgrdCustStatus: TDBGrid;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    lblCustomerType: TLabel;
    TypeComboBox: TComboBox;
    Panel3: TPanel;
    Label7: TLabel;
    RepComboBox: TComboBox;
    QryCustType: TFDQuery;
    QryRep: TFDQuery;
    RadioGroup1: TRadioGroup;
    NewStdSQL: TFDQuery;
    chkbxCustomers: TCheckBox;
    pnlPrintControl: TPanel;
    lblRecordCount: TLabel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    btnExcel: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    cmbbxCustStatus: TComboBox;
    stsbrDetails: TStatusBar;
    pnlLevelofImp: TPanel;
    Label2: TLabel;
    cmbbxLevelOfImp: TComboBox;
    qryLevelOfImp: TFDQuery;
    StdSQL: TFDQuery;
    qryCustStatusCustomer_Status_descr: TWideStringField;
    QryCustTypeDescription: TWideStringField;
    QryRepName: TWideStringField;
    qryLevelOfImpImportance_Description: TWideStringField;
    qryCurrentCustStatusCustomer: TIntegerField;
    qryCurrentCustStatusBranch_no: TIntegerField;
    qryCurrentCustStatusName: TWideStringField;
    qryCurrentCustStatusBuilding_No_name: TWideStringField;
    qryCurrentCustStatusStreet: TWideStringField;
    qryCurrentCustStatusLocale: TWideStringField;
    qryCurrentCustStatusTown: TWideStringField;
    qryCurrentCustStatusPostcode: TWideStringField;
    qryCurrentCustStatusPhone: TWideStringField;
    qryCurrentCustStatusFax_Number: TWideStringField;
    qryCurrentCustStatusEmail: TWideStringField;
    qryCurrentCustStatusCustomer0: TIntegerField;
    qryCurrentCustStatusBranch_no0: TIntegerField;
    qryCurrentCustStatusMainRep: TIntegerField;
    qryCurrentCustStatusNarrative: TIntegerField;
    qryCurrentCustStatusAccount_Code: TWideStringField;
    qryCurrentCustStatusInv_To_Customer: TIntegerField;
    qryCurrentCustStatusInv_To_Branch: TIntegerField;
    qryCurrentCustStatusAccount_Code_On_Ledger: TWideStringField;
    qryCurrentCustStatusDelivery_Narrative: TIntegerField;
    qryCurrentCustStatusLast_Statement_ref: TWideStringField;
    qryCurrentCustStatusUse_Branch_Name: TWideStringField;
    qryCurrentCustStatusShort_Code: TWideStringField;
    qryCurrentCustStatusHO_Department: TIntegerField;
    qryCurrentCustStatusUse_HO_Delivery_Notes: TWideStringField;
    qryCurrentCustStatusCounty: TWideStringField;
    qryCurrentCustStatusConsumer_Code: TWideStringField;
    qryCurrentCustStatusInactive: TWideStringField;
    qryCurrentCustStatusOnline_Ordering_Email: TWideStringField;
    qryCurrentCustStatusInv_To_Contact: TIntegerField;
    qryCurrentCustStatusCustomer_Status: TIntegerField;
    qryCurrentCustStatusCustomer_Status_Descr: TWideStringField;
    qryCurrentCustStatusCustomer_Type: TIntegerField;
    qryCurrentCustStatusDescription: TWideStringField;
    qryCurrentCustStatusColor: TIntegerField;
    qryCurrentCustStatusFont_Color: TIntegerField;
    qryCurrentCustStatusRep: TIntegerField;
    qryCurrentCustStatusName_1: TWideStringField;
    qryCurrentCustStatusCust_name: TWideStringField;
    qryCurrentCustStatusName_2: TWideStringField;
    qryCurrentCustStatusAcc_Active: TWideStringField;
    qryCurrentCustStatusAnalysis_Code_1: TWideStringField;
    qryCurrentCustStatusAnalysis_Code_2: TWideStringField;
    qryCurrentCustStatusAnalysis_Code_3: TWideStringField;
    qryCurrentCustStatusAnalysis_Code_4: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure cmbbxCustStatusChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure cbSortChange(Sender: TObject);
    procedure RepComboBoxChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure chkbxCustomersClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    bAndWhere : byteBool;
    sAnalysis1, sAnalysis2, sAnalysis3, sAnalysis4: string;
    FProspects: boolean;
    procedure FixQuery;
    function BuildQueryString: string;
    procedure CallReport(const bPreview : Boolean);
    function Ordering(aBox: TComboBox): string;
    procedure SetProspects(const Value: boolean);
  public
    property Prospects: boolean read FProspects write SetProspects;
  end;

var
  PBRSCustDetFrm: TPBRSCustDetFrm;

implementation

uses
  System.UITypes,
  PBRPCustDet, pbMainMenu, pbDatabase;

{$R *.DFM}

procedure TPBRSCustDetFrm.FormCreate(Sender: TObject);
begin
(*  qryCustStatus.Open;
  while not qrycustStatus.Eof do
  begin
    cmbbxCustStatus.Items.Add(qryCustStatus.Fields[0].AsString);
    qryCustStatus.Next;
  end;
  cmbbxCustStatus.Items.Add('Show All');
*)
  {Get and list Customer Types}
  qryCustType.Open;
  while not qryCustType.Eof do
  begin
    TypeComboBox.Items.Add(qryCustType.fields[0].AsString);
    qryCustType.Next;
  end;
  TypeComboBox.Items.Add('Show All');

  {Get and list reps}
  qryRep.Open;
  while not qryRep.Eof do
  begin
    RepComboBox.Items.Add(qryRep.Fields[0].AsString);
    qryRep.Next;
  end;
  RepComboBox.Items.Add('Show All');

  {Get and list Level of Importance}
  qryLevelOfImp.Open;
  while not qryLevelOfImp.Eof do
  begin
    cmbbxLevelofImp.Items.Add(qryLevelOfImp.fields[0].AsString);
    qryLevelOfImp.Next;
  end;
  cmbbxLevelofImp.Items.Add('Show All');

  cbSort1.ItemIndex := 0;
  cbsort2.itemindex := 4;

  {Get Analysis Codes}
  sAnalysis1 := dmBroker.GetAnalysisCode1;
  sAnalysis2 := dmBroker.GetAnalysisCode2;
  sAnalysis3 := dmBroker.GetAnalysisCode3;
  sAnalysis4 := dmBroker.GetAnalysisCode4;

  Screen.Cursor := crDefault;
end;

procedure TPBRSCustDetFrm.cmbbxCustStatusChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustDetFrm.FormShow(Sender: TObject);
begin
  qryCustStatus.Active := True;
  qryRep.Active := True;
  qryCustType.Active := True;
  qryLevelofImp.Active := true;
//  qryCurrentCustStatus.Close;
//  qryCurrentCustStatus.Open;
  FixQuery;
  //Active := True;
end;

procedure TPBRSCustDetFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSCustDetFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSCustDetFrm.CallReport(const bPreview: Boolean);
var
  PBRPCustDetfrm: TPBRPCustDetfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryCurrentCustStatus.Close;
  PBRPCustDetfrm := TPBRPCustDetfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
          PBRPCustDetfrm.PrinterSettings := PrinterSettings;
          PBRPCustDetfrm.GetDetsQry.SQL.Clear;
          PBRPCustDetfrm.GetDetsQry.SQL.Text := qryCurrentCustStatus.Text;
          PBRPCustDetFrm.bIsSummary := RadioGroup1.ItemIndex = 0;
          if cbsort1.Text = 'Customer Type' then
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Customer_Type';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Description';
            end
          else
            if cbsort1.Text = 'Customer Status' then
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Customer_Status';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Customer_Status_Descr';
            end
          else
            if cbsort1.Text = 'Level of Importance' then
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Importance_Description';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Importance_Description';
            end
          else
            if cbsort1.Text = 'Customer' then
            begin
              PBRPCustDetFrm.QRCustGroup.enabled:=false;
              PBRPCustDetFrm.Sel1QRDBText.datafield := '';
            end
          else
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Rep';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Name_1';
            end;

          PBRPCustDetFrm.CustStateQRLabel.Caption := 'Customer Status: ' + cmbbxCustStatus.text;
          PBRPCustDetFrm.CustTypeQRLabel.Caption := 'Customer Type: ' + TypeComboBox.Text;
          PBRPCustDetFrm.ImportanceQRLabel.Caption := 'Importance: ' + cmbbxLevelOfImp.Text;
          PBRPCustDetFrm.RepQRLabel.Caption := 'Rep: '+RepComboBox.Text;
          PBRPCustDetFrm.SeqbyQRLabel.Caption := 'Seqenced Firstly By '+cbsort1.Text;
          if cbsort2.text <> '' then
            PBRPCustDetFrm.SeqbyQRLabel.Caption := PBRPCustDetFrm.SeqbyQRLabel.Caption + ' Secondly By '+cbsort2.Text;
          if bPreview then
            PBRPCustDetfrm.qrpCustStat.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPCustDetfrm.qrpCustStat.Print;
          PBRPCustDetfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryCurrentCustStatus.Open;
  end;
end;

function TPBRSCustDetFrm.BuildQueryString: string;
var
  sTemp : string;
  sLink : string;
begin
  sTemp := StdSQL.SQL.Text;
(*  bAndWhere := False;

  if (cmbbxCustStatus.Text <> '') then
    begin
      if  (cmbbxCustStatus.Text <> 'Show All') then
      begin
        sTemp := sTemp + ' where Customer_Status.Customer_Status_Descr = ''' + cmbbxCustStatus.Text + ' '' ';
        bAndWhere := True;
        end;
    end;
*)
  bAndWhere := true;

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

  if (TypeComboBox.Text <> '') then
    begin
      if  (TypeComboBox.Text <> 'Show All') then
      begin
         if bAndWhere then
          sTemp := sTemp + ' and '
         else
          sTemp := sTemp + ' where';

         sTemp := sTemp + ' Customer_Type.Description = ''' + TypeComboBox.Text + ' '' ';
         bAndWhere := True;
      end;
    end;

  if RadioGroup1.ItemIndex = 0 then
    begin
      if bAndWhere then
        sTemp := sTemp + ' and '
      else
        sTemp := sTemp + ' where';

      sTemp := sTemp +' Customer_Branch.Branch_No = 0';
      bAndWhere := True;
      end;

  if (RepComboBox.Text <> '') then
  begin
    if (RepComboBox.Text <> 'Show All') then
    begin
	    sTemp := sTemp + ' and Rep.Name = ''' + RepComboBox.Text + ' '' ';
(*      sTemp := sTemp + ' and (select top 1 Rep.Name ';
	    sTemp := sTemp + 'FROM Rep INNER JOIN Reps_Branches ON Rep.Rep = Reps_Branches.Rep ';
	    sTemp := sTemp + 'WHERE (Reps_Branches.Customer = Customer_Branch.Customer AND ';
	    sTemp := sTemp + '  Reps_Branches.Branch_no = Customer_Branch.Branch_No) AND ';
	    sTemp := sTemp + '  ((Reps_Branches.Is_Main_Rep is NULL) or (Reps_Branches.Is_Main_Rep = ''Y'')) ';
	    sTemp := sTemp + '  ORDER BY Reps_Branches.Is_Main_Rep DESC) = ''' + RepComboBox.Text + ' '' ';
*)
    end;
  end;


  if (cmbbxLevelOfImp.Text <> '') then
    begin
      if (cmbbxLevelOfImp.Text <> 'Show All') then
      begin
        if bAndWhere then
          sTemp := sTemp + ' and '
        else
          sTemp := sTemp + ' where ';

        sTemp := sTemp + 'Level_of_Importance.Importance_Description = ''' + cmbbxLevelOfImp.Text + ' '' ';
      end;
    end;

  if bAndWhere then
    sLink := ' and '
  else
    sLink := ' where ';
  if chkbxCustomers.checked then
    begin
      sTemp := sTemp + sLink + '((Customer.Acc_Active = ''Y'') or (Customer.Acc_Active = ''N''))';
    end
  else
    begin
      sTemp := sTemp + sLink + '((Customer.Acc_Active = ''Y''))';
    end;

  if (cbSort1.ItemIndex >= 0) or (cbSort2.ItemIndex >= 0) then
    begin
      sTemp := sTemp + ' ORDER BY ' + Ordering(cbSort1) + Ordering(cbSort2);
    end;

  if (cbsort1.ItemIndex <> 4) and (cbsort2.ItemIndex <> 4) then
    sTemp := sTemp + 'Customer.Name'
  else
    sTemp := sTemp + 'Customer.Name';

  Result := sTemp;
end;

procedure TPBRSCustDetFrm.FixQuery;
begin
  qryCurrentCustStatus.DisableControls;
  try
    qryCurrentCustStatus.Close;
    qryCurrentCustStatus.SQL.Clear;
    qryCurrentCustStatus.SQL.text := BuildQueryString;

    qryCurrentCustStatus.Open;
    lblRecordCount.Caption:=IntToStr(qryCurrentCustStatus.RecordCount);
  finally
    qryCurrentCustStatus.EnableControls;
  end;
end;

function TPBRSCustDetFrm.Ordering(aBox: TComboBox): string;
begin
  case aBox.ItemIndex of
  0:   Result := ' Customer_Type.Description,';
  1:   Result := ' Customer_Status.Customer_Status_Descr,';
  2:   Result := ' Level_of_Importance.Importance_description,';
  3:   Result := ' Rep_Name,';
  4:   Result := ' Cust_Name,';
  else Result := ' ';
  end;
end;

procedure TPBRSCustDetFrm.cbSortChange(Sender: TObject);
begin
  { Don't allow duplicate selections }
  if cbSort1.ItemIndex >= 0 then
  begin
    if cbSort2.ItemIndex = cbSort1.ItemIndex then
      cbSort2.ItemIndex := -1;
  end;

  FixQuery;
end;

procedure TPBRSCustDetFrm.RepComboBoxChange(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustDetFrm.RadioGroup1Click(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustDetFrm.chkbxCustomersClick(Sender: TObject);
begin
  FixQuery;
end;

procedure TPBRSCustDetFrm.btnExcelClick(Sender: TObject);
var
  PBRPCustDetfrm: TPBRPCustDetfrm;
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempFileName: string;
begin
//  frmpbMainMenu.ExportToExcel(PBRSCustDetFrm);

  qryCurrentCustStatus.Close;
  PBRPCustDetfrm := TPBRPCustDetfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
      try
        PBRPCustDetfrm.PrinterSettings := PrinterSettings;
        PBRPCustDetfrm.GetDetsQry.SQL.Clear;
        PBRPCustDetfrm.GetDetsQry.SQL.Text := qryCurrentCustStatus.Text;
        PBRPCustDetFrm.bIsSummary := RadioGroup1.ItemIndex = 0;
          if cbsort1.Text = 'Customer Type' then
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Customer_Type';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Description';
            end
          else
            if cbsort1.Text = 'Customer Status' then
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Customer_Status';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Customer_Status_Descr';
            end
          else
            if cbsort1.Text = 'Level of Importance' then
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Importance_Description';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Importance_Description';
            end
          else
            if cbsort1.Text = 'Customer' then
            begin
              PBRPCustDetFrm.QRCustGroup.enabled:=false;
              PBRPCustDetFrm.Sel1QRDBText.datafield := '';
            end
          else
            begin
              PBRPCustDetFrm.QRCustGroup.Expression := 'GetDetsQry.Rep';
              PBRPCustDetFrm.Sel1QRDBText.datafield :=  'Rep_Name';
            end;

        reccount := strtoint(lblRecordCount.caption);
        if reccount > 0 then
          begin
            self.prgbrExport.Max := recCount;
            tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
            self.pnlExportPrgrss.Visible := true;
            self.pnlExportPrgrss.Repaint;

            PBRPCustDetFrm.ExportToFile(tempFileName);
            self.pnlExportPrgrss.visible := false;
            self.Repaint;
            self.prgbrExport.Position := 0;

            self.OleContainer1.CreateLinkToFile(tempFileName, false);
            self.OleContainer1.DoVerb(0);
          end
        else
          begin
            messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
          end;
        PBRPCustDetfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryCurrentCustStatus.Open;
  end;
end;

procedure TPBRSCustDetFrm.FormActivate(Sender: TObject);
begin
  {Decide whether we have to display the analysis codes or not}
  if sAnalysis1 <> '' then
    qryCurrentCustStatusAnalysis_Code_1.displaylabel := sAnalysis1
  else
    qryCurrentCustStatusAnalysis_Code_1.visible := false;

  if sAnalysis2 <> '' then
    qryCurrentCustStatusAnalysis_Code_2.displaylabel := sAnalysis2
  else
    qryCurrentCustStatusAnalysis_Code_2.visible := false;

  if sAnalysis3 <> '' then
    qryCurrentCustStatusAnalysis_Code_3.displaylabel := sAnalysis3
  else
    qryCurrentCustStatusAnalysis_Code_3.visible := false;

  if sAnalysis4 <> '' then
    qryCurrentCustStatusAnalysis_Code_4.displaylabel := sAnalysis4
  else
    qryCurrentCustStatusAnalysis_Code_4.visible := false;
end;

procedure TPBRSCustDetFrm.SetProspects(const Value: boolean);
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

end.
