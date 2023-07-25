(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Labels Form.

VSS Info:
$Header:  $
$History: $
*******************************************************************************)
unit STRPBxLabels;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, QuickRpt, QRExpr, Qrctrls, ExtCtrls, DB, DBTables, Grids, DBGrids,
  CCSPrint;

type
  TSTRPBxLabelsFrm = class(TForm)
    STLabelsQuickReport: TQuickRep;
    QRBand1: TQRSubDetail;
    QRDBCustOrderRef: TQRDBText;
    RepSQL: TQuery;
    FromLbl: TQRLabel;
    lblBoxNo: TQRLabel;
    NumberedLbl: TQRLabel;
    BoxQtyCaptionlbl: TQRLabel;
    lblDate: TQRLabel;
    DeliveryDateLbl: TQRLabel;
    lblCust: TQRLabel;
    lblDesc: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBTxtdesc: TQRDBText;
    QRDBTxtPrt: TQRDBText;
    SRCRep: TDataSource;
    QRLblBxqty: TQRLabel;
    QRLblBoxNo: TQRLabel;
    FormRefSQL: TQuery;
    lblFormRefID: TQRLabel;
    lblFormRefDesc: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure STLabelsQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    procedure SetCaptions;
  public
    Preview: ByteBool;
    iLine, iBoxQuantity, iSets: Integer;
    sNumberFrom, sNumberTo, sPrefix: string[10];
    bLineup: boolean;
    iIntSel: Integer;
    PrinterSettings : TPrinterSettings;
    selcode: string;
  end;

var
  STRPBxLabelsFrm: TSTRPBxLabelsFrm;

implementation

{$R *.DFM}

function TSTRPBxLabelsFrm.GetDetails(Sender: TObject): Integer;
begin
  {Activate the main report SQL}
  with RepSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSel;
    Open;
  end;
end;

procedure TSTRPBxLabelsFrm.QRBand1BeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
var
  sFrom, sTo: string;
begin
  if (blineup) then Exit;

  with FormRefSQl do
    begin
      close;
      parambyname('Stock_Reference').asstring := repsql.fieldbyname('Part').asstring;
      open;
      first;

      lblFormRefID.caption := fieldbyname('Form_Reference_ID').asstring;
      lblFormRefDesc.caption := fieldbyname('Form_Reference_Descr').asstring;
    end;
  if iBoxQuantity <=0 then
    QrLblBxQty.caption := ''
  else
    QRLblBxQty.caption := inttostr(iBoxQuantity);
  QRLblBoxNo.caption := repsql.fieldbyname('sel1').asstring + ' of '+repsql.fieldByname('sel2').asstring;
  if Trim(sNumberFrom) <> '' then
  begin
    FromLbl.Enabled := true;
    sFrom := Trim(sPrefix) + Trim(sNumberFrom);
    sNumberTo := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity*iSets) - 1);
    sTo := Trim(sPrefix) + Trim(sNumberTo);
    FromLbl.Caption := sFrom + ' - ' + sTo;
    sNumberFrom := IntToStr(StrToInt(sNumberFrom) + (iBoxQuantity*isets));
  end
  else
  begin
    FromLbl.Enabled := false;
  end
end;

procedure TSTRPBxLabelsFrm.SetCaptions;
begin
end;

procedure TSTRPBxLabelsFrm.STLabelsQuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with STLabelsQuickReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
    OutputBin := PrinterSettings.OutputBin;
  end;
end;

end.
