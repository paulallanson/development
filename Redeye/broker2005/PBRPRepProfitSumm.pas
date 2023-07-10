unit PBRPRepProfitSumm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, CCSPrint, ExtCtrls, Db, DBTables;

type
  TPBRPRepProfitSummFrm = class(TForm)
    QckRpRpsPrft: TQuickRep;
    PageHeader: TQRBand;
    QRSysData1: TQRSysData;
    PageNumQrl: TQRLabel;
    WhichSideQRL: TQRLabel;
    PageHeaderLeft: TQRChildBand;
    QRLabel1: TQRLabel;
    PageHeaderRight: TQRChildBand;
    QRLabel11: TQRLabel;
    QRSubDetailpg1: TQRSubDetail;
    QRFootPg1: TQRBand;
    QRGrpHeadPg2: TQRBand;
    QRSubDetailpg2: TQRSubDetail;
    DataSRCRepPrft: TDataSource;
    SQLRepPrft: TQuery;
    SQLRep: TQuery;
    QRLabel2: TQRLabel;
    QRGrpPg1: TQRGroup;
    QRDtlpg1: TQRBand;
    QRDBText1: TQRDBText;
    QRGrpPg2: TQRGroup;
    QRDtlpg2: TQRBand;
    QRDBText4: TQRDBText;
    QRFootPg2: TQRBand;
    QRLabel3: TQRLabel;
    qrlblTitle: TQRLabel;
    qrlblDateRange: TQRLabel;
    PageHeaderMiddle: TQRChildBand;
    QRLabel4: TQRLabel;
    QRGrpHeadPg3: TQRBand;
    QRGrpPg3: TQRGroup;
    QRSubDetailpg3: TQRSubDetail;
    QRDtlPg3: TQRBand;
    QRDBText2: TQRDBText;
    QRFootpg3: TQRBand;
    QRLabel5: TQRLabel;
    QRLblTotSell: TQRLabel;
    procedure QckRpRpsPrftBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderLeftBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFootPg1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderRightBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailpg1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpHeadPg2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailpg2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpPg1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpPg2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDtlpg1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDtlpg2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure CreateTotals(Sender: TObject);
    procedure ClearTotals(Sender: TObject);
    procedure PageHeaderMiddleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpHeadPg3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGrpPg3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetailpg3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDtlPg3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFootPg2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GetDetails(Sender: TObject);
    procedure QRFootpg3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRFootPg1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRFootPg2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
     MyPageNumber : integer;
     function getProfitPerc(sell,cost : real): string;
  public
    { Public declarations }
    PrinterSettings: TPrinterSettings;
      ChangeColor : boolean;
      SelRepCode: integer;
      selperiod: integer;
      Matrix: array [1..30,1..2] of Real;
      tot: array [1..4,1..2] of real;
      RepNo: array [0..30] of integer;
      repname: array [0..30] of TQRLabel;
      Heading: array [0..30] of TQRLabel;
      underline: array [0..30] of TQRLabel;
      Detail: array [0..30,1..4] of TQRLabel;
      Noofrecs: integer;
  end;

const
Reptitle = 'Sell         Cost         Profit    % ';
Repline =  '---------------------------------------------------------------------';

var
  PBRPRepProfitSummFrm: TPBRPRepProfitSummFrm;    

implementation

{$R *.DFM}

procedure TPBRPRepProfitSummFrm.QckRpRpsPrftBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
icount: integer;
begin
 // First, size the detail band out of the way
//  DetailBand1.height := 0;

  // Then reset the page headers by using the tag property.
  PageHeaderLeft.Tag := 0;
  // The reset the new page number
  MyPageNumber := 0;
  cleartotals(self);
  with qckrpRpsPrft.PrinterSettings do
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

  for icount := 1 to 4 do
  begin
    tot[icount,1] := 0;
    tot[icount,2] := 0;
  end;
end;

procedure TPBRPRepProfitSummFrm.PageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if PageHeaderLeft.Tag = 0 then
    WhichSideQRL.Caption := 'Sheet 1'
  else
    if PageHeaderleft.Tag = 1 then
    WhichSideQRL.Caption := 'Sheet 2'
    else
        WhichSideQRL.Caption := 'Sheet 3';

  if (PageHeaderleft.tag = 1) and (noofrecs < 4) then
  printBand := false;

 if (PageHeaderleft.tag = 2) and (noofrecs < 8) then
  PrintBand := false;

   inc(MyPageNumber);
  PageNumQrl.Caption := format('Page %d', [MyPageNumber]);
