unit PBRSOSSInvPInvRecd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, CCSPrint, DBCtrls, DB, DBTables;

type
  TPBRSOSSInvPInvRecdFrm = class(TForm)
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
    Label2: TLabel;
    dblkpStatus: TDBLookupComboBox;
    dtsStatus: TDataSource;
    qryPOStatus: TQuery;
    chkbxExcludeZeroValues: TCheckBox;
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
  end;

var
  PBRSOSSInvPInvRecdFrm: TPBRSOSSInvPInvRecdFrm;

implementation

uses PBLURep, PBLUCust, PBPOObjects, PBRPOSSInvPInvRecd;

{$R *.DFM}

procedure TPBRSOSSInvPInvRecdFrm.rdgrpRepClick(Sender: TObject);
begin
  PnlRepsearch.visible := rdgrpRep.itemIndex = 1;
  if PnlRepSearch.visible = False then
  begin
    repCode := -99;
    edtRep.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSOSSInvPInvRecdFrm.btnRepClick(Sender: TObject);
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

procedure TPBRSOSSInvPInvRecdFrm.rdgrpCustClick(Sender: TObject);
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

procedure TPBRSOSSInvPInvRecdFrm.btnCustLUClick(Sender: TObject);
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

procedure TPBRSOSSInvPInvRecdFrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TPBRSOSSInvPInvRecdFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TPBRSOSSInvPInvRecdFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
  PBRPOSSInvPInvRecdFrm: TPBRPOSSInvPInvRecdFrm;
begin
  case cmboSort.itemindex of
    1: self.orderby := 'REP';
    2: self.orderby := 'CUSTOMER';
    3: self.orderBy := 'STATUS';
    4: self.orderBy := 'SUPPLIER';
    5: self.orderBy := 'ACCOUNTMAN';
  else
    self.orderby := '';
  end;

  PBRPOSSInvPInvRecdFrm := TPBRPOSSInvPInvRecdFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
//    PBRPOSSInvPInvRecdFrm.PrinterSettings := PrinterSettings;
    PBRPOSSInvPInvRecdFrm.ShowJobBags := rdgrpOrders.itemindex;
    PBRPOSSInvPInvRecdFrm.ExcludeZeroValues := chkbxExcludeZeroValues.checked;

    PBRPOSSInvPInvRecdFrm.qrlblselection.caption := 'Report Selection: ';
    PBRPOSSInvPInvRecdFrm.qrlblInclude.caption := 'Including: ';

    if custcode = 0 then
      PBRPOSSInvPInvRecdFrm.qrlblselection.caption := PBRPOSSInvPInvRecdFrm.qrlblselection.caption + 'All Customers, '
    else
      PBRPOSSInvPInvRecdFrm.qrlblselection.caption := PBRPOSSInvPInvRecdFrm.qrlblselection.caption + edtCust.text + ', ';

    if repcode = -99 then
      PBRPOSSInvPInvRecdFrm.qrlblselection.caption := PBRPOSSInvPInvRecdFrm.qrlblselection.caption + 'All Reps, '
    else
      PBRPOSSInvPInvRecdFrm.qrlblselection.caption := PBRPOSSInvPInvRecdFrm.qrlblselection.caption + edtRep.text + ', ';

    PBRPOSSInvPInvRecdFrm.qrlblInclude.caption := PBRPOSSInvPInvRecdFrm.qrlblInclude.caption + rdgrpOrders.items[rdgrpOrders.itemindex];

    if PBRPOSSInvPInvRecdFrm.PrepareReport(self.custCode,
      self.branchCode, self.repCode, dblkpStatus.KeyValue, self.orderBy) then
    begin
//      self.visible := false;
      PBRPOSSInvPInvRecdFrm.repQRGroup1.ForceNewPage := (chkbxPageBreak.checked);
      if preview then
      begin
        PBRPOSSInvPInvRecdFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPOSSInvPInvRecdFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPOSSInvPInvRecdFrm.Free;
  end;
end;

procedure TPBRSOSSInvPInvRecdFrm.canPrint;
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

procedure TPBRSOSSInvPInvRecdFrm.FormCreate(Sender: TObject);
begin
  self.custCode := 0;
  self.branchCode := 0;
  self.custText := '';
  self.repCode := -99;
  self.orderBy := 'REP';
end;

procedure TPBRSOSSInvPInvRecdFrm.FormShow(Sender: TObject);
begin
  cmboSort.itemindex := 0;

  dtsStatus.DataSet := qryPOStatus;

  dtsStatus.DataSet.Active := false;
  dtsStatus.DataSet.active := true;
  dtsStatus.DataSet.first;

  dblkpStatus.KeyValue := dtsStatus.DataSet.fieldbyname('Status').asinteger;
end;

procedure TPBRSOSSInvPInvRecdFrm.cmboSortChange(Sender: TObject);
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
