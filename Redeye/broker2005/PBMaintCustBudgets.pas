unit PBMaintCustBudgets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ComCtrls, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCustBudgetsfrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtFY: TEdit;
    StatusBar1: TStatusBar;
    sgDetails: TStringGrid;
    pnlBottom: TPanel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    qryCustomer: TFDQuery;
    qryPeriods: TFDQuery;
    qryDel: TFDQuery;
    qryAdd: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgDetailsDrawCell(Sender: TObject; vCol, vRow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure sgDetailsKeyPress(Sender: TObject; var Key: Char);
    procedure OKBitBtnClick(Sender: TObject);
  private
    procedure ClearGrid(TempGrid: TStringGrid);
    { Private declarations }
  public
    iCode: integer;
    iPeriods: integer;
    iStartPeriod: integer;
  end;

var
  PBMaintCustBudgetsfrm: TPBMaintCustBudgetsfrm;

implementation

uses pbMainMenu, CCSCommon;

{$R *.dfm}

procedure TPBMaintCustBudgetsfrm.ClearGrid(TempGrid: TStringGrid);
var
  irow, icol: integer;
begin
  with TempGrid do
    begin
      for irow := 1 to pred(rowcount) do
        for icol := 0 to pred(colcount) do
          cells[icol,irow] := '0';
    end;

end;

procedure TPBMaintCustBudgetsfrm.FormActivate(Sender: TObject);
var
  icount, iCustomer, iCol: integer;
begin
  sgDetails.colcount := iPeriods + 1;
  with qryPeriods do
    begin
      close;
      parambyname('Financial_year').asinteger := icode;
      open;

      first;
      icount := 1;
      while eof <> true do
        begin
          sgDetails.cells[icount,0] := fieldbyname('Description').asstring;
          next;
          inc(icount);
        end;
    end;

//  ClearGrid(sgDetails);

  with qryCustomer, sgDetails do
    begin
      close;
      parambyname('Start_period').asinteger := iStartPeriod;
      parambyname('End_Period').asinteger := (iStartPeriod + iPeriods)+1;
      open;
      icount := 0;
      iCustomer := 0;
      while eof <> true do
        begin
          if iCustomer <> fieldbyname('Customer').asinteger then
            begin
              icount := icount + 1;
              Cells[0,icount] := fieldbyname('Customer_Name').asstring;
              for icol := 1 to pred(colcount) do
                Cells[icol,icount] := '0';
              Cells[iperiods+2,icount] := fieldbyname('Customer').asstring;
              iCustomer := fieldbyname('Customer').asinteger;
            end;
          if fieldbyname('Period').asinteger > 0 then
            cells[(fieldbyname('Period').asinteger-iStartPeriod)+1,icount] := formatfloat('###0',fieldbyname('Profit_Value').asfloat);
          next;
        end;

      if icount > 0 then
        RowCount := icount + 1
      else
        RowCount := 2;
    end;
  sgDetails.SetFocus;
end;

procedure TPBMaintCustBudgetsfrm.FormCreate(Sender: TObject);
begin
  with sgDetails do
    begin
      cells[0,0] := 'Customer';
    end;

  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintCustBudgetsfrm.sgDetailsDrawCell(Sender: TObject; vCol,
  vRow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  {Prevent the blue cell being displayed}
  with Sender as TStringGrid do
  begin
    if (vRow <> 0) and (vCol <> 0) then
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color;
      Canvas.TextRect(Rect, Rect.Right - 2, Rect.Top + 2,
        Cells[vCol, vRow]);
    end;
  end;

  {If Heading Display Left justified in the cells}
  with Sender as TStringGrid do
  begin
    if vCol = 0 then
    begin
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_RIGHT or TA_CENTER) or TA_LEFT);
      ExtTextOut(Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
    else
    begin
      {Display the Columns Right justified in the cells}
      StrPCopy(Txt, Cells[vCol, vRow]);
      SetTextAlign(Canvas.Handle,
        GetTextAlign(Canvas.Handle)
        and not (TA_LEFT or TA_CENTER) or TA_RIGHT);
      ExtTextOut(Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
        ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end;
  end;
end;

procedure TPBMaintCustBudgetsfrm.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then { if it is a TDBGridd }
      begin
      with TStringGrid(ActiveControl) do
        begin
          if Col = (iPeriods) then
          begin
            if row = pred(rowcount) then
              row := 1
            else
              begin
                row := row + 1;
                col := 1;
              end;
            Exit;
          end
          else
          begin
            col := col + 1;
          end;
        end;
      end;

end;

procedure TPBMaintCustBudgetsfrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
end;

procedure TPBMaintCustBudgetsfrm.sgDetailsKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TStringGrid do
  begin
    P := Pos('.', Cells[Col, Row]);
  end;

  case key of
    '0'..'9': ;
    #8: {backspace};
  else
    Key := #0;
  end;
end;

procedure TPBMaintCustBudgetsfrm.OKBitBtnClick(Sender: TObject);
var
  icount, icol: integer;
begin
  with qryDel do
    begin
      close;
      parambyname('Start_Period').asinteger := iStartPeriod;
      parambyname('End_Period').asinteger := (iStartPeriod+iPeriods-1);
      execsql;
    end;

  for icount := 1 to pred(sgDetails.rowcount) do
    begin
      with qryAdd, sgDetails do
        begin
          for icol := 1 to pred(colcount) do
            begin
              if sgDetails.cells[icol,icount] = '0' then
                continue;
              close;
              parambyname('Customer').asinteger := strtoint(cells[iperiods+2,icount]);
              parambyname('Period').asinteger := iStartPeriod+(icol-1);
              parambyname('Turnover_Value').asfloat := 0.00;
              parambyname('Profit_Value').asfloat := StrToFloatDef(cells[icol,icount], 0, FormatSettings);
              execsql;
            end;
        end;
    end;
  close;
end;

end.
