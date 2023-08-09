unit WTMaintWTGPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, CRControls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintWTGPrices = class(TForm)
    dblkpWorktopGroup: TDBLookupComboBox;
    Label1: TLabel;
    dblkpThickness: TDBLookupComboBox;
    edtmnyCost: TCREditMoney;
    edtmnySell: TCREditMoney;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    lkpThickness: TFDQuery;
    srclkpThickness: TDataSource;
    lkpWTGroup: TFDQuery;
    stclkpWTGroup: TDataSource;
    qryWTThickness: TFDQuery;
    Button1: TButton;
    qryGetGroupWT: TFDQuery;
    qryCheckWTThickness: TFDQuery;
    qryAddWTThickness: TFDQuery;
    qryAdd: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpWorktopGroupClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FSellPrice: currency;
    FCostPrice: currency;
    FPricePointer: integer;
    FFunctionMode: string;
    FMaterialType: integer;
    FWTGroup: integer;
    Fthickness: integer;
    procedure SetCostPrice(const Value: currency);
    procedure SetFunctionMode(const Value: string);
    procedure SetPricePointer(const Value: integer);
    procedure SetSellPrice(const Value: currency);
    procedure SetMaterialType(const Value: integer);
    procedure AddNewThicknessPrices;
    procedure AddWorktopPrices(TempPrice: integer);
    procedure UpdateWorktopPrices;
    procedure SetWTGroup(const Value: integer);
    procedure Setthickness(const Value: integer);
    { Private declarations }
  public
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property CostPrice: currency read FCostPrice write SetCostPrice;
    property SellPrice: currency read FSellPrice write SetSellPrice;
    property thickness: integer read Fthickness write Setthickness;
    property PricePointer: integer read FPricePointer write SetPricePointer;
    property MaterialType: integer read FMaterialType write SetMaterialType;
    property WTGroup: integer read FWTGroup write SetWTGroup;
  end;

var
  frmWTMaintWTGPrices: TfrmWTMaintWTGPrices;

implementation

uses wtDataModule, wtMain, WtLUWTGroupPrices, wtLUWTGroup;

{$R *.dfm}

{ TfrmWTMaintWTGPrices }

procedure TfrmWTMaintWTGPrices.SetCostPrice(const Value: currency);
begin
  FCostPrice := Value;
  edtmnyCost.Text := formatfloat('0.00',FCostPrice);
end;

procedure TfrmWTMaintWTGPrices.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
  if Value = 'C' then
    Begin
      dblkpWorktopGroup.Enabled := false;
      dblkpThickness.Enabled := false;
    end;
end;

procedure TfrmWTMaintWTGPrices.SetPricePointer(const Value: integer);
begin
  FPricePointer := Value;
end;

procedure TfrmWTMaintWTGPrices.SetSellPrice(const Value: currency);
begin
  FSellPrice := Value;
  edtmnySell.Text := formatfloat('0.00',FSellPrice);
end;

procedure TfrmWTMaintWTGPrices.btnOKClick(Sender: TObject);
var
  bUpdate: boolean;
