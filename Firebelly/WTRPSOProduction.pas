unit WTRPSOProduction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, QRCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTRPSOProduction = class(TForm)
    qrpdetails: TQuickRep;
    qryWorktops: TFDQuery;
    qryCutOuts: TFDQuery;
    qryEdges: TFDQuery;
    qrSubMaterial: TQRSubDetail;
    qrlblMaterialDescription: TQRLabel;
    qrlblArea: TQRLabel;
    qrgrpHeadMaterial: TQRBand;
    qrlblMaterialTitle: TQRLabel;
    qrlblMaterialCount: TQRLabel;
    qrSubCutOuts: TQRSubDetail;
    qrlblCutOutDescription: TQRLabel;
    qrlblQuantity: TQRLabel;
    qrgrpHeadCutOuts: TQRBand;
    qrlblCutOutTitle: TQRLabel;
    qrlblCutOutCount: TQRLabel;
    qrsubEdgeProfile: TQRSubDetail;
    qrlblEdgeProfileDescription: TQRLabel;
    qrlblLength: TQRLabel;
    qrgrpEdgeProfile: TQRBand;
    qrlblEdgeTitle: TQRLabel;
    qrlblEdgeCount: TQRLabel;
    QRBand1: TQRBand;
    qrlblCaption: TQRLabel;
    qrlblDateRange: TQRLabel;
    gtQRSysData1: TQRSysData;
    gtQRSysData2: TQRSysData;
    qrlblSelection: TQRLabel;
    qrlblCategoryTitle: TQRLabel;
    qrlblCategoryCount: TQRLabel;
    qrgrpFootMaterial: TQRBand;
    gtQRLabel1: TQRLabel;
    qrlblTotalArea: TQRLabel;
    gtQRShape1: TQRShape;
    qryBaseCutOuts: TFDQuery;
    qryBaseEdges: TFDQuery;
    qrgrpFootEdgeProfile: TQRBand;
    gtQRLabel2: TQRLabel;
    qrlblTotalLength: TQRLabel;
    gtQRShape3: TQRShape;
    procedure qrSubMaterialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrSubCutOutsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrpdetailsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrsubEdgeProfileBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpEdgeProfileBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpHeadMaterialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpHeadCutOutsBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrSubMaterialAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrSubCutOutsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrsubEdgeProfileAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrgrpHeadCutOutsAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrgrpEdgeProfileAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrgrpFootMaterialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrgrpFootEdgeProfileBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FCustomer: integer;
    FSelectBy: integer;
    Fdatefrom: TDateTime;
    Fdateto: TDateTime;
    FCustomerCategory: integer;
    FSplitByMaterialType: boolean;
    procedure SetCustomer(const Value: integer);
    procedure Setdatefrom(const Value: TDateTime);
    procedure Setdateto(const Value: TDateTime);
    procedure SetSelectBy(const Value: integer);
    procedure SetCustomerCategory(const Value: integer);
    procedure SetSplitByMaterialType(const Value: boolean);
    { Private declarations }
  public
    customerList: TstringList;
    exporting: boolean;
    exportFile: textFile;
    rTotalArea, rTotalLength: real;
    property CustomerCategory: integer read FCustomerCategory write SetCustomerCategory;
    property datefrom: TDateTime read Fdatefrom write Setdatefrom;
    property dateto: TDateTime read Fdateto write Setdateto;
    property SelectBy: integer read FSelectBy write SetSelectBy;
    property SplitByMaterialType: boolean read FSplitByMaterialType write SetSplitByMaterialType;
    property Customer: integer read FCustomer write SetCustomer;
    procedure ExporttoFile(filename: string);
    function GetWorktopDetails: integer;
    function GetCutOutDetails: integer;
    function GetEdgeDetails: integer;
  end;

var
  frmWTRPSOProduction: TfrmWTRPSOProduction;

implementation

uses wtDataModule, WTRSSOProduction;

{$R *.dfm}

{ TfrmWTRPSOProduction }

procedure TfrmWTRPSOProduction.SetCustomer(const Value: integer);
begin
  FCustomer := Value;
end;

procedure TfrmWTRPSOProduction.SetCustomerCategory(const Value: integer);
begin
  FCustomerCategory := Value;
end;

procedure TfrmWTRPSOProduction.Setdatefrom(const Value: TDateTime);
begin
  Fdatefrom := Value;
end;

procedure TfrmWTRPSOProduction.Setdateto(const Value: TDateTime);
begin
  Fdateto := Value;
end;

