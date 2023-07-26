(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Send Email Confirmation Form

VSS Info:
$Header: /PBL D5/PBEmailToOne.pas 1     7/11/:2 14:02 Janiner $
$History: PBEmailToOne.pas $
 * 
 * *****************  Version 1  *****************
 * User: Janiner      Date: 7/11/:2    Time: 14:02
 * Created in $/PBL D5
 *
*******************************************************************************)
unit PBEmailToOne;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, CCSCommon, IniFiles, Db, DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBEmailToOneFrm = class(TForm)
    FaxDescrLabel: TLabel;
    FaxNoEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    Label3: TLabel;
    cmbExportFilter: TDBLookupComboBox;
    ExFilterSQL: TFDQuery;
    ExFilterSRC: TDataSource;
    procedure FaxNoEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    sTo, sSubject, sBody, sSalutation: string;
    sAttachmentType : string;
//    FEmailLocation : string;
//    FEmailAttachment : TstringList;
//    FEnquiry : integer;
  end;

var
  PBEmailToOneFrm: TPBEmailToOneFrm;

implementation

{$R *.DFM}

procedure TPBEmailToOneFrm.FaxNoEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TPBEmailToOneFrm.CheckOK(Sender: TObject);
begin
OKBitBtn.Enabled := FaxNoEdit.Text <> '' ;
end;

procedure TPBEmailToOneFrm.OKBitBtnClick(Sender: TObject);
begin
          {Send the email}
          {EmailViaOutlook(Recipient, Subject, Body, Attachment)    }


end;

procedure TPBEmailToOneFrm.FormShow(Sender: TObject);
begin
  with ExFilterSQL do
  begin
    close;
    open;
  end;
  cmbExportFilter.KeyValue := sAttachmentType;
end;

end.
