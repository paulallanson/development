unit wtLURemedialCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLURemedialCategory = class(TForm)
    dbgDetails: TDBGrid;
    srcRemedialCategory: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryRemedialCategory: TFDQuery;
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
    procedure srcRemedialCategoryDataChange(Sender: TObject; Field: TField);
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
  frmWTLURemedialCategory: TfrmWTLURemedialCategory;

implementation

uses WTMaintRemedialCategory, wtMain;

{$R *.dfm}

procedure TfrmWTLURemedialCategory.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Remedial_Category').asinteger;
  try
    frmWTMaintRemedialCategory := TfrmWTMaintRemedialCategory.create(Application);
    frmWTMaintRemedialCategory.FunctionMode := FuncMode;
    frmWTMaintRemedialCategory.showmodal;
    iCode := frmWTMaintRemedialCategory.iCode;
    refresh;
    qryRemedialCategory.Locate('Remedial_Category',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintRemedialCategory.free;
  end;
end;

procedure TfrmWTLURemedialCategory.Refresh;
begin
  qryRemedialCategory.close;
  qryRemedialCategory.parambyname('Description').asstring :=  '%' + edtName.Text + '%';
  if not chkbxShowInactive.Checked then
    begin
      qryRemedialCategory.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryRemedialCategory.parambyname('inactive').asstring := 'Y';
    end;

  qryRemedialCategory.open;
  stsbrDetails.panels[0].text := inttostr(qryRemedialCategory.recordcount) + ' records displayed';
end;

procedure TfrmWTLURemedialCategory.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLURemedialCategory.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLURemedialCategory.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Remedial_Category WHERE Remedial_Category = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Remedial_Category').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Remedial_Category_Descr').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmWTLURemedialCategory.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLURemedialCategory.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURemedialCategory.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditClick(self);
end;

procedure TfrmWTLURemedialCategory.srcRemedialCategoryDataChange(Sender: TObject; Field: TField);
begin
  btnEdit.enabled := (srcRemedialCategory.DataSet.RecordCount > 0);
  btnDelete.enabled := (srcRemedialCategory.DataSet.RecordCount > 0);
  btnExcel.enabled := (srcRemedialCategory.DataSet.RecordCount > 0);
end;

procedure TfrmWTLURemedialCategory.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmWTLURemedialCategory.dbgDetailsDrawColumnCell(Sender: TObject;
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

procedure TfrmWTLURemedialCategory.btnExcelClick(Sender: TObject);
begin
//  frmWTMain.ExportTableToExcel(frmWTLURemedial_Category);
  frmWTMain.ExportToExcel(frmWTLURemedialCategory);
end;

procedure TfrmWTLURemedialCategory.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  Refresh;
end;

procedure TfrmWTLURemedialCategory.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

end.
