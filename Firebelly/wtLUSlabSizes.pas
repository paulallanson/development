unit wtLUSlabSizes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, QrCtrls,
  ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtLUSlabSizes = class(TForm)
    dbgDetails: TDBGrid;
    tblSlabSize: TFDTable;
    srcSlabSize: TDataSource;
    qryNewSlabSize: TFDQuery;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    tblSlabSizeSlab_Size: TIntegerField;
    tblSlabSizeLength: TIntegerField;
    tblSlabSizeDepth: TIntegerField;
    tblSlabSizeInactive: TStringField;
    tblSlabSizeSlab_Size_Description: TStringField;
    procedure tblSlabSizeNewRecord(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtLUSlabSizes: TfrmwtLUSlabSizes;

implementation

uses wtMaintSlabSize, wtMain;

{$R *.dfm}

procedure TfrmwtLUSlabSizes.tblSlabSizeNewRecord(DataSet: TDataSet);
begin
	qryNewSlabSize.Close;
  qryNewSlabSize.Open;

  tblSlabSize.FieldByName('Slab_Size').asinteger := qryNewSlabSize.Fields[0].asinteger + 1;
end;

procedure TfrmwtLUSlabSizes.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLUSlabSizes.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  iCode := dbgDetails.datasource.dataset.fieldbyname('Slab_Size').asinteger;
  try
    frmWTMaintSlabSize := TfrmWTMaintSlabSize.create(Application);
    frmWTMaintSlabSize.FunctionMode := FuncMode;
    frmWTMaintSlabSize.showmodal;
    Refresh;
    tblSlabSize.Locate('Slab_Size',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintSlabSize.free;
  end;
end;

procedure TfrmwtLUSlabSizes.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUSlabSizes.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        tblSlabSize.Delete;
      except
        messagedlg(tblSlabSize.fieldbyname('Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;

end;

procedure TfrmwtLUSlabSizes.FormCreate(Sender: TObject);
begin
  tblSlabSize.active := true;
end;

procedure TfrmwtLUSlabSizes.FormDestroy(Sender: TObject);
begin
  tblSlabSize.active := false;
end;

procedure TfrmwtLUSlabSizes.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUSlabSizes.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUSlabSizes.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUSlabSizes.Refresh;
begin
  tblSlabSize.Active := false;
  if not chkbxShowInactive.Checked then
    tblSlabSize.Filter := ' ((inactive = ''N'')' + ' or (inactive is NULL) or (inactive = '' '')) '
  else
    tblSlabSize.Filter := '';
  tblSlabSize.Active := true;
  stsbrDetails.panels[0].text := inttostr(tblSlabSize.recordcount) + ' records displayed';
end;

procedure TfrmwtLUSlabSizes.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUSlabSizes.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmwtLUSlabSizes.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLUSlabSizes);
end;

end.
