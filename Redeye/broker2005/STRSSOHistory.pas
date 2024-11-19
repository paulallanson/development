unit STRSSOHistory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, OleCtnrs, ComCtrls, Data.DB;

type
  TSTRSSOHistoryFrm = class(TForm)
    DetsDBGrid: TDBGrid;
    pnlCustProd: TPanel;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    Panel1: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    edtPart: TEdit;
    CustNameEdit: TEdit;
    CustBitBtn: TBitBtn;
    btbtnPart: TBitBtn;
    Label2: TLabel;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    btbtnCustCopy: TBitBtn;
    btnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure CustBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btbtnPartClick(Sender: TObject);
    procedure DateBitBtnClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btbtnCustCopyClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    part: string;
    partDesc: string;
    cust: integer;
    branch: integer;
    procedure refresh;
  public
    { Public declarations }
  end;

var
  STRSSOHistoryFrm: TSTRSSOHistoryFrm;

implementation

uses FireDAC.Stan.Param, STLUSordDM, DateSelV5, STRPSOHistory, PBLUCust, STLUPrtByCustOrder, CCSCommon;

{$R *.DFM}

procedure TSTRSSOHistoryFrm.CustBitBtnClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  try
    pbLUCustFrm.bIs_LookUp := True ;
    pbLUCustFrm.bAllow_Upd := True ;
    pbLUCustFrm.bSel_Branch := True ;
    pbLUCustFrm.SelCode := self.cust;
    pbLUCustFrm.SelBranch := self.branch;
    pbLUCustFrm.ShowModal;
    If pbLUCustFrm.Selected then
    begin
      self.cust := pbLUCustFrm.SelCode;
      self.CustNameEdit.Text :=
        pbLUCustFrm.SelName + '/' + pbLUCustFrm.SelBranchName;
      self.branch := pbLUCustFrm.SelBranch;
    end;
  finally
    pbLUCustFrm.Free;
  end;
  if cust <> -1 then
    Self.btbtnPart.Enabled := true;

  self.refresh;
end;

procedure TSTRSSOHistoryFrm.FormCreate(Sender: TObject);
begin
  cust := -1;
  branch :=  -1;
  part := '';
  partDesc := '';


  self.DateEdit.Text := DateToStr(IncMonth(Date(), -1));

  dmLookupSord := TdmLookupSord.Create(Self);

  dmLookupSord.DetsSRC.DataSet := dmLookupSord.qrySalesHistory;
end;

procedure TSTRSSOHistoryFrm.FormDestroy(Sender: TObject);
begin
  dmLookupSord.Free;
end;

procedure TSTRSSOHistoryFrm.btbtnPartClick(Sender: TObject);
var
  PartLUFrm: TSTLUPrtByCustOrderFrm;
begin
  PartLUFrm := TSTLUPrtByCustOrderFrm.Create(Self) ;
  try
    PartLUFrm.qryPartsOnSOs.Close;
    PartLUFrm.qryPartsOnSOs.ParamByName('cust').asInteger := self.cust;
    PartLUFrm.qryPartsOnSOs.ParamByName('dateFrom').asDateTime :=
      StrToDate(self.DateEdit.Text);
    PartLUFrm.qryPartsOnSOs.Open;

    PartLUFrm.ShowModal ;
    If PartLUFrm.bOK = True then
      begin
        self.part := PartLUFrm.sCode;
        self.partDesc := PartLUFrm.sCode + ': ' +PartLUFrm.sCodeDescr;
        edtPart.Text := self.partDesc;
      end;
  finally
    PartLUFrm.Free ;
  end;
  self.refresh;
end;

procedure TSTRSSOHistoryFrm.refresh;
begin
  if ((self.cust <> -1) and (self.part <> '')) then
  begin
    with dmLookupSord.qrySalesHistory do
    begin
      close;
      paramByName('cust').asInteger := self.cust;
      paramByName('part').asString := self.part;
      paramByName('date').asDateTime := StrToDate(self.DateEdit.Text);

      open;
    end;

    if dmLookupSord.qrySalesHistory.RecordCount > 0 then
    begin
      PreviewBitBtn.Enabled := true;
      PrintBitBtn.Enabled := true;
    end;
  end;
end;