procedure TfrmWTRPSOProduction.SetSelectBy(const Value: integer);
begin
  FSelectBy := Value;
end;

function TfrmWTRPSOProduction.GetWorktopDetails: integer;
var
  iCount: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  case SelectBy of
    1: begin
        qryWorktops.SQL.Add(' AND ((Sales_Order.Date_Type = ''C'')) ');
       end;
    2: begin
        qryWorktops.SQL.Add(' AND ((Sales_Order.Date_Type = ''P'')) ');
       end;
  end;

  if customerList.Count > 0 then
    begin
      qryWorktops.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qryWorktops.SQL.Add('(Sales_Order.Customer = ' + customerList[iCount] + ')')
          else
            qryWorktops.SQL.Add(' OR (Sales_Order.Customer = ' + customerList[iCount] + ')')
        end;
      qryWorktops.SQL.Add(')');
    end;

  qryWorktops.SQL.Add(' GROUP BY Material_Type.Description ');

  qryWorktops.Close;

  case CustomerCategory of
        0:  begin
              qryWorktops.Parambyname('Is_Retail_Customer').asstring := 'A';
              qryWorktops.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qryWorktops.ParambyName('Is_Retail_Customer').asstring := 'N';
              qryWorktops.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qryWorktops.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qryWorktops.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qryWorktops.Parambyname('Is_Retail_Customer').asstring := 'N';
              qryWorktops.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;

  qryWorktops.parambyname('Date_From').Asdatetime := Datefrom;
  qryWorktops.parambyname('Date_To').Asdatetime := DateTo;
  qryWorktops.Open;
  result := qryWorktops.recordcount;
end;

function TfrmWTRPSOProduction.GetCutOutDetails: integer;
var
  iCount: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  qryCutOuts.sql.Clear;

  if SplitByMaterialType then
    qryCutOuts.SQL.Add('SELECT Material_Type.Description AS Material_Description, Edge_Type.Edge_Type_Description, CutOut.Description AS CutOut_Description, Sum(Quote_Cutout.Quantity) AS Total_Quantity')
  else
    qryCutOuts.SQL.Add('SELECT Edge_Type.Edge_Type_Description, CutOut.Description AS CutOut_Description, Sum(Quote_Cutout.Quantity) AS Total_Quantity') ;

  qryCutOuts.SQL.Add(qryBaseCutOuts.SQL.Text);

  case SelectBy of
    1: begin
        qryCutOuts.SQL.Add(' AND ((Sales_Order.Date_Type = ''C'')) ');
       end;
    2: begin
        qryCutOuts.SQL.Add(' AND ((Sales_Order.Date_Type = ''P'')) ');
       end;
  end;

  if customerList.Count > 0 then
    begin
      qryCutOuts.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qryCutOuts.SQL.Add('(Sales_Order.Customer = ' + customerList[iCount] + ')')
          else
            qryCutOuts.SQL.Add(' OR (Sales_Order.Customer = ' + customerList[iCount] + ')')
        end;
      qryCutOuts.SQL.Add(')');
    end;

  if SplitByMaterialType then
    qryCutOuts.SQL.Add(' GROUP BY Material_Type.Description, Edge_Type.Edge_Type_Description, CutOut.Description')
  else
    qryCutOuts.SQL.Add(' GROUP BY Edge_Type.Edge_Type_Description, CutOut.Description') ;

  qryCutOuts.Close;

  case CustomerCategory of
        0:  begin
              qryCutOuts.Parambyname('Is_Retail_Customer').asstring := 'A';
              qryCutOuts.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qryCutOuts.ParambyName('Is_Retail_Customer').asstring := 'N';
              qryCutOuts.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qryCutOuts.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qryCutOuts.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qryCutOuts.Parambyname('Is_Retail_Customer').asstring := 'N';
              qryCutOuts.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;

  qryCutOuts.parambyname('Date_From').Asdatetime := Datefrom;
  qryCutOuts.parambyname('Date_To').Asdatetime := DateTo;
  qryCutOuts.Open;
  result := qryCutOuts.recordcount;
end;

function TfrmWTRPSOProduction.GetEdgeDetails: integer;
var
  iCount: integer;
  { Local function }
  { Remember, SQL likes American date formats with hyphens in quotes }
  { But Access doesn't so we have to know what we're connected to }
function qDate(const aDate : TDateTime) : string;
  begin
    if dtmdlWorktops.IsSQL then
      Result := '''' + FormatDateTime('mm-dd-yyyy', aDate) + ''''
    else
      Result := '#' + FormatDateTime('mm/dd/yyyy', aDate) + '#';
  end;
