unit wtLUSpecialInstruction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DB, StdCtrls, Buttons, Grids, DBGrids, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUSpecialInstruction = class(TForm)
    DetsDBGrid: TDBGrid;
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    stsbrDetails: TStatusBar;
    pnlLookup: TPanel;
    btnSelect: TBitBtn;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure FindInGrid(iTempSel: Integer);
    procedure SelectCode(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: string);
    procedure btnSelectClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure DetsDBGridDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  public
    iCode, iNarr, SelCode: Integer;
    Selname: string;
    SelNarrative: integer;
    bIs_Lookup, bAllow_Upd, Selected: ByteBool;
    sFuncMode: string[1];
  end;

var
  frmWTLUSpecialInstruction              : TfrmWTLUSpecialInstruction;

implementation

uses wtMaintSpecialInstruction, wtMain;

{$R *.DFM}

procedure TfrmWTLUSpecialInstruction.FormActivate(Sender: TObject);
begin
  Selected := False;
  pnlLookup.Visible := bIs_lookup;
  if bIs_Lookup then
  begin
    Caption := 'Lookup Special Instructions';
    btnSelect.Visible := True;
  end
  else
  begin
    Caption := 'Maintain Special Instructions';
    btnSelect.Visible := False;
  end;
  {Load up the string grid};
  ShowGrid(Self);
  if (SelCode <> 0) then FindInGrid(SelCode);
end;

procedure TfrmWTLUSpecialInstruction.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmWTLUSpecialInstruction.ShowGrid(Sender: TObject);
begin
  with GetDetsSQL do
  begin
    Close;
    parambyname('Description').asstring :=  '%' + edtName.Text + '%';
    Open;
    btnEdit.Enabled := RecordCount > 0;
    btnDelete.Enabled := RecordCount > 0;
    btnSelect.Enabled := RecordCount > 0;
    btnExcel.Enabled := RecordCount > 0;
  end;
end;

procedure TfrmWTLUSpecialInstruction.FindInGrid(iTempSel: Integer);
begin
  with DetsSRC.DataSet do
  begin
    First;
    if iTempSel = 0 then Exit;
    while (EOF = False) and (FieldByName('Special_Instruction').AsInteger <>
      iTempSel) do
      Next;
  end;
end;

procedure TfrmWTLUSpecialInstruction.SelectCode(Sender: TObject);
begin
  SelCode := DetsSRC.DataSet.FieldByName('Special_Instruction').AsInteger;
  SelName := DetsSRC.DataSet.FieldByName('Description').AsString;
  SelNarrative := DetsSRC.DataSet.FieldByName('narrative').Asinteger;
  Selected := True;
  Close;
end;

procedure TfrmWTLUSpecialInstruction.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK                     : ByteBool;
  iTempSel                    : Integer;
begin
  frmWTMaintSpecialInstruction := TfrmWTMaintSpecialInstruction.Create(Self);
  frmWTMaintSpecialInstruction.sFuncMode := sTempFuncMode;
  frmWTMaintSpecialInstruction.edtDescription.Text :=
    DetsSRC.DataSet.FieldByName('Description').AsString;
  frmWTMaintSpecialInstruction.sDescription :=
    DetsSRC.DataSet.FieldByName('Description').AsString;
  frmWTMaintSpecialInstruction.iCode :=
    DetsSRC.DataSet.FieldByName('Special_Instruction').AsInteger;
  frmWTMaintSpecialInstruction.inarr := DetsSRC.DataSet.FieldByName('narrative').AsInteger;
  frmWTMaintSpecialInstruction.ShowModal;
  bTempOK := (frmWTMaintSpecialInstruction.ModalResult = mrOK);
  iTempSel := frmWTMaintSpecialInstruction.icode;
  frmWTMaintSpecialInstruction.Free;
  if bTempOK = True then
  begin
    ShowGrid(Self);
    if sTempFuncMode <> 'D' then
    begin
      FindInGrid(iTempSel);
      if bIs_Lookup = True then
        SelectCode(Self);
    end;
  end;
end;

procedure TfrmWTLUSpecialInstruction.btnSelectClick(Sender: TObject);
begin
  SelectCode(self);
end;

procedure TfrmWTLUSpecialInstruction.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUSpecialInstruction.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUSpecialInstruction.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUSpecialInstruction);
end;

procedure TfrmWTLUSpecialInstruction.DetsDBGridDblClick(Sender: TObject);
begin
  if detsdbgrid.DataSource.DataSet.FieldByName('Description').asstring = '' then
    exit;
    
  if self.bIs_Lookup then
    btnSelectClick(self)
  else
    btnEditClick(self);
end;

procedure TfrmWTLUSpecialInstruction.btnDeleteClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

procedure TfrmWTLUSpecialInstruction.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  ShowGrid(self);
end;

procedure TfrmWTLUSpecialInstruction.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.

