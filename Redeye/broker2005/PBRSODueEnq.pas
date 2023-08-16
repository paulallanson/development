(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Overdue Enquiry Print Selection form.

VSS Info:
$Header: /PBL D5/PBRSODueEnq.pas 14    6/06/:3 17:05 Paul $
$History: PBRSODueEnq.pas $
 * 
 * *****************  Version 14  *****************
 * User: Paul         Date: 6/06/:3    Time: 17:05
 * Updated in $/PBL D5
 * Changed to get the Windows temp directory
 * 
 * *****************  Version 13  *****************
 * User: Janiner      Date: 7/11/:2    Time: 14:17
 * Updated in $/PBL D5
 * Remember to reset bemailing if choosing faxing and visa-versa.
 * 
 * *****************  Version 12  *****************
 * User: Janiner      Date: 7/11/:2    Time: 9:52
 * Updated in $/PBL D5
 * Remove logo and reformat tiltles.  Allow emailing of report to one
 * selected supplier.
 * 
 * *****************  Version 11  *****************
 * User: Paul         Date: 7/02/:1    Time: 17:07
 * Updated in $/PBL D5
 * Changed to stop the selections from being reset after running a
 * selection.
 * 
 * *****************  Version 10  *****************
 * User: Davidn       Date: 17/10/00   Time: 15:12
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
 * User: Davidn       Date: 6/10/00    Time: 15:55
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
 * User: Roddym       Date: 25/01/:0   Time: 9:02
 * Updated in $/PBL D5
 * After faxing anything, set the selected printer back to default
 * otherwise anything printed thereafter still goes to fax.
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
unit PBRSODueEnq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, PBPOObjects, ExtCtrls, DB, inifiles, QrExport,
  CCSCommon,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSODueEnqFrm = class(TForm)
    AllOrOneRadioGroup: TRadioGroup;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DateLabel: TLabel;
    DateEdit: TEdit;
    SuppGrpBox: TGroupBox;
    SuppEdit: TEdit;
    Label1: TLabel;
    SuppLUSpeedButton: TSpeedButton;
    DateSpeedButton: TSpeedButton;
    EmailBitBtn: TBitBtn;
    rgRep: TRadioGroup;
    pnlRepSearch: TPanel;
    lblCustBran: TLabel;
    edtRep: TEdit;
    btnRep: TButton;
    qryRep: TFDQuery;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    procedure SuppLUSpeedButtonClick(Sender: TObject);
    procedure DateSpeedButtonClick(Sender: TObject);
    procedure DateEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DateEditExit(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PrintToAttachment(Sender: TObject);
    procedure rgRepClick(Sender: TObject);
    procedure btnRepClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    bPreview, bFaxing, bEmailing: ByteBool;
    SelRepCode: integer;
    SelRepText : string;
    ODueDate: TDateTime;
    SelSupplier, SelBranch: Integer;
    SelName: string;
    FActDone : Boolean;
    FEnquiry : integer;
    sTo, sSubject, sBody, sSalutation: string;
    FEmailApplication : string;
    FEmailLocation : string;
    FEmailAttachment : TstringList;
    fEmailAttachmentType : string;
    procedure GetEmailApp;
    procedure SetRepOnly;
  end;

var
  PBRSODueEnqFrm: TPBRSODueEnqFrm;

implementation

uses
  System.UITypes,
  PBFaxToOne, PBEmailToOne, PBLUSupp, CCSPrint, PBRPODueEnq, PBLURep,
  pbDatabase, printers, DateSelV5, pbMainMenu, Printer.Tools;

var
  sAttachmentType: string;
{$R *.DFM}

procedure TPBRSODueEnqFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := (AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '');
  PreviewBitBtn.Enabled := (AllOrOneRadioGroup.ItemIndex = 0) or
    (SuppEdit.Text <> '');
  emailBitBtn.Enabled := (AllOrOneRadioGroup.ItemIndex = 1) and
    (SuppEdit.Text <> '');
end;

procedure TPBRSODueEnqFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    SuppGrpBox.Visible := False;
  end
  else
  begin
    SuppGrpBox.Visible := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSODueEnqFrm.PreviewBitBtnClick(Sender: TObject);
begin
  bPreview := True;
  bFaxing := False;
  bEmailing := False;
  PrintReport(Self);
end;

procedure TPBRSODueEnqFrm.PrintBitBtnClick(Sender: TObject);
begin
  bPreview := False;
  bFaxing := False;
  bEmailing := False;
  PrintReport(Self);
end;

procedure TPBRSODueEnqFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  sBodyText: string;
  sSenderName, sSenderEmail, sRecipientName: string;
begin
  {Setup and print the report}
  PBRPODueEnqFrm := TPBRPODueEnqFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPODueEnqFrm.PrinterSettings := PrinterSettings;
      PBRPODueEnqFrm.Preview := bPreview;
      PBRPODueEnqFrm.ODueDate := ODueDate;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        PBRPODueEnqFrm.SupplierNo := 0;
        PBRPODueEnqFrm.BranchNo := 0;
      end
      else
      begin
        PBRPODueEnqFrm.SupplierNo := SelSupplier;
        PBRPODueEnqFrm.BranchNo := SelBranch;
        PBRPODueEnqFrm.SupplierName := SelName;
      end;
      if RgRep.ItemIndex = 0 then
        PBRPODueEnqFrm.RepNo := 0
      else
        begin
          PBRPODueEnqFrm.RepNo := SelRepCode;
          PBRPODueEnqFrm.Repname := edtRep.Text;
        end;
      if PBRPODueEnqFrm.GetDetails(Self) = 0 then
      begin
        {Record count is zero - nothing to print}
        if ((not bFaxing) and (not bEmailing)) then
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
        else
          if (not bEmailing) then
            MessageDlg('There is nothing to fax', mtError, [mbAbort], 0)
          else
            MessageDlg('There is nothing to Email', mtError, [mbAbort], 0);
      end
      else
      begin
        {Actually print or preview the report}
        if (not bPreview) then
        begin
          if bFaxing then
          begin
            PBFaxToOneFrm := TPBFaxToOneFrm.Create(Self);
            try
              PBFaxToOneFrm.FaxNoEdit.Text :=
                PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Fax_Number').AsString;
              PBFaxToOneFrm.FaxDescrLabel.Caption := 'O/D Enqs: ' +
                Trim(PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Name').AsString)
                  + ', ' +
                Trim(PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Branch_Name').AsString);
              PBFaxToOneFrm.ShowModal;
              if PBFaxToOneFrm.ModalResult <> mrOK then
                Exit;
            finally
              PBFaxToOneFrm.Free;
            end;
          end;
          if bEmailing then
          begin
            PBEmailToOneFrm := TPBEmailToOneFrm.Create(Self);
            try
              PBRPODueEnqFrm.PrintODueEnqQuickReport.ShowProgress := False;
              fEnquiry := PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Enquiry').AsInteger;
              if PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('ExportFilter').AsString = '' then
                PBEmailToOneFrm.sAttachmentType := fEmailAttachmentType
              else
                PBEmailToOneFrm.sAttachmentType :=PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('ExportFilter').AsString;
              if PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Cont_Email').AsString = '' then
                PBEmailToOneFrm.FaxNoEdit.Text :=
                PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Email').AsString
              else
                PBEmailToOneFrm.FaxNoEdit.Text :=
                PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Cont_Email').AsString;
              PBEmailToOneFrm.FaxDescrLabel.Caption := 'O/D Enqs: ' +
                Trim(PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Name').AsString)
                  + ', ' +
                Trim(PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Branch_Name').AsString);
              sSubject := 'Overdue Enquiry Report ';
              sSalutation := PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Salutation').AsString;
              PBEmailToOneFrm.ShowModal;
              if PBEmailToOneFrm.ModalResult <> mrOK then
                Exit;
              sTo := Trim(PBEmailToOneFrm.FaxNoEdit.Text);
              sSenderName := frmPBMainMenu.sOperator_Name;
              sSenderEmail := frmPBMainMenu.sOperator_Email;

              if trim(PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Contact_Name').AsString) = '' then
                sRecipientName := PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Name').AsString
              else
                sRecipientName := PBRPODueEnqFrm.GetEnquiriesSQL.FieldByName('Contact_Name').AsString;

              sAttachmentType := PBEmailToOneFrm.cmbExportFilter.keyvalue;

              PrintToAttachment(Self);
              sBodyText := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

              if trim(sSalutation) = '' then
                sBody := sBodytext
              else
                sBody := 'Dear ' + sSalutation+','+#13#10#13#10''+ sBodytext;
                
              if frmPBMainMenu.EmailApplication = 'GENERIC' then
                  {Send to Email database}
                dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
              else
                EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
            finally
            PBEmailToOneFrm.Free;
            end;
          end;
          if ((not bFaxing) and (not bEmailing)) then
              if SetUpPrinter(PrinterSettings) then
                PBRPODueEnqFrm.PrintODueEnqQuickReport.Print
        end
        else
          PBRPODueEnqFrm.PrintODueEnqQuickReport.Preview;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPODueEnqFrm.Free;
  end;
end;

procedure TPBRSODueEnqFrm.FaxBitBtnClick(Sender: TObject);
begin
  try
    bPreview := False;
    bFaxing := True;
    bEmailing := False;
    PrintReport(Self);
  finally
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TPBRSODueEnqFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

procedure TPBRSODueEnqFrm.SuppLUSpeedButtonClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  try
    PBLUSuppFrm.bODueEnqsOnly := True;
    PBLUSuppFrm.dODueDate := ODueDate;
    PBLUSuppFrm.SelCode := SelSupplier;
    PBLUSuppFrm.SelBranch := SelBranch;
    PBLUSuppFrm.bAllow_Upd := False;
    PBLUSuppFrm.bIs_Lookup := True;
    PBLUSuppFrm.bSel_Branch := True;
    PBLUSuppFrm.ShowModal;
    if PBLUSuppFrm.Selected then
    begin
      SelSupplier := PBLUSuppFrm.SelCode;
      SelBranch := PBLUSuppFrm.SelBranch;
      SelName := PBLUSuppFrm.SelName;
      SuppEdit.Text := PBLUSuppFrm.SelName+' / '+ PBLUSuppFrm.SelBranchName;
    end;
  finally
    PBLUSuppFrm.Free;
  end;
  CanPrint(Self);
end;

procedure TPBRSODueEnqFrm.DateSpeedButtonClick(Sender: TObject);
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

procedure TPBRSODueEnqFrm.DateEditKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSODueEnqFrm.FormShow(Sender: TObject);
begin
  AllOrOneRadioGroup.itemindex := 0;
  ODueDate := Date;
  DateEdit.Text := DateToStr(ODueDate);

  if pos('Rep only',PBRSODueEnqFrm.caption) > 0 then
    SetrepOnly;
  CanPrint(Self);
  DateEdit.SetFocus;
end;

procedure TPBRSODueEnqFrm.SetRepOnly;
begin
  rgRep.enabled := false;
  rgRep.itemindex := 1;
  pnlRepSearch.Visible := true;
  pnlRepSearch.enabled := false;
  SelrepCode := frmpbMainMenu.iRep;
  with qryRep do
    begin
      close;
      parambyname('Rep').asinteger := frmpbMainMenu.iRep;
      open;
      edtRep.text := fieldbyname('Name').asstring;
    end;
end;

procedure TPBRSODueEnqFrm.DateEditExit(Sender: TObject);
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


procedure TPBRSODueEnqFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  dmBroker.bEmailSent := false;
  try
    bPreview := False;
    bemailing := True;
    bFaxing := False;
    PrintReport(Self);
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
    if (frmPBMainMenu.EmailApplication = 'GENERIC') and dmBroker.bEmailSent then
      begin
        messagedlg('Emails have been added to your Email Server and will be sent shortly.', mtInformation, [mbOk], 0);
        close;
      end;
  end;
end;

procedure TPBRSODueEnqFrm.FormActivate(Sender: TObject);
begin
  if not FActDone then
  begin
    FEmailAttachment := TStringList.create;
    GetEmailApp;
    FActDone := true;
  end;
end;

procedure TPBRSODueEnqFrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
end;

procedure TPBRSODueEnqFrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);
  try
    with IniFile do
    begin
      FEmailApplication := ReadString('Email', 'Application', 'None');
      FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
      FEmailAttachmentType := ReadString ('Email', 'Def Attach Type', 'None');
    end;
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSODueEnqFrm.PrintToAttachment(Sender: TObject);
begin
  var filename := 'OverdueEnqs' + '-' + PBRPODueEnqFrm.RepNo.ToString;
  TPrinterTools.New.PrintToAttachment(PBRPODueEnqFrm.PrintODueEnqQuickReport, FEmailAttachment, fileName, sAttachmentType);
end;

procedure TPBRSODueEnqFrm.rgRepClick(Sender: TObject);
begin
{hide customer selection edit box all customers selected and re-formulate query if anything changes}
  if (rgRep.ItemIndex = 0) then
  begin
    pnlRepSearch.Visible := False;
    EdtRep.Text := '';
  end
  else
  begin
    pnlRepSearch.Visible := True;
  end;
end;

procedure TPBRSODueEnqFrm.btnRepClick(Sender: TObject);
begin
  PBLURepFrm := TPBLURepFrm.Create(Self);
  try
    PBLURepFrm.bIs_Lookup := True;
    PBLURepFrm.bAllow_Upd := False;
    PBLURepFrm.SelCode := SelRepCode;
    PBLURepFrm.ShowModal;
    if PBLURepFrm.Selected then
    begin
      SelrepCode := PBLURepFrm.SelCode;
      SelrepText := PBLURepFrm.SelName;
    end;
    edtRep.Text := SelRepText;
  finally
    PBLURepFrm.Free;
  end;
end;

procedure TPBRSODueEnqFrm.FormCreate(Sender: TObject);
begin
//  dmBroker.ScreenAccessControl(Self,'EnqPrintODueBitBtn',frmpbMainMenu.iOperator,0,frmpbMainMenu.iRep) ;
end;

end.

