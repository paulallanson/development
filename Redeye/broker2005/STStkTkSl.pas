unit STStkTkSl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, OleCtnrs, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTStkTkslfrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    BitBtn3: TBitBtn;
    SelectGroupBox: TGroupBox;
    SeqByRadioGroup: TRadioGroup;
    StoreLabel: TLabel;
    StoreDBLookupComboBox: TDBLookupComboBox;
    PrStkQtyCheckBox: TCheckBox;
    PrAllBinsCheckBox: TCheckBox;
    GroupBox1: TGroupBox;
    RngFrmLabel: TLabel;
    RngToLabel: TLabel;
    RngToEdit: TEdit;
    RngFromEdit: TEdit;
    RngFromLookupBitBtn: TBitBtn;
    RngToBitBtn: TBitBtn;
    RefEdit: TEdit;
    Label1: TLabel;
    CheckRefQuery: TFDQuery;
    CustRadioGroup: TRadioGroup;
    CustGrpBox: TGroupBox;
    Label5: TLabel;
    CustLuSpeedButton: TSpeedButton;
    CustEdit: TEdit;
    RDGrpPdFor: TRadioGroup;
    Excelbitbtn: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    OleContainer1: TOleContainer;
    procedure CallPrintPreview (TempPreview: ByteBool);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StoreDBLookupComboBoxClick(Sender: TObject);
    procedure SeqByRadioGroupClick(Sender: TObject);
    procedure RngFromLookupBitBtnClick(Sender: TObject);
    procedure RngToBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrStkQtyCheckBoxClick(Sender: TObject);
    procedure PrAllBinsCheckBoxClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure RefEditExit(Sender: TObject);
    procedure RngFromEditChange(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
    procedure ExcelbitbtnClick(Sender: TObject);
  private
    FActivated: bytebool;
    bchanging: bytebool;
    procedure DispCustBranch(Sender: TObject);
  public
    { Public declarations }
     bIs_Reprint :ByteBool;
     SelPart, SelCustName :string ;
     SelCustomer, SelCustBranch: integer;
   end;

var
  STStkTkslfrm: TSTStkTkslfrm;

implementation

uses STStkTkRep, STStockDM, STPrtMnt, STMntPrtBin, PBDatabase, PBLUCust,CCSCommon;

{$R *.DFM}

{ TSTStkValSlform }

procedure TSTStkTkslfrm.CallPrintPreview(TempPreview: ByteBool);
begin
  STStkTkRepFrm := TSTStkTkRepFrm.Create(Self);
  if TempPreview then
     STStkTkRepFrm.StockRef := 'Preview'
  else
    STStkTkRepFrm.StockRef := RefEdit.text;
  STStkTkRepFrm.selStore := StoreDBLookupComboBox.Keyvalue;
  STStkTkRepFrm.sFrom := RngFromEdit.Text;
  STStkTkRepFrm.sTo := RngToEdit.Text;

  Case RDGrpPdfor.Itemindex of
  0:  STStkTkRepFrm.paidfor := '';
  1:  STStkTkRepFrm.paidfor := 'P';
  2:  STStkTkRepFrm.paidfor := 'U';
  end;

  STStkTkRepFrm.bReprint := bIs_Reprint;
  with STStkTkRepFrm do
  try
    CheckIfReprint(Self);
    bbins := PrAllBinsCheckBox.Checked;
    bqtys := PrStkQtyCheckBox.checked;
    if SeqByRadioGroup.ItemIndex = 0 then
      begin
        bByPart := True;
      end
    else
      bByPart := False;

    if custradiogroup.ItemIndex = 0 then
      begin
        SelCust := 0;
        SelBranch := 0;
      end
    else
      begin
        SelCust := SelCustomer;
        SelBranch := SelCustBranch;
      end;

    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
          StkTkQuickReport.Preview
      else
      begin
        StkTkQuickReport.PrinterSetup;
        if StkTkQuickReport.Tag = 0 then
          StkTkQuickReport.Print;
        STStkTkSlfrm.formshow(self);
        end;
    end;
  finally;
    STStkTkRepFrm.Free;
  end;
end;

procedure TSTStkTkslfrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(True);
end;

procedure TSTStkTkslfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(False);
end;

procedure TSTStkTkslfrm.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      STStockDataMod.GetStoresSQL.Close ;
      STStockDataMod.GetStoresSQL.Open ;
      FActivated := true;

      storedblookupComboBox.KeyValue := dmBroker.GetDefaultWarehouse;
      StoreDBLookupComboBoxClick(self);
    end;
end;

procedure TSTStkTkslfrm.FormCreate(Sender: TObject);
begin
  STStockDataMod := TSTStockDataMod.Create(Self) ;
  
end;

procedure TSTStkTkslfrm.FormDestroy(Sender: TObject);
begin
  STStockDataMod.free ;
end;

procedure TSTStkTkslfrm.StoreDBLookupComboBoxClick(Sender: TObject);
begin
  If STStockDataMod.GetStoresSQL.fieldByName('Stock_Bins_In_Use').asString = 'Y' then
  begin
    PrAllBinsCheckBox.Visible := True;
    SeqByRadioGroup.Visible := False;
    SeqByRadioGroup.ItemIndex := 1;
  end
  else
  begin
    PrAllBinsCheckBox.Visible := False;
    SeqByRadioGroup.Visible := False;
    RngFrmLabel.Caption := 'Part From ';
    RngToLabel.Caption := 'Part To ';
    SeqByRadioGroup.ItemIndex := 0;
  end;
  CheckOk(Self);
end;

procedure TSTStkTkslfrm.SeqByRadioGroupClick(Sender: TObject);
begin
If SeqByRadioGroup.ItemIndex = 0 then
  begin
    RngFrmLabel.Caption := 'Part From ';
    RngToLabel.Caption := 'Part To ';
  end
else
   begin
   RngFrmLabel.Caption := 'Bin From ';
   RngToLabel.Caption := 'Bin To ';
  end;
  CheckOk(Self);
end;

procedure TSTStkTkslfrm.RngFromLookupBitBtnClick(Sender: TObject);
begin
if SeqByRadioGroup.ItemIndex = 1 then
begin
{Lookup bins in the selected store} ;
STMntPrtBinFrm := TSTMntPrtBinFrm.Create(Self) ;
Try
   STMntPrtBinFrm.iStore := STStockDataMod.StoresDataSource.DataSet.FieldByName('Part_Store').AsInteger ;
   STMntPrtBinFrm.sStoreName := STStockDataMod.StoresDataSource.Dataset.FieldByName('Part_Store_Name').AsString ;
   STMntPrtBinFrm.ShowModal ;
   selPart := STMntPrtBinFrm.sSelBin ;
   RngFromEdit.Text := selPart;
 Finally
   STMntPrtBinFrm.Free ;
   end;
  end;

  if SeqByRadioGroup.ItemIndex = 0 then
  begin
    STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
    Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := SelPart ;
    STPrtMntFrm.ShowModal ;
       If STPrtMntFrm.bOK = True then
       begin
       SelPart := STPrtMntFrm.sCode ;
        RngFromEdit.Text := selPart;
       end;
  Finally
     STPrtMntFrm.Free ;
     end;
end;
  CheckOk(Self);
end;

procedure TSTStkTkslfrm.RngToBitBtnClick(Sender: TObject);
begin
if SeqByRadioGroup.ItemIndex = 1 then
begin
{Lookup bins in the selected store} ;
STMntPrtBinFrm := TSTMntPrtBinFrm.Create(Self) ;
Try
   STMntPrtBinFrm.iStore := STStockDataMod.StoresDataSource.DataSet.FieldByName('Part_Store').AsInteger ;
   STMntPrtBinFrm.sStoreName := STStockDataMod.StoresDataSource.Dataset.FieldByName('Part_Store_Name').AsString ;
   STMntPrtBinFrm.ShowModal ;
   selPart := STMntPrtBinFrm.sSelBin ;
   RngToEdit.Text := selPart;
 Finally
   STMntPrtBinFrm.Free ;
   end;
  end;

  if SeqByRadioGroup.ItemIndex = 0 then
  begin
    STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
    Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := SelPart ;
    STPrtMntFrm.ShowModal ;
       If STPrtMntFrm.bOK = True then
       begin
       SelPart := STPrtMntFrm.sCode ;
        RngToEdit.Text := selPart;
       end;
  Finally
     STPrtMntFrm.Free ;
     end;
end;
  CheckOk(Self);
end;

procedure TSTStkTkslfrm.FormShow(Sender: TObject);
begin
  Refedit.text := '';
  RngFromEdit.text := '';
  RngToEdit.Text := '';
  PrAllBinscheckBox.checked := False;
  PrStkQtyCheckBox.checked := False;
  StoreDBLookupComboBox.KeyValue := 0;
  refedit.SetFocus;
end;

procedure TSTStkTkslfrm.PrStkQtyCheckBoxClick(Sender: TObject);
begin
    CheckOk(Self);
end;

procedure TSTStkTkslfrm.PrAllBinsCheckBoxClick(Sender: TObject);
begin
  RngFromEdit.Text := '';
  RngToEdit.Text := '';
  CheckOk(Self);
end;

procedure TSTStkTkslfrm.CheckOK(Sender: TObject);
begin
If (RefEdit.Text <> '') and (StoreDbLookupComboBox.keyvalue <> 0) then
  begin
    printBitBtn.Enabled := True;
    PreviewBitBtn.Enabled := True;
    ExcelBitBtn.Enabled := True;
  end
else
  begin
    printBitBtn.Enabled := False;
    PreviewBitBtn.Enabled := False;
    ExcelBitBtn.Enabled := False;
  end;
end;

procedure TSTStkTkslfrm.RefEditExit(Sender: TObject);
begin
 With CheckRefQuery do
    begin
      Close;
      ParamByName('Ref').AsString := RefEdit.Text;
      Open;
      bIs_Reprint := False;
      If RecordCount > 0 then
      begin
      If MessageDlg('Reference already used, is this a re-print', mtConfirmation, mbYesNoCancel, 0) = mrYes then
            begin
              bIs_Reprint := True;
              StoreDBLookupComboBox.Keyvalue := 0;
              CallPrintPreview(False);
              Close;
          end;
          RefEdit.text := '';
          RefEdit.setfocus;
      end;
  end;
  CheckOk(Self);
end;

procedure TSTStkTkslfrm.RngFromEditChange(Sender: TObject);
begin
  if bChanging then exit;
  rngtoedit.Text := rngfromedit.Text ;
end;

procedure TSTStkTkslfrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
    CustGrpBox.Visible := False
  else
    CustGrpBox.Visible := True;

end;

procedure TSTStkTkslfrm.CustLuSpeedButtonClick(Sender: TObject);
begin
  pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := SelCustomer;
  pbLUCustFrm.SelBranch := SelCustBranch;
  pbLUCustFrm.bSel_Branch := True;
  pbLUCustFrm.ShowModal;
  begin
    SelCustomer := pbLUCustFrm.SelCode;
    SelCustBranch := pbLUCustFrm.SelBranch;
    SelCustName := pbLUCustFrm.SelName;
    DispCustBranch(Self);
  end;
  pbLUCustFrm.Free;

end;

procedure TSTStkTkslfrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TSTStkTkslfrm.ExcelbitbtnClick(Sender: TObject);
var
  tempFileName: string;
  RecCount: integer;
begin
  STStkTkRepFrm := TSTStkTkRepFrm.Create(Self);
  try
    STStkTkRepFrm.StockRef := RefEdit.text;
    STStkTkRepFrm.selStore := StoreDBLookupComboBox.Keyvalue;
    STStkTkRepFrm.sFrom := RngFromEdit.Text;
    STStkTkRepFrm.sTo := RngToEdit.Text;

    Case RDGrpPdfor.Itemindex of
      0:  STStkTkRepFrm.paidfor := '';
      1:  STStkTkRepFrm.paidfor := 'P';
      2:  STStkTkRepFrm.paidfor := 'U';
    end;

    STStkTkRepFrm.bReprint := bIs_Reprint;
    with STStkTkRepFrm do
      begin
        CheckIfReprint(Self);
        bbins := PrAllBinsCheckBox.Checked;
        bqtys := PrStkQtyCheckBox.checked;
        if SeqByRadioGroup.ItemIndex = 0 then
          begin
            bByPart := True;
          end
        else
          bByPart := False;

        if custradiogroup.ItemIndex = 0 then
          begin
            SelCust := 0;
            SelBranch := 0;
          end
        else
          begin
            SelCust := SelCustomer;
            SelBranch := SelCustBranch;
          end;

        recCount := GetDetails(self);
        if RecCount = 0 then
          begin
            MessageDlg('Nothing to print', mtError, [mbOK], 0);
          end
        else
          begin
            self.prgbrExport.Max := recCount;
            tempFileName := getWinTempDir + self.caption + ' - ' + RefEdit.Text + formatdatetime('yymmddhhmmss',now)+'.csv';
            self.pnlExportPrgrss.BringToFront;
            self.pnlExportPrgrss.Visible := true;
            self.pnlExportPrgrss.Repaint;

            ExportToFile(tempFileName);
            self.pnlExportPrgrss.visible := false;
            self.Repaint;
            self.prgbrExport.Position := 0;
            self.OleContainer1.CreateLinkToFile(tempFileName, false);
            self.OleContainer1.DoVerb(0);

          end;
      end;
  finally;
    STStkTkRepFrm.Free;
  end;
end;

end.
