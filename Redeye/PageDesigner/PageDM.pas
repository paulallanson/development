(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  DataModule for Page/Letter Layout Designer for Broker.

VSS Info:
$Header: /PageDesigner/PageDM.pas 3     10/02/:0 11:59 Roddym $
$History: PageDM.pas $
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/02/:0   Time: 11:59
 * Updated in $/PageDesigner
 * Add questions and answers to Purchase Order and Acknowledgement letter
 * layouts.  Add new page layout field PrintDefault similar to FaxDefault.
 * Add new letter layout field LetterTypeDefault so we can display the
 * user's selected default on print selection forms in Broker.  Version
 * number of PageDesigner raised to 2.2a
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 7/01/:0    Time: 16:41
 * Updated in $/PageDesigner
 * Changes to Letter object, also hard-coded version to make switch
 * transparent to Forms Technology.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 6/01/:0    Time: 16:13
 * Created in $/PageDesigner
 * First check in. New page and letter layout designer tool for use with
 * Broker in customising enquiries, quotations, purchase orders and
 * acknowledgements.

*******************************************************************************)
unit PageDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPage = class(TDataModule)
    qryPage: TFDQuery;
    dsPage: TDataSource;
    qryPagef_PageLayoutName: TStringField;
    qryPagef_TopMargin: TFloatField;
    qryPagef_LeftMargin: TFloatField;
    qryPagef_BottomMargin: TFloatField;
    qryPagef_RightMargin: TFloatField;
    qryPagef_Preprinted: TStringField;
    qryPagef_PrintLogo: TStringField;
    qryPagef_PrintAddress: TStringField;
    qryPagef_LogoTop: TFloatField;
    qryPagef_LogoLeft: TFloatField;
    qryPagef_LogoWidth: TFloatField;
    qryPagef_LogoHeight: TFloatField;
    qryPagef_AddressTop: TFloatField;
    qryPagef_AddressLeft: TFloatField;
    qryPagef_AddressWidth: TFloatField;
    qryPagef_AddressHeight: TFloatField;
    qryPagef_PaperSize: TStringField;
    qryPagef_Portrait: TStringField;
    qryPagef_Units: TStringField;
    qryPagef_PPTop: TFloatField;
    qryPagef_PPLeft: TFloatField;
    qryPagef_PPWidth: TFloatField;
    qryPagef_PPHeight: TFloatField;
    qryPagef_LogoFile: TStringField;
    qryPageLookup: TFDQuery;
    dsPageLookup: TDataSource;
    qryLetterLookup: TFDQuery;
    dsLetterLookup: TDataSource;
    qryDelete: TFDQuery;
    qryPagef_FaxDefault: TStringField;
    qryPagef_PrintDefault: TStringField;
    qryDefaults: TFDQuery;
    qryPagef_AddressFontName: TStringField;
    qryPagef_AddressFontSize: TIntegerField;
    qryPagef_AddressFontStyle: TIntegerField;
    qryPagef_AddressAlignment: TStringField;
    qryPagef_AddressPrintByLine: TStringField;
    qryPagef_PrintLogo1: TStringField;
    qryPagef_PrintLogo2: TStringField;
    qryPagef_PrintLogo3: TStringField;
    qryPagef_PrintRegAddress: TStringField;
    qryPagef_Logo1Top: TFloatField;
    qryPagef_Logo1Left: TFloatField;
    qryPagef_Logo1Width: TFloatField;
    qryPagef_Logo1Height: TFloatField;
    qryPagef_Logo2Top: TFloatField;
    qryPagef_Logo2Left: TFloatField;
    qryPagef_Logo2Width: TFloatField;
    qryPagef_Logo2Height: TFloatField;
    qryPagef_Logo3Top: TFloatField;
    qryPagef_Logo3Left: TFloatField;
    qryPagef_Logo3Width: TFloatField;
    qryPagef_Logo3Height: TFloatField;
    qryPagef_LogoFile1: TStringField;
    qryPagef_LogoFile2: TStringField;
    qryPagef_LogoFile3: TStringField;
    qryPagef_RegAddressTop: TFloatField;
    qryPagef_RegAddressLeft: TFloatField;
    qryPagef_RegAddressWidth: TFloatField;
    qryPagef_RegAddressHeight: TFloatField;
    qryPagef_RegAddressFontName: TStringField;
    qryPagef_RegAddressFontSize: TIntegerField;
    qryPagef_RegAddressFontStyle: TIntegerField;
    qryPagef_RegAddressAlignment: TStringField;
    qryPagef_RegAddressPrintByLine: TStringField;
  private
    { Private declarations }
  public
    procedure ClearFaxDefault(const exclude : string);
    procedure ClearPrintDefault(const exclude : string);
    procedure DeleteLetterLayout(const aName : string);
    procedure DeletePageLayout(const aName : string);
  end;

var
  dmPage: TdmPage;

implementation

uses PBDatabase;

{$R *.DFM}

{ TdmPage }

procedure TdmPage.DeleteLetterLayout(const aName: string);
begin
  with qryDelete do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM tb_LetterElement WHERE f_LetterName = ''' +
      aName + '''');
    ExecSQL;
    SQL.Clear;
    SQL.Add('DELETE FROM tb_LetterLayout WHERE f_LetterName = ''' +
      aName + '''');
    ExecSQL;
  end;
end;

procedure TdmPage.DeletePageLayout(const aName: string);
begin
  with qryDelete do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM tb_PageLayout WHERE f_PageLayoutName = ''' +
      aName + '''');
    ExecSQL;
  end;
end;


procedure TdmPage.ClearFaxDefault(const exclude : string);
begin
  if exclude <> '' then
  with qryDefaults do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tb_PageLayout SET f_FaxDefault = ''N'' ' +
            'WHERE f_PageLayoutName <> ''' + exclude + '''');
    ExecSQL;
  end;
end;

procedure TdmPage.ClearPrintDefault(const exclude : string);
begin
  if exclude <> '' then
  with qryDefaults do
  begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE tb_PageLayout SET f_PrintDefault = ''N'' ' +
            'WHERE f_PageLayoutName <> ''' + exclude + '''');
    ExecSQL;
  end;
end;

end.
