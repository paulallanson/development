unit CSMaintCustDisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TCsMaintCustDiscFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdSQL: TQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    AddSQL: TQuery;
    DelSQL: TQuery;
    GetLastCodeSql: TQuery;
    CstCntrLabel: TLabel;
    DescLabel: TLabel;
    CustLabel: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    DateFromEdit: TEdit;
    DatefromBitBtn: TBitBtn;
    Label4: TLabel;
    DateToEdit: TEdit;
    DateToBitBtn: TBitBtn;
    DiscDBLookupComboBox: TDBLookupComboBox;
    GetDiscSql: TQuery;
    GetDiscDataSource: TDataSource;
    ByLabel: TLabel;
    PartEdit: TEdit;
    PartBitBtn: TBitBtn;
    DiscValMemo: TMemo;
    GetDetsQuery: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CstCntrEditChange(Sender: TObject);
    procedure DiscValEditChange(Sender: TObject);
    procedure PartBitBtnClick(Sender: TObject);
    procedure DatefromBitBtnClick(Sender: TObject);
    procedure DateToBitBtnClick(Sender: TObject);
    procedure DateFromEditExit(Sender: TObject);
    procedure DateToEditExit(Sender: TObject);
    procedure DiscValMemoExit(Sender: TObject);
    procedure DiscValMemoKeyPress(Sender: TObject; var Key: Char);
    procedure DiscDBLookupComboBoxClick(Sender: TObject);
    private
    procedure DisplayFields(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
     sFuncMode: String[1] ;
    iCode: Integer ;
    part_Group: Integer;
    end;

var
  CsMaintCustDiscFrm: TCsMaintCustDiscFrm;

implementation

uses CSLUCustDisc, STPrtMnt, DateSelV5, STLUPrtGrp;

{$R *.DFM}

procedure TCsMaintCustDiscFrm.FormActivate(Sender: TObject);
begin
{Setup titles} ;
With GetDiscSQL do
     begin
     Close ;
     Open ;
     end;
CustLabel.Caption := 'Customer: ' + CSLUCustDiscFrm.sCustName;
if CSLUCustDiscfrm.ddTemp.Bypart then
  byLabel.Caption := 'Product'
else
  byLabel.Caption := 'Group';
dellabel.visible := False;
If sFuncMode = 'A' then
   begin
    Caption := 'Add a new Customer Discount' ;
    Discvalmemo.Text := formatfloat('0.00',0);
    DateFromEdit.Text := DateToStr(Date);
    CSLUCustDiscFrm.ddTemp.Date_effec := date;
    PartBitBtn.setfocus;
    end;
If sFuncMode = 'C' then
   begin
    Caption := 'Change a Customer Discount' ;
    DiscDBLookupComboBox.SetFocus;
    end;
If sFuncMode = 'D' then
   begin
    Caption := 'Delete a Customer Discount' ;
    dellabel.visible := True;
    DiscDBLookUpCombobox.enabled := False;
    DiscValMemo.enabled := False;
    DateFromEdit.enabled := False;
    DateToEdit.Enabled := False;
    end;
If sFuncMode <> 'A' then
   begin
    if CSLUCustDiscFrm.ddTemp.bYpart then
      partedit.text := CSLUCustDiscFrm.ddTemp.Part
    else
    Partedit.text := CSLUCusTDiscFrm.ddTemp.Desc;
    PartBitBtn.enabled := False;
   With CSLUCustDiscFrm do
        begin
        DisplayFields(Self);
        end;
   end;
CheckOK(Self) ;
end;

procedure TCsMaintCustDiscFrm.CheckOK(Sender: TObject);
begin
If (PartEdit.Text <> '') and (DiscValMemo.Text <> '') and (DiscDBLookupComboBox.text <> '') and
  (DateFromEdit.Text <> '') then
  okBitBtn.Enabled := True
else
  OKBitBtn.Enabled := False;
  {Enable/disable OK button} ;
end;

procedure TCsMaintCustDiscFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TCsMaintCustDiscFrm.OKBitBtnClick(Sender: TObject);
var
iTempNewCode: Integer;
begin
If sFuncMode = 'A' then
  begin
    With GetLastCodeSQL do
      begin
        Close ;
        Open ;
        First ;
        iTempNewCode := FieldByName('Last_Code').AsInteger + 1 ;
        CSLUCustDiscFrm.DDTemp.Rec := iTempNewCode;
        Close ;
      end;
    With AddSQL do
    begin
      Close ;
      if CSLUCustDiscFrm.DDTemp.ByPart then
        begin
          ParamByName('Part_Group').Clear;
          ParamByName('Part').AsString := PartEdit.Text;
        end
      else
        begin
          ParamByName('Part').Clear;
          ParamByName('Part_Group').AsInteger := Part_Group;
        end;
      ParamByName('Customer_Discount').AsInteger := iTempNewCode;
      ParamByName('Customer').AsInteger := CSLUCustDiscFrm.icust;
      ParamByName('Type').AsString := DiscDBLookupComboBox.keyValue;
      ParamByName('Disc_Val').AsFloat := strtofloat(DiscValMemo.Text);
      ParamByName('Date_Effec').AsDateTime :=StrToDate(DateFromEdit.Text);
      if datetoedit.text = '' then
        ParamByName('Date_Ineffec').clear
      else
        ParamByName('Date_Ineffec').AsDateTime :=StrToDate(DateToEdit.Text);
      ExecSQL ;
    end;
  end;
If sFuncMode = 'C' then
   begin
   {Update an existing code} ;
   With UpdSQL do
   begin
    Close ;
      ParamByName('Cust_Disc').AsInteger := CSLUCustDiscFrm.ddTemp.Rec;
      ParamByName('Customer').AsInteger := CSLUCustDiscFrm.ddTemp.cust;
      ParamByName('Disc_Type').AsString := DiscDBLookupComboBox.keyValue;
      ParamByName('Disc_Val').AsFloat := strtofloat(DiscValMemo.Text);
      ParamByName('Date_Effec').AsDateTime :=StrToDate(DateFromEdit.Text);
      if datetoedit.text = '' then
        ParamByName('Date_Ineffec').clear
      else
        ParamByName('Date_Ineffec').AsDateTime :=StrToDate(DateToEdit.Text);
    ExecSQL ;
    end;
   end;
If sFuncMode = 'D' then
     begin
     if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo, mbYes],0) <> mrYes then
      begin
        Close ;
        Exit ;
      end;
     With DelSQL do
      begin
        Close ;
        ParamByName('Cust_Disc').AsInteger := CSLUCustDiscFrm.ddTemp.Rec;
        ParamByName('Customer').AsInteger := CSLUCustDiscFrm.ddTemp.cust;
        ExecSQL ;
      end;
  end;
