unit PBRSSuppDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Db, DBCtrls, Buttons,
  Printers, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSSuppDetFrm = class(TForm)
    qryCurrentSuppStatus: TFDQuery;
    dtsrcCurrentSuppStatus: TDataSource;
    pnlDisplay: TPanel;
    pnlControls: TPanel;
    pnlPrintControl: TPanel;
    Panel1: TPanel;
    PreviewReportBitBtn: TBitBtn;
    PrintReportBitBtn: TBitBtn;
    lblRecordCount: TLabel;
    CancelBitBtn: TBitBtn;
    Label6: TLabel;
    dbgrdCustStatus: TDBGrid;
    RadioGroup1: TRadioGroup;
    qryCurrentSuppStatusSupplier: TIntegerField;
    qryCurrentSuppStatusBranch_no: TIntegerField;
    qryCurrentSuppStatusName: TStringField;
    qryCurrentSuppStatusBuilding_No_name: TStringField;
    qryCurrentSuppStatusStreet: TStringField;
    qryCurrentSuppStatusLocale: TStringField;
    qryCurrentSuppStatusTown: TStringField;
    qryCurrentSuppStatusPostcode: TStringField;
    qryCurrentSuppStatusPhone: TStringField;
    qryCurrentSuppStatusFax_Number: TStringField;
    qryCurrentSuppStatusEmail: TStringField;
    qryCurrentSuppStatusNarrative: TIntegerField;
    qryCurrentSuppStatusAccount_Code: TStringField;
    qryCurrentSuppStatusAccount_Code_On_Ledger: TStringField;
    qryCurrentSuppStatusSupp_name: TStringField;
    qryCurrentSuppStatusName_1: TStringField;
    chkbxShowInactive: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure PreviewReportBitBtnClick(Sender: TObject);
    procedure PrintReportBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
  private
    bAndWhere : byteBool;
    procedure GetDetails;
    procedure CallReport(const bPreview : Boolean);
  public
    { Public declarations }
  end;

var
  PBRSSuppDetFrm: TPBRSSuppDetFrm;

implementation

uses  PBRPSuppDet;

{$R *.DFM}


procedure TPBRSSuppDetFrm.FormCreate(Sender: TObject);
begin
    Screen.Cursor := crDefault;
 // FixQuery;
end;

procedure TPBRSSuppDetFrm.PreviewReportBitBtnClick(Sender: TObject);
begin
  CallReport(True);
end;

procedure TPBRSSuppDetFrm.PrintReportBitBtnClick(Sender: TObject);
begin
  CallReport(False);
end;

procedure TPBRSSuppDetFrm.CallReport(const bPreview: Boolean);
var
  PBRPSuppDetfrm: TPBRPSuppDetfrm;
  PrinterSettings: TPrinterSettings;
begin
  qryCurrentsuppStatus.Close;
  PBRPSuppDetfrm := TPBRPSuppDetfrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
          PBRPSuppDetfrm.PrinterSettings := PrinterSettings;
          PBRPSuppDetFrm.bIsSummary := RadioGroup1.ItemIndex = 0;
          PBRPSuppDetFrm.bShowInactive := chkbxShowInactive.checked;
          if bPreview then
            PBRPSuppDetfrm.qrpsuppStat.Preview
          else
            if SetupPrinter(PrinterSettings) then
              PBRPSuppDetfrm.qrpsuppStat.Print;
          PBRPSuppDetfrm.Free;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    qryCurrentsuppStatus.Open;
  end;
end;

procedure TPBRSSuppDetFrm.GetDetails;
begin
  qryCurrentSuppStatus.Close;
  if chkbxShowinactive.checked then
    qryCurrentSuppStatus.parambyname('Acc_Active').AsString := 'N'
  else
    qryCurrentSuppStatus.parambyname('Acc_Active').AsString := 'Y';
  qryCurrentSuppStatus.Open;
  lblRecordCount.Caption:=IntToStr(qryCurrentSuppStatus.RecordCount);
end;

procedure TPBRSSuppDetFrm.FormActivate(Sender: TObject);
begin
  GetDetails;
end;

procedure TPBRSSuppDetFrm.chkbxShowInactiveClick(Sender: TObject);
begin
  GetDetails;
end;

end.
