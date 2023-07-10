unit PBMaintSuppCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ComCtrls, Buttons, ExtCtrls, Db, DBTables, Grids,
  DBGrids, ImgList;

type
  TCapDet = Class
  Private
    CDProdTyp: Integer;
    CDCap: Integer ;
    CDDef4All: ByteBool ;
    Procedure SetProdTyp(const Value: Integer);
    Procedure SetCap(const Value: Integer);
    Procedure SetDef4All(const Value: ByteBool);
  Public
    Constructor Create(const ProdTyp, Cap: Integer; Def4All: ByteBool) ;
    property ProdTyp: integer read CDProdTyp write SetProdTyp ;
    property Cap: integer read CDCap write SetCap ;
    property Def4All: ByteBool read CDDef4All write SetDef4All ;
    end;
  TPBMaintSuppCapFrm = class(TForm)
    SupCapGroupBox: TGroupBox;
    Panel1: TPanel;
    UnSelPanel: TPanel;
    UnSelCapsPanel: TPanel;
    UnSelPTsPanel: TPanel;
    SuppCapTreeView: TTreeView;
    Label1: TLabel;
    AddProdTypSpeedButton: TSpeedButton;
    DelProdTypSpeedButton: TSpeedButton;
    AddCapSpeedButton: TSpeedButton;
    DelCapSpeedButton: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    GetLastIntSelSQL: TQuery;
    AddIntSelSQL: TQuery;
    DelIntSelsSQL: TQuery;
    LoadIntSelSQL: TQuery;
    GetIntSelSQL: TQuery;
    GetUnSelProdTypsSQL: TQuery;
    UnSelProdTypsDS: TDataSource;
    UnSelProdTypsDBGrid: TDBGrid;
    UnSelCapsDBGrid: TDBGrid;
    GetUnSelCapsSQL: TQuery;
    UnSelCapsDS: TDataSource;
    DelIntSelSQL: TQuery;
    GetDefCapSQL: TQuery;
    TreeViewImageList: TImageList;
    AddSQL: TQuery;
    DelSQL: TQuery;
    GetNewCapSQL: TQuery;
    function InitailiseGroupBox(TempTabSheet: TTabSheet): TGroupBox;
    function InitialiseIntSel(Sender: TObject): Integer;
    procedure DeleteIntSel(Sender: TObject);
    procedure LoadTreeView(Sender: TObject);
    procedure ClearTreeView(Sender: TObject);
    procedure ClearCapDets(Sender: TObject);
    procedure LoadProdTypes(Sender: TObject);
    procedure AddProdTypSpeedButtonClick(Sender: TObject);
    procedure UnSelProdTypsDBGridCellClick(Column: TColumn);
    procedure CheckSpeedButtons(Sender: TObject);
    procedure AddTreeNode(iTempProdTyp, iTempCap:Integer; bTempDef4All: ByteBool; sTempDescr: String);
    procedure SuppCapTreeViewClick(Sender: TObject);
    procedure LoadUnSelCaps(iTempProdTyp: Integer);
    procedure UnSelCapsDBGridCellClick(Column: TColumn);
    procedure DelProdTypSpeedButtonClick(Sender: TObject);
    procedure DelTreeNode(iTempProdTyp, iTempCap:Integer);
    procedure AddCapSpeedButtonClick(Sender: TObject);
    procedure DelCapSpeedButtonClick(Sender: TObject);
    procedure LoadUnSelCapsPTChanged(Sender: TObject);
    procedure UpdateSuppCaps(iTempSupp, iTempBranch: Integer; bTempDelete: ByteBool);
    procedure SuppCapTreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure SuppCapTreeViewCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
  private
    { Private declarations }
    iRepSel, iPTLoaded: Integer;
    bExpandPTs: ByteBool ;
  public
    { Public declarations }
    iSupp, iBranch: Integer;
  end;

var
  PBMaintSuppCapFrm: TPBMaintSuppCapFrm;

implementation

uses PBDatabase, pbMainMenu;

{$R *.DFM}