end;

procedure TPBRPRepProfitSummFrm.PageHeaderLeftBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := PageHeaderLeft.Tag = 0;
end;

procedure TPBRPRepProfitSummFrm.QRFootPg1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
idx: integer;
begin
 // we use this band to change the page headers, but we don't need to print
  // it.  We also use it to reset the page number
//  PrintBand := false;
  PageHeaderLeft.Tag := 1;
  MyPageNumber := 0;
  for idx := 1 to SQLRep.Recordcount+1 do
  begin
  If idx > 4 then
    begin
//      QRLblTotPrft.Parent := QRFootpg2;
     QRLblTotSell.Parent := QRFootpg2;
//      QRLblTotCst.Parent := QRFootpg2;
      exit;
    end;
    with tQRLabel(Findcomponent('Prof'+IntToStr(idx))) do
      begin
        Parent := QRFootpg1;
        Top := 13;
        Caption := formatfloat(' ##,##0.00;( ##,##0.00)',Tot[idx,1] - Tot[idx,2]);
{        QRLblTotPrft.Left := left;
        QRLblTotPrft.width := width;
        QRLblTotPrft.Top := 3;
        QRLblTotPrft.Parent := QRFootpg1;  }
      end;
    with tQRLabel(Findcomponent('Perc'+IntToStr(idx))) do
      begin
        Parent := QRFootpg1;
        Top := 13;
        Caption := GetProfitPerc(tot[idx,1],tot[idx,2]);
  {      QRLblTotPrft.Left := left;
        QRLblTotPrft.width := width;
        QRLblTotPrft.Top := 3;
        QRLblTotPrft.Parent := QRFootpg1;   }
      end;
    with tQRLabel(Findcomponent('Sell'+IntToStr(idx))) do
      begin
        parent := QRFootpg1;
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',Tot[idx,1]);
        Top := 13;
        Tot[idx,1] := 0.;
        QRLblTotSell.Left := left - 24;
        QRLblTotSell.caption := Repline;
        QRLblTotSell.Top := 3;
        QRLblTotSell.Parent := QRFootpg1;
      end;
   with tQRLabel(Findcomponent('Cost'+IntToStr(idx))) do
      begin
        parent := QRFootpg1;
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',tot[idx,2]);
        Top := 13;
        tot[idx,2] := 0.;
 {       QRLblTotCst.Left := left;
        QRLblTotCst.width := width;
        QRLblTotCst.Top := 3;
        QRLblTotCst.Parent := QRFootpg1; }
      end;
end;
end;

procedure TPBRPRepProfitSummFrm.PageHeaderRightBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := PageHeaderLeft.Tag = 2;
end;

procedure TPBRPRepProfitSummFrm.QRSubDetailpg1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
count: integer;
noofcols: integer;
begin
if noofRecs > 3 then
  noofCols := 4
else
  noofCols := noofrecs ;
  for count := 1 to noofcols do
  begin
  if RepNo[count] = SQLRepPrft.fieldByName('Rep').AsInteger then
    begin
      matrix[count, 1] := matrix[count,1] + SQLRepPrft.FieldByName('Total_Sales').AsFloat;
      Matrix[count, 2] := matrix[count,2] + SQLRepPrft.FieldByName('Total_Cost').AsFloat;
      matrix[Noofcols + 1, 1] := matrix[Noofcols + 1,1] + SQLRepPrft.FieldByName('Total_Sales').AsFloat;
      Matrix[Noofcols + 1, 2] := matrix[Noofcols+ 1,2] + SQLRepPrft.FieldByName('Total_Cost').AsFloat;
    end;
  end;
  printband := false;

end;

procedure TPBRPRepProfitSummFrm.QRGrpHeadPg2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if noofrecs > 3 then
  qckrpRpsPrft.newpage;
printband := false;
end;

