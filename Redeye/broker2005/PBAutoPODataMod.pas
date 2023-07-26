(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Auto-convert Enquiry to Purchase Order Data Module.

VSS Info:
$Header: /PBL D5/PBAutoPODataMod.pas 6     9/07/03 13:02 Davidn $
$History: PBAutoPODataMod.pas $
 * 
 * *****************  Version 6  *****************
 * User: Davidn       Date: 9/07/03    Time: 13:02
 * Updated in $/PBL D5
 * Changed to prompt for delivery address type, delivery in to stock and
 * invoiced upfront
 * 
 * *****************  Version 5  *****************
 * User: Paul         Date: 13/09/:2   Time: 9:38
 * Updated in $/PBL D5
 * Changed to correctly work out the prices if Run On qty entered.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 11/02/:0   Time: 15:29
 * Updated in $/PBL D5
 * Fix bug where all questions were not being associated with a Purchase
 * Order, especially when adding from scratch rather than from an enquiry.
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/02/:0   Time: 12:00
 * Updated in $/PBL D5
 * Add questions and answers to Purchase Order and Acknowledgement
 * structures and letter layouts.  Add new page layout field PrintDefault
 * similar to FaxDefault.  Add new letter layout field LetterTypeDefault
 * so we can display the user's selected default on print selection forms
 * in Broker.
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 2/02/:0    Time: 10:16
 * Updated in $/PBL D5
 * Changed GetQtysSQL to standard SQL format for use with SQL Server and
 * Access
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:35
 * Created in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
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
