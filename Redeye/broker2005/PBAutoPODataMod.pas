unit PBAutoPODataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBAutoPODM = class(TDataModule)
    GetLinesNotPOedSQL: TFDQuery;
    UpdEnqHeadSQL: TFDQuery;
    AddNotesSQL: TFDQuery;
    UpdEnqLineSQL: TFDQuery;
    GetExtChgsSQL: TFDQuery;
    GetQtysSQL: TFDQuery;
    QtysSRC: TDataSource;
    GetProofStatSQL: TFDQuery;
    ProofStatSRC: TDataSource;
    GetContactSQL: TFDQuery;
    ContactSRC: TDataSource;
    GetVATSQL: TFDQuery;
    VATSRC: TDataSource;
    InvMethSRC: TDataSource;
    GetInvMethSQL: TFDQuery;
    GetEnqSQL: TFDQuery;
    GetExistPOsSQL: TFDQuery;
    GetPartsSQL: TFDQuery;
    GetAddDetsSQL: TFDQuery;
    Old_GetQtysSQL: TFDQuery;
    GetQuestionsSQL: TFDQuery;
    GetAnswersSQL: TFDQuery;
    GetPriceUnitSQL: TFDQuery;
    qrySelRep: TFDQuery;
    qrySelCustAddress: TFDQuery;
    qrySelCompanyAddress: TFDQuery;
    qryJobTypes: TFDQuery;
  public
    function GetPriceUnitDescr(TempCode: integer): string;
  end;

var
  PBAutoPODM: TPBAutoPODM;

implementation

{$R *.DFM}

function TPBAutoPODM.GetPriceUnitDescr(TempCode: integer): string;
begin
  with GetPriceUnitSQL do
    begin
      close;
      parambyname('Price_Unit').asinteger := TempCode;
      open;
      result := fieldbyname('Description').asstring;
    end;
end;

end.
