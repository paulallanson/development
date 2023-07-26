unit STMntPrtStor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, DB, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSTMntPrtStorFrm = class(TForm)
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
    Label1: TLabel;
    StorTypDBLookupComboBox: TDBLookupComboBox;
    GetStorTypsQuery: TFDQuery;
    StorTypsDataSource: TDataSource;
    BinsCheckBox: TCheckBox;
    LotsCheckBox: TCheckBox;
    AddressGroupBox: TGroupBox;
    StreetEdit: TEdit;
    StreetLabel: TLabel;
    DistrictLabel: TLabel;
    TownLabel: TLabel;
    PostLabel: TLabel;
    TelLabel: TLabel;
    DistrictEdit: TEdit;
    TownEdit: TEdit;
    PostEdit: TEdit;
    PhoneEdit: TEdit;
    FaxEdit: TEdit;
    FaxLabel: TLabel;
    NegativeCheckBox: TCheckBox;
    chkbxActive: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
    procedure StorTypDBLookupComboBoxClick(Sender: TObject);
    procedure StreetEditChange(Sender: TObject);
    procedure DistrictEditChange(Sender: TObject);
    procedure TownEditChange(Sender: TObject);
    procedure PostEditChange(Sender: TObject);
    procedure PhoneEditChange(Sender: TObject);
    procedure FaxEditChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sFuncMode: String[1] ;
    iCode: Integer ;
  end;

var
  STMntPrtStorFrm: TSTMntPrtStorFrm;

implementation

uses STLUPrtStor, pbDatabase, pbMainMenu;


{$R *.DFM}

procedure TSTMntPrtStorFrm.FormActivate(Sender: TObject);
begin
{Setup titles} ;
If sFuncMode = 'A' then
   Caption := 'Add a new product store' ;
If sFuncMode = 'C' then
   Caption := 'Change a product store' ;
If sFuncMode = 'D' then
   Caption := 'Delete a product store' ;
If sFuncMode = 'A' then
   begin
   {Empty details} ;
   NameEdit.Text :='';
   StreetEdit.Text :='';
   DistrictEdit.Text :='';
   TownEdit.Text :='';
   PostEdit.Text :='';
   PhoneEdit.Text :='';
   FaxEdit.Text := '' ;
   StorTypDBLookupComboBox.KeyValue := 0 ;
   BinsCheckBox.Checked := False ;
   LotsCheckBox.Checked := False ;
   chkbxActive.Checked := true;
   end
else
   begin
   With STLUPrtStorFrm.DetsSRC.DataSet do
        begin
        iCode := FieldByName('Part_Store').AsInteger ;
        NameEdit.Text := FieldByName('Part_Store_Name').AsString ;
        StreetEdit.Text := FieldByName('Internal_Number_and_Stret').AsString ;
        DistrictEdit.Text := FieldByName('Internal_District').AsString ;
        TownEdit.Text := FieldByName('Internal_Town').AsString ;
        PostEdit.Text := FieldByName('Internal_Postcode').AsString ;
        PhoneEdit.Text := FieldByName('Internal_Phone').AsString ;
        FaxEdit.Text := FieldByName('Internal_Fax').AsString;
        StorTypDBLookupComboBox.KeyValue := FieldByName('Part_Store_Type').AsInteger ;
        BinsCheckBox.Checked := (FieldByName('Stock_Bins_In_Use').AsString = 'Y') ;
        LotsCheckBox.Checked := (FieldByName('Stock_Lots_In_Use').AsString = 'Y') ;
        NegativeCheckBox.Checked := (FieldByName('Allow_Neg_Stock').AsString = 'Y') ;
        ChkBxActive.checked := not (fieldByName('InActive').AsString = 'Y');
        end;
   end;
With GetStorTypsQuery do
     begin
     Close ;
     Open ;
     end;
{Enable or disable the buttons} ;
DetsGrpBox.Enabled := (sFuncMode <> 'D') ;
DelLabel.Visible := (sFuncMode = 'D') ;
CheckOK(Self) ;
  dmBroker.ScreenAccessControl(Self,'mnuStores',frmPBMainMenu.iOperator,0,0) ;
