(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Main form for Page/Letter Layout Designer for Broker.

VSS Info:
$Header: /PageDesigner/PDMainMenu.pas 10    10/05/:1 14:16 Paul $
$History: PDMainMenu.pas $
 * 
 * *****************  Version 10  *****************
 * User: Paul         Date: 10/05/:1   Time: 14:16
 * Updated in $/PageDesigner
 * Changed to allow the setting of the 'Set data to Tab'
 * 
 * *****************  Version 9  *****************
 * User: Paul         Date: 3/08/:0    Time: 12:49
 * Updated in $/PageDesigner
 * Upgraded Version number to 3.1a
 * 
 * *****************  Version 8  *****************
 * User: Roddym       Date: 30/03/:0   Time: 10:34
 * Updated in $/PageDesigner
 * Changes to the way column widths and indents are handled.  New dialog
 * to confirm column width changes.  Propagate letter font changes to the
 * elements.
 * 
 * *****************  Version 7  *****************
 * User: Roddym       Date: 8/03/:0    Time: 17:09
 * Updated in $/PageDesigner
 * Infinitely configurable printing layouts (well, almost).
 * 
 * *****************  Version 6  *****************
 * User: Roddym       Date: 15/02/:0   Time: 17:11
 * Updated in $/PageDesigner
 * New feature to allow setting of two tab stops per letter so the use can
 * size the virtual columns.  Version bumped to 2.3a because of this and
 * database changes.
 * 
 * *****************  Version 5  *****************
 * User: Roddym       Date: 10/02/:0   Time: 16:29
 * Updated in $/PageDesigner
 * New letter layout Quotation Summary allows all lines of an enquiry to
 * be printed in one letter.  Database changes.
 * 
 * *****************  Version 4  *****************
 * User: Roddym       Date: 10/02/:0   Time: 11:59
 * Updated in $/PageDesigner
 * Add questions and answers to Purchase Order and Acknowledgement letter
 * layouts.  Add new page layout field PrintDefault similar to FaxDefault.
 * Add new letter layout field LetterTypeDefault so we can display the
 * user's selected default on print selection forms in Broker.  Version
 * number of PageDesigner raised to 2.2a
 * 
 * *****************  Version 3  *****************
 * User: Roddym       Date: 10/01/:0   Time: 11:27
 * Updated in $/PageDesigner
 * New feature:  generate SQL statements to create layout and element
 * entries in the database based on the internal hard coded values.
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
unit PDMainMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TPDMainMenuFrm = class(TForm)
    CompLogoImage: TImage;
    gbButtons: TGroupBox;
    btnAbout: TBitBtn;
    btnClose: TBitBtn;
    btnPaper: TBitBtn;
    btnEnquiry: TBitBtn;
    btnPOSupp: TBitBtn;
    btnPOCust: TBitBtn;
    btnQuote: TBitBtn;
    btnGenerate: TBitBtn;
    btnQuoteSumm: TBitBtn;
    lblCompany: TLabel;
    lblSoftware: TLabel;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure btnPaperClick(Sender: TObject);
    procedure btnEnquiryClick(Sender: TObject);
    procedure NotYetImplemented(Sender: TObject);
    procedure btnQuoteClick(Sender: TObject);
    procedure btnPOSuppClick(Sender: TObject);
    procedure btnPOCustClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnQuoteSummClick(Sender: TObject);
  private
    FActivateDone : Boolean;
    FDemo: Boolean;
    FClientHeight: integer;
    FUserName: string;
    FVersion: string;
    procedure SetDemo(const Value: Boolean);
    procedure SetUserName(const Value: string);
    procedure SetVersion(const Value: string);
    procedure RollUp;
    procedure RollDown;
    procedure TakeALetterMissJones(const which : integer);
  public
    property Demo : Boolean read FDemo write SetDemo;
    property UserName : string read FUserName write SetUserName;
    property Version : string read FVersion write SetVersion;
  end;

var
  PDMainMenuFrm: TPDMainMenuFrm;

implementation

uses PBLogin, PBDatabase, PDAbout, PDPageMaint, PDLetterMaint, PDLUPage,
  PDLetter, LetterDM, PDGenerateDg, PDDragDrop, System.UITypes;

{$R *.DFM}

procedure TPDMainMenuFrm.FormActivate(Sender: TObject);
var
  OK : Boolean;
begin
  if FActivateDone then
    Exit;
{$IFNDEF DEMO}
  frmPBLogin := TfrmPBLogin.Create(Self);
  try
    frmPBLogin.UserEdit.Text := UserName;
    frmPBLogin.ShowModal;
    OK := frmPBLogin.OK;
  finally
    frmPBLogin.Free;
  end;
  if not OK then
    Application.Terminate
  else
{$ENDIF}
  if dmLetter.OldDatabase then
  begin
    MessageDlg('The database appears to be of an earlier, incompatible ' +
      'version.' + CHR(13) +  'Please contact your supplier for an upgrade ' +
      'to the Broker software', mtError, [mbOK], 0);
    Application.Terminate;
    Exit;
  end;
  FActivateDone := true;
end;

procedure TPDMainMenuFrm.FormCreate(Sender: TObject);
var
  TempUser : array[0..255] of Char;
  TempUserSize : DWORD;
begin
  FClientHeight := ClientHeight;
  {Detect if this is the demo version};
{$IFDEF DEMO}
  Demo := True;
  Self.Caption := Self.Caption + ' Demonstration Version';
  dmBroker.PBLDatabase.AliasName := 'BrokerDemo';
{$ELSE}
  Demo := False;
  TempUserSize := SizeOf(TempUser);
  GetUserName(Addr(TempUser), TempUserSize);
  UserName := TempUser;
{$ENDIF}
  Version := '2020/Sept12a';
  if (Screen.Width < 800) or (Screen.Height < 600) then
  begin
    MessageDlg('Your screen resolution must be set to at least 800 x 600 ' +
      'to run Redeye software', mtError, [mbOK], 0);
    Application.Terminate;
    Exit;
  end;
end;

procedure TPDMainMenuFrm.SetDemo(const Value: Boolean);
begin
  FDemo := Value;
end;

procedure TPDMainMenuFrm.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TPDMainMenuFrm.SetVersion(const Value: string);
begin
  FVersion := Value;
end;

procedure TPDMainMenuFrm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPDMainMenuFrm.btnAboutClick(Sender: TObject);
begin
  PDAboutFrm := TPDAboutFrm.Create(Self);
  try
    PDAboutFrm.ShowModal;
  finally
    PDAboutFrm.Free;
  end;
end;

procedure TPDMainMenuFrm.btnPaperClick(Sender: TObject);
var
  PDPageMaintFrm: TPDPageMaintFrm;
begin
  RollUp;
  PDPageMaintFrm:= TPDPageMaintFrm.Create(Self);
  try
    PDPageMaintFrm.ShowModal;
  finally
    PDPageMaintFrm.Free;
    RollDown;
  end;
end;

procedure TPDMainMenuFrm.RollDown;
begin
  LockWindowUpdate(Handle);
  try
    ClientHeight := FClientHeight;
    gbButtons.Show;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPDMainMenuFrm.RollUp;
begin
  LockWindowUpdate(Handle);
  try
    gbButtons.Hide;
    ClientHeight := gbButtons.Top;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TPDMainMenuFrm.btnEnquiryClick(Sender: TObject);
begin
  TakeALetterMissJones(ltEnquiry);
end;

procedure TPDMainMenuFrm.NotYetImplemented(Sender: TObject);
begin
  ShowMessage('I''m sorry but this part of the program has not ' + #13#10 +
    'yet been written.  Apologies for any inconvenience caused ' + #13#10 +
    'but rest assured of my best endeavours to complete this ' + #13#10 +
    'as soon as possible. ' + #13#10 + #13#10 + 'Thank you.');
end;

procedure TPDMainMenuFrm.TakeALetterMissJones(const which: integer);
var
  aName : string;
  PDLetterMaintFrm: TPDLetterMaintFrm;
  PDLuPageFrm : TPDLuPageFrm;
begin
  PDLuPageFrm := TPDLuPageFrm.Create(Self);
  try
    PDLuPageFrm.Mode := which;
    aName := '';
    if PDLuPageFrm.ShowModal = mrOK then
      aName := PDLuPageFrm.LayoutName;
  finally
    PDLuPageFrm.Free;
  end;
  if aName = '' then
    Exit;
  RollUp;
  try
    Screen.Cursor := crHourGlass;
    PDLetterMaintFrm:= TPDLetterMaintFrm.Create(Self);
    try
      PDLetterMaintFrm.LetterName := aName;
      PDLetterMaintFrm.LetterType := which;
      Screen.Cursor := crDefault;
      PDLetterMaintFrm.ShowModal;
    finally
      PDLetterMaintFrm.Free;
      Screen.Cursor := crDefault;
    end;
  finally
    RollDown;
  end;
end;

procedure TPDMainMenuFrm.btnQuoteClick(Sender: TObject);
begin
  TakeALetterMissJones(ltQuotation);
end;

procedure TPDMainMenuFrm.btnPOSuppClick(Sender: TObject);
begin
  TakeALetterMissJones(ltPurchaseOrder);
end;

procedure TPDMainMenuFrm.btnPOCustClick(Sender: TObject);
begin
  TakeALetterMissJones(ltAcknowledgement);
end;

procedure TPDMainMenuFrm.btnGenerateClick(Sender: TObject);
var
  PDGenerateDlg : TPDGenerateDlg;
begin
  { Generate default entries for the four letter types }
  PDGenerateDlg := TPDGenerateDlg.Create(Self);
  try
    PDGenerateDlg.ShowModal;
  finally
    PDGenerateDlg.Free;
  end;
end;

procedure TPDMainMenuFrm.btnQuoteSummClick(Sender: TObject);
begin
  TakeALetterMissJones(ltQuotationSummary);
end;

end.
