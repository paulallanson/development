unit PBRSQuo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, CCSDataBroker, PBDBQuoLtr, PBDBQuoSumLtr,
  QrExport, CCSCommon, CCSPress, Inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TQuoLetterClass = class of TdbQuoLtr;

  TPBRSQuoFrm = class(TForm)
    MyOrAllRadioGroup: TRadioGroup;
    AllOrOneRadioGroup: TRadioGroup;
    GetEnqSQL: TFDQuery;
    pnlButtons: TPanel;
    cbPrintLogo: TCheckBox;
    CancelBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    FaxBitBtn: TBitBtn;
    gbLayouts: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cmbPageLayout: TComboBox;
    cmbLetterLayout: TComboBox;
    EmailBitBtn: TBitBtn;
    TypeRadioGroup: TRadioGroup;
    SelectionGroup: TGroupBox;
    Label3: TLabel;
    EnqLUSpeedButton: TSpeedButton;
    SelectionMemo: TMemo;
    SelectLst: TListBox;
    AddIntSelQuery: TFDQuery;
    AddWorkSQL: TFDQuery;
    DelWorkSQL: TFDQuery;
    GetLastIntSelSQL: TFDQuery;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure EnqLUSpeedButtonClick(Sender: TObject);
    procedure MyOrAllRadioGroupClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure EmailReport(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildEmailDetails;
    Procedure ClearEnqNoArray(Sender: TObject);
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEmailArray(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SelectionMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectionMemoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cbPrintLogoClick(Sender: TObject);
    procedure TypeRadioGroupClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    FDefaultBin: integer;
    FDefaultPrinter: string;
    procedure SetDefaultBin(const Value: integer);
    procedure SetDefaultPrinter(const Value: string);
  private
    FPrinted: Boolean;
    DataBroker : TdbQuoLtr;
    LetterType : integer;
    Preview: ByteBool;
    FActDone : Boolean;
    FFaxing : Boolean;
    FEmail : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    FEmailLocation : string;
    procedure CreateDataBroker;
    function  DBFactory(aClass : TQuoLetterClass) : Pointer;
    procedure LoadCombos;
    procedure GetSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    Function IncrementNo(StartStr: String): String ;
    procedure BuildSelection;
    Function GetNextIntSelCode(Sender: TObject): Integer;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure GetEmailApp;
    procedure RollThePresses(aBroker : TDataBroker);
    procedure PrintToAttachment(PrintingPress: TfrmPrintingPress; EnqNumber: integer);
    function GetBinSelection: integer;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetPrinterBin(BinCode: integer);
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
    property DefaultBin: integer read FDefaultBin write SetDefaultBin;
 public
    iIntSelCode: Integer;
    bOK: boolean;
  end;
var
  PBRSQuoFrm : TPBRSQuoFrm;
  FaxArray: array[1..100, 1..5] of string;
  EMailArray: array[1..100, 1..11] of string;
  EnqNoArray: array[1..100] of integer;
  EnqArrayCount: integer;
implementation

uses
  PBFaxList, PBEmailList, PBSendFax, LetterDM, printers, CCSPrint, PDLetter,
  pbMainMenu, pbDatabase, Printer.Tools;

var
  sAttachmentType: string;

{$R *.DFM}

procedure TPBRSQuoFrm.CanPrint(Sender: TObject);
var
  Printable : Boolean;
begin
  Printable := ((cmbPageLayout.Text <> '') and (cmbLetterLayout.Text <> '')) and
    ((AllOrOneRadioGroup.ItemIndex = 0) or (selectionmemo.Text <> ''));
  {Check if can print}
  PrintBitBtn.Enabled := Printable;
  PreviewBitBtn.Enabled := Printable;
  FaxBitBtn.Enabled := Printable;
  EmailBitBtn.Enabled := Printable and (FEmailApplication <> '');
end;

procedure TPBRSQuoFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    selectionmemo.Enabled := False;
    SelectionGroup.font.Color := ClGray;
    EnqLUSpeedButton.Enabled := False;
    SelectionMemo.Text := '';
  end
  else
  begin
  SelectionMemo.Enabled := True;
    SelectionGroup.font.Color := ClBlack;
    EnqLUSpeedButton.Enabled := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSQuoFrm.PreviewBitBtnClick(Sender: TObject);
begin
  Preview := True;
  PrintReport(Self);
end;

procedure TPBRSQuoFrm.PrintBitBtnClick(Sender: TObject);
begin
  Preview := False;
  PrintReport(Self);
  bOK := true;
end;

procedure TPBRSQuoFrm.PrintReport(Sender: TObject);
begin
  {Setup and print the report}
  DelIntSelCode(iIntSelCode, True);
  getselection;
  CreateDataBroker;
  try
    DataBroker.Preview := Preview;
    DataBroker.LayoutName := cmbPageLayout.Text;
    DataBroker.LetterName := cmbLetterLayout.Text;
    DataBroker.OnlyMine := (MyOrAllRadioGroup.ItemIndex = 0);
    DataBroker.ByCustomer := 'N';
    DataBroker.ByBranch := 'N';
    DataBroker.iintselcode := iintselcode;
    DataBroker.GetRngSQL := true;
    if AllorOneRadioGroup.ItemIndex = 0 then
        DataBroker.EnquiryNo := 0
    else
        DataBroker.EnquiryNo := -99;

    if DataBroker.GetDetails = 0 then
        begin
        MessageDlg('There is nothing to print', mtError, [mbAbort], 0);
        DelIntSelCode(iIntselCode, True);
        end
    else
      RollThePresses(DataBroker);
  finally
    DataBroker.Free;
  end;
end;

procedure TPBRSQuoFrm.FaxBitBtnClick(Sender: TObject);
begin
  FFaxing := True;
  try
    Preview := False;
    ClearFaxArray(Self);
    FaxReport(Self);
  finally
    FFaxing := False;
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TPBRSQuoFrm.FaxReport(Sender: TObject);
var
  faxfound: boolean;
  icount, irow: Integer;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  DelIntSelCode(iIntSelCode, True);
  Getselection;
  with GetEnqSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Enquiry').AsInteger := 0
    else
      ParamByName('Enquiry').AsInteger := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParamByName('iintselcode').AsInteger := iintselcode;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There are no quotes to fax', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildFaxDetails;

  {For each of the Enquiry/Customer details print a fax}
  PBFaxListFrm := TPBFaxListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if FaxArray[icount, 1] = '' then Break;
      PBFaxListFrm.FaxListGrid.Cells[0, icount] := FaxArray[icount, 1];
      PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
      PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
    end;
    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'Enquiry Fax List';
    PBFaxListFrm.FaxListgrid.Cells[0, 0] := 'Enquiry';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer / Branch';
    PBFaxListFrm.ShowModal;

    {If OK to the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      CreateDataBroker;
      try
        for irow := 1 to PBFaxListFrm.FaxListGrid.RowCount - 1 do
        begin
          if Trim(PBFaxListFrm.FaxListgrid.Cells[2, irow]) = '' then Continue;

          {Now fax the individual enquiries to the individual suppliers}
          DataBroker.EnquiryNo := StrToInt(FaxArray[irow, 1]);
          DataBroker.ByCustomer := 'Y';
          DataBroker.Customer := StrToInt(FaxArray[irow, 2]);
          DataBroker.ByBranch := 'Y';
          DataBroker.Branch := StrToInt(FaxArray[irow, 3]);
          DataBroker.GetRngSQL := true;
          DataBroker.GetDetails;
          FaxFound := PBSendFaxfrm.OutToFax(PBFaxListFrm.FaxListgrid.Cells[2, irow],
            'Qte: ' + IntToStr(DataBroker.EnquiryNo) + ' to ' + FaxArray[irow, 4], '');

          DataBroker.LetterName := cmbLetterLayout.Text;
          DataBroker.LayoutName := dmLetter.FaxDefaultLayout;
          if (not FaxFound) then
            Exit;
          RollThePresses(DataBroker);
        end;
      finally
        DataBroker.Free;
      end;
    end;
  finally
    PBFaxListFrm.Free;
  end;
end;

procedure TPBRSQuoFrm.EmailReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
begin
  {Set up the Query to determine whether there are any Enquiries to print}
  DelIntSelCode(iIntSelCode, True);
  Getselection;
  with GetEnqSQL do
  begin
    Close;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      ParamByName('Enquiry').AsInteger := 0
    else
      ParamByName('Enquiry').AsInteger := 99;

    if MyOrAllRadioGroup.ItemIndex = 1 then
      ParamByName('Operator').AsInteger := 0
    else
      ParamByName('Operator').AsInteger := frmPBMainMenu.iOperator;
      ParamByName('iintselcode').AsInteger := iintselcode;
    Open;

    if RecordCount = 0 then
    begin
      {Record count is zero - nothing to print}
      MessageDlg('There are no quotes to email', mtError, [mbAbort], 0);
      Exit;
    end;
  end;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the Enquiry/Customer details print a fax}
  PBEmailListFrm := TPBEmailListFrm.Create(Self);
  try
    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 9];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 8];

      {Set up the Email Array with the Supplier/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 10];

    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Quotation Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'Enquiry';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Customer / Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';
    PBEmailListFrm.CodeType := 'C';
    PBEmailListFrm.ShowModal;

    {If OK to do the email then send all the emails}
    if PBEmailListFrm.ModalResult = idok then
    begin
      CreateDataBroker;
      try
        for irow := 1 to PBEmailListFrm.EmailListGrid.RowCount - 1 do
        begin
          if Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]) = '' then Continue;

          {Now email the individual enquiries to the individual suppliers}
          DataBroker.EnquiryNo := StrToInt(EmailArray[irow, 1]);
          DataBroker.ByCustomer := 'Y';
          DataBroker.Customer := StrToInt(EmailArray[irow, 2]);
          DataBroker.ByBranch := 'Y';
          DataBroker.Branch := StrToInt(EmailArray[irow, 3]);
          DataBroker.GetRngSQL := true;
          DataBroker.GetDetails;

          DataBroker.LetterName := cmbLetterLayout.Text;
          DataBroker.LayoutName := dmLetter.FaxDefaultLayout;

          sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
          RollThePresses(DataBroker);

          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
          sSubject := 'Quotation Number: '+EmailArray[irow,1]+', '+trim(EmailArray[irow, 11]);
          sSalutation := EmailArray[irow,7];
          sBody := 'Dear ' + sSalutation+#13#10#13#10'Please find attached ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
      finally
        DataBroker.Free;
      end;
    end;
  finally
    PBEmailListFrm.Free;
  end;
