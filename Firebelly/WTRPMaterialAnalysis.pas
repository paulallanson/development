unit WTRPMaterialAnalysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, QrCtrls, DB, DBTables, ExtCtrls;

type
  TfrmWTRPMaterialAnalysis = class(TForm)
    qrpDetails: TQuickRep;
    qrbPageHeader: TQRBand;
    qrsbDetails: TQRSubDetail;
    qryReport: TQuery;
    qrbGroupHeader1: TQRGroup;
    gtQRDBText1: TQRDBText;
    gtQRDBText3: TQRDBText;
    qrlblCaption: TQRLabel;
    qrlblDateRange: TQRLabel;
    QRSysData2: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    gtQRLabel1: TQRLabel;
    gtQRLabel2: TQRLabel;
    gtQRLabel3: TQRLabel;
    gtQRDBText4: TQRDBText;
    qrlblSalesTotal: TQRLabel;
    qrbGroupHeader2: TQRGroup;
    qrlblSortBy1: TQRLabel;
    qrGroupbyText1: TQRDBText;
    qrlblSortBy2: TQRLabel;
    qrGroupbyText2: TQRDBText;
    qrbSummary: TQRBand;
    QRLabel10: TQRLabel;
    qrlblReportTotal: TQRLabel;
    QRShape2: TQRShape;
    qrbGroupFooter1: TQRBand;
    qrlblSort1Total: TQRLabel;
    qrbGroupFooter2: TQRBand;
    qrlblSort2Total: TQRLabel;
    qrshpSubTotal: TQRShape;
    gtQRShape2: TQRShape;
    qrSubTotalbyText2: TQRDBText;
    qrTotalbyText1: TQRDBText;
    qrSubTotalbyText1: TQRDBText;
    qrlblSelection: TQRLabel;
    gtQRLabel4: TQRLabel;
    qrlblSalesCount: TQRLabel;
    qrlblSort2Count: TQRLabel;
    qrlblSort1Count: TQRLabel;
    qrlblReportCount: TQRLabel;
    gtQRLabel5: TQRLabel;
    qrlblArea: TQRLabel;
    qrlblSort2Area: TQRLabel;
    qrlblSort1Area: TQRLabel;
    qrlblReportArea: TQRLabel;
    procedure qrsbDetailsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpDetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrbSummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooter2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupFooter1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupHeader1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbGroupHeader2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrsbDetailsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrbGroupFooter2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    FDetailed: boolean;
    procedure SetDetailed(const Value: boolean);
    { Private declarations }
  public
    exporting: boolean;
    exportFile: textFile;
    SortBy1, SortBy2: integer;
    rSortBy1Area, rSortBy2Area, rReportArea: real;
    rSortBy1Total, rSortBy2Total, rReportTotal: real;
    iSortBy1Count, iSortBy2Count, iReportCount: integer;
    property Detailed: boolean read FDetailed write SetDetailed;
    function GetDetails: integer;
    procedure ExporttoFile(filename: string);
  end;

var
  frmWTRPMaterialAnalysis: TfrmWTRPMaterialAnalysis;

implementation

uses wtRSMaterialAnalysis;

{$R *.dfm}                          

function TfrmWTRPMaterialAnalysis.GetDetails: integer;
begin
  qryReport.close;
  qryReport.Open;
  result := qryReport.recordcount;
end;

procedure TfrmWTRPMaterialAnalysis.qrsbDetailsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblArea.Caption := formatfloat('#,##0.00',qryReport.fieldbyname('Total_Area').asfloat);
  qrlblSalesTotal.Caption := formatfloat('£#,###,##0.00',qryReport.fieldbyname('Total_Value').asfloat);
  qrlblSalesCount.Caption := formatfloat('#,##0',qryReport.fieldbyname('Total_Count').asfloat);

  rSortBy1Area := rSortby1Area + qryReport.fieldbyname('Total_Area').asfloat;
  rSortBy2Area := rSortby2Area + qryReport.fieldbyname('Total_Area').asfloat;
  rReportArea := rReportArea + qryReport.fieldbyname('Total_Area').asfloat;

  rSortBy1Total := rSortby1Total + qryReport.fieldbyname('Total_Value').asfloat;
  rSortBy2Total := rSortby2Total + qryReport.fieldbyname('Total_Value').asfloat;
  rReportTotal := rReportTotal + qryReport.fieldbyname('Total_Value').asfloat;

  iSortBy1Count := iSortby1Count + qryReport.fieldbyname('Total_Count').asinteger;
  iSortBy2Count := iSortby2Count + qryReport.fieldbyname('Total_Count').asinteger;
  iReportCount := iReportCount + qryReport.fieldbyname('Total_Count').asinteger;
  PrintBand := Detailed;
