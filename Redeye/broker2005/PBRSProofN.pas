unit PBRSProofN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, DBCtrls, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSProofNFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SelOneGrpBox: TGroupBox;
    EstNumLabel: TLabel;
    OrderMemo: TMemo;
    QuoLUSpeedButton: TSpeedButton;
    GetPOsSQL: TFDQuery;
    chkbxPrintLogo: TCheckBox;
    Label1: TLabel;
    edtProofRevision: TEdit;
    UpdPOSQL: TFDQuery;
    Label2: TLabel;
    dblkpProofStatus: TDBLookupComboBox;
    ProofStatusSQL: TFDQuery;
    ProofStatusSRC: TDataSource;
    DefStatSQL: TFDQuery;
    EmailBitBtn: TBitBtn;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintProofReport(Sender: TObject);
    procedure OrderMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CanPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    Preview, PrintLogo: ByteBool;
    procedure EmailReport(Preview: boolean);
    function BuildQueryString: string;
  public
    { Public declarations }
    iLine: integer;
  end;

var
  PBRSProofNFrm: TPBRSProofNFrm;
  FaxArray: array[1..100, 1..5] of string;

implementation

uses
  System.UITypes,
  CCSPrint, PBRPProof, pbMainMenu, CCSemailHandler, pbDatabase;

{$R *.DFM}

const
    SQLCore =
      'SELECT Purchase_OrderLine.Purchase_Order, '+
      '       Customer_Contact.Name, '+
      '       Customer_Contact.Email, '+
      '       ExportFilter.ExportFilter, '+
      '       ExportFilter.Description as Export_Filter_Desc,  '+
	    '       '' '' as CC_EMail  '+
      'FROM (ExportFilter '+
      '       INNER JOIN Customer_Contact '+
      '         ON ExportFilter.ExportFilter = Customer_Contact.ExportFilter) '+
      '       INNER JOIN Purchase_OrderLine '+
      '         ON (Customer_Contact.Contact_no = Purchase_OrderLine.Contact_no) '+
      '         AND (Customer_Contact.Branch_no = Purchase_OrderLine.Branch_no) '+
      '         AND (Customer_Contact.Customer = Purchase_OrderLine.Customer) '+
      'WHERE 1=1 ';

procedure TPBRSProofNFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;

  {If Proof Letter then print Proof Approval Report}
  PrintProofReport(Self);
end;

procedure TPBRSProofNFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintLogo := True;
  {If Proof Letter then print Proof Approval Report}
  PrintProofReport(Self);
  close;
end;

procedure TPBRSProofNFrm.PrintProofReport(Sender: TObject);
var
  PrinterSettings : TPrinterSettings;
begin
  {Setup and print the report}
  PBRPProofFrm := TPBRPProofFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
    PBRPProofFrm.PrinterSettings := PrinterSettings;
    PBRPProofFrm.Preview := Preview;
    if chkbxPrintLogo.Checked then
      PBRPProofFrm.PrintLogo := True
    else
      PBRPProofFrm.PrintLogo := False;

    PBRPProofFrm.PONumber := StrToFloatDef(OrderMemo.Text, 0, FormatSettings);
    PBRPProofFrm.ProofRevision := edtProofRevision.text;
    PBRPProofFrm.ProofDefault := dblkpProofStatus.keyvalue;
    PBRPProofFrm.OnlyMine := false;
    PBRPProofFrm.sByCustomer := 'N';

    if PBRPProofFrm.GetDetails(Self) = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There are no proof approval forms to print', mtError,
        [mbAbort], 0);
    end
    else
      {Actually print or preview the report}
    if Preview then
      PBRPProofFrm.PrintPOsQuickReport.Preview
    else
    begin
      if SetUpPrinter(PrinterSettings) then
        PBRPProofFrm.PrintPOsQuickReport.Print;
    end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPProofFrm.Free;
  end;
end;

procedure TPBRSProofNFrm.OrderMemoKeyPress(Sender: TObject;
  var Key: Char);
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

procedure TPBRSProofNFrm.FormShow(Sender: TObject);
begin
  with GetPOsSQl do
    begin
      close;
      parambyname('Purchase_order').asfloat := StrToFloatDef(OrderMemo.text, 0, FormatSettings);
      parambyname('Line').asinteger := iLine;
      open;
      first;
      edtProofRevision.text := fieldbyname('Proof_Revision').asstring;
    end;
  DefStatSQL.close;
  DefStatSQl.open;

  dblkpProofStatus.KeyValue := DefStatSQL.fieldbyname('Proof_status').asstring;
  CanPrint(self);
end;

procedure TPBRSProofNFrm.FormActivate(Sender: TObject);
begin
  ProofStatusSQL.close;
  ProofStatusSQL.open;
end;

procedure TPBRSProofNFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (dblkpProofStatus.keyvalue <> '');
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
  EmailBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TPBRSProofNFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    chkbxPrintLogo.Checked := IniFile.ReadString('Redeye', 'Proof Approval - Print Logo', 'N') = 'Y';
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSProofNFrm.FormDestroy(Sender: TObject);
var
  IniFile : TIniFile;
  sPrintLogo: string;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  with IniFile do
  try
    if chkbxPrintLogo.checked then
      WriteString('Redeye', 'Proof Approval - Print Logo', 'Y')
    else
      WriteString('Redeye', 'Proof Approval - Print Logo', 'N');
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSProofNFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  dmBroker.bEmailSent := false;
  try
    EmailReport(false);
  finally
    if (frmPBMainMenu.EmailApplication = 'GENERIC') and dmBroker.bEmailSent then
      begin
        messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
        close;
      end;
  end;
end;

procedure TPBRSProofNFrm.EmailReport(Preview: boolean);
var
  sTemp, sSubject: string;
  PrinterSettings : TPrinterSettings;
begin
  emailHandler := TemailHandler.Create(self);

  {Setup and print the report}
  PBRPProofFrm := TPBRPProofFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPProofFrm.PrinterSettings := PrinterSettings;
      PBRPProofFrm.Preview := false;
      PBRPProofFrm.PrintLogo := True;

      PBRPProofFrm.PONumber := StrToFloatDef(OrderMemo.Text, 0, FormatSettings);
      PBRPProofFrm.ProofRevision := edtProofRevision.text;
      PBRPProofFrm.ProofDefault := dblkpProofStatus.keyvalue;
      PBRPProofFrm.OnlyMine := false;
      PBRPProofFrm.sByCustomer := 'N';

      if PBRPProofFrm.GetDetails(Self) = 0 then
        MessageDlg('There are no job bags to print', mtError, [mbAbort], 0)
      else
        begin
          PBRPProofFrm.Preview := false;
          PBRPProofFrm.PrintLogo := true;
          sTemp := BuildQueryString;
          sSubject := 'Order Proof Approval Form: ' + OrderMemo.Text + ' - ' + GetPOsSQL.fieldbyname('Customers_Desc').asstring;
          emailHandler.Body := 'Please find attached ' + sSubject + '.'#13#10#13#10;
          emailHandler.CreateEmail(PBRPProofFrm.PrintPOsQuickReport, sTemp, 'PROOF'+ OrderMemo.Text, sSubject);
        end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPProofFrm.Free;
  end;
end;

function TPBRSProofNFrm.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'AND Purchase_OrderLine.Purchase_Order = ' + OrderMemo.Text;
  Result := sTemp
end;

end.
