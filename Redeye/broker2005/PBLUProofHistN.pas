unit PBLUProofHistN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUProofHistNFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    NullSRC: TDataSource;
    GetHeadDtlsSQL: TFDQuery;
    Panel1: TPanel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DescLabel: TLabel;
    POLabel: TLabel;
    SuppLabel: TLabel;
    CustLabel: TLabel;
    Panel3: TPanel;
    DetsDBGrid: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    rPurchOrd: real;
    iPurchOrdLine, SelCode, iDataOp, iDataRep: Integer;
    SelName: string;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    bAllow_Add, bAllow_Chg, bAllow_Del: ByteBool;
  end;

var
  PBLUProofHistNFrm: TPBLUProofHistNFrm;

implementation

uses PBMaintProofHistN, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUProofHistNFrm.FormActivate(Sender: TObject);
begin

  Selected := False;
  if bAllow_Upd then
  begin
    Caption := 'View Proof History';
  end
  else
  begin
    Caption := 'Maintain Proof History';
  end;
  if rPurchOrd <> 0 then
  begin
    {Load up the string grid}
    ShowGrid(Self);
    if (SelCode <> 0) then FindInGrid(SelCode);
  end;
  if rPurchOrd <> 0 then
  begin
    POLabel.Caption := floatToStr(rPurchOrd)+ '/'+IntToStr(iPurchOrdLine);
    ShowGrid(Self);
  end;
  {FuncGrpBox.Visible := (bAllow_Upd) and
    (dmBroker.GetButtonStatus(PBMenuMainFrm.iOperator,'ProofHistBitBtn')=1)};
  {Screen access control} ;
//  dmBroker.ScreenAccessControl(Self, 'mnuProofs', frmpbMainMenu.iOperator, iDataOp, iDataRep) ;
  FuncGrpBox.Visible := (FuncGrpBox.Visible) and (bAllow_Upd) ;
end;

procedure TPBLUProofHistNFrm.ShowGrid(Sender: TObject);
begin
    if rpurchord = 0 then
    exit;
 with GetHeadDtlsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := rPurchOrd;
    ParamByName('Line').AsInteger := iPurchOrdLine;
    Open;
    if recordcount <> 0 then
        begin
        custlabel.Caption := 'Customer  '+FieldByName('Cust_Name').AsString;
        SuppLabel.Caption := 'Supplier  '+FieldByName('Supp_Name').AsString;
        DescLabel.Caption := 'Supplier Desc. '+fieldbyname('Suppliers_desc').Asstring;end
    else
        begin
        Custlabel.caption := '';
        SuppLabel.Caption := '';
        descLabel.Caption := '';
        end;
    end;
  POLabel.Caption := floatToStr(rPurchOrd)+'/'+IntToStr(iPurchOrdLine);
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Purchase_Order').asfloat := rPurchOrd;
    ParamByName('Line').AsInteger := iPurchOrdLine;
    Open;
    ChgBitBtn.Enabled := (RecordCount > 0) and (bAllow_chg);
    DelBitBtn.Enabled := (RecordCount > 0) and (bAllow_del);
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUProofHistNFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  Close;
end;

procedure TPBLUProofHistNFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Proof_History').AsInteger;
  Selected := True;
end;

procedure TPBLUProofHistNFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
  begin
    SelectCode(Self);
    Close;
  end;
  {Block change if it's in VIEW mode} ;
  If AddBitBtn.Visible then
        CHgBitBtnClick(Self);
end;

procedure TPBLUProofHistNFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer}
  CallMaintScreen('A');
end;

procedure TPBLUProofHistNFrm.ChgBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  {Change a customer}
  CallMaintScreen('C');
end;

procedure TPBLUProofHistNFrm.DelBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
  {Delete a customer}
  CallMaintScreen('D');
end;

procedure TPBLUProofHistNFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintProofHistNFrm := TPBMaintProofHistNFrm.Create(Self);
  try
    PBMaintProofHistNFrm.sFuncMode := sTempFuncMode;
    PBMaintProofHistNFrm.rPurchOrd := rPurchOrd;
    PBMaintProofHistNFrm.iPurchOrdLine := iPurchOrdLine;
    PBMaintProofHistNFrm.ShowModal;
    bTempOK := (PBMaintProofHistNFrm.ModalResult = mrOK);
    iTempSel := PBMaintProofHistNFrm.iCode;
  finally
    PBMaintProofHistNFrm.Free;
  end;
  if bTempOK then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup then
        SelectCode(Self);
    end;
  end;
end;

procedure TPBLUProofHistNFrm.FindInGrid(iTempSel: Integer);
begin
  DetsDBGrid.DataSource := NullSRC;
  {Find the item you just changed}
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel <> 0 then
    begin
      while (not (EOF)) and (FieldByName('Proof_History').AsInteger <>
        iTempSel) do
        Next;
    end;
  end;
  DetsDBGrid.DataSource := DetsSRC;
end;

procedure TPBLUProofHistNFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUProofHistNFrm.CloseBitBtnClick(Sender: TObject);
begin
  close;
end;

end.
