unit STMntPOrdAdd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TSTMntPOrdAddFrm = class(TForm)
    PartsDataSource: TDataSource;
    PartsDBGrid: TDBGrid;
    SearchGroupBox: TGroupBox;
    CodeEdit: TEdit;
    DescrEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    GridTimer: TTimer;
    NoOfItemsLabel: TLabel;
    CloseBitBtn: TBitBtn;
    SelectBitBtn: TBitBtn;
    GetPartsSQL: TQuery;
    SuppRadioGroup: TRadioGroup;
    StoreCheckBox: TCheckBox;
    GetPOPartsSQL: TQuery;
    GetSOPartsSQL: TQuery;
    GetDiscRateSQL: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure ShowGrid(Sender: TObject);
    procedure CodeEditChange(Sender: TObject);
    procedure DescrEditChange(Sender: TObject);
    procedure GridTimerTimer(Sender: TObject);
    procedure FindInGrid(TempPart: string);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure WriteGridSQL(Sender: TObject);
    procedure ShowAllCheckBoxClick(Sender: TObject);
    procedure SuppBitBtnClick(Sender: TObject);
    procedure PartsDBGridCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure ShowCount(Sender: TObject);
    procedure SuppRadioGroupClick(Sender: TObject);
    procedure StoreCheckBoxClick(Sender: TObject);
    procedure WriteSQL(Sender: TObject);
    function GetDiscRate(TempSupp: integer; TempPart: string) :real;
    procedure PartsDBGridDblClick(Sender: TObject);
  private
  public
    bOK, bDontShowGrid, bStore_Ord, bAllow_Disc, bIsSample: ByteBool;
    sSuppDescr, sStoreFromName,
                 sStoreName: string;
    iStore, iStoreFrom, iStoreTypeFrom, iStore_Type, iSuppl, iSupplBranch, iSelQty,
            iTransType, iIntSelCode, iAllocPFJ, iPackSize: Integer ;
    fCost, fDiscount: Real ;
    fTempDisc, fOrigCost: Real;
    fNotes: string;
  end;

var
  STMntPOrdAddFrm: TSTMntPOrdAddFrm;

implementation

uses pbDatabase, STMntPOrdQty, StMntPrtSupp, CCSCommon;

{$R *.DFM}

procedure TSTMntPOrdAddFrm.FormActivate(Sender: TObject);
begin
  bOK := False;
  bAllow_Disc := False;
  WriteSQL(Self) ;
  bDontShowGrid := False ;
  With dmBroker.qrycompany do
       begin
       Close ;
       Open ;
       First ;
       GridTimer.Interval := FieldByName('Search_Timer').AsInteger ;
       end;
  PartsDBGrid.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect] ;
  ShowGrid(Self);
  ShowCount(Self) ;
  CodeEdit.SetFocus ;
end;

procedure TSTMntPOrdAddFrm.ShowGrid(Sender: TObject);
begin
  NoOfItemsLabel.Caption := 'Please Wait....' ;
  NoOfItemsLabel.Refresh;
  with GetPartsSQL do
          begin
          Close;
          WriteGridSQL(Self) ;
          Open;
          NoOfItemsLabel.Caption := IntToStr(RecordCount) + ' products shown';
          ShowCount(Self) ;
          end;
  ShowCount(Self) ;
end;

procedure TSTMntPOrdAddFrm.CodeEditChange(Sender: TObject);
begin
  GridTimer.Enabled := False;
  If bDontShowGrid = False then
     GridTimer.Enabled := True;
end;

procedure TSTMntPOrdAddFrm.DescrEditChange(Sender: TObject);
begin
  GridTimer.Enabled := False;
  GridTimer.Enabled := True;
end;

procedure TSTMntPOrdAddFrm.GridTimerTimer(Sender: TObject);
begin
  GridTimer.Enabled := False;
  ShowGrid(Self);
end;

procedure TSTMntPOrdAddFrm.FindInGrid(TempPart: string);
begin
 If GetPartsSQL.Active = False then
                          exit ;   
  PartsDataSource.Enabled := False;
  with GetPartsSQL do
  begin
    First;
    while GetPartsSQL.FieldByName('Part').AsString <> TempPart do
    begin
      if EOF then
      begin
        First;
        Break;
      end;
      Next;
    end;
  end;
  PartsDataSource.Enabled := True;
end;

procedure TSTMntPOrdAddFrm.SelectBitBtnClick(Sender: TObject);
Var
bTempOK, bSample: ByteBool ;
iTempQty: Integer ;
fTempCost, fTempOrigCost: Real ;
iTempPFJ: Integer;
iTempPackSize: Integer ;
sNotes: string;
begin
{Ask what order levels to apply to the new parts} ;
fTempDisc := 0.00;
if not bStore_Ord then
  begin
  fTempDisc := GetDiscRate(iSuppl,PartsDBGrid.DataSource.DataSet.FieldByName('Part').AsString);
  end;
