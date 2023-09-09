unit pbEnqsdm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmdlEnqs = class(TDataModule)
    qryEnqs: TFDQuery;
    dtsEnqs: TDataSource;
    qryDummy: TFDQuery;
    qryEnqsJB: TFDQuery;
    dtsEnqsJB: TDataSource;
    qryEnqsNotConverted: TFDQuery;
    qryPO: TFDQuery;
    qryReasons: TFDQuery;
    dtsReasons: TDataSource;
    qryPriceUnit: TFDQuery;
    dtsPriceUnit: TDataSource;
    qryGetEnquiryLine: TFDQuery;
    qryUpdEnquiryLine: TFDQuery;
    qryEnqsDate_Point: TSQLTimeStampField;
    qryEnqsEnquiry_Status: TIntegerField;
    qryEnqsStatus_Description: TWideStringField;
    qryEnqsDescription: TWideStringField;
    qryEnqsRep: TIntegerField;
    qryEnqsrep_Name: TWideStringField;
    qryEnqsOperator: TIntegerField;
    qryEnqsOperator_Name: TWideStringField;
    qryEnqsOffice_Contact: TIntegerField;
    qryEnqsOffice_Contact_Name: TWideStringField;
    qryEnqsCustomer: TIntegerField;
    qryEnqsCustomer_Name: TWideStringField;
    qryEnqsBranch_no: TIntegerField;
    qryEnqsBranch_Name: TWideStringField;
    qryEnqsAccount_Code: TWideStringField;
    qryEnqsEnquiry: TIntegerField;
    qryEnqsLine: TIntegerField;
    qryEnqsForm_Reference: TIntegerField;
    qryEnqsForm_Reference_ID: TWideStringField;
    qryEnqsForm_Reference_Descr: TWideStringField;
    qryEnqsStock_Reference: TWideStringField;
    qryEnqsEnq_Inactive: TWideStringField;
    qryEnqsProduct_Type_Description: TWideStringField;
    procedure qryEnqsStatus_TextGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    function GetHeaderCount: integer;
    function GetHeaderJBCount: integer;
    { Private declarations }
  public
    AccountMgr: string;
    BranchName: string;
    CustomerName: string;
    Customer: integer;
    Description: string;
    EnquiryDate: TDateTime;
    FormReference: string;
    Operator: integer;
    OperatorName: string;
    ProductCode: string;
    ProductType: string;
    Rep: integer;
    RepName: string;
    RepIsSubRep: boolean;
    ShowInactive: boolean;
    procedure RefreshData;
    procedure RefreshDataCustomer;
    procedure RefreshDataJB;
    property HeaderCount: integer read GetHeaderCount;
    property HeaderJBCount: integer read GetHeaderJBCount;
    function UsingSearch: boolean;
  end;

var
  dtmdlEnqs: TdtmdlEnqs;

implementation

uses pbDatabase;

{$R *.DFM}

{ TdtmdlEnqs }

function TdtmdlEnqs.GetHeaderCount: integer;
begin
  result := qryEnqs.recordcount;
end;

function TdtmdlEnqs.GetHeaderJBCount: integer;
begin
  result := qryEnqsJB.recordcount;
end;

procedure TdtmdlEnqs.RefreshData;
var
  sTemp: string;

  function qDate(const aDate : TDateTime) : string;
    begin
      // MSSQL SmallDateTime type has a range from 01/01/1900 to 06/06/2079
      var AuxDate := EncodeDate(1900, 1, 1);
      if aDate >= AuxDate then
        AuxDate := aDate;

      if dmBroker.IsSQL then
        Result := '''' + FormatDateTime('mm-dd-yyyy', AuxDate) + ''''
      else
        Result := '#' + FormatDateTime('mm/dd/yyyy', AuxDate) + '#';
    end;

{ Local function }
begin
  qryEnqs.close;
  qryEnqs.SQL.Clear;

  {Add the Sales Order query details}
  sTemp := '';
  qryEnqs.SQL := qryDummy.SQL;

  if CustomerName <> '' then
    sTemp := sTemp + ' AND ((Customer.Name LIKE ''%' + CustomerName + '%'')'
                   + ' OR (Customer_branch.Account_code LIKE ''%' + CustomerName + '%''))';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if ProductCode <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Stock_Reference LIKE ''' + ProductCode + '%'')';
  if FormReference <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Form_Reference_ID LIKE ''' + FormReference + '%'')';
  if ProductType <> '' then
    sTemp := sTemp + ' AND (Product_Type.Description LIKE ''' + ProductType + '%'')';
  if ShowInactive then
    sTemp := sTemp + ' AND ((EnquiryLine.Enq_inactive is NULL) OR (EnquiryLine.Enq_inactive = ''N'') '
                    + ' OR (EnquiryLine.Enq_inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((EnquiryLine.Enq_inactive is NULL) OR (EnquiryLine.Enq_inactive = ''N''))';

  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if accountMgr <> '' then
    sTemp := sTemp + ' AND (Office_Contact.Name LIKE ''%' + AccountMgr + '%'')';
  if OperatorName <> '' then
    sTemp := sTemp + ' AND (Operator.Name LIKE ''%' + OperatorName + '%'')';

  if Rep <> 0 then
    begin
      if RepIsSubRep then
        sTemp := sTemp + ' AND (Enquiry.Sub_Rep = ' + inttostr(Rep) + ')'
      else
        sTemp := sTemp + ' AND (Enquiry.Rep = ' + inttostr(Rep) + ')';
    end;

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Enquiry.Operator = ' + inttostr(Operator) + ')';

  sTemp := sTemp + ' AND Enquiry.Date_Point >= ' + qDate(EnquiryDate);
  qryEnqs.SQL.text := qryEnqs.SQL.text + sTemp;

  sTemp := 'ORDER BY Enquiry.enquiry desc ';

  qryEnqs.SQL.text := qryEnqs.SQL.text + sTemp;

  with qryEnqs do
  begin
    Close;
    {order date greater than 1/1/1990}
    if EnquiryDate > 32874 then
      parambyname('Records').asinteger := 100000000
    else
      parambyname('Records').asinteger := 2000;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;

