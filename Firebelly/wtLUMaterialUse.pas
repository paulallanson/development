unit wtLUMaterialUse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DB, QrCtrls, ExtCtrls,
  ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUMaterialUse = class(TForm)
    dbgDetails: TDBGrid;
    srcMaterialUse: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    chkbxShowInactive: TCheckBox;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    btnExcel: TBitBtn;
    qryMaterialUse: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    qryMaterialUseMaterial_Use: TIntegerField;
    qryMaterialUseUse_Description: TStringField;
    qryMaterialUseinactive: TStringField;
    qryMaterialUseUse_Type_Description: TStringField;
    qryMaterialUseUse_Type: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure qryMaterialUseCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
  public
    { Public declarations }
  end;

var
  frmWTLUMaterialUse: TfrmWTLUMaterialUse;

implementation

uses wtMaintMaterialUse, wtMain;

{$R *.DFM}

procedure TfrmWTLUMaterialUse.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmWTLUMaterialUse.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUMaterialUse.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUMaterialUse.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Material_Use').asinteger;
  try
    frmWTMaintMaterialUse := TfrmWTMaintMaterialUse.create(Application);
    frmWTMaintMaterialUse.FunctionMode := FuncMode;
    frmWTMaintMaterialUse.showmodal;
    iCode := frmWTMaintMaterialUse.iCode;
    refresh;
    qryMaterialUse.Locate('Material_Use',Variant(inttostr(iCode)),[]);

  finally
    Screen.Cursor := OldCursor;
    frmWTMaintMaterialUse.free;
  end;
end;

procedure TfrmWTLUMaterialUse.BitBtn3Click(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Material_Use WHERE Material_Use = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Material_Use').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Use_Description').asstring
                    + ' Material Use has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUMaterialUse.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUMaterialUse.Refresh;
begin
  qryMaterialUse.close;
  qryMaterialUse.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryMaterialUse.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryMaterialUse.parambyname('inactive').asstring := 'Y';
    end;

  qryMaterialUse.open;
  stsbrDetails.panels[0].text := inttostr(qryMaterialUse.recordcount) + ' records displayed';
end;

procedure TfrmWTLUMaterialUse.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  if Assigned(Column.Field) then 
	  StrPCopy(txt, Column.field.text) else
	  StrPCopy(Txt, '');
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLUMaterialUse.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLUMaterialUse.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUMaterialUse.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWTLUMaterialUse);
end;

procedure TfrmWTLUMaterialUse.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUMaterialUse.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUMaterialUse.qryMaterialUseCalcFields(DataSet: TDataSet);
begin
  if qryMaterialUse.fieldbyname('Use_Type').asinteger = 1 then
    qryMaterialUseUse_Type_Description.AsString := 'Worktops'
  else
  if qryMaterialUse.fieldbyname('Use_Type').asinteger = 2 then
    qryMaterialUseUse_Type_Description.asstring := 'Splashbacks etc'
  else
    qryMaterialUseUse_Type_Description.AsString := 'All'
end;

end.
