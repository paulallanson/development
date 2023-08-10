unit wtLURemedialDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLURemedialDept = class(TForm)
    dbgDetails: TDBGrid;
    srcRemedialDept: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryRemedialDept: TFDQuery;
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
    procedure srcRemedialDeptDataChange(Sender: TObject; Field: TField);
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
  frmWTLURemedialDept: TfrmWTLURemedialDept;

implementation

uses
  System.UITypes, System.Types,
  WTMaintRemedialDept, wtMain;

{$R *.dfm}

procedure TfrmWTLURemedialDept.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Remedial_Dept').asinteger;
  try
    frmWTMaintRemedialDept := TfrmWTMaintRemedialDept.create(Application);
    frmWTMaintRemedialDept.FunctionMode := FuncMode;
    frmWTMaintRemedialDept.showmodal;
    iCode := frmWTMaintRemedialDept.iCode;
    refresh;
    qryRemedialDept.Locate('Remedial_Dept',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintRemedialDept.free;
  end;
end;

procedure TfrmWTLURemedialDept.Refresh;
begin
  qryRemedialDept.close;
  qryRemedialDept.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryRemedialDept.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryRemedialDept.parambyname('inactive').asstring := 'Y';
    end;

  qryRemedialDept.open;
  stsbrDetails.panels[0].text := inttostr(qryRemedialDept.recordcount) + ' records displayed';
end;

procedure TfrmWTLURemedialDept.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLURemedialDept.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLURemedialDept.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Remedial_Dept WHERE Remedial_Dept = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Remedial_Dept').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Remedial_Dept_Descr').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLURemedialDept.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLURemedialDept.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURemedialDept.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLURemedialDept.srcRemedialDeptDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcRemedialDept.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcRemedialDept.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcRemedialDept.DataSet.RecordCount > 0);
end;

procedure TfrmWTLURemedialDept.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURemedialDept.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLURemedialDept.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLURemedial_Dept);
  frmWTMain.ExportToExcel(frmWTLURemedialDept);
end;

procedure TfrmWTLURemedialDept.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLURemedialDept.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