end;

procedure TPBRSQuoFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetEnqSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Enquiry').AsString;
      FaxArray[irow, 2] := FieldByName('Customer').AsString;
      FaxArray[irow, 3] := FieldByName('Branch_no').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      if trim(FieldByName('Contact_Fax').AsString) = '' then
        FaxArray[irow, 5] := FieldByName('Fax_Number').AsString
      else
        FaxArray[irow, 5] := FieldByName('Contact_Fax').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSQuoFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetEnqSQL do
  begin
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Enquiry').AsString;
      EmailArray[irow, 2] := FieldByName('Customer').AsString;
      EmailArray[irow, 3] := FieldByName('Branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Cust_Name').AsString) + ', ' +
        Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Contact_Name').AsString;
      EmailArray[irow, 6] := FieldByName('Email').AsString;
      EmailArray[irow, 7] := FieldByName('Salutation').AsString;
      EmailArray[irow, 8] := FieldByName('ExportFilter').AsString;
      EmailArray[irow, 9] := FieldByName('ExportFilter_Descr').AsString;
      EmailArray[irow, 10] := FieldByName('Contact_no').AsString;
      EmailArray[irow, 11] := FieldByName('Description').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TPBRSQuoFrm.EnqLUSpeedButtonClick(Sender: TObject);
