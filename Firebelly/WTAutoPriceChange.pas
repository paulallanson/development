unit WTAutoPriceChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, ComCtrls,
  CRControls, DBCtrls, QrCtrls, Mask, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTAutoPriceChange = class(TForm)
    rdgrpPriceChange: TRadioGroup;
    lblPriceChange: TLabel;
    qryWorktop: TFDQuery;
    Label2: TLabel;
    qryPrice: TFDQuery;
    BasisGroup: TRadioGroup;
    qryEdge: TFDQuery;
    qryCutOut: TFDQuery;
    qryAdd: TFDQuery;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    dtpckEffective: TDateTimePicker;
    edtChange: TCREditFloat;
    rdGrpWTGroups: TRadioGroup;
    grpbxWTGroups: TGroupBox;
    Label3: TLabel;
    dblkpWTGroup: TDBLookupComboBox;
    qryWTGroups: TFDQuery;
    dtsWTGroup: TDataSource;
    Label4: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    qryMaterial: TFDQuery;
    dtsMaterial: TDataSource;
    qryWTGPrices: TFDQuery;
    grpbxThickness: TGroupBox;
    Label1: TLabel;
    dblkpthickness: TDBLookupComboBox;
    qryThickness: TFDQuery;
    dtsThickness: TDataSource;
    Label5: TLabel;
    edtTime: TMaskEdit;
    procedure EffDateEditChange(Sender: TObject);
    procedure edtChangeChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure rdGrpWTGroupsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdgrpPriceChangeClick(Sender: TObject);
    procedure BasisGroupClick(Sender: TObject);
		procedure EnableUpdate(sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure edtTimeExit(Sender: TObject);
  private
    { Private declarations }
    procedure RunWTGroups;
		procedure RunWorktops;
		procedure RunEdgeProfiles;
		procedure RunCutOuts;
		procedure RunAdditions;
		procedure PerformUpdate(iPricepointer: integer);
  public
    { Public declarations }
  end;

var
  frmWTAutoPriceChange: TfrmWTAutoPriceChange;

implementation

uses UITypes, wtDataModule, wtMain;

{$R *.DFM}

procedure TfrmWTAutoPriceChange.RunWTGroups;
begin
	With qryWTGPrices do
  	begin
     	close;
      parambyname('Material_Type').AsInteger := dblkpMaterialType.keyvalue;
      if rdgrpWTGroups.ItemIndex = 0 then
        parambyname('Worktop_Group').AsInteger := 0
      else
        parambyname('Worktop_Group').AsInteger := dblkpWTGroup.KeyValue;
      if basisgroup.ItemIndex <> 2 then
        parambyname('thickness').AsInteger := 0
      else
        parambyname('thickness').AsInteger := dblkpthickness.KeyValue;
      open;

      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTAutoPriceChange.RunWorktops;
var
  iCount: integer;
begin
	With qryWorktop do
  	begin
     	close;
      parambyname('Material_Type').AsInteger := dblkpMaterialType.keyvalue;
      if rdgrpWTGroups.ItemIndex = 0 then
        parambyname('Worktop_Group').AsInteger := 0
      else
        parambyname('Worktop_Group').AsInteger := dblkpWTGroup.KeyValue;
      if basisgroup.ItemIndex <> 2 then
        parambyname('thickness').AsInteger := 0
      else
        parambyname('thickness').AsInteger := dblkpthickness.KeyValue;
      open;
      iCount := recordcount;
      
      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTAutoPriceChange.RunEdgeProfiles;
begin
	With qryEdge do
  	begin
     	close;
      parambyname('Material_Type').AsInteger := dblkpMaterialType.keyvalue;
      open;

      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTAutoPriceChange.RunCutOuts;
begin
	With qryCutOut do
  	begin
     	close;
      parambyname('Material_Type').AsInteger := dblkpMaterialType.keyvalue;
      open;

      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTAutoPriceChange.EnableUpdate(sender: TObject);
begin
	if (edtChange.text <> '') and
      (dblkpMaterialtype.KeyValue <> 0) then
     btnOK.enabled := true;
end;

procedure TfrmWTAutoPriceChange.RunAdditions;
begin
	With qryAdd do
  	begin
     	close;
      open;

      first;
      while eof <> true do
        begin
					PerformUpdate(fieldbyname('Price_pointer').asinteger);
          next;
        end;
    end;
end;

procedure TfrmWTAutoPriceChange.PerformUpdate(iPricepointer: integer);
var
  sText: string;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
	with qryPrice do
  	begin
     	close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;
      parambyname('Price_pointer').asinteger := iPricepointer;
      open;
      first;
      if recordcount = 0 then exit;
    end;

  DecodeTime(now, Hour, Min, Sec, MSec);

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := incSecond(strtodatetime(datetostr(dtpckEffective.date)+ ' ' + timetostr(strtoTime(edtTime.text))), Sec);

  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := qryPrice.fieldbyname('Price_Basis').asstring;
  if BasisGroup.itemindex = 0 then
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := qryPrice.fieldbyname('Unit_Price').asfloat * (1+(StrToFloatDef(edtChange.Text, 0, FormatSettings)/100))
  else
  if BasisGroup.itemindex = 1 then
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := qryPrice.fieldbyname('Unit_Price').asfloat * (1-(StrToFloatDef(edtChange.Text, 0, FormatSettings)/100))
  else
  	dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := StrToFloatDef(edtChange.Text, 0, FormatSettings);
    
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := qryPrice.fieldbyname('Unit_Cost').asfloat;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := qryPrice.fieldbyname('Price_Unit').asinteger;
	dtmdlWorktops.qryAddPrice.execSQL;
end;

procedure TfrmWTAutoPriceChange.EffDateEditChange(Sender: TObject);
begin
  EnableUpdate(self);
end;

procedure TfrmWTAutoPriceChange.edtChangeChange(Sender: TObject);
begin
  EnableUpdate(self);
end;

procedure TfrmWTAutoPriceChange.btnOKClick(Sender: TObject);
begin
if MessageDlg('Confirm that you wish to make these price changes?',
    mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    exit;
  try
    if rdgrpPriceChange.itemindex = 0 then
      begin
        RunWTGroups;
        RunWorktops;
      end
    else
    if rdgrpPriceChange.itemindex = 1 then
      begin
        RunWTGroups;
        RunWorktops;
      end
    else
    if rdgrpPriceChange.itemindex = 2 then
      RunEdgeProfiles
    else
    if rdgrpPriceChange.itemindex = 3 then
      RunCutOuts
    else
    if rdgrpPriceChange.itemindex = 4 then
      RunAdditions
    else
    if rdgrpPriceChange.itemindex = 5 then
      begin
        RunWTGroups;
        RunWorktops;
        RunEdgeProfiles;
        RunCutOuts;
//        RunAdditions;
      end;
    MessageDlg('Global price change has completed successfully', mtInformation,[mbOk], 0);
//    close;
    edtChange.Text := '';
    btnOK.Enabled := false;
  except
    MessageDlg('Global price change has encountered an error', mterror,[mbOk], 0);
  end;
end;

procedure TfrmWTAutoPriceChange.rdGrpWTGroupsClick(Sender: TObject);
begin
  grpbxWTGroups.Visible := (rdGrpWTGroups.itemindex = 1)
end;

procedure TfrmWTAutoPriceChange.FormActivate(Sender: TObject);
begin
  dtpckEffective.Date := date;

  with qryMaterial do
    begin
      close;
      open;
    end;
  dblkpMaterialType.keyvalue := 0;

  with qryThickness do
    begin
      close;
      open;
      first;
      if recordcount > 0 then
        dblkpThickness.KeyValue := fieldbyname('Thickness').asinteger;
    end;
end;

procedure TfrmWTAutoPriceChange.rdgrpPriceChangeClick(Sender: TObject);
begin
  rdgrpWtGroups.visible := (rdgrpPriceChange.itemindex <= 1);
  grpbxWtGroups.visible := (rdgrpWtGroups.itemindex = 1) and (rdgrpPriceChange.itemindex <= 1);

  if rdgrpPriceChange.itemindex = 5 then
    rdgrpWtGroups.ItemIndex := 0;

  grpbxThickness.Visible := (basisgroup.ItemIndex = 2) and (rdgrpPriceChange.itemindex <= 1);
end;

procedure TfrmWTAutoPriceChange.BasisGroupClick(Sender: TObject);
begin
  case BasisGroup.ItemIndex of
  0,1: lblPriceChange.caption := 'Price Change %';
  2:    lblPriceChange.caption := 'New Price'
  end;
  grpbxThickness.Visible := (basisgroup.ItemIndex = 2) and (rdgrpPriceChange.itemindex < 2);
end;

procedure TfrmWTAutoPriceChange.dblkpMaterialTypeClick(Sender: TObject);
begin
  with qryWTGroups do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMaterialType.KeyValue;
      open;
      first;
      if recordcount > 0 then
        dblkpWTGroup.KeyValue := fieldbyname('Worktop_Group').asinteger;
    end;

  EnableUpdate(self);
end;

procedure TfrmWTAutoPriceChange.edtTimeExit(Sender: TObject);
var
  NewTime: TDateTime;
begin
  if trim((Sender as TMaskEdit).text) = '' then
    exit;
  try
    NewTime := StrToTime((Sender as TMaskEdit).Text);
  except
    begin
      MessageDlg('Invalid Time', mtError, [mbOk], 0);
      (Sender as TMaskEdit).SetFocus;
      Exit;
    end;
  end;
end;

end.
