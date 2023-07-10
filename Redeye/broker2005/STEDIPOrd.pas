unit STEDIPOrd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, IniFiles, Grids, Buttons, Printers;

type
  TSTEDIPOrdFrm = class(TForm)
    pnlGrid: TPanel;
    pnlMain: TPanel;
    btnKFSupplierSelect: TButton;
    rdgrpSupplier: TRadioGroup;
    GenerateBtn: TButton;
    Panel1: TPanel;
    lblKingfieldSupplier: TLabel;
    strgrdPOsCreated: TStringGrid;
    AnalyseBtn: TButton;
    pnlResponseDtls: TPanel;
    mmResponseDtls: TMemo;
    pnlClose: TPanel;
    BitBtn1: TBitBtn;
    PrintDialog1: TPrintDialog;
    btbtnPrint: TBitBtn;
    procedure btnKFSupplierSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GenerateBtnClick(Sender: TObject);
    procedure AnalyseBtnClick(Sender: TObject);
    procedure strgrdPOsCreatedDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure btbtnPrintClick(Sender: TObject);
  private
    procedure AnalyseALDLine(RespLine: string; var Prodcode, LineNo, SaleUnit, OrdQty, DelQty, PackCost, ReplProdDesc, ReplProdCode, PriceDiffFlg: string);
    procedure AnalyseDNBLine(respLine: string; var LineRef, ErrCode: string);
    procedure AnalyseAQDLine(RespLine: string; var DelDate,
      DelLineQty: string);
    function CheckReplacemntProd(ProdCode: string; var SellPackQty: integer;
      var SellPackPrice: double): boolean;
    procedure AnalyseDOResponses;
    procedure AnalyseSOResponses;
  public
    { Public declarations }
  end;

var
  STEDIPOrdFrm: TSTEDIPOrdFrm;
  iSupplCode: integer;
  iSupplBranch: integer;
  sSupplName: String;
  bUpdateIni: boolean;

implementation

uses STSODataMod, STPOObjects, STPODataMod, PBLUSupp, STSOObjects, STPartSuppDM,
  pbMainMenu;

var
  STPODM: TSTPODM;

{$R *.DFM}

procedure TSTEDIPOrdFrm.btnKFSupplierSelectClick(Sender: TObject);
var
  tempStr : String;
begin
  pbLUSuppFrm := TpbLUSuppFrm.Create(Self);
  try
    pbLUSuppFrm.bIs_LookUp := True ;
    pbLUSuppFrm.bAllow_Upd := False ;
    pbLUSuppFrm.bSel_Branch := False ;
    pbLUSuppFrm.ShowModal;
    If pbLUSuppFrm.Selected then
       begin
       iSupplCode := pbLUSuppFrm.SelCode ;
       sSupplName := pbLUSuppFrm.SelName ;
       tempStr := 'Supplier No: '+ IntToStr(iSupplCode) + ', '+sSupplName;
       lblKingfieldSupplier.Caption := tempStr;
       end;
  finally
    pbLUSuppFrm.Free;
  end;
  bUpdateIni := True;
end;

procedure TSTEDIPOrdFrm.FormCreate(Sender: TObject);
var
  IniFile : TIniFile;
  tempStr : string;
begin
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);
  with IniFile do
  begin
    tempStr := 'Supplier No: ';
    tempStr := tempStr + ReadString('EDISuppliers', 'KingfieldSupplierNo', '');
    tempStr := tempStr + ', ';
    tempStr := tempStr + ReadString('EDISuppliers', 'KingfieldSupplierName', '');
    lblKingfieldSupplier.caption := tempStr;
  end;
  IniFile.Free;

  with strgrdPOsCreated do
  begin
    Cells[0,0] := 'PO Number';
    Cells[1,0] := 'Lines';
    Cells[2,0] := 'SO Number';
    Cells[3,0] := 'Customer';
    Cells[4,0] := 'Order Value';
    Cells[5,0] := 'File Name';

    ColWidths[0] := 64;
    ColWidths[1] := 35;
    ColWidths[2] := 70;
    ColWidths[3] := 128;
    ColWidths[4] := 75;
    ColWidths[5] := 75;
  end;
end;

procedure TSTEDIPOrdFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  IniFile : TIniFile;
  tempStr, sSupplNo, sSupplName : string;
begin
  if not bUpdateIni then
    exit;
  tempStr := lblKingfieldSupplier.Caption;
  IniFile := TIniFile.Create(frmPBMainMenu.AppIniFile);
  with IniFile do
  begin
    sSupplNo := Copy(tempStr, (Pos(': ',tempStr)+2), (Pos(', ', tempStr)-(Pos(': ',tempStr)+2)));
    WriteString('EDISuppliers', 'KingfieldSupplierNo', sSupplNo);
    sSupplName := Copy(tempStr, (Pos(', ', tempStr)+2), Length(tempStr));
    WriteString('EDISuppliers', 'KingfieldSupplierName', sSupplName);
  end;
  IniFile.Free;
