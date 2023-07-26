unit PBRPCapability;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, QuickRpt, ExtCtrls, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPCapabilityFrm = class(TForm)
    qckRpCapability: TQuickRep;
    QRBand1: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblSelection: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData1: TQRSysData;
    grpCapability: TQRGroup;
    qryCapability: TFDQuery;
    QRLabel2: TQRLabel;
    grp1Text: TQRDBText;
    grpProductType: TQRGroup;
    QRLabel3: TQRLabel;
    grp2Text: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    procedure qckRpCapabilityBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    PrinterSettings: TPrinterSettings;
  end;

var
  PBRPCapabilityFrm: TPBRPCapabilityFrm;

implementation

{$R *.DFM}

procedure TPBRPCapabilityFrm.qckRpCapabilityBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  with qckrpCapability.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;
  {*qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now); *}
  qryCapability.Open;
  grpCapability.Expression := 'qryCapability.Capability';
  grp1Text.DataField := 'Capability_Description';

  grpProductType.Expression := 'qryCapability.Product_Type';
  grp2Text.DataField := 'Product_Type_Description';
end;

end.
