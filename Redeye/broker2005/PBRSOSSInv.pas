unit PBRSOSSInv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, CCSPrint, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSOSSInvFrm = class(TForm)
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    CancelBitBtn: TBitBtn;
    rdgrpRep: TRadioGroup;
    pnlCustSearch: TPanel;
    Label3: TLabel;
    edtCust: TEdit;
    btnCustLU: TButton;
    rdgrpCust: TRadioGroup;
    Label1: TLabel;
    cmboSort: TComboBox;
    chkbxPagebreak: TCheckBox;
    rdgrpOrders: TRadioGroup;
    dblkpStatus: TDBLookupComboBox;
    Label2: TLabel;
    qryPOStatus: TFDQuery;
    dtsStatus: TDataSource;
    qrySOStatus: TFDQuery;
    procedure rdgrpRepClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure rdgrpCustClick(Sender: TObject);
    procedure btnCustLUClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmboSortChange(Sender: TObject);
  private
    { Private declarations }
    repCode: integer;
    repText: string;
    custCode: integer;
    branchCode: integer;
    custText: string;
    orderBy: string;
    procedure canPrint;
    procedure RunReport(preview: boolean);
  public
    { Public declarations }
    bIs_Stock: Boolean;
  end;

var
  PBRSOSSInvFrm: TPBRSOSSInvFrm;

implementation

uses UITypes, PBLURep, PBLUCust, PBPOObjects, PBRPOSSInv;

{$R *.DFM}

procedure TPBRSOSSInvFrm.rdgrpRepClick(Sender: TObject);
begin
  PnlRepsearch.visible := rdgrpRep.itemIndex = 1;
  if PnlRepSearch.visible = False then
  begin
    repCode := -99;
    edtRep.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSOSSInvFrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := repCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      repCode := PBLURepFrm.SelCode;
      repText := PBLURepFrm.SelName;
    end;
    edtRep.Text := repText;
  finally
    PBLURepFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSOSSInvFrm.rdgrpCustClick(Sender: TObject);
begin
  pnlCustSearch.visible := rdgrpCust.itemIndex = 1;
  if pnlCustSearch.visible = False then
  begin
    custCode := 0;
    branchCode := 0;
    edtCust.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSOSSInvFrm.btnCustLUClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := False;
    PBLUCustFrm.SelCode := custCode;
    PBLUCustFrm.SelBranch := branchCode;
    PBLUCustFrm.bSel_Branch := True;    
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      custCode := PBLUCustFrm.SelCode;
      branchCode := PBLUCustFrm.SelBranch;
      custText := PBLUCustFrm.SelName +' / '+ PBLUCustFrm.SelBranchName;
    end;
    edtCust.Text := custText;
  finally
    PBLUCustFrm.Free;
  end;
  self.canPrint;
end;

procedure TPBRSOSSInvFrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TPBRSOSSInvFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TPBRSOSSInvFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
  PBRPOSSInvFrm: TPBRPOSSInvFrm;
begin
  case cmboSort.itemindex of
    1: self.orderby := 'REP';
    2: self.orderby := 'CUSTOMER';
    3: self.orderBy := 'STATUS';
  else
    self.orderby := '';
  end;

  PBRPOSSInvFrm := TPBRPOSSInvFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
//    PBRPOSSInvFrm.PrinterSettings := PrinterSettings;
    PBRPOSSInvFrm.ShowJobBags := rdgrpOrders.itemindex;

    PBRPOSSInvFrm.bIs_Stock := bIs_Stock;
    PBRPOSSInvFrm.qrlblselection.caption := 'Report Selection: ';
    PBRPOSSInvFrm.qrlblInclude.caption := 'Including: ';

    if custcode = 0 then
      PBRPOSSInvFrm.qrlblselection.caption := PBRPOSSInvFrm.qrlblselection.caption + 'All Customers, '
    else
      PBRPOSSInvFrm.qrlblselection.caption := PBRPOSSInvFrm.qrlblselection.caption + edtCust.text + ', ';

    if repcode = -99 then
      PBRPOSSInvFrm.qrlblselection.caption := PBRPOSSInvFrm.qrlblselection.caption + 'All Reps, '
    else
      PBRPOSSInvFrm.qrlblselection.caption := PBRPOSSInvFrm.qrlblselection.caption + edtRep.text + ', ';

    PBRPOSSInvFrm.qrlblselection.caption := PBRPOSSInvFrm.qrlblselection.caption + 'Status from ' + dblkpStatus.Text;
    PBRPOSSInvFrm.qrlblInclude.caption := PBRPOSSInvFrm.qrlblInclude.caption + rdgrpOrders.items[rdgrpOrders.itemindex];

    if PBRPOSSInvFrm.PrepareReport(self.custCode,
      self.branchCode, self.repCode, dblkpStatus.KeyValue, self.orderBy) then
    begin
//      self.visible := false;
      PBRPOSSInvFrm.repQRGroup1.ForceNewPage := (chkbxPageBreak.checked);
      if preview then
      begin
        PBRPOSSInvFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPOSSInvFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPOSSInvFrm.Free;
  end;
end;

procedure TPBRSOSSInvFrm.canPrint;
begin
  if ((rdgrpRep.itemIndex = 1) and (repCode = 0)) or
     ((rdgrpCust.ItemIndex = 1) and (custCode = 0)) then
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

procedure TPBRSOSSInvFrm.FormCreate(Sender: TObject);
begin
  self.custCode := 0;
  self.branchCode := 0;
  self.custText := '';
  self.repCode := -99;
  self.orderBy := 'REP';
end;

procedure TPBRSOSSInvFrm.FormShow(Sender: TObject);
begin
  cmboSort.itemindex := 0;
  
  if bIs_Stock then
    dtsStatus.DataSet := qrySOStatus
  else
    dtsStatus.DataSet := qryPOStatus;

  dtsStatus.DataSet.Active := false;
  dtsStatus.DataSet.active := true;
  dtsStatus.DataSet.first;

  dblkpStatus.KeyValue := dtsStatus.DataSet.fieldbyname('Status').asinteger;
end;

procedure TPBRSOSSInvFrm.cmboSortChange(Sender: TObject);
begin
  if cmbosort.itemindex = 0 then
    begin
      chkbxPageBreak.checked := false;
      chkbxPageBreak.enabled := false;
    end
  else
    chkbxPageBreak.enabled := true;
end;

end.