end;

procedure TSTEDIPOrdFrm.GenerateBtnClick(Sender: TObject);
var
  POList : TStringList;
  tempStr : String;
  x : integer;
  SalesOrder : TSalesOrder;
  PurchaseOrder :TPurchaseOrder;
  CNAM, CADD : string;
begin

//rearrange form layout
  pnlResponseDtls.Align := alTop;
  pnlResponseDtls.Height := 0;
  pnlGrid.Align := alClient;
  btbtnPrint.Visible := false;

//initialise variables
  x := 0;
  POList := TStringList.Create;

//open datamodules
  STSalesOrdDM := TSTSalesOrdDM.Create(Self);
  STPODM := TSTPODM.Create(Self);

//get the supplier number of the selected supplier
  case rdgrpSupplier.ItemIndex of
    0: tempStr := lblKingfieldSupplier.Caption;
  end;
  
  try
    iSupplCode :=  StrToInt(Copy(tempStr, (Pos(': ',tempStr)+2), (Pos(', ', tempStr)-(Pos(': ',tempStr)+2))));
  except
    STSalesOrdDM.free;
    STPODM.free;
    exit;
  end;

//build list of Purchase Orders with status C(Created)
  with STPODM.qryNewPOs do
  begin
    ParamByName('Supplier').AsInteger := iSupplCode;
    Open;
    while not EOF do
    begin
      POList.Add(FieldByName('Purch_Ord_No').AsString);
      Next;
    end;
    Close;
  end;

  if POList.Count = 0 then
  begin
    ShowMessage('There are no ' + rdgrpSupplier.Items[rdgrpSupplier.ItemIndex] + ' Sales Orders waiting to be processed.');
    exit;
  end;
  pnlGrid.Height := 166;
  strgrdPOsCreated.RowCount := (POList.Count)+1;

//loop thru list of o/s Purchase Orders
  for x := 0 to ((POList.Count)-1) do
  begin
    //extract PO details from database
    PurchaseOrder := TPurchaseOrder.Create(POList[x], STPODM);
    if ((PurchaseOrder.SalesOrder = 0) or (PurchaseOrder.SuppOrderType = 'S') or (PurchaseOrder.SuppOrderType = 'C')) then
    //there is no related sales order, goods are being ordered for brokers use.
    begin
      with strgrdPOsCreated do
      begin
        Cells[0,(x+1)] := PurchaseOrder.PurchOrdNo;
        Cells[1,(x+1)] := IntToStr(PurchaseOrder.NumberOfLines());
        STSalesOrdDM.GetDelAddr(PurchaseOrder.SalesOrder, CNAM, CADD);
        Cells[3,(x+1)] := CNAM;
        Cells[4,(x+1)] := FloatToStrF(PurchaseOrder.CalcOrderValue(), ffCurrency, 10, 2);
        Cells[5,(x+1)] := PurchaseOrder.CreateTextFile(STPODM);
      end;
    end
    else
    //there is a related Sales Order load it to get end user details
    begin
      SalesOrder := TSalesOrder.Create(STSalesOrdDM);
      SalesOrder.SONumber := PurchaseOrder.SalesOrder;
      STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
      with strgrdPOsCreated do
      begin
        Cells[0,(x+1)] := PurchaseOrder.PurchOrdNo;
        Cells[1,(x+1)] := IntToStr(PurchaseOrder.NumberOfLines());
        Cells[2,(x+1)] :=IntToStr(SalesOrder.SONumber);
        STSalesOrdDM.GetDelAddr(SalesOrder.SONumber, CNAM, CADD);
        Cells[3,(x+1)] := CNAM;
        Cells[4,(x+1)] := FloatToStrF(PurchaseOrder.CalcOrderValue(), ffCurrency, 10, 2);
        Cells[5,(x+1)] := PurchaseOrder.CreateTextFile(STPODM, STSalesOrdDM, SalesOrder);
      end;
      SalesOrder.Free;
    end;
    PurchaseOrder.UpdateDBRecords(STPODM);
    PurchaseOrder.Free;
  end; //end loop of PO's to be exported

//close datamodules
  STSalesOrdDM.Free;
  STPODM.Free;
end;

procedure TSTEDIPOrdFrm.AnalyseBtnClick(Sender: TObject);
begin
//rearrange form
  pnlGrid.Align := alTop;
  pnlGrid.Height := 0;
  pnlResponseDtls.Align := alClient;
  self.btbtnPrint.Visible := true;

  AnalyseDOResponses;
  AnalyseSOResponses;
end;

