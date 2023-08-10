unit wtMaintJElement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtJobsDM, StdCtrls, Buttons, CRControls, DBCtrls, DB, Spin, ExtCtrls, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintJElement = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryWorktops: TFDQuery;
    qryWTThickness: TFDQuery;
    dtsWorktops: TDataSource;
    dtsWTThickness: TDataSource;
    qryOneWTThickness: TFDQuery;
    lblDelete: TLabel;
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edtDepth: TCREditInt;
    edtLength: TCREditInt;
    dblkpWTThickness: TDBLookupComboBox;
    dblkpWorktop: TDBLookupComboBox;
    edtMaterial: TEdit;
    edtUnitPrice: TCREditMoney;
    spnQuantity: TSpinEdit;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edtTotalPrice: TCREditMoney;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    dblkpWTGroup: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    qryWTGroup: TFDQuery;
    dtsWTGroup: TDataSource;
    Label10: TLabel;
    cmbMaterialUse: TComboBox;
    btnMaterialUse: TSpeedButton;
    qryMaterialUse: TFDQuery;
    dtsMaterialUse: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure edtDepthChange(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dblkpWTGroupClick(Sender: TObject);
    procedure btnMaterialUseClick(Sender: TObject);
  private
    FActivated: boolean;
    FMode: TjelMode;
    FMaterialType: string;
    FMaterial: integer;
    FWorktop: integer;
    FThickness: integer;
    FJElement: TJElement;
    FWorktopGroup: integer;
    procedure SetMode(const Value: TjelMode);
    procedure ShowDetails;
    procedure SetMaterialType(const Value: string);
    procedure GetTotalPrice;
    procedure SetMaterial(const Value: integer);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure GetUnitPrice;
    procedure SetJElement(const Value: TJElement);
    procedure RefreshThickness;
    procedure RefreshWorktops;
    procedure SetWorktopGroup(const Value: integer);
    procedure RefreshMaterialUse;
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property Mode: TjelMode read FMode write SetMode;
    property JElement: TJElement read FJElement write SetJElement;
    property Worktop: integer read FWorktop write SetWorktop;
    property WorktopGroup: integer read FWorktopGroup write SetWorktopGroup;
    property Thickness: integer read FThickness write SetThickness;
  end;

var
  frmWTMaintJElement: TfrmWTMaintJElement;

implementation

uses wtLUworktops, wtDataModule, wtLUMaterialUse;

{$R *.dfm}

{ TfrmWTMaintQElement }

procedure TfrmWTMaintJElement.SetMode(const Value: TjelMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> jelDelete);
  lblDelete.visible := (FMode = jelDelete);
end;

procedure TfrmWTMaintJElement.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    jelAdd     : Caption := 'Add an element';
    jelChange  : Caption := 'Change an element';
    jelDelete  : Caption := 'Delete an element';
    end;  { case }
    if Mode = jelAdd then
      sTemp := ' New element '
    else
      sTemp := ' element ' + IntToStr(jElement.Parent.DbKey) + ' ';

    with qryWTGroup do
      begin
        close;
        parambyname('Material_Type').asinteger := Material;
        open;
      end;

    RefreshMaterialUse;

    ShowDetails;
    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintJElement.RefreshWorktops;
begin
  with qryWorktops do
    begin
      close;
      parambyname('Material_Type').asinteger := Material;
      parambyname('Worktop_Group').asinteger := dblkpWTGroup.keyvalue;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintJElement.RefreshThickness;
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintJElement.ShowDetails;
begin
  if Mode <> jelAdd then
  begin
    edtMaterial.text := MaterialType;

    dblkpWTGroup.keyvalue := JElement.worktopGroup;

    RefreshWorktops;
    dblkpWorktop.keyvalue := jElement.worktop;

    with qryWTThickness do
      begin
        close;
        open;
      end;
    dblkpWTThickness.keyvalue := jElement.Thickness;

    cmbMaterialUse.text := jElement.ElementDescription;
    edtDepth.text := formatfloat('0',jElement.Depth);
    edtLength.text := formatfloat('0',jElement.Length);
    edtunitPrice.text := formatfloat('0.00',jElement.UnitPrice);
    spnQuantity.value := round(jElement.Quantity);
    GetTotalPrice;
  end
  else
  begin
    edtMaterial.text := MaterialType;

    dblkpWTGroup.keyvalue := Self.WorktopGroup;

    RefreshWorktops;
    dblkpWorktop.keyvalue := Self.Worktop;
    with qryWTThickness do
      begin
        close;
        open;
      end;
    dblkpWTThickness.keyvalue := Self.Thickness;
    edtDepth.text := '';
    edtLength.text := '';
    cmbMaterialUse.text := '';

    if JElement.UnitPrice = 0 then
      GetUnitPrice
    else
      edtUnitPrice.Text := formatfloat('0.00',JElement.UnitPrice);

    spnQuantity.value := 1;
    edtTotalPrice.Text := '0.00';

    if JElement.Parent.Elements.count > 0 then
      edtLength.setfocus
    else
      dblkpWorktop.SetFocus;
  end;
end;

procedure TfrmWTMaintJElement.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpWorktop.text <> '') and
                    (edtDepth.text <> '') and
                    (edtLength.Text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (dblkpWTThickness.KeyValue <> 0);
end;

procedure TfrmWTMaintJElement.GetTotalPrice;
var
  rUnitPrice, rTotal: real;
  idepth,iLength,iQuantity: integer;
begin
  iDepth := StrToIntDef(edtDepth.text, 0);
  iLength := StrToIntDef(edtLength.text, 0);
  rUnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);
  iQuantity := spnQuantity.value;

  rTotal := ((idepth * iLength)/1000000)*iQuantity*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintJElement.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintJElement.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
  jElement.Material := FMaterial;
