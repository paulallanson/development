unit CCSemailHandler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ActiveX, COMobj, QrExport, Db, Variants, shFolder, Outlook_TLB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TemailHandler = class(TDataModule)
    qrySelCustomerContacts: TFDQuery;
    qryEmailList: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    attachmentTypeList: TStringList;
    FEmailAttachment: TstringList;
    recipientList: TStringList;
    CCList: TStringList;
    fileName: string;
    function populateRecipientList(customer, branch: integer): boolean;
    procedure PrintToAttachment(report: TQuickRep; attachmentType: string);
    function GetRecipientList(sQueryString: string): boolean;
  public
    body: String;
    ccEmail: string;
    procedure CreateEmail(report: TQuickRep; sQueryString: string;
      fileName, Subject: string);
    procedure CreateOneEmail(report: TQuickRep; sQueryString: string;
      fileName, Subject: string);
    procedure Email(report: TQuickRep; customer, branch: integer; fileName: string);
    procedure EmailViaOutlook(sRecipient, sSubject: string; sAttachment: Tstrings; ccEmail: string);
  end;

var
  emailHandler: TemailHandler;

implementation

uses
  CCSCommon, CCSEmailList, pbMainMenu, pbDatabase, Printer.Tools;

{$R *.DFM}

{ TemailHandler }

procedure TemailHandler.email(report: TQuickRep; customer, branch: integer; fileName: string);
var
  inx: integer;
begin
  self.fileName := fileName;
  self.populateRecipientList(customer, branch);

  for inx := 0 to (self.recipientList.count - 1) do
  begin
    self.PrintToAttachment(report, self.attachmentTypeList[inx]);
    self.EmailViaOutlook(self.recipientList[inx], 'Test Email', self.FEmailAttachment, self.CCList[inx]);
  end;
end;

procedure TemailHandler.CreateEmail(report: TQuickRep; sQueryString: string; fileName, Subject: string);
var
  inx: integer;
  sSalutation, sSenderName, sSenderEmail, sRecipientName: string;
begin
  self.fileName := fileName;
  
  if not self.GetRecipientList(sQueryString) then
    exit;

  for inx := 0 to (self.recipientList.count - 1) do
  begin
    self.PrintToAttachment(report, self.attachmentTypeList[inx]);

    sSalutation := '';
    sSenderName := frmPBMainMenu.sOperator_Name;
    sSenderEmail := frmPBMainMenu.sOperator_Email;
    sRecipientName := self.recipientList[inx];

    if frmPBMainMenu.EmailApplication = 'GENERIC' then
      {Send to Email database}
      dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, self.recipientList[inx], Subject, self.body, self.FEmailAttachment,
                                   frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
    else
      self.EmailViaOutlook(self.recipientList[inx], Subject, self.FEmailAttachment, self.CCList[inx]);
  end;
end;

procedure TemailHandler.CreateOneEmail(report: TQuickRep; sQueryString: string; fileName, Subject: string);
var
  inx: integer;
  attachmentType, recipientList: string;
begin
  self.fileName := fileName;

  if not self.GetRecipientList(sQueryString) then
    exit;

  attachmentType := self.attachmentTypeList[0];

  recipientList := '';

  for inx := 0 to (self.recipientList.count - 1) do
    recipientList := recipientList + self.recipientList[inx] + ';';

  self.PrintToAttachment(report, attachmentType);
  self.EmailViaOutlook(recipientList, Subject, self.FEmailAttachment, self.CCList[0]);
end;

procedure TemailHandler.EmailViaOutlook(sRecipient, sSubject: string;
          sAttachment: Tstrings; ccEMail: string);
var
  Outlook: OutlookApplication;
  Unknown: IUnknown;
  Result: HResult;
  MI: MailItem;
  bOutlookRunning: boolean;
  i: integer;
const
  olMailItem = 0;
begin
  // via early binding:
  Result := GetActiveObject(CLASS_OutlookApplication, nil, Unknown);

  {Check if Outlook is already running, this uses Outlook 2000}
  if FindWindow('mspim_wnd32','Microsoft Outlook') <> 0 then
    bOutlookRunning := true
  else
    bOutlookRunning := false;

  if Result = MK_E_UNAVAILABLE then
    begin
      Outlook := CoOutlookApplication.Create as _Application;
    end
  else begin
    // make sure no other error occurred during GetActiveObject
    OleCheck(Result);
    OleCheck(Unknown.QueryInterface(OutlookApplication, Outlook));
  end;

	MI := Outlook.CreateItem(olMailItem) as MailItem;
  MI.Bodyformat := olFormatHTML;
  MI.GetInspector;

