unit PBLUPartBOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBLUPartBOMFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgdetails: TDBGrid;
    CloseBitBtn: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblDescription: TLabel;
    lblProduct: TLabel;
    dtsdetails: TDataSource;
    qryGetDtls: TFDQuery;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    qryAdd: TFDQuery;
    qryGetNext: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CloseBitBtnClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure dbgdetailsDblClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
  private
    procedure ShowDetails;
    procedure AddPartBOM(tempPart: string);
    function getNextElement(tempPart: string): integer;
    procedure CallMaintScreen(Mode: string);
    { Private declarations }
  public
    Customer: integer;
    Part, Description: string;
  end;

var
  PBLUPartBOMFrm: TPBLUPartBOMFrm;

implementation

uses PBLUProd, PBMaintPartBOM;

{$R *.dfm}

procedure TPBLUPartBOMFrm.FormActivate(Sender: TObject);
begin
  lblProduct.Caption := Part;
  lblDescription.caption := Description;

  ShowDetails;
end;

procedure TPBLUPartBOMFrm.ShowDetails;
begin
  with qryGetDtls do
    begin
      close;
      parambyname('Part').asstring := Part;
      open;

      ChgBitBtn.Enabled := RecordCount > 0;
      DelBitBtn.Enabled := RecordCount > 0;
    end;
end;

procedure TPBLUPartBOMFrm.CloseBitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TPBLUPartBOMFrm.AddBitBtnClick(Sender: TObject);
begin
  PBLUProdFrm := TPBLUProdFrm.create(self);
  try
    PBLUProdFrm.iCust := Customer;
    PBLUProdFrm.showmodal;
    if PBLUProdFrm.ModalResult = idok then
      AddPartBom(PBLUProdFrm.Part);
  finally
    PBLUProdFrm.free;
    ShowDetails;
  end;
end;

procedure TPBLUPartBOMFrm.AddPartBOM(tempPart: string);
begin
  with qryAdd do
    begin
      close;
      parambyname('Part').asstring := Part;
      parambyname('Element_no').asinteger := GetNextElement(Part);
      parambyname('Composite_Part').asstring := tempPart;
      parambyname('Quantity').asinteger := 1;
      execsql;
    end;
end;

function TPBLUPartBOMFrm.getNextElement(tempPart: string): integer;
begin
  with qryGetNext do
    begin
      close;
      parambyname('Part').asstring := tempPart;
      open;
      result := fieldbyname('Last_Element').asinteger + 1;
    end;
end;

procedure TPBLUPartBOMFrm.ChgBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TPBLUPartBOMFrm.CallMaintScreen(Mode: string);
var
  CompPart, CompDesc: string;
begin
  PBMaintPartBOMfrm := TPBMaintPartBOMfrm.create(self);

  try
    PBMaintPartBOMfrm.caption := PBMaintPartBOMfrm.caption + ' ' + dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
    PBMaintPartBOMfrm.Part := dbgDetails.datasource.dataset.fieldbyname('Part').asstring;
    PBMaintPartBOMfrm.ElementNo := dbgDetails.datasource.dataset.fieldbyname('Element_no').asinteger;
    PBMaintPartBOMfrm.CompositePart := dbgDetails.datasource.dataset.fieldbyname('Composite_Part').asstring;
    PBMaintPartBOMfrm.Description := dbgDetails.datasource.dataset.fieldbyname('Part_Description').asstring;
    PBMaintPartBOMfrm.Quantity := dbgDetails.datasource.dataset.fieldbyname('Quantity').asinteger;
    PBMaintPartBOMfrm.mode := Mode;
    PBMaintPartBOMfrm.showmodal;
    if PBMaintPartBOMfrm.Modalresult = idOk then
      begin
        ShowDetails;
        if Mode = 'C' then
          dbgDetails.DataSource.DataSet.Locate('Element_no', Variant(inttostr(PBMaintPartBOMfrm.ElementNo)),[lopartialKey])
        else
          dbgDetails.DataSource.DataSet.Locate('Element_no', Variant(inttostr(PBMaintPartBOMfrm.ElementNo-1)),[lopartialKey])
      end;
  finally
    PBMaintPartBOMfrm.free;
  end;
end;

procedure TPBLUPartBOMFrm.dbgdetailsDblClick(Sender: TObject);
begin
  chgbitbtnclick(self);
end;

procedure TPBLUPartBOMFrm.DelBitBtnClick(Sender: TObject);
begin
  CallMaintScreen('D');
end;

end.
