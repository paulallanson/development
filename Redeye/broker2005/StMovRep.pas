unit StMovRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TStMovRepFrm = class(TForm)
    StMoveQuickRep: TQuickRep;
    QRBand2: TQRBand;
    TitleQRLabel: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    PartQRDBText: TQRDBText;
    RecDateQRDBText: TQRDBText;
    MoveTypeQRDBText: TQRDBText;
    BinQRDBText: TQRDBText;
    LotQRDBText: TQRDBText;
    costQRDBText: TQRDBText;
    QtyQRDBText: TQRDBText;
    RefQRDBText: TQRDBText;
    StoreQRDBText: TQRDBText;
    GetMoveDataSource: TDataSource;
    GetUserMoveQuery: TFDQuery;
    QRDBText11: TQRDBText;
    UpdPrtMoveQuery: TFDQuery;
    QRGroup1: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlblCost: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    qrbRepFooter: TQRBand;
    Group1TotalQRLabel: TQRLabel;
    TotCostQRExpr: TQRExpr;
    GetDetsQuery: TFDQuery;
    GetMoveQuery: TFDQuery;
    qrbRepSummary: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    SelDateQRLabel: TQRLabel;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    PageQRSysData: TQRSysData;
    QRLabel1: TQRLabel;
    QRLblInUse: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    function GetDetails(Sender: TObject): Integer;
    procedure UpdateStatus(Sender: TObject) ;
    procedure FormActivate(Sender: TObject);
    procedure StMoveQuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    exporting: boolean;
    exportFile: textFile;
  public
    bypart, Printed, bIs_Audit :ByteBool;
    bExcludeCosts: boolean;
    sStatus : String;
    bexcProd: Bytebool;
    procedure ExportToFile(fileName: string);
  end;

var
  StMovRepFrm: TStMovRepFrm;

implementation

uses StMovSl, pbMainMenu, ccsCommon;

{$R *.DFM}

procedure TStMovRepFrm.FormActivate(Sender: TObject);
begin
  If GetDetsQuery.recordcount = 0 then
  begin
    if not bIs_Audit then
      MessageDlg('There is nothing to print', mtError, [mbOK], 0);
  end
  else
  begin
    StMovRepfrm.StMoveQuickRep.PrinterSetup;
    StMovRepfrm.StMoveQuickRep.Print;
  end;
Close;
end;

procedure TStMovRepFrm.StMoveQuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  if not bIs_Audit then
    begin
    if byPart then
      TitleQrLabel.Caption := 'Stock Movement Report by Part'
    else
      TitleQrLabel.Caption := 'Stock Movement Report by Store';

    if bExcProd then
      SelDateQRLabel.Caption := 'Date Range: '+ StMovSlFrm.DateFromEdit.Text+
      ' To '+StMovSlFrm.DateToEdit.Text+ ' Excluding Products not in use'
    else
    SelDateQRLabel.Caption := 'Date Range: '+ StMovSlFrm.DateFromEdit.Text+
      ' To '+StMovSlFrm.DateToEdit.Text+ ' Including Products not in use';
    end;

  qrbRepFooter.Enabled := not bExcludeCosts;
  qrbRepSummary.Enabled := not bExcludeCosts;
  costQRDBText.Enabled := not bExcludeCosts;
  qrlblCost.Enabled := not bExcludeCosts;
end;
  
