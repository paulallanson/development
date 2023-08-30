unit wtLUWTThickness;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, DBCtrls, DB, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTLUWTThickness = class(TForm)
    Label1: TLabel;
    dbtWorktopDesc: TDBText;
    dbgDetails: TDBGrid;
    BitBtn1: TBitBtn;
    btnPrices: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn4: TBitBtn;
    srclkpWTThickness: TDataSource;
    lkpWTThickness: TFDQuery;
    qryDelWTThick: TFDQuery;
    chkbxShowInactive: TCheckBox;
    qryUpdate: TFDQuery;
    lkpWTThicknessWorktop: TIntegerField;
    lkpWTThicknessThickness: TIntegerField;
    lkpWTThicknessinactive: TWideStringField;
    lkpWTThicknessThickness_mm: TWideStringField;
    lkpWTThicknessPrice_Pointer: TIntegerField;
    lkpWTThicknessUnit_Price: TCurrencyField;
    lkpWTThicknessUnit_Cost: TCurrencyField;
    lkpWTThicknessPrice_Unit_Description: TWideStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPricesClick(Sender: TObject);
    procedure tblWTThicknessBeforePost(DataSet: TDataSet);
    procedure srclkpWTThicknessDataChange(Sender: TObject; Field: TField);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure chkbxShowInactiveClick(Sender: TObject);
  private
    FWorktop: integer;
    { Private declarations }
    procedure CallMaintScreen(FuncMode: string);
    procedure Refresh;
    procedure DeleteWTThickness(TempCode: integer);
    procedure SetWorktop(const Value: integer);
  public
    property Worktop: integer read FWorktop write SetWorktop;
  end;

var
  frmWTLUWTThickness: TfrmWTLUWTThickness;

implementation

uses
  WTMaintWTThickness, wtDataModule, wtMain, System.UITypes;
  
{$R *.DFM}

procedure TfrmWTLUWTThickness.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    frmWTMaintWTThickness := TfrmWTMaintWTThickness.create(Application);
    frmWTMaintWTThickness.worktop := self.Worktop;
    if FuncMode <> 'A' then
    begin
      frmWTMaintWTThickness.PricePointer := srclkpWTThickness.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintWTThickness.SellPrice := srclkpWTThickness.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintWTThickness.CostPrice := srclkpWTThickness.dataset.fieldbyname('Unit_Cost').asfloat;
      frmWTMaintWTThickness.chkbxInactive.checked := (srclkpWTThickness.dataset.fieldbyname('inactive').asstring = 'Y');
    end
    else
    begin
      frmWTMaintWTThickness.PricePointer := 0;
      frmWTMaintWTThickness.SellPrice := 0.00;
      frmWTMaintWTThickness.CostPrice := 0.00;
    end;
    frmWTMaintWTThickness.lblWorktop.caption := dbtWorktopDesc.Caption;
    
    frmWTMaintWTThickness.FunctionMode := FuncMode;
    frmWTMaintWTThickness.showmodal;
    icode := frmWTMaintWTThickness.PricePointer;
    Refresh;
    dbgDetails.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintWTThickness.free;
  end;
end;

procedure TfrmWTLUWTThickness.BitBtn1Click(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUWTThickness.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgDetails.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteWTThickness(PPointer);
      Refresh;
    end;
end;

procedure TfrmWTLUWTThickness.Refresh;
var
  sText: string;
begin
  with lkpWTThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      if not chkbxShowInactive.Checked then
        parambyname('inactive').Asstring:= 'N'
      else
        parambyname('inactive').Asstring:= 'Y';
      parambyname('Worktop').AsInteger := self.Worktop;
      open;
    end;
end;
procedure TfrmWTLUWTThickness.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfrmWTLUWTThickness.btnPricesClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUWTThickness.tblWTThicknessBeforePost(DataSet: TDataSet);
begin
(*	dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  tblWTThickness.FieldbyName('Price_Pointer').asinteger := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := tblWTThickness.FieldbyName('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	dtmdlWorktops.qryAddPointer.ExecSQl;

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := tblWTThickness.Fieldbyname('Price_Pointer').asinteger;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := 0.00;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := date;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.Operator;
*)
end;

procedure TfrmWTLUWTThickness.DeleteWTThickness(TempCode: integer);
begin
  with qryDelWTThick do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;

      try
        execsql;
        dtmdlWorktops.DeletePrices(TemPCode);
        dtmdlWorktops.DeletePointer(TemPCode);
      except
        with qryUpdate do
          begin
            close;
            parambyname('Price_Pointer').asinteger := TempCode;
            ParamByName('inActive').asstring := 'Y';
            execSQL;
          end;
      end;
    end;
end;

procedure TfrmWTLUWTThickness.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTLUWTThickness.srclkpWTThicknessDataChange(Sender: TObject;
  Field: TField);
begin
  btnPrices.enabled := (srclkpWTThickness.DataSet.recordcount > 0);
  btnDelete.enabled := (srclkpWTThickness.DataSet.recordcount > 0);
end;

procedure TfrmWTLUWTThickness.dbgDetailsDblClick(Sender: TObject);
begin
  if dbgDetails.DataSource.DataSet.fieldbyname('Thickness_mm').asstring <> '' then
    btnPricesClick(self);
end;

procedure TfrmWTLUWTThickness.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if(dbgDetails.datasource.dataset.fieldByName('inactive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := Font.Style + [fsStrikeout];
      (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TfrmWTLUWTThickness.chkbxShowInactiveClick(Sender: TObject);
begin
  Refresh;
end;

end.
