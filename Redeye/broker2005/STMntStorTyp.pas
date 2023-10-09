unit STMntStorTyp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMntStorTypFrm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    UpdSQL: TFDQuery;
    DelLabel: TLabel;
    DetsGrpBox: TGroupBox;
    NameEdit: TEdit;
    Label5: TLabel;
    AddSQL: TFDQuery;
    DelSQL: TFDQuery;
    GetLastSQL: TFDQuery;
    ReplenRadioGroup: TRadioGroup;
    ReplenLabel: TLabel;
    ReplenDBLookupComboBox: TDBLookupComboBox;
    GetStoreSQL: TFDQuery;
    StoresDataSource: TDataSource;
    IsVanCheckBox: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure ShortNameEditChange(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure ReplenRadioGroupClick(Sender: TObject);
    procedure ReplenDBLookupComboBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode: String[1] ;
    iCode, iStorTyp: Integer ;
    sGroupName: String ;
  end;

var
  STMntStorTypFrm: TSTMntStorTypFrm;

implementation

uses UITypes, STLUStorTyp, pbDatabase, pbMainMenu;


{$R *.DFM}

procedure TSTMntStorTypFrm.FormActivate(Sender: TObject);
begin
{Setup titles} ;
If sFuncMode = 'A' then
   Caption := 'Add a new store type' ;
If sFuncMode = 'C' then
   Caption := 'Change a store type' ;
If sFuncMode = 'D' then
   Caption := 'Delete a store type' ;
If sFuncMode = 'A' then
   begin
   {Empty details} ;
   NameEdit.Text := '' ;
   IsVanCheckBox.Checked := False ;
   ReplenRadioGroup.ItemIndex := 0 ;
   end
else
   begin
   With STLUStorTypFrm.DetsSRC.DataSet do
        begin
        iCode := FieldByName('Part_Store_Type').AsInteger ;
        NameEdit.Text := FieldByName('Part_Store_Type_Name').AsString ;
        IsVanCheckBox.Checked := (FieldByName('Part_Store_Is_Van').AsString = 'Y');
        If FieldByName('Purchase_Or_Store').AsString = 'P' then
           begin
           ReplenRadioGroup.ItemIndex := 0 ;
           ReplenDBLookupComboBox.KeyValue := 0;
           end
        else
           begin
           ReplenRadioGroup.ItemIndex := 1 ;
           ReplenDBLookupComboBox.KeyValue := FieldByName('Replenish_Store').AsInteger ;
           end;
        end;
   end;
ReplenRadioGroupClick(Self) ;
{Enable or disable the buttons} ;
DetsGrpBox.Enabled := (sFuncMode <> 'D') ;
DelLabel.Visible := (sFuncMode = 'D') ;
With GetStoreSQL do
     begin
     Close ;
     Open ;
     end;
CheckOK(Self) ;
  dmBroker.ScreenAccessControl(Self,'mnuStoreTypes',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TSTMntStorTypFrm.CheckOK(Sender: TObject);
begin
{Enable/disable OK button} ;
OKBitBtn.Enabled := (NameEdit.Text <> '') and
                    ((ReplenDBLookupComboBox.KeyValue <> 0) or
                                                      (ReplenRadioGroup.ItemIndex = 0));
;
end;

procedure TSTMntStorTypFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TSTMntStorTypFrm.ShortNameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntStorTypFrm.OKBitBtnClick(Sender: TObject);
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
        ParamByName('Part_Store_Type').AsInteger := iTempNewCode ;
        ParamByName('Part_Store_Type_Name').AsString := NameEdit.Text  ;
        ParamByName('Purchase_Or_Store').AsString := Copy('PS', ReplenRadioGroup.ItemIndex + 1, 1)  ;
        If ReplenRadioGroup.ItemIndex = 0 then
             ParamByName('Replenish_Store').Clear
        else
             ParamByName('Replenish_Store').AsInteger := ReplenDBLookupComboBox.KeyValue ;
        ParamByName('Part_Store_Type_Name').AsString := NameEdit.Text  ;
        If IsVanCheckBox.Checked = True then
              ParamByName('Part_Store_Is_Van').AsString := 'Y'
        else
              ParamByName('Part_Store_Is_Van').AsString := 'N' ;
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
        ParamByName('Part_Store_Type').AsInteger := iCode ;
        ParamByName('Part_Store_Type_Name').AsString := NameEdit.Text  ;
        ParamByName('Purchase_Or_Store').AsString := Copy('PS', ReplenRadioGroup.ItemIndex + 1, 1)  ;
        If ReplenRadioGroup.ItemIndex = 0 then
             ParamByName('Replenish_Store').Clear
        else
             ParamByName('Replenish_Store').AsInteger := ReplenDBLookupComboBox.KeyValue ;
        If IsVanCheckBox.Checked = True then
              ParamByName('Part_Store_Is_Van').AsString := 'Y'
        else
              ParamByName('Part_Store_Is_Van').AsString := 'N' ;
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
          ParamByName('Part_Store_Type').AsInteger := iCode ;
          ExecSQL ;
          end;
     end;
end;

procedure TSTMntStorTypFrm.NameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntStorTypFrm.ReplenRadioGroupClick(Sender: TObject);
begin
ReplenLabel.Enabled := (ReplenRadioGroup.ItemIndex > 0) ;
ReplenDBLookupComboBox.Enabled := (ReplenRadioGroup.ItemIndex > 0) ;
CheckOK(Self) ;
end;

procedure TSTMntStorTypFrm.ReplenDBLookupComboBoxClick(Sender: TObject);
begin
CheckOK(Self) ;
end;

end.
