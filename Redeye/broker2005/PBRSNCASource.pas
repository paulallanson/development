unit PBRSNCASource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSNCASourceFrm = class(TForm)
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    qryPeriods: TFDQuery;
    dblkpGraph1: TDBLookupComboBox;
    dblkpGraph2: TDBLookupComboBox;
    Label3: TLabel;
    dblkpGraph3: TDBLookupComboBox;
    Label2: TLabel;
    dblkpGraph4: TDBLookupComboBox;
    Label4: TLabel;
    dtsPeriods: TDataSource;
    qryGetDates: TFDQuery;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    function GetPeriodDates(iPeriod: integer; var DateFrom,
      DateTo: TDateTime): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBRSNCASourceFrm: TPBRSNCASourceFrm;

implementation

uses CCSPrint, PBRPNCASource, pbDatabase, PBRSNCASourcePie;

{$R *.dfm}

procedure TPBRSNCASourceFrm.PreviewBitBtnClick(Sender: TObject);
var
  DateFrom, DateTo: TDateTime;
  bSuccess: boolean;
begin
  PBRSNCASourcePieFrm := TPBRSNCASourcePieFrm.create(self);

  try
    try
      bSuccess := GetPeriodDates(dblkpGraph1.keyvalue,DateFrom, DateTo);
    except
      bSuccess := false;
    end;
    if bSuccess then
      PBRSNCASourcePieFrm.PrepareGraph1(DateFrom, DateTo, dblkpGraph1.text);

    try
      bSuccess := GetPeriodDates(dblkpGraph2.keyvalue,DateFrom, DateTo);
    except
      bSuccess := false;
    end;
    if bSuccess then
      PBRSNCASourcePieFrm.PrepareGraph2(DateFrom, DateTo, dblkpGraph2.text);

    try
      bSuccess := GetPeriodDates(dblkpGraph3.keyvalue,DateFrom, DateTo);
    except
      bSuccess := false;
    end;
    if bSuccess then
      PBRSNCASourcePieFrm.PrepareGraph3(DateFrom, DateTo, dblkpGraph3.text);

    try
      bSuccess := GetPeriodDates(dblkpGraph4.keyvalue,DateFrom, DateTo);
    except
      bSuccess := false;
    end;
    if bSuccess then
      PBRSNCASourcePieFrm.PrepareGraph4(DateFrom, DateTo, dblkpGraph4.text);

    PBRSNCASourcePieFrm.showmodal;
  finally
    PBRSNCASourcePieFrm.free;
  end;
end;

procedure TPBRSNCASourceFrm.FormActivate(Sender: TObject);
begin
  with qryPeriods do
    begin
      close;
      parambyname('Period').asinteger := dmbroker.getCurrentPeriod;
      open;
    end;
end;

function TPBRSNCASourceFrm.GetPeriodDates(iPeriod: integer; var DateFrom, DateTo: TDateTime):boolean;
begin
  with qryGetDates do
    begin
      close;
      parambyname('Period').asinteger := iPeriod;
      open;
      datefrom := fieldbyname('Last_period_end_date').asdatetime+1;
      dateTo := fieldbyname('Period_end_Date').asdatetime;
      result := recordcount > 0;
    end;

  if not result then
    begin
      with qryGetDates do
        begin
          close;
          parambyname('Period').asinteger := dmBroker.GetCurrentPeriod;
          open;
          dateTo := fieldbyname('Period_end_Date').asdatetime;
        end;

      with qryGetDates do
        begin
          close;
          parambyname('Period').asinteger := dmBroker.GetCurrentPeriod-12;
          open;
          dateTo := fieldbyname('Last_Period_end_Date').asdatetime+1;
        end;
      result := true;
    end;
end;

end.
