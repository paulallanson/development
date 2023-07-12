(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Page/Letter Layout Lookup form.

VSS Info:
$Header: /PageDesigner/PDLUPage.pas 3     10/03/:0 16:12 Roddym $
$History: PDLUPage.pas $
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/03/:0   Time: 16:12
 * Updated in $/PageDesigner
 * Make the UsesTab attribute visible and allow users to change it.
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 10/02/:0   Time: 16:29
 * Updated in $/PageDesigner
 * New letter layout Quotation Summary allows all lines of an enquiry to
 * be printed in one letter.  Database changes.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
unit PDLUPage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Data.DB;

type
  TPDLuPageFrm = class(TForm)
    CloseBitBtn: TBitBtn;
    SelectBitBtn: TBitBtn;
    DetsDBGrid: TDBGrid;
    btnDelete: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectBitBtnClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    FActDone : Boolean;
    FLayoutName: string;
    FMode: integer;
    procedure DoPageLayout;
    procedure DoEnquiry;
    procedure DoQuotation;
    procedure DoQuotationSummary;
    procedure DoAcknowledgement;
    procedure DoPurchaseOrder;
    procedure SetLayoutName(const Value: string);
    procedure SetMode(const Value: integer);
  public
    property LayoutName : string read FLayoutName write SetLayoutName;
    property Mode : integer read FMode write SetMode;
  end;

implementation

uses
  PageDM, PDLetter, System.UITypes;

{$R *.DFM}

{ TPDLuPageFrm }

procedure TPDLuPageFrm.SetLayoutName(const Value: string);
begin
  FLayoutName := Value;
end;

procedure TPDLuPageFrm.FormActivate(Sender: TObject);
begin
  if not FActDone then
  begin
    case Mode of
      ltPageLayout      : DoPageLayout;
      ltEnquiry         : DoEnquiry;
      ltQuotation       : DoQuotation;
      ltAcknowledgement : DoAcknowledgement;
      ltPurchaseOrder   : DoPurchaseOrder;
      ltQuotationSummary: DoQuotationSummary;
    end;  { case}
    FActDone := true;
    if DetsDBGrid.Datasource.DataSet.RecordCount > 1 then
      btnDelete.Show
    else
      btnDelete.Hide;
  end;
end;

procedure TPDLuPageFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DetsDBGrid.Datasource.DataSet.Close;
end;

procedure TPDLuPageFrm.SelectBitBtnClick(Sender: TObject);
begin
  LayoutName :=
    DetsDBGrid.Datasource.DataSet.FieldByName('Name').AsString;
  ModalResult := mrOK;
end;

procedure TPDLuPageFrm.SetMode(const Value: integer);
begin
  FMode := Value;
end;

procedure TPDLuPageFrm.DoAcknowledgement;
begin
  Caption := 'Select acknowledgement letter layout';
  with DetsDBGrid do
  begin
    DataSource := dmPage.dsLetterLookup;
    Columns[0].Title.Caption := 'Acknowledgement Name';
  end;
  dmPage.qryLetterLookup.ParamByName('Type').AsInteger := ltAcknowledgement;
  dmPage.qryLetterLookup.Open;
end;

procedure TPDLuPageFrm.DoEnquiry;
begin
  Caption := 'Select enquiry letter layout';
  with DetsDBGrid do
  begin
    DataSource := dmPage.dsLetterLookup;
    Columns[0].Title.Caption := 'Enquiry Letter Name';
  end;
  dmPage.qryLetterLookup.ParamByName('Type').AsInteger := ltEnquiry;
  dmPage.qryLetterLookup.Open;
end;

procedure TPDLuPageFrm.DoPageLayout;
begin
  Caption := 'Select page layout';
  with DetsDBGrid do
  begin
    DataSource := dmPage.dsPageLookup;
    Columns[0].Title.Caption := 'Layout Name';
  end;
  dmPage.qryPageLookup.Open;
end;

procedure TPDLuPageFrm.DoPurchaseOrder;
begin
  Caption := 'Select purchase order layout';
  with DetsDBGrid do
  begin
    DataSource := dmPage.dsLetterLookup;
    Columns[0].Title.Caption := 'Purchase Order Name';
  end;
  dmPage.qryLetterLookup.ParamByName('Type').AsInteger := ltPurchaseOrder;
  dmPage.qryLetterLookup.Open;
end;

procedure TPDLuPageFrm.DoQuotation;
begin
  Caption := 'Select quotation letter layout';
  with DetsDBGrid do
  begin
    DataSource := dmPage.dsLetterLookup;
    Columns[0].Title.Caption := 'Quotation Letter Name';
  end;
  dmPage.qryLetterLookup.ParamByName('Type').AsInteger := ltQuotation;
  dmPage.qryLetterLookup.Open;
end;

procedure TPDLuPageFrm.btnDeleteClick(Sender: TObject);
var
  aName : string;
begin
  aName := DetsDBGrid.Datasource.DataSet.FieldByName('Name').AsString;
  if MessageDlg('Are you sure you want to delete layout ' + aName + '?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DetsDBGrid.Datasource.DataSet.Close;
    FActDone := false;
    if Mode = ltPageLayout then
      dmPage.DeletePageLayout(aName)
    else
      dmPage.DeleteLetterLayout(aName);
    FormActivate(nil);
  end;
end;

procedure TPDLuPageFrm.DoQuotationSummary;
begin
  Caption := 'Select quotation summary letter layout';
  with DetsDBGrid do
  begin
    DataSource := dmPage.dsLetterLookup;
    Columns[0].Title.Caption := 'Quotation Summary Letter Name';
  end;
  dmPage.qryLetterLookup.ParamByName('Type').AsInteger := ltQuotationSummary;
  dmPage.qryLetterLookup.Open;
end;

end.
