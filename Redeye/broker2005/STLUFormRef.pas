(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Form Reference.

VSS Info:
$Header: /PBL D5/PBLUFormRef.pas 18    20/06/03 9:52 Andrewh $
$History: PBLUFormRef.pas $
 * 
 * *****************  Version 18  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 17  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 16  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 7/02/:3    Time: 10:47
 * Updated in $/PBL D5
 * Added Stock Reference as part of lookup and also selection parameters.
 * 
 * *****************  Version 14  *****************
 * User: Paul         Date: 17/12/:2   Time: 10:55
 * Updated in $/PBL D5
 * Changed to allow maintenance of new Stock Reference field
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 12/07/02   Time: 15:58
 * Updated in $/PBL D5
 * Add new NOTES and ENQUIRY mode to program.
 * 
 * *****************  Version 9  *****************
 * User: Janiner      Date: 17/01/:2   Time: 10:14
 * Updated in $/PBL D5
 * ensure function keys have glyphs.
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 1/10/:1    Time: 16:50
 * Updated in $/PBL D5
 * Changed to allow entry of Reorder level
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:54
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 20/10/:0   Time: 15:34
 * Updated in $/PBL D5
 * Changed to display the Form Reference Description in a panel at the
 * foot of the lookup.
 * 
 * *****************  Version 5  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:49
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 4  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:13
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 23/02/:0   Time: 12:27
 * Updated in $/PBL D5
 * Changed to display the correct heading for the Lookup to Maintain
 * Customer Form Reference
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 9/02/:0    Time: 15:53
 * Updated in $/PBL D5
 * Changed to give back the Form Reference description as well
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit STLUFormRef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSTLUFormRef = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    RefDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CustLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    Label2: TLabel;
    DispPanel: TPanel;
    DBContactText: TDBText;
    LabelName: TLabel;
    btbtnImages: TBitBtn;
    stsbrDetails: TStatusBar;
    Label1: TLabel;
    lblProductCode: TLabel;
    Label3: TLabel;
    lblDescription: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure RefDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure RefDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure btbtnImagesClick(Sender: TObject);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iCust, iBranch, iCode: Integer;
    SelName, SelDescr, stockCode, sCustName, sBranchName, sProduct: string;
    sDescription: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  frmSTLUFormRef: TfrmSTLUFormRef;

implementation

uses pbMainMenu, PBDatabase, CCSMaintPrtImages, STMaintFormRef;

{$R *.DFM}

procedure TfrmSTLUFormRef.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Customer Form Reference';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Customer/Branch Form Reference';
    SelectBitBtn.Visible := False;
  end;
  lblProductCode.caption := sProduct;
  lblDescription.caption := sDescription;
  CustLabel.Caption := sCustName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid};
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
  dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TfrmSTLUFormRef.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Customer').AsInteger := iCust;
    ParamByName('Branch_No').AsInteger := iBranch;
    ParamByName('Stock_Reference').asstring := sProduct;
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := SelectBitBtn.enabled;
    DelBitBtn.Enabled := SelectBitBtn.enabled;
    btbtnImages.Enabled := SelectBitBtn.enabled;
    
    stsbrDetails.panels[0].text := IntToStr(RecordCount) + ' items';
    first;
  end;
end;

procedure TfrmSTLUFormRef.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TfrmSTLUFormRef.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TfrmSTLUFormRef.RefDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button};
  SelectBitBtn.Enabled := True;
end;

procedure TfrmSTLUFormRef.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TfrmSTLUFormRef.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString;
  SelDescr := DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString;
  StockCode := DetsSRC.DataSet.FieldByName('Stock_Reference').AsString;
  bSelected := True;
  Close;
end;

procedure TfrmSTLUFormRef.RefDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    ChgBitBtnClick(Self);
end;

procedure TfrmSTLUFormRef.AddBitBtnClick(Sender: TObject);
begin
  {Add a new customer};
  CallMaintScreen('A');
end;

procedure TfrmSTLUFormRef.ChgBitBtnClick(Sender: TObject);
begin
  {Change a customer};
  CallMaintScreen('C');
end;

procedure TfrmSTLUFormRef.DelBitBtnClick(Sender: TObject);
begin
  {Delete a customer};
  CallMaintScreen('D');
end;

procedure TfrmSTLUFormRef.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  frmSTMaintFormRef := TfrmSTMaintFormRef.Create(Self);
  try
    frmSTMaintFormRef.sFuncMode := sTempFuncMode;
    frmSTMaintFormRef.iCust := iCust;
    frmSTMaintFormRef.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      begin
        frmSTMaintFormRef.iCode := DetsSRC.DataSet.FieldByName('Form_Reference').AsInteger;
        frmSTMaintFormRef.RefDescrEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_Descr').AsString);
        frmSTMaintFormRef.RefIDEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        frmSTMaintFormRef.sFormRef := Trim(DetsSRC.DataSet.FieldByName('Form_Reference_ID').AsString);
        frmSTMaintFormRef.StockRefEdit.Text := Trim(DetsSRC.DataSet.FieldByName('Stock_Reference').AsString);
      end
    else
      frmSTMaintFormRef.iCode := 0;
    frmSTMaintFormRef.sCustName := sCustName;
    frmSTMaintFormRef.sBranchName := sBranchName;
    frmSTMaintFormRef.sProduct := sProduct;
    frmSTMaintFormRef.sDescription := sDescription;

    frmSTMaintFormRef.ShowModal;
    bTempOK := (frmSTMaintFormRef.ModalResult = mrOK);
    iTempSel := frmSTMaintFormRef.iCode;
  finally
    frmSTMaintFormRef.Free;
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
    NameEdit.SetFocus;
  end;
end;

procedure TfrmSTLUFormRef.FindInGrid(iTempSel: Integer);
begin
  {Find the item you just changed};
  RefDBGrid.visible := false;
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then
      begin
      RefDBGrid.visible := true;
      Exit;
      end;
    while (not (EOF)) and (FieldByName('Form_Reference').AsInteger <> iTempSel) do
      Next;
    if (fieldbyname('Form_Reference').asinteger <> iTempSel) then
      first;
  end;
  RefDBGrid.visible := true;
end;

procedure TfrmSTLUFormRef.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmSTLUFormRef.btbtnImagesClick(Sender: TObject);
var
  PartImagesFrm: TCCSMaintPrtImagesFrm;
begin
  PartImagesFrm := TCCSMaintPrtImagesfrm.create(self);
  try
    PartImagesFrm.display(trim(RefDBGrid.DataSource.DataSet.fieldbyname('Stock_Reference').asstring));
  finally
  end;
end;

end.
