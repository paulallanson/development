unit PBMaintContactMulti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintContactMultiFrm = class(TForm)
    Label1: TLabel;
    dblkpBranchName: TDBLookupComboBox;
    Label2: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    ContTypeMaintBitBtn: TBitBtn;
    qryBranches: TFDQuery;
    dtsBranches: TDataSource;
    edtCustomerName: TEdit;
    procedure ContTypeMaintBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
  private
    procedure RefreshBranches;
  public
    bOK: boolean;
    iCustomer, iBranchNo: integer;
  end;

var
  PBMaintContactMultiFrm: TPBMaintContactMultiFrm;

implementation

uses PBLUCust;

{$R *.dfm}

procedure TPBMaintContactMultiFrm.ContTypeMaintBitBtnClick(
  Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  try
    PBLUCustFrm.bIs_Lookup := True;
    PBLUCustFrm.bAllow_Upd := True;
    PBLUCustFrm.bSel_Branch := false;
    PBLUCustFrm.SelCode := iCustomer;
    PBLUCustFrm.SelBranch := iBranchNo;
    PBLUCustFrm.ShowModal;
    if PBLUCustFrm.Selected then
    begin
      edtCustomerName.Text := PBLUCustFrm.SelName;
      iCustomer := PBLUCustFrm.SelCode;
      iBranchNo := PBLUCustFrm.SelBranch;
      RefreshBranches;
    end;
  finally
    PBLUCustFrm.free;
  end;
end;

procedure TPBMaintContactMultiFrm.RefreshBranches;
begin
  with qryBranches do
    begin
      close;
      parambyname('Customer').asinteger := iCustomer;
      open;
    end;
end;

procedure TPBMaintContactMultiFrm.FormActivate(Sender: TObject);
begin
  RefreshBranches;
end;

procedure TPBMaintContactMultiFrm.OKBitBtnClick(Sender: TObject);
begin
  iBranchNo := dblkpBranchName.KeyValue;
  bOK := true;
  close;
end;

procedure TPBMaintContactMultiFrm.CancelBitBtnClick(Sender: TObject);
begin
  bOK := false;
end;

end.
