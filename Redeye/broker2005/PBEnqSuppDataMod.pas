(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Enquiry/Supplier DataModule Form

VSS Info:
$Header: /PBL D5/PBEnqSuppDataMod.pas 2     28/09/:0 11:22 Paul $
$History: PBEnqSuppDataMod.pas $
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 28/09/:0   Time: 11:22
 * Updated in $/PBL D5
 * Changed to use a standard Additional Charges maintenance and lookup
 * selection form
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqSuppDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqSuppDataModFrm = class(TDataModule)
    EnqHeadSQL: TFDQuery;
    EnqHeadSRC: TDataSource;
    EnqLineSQL: TFDQuery;
    EnqLineSRC: TDataSource;
    EnqSuppSQL: TFDQuery;
    EnqSuppSRC: TDataSource;
    EnqSuppQtySQL: TFDQuery;
    EnqSuppQtySRC: TDataSource;
    EnqSuppChgsSQL: TFDQuery;
    DelChargeSQL: TFDQuery;
    AddEnqSuppChgsSQL: TFDQuery;
    procedure PBEnqSuppDataModFrmCreate(Sender: TObject);
    procedure PBEnqSuppDataModFrmDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBEnqSuppDataModFrm: TPBEnqSuppDataModFrm;

implementation

{$R *.DFM}

procedure TPBEnqSuppDataModFrm.PBEnqSuppDataModFrmCreate(Sender: TObject);
begin
  enqheadSQL.Active := True;
  enqlineSQL.Active := True;
  enqSuppSQL.Active := True;
  enqSuppQtySQL.Active := True;
  enqSuppChgsSQL.Active := True;

end;

procedure TPBEnqSuppDataModFrm.PBEnqSuppDataModFrmDestroy(Sender: TObject);
begin
  enqheadSQL.Active := False;
  enqlineSQL.Active := False;
  enqSuppSQL.Active := False;
  enqSuppQtySQL.Active := False;
  enqSuppChgsSQL.Active := False;
end;

end.
