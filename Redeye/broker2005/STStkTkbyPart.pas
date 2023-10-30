unit STStkTkbyPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, STStkTkObject,
  CCSCommon, ComCtrls, ExtCtrls, ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTStkTkbyPartFrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    StoreNameLbl: TLabel;
    Panel2: TPanel;
    AddBitBtn: TBitBtn;
    Changebtn: TBitBtn;
    DeleteBitBtn: TBitBtn;
    ConfirmBtn: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    Panel4: TPanel;
    CountGrid: TStringGrid;
    Label3: TLabel;
    edtFile: TEdit;
    btnBrowse: TBitBtn;
    btnImport: TBitBtn;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DocOpenDialog: TOpenDialog;
    qryUpdStocktake: TFDQuery;
    qryUpdStockTakeStatus: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ChangebtnClick(Sender: TObject);
    procedure CountGridDblClick(Sender: TObject);
    procedure ConfirmBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CountGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateTransfers;
    procedure FormatGrid;
    procedure CountGridClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure DeleteBitBtnClick(Sender: TObject);
    procedure DeleteRow(iRowNo: integer);
    procedure InsertRow(iRowNo: integer);
    procedure ReNumberLines(iRowNo: integer);
    procedure EnableButtons(iRow: integer);
    procedure DeleteCountLine(aline: TcountLine);
    procedure CountGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnBrowseClick(Sender: TObject);
    procedure edtFileChange(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    private
    Fcountlistnumber: string;
    FSelectedLineIndex: Integer;
    FSelectedLotIndex: integer;
    procedure Setcountlistnumber(const Value: string);
    procedure Loadcountinglist;
    function GetSelectedLine: TCountLine;
    function GetSelectedLot: TLotNumber;
    procedure ConnectToExcel;
    procedure DisConnectFromExcel;
    procedure ImportData;
    procedure UpdateStockTake(tempCode, tempQty: integer);
    procedure UpdateStockTakeStatus(tempCode: integer);
  { Private declarations }
  public
    property countlistnumber: string read Fcountlistnumber write Setcountlistnumber;
    property SelectedLine: TCountLine read GetSelectedLine;
    property SelectedLineIndex: Integer read FSelectedLineIndex;
    property SelectedLot: TLotNumber read GetSelectedLot;
    property SelectedLotIndex: integer read FSelectedLotIndex;
    { Public declarations }
  end;

var
  STStkTkbyPartFrm: TSTStkTkbyPartFrm;

implementation

uses
  System.UITypes, System.Types,
  STStkTakeDM, STStkTkItem, StPacks, pbMainMenu;

{$R *.DFM}

procedure TSTStkTkbyPartFrm.Setcountlistnumber(const Value: string);
begin
  Fcountlistnumber := Value;
end;

procedure TSTStkTkbyPartFrm.FormShow(Sender: TObject);
begin
  label1.caption := label1.caption + ' ' + countlistnumber;
  with CountGrid do
    begin
      cells[0,0] := 'Bin Location'; {Count}
      cells[1,0] := 'Product Code';
      cells[2,0] := 'Description';
      cells[3,0] := 'Lot/Ser. No'; {Count}
      cells[4,0] := 'Prior Qty'; {Prior}
      cells[5,0] := 'Count Qty'; {Count}
      cells[6,0] := 'Pack Size'; {Count}
    end;
  Loadcountinglist;
  CountGrid.setfocus;
end;

procedure TSTStkTkbyPartFrm.FormatGrid;
begin
  with CountGrid do
    begin
      {Set the Grid columns if no bins in use}
      if not countinglist.BinsInUse then
        begin
          colwidths[0] := -1;
        end;
      {Set the Grid columns if no lots in use}
      if (not countinglist.LotsInUse) then
        begin
          colwidths[3] := -1;
        end;
    end;
  StoreNameLbl.Caption := STStkTkDM.GetPartStoreName(countinglist.PartStore);
end;

procedure TSTStkTkbyPartFrm.Loadcountinglist;
var
  icount: integer;
begin
  countinglist.countinglistRef := countlistnumber;
  STStkTkDM.LoadcountinglistfromDB(countinglist);

  {Set the format of the Grid}
  FormatGrid;
  
  for icount := 0 to Pred(countinglist.CountLines.count) do
    with countinglist.CountLines[iCount] do
      begin
          CountGrid.cells[0,icount+1] := CountBin;
          CountGrid.cells[1,icount+1] := Part;
          CountGrid.cells[2,icount+1] := STStkTkDM.GetPartDescription(Part);
          CountGrid.cells[3,icount+1] := CountLot;
          //          If (LineStatus = 'H') and (QtyCounted = 0) then
 //           CountGrid.cells[1,icount+1]:= 'Deleted Item';
          if QtyPrior = 0 then
            CountGrid.cells[4,icount+1] := inttostr(QtyPrior)
          else
            CountGrid.cells[4,icount+1] := ShowInPacks(QtyPrior,PriorPackQty);
          if QtyCounted = 0 then
            CountGrid.Cells[5,icount+1]:= inttostr(QtyCounted)
          else
            CountGrid.cells[5,icount+1] := ShowInPacks(QtyCounted,PackQty);
        CountGrid.Cells[6,icount+1] := IntToStr(Packqty);
      end;
  CountGrid.rowcount := countinglist.CountLines.count+1;
end;

procedure TSTStkTkbyPartFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    if (ActiveControl is TStringGrid) then
    begin
      with TStringGrid(ActiveControl) do
      begin
        ChangeBtnClick(self);
      end;
    end;
end;

procedure TSTStkTkbyPartFrm.ChangebtnClick(Sender: TObject);
var
  irow, icount: integer;
  CountLine: TCountLine;
  LotNumber: TLotNumber;
begin
  CountLine := SelectedLine.Clone;

  with CountGrid do
    begin
      irow := row;
    end;

  STStkTkItemFrm := TSTStkTkItemFrm.create(self);
  with STStkTkItemFrm do
    begin
      try
        MaintMode := 'C'; {Change}
        partcode := CountLine.Part;
        PriorBin := CountLine.PartBin;
        Packsize := CountLine.PriorPackqty;
        CountPacksize := CountLine.Packqty;
        PriorQty := inttostr(CountLine.QtyPrior);
        CountQty := inttostr(CountLine.QtyCounted);
        CountBin := CountLine.CountBin;
        PriorLot := CountLine.PartStoreLot;
        CountLot:= CountLine.CountLot;
        StockTakeNo  := CountLine.StockTakeNo;
        ActionTkn := 'C';
        countlist :=  Countlistnumber;


        for icount := 0 to pred(CountLine.LotNumbers.count) do
          begin
            FSelectedLotIndex := icount;
            LotNumber := SelectedLot.clone;
            SerialNoItems.add(LotNumber.LotNumberRef);
          end;
        {Determine if using Lots and/or Serial numbering}
        BinsInUse := countinglist.BinsInUse;
        LotsInUse := countinglist.LotsInUse;
        SerialNoInUse := CountLine.SerialNumbers;
        PartStore := countinglist.PartStore;
        showmodal;
        if modalresult = idok then
          begin
            if CountQty = '0' then
              CountGrid.cells[5,irow] := CountQty
            else
            CountGrid.cells[5,irow] := ShowinPacks(StrToInt(CountQty), CountPacksize);
            CountGrid.cells[0,irow] := CountBin;
            CountGrid.cells[3,irow] := CountLot;
            CountGrid.cells[1,irow] := PartCode;
            CountGrid.cells[2,irow] := PartDesc;
            CountGrid.cells[6,irow] := inttostr(CountPacksize);
            CountLine.QtyCounted := strtoint(CountQty);
            CountLine.CountBin := CountBin;
            CountLine.CountLot := CountLot;
            CountLine.PackQty := CountPacksize;
            CountLine.PriorPackQty := PackSize;
            CountLine.ActionTkn := 'C';
            CountLine.StockTakeNo := StockTakeNo;
            Countline.Part := PartCode;
            if SerialNoInUse then
              begin
                {Delete the existing Serial Numbers}
                for icount := pred(CountLine.LotNumbers.count) downto 0 do
                  begin
                    CountLine.LotNumbers.delete(icount);
                  end;

                {Add the new Serial Numbers}
                for icount := 0 to pred(SerialNoItems.count) do
                  begin
                    LotNumber := TLotNumber.create;
                    LotNumber.LotNumberRef := SerialNoItems.strings[icount];
                    CountLine.LotNumbers.Add(LotNumber);
                    CountLine.LotNumbers[icount].Assign(LotNumber);
                  end;
              end;
            EnableButtons(irow);
            countinglist.CountLines[SelectedLineIndex].Assign(CountLine);

            CountLine.Free;
          end
        else
          CountLine.Free;
      finally
        free;
      end;
    end;
end;

procedure TSTStkTkbyPartFrm.CountGridDblClick(Sender: TObject);
begin
  ChangeBtnClick(self);
end;

procedure TSTStkTkbyPartFrm.ConfirmBtnClick(Sender: TObject);
begin
  if MessageDlg('Complete the Counting confirmation?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      UpdateTransfers;
      modalresult := mrok
    end
  else
    exit;
end;

procedure TSTStkTkbyPartFrm.FormCreate(Sender: TObject);
begin
  StatusBar1.Top := Screen.Height - StatusBar1.Height;
  countinglist := Tcountinglist.Create(STStkTkDM);
  CCSCommon.LoadFormLayout(frmPBMainMenu.AppIniFile, self);
end;

function TSTStkTkbyPartFrm.GetSelectedLine: TCountLine;
begin
  if FSelectedLineIndex < 0 then
    Result := nil
  else
    Result := countinglist.CountLines[FSelectedLineIndex];
end;

procedure TSTStkTkbyPartFrm.CountGridSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  EnableButtons(ARow);
  if FSelectedLineIndex = ARow - 1 then Exit;
  FSelectedLineIndex := ARow - 1;
end;

procedure TSTStkTkbyPartFrm.FormDestroy(Sender: TObject);
begin
  CCSCommon.SaveFormLayout(frmPBMainMenu.AppIniFile, self);
  countinglist.Free;
end;

procedure TSTStkTkbyPartFrm.UpdateTransfers;
var
  ilots, icount: integer;
  CountLine: TCountLine;
  LotNumber: TLotNumber;
  rcost: real;
begin
  for icount := 0 to Pred(countinglist.CountLines.count) do
    with countinglist.CountLines[iCount] do
      begin
        FSelectedLineIndex := icount;
        CountLine := SelectedLine.Clone;

      If CountLine.ActionTkn = 'C' then
      begin
      If CountLine.Lotnumbers.count > 0 then
        begin
        for iLots := 0 to pred(countline.lotnumbers.count) do
        begin
          fselectedLotIndex := ilots;
          Lotnumber := selectedLot.Clone;
          With STStkTkDM.UpdCountSql do
            begin
            Close;
            ParamByname('Stock_Take_Qty').asFloat := countline.QtyCounted;
            if countline.part = '' then
              ParamByName('Part').clear
            else
              ParamByName('Part').AsString := countline.Part;
            ParamByName('Stock_Take').asinteger := LotNumber.StockTakeNo;
            ParamByName('Part_Bin').AsString := countline.CountBin;
            ParamByName('Part_Store_Lot').AsString := LotNumber.LotNumberRef;
            ParamByName('Stock_Take_Status').asString := 'H';
            ParamByName('Pack_Qty').AsInteger := CountLine.PackQty;
            end;
        end;
        end
      else
        begin
        With STStkTkDM.UpdCountSql do
        begin
          Close;
          ParamByname('Stock_Take_Qty').asFloat := countline.QtyCounted;
          ParamByName('Stock_Take').asinteger := countline.StockTakeNo;
          ParamByName('Part_Bin').AsString := countline.CountBin;
          ParamByName('Part_Store_Lot').AsString := countline.CountLot;
          ParamByName('Stock_Take_Status').asString := 'H';
          if countline.part = '' then
              ParamByName('Part').clear
            else
              ParamByName('Part').AsString := countline.Part;
              ParamByName('Pack_Qty').AsInteger := CountLine.PackQty;
        execsql;
        end;
        end;
      end;


      If CountLine.ActionTkn = 'A' then
      begin
      If CountLine.Lotnumbers.count > 0 then
        begin
        rcost := STSTkTkDM.GetNewStoreStockCost(0,Countline.part);
        for iLots := 0 to pred(CountLine.LotNumbers.count) do
          begin
            fSelectedLotIndex := ilots;
            Lotnumber := SelectedLot.Clone;
            STStkTkDM.AddStockTake(0,Countinglist.PartStore,CountLine.CountBin,
                LotNumber.LotNumberRef, 'H', CountingList.countinglistRef, Countline.Part,
                CountLine.PartBin, CountLine.PartStoreLot, 0, 1, CountLine.PackQty, CountLine.PriorPackQty, Date,rcost)
          end;
        end
      else
      begin
        rcost := STSTkTkDM.GetNewStoreStockCost(0,Countline.part)*Countline.QtyCounted;
        STStkTkDM.AddStockTake(0,Countinglist.PartStore,CountLine.CountBin,
                CountLine.CountLot, 'H', CountingList.countinglistRef, Countline.Part,
                CountLine.PartBin, CountLine.PartStoreLot, CountLine.QtyPrior, CountLine.QtyCounted, CountLine.PackQty, Countline.PriorPackQty, Date, rcost);
      end;
      end;
      If (CountLine.ActionTkn = 'D') and (countline.StockTakeno <> 0) then
      begin
      With STStkTkDM.DelCountSql do
        begin
          Close;
          ParamByName('Stock_Take').asinteger := countline.StockTakeNo;
          ParamByName('Status').AsString := 'H';
          execsql;
        end;
      end;
    end;
end;

function TSTStkTkbyPartFrm.GetSelectedLot: TLotNumber;
begin
  if (SelectedLine = nil) or (FSelectedLotIndex < 0) then
    Result := nil
  else
    Result := SelectedLine.LotNumbers[FSelectedLotIndex];
end;


procedure TSTStkTkbyPartFrm.CountGridClick(Sender: TObject);
begin
  with CountGrid do
    begin
      {Display what has been Counted}
      STStkTkbyPartFrm.Hint := 'Quantity of: '+ cells[5, row] +
                              ' Counted from '+ cells[0,row] +
                              ' ' + cells[3,row];
    end;
end;

procedure TSTStkTkbyPartFrm.AddBitBtnClick(Sender: TObject);
var
  irow, icount:integer;
  CountLine: TCountLine;
  aCountLine: TCountLine;
  LotNumber: TLotNumber;
begin
  CountLine := SelectedLine.Clone;

  with CountGrid do
    begin
      irow := row;
      rowcount := rowcount+1;
    end;

  STStkTkItemFrm := TSTStkTkItemFrm.create(self);
  with STStkTkItemFrm do
    begin
      try
        MaintMode := 'A'; {Change}
        partcode := '';
        PriorBin := '';
        PriorQty := inttostr(0);
        CountQty := PriorQty;
        CountBin := '';
        PriorLot := '';
        CountLot:= '';
        StockTakeNo := 0;
        ActionTkn := 'A';
        packsize := 0;
        {Determine if using Lots and/or Serial numbering}
        BinsInUse := countinglist.BinsInUse;
        LotsInUse := countinglist.LotsInUse;
        SerialNoInUse := CountLine.SerialNumbers;
        PartStore := countinglist.PartStore;
        countlist :=  Countlistnumber;
        showmodal;
        if modalresult = idok then
          begin
            {Insert row in grid}
            insertrow(irow);
            {Re-number all the Picklines}
            ReNumberLines(irow+1);
            {Re-number all the Countlines}
            aCountLine := TCountLine.create;
            aCountLine.Line := irow+1;
            aCountLine.PartStoreLot := PriorLot;
            aCountLine.CountLot := CountLot;
            aCountLine.CountBin := CountBin;
            aCountLine.Part := PartCode;
            aCountLine.SerialNumbers := CountLine.SerialNumbers;
            aCountLine.QtyPrior := strtoint(PriorQty);
            aCountLine.QtyCounted := strtoint(CountQty);
            aCountLine.PartBin := PriorBin;
            aCountLine.BinPrior := PriorBin;
            aCountLine.LotPrior := PriorLot;
            aCountLine.ActionTkn := ActionTkn;
            aCountLine.StockTakeNo := StockTakeNo;
            aCountLine.PackQty := CountPackSize;
            countinglist.CountLines.Add(aCountLine);

            if SerialNoInUse then
              begin
                {Add the new Serial Numbers}
                for icount := 0 to pred(SerialNoItems.count) do
                  begin
                    LotNumber := TLotNumber.create;
                    LotNumber.LotNumberRef := SerialNoItems.strings[icount];
                    aCountLine.LotNumbers.Add(LotNumber);
                    aCountLine.LotNumbers[icount].Assign(LotNumber);
                  end;
              end;

            {Insert the relevant grid details}
            CountGrid.cells[0,irow+1] := CountBin;
            CountGrid.cells[1,irow+1] := PartCode;
            CountGrid.cells[2,irow+1] := PartDesc;
            CountGrid.cells[3,irow+1] := CountLot;
            CountGrid.cells[4,irow+1] := PriorQty;
            if priorqty = '0' then
              CountGrid.cells[4,irow+1] := PriorQty
            else
              CountGrid.cells[4,irow+1] := ShowInPacks(StrToInt(PriorQty),CountPacksize);
            if countQty = '0' then
              CountGrid.cells[5,irow+1] := CountQty
            else
              CountGrid.Cells[5,irow+1] := ShowInPacks(strToInt(CountQty),CountPacksize);
            CountGrid.cells[6,irow+1] := intToStr(countPacksize);

            {Split the original Prior qty}
            CountGrid.row := irow+1;
            EnableButtons(irow+1);
            CountLine.Free;
          end
        else
          CountLine.Free;
      finally
        free;
      end;
    end;
end;

procedure TSTStkTkbyPartFrm.DeleteBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Delete selected Counting item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
     DeleteCountline(SelectedLine);
    end;
end;

procedure TSTStkTkbyPartFrm.DeleteRow(iRowno: integer);
var
  irow, icol: integer;
begin
    {Delete row from grid and move everything up}
    with CountGrid do
      begin
        for irow := irowno to rowcount-2 do
          begin
            for icol := 0 to 6 do
              begin
                cells[icol,irow] := cells[icol,irow+1];
                cells[icol,irow] := cells[icol,irow+1];
              end;
          end;
        {Clear the last row down}
        for icol := 0 to 6 do
          cells[icol,rowcount-1] := '';

        if rowcount = 2 then
          rowcount := 2
        else
          rowcount := rowcount-1;
      end;
end;

procedure TSTStkTkbyPartFrm.InsertRow(iRowNo: integer);
var
  irow, icol: integer;
begin
    {Insert new row from grid and move everything up}
    with CountGrid do
      begin
        Rowcount := rowcount + 1;
        for irow := rowcount-1 downto iRowNo+1 do
          begin
            for icol := 0 to 7 do
              begin
                cells[icol,irow] := cells[icol,irow-1];
                cells[icol,irow] := cells[icol,irow-1];
              end;
          end;
      end;
end;

procedure TSTStkTkbyPartFrm.ReNumberLines(iRowNo: integer);
var
  aLine: TCountLine;
  icount: integer;
begin
  for icount := Pred(countinglist.CountLines.count) downto iRowNo-1 do
    begin
      FSelectedLineIndex := icount;
      aLine := SelectedLine.Clone;
      with aLine do
        begin
          Line := Line+1;
          countinglist.CountLines[icount].Assign(aLine);
          Free;
        end;
    end;

end;

procedure TSTStkTkbyPartFrm.EnableButtons(iRow: integer);
begin
  with CountGrid do
    begin
{      if cells[4,irow] = cells[5,irow] then
        AddBitBtn.enabled := false
      else
        AddBitBtn.enabled := true; }
    end;
end;

procedure TSTStkTkbyPartFrm.DeleteCountLine(aline: TcountLine);
begin
with aLine do
    begin
      aLine.ActionTkn := 'D';
      aLine.QtyCounted := 0;
      CountGrid.cells[5,aLine.Line] := inttostr(aLine.QtyCounted);
//      CountGrid.cells[1,aLine.Line] := 'Deleted Item';
      end;
end;

procedure TSTStkTkbyPartFrm.CountGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with (Sender as TStringGrid) do
  begin
    const Gap = 4;
    var Text := Cells[ACol, ARow];
    var WidthOfText := Canvas.TextWidth(Text);
    var WidthOfCell := ColWidths[ACol];
    var LeftOffset := WidthOfCell - WidthOfText - Gap;

    {The following is code extracted from the Delphi Info Base}
    {Display the Columns Right justified in the cells}
    if (ACol = 5) or (ACol = 6) or (ACol = 4) then
    begin
      if gdFixed in State then
        Canvas.Brush.Color := CountGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + LeftOffset, Rect.Top, Text);
    end
    else
    begin
      if gdFixed in State then
        Canvas.Brush.Color := CountGrid.FixedColor else
        if gdSelected in State then
          Canvas.Brush.Color := $00FFF0E1 else
          Canvas.Brush.Color := clWindow;
      Canvas.FillRect(Rect);
      Canvas.TextRect(Rect, Rect.Left + Gap, Rect.Top, Text);
    end;
  end;
end;

procedure TSTStkTkbyPartFrm.btnBrowseClick(Sender: TObject);
var
  docDir, tempStr, tempStr2: string;
  iLength, iPos: integer;
  icount: integer;
begin
  iLength := length(trim(edtFile.text));

  docdir := edtFile.text;

  while pos('\',docdir) <> 0 do
    begin
      iPos := pos('\',docdir);
      docdir := stringreplace(docdir,'\','*',[]);
    end;

  tempstr := copy(edtFile.text,(ipos+1),(iLength-iPos));

  tempStr2 := copy(edtFile.text,1,iPos);

  {Find a document} ;
  with DocOpenDialog do
  begin

    InitialDir := tempStr2;
    FileName := tempStr;
    ForceCurrentDirectory := false;
    if Execute then
    begin
      for icount := 0 to pred(Files.Count) do
        begin
          edtFile.text := Files.Strings[icount];
        end;
    end;
  end;
end;

procedure TSTStkTkbyPartFrm.edtFileChange(Sender: TObject);
begin
  btnImport.Enabled := (edtFile.Text <> '')
end;

procedure TSTStkTkbyPartFrm.btnImportClick(Sender: TObject);
begin
  if messagedlg('Do you want to import the selected estimate file and delete all existing charges?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ImportData;
    end;
end;

procedure TSTStkTkbyPartFrm.ImportData;
var
  iStocktakeNo: integer;
  iQty: integer;
  sTemp: string;
  bTest: boolean;
begin

  ConnectToExcel;

  AdoQuery1.Close;
  try
  try
    AdoQuery1.Open;
    while AdoQuery1.Eof <> true do
      begin
        iStocktakeNo := strtoint(AdoQuery1.fields[0].AsString);
        if iStocktakeNo = 43653 then
          bTEst := true;
        if (trim(AdoQuery1.fields[7].AsString) <> '') then
          begin
            try
              iQty := strtoint(AdoQuery1.fields[7].AsString);
            except
              iQty := -1;
            end;
          end
        else
          begin
            iQty := strtoint(AdoQuery1.fields[6].AsString);
          end;
        UpdateStockTake(istocktakeNo, iQty);
//        UpdateStockTakeStatus(iStockTakeNo);
        AdoQuery1.Next;
      end;
    AdoQuery1.Close;
  except
    ShowMessage('Unable to read data from Excel, '
                + ' make sure the query ' + edtFile.Text +
                 ' is meaningful!');
    raise;
  end;
  finally
    DisConnectFromExcel;
  end;
end;

procedure TSTStkTkbyPartFrm.DisConnectFromExcel;
begin
  try
    AdoConnection1.Close;
  except
    ShowMessage('Unable to close '
                + ' the workbook in ' + edtFile.Text);
    raise;
  end;
end;

procedure TSTStkTkbyPartFrm.ConnectToExcel;
var
  strConn :  widestring;
begin
  strConn :=  'Provider=Microsoft.Jet.OLEDB.4.0;' +
              'Data Source=' + edtFile.Text + ';' +
              'Extended Properties=Excel 8.0;Jet OLEDB:Engine Type=35;HDR=YES;';

  AdoConnection1.Connected := False;
  AdoConnection1.ConnectionString := strConn;
  try
    AdoConnection1.Open;
  except
    ShowMessage('Unable to connect to Excel, make sure '
                + ' the workbook ' + edtFile.Text + ' exist!');
    raise;
  end;
end;(*ConnectToExcel*)

procedure TSTStkTkbyPartFrm.UpdateStockTake(tempCode, tempQty: integer);
begin
  with qryUpdStocktake do
    begin
      close;
      parambyname('Stock_Take').asinteger := tempCode;
      parambyname('Stock_Take_Qty').asinteger := tempQty;
      execsql;
    end;
end;

procedure TSTStkTkbyPartFrm.UpdateStockTakeStatus(tempCode: integer);
begin
  with qryUpdStockTakeStatus do
    begin
      close;
      parambyname('Stock_Take').asinteger := tempCode;
      execsql;
    end;
end;

end.
