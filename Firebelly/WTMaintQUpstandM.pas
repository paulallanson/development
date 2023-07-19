unit wtMaintQUpstandM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CRControls, DBCtrls, ExtCtrls, DB, wtQuotesDM, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmWTMaintQUpstandM = class(TForm)
    pnlDetails: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnWorktops: TSpeedButton;
    Label9: TLabel;
    btnPriceGroup: TSpeedButton;
    dblkpWTThickness: TDBLookupComboBox;
    dblkpWorktop: TDBLookupComboBox;
    edtUnitPrice: TCREditMoney;
    dblkpWTGroup: TDBLookupComboBox;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    qryWTGroup: TFDQuery;
    dtsWTGroup: TDataSource;
    qryOneWTThickness: TFDQuery;
    dtsWorktops: TDataSource;
    qryWTThickness: TFDQuery;
    dtsWTThickness: TDataSource;
    qryWorktops: TFDQuery;
    dblkpMaterial: TDBLookupComboBox;
    qryMaterial: TFDQuery;
    dtsMaterial: TDataSource;
    qryContractWorktops: TFDQuery;
    qryContractPrice: TFDQuery;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpWorktopClick(Sender: TObject);
    procedure dblkpWTThicknessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWorktopsClick(Sender: TObject);
    procedure dblkpWTGroupClick(Sender: TObject);
    procedure btnPriceGroupClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dblkpMaterialClick(Sender: TObject);
  private
    FActivated: boolean;
    FThickness: integer;
    FWorktopGroup: integer;
    FWorktop: integer;
    FMaterial: integer;
    FMaterialType: string;
    FQUpstand: TQUpstand;
    procedure SetMaterial(const Value: integer);
    procedure SetMaterialType(const Value: string);
    procedure SetQUpstand(const Value: TQUpstand);
    procedure SetThickness(const Value: integer);
    procedure SetWorktop(const Value: integer);
    procedure SetWorktopGroup(const Value: integer);
    procedure RefreshThickness;
    procedure RefreshGroups;
    procedure RefreshWorktops;
    procedure ShowDetails;
    procedure GetUnitPrice;
    procedure EnableButtons;
    procedure SetProperties;
    { Private declarations }
  public
    property Material: integer read FMaterial write SetMaterial;
    property MaterialType: string read FMaterialType write SetMaterialType;
    property QUpstand: TQUpstand read FQUpstand write SetQUpstand;
    property Worktop: integer read FWorktop write SetWorktop;
    property WorktopGroup: integer read FWorktopGroup write SetWorktopGroup;
    property Thickness: integer read FThickness write SetThickness;
  end;

var
  frmWTMaintQUpstandM: TfrmWTMaintQUpstandM;

implementation

uses wtLUworktops, wtMain;

{$R *.dfm}

{ TfrmWTMaintQUpstandM }

procedure TfrmWTMaintQUpstandM.SetMaterial(const Value: integer);
begin
  FMaterial := Value;
//  QUpstand.Material := FMaterial;
end;

procedure TfrmWTMaintQUpstandM.SetMaterialType(const Value: string);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintQUpstandM.SetQUpstand(const Value: TQUpstand);
begin
  FQUpstand := Value;
end;

procedure TfrmWTMaintQUpstandM.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

procedure TfrmWTMaintQUpstandM.SetWorktop(const Value: integer);
begin
  FWorktop := Value;
end;

procedure TfrmWTMaintQUpstandM.SetWorktopGroup(const Value: integer);
begin
  FWorktopGroup := Value;
end;

procedure TfrmWTMaintQUpstandM.FormActivate(Sender: TObject);
begin
  if not FActivated then
  begin
    with qryMaterial do
      begin
        close;
        parambyname('Material_Type').AsInteger := QUpstand.Material;
        open;
      end;

    RefreshGroups;

    if frmWTMain.bEndUSer then
      EnableButtons;
      
    edtUnitPrice.Enabled := not frmWTMain.bEndUser;

    if frmWTMain.bEndUser then
      edtUnitPrice.Enabled := (QUpstand.OriginalUnitPrice = 0);

    ShowDetails;

    SetProperties;

    EnableOK(Self);
  end;
end;

procedure TfrmWTMaintQUpstandM.EnableButtons;
begin
  btnPriceGroup.visible := false;
  btnWorktops.visible := false;
end;

procedure TfrmWTMaintQUpstandM.RefreshGroups;
begin
  with qryWTGroup do
    begin
      close;
      parambyname('Material_Type').AsInteger := QUpstand.Material;
      parambyname('Worktop_Group').AsInteger := 0;
      open;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQUpstandM.RefreshWorktops;
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
      with qryWorktops do
        begin
          close;
          parambyname('Material_Type').asinteger := QUpstand.Material;
          parambyname('Worktop_Group').asinteger := dblkpWTGroup.keyvalue;
          parambyname('Worktop').asinteger := QUpstand.worktop;
          open;
        end;
      dtsWorktops.dataset := qryWorktops;
    end;

  enableok(self);
