unit wtMaintMatType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, Vcl.ImgList,
  Vcl.ExtDlgs, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Mask, QrCtrls, wtNotesDM;

type
  TfrmWtMaintMatType = class(TForm)
    Label1: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    chkbxInactive: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label10: TLabel;
    Label22: TLabel;
    Label7: TLabel;
    dblkpWorktopType: TDBLookupComboBox;
    btnWorktopType: TButton;
    edtImagePath: TEdit;
    Button3: TButton;
    Panel1: TPanel;
    imgWorktop: TImage;
    lkpWorktopType: TFDQuery;
    srclkpWorktopType: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    Label3: TLabel;
    chkbxShowOnline: TCheckBox;
    TabSheet2: TTabSheet;
    Label9: TLabel;
    Label2: TLabel;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Button1: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar2: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    dbgSlabs: TDBGrid;
    imglstButtons: TImageList;
    Label5: TLabel;
    qrySlabs: TFDQuery;
    dtsSlabs: TDataSource;
    dblkpSupplier: TDBLookupComboBox;
    qrySuppliers: TFDQuery;
    dtsSuppliers: TDataSource;
    qryDelSlabSize: TFDQuery;
    qryUpdate: TFDQuery;
    qryAdd: TFDQuery;
    qryDelete: TFDQuery;
    qryGetLast: TFDQuery;
    qryZero: TFDQuery;
    edtSalesNominal: TEdit;
    edtPurchaseNominal: TEdit;
    edtShortDescription: TEdit;
    memLongDescription: TMemo;
    edtDescription: TEdit;
    TabSheet4: TTabSheet;
    Label8: TLabel;
    Label11: TLabel;
    memMaintenance: TMemo;
    memWarranty: TRichEdit;
    procedure btnOKClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnWorktopTypeClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure dbgSlabsDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FFunctionMode: string;
    iWarranty, iMaintenance: integer;
    sImageLocation: string;
    procedure SetFunctionMode(const Value: string);
    procedure CallMaintScreen(FuncMode: string);
    procedure ShowSlabSizes;
    procedure DeleteSlabSize(TempCode: integer);
    procedure LoadSuppliers;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
    function UpdateWarranty: Integer;
    function UpdateMaintenance: Integer;
    function GetMaintenance(const iNarrative: integer): string;
    function GetWarranty(const iNarrative: integer): string;
    { Private declarations }
  public
    { Public declarations }
    iCode: Integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
  end;

var
  frmWtMaintMatType: TfrmWtMaintMatType;

implementation

uses
  wtLUMatType, wtDataModule, WTMaintMatTypeSlabs, WTLUMaterialType, ComObj, ActiveX,
  WTSrchSupplier, System.UITypes;
  
{$R *.DFM}

procedure TfrmWtMaintMatType.btnOKClick(Sender: TObject);
begin
  SaveToDB;
end;

procedure TfrmWtMaintMatType.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWtMaintMatType.BitBtn2Click(Sender: TObject);
begin
  frmwtLUMatType.qryMatType.cancel;
end;

