unit STPartSuppRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls;

type
  TSTPartSuppRepFrm = class(TForm)
    clReport: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    Description: TQRLabel;
    QRLabel3: TQRLabel;
    SupplierLbl: TQRLabel;
    qrlblTitle: TQRLabel;
    SelectionLbl: TQRLabel;
    PartLbl: TQRLabel;
    PartDescLbl: TQRLabel;
    PackSizeLbl: TQRLabel;
    PartRangeLbl: TQRLabel;
    SuppNameQRLabel: TQRLabel;
    QRSysData1: TQRSysData;
    procedure clReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FSelectionType: string;
    FPartRange, sPrevPart: string;
    procedure SetSelectionType(const Value: string);
    procedure SetPartRange(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property SelectionType: string read FSelectionType write SetSelectionType;
    property PartRange: string read FPartRange write SetPartRange;
  end;

var
  STPartSuppRepFrm: TSTPartSuppRepFrm;

implementation

uses STPartSuppDM;

{$R *.DFM}

procedure TSTPartSuppRepFrm.SetSelectionType(const Value: string);
begin
  FSelectionType := Value;
  SelectionLbl.caption := 'Selection type: '+SelectionType;
  SupplierLbl.caption := SelectionType;
end;

procedure TSTPartSuppRepFrm.clReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  sPrevPart := '' ;
end;

procedure TSTPartSuppRepFrm.SetPartRange(const Value: string);
begin
  FPartRange := Value;
  PartRangeLbl.Caption := FPartRange;
end;

procedure TSTPartSuppRepFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
If sPrevPart = STPartSDM.PartSuppSQl.Fieldbyname('Part').asstring then
   begin
   PartLbl.Caption := '';
   PartDescLbl.Caption := '';
   PackSizeLbl.Caption := '';
   end
else
   begin
   PartLbl.Caption := STPartSDM.PartSuppSQl.Fieldbyname('Part').asstring;
   PartDescLbl.Caption := STPartSDM.PartSuppSQl.Fieldbyname('Part_Description').asstring;
   PackSizeLbl.Caption := IntToStr(STPartSDM.PartSuppSQl.Fieldbyname('Purch_Pack_Quantity').Asinteger);
   end;
sPrevPart := STPartSDM.PartSuppSQl.Fieldbyname('Part').asstring ;
SuppNameQRLabel.Caption := STPartSDM.PartSuppSQl.Fieldbyname('Supplier_Name').asstring;
end;

end.
