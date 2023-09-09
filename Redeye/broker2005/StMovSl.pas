unit StMovSl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, CCSCommon, OleCtnrs, ComCtrls;

type
  TStMovSlfrm = class(TForm)
    GroupBox2: TGroupBox;
    ChkBxExcProd: TCheckBox;
    Label5: TLabel;
    PartToEdit: TEdit;
    PartToBtBtn: TBitBtn;
    chkbxExcludeCosts: TCheckBox;
    Label6: TLabel;
    dblkpPartMoveType: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure PartToBtBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    fPart: string;
    procedure setPart(const Value: string);
  published
    PrintBitBtn: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DtRangeGroupBox: TGroupBox;
    Label3: TLabel;
    DateFromEdit: TEdit;
    DatefromBitBtn: TBitBtn;
    DateToBitBtn: TBitBtn;
    DateToEdit: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    PartFromEdit: TEdit;
    PartFromBitBtn: TBitBtn;
    Label2: TLabel;
    SeqByRadioGroup: TRadioGroup;
    StoreDBLookupComboBox: TDBLookupComboBox;
    procedure CallPrintPreview (TempPreview: ByteBool);
    procedure BitBtn2Click(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditChange(Sender: TObject);
    procedure DatefromBitBtnClick(Sender: TObject);
    procedure DateToBitBtnClick(Sender: TObject);
    procedure PartFromBitBtnClick(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CheckOk(Sender: TObject);
    procedure PartFromEditExit(Sender: TObject);
    procedure StoreDBLookupComboBoxClick(Sender: TObject);
    property Part: string read fPart write setPart;
  private
    { Private declarations }
    DateFrom, DateTo: TDateTime;
  public
    { Public declarations }
  end;

var
  StMovSlfrm: TStMovSlfrm;

implementation

uses
  System.UITypes,
  DateSelV5, STPrtMnt, STStockDM, StMovRep;

{$R *.DFM}

{ TClStkValSlform }

procedure TStMovSlfrm.CallPrintPreview(TempPreview: ByteBool);
begin
  StMovRepfrm := TStMovRepFrm.Create(Self);
  stMovRepFrm.printed := TempPreview;
  StMovRepFrm.bypart := seqbyradiogroup.itemindex = 1;
  stMovRepFrm.bIs_Audit := False;
  stMovRepFrm.bExcProd := ChkBxExcProd.Checked;
  stMovRepFrm.bExcludeCosts := chkbxExcludeCosts.checked;
  with StMovRepFrm do
  try
    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        StMoveQuickRep.Preview
      else
      begin
        StMoveQuickRep.PrinterSetup;
        if StMoveQuickRep.Tag = 0 then
          StMoveQuickRep.Print;
      end;
    end;
  finally;
    StMovRepFrm.Free;
  end;
end;

procedure TStMovSlfrm.BitBtn2Click(Sender: TObject);
begin
  CallPrintPreview(True);
end;

procedure TStMovSlfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(False);
end;

procedure TStMovSlfrm.DateFromEditExit(Sender: TObject);
begin
  if DateFromEdit.Text = '' then Exit;
  try
    DateFromEdit.Text := DateToStr(StrToDate(DateFromEdit.Text));
  except
    on EConvertError do
    begin
      MessageDlg('Invalid Date', mtError, [mbAbort], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;
  if (DateToEdit.Text <> '') and (StrToDate(DateToEdit.Text) <
    StrToDate(DateToEdit.Text)) then
  begin
    MessageDlg('From date is after To date', mtError, [mbAbort], 0);
    DateToEdit.SetFocus;
  end;
end;

procedure TStMovSlfrm.DateToEditChange(Sender: TObject);
begin
 if DateToEdit.Text = '' then Exit;
  try
    DateToEdit.Text := DateToStr(StrToDate(DateToEdit.Text));
  except
    on EConvertError do
    begin
      MessageDlg('Invalid Date', mtError, [mbAbort], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;
  if (DateFromEdit.Text <> '') and (StrToDate(DateToEdit.Text) <
    StrToDate(DateToEdit.Text)) then
  begin
    MessageDlg('From date is after To date', mtError, [mbAbort], 0);
    DateToEdit.SetFocus;
  end;
end;

procedure TStMovSlfrm.DatefromBitBtnClick(Sender: TObject);
begin
    DateSelV5Form := TDateSelV5Form.Create(Self);
  try
     If DateFromEdit.Text <> '' then
        DateSelV5Form.MonthCalendar1.Date := StrToDate(DateFromEdit.Text)
     else
        DateSelV5Form.MonthCalendar1.Date := Date;
    DateSelV5Form.ShowModal;
    If DateSelV5Form.ModalResult = mrOK then
      DateFromEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
CheckOk(self);
end;

procedure TStMovSlfrm.DateToBitBtnClick(Sender: TObject);
begin
   DateSelV5Form := TDateSelV5Form.Create(Self);
  try
     If DateToEdit.Text <> '' then
        DateSelV5Form.MonthCalendar1.Date := StrToDate(DateToEdit.Text)
     else
        DateSelV5Form.MonthCalendar1.Date := Date;
    DateSelV5Form.ShowModal;
    If DateSelV5Form.ModalResult = mrOK then
      DateToEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
  CheckOk(Self);
end;

procedure TStMovSlfrm.PartFromBitBtnClick(Sender: TObject);
begin
  StPrtMntFrm := TStPrtMntFrm.Create(Self) ;
  Try
    StPrtMntFrm.bIs_LookUp := True ;
    StPrtMntFrm.sCode := PartFromEdit.Text ;
    StPrtMntFrm.ShowModal ;
    If StPrtMntFrm.bOK = True then
    begin
      PartFromEdit.Text := StPrtMntFrm.sCode ;
      if PartToEdit.Text = '' then
      begin
        PartToEdit.Text := StPrtMntFrm.sCode ;
      end;
    end;
  Finally
    StPrtMntFrm.Free ;
  end;
end;

procedure TStMovSlfrm.DateToEditExit(Sender: TObject);
begin
  if DateToEdit.Text = '' then Exit;
  try
    DateToEdit.Text := DateToStr(StrToDate(DateToEdit.Text));
  except
    on EConvertError do
    begin
      MessageDlg('Invalid Date', mtError, [mbAbort], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;
  if (DateFromEdit.Text <> '') and (StrToDate(DateToEdit.Text) <
    StrToDate(DateToEdit.Text)) then
  begin
    MessageDlg('From date is after To date', mtError, [mbAbort], 0);
    DateToEdit.SetFocus;
  end;
end;

procedure TStMovSlfrm.FormCreate(Sender: TObject);
begin
  StStockDataMod := TStStockDataMod.create(self);
  DateTo := Date;
  DateToEdit.Text := PBDatestr(DateTo);
  DateFrom := Date;
  DateFromEdit.Text := PBDatestr(DateFrom);
end;

procedure TStMovSlfrm.FormDestroy(Sender: TObject);
begin
if part = '' then
  StStockDataMod.Free ;
end;

procedure TStMovSlfrm.FormActivate(Sender: TObject);
begin
  With StStockDataMod.GetStoresSQL do
  begin
    Close ;
    Open ;
  end;

  With StStockDataMod.GetMoveTypesSQL do
  begin
    Close ;
    Open ;
  end;

  //StoreDBLookupComboBox.KeyValue := ClStockDataMod.GetDefaultStore(Self) ;
  if part <> '' then
  begin
    PartFromEdit.Text := Part;
    PartToEdit.Text := Part;
    StoreDBLookupComboBox.setfocus;
  end
  else
    StStockDataMod := TStStockDataMod.Create(Self) ;

  CheckOK(self);
end;

procedure TStMovSlfrm.CheckOk(Sender: TObject);
begin
  if (Datefromedit.text <> '') and (datetoedit.text <> '') then
  begin
    Bitbtn2.enabled := true;
    printbitbtn.enabled := true;
    btnExcel.enabled := true;
  end
  else
  begin
    BitBtn2.enabled := False;
    printbitbtn.enabled := False;
    btnExcel.enabled := false;
  end;
end;

procedure TStMovSlfrm.PartFromEditExit(Sender: TObject);
begin
checkOk(Self);
end;

procedure TStMovSlfrm.StoreDBLookupComboBoxClick(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TStMovSlfrm.setPart(const Value: string);
begin
  fPart := Value;
end;

procedure TStMovSlfrm.PartToBtBtnClick(Sender: TObject);
begin
StPrtMntFrm := TStPrtMntFrm.Create(Self) ;
Try
   StPrtMntFrm.bIs_LookUp := True ;
   StPrtMntFrm.sCode := PartToEdit.Text ;
   StPrtMntFrm.ShowModal ;
   If StPrtMntFrm.bOK = True then
      begin
      PartToEdit.Text := StPrtMntFrm.sCode ;
      end;
Finally
   StPrtMntFrm.Free ;
   end;
end;

procedure TStMovSlfrm.BitBtn1Click(Sender: TObject);
begin
  storedblookupComboBox.keyvalue := 0;
end;

procedure TStMovSlfrm.BitBtn4Click(Sender: TObject);
begin
  dblkpPartMoveType.KeyValue := 0;
end;

procedure TStMovSlfrm.btnExcelClick(Sender: TObject);
var
  recCount: integer;
  tempFileName: string;
begin
  StMovRepfrm := TStMovRepFrm.Create(Self);
  with StMovRepFrm do
  try
    StMovRepFrm.bypart := seqbyradiogroup.itemindex = 1;
    stMovRepFrm.bIs_Audit := False;
    stMovRepFrm.bExcProd := ChkBxExcProd.Checked;
    stMovRepFrm.bExcludeCosts := chkbxExcludeCosts.checked;

    recCount := stMovRepFrm.GetDetails(self);
    if recCount = 0 then
      begin
        messagedlg('Nothing to Report', mtInformation, [mbOk], 0);
        exit;
      end
    else
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        stMovRepFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;
        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
  finally;
    StMovRepFrm.Free;
  end;

end;

end.
