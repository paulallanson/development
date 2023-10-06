unit PBEnqCancelLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBCtrls, FireDAC.Stan.Param;

type
  TPBEnqCancelLineFrm = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    lblEnquiryNo: TLabel;
    lblCustomer: TLabel;
    lblDescription: TLabel;
    pnlDetails: TPanel;
    Label1: TLabel;
    dblkpReasons: TDBLookupComboBox;
    ReasMntBitBtn: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    memUnitPrice: TMemo;
    Label45: TLabel;
    dblkpPriceUnit: TDBLookupComboBox;
    edtCompetitor: TEdit;
    chkbxInactive: TCheckBox;
    Label2: TLabel;
    memNotes: TMemo;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure memUnitPriceEnter(Sender: TObject);
    procedure memUnitPriceKeyPress(Sender: TObject; var Key: Char);
    procedure ValidateMoney(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ReasMntBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FbInactive: boolean;
    FEnquiryNo: integer;
    FEnquiryLine: integer;
    sOldValue: string;
    FNarrative: integer;
    procedure SetbInactive(const Value: boolean);
    procedure SetEnquiryLine(const Value: integer);
    procedure SetEnquiryNo(const Value: integer);
    procedure SetNarrative(const Value: integer);
    { Private declarations }
  public
    property bInactive: boolean read FbInactive write SetbInactive;
    property EnquiryNo: integer read FEnquiryNo write SetEnquiryNo;
    property EnquiryLine: integer read FEnquiryLine write SetEnquiryLine;
    property Narrative: integer read FNarrative write SetNarrative;
  end;

var
  PBEnqCancelLineFrm: TPBEnqCancelLineFrm;

implementation

uses UITypes, pbEnqsdm, CCSCommon, pbDatabase, PBLUReasCode;

{$R *.dfm}

{ TPBEnqCancelLineFrm }

procedure TPBEnqCancelLineFrm.SetbInactive(const Value: boolean);
begin
  FbInactive := Value;
end;

procedure TPBEnqCancelLineFrm.SetEnquiryLine(const Value: integer);
begin
  FEnquiryLine := Value;
  lblEnquiryNo.caption := 'Enquiry No:' + inttostr(EnquiryNo) + '/' + inttostr(FEnquiryLine);
end;

procedure TPBEnqCancelLineFrm.SetEnquiryNo(const Value: integer);
begin
  FEnquiryNo := Value;
end;

procedure TPBEnqCancelLineFrm.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpReasons.keyvalue <> 0) AND
                    (memUnitPrice.text <> '') and
                    (dblkpPriceUnit.keyvalue <> 0) AND
                    (edtCompetitor.text <> '');
end;

procedure TPBEnqCancelLineFrm.FormActivate(Sender: TObject);
begin
  with dtmdlEnqs.qryReasons do
    begin
      close;
      open;
      dblkpReasons.listsource := dtmdlEnqs.dtsReasons;
    end;

  with dtmdlEnqs.qryPriceUnit do
    begin
      close;
      open;
      dblkpPriceUnit.listsource := dtmdlEnqs.dtsPriceUnit;
    end;

  with dtmdlEnqs.qryGetEnquiryLine do
    begin
      close;
      parambyname('Enquiry').asinteger := EnquiryNo;
      parambyname('Line').asinteger := EnquiryLine;
      open;

      dblkpReasons.keyvalue := fieldbyname('Enq_Inactive_Reason').asinteger;
      memUnitPrice.Text := formatfloat('0.00',fieldbyname('Enq_inactive_Winning_price').asfloat);
      dblkpPriceUnit.KeyValue := fieldbyname('Enq_inactive_price_unit').asinteger;

      edtCompetitor.text := fieldbyname('Enq_inactive_Winning_Company').asstring;

      Narrative := fieldbyname('Enq_inactive_Notes').asinteger;
      memNotes.Text := dmBroker.GetNarrative(fieldbyname('Enq_inactive_Notes').asinteger);

      chkbxInactive.checked := (fieldbyname('Enq_InActive').asstring = 'Y');
      chkbxInactive.visible := not (fieldbyname('Enq_InActive').asstring = 'N');
    end;
end;

procedure TPBEnqCancelLineFrm.FormCreate(Sender: TObject);
begin
  dtmdlEnqs := TdtmdlEnqs.Create(Self);
end;

procedure TPBEnqCancelLineFrm.FormDestroy(Sender: TObject);
begin
  dtmdlEnqs.Free;
end;

procedure TPBEnqCancelLineFrm.memUnitPriceEnter(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBEnqCancelLineFrm.ValidateMoney(Sender: TObject);
var
  TempStr: string;
begin
  {Validate money on exit}
  TempStr := FormatMoneyTo3DP((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    If (Sender as TMemo).Enabled then
        (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
end;

procedure TPBEnqCancelLineFrm.memUnitPriceKeyPress(Sender: TObject;
  var Key: Char);
var
  P: Integer;
begin
  if Sender is TEdit then
    with Sender as TEdit do
      P := Pos('.', Text)
  else
    if Sender is TMemo then
      with Sender as TMemo do
        P := Pos('.', Text)
    else { wot is the Sender ? }
      Exit;
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

procedure TPBEnqCancelLineFrm.btnOKClick(Sender: TObject);
var
  iTempNarr: integer;
begin
  ModalResult := idOK;
  with dtmdlEnqs.qryUpdEnquiryLine do
    begin
      close;
      parambyname('Enquiry').asinteger := EnquiryNo;
      parambyname('Line').asinteger := EnquiryLine;
      parambyname('Enq_inactive_Winning_price').asfloat := StrToFloatDef(memunitPrice.text, 0, FormatSettings);
      parambyname('Enq_inactive_Price_Unit').asinteger := dblkpPriceUnit.keyvalue;
      parambyname('Enq_inactive_Winning_Company').asstring := edtCompetitor.text;
      parambyname('Enq_InActive_Reason').asinteger := dblkpReasons.keyvalue;
      if chkbxInactive.Checked then
        parambyname('Enq_InActive').asstring := 'Y'
      else
        parambyname('Enq_InActive').asstring := 'N';

      if not chkbxInactive.visible then
        parambyname('Enq_InActive').asstring := 'Y';
        
      iTempNarr := Narrative;
      dmBroker.SaveNarrative(iTempNarr,memNotes.text);
      Narrative := iTempNarr;
      if Narrative = 0 then
        ParamByName('Enq_inactive_Notes').clear
      else
        ParamByName('Enq_inactive_Notes').Asinteger := Narrative;
      execsql;
    end;
end;

procedure TPBEnqCancelLineFrm.SetNarrative(const Value: integer);
begin
  FNarrative := Value;
end;

procedure TPBEnqCancelLineFrm.ReasMntBitBtnClick(Sender: TObject);
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

  dtmdlEnqs.qryReasons.Active := False;
  dtmdlEnqs.qryReasons.Active := True;
end;

procedure TPBEnqCancelLineFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempWord: Word;
begin
  if modalResult = mrok then exit;

  if not(btnOK.enabled) then exit;

  TempWord := MessageDlg('Do you want to save these details?', mtConfirmation,
    [mbYes, mbNo, mbCancel], 0) ;

  if TempWord = mrNo then
      Exit
  else
  if TempWord = mrCancel then
      Action := caNone
  else
    btnOKClick(self);
end;

end.