end;

procedure TdtmdlEnqs.RefreshDataJB;
var
  sTemp: string;
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  qryEnqsJB.close;
  qryEnqsJB.SQL.Clear;

  {Add the Sales Order query details}
  sTemp := '';
  qryEnqsJB.SQL := qryEnqsNotConverted.SQL;

  if CustomerName <> '' then
    sTemp := sTemp + ' AND (Customer.Name LIKE ''%' + CustomerName + '%'')';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if ProductCode <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Stock_Reference LIKE ''' + ProductCode + '%'')';
  if FormReference <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Form_Reference_ID LIKE ''' + FormReference + '%'')';
  if ShowInactive then
    sTemp := sTemp + ' AND ((EnquiryLine.Enq_inactive is NULL) OR (EnquiryLine.Enq_inactive = ''N'') '
                    + ' OR (EnquiryLine.Enq_inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((EnquiryLine.Enq_inactive is NULL) OR (EnquiryLine.Enq_inactive = ''N''))';

  if Rep <> 0 then
    sTemp := sTemp + ' AND (Enquiry.Rep = ' + inttostr(Rep) + ')';

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Enquiry.Operator = ' + inttostr(Operator) + ')';

  qryEnqsJB.SQL.text := qryEnqsJB.SQL.text + sTemp;

  sTemp := 'ORDER BY Enquiry.enquiry desc ';

  qryEnqsJB.SQL.text := qryEnqsJB.SQL.text + sTemp;

  with qryEnqsJB do
  begin
    Close;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;

end;

procedure TdtmdlEnqs.RefreshDataCustomer;
var
  sTemp: string;
function qDate(const aDate : TDateTime) : string;
  begin
    if dmBroker.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
{ Local function }
begin
  qryEnqsJB.close;
  qryEnqsJB.SQL.Clear;

  {Add the Sales Order query details}
  sTemp := '';
  qryEnqsJB.SQL := qryDummy.SQL;

  if CustomerName <> '' then
    sTemp := sTemp + ' AND (Customer.Name LIKE ''%' + CustomerName + '%'')';
  if BranchName <> '' then
    sTemp := sTemp + ' AND (Customer_Branch.Name LIKE ''%' + BranchName + '%'')';
  if RepName <> '' then
    sTemp := sTemp + ' AND (Rep.Name LIKE ''%' + RepName + '%'')';
  if ProductCode <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Stock_Reference LIKE ''' + ProductCode + '%'')';
  if FormReference <> '' then
    sTemp := sTemp + ' AND (Form_Reference.Form_Reference_ID LIKE ''' + FormReference + '%'')';
  if ShowInactive then
    sTemp := sTemp + ' AND ((EnquiryLine.Enq_inactive is NULL) OR (EnquiryLine.Enq_inactive = ''N'') '
                    + ' OR (EnquiryLine.Enq_inactive = ''Y''))'
  else
    sTemp := sTemp + ' AND ((EnquiryLine.Enq_inactive is NULL) OR (EnquiryLine.Enq_inactive = ''N''))';

  if Rep <> 0 then
    sTemp := sTemp + ' AND (Enquiry.Rep = ' + inttostr(Rep) + ')';

  if Operator <> 0 then
    sTemp := sTemp + ' AND (Enquiry.Operator = ' + inttostr(Operator) + ')';

  qryEnqsJB.SQL.text := qryEnqsJB.SQL.text + sTemp;

  sTemp := 'ORDER BY Enquiry.enquiry desc ';

  qryEnqsJB.SQL.text := qryEnqsJB.SQL.text + sTemp;

  with qryEnqsJB do
  begin
    Close;
    parambyname('Records').asinteger := 2000;
    parambyname('Description').asstring := '%' + Description + '%';
    parambyname('Customer').asinteger := Customer;
    Open;
  end;
end;

function TdtmdlEnqs.UsingSearch: boolean;
begin
  if (CustomerName <> '') or
            (BranchName <> '') or
            (RepName <> '') or
            (ProductCode <> '') or
            (FormReference <> '') or
            (ProductType <> '') or
            (AccountMgr <> '') or
            (OperatorName <> '') or
            (ShowInactive) or
            (Rep <> 0) or
            (Operator <> 0) then
    result := true
  else
    result := false;
end;

procedure TdtmdlEnqs.qryEnqsStatus_TextGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if  (dtsEnqs.Dataset.fieldbyname('Enquiry_status').asinteger = 90) then
    begin
      qryPO.close;
      qryPO.parambyname('Enquiry').asinteger := dtsEnqs.Dataset.fieldbyname('Enquiry').asinteger;
      qryPO.parambyname('Line0').asinteger := dtsEnqs.Dataset.fieldbyname('Line').asinteger;
      qryPO.open;

      if qryPO.recordcount > 0 then
        begin
          text := qryPO.fieldbyname('Purchase_Order').asstring;
          exit;
        end;
      text := dtsEnqs.Dataset.fieldbyname('Status_description').asstring;
    end
  else
    text := dtsEnqs.Dataset.fieldbyname('Status_description').asstring;
end;

end.