var
TempLoop, iloop : integer;
memolines, found : boolean;
begin
(*  ClearEnqNoArray(self);
  Selectionmemo.lines.clear;
  memolines := false;
  PBLUEnqFrm := TPBLUEnqFrm.Create(Self);
  try
    PBLUEnqFrm.Caption := 'Look-Up Quotations';
    if selectionmemo.Text <> '' then
      PBLUEnqFrm.SelCode := StrToInt(selectionmemo.Text)
    else
      PBLUEnqFrm.SelCode := 0;
    if MyOrAllRadioGroup.ItemIndex = 0 then
    begin
      PBLUEnqFrm.iOperator := PBMenuMainFrm.iOperator;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption + ', Just My Quotations';
    end
    else
    begin
      PBLUEnqFrm.iOperator := 0;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption + ', Everyone''s Quotations';
    end;
    if PBLUEnqFrm.bSelected then
      selectionmemo.Text := IntToStr(PBLUEnqFrm.SelCode);
    if AllOrOneRadioGroup.ItemIndex < 1 then
    begin
      PBLUEnqFrm.bQuoNotPrintedOnly := True;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption + ', Un-Printed Lines Only';
    end
    else
    begin
      PBLUEnqFrm.bQuoNotPrintedOnly := False;
      PBLUEnqFrm.Caption := PBLUEnqFrm.Caption +
        ', Un-Printed and Printed Lines';
    end;
    PBLUEnqFrm.bIs_Lookup := True;
    PBLUEnqFrm.BMulti_Select := True;
    PBLUEnqFrm.iFromStatus := 45;
    PBLUEnqFrm.iToStatus := 0;
    PBLUEnqFrm.ShowModal;
    if not PBLUEnqFrm.bSelected then
      exit;

  If AlloroneRadiogroup.itemindex =0 then
      begin
        PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUEnqFrm.DetsDBGrid.SelectedRows[0]));
        selectionmemo.lines.Add(InttoStr(PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger));
        end
      else
      for TempLoop := 0 to (PBLUEnqFrm.DetsDBGrid.SelectedRows.count -1) do
      begin
      found := false;
      PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(PBLUEnqFrm.DetsDBGrid.SelectedRows[TempLoop]));
      for iloop := 1 to Enqarraycount do
            begin
             if PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger =
                EnqNoArray[Iloop] then
                begin
                  found := true;
                  break;
                end;
             end;
      if not found then
        begin
            if memolines then
              selectionmemo.text := selectionmemo.text+(', ');
            MemoLines := True;
            selectionmemo.Text:= selectionmemo.text+(InttoStr(PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger));
            EnqArrayCount := EnqArrayCount+1;
            EnqNoArray[EnqArrayCount] :=PBLUEnqFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Enquiry').AsInteger;
        end;
    end;
  finally
    PBLUEnqFrm.Free;
  end;
  CanPrint(Self);
