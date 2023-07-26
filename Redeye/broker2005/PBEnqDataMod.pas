(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  A description of the unit here

VSS Info:
$Header: /PBL D5/PBEnqDataMod.pas 3     23/12/:2 16:27 Paul $
$History: PBEnqDataMod.pas $
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 23/12/:2   Time: 16:27
 * Updated in $/PBL D5
 * Added the Optional Charges selection
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 16/02/:0   Time: 13:29
 * Updated in $/PBL D5
 * Changed to correct the Enquiry Line SQL for Access database version
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBEnqDataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, PBEnqObjects, PBPOObjects, PBDocObjects,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEnqDataModFrm = class(TDataModule)
    EnqHeadSQL: TFDQuery;
    EnqLineSQL: TFDQuery;
    EnqHeadSRC: TDataSource;
    EnqLineQtySQL: TFDQuery;
    EnqLineQSQL: TFDQuery;
    EnqLineAddSQL: TFDQuery;
    EnqLinePartSQL: TFDQuery;
    EnqLineCapSQL: TFDQuery;
    EnqLineSRC: TDataSource;
    EnqLineQtySRC: TDataSource;
    EnqLineQSRC: TDataSource;
    EnqLineAddSRC: TDataSource;
    EnqLinePartSRC: TDataSource;
    EnqLineCapSRC: TDataSource;
    EnqLineSuppSQL: TFDQuery;
    EnqLineSuppSRC: TDataSource;
    OldEnqLineSQL: TFDQuery;
    EnqLineOptSQL: TFDQuery;
    DataSource1: TDataSource;
    qryDelEnqLineDocs: TFDQuery;
    qryInsEnqLineDoc: TFDQuery;
    qrySelEnqLineDocs: TFDQuery;
    procedure PBEnqDataModFrmCreate(Sender: TObject);
    procedure PBEnqDataModFrmDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Save(Enquiry: TEnquiry);
    procedure Load(var Enquiry: TEnquiry);
  end;

var
  PBEnqDataModFrm: TPBEnqDataModFrm;

implementation

{$R *.DFM}

procedure TPBEnqDataModFrm.Load(var Enquiry: TEnquiry);
var
  line: TEnquiryLine;
  lineInx: integer;
begin
  self.EnqLineSQL.First;
  for lineInx := 0 to self.EnqLineSQL.RecordCount - 1 do
  begin
    line := TEnquiryLine.Create;
    line.JobType := EnqLineSQL.FieldByName('job_type').asInteger;
    line.DocumentList.EnqNo := Enquiry.EnquiryNo;
    line.DocumentList.LineNo := lineInx + 1;
    line.DocumentList.Load;

    Enquiry.Lines.Add(line);

    self.EnqLineSQL.next;
  end;
end;

procedure TPBEnqDataModFrm.PBEnqDataModFrmCreate(Sender: TObject);
begin
  enqheadSQL.Active := True;
  enqlineSQL.Active := True;
  enqlineQtySQL.Active := True;
  enqlineQSQL.Active := True;
  enqlineAddSQL.Active := True;
  enqlinePartSQL.Active := True;
  enqlineCapSQL.Active := True;
  enqlineOptSQL.Active := True;
  enqlineSuppSQL.Active := True;
end;

procedure TPBEnqDataModFrm.PBEnqDataModFrmDestroy(Sender: TObject);
begin
  enqheadSQL.Active := False;
  enqlineSQL.Active := False;
  enqlineQtySQL.Active := False;
  enqlineQSQL.Active := False;
  enqlineAddSQL.Active := False;
  enqlinePartSQL.Active := False;
  enqlineCapSQL.Active := False;
  enqlineOptSQL.Active := False;
  enqlineSuppSQL.Active := False;

end;

procedure TPBEnqDataModFrm.Save(Enquiry: TEnquiry);
var
  lineInx: integer;
begin
  for lineInx := 0 to Enquiry.Lines.Count - 1 do
  begin
    Enquiry.Lines[lineInx].DocumentList.Save;
  end;
end;

end.
