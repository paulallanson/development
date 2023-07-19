unit wtMaintMaterialType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, QrCtrls, jpeg, ExtDlgs,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,
  ImgList, ComCtrls, ToolWin, Grids, DBGrids, DB, System.ImageList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWtMaintMaterialType = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    chkbxShowOnline: TCheckBox;
    imglstButtons: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label7: TLabel;
    edtImagePath: TEdit;
    Button3: TButton;
    Panel1: TPanel;
    imgWorktop: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    qryUpstands: TFDQuery;
    dtsUpstands: TDataSource;
    qryDelUpstand: TFDQuery;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    dbgUpstands: TDBGrid;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label22: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    ToolBar1: TToolBar;
    btnWeightAdd: TToolButton;
    btnWeightChange: TToolButton;
    btnWeightDelete: TToolButton;
    dbgWeights: TDBGrid;
    Label6: TLabel;
    qryweights: TFDQuery;
    dtsWeights: TDataSource;
    qryDelWeight: TFDQuery;
    edtDescription: TEdit;
    edtShortDescription: TEdit;
    memLongDescription: TMemo;
    edtSalesNominal: TEdit;
    edtPurchaseNominal: TEdit;
    edtSalesNominalRetail: TEdit;
    edtPurchaseNominalRetail: TEdit;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryDelete: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    TabSheet5: TTabSheet;
    procedure btnOKClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure dbgUpstandsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgUpstandsDblClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnWeightAddClick(Sender: TObject);
    procedure btnWeightChangeClick(Sender: TObject);
    procedure btnWeightDeleteClick(Sender: TObject);
    procedure dbgWeightsDblClick(Sender: TObject);
  private
    FFunctionMode: string;
    sImageLocation: string;
    procedure SetFunctionMode(const Value: string);
    procedure ShowUpstandPolishPrices;
    procedure ShowWeights;
    procedure CallMaintScreen(FuncMode: string);
    procedure CallMaintWeightScreen(FuncMode: string);
    procedure DeleteUpstand(TempCode: integer);
    procedure DeleteWeight(IDPointer: integer);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    { Private declarations }
  public
    { Public declarations }
    iCode: Integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWtMaintMaterialType: TfrmWtMaintMaterialType;

implementation

uses
  wtLUMaterialType, wtDataModule, WTMaintMaterialTypeUpstands, ComObj, ActiveX,
  WTMaintMaterialTypeWeight, System.UITypes;
  
{$R *.DFM}