procedure TPBRPRepProfitSummFrm.QRSubDetailpg2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
noofcols : integer;
count: integer;
begin
  if noOfRecs > 8 then
    noofcols := 8
  else
    noofcols := noofrecs;
  for count := 1 to noofcols do
  begin
  if RepNo[count] = SQLRepPrft.fieldByName('Rep').AsInteger then
    begin
      matrix[count, 1] := matrix[count,1] + SQLRepPrft.FieldByName('Total_Sales').AsFloat;
      Matrix[count, 2] := matrix[count,2] + SQLRepPrft.FieldByName('Total_Cost').AsFloat;
      matrix[Noofcols + 1, 1] := matrix[Noofcols + 1,1] + SQLRepPrft.FieldByName('Total_Sales').AsFloat;
      Matrix[Noofcols + 1, 2] := matrix[Noofcols + 1,2] + SQLRepPrft.FieldByName('Total_Cost').AsFloat;
    end;
  end;
  printband := false;
end;

procedure TPBRPRepProfitSummFrm.QRGrpPg1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
printband := false;
end;

procedure TPBRPRepProfitSummFrm.QRGrpPg2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
printband := false;
end;

procedure TPBRPRepProfitSummFrm.QRDtlpg1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
idx : integer;
begin
for idx := 1 to SQLRep.Recordcount+1 do
begin
  If idx > 4 then
   exit;
    with tQRLabel(Findcomponent('Prof'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ##,##0.00;( ##,##0.00)',matrix[idx,1] - matrix[idx,2]);
        Parent := QRDtlpg1;
        Top := 0;
      end;
    with tQRLabel(Findcomponent('Perc'+IntToStr(idx))) do
      begin
        Caption :=GetProfitPerc(matrix[idx,1],matrix[idx,2]);
        Parent := QRDtlpg1;
        Top := 0;
      end;
    with tQRLabel(Findcomponent('Sell'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',matrix[idx,1]);
        tot[idx,1] := tot[idx,1] + matrix[idx,1];
        matrix[idx,1] := 0.;
        Parent := QRDtlpg1;
        Top := 0;
      end;
   with tQRLabel(Findcomponent('Cost'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',matrix[idx,2]);
        tot[idx,2] := tot[idx,2] + matrix[idx,2];
        matrix[idx,2] := 0.;
        Parent := QRDtlpg1;
        Top := 0;
      end;
end;
end;

procedure TPBRPRepProfitSummFrm.QRDtlpg2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
idx : integer;
toloop : integer;
begin
If sqlRep.recordcount < 4 then
exit;
if sqlRep.recordcount > 7 then
  toloop := 8
else
  toloop := sqlrep.recordcount+1 ;
for idx := 5 to toloop do
begin
      with tQRLabel(Findcomponent('Prof'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ##,##0.00;( ##,##0.00)',matrix[idx,1] - matrix[idx,2]);
        Parent := QRDtlpg2;
        Top := 0;
      end;
      with tQRLabel(Findcomponent('Perc'+IntToStr(idx))) do
      begin
      Caption := GetProfitPerc(matrix[idx,1],matrix[idx,2]);
        Parent := QRDtlpg2;
        Top := 0;
      end;

      with tQRLabel(Findcomponent('Sell'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',matrix[idx,1]);
        tot[idx-4,1] := tot[idx - 4,1]+ matrix[idx,1];
        matrix[idx,1] := 0.;
        Parent := QRDtlpg2;
        Top := 0;
      end;
   with tQRLabel(Findcomponent('Cost'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',matrix[idx,2]);
        tot[idx-4, 2] := tot[idx-4, 2]+matrix[idx,2];
        matrix[idx,2] := 0.;
        Parent := QRDtlpg2;
        Top := 0;
      end;
end;
end;

procedure TPBRPRepProfitSummFrm.CreateTotals(Sender: TObject);
var
idx : integer;
begin
  idx := SQLRep.recordcount + 1;
  underline[idx] := TQRLabel.Create(Self);
  RepNo[idx] := 99;
  RepName[idx] := TQRLabel.Create(Self);
  with RepName[idx] do
  begin
    AlignToBand := False;
    alignment := taleftJustify;
    AutoStretch := False;
    AutoSize := False;
    Top := 0;
    height := 17;
    Width := 160;
    if idx < 5 then
    begin
      Left := ((idx * (width+90))-120);
      Parent := PageHeaderLeft;
    end
    else
    if idx < 9 then
    begin
      left := RepName[idx - 4].left;
      Parent := PageHeaderMiddle;
    end
    else
      begin
        Parent := PageHeaderRight;
        Left := RepName[idx - 8].left;
      end;
    if (idx = 5) or (idx = 9) then
      left := Repname[1].left;
    Caption := 'Total ';
  end;

  Detail[idx,1] := TQRLabel.Create(Self);
  with Detail[idx,1] do
  begin
    AlignToBand := False;
    AutoStretch := False;
    AutoSize := False;
    Alignment := taRightJustify;
    Top := 0;
    height := 13;
    Width := 65;
    name := 'Sell'+intToStr(idx);
    left := repname[idx].left - 60;
    if idx < 5 then
    begin
 //     left := Detail[idx,3].left + 85;
      Parent := QRDtlPg1;
    end
    else
    if idx < 9 then
    begin
//      left := Detail[idx - 4,3].left + 85;
      Parent := QRDtlPg2;
    end
    else
    begin
//      left := Detail[idx - 9,3].left + 85;
      Parent := QRDtlPg3;
    end;
 //   if (idx = 5) or (idx = 10) then
 //     left := detail[1, 1].left+20;
  end;

  Detail[idx,2] := TQRLabel.Create(Self);
  with Detail[idx,2] do
  begin
    AlignToBand := False;
    AutoStretch := False;
    AutoSize := False;
    Alignment := taRightJustify;
    Top := 0;
    height := 17;
    Width := 65;
    name := 'Cost'+intToStr(idx);
    if idx < 5 then
    begin
      left := Detail[idx,1].left + 65 ;
      Parent := QRDtlPg1;
    end
    else
    if idx < 9 then
    begin
      Left := Detail[idx - 4, 1].left + 65;
      Parent := QRDtlPg2;
    end
    else
    begin
      left := Detail[idx - 8, 1].left +65;
      Parent := QRDtlpg3;
    end;
  Detail[idx,3] := TQRLabel.Create(Self);
  with Detail[idx,3] do
  begin
    AlignToBand := False;
    AutoStretch := False;
    AutoSize := False;
    Alignment := taRightJustify;
    Top := 0;
    height := 17;
    Width := 58;
    name := 'Prof'+intToStr(idx);
    if idx < 5 then
    begin
      left := Detail[idx,2].left + 65 ;
      Parent := QRDtlPg1;
    end
    else
    if idx < 9 then
    begin
      Left := Detail[idx - 4, 2].left + 65;
      Parent := QRDtlPg2;
    end
    else
    begin
      left := Detail[idx - 8, 2].left +65;
      Parent := QRDtlPg3;
    end;
  end;

  Detail[idx,4] := TQRLabel.Create(Self);
  with Detail[idx,4] do
  begin
    AlignToBand := False;
    AutoStretch := False;
    AutoSize := False;
    Alignment := taRightJustify;
    Top := 0;
    height := 17;
    Width := 30;
    name := 'Perc'+intToStr(idx);
    if idx < 5 then
    begin
      left := Detail[idx,3].left + 65 ;
      Parent := QRDtlPg1;
    end
    else
    if idx < 9 then
    begin
      Left := Detail[idx - 4, 3].left +65;
      Parent := QRDtlPg2;
    end
    else
    begin
      left := Detail[idx - 8, 3].left +65;
      Parent := QRDtlPg3;
    end;
  end;

  Heading[idx] := TQRLabel.Create(Self);
  with Heading[idx] do
  begin
    AlignToBand := False;
    alignment := tacenter;
    AutoStretch := False;
    AutoSize := False;
    Top := 20;
    height := 17;
    Width := 230;
    Parent := RepName[idx].parent;
    Left := RepName[idx].left - 55;
    Caption :='Sell         Cost         Profit    % ';
  end;
end;
end;

procedure TPBRPRepProfitSummFrm.PageHeaderMiddleBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
 PrintBand := PageHeaderleft.Tag = 1;
end;

procedure TPBRPRepProfitSummFrm.QRGrpHeadPg3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if noofrecs > 7 then
    qckrpRpsPrft.newpage;
  printband := false;
end;

procedure TPBRPRepProfitSummFrm.QRGrpPg3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
printband := false;
end;

procedure TPBRPRepProfitSummFrm.QRSubDetailpg3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
noofcols : integer;
count: integer;
begin
  noofCols := noofrecs ;
  for count := 1 to noofcols do
  begin
  if RepNo[count] = SQLRepPrft.fieldByName('Rep').AsInteger then
    begin
      matrix[count, 1] := matrix[count,1] + SQLRepPrft.FieldByName('Total_Sales').AsFloat;
      Matrix[count, 2] := matrix[count,2] + SQLRepPrft.FieldByName('Total_Cost').AsFloat;
      matrix[NoofCols + 1, 1] := matrix[NoofCols + 1,1] + SQLRepPrft.FieldByName('Total_Sales').AsFloat;
      Matrix[NoofCols + 1, 2] := matrix[NoofCols + 1,2] + SQLRepPrft.FieldByName('Total_Cost').AsFloat;
    end;
  end;
  printband := false;
end;

procedure TPBRPRepProfitSummFrm.QRDtlPg3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
idx : integer;
begin
  if sqlRep.recordcount < 8 then
    exit;

  for idx := 9 to SQLRep.Recordcount+1 do
    begin
      with tQRLabel(Findcomponent('Prof'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ##,##0.00;( ##,##0.00)',matrix[idx,1] - matrix[idx,2]);
        Parent := QRDtlpg3;
        Top := 0;
      end;
      with tQRLabel(Findcomponent('Perc'+IntToStr(idx))) do
      begin
      Caption := GetProfitPerc(matrix[idx,1],matrix[idx,2]);
        Parent := QRDtlpg3;
        Top := 0;
      end;

      with tQRLabel(Findcomponent('Sell'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',matrix[idx,1]);
        tot[idx-8,1] := tot[idx - 8,1]+ matrix[idx,1];
        matrix[idx,1] := 0.;
        Parent := QRDtlpg3;
        Top := 0;
      end;
      with tQRLabel(Findcomponent('Cost'+IntToStr(idx))) do
      begin
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',matrix[idx,2]);
        tot[idx-8,2] := tot[idx - 8,2]+ matrix[idx,2];
        matrix[idx,2] := 0.;
        Parent := QRDtlpg3;
        Top := 0;
      end;
    end;
end;

procedure TPBRPRepProfitSummFrm.QRFootPg2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  idx : integer;
  toloop : integer;
begin
  PageHeaderLeft.Tag := 2;
  MyPageNumber := 0;
  if sqlRep.recordcount < 4 then
    exit;
  if sqlRep.recordcount > 7 then
    begin
      toloop := 8;
//      QRLblTotPrft.Parent := QRFootpg3;
//      QRLblTotSell.Parent := QRFootpg3;
//      QRLblTotCst.Parent := QRFootpg3;
    end
  else
    toloop := sqlrep.recordcount+1 ;

  for idx := 5 to toloop do
    begin
      with tQRLabel(Findcomponent('Prof'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootPg2;
        Caption := formatfloat(' ##,##0.00;( ##,##0.00)',tot[idx-4,1] - tot[idx-4,2]);
{        QRLblTotPrft.Left := left;
        QRLblTotPrft.width := width;
        QRLblTotPrft.Top := 3; }
      end;
      with tQRLabel(Findcomponent('Perc'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootPg2;
        Caption := GetProfitPerc(tot[idx-4,1],tot[idx-4,2]);
       { QRLblTotPrft.Left := left;
        QRLblTotPrft.width := width;
        QRLblTotPrft.Top := 3; }
      end;
      with tQRLabel(Findcomponent('Sell'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootpg2;
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',tot[idx-4,1]);
        tot[idx-4,1] := 0;
        QRLblTotSell.Left := left - 24;
        QRLblTotSell.caption := repline;
        QRLblTotSell.Top := 3;
        QRLblTotSell.Parent := QRFootpg2;
      end;
      with tQRLabel(Findcomponent('Cost'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootpg2;
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',tot[idx-4,2]);
        tot[idx-4,2] := 0;
{        QRLblTotCst.Left := left;
        QRLblTotCst.width := width;
        QRLblTotCst.Top := 3; }
      end;
    end;
end;

procedure TPBRPRepProfitSummFrm.GetDetails(Sender: TObject);
var
idx: integer;
begin
  with sqlRep do
  begin
    Close;
    ParambyName('Rep').asInteger := selrepcode;
    ParamByName('Period_To').AsInteger := selperiod+11;
    ParamByname('Period_From').AsInteger := selperiod;
    Open;
    noofRecs := recordcount;
    First;
    idx := 0;
    while not sqlrep.eof do
    begin
      inc(idx);
      RepNo[idx] := sqlrep.fieldbyname('Rep').AsInteger;
      RepName[idx] := TQRLabel.Create(Self);
      with RepName[idx] do
      begin
        AlignToBand := False;
        AutoStretch := False;
        AutoSize := False;
        Top := 0;
        height := 17;
        Width := 160;
        if idx < 5 then
          begin
            Left := ((idx * (width+90))-120);
            Parent := PageHeaderLeft;
            alignment := taleftJustify;
          end
        else
        If Idx < 9 then
          begin
            Parent := PageHeaderMiddle;
            Left := RepName[idx - 4].left;
            alignment := taleftJustify;
          end
        else
          begin
            Parent := PageHeaderRight;
            Left := RepName[idx - 8].left;
            alignment := taleftJustify;
          end;
        Caption := trim(sqlRep.fieldByName('Rep_Name').AsString);
      end;

    Detail[idx,1] := TQRLabel.Create(Self);
    with Detail[idx,1] do
    begin
      AlignToBand := False;
      AutoStretch := False;
      AutoSize := False;
      Alignment := taRightJustify;
      Top := 0;
      height := 17;
      Width := 65;
      name := 'Sell'+intToStr(idx);
      caption := '0.00';
      visible := true;
      if idx < 5 then
      begin
        left := Repname[idx].left - 60;
        Parent := QRDtlPg1;
      end
      else
        if idx < 9 then
        begin
          Left := RepName[idx - 4].left - 60;
          Parent := QRDtlPg2;
        end
      else
        begin
          left := RepName[idx - 8].left -60;
          Parent := QRDtlPg3;
        end;
    end;

    Detail[idx,2] := TQRLabel.Create(Self);
    with Detail[idx,2] do
    begin
      AlignToBand := False;
      AutoStretch := False;
      AutoSize := False;
      Alignment := taRightJustify;
      Top := 0;
      height := 17;
      Width := 65;
      name := 'Cost'+intToStr(idx);
      if idx < 5 then
      begin
        left := Detail[idx,1].left + 65 ;
        Parent := QRDtlPg1;
      end
      else
      if idx < 9 then
        begin
          Left := Detail[idx - 4, 1].left + 65;
          Parent := QRDtlPg2;
        end
      else
        begin
          Left := Detail[idx - 8, 1].left +65;
          Parent := QRDtlPg3;
        end;
    end;

    Detail[idx,3] := TQRLabel.Create(Self);
    with Detail[idx,3] do
    begin
      AlignToBand := False;
      AutoStretch := False;
      AutoSize := False;
      Alignment := taRightJustify;
      Top := 0;
      height := 17;
      Width := 58;
      name := 'Prof'+intToStr(idx);
      if idx < 5 then
      begin
        left := Detail[idx,2].left + 65 ;
        Parent := QRDtlPg1;
      end
      else
      if idx < 9 then
      begin
        Left := Detail[idx - 4, 2].left + 65;
        Parent := QRDtlPg2;
      end
      else
        begin
          Left := Detail[idx - 8, 2].left +65;
          Parent := QRDtlPg3;
        end;
    end;

    Detail[idx,4] := TQRLabel.Create(Self);
    with Detail[idx,4] do
    begin
      AlignToBand := False;
      AutoStretch := False;
      AutoSize := False;
      Alignment := taRightJustify;
      Top := 0;
      height := 17;
      Width := 30;
      name := 'Perc'+intToStr(idx);
      if idx < 5 then
      begin
        left := Detail[idx,3].left + 65 ;
        Parent := QRDtlPg1;
      end
      else
      if idx < 9 then
      begin
        Left := Detail[idx - 4, 3].left + 65;
        Parent := QRDtlPg2;
      end
      else
        begin
          Left := Detail[idx - 8, 3].left +65;
          Parent := QRDtlPg3;
        end;
    end;

    Heading[idx] := TQRLabel.Create(Self);
    with Heading[idx] do
      begin
        AlignToBand := False;
        AutoStretch := False;
        AutoSize := False;
        Top := 20;
        height := 17;
        Width := 190;
        Parent := RepName[idx].parent;
        Left := RepName[idx].left - 25;
        alignment := tacenter;
        Caption := RepTitle;
      end;
    Underline[idx] := TQRLabel.Create(Self);
    with Underline[idx] do
      begin
        AlignToBand := False;
        Alignment := taleftJustify;
        AutoStretch := False;
        AutoSize := False;
        Top := 3;
        height := 17;
        Width := 248;
        if idx < 5 then
          Parent := QRFootpg1
        else
        if (idx >4) and (idx < 10) then
          Parent := QRFootpg2
        else
          Parent := QRFootpg3;
        Left := Detail[idx, 1].left+20;
        Caption := repline;
        //'----------------      ---------------      --------------';
      end;

    next;
    end;
  end;
  CreateTotals(Self);
  if noofrecs > 3 then
  begin
    PageHeaderMiddle.enabled := True;
    QRDtlPg2.enabled := True;
    QRFootpg2.enabled := True;
    QRGrpPg2.enabled := True;
  end;
  if noofrecs > 7 then
  begin
    PageHeaderRight.enabled := True;
    QRDtlPg3.enabled := True;
    QRFootpg3.enabled := True;
    QRGrpPg3.enabled := True;
  end;
  sqlRepPrft.close;
  sqlRepPrft.ParambyName('Rep').asInteger := selrepcode;
  sqlRepPrft.ParamByName('Period_To').AsInteger := selperiod+11;
  sqlRepPrft.ParamByname('Period_From').AsInteger := selperiod;
  sqlRepPrft.open;

end;

procedure TPBRPRepProfitSummFrm.QRFootpg3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  idx : integer;
  toloop : integer;
  myLabel: TQRLabel;
begin
  if sqlRep.recordcount < 8 then
    exit;

  toloop := sqlrep.recordcount+1 ;
  for idx := 9 to toloop do
    begin
      with tQRLabel(Findcomponent('Prof'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootPg3;
        Caption := formatfloat(' ##,##0.00;( ##,##0.00)',tot[idx-8,1] - tot[idx-8,2]);
   {     QRLblTotPrft.Left := left;
        QRLblTotPrft.width := width;
        QRLblTotPrft.Top := 3;  }
      end;
      with tQRLabel(Findcomponent('Perc'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootPg3;
        Caption := GetProfitPerc(tot[idx-8,1],tot[idx-8,2]);
        {QRLblTotPrft.Left := left;
        QRLblTotPrft.width := width;
        QRLblTotPrft.Top := 3; }
      end;

      with tQRLabel(Findcomponent('Sell'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootpg3;
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',tot[idx-8,1]);
        tot[idx-8,1] := 0;

        QRLblTotSell.Left := left - 24;
        QRLblTotSell.caption := repline;
        QRLblTotSell.Top := 3;
        QRLblTotSell.enabled := true;
        QRLblTotSell.Parent := QRFootpg3;

      end;

      with tQRLabel(Findcomponent('Cost'+IntToStr(idx))) do
      begin
        top := 13;
        parent := QRFootpg3;
        Caption := formatfloat(' ###,##0.00;( ###,##0.00)',tot[idx-8,2]);
        tot[idx-8, 2] := 0;
 {       QRLblTotCst.Left := left;
        QRLblTotCst.width := width;
        QRLblTotCst.Top := 3; }
      end;
    end;
end;


procedure TPBRPRepProfitSummFrm.ClearTotals(Sender: TObject);
var
icount : integer;
begin
for icount := 1 to 30 do
begin
  matrix[icount,1] := 0;
  matrix[icount,2] := 0;
end;
end;

procedure TPBRPRepProfitSummFrm.QRFootPg1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
if noofRecs > 3 then
begin
    matrix[5, 1] := 0;
    matrix[5, 2] := 0;
end;
end;

procedure TPBRPRepProfitSummFrm.QRFootPg2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if noofRecs > 7 then
    begin
      matrix[9, 1] := 0;
      matrix[9, 2] := 0;
      QRLblTotSell.Parent := QRFootpg3;
    end;
end;

function TPBRPRepProfitSummFrm.getProfitPerc(sell, cost: real): string;
begin
  if (sell = 0) and (cost = 0) then
      result := '  0%'
    else
      if (sell = 0) then
        result := '-999%'
        else
         result := formatfloat('###%',((sell - cost)/sell * 100));
end;

end.
