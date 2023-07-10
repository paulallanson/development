unit PBMaintCompanyFY;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, DBCtrls;

type
  TPBMaintCompanyFYfrm = class(TForm)
    OKBitBtn: TBitBtn;
    BitBtn2: TBitBtn;
    qryYear: TQuery;
    dtsYear: TDataSource;
    qryPeriod: TQuery;
    dtsPeriod: TDataSource;
    GetDetsSQL: TQuery;
    UpdDetsSQL: TQuery;
    grpbxDetails: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblkpYear: TDBLookupComboBox;
    dblkpPeriod: TDBLookupComboBox;
    Label3: TLabel;
    qryCheckSalesProfit: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure dblkpYearClick(Sender: TObject);
  private
    function TransactionsExist: boolean;
    procedure GetPeriods(tempYear: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBMaintCompanyFYfrm: TPBMaintCompanyFYfrm;

implementation

uses PBDatabase, PBMainMenu;

{$R *.DFM}

procedure TPBMaintCompanyFYfrm.FormActivate(Sender: TObject);
begin
  qryYear.active := false;
  qryYear.active := true;

  with GetDetsSQL do
  begin
    Close;
    Open;
    First;
    if EOF then
    begin
      MessageDlg('There are no Companies set-up', mtError, [mbOK], 0);
      Close;
      Exit;
    end;
    if RecordCount > 1 then
    begin
      MessageDlg('There is more than 1 Company set-up. ' +
        'ALL Companies will be updated.', mtWarning, [mbOK], 0);
    end;
    if FieldByName('Financial_Year').AsString = '' then
      dblkpYear.KeyValue := 0
    else
      dblkpYear.KeyValue := FieldByName('Financial_Year').Asinteger;

    GetPeriods(dblkpYear.KeyValue);
    
    if FieldByName('Period').AsString = '' then
      dblkpPeriod.KeyValue := 0
    else
      dblkpPeriod.KeyValue := FieldByName('Period').Asinteger;

    dblkpYear.Enabled := not TransactionsExist;
    dblkpPeriod.Enabled := not TransactionsExist;
    enableok(self);
  end;
  dmBroker.ScreenAccessControl(Self,'mnuFinancials',frmpbMainMenu.iOperator,0,0) ;

end;

function TPBMaintCompanyFYfrm.TransactionsExist: boolean;
begin
//  check for transactions in this year
  with qryCheckSalesProfit do
    begin
      close;
      parambyname('Financial_Year').asinteger := GetDetsSQL.fieldbyname('Financial_Year').asinteger;
      open;
      result := (recordcount > 0);
    end;
end;

procedure TPBMaintCompanyFYfrm.OKBitBtnClick(Sender: TObject);
begin
  with UpdDetsSQL do
  begin
    Close;
    if dblkpYear.KeyValue = 0 then
      ParamByName('Financial_Year').Clear
    else
      ParamByName('Financial_Year').Asinteger := dblkpYear.KeyValue;
    if dblkpPeriod.KeyValue = 0 then
      ParamByName('Period').Clear
    else
      ParamByName('Period').Asinteger := dblkpPeriod.KeyValue;
    ExecSQL;
  end;
  Close;
end;

procedure TPBMaintCompanyFYfrm.EnableOK(Sender: TObject);
begin
  OKBitBtn.enabled := (dblkpYear.keyvalue <> 0) and
      (dblkpPeriod.keyvalue <> 0);
end;

procedure TPBMaintCompanyFYfrm.dblkpYearClick(Sender: TObject);
begin
  GetPeriods(dblkpYear.KeyValue);
  EnableOK(self);
end;

procedure TPBMaintCompanyFYfrm.GetPeriods(tempYear: integer);
begin
  qryPeriod.close;
  qryPeriod.parambyname('Financial_year').asinteger := tempYear;
  qryPeriod.open;
end;

end.
