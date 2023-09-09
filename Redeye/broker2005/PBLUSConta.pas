(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Look-Up Supplier/Branch Contacts.

VSS Info:
$Header: /PBL D5/PBLUSConta.pas 13    4/07/03 14:25 Paul $
$History: PBLUSConta.pas $
 * 
 * *****************  Version 13  *****************
 * User: Paul         Date: 4/07/03    Time: 14:25
 * Updated in $/PBL D5
 * Changed to remove operator permission check
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:46
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 10  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:15
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 30/08/:2   Time: 14:21
 * Updated in $/PBL D5
 * Changed so that the procedure to check user permissions was set up in
 * the PBAuditDM rather than the PBDatabaseDM.
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 15/07/02   Time: 10:31
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 15/07/02   Time: 9:42
 * Updated in $/PBL D5
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 15/07/02   Time: 9:41
 * Updated in $/PBL D5
 * Add NOTES and ENQUIRY security settings.
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 16/11/:0   Time: 12:25
 * Updated in $/PBL D5
 * Changed to display the Name, Phone and Fax numbers in a panel at the
 * foot of the form.
 * 
 * *****************  Version 3  *****************
 * User: Davidn       Date: 17/10/00   Time: 10:29
 * Updated in $/PBL D5
 * Modified search string so that the user no longer has to type a %, it
 * is now done for them. Therefore results returned are those that contain
 * the characters specified anywhere in their length not just at the
 * begining.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/02/:0    Time: 9:53
 * Updated in $/PBL D5
 * Use new insert method and Guids to ensure new keys are unique.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBLUSConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUSContaFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    DetsDBGrid: TDBGrid;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    SearchTimer: TTimer;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    SuppLabel: TLabel;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    BranchLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DispPanel: TPanel;
    DBContactText: TDBText;
    DBCPhoneText: TDBText;
    DBCMobileText: TDBText;
    LabelName: TLabel;
    LabelPhone: TLabel;
    LabelFax: TLabel;
    NullSRC: TDataSource;
    chkbxActiveOnly: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure DetsDBGridColEnter(Sender: TObject);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure SelectCode(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure FindInGrid(iTempSel: Integer);
    procedure FormCreate(Sender: TObject);
    procedure DetsDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    bDisableNameChangeEvent: ByteBool;
  public
    { Public declarations }
    SelCode, iSupp, iBranch: Integer;
    SelName, sSuppName, sBranchName: string;
    bIs_Lookup, bAllow_Upd, bSelected: ByteBool;
  end;

var
  PBLUSContaFrm: TPBLUSContaFrm;

implementation

uses PBMaintSConta, pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBLUSContaFrm.FormActivate(Sender: TObject);
begin
  bSelected := False;
  if bIs_Lookup then
  begin
    Caption := 'Lookup a Supplier/Branch Contact';
    SelectBitBtn.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Supplier/Branch Contacts';
    SelectBitBtn.Visible := False;
  end;
  SuppLabel.Caption := sSuppName;
  BranchLabel.Caption := sBranchName;
  FuncGrpBox.Visible := (bAllow_Upd) ;
  NameEdit.Text := '';
  {Load up the string grid}
  ShowGrid(Self);
  NameEdit.SetFocus;
  FindInGrid(SelCode);
//  dmBroker.ScreenAccessControl(Self,'mnuSuppliers',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBLUSContaFrm.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Code_From').AsString := '%' + NameEdit.Text + '%';
    ParamByName('Supplier').AsInteger := iSupp;
    ParamByName('Branch_No').AsInteger := iBranch;
    if chkbxActiveOnly.Checked then
      ParamByName('inactive').AsString := 'N'
    else
      ParamByName('inactive').AsString := 'Y';
    Open;
    SelectBitBtn.Enabled := RecordCount > 0;
    ChgBitBtn.Enabled := RecordCount > 0;
    DelBitBtn.Enabled := RecordCount > 0;
    CountLabel.Caption := IntToStr(RecordCount) + ' items';
  end;
end;

procedure TPBLUSContaFrm.NameEditChange(Sender: TObject);
begin
  if bDisableNameChangeEvent then Exit;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TPBLUSContaFrm.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TPBLUSContaFrm.DetsDBGridColEnter(Sender: TObject);
begin
  {Item selected, enable OK button}
  SelectBitBtn.Enabled := True;
end;

procedure TPBLUSContaFrm.SelectBitBtnClick(Sender: TObject);
begin
  SelectCode(Self);
end;

procedure TPBLUSContaFrm.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Contact_No').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Name').AsString;
  bSelected := True;
  Close;
end;

procedure TPBLUSContaFrm.DetsDBGridDblClick(Sender: TObject);
begin
  if bIs_Lookup then
    SelectCode(Self)
  else
    chgbitbtnclick(Self);
end;

procedure TPBLUSContaFrm.AddBitBtnClick(Sender: TObject);
begin
  {Add a new Supplier}
  CallMaintScreen('A');
end;

procedure TPBLUSContaFrm.ChgBitBtnClick(Sender: TObject);
begin
  {Change a Supplier}
  CallMaintScreen('C');
end;

procedure TPBLUSContaFrm.DelBitBtnClick(Sender: TObject);
begin
  {Delete a Supplier}
  CallMaintScreen('D');
end;

procedure TPBLUSContaFrm.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
begin
  PBMaintSContaFrm := TPBMaintSContaFrm.Create(Self);
  try
    PBMaintSContaFrm.sFuncMode := sTempFuncMode;
    PBMaintSContaFrm.iSupp := iSupp;
    PBMaintSContaFrm.iBranch := iBranch;
    if sTempFuncMode <> 'A' then
      PBMaintSContaFrm.iCode :=
        DetsSRC.DataSet.FieldByName('Contact_No').AsInteger
    else
      PBMaintSContaFrm.iCode := 0;
    PBMaintSContaFrm.sSuppName := sSuppName;
    PBMaintSContaFrm.sBranchName := sBranchName;
    PBMaintSContaFrm.ShowModal;
    bTempOK := (PBMaintSContaFrm.ModalResult = mrOK);
    iTempSel := PBMaintSContaFrm.iCode;
  finally
    PBMaintSContaFrm.Free;
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

procedure TPBLUSContaFrm.FindInGrid(iTempSel: Integer);
begin
  detsDBGrid.datasource := NullSRC;
  {Find the item you just changed}
  with GetDetsSQL do
  begin
    First;
    if iTempSel = -1 then Exit;
    while (not (EOF)) and (FieldByName('Contact_No').AsInteger <> iTempSel) do
      Next;
    if EOF then
      First;
  end;
  detsDBGrid.datasource := DetsSRC;
end;

procedure TPBLUSContaFrm.FormCreate(Sender: TObject);
begin
  SelCode := 0;
  bDisableNameChangeEvent := False;
end;

procedure TPBLUSContaFrm.DetsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(detsDBGrid.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

end.
