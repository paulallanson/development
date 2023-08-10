unit wtUtilities;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTUtilities = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    rdgUtilities: TRadioGroup;
    qryCheckPrices: TFDQuery;
    qryCheckOrder: TFDQuery;
    qryCheckOrders: TFDQuery;
    procedure btnOKClick(Sender: TObject);
  private
    procedure CheckPrices;
    procedure DeleteHistory;
    procedure OrderIntegrity;
    procedure DeleteContractQuotes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWTUtilities: TfrmWTUtilities;

implementation

uses
  System.UITypes,
  WTDeleteHistory, WTDeleteContractQuotes;

{$R *.dfm}

procedure TfrmWTUtilities.btnOKClick(Sender: TObject);
begin
  if MessageDlg('Confirm that you wish to ' + rdgUtilities.Items[rdgUtilities.itemindex],
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  case rdgUtilities.itemindex of
    0: CheckPrices;
    1: OrderIntegrity;
    2: DeleteHistory;
    3: DeleteContractQuotes;
  end;

end;

procedure TfrmWTUtilities.DeleteContractQuotes;
begin
  frmWTDeleteContractQuotes := TfrmWTDeleteContractQuotes.create(self);
  try
    frmWTDeleteContractQuotes.showmodal;
  finally
    frmWTDeleteContractQuotes.free;
  end;
end;

procedure TfrmWTUtilities.DeleteHistory;
begin
  frmWTDeleteHistory := TfrmWTDeleteHistory.create(self);
  try
    frmWTDeleteHistory.showmodal;
  finally
    frmWTDeleteHistory.free;
  end;
end;

procedure TfrmWTUtilities.CheckPrices;
begin
  try
    with qryCheckPrices do
    begin
      close;
      execsql;
    end;
    MessageDlg('The integrity check has been successful.', mtInformation,[mbOk], 0);
    close;
  except
    MessageDlg('The integrity check has failed!', mterror,[mbOk], 0);
  end;
end;

procedure TfrmWTUtilities.OrderIntegrity;
begin
  try
    with qryCheckOrders do
    begin
      close;
      execsql;
    end;
    MessageDlg('The integrity check has been successful.', mtInformation,[mbOk], 0);
    close;
  except
    MessageDlg('The integrity check has failed!', mterror,[mbOk], 0);
  end;
end;
end.
