unit wtLUWorktopDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls, ComCtrls,
  DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUWorktopDetails = class(TForm)
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    btnThickness: TBitBtn;
    chkbxShowInactive: TCheckBox;
    edtName: TEdit;
    dbgDetails: TDBGrid;
    lkpMatType: TFDQuery;
    srclkpMatType: TDataSource;
    qryWorktops: TFDQuery;
    srcLUWorktops: TDataSource;
    SpeedButton2: TSpeedButton;
    btnExcel: TBitBtn;
    tmrRefresh: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure srcLUWorktopsDataChange(Sender: TObject; Field: TField);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure RefreshData;
    procedure CallMaintScreen(FuncMode: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTLUWorktopDetails: TfrmWTLUWorktopDetails;

implementation

uses wtMain, WTMaintWorktopDetails;

{$R *.dfm}

procedure TfrmWTLUWorktopDetails.FormCreate(Sender: TObject);
begin
  dblkpMaterialType.keyvalue :=1;
end;

procedure TfrmWTLUWorktopDetails.FormActivate(Sender: TObject);
begin
  lkpMatType.active := true;

  dblkpMaterialTypeClick(Self);
  edtName.SetFocus;
end;

procedure TfrmWTLUWorktopDetails.dblkpMaterialTypeClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmWTLUWorktopDetails.RefreshData;
begin
  with qryWorktops do
    begin
      close;
      parambyname('Material_Type').asinteger := lkpMatType.fieldbyname('Material_type').asinteger;
      parambyname('Description').asstring :=  '%' + edtName.Text + '%';
      if chkbxshowinactive.checked then
        parambyname('inactive').asstring := 'Y'
      else
        parambyname('inactive').asstring := 'N';
      open;
      stsbrDetails.panels[0].text := inttostr(recordcount) + ' records displayed';
    end;
end;

procedure TfrmWTLUWorktopDetails.SpeedButton2Click(Sender: TObject);
begin
  dblkpMaterialType.keyvalue := 0;
  refresh;
end;

procedure TfrmWTLUWorktopDetails.tmrRefreshTimer(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  RefreshData;
end;

procedure TfrmWTLUWorktopDetails.edtNameChange(Sender: TObject);
begin
  tmrRefresh.Enabled := False;
  tmrRefresh.Enabled := True;
end;

procedure TfrmWTLUWorktopDetails.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportToExcel(frmWTLUWorktopDetails);
end;

procedure TfrmWTLUWorktopDetails.srcLUWorktopsDataChange(Sender: TObject;
  Field: TField);
begin
  btnEdit.Enabled := (srcLUWorktops.DataSet.recordcount > 0);
  btnDelete.Enabled := (srcLUWorktops.DataSet.recordcount > 0);
  btnThickness.Enabled := (srcLUWorktops.DataSet.recordcount > 0);
  btnExcel.Enabled := (srcLUWorktops.DataSet.recordcount > 0);

end;

procedure TfrmWTLUWorktopDetails.chkbxShowInactiveClick(Sender: TObject);
begin
  refreshData;
end;

procedure TfrmWTLUWorktopDetails.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUWorktopDetails.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
  iThickness: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  frmWTMaintWorktopDetails := TfrmWTMaintWorktopDetails.create(Application);
  try
    iCode := dbgDetails.datasource.dataset.fieldbyname('Worktop').asinteger;
    iThickness := dbgDetails.datasource.dataset.fieldbyname('Thickness').asinteger;

    frmWTMaintWorktopDetails.FunctionMode := FuncMode;
    frmWTMaintWorktopDetails.showmodal;
    RefreshData;
    qryWorktops.Locate('Worktop',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintWorktopDetails.free;
  end;
end;

end.
