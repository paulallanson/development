unit pbLUStockRpts;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls;

type
  TfrmPBLUStockRpts = class(TForm)
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
  frmPBLUStockRpts: TfrmPBLUStockRpts;

implementation

uses STRSSTKBalRep, StMovSl, STRSSlwMvngStkRep, STNegStksl, STRSStkVal,
  STRSAgedStk, STRSSalesByCust, STRSSOHistory, STRSWorkIP, STRSCustStkBal,
  STRSCustProdUsage, STPartSuppSel, STRSUnpaidStock, STMaintAgedStk, STRSStockUsage,
  STRSStockReturns, STRSProductList, STRSStockVal;

{$R *.DFM}

procedure TfrmPBLUStockRpts.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmPBLUStockRpts.btnRunClick(Sender: TObject);
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

procedure TfrmPBLUStockRpts.RunReport(TempForm: string);
begin
  if TempForm = 'STRSSTKVALFRM' then
  begin
    STRSStkValfrm := TSTRSStkValfrm.Create(self);
    try
      STRSStkValfrm.showmodal;
    finally
      STRSStkValfrm.free;
    end
  end
  else
  if TempForm = 'STNEGSTKSLFRM' then
  begin
    STNegStkslfrm := TSTNegStkslfrm.Create(self);
    try
      STNegStkslfrm.showmodal;
    finally
      STNegStkslfrm.free;
    end
  end
  else
  if TempForm = 'STRSSTOCKRETURNSFRM' then
  begin
    STRSStockReturnsfrm := TSTRSStockReturnsfrm.Create(self);
    try
      STRSStockReturnsfrm.showmodal;
    finally
      STRSStockReturnsfrm.free;
    end
  end
  else
  if TempForm = 'STRSSLWMVNGSTKREPFRM' then
  begin
    STRSSlwMvngStkRepfrm := TSTRSSlwMvngStkRepfrm.Create(self);
    try
      STRSSlwMvngStkRepfrm.showmodal;
    finally
      STRSSlwMvngStkRepfrm.free;
    end
  end
  else
  if TempForm = 'STMOVSLFRM' then
  begin
    STMovSlfrm := TSTMovSlfrm.Create(self);
    try
      STMovSlfrm.showmodal;
    finally
      STMovSlfrm.free;
    end
  end
  else
  if TempForm = 'STRSSTKBALREPFRM' then
  begin
    STRSStkBalRepFrm := TSTRSStkBalRepFrm.Create(self);
    try
      STRSStkBalRepFrm.showmodal;
    finally
      STRSStkBalRepFrm.free;
    end
  end
  else
  if TempForm = 'STRSAGEDSTKFRM' then
  begin
    STRSAgedStkFrm := TSTRSAgedStkFrm.Create(self);
    try
      STRSAgedStkFrm.showmodal;
    finally
      STRSAgedStkFrm.free;
    end
  end
  else
  if TempForm = 'STRSSALESBYCUSTFRM' then
  begin
    STRSSalesByCustFrm := TSTRSSalesByCustFrm.Create(self);
    try
      STRSSalesByCustFrm.showmodal;
    finally
      STRSSalesByCustFrm.free;
    end
  end
  else
  if TempForm = 'STRSSOHISTORYFRM' then
  begin
    STRSSOHistoryFrm := TSTRSSOHistoryFrm.Create(self);
    try
      STRSSOHistoryFrm.showmodal;
    finally
      STRSSOHistoryFrm.free;
    end
  end
  else
  if TempForm = 'STRSWORKIPFRM' then
  begin
    STRSWorkIPfrm := TSTRSWorkIPfrm.Create(self);
    try
      STRSWorkIPFrm.showmodal;
    finally
      STRSWorkIPFrm.free;
    end
  end
  else
  if TempForm = 'STRSCUSTSTKBALFRM' then
  begin
    STRSCustStkBalFrm := TSTRSCustStkBalFrm.Create(self);
    try
      STRSCustStkBalFrm.showmodal;
    finally
      STRSCustStkBalFrm.free;
    end
  end
  else
  if TempForm = 'STRSCUSTPRODUSAGEFRM' then
  begin
    STRSCustProdUsagefrm := TSTRSCustProdUsagefrm.Create(self);
    try
      STRSCustProdUsagefrm.showmodal;
    finally
      STRSCustProdUsagefrm.free;
    end
  end
  else
  if TempForm = 'STRSSTOCKUSAGEFRM' then
  begin
    STRSStockUsagefrm := TSTRSStockUsagefrm.Create(self);
    try
      STRSStockUsagefrm.showmodal;
    finally
      STRSStockUsagefrm.free;
    end
  end
  else
  if TempForm = 'STRSSTOCKVALFRM' then
  begin
    STRSStockValfrm := TSTRSStockValfrm.Create(self);
    try
      STRSStockValfrm.showmodal;
    finally
      STRSStockValfrm.free;
    end
  end
  else
  if TempForm = 'STPARTSUPPSELFRM' then
  begin
    STPartSuppSelfrm := TSTPartSuppSelfrm.Create(self);
    try
      STPartSuppSelfrm.showmodal;
    finally
      STPartSuppSelfrm.free;
    end
  end
  else
  if TempForm = 'STRSUNPAIDSTOCKFRM' then
  begin
    STRSUnpaidStockfrm := TSTRSUnpaidStockfrm.Create(self);
    try
      STRSUnpaidStockfrm.showmodal;
    finally
      STRSUnpaidStockfrm.free;
    end
  end
  else
  if TempForm = 'STMAINTAGEDSTKFRM' then
  begin
    STMaintAgedStkfrm := TSTMaintAgedStkfrm.Create(self);
    try
      STMaintAgedStkfrm.showmodal;
    finally
      STMaintAgedStkfrm.free;
    end
  end
  else
  if TempForm = 'STRSPRODUCTLISTFRM' then
  begin
    STRSProductListfrm := TSTRSProductListfrm.Create(self);
    try
      STRSProductListfrm.showmodal;
    finally
      STRSProductListfrm.free;
    end
  end;
end;

procedure TfrmPBLUStockRpts.lstvwReportsDblClick(Sender: TObject);
begin
  btnRunClick(self);  
end;

procedure TfrmPBLUStockRpts.FormActivate(Sender: TObject);
begin
  lstvwReports.ItemIndex := 0;
end;

end.
