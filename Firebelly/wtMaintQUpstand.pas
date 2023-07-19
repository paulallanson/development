unit wtMaintQUpstand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wtQuotesDM, StdCtrls, Buttons, CRControls, DBCtrls, DB, Spin, ExtCtrls, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintQUpstand = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryWorktops: TFDQuery;
    qryWTThickness: TFDQuery;
    dtsWorktops: TDataSource;
    dtsWTThickness: TDataSource;
    qryOneWTThickness: TFDQuery;
    pnlDetails: TPanel;
    Label1: TLabel;
    dblkpWorktop: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dblkpWTThickness: TDBLookupComboBox;
    edtUnitPrice: TCREditMoney;
    Label4: TLabel;
    edtDepth: TCREditInt;
    Label5: TLabel;
    Label6: TLabel;
    edtLength: TCREditInt;
    Label8: TLabel;
    spnQuantity: TSpinEdit;
    Label7: TLabel;
    edtTotalPrice: TCREditMoney;
    lblDelete: TLabel;
    edtPolishPrice: TCREditMoney;
    Label9: TLabel;
    dblkpMaterial: TDBLookupComboBox;
    qryMaterial: TFDQuery;
    dtsMaterial: TDataSource;
    Label10: TLabel;
    dblkpMaterialUse: TDBLookupComboBox;
    qryMaterialUse: TFDQuery;
    dtsMaterialUse: TDataSource;
    SpeedButton1: TSpeedButton;
    Label11: TLabel;
    edtPolishCost: TCREditMoney;
    qryContractWorktops: TFDQuery;
    qryContractPrice: TFDQuery;
    spnNoOfDepths: TSpinEdit;
    Label12: TLabel;
    Label13: TLabel;
    spnNoOfLengths: TSpinEdit;
    Label14: TLabel;
    spnNoOfPieces: TSpinEdit;
    qryCustomerWorktops: TFDQuery;
    qryCustomerPrice: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure edtDepthChange(Sender: TObject);
    procedure spnQuantityChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FActivated: boolean;
    FMode: TqelMode;
    FMaterialType: string;
    FMaterial: integer;
    FWorktop: integer;
    FThickness: integer;
    FQUpstand: TQUpstand;
    FPolishPrice: currency;
    FMaterialUse: integer;
    FDepth: real;
    FPolishCost: currency;
    FUseCustomerPrices: boolean;
    procedure SetMode(const Value: TqelMode);
    procedure ShowDetails;
    procedure SetMaterialType(const Value: string);
    procedure GetTotalPrice;
    procedure SetMaterial(const Value: integer);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure GetUnitPrice;
    procedure SetQUpstand(const Value: TQUpstand);
    procedure SetPolishPrice(const Value: currency);
    procedure RefreshThickness;
    procedure RefreshWorktops;
    procedure SetMaterialUse(const Value: integer);
    procedure SetDepth(const Value: real);
    procedure RefreshMaterialUse;
    procedure SetPolishCost(const Value: currency);
    procedure SetProperties;
    procedure EnableButtons;
    procedure SetUseCustomerPrices(const Value: boolean);
    { Private declarations }
  public
    property Depth: real read FDepth write SetDepth;
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property MaterialUse: integer read FMaterialUse write SetMaterialUse;
    property Mode: TqelMode read FMode write SetMode;
    property QUpstand: TQUpstand read FQUpstand write SetQUpstand;
    property Worktop: integer read FWorktop write SetWorktop;
    property Thickness: integer read FThickness write SetThickness;
    property UseCustomerPrices: boolean read FUseCustomerPrices write SetUseCustomerPrices;
    property PolishCost: currency read FPolishCost write SetPolishCost;
    property PolishPrice: currency read FPolishPrice write SetPolishPrice;
  end;

var
  frmWTMaintQUpstand: TfrmWTMaintQUpstand;

implementation

uses wtMain, wtLUMaterialUse, wtDataModule;

{$R *.dfm}

{ TfrmWTMaintQUpstand }

procedure TfrmWTMaintQUpstand.SetMode(const Value: TqelMode);
begin
  FMode := Value;
  pnlDetails.Enabled := (FMode <> qelDelete);
  lblDelete.visible := (FMode = qelDelete);
end;

procedure TfrmWTMaintQUpstand.FormActivate(Sender: TObject);
var
  sTemp: string;
begin
  if not FActivated then
  begin
    case Mode of
    qelAdd     : Caption := 'Add an upstand';
    qelChange  : Caption := 'Change an upstand';
    qelDelete  : Caption := 'Delete an upstand';
    end;  { case }
    if Mode = qelAdd then
      sTemp := ' New upstand '
    else
      sTemp := ' upstand ' + IntToStr(QUpstand.Parent.DbKey) + ' ';

    with qryMaterial do
      begin
        close;
        parambyname('Material_Type').AsInteger := QUpstand.Material;
        open;
      end;

    RefreshMaterialUse;
    RefreshWorktops;

    if frmWTMain.bEndUSer then
      EnableButtons;

    edtUnitPrice.Enabled := not frmWTMain.bEndUser;

    if frmWTMain.bEndUser then
      edtUnitPrice.Enabled := (QUpstand.OriginalUnitPrice = 0);

    ShowDetails;

    SetProperties;

    EnableOK(Self);
    FActivated := true;
  end;
