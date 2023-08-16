unit STPordRSl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, STPOrdRep, QrExport,
  Inifiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTPordRSlFrm = class(TForm)
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SelectRadioGroup: TRadioGroup;
    DelRepSelQuery: TFDQuery;
    AddRepSelQuery: TFDQuery;
    FaxBitBtn: TBitBtn;
    SelectionGroup: TGroupBox;
    Label1: TLabel;
    EnqLUSpeedButton: TSpeedButton;
    SelectionMemo: TMemo;
    SelectLst: TListBox;
    DelWorkSQL: TFDQuery;
    AddWorkSQL: TFDQuery;
    GetPORngSQL: TFDQuery;
    ChkBxLogo: TCheckBox;
    qryGetPOs: TFDQuery;
    EmailBitBtn: TBitBtn;
    procedure PreviewBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure RunReport(Preview: ByteBool);
    procedure CheckOK(Sender: TObject);
    procedure SelectRadioGroupClick(Sender: TObject);
    procedure LUPorderDetails(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure GetSelection;
    Function IncrementNo(StartStr: String): String ;
    Procedure DelIntSelCode(iTempIntSelCode: Integer; bTempDelCode: ByteBool);
    procedure BuildSelection;
    procedure BuildRange(sFirst: string; sLast: string);
    procedure EnqLUSpeedButtonClick(Sender: TObject);
    procedure ClearEmailArray(Sender: TObject);
    procedure ClearFaxArray(Sender: TObject);
    procedure FaxReport(Sender: TObject);
    Procedure ClearEnqNoArray(Sender: TObject);
    procedure FaxBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EmailBitBtnClick(Sender: TObject);
  private
    FDefaultPrinter: string;
    sAttachmentType: string;
    FEmailAttachment : TstringList;
    procedure GetDefaultPrinter;
    procedure SaveDefaultPrinter;
    procedure SetDefaultPrinter(const Value: string);
    procedure BuildFaxDetails;
    procedure BuildEmailDetails;
    procedure EmailReport(Sender: TObject);
    procedure PrintToAttachment(STPOrdRepFrm: TSTPOrdRepFrm);
  private
    sPurchaseTermsFile: string;
    property DefaultPrinter: string read FDefaultPrinter write SetDefaultPrinter;
  public
    { Public declarations }
    DisplayPrintDialog : Boolean;
    bStore_Ord, memolines, ord_selected: ByteBool;
    iTransType, iOrdCode, iIntSelCode: Integer;
    sName: String;
  end;

var
  STPordRSlFrm: TSTPordRSlFrm;
  FaxArray: array[1..100, 1..6] of string;
  EmailArray: array[1..100, 1..10] of string;
  EnqNoArray: array[1..100] of real;
  EnqArrayCount: integer;

implementation

uses
  System.UITypes,
  printers, STStockDM, PBFaxToOne, PBFaxList, PBSendFax, ccsprint,
  pbMainMenu, PBEmailList, CCSCommon, pbDatabase, Printer.Tools;

{$R *.DFM}

procedure TSTPordRSlFrm.PreviewBitBtnClick(Sender: TObject);
begin
  CheckOk(Self);
  RunReport(True);
end;

procedure TSTPordRSlFrm.RunReport(Preview: ByteBool);
var
  PrinterSettings: TPrinterSettings;
begin
 {Actually run the report}
  getselection;
  STPOrdRepFrm := TSTPOrdRepFrm.Create(Self);
  try
    PrinterSettings := TPrinterSettings.Create;
    try
      STPOrdRepFrm.PrinterSettings := PrinterSettings;
      STPOrdRepFrm.Preview := Preview;
      STPOrdRepFrm.PrintLogo := ChkBxLogo.Checked;
      STPOrdRepFrm.iIntSelCode := iIntSelCode;
//    STPOrdRepFrm.FaxIt := (PrintRadioGroup.ItemIndex = 1);
  {Write the selected jobs(s) to the workfile};
  {Run the Purchase Order Report}
      if STPOrdRepFrm.GetDetails(Self) = 0 then
      begin
        MessageDlg('There is nothing to print', mtError, [mbOK], 0);
        DelIntSelCode(iIntselcode, True);
      end
      else
      begin
        {Actually print or preview the report}
        if Preview then
          STPOrdRepFrm.PurchOrdQuickReport.Preview
        else
        begin
        If SetUpPrinter(PrinterSettings) then
          STPOrdRepFrm.PurchOrdQuickReport.Print;
        end;
      end;

//      STPOrdRepFrm.RunReport(Self);
    finally
      PrinterSettings.Free;
    end;
  finally
    Application.ProcessMessages;
    STPOrdRepFrm.free;
  end;
end;

procedure TSTPordRSlFrm.PrintBitBtnClick(Sender: TObject);
begin
  CheckOk(Self);
  RunReport(False);
  DefaultPrinter := Printers.Printer.Printers[printers.Printer.printerindex];
  SaveDefaultPrinter;
  close;
end;

procedure TSTPordRSlFrm.CheckOK(Sender: TObject);
var
  Printable : Boolean;
begin
  Printable := ((SelectRadioGroup.ItemIndex = 2) or (SelectionMemo.Text <> ''));
  {Check if can print}
  PrintBitBtn.Enabled := Printable;
  PreviewBitBtn.Enabled := Printable;
  FaxBitBtn.Enabled := Printable;
end;

procedure TSTPordRSlFrm.SelectRadioGroupClick(Sender: TObject);
begin
  if selectRadioGroup.ItemIndex = 2 then
    selectionmemo.Visible := False
  else
    selectionmemo.Visible := True;
  if selectRadioGroup.ItemIndex = 2 then
  begin
    SelectionMemo.Enabled := False;
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
  CheckOK(Self);
  memolines := False;
  DelIntSelCode(iIntSelCode, True);
end;

procedure TSTPordRSlFrm.LUPorderDetails(Sender: TObject);
var
TempLoop,iloop : integer;
memolines, found: boolean;
begin
(*selectionmemo.Lines.Clear;
ClearEnqNoArray(self);
memolines := false;
STLUPOrdFrm := TSTLUPOrdFrm.Create(Self);
  STLUPOrdFrm.bMulti_Select := True;
  if SelectRadioGroup.ItemIndex = 0 then
      STLUPOrdFrm.bMulti_Select := False;
  try
    case itranstype of
    1:begin
      STLUPOrdFrm.iTransType := 1 ;
      STLUPOrdFrm.sStatusFrom := 'R' ;
      STLUPOrdFrm.sStatusTo := 'R' ;
    end;
    2:begin
      STLUPOrdFrm.iTransType := 2 ;
      STLUPOrdFrm.sStatusFrom := 'C' ;
        STLUPOrdFrm.sStatusTo := 'G'
      end;
    end;
    STLUPOrdFrm.bIs_LookUp := True ;
    STLUPOrdFrm.bAllow_Upd := False ;
    if bStore_Ord = False then
     STLUPOrdFrm.bStore_Ord := False
    else
     STLUPOrdFrm.bStore_Ord := True;
    STLUPOrdFrm.ShowModal;
    If STLUPOrdFrm.Selected then
       begin
       iOrdCode := STLUPOrdFrm.iSelCode ;
       sName := STLUPOrdFrm.GetDetsSQL.ParamByname('Code_From').AsString;
       end
    else
      exit;
    if selectradiogroup.itemindex = 0 then
      begin
        selectionmemo.Lines.Add(STLUPOrdFrm.GetDetsSQL.FieldByName('Po_Ref').AsString);
      end
    else
       for TempLoop := 0 to (STLUPOrdFrm.DetsDBGrid.SelectedRows.count -1) do
      begin
      found := false;
      STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(STLUPOrdFrm.DetsDBGrid.SelectedRows[TempLoop]));
      for iloop := 1 to Enqarraycount do
            begin
             if STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purch_Ord').AsInteger =
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
            selectionmemo.Text:= selectionmemo.text+(FloattoStr(STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purch_Ord').AsInteger));
            EnqArrayCount := EnqArrayCount+1;
            EnqNoArray[EnqArrayCount] :=STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purch_Ord').AsInteger;
        end;
    ord_selected := STLUPOrdFrm.selected;
    end;
    finally
    STLUPOrdFrm.Free;
  end;
*)
end;

procedure TSTPordRSlFrm.FormActivate(Sender: TObject);
begin
STStockDataMod := TSTStockDataMod.Create(Self) ;
iIntSelCode := STStockDataMod.GetNextIntSelCode(Self) ;
ord_selected := False;
checkOK(self);
end;

procedure TSTPordRSlFrm.FormDeactivate(Sender: TObject);
begin
STStockDataMod.DelIntSelCode(iIntSelCode, True);
end;

procedure TSTPordRSlFrm.EnqLUSpeedButtonClick(Sender: TObject);
var
TempLoop,iloop : integer;
memolines, found: boolean;
begin
(*  ClearEnqNoArray(self);
  Selectionmemo.lines.clear;
  memolines := false;
  STLUPOrdFrm := TSTLUPOrdFrm.Create(Self);
  try
    if selectionMemo.Text <> '' then
      STLUPOrdFrm.iSelCode := StrToInt(selectionMemo.Text)
    else
      STLUPOrdFrm.iSelCode := 0;
       STLUPOrdFrm.bMulti_Select := True;
  if SelectRadioGroup.ItemIndex = 0 then
      STLUPOrdFrm.bMulti_Select := False;
    case itranstype of
    1:begin
      STLUPOrdFrm.iTransType := 1 ;
      STLUPOrdFrm.sStatusFrom := 'R' ;
      STLUPOrdFrm.sStatusTo := 'R' ;
    end;
    2:begin
      STLUPOrdFrm.iTransType := 2 ;
      STLUPOrdFrm.sStatusFrom := 'C' ;
      STLUPOrdFrm.sStatusTo := 'G'
      end;
    end;
    STLUPOrdFrm.bIs_LookUp := True ;
    STLUPOrdFrm.bAllow_Upd := False ;
    if bStore_Ord = False then
     STLUPOrdFrm.bStore_Ord := False
    else
     STLUPOrdFrm.bStore_Ord := True;
    STLUPOrdFrm.ShowModal;
    if STLUPOrdFrm.selected then
      begin
        iOrdCode := STLUPOrdFrm.iSelCode;
        sName := STLUPOrdFrm.GetDetsSQL.ParamByName('Code_From').AsString;
      end
    else
      exit;
    If SelectRadioGroup.itemindex =0 then
      begin
        selectionmemo.lines.Add(STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Po_Ref').AsString);
        end
      else
      for TempLoop := 0 to (STLUPOrdFrm.DetsDBGrid.SelectedRows.count -1) do
      begin
      found := false;
      STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.GotoBookmark(TBookmark(STLUPOrdFrm.DetsDBGrid.SelectedRows[TempLoop]));
      for iloop := 1 to Enqarraycount do
            begin
             if STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purch_Ord').AsInteger =
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
            selectionmemo.Text:= selectionmemo.text+(STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Po_Ref').AsString);
            EnqArrayCount := EnqArrayCount+1;
            EnqNoArray[EnqArrayCount] :=STLUPOrdFrm.DetsDBGrid.DataSource.DataSet.FieldByName('Purch_Ord').AsInteger;
        end;
    end;
  finally
    STLUPOrdFrm.Free;
  end;
  CheckOk(Self);
*)
end;

procedure TSTPordRSlFrm.ClearEnqNoArray(Sender: TObject);
var
  icount: Integer;
begin
  for icount := 1 to 100 do
      EnqNoArray[icount] := 0;
  EnqArrayCount := 0;
end;

procedure TSTPordRSlFrm.ClearFaxArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      FaxArray[icount, icount1] := '';
end;

procedure TSTPordRSlFrm.ClearEmailArray(Sender: TObject);
var
  icount, iCount1: Integer;
begin
  for icount := 1 to 100 do
    for iCount1 := 1 to 6 do
      EmailArray[icount, icount1] := '';
end;

procedure TSTPordRSlFrm.BuildSelection;
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

procedure TSTPordRSlFrm.GetSelection;
var
	icount: integer;
begin
	{When the constructing of the list is complete, write to the Report Selection file}
	DelIntSelCode(iIntSelCode, True);
  if selectradiogroup.itemindex = 2 then
    buildRange('1','zzzzzzz')
  else
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

       	with AddRepSelQuery do
          begin
          Close;
          ParamByName('Int_sel_Code').AsInteger := iIntselCode;
          ParamByName('Sel1').AsInteger := strtoInt(SelectLst.Items[icount]);
          ParamByName('Sel2').AsFloat := 0.00;
          ParamByName('Sel3').AsFloat := 0.00;
          ParamByName('Sel4').AsFloat := 0.00;
          ParamByName('Text100').AsString := SelectLst.Items[icount];
          execSQL;
          end;
      end;

end;

function TSTPordRSlFrm.IncrementNo(StartStr: String): String;
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

procedure TSTPordRSlFrm.DelIntSelCode(iTempIntSelCode: Integer;
  bTempDelCode: ByteBool);
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

procedure TSTPordRSlFrm.BuildRange(sFirst, sLast: string);
begin
 	With GetPORngSQL do
    begin
      Close;
      ParamByName('From_PONum').AsString := sFirst;
      ParamByName('To_PONum').AsString := sLast;
      if SelectRadioGroup.itemindex = 2 then
        ParamByName('sStatusTo').AsString := 'C'
      else
        ParamByName('sStatusTo').AsString := 'G';
      ParamByName('sStatusFrom').AsString := 'C';
      Open;
      First;
      While Not EOF do
      begin
        SelectLst.Items.Add(FieldByName('Purch_Ord_No').AsString);
        Next;
      end;
    end;
end;

procedure TSTPordRSlFrm.FaxBitBtnClick(Sender: TObject);
begin
  try
    FaxReport(Self);
  finally
    Printers.Printer.PrinterIndex := -1;  { Set printer back to default }
  end;
  close;
end;

procedure TSTPordRSlFrm.FaxReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount, irow: integer;
  faxfound: boolean;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildFaxDetails;

  {For each of the Purchase Order/Supplier details print a fax}
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
    PBFaxListFrm.Caption := 'Purchase Order Fax List';
    PBFaxListFrm.FaxListgrid.Cells[1, 0] := 'Supplier/Branch';
    PBFaxListFrm.ShowModal;

      {If OK to do the faxing then send all the faxes}
    if PBFaxListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBFaxListFrm.FaxlistGrid.Rowcount -1 do
      begin
      if Trim(PBFaxListFrm.FaxListGrid.cells[2, irow]) = '' then continue;
      STPOrdRepFrm := TSTPOrdRepFrm.Create(Self);
      try
        STPOrdRepFrm.PrinterSettings := PrinterSettings;
        STPOrdRepFrm.PrintLogo := true;
        STPOrdRepFrm.Preview := false;
        STPOrdRepFrm.iIntSelCode := iIntSelCode;

        STPOrdRepFrm.GetDetails(Self);
        DisplayPrintDialog := False;
        STPOrdRepFrm.PurchOrdQuickReport.Showprogress := False;
        STPOrdRepFrm.PurchOrdQuickReport.Page.Orientation := poPortrait;
        FaxFound := PBSendFaxFrm.OutToFax(PBFaxListFrm.FaxListGrid.cells[2,irow],
              'PO: ' + trim(selectionMemo.Text) +' to '+ FaxArray[irow,4], '');
        if (not faxfound) then
          MessageDlg('The fax driver is not installed', mtError, [mbok], 0)
        else
          begin
          STPOrdRepFrm.PurchOrdQuickReport.Print;
          {New fax driver - wait for the fax to finish - ACH 14/01/03} ;
          PBSendFaxFrm.WaitForFaxFinish(Self) ;
          end;
      finally
      end;
      STPOrdRepFrm.Free;
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

procedure TSTPordRSlFrm.BuildFaxDetails;
var
  irow: Integer;
begin
  with qryGetPOs do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      FaxArray[irow, 1] := FieldByName('Supplier').AsString;
      FaxArray[irow, 2] := FieldByName('Supplier').AsString;
      FaxArray[irow, 3] := FieldByName('branch_no').AsString;
      FaxArray[irow, 4] := Trim(FieldByName('Name').AsString)+' '+Trim(FieldByName('Branch_Name').AsString);
      FaxArray[irow, 5] := FieldByName('Fax_Number').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TSTPordRSlFrm.BuildEmailDetails;
var
  irow: Integer;
begin
  with qryGetPOs do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iIntSelCode;
    Open;
    First;
    irow := 1;
    while (not EOF) do
    begin
      EmailArray[irow, 1] := FieldByName('Purch_Ord_no').AsString;
      EmailArray[irow, 2] := FieldByName('Supplier').AsString;
      EmailArray[irow, 3] := FieldByName('branch_no').AsString;
      EmailArray[irow, 4] := Trim(FieldByName('Name').AsString)+' '+Trim(FieldByName('Branch_Name').AsString);
      EmailArray[irow, 5] := FieldByName('Email').AsString;
      EmailArray[irow, 6] := FieldByName('export_filter_desc').AsString;
      EmailArray[irow, 7] := FieldByName('exportfilter').AsString;
      inc(irow);
      Next;
    end;
  end;
end;

procedure TSTPordRSlFrm.EmailReport(Sender: TObject);
var
  PrinterSettings: TPrinterSettings;
  icount, irow: integer;
  sTo, sSubject, sBody, sSalutation: string;
begin
  GetSelection;

  {Build the Enquiry and Supplier details}
  BuildEmailDetails;

  {For each of the Purchase Order/Supplier details print an email}
  PrinterSettings := TPrinterSettings.Create;
  try
    PBEmailListFrm := TPBEmailListFrm.Create(Self);
    try
    PBEmailListFrm.CodeType := 'S';
    for icount := 1 to 100 do
    begin
      if EmailArray[icount, 1] = '' then Break;
//      PBEmailListFrm.EmailListGrid.ColWidths[0] := 0;

      PBEmailListFrm.EmailListGrid.Cells[0, icount] := EmailArray[icount, 1];
      PBEmailListFrm.EmailListGrid.Cells[1, icount] := EmailArray[icount, 4];
      PBEmailListFrm.EmailListGrid.Cells[2, icount] := '';
      PBEmailListFrm.EmailListGrid.Cells[3, icount] := EmailArray[icount, 5];
      PBEmailListFrm.EmailListGrid.Cells[4, icount] := EmailArray[icount, 6];
      PBEmailListFrm.EmailListGrid.Cells[5, icount] := EmailArray[icount, 7];

      {Set up the Email Array with the Customer/Branch/Contact}
      PBEmailListFrm.EmailContactArray[icount,1] := EmailArray[icount, 2];
      PBEmailListFrm.EmailContactArray[icount,2] := EmailArray[icount, 3];
      PBEmailListFrm.EmailContactArray[icount,3] := '0';

    end;
    if icount = 1 then
      PBEmailListFrm.EmailListGrid.RowCount := 2
    else
      PBEmailListFrm.EmailListGrid.RowCount := icount;

    PBEmailListFrm.Caption := 'Purchase Order Email List';
    PBEmailListFrm.EmailListGrid.Cells[0, 0] := 'PO Number';
    PBEmailListFrm.EmailListGrid.Cells[1, 0] := 'Supplier/Branch';
    PBEmailListFrm.EmailListGrid.Cells[2, 0] := 'Contact';

    PBEmailListFrm.ShowModal;

    {If OK to do the emailing then send all the emails}
    if PBEmailListFrm.ModalResult = idok then
    begin
      for irow := 1 to PBEmailListFrm.EmailListGrid.Rowcount -1 do
      begin
      if Trim(PBEmailListFrm.EmailListGrid.cells[3, irow]) = '' then continue;
      STPOrdRepFrm := TSTPOrdRepFrm.Create(Self);
      try
        STPOrdRepFrm.PrinterSettings := PrinterSettings;
        STPOrdRepFrm.PrintLogo := true;
        STPOrdRepFrm.Preview := false;
        STPOrdRepFrm.iIntSelCode := iIntSelCode;

        STPOrdRepFrm.GetDetails(Self);
        DisplayPrintDialog := False;
        STPOrdRepFrm.PurchOrdQuickReport.Showprogress := False;
        STPOrdRepFrm.PurchOrdQuickReport.Page.Orientation := poPortrait;

        {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }
        sAttachmentType := PBEmailListFrm.EmailListGrid.Cells[5, irow];
        PrintToAttachment(STPOrdRepFrm);

        {If a Purchase terms file exists then add as attachment}
        if sPurchaseTermsFile <> '' then
          begin
            try
              FEmailAttachment.append(sPurchaseTermsFile);
            except
            end;
          end;

        sTo := Trim(PBEmailListFrm.EmailListGrid.Cells[3, irow]);
        sSubject := 'Purchase Order '+ PBEmailListFrm.EmailListGrid.cells[0, irow];
        sBody := 'Please find attached ' + sSubject + '.'#13#10#13#10;

        EmailViaOutlook(sTo,sSubject,sBody, FEmailAttachment, frmPBMainMenu.EmailApplication, frmPBMainMenu.EmailAccount);

      finally
      end;
      STPOrdRepFrm.Free;
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

procedure TSTPordRSlFrm.SetDefaultPrinter(const Value: string);
begin
  FDefaultPrinter := Value;
end;

procedure TSTPordRSlFrm.GetDefaultPrinter;
var
//  IniFile : TIniFile;
  icount: integer;
  Device: pchar;
  Driver: pchar;
  Port: pchar;
  HDeviceMode: THandle;
  aprinter: TPrinter;
  TempArray: array[0..255] of Char;
begin
  {Search the INI file for Default Label Printer}
  {This method used for backward compatibility with WIN95}
  GetPrivateProfileString('Centrereed Broker', 'Purchase Order Printer', '', TempArray,
    sizeof(TempArray), frmPBMainMenu.AppIniFile);

  DefaultPrinter := TempArray;

(*  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  with IniFile do
    begin
      DefaultPrinter := ReadString('Centrereed Broker', 'Delivery Note Printer', 'None');
      Free;
    end;
*)

  {Find the default printer in the list of printers }
  Printers.Printer.PrinterIndex := -1;
  for icount := 0 to pred(Printers.Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printers.Printer.Printers[icount]) > 0 then
        Printers.Printer.PrinterIndex := icount;
    end;
(*  {Find the default printer in the list of printers }
  Printers.Printer.PrinterIndex := -1;
  getmem(device, 255);
  getmem(driver, 255);
  getmem(port, 255);
  aPrinter := TPrinter.create;

  for icount := 0 to pred(Printer.Printers.count) do
    begin
      if pos(DefaultPrinter,Printer.printers[icount]) > 0 then
        begin
          aprinter.printerindex := icount;
          aprinter.getprinter(device, driver, port, HDeviceMode);
          strCat(device, ',');
          strcat(device, driver);
          strcat(device, port);
          writeprofilestring('windows','device',Device);
          strcopy(device,'windows');
          sendmessage(HWND_BROADCAST,WM_WININICHANGE, 0, Longint(@Device));
        end;
    end;
  freemem(device, 255);
  freemem(driver, 255);
  freemem(port, 255);
  aprinter.free;
*)
end;

procedure TSTPordRSlFrm.SaveDefaultPrinter;
var
  IniFile : TIniFile;
begin
  IniFile := TIniFile.Create(TfrmPBMainMenu.AppIniFile);

  try
    IniFile.WriteString('Centrereed Broker', 'Purchase Order Printer',DefaultPrinter);
  finally
    IniFile.Free;
  end;

  Printers.Printer.PrinterIndex := -1;
end;

procedure TSTPordRSlFrm.FormCreate(Sender: TObject);
begin
  FEmailAttachment := TStringList.create;
  GetDefaultPrinter;
end;

procedure TSTPordRSlFrm.PrintToAttachment(STPOrdRepFrm: TSTPOrdRepFrm);
begin
  var fileName := 'PO' + trim(SelectionMemo.Text);
  TPrinterTools.New.PrintToAttachment(STPOrdRepFrm.PurchOrdQuickReport, FEmailAttachment, fileName, sAttachmentType);
end;

procedure TSTPordRSlFrm.FormDestroy(Sender: TObject);
begin
  FEmailAttachment.free;
end;

procedure TSTPordRSlFrm.EmailBitBtnClick(Sender: TObject);
var
  i: integer;
  sFilename: array[0..255] of Char;
begin
  try
    clearEmailarray(self);
    sPurchaseTermsFile := dmBroker.GetPurchaseTermsFile;
    EmailReport(self);
  finally
    for i := pred(FEmailAttachment.count) downto 0 do
      begin
        if (FEmailAttachment.strings[i] = sPurchaseTermsFile) then
          continue;
        StrPCopy(sFilename, FEmailAttachment.strings[i]);
        deletefile(sFilename);
      end;
  end;
end;

end.







