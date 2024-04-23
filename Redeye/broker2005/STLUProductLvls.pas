unit STLUProductLvls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSTLUProductLvls = class(TForm)
    Button1: TButton;
    btnChange: TButton;
    btnClose: TButton;
    dbgDetails: TDBGrid;
    qryStoreLevels: TFDQuery;
    dtsStoreLevels: TDataSource;
    qryStoreLevelsPart: TWideStringField;
    qryStoreLevelsPart_Store_Type: TIntegerField;
    qryStoreLevelsMinimum_Stock: TIntegerField;
    qryStoreLevelsMaximum_Stock: TIntegerField;
    qryStoreLevelsPurchase_Or_Store: TWideStringField;
    qryStoreLevelsReplenish_Store: TIntegerField;
    qryStoreLevelsReorder_Level: TIntegerField;
    qryStoreLevelsPart_Store_type_Name: TWideStringField;
    qryStoreLevelsReplenish_type: TWideStringField;
    procedure qryStoreLevelsCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    function GetHeaderCount: integer;
  private
    procedure Refreshdata;
    procedure CallMaintScreen(sTempFuncMode: string);
    property HeaderCount: integer read GetHeaderCount;
  public
    sPart: string;
  end;

var
  frmSTLUProductLvls: TfrmSTLUProductLvls;

implementation

uses STMaintProductLvls, pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TfrmSTLUProductLvls.qryStoreLevelsCalcFields(DataSet: TDataSet);
begin
  if qryStoreLevels.fieldbyname('Purchase_or_Store').asstring = 'P'
    then qryStoreLevelsReplenish_Type.Text := 'Purchase'
  else
    qryStoreLevelsReplenish_Type.Text := 'Store';
end;

procedure TfrmSTLUProductLvls.Refreshdata;
begin
  with qryStoreLevels do
    begin
      close;
      parambyname('Part').asstring := sPart;
      open;
    end;
end;

procedure TfrmSTLUProductLvls.FormShow(Sender: TObject);
begin
  Refreshdata;
end;

procedure TfrmSTLUProductLvls.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSTLUProductLvls.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmSTLUProductLvls.CallMaintScreen(sTempFuncMode: string);
var
  bTempOK: ByteBool;
  iTemp: integer;
begin
  frmSTMaintProductLvls := TfrmSTMaintProductLvls.Create(Self);
  try
    frmSTMaintProductLvls.sFuncMode := sTempFuncMode;

    frmSTMaintProductLvls.sPart := sPart;
    frmSTMaintProductLvls.iPartStoreType := dbgDetails.datasource.dataset.fieldbyname('Part_Store_type').asinteger;
    frmSTMaintProductLvls.sStoreType := dbgDetails.datasource.dataset.fieldbyname('Part_Store_type_name').asstring;
    frmSTMaintProductLvls.ShowModal;
    bTempOK := (frmSTMaintProductLvls.ModalResult = mrOK);
    if bTempOK then
      begin
        iTemp := frmSTMaintProductLvls.iPartStoreType;
        refreshdata;
        dbgDetails.DataSource.DataSet.Locate('Part_Store_type', Variant(inttostr(iTemp)),[lopartialKey]) ;
      end;
  finally
    frmSTMaintProductLvls.Free;
  end;
end;
procedure TfrmSTLUProductLvls.Button1Click(Sender: TObject);
begin
  CallMaintScreen('A');

end;

procedure TfrmSTLUProductLvls.SetButtons(Sender: TObject; Field: TField);
begin
  btnChange.enabled := HeaderCount > 0;
end;
function TfrmSTLUProductLvls.GetHeaderCount: integer;
begin
    result := qryStoreLevels.recordcount
end;

procedure TfrmSTLUProductLvls.FormCreate(Sender: TObject);
begin
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmPBMainMenu.iOperator,0,0) ;
end;

end.