end;

procedure TfrmWTRPMaterialAnalysis.qrpDetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  case SortBy1 of
    0:begin
        qrbGroupHeader1.enabled := true;
        qrbGroupHeader1.Expression := 'qryReport.Office_Contact_Name';
        qrGroupByText1.DataField := 'Office_Contact_Name';
        qrTotalByText1.DataField := 'Office_Contact_Name';
        qrlblSortBy1.Caption := 'Office Contact: ';
        qrbGroupFooter1.enabled := true;
      end;
    1:begin
        qrbGroupHeader1.enabled := true;
        qrbGroupHeader1.Expression := 'qryReport.Rep_Name';
        qrGroupByText1.DataField := 'Rep_Name';
        qrTotalByText1.DataField := 'Rep_Name';
        qrlblSortBy1.Caption := 'Rep:';
        qrbGroupFooter1.enabled := true;
      end;
    2:begin
        qrbGroupHeader1.enabled := true;
        qrbGroupHeader1.Expression := 'qryReport.Customer_Name';
        qrGroupByText1.DataField := 'Customer_Name';
        qrTotalByText1.DataField := 'Customer_Name';
        qrlblSortBy1.Caption := 'Customer:';
        qrbGroupFooter1.enabled := true;
      end;
    else
      begin
        qrbGroupHeader1.enabled := false;
        qrbGroupHeader1.Expression := '';
        qrGroupByText1.DataField := '';
        qrTotalByText1.DataField := '';
        qrlblSortBy1.Caption := '';
        qrbGroupFooter1.enabled := false;
      end;
    end;

  case SortBy2 of
    0:begin
        qrbGroupHeader2.enabled := true;
        qrbGroupHeader2.Expression := 'qryReport.Type_Description';
        qrGroupByText2.DataField := 'Type_Description';
        qrSubTotalByText1.DataField := 'Material_Description';
        qrSubTotalByText2.DataField := 'Type_Description';
        qrlblSortBy2.Caption := 'Composition: ';
        qrSubTotalByText1.enabled := Detailed;
        qrbGroupFooter2.enabled := true;
      end;
    1:begin
        qrbGroupHeader2.enabled := true;
        qrbGroupHeader2.Expression := 'qryReport.Material_Description';
        qrGroupByText2.DataField := 'Material_Description';
        qrSubTotalByText1.DataField := 'Material_Description';
        qrSubTotalByText2.DataField := 'Type_Description';
        qrlblSortBy2.Caption := 'Material/Brand:';
        qrSubTotalByText1.enabled := true;
        qrbGroupFooter2.enabled := true;
      end;
    else
      begin
        qrbGroupHeader2.enabled := false;
        qrbGroupHeader2.Expression := '';
        qrGroupByText2.DataField := '';
        qrSubTotalByText1.DataField := '';
        qrSubTotalByText2.DataField := '';
        qrlblSortBy2.Caption := '';
        qrSubTotalByText1.enabled := true;
        qrbGroupFooter2.enabled := false;
      end;
    end;
  rReportTotal := 0;
  rSortby1Total := 0;
  rSortby2Total := 0;

  iReportCount := 0;
  iSortby1Count := 0;
  iSortby2Count := 0;

  rReportArea := 0;
  rSortby1Area := 0;
  rSortby2Area := 0;
end;

procedure TfrmWTRPMaterialAnalysis.qrbSummaryBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblReportTotal.Caption := formatfloat('£#,###,##0.00',rReportTotal);
  qrlblReportCount.Caption := formatfloat('#,##0',iReportCount);
  qrlblReportArea.Caption := formatfloat('#,##0.00',rReportArea);
end;

procedure TfrmWTRPMaterialAnalysis.qrbGroupFooter2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblSort2Total.Caption := formatfloat('£#,###,##0.00',rSortby2Total) ;
  qrlblSort2Count.Caption := formatfloat('#,##0',iSortby2Count) ;
  qrlblSort2Area.Caption := formatfloat('#,##0.00',rSortby2Area) ;
end;

procedure TfrmWTRPMaterialAnalysis.qrbGroupFooter1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblSort1Total.Caption := formatfloat('£#,###,##0.00',rSortby1Total) ;
  qrlblSort1Count.Caption := formatfloat('#,##0',iSortby1Count) ;
  qrlblSort1Area.Caption := formatfloat('#,##0.00',rSortby1Area) ;
end;

