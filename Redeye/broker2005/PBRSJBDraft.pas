unit PBRSJBDraft;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, STSOObjects, IniFiles, CCSPrint;

type
  TPBRSJBDraftFrm = class(TForm)
    OrderGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblDescription: TLabel;
    lblCustomer: TLabel;
    CancelBitBtn: TBitBtn;
    Previewbitbtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    chkbxShowZeroValues: TCheckBox;
    EmailBitBtn: TBitBtn;
    chkbxFinance: TCheckBox;
    procedure PreviewbitbtnClick(Sender: TObject);
    procedure Runreport(Preview: ByteBool);
    procedure FormCreate(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
  private
    FIntSelCode: integer;
    FJBNumber: integer;
    procedure GetSelection;
    procedure SetJBNumber(const Value: integer);
    procedure EmailReport(Preview: boolean);
    function BuildQueryString: string;
    { Private declarations }
  public
    { Public declarations }
    Reprint: ByteBool;
    bOK: ByteBool;
    PrintSetup: boolean;
    property JBNumber: integer read FJBNumber write SetJBNumber;
  end;

var
  PBRSJBDraftFrm: TPBRSJBDraftFrm;

implementation

uses STRPSord, pbDatabase, PBRPJBDraft, CCSemailHandler, pbMainMenu;

{$R *.DFM}

const
  SQLCore =
  'SELECT Job_Bag.Job_Bag, '+
	'   Customer_Contact.Name,  '+
	'   Customer_Contact.Email,  '+
	'   ExportFilter.Description as Export_Filter_Desc,  '+
	'   Customer_Contact.ExportFilter,  '+
	'   '' '' as CC_EMail  '+
  'FROM ExportFilter RIGHT JOIN ((Customer_Branch  '+
	'   INNER JOIN Job_Bag ON  '+
	'   (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND  '+
	'   (Customer_Branch.Customer = Job_Bag.Customer))  '+
	'   INNER JOIN Customer_Contact ON  '+
	'   (Customer_Branch.Branch_no = Customer_Contact.Branch_no) AND  '+
	'   (Customer_Branch.Customer = Customer_Contact.Customer)) ON  '+
	'   ExportFilter.ExportFilter = Customer_Contact.ExportFilter  '+
  'WHERE (Job_Bag.Contact_no = Customer_Contact.contact_no) ';

procedure TPBRSJBDraftFrm.PreviewbitbtnClick(Sender: TObject);
begin
  RunReport(True);
end;

procedure TPBRSJBDraftFrm.Runreport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  GetSelection;
  PBRPJBDraftFrm := TPBRPJBDraftFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPJBDraftFrm.FinanceVers := chkbxFinance.checked;
      if chkbxShowZeroValues.checked then
        PBRPJBDraftFrm.ShowZeroValues := 'Y'
      else
        PBRPJBDraftFrm.ShowZeroValues := 'N';

      PBRPJBDraftFrm.iIntSelCode := fIntSelCode ;
//      PBRPJBDraftFrm.PrintLogo := ChkBxLogo.Checked;
      PBRPJBDraftFrm.Preview := Preview;
      if PBRPJBDraftFrm.GetDetails(Self) = 0 then
        begin
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        end
      else
        begin
          if preview then
            PBRPJBDraftFrm.qrpDetails.Preview
          else
            if setupPrinter(PrinterSettings) then
              PBRPJBDraftFrm.qrpDetails.Print;
        end;
    finally
      dmBroker.DelIntSelCode(fIntselCode, True);
      PBRPJBDraftFrm.Free;
    end;
  finally
    PrinterSettings.Free;
  end;
end;

procedure TPBRSJBDraftFrm.FormCreate(Sender: TObject);
begin
  fIntSelCode := dmBroker.GetNextIntSelCode(Self);
  bOK := false;
end;

procedure TPBRSJBDraftFrm.GetSelection;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	dmBroker.DelIntSelCode(fIntSelCode, True);

 	with dmBroker.AddIntSelQuery do
    begin
      Close;
      ParamByName('Int_sel_Code').AsInteger := FIntselCode;
      ParamByName('Sel1').AsFloat := JBNumber;
      ParamByName('Text100').AsString := inttostr(JBNumber);
      execSQL;
    end;
end;

procedure TPBRSJBDraftFrm.PrintBitBtnClick(Sender: TObject);
begin
  Printsetup := True;
  RunReport(False);
  bOK := true;
  close;
end;

procedure TPBRSJBDraftFrm.SetJBNumber(const Value: integer);
begin
  FJBNumber := Value;
end;

procedure TPBRSJBDraftFrm.EmailBitBtnClick(Sender: TObject);
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

procedure TPBRSJBDraftFrm.EmailReport(Preview: boolean);
var
  sTemp, sSubject: string;
begin
  emailHandler := TemailHandler.Create(self);
  GetSelection;
  PBRPJBDraftFrm := TPBRPJBDraftFrm.create(self);
  try
    if chkbxShowZeroValues.checked then
      PBRPJBDraftFrm.ShowZeroValues := 'Y'
    else
      PBRPJBDraftFrm.ShowZeroValues := 'N';

    PBRPJBDraftFrm.iIntSelCode := fIntSelCode ;

    PBRPJBDraftFrm.Preview := Preview;
    if (PBRPJBDraftFrm.GetDetails(self) = 0) then
      MessageDlg('There are no job bags to print', mtError, [mbAbort], 0)
    else
      begin
        PBRPJBDraftFrm.Preview := false;
        PBRPJBDraftFrm.bPrintLogo := true;
        sTemp := BuildQueryString;

//        sSubject := 'Job Bag Draft Invoice: ' + inttostr(FJBNumber);
        sSubject := PBRPJBDraftFrm.qrlblReportTitle.caption + ': ' + inttostr(FJBNumber);

        emailHandler.body := dmBroker.GetEmailProformaText;
        if trim(emailHandler.body) = '' then
          emailHandler.Body := 'Please find attached ' + sSubject + '.'#13#10#13#10
                            +  'If you have any queries please contact me immediately'#13#10#13#10;

        {Replace the invoice number}
        if pos('<Number>', emailHandler.Body) > 0 then
          begin
            emailHandler.Body := stringreplace(emailHandler.Body, '<Number>', inttostr(FJBNumber), [rfIgnoreCase])
          end;

        emailHandler.CreateEmail(PBRPJBDraftFrm.qrpDetails, sTemp, 'DRAFT'+ inttostr(FJBNumber), sSubject);
      end;
  finally
    PBRPJBDraftFrm.free;
    emailHandler.Free;
  end;
end;

function TPBRSJBDraftFrm.BuildQueryString: string;
var
  sTemp: string;
begin
  sTemp := SQLCore;

  sTemp := sTemp + 'AND Job_Bag.Job_Bag = ' + inttostr(FJBNumber);
  Result := sTemp
end;

end.