function TStMovRepFrm.GetDetails(Sender: TObject): Integer;
begin
  QRLabel1.enabled := not bExcProd;
  If bIs_Audit then
  begin
    getdetsquery.sql := getusermovequery.sql;
    seldateQRLabel.Caption := '';
    With GetDetsQuery do
    begin
      QRGroup1.Expression := 'GetDetsQuery.Part_Movement_Type';
      Close;
      ParamByName('User_Code').AsString := frmpbMainMenu.sOperator_Name;
      ParamByName('Workstation').AsString := frmpbMainMenu.sCompName;
      if bExcProd then
        ParamByName('Not_in_Use').AsString :='Y'
      else
        ParamByName('Not_In_Use').Asstring := '';

      Open;
      Result := Recordcount;
    end;
  end
  else
  begin
    With GetDetsQuery do
    begin
      getdetsquery.sql := getmovequery.sql;
      if byPart then
        QRGroup1.Expression := 'GetDetsQuery.Part.Part'
      else
        QRGroup1.Expression := 'GetDetsQuery.Part_Store_Name';

      if byPart then
        sql.add('order by part.part, Date_received, Part_Movement.Part_Movement, Part_Store_Name, Part_Movement_Bin, Part_Store_Lot')
      else
        sql.add('order by Part_Store_Name,Part.Part ,Date_Received, Part_Movement.Part_Movement, Part_Movement_Bin, Part_Store_Lot');

      Close;
      if StMovSlFrm.StoreDBLookupCombobox.text = '' then
        ParamByName('Store').AsInteger := 0
      else
        ParamByName('Store').AsInteger := StMovSlFrm.StoreDBLookupCombobox.KeyValue;

      if StMovSlFrm.dblkpPartMoveType.text = '' then
        ParamByName('Part_Movement_Type').Asstring := '0'
      else
        ParamByName('Part_Movement_Type').Asstring := StMovSlFrm.dblkpPartMoveType.KeyValue;

      if (StMovSlFrm.PartFromEdit.Text = '') and (StMovSlFrm.PartToEdit.Text = '') then
      begin
        ParamByName('Part').Asstring := 'ALL';
        ParamByName('PartFrom').asString := '';
        ParamByName('PartTo').asString := '';
      end
      else
      begin
        ParamByName('Part').asString := '';
        if StMovSlFrm.PartFromEdit.Text = '' then
        begin
          ParamByName('PartFrom').Asstring := '000000000000';
        end
        else
        begin
          ParamByName('PartFrom').Asstring := StMovSlFrm.PartFromEdit.Text;
        end;

        if StMovSlFrm.PartToEdit.Text = '' then
        begin
          ParamByName('PartTo').Asstring := 'zzzzzzzzzzzzz';
        end
        else
        begin
          ParamByName('PartTo').Asstring := StMovSlFrm.PartToEdit.Text;
        end;
      end;
        

      ParamByName('Date_From').Asdatetime := strtodate(StMovSlFrm.DateFromEdit.Text);
      ParamByName('Date_To').AsDateTime := strtodate(StMovSlFrm.DateToEdit.Text);
      if bExcProd then
        ParamByName('Not_in_Use').AsString :='Y'
      else
        ParamByName('Not_In_Use').Asstring := '';

      Open;
      Result := Recordcount;
    end;
  end;
end;

procedure TStMovRepFrm.UpdateStatus(Sender: TObject);
begin
 With UpdPrtMoveQuery do
    begin
      Close;
      ParamByName('Part_Movement').asInteger := GetDetsQuery.FieldByName('Part_Movement').AsInteger;
      Parambyname('sStatus').asString := 'N';
      ExecSQL;
    end;
end;

procedure TStMovRepFrm.QRSubDetail1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
if (not printed) and bIs_Audit then
  updatestatus(self)
end;

procedure TStMovRepFrm.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  tempstr: string;
begin
  QRLblInUse.Enabled := getDetsQuery.fieldByName('Not_In_Use').AsString = 'Y';
  if self.exporting then
  begin
    //product
    tempStr := '"' + GetDetsQuery.fieldByName('Part').asString + '"';

    //Customer Name
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Description').asstring + '"';

    //Customer Name
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Customer_Name').asstring + '"';

    //Date Received
    tempStr := tempStr + ',"' + PBDateStr(GetDetsQuery.fieldByName('Date_Received').asdatetime) + '"';

    //Movement Type
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Move_Type_Descr').asString + '"';

    //Movement Reference
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Movement_Reference').asString + '"';

    //Warehouse
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Store_Name').asstring + '"';

    //Bin
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Movement_Bin').asstring + '"';

    //Lot Reference
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Part_Store_Lot').asString + '"';

    //Movement Qty
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Store_Quantity').asString + '"';

    //Movement Cost
    tempStr := tempStr + ',"' + formatfloat('#,##0.00',GetDetsQuery.fieldByName('Store_Cost').asfloat) + '"';

    //Audit User
    tempStr := tempStr + ',"' + GetDetsQuery.fieldByName('Audit_User').asString + '"';

    //Product In use
    if QRLblInUse.enabled then
      tempStr := tempStr + ',"' + qrlblInUse.caption + '"'
    else
      tempStr := tempStr + ',"' + '' + '"';

    writeln(self.exportFile, tempStr);
    STMovSlFrm.prgbrExport.StepIt;
  end;
end;

procedure TStMovRepFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Product"'
    + ',"Description"'
    + ',"Customer"'
    + ',"Date Received"'
    + ',"Movement Type"'
    + ',"Movement Reference"'
    + ',"Warehouse"'
    + ',"Bin"'
    + ',"Lot Reference"'
    + ',"Quantity Moved"'
    + ',"Cost"'
    + ',"User"'
    + ',"Inactive"';

  writeLn(self.exportFile, tempStr);
  StMoveQuickRep.Prepare;

  CloseFile(self.exportFile);
end;

end.
