unit PBRSODueQte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, PBPOObjects, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSODueQteFrm = class(TForm)
    AllOrOneRadioGroup: TRadioGroup;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DateLabel: TLabel;
    DateEdit: TEdit;
    RepGrpBox: TGroupBox;
    RepEdit: TEdit;
    Label1: TLabel;
    RepLUSpeedButton: TSpeedButton;
    DateSpeedButton: TSpeedButton;
    qryRep: TFDQuery;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    procedure RepLUSpeedButtonClick(Sender: TObject);
    procedure DateSpeedButtonClick(Sender: TObject);
    procedure DateEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Preview: ByteBool;
    ODueDate: TDateTime;
    SelRep: Integer;
    SelName: string;
    procedure SetRepOnly;
  end;

var
  PBRSODueQteFrm: TPBRSODueQteFrm;

implementation

uses UITypes, PBLURep, pbDatabase, CCSPRint, PBRPODueQte, DateSelV5, pbMainMenu;

{$R *.DFM}

procedure TPBRSODueQteFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (AllOrOneRadioGroup.ItemIndex = 0) or
    (RepEdit.Text <> '');
  PreviewBitBtn.Enabled := (AllOrOneRadioGroup.ItemIndex = 0) or
    (RepEdit.Text <> '');
end;

procedure TPBRSODueQteFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
    RepGrpBox.Visible := False
  else
    RepGrpBox.Visible := True;
  CanPrint(Self);
end;

procedure TPBRSODueQteFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
end;

procedure TPBRSODueQteFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
end;

procedure TPBRSODueQteFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  PBRPODueQteFrm := TPBRPODueQteFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPODueQteFrm.PrinterSettings := PrinterSettings;
      PBRPODueQteFrm.Preview := Preview;
      PBRPODueQteFrm.ODueDate := ODueDate;

      if AllOrOneRadioGroup.ItemIndex = 0 then
        PBRPODueQteFrm.RepNo := 0
      else
        PBRPODueQteFrm.RepNo := SelRep;
        PBRPODueQteFrm.RepName := SelName;
      if PBRPODueQteFrm.GetDetails(Self) = 0 then
      begin
        {Record count is zero - nothing to print}
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        Exit;
      end;
      {Actually print or preview the report}
      if (not Preview) then
        if SetUpPrinter(PrinterSettings) then
          PBRPODueQteFrm.PrintODueQteQuickReport.Print
        else
      else
        PBRPODueQteFrm.PrintODueQteQuickReport.Preview;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPODueQteFrm.Free;
  end;
end;

procedure TPBRSODueQteFrm.FaxBitBtnClick(Sender: TObject);
begin
  MessageDlg('Faxing not configured', mtError, [mbAbort], 0);
end;

procedure TPBRSODueQteFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelRep <> 0 then
    RepEdit.Text := SelName
  else
    RepEdit.Text := '';
end;

procedure TPBRSODueQteFrm.RepLUSpeedButtonClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    {PBLURepFrm.bODueEnqsOnly := True ;
    PBLURepFrm.dODueDate := ODueDate ;
    } PBLURepFrm.SelCode := SelRep;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelRep := PBLURepFrm.SelCode;
      SelName := PBLURepFrm.SelName;
      RepEdit.Text := PBLURepFrm.SelName;
    end;
  finally
    PBLURepFrm.Free;
  end;
  CanPrint(Self);
end;

procedure TPBRSODueQteFrm.DateSpeedButtonClick(Sender: TObject);
var
  DateSelV5Form: TDateSelV5Form;
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := ODueDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
    begin
      ODueDate := DateSelV5Form.Date;
      DateEdit.Text := DateToStr(ODueDate);
    end;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TPBRSODueQteFrm.DateEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSODueQteFrm.FormShow(Sender: TObject);
begin
  AllOrOneRadioGroup.itemindex := 0;
  ODueDate := Date;
  DateEdit.Text := DateToStr(ODueDate);

  if pos('Rep only',PBRSODueQteFrm.caption) > 0 then
    SetrepOnly;
  CanPrint(self);
  DateEdit.SetFocus;
end;

procedure TPBRSODueQteFrm.SetRepOnly;
begin
  AllorOneRadioGroup.enabled := false;
  AllorOneRadioGroup.itemindex := 1;
  repGrpBox.Visible := true;
  repGrpBox.enabled := false;
  Selrep := frmpbMainMenu.iRep;
  with qryRep do
    begin
      close;
      parambyname('Rep').asinteger := frmpbMainMenu.iRep;
      open;
      RepEdit.text := fieldbyname('Name').asstring;
    end;
end;

procedure TPBRSODueQteFrm.DateEditExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  If DateEdit.Text = '' then
    Exit;
  try
    NewDate := StrToDate(DateEdit.Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      DateEdit.SetFocus;
      Exit;
    end;
  end;

  DateEdit.Text := PBDatestr(NewDate);
  ODueDate := NewDate;
  CanPrint(Self);
end;


procedure TPBRSODueQteFrm.FormCreate(Sender: TObject);
begin
//  dmBroker.ScreenAccessControl(Self,'QuoODueBitBtn',frmpbMainMenu.iOperator,0,frmpbMainMenu.iRep) ;
end;

end.

