unit WTMaintSalesOrderRaisePO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls, wtSalesOrderDM,
  WTPurchasesDM;

type
  TfrmWTMaintSalesOrderRaisePO = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    dbgDetails: TDBGrid;
    Label3: TLabel;
    edtDateRequired: TEdit;
    btnDateRequired: TBitBtn;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    procedure CheckOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnDateRequiredClick(Sender: TObject);
    procedure edtDateRequiredExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    dtmdlPurchases: TdtmdlPurchaseOrder;
    FKey: integer;
    FSOLine: TSOLine;
    procedure SetKey(const Value: integer);
    procedure SetSOLine(const Value: TSOLine);
    function InputDate(TempDate: TDateTime): TDateTime;
    { Private declarations }
  public
    property Key: integer read FKey write SetKey;
    property SOLine: TSOLine read FSOLine write SetSOLine;
  end;

var
  frmWTMaintSalesOrderRaisePO: TfrmWTMaintSalesOrderRaisePO;

implementation

uses allCommon, DateSelV5, wtMain;

{$R *.dfm}

{ TfrmWTMaintSalesOrderRaisePO }

procedure TfrmWTMaintSalesOrderRaisePO.SetKey(const Value: integer);
begin
  FKey := Value;
end;

procedure TfrmWTMaintSalesOrderRaisePO.SetSOLine(const Value: TSOLine);
begin
  FSOLine := Value;
end;

procedure TfrmWTMaintSalesOrderRaisePO.FormActivate(Sender: TObject);
begin
  dbgDetails.datasource := SOLine.parent.datamodule.dtsgetQuoteSlabs;
  
  with SOLine.Parent.DataModule.qryGetQuoteSlabs do
    begin
      close;
      parambyname('Quote').asinteger := SOLine.Quote;
      open;
    end;
end;

procedure TfrmWTMaintSalesOrderRaisePO.CheckOK(Sender : TObject);
begin
  btnOK.enabled := (edtDateRequired.Text <> '');
end;

procedure TfrmWTMaintSalesOrderRaisePO.btnDateRequiredClick(
  Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtDateRequired.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtDateRequired.text;

  edtDateRequired.text := paDatestr(InputDate(paDateStr(tempdate)));
  CheckOK(self);
end;

function TfrmWTMaintSalesOrderRaisePO.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTMaintSalesOrderRaisePO.edtDateRequiredExit(
  Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);
end;

procedure TfrmWTMaintSalesOrderRaisePO.btnOKClick(Sender: TObject);
var
  aPOrder : TPOrder;
begin
  with SOLine.Parent.DataModule.qryGetQuoteSlabs do
    begin
      first;

      dtmdlPurchases := TdtmdlPurchaseOrder.create(Application);

      try
        while eof <> true do
          begin
            aPOrder := TPorder.Create(dtmdlPurchases);
            try
              dtmdlPurchases.Quote := fieldbyname('Quote').asinteger;
              dtmdlPurchases.Supplier := fieldbyname('Supplier').asinteger;
              dtmdlPurchases.SalesOrder := SOLine.Parent.dbKey;
              dtmdlPurchases.SalesOrderLineNo := SOLine.SOLNumber;
              aPorder.LoadFromQuoteSlabs;

              aPOrder.DateRequired := paDateStr(edtDateRequired.text);
              aPOrder.SaveToDB(true);
            finally
              aPOrder.Free;
            end;
            next;
          end;
      finally
        dtmdlPurchases.Free;
      end;
    end;
end;

end.