begin
  if FunctionMode = 'A' then
    begin
	    dtmdlWorktops.qryNewPrice.Close;
      dtmdlWorktops.qryNewPrice.Open;
      PricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	    dtmdlWorktops.qryAddPointer.Close;
      dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	    dtmdlWorktops.qryAddPointer.ExecSQl;

      with qryAdd do
        begin
          Close;
          parambyname('Material_Type').asinteger := self.MaterialType;
          parambyname('Worktop_Group').asinteger := dblkpWorktopGroup.KeyValue;
          parambyname('Thickness').asinteger := dblkpThickness.KeyValue;

          paramByName('Price_Pointer').Asinteger := PricePointer;
          ExecSQL;
        end;

	    dtmdlWorktops.qryAddPrice.Close;
      dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
      dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
      dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
      dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
      dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
      dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
      dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
	    dtmdlWorktops.qryAddPrice.execSQL;

      if MessageDlg('Do you want to update the worktops in this group with the new thickness prices?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          bUpdate := true
        else
          bUpdate := false;

      if bUpdate then
        AddNewThicknessPrices;
    end
  else
    begin
      if (StrToFloatDef(edtmnySell.text, 0, FormatSettings) <> SellPrice) or
         (StrToFloatDef(edtmnyCost.text, 0, FormatSettings) <> CostPrice) then
      begin
        if MessageDlg('Do you want to update the associated worktops with the new prices?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            bUpdate := true
          else
            bUpdate := false;
	      dtmdlWorktops.qryAddPrice.Close;
        dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
        dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
        dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
        dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
        dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
        dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
        dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
        dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
	      dtmdlWorktops.qryAddPrice.execSQL;

        if bUpdate then
          UpdateWorktopPrices;
      end;
    end;
end;

procedure TfrmWTMaintWTGPrices.UpdateWorktopPrices;
var
  iPrice: integer;
begin
  with qryWTThickness do
    begin
      close;
      parambyname('Material_type').AsInteger := MaterialType;
      parambyname('Worktop_Group').asinteger := dblkpWorktopGroup.keyvalue;
      parambyname('Thickness').asinteger := dblkpThickness.keyvalue;
      open;
      first;
      while not eof do
        begin
          iPrice := fieldbyname('Price_Pointer').asinteger;
          AddWorktopPrices(iPrice);
          next;
        end;
    end;
end;

procedure TfrmWTMaintWTGPrices.AddWorktopPrices(TempPrice: integer);
begin
	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := TempPrice;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := StrToFloatDef(edtmnySell.text, 0, FormatSettings);
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := StrToFloatDef(edtmnyCost.text, 0, FormatSettings);
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.operator;
  dtmdlWorktops.qryAddPrice.execSQL;
end;

procedure TfrmWTMaintWTGPrices.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
    with lkpWTGroup do
      begin
        close;
        parambyname('Material_Type').asinteger := MaterialType;
        parambyname('Worktop_Group').asinteger := WTGroup;
        open;
      end;
    dblkpWorktopGroup.KeyValue := 0;
    dblkpThickness.KeyValue := 0;
    end
  else
    begin
      with lkpThickness do
      begin
        close;
        parambyname('Worktop_group').asinteger := 0;
        parambyname('material_type').asinteger := 0;
        parambyname('Thickness').asinteger := Thickness;
        open;
      end;

      with lkpWTGroup do
      begin
        close;
        parambyname('Material_Type').asinteger := MaterialType;
        parambyname('Worktop_Group').asinteger := WTGroup;
        open;
      end;
      dblkpWorktopGroup.keyvalue := frmwtLUWTGroupPrices.dbgDetails.datasource.dataset.fieldbyname('worktop_group').asinteger;
      dblkpThickness.keyvalue := frmwtLUWTGroupPrices.dbgDetails.datasource.dataset.fieldbyname('thickness').asinteger;
    end;
 enableok(self);

end;

procedure TfrmWTMaintWTGPrices.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpThickness.keyvalue <> 0) and
                    (dblkpWorktopGroup.keyvalue <> 0);
end;

procedure TfrmWTMaintWTGPrices.dblkpWorktopGroupClick(Sender: TObject);
begin
  with lkpThickness do
    begin
      close;
      parambyname('Material_Type').asinteger := MaterialType;
      parambyname('Worktop_Group').asinteger := dblkpWorktopGroup.keyvalue;
      parambyname('Thickness').asinteger := Thickness;
      open;
      dblkpThickness.keyvalue := 0;
    end;
  enableOK(self);
end;

procedure TfrmWTMaintWTGPrices.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintWTGPrices.SetWTGroup(const Value: integer);
begin
  FWTGroup := Value;
end;

procedure TfrmWTMaintWTGPrices.Setthickness(const Value: integer);
begin
  Fthickness := Value;
end;

procedure TfrmWTMaintWTGPrices.Button1Click(Sender: TObject);
begin
  frmWTLuWTGroup := TfrmWTLuWTGroup.create(self);
  try
    frmWTLuWTGroup.showmodal;
    with lkpWTGroup do
      begin
        close;
        parambyname('Material_Type').asinteger := MaterialType;
        parambyname('Worktop_Group').asinteger := WTGroup;
        open;
      end;
      dblkpWorktopGroup.keyvalue := frmwtLUWTGroupPrices.dbgDetails.datasource.dataset.fieldbyname('worktop_group').asinteger;
  finally
    frmWTLuWTGroup.free
  end;

end;

procedure TfrmWTMaintWTGPrices.AddNewThicknessPrices;
var
  iPricePointer: integer;
begin
  with qryGetGroupWT do
    begin
      close;
      parambyname('Material_type').AsInteger := MaterialType;
      parambyname('Worktop_Group').asinteger := dblkpWorktopGroup.keyvalue;
      open;
      first;
      while not eof do
        begin
          {Get the thickness to be added and check if it already exists for this worktop}
          qryCheckWTThickness.close;
          qryCheckWTThickness.parambyname('Worktop').asinteger := fieldbyname('Worktop').asinteger;
          qryCheckWTThickness.parambyname('Thickness').asinteger := srclkpThickness.DataSet.fieldbyname('Thickness').AsInteger;
          qryCheckWTThickness.open;
          qryCheckWTThickness.first;
          if qryCheckWTThickness.recordcount = 0 then
            begin
              {Get a new price pointer}
	            dtmdlWorktops.qryNewPrice.Close;
              dtmdlWorktops.qryNewPrice.Open;
              iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	            dtmdlWorktops.qryAddPointer.Close;
              dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
              dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	            dtmdlWorktops.qryAddPointer.ExecSQl;

              AddWorktopPrices(iPricePointer);

              qryAddWTThickness.close;
              qryAddWTThickness.parambyname('Worktop').asinteger := qryGetGroupWT.fieldbyname('Worktop').asinteger;
              qryAddWTThickness.parambyname('Thickness').asinteger := srclkpThickness.DataSet.fieldbyname('Thickness').AsInteger;
              qryAddWTThickness.parambyname('Price_pointer').asinteger := iPricePointer;
              qryAddWTThickness.execsql;
            end;
          next;
        end;
    end;
end;

end.