*)
end;

procedure TPBRSQuoFrm.MyOrAllRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    selectionmemo.Enabled := False;
    EnqLUSpeedButton.Enabled := False;
    selectionmemo.Text := '';
  end
  else
  begin
    selectionmemo.Enabled := True;
    EnqLUSpeedButton.Enabled := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSQuoFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSQuoFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 11 do
      EmailArray[icount, icount1] := '';
end;

procedure TPBRSQuoFrm.FormActivate(Sender: TObject);
begin
 ClearEnqNoArray(Self);
 if not FActDone then
  begin
    GetEmailApp;
    CanPrint(Self);
    SelectionMemo.SetFocus;
    FActDone := true;
  end;
iIntSelCode := GetNextIntSelCode(Self) ;
{Only allow MY quotes to be printed if in OPERATOR mode} ;
MyOrAllRadioGroup.Enabled := (dmBroker.iAccCtrlMenu <> 5) ;
end;

procedure TPBRSQuoFrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
  try
    FEmailApplication := ReadString('Email', 'Application', 'None');
    FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
  finally
    IniFile.Free;
  end;
end;

procedure TPBRSQuoFrm.SelectionMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CanPrint(Self);
end;

procedure TPBRSQuoFrm.SelectionMemoKeyPress(Sender: TObject; var Key: Char);
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

procedure TPBRSQuoFrm.RollThePresses(aBroker: TDataBroker);
var
  PrintingPress : TfrmPrintingPress;
  icount: integer;
