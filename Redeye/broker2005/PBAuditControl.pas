unit PBAuditControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBAuditControlFrm = class(TForm)
    ProgMoveCheckBox: TCheckBox;
    FieldChangeCheckBox: TCheckBox;
    UpdatesCheckBox: TCheckBox;
    ErrorsCheckBox: TCheckBox;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    GetAuditFlagsSQL: TFDQuery;
    UpdAuditFlagsSQL: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBAuditControlFrm: TPBAuditControlFrm;

implementation

uses UITypes, PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBAuditControlFrm.FormActivate(Sender: TObject);
begin
With GetAuditFlagsSQL do
        begin
        Close ;
        Open ;
        ProgMoveCheckBox.Checked := FieldByName('Audit_Log_Prog').AsString = 'Y' ;
        UpdatesCheckBox.Checked := FieldByName('Audit_Log_Upd').AsString = 'Y' ;
        FieldChangeCheckBox.Checked := FieldByName('Audit_Log_Fields').AsString = 'Y' ;
        ErrorsCheckBox.Checked := FieldByName('Audit_Log_Errors').AsString = 'Y' ;
        end;
//  dmBroker.ScreenAccessControl(Self,'',frmpbMainMenu.iOperator,0,0) ;
  If dmBroker.iAccCtrl = 1 then
        MessageDlg('Any changes made here will not be applied to a user until they exit BROKER and go back in',
                        mtInformation, [mbOK],0) ;
  dmBroker.ScreenAccessControl(Self,'mnuSystem',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBAuditControlFrm.OKBitBtnClick(Sender: TObject);
begin
With UpdAuditFlagsSQL do
        begin
        Close ;
        If ProgMoveCheckBox.Checked then
                ParamByName('Audit_Log_Prog').AsString := 'Y'
        else
                ParamByName('Audit_Log_Prog').AsString := 'N' ;
        If UpdatesCheckBox.Checked then
                ParamByName('Audit_Log_Upd').AsString := 'Y'
        else
                ParamByName('Audit_Log_Upd').AsString := 'N' ;
        If FieldChangeCheckBox.Checked then
                ParamByName('Audit_Log_Fields').AsString := 'Y'
        else
                ParamByName('Audit_Log_Fields').AsString := 'N' ;
        If ErrorsCheckBox.Checked then
                ParamByName('Audit_Log_Errors').AsString := 'Y'
        else
                ParamByName('Audit_Log_Errors').AsString := 'N' ;
        ExecSQL ;
        end;
end;

end.
