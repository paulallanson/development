(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up A Proof History.

VSS Info:
$Header: /PBL D5/PBLUProofHistN.pas 9     26/06/03 10:41 Andrewh $
$History: PBLUProofHistN.pas $
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 26/06/03   Time: 10:41
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 26/11/:1   Time: 15:59
 * Updated in $/PBL D5
 * Added new Operator name field as part of lookup display
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:56
 * Updated in $/PBL D5
 * Changed to work with selecting from the Purchase Order lookup screen.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 17/10/:0   Time: 13:32
 * Updated in $/PBL D5
 * ensure selected purchase order line is re-displayed after amending
 * proof history.
 * 
 * *****************  Version 4  *****************
 * User: Janiner      Date: 12/10/:0   Time: 16:37
 * Updated in $/PBL D5
 * allow double click, to bring up the change window
 * 
 * *****************  Version 3  *****************
 * User: Janiner      Date: 5/10/:0    Time: 11:08
 * Updated in $/PBL D5
 * Improve screen layout.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 15:41
 * Updated in $/PBL D5
 * New method to ensure new keys are unique in multi-user environment.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
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