end;

procedure TfrmWTMaintQUpstand.EnableButtons;
begin
  edtPolishPrice.enabled := false;
end;

procedure TfrmWTMaintQUpstand.RefreshWorktops;
begin
  if QUpstand.Parent.ContractQuote then
    begin
      with qryContractWorktops do
        begin
          close;
          parambyname('Customer').AsInteger := QUpstand.Parent.Customer;
          parambyname('Group_Number').AsInteger := QUpstand.Parent.ContractGroup;
          parambyname('Worktop').asinteger := QUpstand.worktop;
          open;
        end;
      dtsWorktops.dataset := qryContractWorktops;
    end
  else
    begin
      with qryCustomerWorktops do
        begin
          close;
          parambyname('Customer').AsInteger := QUpstand.Parent.Customer;
          parambyname('Material_Type').asinteger := Material;
          parambyname('Worktop').asinteger := QUpstand.worktop;
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
              parambyname('Worktop').asinteger := QUpstand.worktop;
              open;
            end;

          UseCustomerPrices := false;
          dtsWorktops.dataset := qryWorktops;
        end;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQUpstand.RefreshThickness;
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintQUpstand.ShowDetails;
begin
  if Mode <> qelAdd then
  begin
    dblkpMaterial.keyvalue := QUpstand.Material;
    dblkpWorktop.keyvalue := QUpstand.worktop;
    dblkpMaterialUse.keyvalue := QUpstand.MaterialUse;

    with qryWTThickness do
      begin
        close;
        open;
      end;

    dblkpWTThickness.keyvalue := QUpstand.Thickness;

    edtDepth.text := formatfloat('0',QUpstand.Depth);
    edtLength.text := formatfloat('0',QUpstand.Length);
    edtunitPrice.text := formatfloat('0.00',QUpstand.UnitPrice);
    edtPolishCost.text := formatfloat('0.00',QUpstand.PolishCost);
    edtPolishPrice.text := formatfloat('0.00',QUpstand.PolishPrice);
    spnQuantity.value := round(QUpstand.Quantity);
    spnNoOfDepths.value := QUpstand.NoOfDepths;
    spnNoOfLengths.value := QUpstand.NoOfLengths;
    spnNoOfPieces.value := QUpstand.TotalUpstandPieces;
    GetTotalPrice;
  end
  else
  begin
    dblkpMaterial.keyvalue := Material;
    dblkpWorktop.keyvalue := Self.Worktop;
    dblkpMaterialUse.KeyValue := MaterialUse;
    with qryWTThickness do
      begin
        close;
        open;
      end;
    dblkpWTThickness.keyvalue := Self.Thickness;
    if self.Depth <> 0 then
      edtDepth.text := formatfloat('0',self.Depth)
    else
      edtDepth.text := '';
    edtLength.text := '';

    if QUpstand.UnitPrice = 0 then
      GetUnitPrice
    else
      edtUnitPrice.Text := formatfloat('0.00',QUpstand.UnitPrice);

    edtPolishCost.text := formatfloat('0.00',self.PolishCost);
    edtPolishPrice.text := formatfloat('0.00',Self.PolishPrice);
    spnQuantity.value := 1;
    spnNoOfDepths.value := 0;
    spnNoOfLengths.value := 1;
    spnNoOfPieces.value := 1;
    edtTotalPrice.Text := '0.00';

    if Self.Depth <> 0 then
      edtLength.setfocus
    else
      edtdepth.setfocus;
  end;
end;

