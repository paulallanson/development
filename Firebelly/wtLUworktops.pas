unit wtLUworktops;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, StdCtrls, Buttons, DBTables, DB, gtQrCtrls,
  ExtCtrls, ComCtrls;

type
  TfrmWtLUWorktops = class(TForm)
    dbgDetails: TDBGrid;
    lkpMatType: TQuery;
    srclkpMatType: TDataSource;
    qryWorktops: TQuery;
    srcLUWorktops: TDataSource;
    tmrRefresh: TTimer;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnThickness: TBitBtn;
    chkbxShowInactive: TCheckBox;
    edtName: TEdit;
    Panel2: TPanel;
    Label1: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    btnExcel: TBitBtn;
    SpeedButton2: TSpeedButton;
    qryDelete: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnThicknessClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure srcLUWorktopsDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
    procedure RefreshData;
  public
    { Public declarations }
  end;

var
  frmWtLUWorktops: TfrmWtLUWorktops;

implementation

uses wtLUWTThickness, wtMaintWT, WTLUWorktopPrices,
  wtMain;

{$R *.DFM}

procedure TfrmWtLUWorktops.FormCreate(Sender: TObject);
begin
  dblkpMaterialType.keyvalue :=1;
end;

procedure TfrmWtLUWorktops.dblkpMaterialTypeClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmWtLUWorktops.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWtLUWorktops.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWtLUWorktops.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  frmWTMaintWT := TfrmWTMaintWT.create(Application);
  try
    if FuncMode <> 'A' then
      iCode := dbgDetails.datasource.dataset.fieldbyname('Worktop').asinteger
    else
      iCode := 0;
    frmWTMaintWT.FunctionMode := FuncMode;
    frmWTMaintWT.Worktop := iCode;
    frmWTMaintWT.showmodal;
    iCode := frmWTMaintWT.iCode;
    RefreshData;
    qryWorktops.Locate('Worktop',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintWT.free;
  end;

end;

procedure TfrmWtLUWorktops.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Worktop WHERE Worktop = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Worktop').asinteger);
            execsql;
          end;
        refreshData;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWtLUWorktops.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);  
end;

procedure TfrmWtLUWorktops.btnThicknessClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTLUWTThickness := TfrmWTLUWTThickness.create(Application);
    frmWTLUWTThickness.worktop := qryWorktops.fieldbyname('worktop').asinteger;
    frmWTLUWTThickness.showmodal;
  finally
    Screen.Cursor := OldCursor;
    frmWTLUWTThickness.free;
  end;
end;

procedure TfrmWtLUWorktops.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  lkpMatType.active := false;
end;

procedure TfrmWtLUWorktops.FormActivate(Sender: TObject);
begin
  lkpMatType.active := true;

  dblkpMaterialTypeClick(Self);
  edtName.SetFocus;
end;

procedure TfrmWTLUWorktops.RefreshData;
begin
  dbgDetails.columns[0].Visible := dblkpMaterialType.keyvalue = 0;
  dbgDetails.columns[0].width := 150;

  with qryWorktops do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Description').asstring :=  '%' + edtName.Text + '%';
      if chkbxshowinactive.checked then
        parambyname('inactive').asstring := 'Y'
      else
        parambyname('inactive').asstring := 'N';
      open;
      stsbrDetails.panels[0].text := inttostr(recordcount) + ' records displayed';
    end;
end;

procedure TfrmWtLUWorktops.srcLUWorktopsDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srcLUWorktops.DataSet.recordcount > 0);
  btnDelete.Enabled := (srcLUWorktops.DataSet.recordcount > 0);
  btnThickness.Enabled := (srcLUWorktops.DataSet.recordcount > 0);
  btnExcel.Enabled := (srcLUWorktops.DataSet.recordcount > 0);
end;

procedure TfrmWtLUWorktops.chkbxShowInactiveClick(Sender: TObject);
begin
  refreshData;
end;

procedure TfrmWtLUWorktops.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if(dbgDetails.datasource.dataset.fieldByName('Show_Online').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.brush.color := clGreen;
      (Sender as TDBGrid).Canvas.font.color := clWhite;
    end;

  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWtLUWorktops.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  RefreshData;
end;

procedure TfrmWtLUWorktops.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWtLUWorktops.SpeedButton2Click(Sender: TObject);
begin
  dblkpMaterialType.KeyValue := 0;
  refreshdata;
end;

procedure TfrmWtLUWorktops.btnExcelClick(Sender: TObject);
begin
  frmWTLUWorktopPrices := TfrmWTLUWorktopPrices.create(self);
  try
    frmWTLUWorktopPrices.iMaterial := dblkpMaterialType.keyvalue;
    frmWTLUWorktopPrices.sDescription := edtName.text;
    if chkbxShowInactive.checked then
      frmWTLUWorktopPrices.sInactive := 'Y'
    else
      frmWTLUWorktopPrices.sInactive := 'N';

    frmWTLUWorktopPrices.refreshdata;
    frmWTMain.ExportToExcel(frmWTLUWorktopPrices);
  finally
    frmWTLUWorktopPrices.free;
  end;
end;

end.
