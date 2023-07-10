(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Send Fax Confirmation Form

VSS Info:
$Header: /PBL D5/PBFaxToOne.pas 1     7/12/99 9:41 Roddym $
$History: PBFaxToOne.pas $
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit PBFaxToOne;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBFaxToOneFrm = class(TForm)
    FaxDescrLabel: TLabel;
    FaxNoEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    procedure FaxNoEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBFaxToOneFrm: TPBFaxToOneFrm;

implementation

uses PBSendFax;

{$R *.DFM}

procedure TPBFaxToOneFrm.FaxNoEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TPBFaxToOneFrm.CheckOK(Sender: TObject);
begin
OKBitBtn.Enabled := FaxNoEdit.Text <> '' ;
end;

procedure TPBFaxToOneFrm.OKBitBtnClick(Sender: TObject);
begin
PBSendFaxFrm.OutToFax(FaxNoEdit.Text, FaxDescrLabel.Caption, '');
end;

end.