end;

procedure TfrmWTMaintQUpstandM.RefreshThickness;
begin
  with qryWTThickness do
    begin
      close;
      open;
    end;
  enableok(self);
end;

procedure TfrmWTMaintQUpstandM.ShowDetails;
begin
  dblkpMaterial.keyvalue := QUpstand.Material;

  dblkpWTGroup.keyvalue := 0;

  RefreshWorktops;
  dblkpWorktop.keyvalue := QUpstand.worktop;

  with qryWTThickness do
    begin
      close;
      open;
    end;

  dblkpWTThickness.keyvalue := QUpstand.Thickness;
  edtunitPrice.text := formatfloat('0.00',QUpstand.UnitPrice);
end;

procedure TfrmWTMaintQUpstandM.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpMaterial.text <> '') and
                    (dblkpWorktop.text <> '') and
                    (edtUnitPrice.Text <> '') and
                    (dblkpWTThickness.text <> '');
end;
procedure TfrmWTMaintQUpstandM.dblkpWorktopClick(Sender: TObject);
begin
  RefreshThickness;
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQUpstandM.dblkpWTThicknessClick(Sender: TObject);
begin
  GetUnitPrice;
  enableOK(self);
end;

procedure TfrmWTMaintQUpstandM.GetUnitPrice;
begin
  if QUpstand.Parent.ContractQuote then
    begin
      with qryContractPrice do
        begin
          close;
          parambyname('Customer').AsInteger := QUpstand.Parent.Customer;
          parambyname('Group_Number').AsInteger := QUpstand.Parent.ContractGroup;
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
          parambyName('worktop').asinteger := dblkpWorktop.keyvalue;
          parambyName('thickness').asinteger := dblkpWTThickness.keyvalue;
          open;
          edtUnitPrice.Text := formatfloat('0.00',fieldbyname('Unit_Price').asfloat);
          QUpstand.PriceUnit := fieldbyname('Price_unit').asinteger;
        end;
    end;
end;

procedure TfrmWTMaintQUpstandM.FormCreate(Sender: TObject);
begin
  self.Worktop := 0;
  self.Thickness := 0;
end;

procedure TfrmWTMaintQUpstandM.btnWorktopsClick(Sender: TObject);
begin
  frmWTLUWorktops := TfrmWTLUWorktops.create(self);
  try
    frmWTLUWorktops.showmodal;
  finally
    frmWTLUWorktops.free;
  end;

  RefreshWorktops;
  RefreshThickness;
  (*  qryWorktops.close;
  qryWorktops.open;
*)end;

procedure TfrmWTMaintQUpstandM.dblkpWTGroupClick(Sender: TObject);
begin
  RefreshWorktops;
end;

procedure TfrmWTMaintQUpstandM.btnPriceGroupClick(Sender: TObject);
begin
  dblkpWTGroup.KeyValue := 0;
  RefreshWorktops;
end;

procedure TfrmWTMaintQUpstandM.btnOKClick(Sender: TObject);
begin
  if frmWTMain.bEndUser then
    begin
      if (strtofloat(edtUnitPrice.text) = 0) then
        begin
          messagedlg('A zero unit price is not allowed.', mterror, [mbOk], 0);
          edtUnitPrice.setfocus;
          exit;
        end;
    end;

  if messagedlg('Apply the changes to ALL the upstands, splashbacks, etc.?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    QUpstand.Material := dblkpMaterial.KeyValue;
    QUpstand.Worktop := dblkpWorktop.KeyValue;
    QUpstand.worktopDesc := dblkpWorktop.Text;
    QUpstand.thickness := dblkpWTThickness.keyvalue;
    QUpstand.thicknessDesc := dblkpWTThickness.Text;
    QUpstand.UnitPrice := strtofloat(edtUnitPrice.text);
    ModalResult := mrOK;
  end;
end;

procedure TfrmWTMaintQUpstandM.dblkpMaterialClick(Sender: TObject);
begin
  if Material <> dblkpMaterial.KeyValue then
    begin
      dblkpWTGroup.KeyValue := 0;
      dblkpWorktop.KeyValue := 0;
      dblkpWTThickness.KeyValue := 0;
      QUpstand.worktop := 0;  
    end;
  Material := dblkpMaterial.KeyValue;
  RefreshGroups;
  RefreshWorktops;
  EnableOK(self);
end;

procedure TfrmWTMaintQUpstandM.SetProperties;
begin
  dblkpMaterial.Enabled := not QUpstand.parent.ContractQuote;
  dblkpWTGroup.Enabled := not QUpstand.parent.ContractQuote;
end;


end.
