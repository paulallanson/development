unit STRSBarCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Spin, DB, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSBarCodeFrm = class(TForm)
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    rdgrpLabelType: TRadioGroup;
    grpbxReprint: TGroupBox;
    edtPalletFrom: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtPalletTo: TEdit;
    grpbxBinRange: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtBinFrom: TEdit;
    edtBinTo: TEdit;
    grpbxNewPallets: TGroupBox;
    Label5: TLabel;
    edtPalletID: TEdit;
    Label6: TLabel;
    spnNoLabels: TSpinEdit;
    btnBinFrom: TSpeedButton;
    btnBinTo: TSpeedButton;
    Label7: TLabel;
    dblkpWarehouse: TDBLookupComboBox;
    qryWarehouse: TFDQuery;
    dtsWH: TDataSource;
    CloseBitBtn: TBitBtn;
    qryBins: TFDQuery;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgrpLabelTypeClick(Sender: TObject);
    procedure btnBinFromClick(Sender: TObject);
    procedure btnBinToClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EnablePrint(Sender: TObject);
    procedure edtPalletFromKeyPress(Sender: TObject; var Key: Char);
    procedure edtPalletToKeyPress(Sender: TObject; var Key: Char);
  private
    procedure RunReport(bPreview: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STRSBarCodeFrm: TSTRSBarCodeFrm;

implementation

uses
  System.UITypes,
  STRPBarCode, STMntPrtBin, pbDatabase, PBIntSelDM;

{$R *.dfm}

procedure TSTRSBarCodeFrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TSTRSBarCodeFrm.RunReport(bPreview: boolean);
var
  iSelCode: integer;
  iFrom, iTo, icount: integer;
begin
  iSelCode := dmIntSel.GetNextDbKey;
  try
    case rdgrpLabeltype.itemindex of
      0: begin
            iFrom := strtoint(edtpalletID.text);
            iTo := ((iFrom+spnNoLabels.value)-1);
            for icount := iFrom to iTo  do
              dmIntSel.AddWithKey(iSelCode, icount, icount, icount, icount, inttostr(icount), inttostr(icount));
         end;
      1: begin
            if edtPalletTo.Text >= edtpalletID.Text then
              begin
                MessageDlg('Invalid selection, you cannot reprint pallet labels which haven''t yet been created', mtError, [mbAbort], 0);
                exit;
              end;
            iFrom := strtoint(edtPalletFrom.text);
            iTo := strtoint(edtPalletTo.text);
            for icount := iFrom to iTo do
              dmIntSel.AddWithKey(iSelCode, icount, icount, icount, icount, inttostr(icount), inttostr(icount));
         end;
      2: begin
            with qryBins do
              begin
                close;
                parambyname('Part_Store').asinteger := dblkpWarehouse.keyvalue;
                parambyname('Bin_From').asstring := edtBinFrom.text;
                parambyname('Bin_To').asstring := edtBinTo.text;
                open;
                icount := 1;
                while eof <> true do
                  begin
                    dmIntSel.AddWithKey(iSelCode, icount, icount, icount, icount,fieldbyname('Part_Bin').asstring,fieldbyname('Part_Bin').asstring);
                    icount := icount + 1;
                    next;
                  end;
              end;
         end;
    end;


    STRPBarCodeFrm := TSTRPBarCodeFrm.create(self);
    try
      if rdgrpLabeltype.itemindex = 2 then
        STRPBarCodeFrm.labeltype := 'B'
      else
        STRPBarCodeFrm.labeltype := 'P';

      STRPBarCodeFrm.selcode := iSelcode;
      STRPBarCodeFrm.bPreview := bPreview;
      if rdgrpLabelType.ItemIndex = 0 then
        STRPBarCodeFrm.bNewPallets := true
      else
        STRPBarCodeFrm.bNewPallets := false;

      if STRPBarCodeFrm.GetDetails = 0 then
        begin
          MessageDlg('Invalid selection, please review your selection', mtError, [mbAbort], 0);
          exit
        end;
      if bpreview then
        STRPBarCodeFrm.qrpDetails.preview
      else
        begin
          STRPBarCodeFrm.qrpDetails.PrinterSetup;
          if STRPBarCodeFrm.qrpDetails.tag = 0 then
            STRPBarCodeFrm.qrpDetails.Print;
        end;
    finally
      STRPBarCodeFrm.free;
    end;
  finally
    dmIntSel.DeleteRecord(iSelCode);
  end;
end;

procedure TSTRSBarCodeFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
  edtPalletID.Text := inttostr(dmbroker.GetNextPalletID);
end;

procedure TSTRSBarCodeFrm.FormCreate(Sender: TObject);
begin
  dmIntSel := TdmIntSel.Create(Self);

  grpbxNewPallets.Top := grpbxReprint.top;
  grpbxNewPallets.Left := grpbxReprint.left;

  grpbxBinRange.Top := grpbxReprint.top;
  grpbxBinRange.Left := grpbxReprint.left;
end;

procedure TSTRSBarCodeFrm.rdgrpLabelTypeClick(Sender: TObject);
begin
  case rdgrpLabelType.ItemIndex of
    0: grpbxNewPallets.BringToFront;
    1: grpbxRePrint.BringToFront;
    2: grpbxBinRange.BringToFront;
  end;
end;

procedure TSTRSBarCodeFrm.btnBinFromClick(Sender: TObject);
begin
  stMntPrtBinFrm := TSTMntPrtBinFrm.Create(self) ;
  try
    stMntPrtBinFrm.iStore := dblkpWarehouse.KeyValue ;
    stMntPrtBinFrm.sStoreName := dblkpWarehouse.text ;
    stMntPrtBinFrm.bAllow_Upd := False ;
    stMntPrtBinFrm.ShowModal ;
    edtBinFrom.text := STMntPrtBinFrm.sSelBin;
    EnablePrint(self);
  finally
    stMntPrtBinFrm.Free ;
  end;
end;

procedure TSTRSBarCodeFrm.btnBinToClick(Sender: TObject);
begin
  stMntPrtBinFrm := TSTMntPrtBinFrm.Create(self) ;
  try
    stMntPrtBinFrm.iStore := dblkpWarehouse.KeyValue ;
    stMntPrtBinFrm.sStoreName := dblkpWarehouse.text ;
    stMntPrtBinFrm.bAllow_Upd := False ;
    stMntPrtBinFrm.ShowModal ;
    edtBinTo.text := STMntPrtBinFrm.sSelBin;
    EnablePrint(self);
  finally
    stMntPrtBinFrm.Free ;
  end;

end;

procedure TSTRSBarCodeFrm.EnablePrint(Sender: TObject);
begin
  if (rdgrpLabelType.itemindex = 0) then
  begin
    PreviewBitBtn.Enabled := (edtPalletID.text <> '');
    PrintBitBtn.Enabled := PreviewBitBtn.Enabled;
  end
  else
  if (rdgrpLabelType.itemindex = 1) then
  begin
    PreviewBitBtn.Enabled := (edtPalletFrom.text <> '') and (edtPalletTo.text <> '') ;
    PrintBitBtn.Enabled := PreviewBitBtn.Enabled;
  end
  else
  begin
    PreviewBitBtn.Enabled := (edtBinFrom.text <> '') and (edtBinTo.text <> '') ;
    PrintBitBtn.Enabled := PreviewBitBtn.Enabled;
  end
end;

procedure TSTRSBarCodeFrm.FormActivate(Sender: TObject);
begin
  with qryWarehouse do
    begin
      close;
      open;
      first;
    end;
  dblkpWarehouse.KeyValue := dmBroker.getDefaultWarehouse;
  edtPalletID.Text := inttostr(dmbroker.GetNextPalletID);
end;

procedure TSTRSBarCodeFrm.FormDestroy(Sender: TObject);
begin
  dmIntSel.Free;
end;

procedure TSTRSBarCodeFrm.edtPalletFromKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TSTRSBarCodeFrm.edtPalletToKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

end.