begin
  PrintingPress := TfrmPrintingPress.Create(Self);
  try
    PrintingPress.DataBroker := aBroker;
    if Preview then
      PrintingPress.QuickR.Preview
    else
    begin
      if FFaxing then
        begin
        PrintingPress.QuickR.Print
        {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
        PBSendFaxFrm.WaitForFaxFinish(Self) ;
        end
      else
      if FEmail then
        begin
          PrintToAttachment(PrintingPress,DataBroker.EnquiryNo);
        end
      else
        begin
          GetDefaultPrinter;
          {Find the default printer in the list of printers }
          Printers.Printer.PrinterIndex := -1;
          for icount := 0 to pred(Printers.Printer.Printers.count) do
            begin
              if pos(DefaultPrinter,Printers.Printer.Printers[icount]) > 0 then
                Printers.Printer.PrinterIndex := icount;
            end;
          if DefaultPrinter <> '' then
            begin
              SetPrinterBin(DefaultBin);
            end;
          if SetupPrinter(aBroker.PrinterSettings) then
            begin
              PrintingPress.QuickR.Print;
              DefaultPrinter := Printers.Printer.Printers[printers.Printer.printerindex];
              DefaultBin := GetBinSelection;
              SaveDefaultPrinter;
              FPrinted := true;
            end;
        end
    end;
  finally
    Application.ProcessMessages;
    Printers.Printer.PrinterIndex := -1;
    FPrinted := false;
    PrintingPress.Free;
  end;
end;

procedure TPBRSQuoFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress; EnqNumber: integer);
begin
  var fileName := 'QTE' + EnqNumber.ToString;
  {$IFDEF PMS}
  sFileName := 'EST' + EnqNumber.ToString;
  {$ENDIF}

  TPrinterTools.New.PrintToAttachment(PrintingPress.QuickR, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TPBRSQuoFrm.PrintToAttachment(PrintingPress: TfrmPrintingPress; EnqNumber: integer);
var
  i: integer;
  sLocation, sFileName: string;
  zLocation, zFileName: array[0..255] of char;
  AFilters: TgtQRFilters;
  RTFFilter: TgtQRRTFFilter;
  HTMLFilter: TgtQRHTMLFilter;
  PDFFilter: TgtQRPDFFilter;
  BMPFilter: TgtQRBMPFilter;
  GIFFilter: TgtQRGIFFilter;
  JPEGFilter: TgtQRJPEGFilter;
begin
  FEmailAttachment.clear;

  sLocation := GetWinTempDir;

//  if FEmailLocation = '' then
//    sLocation := 'C:\Windows\temp\'
//  else
//    sLocation := FEmailLocation;
//
//  sFileName := 'QTE' + inttostr(EnqNumber);

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'QTE'  + Enquiry Number + Random Number}
  sFileName := 'QTE' + inttostr(EnqNumber) + '-' + sFilename;
{$IFDEF PMS}
  sFileName := 'EST' + inttostr(EnqNumber) + '-' + sFilename;
{$ENDIF}

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(RTFFilter);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(PDFFilter);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        PrintingPress.QuickR.Prepare;
        PrintingPress.QuickR.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PrintingPress.QuickR.QRPrinter.Free;
        PrintingPress.QuickR.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

procedure TPBRSQuoFrm.LoadCombos;
begin
  cmbPageLayout.Items.Clear;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    TypeRadioGroup.Hide;
    cmbPageLayout.Items.Add('Blank');
    cmbPageLayout.Items.Add('Preprinted');
    if TypeRadioGroup.ItemIndex = 0 then
      cmbLetterLayout.Items.Add('Quotation')
    else
      cmbLetterLayout.Items.Add('Quotation Summary');
    if cmbPageLayout.Items.Count > 0 then
      cmbPageLayout.ItemIndex := 0;
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbPageLayout.Items.Assign(dmLetter.GetPageLayoutList);
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(LetterType));
    cmbPageLayout.ItemIndex :=
      cmbPageLayout.Items.IndexOf(dmLetter.PrintDefaultLayout);
    cmbLetterLayout.ItemIndex :=
      cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(LetterType));    
  end;
end;

procedure TPBRSQuoFrm.FormCreate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
  LetterType := ltQuotation;
  LoadCombos;
  { Check to see if we have an old or new database and adjust the
    form accordingly }
  if dmLetter.OldDatabase then
  begin
    gbLayouts.Hide;
    cbPrintLogo.Show;
    cbPrintLogo.Checked := true;
    cbPrintLogo.Checked := false;
    ClientHeight := ClientHeight - gbLayouts.Height;
  end;
end;

procedure TPBRSQuoFrm.cbPrintLogoClick(Sender: TObject);
begin
  if cbPrintLogo.Checked then
    cmbPageLayout.ItemIndex := 0
  else
    cmbPageLayout.ItemIndex := 1;
end;

