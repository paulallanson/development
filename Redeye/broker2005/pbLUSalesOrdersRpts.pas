unit pbLUSalesOrdersRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUSalesOrdersRpts = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnRun: TButton;
    Button2: TButton;
    lstvwReports: TListView;
    procedure Button2Click(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure lstvwReportsDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    iLastIndex: integer;
    procedure RunReport(TempForm: string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPBLUSalesOrdersRpts: TfrmPBLUSalesOrdersRpts;

implementation

uses STRSWorkIP, STRSProfitRep, STRSSalesByCust, STRSSOHistory, STRSSOrderDeliv,
  STRSSOReturns, STRSSalesHistory;

{$R *.DFM}

procedure TfrmPBLUSalesOrdersRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUSalesOrdersRpts.btnRunClick(Sender: TObject);
var
  sTemp: string;
begin
  try
    sTemp := lstvwReports.items.item[lstvwReports.selected.index].SubItems[0];
    iLastIndex := lstvwReports.itemindex;
  except
    sTemp := lstvwReports.items.item[iLastIndex].SubItems[0];
  end;

  RunReport(sTemp);
end;

procedure TfrmPBLUSalesOrdersRpts.RunReport(TempForm: string);
begin
  if TempForm = 'STRSWORKIPFRM' then
  begin
    STRSWorkIPfrm := TSTRSWorkIPfrm.Create(self);
    try
      STRSWorkIPfrm.showmodal;
    finally
      STRSWorkIPfrm.free;
    end
  end
  else
  if TempForm = 'STRSPROFITREPFRM' then
  begin
    STRSProfitRepfrm := TSTRSProfitRepfrm.Create(self);
    try
      STRSProfitRepfrm.showmodal;
    finally
      STRSProfitRepfrm.free;
    end
  end
  else
  if TempForm = 'STRSSORETURNSFRM' then
  begin
    STRSSOReturnsfrm := TSTRSSOReturnsfrm.Create(self);
    try
      STRSSOReturnsfrm.showmodal;
    finally
      STRSSOReturnsfrm.free;
    end
  end
  else
  if TempForm = 'STRSSORDERDELIVFRM' then
  begin
    STRSSOrderDelivfrm := TSTRSSOrderDelivfrm.Create(self);
    try
      STRSSOrderDelivfrm.showmodal;
    finally
      STRSSOrderDelivfrm.free;
    end
  end
  else
  if TempForm = 'STRSSOHISTORYFRM' then
  begin
    STRSSOHistoryfrm := TSTRSSOHistoryfrm.Create(self);
    try
      STRSSOHistoryfrm.showmodal;
    finally
      STRSSOHistoryfrm.free;
    end
  end
  else
  if TempForm = 'STRSSALESHISTORYFRM' then
  begin
    STRSSalesHistoryfrm := TSTRSSalesHistoryfrm.Create(self);
    try
      STRSSalesHistoryfrm.showmodal;
    finally
      STRSSalesHistoryfrm.free;
    end
  end
  else
  if TempForm = 'STRSSALESBYCUSTFRM' then
  begin
    STRSSalesByCustfrm := TSTRSSalesByCustfrm.Create(self);
    try
      STRSSalesByCustfrm.showmodal;
    finally
      STRSSalesByCustfrm.free;
    end
  end;

end;

procedure TfrmPBLUSalesOrdersRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);
end;

procedure TfrmPBLUSalesOrdersRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
