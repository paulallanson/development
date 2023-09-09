unit PBMaintCustDisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintCustDiscFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    AddSQL: TFDQuery;
    DelSQL: TFDQuery;
    GetLastCodeSql: TFDQuery;
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
    GetDiscSql: TFDQuery;
    GetDiscDataSource: TDataSource;
    ByLabel: TLabel;
    PartEdit: TEdit;
    PartBitBtn: TBitBtn;
    DiscValMemo: TMemo;
    GetDetsQuery: TFDQuery;
    memPurchasePrice: TMemo;
    Label2: TLabel;
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
    procedure memPurchasePriceExit(Sender: TObject);
    private
    procedure DisplayFields(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
     sFuncMode: String[1] ;
    iCode: Integer ;
    iSupp: integer;
    part_Group: Integer;
    end;

var
  PBMaintCustDiscFrm: TPBMaintCustDiscFrm;

implementation

uses
  System.UITypes,
  PBLUCustDisc, STPrtMnt, STLUPrtGrp, DateSelV5;

{$R *.DFM}

procedure TPBMaintCustDiscFrm.FormActivate(Sender: TObject);
begin
{Setup titles} ;
With GetDiscSQL do
     begin
     Close ;
     Open ;
     end;
CustLabel.Caption := 'Customer: ' + PBLUCustDiscFrm.sCustName;
if PBLUCustDiscFrm.ddTemp.Bypart then
  byLabel.Caption := 'Product'
else
  byLabel.Caption := 'Group';
dellabel.visible := False;
If sFuncMode = 'A' then
   begin
    Caption := 'Add a new Customer Discount' ;
    memPurchasePrice.Text := formatfloat('0.000',0);
    Discvalmemo.Text := formatfloat('0.000',0);
    DateFromEdit.Text := DateToStr(Date);
    PBLUCustDiscFrm.ddTemp.Date_effec := date;
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
    memPurchasePrice.enabled := False;
    DiscValMemo.enabled := False;
    DateFromEdit.enabled := False;
    DateToEdit.Enabled := False;
    end;
If sFuncMode <> 'A' then
   begin
    if PBLUCustDiscFrm.ddTemp.bYpart then
      partedit.text := PBLUCustDiscFrm.ddTemp.Part
    else
    Partedit.text := PBLUCustDiscFrm.ddTemp.Desc;
    PartBitBtn.enabled := False;
   With PBLUCustDiscFrm do
        begin
        DisplayFields(Self);
        end;
   end;
CheckOK(Self) ;
end;

procedure TPBMaintCustDiscFrm.CheckOK(Sender: TObject);
begin
If (PartEdit.Text <> '') and (DiscValMemo.Text <> '') and (DiscDBLookupComboBox.text <> '') and
  (DateFromEdit.Text <> '') then
  okBitBtn.Enabled := True
else
  OKBitBtn.Enabled := False;
  {Enable/disable OK button} ;
end;

procedure TPBMaintCustDiscFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TPBMaintCustDiscFrm.OKBitBtnClick(Sender: TObject);
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
        PBLUCustDiscFrm.DDTemp.Rec := iTempNewCode;
        Close ;
      end;
    With AddSQL do
    begin
      Close ;
      if PBLUCustDiscFrm.DDTemp.ByPart then
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
      ParamByName('Customer').AsInteger := PBLUCustDiscFrm.icust;
      ParamByName('Supplier').AsInteger := PBLUCustDiscFrm.iSupp;
      ParamByName('Type').AsString := DiscDBLookupComboBox.keyValue;
      ParamByName('Disc_Val').AsFloat := StrToFloatDef(DiscValMemo.Text, 0, FormatSettings);
      ParamByName('Part_Purchase_Price').AsFloat := StrToFloatDef(memPurchasePrice.Text, 0, FormatSettings);
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
      ParamByName('Cust_Disc').AsInteger := PBLUCustDiscFrm.ddTemp.Rec;
      ParamByName('Customer').AsInteger := PBLUCustDiscFrm.ddTemp.cust;
      ParamByName('Disc_Type').AsString := DiscDBLookupComboBox.keyValue;
      ParamByName('Disc_Val').AsFloat := StrToFloatDef(DiscValMemo.Text, 0, FormatSettings);
      ParamByName('Date_Effec').AsDateTime :=StrToDate(DateFromEdit.Text);
      ParamByName('Part_Purchase_Price').Asfloat := StrToFloatDef(memPurchasePrice.Text, 0, FormatSettings);
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
        ParamByName('Cust_Disc').AsInteger := PBLUCustDiscFrm.ddTemp.Rec;
        ParamByName('Customer').AsInteger := PBLUCustDiscFrm.ddTemp.cust;
        ExecSQL ;
      end;
  end;
end;

procedure TPBMaintCustDiscFrm.CstCntrEditChange(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TPBMaintCustDiscFrm.DiscValEditChange(Sender: TObject);
begin
CheckOK(Self);
end;

procedure TPBMaintCustDiscFrm.PartBitBtnClick(Sender: TObject);
begin
if PBLUCustDiscFrm.ddTemp.ByPart then
  begin
  StPrtMntFrm := TStPrtMntFrm.Create(Self) ;
Try
   StPrtMntFrm.bIs_LookUp := True ;
   StPrtMntFrm.sCode := PartEdit.Text ;
   StPrtMntFrm.ShowModal ;
   If StPrtMntFrm.bOK = True then
      begin
      PartEdit.Text := StPrtMntFrm.sCode ;
      memPurchasePrice.Text := formatfloat('0.000',stPrtMntFrm.PurchPrice);
      PBLUCustDiscFrm.ddTemp.Part := StPrtMntFrm.scode;
      PBLUCustDiscFrm.ddTemp.Desc := stprtMntFrm.scodeDescr;
      end;
Finally
   StPrtMntFrm.Free ;
   end ;
end;
If not PBLUCustDiscFrm.ddTemp.ByPart then
  begin
   StLUPrtGrpFrm := TStLUPrtGrpFrm.Create(Self) ;
Try
   StLUPrtGrpFrm.bIs_LookUp := True ;
   StLUPrtGrpFrm.ShowModal ;
   If StLUPrtGrpFrm.selected = True then
      begin
      PartEdit.Text := StLUPrtGrpFrm.selname ;
      PBLUCustDiscFrm.ddTemp.Desc := STLUPrtGrpFrm.SelName;
      Part_Group := StLUPrtGrpFrm.iselcode;
      PBLUCustDiscFrm.ddTemp.Group := StLUPrtGrpFrm.iselcode;
      end;
Finally
   StLUPrtGrpFrm.Free ;
   end;
  end;
CheckOk(Self);
end;

procedure TPBMaintCustDiscFrm.DatefromBitBtnClick(Sender: TObject);
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
      PBLUCustDiscFrm.ddTemp.Date_effec := DateSelV5Form.MonthCalendar1.Date;
      end;
      finally
    DateSelV5Form.Free;
  end;
CheckOk(self);
end;

procedure TPBMaintCustDiscFrm.DateToBitBtnClick(Sender: TObject);
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
      PBLUCustDiscFrm.ddTemp.Date_ineffec := DateSelV5Form.MonthCalendar1.Date;
      end;
  finally
    DateSelV5Form.Free;
  end;
  CheckOk(Self);
end;

procedure TPBMaintCustDiscFrm.DateFromEditExit(Sender: TObject);
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
  PBLUCustDiscFrm.ddTemp.Date_effec := strtodate(DateFromEdit.Text);
end;

procedure TPBMaintCustDiscFrm.DateToEditExit(Sender: TObject);
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
    PBLUCustDiscFrm.ddTemp.Date_ineffec := strtodate(DateToEdit.Text);

end;

procedure TPBMaintCustDiscFrm.DiscValMemoExit(Sender: TObject);
begin
  with Sender as TMemo do
  begin
    Text := formatfloat('0.000', StrToFloatDef(Text, 0, FormatSettings));
    PBLUCustDiscFrm.ddTemp.Disc_Val := StrToFloatDef(Text, 0, FormatSettings);
  end;

end;

procedure TPBMaintCustDiscFrm.DiscValMemoKeyPress(Sender: TObject;
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

procedure TPBMaintCustDiscFrm.DisplayFields(Sender: TObject);
begin
with PBLUCustDiscFrm do
begin
  DatefromEdit.Text := DateToStr(ddTemp.date_effec);
if ddTemp.date_ineffec <> 0 then
  DateToEdit.Text := DateToStr(DDTemp.date_ineffec);

memPurchasePrice.Text := formatfloat('0.000', ddTemp.purch_price);
DiscValMemo.Text := formatfloat('0.000', ddTemp.disc_Val);
DiscDBLookupComboBox.KeyValue := ddTemp.Typ;
end;


end;

procedure TPBMaintCustDiscFrm.DiscDBLookupComboBoxClick(Sender: TObject);
begin
  PBLUCustDiscFrm.ddTemp.Typ := DiscDBLookupComboBox.KeyValue;
  checkOK(self);
end;

procedure TPBMaintCustDiscFrm.memPurchasePriceExit(Sender: TObject);
begin
  with Sender as TMemo do
  begin
    Text := formatfloat('0.000', StrToFloatDef(Text, 0, FormatSettings));
    PBLUCustDiscFrm.ddTemp.Purch_Price := StrToFloatDef(Text, 0, FormatSettings);
  end;

end;

end.