procedure TfrmWTRPMaterialAnalysis.qrbGroupHeader1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  rSortby1Total := 0;
  iSortby1Count := 0;
  rSortby1Area := 0;
end;

procedure TfrmWTRPMaterialAnalysis.qrbGroupHeader2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  rSortby2Total := 0;
  iSortby2Count := 0;
  rSortby2Area := 0;
  PrintBand := Detailed;
end;

procedure TfrmWTRPMaterialAnalysis.ExporttoFile(filename: string);
var
  TempName: string;
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  if Detailed then
    begin
      case SortBy1 of
        0: tempStr := '"Office Contact","Worktop"';
        1: tempstr := '"Rep","Worktop"';
        2: tempstr := '"Customer","Worktop"';
      else
        tempstr := '"Worktop"';
      end;

      tempstr := tempstr
        + ',"Material/Brand"'
        + ',"Composition"'
        + ',"Area (sq m)"'
        + ',"Total Sales"'
        + ',"Order Count"';
    end
  else
    begin
      case SortBy1 of
        0: tempStr := '"Office Contact"';
        1: tempstr := '"Rep","Material/Brand","Composition","Area (sq m)","Total Sales","Order Count"';
        2: tempstr := '"Customer","Material/Brand","Composition","Area (sq m)","Total Sales","Order Count"';
      else
        tempstr := '""';
      end;

      case SortBy2 of
        0: tempStr := tempstr + ',"Composition","Total Sales","Order Count"';
        1: tempStr := tempstr + ',"Material/Brand","Composition","Area (sq m)","Total Sales","Order Count"';
      end;
    end;

  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPMaterialAnalysis.qrsbDetailsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if Detailed and self.exporting then
  begin
    case SortBy1 of
      0: tempStr := '"' + qryReport.fieldbyname('Office_Contact_Name').asstring + '"' + ',"' + qryReport.fieldbyname('Worktop_Description').asstring + '"';
      1: tempstr := '"' + qryReport.fieldbyname('Rep_Name').asstring + '"' + ',"' + qryReport.fieldbyname('Worktop_Description').asstring + '"';
      2: tempstr := '"' + qryReport.fieldbyname('Customer_Name').asstring + '"'+ ',"' + qryReport.fieldbyname('Worktop_Description').asstring + '"';
    else
      tempstr := '"' + qryReport.fieldbyname('Worktop_Description').asstring + '"';
    end;

    //Material
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Material_Description').asstring + '"';

    //Composition
    tempStr := tempStr + ',"' + qryReport.fieldbyname('Type_Description').asstring + '"';

    //Area
    tempStr := tempStr + ',"' + qrlblArea.caption + '"';

    //Sales Total
    tempStr := tempStr + ',"' + qrlblSalesTotal.caption + '"';

    //Order Count
    tempStr := tempStr + ',"' + qrlblSalesCount.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSMaterialAnalysis.prgbrExport.StepIt;
  end;

end;

procedure TfrmWTRPMaterialAnalysis.SetDetailed(const Value: boolean);
begin
  FDetailed := Value;
  qrshpSubTotal.enabled := FDetailed;
end;

procedure TfrmWTRPMaterialAnalysis.qrbGroupFooter2AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if not Detailed and self.exporting then
  begin
    case SortBy1 of
      0: tempStr := '"' + qryReport.fieldbyname('Office_Contact_Name').asstring + '"';
      1: tempstr := '"' + qryReport.fieldbyname('Rep_Name').asstring + '"' ;
      2: tempstr := '"' + qryReport.fieldbyname('Customer_Name').asstring + '"';
    else
      tempstr := '""';
    end;

    case SortBy2 of
      0:  begin
            //Composition
            tempStr := tempStr + ',"' + qryReport.fieldbyname('Type_Description').asstring + '"';

            //Sales Total
            tempStr := tempStr + ',"' + qrlblSort2Total.caption + '"';

            //Order Count
            tempStr := tempStr + ',"' + qrlblSort2Count.caption + '"';
          end;
      1:  begin
            //Material
            tempStr := tempStr + ',"' + qryReport.fieldbyname('Material_Description').asstring + '"';

            //Composition
            tempStr := tempStr + ',"' + qryReport.fieldbyname('Type_Description').asstring + '"';

            //Sales Total
            tempStr := tempStr + ',"' + qrlblSort2Total.caption + '"';

            //Order Count
            tempStr := tempStr + ',"' + qrlblSort2Count.caption + '"';
          end;
    end;
    writeln(self.exportFile, tempStr);
    frmWTRSMaterialAnalysis.prgbrExport.StepIt;
  end;
end;

end.
