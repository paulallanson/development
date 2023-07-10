unit WTReps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Quickrep, DB, StdCtrls, ExtCtrls, gtQrCtrls;

type
  TWTRepsFrm = class(TForm)
    QuickReport1: TQuickReport;
    PageHeadBand: TQRBand;
    ListLbl: TgtQRLabel;
    WorktopSQL: TQuery;
    WorktopSRC: TDataSource;
    Thickness: TQuery;
    QRBand3: TQRBand;
    QRDBText2: TgtQRDBText;
    ThicknessSRC: TDataSource;
    RetailText: TgtQRDBText;
    QRBand4: TQRBand;
    QRLabel2: TgtQRLabel;
    QRLabel3: TgtQRLabel;
    RetailLbl: TgtQRLabel;
    QRSysData1: TgtQRSysData;
    QRBand5: TQRBand;
    WorktopSQLworktop: TStringField;
    WorktopSQLDescription: TStringField;
    WorktopSQLStocked: TStringField;
    WorktopSQLUse_For_Estimating: TStringField;
    QRDBText6: TgtQRDBText;
    MaterialHeader: TQRBand;
    QRLabel7: TgtQRLabel;
    QRDetailLink3: TQRDetailLink;
    MaterialSQL: TQuery;
    MaterialSRC: TDataSource;
    MaterialSQLMaterial_Type: TIntegerField;
    MaterialSQLDescription: TStringField;
    QRDetailLink1: TQRDetailLink;
    QRDetailLink2: TQRDetailLink;
    QRDBText1: TgtQRDBText;
    QRLabel8: TgtQRLabel;
    Customer: TgtQRLabel;
    CustLbl: TgtQRLabel;
    Discount: TgtQRLabel;
    DiscountLbl: TgtQRLabel;
    CustSQL: TQuery;
    PBandSQL: TQuery;
    ThicknessCostSQL: TQuery;
    Image2: TImage;
    QRSysData2: TgtQRSysData;
    QRLabel1: TgtQRLabel;
    procedure QuickReport1BeforePrint(var PrintReport: Boolean);
    procedure QRBand3BeforePrint(var PrintBand: Boolean);
    procedure QRBand3AfterPrint(BandPrinted: Boolean);
    procedure PageHeadBandBeforePrint(var PrintBand: Boolean);
    procedure QRBand4BeforePrint(var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    iCustomer: integer;
    bRetail: boolean;
  end;

var
  WTRepsFrm: TWTRepsFrm;
  iSame: integer;

implementation

{$R *.DFM}

procedure TWTRepsFrm.QuickReport1BeforePrint(var PrintReport: Boolean);
begin
	materialSQL.close;
  materialsql.open;

  worktopsql.active:=true;

  if bRetail <> true then
  	thickness.sql := ThicknessCostSQL.SQL;

  thickness.close;
  thickness.Parambyname('NewDate').asdatetime := now;
  Thickness.active:=true;

  PageHeadBand.height := 129;
end;

procedure TWTRepsFrm.QRBand3BeforePrint(var PrintBand: Boolean);
begin
try
  if iSame = strtoint(WorktopSQL.fieldbyname('worktop').asstring) then
  	begin
     	QRDBText6.visible := false;
     end
  else
  	begin
     	QRDBText6.visible := true;
     end;
  if bRetail = true then
	 	RetailText.Datafield := 'Unit_Price'
  else
		RetailText.Datafield := 'Unit_Cost';
  (ThicknessSRC.Dataset.fields[4] as TFloatField).currency := true;
  printband := true;
except
  printband := false
end;

end;

procedure TWTRepsFrm.QRBand3AfterPrint(BandPrinted: Boolean);
begin
try
	iSame := strtoint(WorktopSQL.Fieldbyname('Worktop').asstring);
except
  iSame := 0;
end;
end;

procedure TWTRepsFrm.PageHeadBandBeforePrint(var PrintBand: Boolean);
begin
  if bRetail = true then
	 	ListLbl.Caption := 'Worktop Price List'
  else
		ListLbl.Caption := 'Worktop Costs List';

	if iCustomer <> 0 then
  	begin
     	with CustSQL do
        	begin
           	close;
              parambyname('Customer').asinteger := iCustomer;
              open;
           end;
        with PBandSQL do
        	begin
           	close;
              open;
           end;
        CustLbl.caption := trim(CustSQL.fieldbyName('Title').asstring) +
        								CustSQL.fieldbyName('Name').asstring;
        DiscountLbl.caption := formatfloat('0.00',PBandSQL.fields[CustSQl.fieldbyname('Price_Band').asinteger].asfloat)+'%';
  		PageHeadBand.height := 208;
     end;
end;

procedure TWTRepsFrm.QRBand4BeforePrint(var PrintBand: Boolean);
begin
	if bRetail = true then
		RetailLbl.caption := 'Price'
  else
		RetailLbl.caption := 'Cost';
end;

end.
