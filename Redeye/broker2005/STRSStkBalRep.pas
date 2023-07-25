unit STRSStkBalRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Inifiles, QrExport, STRPStkBalRep,
  OleCtnrs, ComCtrls;

type
  TSTRSStkBalRepfrm = class(TForm)
    CloseBitBtn: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    grpbxRange: TGroupBox;
    Label1: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    Label2: TLabel;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    rdgrpSort: TRadioGroup;
    Panel1: TPanel;
    ChkBxExcProd: TCheckBox;
    AllOrOneRadioGroup: TRadioGroup;
    RepGrpBox: TGroupBox;
    Label3: TLabel;
    RepLUSpeedButton: TSpeedButton;
    RepEdit: TEdit;
    CustRadioGroup: TRadioGroup;
    CustGrpBox: TGroupBox;
    Label4: TLabel;
    CustLuSpeedButton: TSpeedButton;
    CustEdit: TEdit;
    FaxBitBtn: TBitBtn;
    GetPartsSQL: TQuery;
    EmailBitBtn: TBitBtn;
    chkbxNumbers: TCheckBox;
    OleContainer1: TOleContainer;
    btbtnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    prgbrExport: TProgressBar;
    lblExporting: TLabel;
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure CallPrintPreviewByStore (TempPreview: ByteBool);
    procedure CallPrintPreviewByPart (TempPreview: ByteBool);
    procedure edtPartFromChange(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure RepLUSpeedButtonClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure BuildFaxDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure rdgrpSortClick(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure EmailReport(Sender:TObject);
    procedure BuildEmailDetails;
    procedure ClearEMailArray(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    { Private declarations }
    bchanging: bytebool;
    SelRep, SelCustomer, SelCustBranch: Integer;
    SelName, SelCustName: string;
    bFaxing: ByteBool;
    FEMail : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    fEMailAttachType : string;
    FEmailLocation : string;
    Preview: Boolean;
    DisplayPrintDialog : Boolean;
    procedure DispCustBranch(Sender: TObject);
    procedure GetEmailApp;
    procedure PrintToAttachment(STRPStkBalRepfrm: TSTRPStkBalRepfrm);
  public
    { Public declarations }
  end;

var
  STRSStkBalRepfrm: TSTRSStkBalRepfrm;
  FaxArray: array[1..100, 1..6] of string;
  EmailArray: array[1..100, 1..10] of string;
  sAttachmentType: string;

implementation

uses
  STPrtMnt, STRPStkBalRep2, PBLURep, PBLUCust, printers, ccsprint,
  STFaxList, PBSendFax, STEmailList, CCSCommon, pbMainMenu, pbDatabase,
  Printer.Tools;

{$R *.DFM}

procedure TSTRSStkBalRepfrm.btbtnPartFromClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartFrom.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartFrom.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TSTRSStkBalRepfrm.btbtnPartToClick(Sender: TObject);
begin
  STPrtMntFrm := TSTPrtMntFrm.Create(Self) ;
  Try
    STPrtMntFrm.bIs_LookUp := True ;
    STPrtMntFrm.sCode := edtPartTo.Text ;
    STPrtMntFrm.ShowModal ;
    If STPrtMntFrm.bOK = True then
    begin
      edtPartTo.Text := STPrtMntFrm.sCode ;
    end;
  Finally
    STPrtMntFrm.Free ;
  end;
end;

procedure TSTRSStkBalRepfrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rdgrpSort.ItemIndex = 0 then
    CallPrintPreviewByStore(True)
  else
    CallPrintPreviewByPart(True);
end;

procedure TSTRSStkBalRepfrm.PrintBitBtnClick(Sender: TObject);
begin
  if rdgrpSort.ItemIndex = 0 then
    CallPrintPreviewByStore(False)
  else
    CallPrintPreviewByPart(False);
end;

procedure TSTRSStkBalRepfrm.CallPrintPreviewByStore(TempPreview: ByteBool);
begin
  STRPStkBalRepfrm := TSTRPStkBalRepfrm.Create(Self);

  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;

  with STRPStkBalRepfrm do
  try
    qryStkBalRep.ParamByName('Part_From').AsString := edtPartFrom.Text;
    qryStkBalRep.ParamByName('Part_To').AsString := edtPartTo.Text;
    if CHkBxExcProd.checked then
      qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
    else
      qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
    STRPStkBalRepfrm.bExcProd := ChkBxExcProd.Checked;
    STRPStkBalRepfrm.QRSubDtlSerNos.enabled := chkbxNumbers.Checked;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        RepNo := 0;
        QRLblCust.Caption := 'All Reps, ';
      end
      else
      begin
        RepNo := SelRep;
        RepName := SelName;
        QRLblCust.Caption := 'Rep - '+SelName+', ';
      end;

      if custradiogroup.ItemIndex = 0 then
      begin
        CustNo := 0;
        CustBranchNo := 0;
        QRLblCust.Caption := QRLblCust.Caption +'All Customers';
      end
      else
      begin
        CustNo := SelCustomer;
        CustBranchNo := SelCustBranch;
        CustomerName := SelCustName;
        QRLblCust.Caption := QRLblCust.Caption+'Customer - '+SelCustName;
      end;

    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        qrStkBal.Preview
      else
      begin
        qrStkBal.PrinterSetup;
        if qrStkBal.Tag = 0 then
          qrStkBal.Print;
      end;
    end;
  finally;
    STRPStkBalRepfrm.Free;
  end;
end;

procedure TSTRSStkBalRepfrm.edtPartFromChange(Sender: TObject);
begin
  if bChanging then exit;
  edtPartTo.Text := edtPartFrom.Text ;
end;

procedure TSTRSStkBalRepfrm.CallPrintPreviewByPart(TempPreview: ByteBool);
begin
  STRPStkBalRep2frm := TSTRPStkBalRep2frm.Create(Self);

  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;

  with STRPStkBalRep2frm do
  try
    qryStkBalRep.ParamByName('Part_From').AsString := edtPartFrom.Text;
    qryStkBalRep.ParamByName('Part_To').AsString := edtPartTo.Text;
    if CHkBxExcProd.checked then
      qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
    else
      qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
    bExcProd := ChkBxExcProd.Checked;

    qrsdtlNumbers.enabled := chkbxNumbers.Checked;

    if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        RepNo := 0;
        QRLblCust.Caption := 'All Reps, ';
      end
      else
      begin
        RepNo := SelRep;
        RepName := SelName;
        QRLblCust.Caption := 'Rep - '+SelName+', ';
      end;

      if custradiogroup.ItemIndex = 0 then
      begin
        CustNo := 0;
        CustBranchNo := 0;
        QRLblCust.Caption := QRLblCust.Caption +'All Customers';
      end
      else
      begin
        CustNo := SelCustomer;
        CustBranchNo := SelCustBranch;
        CustomerName := SelCustName;
        QRLblCust.Caption := QRLblCust.Caption+'Customer - '+SelCustName;
      end;
    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        qrStkBal.Preview
      else
      begin
        qrStkBal.PrinterSetup;
        if qrStkBal.Tag = 0 then
          qrStkBal.Print;
      end;
    end;
  finally;
    STRPStkBalRep2frm.Free;
  end;
end;

procedure TSTRSStkBalRepfrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllorOneRadioGroup.ItemIndex = 0 then
    RepGrpBox.Visible := False
  else
    RepGrpBox.Visible := True;
end;

procedure TSTRSStkBalRepfrm.RepLUSpeedButtonClick(Sender: TObject);
begin
  pbLURepFrm := TpbLURepFrm.Create(Self);
  try
    {CSLURepFrm.bODueEnqsOnly := True ;
    CSLURepFrm.dODueDate := ODueDate ;
    } pbLURepFrm.SelCode := SelRep;
    pbLURepFrm.bAllow_Upd := False;
    pbLURepFrm.bIs_Lookup := True;
    pbLURepFrm.ShowModal;
    if pbLURepFrm.Selected then
    begin
      SelRep := pbLURepFrm.SelCode;
      SelName := pbLURepFrm.SelName;
      RepEdit.Text := pbLURepFrm.SelName;
    end;
  finally
    pbLURepFrm.Free;
  end;
end;

procedure TSTRSStkBalRepfrm.CustLuSpeedButtonClick(Sender: TObject);
begin
 pbLUCustFrm := TpbLUCustFrm.Create(Self);
  pbLUCustFrm.bIs_Lookup := True;
  pbLUCustFrm.bAllow_Upd := False;
  pbLUCustFrm.SelCode := SelCustomer;
  pbLUCustFrm.SelBranch := SelCustBranch;
  pbLUCustFrm.bSel_Branch := True;
  pbLUCustFrm.ShowModal;
  begin
    SelCustomer := pbLUCustFrm.SelCode;
    SelCustBranch := pbLUCustFrm.SelBranch;
    SelCustName := pbLUCustFrm.SelName;
    DispCustBranch(Self);
  end;
  pbLUCustFrm.Free;
end;

procedure TSTRSStkBalRepfrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TSTRSStkBalRepfrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
    CustGrpBox.Visible := False
  else
    CustGrpBox.Visible := True;
end;

procedure TSTRSStkBalRepfrm.FaxBitBtnClick(Sender: TObject);
begin
 try
    bFaxing := True;
    clearfaxarray(self);
    bChanging := true;
    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bChanging := false;
    FaxReport(Self);
  finally
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TSTRSStkBalRepfrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
     Close;
     ParamByName('PartFrom').AsString := edtPartFrom.Text;
     ParamByName('PartTo').AsString := edtPartTo.Text;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        ParamByName('Rep').AsInteger := 0;
      end
      else
      begin
        ParamByName('Rep').AsInteger := SelRep;
      end;

      if custradiogroup.ItemIndex = 0 then
      begin
        ParamByName('Customer').AsInteger := 0;
 //       ParamByName('CustBranch').AsInteger := 0;
      end
      else
      begin
        ParamByName('Customer').AsInteger := SelCustomer;
 //       ParamByName('CustBranch').AsInteger:= SelCustBranch;
      end;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Customer').AsString;
      if fieldByName('Rep').AsString = '' then
        FaxArray[irow, 2] := '0'
      else
        FaxArray[irow, 2] := FieldByName('Rep').AsString;
      FaxArray[irow, 3] := FieldByName('Custbranch').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('CustName').AsString)+' '+Trim(FieldByName('Branchname').AsString);
      FaxArray[irow, 5] := FieldByName('Email').AsString;
      if fieldByName('Rep').AsString = '' then
        FaxArray[irow, 6] := 'Rep Not allocated'
      else
        FaxArray[irow, 6] := FieldByName('RepName').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TSTRSStkBalRepfrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TSTRSStkBalRepfrm.FaxReport(Sender: TObject);
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
    STFaxListFrm := TSTFaxListFrm.Create(Self);
    try
    for icount := 1 to 100 do
    begin
      if FaxArray[icount, 1] = '' then Break;
      STFaxListFrm.FaxListGrid.ColWidths[0] := 0;
      STFaxListFrm.FaxListGrid.Cells[1, icount] := FaxArray[icount, 4];
      STFaxListFrm.FaxListGrid.Cells[2, icount] := FaxArray[icount, 5];
    end;
    STFaxListFrm.FaxListGrid.RowCount := icount;
    STFaxListFrm.Caption := 'Stock Balance Report';
    STFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer/Branch';
    STFaxListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if STFaxListFrm.ModalResult = idok then
    begin
      for irow := 1 to STFaxListFrm.FaxlistGrid.Rowcount -1 do
      begin
      if Trim(STFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;
      STRPStkBalRepfrm := TSTRPStkBalRepfrm.Create(Self);
      try
        STRPStkBalRepfrm.qryStkBalRep.ParamByName('Part_From').AsString := edtPartFrom.Text;
        STRPStkBalRepfrm.qryStkBalRep.ParamByName('Part_To').AsString := edtPartTo.Text;

        if CHkBxExcProd.checked then
          STRPStkBalRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
        else
          STRPStkBalRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
        STRPStkBalRepfrm.bExcProd := ChkBxExcProd.Checked;
        if faxarray[irow,2] = '0' then
        begin
          STRPStkBalRepfrm.RepNo := 0;
          STRPStkBalRepfrm.QRLblCust.Caption := 'All Reps, ';
        end
        else
        begin
          STRPStkBalRepfrm.RepNo := StrToInt(faxarray[irow,2]);
          STRPStkBalRepfrm.RepName := faxarray[irow, 6];
          STRPStkBalRepfrm.QRLblCust.Caption := 'Rep - '+faxarray[irow, 6]+', ';
      end;

      if faxarray[irow,1] = '0' then
      begin
        STRPStkBalRepfrm.CustNo := 0;
        STRPStkBalRepfrm.CustBranchNo := 0;
        STRPStkBalRepfrm.QRLblCust.Caption := STRPStkBalRepfrm.QRLblCust.Caption +'All Customers';
      end
      else
      begin
        STRPStkBalRepfrm.CustNo := StrToInt(FaxArray[irow,1]);
        STRPStkBalRepfrm.CustBranchNo := StrToInt(FaxArray[irow,3]);
        STRPStkBalRepfrm.CustomerName := faxarray[irow, 4];
        STRPStkBalRepfrm.QRLblCust.Caption := STRPStkBalRepfrm.QRLblCust.Caption+'Customer - '+faxarray[irow, 4];
      end;
      if STRPStkBalRepfrm.GetDetails(Self) = 0 then
        MessageDlg('Nothing to fax for Customer '+faxarray[irow, 4], mtError, [mbOK], 0)
      else
      begin
        DisplayPrintDialog := False;
        STRPStkBalRepfrm.qrStkBal.Showprogress := False;
        STRPStkBalRepfrm.qrStkBal.Page.Orientation := polandscape;

        FaxFound := pbSendFaxFrm.OutToFax(STFaxListFrm.FaxListGrid.cells[2,irow],
              ' to '+ FaxArray[irow,4], '');
        if (not FaxFound) then
          Exit;

//        STRPStkBalRepfrm.qrStkBal.PrinterSettings.PrinterIndex := Faxfound;
        STRPStkBalRepfrm.qrStkBal.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
        pbSendFaxFrm.WaitForFaxFinish(Self) ;
      end;
      finally
      end;
      STRPStkBalRepfrm.Free;
    end;
  end;
  finally;
  STFaxListFrm.Free;
    end;
  finally
  PrinterSettings.Free;
  Application.ProcessMessages;
  end;
end;

procedure TSTRSStkBalRepfrm.rdgrpSortClick(Sender: TObject);
begin
faxbitbtn.enabled := rdgrpSort.itemindex = 0;
Emailbitbtn.enabled := rdgrpSort.itemIndex =0;
  btbtnExcel.enabled := rdgrpSort.itemIndex =0;
end;

procedure TSTRSStkBalRepfrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  FEMail := True;
  try
    Preview := False;
    bChanging := true;
    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bChanging := false;
    DisplayPrintDialog := false;
    ClearEMailArray(Self);
    EmailReport(Self);
  finally
    FEMail := False;
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
end;

procedure TSTRSStkBalRepfrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
      Close;
      ParamByName('PartFrom').AsString := edtPartFrom.Text;
      ParamByName('PartTo').AsString := edtPartTo.Text;
    if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        ParamByName('Rep').AsInteger := 0;
      end
      else
      begin
        ParamByName('Rep').AsInteger := SelRep;
      end;

      if custradiogroup.ItemIndex = 0 then
      begin
        ParamByName('Customer').AsInteger := 0;
//        ParamByName('CustBranch').AsInteger := 0;
      end
      else
      begin
        ParamByName('Customer').AsInteger := SelCustomer;
//        ParamByName('CustBranch').AsInteger:= SelCustBranch;
      end;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Customer').AsString;
      if fieldByName('Rep').AsString = '' then
        EmailArray[irow, 2] := '0'
      else
        EmailArray[irow, 2] := FieldByName('Rep').AsString;
      EmailArray[irow, 3] := FieldByName('Custbranch').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('CustName').AsString)+' '+Trim(FieldByName('Branchname').AsString);
      EmailArray[irow, 5] := FieldByName('Email').AsString;
      if fieldByName('Rep').AsString = '' then
        EmailArray[irow, 6] := 'Rep Not allocated'
      else
        EmailArray[irow, 6] := FieldByName('RepName').AsString;
      inc(irow);
      Next;
    end;
  end;

end;

procedure TSTRSStkBalRepfrm.ClearEMailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EMailArray[icount, icount1] := '';

end;

procedure TSTRSStkBalRepfrm.EmailReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
  STRPStkBalRepfrm : TSTRPStkBalRepfrm;
begin
 {Build the Enquiry and Supplier details}
    bChanging := true;
    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bchanging := false;
    BuildEmailDetails;

 STEmailListFrm:= TSTEmailListFrm.Create(Self);
 try
  for icount := 1 to 100 do
  begin
    if EmailArray[icount, 1] = '' then Break;
    STEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 4];
    STEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 5];
    STEmailListFrm.EmailListGrid.Cells[2, icount] := FEmailApplication;
    STEmailListFrm.EmailListGrid.Cells[4, icount] := FEmailAttachType;
    STEmailListFrm.EmailListGrid.Cells[3, icount] := '';
  end;
  STEmailListFrm.EmailListGrid.RowCount := icount;
  STEmailListFrm.Caption := 'Email List';
  STEmailListFrm.EmailListGrid.Cells[0, 0] := 'Customer/Branch';
  STEmailListFrm.EmailListGrid.Cells[1, 0] := 'Email Address';
  STEmailListFrm.EmailListGrid.Cells[2, 0] := 'Application';
  STEmailListFrm.ShowModal;

  {If OK to send the email then send them}
  if STEmailListFrm.ModalResult = idok then
  begin
    STRPStkBalRepfrm := TSTRPStkBalRepfrm.Create(Self);
      try
        STRPStkBalRepfrm.qryStkBalRep.ParamByName('Part_From').AsString := edtPartFrom.Text;
        STRPStkBalRepfrm.qryStkBalRep.ParamByName('Part_To').AsString := edtPartTo.Text;
        if CHkBxExcProd.checked then
          STRPStkBalRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
        else
          STRPStkBalRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
        STRPStkBalRepfrm.bExcProd := ChkBxExcProd.Checked;

      for irow := 1 to STEmailListFrm.EmailListGrid.RowCount - 1 do
      begin
        if (Trim(STEmailListFrm.EmailListGrid.Cells[4, irow]) = '') or
                  (Trim(STEmailListFrm.EmailListGrid.Cells[1, irow]) = '') then continue;
        if emailarray[irow,2] = '0' then
        begin
          STRPStkBalRepfrm.RepNo := 0;
          STRPStkBalRepfrm.QRLblCust.Caption := 'All Reps, ';
        end
        else
        begin
          STRPStkBalRepfrm.RepNo := StrToInt(emailarray[irow,2]);
          STRPStkBalRepfrm.RepName := emailarray[irow, 6];
          STRPStkBalRepfrm.QRLblCust.Caption := 'Rep - '+ emailarray[irow, 6]+', ';
        end;

        if Emailarray[irow,1] = '0' then
        begin
          STRPStkBalRepfrm.CustNo := 0;
          STRPStkBalRepfrm.CustBranchNo := 0;
          STRPStkBalRepfrm.QRLblCust.Caption := STRPStkBalRepfrm.QRLblCust.Caption +'All Customers';
        end
        else
        begin
          STRPStkBalRepfrm.CustNo := StrToInt(EmailArray[irow,1]);
          STRPStkBalRepfrm.CustBranchNo := StrToInt(EmailArray[irow,3]);
          STRPStkBalRepfrm.CustomerName := EmailArray[irow,4];
          STRPStkBalRepfrm.QRLblCust.Caption := STRPStkBalRepfrm.QRLblCust.Caption+'Customer - '+EmailArray[irow,4];
        end;
