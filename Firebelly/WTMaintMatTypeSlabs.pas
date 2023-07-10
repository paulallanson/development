unit WTMaintMatTypeSlabs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, CRControls, DB, DBTables;

type
  TfrmWTMaintMatTypeSlabs = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    edtLength: TCREditInt;
    edtDepth: TCREditInt;
    edtSlabSizeDescription: TEdit;
    qryUpdate: TQuery;
    qryAdd: TQuery;
    procedure EnableOK(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtLengthChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    FMaterialType: integer;
    FFunctionMode: string;
    procedure SetFunctionMode(const Value: string);
    procedure SetMaterialType(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    SlabSize: integer;
    property FunctionMode: string read FFunctionMode write SetFunctionMode;
    property MaterialType: integer read FMaterialType write SetMaterialType;
  end;

var
  frmWTMaintMatTypeSlabs: TfrmWTMaintMatTypeSlabs;

implementation

uses wtMaintMatType;

{$R *.dfm}

{ TfrmWTMaintMatTypeSlabs }

procedure TfrmWTMaintMatTypeSlabs.SetFunctionMode(const Value: string);
begin
  FFunctionMode := Value;
end;

procedure TfrmWTMaintMatTypeSlabs.SetMaterialType(const Value: integer);
begin
  FMaterialType := Value;
end;

procedure TfrmWTMaintMatTypeSlabs.FormActivate(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      edtLength.SetFocus;
    end;

  EnableOK(self);
end;

procedure TfrmWTMaintMatTypeSlabs.EnableOK(Sender: TObject);
begin
  btnOK.enabled :=  (edtLength.text <> '') and
                    (edtDepth.text <> '');
end;

procedure TfrmWTMaintMatTypeSlabs.edtLengthChange(Sender: TObject);
begin
  enableok(self);
end;

procedure TfrmWTMaintMatTypeSlabs.btnOKClick(Sender: TObject);
begin
  if FunctionMode = 'A' then
    begin
      with qryAdd do
      begin
        Close;
        parambyname('Slab_Size_Description').asstring := edtSlabSizeDescription.text;
        parambyname('Length').asinteger := strtoint(edtLength.text);
        parambyname('Depth').asinteger := strtoint(edtDepth.text);
        parambyname('Material_Type').asinteger := self.MaterialType;
        execsql;
      end;
    end
  else
    begin
      with qryUpdate do
      begin
        Close;
        parambyname('Slab_Size').asinteger := self.SlabSize;
        parambyname('Slab_Size_Description').asstring := edtSlabSizeDescription.text;
        parambyname('Length').asinteger := strtoint(edtLength.text);
        parambyname('Depth').asinteger := strtoint(edtDepth.text);
        execsql;
      end;
    end;
end;

end.