begin
  qryEdges.sql.Clear;

  if SplitByMaterialType then
    qryEdges.SQL.Add('SELECT Edge_profile.Description AS Edge_Profile_Description,'
                    + ' Material_Type.Description as Material_Description,'
                    + ' Edge_Type.Edge_Type_Description,'
                    + ' Sum(Quote_Edge.Length/1000) AS Total_Length')
  else
    qryEdges.SQL.Add('SELECT Edge_profile.Description AS Edge_Profile_Description,'
                    + ' Edge_Type.Edge_Type_Description,'
                    + ' Sum(Quote_Edge.Length/1000) AS Total_Length') ;

  qryEdges.SQL.Add(qryBaseEdges.SQL.Text);

  case SelectBy of
    1: begin
        qryEdges.SQL.Add(' AND ((Sales_Order.Date_Type = ''C'')) ');
       end;
    2: begin
        qryEdges.SQL.Add(' AND ((Sales_Order.Date_Type = ''P'')) ');
       end;
  end;

  if customerList.Count > 0 then
    begin
      qryEdges.SQL.Add(' AND (');
      for icount := 0 to pred(customerList.Count) do
        begin
          if iCount = 0 then
            qryEdges.SQL.Add('(Sales_Order.Customer = ' + customerList[iCount] + ')')
          else
            qryEdges.SQL.Add(' OR (Sales_Order.Customer = ' + customerList[iCount] + ')')
        end;
      qryEdges.SQL.Add(')');
    end;

  if SplitByMaterialType then
    qryEdges.SQL.Add(' GROUP BY  Material_Type.Description, Edge_Type.Edge_Type_Description, Edge_profile.Description')
  else
    qryEdges.SQL.Add(' GROUP BY  Edge_Type.Edge_Type_Description, Edge_profile.Description');

  qryEdges.Close;

  case CustomerCategory of
        0:  begin
              qryEdges.Parambyname('Is_Retail_Customer').asstring := 'A';
              qryEdges.Parambyname('Is_Commercial_Customer').asstring := 'A';
            end;
        1:  begin
              qryEdges.ParambyName('Is_Retail_Customer').asstring := 'N';
              qryEdges.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        2:  begin
              qryEdges.Parambyname('Is_Retail_Customer').asstring := 'Y';
              qryEdges.Parambyname('Is_Commercial_Customer').asstring := 'N';
            end;
        3:  begin
              qryEdges.Parambyname('Is_Retail_Customer').asstring := 'N';
              qryEdges.Parambyname('Is_Commercial_Customer').asstring := 'Y';
            end;
  end;

  qryEdges.parambyname('Date_From').Asdatetime := Datefrom;
  qryEdges.parambyname('Date_To').Asdatetime := DateTo;
  qryEdges.Open;
  result := qryEdges.recordcount;
end;

