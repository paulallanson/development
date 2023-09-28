unit STRSProductList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, OleCtnrs, ComCtrls;

type
  TSTRSProductListFrm = class(TForm)
    grpbxRange: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    rdgrpGroups: TRadioGroup;
    grpbxGroups: TGroupBox;
    Label3: TLabel;
    btnLUGroups: TSpeedButton;
    edtGroupName: TEdit;
    btbtnExcel: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    TotByRadioGroup: TRadioGroup;
    chkbxPageBreak: TCheckBox;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    chkbxIncludeInactive: TCheckBox;
    Label4: TLabel;
    edtDiscount: TEdit;
    Label5: TLabel;
    chkbxIncludeCosts: TCheckBox;
    procedure btnLUGroupsClick(Sender: TObject);
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure TotByRadioGroupClick(Sender: TObject);
    procedure rdgrpGroupsClick(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDiscountExit(Sender: TObject);
    procedure edtDiscountKeyPress(Sender: TObject; var Key: Char);
  private
    bChanging: boolean;
    selGroup: integer;
    procedure CallReport(Preview: ByteBool);
    procedure canPrint;
  public
    { Public declarations }
  end;

var
  STRSProductListFrm: TSTRSProductListFrm;

implementation

uses UITypes, STLUPrtGrp, STPrtMnt, STRPProductList, CCSPrint, CCSCommon;

{$R *.dfm}

procedure TSTRSProductListFrm.btnLUGroupsClick(Sender: TObject);
begin
  STLUPrtGrpFrm := TSTLUPrtGrpFrm.create(self);
  try
    STLUPrtGrpFrm.iSelCode := SelGroup;
    STLUPrtGrpFrm.bAllow_Upd := False;
    STLUPrtGrpFrm.bIs_Lookup := True;
    STLUPrtGrpFrm.ShowModal;
    if STLUPrtGrpFrm.Selected then
    begin
      SelGroup := STLUPrtGrpFrm.iSelCode;
      edtGRoupName.Text := STLUPrtGrpFrm.SelName;
    end;
  finally
    STLUPrtGrpFrm.free;
  end;
  canprint;
end;

procedure TSTRSProductListFrm.btbtnPartFromClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartFrom.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;

end;

procedure TSTRSProductListFrm.btbtnPartToClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;

end;

procedure TSTRSProductListFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallReport(true);
end;

procedure TSTRSProductListFrm.CallReport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
begin
  STRPProductListfrm := TSTRPProductListfrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;

  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;

  try
    STRPProductListfrm.qrlblSelection.caption := 'Product Range from: ' + edtPartFrom.Text + ' to '  + edtPartTo.Text;
    if SelGroup <> 0 then
      STRPProductListfrm.qrlblGroupSel.caption := 'Product Group: ' + edtGRoupName.text
    else
      STRPProductListfrm.qrlblGroupSel.caption := 'All Product Groups';

    STRPProductListfrm.qrlblGroupSel.caption := STRPProductListfrm.qrlblGroupSel.caption + ' - Discount rate: ' + edtDiscount.Text + '%';
    STRPProductListfrm.sPartFrom := edtPartFrom.Text;
    STRPProductListfrm.sPartTo := edtPartTo.Text;
    STRPProductListfrm.iPartGroup := SelGroup;
    STRPProductListfrm.rDiscount := StrToFloatDef(edtDiscount.text, 0, FormatSettings);
    STRPProductListfrm.bIncludeCosts := chkbxIncludeCosts.checked;

    STRPProductListfrm.totalBy := totbyRadioGroup.itemindex;

    STRPProductListfrm.bIncludeInactive := chkbxIncludeInactive.checked;
    STRPProductListfrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;

    if STRPProductListfrm.PrepareReport(edtPartFrom.text, edtPartFrom.text, SelGroup, 0) > 0 then
    begin
      if preview then
      begin
        STRPProductListfrm.qrpDetails.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          STRPProductListfrm.qrpDetails.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    STRPProductListfrm.Free;
    self.visible := true;
  end;
end;

procedure TSTRSProductListFrm.PrintBitBtnClick(Sender: TObject);
begin
  CallReport(false);
end;

procedure TSTRSProductListFrm.TotByRadioGroupClick(Sender: TObject);
begin
  chkbxPagebreak.enabled := ((sender as TRadioGroup).itemindex < 2);
end;

procedure TSTRSProductListFrm.rdgrpGroupsClick(Sender: TObject);
begin
  grpbxGroups.visible := rdgrpGroups.itemIndex = 1;
  if grpbxGroups.visible = False then
  begin
    SelGroup := 0;
    edtGroupname.text := '';
  end;
  canPrint;

end;

procedure TSTRSProductListFrm.canPrint;
begin
  if ((rdgrpGroups.itemIndex = 1) and (SelGroup = 0)) then
  begin
    PreviewBitBtn.Enabled := false;
    PrintBitBtn.Enabled := false;
  end
  else
  begin
    PreviewBitBtn.Enabled := true;
    PrintBitBtn.Enabled := true;
  end;
end;

procedure TSTRSProductListFrm.btbtnExcelClick(Sender: TObject);
var
  reccount: integer;
  tempFileName: string;
  PrinterSettings: TPrinterSettings;
begin
  STRPProductListFrm := TSTRPProductListFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;

  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;

  try
    STRPProductListfrm.sPartFrom := edtPartFrom.Text;
    STRPProductListfrm.sPartTo := edtPartTo.Text;
    STRPProductListfrm.iPartGroup := SelGroup;
    STRPProductListfrm.rDiscount := StrToFloatDef(edtDiscount.text, 0, FormatSettings);
    STRPProductListfrm.bIncludeCosts := chkbxIncludeCosts.checked;

    STRPProductListFrm.Totalby := TotByRadioGroup.itemindex;
    STRPProductListFrm.qrbndgrphdr.ForceNewPage := chkbxPageBreak.checked;

    reccount := STRPProductListfrm.PrepareReport(edtPartFrom.text, edtPartFrom.text, SelGroup, 0);
    if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        STRPProductListFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end
    else
      begin
        messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
      end;
  finally
    PrinterSettings.free;
    STRPProductListFrm.Free;
    self.visible := true;
  end;

end;

procedure TSTRSProductListFrm.FormCreate(Sender: TObject);
begin
  edtDiscount.Text := '0.00';
end;

procedure TSTRSProductListFrm.edtDiscountExit(Sender: TObject);
begin
  with Sender as TEdit do
  begin
    Text := formatfloat('0.00', StrToFloatDef(Text, 0, FormatSettings));
  end;

end;

procedure TSTRSProductListFrm.edtDiscountKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', Text);
  end;

  case key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;

end;

end.
