unit PBRPSupCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, DB, DBTables, CCSPrint;

type
  TPBRPSupCapFrm = class(TForm)
    SupCapQuickReport: TQuickRep;
    PageHeaderQRBand: TQRBand;
    QRLabel3: TQRLabel;
    RunDateQRLabel: TQRLabel;
    RepSelectQRLabel: TQRLabel;
    FooterQRBand: TQRBand;
    PageNoQRLabel: TQRLabel;
    RepTotsQRGroup: TQRGroup;
    DetQRBand: TQRBand;
    GetDetsSQL: TQuery;
    GetSuppPTSQL: TQuery;
    SubGrpQRGroup: TQRGroup;
    DetailQRLabel: TQRLabel;
    SubGrpQRLabel: TQRLabel;
    CapsMemo: TMemo;
    CapsQRMemo: TQRMemo;
    GetCapsSQL: TQuery;
    DetHeadQRLabel: TQRLabel;
    QRLabel2: TQRLabel;
    procedure SupCapQuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    function GetDetails(Sender: TObject): Integer;
    procedure FooterQRBandBeforePrint(Sender: TQRCustomBand; var PrintBand:
      Boolean);
    procedure DetQRBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SubGrpQRGroupBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);


  private
  
  public
    SupplierNo, BranchNo, SeqNo, PrdTyp: Integer;
    Preview: ByteBool;
    SupplierName, SeqName, PrdTypName: string;
    PrinterSettings : TPrinterSettings;
  end;

var
  PBRPSupCapFrm: TPBRPSupCapFrm;

implementation

uses PBRDPORep, PBImages, CCSCommon, PBRSSupCap;

{$R *.DFM}

procedure TPBRPSupCapFrm.SupCapQuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  TempPos: Integer;
begin
  with SupCapQuickReport.PrinterSettings do
  begin
    PrinterIndex := PrinterSettings.PrinterIndex;
    Copies := PrinterSettings.Copies;
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;

  RunDateQRLabel.Caption := '- Run Date: ' + DateToStr(Now);

  if SupplierNo = 0 then
    RepSelectQRLabel.Caption := 'All Suppliers'
  else
    RepSelectQRLabel.Caption := 'For Supplier/Branch: ' + SupplierName;
  if PrdTyp = 0 then
    RepSelectQRLabel.Caption := RepSelectQRLabel.Caption + ',  All Product Types'
  else
    RepSelectQRLabel.Caption := RepSelectQRLabel.Caption + ',  For Product Type: ' + PrdTypName;
  RepSelectQRLabel.Caption := RepSelectQRLabel.Caption + ',  Sequenced By: ' + SeqName;
end;

function TPBRPSupCapFrm.GetDetails(Sender: TObject): Integer;
var
  TempName: string;
begin
  With GetDetsSQL do
        begin
        SQL := GetSuppPTSQL.SQL;
        If SupplierNo <> 0 then
                begin
                SQL.Add('  and (Splr_BrnchPrdct_TypCpblty.Supplier = ' + IntToStr(SupplierNo) + ')') ;
                SQL.Add('  and (Splr_BrnchPrdct_TypCpblty.Branch_No = ' + IntToStr(BranchNo) + ')') ;
                end;
        If PrdTyp <> 0 then
                SQL.Add('  and (Splr_BrnchPrdct_TypCpblty.Product_Type = ' + IntToStr(PrdTyp) + ')') ;
        Case SeqNo of
                0:  begin
                    {By product type} ;
                    SQL.Add('Order By Product_Type.Description, Supplier.Name, Supplier_Branch.Name') ;
                    SubGrpQRGroup.Expression := 'PT_Name' ;
                    DetHeadQRLabel.Caption := 'Supplier/Branch' ;
                    end;
                1:  begin
                    {By supplier} ;
                    SQL.Add('Order By Supplier.Name, Supplier_Branch.Name, Product_Type.Description') ;
                    SubGrpQRGroup.Expression := 'Sup_Name + Branch_Name' ;
                    DetHeadQRLabel.Caption := 'Product Type' ;
                    end;
                end;
        {Activate the main report query}
        Close;
        Open;
        Result := RecordCount;
        end;
end;

procedure TPBRPSupCapFrm.FooterQRBandBeforePrint(Sender: TQRCustomBand; var
  PrintBand: Boolean);
begin
  PageNoQRLabel.Caption := 'Page: ' + IntToStr(SupCapQuickReport.PageNumber);
end;



procedure TPBRPSupCapFrm.DetQRBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
Var
CapAdded: ByteBool ;
begin
{Detail setup} ;
Case SeqNo of
        0 : DetailQRLabel.Caption  := GetDetsSQL.FieldByName('Sup_Name').AsString  + ' ' +
                                      GetDetsSQL.FieldByName('Branch_Name').AsString  ;
        1 : DetailQRLabel.Caption  := GetDetsSQL.FieldByName('PT_Name').AsString ;
        end;
CapsMemo.Text := '' ;
CapsMemo.Width := CapsQRMemo.Width ;
CapsMemo.Font := CapsQRMemo.Font ;
Sender.Height := 26 ;
CapsMemo.Height := 17 ;
CapAdded := False ;
{Put summary switch here} ;
With GetCapsSQL do
        begin
        Close ;
        ParamByName('Supplier').AsInteger := GetDetsSQL.FieldByName('Supplier').AsInteger ;
        ParamByName('Branch_No').AsInteger := GetDetsSQL.FieldByName('Branch_No').AsInteger ;
        ParamByName('Product_Type').AsInteger := GetDetsSQL.FieldByName('Product_Type').AsInteger ;
        Open ;
        First ;
        While not EOF do
                begin
                If CapAdded then
                        CapsMemo.Text := CapsMemo.Text + ', ' ;
                CapAdded := True;
                If FieldByName('Default_For_All').AsString <> 'Y' then
                        CapsMemo.Text := CapsMemo.Text +
                                FieldByName('Description').AsString
                else
                        CapsMemo.Text := CapsMemo.Text +
                                'ALL' ;
                Next;
                end;
        end;
CapsQRMemo.Height := (CapsMemo.Lines.Count*16) + 1;
CapsQRMemo.Lines := CapsMemo.Lines ;
Sender.Height := (CapsQRMemo.Lines.Count*16)+2;
end;

procedure TPBRPSupCapFrm.SubGrpQRGroupBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
Case SeqNo of
        0 : SubGrpQRLabel.Caption  := 'Product Type: ' + GetDetsSQL.FieldByName('PT_Name').AsString ;
        1 : SubGrpQRLabel.Caption  := 'Supplier: ' + GetDetsSQL.FieldByName('Sup_Name').AsString  + ' ' +
                                      GetDetsSQL.FieldByName('Branch_Name').AsString  ;
        end;
end;

end.













