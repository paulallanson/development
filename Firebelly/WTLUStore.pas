unit WTLUStore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, Data.DB, QrCtrls, ExtCtrls,
  ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmWTLUStore = class(TForm)
    dbgDetails: TDBGrid;
    srcStore: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn4: TBitBtn;
    qryStore: TFDQuery;
    qryDelete: TFDQuery;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    btnExcel: TBitBtn;
    btnSelect: TBitBtn;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    BitBtn2: TBitBtn;
    pnlBody: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure srcStoreDataChange(Sender: TObject; Field: TField);
    procedure btnSelectClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
  private
    FisLookup: boolean;
    FSelected: boolean;
    FSelectedName: string;
    FSelectedCode: integer;
    FSelectedAddress: integer;
    FCustomerName: string;
    FSelectedInstallMobile: string;
    FSelectedInstallEmail: string;
    FSelectedInstallName: string;
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure SetisLookup(const Value: boolean);
    procedure SetSelected(const Value: boolean);
    procedure SetSelectedName(const Value: string);
    procedure SetSelectedCode(const Value: integer);
    procedure SetSelectedAddress(const Value: integer);
    procedure SetCustomerName(const Value: string);
    procedure SetSelectedInstallEmail(const Value: string);
    procedure SetSelectedInstallMobile(const Value: string);
    procedure SetSelectedInstallName(const Value: string);
  public
    property CustomerName: string read FCustomerName write SetCustomerName;
    property isLookup: boolean read FisLookup write SetisLookup;
    property Selected: boolean read FSelected write SetSelected;
    property SelectedAddress: integer read FSelectedAddress write SetSelectedAddress;
    property SelectedCode: integer read FSelectedCode write SetSelectedCode;
    property SelectedName: string read FSelectedName write SetSelectedName;
    property SelectedInstallName: string read FSelectedInstallName write SetSelectedInstallName;
    property SelectedInstallEmail: string read FSelectedInstallEmail write SetSelectedInstallEmail;
    property SelectedInstallMobile: string read FSelectedInstallMobile write SetSelectedInstallMobile;
  end;
var
  frmWTLUStore: TfrmWTLUStore;

implementation

uses UITypes, wtMain, WTMaintStore, wtDataModule;

{$R *.DFM}

procedure TfrmWTLUStore.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
  qryStore.close;
end;

procedure TfrmWTLUStore.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUStore.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUStore.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Store').asinteger;
  frmWTMaintStore := TfrmWTMaintStore.create(Application);
  try
    frmWTMaintStore.sFuncMode := FuncMode;

    if FuncMode = 'A' then
      begin
        frmWTMaintStore.iCode := iCode;
      end
    else
      begin
        frmWTMaintStore.iCode := dbgDetails.datasource.dataset.fieldbyname('Store').asinteger;
        frmWTMaintStore.sName := dbgDetails.datasource.dataset.fieldbyname('Address_Name').asString;
      end;

    frmWTMaintStore.showmodal;
    if frmWTMaintStore.bOK then
      begin
        iCode := frmWTMaintStore.iCode;
        refresh;
        if frmWTMaintStore.sFuncMode <> 'D' then
          begin
            qryStore.Locate('Store', Variant(inttostr(frmWTMaintStore.iCode)),[lopartialKey]) ;
          end;
      end;

  finally
    Screen.Cursor := OldCursor;
    frmWTMaintStore.free;
  end;
end;

procedure TfrmWTLUStore.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Store WHERE Store = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Store').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Address_Name').asstring
                    + ' site has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUStore.dbgDetailsDblClick(Sender: TObject);
begin
  if self.isLookup then
    btnSelectClick(self)
  else
    btnEditClick(self);
end;

procedure TfrmWTLUStore.Refresh;
begin
  qryStore.close;
  qryStore.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryStore.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryStore.parambyname('inactive').asstring := 'Y';
    end;

  qryStore.open;
  stsbrDetails.panels[0].text := inttostr(qryStore.recordcount) + ' records displayed';
end;

procedure TfrmWTLUStore.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
      (Sender as TDBGrid).Canvas.Brush.Color := clMenuHighlight;
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TfrmWTLUStore.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUStore.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUStore.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWTLUStore);
end;

procedure TfrmWTLUStore.srcStoreDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.enabled := (srcStore.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcStore.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcStore.DataSet.RecordCount > 0);
  btnSelect.enabled := (srcStore.DataSet.RecordCount > 0);
end;

procedure TfrmWTLUStore.SetisLookup(const Value: boolean);
begin
  FisLookup := Value;
  btnSelect.Visible := FisLookup;
end;

procedure TfrmWTLUStore.btnSelectClick(Sender: TObject);
begin
  Selected := true;
  SelectedAddress := qryStore.fieldbyname('Address').asinteger;
  SelectedCode := qryStore.fieldbyname('Store').asinteger;
  SelectedName := qryStore.fieldbyname('Address_Name').asstring;
  close;
end;

procedure TfrmWTLUStore.SetSelected(const Value: boolean);
begin
  FSelected := Value;
end;

procedure TfrmWTLUStore.SetSelectedName(const Value: string);
begin
  FSelectedName := Value;
end;

procedure TfrmWTLUStore.SetSelectedCode(const Value: integer);
begin
  FSelectedCode := Value;
end;

procedure TfrmWTLUStore.SetSelectedAddress(const Value: integer);
begin
  FSelectedAddress := Value;
end;

procedure TfrmWTLUStore.SetCustomerName(const Value: string);
begin
  FCustomerName := Value;
end;

procedure TfrmWTLUStore.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUStore.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUStore.SetSelectedInstallEmail(
  const Value: string);
begin
  FSelectedInstallEmail := Value;
end;

procedure TfrmWTLUStore.SetSelectedInstallMobile(
  const Value: string);
begin
  FSelectedInstallMobile := Value;
end;

procedure TfrmWTLUStore.SetSelectedInstallName(const Value: string);
begin
  FSelectedInstallName := Value;
end;

end.
