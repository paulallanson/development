(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  View Purchase Order History

VSS Info:
$Header:
$History:


*******************************************************************************)
unit PBPOrdHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, CCSCommon, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBPOrdHistFrm = class(TForm)
    strgrdOrdHist: TStringGrid;
    qrySelPOLine: TFDQuery;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure strgrdOrdHistDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    procedure InitialiseForm;
    procedure FillGrid;
  public
    { Public declarations }
    PONum: real;
    lineNo: integer;
  end;

var
  PBPOrdHistFrm: TPBPOrdHistFrm;

implementation

uses Types, pbMainMenu;

{$R *.DFM}

procedure TPBPOrdHistFrm.FillGrid;
var
  counter: integer;
  currentOrderNo: double;
  currentOrderLine: integer;
begin
  counter := 1;
  qrySelPOLine.close;
  qrySelPOLine.paramByName('Purchase_Order').asFloat := self.PONum;
  qrySelPOLine.paramByName('line').asInteger := self.lineNo;
  qrySelPOLine.open;

  while qrySelPOLine.FieldByName('Original_Order').asFloat <> 0 do
  begin
    if self.strgrdOrdHist.RowCount < counter + 1 then
      self.strgrdOrdHist.RowCount := counter + 1;

    if qrySelPOLine.FieldByName('Original_Order').asInteger = qrySelPOLine.FieldByName('Original_Order').asFloat then
      self.strgrdOrdHist.Cells[1, counter] := qrySelPOLine.FieldByName('Original_Order').asString
    else
      self.strgrdOrdHist.Cells[1, counter] := FloatToStrF(qrySelPOLine.FieldByName('Original_Order').asFloat, ffFixed, 15, 2);

    self.strgrdOrdHist.Cells[2, counter] :=
      qrySelPOLine.FieldByName('Original_Orderline').asString;

    self.strgrdOrdHist.Cells[3, counter] :=
      qrySelPOLine.FieldByName('Date_Point').asString;

    self.strgrdOrdHist.Cells[4, counter] :=
      qrySelPOLine.FieldByName('CustName').asString;

    self.strgrdOrdHist.Cells[5, counter] :=
      qrySelPOLine.FieldByName('cust_order_no').asString;

    self.strgrdOrdHist.Cells[6, counter] :=
      qrySelPOLine.FieldByName('customers_desc').asString;

    self.strgrdOrdHist.Cells[7, counter] :=
      qrySelPOLine.FieldByName('form_reference_id').asString;

    self.strgrdOrdHist.Cells[8, counter] :=
      qrySelPOLine.FieldByName('form_reference_descr').asString;

    self.strgrdOrdHist.Cells[9, counter] :=
      qrySelPOLine.FieldByName('quantity').asString;

    self.strgrdOrdHist.Cells[10, counter] := '£' +
      qrySelPOLine.FieldByName('selling_price').asString + ' ' +
      qrySelPOLine.FieldByName('sell_unit').asString;

    self.strgrdOrdHist.Cells[11, counter] := '£' +
      qrySelPOLine.FieldByName('order_price').asString + ' ' +
      qrySelPOLine.FieldByName('order_unit').asString;

    self.strgrdOrdHist.Cells[12, counter] :=
      qrySelPOLine.FieldByName('Goods_reqd_by_customer').asString;

    self.strgrdOrdHist.Cells[13, counter] :=
      qrySelPOLine.FieldByName('repname').asString;


    currentOrderNo := qrySelPOLine.FieldByName('Original_Order').asFloat;
    currentOrderLine := qrySelPOLine.FieldByName('Original_Orderline').asInteger;
    counter := counter + 1;

    qrySelPOLine.close;
    qrySelPOLine.paramByName('Purchase_Order').asFloat := currentOrderNo;
    qrySelPOLine.paramByName('line').asInteger := currentOrderLine;
    qrySelPOLine.open;
  end;
  qrySelPOLine.close;
end;

procedure TPBPOrdHistFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBPOrdHistFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;

  for var i := 0 to strgrdOrdHist.ColCount-1 do
  begin
    if not (i in [0,4,5,6,11]) then
      strgrdOrdHist.ColAlignments[i] := taRightJustify;
  end;

  InitialiseForm;
end;

procedure TPBPOrdHistFrm.FormResize(Sender: TObject);
begin
  self.strgrdOrdHist.Repaint;
end;

procedure TPBPOrdHistFrm.InitialiseForm;
begin
  if Int(self.PONum) = self.PONum then
    self.Caption := self.Caption + ' for Purchase Order: ' + FloatToStr(self.PONum)
  else
    self.Caption := self.Caption + ' for Purchase Order: ' + FloatToStrF(self.PONum, ffFixed, 15, 2);

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
  //look up and display order history
  self.strgrdOrdHist.Cells[1,0] := 'Order';
  self.strgrdOrdHist.Cells[2,0] := 'Line';
  self.strgrdOrdHist.Cells[3,0] := 'Date';
  self.strgrdOrdHist.Cells[4,0] := 'Customer';
  self.strgrdOrdHist.Cells[5,0] := 'Cust. Ref.';
  self.strgrdOrdHist.Cells[6,0] := 'Description';
  self.strgrdOrdHist.Cells[7,0] := 'Form Ref.';
  self.strgrdOrdHist.Cells[8,0] := 'Form Ref. Description';
  self.strgrdOrdHist.Cells[9,0] := 'Quantity';
  self.strgrdOrdHist.Cells[10,0] := 'Sales Price';
  self.strgrdOrdHist.Cells[11,0] := 'Order Price';
  self.strgrdOrdHist.Cells[12,0] := 'Date Req.';
  self.strgrdOrdHist.Cells[13,0] := 'Rep';

  self.strgrdOrdHist.ColWidths[0] := 10;
  self.strgrdOrdHist.ColWidths[1] := 38;
  self.strgrdOrdHist.ColWidths[2] := 28;
  self.strgrdOrdHist.ColWidths[3] := 70;
  self.strgrdOrdHist.ColWidths[4] := 121;
  self.strgrdOrdHist.ColWidths[5] := 64;
  self.strgrdOrdHist.ColWidths[6] := 135;
  self.strgrdOrdHist.ColWidths[7] := 64;
  self.strgrdOrdHist.ColWidths[8] := 135;
  self.strgrdOrdHist.ColWidths[9] := 62;
  self.strgrdOrdHist.ColWidths[10] := 115;
  self.strgrdOrdHist.ColWidths[11] := 115;
  self.strgrdOrdHist.ColWidths[12] := 70;
  self.strgrdOrdHist.ColWidths[13] := 60;

  self.FillGrid;
end;

procedure TPBPOrdHistFrm.strgrdOrdHistDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  {The following is code extracted from the Delphi Info Base}
  {If Heading Display Left justified in the cells}
  if (ACol = 4) or (ACol = 5) or (ACol = 6) or (ACol = 11) or (ARow = 0)then
  begin
    StrPCopy(Txt, (Sender as TStringGrid).Cells[ACol, ARow]);
    SetTextAlign((Sender as TStringGrid).Canvas.Handle,
      GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
    ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
      ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end
  else
  begin
    {Display the Columns Right justified in the cells}
    StrPCopy(Txt, (Sender as TStringGrid).Cells[ACol, ARow]);
    SetTextAlign((Sender as TStringGrid).Canvas.Handle,
      GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
    ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
      ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end;
end;

end.
