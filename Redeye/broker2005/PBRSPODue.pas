unit PBRSPODue;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, PBPOObjects, PBRPPODue, QrExport, Spin,
  ComCtrls, OleCtnrs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBRSPODueFrm = class(TForm)
    AllOrOneRadioGroup: TRadioGroup;
    SupplierLabel: TLabel;
    PrintBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    DateLabel: TLabel;
    DateEdit: TEdit;
    SuppEdit: TEdit;
    Label1: TLabel;
    DaysSpinEdit: TSpinEdit;
    Label2: TLabel;
    LUSuppSpeedButton: TSpeedButton;
    customerrg: TRadioGroup;
    Customerlbl: TLabel;
    CustEdit: TEdit;
    LUCustSpeedButton: TSpeedButton;
    GetPOsSQL: TFDQuery;
    chkbxBranches: TCheckBox;
    EmailBitBtn: TBitBtn;
    oldGetPOsSQL: TFDQuery;
    btnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    Operatorrg: TRadioGroup;
    Operatoredit: TEdit;
    luOperatorSpeedbutton: TSpeedButton;
    operatorlbl: TLabel;
    procedure CanPrint(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure PrintReport(Sender: TObject);
    procedure EmailReport(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure DispOperator(Sender: TObject);
    procedure DispSuppBranch(Sender: TObject);
    procedure DaysSpinEditChange(Sender: TObject);
    procedure LUSuppSpeedButtonClick(Sender: TObject);
    procedure customerrgClick(Sender: TObject);
    procedure LUCustSpeedButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BuildFaxDetails;
    procedure BuildEmailDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEmailArray(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure OperatorrgClick(Sender: TObject);
    procedure luOperatorSpeedbuttonClick(Sender: TObject);
  published
    procedure DispCustBranch(Sender: TObject);
  private
    { Private declarations }
    FSupplierName: string;
    bPreview, bFaxing: ByteBool;
    FEmailAttachment : TstringList;
    ODueDate: TDateTime;
    DisplayPrintDialog : Boolean;
    SelSupplier, SelBranch, SelCustomer, SelCustBranch, SelAccountMgr: Integer;
    SelName, SelCustName, SelAccountMgrName: string;
    sAttachmentType: string;
    procedure PrintToAttachment(PBRPPODuefrm: TPBRPPODuefrm);
  end;

var
  PBRSPODueFrm: TPBRSPODueFrm;
  FaxArray: array[1..100, 1..5] of string;
  EmailArray: array[1..100, 1..10] of string;

implementation

uses
  PBLUSupp, PBFaxToOne, DateSelV5, CCSPrint, Printers, PBLUOps,
  PBLUCust, PBFaxList, PBSendFax, PBEmailList, CCSCommon, pbDatabase,
  pbMainMenu, Printer.Tools;

{$R *.DFM}

procedure TPBRSPODueFrm.CanPrint(Sender: TObject);
begin
  {Check if can print}
  PrintBitBtn.Enabled := ((AllOrOneRadioGroup.ItemIndex = 0) or (SuppEdit.Text <> '')) and
                         ((customerrg.ItemIndex = 0) or (CustEdit.Text <> '')) and
                         ((operatorrg.itemindex = 0) or (OperatorEdit.Text <> ''));
  PreviewBitBtn.Enabled := PrintBitBtn.Enabled;
  btnExcel.Enabled := PrintBitBtn.Enabled;
  EmailBitBtn.Enabled := PrintBitBtn.Enabled;
end;

procedure TPBRSPODueFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllOrOneRadioGroup.ItemIndex = 0 then
  begin
    SupplierLabel.Visible := False;
    SuppEdit.Visible := False;
    LUSuppSpeedButton.Visible := False;
    SuppEdit.Text := '';
  end
  else
  begin
    SupplierLabel.Visible := True;
    SuppEdit.Visible := True;
    LUSuppSpeedButton.Visible := True;
    DispSuppBranch(Self);
  end;
  CanPrint(Self);
end;

procedure TPBRSPODueFrm.PreviewBitBtnClick(Sender: TObject);
begin
  bFaxing := False;
  bPreview := True;
  PrintReport(Self);
end;

procedure TPBRSPODueFrm.PrintBitBtnClick(Sender: TObject);
begin
  bFaxing := False;
  bPreview := False;
  PrintReport(Self);
end;

procedure TPBRSPODueFrm.PrintReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
begin
  {Setup and print the report}
  PBRPPODueFrm := TPBRPPODueFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPODueFrm.PrinterSettings := PrinterSettings;
      PBRPPODueFrm.Preview := bPreview;
      PBRPPODueFrm.ODueDate := ODueDate;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        PBRPPODueFrm.ContactNo := 0;
        PBRPPODueFrm.SupplierNo := 0;
        PBRPPODueFrm.BranchNo := 0;
        PBRPPODueFrm.AccountMgr := 0;
      end
      else
      begin
        PBRPPODueFrm.ContactNo := 0;
        PBRPPODueFrm.SupplierNo := SelSupplier;
        PBRPPODueFrm.BranchNo := SelBranch;
        PBRPPODueFrm.SupplierName := SelName;
        PBRPPODueFrm.AccountMgr := SelAccountMgr;
      end;

      if customerrg.ItemIndex = 0 then
      begin
        PBRPPODueFrm.CustomerNo := 0;
        PBRPPODueFrm.CustBranchNo := 999;
      end
      else
      begin
        PBRPPODueFrm.CustomerNo := SelCustomer;
        if chkbxBranches.checked then
          PBRPPODueFrm.CustBranchNo := 999
        else
          PBRPPODueFrm.CustBranchNo := SelCustBranch;
        PBRPPODueFrm.CustomerName := SelCustName;
      end;

      if Operatorrg.ItemIndex = 0 then
      begin
        PBRPPODueFrm.AccountMgr := 0;
      end
      else
      begin
        PBRPPODueFrm.AccountMgr := SelAccountMgr;
      end;

      if PBRPPODueFrm.GetDetails(Self) = 0 then
      begin
        {Record count is zero - nothing to print}
        if (not bFaxing) then
          MessageDlg('There is nothing to print', mtError, [mbAbort], 0)
        else
          MessageDlg('There is nothing to fax', mtError, [mbAbort], 0);
        Exit;
      end
      else
      begin
        {Actually print or preview the report}
        if bPreview then
          PBRPPODueFrm.PrintPOsDueEnqQuickReport.Preview
        else
        begin
        If SetUpPrinter(PrinterSettings) then
          PBRPPODueFrm.PrintPOsDueEnqQuickReport.Print;
        end;
      end;
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    PBRPPODueFrm.Free;
end;
end;


procedure TPBRSPODueFrm.DispSuppBranch(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelSupplier <> 0 then
    SuppEdit.Text := SelName
  else
    SuppEdit.Text := '';
end;

procedure TPBRSPODueFrm.DispOperator(Sender: TObject);
begin
  {Display supplier and branch in memo box}
  if SelAccountMgr <> 0 then
    OperatorEdit.Text := SelAccountMgrName
  else
    OperatorEdit.Text := '';
end;

procedure TPBRSPODueFrm.DaysSpinEditChange(Sender: TObject);
begin
  if DaysSpinEdit.Text = '' then DaysSpinEdit.Text := '0';
  ODueDate := Date + StrToInt(DaysSpinEdit.Text);
  DateEdit.Text := PBDatestr(ODueDate);
end;

procedure TPBRSPODueFrm.LUSuppSpeedButtonClick(Sender: TObject);
begin
  PBLUSuppFrm := TPBLUSuppFrm.Create(Self);
  PBLUSuppFrm.bIs_Lookup := True;
  PBLUSuppFrm.bAllow_Upd := False;
  PBLUSuppFrm.SelCode := SelSupplier;
  PBLUSuppFrm.SelBranch := SelBranch;
  PBLUSuppFrm.bSel_Branch := True;
  PBLUSuppFrm.ShowModal;
  begin
    SelSupplier := PBLUSuppFrm.SelCode;
    SelBranch := PBLUSuppFrm.SelBranch;
    SelName := PBLUSuppFrm.SelName;
    DispSuppBranch(Self);
  end;
  PBLUSuppFrm.Free;
  CanPrint(Self);
end;

procedure TPBRSPODueFrm.customerrgClick(Sender: TObject);
begin
  if customerrg.ItemIndex = 0 then
  begin
    Customerlbl.Visible := False;
    CustEdit.Visible := False;
    LUCustSpeedButton.Visible := False;
    CustEdit.Text := '';
    chkbxBranches.Visible := False;
  end
  else
  begin
    Customerlbl.Visible := True;
    CustEdit.Visible := True;
    LUCustSpeedButton.Visible := True;
    DispCustBranch(Self);
    chkbxBranches.Visible := True;
  end;
  CanPrint(Self);
end;

procedure TPBRSPODueFrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TPBRSPODueFrm.LUCustSpeedButtonClick(Sender: TObject);
begin
  PBLUCustFrm := TPBLUCustFrm.Create(Self);
  PBLUCustFrm.bIs_Lookup := True;
  PBLUCustFrm.bAllow_Upd := False;
  PBLUCustFrm.SelCode := SelCustomer;
  PBLUCustFrm.SelBranch := SelCustBranch;
  PBLUCustFrm.bSel_Branch := True;
  PBLUCustFrm.ShowModal;
  begin
    SelCustomer := PBLUCustFrm.SelCode;
    SelCustBranch := PBLUCustFrm.SelBranch;
    SelCustName := PBLUCustFrm.SelName;
    DispCustBranch(Self);
  end;
  PBLUCustFrm.Free;
  CanPrint(Self);
end;

procedure TPBRSPODueFrm.FormShow(Sender: TObject);
begin
  AllOrOneRadioGroup.itemindex := 0;
  customerrg.itemindex := 0;
  DaysSpinEditChange(Self);
  CanPrint(Self);
end;

procedure TPBRSPODueFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetPOsSQL do
  begin
     Close;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        ParamByName('Supplier').AsInteger := 0;
        ParamByName('Branch_No').AsInteger := 0;
        ParamByName('Contact_No').AsInteger := 0;
      end
      else
      begin
        ParamByName('Supplier').AsInteger := SelSupplier;
        ParamByName('Branch_No').AsInteger:= SelBranch;
        ParamByName('Contact_No').AsInteger := 0;
      end;
      ParamByName('ODue_Date').AsDateTime := ODueDate;

      if customerrg.ItemIndex = 0 then
      begin
        ParamByName('Customer').AsInteger := 0;
        ParamByName('CustBranch').AsInteger := 999;
      end
      else
      begin
        ParamByName('Customer').AsInteger := SelCustomer;
        if chkbxBranches.checked then
          ParamByName('CustBranch').AsInteger := 999
        else
          ParamByName('CustBranch').AsInteger := SelCustBranch;
      end;

      if Operatorrg.ItemIndex = 0 then
      begin
        ParamByName('Account_Manager').AsInteger := 0;
      end
      else
      begin
        ParamByName('Account_Manager').AsInteger := SelAccountMgr;
      end;

    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Contact_no').AsString;
      EmailArray[irow, 2] := FieldByName('Supplier').AsString;
      EmailArray[irow, 3] := FieldByName('Suppbranch').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Name').AsString)+' '+Trim(FieldByName('Branchname').AsString);
      EmailArray[irow, 5] := FieldByName('Email').AsString;
      EmailArray[irow, 6] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 7] := FieldByName('exportfilter').AsString;
      EmailArray[irow, 8] := FieldByName('Contact_Name').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBRSPODueFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetPOsSQL do
  begin
     Close;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        ParamByName('Supplier').AsInteger := 0;
        ParamByName('Branch_No').AsInteger := 0;
      end
      else
      begin
        ParamByName('Supplier').AsInteger := SelSupplier;
        ParamByName('Branch_No').AsInteger:= SelBranch;
      end;
      ParamByName('ODue_Date').AsDateTime := ODueDate;

      if customerrg.ItemIndex = 0 then
      begin
        ParamByName('Customer').AsInteger := 0;
        ParamByName('CustBranch').AsInteger := 0;
      end
      else
      begin
        ParamByName('Customer').AsInteger := SelCustomer;
        ParamByName('CustBranch').AsInteger:= SelCustBranch;
      end;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Supplier').AsString;
      FaxArray[irow, 2] := FieldByName('Supplier').AsString;
      FaxArray[irow, 3] := FieldByName('Suppbranch').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Name').AsString)+' '+Trim(FieldByName('Branchname').AsString);
      FaxArray[irow, 5] := FieldByName('Fax_Number').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TPBRSPODueFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;


procedure TPBRSPODueFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TPBRSPODueFrm.FaxReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount, irow: integer;
  faxfound: boolean;
begin
  {Build the Enquiry and Supplier details}
  BuildFaxDetails;
  {For each of the Enquiry/Supplier details print a fax}
  PrinterSettings := TPrinterSettings.Create;
  try
    PBFaxListFrm := TPBFaxListFrm.Create(Self);
    try
    for icount := 1 to 100 do
    begin
      if FaxArray[icount, 1] = '' then Break;
      PBFaxListFrm.FaxListGrid.ColWidths[0] := 0;
      PBFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
      PBFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
    end;
    PBFaxListFrm.FaxListGrid.RowCount := icount;
    PBFaxListFrm.Caption := 'Orders Due for Delivery Fax List';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Supplier/Branch';
    PBFaxListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBFaxListFrm.FaxlistGrid.Rowcount -1 do
      begin
      if Trim(PBFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;
      PBRPPODueFrm := TPBRPPODueFrm.Create(Self);
      try
        PBRPPODueFrm.PrinterSettings := PrinterSettings;
        PBRPPODueFrm.Preview := bPreview;
        PBRPPODueFrm.ODueDate := ODueDate;
        if customerrg.ItemIndex = 0 then
        begin
          PBRPPODueFrm.CustomerNo := 0;
          PBRPPODueFrm.CustBranchNo := 999;
        end
        else
        begin
          PBRPPODueFrm.CustomerNo := SelCustomer;
          if chkbxBranches.checked then
            PBRPPODueFrm.CustBranchNo := 999
          else
            PBRPPODueFrm.CustBranchNo := SelCustBranch;
          PBRPPODueFrm.CustomerName := SelCustName;
        end;
        PBRPPODueFrm.AccountMgr := 0;
        PBRPPODueFrm.ContactNo := 0;
        PBRPPODueFrm.SupplierNo := StrToInt(FaxArray[irow,2]);
        PBRPPODueFrm.BranchNo := StrToInt(FaxArray[irow,3]);
        PBRPPODueFrm.GetDetails(Self);
        DisplayPrintDialog := False;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Showprogress := False;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Page.Orientation := polandscape;
        FaxFound := PBSendFaxFrm.OutToFax(PBFaxListFrm.FaxListGrid.cells[2,irow],
              'Orders Due Rpt to '+ FaxArray[irow,4], '');
        if (not faxfound) then
          MessageDlg('The fax driver is not installed', mtError, [mbok], 0)
        else
          begin
          PBRPPODueFrm.PrintPOsDueEnqQuickReport.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
          PBSendFaxFrm.WaitForFaxFinish(Self) ;
          end;
      finally
      end;
      PBRPPODueFrm.Free;
    end;
  end;
  finally;
  PBFaxListFrm.Free;
    end;
  finally
  PrinterSettings.Free;
  Application.ProcessMessages;
  end;
end;

procedure TPBRSPODueFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  dmBroker.bEmailSent := false;
  try
    bPreview := False;
    clearEmailarray(self);
    EmailReport(self);
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

procedure TPBRSPODueFrm.EmailReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount, irow: integer;
  sTo, sSubject, sBody, sBodyText, sSalutation: string;
  sSenderName, sSenderEmail, sRecipientName: string;
begin
  {Build the Enquiry and Supplier details}
  BuildEmailDetails;
  {For each of the Enquiry/Supplier details send an email}
  PrinterSettings := TPrinterSettings.Create;
  try
    PBEmailListFrm := TPBEmailListFrm.Create(Self);
    try
    PBEmailListFrm.CodeType := 'S';

    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
      PBEmailListFrm.EmailListGrid.ColWidths[0] := 0;
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := EmailArray[icount, 8];
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 7];


      {Set up the Email Array with the Supplier/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := EmailArray[icount, 1];
    end;
    PBEmailListFrm.EmailListGrid.RowCount := icount;
    PBEmailListFrm.Caption := 'Orders Due for Delivery Email List';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Supplier/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';
    PBEmailListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if PBEmailListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBEmailListFrm.EmailListGrid.Rowcount -1 do
      begin
      if Trim(PBEmailListFrm.EmailListGrid.cells[3, irow]) = '' then continue;
      PBRPPODueFrm := TPBRPPODueFrm.Create(Self);
      try
        PBRPPODueFrm.PrinterSettings := PrinterSettings;
        PBRPPODueFrm.Preview := false;
        PBRPPODueFrm.ODueDate := ODueDate;
        if customerrg.ItemIndex = 0 then
        begin
          PBRPPODueFrm.CustomerNo := 0;
          PBRPPODueFrm.CustBranchNo := 999;
        end
        else
        begin
          PBRPPODueFrm.CustomerNo := SelCustomer;
          if chkbxBranches.checked then
            PBRPPODueFrm.CustBranchNo := 999
          else
            PBRPPODueFrm.CustBranchNo := SelCustBranch;
          PBRPPODueFrm.CustomerName := SelCustName;
        end;
        if Operatorrg.ItemIndex = 0 then
        begin
          PBRPPODueFrm.AccountMgr := 0;
        end
        else
        begin
          PBRPPODueFrm.AccountMgr := SelAccountMgr;
        end;

        PBRPPODueFrm.ContactNo := StrToInt(EmailArray[irow,1]);
        PBRPPODueFrm.SupplierNo := StrToInt(EmailArray[irow,2]);
        PBRPPODueFrm.BranchNo := StrToInt(EmailArray[irow,3]);

        FSupplierName := PBEmailListFrm.EmailListGrid.Cells[1, irow];
        PBRPPODueFrm.GetDetails(Self);

        DisplayPrintDialog := False;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Showprogress := False;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Page.Orientation := polandscape;
        {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
        sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
        Printtoattachment(PBRPPODuefrm);
        sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
        sSubject := 'Purchase Orders Due for Delivery: '+PBDateStr(date);
        sSalutation := PBRPPODuefrm.GetPOsSQL.FieldByName('Salutation').AsString;
        sSenderName := frmPBMainMenu.sOperator_Name;
        sSenderEmail := frmPBMainMenu.sOperator_Email;

        sRecipientName := EmailArray[irow,5];

        sBodyText := 'Please find attached ' + sSubject + '.'#13#10#13#10 + 'Please include our PO ref. with all responses to this email.'#13#10#13#10;

        if trim(sSalutation) = '' then
          sBody := sBodytext
        else
          sBody := 'Dear ' + sSalutation+','+#13#10#13#10''+ sBodytext;

        if frmPBMainMenu.EmailApplication = 'GENERIC' then
            {Send to Email database}
            dmBroker.EmailViaGeneric(sSenderName, sSenderEmail, sRecipientName, sTo,sSubject,sBodyText,FEmailAttachment,
                                      frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount, frmPBMainMenu.sOperator_Name, frmPBMainMenu.sCompName)
        else
          EmailViaOutlook(sTo,sSubject,sBody, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

      finally
      end;
      PBRPPODueFrm.Free;
    end;
  end;
  finally;
  PBEmailListFrm.Free;
    end;
  finally
  PrinterSettings.Free;
  Application.ProcessMessages;
  end;
end;

procedure TPBRSPODueFrm.PrintToAttachment(PBRPPODueFrm: TPBRPPODueFrm);
begin
  var fileName := 'OrdersDue' + '-' + PBRPPODueFrm.PONumberQRLabel.Caption;
  TPrinterTools.New.PrintToAttachment(PBRPPODueFrm.PrintPOsDueEnqQuickReport, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TPBRSPODueFrm.PrintToAttachment(PBRPPODueFrm: TPBRPPODueFrm);
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

//  sFileName := 'POsDUE';

  {Code used to generate a unique filename}
  strPCopy(zLocation, sLocation);

  GetTempFileName(zLocation, '', 0, zFileName);

  sFileName := zFileName;
  sFileName := trim(stringReplace(sFileName,'.TMP','',[rfIgnoreCase]));

  sFileName := trim(stringReplace(sFileName,sLocation,'',[rfIgnoreCase]));

  {Format is 'PO' + Random Number + PO Number}
  sFilename := 'OrdersDue' + '-' + sFilename;

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Prepare;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.ExportToFilter(RTFFilter);
      finally
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter.Free;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Prepare;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter.Free;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Prepare;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.ExportToFilter(PDFFilter);
      finally
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter.Free;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Prepare;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter.Free;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Prepare;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter.Free;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.Prepare;
 //       ExportToRTF(PBRPPODueFrm.PrintPOsDueEnqQuickReport, sLocation + sFilename + '.bmp');
      PBRPPODueFrm.PrintPOsDueEnqQuickReport.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter.Free;
        PBRPPODueFrm.PrintPOsDueEnqQuickReport.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;
*)

procedure TPBRSPODueFrm.FormCreate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
end;

procedure TPBRSPODueFrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.Free;
end;

procedure TPBRSPODueFrm.btnExcelClick(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  reccount: integer;
  tempfilename: string;
begin
  PBRPPODueFrm := TPBRPPODueFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      PBRPPODueFrm.PrinterSettings := PrinterSettings;
      {this part copies the query and values from the report selection form to the report print form}
      PBRPPODueFrm.ODueDate := ODueDate;
      if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        PBRPPODueFrm.ContactNo := 0;
        PBRPPODueFrm.SupplierNo := 0;
        PBRPPODueFrm.BranchNo := 0;
      end
      else
      begin
        PBRPPODueFrm.ContactNo := 0;
        PBRPPODueFrm.SupplierNo := SelSupplier;
        PBRPPODueFrm.BranchNo := SelBranch;
        PBRPPODueFrm.SupplierName := SelName;
      end;

      if customerrg.ItemIndex = 0 then
      begin
        PBRPPODueFrm.CustomerNo := 0;
        PBRPPODueFrm.CustBranchNo := 0;
      end
      else
      begin
        PBRPPODueFrm.CustomerNo := SelCustomer;
        if chkbxBranches.checked then
          PBRPPODueFrm.CustBranchNo := 999
        else
          PBRPPODueFrm.CustBranchNo := SelCustBranch;
        PBRPPODueFrm.CustomerName := SelCustName;
      end;

      if Operatorrg.ItemIndex = 0 then
      begin
        PBRPPODueFrm.AccountMgr := 0;
      end
      else
      begin
        PBRPPODueFrm.AccountMgr := SelAccountMgr;
      end;

      reccount := PBRPPODueFrm.GetDetails(Self);
      if reccount > 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        PBRPPODueFrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;

        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end;
    finally
      PrinterSettings.Free;
      PBRPPODueFrm.free
    end;
  finally
     Application.ProcessMessages;
  end;

end;

procedure TPBRSPODueFrm.OperatorrgClick(Sender: TObject);
begin
  if operatorrg.ItemIndex = 0 then
  begin
    operatorlbl.Visible := False;
    OperatorEdit.Visible := False;
    LUOperatorSpeedButton.Visible := False;
    OperatorEdit.Text := '';
  end
  else
  begin
    operatorlbl.Visible := True;
    OperatorEdit.Visible := True;
    LUOperatorSpeedButton.Visible := True;
    DispOperator(self);
  end;
  CanPrint(Self);
end;

procedure TPBRSPODueFrm.luOperatorSpeedbuttonClick(Sender: TObject);
begin
  PBLUOpsFrm := TPBLUOpsFrm.create(self);
  try
    PBLUOpsFrm.bIs_lookup := true;
    PBLUOpsfrm.bAllow_upd := false;
    PBLUOpsFrm.SelCode := SelAccountMgr;
    PBLUOpsFrm.showmodal;
    begin
      SelAccountMgr := PBLUOpsFrm.SelCode;
      SelAccountMgrName := PBLUOpsFrm.SelName;
      DispOperator(Self);
    end;
  finally
    PBLUOpsFrm.free;
    CanPrint(Self);
  end;
end;

end.
