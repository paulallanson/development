(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Supplier/Branch Capabilities Form

VSS Info:
$Header: /CCSCommon/CSMaintSupCap.pas 1     10/01/:1 13:02 Paul $
$History: CSMaintSupCap.pas $
 * 
 * *****************  Version 1  *****************
 * User: Paul         Date: 10/01/:1   Time: 13:02
 * Created in $/CCSCommon
 * First check-in of new database routines for Broker and Sales Order
 * processing.
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:42
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit CSMaintSupCap;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, DB, DBTables;

type
  TCSMaintSupCapFrm = class(TForm)
    SelProductTypeGrpBox: TGroupBox;
    Label1: TLabel;
    ProdTypesDBLCB: TDBLookupComboBox;
    AlreadySelChkBox: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    AddBitBtn: TBitBtn;
    RemBitBtn: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    SuppLabel: TLabel;
    BranchLabel: TLabel;
    ProdTypesSRC: TDataSource;
    GetProdTypesSQL: TQuery;
    GetProdTypesSelSQL: TQuery;
    CapSelLB: TListBox;
    GetCapsSQL: TQuery;
    CapsSRC: TDataSource;
    CapsDBLLB: TDBLookupListBox;
    GetCapsSelSQL: TQuery;
    CancelBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    DelCapSQL: TQuery;
    AddCapSQL: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure ShowProdTypes(Sender: TObject);
    procedure AlreadySelChkBoxClick(Sender: TObject);
    procedure ProdTypesDBLCBClick(Sender: TObject);
    procedure ShowCaps(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure CapsDBLLBClick(Sender: TObject);
    procedure CapSelLBClick(Sender: TObject);
    procedure RemBitBtnClick(Sender: TObject);
    procedure CancelBitBtnClick(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iSupp, iBranch: Integer ;
    sSuppName, sBranchName: String ;
    iSelCap: Array[0..199] of Integer ;
  end;

var
  CSMaintSupCapFrm: TCSMaintSupCapFrm;

implementation

{$R *.DFM}

procedure TCSMaintSupCapFrm.FormActivate(Sender: TObject);
begin
SuppLabel.Caption := sSuppName ;
BranchLabel.Caption := sBranchName ;
{Load up the product types}
ShowProdTypes(self) ;
AddBitBtn.Enabled := False ;
RemBitBtn.Enabled := False ;
CancelBitBtn.Enabled := False ;
OKBitBtn.Enabled := False ;
CloseBitBtn.Enabled := True ;
SelProductTypeGrpBox.Enabled := True ;
GetCapsSQL.Close ;
CapSelLB.Items.Clear ;
ProdTypesDBLCB.KeyValue := Null ;
end;

procedure TCSMaintSupCapFrm.ShowProdTypes(Sender: TObject);
begin
GetProdTypesSelSQL.Close ;
GetProdTypesSQL.Close ;
If ( not AlreadySelChkBox.Checked) then
   begin
   With GetProdTypesSQL do
        begin
        Close ;
        Open ;
        ProdTypesSRC.DataSet := GetProdTypesSQL ;
        end;
   end
else
   begin
   With GetProdTypesSelSQL do
        begin
        Close ;
        ParamByName('Supplier').AsInteger := iSupp ;
        ParamByName('Branch_No').AsInteger := iBranch ;
        Open ;
        ProdTypesSRC.DataSet := GetProdTypesSelSQL ;
        end;
   end;
end;

procedure TCSMaintSupCapFrm.AlreadySelChkBoxClick(Sender: TObject);
begin
ShowProdTypes(Self) ;
end;

procedure TCSMaintSupCapFrm.ProdTypesDBLCBClick(Sender: TObject);
begin
CapSelLB.Clear ;
{Load the selected array from the file} ;
With GetCapsSelSQL do
     begin
     Close ;
     ParamByname('Supplier').AsInteger := iSupp ;
     ParamByname('Branch_No').AsInteger := iBranch ;
     ParamByname('Product_Type').AsInteger := ProdTypesDBLCB.KeyValue ;
     Open ;
     First ;
     While ( not EOF) do
           begin
           CapSelLB.Items.Add(FieldByName('Description').AsString) ;
           iSelCap[CapSelLB.Items.Count - 1] := FieldByName('Capability').AsInteger ;
           Next ;
           end;
     end;
{Load up the other grids} ;
ShowCaps(Self) ;
CloseBitBtn.Enabled := False ;
CancelBitBtn.Enabled := True ;
OKBitBtn.Enabled := True ;
SelProductTypeGrpBox.Enabled := False ;
end;

procedure TCSMaintSupCapFrm.ShowCaps(Sender: TObject);
Var
iCount: Integer ;
begin
{Write the SQL for displaying the capabilities} ;
With GetCapsSQL do
     begin
     Close ;
     SQL.Clear ;
     SQL.Add('Select Product_TypeCapability.Capability,  Product_TypeCapability.Description') ;
     SQL.Add('From Product_TypeCapability') ;
     SQL.Add('Where (Product_TypeCapability.Product_Type = ' + IntToStr(ProdTypesDBLCB.KeyValue) + ')') ;
     For iCount := 0 to 199 do
         begin
         If iSelCap[iCount] = 0 then break ;
         SQL.Add(' and  (Product_TypeCapability.Capability <>' + IntToStr(iSelCap[icount]) +' )') ;
         end;
     SQL.Add('Order By Product_TypeCapability.Description') ;
     Open ;
     end;
AddBitBtn.Enabled := False ;
end;

procedure TCSMaintSupCapFrm.AddBitBtnClick(Sender: TObject);
begin
{Add a selected capability into the selected list} ;
CapSelLB.Items.Add(CapsSRC.DataSet.FieldByName('Description').AsString) ;
iSelCap[CapSelLB.Items.Count - 1] := CapsDBLLB.KeyValue ;
ShowCaps(Self) ;
end;

procedure TCSMaintSupCapFrm.CapsDBLLBClick(Sender: TObject);
begin
AddBitBtn.Enabled := True ;
end;

procedure TCSMaintSupCapFrm.CapSelLBClick(Sender: TObject);
begin
RemBitBtn.Enabled := True ;
end;

procedure TCSMaintSupCapFrm.RemBitBtnClick(Sender: TObject);
Var
iCount, iCount2: Integer ;
begin
{Delete an item from the list box and the array} ;
iCount := CapSelLB.ItemIndex ;
For iCount2 := iCount To (CapSelLB.Items.Count - 1) do
    iSelCap[iCount2] := iSelCap[iCount2 + 1] ;
CapSelLB.Items.Delete(iCount) ;
ShowCaps(Self) ;
RemBitBtn.Enabled := False ;
end;

procedure TCSMaintSupCapFrm.CancelBitBtnClick(Sender: TObject);
begin
FormActivate(self) ;
end;

procedure TCSMaintSupCapFrm.OKBitBtnClick(Sender: TObject);
Var
iCount: Integer ;
begin
{First, delete the selected capabilities}
With DelCapSQL do
     begin
     ParamByname('Supplier').AsInteger := iSupp ;
     ParamByname('Branch_No').AsInteger := iBranch ;
     ParamByname('Product_Type').AsInteger := ProdTypesDBLCB.KeyValue ;
     ExecSQL ;
     end;
For iCount := 0 to (CapSelLB.Items.Count - 1) do
    begin
    With AddCapSQL do
         begin
         Close ;
         ParamByname('Supplier').AsInteger := iSupp ;
         ParamByname('Branch_No').AsInteger := iBranch ;
         ParamByname('Product_Type').AsInteger := ProdTypesDBLCB.KeyValue ;
         ParamByname('Capability').AsInteger := iSelCap[iCount] ;
         ExecSQL ;
         End;
    End;
end;

end.
