unit STMaintProductLvls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ExtCtrls, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmSTMaintProductLvls = class(TForm)
    grpbxDetails: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    ReplenLabel: TLabel;
    LblReordr: TLabel;
    MaxMemo: TMemo;
    MinMemo: TMemo;
    rdgrpReplenishType: TRadioGroup;
    dblkpReplenishStore: TDBLookupComboBox;
    MemoReOrder: TMemo;
    btnOK: TBitBtn;
    CancelBitBtn: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    edtProductCode: TEdit;
    qryStores: TFDQuery;
    dtsStores: TDataSource;
    qryStoreLevels: TFDQuery;
    lblDelete: TLabel;
    qryUpdPartLevel: TFDQuery;
    qryAddPartLevel: TFDQuery;
    qryDelPartLevel: TFDQuery;
    dblkpStoreType: TDBLookupComboBox;
    qryStoreType: TFDQuery;
    dtsStoreType: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure MinMemoKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    sPart, sStoretype: string;
    iPartStoreType: integer;
    sFuncMode: string;
    bOK: boolean;
  end;

var
  frmSTMaintProductLvls: TfrmSTMaintProductLvls;

implementation

uses pbDatabase, pbMainMenu;

{$R *.DFM}

procedure TfrmSTMaintProductLvls.FormActivate(Sender: TObject);
begin
  edtProductCode.Text := sPart ;

  qryStores.close;
  qrystores.open;

  qryStoreType.close;
  if sFuncMode = 'A' then
    qryStoreType.parambyname('Part').asstring := sPart
  else
    qryStoreType.parambyname('Part').asstring := '';
  qrystoreType.open;

  if sFuncMode = 'A' then
    Caption := 'Add a new product';
  if sFuncMode = 'C' then
    Caption := 'Change a product';
  if sFuncMode = 'D' then
    Caption := 'Delete a product';
  if sFuncMode = 'A' then
  begin
    {Empty details};
    MinMemo.text := '';
    MaxMemo.text := '';
    MemoReOrder.text := '';
    dblkpStoreType.keyvalue := 0;
    dblkpReplenishStore.keyvalue := 0;
    dblkpStoreType.setfocus;
  end
  else
  begin
    with qryStoreLevels do
    begin
      close;
      parambyname('Part').asstring := sPart;
      parambyname('Part_Store_type').asinteger := iPartStoreType;
      open;
      MinMemo.text := inttostr(fieldbyname('Minimum_stock').asinteger);
      MaxMemo.text := inttostr(fieldbyname('Maximum_stock').asinteger);
      MemoReOrder.text := inttostr(fieldbyname('Reorder_level').asinteger);
      if fieldbyname('Purchase_or_Store').asstring = 'P' then
        rdgrpReplenishType.itemindex := 0
      else
        rdgrpReplenishType.itemindex := 1;

      dblkpStoreType.keyvalue := fieldbyname('part_store_type').asinteger;
      dblkpReplenishStore.keyvalue := fieldbyname('Replenish_store').asinteger;

      dblkpstoretype.enabled := false;

    end;
    MinMemo.setfocus;
  end;
  {Enable or disable the buttons};
  grpbxDetails.Enabled := (sFuncMode <> 'D');
  lblDelete.Visible := (sFuncMode = 'D');

  CheckOK(Self);
end;

procedure TfrmSTMaintProductLvls.CheckOK(Sender: TObject);
begin
  btnOK.enabled :=  (MinMemo.text <> '') and
                    (MaxMemo.text <> '') and
                    (MemoReOrder.text <> '');
end;

procedure TfrmSTMaintProductLvls.MinMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    '0'..'9': ;
    #8: {backspace}
      ;
  else
    Key := #0;
  end;
end;

procedure TfrmSTMaintProductLvls.btnOKClick(Sender: TObject);
begin
  if rdGrpReplenishType.itemindex = 1 then
    if dblkpReplenishStore.keyvalue = 0 then
      begin
        messagedlg('If replenishment is by store then a store must be specified', mtInformation,
      [mbOk], 0);
        dblkpReplenishStore.setfocus;
        exit;
      end;
  if sFuncMode = 'A' then
  begin
    with qryAddPartLevel do
      begin
        Close ;
        ParamByName('Part_Store_Type').AsInteger := dblkpStoreType.keyvalue;
        ParamByName('Part').AsString := sPart;
        ParamByName('Minimum_Stock').AsInteger := strtoint(MinMemo.text);
        ParamByName('Maximum_Stock').AsInteger := strtoint(MaxMemo.text);
        ParamByName('ReOrder_Level').AsInteger := strtoint(memoReorder.text);
        case rdgrpReplenishtype.itemindex of
        0:  begin
              ParamByName('Purchase_Or_Store').AsString := 'P';
              ParamByName('Replenish_Store').Clear;
            end;
        1:  begin
              ParamByName('Purchase_Or_Store').AsString := 'S';
              ParamByName('Replenish_Store').AsInteger := dblkpReplenishStore.keyvalue;
            end
        else
          begin
            ParamByName('Purchase_Or_Store').AsString := 'P';
            ParamByName('Replenish_Store').Clear;
          end
        end;
        ExecSQL ;
      end
  end
  else
  if sFuncMode = 'C' then
  begin
    with qryUpdPartLevel do
      begin
        Close ;
        ParamByName('Part_Store_Type').AsInteger := dblkpStoreType.keyvalue;
        ParamByName('Part').AsString := sPart;
        ParamByName('Minimum_Stock').AsInteger := strtoint(MinMemo.text);
        ParamByName('Maximum_Stock').AsInteger := strtoint(MaxMemo.text);
        ParamByName('ReOrder_Level').AsInteger := strtoint(memoReorder.text);
        case rdgrpReplenishtype.itemindex of
        0:  begin
              ParamByName('Purchase_Or_Store').AsString := 'P';
              ParamByName('Replenish_Store').Clear;
            end;
        1:  begin
              ParamByName('Purchase_Or_Store').AsString := 'S';
              ParamByName('Replenish_Store').AsInteger := dblkpReplenishStore.keyvalue;
            end
        else
          begin
            ParamByName('Purchase_Or_Store').AsString := 'P';
            ParamByName('Replenish_Store').Clear;
          end
        end;
        ExecSQL ;
      end;
  end
  else
  if sFuncMode = 'D' then
  begin
    with qryDelPartLevel do
    begin
      Close;
      ParamByName('Part').AsString := sPart;
      Parambyname('Part_Store_type').asinteger := iPartStoreType;
      ExecSQL;
    end;
  end;
  bOK := True;
  modalresult := mrOK;
end;

procedure TfrmSTMaintProductLvls.FormCreate(Sender: TObject);
begin
  dmBroker.ScreenAccessControl(Self,'mnuStock',frmPBMainMenu.iOperator,0,0) ;
end;

end.