end;

procedure TCsMaintCustDiscFrm.CstCntrEditChange(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TCsMaintCustDiscFrm.DiscValEditChange(Sender: TObject);
begin
CheckOK(Self);
end;

procedure TCsMaintCustDiscFrm.PartBitBtnClick(Sender: TObject);
begin
if CSLUCustDiscFrm.ddTemp.ByPart then
  begin
  StPrtMntFrm := TStPrtMntFrm.Create(Self) ;
Try
   StPrtMntFrm.bIs_LookUp := True ;
   StPrtMntFrm.sCode := PartEdit.Text ;
   StPrtMntFrm.ShowModal ;
   If StPrtMntFrm.bOK = True then
      begin
      PartEdit.Text := StPrtMntFrm.sCode ;
      CSLUCustDiscFrm.ddTemp.Part := StPrtMntFrm.scode;
      CSLUCustDiscFrm.ddTemp.Desc := stprtMntFrm.scodeDescr;
      end;
Finally
   StPrtMntFrm.Free ;
   end ;
end;
If not CSLUCustDiscFrm.ddTemp.ByPart then
  begin
   StLUPrtGrpFrm := TStLUPrtGrpFrm.Create(Self) ;
Try
   StLUPrtGrpFrm.bIs_LookUp := True ;
   StLUPrtGrpFrm.ShowModal ;
   If StLUPrtGrpFrm.selected = True then
      begin
      PartEdit.Text := StLUPrtGrpFrm.selname ;
      CSLUCustDiscFrm.ddTemp.Desc := STLUPrtGrpFrm.SelName;
      Part_Group := StLUPrtGrpFrm.iselcode;
      CSLUCustDiscFrm.ddTemp.Group := StLUPrtGrpFrm.iselcode;
      end;
Finally
   StLUPrtGrpFrm.Free ;
   end;
  end;
CheckOk(Self);
end;

procedure TCsMaintCustDiscFrm.DatefromBitBtnClick(Sender: TObject);
begin
    DateSelV5Form := TDateSelV5Form.Create(Self);
  try
     If DateFromEdit.Text <> '' then
        DateSelV5Form.MonthCalendar1.Date := StrToDate(DateFromEdit.Text)
     else
        DateSelV5Form.MonthCalendar1.Date := Date;
    DateSelV5Form.ShowModal;
    If DateSelV5Form.ModalResult = mrOK then
      begin
      DateFromEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
      CSLUCustDiscFrm.ddTemp.Date_effec := DateSelV5Form.MonthCalendar1.Date;
      end;
      finally
    DateSelV5Form.Free;
  end;
CheckOk(self);
end;

procedure TCsMaintCustDiscFrm.DateToBitBtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
     If DateToEdit.Text <> '' then
        DateSelV5Form.MonthCalendar1.Date := StrToDate(DateToEdit.Text)
     else
        DateSelV5Form.MonthCalendar1.Date := Date;
    DateSelV5Form.ShowModal;
    If DateSelV5Form.ModalResult = mrOK then
      begin
      DateToEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
      CSLUCustDiscFrm.ddTemp.Date_ineffec := DateSelV5Form.MonthCalendar1.Date;
      end;
  finally
    DateSelV5Form.Free;
  end;
  CheckOk(Self);
end;

procedure TCsMaintCustDiscFrm.DateFromEditExit(Sender: TObject);
begin
  if DateFromEdit.Text = '' then Exit;
  try
    DateFromEdit.Text := DateToStr(StrToDate(DateFromEdit.Text));
  except
    on EConvertError do
    begin
      MessageDlg('Invalid Date', mtError, [mbAbort], 0);
      DateFromEdit.SetFocus;
      Exit;
    end;
  end;
  if (DateToEdit.Text <> '') and (StrToDate(DateToEdit.Text) <
    StrToDate(DateToEdit.Text)) then
  begin
    MessageDlg('From date is after To date', mtError, [mbAbort], 0);
    DateToEdit.SetFocus;
  end;
  CSLUCustDiscFrm.ddTemp.Date_effec := strtodate(DateFromEdit.Text);
end;

procedure TCsMaintCustDiscFrm.DateToEditExit(Sender: TObject);
begin
  if DateToEdit.Text = '' then Exit;
  try
    DateToEdit.Text := DateToStr(StrToDate(DateToEdit.Text));
  except
    on EConvertError do
    begin
      MessageDlg('Invalid Date', mtError, [mbAbort], 0);
      DateToEdit.SetFocus;
      Exit;
    end;
  end;
  if (DateFromEdit.Text <> '') and (StrToDate(DateToEdit.Text) <
    StrToDate(DateToEdit.Text)) then
  begin
    MessageDlg('From date is after To date', mtError, [mbAbort], 0);
    DateToEdit.SetFocus;
  end
  else
    CSLUCustDiscFrm.ddTemp.Date_ineffec := strtodate(DateToEdit.Text);

end;

procedure TCsMaintCustDiscFrm.DiscValMemoExit(Sender: TObject);
begin
  with Sender as TMemo do
  begin
    Text := formatfloat('0.00', StrToFloat(Text));
    CSLUCustDiscFrm.ddTemp.Disc_Val := strtofloat(Text);
  end;

end;

procedure TCsMaintCustDiscFrm.DiscValMemoKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  with Sender as TMemo do
  begin
    P := Pos('.', Text);
  end;

  case key of
    '0'..'9': ;
    '.':
      if P > 0 then Key := #0;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TCsMaintCustDiscFrm.DisplayFields(Sender: TObject);
begin
with CSLUCustDiscFrm do
begin
  DatefromEdit.Text := DateToStr(ddTemp.date_effec);
if ddTemp.date_ineffec <> 0 then
  DateToEdit.Text := DateToStr(DDTemp.date_ineffec);
DiscValMemo.Text := formatfloat('0.00', ddTemp.disc_Val);
DiscDBLookupComboBox.KeyValue := ddTemp.Typ;
end;


end;

procedure TCsMaintCustDiscFrm.DiscDBLookupComboBoxClick(Sender: TObject);
begin
CSLUCustDiscFrm.ddTemp.Typ := DiscDBLookupComboBox.KeyValue;
checkOK(self);
end;

end.
