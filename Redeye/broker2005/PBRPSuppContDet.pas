unit PBRPSuppContDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, ExtCtrls, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPSuppContDetFrm = class(TForm)
    QRPCustStat: TQuickRep;
    GetDetsQry: TFDQuery;
    QRBand1: TQRBand;
    QRCustGroup: TQRGroup;
    QRFootBand: TQRBand;
    qrlblTitle: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    Sel1QRDBText: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    CustTypeQRLabel: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    Sel1TitleQRDBText: TQRLabel;
    ChildBand1: TQRChildBand;
    qrlblAddress: TQRLabel;
    GetDetsQryContact_Name: TWideStringField;
    GetDetsQrySalutation: TWideStringField;
    GetDetsQryEmail: TWideStringField;
    GetDetsQryContact_Phone: TWideStringField;
    GetDetsQryMobile_No: TWideStringField;
    GetDetsQryContact_Fax: TWideStringField;
    GetDetsQryContact_Type: TIntegerField;
    GetDetsQryContact_Type_Description: TWideStringField;
    GetDetsQryBuilding_No_name: TWideStringField;
    GetDetsQryStreet: TWideStringField;
    GetDetsQryLocale: TWideStringField;
    GetDetsQryTown: TWideStringField;
    GetDetsQryPostcode: TWideStringField;
    GetDetsQrySupplier_Phone: TWideStringField;
    GetDetsQrySupplier_Fax: TWideStringField;
    GetDetsQrySupplier_Name: TWideStringField;
    GetDetsQrySupplier: TIntegerField;
    GetDetsQryBranch_no: TIntegerField;
    GetDetsQryinactive: TWideStringField;
    GetDetsQryPhone: TWideStringField;
    QRSysData2: TQRSysData;
    procedure QRPCustStatBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure GetDetsQryPhoneGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }

  public
    { Public declarations }
    PrinterSettings : TPrinterSettings;
    bIsSummary : bytebool;
    showAddress: boolean;
  end;

implementation

{$R *.DFM}

procedure TPBRPSuppContDetFrm.QRPCustStatBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 with qrpCustStat.PrinterSettings do
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

  if bIsSummary then
    qrlblTitle.Caption := 'Supplier Summary Report'
  else
    qrlblTitle.Caption := 'Supplier Detail Report';
  GetDetsQry.Open;

  ChildBand1.Enabled := not bIsSummary;
  qrlblAddress.Enabled := showAddress;

end;

procedure TPBRPSuppContDetFrm.GetDetsQryPhoneGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if GetDetsQryContact_Phone.asstring = '' then
    text := GetDetsQrySupplier_Phone.asstring
  else
    text := GetDetsQryContact_Phone.asstring;
end;

procedure TPBRPSuppContDetFrm.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tempStr: string;
begin
  if self.showAddress then
  begin
    tempStr := getDetsQry.FieldByName('street').asString;

    if getDetsQry.FieldByName('locale').asString <> '' then
      if tempStr <> '' then
        tempStr := tempStr + ', ' + getDetsQry.FieldByName('locale').asString
      else
        tempStr := getDetsQry.FieldByName('locale').asString;

    qrlblAddress.caption := tempStr;
  end;
end;

end.
