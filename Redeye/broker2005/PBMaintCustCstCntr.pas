unit PBMaintCustCstCntr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, DBTables, ExtCtrls;

type
  TPBMaintCustCstCntrFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdSQL: TQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    AddSQL: TQuery;
    DelSQL: TQuery;
    CheckUniqueSQL: TQuery;
    CstCntrLabel: TLabel;
    DescLabel: TLabel;
    CstCntrEdit: TEdit;
    DescEdit: TEdit;
    CustLabel: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CstCntrEditChange(Sender: TObject);
    procedure DescEditChange(Sender: TObject);
    function uniquecentre(iCust: integer; sCentre: string): boolean; private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode: String[1] ;
    iCode: Integer ;
    end;

var
  PBMaintCustCstCntrFrm: TPBMaintCustCstCntrFrm;

implementation

uses PBLUCustCstCntr;

{$R *.DFM}

procedure TPBMaintCustCstCntrFrm.FormActivate(Sender: TObject);
begin
{Setup titles} ;
CustLabel.Caption := 'Customer: ' + PBLUCustCstCntrFrm.sCustName;
dellabel.visible := False;
If sFuncMode = 'A' then
   Caption := 'Add a new Customer Cost Centre' ;
If sFuncMode = 'C' then
   begin
    Caption := 'Change a Customer Cost Centre' ;
    DescEdit.SetFocus;
   end;
If sFuncMode = 'D' then
   begin
    Caption := 'Delete a Customer Cost Centre' ;
    dellabel.visible := True;
    descEdit.ReadOnly := True;
    end;
If sFuncMode = 'A' then
   begin
   {Empty details} ;
   CstCntrEdit.Text :='';
   DescEdit.Text :='';
   CstCntrEdit.ReadOnly := False;
   end
else
   begin
   With PBLUCustCstCntrFrm.DetsSRC.DataSet do
        begin
        iCode := FieldByName('Customer').AsInteger ;
        CstCntrEdit.Text := FieldByName('Cost_Centre').AsString ;
        DescEdit.Text := FieldByName('Description').AsString;
        end;
   end;
CheckOK(Self) ;
end;

procedure TPBMaintCustCstCntrFrm.CheckOK(Sender: TObject);
begin
{Enable/disable OK button} ;
OKBitBtn.Enabled := (CstCntrEdit.Text <> '')  and
                    (DescEdit.Text <> '')
end;

procedure TPBMaintCustCstCntrFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TPBMaintCustCstCntrFrm.OKBitBtnClick(Sender: TObject);
begin
If sFuncMode = 'A' then
   begin
   if uniquecentre(iCode, CstCntrEdit.Text) then
        begin
        MessageDlg('Cost Centre Already Exists for this Customer', mtError, [mbOK], 0);
        DescEdit.SetFocus;
        end
   else
    begin
    With AddSQL do
        begin
        Close ;
        ParamByName('Customer').AsInteger := iCode ;
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
        ParamByName('Customer').AsInteger := iCode ;
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
          ParamByName('Customer').AsInteger := iCode ;
          ParamByName('Centre').AsString := CstCntrEdit.Text;
          ExecSQL ;
          end;
     end;
end;

procedure TPBMaintCustCstCntrFrm.CstCntrEditChange(Sender: TObject);
begin
CheckOk(Self);
end;

procedure TPBMaintCustCstCntrFrm.DescEditChange(Sender: TObject);
begin
CheckOK(Self);
end;

function TPBMaintCustCstCntrFrm.uniquecentre(iCust: integer;
  sCentre: string): boolean;
begin
 with CheckuniqueSQL do
    begin
      close;
      parambyname('Customer').asinteger := iCust;
      parambyname('Centre').asstring := sCentre;
      open;
      if recordcount > 0 then
        result := true
      else
        result := false;
    end;
end;

end.