end;

procedure TfrmWTMaintJElement.dblkpWorktopClick(Sender: TObject);
begin
  RefreshThickness;
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintJElement.dblkpWTThicknessClick(Sender: TObject);
begin
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintJElement.GetUnitPrice;
var
  sText: string;
begin
  with qryOneWTThickness do
    begin
      close;
      if dtmdlWorktops.IsSQL then
        begin
          sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
          SQL.Text := sText;
        end;

      parambyName('worktop').asinteger := dblkpWorktop.keyvalue;
      parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
      open;
      edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
      JElement.PriceUnit := fieldbyname('Price_unit').asinteger;
    end;
end;

procedure TfrmWTMaintJElement.edtDepthChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintJElement.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintJElement.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  jElement.Worktop := dblkpWorktop.KeyValue;
  jElement.WorktopGroup := dblkpWTGroup.KeyValue;
  jElement.worktopDesc := dblkpWorktop.Text;
  jElement.thickness := dblkpWTThickness.keyvalue;
  jElement.thicknessDesc := dblkpWTThickness.Text;
  jElement.ElementDescription := cmbMaterialUse.text;
  jElement.Depth := strtoint(edtDepth.text);
  jElement.Length := strtoint(edtLength.text);
  jElement.Quantity := spnQuantity.Value;
  jElement.UnitPrice := StrToFloatDef(edtUnitPrice.text, 0, FormatSettings);
  if Mode = jelAdd then
  begin
    jElement.jENumber := jElement.Parent.Elements.Count + 1;
    jElement.Parent.Elements.Add(jElement);
//    jElement.PriceUnit := qryOneWTThickness.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = jelDelete then
  begin
    inx := jElement.Parent.Elements.IndexOf(jElement.jENumber);
    jElement.Parent.Elements.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintJElement.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintJElement.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintJElement.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintJElement.SetJElement(const Value: TJElement);
begin
  FJElement := Value;
end;

procedure TfrmWTMaintJElement.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUWorktops := TfrmWTLUWorktops.create(self);
  try
    frmWTLUWorktops.dblkpMaterialType.keyvalue := Material;
    frmWTLUWorktops.showmodal;
  finally
    frmWTLUWorktops.free;
  end;

  RefreshWorktops;
  RefreshThickness;
  (*  qryWorktops.close;
  qryWorktops.open;
*)end;

procedure TfrmWTMaintJElement.SetWorktopGroup(const Value: integer);
begin
  FWorktopGroup := Value;
end;

procedure TfrmWTMaintJElement.SpeedButton2Click(Sender: TObject);
begin
  dblkpWTGroup.KeyValue := 0;
  RefreshWorktops;
end;

procedure TfrmWTMaintJElement.dblkpWTGroupClick(Sender: TObject);
begin
  RefreshWorktops;
end;

procedure TfrmWTMaintJElement.RefreshMaterialUse;
begin
  with qryMaterialUse do
    begin
      cmbMaterialUse.Clear;
      close;
      open;
      first;
      while eof <> true do
        begin
          cmbMaterialUse.Items.Add(fieldbyname('Use_Description').asstring);
          next;
        end;
    end;
end;


procedure TfrmWTMaintJElement.btnMaterialUseClick(Sender: TObject);
begin
  frmWTLUMaterialUse := TfrmWTLUMaterialUse.create(self);
  try
    frmWTLUMaterialUse.showmodal;
  finally
    frmWTLUMaterialUse.free;
  end;

  RefreshMaterialUse;
end;

end.