STMntPOrdQtyFrm := TSTMntPOrdQtyFrm.Create(Self) ;
Try
   STMntPOrdQtyFrm.bStore_Ord := bStore_Ord ;
   STMntPOrdQtyFrm.QtyEdit.Text := '1' ;
   STMntPOrdQtyFrm.fCost_Price := PartsDBGrid.DataSource.DataSet.FieldByName('Part_Purchase_Price').AsFloat ;
      STMntPOrdQtyFrm.fOrig_Cost := PartsDBGrid.DataSource.DataSet.FieldByName('Part_Purchase_Price').AsFloat ;
   if fTempDisc > 0 then
    STMntPordQtyFrm.fCost_price := ((STMntPOrdQtyFrm.fCost_Price)-((STMntPOrdQtyFrm.fCost_Price) * (fTempDisc/100)));
   STMntPOrdQtyFrm.bAllow_Cost := PartsDBGrid.SelectedRows.Count = 1 ;
   if ftempDisc > 0 then
    STMntPordQtyFrm.EdtDiscount.Text := FormatFloat('0.00',ftempDisc)
   else
    STMntPordQtyFrm.EdtDiscount.Text := '0.00';
   STMntPOrdQtyFrm.PackSizeEdit.Text := IntToStr(PartsDBGrid.DataSource.DataSet.FieldByName('Purch_Pack_Quantity').AsInteger) ;
   STMntPOrdQtyFrm.sPart := PartsDBGrid.DataSource.DataSet.FieldByName('Part').AsString ;
   STMntPOrdQtyFrm.iStore := iStore ;
   STMntPOrdQtyFrm.iTransType := iTransType ;
   STMntPOrdQtyFrm.sStoreName := sStoreName ;
   STMntPOrdQtyFrm.bAllow_Disc := bAllow_Disc;
   STMntPOrdQtyFrm.ShowModal ;
   bTempOK := STMntPOrdQtyFrm.bOK ;
   iTempPackSize := StrToInt(STMntPOrdQtyFrm.PackSizeEdit.Text) ;
   iTempQty := InpToSing(STMntPOrdQtyFrm.QtyEdit.Text,iTempPackSize) ;
   fTempCost := STMntPOrdQtyFrm.fCost_Price ;
   fTempOrigCost := STMntPordQtyFrm.fOrig_Cost;
   iTempPFJ := STMntPOrdQtyFrm.iAllocPFJ ;
   fTempDisc := StrToFloat(STMntPordQtyFrm.EdtDiscount.Text);
   sNotes := STMntPOrdQtyFrm.memNotes.text;
   bSample := STMntPOrdQtyFrm.chkbxSample.checked;
Finally
   STMntPOrdQtyFrm.Free ;
   end;
If bTempOK then
   begin
   bOK := True;
   iAllocPFJ := iTempPFJ ;
   fCost := fTempCost ;
   fOrigCost := fTempOrigCost;
   iSelQty := iTempQty ;
   iPackSize := iTempPackSize ;
   fDiscount := fTempDisc;
   fNotes := sNotes;
   bIsSample := bSample;
   Close ;
   end;
end;

procedure TSTMntPOrdAddFrm.WriteGridSQL(Sender: TObject);
begin
With GetPartsSQL do
     begin
     Close ;
     WriteSQL(Self) ;
     {ParamByName('Store_Type').AsString := sStore_Type};
     If bStore_Ord then
        begin
        ParamByName('From_Part_Store').AsInteger := iStoreFrom ;
        {ParamByName('From_Part_Store_Type').AsInteger := iStoreTypeFrom}  ;
        end
     else
        begin 
        ParamByName('Supplier').AsInteger := iSuppl ;
        ParamByName('Branch_No').AsInteger := iSupplBranch ;
        end;
     ParamByName('Pref_Source').AsInteger := SuppRadioGroup.ItemIndex * 1000 ;
     Open ;
     end;
end;

procedure TSTMntPOrdAddFrm.ShowAllCheckBoxClick(Sender: TObject);
begin
ShowGrid(Self) ;
end;

procedure TSTMntPOrdAddFrm.SuppBitBtnClick(Sender: TObject);
begin
  STMntPrtSuppFrm := TSTMntPrtSuppFrm.Create(Self);
  try
    STMntPrtSuppFrm.sSelPart := GetPartsSQL.FieldByName('Part').AsString;
    STMntPrtSuppFrm.sSelDescr := GetPartsSQL.FieldByName('Part_Description').AsString;
    STMntPrtSuppFrm.ShowModal;
  finally
    STMntPrtSuppFrm.Free;
  end;
end;

procedure TSTMntPOrdAddFrm.PartsDBGridCellClick(Column: TColumn);
begin
ShowCount(Self) ;
end;

