unit STMntPrtGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMntPrtGrpFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    Label2: TLabel;
    ShortNameEdit: TEdit;
    NameEdit: TEdit;
    Label5: TLabel;
    AddSQL: TFDQuery;
    DelSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ShortNameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode: String[1] ;
    iCode, iPrtGrp: Integer ;
    sGroupName: String ;
  end;

var
  STMntPrtGrpFrm: TSTMntPrtGrpFrm;

implementation

uses STLUPrtGrp, pbDatabase, pbMainMenu;


{$R *.DFM}

procedure TSTMntPrtGrpFrm.FormActivate(Sender: TObject);
begin
  {Setup titles} ;
  If sFuncMode = 'A' then
    Caption := 'Add a new product group' ;
  If sFuncMode = 'C' then
    Caption := 'Change a product group' ;
  If sFuncMode = 'D' then
    Caption := 'Delete a product group' ;
  If sFuncMode = 'A' then
    begin
    {Empty details} ;
    NameEdit.Text := '' ;
    ShortNameEdit.Text := '' ;
    end
  else
    begin
    With STLUPrtGrpFrm.DetsSRC.DataSet do
        begin
        iCode := FieldByName('Part_Group').AsInteger ;
        NameEdit.Text := FieldByName('Part_Group_Descr').AsString ;
        ShortNameEdit.Text := FieldByName('Part_Group_Descr_Short').AsString ;
        end;
    end;
  {Enable or disable the buttons} ;
  DetsGrpBox.Enabled := (sFuncMode <> 'D') ;
  DelLabel.Visible := (sFuncMode = 'D') ;
  CheckOK(Self) ;
  dmBroker.ScreenAccessControl(Self,'mnuProductGroups',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TSTMntPrtGrpFrm.CheckOK(Sender: TObject);
begin
{Enable/disable OK button} ;
OKBitBtn.Enabled := (NameEdit.Text <> '') and
                    (ShortNameEdit.Text <> '') ;
end;

procedure TSTMntPrtGrpFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TSTMntPrtGrpFrm.ShortNameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtGrpFrm.OKBitBtnClick(Sender: TObject);
Var
iTempNewCode: Integer ;
begin
If sFuncMode = 'A' then
   begin
   {Add a new code} ;
   {Add the rep narrative} ;
   {Get Next code} ;
   With GetLastSQL do
        begin
        Close ;
        Open ;
        First ;
        iTempNewCode := FieldByName('Last_Code').AsInteger + 1 ;
        Close ;
        end;
   With AddSQL do
        begin
        Close ;
        ParamByName('Part_Group').AsInteger := iTempNewCode ;
        ParamByName('Part_Group_Descr').AsString := NameEdit.Text  ;
        ParamByName('Part_Group_Descr_Short').AsString := ShortNameEdit.Text  ;
        ExecSQL ;
        end;
   iCode := iTempNewCode ;
   end;
If sFuncMode = 'C' then
   begin
   {Update an existing code} ;
   With UpdSQL do
        begin
        Close ;
        ParamByName('Part_Group').AsInteger := iCode ;
        ParamByName('Part_Group_Descr').AsString := NameEdit.Text  ;
        ParamByName('Part_Group_Descr_Short').AsString := ShortNameEdit.Text  ;
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
          ParamByName('Part_Group').AsInteger := iCode ;
          ExecSQL ;
          end;
     end;
end;

procedure TSTMntPrtGrpFrm.NameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

end.
