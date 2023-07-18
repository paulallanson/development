unit STRSAgedStk;

interface                                                             

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, Db, DBTables, Inifiles, gtQrExport, STRPAgedStk,
  OleCtnrs, Spin;

type
  TSTRSAgedStkFrm = class(TForm)
    grpbxRange: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    Label1: TLabel;
    RadioGroupCst: TRadioGroup;
    AllOrOneRadioGroup: TRadioGroup;
    RepGrpBox: TGroupBox;
    Label4: TLabel;
    RepLUSpeedButton: TSpeedButton;
    RepEdit: TEdit;
    CustRadioGroup: TRadioGroup;
    CustGrpBox: TGroupBox;
    Label5: TLabel;
    CustLuSpeedButton: TSpeedButton;
    CustEdit: TEdit;
    FaxBitBtn: TBitBtn;
    GetPartsSQL: TQuery;
    EmailBitBtn: TBitBtn;
    ChkBxExcProd: TCheckBox;
    OleContainer1: TOleContainer;
    btbtnExcel: TBitBtn;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    rdgrpReportType: TRadioGroup;
    RadioGroup1: TRadioGroup;
    StoresGrpBox: TGroupBox;
    Label6: TLabel;
    LUSpdBttnStr: TSpeedButton;
    EdtStore: TEdit;
    rdgBins: TRadioGroup;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    EdtBinFrm: TEdit;
    EDTBinTo: TEdit;
    lblMaxRecords: TLabel;
    spnMaxRecords: TSpinEdit;
    spnDaysHeld: TSpinEdit;
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
    procedure CallPrintPreview (TempPreview: ByteBool);
    procedure CallNotePrint(TempPreview: ByteBool);
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure edtPartFromChange(Sender: TObject);
    procedure edtNoOfDaysKeyPress(Sender: TObject; var Key: Char);
    procedure edtNoOfDaysChange(Sender: TObject);
    procedure edtNoOfDaysExit(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure RepLUSpeedButtonClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure BuildFaxDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure RadioGroupCstClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure EmailReport(Sender:TObject);
    procedure BuildEmailDetails;
    procedure ClearEMailArray(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
    procedure LUSpdBttnStrClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure rdgBinsClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure rdgrpReportTypeClick(Sender: TObject);
    procedure EdtBinFrmChange(Sender: TObject);
    procedure EDTBinToChange(Sender: TObject);
  private
    SelStore: integer;
    SelRep, SelCustomer, SelCustBranch: Integer;
    SelName, SelCustName, SelStoreName: string;
    SelFrmBin, SelToBin: string;
    bFaxing: ByteBool;
    FEMail : Boolean;
    FEmailAttachment : TstringList;
    FEmailApplication : string;
    fEMailAttachType : string;
    FEmailLocation : string;
    bchanging: bytebool;
    Preview: Boolean;
    DisplayPrintDialog : Boolean;
    procedure DispCustBranch(Sender: TObject);
    procedure GetEmailApp;
    procedure PrintToAttachment(STRPAgedStkfrm: TSTRPAgedStkfrm);
  public
    { Public declarations }
  end;

var
  STRSAgedStkFrm: TSTRSAgedStkFrm;
  FaxArray: array[1..100, 1..6] of string;
  EmailArray: array[1..100, 1..10] of string;
  sAttachmentType: string;


implementation

uses STPrtMnt, STFaxList, STEmailList, PBLURep, PBLUCust, printers, CCSPrint,
  PBSendFax, CCSCommon, STRPAgedStkNote, STLUPrtStor, STMntPrtBin,
  pbMainMenu, pbDatabase;

{$R *.DFM}

procedure TSTRSAgedStkFrm.btbtnPartFromClick(Sender: TObject);
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

procedure TSTRSAgedStkFrm.btbtnPartToClick(Sender: TObject);
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

procedure TSTRSAgedStkFrm.CallPrintPreview(TempPreview: ByteBool);
begin
  STRPAgedStkfrm := TSTRPAgedStkfrm.Create(Self);
  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;

  with STRPAgedStkfrm do
  try
    TitleQRLabel.Caption := 'Aged Stock Report - ' + DateToStr(Date());
    if RadioGroupCst.itemIndex = 0 then
      qrlblDateSince.Caption := 'Report showing products that have been stocked for more than ' + inttostr(spnDaysHeld.value) + ' days, valued at Cost'
    else
      begin
        qrlblDateSince.Caption := 'Report showing products that have been stocked for more than ' + inttostr(spnDaysHeld.value) + ' days, valued at Sales';
        qrlabel5.Caption := 'Sales Value';
      end;
    STRPAgedStkFrm.RunDate := Date();
    STRPAgedStkFrm.NoofDays := spnDaysHeld.value;

    STRPAgedStkfrm.istore := selstore;
    if rdgBins.itemindex = 0 then
      begin
        STRPAgedStkFrm.BinFrom := '000000000000';
        STRPAgedStkfrm.BinTo := 'zzzzzzzzzzzz';
      end
    else
      begin
        STRPAgedStkFrm.BinFrom := selFrmBin;
        STRPAgedStkfrm.BinTo := selToBin;
      end;

    if edtPartFrom.Text <> '' then
      qryAgedStk.ParamByName('PartFrom').AsString := edtPartFrom.Text
    else
      qryAgedStk.ParamByName('PartFrom').AsString := '0000000000000';

    if edtPartFrom.Text <> '' then
      qryAgedStk.ParamByName('PartTo').AsString := edtPartTo.Text
    else
      qryAgedStk.ParamByName('PartTo').AsString := 'zzzzzzzzzzzzzz';
    STRPAgedStkFrm.bAtCost := RadioGroupCst.itemIndex = 0;
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
    bExcProd := ChkBxExcProd.Checked;
    if CHkBxExcProd.checked then
      qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
    else
      qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        qrAgedStk.Preview
      else
      begin
        qrAgedStk.PrinterSetup;
        if qrAgedStk.Tag = 0 then
          qrAgedStk.Print;
      end;
    end;
  finally;
    STRPAgedStkfrm.Free;
  end;
end;

procedure TSTRSAgedStkFrm.CallNotePrint(TempPreview: ByteBool);
begin
  STRPAgedStkNotefrm := TSTRPAgedStkNotefrm.Create(Self);
  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bchanging := false;

  with STRPAgedStkNotefrm do
  try
    if RadioGroupCst.itemIndex = 0 then
      qrlblDateSince.Caption := 'Stock held for ' + inttostr(spnDaysHeld.value) + ' days or more'
    else
      begin
        qrlblDateSince.Caption := 'Stock held for ' + inttostr(spnDaysHeld.value) + ' days or more';
      end;

    STRPAgedStkNotefrm.RunDate := Date();
    STRPAgedStkNotefrm.NoofDays := spnDaysHeld.value;
    STRPAgedStkNotefrm.MaxRecords := spnMaxRecords.value;

    STRPAgedStkNotefrm.istore := selstore;
    if rdgBins.itemindex = 0 then
      begin
        STRPAgedStkNotefrm.BinFrom := '000000000000';
        STRPAgedStkNotefrm.BinTo := 'zzzzzzzzzzzz';
      end
    else
      begin
        STRPAgedStkNotefrm.BinFrom := selFrmBin;
        STRPAgedStkNotefrm.BinTo := selToBin;
      end;

    if edtPartFrom.Text <> '' then
      qryReport.ParamByName('PartFrom').AsString := edtPartFrom.Text
    else
      qryReport.ParamByName('PartFrom').AsString := '0000000000000';

    if edtPartFrom.Text <> '' then
      qryReport.ParamByName('PartTo').AsString := edtPartTo.Text
    else
      qryReport.ParamByName('PartTo').AsString := 'zzzzzzzzzzzzzz';

    STRPAgedStkNotefrm.bAtCost := RadioGroupCst.itemIndex = 0;

    if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        RepNo := 0;
      end
      else
      begin
        RepNo := SelRep;
        RepName := SelName;
      end;

      if custradiogroup.ItemIndex = 0 then
      begin
        CustNo := 0;
        CustBranchNo := 0;
      end
      else
      begin
        CustNo := SelCustomer;
        CustBranchNo := SelCustBranch;
        CustomerName := SelCustName;
      end;
    bExcProd := ChkBxExcProd.Checked;

    if STRPAgedStkNotefrm.GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        qrpDetails.Preview
      else
      begin
        qrpDetails.PrinterSetup;
        if qrpDetails.Tag = 0 then
          qrpDetails.Print;
      end;
    end;
  finally;
    STRPAgedStkNotefrm.Free;
  end;
end;

procedure TSTRSAgedStkFrm.PreviewBitBtnClick(Sender: TObject);
begin
  if rdgrpReportType.ItemIndex = 0 then
    CallPrintPreview(True)
  else
    CallNotePrint(True);
end;

procedure TSTRSAgedStkFrm.PrintBitBtnClick(Sender: TObject);
begin
  if rdgrpReportType.ItemIndex = 0 then
    CallPrintPreview(False)
  else
    CallNotePrint(False);
end;

procedure TSTRSAgedStkFrm.edtPartFromChange(Sender: TObject);
begin
    if bChanging then exit;
    edtPartTo.Text := edtPartFrom.Text;
end;

procedure TSTRSAgedStkFrm.edtNoOfDaysKeyPress(Sender: TObject;
  var Key: Char);
begin
(*  if Key = #13 then
  begin
    try
      StrToInt(edtNoOfDays.Text);
      PreviewBitBtn.Enabled := True;
      PrintBitBtn.Enabled := True;
      edtPartFrom.setFocus();
    except
      PreviewBitBtn.Enabled := False;
      PrintBitBtn.Enabled := False;
    end;
  end;
*)
end;

procedure TSTRSAgedStkFrm.edtNoOfDaysChange(Sender: TObject);
begin
(*  try
    StrToInt(edtNoOfDays.Text);
    PreviewBitBtn.Enabled := True;
    PrintBitBtn.Enabled := True;
  except
    PreviewBitBtn.Enabled := False;
    PrintBitBtn.Enabled := False;
  end;
*)end;

procedure TSTRSAgedStkFrm.edtNoOfDaysExit(Sender: TObject);
begin
(*  try
    StrToInt(edtNoOfDays.Text);
    PreviewBitBtn.Enabled := True;
    PrintBitBtn.Enabled := True;
  except
    PreviewBitBtn.Enabled := False;
    PrintBitBtn.Enabled := False;
  end;
*)
end;

procedure TSTRSAgedStkFrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllorOneRadioGroup.ItemIndex = 0 then
    RepGrpBox.Visible := False
  else
    RepGrpBox.Visible := True;
end;

procedure TSTRSAgedStkFrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
    CustGrpBox.Visible := False
  else
    CustGrpBox.Visible := True;
end;

procedure TSTRSAgedStkFrm.RepLUSpeedButtonClick(Sender: TObject);
begin
  pbLURepFrm := TpbLURepFrm.Create(Self);
  try
    {pbLURepFrm.bODueEnqsOnly := True ;
    pbLURepFrm.dODueDate := ODueDate ;
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

procedure TSTRSAgedStkFrm.CustLuSpeedButtonClick(Sender: TObject);
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

procedure TSTRSAgedStkFrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TSTRSAgedStkFrm.FaxBitBtnClick(Sender: TObject);
begin
 try
    bFaxing := True;
    bChanging := true;
    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bChanging := false;
    clearfaxarray(self);
    FaxReport(Self);
  finally
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
end;

procedure TSTRSAgedStkFrm.FaxReport(Sender: TObject);
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
    STFaxListFrm.Caption := 'Aged Stock Report';
    STFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer/Branch';
    STFaxListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if STFaxListFrm.ModalResult = idok then
    begin
      for irow := 1 to STFaxListFrm.FaxlistGrid.Rowcount -1 do
      begin
      if Trim(STFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;
      STRPAgedStkfrm := TSTRPAgedStkfrm.Create(Self);
      try
        STRPAgedStkfrm.TitleQRLabel.Caption := 'Aged Stock Report - ' + DateToStr(Date());
        if RadioGroupCst.itemIndex = 0 then
          STRPAgedStkfrm.qrlblDateSince.Caption := 'Report showing products that have been stocked for more than ' + inttostr(spnDaysHeld.value) + ' days, valued at Cost'
        else
         begin
          STRPAgedStkfrm.qrlblDateSince.Caption := 'Report showing products that have been stocked for more than ' + inttostr(spnDaysHeld.value) + ' days, valued at Sales';
          STRPAgedStkfrm.qrlabel5.Caption := 'Sales Value';
         end;
        STRPAgedStkfrm.qryAgedStk.ParamByName('theDate').AsDateTime := Date();
        STRPAgedStkfrm.qryAgedStk.ParamByName('noOfDays').AsInteger := spnDaysHeld.value;
        STRPAgedStkfrm.qryAgedStk.ParamByName('PartFrom').AsString := edtPartFrom.Text;
        STRPAgedStkfrm.qryAgedStk.ParamByName('PartTo').AsString := edtPartTo.Text;
        STRPAgedStkFrm.bAtCost := RadioGroupCst.itemIndex = 0;
        if faxarray[irow,2] = '0' then
        begin
          STRPAgedStkfrm.RepNo := 0;
          STRPAgedStkfrm.QRLblCust.Caption := 'All Reps, ';
        end
        else
        begin
          STRPAgedStkfrm.RepNo := StrToInt(faxarray[irow,2]);
          STRPAgedStkfrm.RepName := faxarray[irow, 6];
          STRPAgedStkfrm.QRLblCust.Caption := 'Rep - '+faxarray[irow, 6]+', ';
      end;

      if faxarray[irow,1] = '0' then
      begin
        STRPAgedStkfrm.CustNo := 0;
        STRPAgedStkfrm.CustBranchNo := 0;
        STRPAgedStkfrm.QRLblCust.Caption := STRPAgedStkfrm.QRLblCust.Caption +'All Customers';
      end
      else
      begin
        STRPAgedStkfrm.CustNo := StrToInt(FaxArray[irow,1]);
        STRPAgedStkfrm.CustBranchNo := StrToInt(FaxArray[irow,3]);
        STRPAgedStkfrm.CustomerName := faxarray[irow, 4];
        STRPAgedStkfrm.QRLblCust.Caption := STRPAgedStkfrm.QRLblCust.Caption+'Customer - '+faxarray[irow, 4];
      end;
      STRPAgedStkfrm.bExcProd := ChkBxExcProd.Checked;
      if CHkBxExcProd.checked then
        STRPAgedStkfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
      else
        STRPAgedStkfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
      if STRPAgedStkfrm.GetDetails(Self) = 0 then
        MessageDlg('Nothing to fax for Customer '+faxarray[irow, 4], mtError, [mbOK], 0)
      else
      begin
        DisplayPrintDialog := False;
        STRPAgedStkfrm.qrAgedStk.Showprogress := False;
        STRPAgedStkfrm.qrAgedStk.Page.Orientation := polandscape;

        FaxFound := pbSendFaxFrm.OutToFax(STFaxListFrm.FaxListGrid.cells[2,irow],
              ' to '+ FaxArray[irow,4], '');
          if (not FaxFound) then
            MessageDlg('The fax driver is not installed', mtError, [mbOK], 0)
          else
//          STRPAgedStkFrm.qrAgedStk.PrinterSettings.PrinterIndex := Faxfound;
            STRPAgedStkfrm.qrAgedStk.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
//          STSendFaxFrm.WaitForFaxFinish(Self) ;
        end;
      finally
      end;
      STRPAgedStkfrm.Free;
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

procedure TSTRSAgedStkFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
     Close;
     ParamByName('theDate').AsDateTime := Date();
     ParamByName('noOfDays').AsInteger := spnDaysHeld.value;
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

procedure TSTRSAgedStkFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TSTRSAgedStkFrm.RadioGroupCstClick(Sender: TObject);
begin
Faxbitbtn.enabled := RadioGroupCst.itemIndex =1;
Emailbitbtn.enabled := RadioGroupCst.itemIndex =1;
end;

procedure TSTRSAgedStkFrm.FormActivate(Sender: TObject);
begin
Faxbitbtn.enabled := RadioGroupCst.itemIndex =1;
Emailbitbtn.enabled := RadioGroupCst.itemIndex =1;
FEmailAttachment := TStringList.create;
GetEmailApp;
end;

procedure TSTRSAgedStkFrm.EmailBitBtnClick(Sender: TObject);
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

procedure TSTRSAgedStkFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
    Close;
     ParamByName('theDate').AsDateTime := Date();
     ParamByName('noOfDays').AsInteger := spnDaysHeld.value;
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

procedure TSTRSAgedStkFrm.ClearEMailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EMailArray[icount, icount1] := '';
end;

procedure TSTRSAgedStkFrm.EmailReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
  STRPAgedStkfrm : TSTRPAgedStkfrm;
begin
 {Build the Enquiry and Supplier details}
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
    STRPAgedStkfrm := TSTRPAgedStkfrm.Create(Self);
    try
        STRPAgedStkfrm.TitleQRLabel.Caption := 'Aged Stock Report - ' + DateToStr(Date());
        if RadioGroupCst.itemIndex = 0 then
          STRPAgedStkfrm.qrlblDateSince.Caption := 'Report showing products that have been stocked for more than ' + inttostr(spnDaysHeld.value) + ' days, valued at Cost'
        else
         begin
          STRPAgedStkfrm.qrlblDateSince.Caption := 'Report showing products that have been stocked for more than ' + inttostr(spnDaysHeld.value) + ' days, valued at Sales';
          STRPAgedStkfrm.qrlabel5.Caption := 'Sales Value';
         end;
        STRPAgedStkfrm.qryAgedStk.ParamByName('theDate').AsDateTime := Date();
        STRPAgedStkfrm.qryAgedStk.ParamByName('noOfDays').AsInteger := spnDaysHeld.value;
        STRPAgedStkfrm.qryAgedStk.ParamByName('PartFrom').AsString := edtPartFrom.Text;
        STRPAgedStkfrm.qryAgedStk.ParamByName('PartTo').AsString := edtPartTo.Text;
        STRPAgedStkFrm.bAtCost := RadioGroupCst.itemIndex = 0;
      for irow := 1 to STEmailListFrm.EmailListGrid.RowCount - 1 do
      begin
        if (Trim(STEmailListFrm.EmailListGrid.Cells[4, irow]) = '') or
                  (Trim(STEmailListFrm.EmailListGrid.Cells[1, irow]) = '') then continue;
        if emailarray[irow,2] = '0' then
        begin
          STRPAgedStkfrm.RepNo := 0;
          STRPAgedStkfrm.QRLblCust.Caption := 'All Reps, ';
        end
        else
        begin
          STRPAgedStkfrm.RepNo := StrToInt(emailarray[irow,2]);
          STRPAgedStkfrm.RepName := emailarray[irow, 6];
          STRPAgedStkfrm.QRLblCust.Caption := 'Rep - '+ emailarray[irow, 6]+', ';
        end;

        if Emailarray[irow,1] = '0' then
        begin
          STRPAgedStkfrm.CustNo := 0;
          STRPAgedStkfrm.CustBranchNo := 0;
          STRPAgedStkfrm.QRLblCust.Caption := STRPAgedStkfrm.QRLblCust.Caption +'All Customers';
        end
        else
        begin
          STRPAgedStkfrm.CustNo := StrToInt(EmailArray[irow,1]);
          STRPAgedStkfrm.CustBranchNo := StrToInt(EmailArray[irow,3]);
          STRPAgedStkfrm.CustomerName := EmailArray[irow,4];
          STRPAgedStkfrm.QRLblCust.Caption := STRPAgedStkfrm.QRLblCust.Caption+'Customer - '+EmailArray[irow,4];
        end;
        STRPAgedStkfrm.bExcProd := ChkBxExcProd.Checked;
        if CHkBxExcProd.checked then
          STRPAgedStkfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
        else
          STRPAgedStkfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
        if STRPAgedStkfrm.GetDetails(Self) = 0 then
          MessageDlg('Nothing to email for Customer '+selcustname, mtError, [mbOK], 0)
        else
        begin
          sAttachmentType := STEmailListFrm.EmailListGrid.Cells[4, irow];
          STRPAgedStkfrm.QrAgedStk.Showprogress := False;
          Printtoattachment(STRPAgedStkfrm);
          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(STEmailListFrm.EmailListGrid.Cells[1, irow]);
          sSubject := 'Aged Stock Report';
          sSalutation := '';
          sBody := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
      end;
    finally
      STRPAgedStkfrm.Free;
    end;
  end;
  finally
    STEmailListFrm.Free;
  end;
 end;

procedure TSTRSAgedStkFrm.GetEmailApp;
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


procedure TSTRSAgedStkFrm.PrintToAttachment(
  STRPAgedStkfrm: TSTRPAgedStkfrm);
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
(*  if FEmailLocation = '' then
    sLocation := 'C:\Windows\temp\'
  else
    sLocation := FEmailLocation;
*)
  sFileName := 'AgedStk';

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        STRPAgedStkfrm.QrAgedStk.Prepare;
        STRPAgedStkfrm.QrAgedStk.ExportToFilter(RTFFilter);
      finally
        STRPAgedStkfrm.QrAgedStk.QRPrinter.Free;
        STRPAgedStkfrm.QrAgedStk.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        STRPAgedStkfrm.QrAgedStk.Prepare;
        STRPAgedStkfrm.QrAgedStk.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPAgedStkfrm.QrAgedStk.QRPrinter.Free;
        STRPAgedStkfrm.QrAgedStk.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        STRPAgedStkfrm.QrAgedStk.Prepare;
        STRPAgedStkfrm.QrAgedStk.ExportToFilter(PDFFilter);
      finally
        STRPAgedStkfrm.QrAgedStk.QRPrinter.Free;
        STRPAgedStkfrm.QrAgedStk.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        STRPAgedStkfrm.QrAgedStk.Prepare;
        STRPAgedStkfrm.QrAgedStk.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPAgedStkfrm.QrAgedStk.QRPrinter.Free;
        STRPAgedStkfrm.QrAgedStk.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        STRPAgedStkfrm.QrAgedStk.Prepare;
        STRPAgedStkfrm.QrAgedStk.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPAgedStkfrm.QrAgedStk.QRPrinter.Free;
        STRPAgedStkfrm.QrAgedStk.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        STRPAgedStkfrm.QrAgedStk.Prepare;
 //       ExportToRTF(STRPAgedStkfrm.QrAgedStk, sLocation + sFilename + '.bmp');
      STRPAgedStkfrm.QrAgedStk.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPAgedStkfrm.QrAgedStk.QRPrinter.Free;
        STRPAgedStkfrm.QrAgedStk.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;


  AFilters.free;
end;

procedure TSTRSAgedStkFrm.FormDestroy(Sender: TObject);
begin
 FEmailAttachment.free;
end;

procedure TSTRSAgedStkFrm.btbtnExcelClick(Sender: TObject);
var
  STRPAgedStkfrm: TSTRPAgedStkfrm;
  tempFileName: string;
  recCount: integer;
begin
  STRPAgedStkfrm := TSTRPAgedStkfrm.Create(Self);
  try
    bChanging := true;
    if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
    if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
    bchanging := false;

    with STRPAgedStkfrm do
    begin
      STRPAgedStkFrm.RunDate := Date();
      STRPAgedStkFrm.NoofDays := spnDaysHeld.value;

      STRPAgedStkfrm.istore := selstore;
      if rdgBins.itemindex = 0 then
        begin
          STRPAgedStkFrm.BinFrom := '000000000000';
          STRPAgedStkfrm.BinTo := 'zzzzzzzzzzzz';
        end
      else
        begin
          STRPAgedStkFrm.BinFrom := selFrmBin;
          STRPAgedStkfrm.BinTo := selToBin;
        end;
        
      if edtPartFrom.Text <> '' then
        qryAgedStk.ParamByName('PartFrom').AsString := edtPartFrom.Text
      else
        qryAgedStk.ParamByName('PartFrom').AsString := '0000000000000';

      if edtPartFrom.Text <> '' then
        qryAgedStk.ParamByName('PartTo').AsString := edtPartTo.Text
      else
        qryAgedStk.ParamByName('PartTo').AsString := 'zzzzzzzzzzzzzz';

      bAtCost := RadioGroupCst.itemIndex = 0;

      if AllOrOneRadioGroup.ItemIndex = 0 then
        begin
          RepNo := 0;
        end
      else
        begin
          RepNo := SelRep;
          RepName := SelName;
        end;

      if custradiogroup.ItemIndex = 0 then
        begin
          CustNo := 0;
          CustBranchNo := 0;
        end
      else
        begin
          CustNo := SelCustomer;
          CustBranchNo := SelCustBranch;
          CustomerName := SelCustName;
        end;

      bExcProd := ChkBxExcProd.Checked;

      recCount := GetDetails(Self);
      if recCount <> 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + self.caption + formatdatetime('yymmddhhmmss',now)+'.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        STRPAgedStkfrm.ExportToFile(tempFileName);
        self.pnlExportPrgrss.visible := false;
        self.Repaint;
        self.prgbrExport.Position := 0;
        self.OleContainer1.CreateLinkToFile(tempFileName, false);
        self.OleContainer1.DoVerb(0);
      end
      else
      begin
        MessageDlg('There are no records to print', mtError, [mbOK], 0);
      end;
    end;
  finally
    STRPAgedStkfrm.Free;
  end;
end;

procedure TSTRSAgedStkFrm.LUSpdBttnStrClick(Sender: TObject);
begin
 STLUPrtStorFrm := TSTLUPrtStorFrm.Create(Self);
  try
    STLUPrtStorFrm.iSelCode := Selstore;
    STLUPrtStorFrm.bAllow_Upd := False;
    STLUPrtStorFrm.bIs_Lookup := True;
    STLUPrtStorFrm.ShowModal;
    if STLUPrtStorFrm.Selected then
    begin
      Selstore := STLUPrtStorFrm.iSelCode;
      SelstoreName := STLUPrtStorFrm.SelName;
      EdtStore.Text := STLUPrtStorFrm.SelName;
    end;
  finally
    STLUPrtStorFrm.Free;
  end;
end;

procedure TSTRSAgedStkFrm.RadioGroup1Click(Sender: TObject);
begin
  if radioGroup1.ItemIndex = 0 then
    begin
      EdtStore.Text := '';
      RadioGroup1.visible := false;
      rdgBins.itemindex := 0;
      GroupBox2.visible := false;
      EdtBinFrm.Text := '';
      EdtBinTo.Text := '';
      selstore := 0;
      StoresGrpBox.Visible := false;
      StoresGrpBox.enabled := false;
    end
  else
    begin
      StoresGrpBox.enabled := true;
      rdgBins.visible := true;
      StoresGrpBox.Visible := true;
    end;
end;

procedure TSTRSAgedStkFrm.rdgBinsClick(Sender: TObject);
begin
  if rdgBins.ItemIndex = 0 then
    begin
      GroupBox2.visible := False;
      selfrmBin := '';
      selToBin := '';
    end
  else
    GroupBox2.Visible := True;
end;

procedure TSTRSAgedStkFrm.SpeedButton2Click(Sender: TObject);
begin
  STMntPrtBinFrm := TSTMntPrtBinFrm.Create(self) ;
  try
    STMntPrtBinFrm.iStore := selstore ;
    STMntPrtBinFrm.sStoreName := selstorename ;
    STMntPrtBinFrm.bAllow_Upd := False ;
    STMntPrtBinFrm.ShowModal ;
    Selfrmbin := STMntPrtBinFrm.sSelBin;
    EdtbinFrm.Text := STMntPrtBinFrm.sSelBin;
  finally
    STMntPrtBinFrm.Free ;
  end;

end;

procedure TSTRSAgedStkFrm.SpeedButton1Click(Sender: TObject);
begin
  STMntPrtBinFrm := TSTMntPrtBinFrm.Create(self) ;
  try
    STMntPrtBinFrm.iStore := selstore ;
    STMntPrtBinFrm.sStoreName := selstorename ;
    STMntPrtBinFrm.bAllow_Upd := False ;
    STMntPrtBinFrm.ShowModal ;
    SelTobin := STMntPrtBinFrm.sSelBin;
    EdtbinTo.Text := STMntPrtBinFrm.sSelBin;
  finally
    STMntPrtBinFrm.Free ;
  end;
end;

procedure TSTRSAgedStkFrm.rdgrpReportTypeClick(Sender: TObject);
begin
  case (Sender as TRadioGroup).ItemIndex of
    0: begin
        lblMaxRecords.Visible := false;
        spnMaxRecords.Visible := false;
       end;
    1: begin
        lblMaxRecords.Visible := true;
        spnMaxRecords.Visible := true;
       end;
  end;
end;

procedure TSTRSAgedStkFrm.EdtBinFrmChange(Sender: TObject);
begin
  edtBinTo.text := edtBinFrm.Text;
  selFrmBin := edtBinTo.Text
end;

procedure TSTRSAgedStkFrm.EDTBinToChange(Sender: TObject);
begin
  selToBin := edtBinTo.text;
end;

end.
