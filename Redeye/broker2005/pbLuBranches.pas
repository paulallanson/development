unit pbLuBranches;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, ComCtrls, ExtCtrls, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmpbluBranches = class(TForm)
    dbgDetails: TDBGrid;
    dtsBranch: TDataSource;
    qrySBranch: TFDQuery;
    qryCBranch: TFDQuery;
    Panel1: TPanel;
    btnAdd: TButton;
    btnChange: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    stsbrDetails: TStatusBar;
    Label1: TLabel;
    edtName: TEdit;
    SearchTimer: TTimer;
    chkbxActiveOnly: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkbxActiveOnlyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    BranchName: string;
    FCodeType: string;
    function GetHeaderCount: integer;
    procedure CallMaintCustScreen(Mode: string);
    procedure CallMaintSuppScreen(Mode: string);
    procedure SetCodeType(const Value: string);
  private
    procedure Refreshdata;
    property HeaderCount: integer read GetHeaderCount;
  public
    MainName: string;
    Code: integer;
    BranchType: string;
    CostCentreLevel: string;
    property CodeType: string read FCodeType write SetCodeType;
  end;

var
  frmpbluBranches: TfrmpbluBranches;

implementation

uses UITypes, PBMaintBranch, PBMaintSupBrch, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TfrmpbluBranches.Refreshdata;
begin
  if CodeType = 'C' then
    begin
    with qryCBranch do
      begin
      close;
      parambyname('Customer').asinteger := Code;
      parambyname('Name').asstring := '%'+BranchName+'%';
      if chkbxActiveOnly.Checked then
        ParamByName('inactive').AsString := 'N'
      else
        ParamByName('inactive').AsString := 'Y';
      open;
      end;
    dtsBranch.DataSet := qryCBranch;
    end
  else
    begin
    with qrySBranch do
      begin
      close;
      parambyname('Supplier').asinteger := Code;
      parambyname('Name').asstring := '%'+BranchName+'%';
      if chkbxActiveOnly.Checked then
        ParamByName('inactive').AsString := 'N'
      else
        ParamByName('inactive').AsString := 'Y';
      open;
      end;
    dtsBranch.DataSet := qrySBranch;
    end
end;

procedure TfrmpbluBranches.FormShow(Sender: TObject);
begin
  Refreshdata;
end;

procedure TfrmpbluBranches.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmpbluBranches.SetButtons(Sender: TObject; Field: TField);
begin
  btnChange.enabled := HeaderCount > 0;
  btnDelete.enabled := HeaderCount > 0;
end;

function TfrmpbluBranches.GetHeaderCount: integer;
begin
  if CodeType = 'C' then
    result := qryCBranch.recordcount
  else
    result := qrySBranch.recordcount
end;

procedure TfrmpbluBranches.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmpbluBranches.btnChangeClick(Sender: TObject);
begin
  if CodeType = 'C' then
    CallMaintCustScreen('C')
  else
    CallMaintSuppScreen('C')
end;

procedure TfrmpbluBranches.CallMaintCustScreen(Mode: string);
var
  bTempOK: boolean;
  itemp: integer;
begin
  PBMaintBranchFrm := TPBMaintBranchFrm.Create(Self);
  try
    PBMaintBranchFrm.sFuncMode := Mode;
    PBMaintBranchfrm.sCustName := MainName;
    PBMaintBranchfrm.CostCentreLevel := CostCentreLevel;

    PBMaintBranchfrm.iCust := dbgDetails.DataSource.DataSet.fieldbyname('Customer').asinteger;
    PBMaintBranchfrm.icode := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    PBMaintBranchFrm.ShowModal;
    bTempOK := (PBMaintBranchFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintBranchFrm.iCode;
        refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(iTemp)),[lopartialKey]) ;
      end;
  finally
    PBMaintBranchFrm.Free;
  end;
end;

procedure TfrmpbluBranches.CallMaintSuppScreen(Mode: string);
var
  bTempOK: boolean;
  itemp: integer;
begin
  PBMaintSupBrchFrm := TPBMaintSupBrchFrm.Create(Self);
  try
    PBMaintSupBrchFrm.sFuncMode := Mode;
    PBMaintSupBrchfrm.sSuppName := MainName;
    PBMaintSupBrchFrm.iSupp := dbgDetails.DataSource.DataSet.fieldbyname('Supplier').asinteger;
    PBMaintSupBrchFrm.icode := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    PBMaintSupBrchFrm.ShowModal;
    bTempOK := (PBMaintSupBrchFrm.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := PBMaintSupBrchFrm.iCode;
        refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(iTemp)),[lopartialKey]) ;
      end;
  finally
    PBMaintSupBrchFrm.Free;
  end;
end;

procedure TfrmpbluBranches.btnAddClick(Sender: TObject);
begin
  if CodeType = 'C' then
    CallMaintCustScreen('A')
  else
    CallMaintSuppScreen('A')
end;

procedure TfrmpbluBranches.btnDeleteClick(Sender: TObject);
begin
  if CodeType = 'C' then
    CallMaintCustScreen('D')
  else
    CallMaintSuppScreen('D')
end;

procedure TfrmpbluBranches.SetCodeType(const Value: string);
begin
  FCodeType := Value;
end;

procedure TfrmpbluBranches.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  refreshdata;
end;

procedure TfrmpbluBranches.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);

end;

procedure TfrmpbluBranches.edtNameChange(Sender: TObject);
begin
  BranchName := edtName.Text;
  SearchTimer.Enabled := False;
  SearchTimer.Enabled := True;
end;

procedure TfrmpbluBranches.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;

  BranchName := '';
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmpbluBranches.chkbxActiveOnlyClick(Sender: TObject);
begin
  refreshdata;
end;

procedure TfrmpbluBranches.FormActivate(Sender: TObject);
begin
  edtName.SetFocus;
end;

procedure TfrmpbluBranches.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

end.
