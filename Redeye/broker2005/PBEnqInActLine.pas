(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Enquiry inactive Lines Form

VSS Info:
$Header: /PBL D5/PBEnqInActLine.pas 6     26/07/:1 11:07 Paul $
$History: PBEnqInActLine.pas $
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 26/07/:1   Time: 11:07
 * Updated in $/PBL D5
 * Changed to set the correct parameter to maintain the Enquiry Inactive
 * reasons on the Reason Maintenance screen.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 28/09/:0   Time: 11:36
 * Updated in $/PBL D5
 * Add look-up button to access Reason code maintenance.
 * 
 * *****************  Version 4  *****************
 * User: Debbies      Date: 19/01/:0   Time: 13:44
 * Updated in $/PBL D5
 * 
 * *****************  Version 3  *****************
 * User: Debbies      Date: 19/01/:0   Time: 10:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Debbies      Date: 17/01/:0   Time: 16:30
 * Updated in $/PBL D5
 * Accessible in either inactive or active mode from PBLUEnqFrm
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqInActLine;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, Grids, Buttons, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqInActLineFrm = class(TForm)
    EnqLinesStringGrid: TStringGrid;
    GetReasonsSQL: TFDQuery;
    ReasonsSRC: TDataSource;
    ReasonsDBLUCB: TDBLookupComboBox;
    Label1: TLabel;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    UpdActiveLineSQL: TFDQuery;
    UpdActiveHeadSQL: TFDQuery;
    EnqNoDBText: TDBText;
    GetDetsSQL: TFDQuery;
    GDetsSQL: TFDQuery;
    DetsSRC: TDataSource;
    DescDBText: TDBText;
    GDetsSQLEnquiry: TIntegerField;
    GDetsSQLDescription: TStringField;
    UpdInActiveSQL: TFDQuery;
    ReasMntBitBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure EnqLinesStringGridSelectCell(Sender: TObject; Col,
      Row: Longint; var CanSelect: Boolean);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure EnqLinesStringGridDrawCell(Sender: TObject; Col,
      Row: Longint; Rect: TRect; State: TGridDrawState);
    procedure ReasonsDBLUCBClick(Sender: TObject);
    procedure ReasMntBitBtnClick(Sender: TObject);
  private
    { Private declarations }
    iRowCount, iSelRow: Integer;
    sMark: string;
  public
    { Public declarations }
    iEnqNum: Integer;
    bSelected: ByteBool;
    b_inactive: Boolean;
  end;

var
  PBEnqInActLineFrm: TPBEnqInActLineFrm;
implementation

uses PBLUReasCode;

{$R *.DFM}

procedure TPBEnqInActLineFrm.FormActivate(Sender: TObject);
begin
  bSelected := True;
  sMark := '**';
  {Load up the grid}
  EnqLinesStringGrid.Cells[0, 0] := 'Line';
  EnqLinesStringGrid.Cells[1, 0] := 'Description';
  EnqLinesStringGrid.Cells[2, 0] := 'Status';
  EnqLinesStringGrid.Cells[3, 0] := 'Mk';
  iRowCount := 0;

  with GDetsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := iEnqNum;
    Open;
  end;

  with GetDetsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := iEnqNum;
    if b_inactive then
     ParamByName('Enq_Inactive').AsString := 'N'
    else
     ParamByName('Enq_Inactive').AsString := 'Y';
    Open;
    First;
    while (not EOF) do
    begin
      iRowCount := iRowCount + 1;
      EnqLinesStringGrid.Cells[0, iRowCount] :=
        IntToStr(FieldByName('Line').AsInteger);
      EnqLinesStringGrid.Cells[1, iRowCount] :=
        FieldByName('Form_Description').AsString;
      EnqLinesStringGrid.Cells[2, iRowCount] :=
        FieldByName('Description').AsString;
      EnqLinesStringGrid.Cells[3, iRowCount] := '';
      Next;
    end;
  end;
  if iRowCount > 0 then
  begin
    EnqLinesStringGrid.RowCount := iRowCount + 1;
  end
  else
  begin
    EnqLinesStringGrid.RowCount := 2;
    EnqLinesStringGrid.Cells[0, iRowCount] := '';
    EnqLinesStringGrid.Cells[1, iRowCount] := '';
    EnqLinesStringGrid.Cells[2, iRowCount] := '';
    EnqLinesStringGrid.Cells[3, iRowCount] := '';
  end;
  iSelRow := 0;
  GetReasonsSQL.Close;
  GetReasonsSQL.Open;
  ReasonsDBLUCB.KeyValue := 0;
  CheckOK(Self);
  ReasonsDBLUCB.visible := False;
  Label1.visible := False;
  if b_inactive = false then
  begin
   PBEnqInActLineFrm.Caption := 'Make Enquiry Inactive';
   ReasonsDBLUCB.visible := True;
   Label1.visible := True;
  end
 else
  PBEnqInActLineFrm.Caption := 'Make Enquiry Active';
end;

procedure TPBEnqInActLineFrm.EnqLinesStringGridSelectCell(Sender: TObject;
  Col, Row: Longint; var CanSelect: Boolean);
begin
  iSelRow := Row;
  if EnqLinesStringGrid.Cells[3, iSelRow] = sMark then
    EnqLinesStringGrid.Cells[3, iSelRow] := ''
  else
    EnqLinesStringGrid.Cells[3, iSelRow] := sMark;
  CheckOK(Self);
end;

procedure TPBEnqInActLineFrm.CheckOK(Sender: TObject);
var
  TempMark: ByteBool;
  TempCount: Integer;
begin
  TempMark := False;
  for TempCount := 1 to iRowCount do
    if EnqLinesStringGrid.Cells[3, TempCount] = sMark then
      TempMark := True;
  if b_inactive = false then
     OKBitBtn.Enabled := (TempMark) and (ReasonsDBLUCB.KeyValue <> 0)
  else
     OKBitBtn.Enabled := (TempMark);
end;

procedure TPBEnqInActLineFrm.OKBitBtnClick(Sender: TObject);
var
  TempCount: Integer;
begin
  bSelected := True;
  for TempCount := 1 to iRowCount do
  begin
     if b_Inactive = False then
     begin
       with UpdActiveLineSQL do
         begin
           Close;
           ParamByName('Enquiry').AsInteger := iEnqNum;
           ParamByName('Line').AsInteger := StrToInt(EnqLinesStringGrid.Cells[0,
             TempCount]);
           ParamByName('Enq_Inactive_Reason').AsInteger := ReasonsDBLUCB.KeyValue;
           ParamByName('Enq_Inactive_Date').AsDateTime := Date;
           ExecSQL;
         end;
     end
    else
    begin
       with UpdInActiveSQL do
         begin
           Close;
           ParamByName('Enquiry').AsInteger := iEnqNum;
           ParamByName('Line').AsInteger := StrToInt(EnqLinesStringGrid.Cells[0,
             TempCount]);
           ExecSQL;
         end;
    end;
  end;
  with GetDetsSQL do
  begin
    Close;
    ParamByName('Enquiry').AsInteger := iEnqNum;
    ParamByName('Enq_Inactive').AsString := 'Y';
    Open;
    if RecordCount = 0 then
    begin
      with UpdActiveHeadSQL do
      begin
        Close;
        ParamByName('Enquiry').AsInteger := iEnqNum;
        ParamByName('Enq_Inactive').AsString := 'Y';
        ExecSQL;
      end;
    end
   else
    begin
      with UpdActiveHeadSQL do
      begin
        Close;
        ParamByName('Enquiry').AsInteger := iEnqNum;
        ParamByName('Enq_Inactive').AsString := 'N';
        ExecSQL;
      end;
    end
  end;
end;

procedure TPBEnqInActLineFrm.EnqLinesStringGridDrawCell(Sender: TObject;
  Col, Row: Longint; Rect: TRect; State: TGridDrawState);
var
  Txt: array[0..255] of Char;
begin
  {The following is code extracted from the Delphi Info Base}
  {Display the Columns Right justified in the cells}
  if (Col < 1) then
  begin
    StrPCopy(Txt, EnqLinesStringGrid.Cells[Col, Row]);
    SetTextAlign(EnqLinesStringGrid.Canvas.Handle,
      GetTextAlign(EnqLinesStringGrid.Canvas.Handle)
      and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
    ExtTextOut(EnqLinesStringGrid.Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
      ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end
  else
  begin
    StrPCopy(Txt, EnqLinesStringGrid.Cells[Col, Row]);
    SetTextAlign(EnqLinesStringGrid.Canvas.Handle,
      GetTextAlign(EnqLinesStringGrid.Canvas.Handle)
      and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
    ExtTextOut(EnqLinesStringGrid.Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
      ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end;
end;

procedure TPBEnqInActLineFrm.ReasonsDBLUCBClick(Sender: TObject);
begin
  CheckOK(Self);
end;

procedure TPBEnqInActLineFrm.ReasMntBitBtnClick(Sender: TObject);
begin
PBLUReasCodeFrm := TPBLUReasCodeFrm.Create(self) ;
  try
    PBLUReasCodeFrm.bIs_Lookup := False ;
    PBLUReasCodeFrm.bAllow_Upd := True ;
    PBLUReasCodeFrm.SelCode := 0 ;
    PBLUReasCodeFrm.iGroupSelect := 1 ;
    PBLUReasCodeFrm.ShowModal ;
  finally
    PBLUReasCodeFrm.Free ;
  end;
  GetReasonsSQL.Active := False;
  GetReasonsSQL.Active := True;
end;

end.