procedure TfrmWTMaintQUpstand.EnableOK(Sender: TObject);
begin
  btnOK.enabled := (dblkpWorktop.KeyValue <> 0) and
                    (edtDepth.text <> '') and
                    (edtLength.Text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (dblkpWTThickness.KeyValue <> 0);
end;

procedure TfrmWTMaintQUpstand.GetTotalPrice;
var
  rUnitPrice, rPolishPrice, rTotal: real;
  idepth,iLength,iQuantity, iNoLengths, iNoDepths: integer;
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

  try
    rPolishPrice := strtofloat(edtPolishPrice.text);
  except
    rPolishPrice := 0.00;
  end;

  iQuantity := spnQuantity.value;

  iNoDepths := spnNoOfDepths.value;

  iNoLengths := spnNoOflengths.value;

  rTotal := (((idepth * iLength)/1000000)*iQuantity*rUnitPrice)+(((iLength/1000)*iNoLengths)*rPolishPrice*iQuantity)
                                                               +(((iDepth/1000)*iNoDepths)*rPolishPrice*iQuantity);
  edtTotalPrice.text := formatfloat('0.00',rTotal);
  enableOK(self)
end;

procedure TfrmWTMaintQUpstand.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintQUpstand.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
//  QUpstand.Material := FMaterial;
end;

procedure TfrmWTMaintQUpstand.dblkpWorktopClick(Sender: TObject);
begin
  RefreshThickness;
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQUpstand.dblkpWTThicknessClick(Sender: TObject);
begin
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQUpstand.GetUnitPrice;
var
  sText: string;
begin
  if QUpstand.Parent.ContractQuote then
    begin
      with qryContractPrice do
        begin
          close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              SQL.Text := sText;
            end;

          parambyname('Customer').AsInteger := QUpstand.Parent.Customer;
          parambyname('Group_Number').AsInteger := QUpstand.Parent.ContractGroup;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QUpstand.PriceUnit := fieldbyname('Price_unit').asinteger;
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

          parambyname('Customer').AsInteger := QUpstand.Parent.Customer;
          parambyname('Group_Number').AsInteger := dtsWorktops.DataSet.fieldbyname('Group_Number').asinteger;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QUpstand.PriceUnit := fieldbyname('Price_unit').asinteger;
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
          QUpstand.PriceUnit := fieldbyname('Price_unit').asinteger;
          QUpstand.OriginalUnitPrice := fieldbyname('Unit_Price').asfloat;
        end;
    end;

  if frmWTMain.bEndUSer then
    edtUnitPrice.enabled := (strtofloat(edtUnitPrice.Text) = 0);
end;

procedure TfrmWTMaintQUpstand.edtDepthChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQUpstand.spnQuantityChange(Sender: TObject);
begin
  GetTotalPrice;
end;

procedure TfrmWTMaintQUpstand.btnOKClick(Sender: TObject);
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

  QUpstand.Material := dblkpMaterial.KeyValue;
  QUpstand.MaterialUse := dblkpMaterialUse.keyValue;
  QUpstand.MaterialUseDescr := dblkpMaterialUse.text;
  QUpstand.Worktop := dblkpWorktop.KeyValue;
  QUpstand.worktopDesc := dblkpWorktop.Text;
  QUpstand.thickness := dblkpWTThickness.keyvalue;
  QUpstand.thicknessDesc := dblkpWTThickness.Text;
  QUpstand.Depth := strtoint(edtDepth.text);
  QUpstand.Length := strtoint(edtLength.text);
  QUpstand.Quantity := spnQuantity.Value;
  QUpstand.UnitPrice := strtofloat(edtUnitPrice.text);
  QUpstand.PolishCost := strtofloat(edtPolishCost.text);
  QUpstand.PolishPrice := strtofloat(edtPolishPrice.text);
  QUpstand.NoOfDepths := spnNoOfDepths.Value;
  QUpstand.NoOfLengths := spnNoOfLengths.Value;
  QUpstand.TotalUpstandPieces := spnNoofPieces.value;

  if Mode = qelAdd then
  begin
    QUpstand.QENumber := (QUpstand.Parent.Upstands.Count + 1)+1000;
    QUpstand.Parent.Upstands.Add(QUpstand);
  end
  else
  if Mode = qelDelete then
  begin
    inx := QUpstand.Parent.Upstands.IndexOf(QUpstand.QENumber);
    QUpstand.Parent.Upstands.Delete(inx);
  end;
  ModalResult := mrOK;
end;

procedure TfrmWTMaintQUpstand.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintQUpstand.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintQUpstand.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintQUpstand.SetQUpstand(const Value: TQUpstand);
begin
  FQUpstand := Value;
end;

procedure TfrmWTMaintQUpstand.SetPolishPrice(const Value: currency);
begin
  FPolishPrice := Value;
end;

procedure TfrmWTMaintQUpstand.dblkpMaterialClick(Sender: TObject);
begin
  Material := dblkpMaterial.KeyValue;
  RefreshWorktops;
end;

procedure TfrmWTMaintQUpstand.SetMaterialUse(const Value: integer);
begin
  FMaterialUse := Value;
end;

procedure TfrmWTMaintQUpstand.SetDepth(const Value: real);
begin
  FDepth := Value;
end;

procedure TfrmWTMaintQUpstand.SpeedButton1Click(Sender: TObject);
begin
  frmWTLUMaterialUse := TfrmWTLUMaterialUse.create(self);
  try
    frmWTLUMaterialUse.showmodal;
  finally
    frmWTLUMaterialUse.free;
  end;

  RefreshMaterialUse;
end;

procedure TfrmWTMaintQUpstand.RefreshMaterialUse;
begin
  with qryMaterialUse do
    begin
      close;
      parambyname('Material_Use').AsInteger := QUpstand.MaterialUse;
      open;
    end;
end;

procedure TfrmWTMaintQUpstand.SetPolishCost(const Value: currency);
begin
  FPolishCost := Value;
end;

procedure TfrmWTMaintQUpstand.SetProperties;
begin
  dblkpMaterial.Enabled := not QUpstand.parent.ContractQuote;
end;


procedure TfrmWTMaintQUpstand.SetUseCustomerPrices(const Value: boolean);
begin
  FUseCustomerPrices := Value;
end;

end.