procedure TfrmWTRPSOProduction.ExporttoFile(filename: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Material Type"'
    + ',"Total Area"';

  writeLn(self.exportFile, tempStr);
  qrpdetails.Prepare;
  CloseFile(self.exportFile);
end;

procedure TfrmWTRPSOProduction.qrSubMaterialBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblMaterialDescription.caption := qryWorktops.fieldbyname('Material_Description').asstring;
  qrlblArea.caption := formatfloat('0.00', qryWorktops.fieldbyname('Total_Area').asfloat);
  rTotalArea := rTotalArea + qryWorktops.fieldbyname('Total_Area').asfloat;
end;

procedure TfrmWTRPSOProduction.FormCreate(Sender: TObject);
begin
  customerList := TStringList.Create;
end;

procedure TfrmWTRPSOProduction.FormDestroy(Sender: TObject);
begin
  customerList.Free;
end;

procedure TfrmWTRPSOProduction.qrSubCutOutsBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if SplitByMaterialType then
    qrlblCutOutDescription.caption := qryCutOuts.fieldbyname('Material_Description').asstring + ' '
                                    + qryCutOuts.fieldbyname('Edge_Type_Description').asstring + ' '
                                    + qryCutOuts.fieldbyname('CutOut_Description').asstring
  else
    qrlblCutOutDescription.caption := qryCutOuts.fieldbyname('Edge_Type_Description').asstring + ' '
                                    + qryCutOuts.fieldbyname('CutOut_Description').asstring;

  qrlblQuantity.caption := formatfloat('0', qryCutOuts.fieldbyname('Total_Quantity').asinteger);
end;

procedure TfrmWTRPSOProduction.qrpdetailsBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  rTotalArea := 0;
  rTotalLength := 0;
  GetCutOutDetails;
  GetEdgeDetails;
end;

procedure TfrmWTRPSOProduction.qrsubEdgeProfileBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if SplitByMaterialType then
    qrlblEdgeProfileDescription.caption := qryEdges.fieldbyname('Material_Description').asstring + ' ' + qryEdges.fieldbyname('Edge_Type_Description').asstring + ' ' + qryEdges.fieldbyname('Edge_profile_Description').asstring
  else
    qrlblEdgeProfileDescription.caption := qryEdges.fieldbyname('Edge_Type_Description').asstring + ' ' + qryEdges.fieldbyname('Edge_profile_Description').asstring;

  qrlblLength.caption := formatfloat('0.00', qryEdges.fieldbyname('Total_Length').asfloat);

  rTotalLength := rTotalLength + qryEdges.fieldbyname('Total_Length').asfloat;
end;

procedure TfrmWTRPSOProduction.qrgrpEdgeProfileBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblCategoryTitle.Caption := qrlblEdgeTitle.caption;
  qrlblCategoryCount.Caption := qrlblEdgeCount.caption;
end;

procedure TfrmWTRPSOProduction.qrgrpHeadMaterialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblCategoryTitle.Caption := qrlblMaterialTitle.caption;
  qrlblCategoryCount.Caption := qrlblMaterialCount.caption;
end;

procedure TfrmWTRPSOProduction.qrgrpHeadCutOutsBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlblCategoryTitle.Caption := qrlblCutOutTitle.caption;
  qrlblCategoryCount.Caption := qrlblCutOutCount.caption;
end;

procedure TfrmWTRPSOProduction.qrSubMaterialAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Material
    tempStr := '"' + qrlblMaterialDescription.caption + '"';

    //Area
    tempStr := tempStr + ',"' + qrlblArea.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOProduction.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSOProduction.qrSubCutOutsAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Material Type
    if SplitByMaterialType then
      tempStr := '"' + qryCutOuts.fieldbyname('Material_Description').asstring + '"'
    else
      tempStr := '"' + '' + '"';

    //Cut Outs
    tempStr := tempStr + ',"' + qryCutOuts.fieldbyname('Edge_Type_Description').asstring + ' ' + qryCutOuts.fieldbyname('CutOut_Description').asstring + '"';

    //Area
    tempStr := tempStr + ',"' + qrlblQuantity.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOProduction.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSOProduction.qrsubEdgeProfileAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
  tempstr: string;
begin
  if self.exporting then
  begin
    //Material Type
    if SplitByMaterialType then
      tempStr := '"' + qryEdges.fieldbyname('Material_Description').asstring + '"'
    else
      tempStr := '"' + '' + '"';

    //Edges
    tempStr := tempStr + ',"' + qryEdges.fieldbyname('Edge_Type_Description').asstring + ' ' + qryEdges.fieldbyname('Edge_profile_Description').asstring + '"';

    //Length
    tempStr := tempStr + ',"' + qrlblLength.caption + '"';

    writeln(self.exportFile, tempStr);
    frmWTRSSOProduction.prgbrExport.StepIt;
  end;
end;

procedure TfrmWTRPSOProduction.qrgrpHeadCutOutsAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting then
    begin
    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);

      tempStr := '"' + 'Material Type' + '"'
              + ',"' + qrlblCutOutTitle.caption + '"'
              + ',"' + qrlblCutOutCount.caption + '"';
      writeLn(self.exportFile, tempStr);
    end;
end;

procedure TfrmWTRPSOProduction.qrgrpEdgeProfileAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
begin
  if self.exporting then
    begin
    //Blank Line
      tempStr := '"' + '' + '"';
      writeln(self.exportFile, tempStr);

      tempStr := '"' + 'Material Type' + '"'
              + ',"' + qrlblEdgeTitle.caption + '"'
              + ',"' + qrlblEdgeCount.caption + '"';
      writeLn(self.exportFile, tempStr);
    end;
end;

procedure TfrmWTRPSOProduction.qrgrpFootMaterialBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblTotalArea.caption := formatfloat('0.00', rTotalArea);
end;

procedure TfrmWTRPSOProduction.SetSplitByMaterialType(
  const Value: boolean);
begin
  FSplitByMaterialType := Value;
end;

procedure TfrmWTRPSOProduction.qrgrpFootEdgeProfileBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlblTotalLength.caption := formatfloat('0.00', rTotalLength);
end;

end.
