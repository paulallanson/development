unit PBMaintLastNos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Spin, Buttons, DB, Grids, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintLastNosFrm = class(TForm)
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    GetDetsSQL: TFDQuery;
    UpdDetsSQL: TFDQuery;
    qryCompany: TFDQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LastEnqNoSpinEdit: TSpinEdit;
    LastPONoSpinEdit: TSpinEdit;
    LastJBSpinEdit: TSpinEdit;
    LastWOSpinEdit: TSpinEdit;
    grdDetails: TStringGrid;
    qryGetCompCat: TFDQuery;
    qryUpdCompCat: TFDQuery;
    cmbSuffix: TComboBox;
    Label3: TLabel;
    lastInvNoSpinEdit: TSpinEdit;
    LastCreditNoteSpinEdit: TSpinEdit;
    Label4: TLabel;
    Label7: TLabel;
    LastQuoteNoSpinEdit: TSpinEdit;
    Label8: TLabel;
    LastNCSpinEdit: TSpinEdit;
    Label9: TLabel;
    LastContractNoSpinEdit: TSpinEdit;
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure grdDetailsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure grdDetailsClick(Sender: TObject);
    procedure cmbSuffixClick(Sender: TObject);
  private
    procedure LockCompanyRecord;
    procedure FreeCompanyRecord;
    procedure ShowDetails;
    function cellleft(grid: TStringGrid; Col: Integer): Integer;
    function celltop(grid: TStringGrid; Row: Integer): Integer;
  end;

var
  PBMaintLastNosFrm: TPBMaintLastNosFrm;

implementation

uses pbMainMenu, PBDatabase;

{$R *.DFM}

procedure TPBMaintLastNosFrm.FreeCompanyRecord;
begin
  with qryCompany do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Update Company Set In_Use_By = NULL Where Company=1');
    ExecSQL;
  end;
end;

procedure TPBMaintLastNosFrm.LockCompanyRecord;
var
  StartTime : TDateTime;
  EndTime : TDateTime;
  InUseBy : integer;
  Myself : integer;
const
  LockTime = ((1/24) * (5/3600));  { Allow 5 seconds for lock attempts }
begin
  StartTime := Time;
  EndTime := StartTime + LockTime;
  InUseBy := 0;
  MySelf := frmpbMainMenu.iOperator;
  while (InUseBy <> MySelf) and (Time < EndTime) do
    with qryCompany do
    begin
      Close;
      SQL.Clear;
      SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
              'Where Company=1 and In_Use_By is null');
      ExecSQL;
      SQL.Clear;
      SQL.Add('Select In_Use_By From Company Where Company = 1');
      Open;
      InUseBy := FieldByName('In_Use_By').AsInteger;
      Close;
      if (InUseBy <> MySelf) and (Time > EndTime) then
      begin { Assume the other locker has died and grab record unconditionally }
        SQL.Clear;
        SQL.Add('Update Company Set In_Use_By = ' + IntToStr(MySelf) + ' ' +
                'Where Company=1');
        ExecSQL;
      end;
    end;
end;

procedure TPBMaintLastNosFrm.OKBitBtnClick(Sender: TObject);
var
  icount: integer;
begin
  LockCompanyRecord;
  try
    with UpdDetsSQL do
    begin
      Close;
      ParamByName('Last_Enq_No').AsInteger := LastEnqNoSpinEdit.Value;
      ParamByName('Last_PO_No').AsInteger := LastPONoSpinEdit.Value;
      ParamByName('Last_Inv_No').AsInteger := LastInvNoSpinEdit.Value;
      ParamByName('Last_Credit_Note_No').AsInteger := LastCreditNoteSpinEdit.Value;
      ParamByName('Last_Job_Bag_Number').AsInteger := LastJBSpinEdit.Value;
      ParamByName('Last_works_order_Number').AsInteger := LastWOSpinEdit.Value;
      ParamByName('Last_Quote_Number').AsInteger := LastQuoteNoSpinEdit.Value;
      ParamByName('Last_Non_Conform_Number').AsInteger := LastNCSpinEdit.Value;
      ParamByName('Last_Contract_Number').AsInteger := LastContractNoSpinEdit.Value;
      ExecSQL;
    end;
  finally
    FreeCompanyRecord;
  end;

  // Now update the Company Category records and re-add them
  for icount := 1 to pred(grdDetails.rowcount) do
    begin
      if trim(grdDetails.cells[0,icount]) = '' then
        continue;
      with qryUpdCompCat do
        begin
          close;
          parambyname('Company').asinteger := 1;
          parambyname('Category').asinteger := strtoint(grdDetails.cells[4,icount]);
          parambyname('Last_Invoice_No').asinteger := strtoint(grdDetails.cells[1,icount]);
          parambyname('Suffix_or_Prefix').asstring := 'Prefix';
          parambyname('Suffix_or_Prefix_Value').asstring := grdDetails.cells[3,icount];
          execsql;
        end;
    end;

  Close;
end;

