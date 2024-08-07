unit PBRPCustDet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, QuickRpt, Qrctrls, CCSCommon, qrprntr,
  printers, CCSPrint,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRPCustDetFrm = class(TForm)
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
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText1: TQRDBText;
    SeqbyQRLabel: TQRLabel;
    CustStateQRLabel: TQRLabel;
    CustTypeQRLabel: TQRLabel;
    RepQRLabel: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    qrlblStatus: TQRLabel;
    QRChildBand1: TQRChildBand;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    memoNotes: TQRMemo;
    GetNarrSQL: TFDQuery;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    ImportanceQRLabel: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QRPCustStatBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    exportFile: textFile;
    exporting: boolean;
    procedure BuildNotes(aQuery: TFDQuery; const iNarrative: integer);
  public
    PrinterSettings : TPrinterSettings;
    bIsSummary: boolean;
    procedure ExportToFile(fileName: string);
  end;

var
  PBRPCustDetFrm: TPBRPCustDetFrm;

implementation

uses PBRSCustDet;

{$R *.DFM}

procedure TPBRPCustDetFrm.QRPCustStatBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
  {set the printer to what the user selected}
  QRPCustStat.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  QRPCustStat.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  QRPCustStat.PrinterSettings.Copies := Copies;   {set the output bin the }

  {if specific pages have been selected then set them up}
  with QRPCustStat.PrinterSettings do
  begin
    if PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := PrinterSettings.FromPage;
      LastPage := PrinterSettings.ToPage;
    end;
  end;

  qrlblRunDate.Caption := 'Run Date: ' + DateToStr(Now);

  GetDetsQry.Open;
  QRDBText4.enabled := not bIsSummary;
  QRDBText8.enabled := not bIsSummary;
  if bIsSummary then
    QRBand2.Height := 45
  else
    QRBand2.Height := 70;
end;

procedure TPBRPCustDetFrm.QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
begin
  if getDetsQry.FieldByName('Acc_Active').asstring = 'N' then
    qrlblStatus.caption := 'In Active'
  else
    qrlblStatus.caption := getDetsQry.fieldbyname('Customer_Status_Descr').asstring;

  if GetDetsqry.fieldbyname('Narrative').asinteger <> 0 then
    begin
      BuildNotes(GetDetsqry, GetDetsQry.fieldbyname('Narrative').asinteger);
      if memoNotes.lines.text = '' then
        qrChildBand1.enabled := false
      else
        qrChildBand1.enabled := true;
    end
  else
    begin
      memoNotes.Lines.Clear;
      qrChildBand1.enabled := false;
    end;

end;

procedure TPBRPCustDetFrm.BuildNotes(aQuery: TFDQuery;
  const iNarrative : integer);
var
  aStr : string;
begin
  with aQuery do
  begin  {If any notes then get then}
    if iNarrative > 0 then
    begin
      GetNarrSQL.ParamByName('Narrative').AsInteger := iNarrative;
      GetNarrSQL.Open;
      aStr := '';
      while (not GetNarrSQL.EOF) do
      begin
        aStr := aStr + GetNarrSQL.FieldByName('Narrative_Text').AsString;
        if Length(GetNarrSQL.FieldByName('Narrative_Text').AsString) < 100 then
          aStr := aStr + ' ';
        GetNarrSQL.Next;
      end;
      GetNarrSQL.Close;
    end;
    MemoNotes.Lines.Clear;
    MemoNotes.Lines.Text := aStr;
  end;
end;

procedure TPBRPCustDetFrm.ExportToFile(fileName: string);
var
  tempStr: string;
begin
  self.exporting := true;
  assignFile(self.exportFile, fileName);
  rewrite(self.exportFile);

  tempStr := '"Customer"'
        + ',"Account Code"'
        + ',"Status"'
        + ',"Type"'
        + ',"Importance"'
        + ',"Rep"'
        + ',"Rep Type"'
        + ',"House"'
        + ',"Street"'
        + ',"Locale"'
        + ',"Town"'
        + ',"Postcode"'
        + ',"Phone"'
        + ',"Fax"'
        + ',"Email"'
        + ',"Notes"';

  writeLn(self.exportFile, tempStr);

  qrpCustStat.Prepare;

  CloseFile(self.exportFile);
end;

procedure TPBRPCustDetFrm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  tempStr: string;
  sNotes: string;
  icount: integer;
begin
  if exporting then
    begin
      tempStr := '"' + GetDetsqry.fieldbyname('Cust_Name').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Account_Code').asstring + '"';
      tempStr := tempStr + ',"' + qrlblStatus.caption + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Description').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Importance_Description').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Rep_Name').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Rep_Type').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Building_no_Name').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Street').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Locale').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Town').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Postcode').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Phone').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Fax_Number').asstring + '"';
      tempStr := tempStr + ',"' + GetDetsqry.fieldbyname('Email').asstring + '"';
      if memoNotes.Lines.Text <> '' then
        begin
          for icount := 0 to pred(memoNotes.lines.count) do
            begin
              sNotes := sNotes + ' ' + memoNotes.lines.Strings[icount];
            end;
          tempstr := tempstr + ',"' + sNotes + '"';
        end
      else
        tempStr := tempStr + ',"' + memoNotes.lines.text + '"';
      writeln(self.exportFile, tempStr);
      PBRSCustDetFrm.prgbrExport.StepIt;
    end;
end;

end.
