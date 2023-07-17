unit wtMaintQElement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtQuotesDM, StdCtrls, Buttons, CRControls, DBCtrls, DB,
  DBTables, Spin, ExtCtrls, QrCtrls;

type
  TfrmWTMaintQElement = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryWorktops: TQuery;
    qryWTThickness: TQuery;
    dtsWorktops: TDataSource;
    dtsWTThickness: TDataSource;
    qryOneWTThickness: TQuery;
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
    edtUnitPrice: TCREditMoney;
    spnQuantity: TSpinEdit;
    Label8: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edtTotalPrice: TCREditMoney;
    btnWorktops: TSpeedButton;
    dblkpWTGroup: TDBLookupComboBox;
    Label9: TLabel;
    qryWTGroup: TQuery;
    dtsWTGroup: TDataSource;
    btnPriceGroup: TSpeedButton;
    dblkpMaterial: TDBLookupComboBox;
    qryMaterial: TQuery;
    dtsMaterial: TDataSource;
    qryContractWorktops: TQuery;
    qryContractPrice: TQuery;
    qryCustomerWorktops: TQuery;
    qryCustomerPrice: TQuery;
    Label10: TLabel;
    qryMaterialUse: TQuery;
    dtsMaterialUse: TDataSource;
    cmbMaterialUse: TComboBox;
    SpeedButton1: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure edtDepthChange(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWorktopsClick(Sender: TObject);
    procedure dblkpWTGroupClick(Sender: TObject);
    procedure btnPriceGroupClick(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FActivated: boolean;
    FQElement: TQElement;
    FMode: TqelMode;
    FMaterialType: string;
    FMaterial: integer;
    FWorktop: integer;
    FThickness: integer;
    FWorktopGroup: integer;
    FUseCustomerPrices: boolean;
    procedure SetQElement(const Value: TQElement);
    procedure SetMode(const Value: TqelMode);
    procedure SetProperties;
    procedure ShowDetails;
    procedure SetMaterialType(const Value: string);
    procedure GetTotalPrice;
    procedure SetMaterial(const Value: integer);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure GetUnitPrice;
    procedure RefreshGroups;
    procedure RefreshWorktops;
    procedure SetWorktopGroup(const Value: integer);
    procedure RefreshThickness;
    procedure EnableButtons;
    procedure SetUseCustomerPrices(const Value: boolean);
    procedure RefreshMaterialUse;
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property Mode: TqelMode read FMode write SetMode;
    property QElement: TQElement read FQElement write SetQElement;
    property Worktop: integer read FWorktop write SetWorktop;
    property WorktopGroup: integer read FWorktopGroup write SetWorktopGroup;
    property Thickness: integer read FThickness write SetThickness;
    property UseCustomerPrices: boolean read FUseCustomerPrices write SetUseCustomerPrices;
  end;

var
  frmWTMaintQElement: TfrmWTMaintQElement;

implementation

uses wtLUworktops, wtMain, wtDataModule, wtLUMaterialUse;

{$R *.dfm}

{ TfrmWTMaintQElement }

procedure TfrmWTMaintQElement.SetMode(const Value: TqelMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> qelDelete);
  lblDelete.visible := (FMode = qelDelete);
end;

procedure TfrmWTMaintQElement.SetQElement(const Value: TQElement);
begin
  FQElement := Value;
end;

procedure TfrmWTMaintQElement.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    qelAdd     : Caption := 'Add an element';
    qelChange  : Caption := 'Change an element';
    qelDelete  : Caption := 'Delete an element';
    end;  { case }
    if Mode = qelAdd then
      sTemp := ' New element '
    else
      sTemp := ' element ' + IntToStr(QElement.Parent.DbKey) + ' ';

    with qryMaterial do
      begin
        close;
        parambyname('Material_Type').AsInteger := QElement.Material;
        open;
      end;

    RefreshMaterialUse;

    RefreshGroups;

    if frmWTMain.bEndUSer then
      EnableButtons;

    edtUnitPrice.Enabled := not frmWTMain.bEndUser;

    if frmWTMain.bEndUser then
      edtUnitPrice.Enabled := (QElement.OriginalUnitPrice = 0);

    ShowDetails;

    SetProperties;

    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintQElement.EnableButtons;
begin
  btnWorktops.visible := false;
end;

procedure TfrmWTMaintQElement.RefreshGroups;
begin
  with qryWTGroup do
    begin
      close;
      parambyname('Material_Type').AsInteger := Material;
      parambyname('Worktop_Group').AsInteger := QElement.worktopGroup;
      open;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQElement.RefreshWorktops;
begin
  if QElement.Parent.ContractQuote then
    begin
      with qryContractWorktops do
        begin
          close;
          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Group_Number').AsInteger := QElement.Parent.ContractGroup;
          parambyname('Worktop').asinteger := QElement.worktop;
          open;
        end;
      dtsWorktops.dataset := qryContractWorktops;
    end
  else
    begin
      with qryCustomerWorktops do
        begin
          close;
          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Material_Type').asinteger := Material;
          parambyname('Worktop_Group').asinteger := dblkpWTGroup.keyvalue;
          parambyname('Worktop').asinteger := QElement.worktop;
          open;
        end;

      if qryCustomerWorktops.recordcount > 0 then
        begin
          UseCustomerPrices := true;
          dtsWorktops.dataset := qryCustomerWorktops
        end
      else
        begin
          with qryWorktops do
            begin
              close;
              parambyname('Material_Type').asinteger := Material;
              parambyname('Worktop_Group').asinteger := dblkpWTGroup.keyvalue;
              parambyname('Worktop').asinteger := QElement.worktop;
              open;
            end;

          UseCustomerPrices := false;
          dtsWorktops.dataset := qryWorktops;
        end;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQElement.RefreshThickness;
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;

  if QElement.Parent.ContractQuote then
    begin
      dblkpWTThickness.keyvalue := QElement.Parent.thickness;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQElement.ShowDetails;
begin
  if Mode <> qelAdd then
  begin

    dblkpMaterial.keyvalue := QElement.Material;
    dblkpWTGroup.keyvalue := QElement.worktopGroup;

    RefreshWorktops;
    dblkpWorktop.keyvalue := QElement.worktop;

    with qryWTThickness do
      begin
        close;
        open;
      end;
    dblkpWTThickness.keyvalue := QElement.Thickness;

    cmbMaterialUse.text := QElement.ElementDescription;
    edtDepth.text := formatfloat('0',QElement.Depth);
    edtLength.text := formatfloat('0',QElement.Length);
    edtunitPrice.text := formatfloat('0.00',QElement.UnitPrice);
    spnQuantity.value := round(QElement.Quantity);
    GetTotalPrice;
  end
  else
  begin

    dblkpMaterial.keyvalue := Material;
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
    cmbMaterialUse.Text := '';
    
    if QElement.UnitPrice = 0 then
      GetUnitPrice
    else
      edtUnitPrice.Text := formatfloat('0.00',QElement.UnitPrice);

    spnQuantity.value := 1;
    edtTotalPrice.Text := '0.00';

    if QElement.Parent.Elements.count > 0 then
      edtLength.setfocus
    else
      dblkpWorktop.SetFocus;
  end;
end;

procedure TfrmWTMaintQElement.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpWorktop.text <> '') and
                    (edtDepth.text <> '') and
                    (edtLength.Text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (dblkpWTThickness.KeyValue <> 0);
end;

procedure TfrmWTMaintQElement.GetTotalPrice;
var
  rUnitPrice, rTotal: real;
  idepth,iLength,iQuantity: integer;
begin
  try
    iDepth := strtoint(edtDepth.text);
  except
    iDepth := 0
  end;

  try
    iLength := strtoint(edtLength.text);
  except
    iLength := 0;
  end;

  try
    rUnitPrice := strtofloat(edtUnitPrice.text);
  except
    rUnitPrice := 0.00;
  end;

  iQuantity := spnQuantity.value;

  rTotal := ((idepth * iLength)/1000000)*iQuantity*rUnitPrice;
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQElement.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintQElement.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
//  QElement.Material := FMaterial;
end;

procedure TfrmWTMaintQElement.dblkpWorktopClick(Sender: TObject);
begin
  RefreshThickness;
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQElement.dblkpWTThicknessClick(Sender: TObject);
begin
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQElement.GetUnitPrice;
var
  sText: string;
begin
  if QElement.Parent.ContractQuote then
    begin
      with qryContractPrice do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Group_Number').AsInteger := QElement.Parent.ContractGroup;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
        end;
    end
  else
  if self.UseCustomerPrices then
    begin
      with qryCustomerPrice do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QElement.Parent.Customer;
          parambyname('Group_Number').AsInteger := dtsWorktops.DataSet.fieldbyname('Group_Number').asinteger;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
        end;
    end
  else
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
          QElement.PriceUnit := fieldbyname('Price_unit').asinteger;
          QElement.OriginalUnitPrice := fieldbyname('Unit_Price').asfloat;
        end;
    end;

  if frmWTMain.bEndUSer then
    edtUnitPrice.enabled := (strtofloat(edtUnitPrice.Text) = 0);
end;

procedure TfrmWTMaintQElement.edtDepthChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQElement.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQElement.btnOKClick(Sender: TObject);
var
  inx : integer;
begin
  if frmWTMain.bEndUser then
    begin
      if (strtofloat(edtUnitPrice.text) = 0) then
        begin
          messagedlg('A zero worktop unit price is not allowed.', mterror, [mbOk], 0);
          edtUnitPrice.setfocus;
          exit;
        end;
    end;
  QElement.Material := dblkpMaterial.KeyValue;
  QElement.Worktop := dblkpWorktop.KeyValue;
  QElement.WorktopGroup := dblkpWTGroup.KeyValue;
  QElement.worktopDesc := dblkpWorktop.Text;
  QElement.thickness := dblkpWTThickness.keyvalue;
  QElement.thicknessDesc := dblkpWTThickness.Text;
  QElement.ElementDescription := cmbMaterialUse.text;
  QElement.Depth := strtoint(edtDepth.text);
  QElement.Length := strtoint(edtLength.text);
  QElement.Quantity := spnQuantity.Value;
  QElement.UnitPrice := strtofloat(edtUnitPrice.text);
  if Mode = qelAdd then
  begin
    QElement.QENumber := QElement.Parent.Elements.Count + 1;
    QElement.Parent.Elements.Add(QElement);
//    QElement.PriceUnit := qryOneWTThickness.fieldbyname('Price_unit').asinteger;
  end
  else
  if Mode = qelDelete then
  begin
    inx := QElement.Parent.Elements.IndexOf(QElement.QENumber);
    QElement.Parent.Elements.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintQElement.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintQElement.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintQElement.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintQElement.btnWorktopsClick(Sender: TObject);
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

procedure TfrmWTMaintQElement.dblkpWTGroupClick(Sender: TObject);
begin
  RefreshWorktops;
end;

procedure TfrmWTMaintQElement.SetWorktopGroup(const Value: integer);
begin
  FWorktopGroup := Value;
end;

procedure TfrmWTMaintQElement.btnPriceGroupClick(Sender: TObject);
begin
  dblkpWTGroup.KeyValue := 0;
  RefreshWorktops;
end;

procedure TfrmWTMaintQElement.dblkpMaterialClick(Sender: TObject);
begin
  if Material <> dblkpMaterial.KeyValue then
    begin
      dblkpWTGroup.KeyValue := 0;
      dblkpWorktop.KeyValue := 0;
      dblkpWTThickness.KeyValue := 0;
      QElement.worktop := 0;  
      QElement.worktopGroup := 0;
    end;
  Material := dblkpMaterial.KeyValue;
  RefreshGroups;
  RefreshWorktops;
end;

procedure TfrmWTMaintQElement.SetProperties;
begin
  dblkpMaterial.Enabled := not QElement.parent.ContractQuote;
  dblkpWTGroup.enabled := dblkpMaterial.Enabled;
end;

procedure TfrmWTMaintQElement.SetUseCustomerPrices(const Value: boolean);
begin
  FUseCustomerPrices := Value;
end;

procedure TfrmWTMaintQElement.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUMaterialUse := TfrmWTLUMaterialUse.create(self);
  try
    frmWTLUMaterialUse.showmodal;
  finally
    frmWTLUMaterialUse.free;
  end;

  RefreshMaterialUse;
end;

procedure TfrmWTMaintQElement.RefreshMaterialUse;
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

end.