//        STRPStkBalRepfrm.bExcProd := ChkBxExcProd.Checked;
        if STRPStkBalRepfrm.GetDetails(Self) = 0 then
          MessageDlg('Nothing to email for Customer '+selcustname, mtError, [mbOK], 0)
        else
        begin
          sAttachmentType := STEmailListFrm.EmailListGrid.Cells[4, irow];
          STRPStkBalRepfrm.qrstkbal.Showprogress := False;
          Printtoattachment(STRPStkBalRepfrm);
          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(STEmailListFrm.EmailListGrid.Cells[1, irow]);
          sSubject := 'Stock Balance Report';
          sSalutation := '';
          sBody := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
      end;
    finally
      STRPStkBalRepfrm.Free;
    end;
  end;
  finally
    STEmailListFrm.Free;
  end;
 end;

procedure TSTRSStkBalRepfrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      FEmailApplication := ReadString('Email', 'Application', 'None');
      FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
      fEmailAttachType := ReadString('Email', 'Def Attach Type', 'None');
      Free;
    end;
end;

procedure TSTRSStkBalRepfrm.PrintToAttachment(STRPStkBalRepfrm: TSTRPStkBalRepfrm);
begin
  var fileName := 'StkBal' + '-' + STRPStkBalRepfrm.RepNo.ToString;
  PrinterTools.New.PrintToAttachment(STRPStkBalRepfrm.qrStkBal, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TSTRSStkBalRepfrm.PrintToAttachment(STRPStkBalRepfrm: TSTRPStkBalRepfrm);
var
  i: integer;
  sLocation, sFileName: string;
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

  sFileName := 'StkBal';

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        STRPStkBalRepfrm.qrstkbal.Prepare;
        STRPStkBalRepfrm.qrstkbal.ExportToFilter(RTFFilter);
      finally
        STRPStkBalRepfrm.qrstkbal.QRPrinter.Free;
        STRPStkBalRepfrm.qrstkbal.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        STRPStkBalRepfrm.qrstkbal.Prepare;
        STRPStkBalRepfrm.qrstkbal.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPStkBalRepfrm.qrstkbal.QRPrinter.Free;
        STRPStkBalRepfrm.qrstkbal.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        STRPStkBalRepfrm.qrstkbal.Prepare;
        STRPStkBalRepfrm.qrstkbal.ExportToFilter(PDFFilter);
      finally
        STRPStkBalRepfrm.qrstkbal.QRPrinter.Free;
        STRPStkBalRepfrm.qrstkbal.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        STRPStkBalRepfrm.qrstkbal.Prepare;
        STRPStkBalRepfrm.qrstkbal.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPStkBalRepfrm.qrstkbal.QRPrinter.Free;
        STRPStkBalRepfrm.qrstkbal.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        STRPStkBalRepfrm.qrstkbal.Prepare;
        STRPStkBalRepfrm.qrstkbal.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPStkBalRepfrm.qrstkbal.QRPrinter.Free;
        STRPStkBalRepfrm.qrstkbal.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        STRPStkBalRepfrm.qrstkbal.Prepare;
 //       ExportToRTF(STRPStkBalRepfrm.qrstkbal, sLocation + sFilename + '.bmp');
      STRPStkBalRepfrm.qrstkbal.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPStkBalRepfrm.qrstkbal.QRPrinter.Free;
        STRPStkBalRepfrm.qrstkbal.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;

  AFilters.free;
end;
*)