procedure TPBRSQuoFrm.TypeRadioGroupClick(Sender: TObject);
begin
  if TypeRadioGroup.ItemIndex = 0 then
    LetterType := ltQuotation
  else
    LetterType := ltQuotationSummary;
  cmbLetterLayout.Items.Clear;
  if dmLetter.OldDatabase then
  begin
    if TypeRadioGroup.ItemIndex = 0 then
      cmbLetterLayout.Items.Add('Quotation')
    else
      cmbLetterLayout.Items.Add('Quotation Summary');
    if cmbLetterLayout.Items.Count > 0 then
      cmbLetterLayout.ItemIndex := 0;
  end
  else
  begin
    cmbLetterLayout.Items.Assign(dmLetter.GetLetterLayoutList(LetterType));
    cmbLetterLayout.ItemIndex :=
        cmbLetterLayout.Items.IndexOf(dmLetter.GetLetterDefault(LetterType));    
  end;
end;

function TPBRSQuoFrm.DBFactory(aClass: TQuoLetterClass): Pointer;
begin
  Result := aClass.Create(Self);
end;

procedure TPBRSQuoFrm.CreateDataBroker;
begin
  if LetterType = ltQuotation then
    DataBroker := TdbQuoLtr(DBFactory(TdbQuoLtr))
  else
    DataBroker := TdbQuoSumLtr(DBFactory(TdbQuoSumLtr));
end;

procedure TPBRSQuoFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  FEmail := True;
  try
    Preview := False;
    ClearEmailArray(Self);
    EmailReport(Self);
  finally
    FEmail := False;
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
end;

procedure TPBRSQuoFrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
end;

procedure TPBRSQuoFrm.BuildRange(sFirst, sLast: string);
var
  sNo: string;
begin
	if sFirst > sLast then exit;

  sNo := sFirst;

  {Continue adding lines until the last in the range is reached}
	repeat
      if SelectLst.Items.IndexOf(sNo) < 0 then
        	SelectLst.Items.Add(sNo);
     sNo := incrementno(sNo);
  until sNo > sLast;
end;

procedure TPBRSQuoFrm.BuildSelection;
var
	ilength, irange, iNewLength, istart, ifinish: integer;
  stext, sEvaluate, sFirst, sLast: string;
begin
	selectLst.Clear;

	ilength := length(SelectionMemo.text);

 	stext := SelectionMemo.text;
  if copy(stext,ilength,1) <> ',' then
  	stext := stext + ',';

  stext := trim(stext);

  ifinish := 0;
  while pos(',',stext) > 0 do
  	begin
  		istart := ifinish + 1;
  		ifinish := pos(',',stext);
        ilength := ifinish - istart;

        {Chop out the string which is to be evaluated}
        sEvaluate := copy(stext,istart,ilength);
        sEvaluate := trim(sEvaluate);

        {Check to see if the string has a range selection}
        irange := pos('-',sEvaluate);
        inewLength := length(sEvaluate);

        if irange > 0 then
        	begin
           	{Build the list of possible values in between the range}
              sFirst := copy(sEvaluate,1,irange-1);
              sLast := copy(sEvaluate,irange+1,(iNewLength-irange));

              BuildRange(sFirst,sLast);
        		stext[ifinish] := ':';
              continue;
           end;

        {Check that the item does not already exist}
        if SelectLst.Items.IndexOf(sEvaluate) < 0 then
        	SelectLst.Items.Add(sEvaluate);

        stext[ifinish] := ':';
     end;
end;

procedure TPBRSQuoFrm.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
begin
begin
{Delete ALL entries on the workfile for the int_sel_code} ;
With DelWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
     ExecSQL ;
     end;
{Add the reserving one back in} ;
If not bTempDelCode then
     begin
     With AddWorkSQL do
          begin
          Close ;
          ParamByName('Int_Sel_Code').AsInteger := iTempIntSelCode ;
          ParamByName('Text100').AsString := '' ;
          ExecSQL ;
          end;
     end;
end;
end;

function TPBRSQuoFrm.GetNextIntSelCode(Sender: TObject): Integer;
Var
iIntSelCode: Integer ;
begin
{Get the next int_sel_code to use} ;
With GetLastIntSelSQL do
     begin
     Close ;
     Open ;
     First;
     iIntSelCode := FieldByName('Last_Code').AsInteger + 1 ;
     end;
{Reserve it on the int_sel file} ;
With AddWorkSQL do
     begin
     Close ;
     ParamByName('Int_Sel_Code').AsInteger := iIntSelCode ;
     ParamByName('Text100').AsString := '' ;
     ExecSQL ;
     end;