procedure TfrmWtMaintMatType.FormActivate(Sender: TObject);
begin
  sImageLocation := dtmdlWorktops.GetWebImageDirectory;

  LoadSuppliers;

  with lkpWorktopType do
    begin
      close;
      parambyname('Worktop_Type').asinteger := frmWTLUMatType.qryMatType.fieldbyname('Worktop_type').asinteger;
      open;
    end;

  if FunctionMode = 'A' then
    begin
      iCode := 0;

      dblkpWorktopType.keyvalue := 0;
      dblkpSupplier.keyvalue := 0;
      edtDescription.Text := '';
      edtSalesNominal.Text := '';
      edtPurchaseNominal.Text := '';

      edtShortDescription.Text := '';
      memLongDescription.Text := '';

      iWarranty := 0;
      iMaintenance := 0;
      memWarranty.Text := '';
      memMaintenance.Text := '';

      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;

      {Load image}
      imgWorktop.Picture.LoadFromFile('');
      edtImagePath.Text := '';
    end
  else
    with frmWTLUMatType.qryMatType do
      begin
        iCode := fieldbyname('Material_Type').asinteger;

        dblkpWorktopType.keyvalue := fieldbyname('Worktop_Type').asinteger;
        edtDescription.Text := fieldbyname('Description').asstring;
        edtSalesNominal.Text := fieldbyname('Sales_Nominal').asstring;
        edtPurchaseNominal.Text := fieldbyname('Purchase_Nominal').asstring;

        edtShortDescription.Text := fieldbyname('Short_Description').asstring;
        memLongDescription.Text := fieldbyname('Long_Description').asstring;

        if trim(fieldbyname('Warranty_Description').Asstring) = '' then
          iWarranty := 0
        else
          iWarranty := strtoint(fieldbyname('Warranty_Description').Asstring);
        memWarranty.Text := GetWarranty(iWarranty);

        if trim(fieldbyname('Maintenance_Description').Asstring) = '' then
          iMaintenance := 0
        else
          iMaintenance := strtoint(fieldbyname('Maintenance_Description').Asstring);
        memMaintenance.Text := GetMaintenance(iMaintenance);

        dblkpSupplier.keyvalue := fieldbyname('Preferred_Supplier').asinteger;

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
      end;

  ShowSlabSizes;

  EnableOK(self);
end;

procedure TfrmWtMaintMatType.EnableOK(Sender: TObject);
begin
  btnOK.enabled := trim(edtDescription.Text) <> '';
end;

procedure TfrmWtMaintMatType.btnWorktopTypeClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUMaterialType := TfrmWTLUMaterialType.Create( Application );
  try
    frmWTLUMaterialType.showmodal;
  finally
    with lkpWorktopType do
      begin
        close;
        parambyname('Worktop_Type').asinteger := frmWTLUMatType.qryMatType.fieldbyname('Worktop_type').asinteger;
        open;
      end;

    frmWTLUMaterialType.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWtMaintMatType.Button3Click(Sender: TObject);
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