//  if trim(sRecipient) <> '' then
//	  MI.Recipients.Add(sRecipient);

  if trim(sRecipient) <> '' then
    MI.To_ := sRecipient;

  for i := 0 to pred(sAttachment.count) do
    MI.Attachments.Add(sAttachment[i],EmptyParam, EmptyParam, EmptyParam);

  MI.Subject := sSubject;
  MI.CC := ccEmail;

  self.Body := stringreplace(self.Body,AnsiString(#13#10),'<BR>',[rfReplaceAll]);
  MI.HTMLBody := '<HTML><BODY>'+self.Body+'</BODY></HTML>' + MI.HTMLBody;

//  MI.Body := self.body;
  try
    MI.Display(EmptyParam);
  except
  end;

  if not(bOutlookRunning) then
    begin
      Showmessage('Please click OK when the mail has been sent.');
      Outlook.Quit;
      Outlook := nil;
    end;
end;

procedure TemailHandler.PrintToAttachment(report: TQuickRep; attachmentType: string);
begin
  TPrinterTools.New.PrintToAttachment(Report, FEmailAttachment, Self.fileName, attachmentType);
end;

procedure TemailHandler.DataModuleCreate(Sender: TObject);
begin
  self.FEmailAttachment := TStringList.Create;
  self.recipientList := TStringList.Create;
  self.CCList := TStringList.Create;
  self.attachmentTypeList := TStringList.Create;
end;

procedure TemailHandler.DataModuleDestroy(Sender: TObject);
begin
  self.FEmailAttachment.Free;
  self.recipientList.Free;
  self.CCList.Free;
  self.attachmentTypeList.Free;
end;

function TemailHandler.populateRecipientList(customer, branch: integer): boolean;
var
  emailList: TCCSEmailListFrm;
  inx: integer;
begin
  self.recipientList.Clear;
  self.attachmentTypeList.Clear;
  inx := 1;

  self.qrySelCustomerContacts.Active := false;
  self.qrySelCustomerContacts.ParamByName('customer').asInteger:= customer;
  self.qrySelCustomerContacts.ParamByName('branch').asInteger := branch;
  self.qrySelCustomerContacts.Active := true;

  self.qrySelCustomerContacts.first;

  emailList := TCCSEmailListFrm.Create(self);

  emailList.EmailListGrid.RowCount := self.qrySelCustomerContacts.RecordCount + 1;
  try
    emailList.EmailListGrid.Cells[0, 0] := 'Name';
    emailList.EmailListGrid.Cells[1, 0] := 'E-mail Address';
    emailList.EmailListGrid.colwidths[2] := -1;

    while not self.qrySelCustomerContacts.Eof do
    begin
      emailList.EmailListGrid.Cells[0, inx] :=
        self.qrySelCustomerContacts.FieldByName('name').asString + ' ('+
        self.qrySelCustomerContacts.FieldByName('contact_type_desc').asString + ')';
      emailList.EmailListGrid.Cells[1, inx] :=
        self.qrySelCustomerContacts.FieldByName('Email').asString;
      emailList.EmailListGrid.Cells[3, inx] :=
        self.qrySelCustomerContacts.FieldByName('export_filter_desc').asString;
      emailList.EmailListGrid.Cells[4, inx] :=
        self.qrySelCustomerContacts.FieldByName('ExportFilter').asString;
      inc(inx);
      self.qrySelCustomerContacts.next;
    end;

    emailList.ShowModal;
    if emailList.ModalResult = mrOK then
    begin
      for inx := 1 to (emailList.EmailListGrid.RowCount - 1) do
      begin
        if emailList.EmailListGrid.cells[1, inx] <> '' then
        begin
          self.recipientList.Add(emailList.EmailListGrid.Cells[1, inx]);
          self.attachmentTypeList.Add(emailList.EmailListGrid.Cells[4, inx]);
        end;
      end;
    end;
  finally
    emailList.Free;
    self.qrySelCustomerContacts.active := false;
  end;

  Result := true;
end;

function TemailHandler.GetRecipientList(sQueryString: string): boolean;
var
  emailList: TCCSEmailListFrm;
  inx: integer;
begin
  Result := false;
  self.recipientList.Clear;
  self.CCList.Clear;
  self.attachmentTypeList.Clear;
  inx := 1;

  qryEmailList.Close;
  qryEmailList.SQL.Clear;
  qryEmailList.SQL.text := sQueryString;
  qryEmailList.Open;

  qryEmailList.first;

  emailList := TCCSEmailListFrm.Create(self);
  emaillist.caption := 'Email Recipient List';

  emailList.EmailListGrid.RowCount := qryEmailList.RecordCount + 1;
  try
    emailList.EmailListGrid.Cells[0, 0] := 'Name';
    emailList.EmailListGrid.Cells[1, 0] := 'E-mail Address';
    emailList.EmailListGrid.colwidths[2] := -1;

    while not qryEmailList.Eof do
    begin
      emailList.EmailListGrid.Cells[0, inx] := qryEmailList.FieldByName('name').asString;
      emailList.EmailListGrid.Cells[1, inx] := qryEmailList.FieldByName('Email').asString;
      emailList.EmailListGrid.Cells[3, inx] := qryEmailList.FieldByName('export_filter_desc').asString;
      emailList.EmailListGrid.Cells[4, inx] := qryEmailList.FieldByName('ExportFilter').asString;
      emailList.EmailListGrid.Cells[5, inx] := qryEmailList.FieldByName('CC_Email').asString;
      inc(inx);
      qryEmailList.next;
    end;

    emailList.ShowModal;
    if emailList.ModalResult = mrOK then
    begin
      for inx := 1 to (emailList.EmailListGrid.RowCount - 1) do
      begin
        if trim(emailList.EmailListGrid.cells[1, inx]) <> '' then
        begin
          self.recipientList.Add(emailList.EmailListGrid.Cells[1, inx]);
          self.attachmentTypeList.Add(emailList.EmailListGrid.Cells[4, inx]);
          self.CCList.Add(emailList.EmailListGrid.Cells[5, inx]);
          Result := true;
        end;
      end;
    end;
  finally
    emailList.Free;
    self.qryEmailList.active := false;
  end;

end;

end.
