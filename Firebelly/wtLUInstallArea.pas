unit wtLUInstallArea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUInstallArea = class(TForm)
    dbgDetails: TDBGrid;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    stsbrDetails: TStatusBar;
    dtsInstallationAreas: TDataSource;
    qryInstallationArea: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUInstallArea: TfrmWTLUInstallArea;

implementation

uses
  System.UITypes, System.Types,
  wtMain, wtMaintInstallArea;

{$R *.dfm}

procedure TfrmWTLUInstallArea.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode, iCountry: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Installation_Area').asinteger;
  iCountry := dbgDetails.datasource.dataset.fieldbyname('Country').asinteger;

  frmWTMaintInstallArea := TfrmWTMaintInstallArea.create(Application);
  try
    frmWTMaintInstallArea.FunctionMode := FuncMode;
    frmWTMaintInstallArea.DefaultCountry := iCountry;
    frmWTMaintInstallArea.showmodal;
    iCode := frmWTMaintInstallArea.iCode;
    refresh;
    qryInstallationArea.Locate('Installation_Area',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintInstallArea.free;
  end;
end;

procedure TfrmWTLUInstallArea.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Installation_Area WHERE Installation_Area = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Installation_Area').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Description').asstring
                    + ' area has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLUInstallArea.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLUInstallArea.chkbxShowInactiveClick(Sender: TObject);
begin
  refresh;

end;

procedure TfrmWTLUInstallArea.Refresh;
begin
  qryInstallationArea.close;
  qryInstallationArea.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryInstallationArea.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryInstallationArea.parambyname('inactive').asstring := 'Y';
    end;

  qryInstallationArea.open;
  stsbrDetails.panels[0].text := inttostr(qryInstallationArea.recordcount) + ' records displayed';
end;

procedure TfrmWTLUInstallArea.FormActivate(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUInstallArea.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLUInstallArea.btnExcelClick(Sender: TObject);
begin
  frmWTMain.ExportToExcel(frmWTLUInstallArea);

end;

procedure TfrmWTLUInstallArea.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUInstallArea.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUInstallArea.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLUInstallArea.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
