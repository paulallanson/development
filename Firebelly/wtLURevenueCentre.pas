unit wtLURevenueCentre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLURevenueCentre = class(TForm)
    dbgDetails: TDBGrid;
    srcRevenueCentre: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryRevenueCentre: TFDQuery;
    qryDelete: TFDQuery;
    Label4: TLabel;
    edtName: TEdit;
    tmrRefresh: TTimer;
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure srcRevenueCentreDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
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
  frmWTLURevenueCentre: TfrmWTLURevenueCentre;

implementation

uses
  System.UITypes, System.Types,
  WTMaintRevenueCentre, wtMain;

{$R *.dfm}

procedure TfrmWTLURevenueCentre.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Revenue_Centre').asinteger;
  try
    frmWTMaintRevenueCentre := TfrmWTMaintRevenueCentre.create(Application);
    frmWTMaintRevenueCentre.FunctionMode := AnsiString(FuncMode);
    frmWTMaintRevenueCentre.showmodal;
    iCode := frmWTMaintRevenueCentre.iCode;
    refresh;
    qryRevenueCentre.Locate('Revenue_Centre',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintRevenueCentre.free;
  end;
end;

procedure TfrmWTLURevenueCentre.Refresh;
begin
  qryRevenueCentre.close;
  qryRevenueCentre.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryRevenueCentre.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryRevenueCentre.parambyname('inactive').asstring := 'Y';
    end;

  qryRevenueCentre.open;
  stsbrDetails.panels[0].text := inttostr(qryRevenueCentre.recordcount) + ' records displayed';
end;

procedure TfrmWTLURevenueCentre.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLURevenueCentre.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLURevenueCentre.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Revenue_Centre WHERE Revenue_Centre = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Revenue_Centre').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Revenue_Centre_Descr').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLURevenueCentre.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLURevenueCentre.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURevenueCentre.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLURevenueCentre.srcRevenueCentreDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcRevenueCentre.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcRevenueCentre.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcRevenueCentre.DataSet.RecordCount > 0);
end;

procedure TfrmWTLURevenueCentre.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURevenueCentre.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWTLURevenueCentre.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLURevenue_Centre);
  frmWTMain.ExportToExcel(frmWTLURevenueCentre);
end;

procedure TfrmWTLURevenueCentre.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLURevenueCentre.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