end;

procedure TSTMntPrtStorFrm.CheckOK(Sender: TObject);
begin
{Enable/disable OK button} ;
OKBitBtn.Enabled := (NameEdit.Text <> '')  and
                    (StreetEdit.Text <> '') and
//                    (DistrictEdit.Text <> '') and
//                    (TownEdit.Text <> '') and
                    (PostEdit.Text <> '') and
                    (StorTypDBLookupComboBox.KeyValue <> 0) and
                    (PhoneEdit.Text <> '');
{Check on District thought to be too strict 18.5.00};
end;

procedure TSTMntPrtStorFrm.CancelBitBtnClick(Sender: TObject);
begin
Close ;
end;

procedure TSTMntPrtStorFrm.OKBitBtnClick(Sender: TObject);
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
        ParamByName('Part_Store').AsInteger := iTempNewCode ;
        ParamByName('Part_Store_Name').AsString := NameEdit.Text  ;
        ParamByName('Internal_Number_and_Stret').AsString := StreetEdit.Text;
        ParamByName('Internal_District').AsString := DistrictEdit.Text;
        ParamByName('Internal_Town').AsString := TownEdit.Text;
        ParamByName('Internal_Postcode').AsString := PostEdit.Text;
        ParamByName('Internal_Phone').AsString := PhoneEdit.Text;
        ParamByName('Internal_Fax').AsString := FaxEdit.Text;
        ParamByName('Part_Store_Type').AsInteger := StorTypDBLookupComboBox.KeyValue  ;
        If BinsCheckBox.Checked then
             ParamByName('Stock_Bins_In_Use').AsString := 'Y'
        else
             ParamByName('Stock_Bins_In_Use').AsString := 'N' ;
        If LotsCheckBox.Checked then
             ParamByName('Stock_Lots_In_Use').AsString := 'Y'
        else
             ParamByName('Stock_Lots_In_Use').AsString := 'N' ;
        If NegativeCheckBox.Checked then
             ParamByName('Allow_Neg_Stock').AsString := 'Y'
        else
             ParamByName('Allow_Neg_Stock').AsString := 'N' ;
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
        ParamByName('Part_Store').AsInteger := iCode ;
        ParamByName('Part_Store_Name').AsString := NameEdit.Text  ;
        ParamByName('Part_Store_Type').AsInteger := StorTypDBLookupComboBox.KeyValue  ;
        ParamByName('Internal_Number_and_Stret').AsString := StreetEdit.Text;
        ParamByName('Internal_District').AsString := DistrictEdit.Text;
        ParamByName('Internal_Town').AsString := TownEdit.Text;
        ParamByName('Internal_Postcode').AsString := PostEdit.Text;
        ParamByName('Internal_Phone').AsString := PhoneEdit.Text;
        ParamByName('Internal_Fax').AsString := FaxEdit.Text;
        If BinsCheckBox.Checked then
             ParamByName('Stock_Bins_In_Use').AsString := 'Y'
        else
             ParamByName('Stock_Bins_In_Use').AsString := 'N' ;
        If LotsCheckBox.Checked then
             ParamByName('Stock_Lots_In_Use').AsString := 'Y'
        else
             ParamByName('Stock_Lots_In_Use').AsString := 'N' ;
        If NegativeCheckBox.Checked then
             ParamByName('Allow_Neg_Stock').AsString := 'Y'
        else
             ParamByName('Allow_Neg_Stock').AsString := 'N' ;
        if ChkBxActive.checked then
          ParamByName('InActive').AsString := 'N'
        else
          ParamByName('InActive').AsString := 'Y';
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
          ParamByName('Part_Store').AsInteger := iCode ;
          ExecSQL ;
          end;
     end;
end;

procedure TSTMntPrtStorFrm.NameEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtStorFrm.StorTypDBLookupComboBoxClick(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtStorFrm.StreetEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtStorFrm.DistrictEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtStorFrm.TownEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtStorFrm.PostEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtStorFrm.PhoneEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

procedure TSTMntPrtStorFrm.FaxEditChange(Sender: TObject);
begin
CheckOK(Self) ;
end;

end.
