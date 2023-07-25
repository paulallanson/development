unit STLUPrtByCustOrder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ImgList, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls,
  ToolWin, System.ImageList;

type
  TSTLUPrtByCustOrderFrm = class(TForm)
    Panel1: TPanel;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    tlbtnSelect: TToolButton;
    ToolButton1: TToolButton;
    tlbtnClose: TToolButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CodeEdit: TEdit;
    StatusBar1: TStatusBar;
    EdtDesc: TEdit;
    Panel3: TPanel;
    PartsDBGrid: TDBGrid;
    PartsDataSource: TDataSource;
    GridTimer: TTimer;
    HotImageList2: TImageList;
    CoolImageList2: TImageList;
    qryPartsOnSOs: TQuery;
    qryPartsOnSOsFiltered: TQuery;
    procedure CodeEditKeyPress(Sender: TObject; var Key: Char);
    procedure CodeEditChange(Sender: TObject);
    procedure tlbtnSelectClick(Sender: TObject);
    procedure GridTimerTimer(Sender: TObject);
    procedure PartsDBGridDblClick(Sender: TObject);
    procedure EdtDescChange(Sender: TObject);
    procedure tlbtnCloseClick(Sender: TObject);
  private
    procedure RefreshGrid;
  public
    bOK: boolean;
    sCode, SCodeDescr: string;
  end;

var
  STLUPrtByCustOrderFrm: TSTLUPrtByCustOrderFrm;

implementation

{$R *.DFM}

procedure TSTLUPrtByCustOrderFrm.CodeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    tlbtnSelectClick(self);
end;

procedure TSTLUPrtByCustOrderFrm.CodeEditChange(Sender: TObject);
begin
  GridTimer.Enabled := False;

  GridTimer.Enabled := True;
end;

procedure TSTLUPrtByCustOrderFrm.tlbtnSelectClick(Sender: TObject);
begin
  sCode := PartsDataSource.DataSet.FieldByName('Part').AsString;
  sCodeDescr := PartsDataSource.DataSet.FieldByName('Part_Description').AsString;
  bOK := True;
  close;
end;

procedure TSTLUPrtByCustOrderFrm.GridTimerTimer(Sender: TObject);
begin
  self.RefreshGrid;
end;

procedure TSTLUPrtByCustOrderFrm.PartsDBGridDblClick(Sender: TObject);
begin
  if PartsDataSource.DataSet.RecordCount < 1 then Exit;

  begin
    tlbtnSelectClick(Self);
    Close;
  end;
end;

procedure TSTLUPrtByCustOrderFrm.EdtDescChange(Sender: TObject);
begin
  GridTimer.Enabled := False;

  GridTimer.Enabled := True;
end;

procedure TSTLUPrtByCustOrderFrm.RefreshGrid;
begin
  GridTimer.Enabled := False;
  if ((CodeEdit.Text <> '') or (EdtDesc.Text <> '')) then
  begin
    //user is narrowing down results by typing in part of a product code
    //need to switch query and redisplay grid.
    qryPartsOnSOsFiltered.close;
    qryPartsOnSOsFiltered.Params[0] :=  qryPartsOnSOs.Params[0];
    qryPartsOnSOsFiltered.Params[1] :=  qryPartsOnSOs.Params[1];
    qryPartsOnSOsFiltered.ParamByName('part').asString := CodeEdit.Text+'%';
    qryPartsOnSOsFiltered.ParamByName('partDesc').asString := '%'+EdtDesc.Text+'%';

    self.PartsDataSource.DataSet := self.qryPartsOnSOsFiltered;
    self.qryPartsOnSOsFiltered.open;
    self.StatusBar1.Panels[0].Text :=
      IntToStr(self.qryPartsOnSOsFiltered.RecordCount) +
      ' parts found.';
  end
  else
  begin
    qryPartsOnSOsFiltered.close;
    self.PartsDataSource.DataSet := self.qryPartsOnSOs;
    self.StatusBar1.Panels[0].Text :=
      IntToStr(self.qryPartsOnSOs.RecordCount) +
      ' parts found.';
  end;
end;

procedure TSTLUPrtByCustOrderFrm.tlbtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
