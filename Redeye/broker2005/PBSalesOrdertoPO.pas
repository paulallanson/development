unit PBSalesOrdertoPO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, StdCtrls, Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBSalesOrdertoPOFrm = class(TForm)
    Panel1: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    dbgDetails: TDBGrid;
    qryDirectSO: TFDQuery;
    dtsDirectSO: TDataSource;
    AllBitBtn: TBitBtn;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AllBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  PBSalesOrdertoPOFrm: TPBSalesOrdertoPOFrm;

implementation

uses UITypes, STSOObjects, STPOObjects, STSODataMod, STPODataMod;

{$R *.dfm}

procedure TPBSalesOrdertoPOFrm.FormActivate(Sender: TObject);
begin
  with qryDirectSO do
    begin
      close;
      open;
      if recordcount > 0 then
        dbgDetails.SelectedRows.CurrentRowSelected := True ;
    end;
  enableOK(self);
end;

procedure TPBSalesOrdertoPOFrm.AllBitBtnClick(Sender: TObject);
begin
  with qryDirectSO do
    begin
      First ;
      while eof <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := True ;
          next ;
        end;
    end;
end;

procedure TPBSalesOrdertoPOFrm.EnableOK(Sender: TObject);
begin
  OKbitBtn.enabled := dbgDetails.SelectedRows.Count > 0;
end;

procedure TPBSalesOrdertoPOFrm.OKBitBtnClick(Sender: TObject);
var
  icount: integer;
  SalesOrder : TSalesOrder;
  PO : TPurchaseOrder;
  STSalesOrdDM : TSTSalesOrdDM;
  STPODM : TSTPODM;
begin
  //show warning and ask if user wants to proceed.
  if MessageDlg('You are about to raise Purchase Orders for the selected Sales Orders.'+#10#13+
                'Do you want to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  STSalesOrdDM := TSTSalesOrdDM.Create(Self);
  STPODM := TSTPODM.Create(Self);

  try
    for icount := 0 to (dbgDetails.SelectedRows.Count - 1) do
    begin
      dtsDirectSO.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount])) ;
      with dtsDirectSO.DataSet do
        begin
          //create SO object and load data from database
          SalesOrder := TSalesOrder.Create(STSalesOrdDM);
          try
            SalesOrder.SONumber := fieldbyname('Sales_Order').AsInteger;
            STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
            STSalesOrdDM.LoadExtChgOrd(SalesOrder);

            //create PO object from SO
            PO := TPurchaseOrder.Create(SalesOrder, STPODM);
            try
              //Save PO to database
              PO.SaveToDB(STPODM);
            finally
              PO.free;
            end;

            //update SO status
            if SalesOrder.SOHeadStatus < 30 then
              SalesOrder.SOHeadStatus := 30;
            with STSalesOrdDM.qryUpdSoStatus do
              begin
                close;
                ParamByName('Status').AsInteger := SalesOrder.SOHeadStatus;
                ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
                ExecSQL;
              end;
          finally
            SalesOrder.free;
          end;
        end;
    end;
  finally
    STSalesOrdDM.Free;
    STPODM.Free;
  end;

  //display message showing PO number, no of lines and order value
  if icount = 1 then
    ShowMessage(inttostr(icount)+' new purchase order created successfully.')
  else
    ShowMessage(inttostr(icount)+' new purchase orders have been created successfully.');
  close;
end;

end.