procedure TPBMaintLastNosFrm.FormCreate(Sender: TObject);
begin
  If dmBroker.iAccCtrl = 1 then
        begin
        if MessageDlg('Changing these values may cause sequence numbers to ' +
                'duplicate. ' + #13 +
                'Are you sure you want to continue?', mtWarning, [mbNo, mbYes], 0) <> mrYes
             then
                begin
                PostMessage(Handle, WM_CLOSE, 0, 0);
                Exit;
                end;
        end;
  with GetDetsSQL do
  begin
    Close;
    Open;
    if EOF then
    begin
      MessageDlg('There are no Companies set-up', mtError, [mbOK], 0);
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      Exit;
    end;
    if RecordCount > 1 then
      MessageDlg('There is more than one Company set-up. ' +
        'ALL Companies will be updated.', mtWarning, [mbOK], 0);

    LastEnqNoSpinEdit.Value := FieldByName('Last_Enquiry_Number').AsInteger;
    LastPONoSpinEdit.Value := FieldByName('Last_PO_Number').AsInteger;
    LastInvNoSpinEdit.Value := FieldByName('Last_Invoice_No').AsInteger;
    LastCreditNoteSpinEdit.Value := FieldByName('Last_Credit_Note_No').AsInteger;
    LastJBSpinEdit.Value := FieldByName('Last_Job_Bag_Number').AsInteger;
    LastWOSpinEdit.Value := FieldByName('Last_Works_order_Number').AsInteger;
    LastQuoteNoSpinEdit.Value := FieldByName('Last_Quote_Number').AsInteger;
    LastNCSpinEdit.Value := FieldByName('Last_Non_Conform_Number').AsInteger;
    LastContractNoSpinEdit.Value := FieldByName('Last_Contract_Number').AsInteger;
  end;
  grdDetails.cells[0,0] := 'Category';
  grdDetails.cells[1,0] := 'Invoice No.';
  grdDetails.cells[2,0] := 'Suffix/Prefix';
  grdDetails.cells[3,0] := 'Prefix';

  grdDetails.ColWidths[2] := -1;
end;

procedure TPBMaintLastNosFrm.FormActivate(Sender: TObject);
begin
  ShowDetails;
  dmBroker.ScreenAccessControl(Self,'mnuSystem',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBMaintLastNosFrm.ShowDetails;
var
  icount: integer;
begin
  with qryGetCompCat, grdDetails do
    begin
      close;
      open;
      icount := 0;
      while eof <> true do
        begin
          inc(icount);
          cells[0,icount] := fieldbyname('Description').asstring;
          cells[1,icount] := fieldbyname('Last_Invoice_no').asstring;
          cells[2,icount] := fieldbyname('Suffix_or_Prefix').asstring;
          cells[3,icount] := fieldbyname('Suffix_or_Prefix_Value').asstring;
          cells[4,icount] := fieldbyname('Category').asstring;
          next;
        end;
      if icount = 0 then
        begin
          grdDetails.RowCount := 2;
          grdDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing]
        end
      else
        begin
          grdDetails.RowCount := icount + 1;
          grdDetails.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goColSizing, goEditing]
        end;
    end;
end;

procedure TPBMaintLastNosFrm.grdDetailsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  cmbSuffix.width := grdDetails.colwidths[Acol];

  if Sender = ActiveControl then Exit;
  if not (gdSelected in State) then Exit;
  with Sender as TStringGrid do
  begin
    Canvas.Brush.Color := Color;
    Canvas.Font.Color := Font.Color;
    Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2,
      Cells[Col, Row]);
  end;
end;

procedure TPBMaintLastNosFrm.grdDetailsClick(Sender: TObject);
begin
  with grdDetails do
  begin
    if Col = 2 then
    begin
      cmbSuffix.Top := celltop(grdDetails, Row);
      cmbSuffix.Left := cellleft(grdDetails, Col);
      cmbSuffix.width := colwidths[2];

      if cells[2,row] <> '' then
        cmbSuffix.text := cells[2,row];
      cmbSuffix.bringtofront;
      cmbSuffix.Visible := True;
      cmbSuffix.SetFocus;
    end
    else
    begin
      cmbSuffix.sendtoback;
      cmbSuffix.Visible := False;
    end
  end;

end;

function TPBMaintLastNosFrm.cellleft(grid: TStringGrid; Col: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Left;

  {this is for the fixed column}
  t := t + grid.ColWidths[0] + grid.gridlinewidth;
  for i := grid.leftcol to Col - 1 do
    t := t + grid.colwidths[i] + grid.gridlinewidth;
  Result := t + grid.gridlinewidth;
end;

function TPBMaintLastNosFrm.celltop(grid: TStringGrid; Row: Integer): Integer;
var
  i: Integer;
  t: Integer;
begin
  t := grid.gridlinewidth + grid.Top;
  for i := grid.toprow to Row do
  begin
    t := t + grid.rowheights[i] + grid.gridlinewidth;
  end;
  Result := t;

end;

procedure TPBMaintLastNosFrm.cmbSuffixClick(Sender: TObject);
begin
  with grdDetails do
  begin
    cells[2,row] := cmbSuffix.text;
  end;
end;

end.
