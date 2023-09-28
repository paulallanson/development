unit STNegStksl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TSTNegStkSlfrm = class(TForm)
    PrintBitBtn: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SeqByRadioGroup: TRadioGroup;
    ChkBxExcProd: TCheckBox;
    procedure CallPrintPreview (TempPreview: ByteBool);
    procedure BitBtn2Click(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  STNegStkSlfrm: TSTNegStkSlfrm;

implementation

uses UITypes, STNegStkRep;


{$R *.DFM}

{ TClNegStkSlform }

procedure TSTNegStkSlfrm.CallPrintPreview(TempPreview: ByteBool);
begin
  STNegStkRepFrm := TSTNegStkRepFrm.Create(Self);
  If SeqBYRadioGroup.ItemIndex = 1 then
    STNegStkRepFrm.bSeqBy := True
  else
    STNegStkRepFrm.bSeqBy := False;
  STNegStkRepFrm.bExcProd := ChkBxExcProd.Checked;
  with STNegStkRepFrm do
  try
//    iRepOptions := OptionsRadioGroup.ItemIndex;
{    if OneOrAllRadioGroup.ItemIndex = 0 then
      sStoreCode := ''
    else
      sStoreCode := StoreDBLookupComboBox.Keyvalue; }
    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        NegStkQuickReport.Preview
      else
      begin
        NegStkQuickReport.PrinterSetup;
        if NegStkQuickReport.Tag = 0 then
          NegStkQuickReport.Print;
      end;
    end;
  finally;
    STNegStkRepFrm.Free;
  end;
end;

procedure TSTNegStkSlfrm.BitBtn2Click(Sender: TObject);
begin
  CallPrintPreview(True);
end;

procedure TSTNegStkSlfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(False);
end;

end.