procedure TfrmWtMaintMaterialType.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintMaterialType.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintMaterialType.FormActivate(Sender: TObject);
begin
  sImageLocation := dtmdlWorktops.GetWebImageDirectory;

  if FunctionMode = 'A' then
    begin
      iCode := 0;
      
      edtDescription.Text := '';
      edtSalesNominal.Text := '';
      edtPurchaseNominal.Text := '';
      edtSalesNominalRetail.Text := '';
      edtPurchaseNominalRetail.Text := '';

      edtShortDescription.Text := '';
      memLongDescription.Text := '';

      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;

      {Load image}
      imgWorktop.Picture.LoadFromFile('');
      edtImagePath.Text := '';
    end
  else
    with frmWTLUMaterialType.qryWorktopType do
      begin
        iCode := fieldbyname('Worktop_Type').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;
        edtSalesNominal.Text := fieldbyname('Sales_Nominal').asstring;
        edtPurchaseNominal.Text := fieldbyname('Purchase_Nominal').asstring;
        edtSalesNominalRetail.Text := fieldbyname('Sales_Nominal_Retail').asstring;
        edtPurchaseNominalRetail.Text := fieldbyname('Purchase_Nominal_Retail').asstring;

        edtShortDescription.Text := fieldbyname('Short_Description').asstring;
        memLongDescription.Text := fieldbyname('Long_Description').asstring;

        chkbxShowOnline.Checked := (fieldbyname('Show_Online').asstring = 'Y');
        chkbxInactive.Checked := (fieldbyname('inActive').asstring = 'Y');

        {Load image}
        try
          imgWorktop.Picture.LoadFromFile(sImageLocation + '\' + fieldbyname('Image_Path').asstring);
          edtImagePath.Text := sImageLocation + '\' + fieldbyname('Image_Path').asstring;
        except
          imgWorktop.Picture.LoadFromFile('');
          edtImagePath.Text := '';
        end;

        if fieldbyname('Image_Path').asstring = '' then
          edtImagePath.Text := '';

        ShowUpstandPolishPrices;
        ShowWeights;

      end;

  edtDescription.SetFocus;
  EnableOK(self);
end;

procedure TfrmWtMaintMaterialType.ShowUpstandPolishPrices;
var
  sText: string;
begin
  with qryUpstands do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Worktop_Type').asinteger := frmWTLUMaterialType.qryWorktopType.fieldbyname('Worktop_Type').asinteger;
      open;
    end;
end;

procedure TfrmWtMaintMaterialType.ShowWeights;
var
  sText: string;
begin
  with qryWeights do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Worktop_Type').asinteger := frmWTLUMaterialType.qryWorktopType.fieldbyname('Worktop_Type').asinteger;
      open;
    end;
end;

procedure TfrmWtMaintMaterialType.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmWtMaintMaterialType.Button3Click(Sender: TObject);
begin
  with TOpenPictureDialog.Create(nil) do
    try
//      Caption := 'Open Image';
      Options := [ofPathMustExist, ofFileMustExist];
      if Execute then
        begin
          imgWorktop.Picture.LoadFromFile(FileName);
          edtImagePath.text := filename;
        end;
    finally
      Free;
    end;

end;

procedure TfrmWtMaintMaterialType.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWtMaintMaterialType.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTMaintMaterialTypeUpstands := TfrmWTMaintMaterialTypeUpstands.create(Application);
  try
    frmWTMaintMaterialTypeUpstands.FunctionMode := FuncMode;
    if FuncMode <> 'A' then
    begin
      frmWTMaintMaterialTypeUpstands.edtDescription.Text := dtsUpstands.dataset.fieldbyname('Description').asstring;
      frmWTMaintMaterialTypeUpstands.PricePointer := dtsUpstands.dataset.fieldbyname('Price_Pointer').asinteger;
      frmWTMaintMaterialTypeUpstands.SellPrice := dtsUpstands.dataset.fieldbyname('Unit_Price').asfloat;
      frmWTMaintMaterialTypeUpstands.CostPrice := dtsUpstands.dataset.fieldbyname('Unit_Cost').asfloat;
    end
    else
    begin
      frmWTMaintMaterialTypeUpstands.edtDescription.Text := '';
      frmWTMaintMaterialTypeUpstands.PricePointer := 0;
      frmWTMaintMaterialTypeUpstands.SellPrice := 0.00;
      frmWTMaintMaterialTypeUpstands.CostPrice := 0.00;
    end;

    frmWTMaintMaterialTypeUpstands.WorktopType := frmWTLUMaterialType.qryWorktopType.fieldbyname('Worktop_Type').asinteger;

    frmWTMaintMaterialTypeUpstands.showmodal;
    if FuncMode = 'A' then
      icode := qryUpstands.FieldbyName('Price_Pointer').asinteger
    else
      icode := frmWTMaintMaterialTypeUpstands.PricePointer;
    ShowUpstandPolishPrices;
    dbgUpstands.DataSource.dataset.Locate('Price_pointer', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintMaterialTypeUpstands.free;
  end;
end;

procedure TfrmWtMaintMaterialType.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');

end;

procedure TfrmWtMaintMaterialType.dbgUpstandsDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(dbgUpstands.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;
  StrPCopy(txt, Column.field.text);
  SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
  ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
end;

procedure TfrmWtMaintMaterialType.dbgUpstandsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmWtMaintMaterialType.btnDeleteClick(Sender: TObject);
var
  PPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      PPointer := dbgUpstands.DataSource.DataSet.fieldbyname('Price_Pointer').asinteger;
      DeleteUpstand(PPointer);
      dtmdlWorktops.DeletePrices(PPointer);
      dtmdlWorktops.DeletePointer(PPointer);
      ShowUpstandPolishPrices;
    end;

end;

procedure TfrmWtMaintMaterialType.DeleteUpstand(TempCode: integer);
begin
  with qryDelUpstand do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWtMaintMaterialType.CallMaintWeightScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTMaintMaterialTypeWeight := TfrmWTMaintMaterialTypeWeight.create(Application);
  try
    frmWTMaintMaterialTypeWeight.FunctionMode := FuncMode;
    frmWTMaintMaterialTypeWeight.WorktopType := frmWTLUMaterialType.qryWorktopType.fieldbyname('Worktop_Type').asinteger;

    if FuncMode <> 'A' then
    begin
      frmWTMaintMaterialTypeWeight.IDPointer := dtsWeights.dataset.fieldbyname('ID').asinteger;
      frmWTMaintMaterialTypeWeight.Thickness := dtsWeights.dataset.fieldbyname('Thickness').asinteger;
      frmWTMaintMaterialTypeWeight.Weight := dtsWeights.dataset.fieldbyname('Weight_kg').asfloat;
    end
    else
    begin
      frmWTMaintMaterialTypeWeight.Thickness := 0;
      frmWTMaintMaterialTypeWeight.Weight := 0.00;
    end;

    frmWTMaintMaterialTypeWeight.showmodal;

    ShowWeights;

    dbgWeights.DataSource.dataset.Locate('ID', Variant(inttostr(iCode)),[lopartialKey]) ;
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintMaterialTypeWeight.free;
  end;
end;

procedure TfrmWtMaintMaterialType.btnWeightAddClick(Sender: TObject);
begin
  CallMaintWeightScreen('A');
end;

procedure TfrmWtMaintMaterialType.btnWeightChangeClick(Sender: TObject);
begin
  CallMaintWeightScreen('C');

end;

procedure TfrmWtMaintMaterialType.btnWeightDeleteClick(Sender: TObject);
var
  IDPointer: integer;
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      IDPointer := dbgWeights.DataSource.DataSet.fieldbyname('ID').asinteger;
      DeleteWeight(IDPointer);
      ShowWeights;
    end;
end;

procedure TfrmWtMaintMaterialType.DeleteWeight(IDPointer: integer);
begin
  with qryDelWeight do
    begin
      close;
      parambyname('ID').asinteger := IDPointer;
      execsql;
    end;
end;

procedure TfrmWtMaintMaterialType.dbgWeightsDblClick(Sender: TObject);
begin
  btnWeightChangeclick(self);
end;

procedure TfrmWtMaintMaterialType.SaveToDB;
var
  iPathLength, iFileLength, icount: integer;
begin
  if FunctionMode[1] in ['A', 'C'] then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    with qryUpdate do
    begin
      Close;
      for icount := 0 to pred(params.count) do
        Params[icount].Clear;

      parambyname('Worktop_Type').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;
      parambyname('Sales_Nominal').asstring := edtSalesNominal.Text;
      parambyname('Purchase_Nominal').asstring := edtPurchaseNominal.Text;
      parambyname('Sales_Nominal_Retail').asstring := edtSalesNominalRetail.Text;
      parambyname('Purchase_Nominal_Retail').asstring := edtPurchaseNominalRetail.Text;

      parambyname('Short_Description').asstring := trim(edtShortDescription.Text);

      parambyname('Long_Description').asstring := trim(memLongDescription.Text);

      if chkbxShowOnline.Checked then
        ParamByName('Show_Online').asstring := 'Y'
      else
        ParamByName('Show_Online').asstring := 'N';

      if chkbxInactive.Checked then
        ParamByName('inActive').asstring := 'Y'
      else
        ParamByName('inActive').asstring := 'N';

      iPathLength := length(sImageLocation);
      iFileLength := length(trim(edtImagePath.text));

      ParamByName('Image_Path').asstring := copy(edtImagePath.text,iPathLength+2,(iFileLength-iPathLength+1));

      ExecSQL;
    end;
  end;
end;

function TfrmWtMaintMaterialType.GetNextKey: integer;
var
  aGuid: TGuid;
begin
  if CoCreateGuid(aGuid) <> S_OK then
    raise Exception.Create('CoCreateGuid failed');
  AddZero;
  try
    //insert product type record
    with qryAdd do
    begin
      ParamByName('GUID').AsString := GuidToString(aGuid);
      ExecSQL;
    end;
    with qryGetLast do
    begin
      Close;
      ParamByName('GUID').AsString := GuidToString(aGuid);
      Open;
      Result := FieldByName('Worktop_Type').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintMaterialType.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Worktop_Type ' +
            '(Worktop_Type,Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintMaterialType.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Worktop_Type Where Worktop_Type = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
