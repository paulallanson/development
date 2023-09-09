(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Copy Purchase Orders to Enquiries form.

VSS Info:
$Header: /PBL D5/PBPOToEnq.pas 8     2/05/:1 12:59 Paul $
$History: PBPOToEnq.pas $
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 2/05/:1    Time: 12:59
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 12/10/:0   Time: 11:47
 * Updated in $/PBL D5
 * Standardise formatdatetime to use PBDatestr in PBPOObjects, which
 * formats the date based on the selections in the control panel, regional
 * settings, data, short style.
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 4/10/:0    Time: 13:05
 * Updated in $/PBL D5
 * Allow '' for date
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 4/10/:0    Time: 9:55
 * Updated in $/PBL D5
 * Allow input of dates, and validate, as well as allowing date look-up
 * and selection.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 16/03/:0   Time: 15:09
 * Updated in $/PBL D5
 * New dynamic selection screens for enquiry and purchase order lookups.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 11/02/:0   Time: 10:41
 * Updated in $/PBL D5
 * Redesigned the convert PO to Enquiry program 
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 31/01/:0   Time: 13:04
 * Updated in $/PBL D5
 * New TNarrative object to centralise all accesses to the Narrative_Line
 * table.  Also improved SQL to allocate next key value.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBPOToEnq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PBPOObjects, StdCtrls, DB, Buttons, Grids;

type
  TPBPOToEnqFrm = class(TForm)
    SelPOLabel: TLabel;
    CustDetsLabel: TLabel;
    Label7: TLabel;
    EnqDateEdit: TEdit;
    EnqDateBtn: TSpeedButton;
    Label3: TLabel;
    ReqByDateEdit: TEdit;
    DateBtn: TSpeedButton;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DescriptionLbl: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    QtyGrid: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure EnqDateBtnClick(Sender: TObject);
    procedure DateBtnClick(Sender: TObject);
    procedure FormDescrMemoChange(Sender: TObject);
    function CopyNarr(iTempNarr: Integer): Integer;
    procedure OKBitBtnClick(Sender: TObject);
    procedure QtyGridKeyPress(Sender: TObject; var Key: Char);
    procedure QtyGridDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ReqByDateEditExit(Sender: TObject);
    procedure EnqDateEditExit(Sender: TObject);
  private
    { Private declarations }
    dEnqDate, dReqdate: TDateTime;
  public
    Customer: integer;
    CustomerName, Description: string;
    PONumber: real;
    iLine, Quantity: integer;
  end;

var
  PBPOToEnqFrm: TPBPOToEnqFrm;

implementation

uses
  System.UITypes,
  DateSelV5, PBenquiry, pbNarrativeDM;

{$R *.DFM}

procedure TPBPOToEnqFrm.FormActivate(Sender: TObject);
begin
  SelPOLabel.Caption := floatToStr(PONumber);
  CustDetsLabel.Caption := Trim(CustomerName);
  DescriptionLbl.Caption := Description;
  QtyGrid.cells[0,0] := 'Quantity';
  QtyGrid.cells[0,1] := inttostr(Quantity);

  dEnqDate := Date;
  dReqDate := Date;
  ReqByDateEdit.Text := PBDateStr(dEnqDate);
  EnqDateEdit.Text := PBDateStr(dReqDate);
  CheckOK(Self);
end;

procedure TPBPOToEnqFrm.CheckOK(Sender: TObject);
begin
  {};
  OKBitBtn.Enabled := (ReqByDateEdit.Text <> '') and
    (EnqDateEdit.Text <> '');

end;

procedure TPBPOToEnqFrm.EnqDateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(EnqDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      EnqDateEdit.Text := PBDateStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBPOToEnqFrm.DateBtnClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := StrToDate(ReqByDateEdit.Text);
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      ReqByDateEdit.Text := PBDateStr(DateSelV5Form.Date);
      CheckOK(Self);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBPOToEnqFrm.FormDescrMemoChange(Sender: TObject);
begin
  CheckOK(Self);
end;

function TPBPOToEnqFrm.CopyNarr(iTempNarr: Integer): Integer;
var
  Narrative: TNarrative;
begin
  Narrative := TNarrative.Create;
  try
    Narrative.DbKey := iTempNarr;
    Narrative.LoadFromDB;
    Narrative.DbKey := 0;
    Narrative.SaveToDB;
    Result := Narrative.DbKey;
  finally
    Narrative.Free;
  end;
end;

procedure TPBPOToEnqFrm.OKBitBtnClick(Sender: TObject);
begin
  {Call NEW Purchase Order Maintenance};
  PBEnquiryFrm := TPBEnquiryFrm.Create(Self);
  try
    PBEnquiryFrm.rPONumber := PONumber;
    PBEnquiryFrm.iPOLine := iLine;
    PBEnquiryFrm.ConvertPOtoEnquiry ;
    PBEnquiryFrm.ShowModal;
  finally
    PBEnquiryFrm.Free;
  end;
end;

procedure TPBPOToEnqFrm.QtyGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;

end;

procedure TPBPOToEnqFrm.QtyGridDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
begin
  {Code extracted from the Delphi Info base No 609}
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

procedure TPBPOToEnqFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then
    begin
      if TStringGrid(ActiveControl).Name = 'QtyGrid' then
      begin
        with TStringGrid(ActiveControl) do
        begin
          if Cells[0, Row] = '' then Exit;
          if (Row = (RowCount - 1)) then { increment the field }
          begin
            RowCount := RowCount + 1;
            Row := RowCount - 1;
            Col := 0;
          end;

        end;
      end;
    end;
end;

procedure TPBPOToEnqFrm.ReqByDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If ReqByDateEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(ReqByDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      ReqByDateEdit.SetFocus;
      Exit;
    end;
  end;

  ReqByDateEdit.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;

procedure TPBPOToEnqFrm.EnqDateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
    If EnqDateEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(EnqDateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      EnqDateEdit.SetFocus;
      Exit;
    end;
  end;

  EnqDateEdit.Text := PBDatestr(NewDate);
  CheckOK(Self);
end;


end.
