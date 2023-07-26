unit PBMaintBranchCstCntr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMaintBranchCstCntrFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    AddSQL: TFDQuery;
    DelSQL: TFDQuery;
    CheckUniqueSQL: TFDQuery;
    CstCntrLabel: TLabel;
    DescLabel: TLabel;
    CstCntrEdit: TEdit;
    DescEdit: TEdit;
    CustLabel: TLabel;
    BranchLabel: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CstCntrEditChange(Sender: TObject);
    procedure DescEditChange(Sender: TObject);
    function uniquecentre(iCust, iBranch: integer; sCentre: string): boolean; private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode: String[1] ;
    iCust, iBranch: Integer ;
    sCostCentre, sDescription: string;
    sCustName, sBranchName: string;
    end;

var
  PBMaintBranchCstCntrFrm: TPBMaintBranchCstCntrFrm;

implementation

uses PBLUCustCstCntr;

{$R *.DFM}

procedure TPBMaintBranchCstCntrFrm.FormActivate(Sender: TObject);
begin
  {Setup titles} ;
  CustLabel.Caption := 'Customer: ' + sCustName;
  BranchLabel.Caption := 'Branch: ' + sBranchName;
  dellabel.visible := False;

  if sFuncMode = 'A' then
    Caption := 'Add a new Branch Cost Centre' ;
  if sFuncMode = 'C' then
    begin
      Caption := 'Change a Branch Cost Centre' ;
      DescEdit.SetFocus;
    end;
  if sFuncMode = 'D' then
    begin
      Caption := 'Delete a Branch Cost Centre' ;
      dellabel.visible := True;
      descEdit.ReadOnly := True;
    end;
  if sFuncMode = 'A' then
    begin
      {Empty details} ;
      CstCntrEdit.Text :='';
      DescEdit.Text :='';
      CstCntrEdit.ReadOnly := False;
    end
  else
    begin
      CstCntrEdit.Text := sCostCentre;
      DescEdit.Text := sDescription;
    end;

  CheckOK(Self) ;
end;

procedure TPBMaintBranchCstCntrFrm.CheckOK(Sender: TObject);
begin
  {Enable/disable OK button} ;
  OKBitBtn.Enabled := (CstCntrEdit.Text <> '')  and
                    (DescEdit.Text <> '')
end;

procedure TPBMaintBranchCstCntrFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TPBMaintBranchCstCntrFrm.OKBitBtnClick(Sender: TObject);
begin
If sFuncMode = 'A' then
   begin
   if uniquecentre(iCust, iBranch, CstCntrEdit.Text) then
        begin
        MessageDlg('Cost Centre Already Exists for this Customer/Branch', mtError, [mbOK], 0);
        DescEdit.SetFocus;
        end
   else
    begin
    With AddSQL do
        begin
        Close ;
        ParamByName('Customer').AsInteger := iCust ;
        ParamByName('Branch_no').AsInteger := iBranch ;
        ParamByName('Centre').AsString := CstCntrEdit.Text  ;
        ParamByName('Description').AsString := DescEdit.Text;
        ExecSQL ;
        end;
   end;
   end;
If sFuncMode = 'C' then
   begin
   {Update an existing code} ;
   With UpdSQL do
        begin
        Close ;
        ParamByName('Customer').AsInteger := iCust ;
        ParamByName('Branch_no').AsInteger := iBranch ;
        ParamByName('Centre').AsString := CstCntrEdit.Text  ;
        ParamByName('Description').AsString := DescEdit.Text;
        ExecSQL ;
        end;
   end;
If sFuncMode = 'D' then
     begin
     if MessageDlg('Really delete these details ?', mtConfirmation, [mbNo, mbYes],0) <> mrYes then
          begin
          Close ;
          Exit ;
          end;
     With DelSQL do
          begin
          Close ;
          ParamByName('Customer').AsInteger := iCust ;
          ParamByName('Branch_no').AsInteger := iBranch ;
          ParamByName('Centre').AsString := CstCntrEdit.Text;
          ExecSQL ;
          end;
     end;
end;

procedure TPBMaintBranchCstCntrFrm.CstCntrEditChange(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TPBMaintBranchCstCntrFrm.DescEditChange(Sender: TObject);
begin
CheckOK(Self);
end;

function TPBMaintBranchCstCntrFrm.uniquecentre(iCust, iBranch: integer;
  sCentre: string): boolean;
begin
 with CheckuniqueSQL do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      paramByName('Branch_no').asinteger := iBranch ;
      parambyname('Centre').asstring := sCentre;
      open;
      if recordcount > 0 then
        result := true
      else
        result := false;
    end;
end;

end.
