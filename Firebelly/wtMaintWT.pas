unit wtMaintWT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, DB,
  DBTables, gtQrCtrls, ComCtrls, ExtDlgs, jpeg;

type
  TfrmWTMaintWT = class(TForm)
    Label1: TLabel;
    chkbxInactive: TCheckBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    lkpMatType: TQuery;
    srclkpMatType: TDataSource;
    qryWTGPrices: TQuery;
    qryAddWTThickness: TQuery;
    srclkpWTThickness: TDataSource;
    lkpWTThickness: TQuery;
    lkpWTThicknessWorktop: TIntegerField;
    lkpWTThicknessThickness: TIntegerField;
    lkpWTThicknessThickness_mm: TStringField;
    lkpWTThicknessUnit_Price: TFloatField;
    lkpWTThicknessUnit_Cost: TFloatField;
    lkpWTThicknessPrice_unit_description: TStringField;
    lkpWTThicknessPrice_Pointer: TIntegerField;
    qryDelWTThick: TQuery;
    pgDetails: TPageControl;
    tbDetails: TTabSheet;
    tbColourGroups: TTabSheet;
    Label3: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    Label2: TLabel;
    dblkpWorktopGroup: TDBLookupComboBox;
    btnWorktopGroup: TButton;
    btnClear: TBitBtn;
    Label5: TLabel;
    dblkpWorktopFinish: TDBLookupComboBox;
    Button2: TButton;
    chkbxShowOnline: TCheckBox;
    lkpWorktopFinish: TQuery;
    srclkpWorktopFinsih: TDataSource;
    qryCheckWTThickness: TQuery;
    lstbxMembers: TListBox;
    lstbxMembersCodes: TListBox;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    lstbxNonMembers: TListBox;
    lstbxNonMembersCodes: TListBox;
    Label4: TLabel;
    Label6: TLabel;
    qryDeleteColour: TQuery;
    qryAddColour: TQuery;
    qryDummy: TQuery;
    qryNonMembers: TQuery;
    dtsNonMembers: TDataSource;
    qryMembers: TQuery;
    Button1: TButton;
    Label7: TLabel;
    Button3: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    imgWorktop: TImage;
    edtImagePath: TEdit;
    Label8: TLabel;
    dblkpDiscount: TDBLookupComboBox;
    btnDiscounts: TButton;
    lkpDiscounts: TQuery;
    scrlkpDiscounts: TDataSource;
    btnClearDiscount: TBitBtn;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    edtDescription: TEdit;
    edtShortDescription: TEdit;
    memLongDescription: TMemo;
    qryWorktop: TQuery;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    qryDelete: TQuery;
    qryGetLast: TQuery;
    qryZero: TQuery;
    lkpGroup: TQuery;
    dtsGroup: TDataSource;
    qryAddColourSQL: TQuery;
    procedure btnOKClick(Sender: TObject);
    procedure btnWorktopGroupClick(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure lstbxMembersClick(Sender: TObject);
    procedure lstbxMembersDblClick(Sender: TObject);
    procedure lstbxNonMembersClick(Sender: TObject);
    procedure lstbxNonMembersDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnDiscountsClick(Sender: TObject);
    procedure btnClearDiscountClick(Sender: TObject);
  private
    FWorktop: integer;
    FGroupCode: integer;
    procedure SetWorktop(const Value: integer);
    procedure SetGroupCode(const Value: integer);
    procedure DeleteColoursFromDB;
    procedure ShowDiscounts;
    procedure AddZero;
    procedure DeleteZero;
    function GetNextKey: integer;
    procedure SaveToDB;
  private
    FfunctionMode: string;
    iOldGroup: integer;
    sImageLocation: string;
    property GroupCode: integer read FGroupCode write SetGroupCode;
    procedure SetfunctionMode(const Value: string);
    procedure CreateSizes;
    procedure ChangeSizes;
    procedure AddWorktopPrices(TempSize: integer; Tempcost,
      TempSell: real);
    procedure ShowThickness;
    procedure DeleteWTThickness(TempCode: integer);
    procedure ChangeWorktopPrices(TempSize, PricePointer: integer;
      Tempcost, TempSell: real);
    procedure RefreshData;
    procedure RefreshNonMemberData;
    { Private declarations }
  public
    iCode: integer;
    property Worktop: integer read FWorktop write SetWorktop;
    property functionMode: string read FfunctionMode write SetfunctionMode;
  end;

var
  frmWTMaintWT: TfrmWTMaintWT;

implementation

uses wtLUWTGroup, wtDataModule, wtMain, WTMaintWTThickness, ComObj, ActiveX,
  WTLUFinish, WTLUColourGroup, wtLUDiscounts;

{$R *.dfm}

procedure TfrmWTMaintWT.SetfunctionMode(const Value: string);
begin
  FFunctionMode := Value;

  if Value = 'A' then
    begin
      dblkpWorktopGroup.KeyValue := 0;
    end
end;

procedure TfrmWTMaintWT.btnOKClick(Sender: TObject);
var
  iCount: integer;
  iPathLength, iFileLength: integer;
begin
  SaveToDB;

  if (FunctionMode = 'A') and (dblkpWorktopGroup.text <> '') then
    CreateSizes
  else
  if (FunctionMode = 'C') and (dblkpWorktopGroup.text <> '') and (iOldGroup <> dblkpWorktopGroup.keyvalue) then
    ChangeSizes;

  {Add the colours}
  DeleteColoursFromDB;

  for iCount := 0 to pred(lstbxMembers.items.count) do
    begin
      with qryAddColour do
      begin
        close;

        if dtmdlWorktops.IsSQL then
          begin
            SQL.Text := qryAddColourSQL.SQL.text;
          end;

        parambyname('Worktop').asinteger := iCode;
        parambyname('Colour').asinteger := strtoint(lstbxMembersCodes.items[iCount]);
        execsql;
      end;
    end;

end;

procedure TfrmWTMaintWT.DeleteColoursFromDB;
begin
  with qryDeleteColour do
    begin
      close;
      parambyname('Worktop').asinteger := iCode;
      execsql;
    end;
end;

procedure TfrmWTMaintWT.btnWorktopGroupClick(Sender: TObject);
begin
  frmWTLuWTGroup := TfrmWTLuWTGroup.create(self);
  try
    frmWTLuWTGroup.showmodal;
    formactivate(self);
  finally
    frmWTLuWTGroup.free
  end;
end;

procedure TfrmWTMaintWT.FormActivate(Sender: TObject);
begin
  sImageLocation := dtmdlWorktops.GetWebImageDirectory;

  with qryWorktop do
    begin
      close;
      parambyname('Worktop').asinteger := worktop;
      open;
    end;

  with lkpWorktopFinish do
    begin
      close;
      parambyname('Worktop_Finish').asinteger := qryWorktop.fieldbyname('Worktop_Finish').asinteger;
      open;
    end;

  with lkpMatType do
    begin
      close;
      parambyname('Material_Type').asinteger := qryWorktop.fieldbyname('Material_type').asinteger;
      open;
    end;

  with lkpGroup do
    begin
      close;
      parambyname('Material_Type').asinteger := qryWorktop.fieldbyname('Material_type').asinteger;
      parambyname('Worktop_Group').asinteger := qryWorktop.fieldbyname('Worktop_Group').asinteger;
      open;
    end;

  if FunctionMode = 'A' then
    begin
      iOldGroup := 0;

      iCode := 0;
      
      edtDescription.Text := '';
      dblkpWorktopFinish.KeyValue := 0;
      dblkpMaterialType.KeyValue := 0;
      dblkpWorktopGroup.KeyValue := 0;
      dblkpDiscount.KeyValue := 0;

      edtShortDescription.Text := '';
      memLongDescription.Text := '';

      chkbxShowOnline.Checked := false;
      chkbxInactive.Checked := false;

      {Load image}
      imgWorktop.Picture.LoadFromFile('');
      edtImagePath.Text := '';
    end
  else
    with qryWorktop do
      begin
        iOldGroup := qryWorktop.fieldbyname('Worktop_Group').asinteger;

        iCode := fieldbyname('Worktop').asinteger;

        edtDescription.Text := fieldbyname('Description').asstring;

        dblkpWorktopFinish.KeyValue := fieldbyname('Worktop_Finish').asinteger;
        dblkpMaterialType.KeyValue := fieldbyname('Material_Type').asinteger;
        dblkpWorktopGroup.KeyValue := fieldbyname('Worktop_Group').asinteger;
        dblkpDiscount.KeyValue := fieldbyname('Discount').asinteger;

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

        if qryWorktop.fieldbyname('Image_Path').asstring = '' then
          edtImagePath.Text := '';

        ShowDiscounts;
      end;

  {Display the colours}
  RefreshData;
  RefreshNonMemberData;

  ShowThickness;
end;

procedure TfrmWTMaintWT.RefreshData;
begin
  with qryMembers do
    begin
      close;
      parambyname('Worktop').asinteger := Worktop;
      open;
      lstbxMembers.clear;

      while eof <> true do
        begin
          lstbxMembers.Items.add(fieldbyname('Colour_Group_Description').asstring);
          lstbxMembersCodes.Items.add(fieldbyname('Colour_Group').asstring);
          next;
        end;
    end;
end;

procedure TfrmWTMaintWT.RefreshNonMemberData;
var
  i: integer;
begin
  lstbxNonMembers.clear;
  lstbxNonMembersCodes.clear;

  with qryNonMembers do
    begin
      close;
      sql.clear;
      sql.text := qryDummy.sql.text;
      sql.add('AND Colour_Group.Colour_Group NOT IN ');
      sql.add('(0');
      for i := 0 to pred(lstbxMembersCodes.items.count) do
        begin
          sql.add(', ' + lstbxMembersCodes.items[i]);
        end;
      sql.add(')');
      sql.add(' and ');
      sql.add('Colour_Group.Colour_Group not in (select Colour_Group from Worktop_Colour_Group ');
      sql.add('where Worktop = ' + inttostr(Worktop) + ')');
      sql.Add('ORDER BY Colour_Group.Description');
      open;
      while eof <> true do
        begin
          lstbxNonMembers.Items.Add(fieldbyname('Colour_Group_Description').asstring);
          lstbxNonMembersCodes.Items.Add(fieldbyname('Colour_Group').asstring);
          next;
        end;
    end;

end;

procedure TfrmWTMaintWT.ShowThickness;
var
  sText : string;
begin
  with lkpWTThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Worktop').AsInteger := iCode;
      open;
    end;
end;

procedure TfrmWTMaintWT.btnClearClick(Sender: TObject);
begin
  dblkpWorktopGroup.KeyValue := 0;
end;

procedure TfrmWTMaintWT.CreateSizes;
var
  rCost, rSell: real;
  iSize: integer;
  sText: string;
begin
  with qryWTGPrices do
    begin
      close;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Worktop_Group').asinteger := dblkpWorktopGroup.keyvalue;
      open;
      first;

      while not eof do
        begin
          iSize := fieldbyname('Thickness').asinteger;
          rCost := fieldbyname('Unit_Cost').asfloat;
          rSell := fieldbyname('Unit_Price').asfloat;

          qryCheckWTThickness.close;
          qryCheckWTThickness.parambyname('Worktop').asinteger := iCode;
          qryCheckWTThickness.parambyname('Thickness').asinteger := iSize;
          qryCheckWTThickness.open;

          if qryCheckWTThickness.recordcount > 0 then
            ChangeWorktopPrices(iSize, qryCheckWTThickness.fieldbyname('Price_Pointer').asinteger, rCost, rSell)
          else
            AddWorktopPrices(iSize,rCost,rSell);
          next;
        end;
    end;
end;

procedure TfrmWTMaintWT.ChangeSizes;
var
  rCost, rSell: real;
  iSize: integer;
  sText: string;
begin
  with qryWTGPrices do
    begin
      close;

      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Worktop_Group').asinteger := dblkpWorktopGroup.keyvalue;
      open;
      first;

      while not eof do
        begin
          iSize := fieldbyname('Thickness').asinteger;
          rCost := fieldbyname('Unit_Cost').asfloat;
          rSell := fieldbyname('Unit_Price').asfloat;

          qryCheckWTThickness.close;
          qryCheckWTThickness.parambyname('Worktop').asinteger := iCode;
          qryCheckWTThickness.parambyname('Thickness').asinteger := iSize;
          qryCheckWTThickness.open;

          if qryCheckWTThickness.recordcount > 0 then
            ChangeWorktopPrices(iSize, qryCheckWTThickness.fieldbyname('Price_Pointer').asinteger, rCost, rSell)
          else
            AddWorktopPrices(iSize,rCost,rSell);
          next;
        end;
    end;
end;

procedure TfrmWTMaintWT.AddWorktopPrices(TempSize: integer; Tempcost, TempSell: real);
var
  iPricePointer: integer;
begin
	dtmdlWorktops.qryNewPrice.Close;
  dtmdlWorktops.qryNewPrice.Open;
  iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	dtmdlWorktops.qryAddPointer.Close;
  dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
  dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	dtmdlWorktops.qryAddPointer.ExecSQl;

	dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := iPricePointer;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
  dtmdlWorktops.qryAddPrice.PArambyname('Price').asfloat := tempSell;
  dtmdlWorktops.qryAddPrice.PArambyname('Cost').asfloat := TempCost;
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := frmWTMain.operator;
  dtmdlWorktops.qryAddPrice.execSQL;

  qryAddWTThickness.close;
  qryAddWTThickness.parambyname('Worktop').asinteger := iCode;
  qryAddWTThickness.parambyname('Thickness').asinteger := tempSize;
  qryAddWTThickness.parambyname('Price_pointer').asinteger := iPricePointer;
  qryAddWTThickness.execsql;

end;

procedure TfrmWTMaintWT.ChangeWorktopPrices(TempSize, PricePointer: integer; Tempcost, TempSell: real);
begin
  dtmdlWorktops.qryAddPrice.Close;
  dtmdlWorktops.qryAddPrice.PArambyname('Pointer').asinteger := PricePointer;
  dtmdlWorktops.qryAddPrice.PArambyname('Date').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('Basis').asstring := 'M';
  dtmdlWorktops.qryAddPrice.PArambyname('Unit').asinteger := 1;
  dtmdlWorktops.qryAddPrice.PArambyname('Change').asdatetime := now;
  dtmdlWorktops.qryAddPrice.PArambyname('By').asinteger := 1;
  dtmdlWorktops.qryAddPrice.Parambyname('Price').asfloat := TempSell;
  dtmdlWorktops.qryAddPrice.Parambyname('Cost').asfloat := tempCost;
	dtmdlWorktops.qryAddPrice.execSQL;
end;

procedure TfrmWtMaintWT.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (trim(edtDescription.text) <> '') and
                    (dblkpMaterialType.KeyValue <> 0);
end;

procedure TfrmWTMaintWT.dblkpMaterialTypeClick(Sender: TObject);
begin
  with lkpGroup do
    begin
      close;
      parambyname('Material_Type').asinteger := dblkpMaterialType.keyvalue;
      parambyname('Worktop_Group').asinteger := qryWorktop.fieldbyname('Worktop_Group').asinteger;
      open;
    end;
  EnableOK(self);
end;

procedure TfrmWTMaintWT.DeleteWTThickness(TempCode: integer);
begin
  with qryDelWTThick do
    begin
      close;
      parambyname('Price_pointer').asinteger := TemPCode;
      execsql;
    end;
end;

procedure TfrmWTMaintWT.Button2Click(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWTLUFinish := TfrmWTLUFinish.Create( Application );
  try
    frmWTLUFinish.showmodal;
  finally
    frmWTLUFinish.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintWT.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintWT.SetGroupCode(const Value: integer);
begin
  FGroupCode := Value;
end;

procedure TfrmWTMaintWT.btnAddClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to pred(lstbxNonMembers.items.count) do
    begin
      if lstbxNonMembers.Selected[i] then
        begin
          lstbxMembers.Items.Add(lstbxNonMembers.items[i]);
          lstbxMembersCodes.Items.Add(lstbxNonMembersCodes.items[i]);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TfrmWTMaintWT.btnRemoveClick(Sender: TObject);
var
  i: integer;
begin
  for i := pred(lstbxMembers.items.count) downto 0 do
    begin
      if lstbxMembers.Selected[i] then
        begin
          lstbxMembers.Items.Delete(i);
          lstbxMembersCodes.Items.Delete(i);
        end;
    end;
  RefreshNonMemberData;
end;

procedure TfrmWTMaintWT.lstbxMembersClick(Sender: TObject);
begin
  btnRemove.enabled := (lstbxMembers.SelCount > 0);
  btnAdd.enabled := false;
end;

procedure TfrmWTMaintWT.lstbxMembersDblClick(Sender: TObject);
begin
  btnRemoveClick(self);
end;

procedure TfrmWTMaintWT.lstbxNonMembersClick(Sender: TObject);
begin
  btnAdd.enabled := (lstbxNonMembers.SelCount > 0);
  btnRemove.enabled := false;
end;

procedure TfrmWTMaintWT.lstbxNonMembersDblClick(Sender: TObject);
begin
  btnAddClick(self);
end;

procedure TfrmWTMaintWT.Button1Click(Sender: TObject);
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

procedure TfrmWTMaintWT.btnDiscountsClick(Sender: TObject);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  frmWtLUDiscounts := TfrmWtLUDiscounts.Create( Application );
  try
    frmWtLUDiscounts.showmodal;
    ShowDiscounts;
  finally
    frmWtLUDiscounts.free;
    Screen.Cursor := OldCursor;
  end; // try..finally
end;

procedure TfrmWTMaintWT.ShowDiscounts;
begin
  with lkpDiscounts do
    begin
      close;
      parambyname('Discount').asinteger := qryWorktop.fieldbyname('Discount').asinteger;
      open;
    end;
end;

procedure TfrmWTMaintWT.btnClearDiscountClick(Sender: TObject);
begin
  dblkpDiscount.KeyValue := 0;
end;

procedure TfrmWTMaintWT.SaveToDB;
var
  iPathLength, iFileLength: integer;
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
      parambyname('Worktop').asinteger := iCode;

      parambyname('Description').asstring := edtDescription.Text;

      if dblkpWorktopFinish.KeyValue = 0 then
        parambyname('Worktop_Finish').clear
      else
        parambyname('Worktop_Finish').asinteger := dblkpWorktopFinish.KeyValue;

      if dblkpMaterialType.KeyValue = 0 then
        parambyname('Material_Type').clear
      else
        parambyname('Material_Type').asinteger := dblkpMaterialType.KeyValue;

      if dblkpWorktopGroup.KeyValue = 0 then
        parambyname('Worktop_Group').clear
      else
        parambyname('Worktop_Group').asinteger := dblkpWorktopGroup.KeyValue;

      if dblkpDiscount.KeyValue = 0 then
        parambyname('Discount').clear
      else
        parambyname('Discount').asinteger := dblkpDiscount.KeyValue;

      parambyname('Short_Description').asstring := edtShortDescription.Text;
      parambyname('Long_Description').asstring := memLongDescription.Text;

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

function TfrmWTMaintWT.GetNextKey: integer;
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
      Result := FieldByName('Worktop').AsInteger;
      Close;
    end;
  finally
    DeleteZero;
  end;
end;

procedure TfrmWTMaintWT.AddZero;
begin
  { When the table has no records, the insert method to guarantee unique
    keys will fail so we always write a dummy record with key of zero. }
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Insert Into Worktop ' +
            '(Worktop, Description, Material_Type) ' +
            'VALUES(0, ''Dummy'', 1) ');
    try
      ExecSQL;
    except
    end;
  end;
end;

procedure TfrmWTMaintWT.DeleteZero;
begin
  with qryZero do
  begin
    SQL.Clear;
    SQL.Add('Delete From Worktop Where Worktop = 0');
    try
      ExecSQL;
    except
    end;
  end;
end;

end.
