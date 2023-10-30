unit PBLUReps;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Db, ExtCtrls, ComCtrls, CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPBLUReps = class(TForm)
    dbgDetails: TDBGrid;
    qryReps: TFDQuery;
    dtsReps: TDataSource;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btnAdd: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    btnChange: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    function GetHeaderCount: integer;
    procedure CallMaintScreen(sTempFuncMode: string);
  private
    procedure Refreshdata;
    property HeaderCount: integer read GetHeaderCount;
  public
    bEndUser: boolean;
    bViewMode: boolean;
    bProspect: boolean;
    FActivated: boolean;
    somethingChanged: boolean;
    MainName: string;
    Code: integer;
    OperatorRep: integer;
    function TotalPercentage: real;
  end;

var
  frmPBLUReps: TfrmPBLUReps;

implementation

uses PBMaintCRep, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TfrmPBLUReps.Refreshdata;
begin
  with qryReps do
    begin
      close;
      parambyname('Customer').asinteger := Code;
      open;
    end;
end;

procedure TfrmPBLUReps.FormShow(Sender: TObject);
begin
  Refreshdata;
end;

procedure TfrmPBLUReps.SetButtons(Sender: TObject; Field: TField);
begin
  btnChange.enabled := HeaderCount > 0;
  btnDelete.enabled := HeaderCount > 0;
end;

procedure TfrmPBLUReps.btnCloseClick(Sender: TObject);
begin
  close;
end;

function TfrmPBLUReps.GetHeaderCount: integer;
begin
  result := qryReps.recordcount;
end;

procedure TfrmPBLUReps.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTempSel: Integer;
  iTemp: integer;
begin
  PBMaintCRepFrm := TPBMaintCRepFrm.Create(Self);
  try
    PBMaintCRepFrm.sFuncMode := sTempFuncMode;
    PBMaintCRepFrm.iCust := Code;
    PBMaintCRepFrm.iBranch := dbgDetails.DataSource.DataSet.fieldbyname('Branch_no').asinteger;
    if sTempFuncMode <> 'A' then
      PBMaintCRepFrm.iCode := dbgDetails.datasource.DataSet.FieldByName('Rep').AsInteger
    else
      PBMaintCRepFrm.iCode := 0;
    PBMaintCRepFrm.OperatorRep := self.OperatorRep;
    PBMaintCRepFrm.sCustName := MainName;
    PBMaintCRepFrm.sBranchName := dbgDetails.DataSource.DataSet.fieldbyname('Branch_name').asstring;
    PBMaintCRepFrm.Prospect := bProspect;
    PBMaintCRepFrm.ShowModal;
    bTempOK := (PBMaintCRepFrm.ModalResult = mrOK);
    iTemp := PBMaintCRepFrm.iBranch;
    if bTempOK then
      begin
        somethingChanged := true;
        refreshdata;
        if sTempFuncMode <> 'D' then
          dbgDetails.DataSource.DataSet.Locate('Branch_no', Variant(inttostr(iTemp)),[lopartialKey]) ;
      end;
  finally
    PBMaintCRepFrm.Free;
  end;
end;
procedure TfrmPBLUReps.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmPBLUReps.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TfrmPBLUReps.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  somethingChanged := false;
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmPBLUReps.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

function TfrmPBLUReps.TotalPercentage: real;
begin
  result := 0;
(*  with detsSRC.dataset do
    begin
      first;
      while eof <> true do
        begin
          result := result + fieldbyname('percentage').asfloat;
          next;
        end;
    end;
*)
end;

procedure TfrmPBLUReps.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmPBLUReps.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TfrmPBLUReps.FormActivate(Sender: TObject);
begin
  if not FActivated then
    begin
      if bProspect then
        dmBroker.ScreenAccessControl(Self,'mnuProspects',frmPBMainMenu.iOperator,0,0)
      else
        dmBroker.ScreenAccessControl(Self,'mnuCustomers',frmPBMainMenu.iOperator,0,0);

      if bViewMode then
        begin
          btnAdd.visible := false;
          btndelete.Visible := false;
          btnChange.caption := '&View' ;
        end;
      FActivated := true;
    end;
end;

procedure TfrmPBLUReps.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (dbgDetails.datasource.dataset.fieldByName('Is_Main_Rep').Asstring = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.color := clwhite;
      (Sender as TDBGrid).Canvas.Brush.color := clGreen;
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

end.