procedure TSTMntPOrdAddFrm.FormCreate(Sender: TObject);
begin
bOK := False;
bDontShowGrid := False;
iStore_Type := 0 ;
iSuppl := 0 ;
iSupplBranch := 0 ;
sSuppDescr := '' ;
end;

procedure TSTMntPOrdAddFrm.ShowCount(Sender: TObject);
begin
Try
    NoOfItemsLabel.Caption := IntToStr(GetPartsSQL.RecordCount) + ' products, ' +
                          IntToStr(PartsDBGrid.SelectedRows.Count) + ' selected.'
Except
    NoOfItemsLabel.Caption := 'Narrow the search' ;
    end;
SelectBitBtn.Enabled := (PartsDBGrid.SelectedRows.Count > 0) ;
end;
                          
procedure TSTMntPOrdAddFrm.SuppRadioGroupClick(Sender: TObject);
begin
ShowGrid(Self) ;
end;

procedure TSTMntPOrdAddFrm.StoreCheckBoxClick(Sender: TObject);
begin
ShowGrid(Self) ;
end;

procedure TSTMntPOrdAddFrm.WriteSQL(Sender: TObject);
Var
ItempCount, iTempPos: Integer ;
sTempStocked: String ;
begin
{Re-Write the SQL } ;
  If bStore_Ord then
     begin
     GetPartsSQL.SQL := GetSOPartsSQL.SQL ;
     SuppRadioGroup.Caption := sStoreFromName ;
     end
  else
     begin
     GetPartsSQL.SQL := GetPOPartsSQL.SQL ;
     SuppRadioGroup.Caption := sSuppDescr ;
     end;
{MS-Access Jet Driver can't cope with parameters in nested SQLs so the following lines} ;
{substitute the XWSX and XUCX strings in the SQL code for the WORKSTATION and USERNAME} ;
{respectively};
For iTempCount := 0 to GetPartsSQL.SQL.Count - 1 do
    begin
    iTempPos := Pos('XUCX', GetPartsSQL.SQL[iTempCount]) ;
    If iTempPos > 0 then
       GetPartsSQL.SQL[iTempCount] := Copy(GetPartsSQL.SQL[iTempCount],1,iTempPos -1) +
                                                  IntToStr(iIntSelCode) +
                                              Copy(GetPartsSQL.SQL[iTempCount],iTempPos + 4, 9999) ;
    iTempPos := Pos('XSTX', GetPartsSQL.SQL[iTempCount]) ;
    If iTempPos > 0 then
       GetPartsSQL.SQL[iTempCount] := Copy(GetPartsSQL.SQL[iTempCount],1,iTempPos -1) +
                                                  IntToStr(iStore_Type) +
                                              Copy(GetPartsSQL.SQL[iTempCount],iTempPos + 4, 9999) ;
    iTempPos := Pos('XPAX', GetPartsSQL.SQL[iTempCount]) ;
    If iTempPos > 0 then
       GetPartsSQL.SQL[iTempCount] := Copy(GetPartsSQL.SQL[iTempCount],1,iTempPos -1) +
                                                  '''' + CodeEdit.Text + '%''' +
                                              Copy(GetPartsSQL.SQL[iTempCount],iTempPos + 4, 9999) ;
    iTempPos := Pos('XPDX', GetPartsSQL.SQL[iTempCount]) ;
    If iTempPos > 0 then
       GetPartsSQL.SQL[iTempCount] := Copy(GetPartsSQL.SQL[iTempCount],1,iTempPos -1) +
                                                  '''' + DescrEdit.Text + '%''' +
                                              Copy(GetPartsSQL.SQL[iTempCount],iTempPos + 4, 9999) ;
    If StoreCheckBox.Checked then
        sTempStocked := 'Y'
    else
        sTempStocked := 'N' ;
    iTempPos := Pos('XMSX', GetPartsSQL.SQL[iTempCount]) ;
    If iTempPos > 0 then
       GetPartsSQL.SQL[iTempCount] := Copy(GetPartsSQL.SQL[iTempCount],1,iTempPos -1) +
                                                  sTempStocked +
                                                  Copy(GetPartsSQL.SQL[iTempCount],iTempPos + 4, 9999) ;
    end;
end;

function TSTMntPOrdAddFrm.GetDiscRate(TempSupp: integer;
  TempPart: string): real;
begin
Result := 0.00;
bAllow_Disc := False;
With GetDiscRateSQL do
  begin
    Close;
    ParamByName('Supplier').AsInteger := TempSupp;
    ParamByName('Part').AsString := TempPart;
    Open;
    if not EOF then
      begin
        Result := FieldByName('Discount').AsFloat;
        bAllow_Disc := True;
      end;
    end;
end;

procedure TSTMntPOrdAddFrm.PartsDBGridDblClick(Sender: TObject);
begin
  with PartsDBGrid do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectBitBtnClick(self);
      except
      end;
    end;
end;

end.

