unit StMntPrtSupp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ComCtrls, Db, Buttons, ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSuppDet = class
  Private
    SDCode: Integer ;
    SDBranch: Integer;
    SDName: String;
    Procedure SetCode(const Value: Integer);
    Procedure SetBranch(const Value: Integer);
    Procedure SetName(const Value: string);
  Public
    Constructor Create(const SDCodeVal, SDBranchVal: Integer; SDNameVal: string) ;
    property Code: Integer read SDCode write SetCode ;
    property Branch: integer read SDBranch write SetBranch ;
    property Name: string read SDName write SetName ;
  end;
  TSTMntPrtSuppFrm = class(TForm)
    PartLabel: TLabel;
    PartEdit: TEdit;
    PartDescrEdit: TEdit;
    GetPartSuppsQuery: TFDQuery;
    GetSuppsQuery: TFDQuery;
    SuppsListView: TListView;
    AvailListView: TListView;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    AddSuppQuery: TFDQuery;
    DelSuppsQuery: TFDQuery;
    Label4: TLabel;
    SearchGrpBox: TGroupBox;
    NameEdit: TEdit;
    tmrSearch: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure ListDragDrop(Sender, Source: TObject; X,Y: Integer);
    procedure SuppsListViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure AvailListViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure OKBitBtnClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure AvailListViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure SuppsListViewDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure NameEditChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure RefreshData;
    procedure RefreshSupplierData;
    { Private declarations }
 public
    { Public declarations }
    sSelPart, sSelDescr, sName: String;
    iNoParts: Integer ;
    bOK: ByteBool ;
  end;

var
  STMntPrtSuppFrm: TSTMntPrtSuppFrm;

implementation

{$R *.DFM}

procedure TSTMntPrtSuppFrm.FormActivate(Sender: TObject);
begin
  RefreshSupplierData;
  RefreshData;
  Nameedit.setfocus;
end;

procedure TSTMntPrtSuppFrm.RefreshSupplierData;
var
  tlTempList: TListItem;
  SuppDet: TSuppDet ;
begin
  bOK := False ;
  PartDescrEdit.Visible := (iNoParts < 2) ;
  PartEdit.Visible := (iNoParts < 2) ;
  If iNoParts < 2 then
    begin
      Caption := 'Change suppliers for a product' ;
      PartEdit.Text := sSelPart;
      PartDescrEdit.Text := sSelDescr ;
      PartLabel.Caption := 'Suppliers for product:' ;
    end
  else
    begin
      Caption := 'Change suppliers for multiple products' ;
      PartLabel.Caption := 'You are changing suppliers for ' + IntToStr(iNoParts) + ' products.' ;
   end;
   
  AvailListview.Clear;
  With GetSuppsQuery do
    begin
      Close ;
      ParamByName('Part').AsString := sSelpart ;
      ParamByName('Name').AsString := '%' + sName + '%';
      Open ;
      First ;
      While EOF = False do
        begin
          tlTempList := AvailListView.Items.Add ;
          tlTempList.Caption := FieldByName('Supplier_Name').AsString ;
          SuppDet := TSuppDet.Create(FieldByName('Supplier').AsInteger,
                                      FieldByName('Branch_No').AsInteger,
                                      FieldByName('Supplier_Name').AsString) ;
          tlTempList.Data := SuppDet ;
          tlTempList.ImageIndex := 0 ;
          Next ;
        end;
    end;

end;

procedure TSTMntPrtSuppFrm.RefreshData;
var
  tlTempList: TListItem;
  SuppDet: TSuppDet ;
begin
  With GetPartSuppsQuery do
    begin
      Close ;
      ParamByName('Part').AsString := sSelpart ;
      Open ;
      First ;
      While EOF = False do
        begin
          tlTempList := SuppsListView.Items.Add ;
          tlTempList.Caption := FieldByName('Supplier_Name').AsString ;
          SuppDet := TSuppDet.Create(FieldByName('Supplier').AsInteger,
                                      FieldByName('Branch_No').AsInteger,
                                      FieldByName('Supplier_Name').AsString) ;
          tlTempList.Data := SuppDet ;
          tlTempList.ImageIndex := 1 ;
          Next ;
        end;
    end;
end;