procedure TSTEDIPOrdFrm.AnalyseALDLine(RespLine: string; var Prodcode,
  LineNo, SaleUnit, OrdQty, DelQty, PackCost, ReplProdDesc, ReplProdCode,
  PriceDiffFlg: string);
var
tempStr : string;
begin
  //get product code
  ProdCode := Copy(RespLine, Pos('+:', RespLine) + 2, (Pos('++:',RespLine) - Pos('+:', RespLine) - 2));
  Delete(RespLine, 1, Pos('++:',RespLine)+2);

  //get LineNo
  LineNo := Copy(RespLine, 0, Pos('+',RespLine)-1);
  Delete(RespLine, 1, Pos('+',RespLine));

  //get SaleUnit
  SaleUnit := Copy(RespLine, 0, Pos('+',RespLine)-1);
  Delete(RespLine, 1, Pos('+',RespLine));

  //get OrdQty
  OrdQty := Copy(RespLine, 0, Pos('+',RespLine)-1);
  //convert no of packs to no of individual units
  OrdQty := IntToStr(StrToInt(OrdQty) * StrToInt(SaleUnit));
  Delete(RespLine, 1, Pos('+',RespLine));

  //get DelQty
  DelQty := Copy(RespLine, 0, Pos('+',RespLine)-1);
  if length(DelQty) > 1 then
    Delete(DelQty, length(DelQty)-2, 3);
  Delete(RespLine, 1, Pos('+',RespLine));
  //convert no of packs to no of individual units
  DelQty := IntToStr(StrToInt(DelQty) * StrToInt(SaleUnit));

  //get PackCost
  if (Pos(':ZZ',RespLine) <> 0) or (Pos('+', RespLine) <> 0) then
  begin
    if Pos(':ZZ',RespLine) <> 0 then
    begin
      PriceDiffFlg := 'Y';
      tempStr := Copy(RespLine, Pos('+',RespLine), Pos(':ZZ', RespLine)-Pos('+',RespLine)-3);
      PackCost := Copy(tempStr,1,Length(tempStr)-2) + '.' + Copy(tempStr, Length(tempStr)-1, 2);
    end;

    if Pos('+', RespLine) <> 0 then
    begin
      //replacement product
      tempStr := Copy(RespLine, 0, Pos('+',RespLine)-3);
      if Length(TempStr) > 5 then
        PackCost := Copy(tempStr,1,Length(tempStr)-5) + '.' + Copy(tempStr, Length(tempStr)-4, 2)
      else
        PackCost := '0.' + Copy(tempStr, 1, 2);
      Delete(RespLine, 1, Pos('+',RespLine));
      ReplProdDesc := Copy(RespLine, 0, Pos('+:',RespLine)-1);
      Delete(RespLine, 1, Pos('+:',RespLine)+1);
      ReplProdCode := Copy(RespLine, 0, Length(respLine)-1);
    end;
  end
  else
  begin
      tempStr := RespLine;
      if Length(TempStr) > 5 then
        PackCost := Copy(tempStr,1,Length(tempStr)-5) + '.' + Copy(tempStr, Length(tempStr)-4, 2)
      else
        PackCost := '0.' + Copy(tempStr, 1, 2);
  end;
end;

procedure TSTEDIPOrdFrm.AnalyseDNBLine(respLine: string; var LineRef,
  ErrCode: string);
begin
  if Pos('++', Respline) <> 0 then
  begin
    //no error code, line only holds line Reference
    Delete(RespLine, 1, Pos(':',RespLine) + 1);
    LineRef := Copy(RespLine, 0, Length(respLine)-1);
  end
  else
  begin
    Delete(RespLine, 1, Pos(':',RespLine));
    ErrCode := Copy(RespLine, 0, 3);
    Delete(RespLine, 1, Pos(':',RespLine));
    LineRef := Copy(RespLine, 0, Length(respLine)-1);
  end;
end;

procedure TSTEDIPOrdFrm.AnalyseAQDLine(RespLine: string; var DelDate,
  DelLineQty: string);
var
  tempStr: string;
begin
  Delete(RespLine, 1, Pos('+++',RespLine) + 2);
  tempStr := Copy(RespLine, 0, 6);
  DelDate := Copy(tempStr,5,2)+'/'+Copy(tempStr,3,2)+'/'+Copy(tempStr,1,2);
  Delete(RespLine, 1, 7);
  DelLineQty := Copy(RespLine, 0, Length(respLine)-1);
end;

function TSTEDIPOrdFrm.CheckReplacemntProd(ProdCode: string; var SellPackQty: integer;
  var SellPackPrice: double): boolean;
var
  STPartSDM : TSTPartSDM;
begin
  STPartSDM := TSTPartSDM.Create(Self);
