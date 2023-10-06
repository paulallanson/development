unit PBRSOSSInvJobBags;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, CCSPrint, DBCtrls, DB;

type
  TPBRSOSSInvJobBagsFrm = class(TForm)
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
    chkbxIncludePOs: TCheckBox;
    chkbxIncludeNotReady: TCheckBox;
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
  PBRSOSSInvJobBagsFrm: TPBRSOSSInvJobBagsFrm;

implementation

uses UITypes, PBLURep, PBLUCust, PBPOObjects, PBRPOSSInvJobBags;

{$R *.DFM}

procedure TPBRSOSSInvJobBagsFrm.rdgrpRepClick(Sender: TObject);
begin
  PnlRepsearch.visible := rdgrpRep.itemIndex = 1;
  if PnlRepSearch.visible = False then
  begin
    repCode := -99;
    edtRep.text := '';
  end;
  self.canPrint;
end;

procedure TPBRSOSSInvJobBagsFrm.btnRepClick(Sender: TObject);
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

procedure TPBRSOSSInvJobBagsFrm.rdgrpCustClick(Sender: TObject);
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

procedure TPBRSOSSInvJobBagsFrm.btnCustLUClick(Sender: TObject);
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

procedure TPBRSOSSInvJobBagsFrm.PreviewBitBtnClick(Sender: TObject);
begin
  RunReport(true);
end;

procedure TPBRSOSSInvJobBagsFrm.PrintBitBtnClick(Sender: TObject);
begin
  RunReport(false);
end;

procedure TPBRSOSSInvJobBagsFrm.RunReport(preview: boolean);
var
  PrinterSettings: TPrinterSettings;
  PBRPOSSInvJobBagsFrm: TPBRPOSSInvJobBagsFrm;
begin
  case cmboSort.itemindex of
    1: self.orderby := 'REP';
    2: self.orderby := 'CUSTOMER';
  else
    self.orderby := '';
  end;

  PBRPOSSInvJobBagsFrm := TPBRPOSSInvJobBagsFrm.Create(Self);
  PrinterSettings := TPrinterSettings.Create;
  try
//    PBRPOSSInvJobBagsFrm.PrinterSettings := PrinterSettings;
    PBRPOSSInvJobBagsFrm.qrlblselection.caption := 'Report Selection: ';
    PBRPOSSInvJobBagsFrm.qrlblInclude.caption := 'Including: ';
    if chkbxIncludePOs.checked then
      PBRPOSSInvJobBagsFrm.qrlblInclude.caption := PBRPOSSInvJobBagsFrm.qrlblInclude.caption + ' Purchase Orders'
    else
      PBRPOSSInvJobBagsFrm.qrlblInclude.caption := PBRPOSSInvJobBagsFrm.qrlblInclude.caption + ' Only Job Bag Lines';

    PBRPOSSInvJobBagsFrm.IncludePos := chkbxIncludePos.checked;

    if chkbxIncludeNotReady.checked then
      PBRPOSSInvJobBagsFrm.qrlblInclude.caption := PBRPOSSInvJobBagsFrm.qrlblInclude.caption + ', Job Bags not ready to invoice'
    else
      PBRPOSSInvJobBagsFrm.qrlblInclude.caption := PBRPOSSInvJobBagsFrm.qrlblInclude.caption + ', Only Job Bag ready to invoice';
    PBRPOSSInvJobBagsFrm.IncludeNotReady := chkbxIncludeNotReady.checked;

    if custcode = 0 then
      PBRPOSSInvJobBagsFrm.qrlblselection.caption := PBRPOSSInvJobBagsFrm.qrlblselection.caption + 'All Customers, '
    else
      PBRPOSSInvJobBagsFrm.qrlblselection.caption := PBRPOSSInvJobBagsFrm.qrlblselection.caption + edtCust.text + ', ';

    if repcode = -99 then
      PBRPOSSInvJobBagsFrm.qrlblselection.caption := PBRPOSSInvJobBagsFrm.qrlblselection.caption + 'All Reps '
    else
      PBRPOSSInvJobBagsFrm.qrlblselection.caption := PBRPOSSInvJobBagsFrm.qrlblselection.caption + edtRep.text;

    if PBRPOSSInvJobBagsFrm.PrepareReport(self.custCode,
      self.branchCode, self.repCode, self.orderBy) then
    begin
//      self.visible := false;
      PBRPOSSInvJobBagsFrm.repQRGroup1.ForceNewPage := (chkbxPageBreak.checked);
      if preview then
      begin
        PBRPOSSInvJobBagsFrm.qrReport.Preview;
      end
      else
      begin
        if SetUpPrinter(PrinterSettings) then
          PBRPOSSInvJobBagsFrm.qrReport.Print;
      end;
    end
    else
    begin
      messageDlg('Nothing to Print.', mtInformation, [mbOK], 0);
    end;
  finally
    PrinterSettings.free;
    PBRPOSSInvJobBagsFrm.Free;
  end;
end;

procedure TPBRSOSSInvJobBagsFrm.canPrint;
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

procedure TPBRSOSSInvJobBagsFrm.FormCreate(Sender: TObject);
begin
  self.custCode := 0;
  self.branchCode := 0;
  self.custText := '';
  self.repCode := -99;
  self.orderBy := 'REP';
end;

procedure TPBRSOSSInvJobBagsFrm.FormShow(Sender: TObject);
begin
  cmboSort.itemindex := 0;
end;

procedure TPBRSOSSInvJobBagsFrm.cmboSortChange(Sender: TObject);
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