procedure TSTRSSOHistoryFrm.DateBitBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateEdit.Text);
    DateSelV5Form.ShowModal;
    DateEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
  self.refresh;
end;

procedure TSTRSSOHistoryFrm.PreviewBitBtnClick(Sender: TObject);
//var
  //STRPSOHistoryFrm: TSTRPSOHistoryFrm;
begin
  STRPSOHistoryFrm := TSTRPSOHistoryFrm.Create(Self);
  STRPSOHistoryFrm.qrlblTitle.Caption :=
       STRPSOHistoryFrm.qrlblTitle.Caption + DateToStr(Date());
  STRPSOHistoryFrm.qrlblDateRange.caption :=
       STRPSOHistoryFrm.qrlblDateRange.caption + self.DateEdit.Text;
  try
    STRPSOHistoryFrm.qckrpSalesByProd.Preview;
  finally
    STRPSOHistoryFrm.Free;
  end;
end;

procedure TSTRSSOHistoryFrm.PrintBitBtnClick(Sender: TObject);
var
  STRPSOHistoryFrm: TSTRPSOHistoryFrm;
begin
  STRPSOHistoryFrm := TSTRPSOHistoryFrm.Create(Self);
  STRPSOHistoryFrm.qrlblTitle.Caption :=
       STRPSOHistoryFrm.qrlblTitle.Caption + DateToStr(Date());
  STRPSOHistoryFrm.qrlblDateRange.caption :=
       STRPSOHistoryFrm.qrlblDateRange.caption + self.DateEdit.Text;
  try
    STRPSOHistoryFrm.qckrpSalesByProd.PrinterSetup;
    STRPSOHistoryFrm.qckrpSalesByProd.Print;
  finally
    STRPSOHistoryFrm.Free;
  end;
end;

procedure TSTRSSOHistoryFrm.FormShow(Sender: TObject);
begin
  btbtnPart.Enabled := false;
  PreviewBitBtn.Enabled := false;
  PrintBitBtn.Enabled := false;
end;

procedure TSTRSSOHistoryFrm.btbtnCustCopyClick(Sender: TObject);
var
  STRPSOHistoryFrm: TSTRPSOHistoryFrm;
begin
  STRPSOHistoryFrm := TSTRPSOHistoryFrm.Create(Self);
  STRPSOHistoryFrm.qrlblTitle.Caption :=
       STRPSOHistoryFrm.qrlblTitle.Caption + DateToStr(Date());
  STRPSOHistoryFrm.qrlblDateRange.caption :=
       STRPSOHistoryFrm.qrlblDateRange.caption + self.DateEdit.Text;
  STRPSOHistoryFrm.qrlblCost.enabled := false;
  STRPSOHistoryFrm.qrdbtxtCost.enabled := false;
  try
    STRPSOHistoryFrm.qckrpSalesByProd.PrinterSetup;
    STRPSOHistoryFrm.qckrpSalesByProd.Print;
  finally
    STRPSOHistoryFrm.Free;
  end;
end;

procedure TSTRSSOHistoryFrm.btnExcelClick(Sender: TObject);
var
  STRPSOHistoryFrm: TSTRPSOHistoryFrm;
  tempfilename: string;
begin
  STRPSOHistoryFrm := TSTRPSOHistoryFrm.Create(Self);
  try
    STRPSOHistoryFrm.qrlblTitle.Caption :=
       STRPSOHistoryFrm.qrlblTitle.Caption + DateToStr(Date());
    STRPSOHistoryFrm.qrlblDateRange.caption :=
       STRPSOHistoryFrm.qrlblDateRange.caption + self.DateEdit.Text;

    self.prgbrExport.Max := DmLookupSOrd.DetsSRC.DataSet.RecordCount;
    tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
    self.pnlExportPrgrss.BringToFront;
    self.pnlExportPrgrss.Visible := true;
    self.pnlExportPrgrss.Repaint;

    STRPSOHistoryFrm.ExportToFile(tempFileName);
    self.pnlExportPrgrss.visible := false;
    self.Repaint;
    self.prgbrExport.Position := 0;
    self.OleContainer1.CreateLinkToFile(tempFileName, false);
    self.OleContainer1.DoVerb(0);
  finally
    STRPSOHistoryFrm.Free;
  end;
end;

end.