procedure TfrmWtMaintMatType.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  frmWTMaintMatTypeSlabs := TfrmWTMaintMatTypeSlabs.create(Application);
  try

    frmWTMaintMatTypeSlabs.FunctionMode := FuncMode;
    frmWTMaintMatTypeSlabs.MaterialType := frmWTLUMatType.qryMatType.fieldbyname('Material_Type').asinteger;

    if FuncMode <> 'A' then
    begin
      frmWTMaintMatTypeSlabs.SlabSize := dtsSlabs.dataset.fieldbyname('Slab_Size').asinteger;

      frmWTMaintMatTypeSlabs.edtLength.Text := dtsSlabs.dataset.fieldbyname('Length').asstring;
      frmWTMaintMatTypeSlabs.edtDepth.Text := dtsSlabs.dataset.fieldbyname('Depth').asstring;
      frmWTMaintMatTypeSlabs.edtSlabSizeDescription.text := dtsSlabs.dataset.fieldbyname('Slab_Size_Description').asstring;
    end
    else
    begin
      frmWTMaintMatTypeSlabs.SlabSize := 0;
      frmWTMaintMatTypeSlabs.edtLength.Text := '';
      frmWTMaintMatTypeSlabs.edtDepth.Text := '';
      frmWTMaintMatTypeSlabs.edtSlabSizeDescription.text := '';
    end;


    frmWTMaintMatTypeSlabs.showmodal;

    ShowSlabSizes;
    dtsSlabs.dataset.locate('Slab_Size', Variant(inttostr(qrySlabs.fieldbyname('Slab_Size').asinteger)),[lopartialKey]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintMatTypeSlabs.free;
//    tblSlabs.Active := false;
  end;
end;

procedure TfrmWtMaintMatType.ShowSlabSizes;
begin
  with qrySlabs do
    begin
      close;
      parambyname('Material_Type').asinteger := frmWTLUMatType.qryMatType.fieldbyname('Material_Type').asinteger;
      open;
    end;
end;


procedure TfrmWtMaintMatType.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWtMaintMatType.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWtMaintMatType.btnDeleteClick(Sender: TObject);
begin
  if messagedlg('Delete the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DeleteSlabSize(dbgSlabs.datasource.dataset.fieldbyname('Slab_Size').asinteger);
      ShowSlabSizes;
    end;
end;

procedure TfrmWtMaintMatType.DeleteSlabSize(TempCode: integer);
begin
  with qryDelSlabSize do
    begin
      close;
      parambyname('Slab_Size').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWtMaintMatType.dbgSlabsDblClick(Sender: TObject);
begin
  btnChangeclick(self);
end;

procedure TfrmWtMaintMatType.LoadSuppliers;
begin
  qrySuppliers.Active := false;
  qrySuppliers.Active := true;
end;

procedure TfrmWtMaintMatType.SetButtons(Sender: TObject; Field: TField);
begin
  with qrySlabs do
  begin
    btnChange.Enabled := recordcount > 0;
    btnDelete.Enabled := recordcount > 0;
  end;
end;


procedure TfrmWtMaintMatType.FormCreate(Sender: TObject);
begin
  dtsSlabs.OnDataChange := SetButtons;
end;

procedure TfrmWtMaintMatType.Button1Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmwtSrchSupplier := TfrmwtSrchSupplier.Create( Application );
  try
    frmwtSrchSupplier.showmodal;
  finally
    LoadSuppliers;
    frmwtSrchSupplier.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWtMaintMatType.SaveToDB;
var
  iPathLength, iFileLength: integer;
begin
  if CharInSet(FunctionMode[1], ['A', 'C']) then
  begin
    if FunctionMode = 'A' then
    begin
      iCode := GetNextKey;
    end;

    iWarranty := UPdateWarranty;
    iMaintenance := UpdateMaintenance;

    with qryUpdate do
    begin
      Close;
      parambyname('Material_Type').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;
      parambyname('Sales_Nominal').asstring := edtSalesNominal.Text;
      parambyname('Purchase_Nominal').asstring := edtPurchaseNominal.Text;

      parambyname('Short_Description').asstring := edtShortDescription.Text;

      parambyname('Long_Description').asstring := memLongDescription.Text;


      if iWarranty = 0 then
        parambyname('Warranty_Description').clear
      else
        parambyname('Warranty_Description').asinteger := iWarranty;

      if iMaintenance = 0 then
        parambyname('Maintenance_Description').clear
      else
        parambyname('Maintenance_Description').asinteger := iMaintenance;

      if dblkpWorktopType.keyvalue = 0 then
        parambyname('Worktop_Type').clear
      else
        parambyname('Worktop_Type').asinteger := dblkpWorktopType.keyvalue;

      if dblkpSupplier.keyvalue = 0 then
        parambyname('Preferred_Supplier').clear
      else
        parambyname('Preferred_Supplier').asinteger := dblkpSupplier.keyvalue;

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

function TfrmWtMaintMatType.GetNextKey: integer;
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
      Result := FieldByName('Material_Type').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWtMaintMatType.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Material_Type ' +
            '(Material_Type,Description) ' +
            'VALUES(0, ''Dummy'') ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWtMaintMatType.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Material_Type Where Material_Type = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

function TfrmWtMaintMatType.UpdateWarranty: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iWarranty;
    Notes.DataInfo := memWarranty.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWtMaintMatType.UpdateMaintenance: Integer;
var
  Notes: TNotes;
begin
  Notes := TNotes.Create;
  try
    Notes.DbKey := iMaintenance;
    Notes.DataInfo := memMaintenance.Text;
    Notes.SaveToDB;
    Result := Notes.DbKey;
  finally
    Notes.Free;
  end;
end;

function TfrmWtMaintMatType.GetWarranty(const iNarrative: integer): string;
var
  Narrative : TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;

function TfrmWtMaintMatType.GetMaintenance(const iNarrative: integer): string;
var
  Narrative : TNotes;
begin
  Narrative := TNotes.Create;
  try
    Narrative.DbKey := iNarrative;
    Narrative.LoadFromDB;
    Result := Narrative.DataInfo;
  finally
    Narrative.Free;
  end;
end;




end.
