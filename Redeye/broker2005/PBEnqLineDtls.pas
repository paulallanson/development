(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Add Enquiry Line details form.

VSS Info:
$Header: /PBL D5/PBEnqLineDtls.pas 15    22/08/03 16:34 Paul $
$History: PBEnqLineDtls.pas $
 * 
 * *****************  Version 15  *****************
 * User: Paul         Date: 22/08/03   Time: 16:34
 * Updated in $/PBL D5
 * Changed to correctly resize when using Windows XP display type.
 * 
 * *****************  Version 14  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:52
 * Updated in $/PBL D5
 * 
 * *****************  Version 12  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:14
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 11  *****************
 * User: Andrewh      Date: 19/06/03   Time: 11:16
 * Updated in $/PBL D5
 * Add functionality to allow Enquiry Maintenance to function in "enquiry"
 * mode.
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 3/04/:3    Time: 13:12
 * Updated in $/PBL D5
 * Corrected change in Description
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 3/04/:3    Time: 12:55
 * Updated in $/PBL D5
 * Changed to change the Enquiry Description if only one enquiry line
 * entered and the line description is changed.
 * 
 * *****************  Version 8  *****************
 * User: Paul         Date: 24/01/:3   Time: 9:58
 * Updated in $/PBL D5
 * Changed to use the new Form Reference lookup form
 * 
 * *****************  Version 7  *****************
 * User: Paul         Date: 25/10/:2   Time: 14:26
 * Updated in $/PBL D5
 * Changed to allow the changing of the product types
 * 
 * *****************  Version 6  *****************
 * User: Paul         Date: 12/09/:2   Time: 10:26
 * Updated in $/PBL D5
 * Added facility to maintain Run On Qty
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 24/09/:1   Time: 16:27
 * Updated in $/PBL D5
 * Changed to add Artwork selection button
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 5/07/:0    Time: 14:20
 * Updated in $/PBL D5
 * The Artwork section has been increased to allow greater description of
 * the Artwork requirements.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 13/04/:0   Time: 12:50
 * Updated in $/PBL D5
 * Initialise the Form Reference when creating a new line
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 11/02/:0   Time: 10:39
 * Updated in $/PBL D5
 * Changed to allow the entry of Forms References against Enquiries
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqLineDtls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ExtCtrls, Spin, Buttons, DB, ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqLineDtlsFrm = class(TForm)
    Bevel2: TBevel;
    Label7: TLabel;
    LineDescEdit: TEdit;
    Label9: TLabel;
    Label12: TLabel;
    DepthEdit: TEdit;
    Label13: TLabel;
    WidthEdit: TEdit;
    NoPartSpin: TSpinEdit;
    Label10: TLabel;
    Label15: TLabel;
    BoxQtyEdit: TEdit;
    Label11: TLabel;
    PlateSpin: TSpinEdit;
    QtyGrid: TStringGrid;
    OKBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    Label1: TLabel;
    ProductSQL: TFDQuery;
    Unit1: TEdit;
    UpDown1: TUpDown;
    Unit2: TEdit;
    UpDown2: TUpDown;
    Label2: TLabel;
    NCR_OTCCombo: TComboBox;
    NCRSQL: TFDQuery;
    NCR_OTCEdit: TEdit;
    ProductTypeEdit: TEdit;
    StdSizeSQL: TFDQuery;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    FormRefEdit: TEdit;
    FormRefDescEdit: TEdit;
    ProductTypeBitBtn: TBitBtn;
    FormRefBitBtn: TBitBtn;
    BitBtn1: TBitBtn;
    ArtEdit: TMemo;
    ArtworkBitBtn: TBitBtn;
    edtRunOnQty: TEdit;
    Label3: TLabel;
    btnDefaultSize: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    cmbbxJobType: TComboBox;
    qrySelJobType: TFDQuery;
    btbtnDelJobType: TBitBtn;
    procedure LineDescEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QtyGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QtyGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure DepthEditKeyPress(Sender: TObject; var Key: Char);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure UpDown2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure QtyGridKeyPress(Sender: TObject; var Key: Char);
    procedure QtyGridDrawCell(Sender: TObject; Col, Row: Longint;
      Rect: TRect; State: TGridDrawState);
    procedure NCR_OTCComboDropDown(Sender: TObject);
    procedure NCR_OTCComboClick(Sender: TObject);
    procedure WidthEditKeyPress(Sender: TObject; var Key: Char);
    procedure LineDescEditChange(Sender: TObject);
    procedure ProductTypeEditChange(Sender: TObject);
    procedure DepthEditChange(Sender: TObject);
    procedure WidthEditChange(Sender: TObject);
    procedure NCR_OTCComboChange(Sender: TObject);
    procedure OldArtEditChange(Sender: TObject);
    procedure BoxQtyEditChange(Sender: TObject);
    procedure NoPartSpinChange(Sender: TObject);
    procedure ProductTypeBitBtnClick(Sender: TObject);
    procedure FormRefBitBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ArtworkBitBtnClick(Sender: TObject);
    procedure btnDefaultSizeClick(Sender: TObject);
    procedure cmbbxJobTypeChange(Sender: TObject);
    procedure btbtnDelJobTypeClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetLineDefaults;
    procedure SaveOriginalData;
    procedure EnableOK;
    function CheckQtys: boolean;
    function CountQtys: integer;
    procedure LoadJobTypeCombo;
  public
    { Public declarations }
    jobType: integer;
    FProductTypeChanged: boolean;
  end;

var
  PBEnqLineDtlsFrm: TPBEnqLineDtlsFrm;

implementation

uses UITypes, PBenquiry, PBenqline, PBLUPrdTyp, PBLUCustFormRef, PBLUArtwrkTyp,
  PBLUStandSize, PBDatabase, pbMainMenu;

var
  MyRow, Mycol: Integer;
  iProductType: Integer;
  sFormRef: string[10];
{$R *.DFM}

procedure TPBEnqLineDtlsFrm.LineDescEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PBEnquiryFrm.EnterLineGrid((Sender as TEdit).tag, (Sender as TEdit).Text);
end;

procedure TPBEnqLineDtlsFrm.FormShow(Sender: TObject);
begin
  QtyGrid.Cells[0, 0] := 'Quantities';
  NCR_OTCComboDropDown(Self);
  self.LoadJobTypeCombo;

  if (PBEnquiryFrm.iCustomer = 0) then
     FormRefBitBtn.enabled := false
  else
     FormRefBitBtn.enabled := true;

  if sFuncMode = 'a' then
    SetLineDefaults
  else
    if sFuncMode = 'c' then
      SaveOriginalData;
  dmBroker.ScreenAccessControl(Self,'mnuEnquiries',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TPBEnqLineDtlsFrm.SaveOriginalData;
var
  irow, icount: Integer;
begin
  for icount := 0 to PBEnqLineDtlsFrm.ComponentCount - 1 do
  begin
    if ((PBEnqLineDtlsFrm.Components[icount] as TComponent).tag = 0) or
      ((PBEnqLineDtlsFrm.Components[icount] as TComponent).tag > 99) then
      Continue;
    if PBEnqLineDtlsFrm.Components[icount] is TEdit then
      TEdit(PBEnqLineDtlsFrm.Components[icount]).Text :=
        PBEnquiryFrm.LineGrid.Cells[TEdit(PBEnqLineDtlsFrm.Components[icount]).tag, PBEnquiryFrm.EnqLineList.itemindex]
    else
    if PBEnqLineDtlsFrm.Components[icount] is TMemo then
      TMemo(PBEnqLineDtlsFrm.Components[icount]).Text :=
        PBEnquiryFrm.LineGrid.Cells[TMemo(PBEnqLineDtlsFrm.Components[icount]).tag, PBEnquiryFrm.EnqLineList.itemindex]
    else
      if PBEnqLineDtlsFrm.Components[icount] is TComboBox then
      begin
        TComboBox(PBEnqLineDtlsFrm.Components[icount]).Text :=
          PBEnquiryFrm.LineGrid.Cells[TComboBox(PBEnqLineDtlsFrm.Components[icount]).tag, PBEnquiryFrm.EnqLineList.itemindex];
        TComboBox(PBEnqLineDtlsFrm.Components[icount]).itemindex :=
          TComboBox(PBEnqLineDtlsFrm.Components[icount]).Items.indexof(PBEnquiryFrm.LineGrid.Cells[TComboBox(PBEnqLineDtlsFrm.Components[icount]).tag,
          PBEnquiryFrm.EnqLineList.itemindex])
      end
      else
        if PBEnqLineDtlsFrm.Components[icount] is TRadioGroup then
          TRadioGroup(PBEnqLineDtlsFrm.Components[icount]).itemindex :=
            StrToInt(PBEnquiryFrm.LineGrid.Cells[TRadioGroup(PBEnqLineDtlsFrm.Components[icount]).tag, PBEnquiryFrm.EnqLineList.itemindex])
        else
          if PBEnqLineDtlsFrm.Components[icount] is TSpinedit then
            TSpinEdit(PBEnqLineDtlsFrm.Components[icount]).value :=
              StrToInt(PBEnquiryFrm.LineGrid.Cells[TSpinEdit(PBEnqLineDtlsFrm.Components[icount]).tag, PBEnquiryFrm.EnqLineList.itemindex])
          else
            if PBEnqLineDtlsFrm.Components[icount] is TCheckBox then
            begin
              if
                PBEnquiryFrm.LineGrid.Cells[TCheckBox(PBEnqLineDtlsFrm.Components[icount]).tag, PBEnquiryFrm.EnqLineList.itemindex] = 'Y' then
                TCheckBox(PBEnqLineDtlsFrm.Components[icount]).Checked := True
              else
                TCheckBox(PBEnqLineDtlsFrm.Components[icount]).Checked := False
            end
            else
              if PBEnqLineDtlsFrm.Components[icount] is TStringGrid then
              begin
                TStringGrid(PBEnqLineDtlsFrm.Components[icount]).RowCount :=
                  (PBEnquiryFrm.LineGrid.colcount - 20) + 1;
                for irow := 20 to PBEnquiryFrm.LineGrid.colcount - 1 do
                begin
                  TStringGrid(PBEnqLineDtlsFrm.Components[icount]).Cells[0, irow
                    - 19] := PBEnquiryFrm.LineGrid.Cells[irow,
                    PBEnquiryFrm.EnqLineList.itemindex]
                end;
              end;
  end;
  iProductType := StrToInt(PBEnquiryFrm.LineGrid.Cells[0,
    PBEnquiryFrm.EnqLineList.itemindex]);
  sFormRef := PBEnquiryFrm.LineGrid.Cells[16,PBEnquiryFrm.EnqLineList.itemindex];
end;

procedure TPBEnqLineDtlsFrm.SetLineDefaults;
begin

  {Set defaults for the line details}
  NoPartSpin.Value := 1;
  PlateSpin.Value := 0;
  {  NCR_OTCCombo.itemindex := 3;
   } NCR_OTCCombo.itemindex := NCR_OTCCombo.Items.indexof('N/A');
  NCR_OTCComboClick(Self);

  if iLine = 1 then
    LineDescedit.Text := PBEnquiryFrm.DescriptionEdit.Text;
  sFormref := '';
end;

procedure TPBEnqLineDtlsFrm.FormKeyPress(Sender: TObject; var Key: Char);
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
            MyRow := Row;
            Col := 0;
            PBEnquiryFrm.LineGrid.colcount := PBEnquiryFrm.LineGrid.colcount + 1;
          end;

        end;
      end;
    end;
end;

procedure TPBEnqLineDtlsFrm.QtyGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {	PBEnquiryFrm.EnterLineGrid(((Sender as TStringGrid).tag+myrow-1),(sender as TStringGrid).cells[0,MyRow]);
  }
  {Check for only one qty entered so we know what to do with the Run On Qty}
  edtRunOnQty.enabled := (CountQtys = 1);
  edtRunOnQty.text := '0';
  Enableok;
end;

procedure TPBEnqLineDtlsFrm.QtyGridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Row, Column: Longint;
begin
  PBEnquiryFrm.LineGrid.MouseToCell(X, Y, Column, Row);
  MyRow := Row;
  MyCol := Column;
end;

procedure TPBEnqLineDtlsFrm.CancelBitBtnClick(Sender: TObject);
begin
  if sFuncMode = 'c' then
    Close;
end;

procedure TPBEnqLineDtlsFrm.OKBtnClick(Sender: TObject);
var
  irow, icount: Integer;
begin
  if  (IntToStr(iProductType) <> PBEnquiryFrm.LineGrid.Cells[0, (iline - 1)]) and
      (PBEnquiryFrm.LineGrid.Cells[0, (iline - 1)] <> '') then
    if messagedlg('The Product type has been changed, all the capabilities and questions ' +
                  'will be changed, do you want to continue?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      FProductTypeChanged := true
  else
    exit;


  {Check that a line description has been entered}
  if LineDescEdit.Text = '' then
  begin
    MessageDlg('Description for this enquiry line must be entered', mtError,
      [mbOk], 0);
    LineDescEdit.SetFocus;
    Exit;
  end;

  {Check that a Product Type has been entered}
  if ProductTypeEdit.Text = '' then
  begin
    MessageDlg('Product Type for this enquiry line must be entered', mtError,
      [mbOk], 0);
    ProductTypeEdit.SetFocus;
    Exit;
  end;

  {Check that all sizes have been entered}
  if (DepthEdit.Text = '') or (WidthEdit.Text = '') then
  begin
    MessageDlg('Depth and Width must be entered', mtError, [mbOk], 0);
    DepthEdit.SetFocus;
    Exit;
  end;

  {Check that NCR, OTC etc have been entered}
  if (NCR_OTCCombo.Text = '') then
  begin
    MessageDlg('NCR, OTC, Mixed or N/A must be specified', mtError,
      [mbOk], 0);
    NCR_OTCCombo.SetFocus;
    Exit;
  end;

  {Check that at least one qty has been entered}
  with QtyGrid do
  begin
    for irow := 1 to RowCount - 1 do
    begin
      if Cells[0, irow] <> '' then Break;
      MessageDlg('At least one quantity must be specified', mtError,
        [mbOk], 0);
      SetFocus;
      Exit;
    end;
  end;

  for icount := 0 to PBEnqLineDtlsFrm.ComponentCount - 1 do
  begin
    if ((PBEnqLineDtlsFrm.Components[icount] as TComponent).tag = 0) or
      ((PBEnqLineDtlsFrm.Components[icount] as TComponent).tag > 99) then
      Continue;
    if PBEnqLineDtlsFrm.Components[icount] is TEdit then
      PBEnquiryFrm.LineGrid.Cells[TEdit(PBEnqLineDtlsFrm.Components[icount]).tag, (iline - 1)] := TEdit(PBEnqLineDtlsFrm.Components[icount]).Text
    else
    if PBEnqLineDtlsFrm.Components[icount] is TMemo then
      PBEnquiryFrm.LineGrid.Cells[TMemo(PBEnqLineDtlsFrm.Components[icount]).tag, (iline - 1)] := TMemo(PBEnqLineDtlsFrm.Components[icount]).Text
    else
    if PBEnqLineDtlsFrm.Components[icount] is TComboBox then
        PBEnquiryFrm.LineGrid.Cells[TComboBox(PBEnqLineDtlsFrm.Components[icount]).tag, (iline - 1)] := TComboBox(PBEnqLineDtlsFrm.Components[icount]).Text
    else
    if PBEnqLineDtlsFrm.Components[icount] is TRadioGroup then
        PBEnquiryFrm.LineGrid.Cells[TRadioGroup(PBEnqLineDtlsFrm.Components[icount]).tag, (iline - 1)] :=
            IntToStr(TRadioGroup(PBEnqLineDtlsFrm.Components[icount]).itemindex)
        else
          if PBEnqLineDtlsFrm.Components[icount] is TSpinedit then
            PBEnquiryFrm.LineGrid.Cells[TSpinEdit(PBEnqLineDtlsFrm.Components[icount]).tag,
              (iline - 1)] :=
              IntToStr(TSpinEdit(PBEnqLineDtlsFrm.Components[icount]).value)
          else
            if PBEnqLineDtlsFrm.Components[icount] is TCheckBox then
            begin
              if TCheckBox(PBEnqLineDtlsFrm.Components[icount]).Checked
                then
                PBEnquiryFrm.LineGrid.Cells[TCheckBox(PBEnqLineDtlsFrm.Components[icount]).tag, (iline - 1)] := 'Y'
              else
                PBEnquiryFrm.LineGrid.Cells[TCheckBox(PBEnqLineDtlsFrm.Components[icount]).tag, (iline - 1)] := 'N'
            end
            else
              if PBEnqLineDtlsFrm.Components[icount] is TStringGrid then
              begin
                if PBEnquiryFrm.LineGrid.colcount < (20 +
                  (TStringGrid(PBEnqLineDtlsFrm.Components[icount]).RowCount -
                    1))
                  then
                  PBEnquiryFrm.LineGrid.colcount := 20 +
                    (TStringGrid(PBEnqLineDtlsFrm.Components[icount]).RowCount -
                    1);

                for irow := 1 to
                  TStringGrid(PBEnqLineDtlsFrm.Components[icount]).RowCount - 1
                    do
                begin
                  PBEnquiryFrm.LineGrid.Cells[19 + irow, (iline - 1)] :=
                    TStringGrid(PBEnqLineDtlsFrm.Components[icount]).Cells[0,
                      irow]
                end;
              end;
  end;

  PBEnquiryFrm.LineGrid.Cells[0, (iline - 1)] := IntToStr(iProductType);
  PBEnquiryFrm.LineGrid.Cells[16, (iline - 1)] := sFormRef;
  if (PBEnquiryFrm.EnquiryLinegrid.rowcount = 2) and (iLine = 1) then
    PBEnquiryFrm.DescriptionEdit.text := LineDescEdit.text;

  ModalResult := mrOK;
end;

procedure TPBEnqLineDtlsFrm.DepthEditKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', Text);
  end;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TPBEnqLineDtlsFrm.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if Unit1.Text = 'mm' then
    Unit1.Text := 'inch'
  else
    Unit1.Text := 'mm';
end;

procedure TPBEnqLineDtlsFrm.UpDown2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  if Unit2.Text = 'mm' then
    Unit2.Text := 'inch'
  else
    Unit2.Text := 'mm';
end;

procedure TPBEnqLineDtlsFrm.QtyGridKeyPress(Sender: TObject; var Key: Char);
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

procedure TPBEnqLineDtlsFrm.QtyGridDrawCell(Sender: TObject; Col,
  Row: Longint; Rect: TRect; State: TGridDrawState);
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

procedure TPBEnqLineDtlsFrm.NCR_OTCComboDropDown(Sender: TObject);
var
  stext: string;
begin
  NCRSQL.Close;
  NCRSQL.Open;

  stext := NCR_OTCCombo.Text;

  NCR_OTCCombo.Clear;

  NCRSQL.First;

  while (not NCRSQL.EOF) do
  begin
    NCR_OTCCombo.Items.Add(NCRSQL.FieldByName('NCR_OTC_Descr').AsString);
    NCRSQL.Next;
  end;

  NCR_OTCCombo.Itemindex := NCR_OTCCombo.Items.IndexOf(sText);

end;

procedure TPBEnqLineDtlsFrm.EnableOK;
begin
  {Check whether all the required fields have been entered}
  if (LineDescEdit.Text = '') or
    (not LineDescEdit.Enabled ) or
    (ProductTypeEdit.Text = '') or
    (DepthEdit.Text = '') or
    (WidthEdit.Text = '') or
    (NCR_OTCCombo.Text = '') or
    (not (CheckQtys)) then
    OKBtn.Enabled := False
  else
    OKBtn.Enabled := True;
end;

function TPBEnqLineDtlsFrm.CheckQtys: boolean;
var
  irow: Integer;
begin
  {Check to see if any quantities have been entered}
  for irow := 1 to QtyGrid.RowCount - 1 do
  begin
    if QtyGrid.Cells[0, irow] <> '' then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

procedure TPBEnqLineDtlsFrm.NCR_OTCComboClick(Sender: TObject);
begin
  NCRSQL.First;
  NCRSQL.Moveby(NCR_OTCCombo.itemindex);
  NCR_OTCEdit.Text := NCRSQL.FieldByName('NCR_OTC_Mix').AsString;
end;

procedure TPBEnqLineDtlsFrm.WidthEditKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TEdit do
  begin
    P := Pos('.', Text);
  end;
  case Key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;

end;

procedure TPBEnqLineDtlsFrm.LineDescEditChange(Sender: TObject);
begin
  EnableOK;
end;

procedure TPBEnqLineDtlsFrm.ProductTypeEditChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnqLineDtlsFrm.DepthEditChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnqLineDtlsFrm.WidthEditChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnqLineDtlsFrm.NCR_OTCComboChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnqLineDtlsFrm.OldArtEditChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnqLineDtlsFrm.BoxQtyEditChange(Sender: TObject);
begin
  EnableOK;

end;

procedure TPBEnqLineDtlsFrm.NoPartSpinChange(Sender: TObject);
begin
  with Sender as TSpinEdit do
  begin
    if value > 1 then
    begin
      NCR_OTCCombo.itemindex := NCR_OTCCombo.Items.indexof('NCR');
    end;
    NCR_OTCComboClick(Self);
  end;
end;

procedure TPBEnqLineDtlsFrm.ProductTypeBitBtnClick(Sender: TObject);
begin
  PBLUPrdTypfrm := TPBLUPrdTypfrm.Create(Owner);
  PBLUPrdTypfrm.bIs_Lookup := True;
  PBLUPrdTypfrm.bAllow_Upd := True;

  if PBEnquiryFrm.LineGrid.Cells[0, iline - 1] = '' then
    PBLUPrdTypfrm.Selcode := 0
  else
    PBLUPrdTypfrm.Selcode := StrToInt(PBEnquiryFrm.LineGrid.Cells[0, iline -
      1]);

  PBLUPrdTypfrm.ShowModal;
  if PBLUPrdTypfrm.selected then
  begin
    iProductType := PBLUPrdTypfrm.Selcode;
    ProductTypeEdit.Text := PBLUPrdTypfrm.SelName;
  end;
end;

procedure TPBEnqLineDtlsFrm.FormRefBitBtnClick(Sender: TObject);
begin
  PBLUCustFormRefFrm := TPBLUCustFormRefFrm.Create(Self);
  try
    PBLUCustFormRefFrm.bIs_Lookup := True;
    PBLUCustFormRefFrm.bAllow_Upd := True;
    PBLUCustFormRefFrm.iCust := PBEnquiryFrm.iCustomer;
    PBLUCustFormRefFrm.sCustName := PBEnquiryFrm.CustomerEdit.Text;
    PBLUCustFormRefFrm.iBranch := PBEnquiryFrm.iBranch_No;
    PBLUCustFormRefFrm.sBranchName := PBEnquiryFrm.BranchEdit.Text;

     if PBEnquiryFrm.LineGrid.Cells[16, iline - 1] = '' then
       PBLUCustFormRefFrm.SelCode := 0
     else
       PBLUCustFormRefFrm.SelCode := strtoint(PBEnquiryFrm.LineGrid.Cells[16, iline - 1]);

    PBLUCustFormRefFrm.ShowModal;
    if PBLUCustFormRefFrm.bSelected then
    begin
      sFormRef := inttostr(PBLUCustFormRefFrm.SelCode);
      FormRefEdit.Text := PBLUCustFormRefFrm.SelName;
      FormRefDescEdit.Text := PBLUCustFormRefFrm.SelDescr;
    end;
  finally
    PBLUCustFormRefFrm.Free;
  end;
end;

procedure TPBEnqLineDtlsFrm.BitBtn1Click(Sender: TObject);
begin
 sFormRef:= '';
 FormRefEdit.clear;
 FormRefDescEdit.clear;
end;

procedure TPBEnqLineDtlsFrm.ArtworkBitBtnClick(Sender: TObject);
var
  temploop: integer;
begin
  PBLUArtwrkTypfrm := TPBLUArtwrkTypfrm.Create(Owner);
  try
    PBLUArtwrkTypfrm.bIs_Lookup := True;
    PBLUArtwrkTypfrm.bAllow_Upd := True;

    PBLUArtwrkTypfrm.ShowModal;
(*    if PBLUArtwrkTypfrm.selected then
    begin
      ArtEdit.text := PBLUArtwrkTypfrm.Selname;
    end;
*)
    if PBLUArtwrkTypfrm.selected then
    begin
      {Update the artwork property and field with the selected details}
      PBLUArtwrkTypfrm.DetsDbGrid.Datasource.Dataset.DisableControls;
      for TempLoop := 0 to pred(PBLUArtwrkTypfrm.DetsDBGrid.SelectedRows.count) do
		    begin
          PBLUArtwrkTypfrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUArtwrkTypfrm.DetsDBGrid.SelectedRows[TempLoop]));
          ArtEdit.text := ArtEdit.text +
            (PBLUArtwrkTypfrm.DetsDBGrid.dataSource.dataset.fieldbyname('Artwork_Instructions').asstring) +
            #13#10;
        end;
      PBLUArtwrkTypfrm.DetsDbGrid.Datasource.Dataset.EnableControls;
    end;
  finally
    PBLUArtwrkTypfrm.free;
  end;
end;

procedure TPBEnqLineDtlsFrm.btnDefaultSizeClick(Sender: TObject);
begin
  PBLUStandSizeFrm := TPBLUStandSizeFrm.Create(Self);
  try
    PBLUStandSizeFrm.bIs_Lookup := true;
    PBLUStandSizeFrm.bAllow_Upd := True;
    PBLUStandSizeFrm.ShowModal;
    if PBLUStandSizeFrm.selected then
      begin
        DepthEdit.Text := inttostr(PBLUStandSizeFrm.SelDepth);
        Unit1.Text := 'mm';
        WidthEdit.Text := inttostr(PBLUStandSizeFrm.SelWidth);
        Unit2.Text := 'mm';
      end;
  finally
    PBLUStandSizeFrm.Free;
  end;
end;

function TPBEnqLineDtlsFrm.CountQtys: integer;
var
  irow: integer;
begin
  result := 0;
  with QtyGrid do
    begin
      for irow := 1 to pred(rowcount) do
        begin
          if cells[0,irow] <> '' then
            result := result + 1
        end;
    end;
end;

procedure TPBEnqLineDtlsFrm.LoadJobTypeCombo;
var
  inx, count: integer;
begin
  count := 0;
  inx := -1;

  try
    self.jobType := PBEnquiryFrm.Enquiry.Lines[PBEnquiryFrm.EnquiryLineGrid.Row-1].JobType;
  except
    self.jobType := 0;
  end;

  cmbbxJobType.Items.Clear;
  qrySelJobType.close;
  qrySelJobType.open;

  while not qrySelJobType.Eof do
  begin
    cmbbxJobType.Items.Add(qrySelJobType.FieldByName('Job_Type_Description').asString);
    if self.jobType = qrySelJobType.FieldByName('Job_Type').asInteger then
    begin
      inx := count;
    end;

    qrySelJobType.next;
    inc(count);
  end;

  self.cmbbxJobType.ItemIndex := inx;
end;

procedure TPBEnqLineDtlsFrm.cmbbxJobTypeChange(Sender: TObject);
begin
  if self.qrySelJobType.Locate('Job_Type_Description', self.cmbbxJobType.Text, []) then
  begin
    self.jobType := self.qrySelJobType.FieldByName('job_type').asInteger;
  end;
end;

procedure TPBEnqLineDtlsFrm.btbtnDelJobTypeClick(Sender: TObject);
begin
  self.cmbbxJobType.ItemIndex := -1;
  self.jobType := 0;
end;

end.
