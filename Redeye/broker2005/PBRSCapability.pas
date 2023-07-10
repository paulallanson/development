unit PBRSCapability;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ComCtrls, ExtCtrls,
  Printers, CCSPrint;

type
  TPBRSCapabilityfrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtCapability: TEdit;
    btnPreview: TBitBtn;
    btnPrint: TBitBtn;
    btnCancel: TBitBtn;
    stsbrdetails: TStatusBar;
    DBGrid1: TDBGrid;
    qryCapability: TQuery;
    dsCapability: TDataSource;
    SearchTimer: TTimer;
    qryDummy: TQuery;
    chkCapability: TCheckBox;
    procedure SearchTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCapabilityChange(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    FDisableNameChangeEvent: boolean;
    procedure SetDisableNameChangeEvent(const Value: boolean);
  private
    { Private declarations }
    procedure CallReport(const bPreview: Boolean);
    procedure FixQuery;
    function BuildQueryString: string;
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  public
    { Public declarations }
  end;

var
  PBRSCapabilityfrm: TPBRSCapabilityfrm;

implementation

uses  PBRPCapability;

{$R *.DFM}

procedure TPBRSCapabilityfrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  FixQuery;
end;

procedure TPBRSCapabilityfrm.FixQuery;
begin
  qryCapability.DisableControls;
  try
    qryCapability.Close;
    qryCapability.SQL.Clear;
    qryCapability.SQL.text := BuildQueryString;
    qryCapability.Open;
    stsBrDetails.panels[0].text :=IntToStr(qryCapability.RecordCount) + ' records displayed';
  finally
    qryCapability.EnableControls;
  end;
end;

function TPBRSCapabilityfrm.BuildQueryString: string;
var
  sTemp : string;
begin
{rebuilds the query string depending on the sort selections}
  sTemp := qryDummy.sql.text;
  sTemp := sTemp + ' WHERE (Product_TypeCapability.Description like ''%' + edtCapability.text + '%'')';
  sTemp := sTemp + ' AND ((Product_typeCapability.Default_For_All <> ''Y'') ';
  sTemp := sTemp + ' OR (Product_typeCapability.Default_for_all is null))';
  sTemp := sTemp + ' AND ((Product_TypeCapability.InActive = ''N'') OR (Product_TypeCapability.InActive IS NULL))';
  sTemp := sTemp + ' AND (Supplier.Acc_Active = ''Y'')';

  sTemp := sTemp + 'ORDER BY Product_typecapability.description, Product_type.Description, Supplier.Name';

  Result := sTemp;
end;

procedure TPBRSCapabilityfrm.FormShow(Sender: TObject);
begin
  qryCapability.Active := True;
  edtCapability.SetFocus;
end;

procedure TPBRSCapabilityfrm.edtCapabilityChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBRSCapabilityfrm.SetDisableNameChangeEvent(
  const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TPBRSCapabilityfrm.CallReport(const bPreview: Boolean);
var
  PBRPCapabilityFrm: TPBRPCapabilityFrm;
  PrinterSettings: TPrinterSettings;
begin
  qryCapability.Close;
  fixquery;
  {add total order by clause to report query}

  PBRPCapabilityFrm := TPBRPCapabilityFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPCapabilityFrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPCapabilityFrm.qryCapability.SQL.Clear;
      PBRPCapabilityFrm.qryCapability.SQL.Text := qryCapability.Text;
      PBRPCapabilityFrm.qrlblTitle.caption := PBRPCapabilityFrm.qrlblTitle.caption + DateToStr(Date);
      PBRPCapabilityFrm.qrlblSelection.caption :=
            PBRPCapabilityFrm.qrlblSelection.caption + edtCapability.Text;
      PBRPCapabilityfrm.grpCapability.ForceNewPage := chkCapability.checked;
      if bPreview then
        PBRPCapabilityFrm.qckrpCapability.Preview
      else
        if SetUpPrinter(PrinterSettings) then
          PBRPCapabilityFrm.qckrpCapability.Print;
    finally
      PrinterSettings.Free;
    end;
  finally
     Application.ProcessMessages;
     qryCapability.Open;
  end;
end;

procedure TPBRSCapabilityfrm.btnPreviewClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSCapabilityfrm.btnPrintClick(Sender: TObject);
begin
  CallReport(False);
end;

end.