procedure TSTRSStkBalRepfrm.FormActivate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
  GetEmailApp;
  Emailbitbtn.enabled := rdgrpSort.itemIndex =0;
  faxbitbtn.enabled := rdgrpSort.itemindex = 0;
end;

procedure TSTRSStkBalRepfrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
end;

procedure TSTRSStkBalRepfrm.btbtnExcelClick(Sender: TObject);
var
  STRPStkBalRepfrm: TSTRPStkBalRepfrm;
  PrinterSettings: TPrinterSettings;
  tempFileName: string;
  recCount: integer;
begin
  bChanging := true;
  if edtPartFrom.Text = '' then
  begin
    edtPartFrom.Text := '000000000000';
    self.edtPartFrom.Repaint;
  end;

  if edtPartTo.Text = '' then
  begin
    edtPartTo.Text := 'zzzzzzzzzzzz';
    self.edtPartTo.Repaint;
  end;
  bchanging := false;


  STRPStkBalRepfrm := TSTRPStkBalRepfrm.Create(Self);
  try
    STRPStkBalRepfrm.qryStkBalRep.ParamByName('Part_From').AsString := edtPartFrom.Text;
    STRPStkBalRepfrm.qryStkBalRep.ParamByName('Part_To').AsString := edtPartTo.Text;
    if CHkBxExcProd.checked then
      STRPStkBalRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
    else
      STRPStkBalRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
    STRPStkBalRepfrm.bExcProd := ChkBxExcProd.Checked;

    if AllOrOneRadioGroup.ItemIndex = 0 then
    begin
      STRPStkBalRepfrm.RepNo := 0;
      //QRLblCust.Caption := 'All Reps, ';
    end
    else
    begin
      STRPStkBalRepfrm.RepNo := SelRep;
      STRPStkBalRepfrm.RepName := SelName;
      //QRLblCust.Caption := 'Rep - '+SelName+', ';
    end;

    if custradiogroup.ItemIndex = 0 then
    begin
      STRPStkBalRepfrm.CustNo := 0;
      STRPStkBalRepfrm.CustBranchNo := 0;
      //QRLblCust.Caption := QRLblCust.Caption +'All Customers';
    end
    else
    begin
      STRPStkBalRepfrm.CustNo := SelCustomer;
      STRPStkBalRepfrm.CustBranchNo := SelCustBranch;
      STRPStkBalRepfrm.CustomerName := SelCustName;
      //QRLblCust.Caption := QRLblCust.Caption+'Customer - '+SelCustName;
    end;


    recCount := STRPStkBalRepfrm.GetDetails(Self);
    if recCount <> 0 then
    begin
      self.prgbrExport.Max := recCount;
      tempFileName := getWinTempDir+'temp.csv';
      self.pnlExportPrgrss.BringToFront;
      self.pnlExportPrgrss.Visible := true;
      self.pnlExportPrgrss.Repaint;
      
      STRPStkBalRepfrm.ExportToFile(tempFileName);
      self.pnlExportPrgrss.visible := false;
      self.Repaint;
      self.prgbrExport.Position := 0;
      self.OleContainer1.CreateLinkToFile(tempFileName, false);
      self.OleContainer1.DoVerb(0);
    end;
  finally
    STRPStkBalRepfrm.Free;
  end;
end;

end.
