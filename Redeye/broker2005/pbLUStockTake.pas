unit pbLUStockTake;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUStocktake = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnRun: TButton;
    Button2: TButton;
    lstvwReports: TListView;
    procedure Button2Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure lstvwReportsDblClick(Sender: TObject);
  private
    procedure RunReport(TempForm: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUStocktake: TfrmPBLUStocktake;

implementation

uses
  STStkTkSl, STStkTkSel;

{$R *.DFM}

procedure TfrmPBLUStocktake.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUStocktake.btnRunClick(Sender: TObject);
var
  sTemp: string;
begin
  sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
  RunReport(sTemp);
end;

procedure TfrmPBLUStocktake.RunReport(TempForm: string);
begin
  //Print Worksheet
  if TempForm = 'STSTKTKSLFRM' then
  begin
    STStkTkSlFrm := TSTStkTkSlFrm.Create(self);
    try
      STStkTkSlFrm.showmodal;
    finally
      STStkTkSlFrm.free;
    end
  end
  else
  //Freeze Stock Count
  if TempForm = 'STSTKTKSELFRM1' then
  begin
    STStkTkSelFrm := TSTStkTkSelFrm.Create(self);
    try
      STStkTkSelFrm.fMaintmode := 'F';
      STStkTkSelFrm.showmodal;
    finally
      STStkTkSelFrm.free;
    end
  end
  else
  // Enter Stocktake Count
  if TempForm = 'STSTKTKSELFRM2' then
  begin
    STStkTkSelFrm := TSTStkTkSelFrm.Create(self);
    try
      STStkTkSelFrm.fMaintmode := 'E';
      STStkTkSelFrm.showmodal;
    finally
      STStkTkSelFrm.free;
    end
  end
  else
  //Run Stocktake Valuation
  if TempForm = 'STSTKTKSELFRM3' then
  begin
    STStkTkSelFrm := TSTStkTkSelFrm.Create(self);
    try
      STStkTkSelFrm.fMaintmode := 'R';
      STStkTkSelFrm.bIs_VariancePrint := False;
      STStkTkSelFrm.showmodal;
    finally
      STStkTkSelFrm.free;
    end
  end
  else
  //Run Stock Count Varaiance Report
  if TempForm = 'STSTKTKSELFRM4' then
  begin
    STStkTkSelFrm := TSTStkTkSelFrm.Create(self);
    try
      STStkTkSelFrm.fMaintmode := 'R';
      STStkTkSelFrm.bIs_VariancePrint := True;
      STStkTkSelFrm.showmodal;
    finally
      STStkTkSelFrm.free;
    end
  end
  else
  //Update Stock Count figures
  if TempForm = 'STSTKTKSELFRM5' then
  begin
    STStkTkSelFrm := TSTStkTkSelFrm.Create(self);
    try
      STStkTkSelFrm.fMaintmode := 'U';
      STStkTkSelFrm.showmodal;
    finally
      STStkTkSelFrm.free;
    end
  end;
end;

procedure TfrmPBLUStocktake.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

end.
