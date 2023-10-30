unit wtLUPromotions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ExtCtrls, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmwtLUPromotions = class(TForm)
    dbgDetails: TDBGrid;
    srcPromotions: TDataSource;
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    chkbxShowInactive: TCheckBox;
    btnExcel: TBitBtn;
    qryPromotions: TFDQuery;
    qryDelete: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExcelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteFromDB(Promotion: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmwtLUPromotions: TfrmwtLUPromotions;

implementation

uses
  System.UITypes, System.Types,
  wtMain, wtMaintPromotions;

{$R *.dfm}

procedure TfrmwtLUPromotions.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmwtLUPromotions.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  if FuncMode = 'A' then
    iCode := 0
  else
    iCode := dbgDetails.datasource.dataset.fieldbyname('Promotion_Code').asinteger;
    
  try
    frmWTMaintPromotions := TfrmWTMaintPromotions.create(Application);
    frmWTMaintPromotions.FunctionMode := FuncMode;
    frmWTMaintPromotions.showmodal;
    iCode := frmWTMaintPromotions.iCode;
    Refresh;
    qryPromotions.Locate('Promotion_Code',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintPromotions.free;
  end;
end;

procedure TfrmwtLUPromotions.btnEditClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmwtLUPromotions.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        with qryDelete do
          begin
            close;
            SQL.Text := 'DELETE FROM Promotion WHERE Promotion_Code = ' + inttostr(dbgDetails.DataSource.dataset.fieldbyname('Promotion_Code').asinteger);
            execsql;
          end;
        refresh;
      except
        messagedlg(dbgDetails.DataSource.dataset.fieldbyname('Promotion_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation,
        [mbOk], 0);
      end;
    end;
end;

procedure TfrmwtLUPromotions.DeleteFromDB(Promotion: integer);
begin
  with qryDelete do
    begin
      close;
      parambyname('Promotion_Code').asinteger := Promotion;
      execsql;
    end;
end;

procedure TfrmwtLUPromotions.BitBtn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmwtLUPromotions.dbgDetailsDblClick(Sender: TObject);
begin
  btnEditclick(self);
end;

procedure TfrmwtLUPromotions.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUPromotions.Refresh;
begin
  qryPromotions.close;
  if not chkbxShowInactive.Checked then
    begin
      qryPromotions.parambyname('inactive').asstring := 'N';
    end
  else
    begin
      qryPromotions.parambyname('inactive').asstring := 'Y';
    end;

  qryPromotions.open;
  stsbrDetails.panels[0].text := inttostr(qryPromotions.recordcount) + ' records displayed';
end;

procedure TfrmwtLUPromotions.FormActivate(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmwtLUPromotions.FormCreate(Sender: TObject);
begin
  stsbrDetails.Top := Screen.Height - stsbrDetails.Height;
end;

procedure TfrmwtLUPromotions.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmwtLUPromotions.btnExcelClick(Sender: TObject);
begin
 frmWTMain.ExportTableToExcel(frmWTLUPromotions);
end;

end.
