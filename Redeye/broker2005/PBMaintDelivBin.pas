(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Broker Main Menu form.

VSS Info:
$Header: /PBL D5/PBMaintDelivBin.pas 9     20/06/03 9:53 Andrewh $
$History: PBMaintDelivBin.pas $
 * 
 * *****************  Version 9  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:53
 * Updated in $/PBL D5
 * 
 * *****************  Version 8  *****************
 * User: Andrewh      Date: 20/06/03   Time: 9:47
 * Updated in $/PBL D5
 * Add a Rep parameter onto the ScreenAccessControl function.
 * 
 * *****************  Version 7  *****************
 * User: Andrewh      Date: 19/06/03   Time: 12:16
 * Updated in $/PBL D5
 * Add extra "Rep" parameter onto ScreenAccessControl function calls.
 * 
 * *****************  Version 6  *****************
 * User: Andrewh      Date: 17/07/02   Time: 16:45
 * Updated in $/PBL D5
 * Allow maintenance programmes to check a specific button setting when
 * called from within another program.
 * 
 * *****************  Version 5  *****************
 * User: Andrewh      Date: 15/07/02   Time: 11:28
 * Updated in $/PBL D5
 * 
 * *****************  Version 4  *****************
 * User: Paul         Date: 14/03/:2   Time: 15:35
 * Updated in $/PBL D5
 * Changed to give warning messages if Picking details not entered.
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 11/03/:2   Time: 11:31
 * Updated in $/PBL D5
 * Changed to allow the viewing and maintenance of bin location stock
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 8/01/:2    Time: 14:37
 * Updated in $/PBL D5
 * Changed to allow entry of Delivery locations and also the specification
 * of where items are picked from
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 21/12/:1   Time: 15:33
 * Created in $/PBL D5
 * Creation of Delivery Detail Stock location unit
 *
*******************************************************************************)
unit PBMaintDelivBin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, PBPOObjects, ExtCtrls;

type
  TPBMaintDelivBinfrm = class(TForm)
    grpBxBins: TGroupBox;
    Label1: TLabel;
    edtBinLocation: TEdit;
    memQty: TMemo;
    memQtyAlloc: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    pnlAdjustment: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtAdjust: TEdit;
    procedure memQtyKeyPress(Sender: TObject; var Key: Char);
    procedure ValidateQty(Sender: TObject);
    procedure SaveValue(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    sOldValue: string;
    FFuncMode: Char;
    procedure SetFuncMode(const Value: Char);
    { Private declarations }
  public
    { Public declarations }
    bOK: Boolean;
    rMaxQty: integer;
    property FuncMode: Char read FFuncMode write SetFuncMode;
  end;

var
  PBMaintDelivBinfrm: TPBMaintDelivBinfrm;

implementation

uses UITypes;
{$R *.DFM}

{ TPBMaintDelivBinfrm }

procedure TPBMaintDelivBinfrm.SetFuncMode(const Value: Char);
begin
  FFuncMode := Value;
  if FFuncMode = 'A' then
    caption := 'Add Delivery Bin details'
  else
  if FFuncMode = 'C' then
    caption := 'Change Delivery Bin details'
  else
  if FFuncMode = 'D' then
    caption := 'Delete Delivery Bin details'
  else
  if FFuncMode = 'T' then
    caption := 'Adjust Delivery Bin Quantitites';

  grpBxBins.enabled := (FFuncMode <> 'T');
  if FFuncMode <> 'T' then
    begin
      pnlAdjustment.height := 0;
      height := 153;
    end
end;

procedure TPBMaintDelivBinfrm.memQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Ord(key) of
    $30..$39: ;
    vk_back: ;
    vk_return: ;
    vk_tab: ;
  else
    MessageBeep(0);
    key := #0;
  end;
end;

procedure TPBMaintDelivBinfrm.ValidateQty(Sender: TObject);
var
  TempStr: string;
begin
  {Validate a quantity on exit}
  TempStr := FormatQty((Sender as TMemo).Text);
  if TempStr = 'X' then
  begin
    (Sender as TMemo).Text := sOldValue;
    (Sender as TMemo).SetFocus;
  end
  else
    (Sender as TMemo).Text := TempStr;
  CheckOK(Self);
end;

procedure TPBMaintDelivBinfrm.SaveValue(Sender: TObject);
begin
  sOldValue := (Sender as TMemo).Text;
end;

procedure TPBMaintDelivBinFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button}
  btnOK.Enabled := (edtBinLocation.Text <> '') and
    (memQty.Text <> '');
end;

procedure TPBMaintDelivBinfrm.btnOKClick(Sender: TObject);
begin
  if strtoint(memQty.text) > rMaxQty then
    begin
      if MessageDlg('Quantity specified is greater than unallocated quantity of ' + inttostr(rMaxQty) + ' do you want to continue?', mtwarning,
        [mbYes, mbNo], 1) <> mrYes then
      begin
        memQty.setfocus;
        exit;
      end;
    end;

  if strtoint(memQty.text) < strtoint(memQtyAlloc.text) then
    begin
      MessageDlg('Quantity in the bin cannot be less than the allocated quantity', mterror,
        [mbOk], 0);
      memQty.setfocus;
      exit;
    end;

  bOK := true;
  Modalresult := MROK;
end;

end.
