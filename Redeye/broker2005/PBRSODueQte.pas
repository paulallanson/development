(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Overdue Quotation Print Selection form.

VSS Info:
$Header: /PBL D5/PBRSODueQte.pas 11    7/02/:1 17:07 Paul $
$History: PBRSODueQte.pas $
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 7/02/:1    Time: 17:07
 * Updated in $/PBL D5
 * Changed to stop the selections from being reset after running a
 * selection.
 * 
 * *****************  Version 10  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:21
 * Updated in $/PBL D5
 * Setting form position to screen centre.
 * 
 * *****************  Version 9  *****************
 * User: Janiner      Date: 12/10/:0   Time: 12:30
 * Updated in $/PBL D5
 * Standardise on Formatdate routines to use PBDatestr from within
 * PBPOObjects, which formats the date based on the selections made in
 * control panel, regional settings, data, short date style.
 * 
 * *****************  Version 8  *****************
 * User: Davidn       Date: 6/10/00    Time: 15:59
 * Updated in $/PBL D5
 * Changing form type to dialogue to prevent resizing,
 * Removing hte maximise/minimise buttons.
 * 
 * *****************  Version 7  *****************
 * User: Janiner      Date: 4/10/:0    Time: 13:25
 * Updated in $/PBL D5
 * Allow '' in date selection until checked in check routine
 * 
 * *****************  Version 6  *****************
 * User: Janiner      Date: 3/10/:0    Time: 12:02
 * Updated in $/PBL D5
 * Allow input of an overdue date, as well as allowing the look-up
 * facility.
 * 
 * *****************  Version 5  *****************
 * User: Janiner      Date: 9/03/:0    Time: 16:12
 * Updated in $/PBL D5
 * Correct problem of rep name not appearing in header information, if al
 * rep is selected.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 16/12/99   Time: 15:17
 * Updated in $/PBL D5
 * Changes to printer setup dialog to allow selection of pages and number
 * of copies.  Some bug fixes to Enquiry, PO and Quotation printing.
 * Correct delivery address printing, also required by date.
 *
 * *****************  Version 3  *****************
 * User: Roddym       Date: 13/12/99   Time: 14:16
 * Updated in $/PBL D5
 * Use new CCSPrinterSetup and set QuickReport's printerindex to the same
 * as the global printer setting.
 *
 * *****************  Version 2  *****************
 * User: Roddym       Date: 9/12/99    Time: 16:31
 * Updated in $/PBL D5
 * QuickReport conversions.  Get rid of semicolons after comments.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
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

uses PBLURep, pbDatabase, CCSPRint, PBRPODueQte, DateSelV5, pbMainMenu;

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