Result := iIntSelCode ;
end;

procedure TPBRSQuoFrm.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	DelIntSelCode(iIntSelCode, True);
  buildselection;
   if SelectLst.Items.Count > 100 then
    begin
      MessageDlg(' This selection will result in more than 100 documents being produced. Please redefine the range', mterror,
      [mbOk], 0);
      SelectLst.Clear;
      SelectionMemo.Clear;
      SelectionMemo.SetFocus;
    end;
    for icount := 0 to SelectLst.Items.count -1 do
    	begin
       	{Get the relevant Invoice number}
        if SelectLst.Items[icount] = '' then continue;

       	with AddIntSelQuery do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsFloat := strtofloat(SelectLst.Items[icount]);
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;
end;

function TPBRSQuoFrm.IncrementNo(StartStr: String): String;
Var StrLength, Count, Id: Integer ;
    Alphas: String[27] ;
    Numbers: String[11] ;
    CurrChar: String[1] ;
begin
Alphas := 'ABCEDFGHIJKLMNOPQRSTUVWXYZA' ;
Numbers := '01234567890' ;
{Increment a string value by 1}
StrLength := Length(StartStr) ;
For Count := StrLength downto 1 do
    begin
    CurrChar := Copy(StartStr,Count,1) ;
    Id := Pos(CurrChar,Numbers) ;
    if Id > 0 then
       begin
       StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Numbers, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
       IncrementNo := StartStr ;
       if Id < 10 then exit ;
       end
    else
        begin
        Id := Pos(CurrChar,Alphas) ;
        if Id > 0 then
               begin
               StartStr := Copy(StartStr, 1, (Count - 1)) + Copy(Alphas, (Id + 1), 1) +
                   Copy(StartStr,(Count + 1), (StrLength - Count));
        IncrementNo := StartStr ;
        if Id < 27 then exit ;
               end ;
        end ;
       end ;
end;

procedure TPBRSQuoFrm.FormDeactivate(Sender: TObject);
begin
DelIntSelCode(iIntSelCode, True);
end;

procedure TPBRSQuoFrm.ClearEnqNoArray(Sender: TObject);
var
  icount: Integer;
begin
  for icount := 1 to 100 do
      EnqNoArray[icount] := 0;
  EnqArrayCount := 0;
end;

procedure TPBRSQuoFrm.GetDefaultPrinter;
var
  sBin: string;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Quotation Printer', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

  GetPrivateProfileString('Centrereed Broker', 'Quotation Bin', '', TempArray,
        sizeof(TempArray), frmPBMainMenu.AppIniFile);

  sBin := TempArray;
  try
    DefaultBin := strtoint(sBin);
  except
    DefaultBin := 15;
  end;
end;

procedure TPBRSQuoFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
  try
    WriteString('Centrereed Broker', 'Quotation Printer',DefaultPrinter);
    WriteString('Centrereed Broker', 'Quotation Bin',inttostr(DefaultBin));
  finally
    IniFile.Free;
  end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TPBRSQuoFrm.SetPrinterBin(BinCode : integer );
var
  DevMode : PDeviceMode;
  hDevMode: THandle;
  Device,Driver,Port: array [0..1024] of Char;
begin
  Printers.Printer.GetPrinter (Device,Driver,Port,hDevMode);
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        DevMode^.DMDEFAULTSOURCE := BinCode;
        GlobalUnlock (hDevMode);
  end;
end;

function TPBRSQuoFrm.GetBinSelection: integer;
var
     hDevMode: THandle;
     Device,Driver,Port: array [0..1024] of Char;
     bin: integer;
     DevMode : PDevMode;
begin
  Printers.Printer.GetPrinter (Device,Driver,Port,hDevMode);
  bin := -1;
  if hDevMode <> 0 then
  begin
        DevMode := GlobalLock (hDevMode);
        // here we can catch members of DevMode
        bin := DevMode^.DMDEFAULTSOURCE;
        GlobalUnlock (hDevMode);
  end;
  result := bin;
end;

procedure TPBRSQuoFrm.SetDefaultBin(const Value: integer);
begin
  FDefaultBin := Value;
end;

procedure TPBRSQuoFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

end.