//check database for replacement product
  with STPartSDM.qryPartDtls do
  begin
    ParamByName('Part').AsString := ProdCode;
    open;
    if RecordCount = 0 then
    //if not in database, send warning to user to get product details from supplier;
      CheckReplacemntProd := False
    else
    begin
      CheckReplacemntProd := true;
      SellPackQty := FieldByName('Sell_Pack_Quantity').AsInteger;
      SellPackPrice := FieldByName('Part_Cost_List').AsFloat;
    end;
    Close;
  end;
  STPartSDM.Free;
end;

procedure TSTEDIPOrdFrm.strgrdPOsCreatedDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
	{The following is code extracted from the Delphi Info Base}
	{If Heading Display Left justified in the cells}
  if (ACol = 0) or (ACol = 1) or (ACol = 2) or (ACol = 3) then
  begin
  		StrPCopy(Txt, (Sender as TStringGrid).Cells[ACol, ARow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end
  else
  begin
			{Display the Columns Right justified in the cells}
 		StrPCopy(Txt, (Sender as TStringGrid).Cells[ACol, ARow]);
  		SetTextAlign((Sender as TStringGrid).Canvas.Handle,
    			GetTextAlign((Sender as TStringGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TStringGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
  end;  
end;

procedure TSTEDIPOrdFrm.AnalyseDOResponses;
var
  x, y : integer;
  SearchRec : TSearchRec;
  FileNames, RespLines : TStringList;
  tempStr, errCode : String;
  RespFile : TextFile;
  PurchOrdNumber : string;
  LineCount : integer;
  Prodcode, LineNo, SaleUnit, OrdQty, DelQty, PackCost, ReplProdDesc, ReplProdCode, PriceDiffFlg: string;
  LineRef : string;
  DelDate, DelLineQty: string;
  SellPackQty : integer;
  SellPackPrice : double;
  bUpdatePO : boolean;
  bDeleteRespFile : boolean;
  PurchaseOrder : TPurchaseOrder;
  SalesOrder: TSalesOrder;
begin
//initialise variables
  FileNames := TStringList.Create;
  RespLines := TStringlist.Create;
  tempStr := '';
  LineCount := 0;
  mmResponseDtls.Lines.Clear;
  bDeleteRespFile := true;
  PriceDiffFlg := 'N';

//Search DO response directory for files to analyse
  //FindFirst returns 0 if successful if no files found then quit
  if FindFirst('C:\KCOMM\RESPONSE\DO\*.DO', faAnyFile, SearchRec) <> 0 then
  begin
    mmResponseDtls.Lines.Add('There are no files in the Direct Order Response Directory to analyse.');
    exit;
  end;
  FileNames.Add(SearchRec.Name);
  while FindNext(SearchRec) = 0 do
  begin
    FileNames.Add(SearchRec.Name);
  end;
  FindClose(SearchRec);

//loop thru list of files
  for x := 0 to (FileNames.Count - 1) do
  begin
  //open file
    bUpdatePO := false;
    AssignFile(RespFile, 'C:\KCOMM\RESPONSE\DO\' + FileNames[x]);
    Reset(RespFile);

  //copy file contents to TStringList
    ReadLn(RespFile, tempStr);
    while not EOF(RespFile) do
    begin
      RespLines.Add(tempStr);
      tempStr := Copy(tempStr, 0, 3);
      if (tempStr = 'DNA') or (tempStr = 'ALD') or (tempStr = 'AQD') then
        bUpdatePO := true;
      ReadLn(RespFile, tempStr);
    end;

    mmResponseDtls.Lines.Add('Analyzing file ' + FileNames[x]);
    
  //close file
    CloseFile(RespFile);

  //interpret message header content
    if Copy(RespLines[0], 0, 3) <> 'STX' then
    begin
      //FileHeaderError('Repsonse File Incorrectly Formatted');
    end;

    if Copy(RespLines[1], 0, 3) <> 'MHD' then
    begin
      //MsgHeaderError('Repsonse File Incorrectly Formatted');
    end;

    if Copy(RespLines[5], 0, 3) = 'DNA' then
    begin
      //Error in original message file
      errCode := Copy(RespLines[5], Pos(':', RespLines[5])+1, 3);
      mmResponseDtls.Lines.Add('Error in File. Error Code: ' + errCode);
      mmResponseDtls.Lines.Add('');
      RespLines.Clear;
      //pointless reading any more of file so restart loop
      continue;
    end;

  //interpret message body content
    PurchOrdNumber := Copy(RespLines[9], 5, (Pos(':', RespLines[9])-5));
    mmResponseDtls.Lines.Add('Direct Delivery Order: '+PurchOrdNumber);

  //if an update to the PO is needed load it from the database
    if bUpdatePO then
    begin
      //set up datamodules and load Purchase Order and SalesOrder
      STPODM := TSTPODM.Create(self);
      PurchaseOrder := TPurchaseOrder.Create(PurchOrdNumber, STPODM);
      STSalesOrdDM := TSTSalesOrdDM.Create(Self);
      SalesOrder := TSalesOrder.Create(STSalesOrdDM);
      SalesOrder.SONumber := PurchaseOrder.SalesOrder;
      STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
    end;

  //loop thru remaining message lines checking for errors and updated info until the end of section code MTR is reached
    y := 10;
    while Copy(RespLines[y], 0, 3) <> 'MTR' do
    begin
      //DNA lines warn of delivery/service charges associated with the order.
      if Copy(RespLines[y], 0, 3) = 'DNA' then
      begin
        if Copy(RespLines[y], Pos('++', RespLines[y]) +2, 3) = '022' then
        begin
        //carriage charge added
          mmResponseDtls.Lines.Add('Carriage charge added: '+ Copy(RespLines[y], (Pos(':', RespLines[y])+1), (Length(RespLines[y])-4-((Pos(':', RespLines[y])+1))) ) + '.' + Copy(RespLines[y] , (Length(RespLines[y])-4), 2 ) );
        end;

        if Copy(RespLines[y], Pos('++', RespLines[y]) +2, 3) = '026' then
        begin
        //service charge added
          mmResponseDtls.Lines.Add('Service charge added: '+ Copy(RespLines[y], (Pos(':', RespLines[y])+1), (Length(RespLines[y])-4-((Pos(':', RespLines[y])+1))) ) + '.' + Copy(RespLines[y] , (Length(RespLines[y])-4), 2 ) );
        end;
      end;

      //ALD lines contain product code and warn of price discrepancies or product replacements
      ReplProdDesc := '';
      ReplProdCode := '';
      if Copy(RespLines[y], 0, 3) = 'ALD' then
      begin
        LineCount := LineCount + 1;
        AnalyseALDLine(RespLines[y], Prodcode, LineNo, SaleUnit, OrdQty, DelQty, PackCost, ReplProdDesc, ReplProdCode, PriceDiffFlg);
        mmResponseDtls.Lines.Add('Line no: ' + LineNo + ', Product Code: ' + ProdCode + ' at £' + PackCost + ' per pack of ' + SaleUnit + ' units.');
        mmResponseDtls.Lines.Add('Order Quantity: ' + OrdQty + ' units, Delivery Quantity: ' + DelQty + ' units.');
        if ReplProdCode <> '' then
        begin
          mmResponseDtls.Lines.Add('Product replacement: '+ReplProdCode+', '+ReplProdDesc+' to be sent in place of ordered item.');
          //insert new product if neccessary
          if CheckReplacemntProd(ReplProdCode, SellPackQty, SellPackPrice) = false then
          begin
            //display message for user to get replacement product details from supplier
            mmResponseDtls.Lines.Add('There are no details for this product in the database.');
            mmResponseDtls.Lines.Add('Please contact the supplier to obtain the necessary details.');
          end
          else
          begin
            //update line details
            //reduce order quantity of expected item to zero on both PO and SO
            with (PurchaseOrder.POLines[StrToInt(lineNo)-1]) do
            begin
              QuantityOrdered := 0;
            end;
            with (SalesOrder.OrderLines.Lines[StrToInt(lineNo)-1])do
            begin
              ActnTkn := 'C';
              OrdQty := 0;
            end;
            //add new line relating to replacement product
            lineNo := IntToStr(PurchaseOrder.AddLine(ReplProdCode, LineNo, StrToInt(OrdQty), StrToInt(DelQty), StrToInt(SaleUnit), StrToFloat(PackCost)));
            SalesOrder.OrderLines.Add(ReplProdCode, StrToInt(LineNo), StrToInt(OrdQty), StrToInt(SaleUnit), SellPackQty, StrToFloat(PackCost), SellPackPrice);
          end;
        end;
        if PriceDiffFlg = 'Y' then
        begin
          with PurchaseOrder.POLines[LineCount -1] do
          begin
            PurchasePrice := StrToFloat(PackCost);
            Discount := (((CostPrice - PurchasePrice)/CostPrice)*100);
          end;
          PriceDiffFlg := 'N';
        end;
      end;

      //AQD lines warn of split deliveries
      if Copy(RespLines[y], 0, 3) = 'AQD' then
      begin
        AnalyseAQDLine(RespLines[y], DelDate, DelLineQty);
        mmResponseDtls.Lines.Add(DelLineQty +' units to be despatched on ' + DelDate);
        with (PurchaseOrder.POLines[StrToInt(lineNo)-1]) do
        begin
          DateDelivExpected := StrToDate(DelDate);
        end;
      end;

      //DNB lines give PO line ref and error code specific to line item
      ErrCode := '';
      if Copy(RespLines[y], 0, 3) = 'DNB' then
      begin
        AnalyseDNBLine(RespLines[y], LineRef, ErrCode);
        if ErrCode = 'PDC' then
        begin
          //product discontinued no replacement to be sent
          mmResponseDtls.Lines.Add('Line No: '+ LineNo +' Product :'+ProdCode+ ' has been discontinued. No replacement will be sent.');
          with (PurchaseOrder.POLines[StrToInt(lineNo)-1]) do
          begin
            QuantityOrdered := 0;
          end;
          with (SalesOrder.OrderLines.Lines[StrToInt(lineNo)-1])do
          begin
            ActnTkn := 'C';
            OrdQty := 0;
          end;
        end
        else
        if ErrCode <> '' then
          mmResponseDtls.Lines.Add('Error Code: '+ ErrCode);
      end;

      //next line please
      y := y + 1;
    end;

    //if there are no ALD Lines then the order is being processed without ammendments
    if LineCount = 0 then
    begin
      mmResponseDtls.Lines.Add('Order being processed without any ammendments.');
    end;

  //if an update was required save PO to database and then free memory
    if bUpdatePO then
    begin
      PurchaseOrder.UpdateDBRecords(STPODM);
      SalesOrder.SOHeadStatus := 100;
      //Using this little bit of code because the UpdateDBRecords method doesn't actually update
      //the header details in the database just yet (only the lines) the header status is the only
      //thing that is changing in the header and so it's more expedient to use this bit of
      //code for the moment.
      with STSalesOrdDM.qryUpdSoStatus do
      begin
        ParamByName('Status').AsInteger := SalesOrder.SOHeadStatus;
        ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
        ExecSQL;
      end;

      STSalesOrdDM.UpdateDBRecords(SalesOrder);
      PurchaseOrder.Free;
      SalesOrder.Free;
      STPODM.Free;
      STSalesOrdDM.Free;
    end;

  //delete response files
    mmResponseDtls.Lines.Add('-----------------------------------------------------------------------------------------------------------');

    RespLines.Clear;
    LineCount := 0;
    if bDeleteRespFile = true then
    begin
      RenameFile('C:\KCOMM\RESPONSE\DO\'+FileNames[x], 'C:\KCOMM\ARCHIVE\DO\'+FileNames[x]);
      DeleteFile('C:\KCOMM\RESPONSE\DO\'+FileNames[x]);
    end;
  end;
//end loop

//clean up variables
  FileNames.Clear;
  FileNames.Free;
end;

procedure TSTEDIPOrdFrm.AnalyseSOResponses;
var
  x, y : integer;
  SearchRec : TSearchRec;
  FileNames, RespLines : TStringList;
  tempStr, errCode : String;
  RespFile : TextFile;
  PurchOrdNumber : string;
  LineCount : integer;
  Prodcode, LineNo, SaleUnit, OrdQty, DelQty, PackCost, ReplProdDesc, ReplProdCode, PriceDiffFlg: string;
  LineRef : string;
  DelDate, DelLineQty: string;
  SellPackQty : integer;
  SellPackPrice : double;
  bUpdatePO : boolean;
  bDeleteRespFile : boolean;
  PurchaseOrder : TPurchaseOrder;
  SalesOrder: TSalesOrder;
begin
//initialise variables
  FileNames := TStringList.Create;
  RespLines := TStringlist.Create;
  tempStr := '';
  LineCount := 0;
  bDeleteRespFile := true;
  PriceDiffFlg := 'N';

//Search DO response directory for files to analyse
  //FindFirst returns 0 if successful if no files found then quit
  if FindFirst('C:\KCOMM\RESPONSE\SO\*.SO', faAnyFile, SearchRec) <> 0 then
  begin
    mmResponseDtls.Lines.Add('There are no files in the Purchase Order Response Directory to analyse.');
    exit;
  end;
  FileNames.Add(SearchRec.Name);
  while FindNext(SearchRec) = 0 do
  begin
    FileNames.Add(SearchRec.Name);
  end;
  FindClose(SearchRec);

//loop thru list of files
  for x := 0 to (FileNames.Count - 1) do
  begin
  //open file
    bUpdatePO := false;
    AssignFile(RespFile, 'C:\KCOMM\RESPONSE\SO\' + FileNames[x]);
    Reset(RespFile);

  //copy file contents to TStringList
    ReadLn(RespFile, tempStr);
    while not EOF(RespFile) do
    begin
      RespLines.Add(tempStr);
      tempStr := Copy(tempStr, 0, 3);
      if (tempStr = 'DNA') or (tempStr = 'ALD') or (tempStr = 'AQD') then
        bUpdatePO := true;
      ReadLn(RespFile, tempStr);
    end;

    mmResponseDtls.Lines.Add('Analyzing file ' + FileNames[x]);
    
  //close file
    CloseFile(RespFile);

  //interpret message header content
    if Copy(RespLines[0], 0, 3) <> 'STX' then
    begin
      //FileHeaderError('Repsonse File Incorrectly Formatted');
    end;

    if Copy(RespLines[1], 0, 3) <> 'MHD' then
    begin
      //MsgHeaderError('Repsonse File Incorrectly Formatted');
    end;

    if Copy(RespLines[5], 0, 3) = 'DNA' then
    begin
      //Error in original message file
      errCode := Copy(RespLines[5], Pos(':', RespLines[5])+1, 3);
      mmResponseDtls.Lines.Add('Error in File. Error Code: ' + errCode);
      mmResponseDtls.Lines.Add('');
      RespLines.Clear;
      //pointless reading any more of file so restart loop
      continue;
    end;

  //interpret message body content
    PurchOrdNumber := Copy(RespLines[9], 5, (Pos(':', RespLines[9])-5));
    mmResponseDtls.Lines.Add('Purchase Order: '+PurchOrdNumber);

  //if an update to the PO is needed load it from the database
    if bUpdatePO then
    begin
      //set up datamodules and load Purchase Order and SalesOrder
      STPODM := TSTPODM.Create(self);
      PurchaseOrder := TPurchaseOrder.Create(PurchOrdNumber, STPODM);
      STSalesOrdDM := TSTSalesOrdDM.Create(Self);
      SalesOrder := TSalesOrder.Create(STSalesOrdDM);
      SalesOrder.SONumber := PurchaseOrder.SalesOrder;
      STSalesOrdDM.LoadSOFromDatabase(SalesOrder);
    end;

  //loop thru remaining message lines checking for errors and updated info until the end of section code MTR is reached
    y := 10;
    while Copy(RespLines[y], 0, 3) <> 'MTR' do
    begin
      //DNA lines warn of delivery/service charges associated with the order.
      if Copy(RespLines[y], 0, 3) = 'DNA' then
      begin
        if Copy(RespLines[y], Pos('++', RespLines[y]) +2, 3) = '022' then
        begin
        //carriage charge added
          mmResponseDtls.Lines.Add('Carriage charge added: '+ Copy(RespLines[y], (Pos(':', RespLines[y])+1), (Length(RespLines[y])-4-((Pos(':', RespLines[y])+1))) ) + '.' + Copy(RespLines[y] , (Length(RespLines[y])-4), 2 ) );
        end;

        if Copy(RespLines[y], Pos('++', RespLines[y]) +2, 3) = '026' then
        begin
        //service charge added
          mmResponseDtls.Lines.Add('Service charge added: '+ Copy(RespLines[y], (Pos(':', RespLines[y])+1), (Length(RespLines[y])-4-((Pos(':', RespLines[y])+1))) ) + '.' + Copy(RespLines[y] , (Length(RespLines[y])-4), 2 ) );
        end;
      end;

      //ALD lines contain product code and warn of price discrepancies or product replacements
      ReplProdDesc := '';
      ReplProdCode := '';
      if Copy(RespLines[y], 0, 3) = 'ALD' then
      begin
        LineCount := LineCount + 1;
        AnalyseALDLine(RespLines[y], Prodcode, LineNo, SaleUnit, OrdQty, DelQty, PackCost, ReplProdDesc, ReplProdCode, PriceDiffFlg);
        mmResponseDtls.Lines.Add('Line no: ' + LineNo + ', Product Code: ' + ProdCode + ' at £' + PackCost + ' per pack of ' + SaleUnit + ' units.');
        mmResponseDtls.Lines.Add('Order Quantity: ' + OrdQty + ' units, Delivery Quantity: ' + DelQty + ' units.');
        if ReplProdCode <> '' then
        begin
          mmResponseDtls.Lines.Add('Product replacement: '+ReplProdCode+', '+ReplProdDesc+' to be sent in place of ordered item.');
          //insert new product if neccessary
          if CheckReplacemntProd(ReplProdCode, SellPackQty, SellPackPrice) = false then
          begin
            //display message for user to get replacement product details from supplier
            mmResponseDtls.Lines.Add('There are no details for this product in the database.');
            mmResponseDtls.Lines.Add('Please contact the supplier to obtain the necessary details.');
          end
          else
          begin
            //update line details
            //reduce order quantity of expected item to zero on both PO and SO
            with (PurchaseOrder.POLines[StrToInt(lineNo)-1]) do
            begin
              QuantityOrdered := 0;
            end;
            with (SalesOrder.OrderLines.Lines[StrToInt(lineNo)-1])do
            begin
              ActnTkn := 'C';
              OrdQty := 0;
            end;
            //add new line relating to replacement product
            lineNo := IntToStr(PurchaseOrder.AddLine(ReplProdCode, LineNo, StrToInt(OrdQty), StrToInt(DelQty), StrToInt(SaleUnit), StrToFloat(PackCost)));
            SalesOrder.OrderLines.Add(ReplProdCode, StrToInt(LineNo), StrToInt(OrdQty), StrToInt(SaleUnit), SellPackQty, StrToFloat(PackCost), SellPackPrice);
          end;
        end;
        if PriceDiffFlg = 'Y' then
        begin
          with PurchaseOrder.POLines[LineCount -1] do
          begin
            PurchasePrice := StrToFloat(PackCost);
            Discount := (((CostPrice - PurchasePrice)/CostPrice)*100);
          end;
          PriceDiffFlg := 'N';
        end;
      end;

      //AQD lines warn of split deliveries
      if Copy(RespLines[y], 0, 3) = 'AQD' then
      begin
        AnalyseAQDLine(RespLines[y], DelDate, DelLineQty);
        mmResponseDtls.Lines.Add(DelLineQty +' units to be despatched on ' + DelDate);
        with (PurchaseOrder.POLines[StrToInt(lineNo)-1]) do
        begin
          DateDelivExpected := StrToDate(DelDate);
        end;
      end;

      //DNB lines give PO line ref and error code specific to line item
      ErrCode := '';
      if Copy(RespLines[y], 0, 3) = 'DNB' then
      begin
        AnalyseDNBLine(RespLines[y], LineRef, ErrCode);
        if ErrCode = 'PDC' then
        begin
          //product discontinued no replacement to be sent
          mmResponseDtls.Lines.Add('Line No: '+ LineNo +' Product :'+ProdCode+ ' has been discontinued. No replacement will be sent.');
          with (PurchaseOrder.POLines[StrToInt(lineNo)-1]) do
          begin
            QuantityOrdered := 0;
          end;
          with (SalesOrder.OrderLines.Lines[StrToInt(lineNo)-1])do
          begin
            ActnTkn := 'C';
            OrdQty := 0;
          end;
        end
        else
        if ErrCode <> '' then
          mmResponseDtls.Lines.Add('Error Code: '+ ErrCode);
      end;

      //next line please
      y := y + 1;
    end;

    //if there are no ALD Lines then the order is being processed without ammendments
    if LineCount = 0 then
    begin
      mmResponseDtls.Lines.Add('Order being processed without any ammendments.');
    end;

  //if an update was required save PO to database and then free memory
    if bUpdatePO then
    begin
      PurchaseOrder.UpdateDBRecords(STPODM);
      SalesOrder.SOHeadStatus := 100;
      //Using this little bit of code because the UpdateDBRecords method doesn't actually update
      //the header details in the database just yet (only the lines) the header status is the only
      //thing that is changing in the header and so it's more expedient to use this bit of
      //code for the moment.
      with STSalesOrdDM.qryUpdSoStatus do
      begin
        ParamByName('Status').AsInteger := SalesOrder.SOHeadStatus;
        ParamByName('Sales_Order').AsInteger := SalesOrder.SONumber;
        ExecSQL;
      end;

      STSalesOrdDM.UpdateDBRecords(SalesOrder);
      PurchaseOrder.Free;
      SalesOrder.Free;
      STPODM.Free;
      STSalesOrdDM.Free;
    end;

  //delete response files
    mmResponseDtls.Lines.Add('-----------------------------------------------------------------------------------------------------------');

    RespLines.Clear;
    LineCount := 0;
    if bDeleteRespFile = true then
    begin
      RenameFile('C:\KCOMM\RESPONSE\SO\'+FileNames[x], 'C:\KCOMM\ARCHIVE\SO\'+FileNames[x]);
      DeleteFile('C:\KCOMM\RESPONSE\SO\'+FileNames[x]);
    end;
  end;
//end loop

//clean up variables
  FileNames.Clear;
  FileNames.Free;
end;

procedure TSTEDIPOrdFrm.btbtnPrintClick(Sender: TObject);
var
  Line: Integer;
  PrintText: TextFile;   {declares a file variable}
begin
  if PrintDialog1.Execute then
  begin
    AssignPrn(PrintText);   {assigns PrintText to the printer}
    Rewrite(PrintText);     {creates and opens the output file}
    Printer.Canvas.Font := mmResponseDtls.Font;  {assigns Font settings to the canvas}
    Printer.Canvas.Font.Size := mmResponseDtls.Font.Size + 3;
    Writeln(PrintText, '');
    Writeln(PrintText, 'Printout of the Response(s) to Kingfield Orders.');
    Writeln(PrintText, 'Printed on '+ DateToStr(Now()));
    Writeln(PrintText, '');
    Printer.Canvas.Font.Size := mmResponseDtls.Font.Size + 2;
    for Line := 0 to mmResponseDtls.Lines.Count - 1 do

      Writeln(PrintText, mmResponseDtls.Lines[Line]);	{writes the contents of the Memo1 to the printer object}
    CloseFile(PrintText); {Closes the printer variable}
  end;
end;

end.