function TPBMaintSuppCapFrm.InitailiseGroupBox(TempTabSheet: TTabSheet): TGroupBox;
begin
{Place the panel on the form's tabsheet and re-size it} ;
SupCapGroupBox.Parent := TempTabSheet ;
SupCapGroupBox.Width := TempTabSheet.Width - 8 ;
SupCapGroupBox.Font.Size := 8;
SupCapGroupBox.Height := TempTabSheet.Height - 8 ;
Panel1.Width := trunc(SupCapGroupBox.width/2);
UnSelPanel.Width := Panel1.width;
UnSelPanel.left := panel1.width+3;
UnSelPanel.Height := Panel1.height;
UnSelPTsPanel.Height := Trunc(UnSelPanel.Height/3) +4 ;
UnSelCapsPanel.Height := Trunc(UnSelPanel.Height*2/3) - 10 ;
Result := SupCapGroupBox ;
{{Initialise the entries on the Int_Sel file} ;
iRepSel := InitialiseIntSel(Self) ;
{Load the treeview} ;
LoadTreeView(Self) ;
{Load the unselected product types} ;
LoadProdTypes(Self) ;
{Set the currently loaded product type to 0} ;
iPTLoaded := 0 ;
{Chdeck what buttons should be selected} ;
CheckSpeedButtons(self) ;
end;

function TPBMaintSuppCapFrm.InitialiseIntSel(Sender: TObject): Integer;
var
  icount: Integer;
begin
  {Get a unique internal selection code}
  with GetLastIntSelSQL do
  begin
    Close;
    Open;
    First;
    icount := FieldByName('Last_Code').AsInteger + 1;
  end;
  {Write a dummy record for the selection code to stop anyone else using it}
  with AddIntSelSQL do
  begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := icount;
    ParamByName('Sel1').AsInteger := 0;
    ParamByName('Sel2').AsInteger := 0;
    ParamByName('Sel3').AsInteger := 0;
    ParamByName('Sel4').AsInteger := 0;
    ExecSQL;
  end;
  If iSupp > 0 then
        begin
        {Load up Int_Sel based on the Supplier Branch Capability file. If the suppier is 0} ;
        {We are ADDING a supplier} ;
        With LoadIntSelSQL do
                begin
                Close ;
                ParamByName('Supplier').AsInteger := iSupp ;
                ParamByName('Branch_No').AsInteger := iBranch ;
                ParamByName('Int_Sel_Code').AsInteger := icount;
                ExecSQL ;
                end;
        end;
Result := icount ;
end;

procedure TPBMaintSuppCapFrm.DeleteIntSel(Sender: TObject);
begin
{Remove all the Int_Sel records} ;
with DelIntSelsSQL do
    begin
    Close;
    ParamByName('Int_Sel_Code').AsInteger := iRepSel;
    ParamByName('Sel1').AsInteger := 0;
    ExecSQL;
    end;
end;

procedure TPBMaintSuppCapFrm.LoadTreeView(Sender: TObject);
Var
iLastProdType: Integer;
bTempDef4All: ByteBool ;
begin
{Clear the treeview (just in case)} ;
ClearTreeView(self) ;
{Set the flag to NOT expand the product types as they're added} ;
bExpandPTs := False ;
{Load up the treeview from int_sel} ;
With GetIntSelSQL do
        begin
        Close ;
        ParamByName('Int_Sel_Code').AsInteger := iRepSel;
        Open ;
        First ;
        iLastProdType := 0 ;
        While not EOF do
                begin
                If FieldByName('Product_Type').AsInteger <> iLastProdType then
                        begin
                        {New product type} ;
                        AddTreeNode(FieldByName('Product_Type').AsInteger,0,False,FieldByName('PT_Description').AsString) ;
                        iLastProdType := FieldByName('Product_Type').AsInteger ;
                        end;
                {Add the capability}
                If FieldByName('Text100').AsString = 'Y' then
                        bTempDef4All := True
                else
                        bTempDef4All := False ;
                AddTreeNode(FieldByName('Product_Type').AsInteger,FieldByName('Capability').AsInteger,
                        bTempDef4All, FieldByName('Cap_Description').AsString) ;
                Next ;
                end;
        end;
{Now set the flag so that any new product types are audomatically expanded} ;
bExpandPTs := True ;
end;

Constructor TCapDet.Create(const ProdTyp, Cap: Integer; Def4All: ByteBool) ;
begin
CDProdTyp := ProdTyp ;
CDCap := Cap ;
CDDef4All := Def4All ;
end;

procedure TCapDet.SetProdTyp(const Value: Integer) ;
begin
CDProdTyp := Value ;
end;

procedure TCapDet.SetCap(const Value: Integer) ;
begin
CDCap := Value ;
end;

procedure TCapDet.SetDef4All(const Value: ByteBool) ;
begin
CDDef4All := Value ;
end;

procedure TPBMaintSuppCapFrm.ClearTreeView(Sender: TObject);
begin
{Delete all the CapDep objects} ;
ClearCapDets(self) ;
end;

procedure TPBMaintSuppCapFrm.ClearCapDets(Sender: TObject);
Var
iCount: Integer ;
begin
For iCount := 0 to SuppCapTreeView.Items.Count-1 do
        TCapDet(SuppCapTreeView.Items[iCount].Data).Free ;
SuppCapTreeView.Items.Clear ;        
end;

procedure TPBMaintSuppCapFrm.LoadProdTypes(Sender: TObject);
begin
{Re-load the Unselected Product Types selection} ;
With GetUnSelProdTypsSQL do
        begin
        Close ;
        ParamByName('Int_Sel_Code').AsInteger := iRepSel;
        Open ;
        end;
end;

procedure TPBMaintSuppCapFrm.AddProdTypSpeedButtonClick(Sender: TObject);
Var
iTempCount: Integer;
sTempLastPT: String;
begin
{Add a selected product type} ;
For iTempCount := 0 to (UnSelProdTypsDBGrid.SelectedRows.Count - 1) do
    begin
    UnSelProdTypsDS.DataSet.GotoBookmark(Pointer(UnSelProdTypsDBGrid.SelectedRows[iTempCount])) ;
    {The following SQL adds the default capability into Int_Sel} ;
    With AddIntSelSQL do
        begin
        Close ;
        ParamByName('Int_Sel_Code').AsInteger := iRepSel;
        ParamByName('Sel1').AsInteger := UnSelProdTypsDS.DataSet.FieldByName('Product_Type').AsInteger ;
        ParamByName('Sel2').AsInteger := UnSelProdTypsDS.DataSet.FieldByName('Capability').AsInteger ;
        ParamByname('Sel3').AsInteger := iSupp;
        ParamByName('Sel4').AsInteger := iBranch;
        ExecSQL ;
        end;
    {Now add the new product type into the treeview} ;
    AddTreeNode(UnSelProdTypsDS.DataSet.FieldByName('Product_Type').AsInteger, 0, False,
                UnSelProdTypsDS.DataSet.FieldByName('Description').AsString) ;
    {Now add the default capability into the treeview} ;
    AddTreeNode(UnSelProdTypsDS.DataSet.FieldByName('Product_Type').AsInteger,
                UnSelProdTypsDS.DataSet.FieldByName('Capability').AsInteger, True,
                UnSelProdTypsDS.DataSet.FieldByName('Cap_Description').AsString) ;
    sTempLastPT := UnSelProdTypsDS.DataSet.FieldByName('Description').AsString ;
    end;
SuppCapTreeView.SetFocus ;
LoadProdTypes(Self) ;
{Find the place on the grid} ;
With GetUnSelProdTypsSQL do
        begin
        First ;
        While not EOF do
                begin
                If UnSelProdTypsDS.DataSet.FieldByName('Description').AsString > sTempLastPT then
                        break ;
                Next ;
                end;
        end;
CheckSpeedButtons(self) ;
end;

procedure TPBMaintSuppCapFrm.UnSelProdTypsDBGridCellClick(Column: TColumn);
begin
CheckSpeedButtons(self) ;
end;

procedure TPBMaintSuppCapFrm.CheckSpeedButtons(Sender: TObject);
begin
{Control whether the ADD PRODUCT TYPE button is available} ;
AddProdTypSpeedButton.Enabled := (UnSelProdTypsDBGrid.SelectedRows.Count > 0) and (dmBroker.iAccCtrl = 1);
{Control whether the ADD CAPABILITY button is available} ;
AddCapSpeedButton.Enabled := (UnSelCapsDBGrid.SelectedRows.Count > 0) and (dmBroker.iAccCtrl = 1);
If (SuppCapTreeView.Selected = Nil) or (dmBroker.iAccCtrl > 1) then
        begin
        DelProdTypSpeedButton.Enabled := False ;
        DelCapSpeedButton.Enabled := False ;
        end
else
        begin
        {The delete product type speed button is only enabled if a product type is selected} ;
        DelProdTypSpeedButton.Enabled := TCapDet(SuppCapTreeView.Selected.Data).Cap = 0 ;
        {The delete capability speed button is only enabled if a capability is selected AND} ;
        {it is NOT the default for all} ;
        DelCapSpeedButton.Enabled := (TCapDet(SuppCapTreeView.Selected.Data).Cap > 0 ) and
                                     (not TCapDet(SuppCapTreeView.Selected.Data).Def4All) ;
        end;
end;

procedure TPBMaintSuppCapFrm.AddTreeNode(iTempProdTyp, iTempCap:Integer; bTempDef4All: ByteBool; sTempDescr: String);
Var
iCount: Integer ;
bAddedOK: ByteBool ;
TN1: TTreeNode;
CD1: TCapDet ;
begin
{Add an entry into the treeview} ;
bAddedOK := False ;
If iTempCap = 0 then
        begin
        {Adding a new product type} ;
        TN1 := SuppCapTreeView.Items.AddChild(Nil,sTempDescr) ;
        TN1.ImageIndex := 5 ;
        TN1.SelectedIndex := 4 ;
        bAddedOK := True ;
        end
else
        begin
        {Adding a new capability to an existing product type} ;
        For iCount := 0 to SuppCapTreeView.Items.Count-1 do
                begin
                If (TCapDet(SuppCapTreeView.Items[iCount].Data).ProdTyp = iTempProdTyp) and
                        (TCapDet(SuppCapTreeView.Items[iCount].Data).Cap = 0) then
                                begin
                                {We've found the parent} ;
                                If bTempDef4All then
                                        sTempDescr := 'All' ;
                                TN1 := SuppCapTreeView.Items.AddChild(SuppCapTreeView.Items[iCount],sTempDescr) ;
                                If bTempDef4All then
                                        begin
                                        TN1.ImageIndex := 2 ;
                                        TN1.SelectedIndex := 2 ;
                                        end
                                else
                                        begin
                                        TN1.ImageIndex := 0 ;
                                        TN1.SelectedIndex := 0 ;
                                        end;
                                If bExpandPTs then
                                        begin
                                        {If this is not the inital treeview load, make sure the product type is} ;
                                        {expanded, and select the last item added also re-loading the unselected} ;
                                        {capabilities} ;
                                        SuppCapTreeView.Items[iCount].Expand(True) ;
                                        SuppCapTreeView.Selected := SuppCapTreeView.Items[iCount];
                                        LoadUnSelCapsPTChanged(self) ;
                                        end;        
                                bAddedOK := True ;
                                Break ;
                                end;
                end;
        end;
If not bAddedOK then
        begin
        MessageDlg('Could not find Product Type in selection list',mtError,[mbOK],0) ;
        end
else
        begin
        {Attach the details} ;
        CD1 := TCapDet.Create(iTempProdTyp, iTempCap, bTempDef4All) ;
        TN1.Data := CD1 ;
        end;
end;

procedure TPBMaintSuppCapFrm.SuppCapTreeViewClick(Sender: TObject);
begin
{If there is something selected and it's not for the same product type as before} ;
{re-load the unselected capabilities for the product type} ;
LoadUnSelCapsPTChanged(Self) ;
CheckSpeedButtons(Self) ;
end;

procedure TPBMaintSuppCapFrm.LoadUnSelCaps(iTempProdTyp: Integer);
begin
{Re-load the Unselected capabilities for the Product Type} ;
With GetUnSelCapsSQL do
        begin
        Close ;
        sql.clear;
        sql.add('Select Product_TypeCapability.Capability, ' +
        'Product_TypeCapability.Description as Cap_Description '+
        'From Product_TypeCapability ' +
        'Where (Product_TypeCapability.Product_Type = '+IntToStr(iTempProdTyp)+') and '+
        '((Product_TypeCapability.Default_For_All <> ''Y'') or '+
         '(Product_TypeCapability.Default_For_All is Null)) and '+
        '((Product_TypeCapability.inactive = ''N'') OR (Product_TypeCapability.inactive IS NULL)) AND '+
        '(Product_TypeCapability.Capability not in (Select Sel2 '+
                                        'From Int_Sel '+
                                        'Where (Int_Sel_Code = '+IntToStr(irepsel)+') and '+   
                                               '(Int_Sel.Sel1 =  Product_TypeCapability.Product_Type) and '+
                                               '(Int_Sel.Sel2 = Product_TypeCapability.Capability))) '+
        'Order By Product_TypeCapability.Description');
        Open ;
        end;
{Save the currently loaded prouct type} ;
iPTLoaded := iTempProdTyp ;
end;

procedure TPBMaintSuppCapFrm.UnSelCapsDBGridCellClick(Column: TColumn);
begin
CheckSpeedButtons(self) ;
end;

procedure TPBMaintSuppCapFrm.DelProdTypSpeedButtonClick(Sender: TObject);
begin
If MessageDlg('Delete this Product Type and all it''s Capabilities?', mtConfirmation,
                [mbNO,mbYes],0) = mrYes then
                begin
                {Delete an entire product group} ;
                DelTreeNode(TCapDet(SuppCapTreeView.Selected.Data).ProdTyp,0) ;
                LoadProdTypes(self) ;
                LoadUnSelCapsPTChanged(Self) ;
                CheckSpeedButtons(Self) ;
                end;
end;

procedure TPBMaintSuppCapFrm.DelTreeNode(iTempProdTyp, iTempCap:Integer);
Var
iCount: Integer;
begin
{Find the correct tree node} ;
For iCount := SuppCapTreeView.Items.Count-1 downto 0 do
        begin
        If (TCapDet(SuppCapTreeView.Items[iCount].Data).ProdTyp = iTempProdTyp) and
           ((TCapDet(SuppCapTreeView.Items[iCount].Data).Cap = iTempCap) or (iTempCap = 0)) then
                begin
                If TCapDet(SuppCapTreeView.Items[iCount].Data).Cap <> 0 then
                        begin
                        {Remove it from the workfile} ;
                        With DelIntSelSQL do
                                begin
                                Close ;
                                ParamByName('Int_Sel_Code').AsInteger := iRepSel;
                                ParamByName('Sel1').AsInteger := iTempProdTyp ;
                                ParamByName('Sel2').AsInteger := TCapDet(SuppCapTreeView.Items[iCount].Data).Cap ;
                                ExecSQL ;
                                end;
                        end;
                TCapDet(SuppCapTreeView.Items[iCount].Data).Free ;
                SuppCapTreeView.Items.Delete(SuppCapTreeView.Items[iCount]) ;
                end;
        end;
end;

procedure TPBMaintSuppCapFrm.AddCapSpeedButtonClick(Sender: TObject);
Var
iTempCount: Integer;
nextfound: boolean;
savekey: string;
begin
{Add a selected product type} ;
For iTempCount := 0 to (UnSelCapsDBGrid.SelectedRows.Count - 1) do
    begin
    UnSelCapsDS.DataSet.GotoBookmark(Pointer(UnSelCapsDBGrid.SelectedRows[iTempCount])) ;
    {Add capability into tree} ;
    AddTreeNode(TCapDet(SuppCapTreeView.Selected.Data).ProdTyp,
                UnSelCapsDS.DataSet.FieldByName('Capability').AsInteger, False,
                UnSelCapsDS.DataSet.FieldByName('Cap_Description').AsString) ;
    {Add the capability into the workfile} ;
    With AddIntSelSQL do
        begin
        Close ;
        ParamByName('Int_Sel_Code').AsInteger := iRepSel;
        ParamByName('Sel1').AsInteger := TCapDet(SuppCapTreeView.Selected.Data).ProdTyp ;
        ParamByName('Sel2').AsInteger := UnSelCapsDS.DataSet.FieldByName('Capability').AsInteger ;
        ExecSQL ;
        end;
    end;
    savekey := UnSelCapsDS.DataSet.FieldByName('Cap_Description').AsString;
{Delete the default capability} ;
For iTempCount := SuppCapTreeView.Items.Count-1 downto 0 do
    begin
    If (TCapDet(SuppCapTreeView.Items[iTempCount].Data).ProdTyp = TCapDet(SuppCapTreeView.Selected.Data).ProdTyp) and
           (TCapDet(SuppCapTreeView.Items[iTempCount].Data).Def4All) then
                begin
                With DelIntSelSQL do
                        begin
                        Close ;
                        ParamByName('Int_Sel_Code').AsInteger := iRepSel;
                        ParamByName('Sel1').AsInteger := TCapDet(SuppCapTreeView.Selected.Data).ProdTyp ;
                        ParamByName('Sel2').AsInteger := (TCapDet(SuppCapTreeView.Items[iTempCount].Data).Cap) ;
                        ExecSQL ;
                        end;
                 TCapDet(SuppCapTreeView.Items[iTempCount].Data).Free ;
                 SuppCapTreeView.Items.Delete(SuppCapTreeView.Items[iTempCount]) ;
                 end;
    end;
SuppCapTreeView.SetFocus ;
LoadUnSelCaps(TCapDet(SuppCapTreeView.Selected.Data).ProdTyp) ;
CheckSpeedButtons(Self) ;
end;

procedure TPBMaintSuppCapFrm.DelCapSpeedButtonClick(Sender: TObject);
Var
iTempCount, iTempCount2, iSelProdType, iSelCap: Integer ;
begin
{Delete a specific capability} ;
If SuppCapTreeView.Selected = Nil then
        begin
        exit ;
        end
else
        begin
        iSelProdType := TCapDet(SuppCapTreeView.Selected.Data).ProdTyp ;
        iSelCap := TCapDet(SuppCapTreeView.Selected.Data).Cap ;
        DelTreeNode(iSelProdType,iSelCap) ;
        iTempCount2 := 0 ;
        For iTempCount := SuppCapTreeView.Items.Count-1 downto 0 do
                If (TCapDet(SuppCapTreeView.Items[iTempCount].Data).ProdTyp = iSelProdType)  and
                        (TCapDet(SuppCapTreeView.Items[iTempCount].Data).Cap <> 0) then
                        iTempCount2 := iTempCount2 + 1 ;
        {There are no capabilities left} ;
        If iTempCount2 = 0 then
                begin
                {Add in the default capability} ;
                With GetDefCapSQL do
                        begin
                        Close ;
                        ParamByName('Product_Type').AsInteger := iSelProdType ;
                        Open ;
                        First ;
                        If not EOF then
                                begin
                                  AddTreeNode(iSelProdType,FieldByName('Capability').AsInteger,True,
                                        FieldByName('Description').AsString) ;
                                  With AddIntSelSQL do
                                  begin
                                    Close ;
                                    ParamByName('Int_Sel_Code').AsInteger := iRepSel;
                                    ParamByName('Sel1').AsInteger := iselProdType;
                                    //UnSelProdTypsDS.DataSet.FieldByName('Product_Type').AsInteger ;
                                    ParamByName('Sel2').AsInteger := GetDefCapSql.FieldByName('Capability').AsInteger ;
                                    ParamByname('Sel3').AsInteger := iSupp;
                                    ParamByName('Sel4').AsInteger := iBranch;
                                    ExecSQL ;
                                  end;
                                end;
                        end;
                end;
        LoadUnSelCaps(iSelProdType) ;
        CheckSpeedButtons(Self) ;
        end;
end;

procedure TPBMaintSuppCapFrm.LoadUnSelCapsPTChanged(Sender: TObject);
begin
If SuppCapTreeView.Selected <> Nil then
        begin
        {If there is aproduct type selected, re-load un-selected capabilities if} ;
        {it's a different product type to last time} ;
        If TCapDet(SuppCapTreeView.Selected.Data).ProdTyp <> iPTLoaded then
                LoadUnSelCaps(TCapDet(SuppCapTreeView.Selected.Data).ProdTyp)
        end
else
        begin
        {If no product type is selected, clear the un-selected capabilities list} ;
        LoadUnSelCaps(0) ;
        end;
end;

procedure TPBMaintSuppCapFrm.UpdateSuppCaps(iTempSupp, iTempBranch: Integer; bTempDelete: ByteBool);
begin
{Update the file based on Int_Sel} ;
{First, if it's NOT a delete run, do all the adding} ;
{due to errors in odbs drivers for nested select, need to build sql and not pass params};
{also cannot do insert at same time need to split to 2 sqls };
If not bTempDelete then
        begin
        with GetNewCapSql do
          begin
            Close;
            sql.clear;
            sql.add(
            'Select Sel1, Sel2 ' +
            'From Int_Sel ' +
            'Where (Int_Sel_Code = '+ IntToStr(iRepSel)+') and ' +
            '(Sel1 <> 0) and '+
            '(not exists (Select Capability ' +
                    'from Splr_BrnchPrdct_TypCpblty ' +
             'Where (Supplier = '+IntToStr(iTempSupp) + ') and '+
              '(Branch_No = '+IntToStr(iTempBranch) + ') and ' +
                         '(Product_Type = Sel1) and ' +
                         ' (Capability = Sel2)))');
            Open;
            first;
            while not eof do
            begin
              with AddSQL do
                begin
                  Close ;
                  ParamByName('Supplier').AsInteger := iTempSupp;
                  ParamByname('Branch_No').AsInteger := iTempBranch;
                  ParamByName('Sel1').AsInteger := GetNewCapSql.FieldByname('Sel1').AsInteger;
                  ParamByName('Sel2').AsInteger := GetNewCapSql.FieldByname('Sel2').AsInteger;
                  execsql;
                end;
              next;
            end;
          end;
        end;
{Now do all the deletes} ;
With DelSQL do
        begin
        Close ;
        sql.Clear;
        if bTempDelete then
          SQL.Add(
          'Delete From Splr_BrnchPrdct_TypCpblty '+
          'Where (Supplier = '+IntToStr(iTempSupp) + ') and '+
        '(Branch_No = '+IntToStr(iTempBranch) + ') ')
      else
        SQL.Add(
          'Delete From Splr_BrnchPrdct_TypCpblty '+
         'Where (Supplier = '+IntToStr(iTempSupp) + ') and '+
        '(Branch_No = '+IntToStr(iTempBranch) + ') and ' +
        '(not exists (Select Sel2 ' +
                    'from Int_Sel IS1 ' +
                    'Where (IS1.Int_Sel_Code = '+ IntToStr(iRepSel)+') and ' +
                          '(Product_Type = IS1.Sel1) and ' +
                          '(Capability = IS1.Sel2))) ');
        ExecSQL ;
        end;
end;

procedure TPBMaintSuppCapFrm.SuppCapTreeViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
Node.selected := true;
end;

procedure TPBMaintSuppCapFrm.SuppCapTreeViewCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
Node.Selected := true;
end;

end.
