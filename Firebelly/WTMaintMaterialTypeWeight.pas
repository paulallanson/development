unit WTMaintMaterialTypeWeight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, DBCtrls, CRControls;

type
  TfrmWTMaintMaterialTypeWeight = class(TForm)
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    qryThickness: TQuery;
    dtsThickness: TDataSource;
    qryAdd: TQuery;
    qryUpdate: TQuery;
    dblkpThickness: TDBLookupComboBox;
    edtWeight: TCREditMoney;
    procedure FormActivate(Sender: TObject);
    procedure EnableOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FWorktopType: integer;
    FWeight: real;
    FFunctionMode: string;
    FIDPointer: integer;
    FThickness: integer;
    procedure SetFunctionMode(const Value: string);
    procedure SetWeight(const Value: real);
    procedure SetWorktopType(const Value: integer);
    procedure SetIDPointer(const Value: integer);
    procedure SetThickness(const Value: integer);
    { Private declarations }
  public
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property IDPointer: integer read FIDPointer write SetIDPointer;
    property Thickness: integer read FThickness write SetThickness;
    property Weight: real read FWeight write SetWeight;
    property WorktopType: integer read FWorktopType write SetWorktopType;
  end;

var
  frmWTMaintMaterialTypeWeight: TfrmWTMaintMaterialTypeWeight;

implementation

{$R *.dfm}

{ TfrmWTMaintMaterialTypeWeight }

procedure TfrmWTMaintMaterialTypeWeight.SetFunctionMode(
  const Value: string);
begin
  FFunctionMode := Value;
  dblkpThickness.Enabled := (FFunctionMode = 'A')
end;

procedure TfrmWTMaintMaterialTypeWeight.SetWeight(const Value: real);
begin
  FWeight := Value;
end;

procedure TfrmWTMaintMaterialTypeWeight.SetWorktopType(
  const Value: integer);
begin
  FWorktopType := Value;
end;

procedure TfrmWTMaintMaterialTypeWeight.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      edtWeight.Text := '';
      dblkpThickness.SetFocus;
    end
  else
    begin
      dblkpThickness.keyvalue := Thickness;
      edtWeight.text := formatfloat('0.00',self.Weight);
      edtWeight.SetFocus;
    end;

  with qryThickness do
    begin
      close;
      parambyname('Worktop_Type').asinteger := WorktopType;
      parambyname('Thickness').asinteger := Thickness;
      open;
    end;

  EnableOK(self);
end;

procedure TfrmWTMaintMaterialTypeWeight.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (dblkpThickness.text <> '') and
                    (edtWeight.text <> '');
end;

procedure TfrmWTMaintMaterialTypeWeight.btnOKClick(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      with qryAdd do
        begin
          close;
          parambyname('Worktop_Type').asinteger := WorktopType;
          parambyname('Thickness').asinteger := dblkpThickness.keyvalue;
          parambyname('Weight_kg').asfloat := strtofloat(edtWeight.text);
          execsql;
        end;
    end
  else
    begin
      with qryUpdate do
        begin
          close;
          parambyname('ID').asinteger := IDPointer;
          parambyname('Weight_kg').asfloat := strtofloat(edtWeight.text);
          execsql;
        end;
    end;
end;

procedure TfrmWTMaintMaterialTypeWeight.SetIDPointer(const Value: integer);
begin
  FIDPointer := Value;
end;

procedure TfrmWTMaintMaterialTypeWeight.SetThickness(const Value: integer);
begin
  FThickness := Value;
end;

end.