procedure TSTMntPrtSuppFrm.ListDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  L1, L2 : TListItem;
begin
  { Sender is either ListView, Source is the other ListView.  When dragging,
    the dragged object is the ListView's Selected property.
    First check to see if the drag is over an item in the receiving
    ListView using GetItemAt. }
  L1 := (Sender as TListView).GetItemAt(x,y);
  if Assigned(L1) then
  begin  { Dragging onto a list item in Sender's box }
    { Do an insert in the receiving ListView to get a slot }
    L2 := TListView(Sender).Items.Insert(L1.Index);
    { Get the selected item in the sending ListView box }
    L1 := (Source as TListView).Selected;
    { Assign the values in the dragged object to the slot created }
    L2.Assign(L1);
    { Delete the dragged object from the sender's ListView }
    (Source as TListView).Items.Delete(L1.Index);
  end
  else
  begin  { Dragging into an empty space }
    { Do an add in the receiving ListView to get a slot }
    L2 := (Sender as TListView).Items.Add;
    { Get the selected item in the sending ListView box }
    L1 := (Source as TListView).Selected;
    { Assign the values in the dragged object to the slot created }
    L2.Assign(L1);
    { Delete the dragged object from the sender's ListView }
    (Source as TListView).Items.Delete(L1.Index);
    end;
end;

procedure TSTMntPrtSuppFrm.SuppsListViewDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
If (Source is TListView) then
   Accept := (((Source as TListView).Name = 'SuppsListView') or
              ((Source as TListView).Name = 'AvailListView')) ;
end;

procedure TSTMntPrtSuppFrm.AvailListViewDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
If (Source is TListView) then
   Accept := ((Source as TListView).Name = 'SuppsListView') ;
end;

constructor TSuppDet.Create(const SDCodeVal, SDBranchVal: Integer; SDNameVal: String) ;
begin
Code := SDCodeVal ;
Branch := SDBranchVal ;
Name := SDNameVal ;
end;

procedure TSuppDet.SetCode(const Value: Integer) ;
begin
SDCode := Value ;
end;

procedure TSuppDet.SetBranch(const Value: Integer) ;
begin
SDBranch := Value ;
end;

procedure TSuppDet.SetName(const Value: String) ;
begin
SDName := Value ;
end;

procedure TSTMntPrtSuppFrm.OKBitBtnClick(Sender: TObject);
Var
iTempCount: Integer ;
begin
{This only updates the 1st part. If more than 1 is selected, it is handled in the main form};
With DelSuppsQuery do
     begin
     Close ;
     ParamByName('Part').AsString := sSelPart ;
     ExecSQL ;
     end;
For iTempCount := 0 to (SuppsListView.Items.Count - 1) do
     begin
     With AddSuppQuery do
          begin
          Close ;
          ParamByName('Part').AsString := sSelPart ;
          ParamByName('Supplier').AsInteger := TSuppDet(SuppsListView.Items[iTempCount].Data).Code ;
          ParamByName('Branch_No').AsInteger := TSuppDet(SuppsListView.Items[iTempCount].Data).Branch ;
          ParamByName('Supplier_Preference_Order').AsInteger := iTempCount ;
          ExecSQL ;
          end;
     end;
bOK := True ;
end;


procedure TSTMntPrtSuppFrm.FormDeactivate(Sender: TObject);
Var
iTempCount: Integer ;
begin
For iTempCount := 0 to (SuppsListView.Items.Count - 1) do
    TSuppDet(SuppsListView.Items[iTempCount].Data).Free ;
For iTempCount := 0 to (AvailListView.Items.Count - 1) do
    TSuppDet(AvailListView.Items[iTempCount].Data).Free ;
end;

procedure TSTMntPrtSuppFrm.AvailListViewDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  L1, L2 : TListItem;
  iTempCount: Integer ;
begin
  { Sender is either ListView, Source is the other ListView.  When dragging,
    the dragged object is the ListView's Selected property.
    First check to see if the drag is over an item in the receiving
    ListView using GetItemAt. }
  L1 := (Source as TListView).Selected ;
  iTempCount := 0 ;
  While (iTempCount < AvailListView.Items.Count) do
        begin
        If AvailListView.Items[iTempCount].Caption >= L1.Caption then
            begin
            L2 := AvailListView.Items.Insert(iTempCount) ;
            L2.Caption := L1.Caption ;
            L2.Data := L1.Data ;
            Break ;
            end;
        iTempCount := iTempcount + 1 ;
        end;
  If iTempCount >= AvailListView.Items.Count then
        begin
        L2 := AvailListView.Items.Add ;
        L2.Caption := L1.Caption ;
        L2.Data := L1.Data ;
        end;
   (Source as TListView).Items.Delete(L1.Index);
end;

procedure TSTMntPrtSuppFrm.SuppsListViewDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
  L1, L2 : TListItem;
begin
  { Sender is either ListView, Source is the other ListView.  When dragging,
    the dragged object is the ListView's Selected property.
    First check to see if the drag is over an item in the receiving
    ListView using GetItemAt. }
  L1 := (Sender as TListView).GetItemAt(x,y);
  if Assigned(L1) then
  begin  { Dragging onto a list item in Sender's box }
    { Do an insert in the receiving ListView to get a slot }
    L2 := TListView(Sender).Items.Insert(L1.Index);
    { Get the selected item in the sending ListView box }
    L1 := (Source as TListView).Selected;
    { Assign the values in the dragged object to the slot created }
    L2.Assign(L1);
    { Delete the dragged object from the sender's ListView }
    (Source as TListView).Items.Delete(L1.Index);
  end
  else
  begin  { Dragging into an empty space }
    { Do an add in the receiving ListView to get a slot }
    L2 := (Sender as TListView).Items.Add;
    { Get the selected item in the sending ListView box }
    L1 := (Source as TListView).Selected;
    { Assign the values in the dragged object to the slot created }
    L2.Assign(L1);
    { Delete the dragged object from the sender's ListView }
    (Source as TListView).Items.Delete(L1.Index);
    end;
end;

procedure TSTMntPrtSuppFrm.NameEditChange(Sender: TObject);
begin
  sname := nameedit.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TSTMntPrtSuppFrm.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  RefreshSupplierData;
end;

procedure TSTMntPrtSuppFrm.FormCreate(Sender: TObject);
begin
  sName := '';
end;

end.
