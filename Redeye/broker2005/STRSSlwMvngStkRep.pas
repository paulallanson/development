unit STRSSlwMvngStkRep;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, Db, Inifiles, QrExport, STRPSlwMvngStkRep,
  OleCtnrs ,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTRSSlwMvngStkRepfrm = class(TForm)
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    Label1: TLabel;
    grpbxRange: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    edtPartFrom: TEdit;
    edtPartTo: TEdit;
    btbtnPartFrom: TBitBtn;
    btbtnPartTo: TBitBtn;
    DateEdit: TEdit;
    DateBitBtn: TBitBtn;
    ChkBxExcProd: TCheckBox;
    AllOrOneRadioGroup: TRadioGroup;
    RepGrpBox: TGroupBox;
    Label4: TLabel;
    RepLUSpeedButton: TSpeedButton;
    RepEdit: TEdit;
    CustGrpBox: TGroupBox;
    Label5: TLabel;
    CustLuSpeedButton: TSpeedButton;
    CustEdit: TEdit;
    CustRadioGroup: TRadioGroup;
    FaxBitBtn: TBitBtn;
    GetPartsSQL: TFDQuery;
    EmailBitBtn: TBitBtn;
    btbtnExcel: TBitBtn;
    OleContainer1: TOleContainer;
    pnlExportPrgrss: TPanel;
    lblExporting: TLabel;
    prgbrExport: TProgressBar;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure CallPrintPreview (TempPreview: ByteBool);
    procedure dtpckrBeforeDateUserInput(Sender: TObject;
      const UserString: String; var DateAndTime: TDateTime;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btbtnPartFromClick(Sender: TObject);
    procedure btbtnPartToClick(Sender: TObject);
    procedure DateBitBtnClick(Sender: TObject);
    procedure edtPartFromChange(Sender: TObject);
    procedure DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEditExit(Sender: TObject);
    procedure DateEditChange(Sender: TObject);
    procedure RepLUSpeedButtonClick(Sender: TObject);
    procedure CustLuSpeedButtonClick(Sender: TObject);
    procedure AllOrOneRadioGroupClick(Sender: TObject);
    procedure CustRadioGroupClick(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    procedure EmailReport(Sender:TObject);
    procedure BuildFaxDetails;
    procedure BuildEmailDetails;
    procedure ClearFaxArray(Sender: TObject);
    procedure ClearEMailArray(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btbtnExcelClick(Sender: TObject);
  private
    { Private declarations }
    SelRep, SelCustomer, SelCustBranch: Integer;
    SelName, SelCustName: string;
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
    procedure PrintToAttachment(STRPSlwMvngStkRepfrm: TSTRPSlwMvngStkRepfrm);
  public
    { Public declarations }
  end;

var
  STRSSlwMvngStkRepfrm: TSTRSSlwMvngStkRepfrm;
  FaxArray: array[1..100, 1..6] of string;
  EmailArray: array[1..100, 1..10] of string;
  sAttachmentType: string;

implementation

uses
  STPrtMnt, DateSelV5, STFaxList, STEmailList, PBLURep, PBLUCust, printers,
  CCSPrint, PBSendFax, ccscommon, pbMainMenu, pbDatabase, Printer.Tools;

{$R *.DFM}

procedure TSTRSSlwMvngStkRepfrm.CallPrintPreview(TempPreview: ByteBool);
begin
  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bChanging := False;
  STRPSlwMvngStkRepfrm := TSTRPSlwMvngStkRepfrm.Create(Self);

  with STRPSlwMvngStkRepfrm do
  try
    STRPSlwMvngStkRepfrm.OrderDate := StrToDate(DateEdit.Text);
        if CHkBxExcProd.checked then
   qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
  else
    qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
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
{    if (dmStock.STDatabase.FDManager.GetAliasDriverName('PB') = 'MSSQL') then
    begin
      STRPSlwMvngStkRepfrm.bSQLDatabase := true;

      qrSlwMvngStk.DataSet := qrySlwMvngStk;
    end
    else
    begin
      STRPSlwMvngStkRepfrm.bSQLDatabase := false;
      qrSlwMvngStk.DataSet := query1;
    end;   }

    STRPSlwMvngStkRepfrm.bExcProd := ChkBxExcProd.Checked;
    qrlblDateSince.Caption := 'Report showing stock with no movements since:- '+DateEdit.Text;

    if GetDetails(Self) = 0 then
    begin
      MessageDlg('Nothing to print', mtError, [mbOK], 0);
    end
    else
    begin
      if TempPreview then
        qrDetails.Preview
      else
      begin
        qrDetails.PrinterSetup;
        if qrDetails.Tag = 0 then
          qrDetails.Print;
      end;
    end;
  finally;
    STRPSlwMvngStkRepfrm.Free;
  end;
end;

procedure TSTRSSlwMvngStkRepfrm.PreviewBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(True);
end;

procedure TSTRSSlwMvngStkRepfrm.PrintBitBtnClick(Sender: TObject);
begin
  CallPrintPreview(False);
end;

procedure TSTRSSlwMvngStkRepfrm.dtpckrBeforeDateUserInput(Sender: TObject;
  const UserString: String; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
begin
 try
   DateAndTime := StrToDate(UserString);
 except
   MessageDlg('Not a valid date!', mtWarning, [mbOK], 0);
   DateAndTime := Date();
 end;
end;

procedure TSTRSSlwMvngStkRepfrm.FormShow(Sender: TObject);
begin
  DateEdit.Text := DateToStr(Date()-90);
end;

procedure TSTRSSlwMvngStkRepfrm.btbtnPartFromClick(Sender: TObject);
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

procedure TSTRSSlwMvngStkRepfrm.btbtnPartToClick(Sender: TObject);
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

procedure TSTRSSlwMvngStkRepfrm.DateBitBtnClick(Sender: TObject);
begin
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    DateSelV5Form.MonthCalendar1.Date := StrToDate(DateEdit.Text);
    DateSelV5Form.ShowModal;
    DateEdit.Text := DateToStr(DateSelV5Form.MonthCalendar1.Date);
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TSTRSSlwMvngStkRepfrm.edtPartFromChange(Sender: TObject);
begin
  if bChanging then exit;
  edtPartTo.Text := edtPartFrom.Text ;
end;

procedure TSTRSSlwMvngStkRepfrm.DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    try
      StrToDate(DateEdit.Text);
      PreviewBitBtn.Enabled := True;
      PrintBitBtn.Enabled := True;
      edtPartFrom.setFocus();
    except
      PreviewBitBtn.Enabled := False;
      PrintBitBtn.Enabled := False;
    end;
  end;
end;

procedure TSTRSSlwMvngStkRepfrm.DateEditExit(Sender: TObject);
begin
  try
    StrToDate(DateEdit.Text);
    PreviewBitBtn.Enabled := True;
    PrintBitBtn.Enabled := True;
  except
    PreviewBitBtn.Enabled := False;
    PrintBitBtn.Enabled := False;
  end;
end;

procedure TSTRSSlwMvngStkRepfrm.DateEditChange(Sender: TObject);
begin
  try
    StrToDate(DateEdit.Text);
    PreviewBitBtn.Enabled := True;
    PrintBitBtn.Enabled := True;
  except
    PreviewBitBtn.Enabled := False;
    PrintBitBtn.Enabled := False;
  end;
end;

procedure TSTRSSlwMvngStkRepfrm.RepLUSpeedButtonClick(Sender: TObject);
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

procedure TSTRSSlwMvngStkRepfrm.CustLuSpeedButtonClick(Sender: TObject);
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

procedure TSTRSSlwMvngStkRepfrm.AllOrOneRadioGroupClick(Sender: TObject);
begin
  if AllorOneRadioGroup.ItemIndex = 0 then
    RepGrpBox.Visible := False
  else
    RepGrpBox.Visible := True;
end;

procedure TSTRSSlwMvngStkRepfrm.CustRadioGroupClick(Sender: TObject);
begin
 if CustRadioGroup.ItemIndex = 0 then
    CustGrpBox.Visible := False
  else
    CustGrpBox.Visible := True;
end;

procedure TSTRSSlwMvngStkRepfrm.DispCustBranch(Sender: TObject);
begin
  {Display customer and branch in memo box}
  if SelCustomer <> 0 then
    CustEdit.Text := SelCustName
  else
    CustEdit.Text := '';
end;

procedure TSTRSSlwMvngStkRepfrm.FaxBitBtnClick(Sender: TObject);
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

procedure TSTRSSlwMvngStkRepfrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
     Close;
    if edtPartFrom.Text <> '' then
      ParamByName('PartFrom').AsString := edtPartFrom.Text
    else
      ParamByName('PartFrom').AsString := '0000000000000';

    if edtPartFrom.Text <> '' then
      ParamByName('PartTo').AsString := edtPartTo.Text
    else
      ParamByName('PartTo').AsString := 'zzzzzzzzzzzzzz';
      ParamByName('Date').AsDateTime := StrToDate(DateEdit.Text);
      if ChkBxExcProd.checked then
        ParamByName('Not_in_Use').AsString :='Y'
      else
        ParamByName('Not_In_Use').Asstring := '';
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

procedure TSTRSSlwMvngStkRepfrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 5 do
      FaxArray[icount, icount1] := '';
end;

procedure TSTRSSlwMvngStkRepfrm.FaxReport(Sender: TObject);
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
    STFaxListFrm.Caption := 'Slow Moving Stock Report';
    STFaxListFrm.FaxListgrid.Cells[1, 0] := 'Customer/Branch';
    STFaxListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if STFaxListFrm.ModalResult = idok then
    begin
      for irow := 1 to STFaxListFrm.FaxlistGrid.Rowcount -1 do
      begin
      if Trim(STFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;
      STRPSlwMvngStkRepFrm := TSTRPSlwMvngStkRepFrm.Create(Self);
      try
        STRPSlwMvngStkRepfrm.OrderDate := StrToDate(DateEdit.Text);
        if CHkBxExcProd.checked then
          STRPSlwMvngStkRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
        else
          STRPSlwMvngStkRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
        if faxarray[irow,2] = '0' then
        begin
          STRPSlwMvngStkRepFrm.RepNo := 0;
          STRPSlwMvngStkRepFrm.QRLblCust.Caption := 'All Reps, ';
        end
        else
        begin
          STRPSlwMvngStkRepFrm.RepNo := StrToInt(faxarray[irow,2]);
          STRPSlwMvngStkRepFrm.RepName := faxarray[irow, 6];
          STRPSlwMvngStkRepFrm.QRLblCust.Caption := 'Rep - '+faxarray[irow, 6]+', ';
      end;

      if faxarray[irow,1] = '0' then
      begin
        STRPSlwMvngStkRepFrm.CustNo := 0;
        STRPSlwMvngStkRepFrm.CustBranchNo := 0;
        STRPSlwMvngStkRepFrm.QRLblCust.Caption := STRPSlwMvngStkRepFrm.QRLblCust.Caption +'All Customers';
      end
      else
      begin
        STRPSlwMvngStkRepFrm.CustNo := StrToInt(FaxArray[irow,1]);
        STRPSlwMvngStkRepFrm.CustBranchNo := StrToInt(FaxArray[irow,3]);
        STRPSlwMvngStkRepFrm.CustomerName := FaxArray[irow,4];
        STRPSlwMvngStkRepFrm.QRLblCust.Caption := STRPSlwMvngStkRepFrm.QRLblCust.Caption+'Customer - '+FaxArray[irow,4];
      end;
      STRPSlwMvngStkRepFrm.bExcProd := ChkBxExcProd.Checked;
      STRPSlwMvngStkRepfrm.qrlblDateSince.Caption := 'Report showing stock with no movements since:- '+DateEdit.Text;
{      if (dmStock.STDatabase.FDManager.GetAliasDriverName('PB') = 'MSSQL') then
      begin
        STRPSlwMvngStkRepfrm.bSQLDatabase := true;
        STRPSlwMvngStkRepfrm.qrSlwMvngStk.DataSet := STRPSlwMvngStkRepfrm.qrySlwMvngStk;
      end
      else
      begin
        STRPSlwMvngStkRepfrm.bSQLDatabase := false;
        STRPSlwMvngStkRepfrm.qrSlwMvngStk.DataSet := STRPSlwMvngStkRepfrm.query1;
      end;   }
        if STRPSlwMvngStkRepFrm.GetDetails(Self) = 0 then
          MessageDlg('Nothing to fax for Customer '+selcustname, mtError, [mbOK], 0)
        else
        begin
          DisplayPrintDialog := False;
          STRPSlwMvngStkRepFrm.qrdetails.Showprogress := False;
          STRPSlwMvngStkRepFrm.qrdetails.Page.Orientation := polandscape;

          FaxFound := pbSendFaxFrm.OutToFax(STFaxListFrm.FaxListGrid.cells[2,irow],
              ' to '+ FaxArray[irow,4], '');
          if (not FaxFound) then
            Exit;
//          STRPSlwMvngStkRepFrm.qrslwMvngStk.PrinterSettings.PrinterIndex := Faxfound;
          STRPSlwMvngStkRepFrm.qrDetails.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
//          STSendFaxFrm.WaitForFaxFinish(Self) ;
        end;
      finally
      end;
      STRPSlwMvngStkRepFrm.Free;
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

procedure TSTRSSlwMvngStkRepfrm.EmailBitBtnClick(Sender: TObject);
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

procedure TSTRSSlwMvngStkRepfrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with GetPartsSQL do
  begin
     Close;
    if edtPartFrom.Text <> '' then
      ParamByName('PartFrom').AsString := edtPartFrom.Text
    else
      ParamByName('PartFrom').AsString := '0000000000000';

    if edtPartFrom.Text <> '' then
      ParamByName('PartTo').AsString := edtPartTo.Text
    else
      ParamByName('PartTo').AsString := 'zzzzzzzzzzzzzz';
      ParamByName('Date').AsDateTime := StrToDate(DateEdit.Text);
      if ChkBxExcProd.checked then
        ParamByName('Not_in_Use').AsString :='Y'
      else
        ParamByName('Not_In_Use').Asstring := '';
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

procedure TSTRSSlwMvngStkRepfrm.ClearEMailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EMailArray[icount, icount1] := '';
end;

procedure TSTRSSlwMvngStkRepfrm.GetEmailApp;
var
  IniFile : TIniFile;
begin
  {Search the INI file for Email Application}
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      FEmailApplication := ReadString('Email', 'Application', 'None');
      FEmailLocation := ReadString('Email', 'Def Attach Direc', 'None');
      fEmailAttachType := ReadString('Email', 'Def Attach Type', 'None');
      Free;
    end;

end;

procedure TSTRSSlwMvngStkRepfrm.EmailReport(Sender: TObject);
var
  icount, irow: Integer;
  sTo, sSubject, sBody, sSalutation: string;
  STRPSlwMvngStkRepFrm : TSTRPSlwMvngStkRepFrm;
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
    STRPSlwMvngStkRepFrm := TSTRPSlwMvngStkRepFrm.Create(Self);
    try
      STRPSlwMvngStkRepfrm.OrderDate := StrToDate(DateEdit.Text);
      if CHkBxExcProd.checked then
        STRPSlwMvngStkRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Excluding Products not in use'
      else
        STRPSlwMvngStkRepfrm.qrlblRange.Caption := 'From Product - ' + edtPartFrom.Text + ' To Product - ' + edtPartTo.Text+ ' Including Products not in use';
      for irow := 1 to STEmailListFrm.EmailListGrid.RowCount - 1 do
      begin
        if (Trim(STEmailListFrm.EmailListGrid.Cells[4, irow]) = '') or
                  (Trim(STEmailListFrm.EmailListGrid.Cells[1, irow]) = '') then continue;
        if emailarray[irow,2] = '0' then
        begin
          STRPSlwMvngStkRepFrm.RepNo := 0;
          STRPSlwMvngStkRepFrm.QRLblCust.Caption := 'All Reps, ';
        end
        else
        begin
          STRPSlwMvngStkRepFrm.RepNo := StrToInt(emailarray[irow,2]);
          STRPSlwMvngStkRepFrm.RepName := emailarray[irow, 6];
          STRPSlwMvngStkRepFrm.QRLblCust.Caption := 'Rep - '+ emailarray[irow, 6]+', ';
        end;

        if Emailarray[irow,1] = '0' then
        begin
          STRPSlwMvngStkRepFrm.CustNo := 0;
          STRPSlwMvngStkRepFrm.CustBranchNo := 0;
          STRPSlwMvngStkRepFrm.QRLblCust.Caption := STRPSlwMvngStkRepFrm.QRLblCust.Caption +'All Customers';
        end
        else
        begin
          STRPSlwMvngStkRepFrm.CustNo := StrToInt(EmailArray[irow,1]);
          STRPSlwMvngStkRepFrm.CustBranchNo := StrToInt(EmailArray[irow,3]);
          STRPSlwMvngStkRepFrm.CustomerName := EmailArray[irow,4];
          STRPSlwMvngStkRepFrm.QRLblCust.Caption := STRPSlwMvngStkRepFrm.QRLblCust.Caption+'Customer - '+EmailArray[irow,4];
        end;
        STRPSlwMvngStkRepFrm.bExcProd := ChkBxExcProd.Checked;
        STRPSlwMvngStkRepfrm.qrlblDateSince.Caption := 'Report showing stock with no movements since:- '+DateEdit.Text;
{        if (dmStock.STDatabase.FDManager.GetAliasDriverName('PB') = 'MSSQL') then
        begin
          STRPSlwMvngStkRepfrm.bSQLDatabase := true;
          STRPSlwMvngStkRepfrm.qrSlwMvngStk.DataSet := STRPSlwMvngStkRepfrm.qrySlwMvngStk;
        end
        else
        begin
          STRPSlwMvngStkRepfrm.bSQLDatabase := false;
          STRPSlwMvngStkRepfrm.qrSlwMvngStk.DataSet := STRPSlwMvngStkRepfrm.query1;
        end; }
        if STRPSlwMvngStkRepFrm.GetDetails(Self) = 0 then
          MessageDlg('Nothing to email for Customer '+selcustname, mtError, [mbOK], 0)
        else
        begin
          sAttachmentType := STEmailListFrm.EmailListGrid.Cells[4, irow];
          STRPSlwMvngStkRepFrm.qrdetails.Showprogress := False;
          Printtoattachment(STRPSlwMvngStkRepFrm);
          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
          sTo := Trim(STEmailListFrm.EmailListGrid.Cells[1, irow]);
          sSubject := 'Slow Moving Stock Report';
          sSalutation := '';
          sBody := sSalutation+#13#10#13#10'Please find attached, ' + sSubject + '.'#13#10#13#10;

          EmailViaOutlook(sTo,sSubject,sBody,FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);
        end;
      end;
    finally
      STRPSlwMvngStkRepFrm.Free;
    end;
  end;
  finally
    STEmailListFrm.Free;
  end;
 end;

procedure TSTRSSlwMvngStkRepfrm.FormActivate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
  GetEmailApp;
end;

procedure TSTRSSlwMvngStkRepfrm.PrintToAttachment(STRPSlwMvngStkRepFrm: TSTRPSlwMvngStkRepFrm);
begin
  var fileName := 'SlowMoving' + '-' + STRPSlwMvngStkRepFrm.RepNo.ToString;
  TPrinterTools.New.PrintToAttachment(STRPSlwMvngStkRepFrm.qrDetails, FEmailAttachment, fileName, sAttachmentType);
end;

(* GDK ToDo: remove after tests
procedure TSTRSSlwMvngStkRepfrm.PrintToAttachment(STRPSlwMvngStkRepFrm: TSTRPSlwMvngStkRepFrm);
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

  sFileName := 'SlowMoving';

  AFilters := TgtQRFilters.Create(self);

  if sAttachmentType = 'RTF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.rtf');
      RTFFilter := TgtQRRTFFilter.Create(FEmailAttachment[0]);
      try
        STRPSlwMvngStkRepFrm.qrDetails.Prepare;
        STRPSlwMvngStkRepFrm.qrDetails.ExportToFilter(RTFFilter);
      finally
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter.Free;
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter := nil;
        RTFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'HTML' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.htm');
      HTMLFilter := TgtQRHTMLFilter.Create(FEmailAttachment[0]);
      try
        STRPSlwMvngStkRepFrm.qrDetails.Prepare;
        STRPSlwMvngStkRepFrm.qrDetails.ExportToFilter(HTMLFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter.Free;
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter := nil;
        HTMLFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'PDF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.pdf');
      PDFFilter := TgtQRPDFFilter.Create(FEmailAttachment[0]);
      try
        STRPSlwMvngStkRepFrm.qrDetails.Prepare;
        STRPSlwMvngStkRepFrm.qrDetails.ExportToFilter(PDFFilter);
      finally
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter.Free;
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter := nil;
        PDFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'GIF' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.gif');
      GIFFilter := TgtQRGIFFilter.Create(FEmailAttachment[0]);
      try
        STRPSlwMvngStkRepFrm.qrDetails.Prepare;
        STRPSlwMvngStkRepFrm.qrDetails.ExportToFilter(GIFFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter.Free;
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter := nil;
        GIFFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'JPEG' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.jpg');
      JPEGFilter := TgtQRJPEGFilter.Create(FEmailAttachment[0]);
      try
        STRPSlwMvngStkRepFrm.qrDetails.Prepare;
        STRPSlwMvngStkRepFrm.qrDetails.ExportToFilter(JPEGFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter.Free;
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter := nil;
        JPEGFilter.Free;
      end;
    end
  else
  if sAttachmentType = 'BMP' then
    begin
      FEmailAttachment.add(sLocation + sFilename + '.bmp');
      BMPFilter := TgtQRBMPFilter.Create(FEmailAttachment[0]);
      try
        STRPSlwMvngStkRepFrm.qrDetails.Prepare;
 //       ExportToRTF(STRPSlwMvngStkRepFrm.qrDetails, sLocation + sFilename + '.bmp');
      STRPSlwMvngStkRepFrm.qrDetails.ExportToFilter(BMPFilter);

        {Assign all the Filenames to the Attachment list}
        FEMailAttachment.clear;
        for i := 0 to pred(AFilters.RepFileCount) do
          FEMailAttachment.add(sLocation + AFilters.RepFileNames[i]);
      finally
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter.Free;
        STRPSlwMvngStkRepFrm.qrDetails.QRPrinter := nil;
        BMPFilter.Free;
      end;
    end;

  AFilters.free;
end;
*)

procedure TSTRSSlwMvngStkRepfrm.FormDestroy(Sender: TObject);
begin
 FEmailAttachment.free;
end;

procedure TSTRSSlwMvngStkRepfrm.btbtnExcelClick(Sender: TObject);
var
  tempFileName: string;
  recCount: integer;
begin
  bChanging := true;
  if edtPartFrom.Text = '' then edtPartFrom.Text := '000000000000';
  if edtPartTo.Text = '' then edtPartTo.Text := 'zzzzzzzzzzzz';
  bChanging := False;

  STRPSlwMvngStkRepfrm := TSTRPSlwMvngStkRepfrm.Create(Self);

  try
    STRPSlwMvngStkRepfrm.OrderDate := StrToDate(DateEdit.Text);

    if AllOrOneRadioGroup.ItemIndex = 0 then
      begin
        STRPSlwMvngStkRepfrm.RepNo := 0;
      end
    else
      begin
        STRPSlwMvngStkRepfrm.RepNo := SelRep;
        STRPSlwMvngStkRepfrm.RepName := SelName;
      end;

    if custradiogroup.ItemIndex = 0 then
      begin
        STRPSlwMvngStkRepfrm.CustNo := 0;
        STRPSlwMvngStkRepfrm.CustBranchNo := 0;
      end
    else
      begin
        STRPSlwMvngStkRepfrm.CustNo := SelCustomer;
        STRPSlwMvngStkRepfrm.CustBranchNo := SelCustBranch;
        STRPSlwMvngStkRepfrm.CustomerName := SelCustName;
      end;

    STRPSlwMvngStkRepfrm.bExcProd := ChkBxExcProd.Checked;

    recCount := STRPSlwMvngStkRepfrm.GetDetails(Self);
    if recCount <> 0 then
      begin
        self.prgbrExport.Max := recCount;
        tempFileName := getWinTempDir + 'temp.csv';
        self.pnlExportPrgrss.BringToFront;
        self.pnlExportPrgrss.Visible := true;
        self.pnlExportPrgrss.Repaint;

        STRPSlwMvngStkRepfrm.ExportToFile(tempFileName);
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
  finally;
    STRPSlwMvngStkRepfrm.Free;
  end;
end;

end.
