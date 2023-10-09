(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Purchase Orders form.

VSS Info:
$Header: /PBL D5/PBMaintPOAddNotes.pas 7     20/06/03 9:53 Andrewh $
$History: PBMaintPOAddNotes.pas $
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 4  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:46
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 3  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:29
 * Updated in $/PBL D5
 * 
 * *****************  Version 2  *****************
 * User: Roddym       Date: 8/12/99    Time: 16:17
 * Updated in $/PBL D5
 * First conversion of Enquiry and Purchase Order fax/letters.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
 *
 * *****************  Version 1  *****************
 * User: Roddym       Date: 3/12/99    Time: 10:36
 * Created in $/PBL V5
 * New purchase order objects and database tables.

*******************************************************************************)
unit PBMaintPOAddNotes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TPBMaintPOAddNotesFrm = class(TForm)
    AddNotesMemo: TMemo;
    DelLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    FText: string;
    FFuncMode: Char;
  public
    property FuncMode: Char read FFuncMode write FFuncMode;
    property Text: string read FText write FText;
  end;

var
  PBMaintPOAddNotesFrm: TPBMaintPOAddNotesFrm;

implementation

uses UITypes, 
  PBPODatamod, PBPOObjects;

{$R *.DFM}

procedure TPBMaintPOAddNotesFrm.FormShow(Sender: TObject);
begin
  case FuncMode of
    poAdd: Caption := 'Add Additional Notes to Purchase Order';
    poChange: Caption := 'Change Additional Notes on Purchase Order';
    poDelete:
      begin
        Caption := 'Delete Additional Notes from Purchase Order';
        OKBitBtn.Caption := 'Delete';
        DelLabel.Show;
      end;
  end; { case }
  AddNotesMemo.Text := FText;
end;

procedure TPBMaintPOAddNotesFrm.OKBitBtnClick(Sender: TObject);
begin
  if FuncMode = poDelete then
  begin
    if MessageDlg('Really delete these details ?', mtConfirmation,
      [mbNo, mbYes], 0) <> mrYes then
      ModalResult := mrCancel;
  end
  else
    FText := Trim(AddNotesMemo.Text);
end;

end.
