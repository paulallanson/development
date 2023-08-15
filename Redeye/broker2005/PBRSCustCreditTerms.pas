unit PBRSCustCreditTerms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CCSPrint, IniFiles, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSCustCreditTermsFrm = class(TForm)
    CancelBitBtn: TBitBtn;
    EmailBitBtn: TBitBtn;
    Previewbitbtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    lblCustomerName: TLabel;
    edtCustomerName: TEdit;
    chkbxPrintLogo: TCheckBox;
    Label1: TLabel;
    dblkpOperator: TDBLookupComboBox;
    qryOperators: TFDQuery;
    dtsOperators: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FActivated: boolean;
    iOperator: integer;
    procedure PrintReport(Preview: boolean);
    procedure EmailReport(Preview: boolean);
    function BuildQueryString: string;
    { Private declarations }
  public
    iCode: integer;
    sName, sAccountCode: string;
  end;

var
  PBRSCustCreditTermsFrm: TPBRSCustCreditTermsFrm;

implementation

uses
  System.UITypes,
  PBRPCustCreditTerms, CCSemailHandler, pbMainMenu;

{$R *.dfm}

const

  SQLCore =
    'SELECT Customer.Customer, '+
    '       Customer.Name AS Customer_Name, '+
    '       Customer_Branch.Inv_To_Customer, '+
    '       Customer_Branch.Inv_To_Branch, '+
    '       Customer_Branch.Inv_to_Contact, '+
    '       Customer_Contact.Name, '+
    '       Customer_Contact.Email, '+
    '       Customer_Contact.ExportFilter, '+
    '       ExportFilter.Description as Export_Filter_Desc,  '+
    '       '' '' as CC_EMail  '+
    'FROM ExportFilter '+
    '       RIGHT JOIN ((Customer '+
    '       INNER JOIN Customer_Branch '+
    '         ON Customer.Customer = Customer_Branch.Customer) '+
    '       LEFT JOIN Customer_Contact '+
    '         ON (Customer_Branch.Inv_to_Contact = Customer_Contact.Contact_no) '+
    '         AND (Customer_Branch.Branch_no = Customer_Contact.Branch_no) '+
    '         AND (Customer_Branch.Customer = Customer_Contact.Customer)) '+
    '         ON ExportFilter.ExportFilter = Customer_Contact.ExportFilter '+
    'WHERE 1=1 ';

procedure TPBRSCustCreditTermsFrm.FormActivate(Sender: TObject);
begin
  if FActivated <> true then
    begin
      with qryOperators do
        begin
          close;
          parambyname('Operator').asinteger := iOperator;
          open;
        end;

      if iOperator = 0 then
        dblkpOperator.keyvalue := frmPBMainMenu.iOperator
      else
        dblkpOperator.keyvalue := iOperator;

      edtCustomerName.text := sName;

      FActivated := true;
    end;
end;

procedure TPBRSCustCreditTermsFrm.PreviewbitbtnClick(Sender: TObject);
begin
  PrintReport(true);
end;

procedure TPBRSCustCreditTermsFrm.PrintReport(Preview: boolean);
var
  PrinterSettings : TPrinterSettings;
begin
  {Setup and print the report}
  PBRPCustCreditTermsFrm := TPBRPCustCreditTermsFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;

    try
      PBRPCustCreditTermsFrm.iCustomer := iCode ;
      PBRPCustCreditTermsFrm.iOperator := dblkpOperator.keyvalue ;
      PBRPCustCreditTermsFrm.sOperatorName := dtsOperators.DataSet.fieldbyname('Name').asstring ;
      PBRPCustCreditTermsFrm.sOperatorPhone := dtsOperators.DataSet.fieldbyname('Phone').asstring ;
      PBRPCustCreditTermsFrm.sOperatorJobTitle := dtsOperators.DataSet.fieldbyname('Job_Title').asstring ;

      PBRPCustCreditTermsFrm.bPrintLogo := chkbxPrintLogo.Checked;
      if (PBRPCustCreditTermsFrm.GetDetails = 0) then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('Details Not Found ', mtError, [mbAbort], 0);
        Exit;
      end;

      {Actually print or preview the report}
      if Preview then
        PBRPCustCreditTermsFrm.qrpDetails.Preview
      else
        if SetupPrinter(PrinterSettings) then
          PBRPCustCreditTermsFrm.qrpDetails.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
    PBRPCustCreditTermsFrm.Free;
    Application.ProcessMessages;
  end;
end;

procedure TPBRSCustCreditTermsFrm.PrintBitBtnClick(Sender: TObject);
begin
  PrintReport(false);
end;

procedure TPBRSCustCreditTermsFrm.EmailBitBtnClick(Sender: TObject);
begin
  EmailReport(true);
  close;
end;

procedure TPBRSCustCreditTermsFrm.EmailReport(Preview: boolean);
var
  sTemp, sSubject: string;
  PrinterSettings : TPrinterSettings;
begin
  emailHandler := TemailHandler.Create(self);

  {Setup and print the report}
  PBRPCustCreditTermsFrm := TPBRPCustCreditTermsFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
//      PBRPCustCreditTermsFrm.PrinterSettings := PrinterSettings;
      PBRPCustCreditTermsFrm.iCustomer := iCode ;

      if PBRPCustCreditTermsFrm.GetDetails = 0 then
        MessageDlg('Details not found', mtError, [mbAbort], 0)
      else
        begin
          PBRPCustCreditTermsFrm.bPrintLogo := true;
          sTemp := BuildQueryString;
          sSubject := 'Credit Terms Letter - ' + edtCustomerName.Text;

          emailHandler.Body := 'Please find attached ' + sSubject + '.'#13#10#13#10;
          emailHandler.CreateEmail(PBRPCustCreditTermsFrm.qrpDetails, sTemp, 'CREDIT'+ sAccountCode, sSubject);
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPCustCreditTermsFrm.Free;
  end;
end;

function TPBRSCustCreditTermsFrm.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'AND Customer.Customer = ' + inttostr(iCode);
  Result := sTemp
end;

procedure TPBRSCustCreditTermsFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      chkbxPrintLogo.Checked := (ReadString('Redeye', 'Credit Terms Letter - Print Logo', 'N') = 'Y');
      iOperator := strtoint(ReadString('Redeye', 'Credit Terms Letter - Operator', '0'));
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSCustCreditTermsFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      if chkbxPrintLogo.checked then
        WriteString('Redeye', 'Credit Terms Letter - Print Logo', 'Y')
      else
        WriteString('Redeye', 'Credit Terms Letter - Print Logo', 'N');

      WriteString('Redeye', 'Credit Terms Letter - Operator', inttostr(dblkpOperator.KeyValue));
    end;
  finally
    IniFile.Free;
  end;
end;

end.
