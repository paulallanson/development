unit PBRPCustContDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, ExtCtrls, CCSPrint, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPCustContDetFrm = class(TForm)
    QRPCustStat: TQuickRep;
    GetDetsQry: TFDQuery;
    QRBand1: TQRBand;
    QRCustGroup: TQRGroup;
    QRFootBand: TQRBand;
    qrlblTitle: TQRLabel;
    qrlblRunDate: TQRLabel;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    Sel1QRDBText: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    SeqbyQRLabel: TQRLabel;
    CustStateQRLabel: TQRLabel;
    CustTypeQRLabel: TQRLabel;
    RepQRLabel: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    Sel1TitleQRDBText: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    GetDetsQryContact_Name: TWideStringField;
    GetDetsQryEmail: TWideStringField;
    GetDetsQryContact_Phone: TWideStringField;
    GetDetsQryMobile_No: TWideStringField;
    GetDetsQryContact_Fax: TWideStringField;
    GetDetsQryContact_Type: TIntegerField;
    GetDetsQryContact_Level: TIntegerField;
    GetDetsQryContact_Status: TIntegerField;
    GetDetsQryContact_Status_Descr: TWideStringField;
    GetDetsQryBuilding_No_name: TWideStringField;
    GetDetsQryStreet: TWideStringField;
    GetDetsQryLocale: TWideStringField;
    GetDetsQryTown: TWideStringField;
    GetDetsQryPostcode: TWideStringField;
    GetDetsQryCustomer_Phone: TWideStringField;
    GetDetsQryCustomer_Fax: TWideStringField;
    GetDetsQryCustomer_Name: TWideStringField;
    GetDetsQryRep_Name: TWideStringField;
    GetDetsQryCustomer: TIntegerField;
    GetDetsQryBranch_no: TIntegerField;
    GetDetsQryDef_Markup_Perc: TFloatField;
    GetDetsQryAcc_Active: TWideStringField;
    GetDetsQryPhone: TWideStringField;
    GetDetsQryContact_Level_Description: TWideStringField;
    GetDetsQryContact_Type_Description: TWideStringField;
    ChildBand1: TQRChildBand;
    QRDBText1: TQRDBText;
    qrlblAddress: TQRLabel;
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
    showRep: boolean;
    showAddress: boolean;
    showStatus: boolean;
  end;

implementation

{$R *.DFM}

procedure TPBRPCustContDetFrm.QRPCustStatBeforePrint(Sender: TCustomQuickRep;
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
  qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now);
  if bIsSummary then
    qrlblTitle.Caption := 'Customer Summary Report'
  else
    qrlblTitle.Caption := 'Customer Detail Report';
  GetDetsQry.Open;

  ChildBand1.Enabled := not bIsSummary;
  qrlblAddress.Enabled := showAddress;
  QRDBText1.Enabled := showRep;

  if not showStatus then
  begin
    QRLabel7.Enabled := false;
    QRDBText10.Enabled := false;

    QRDBText12.width := 140;

    QRLabel1.Left  := 166;
    QRDBText2.Left := 166;
    QRDBText1.Left := 166;

    QRLabel2.Left := 366;
    QRDBText3.Left := 366;
    QRDBText3.Width := 180;
    qrlblAddress.Left := 366;
    //town
    QRLabel3.left := 554;
    QRDBText5.left := 554;
    QRDBText5.width := 110;
    //post code
    QRLabel4.Left := 680;
    QRDBText6.Left := 680;
    //phone
    QRLabel5.Left := 762;
    QRDBText7.left := 762;
  end;
end;

procedure TPBRPCustContDetFrm.GetDetsQryPhoneGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if GetDetsQryContact_Phone.asstring = '' then
    text := GetDetsQryCustomer_Phone.asstring
  else
    text := GetDetsQryContact_Phone.asstring;
end;

procedure TPBRPCustContDetFrm.ChildBand1BeforePrint(Sender: TQRCustomBand;
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
