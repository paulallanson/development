unit CSLUCustDisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, DB, ExtCtrls, Buttons, DBCtrls,
  ComCtrls, ImgList,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDiscDet = class
  Private
    DDCust: Integer;
    DDDate_effec: TDateTime;
    DDDate_Ineffec: TDateTime;
    DDDesc: String;
    DDDisc_Val: Real;
    DDGroup: Integer;
    DDPart: String;
    DDRec: Integer;
    DDTyp: String;
    DDByPart: ByteBool;
    procedure setCust(const Value: Integer);
    procedure setDate_effec(const Value: TDateTime);
    procedure setDate_Ineffec(const Value: TDateTime);
    procedure setDesc(const Value: String);
    procedure setDisc_Val(const Value: Real);
    procedure setGroup(const Value: Integer);
    procedure setPart(const Value: String);
    procedure SetRec(const Value: Integer);
    procedure SetTyp(const Value: String);
    procedure setByPart(const Value: ByteBool);
  Public
    Constructor Create(Const Rec: Integer; Typ, Desc, Part:String;
    Cust, Group: Integer; Disc_Val :Real; Date_effec, Date_ineffec :TDatetime;
    ByPart: Bytebool);
  property Rec: Integer read ddRec write SetRec;
  property Typ: String read ddTyp write SetTyp;
  property Desc: String read ddDesc write setDesc;
  property Part: String read ddPart write setPart;
  property Cust: Integer read ddCust write setCust;
  property Group: Integer read ddGroup write setGroup;
  property Disc_Val: Real read ddDisc_Val write setDisc_Val;
  property Date_effec: TDateTime read ddDate_effec write setDate_effec;
  property Date_Ineffec: TDateTime read ddDate_Ineffec write setDate_Ineffec;
  property ByPart: ByteBool read DDByPart write setByPart;
  end;

  TCSLUCustDiscFrm = class(TForm)
    DetsSRC: TDataSource;
    GetDetsSQL: TFDQuery;
    SelectBitBtn: TBitBtn;
    CloseBitBtn: TBitBtn;
    CountLabel: TLabel;
    FuncGrpBox: TGroupBox;
    AddBitBtn: TBitBtn;
    ChgBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    CustLabel: TLabel;
    DiscTreeView: TTreeView;
    TreeImageList: TImageList;
    GetGroupsQuery: TFDQuery;
    GetPartsQuery: TFDQuery;
    procedure AddBitBtnClick(Sender: TObject);
    procedure ChgBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure CallMaintScreen(sTempFuncMode: String);
    procedure UpdateTreeView(sTempFuncMode: String);
    procedure LoadTreeViews(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DiscTreeViewClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    private
    { Private declarations }
  public
    { Public declarations }
    iCust: Integer ;
    sCustName,sSelCode: String ;
    bIs_Lookup, bAllow_Upd,Selected: ByteBool ;
    tnCode, tnGroup, tnTemp: TTreenode;
    rec_point: Integer;
    ddTemp: TDiscDet;
    end;

  var
  CSLUCustDiscFrm: TCSLUCustDiscFrm;

implementation

uses CSMaintCustCstCntr, CCSCommon, CSMaintCustDisc;

{$R *.DFM}

procedure TCSLUCustDiscFrm.AddBitBtnClick(Sender: TObject);
begin
{Add a new Rep} ;
CallMaintScreen('A') ;
end;

procedure TCSLUCustDiscFrm.ChgBitBtnClick(Sender: TObject);
begin
{Change a Rep} ;
if rec_point = 0 then
  exit;
  CallMaintScreen('C');
end;

procedure TCSLUCustDiscFrm.DelBitBtnClick(Sender: TObject);
begin
{Delete a Rep} ;
if rec_point = 0 then
  exit;
CallMaintScreen('D') ;
end;

procedure TCSLUCustDiscFrm.CallMaintScreen(sTempFuncMode: String);
begin
CSMaintCustDiscFrm := TCSMaintCustDiscFrm.Create(self) ;
CSMaintCustDiscFrm.sFuncMode := sTempFuncMode ;
CSMaintCustDiscFrm.ShowModal ;
if not (CSMaintCustDiscFrm.ModalResult = mrCancel) then
  UpdateTreeView(sTempFuncMode) ;
CSMaintCustDiscFrm.Free ;
end;

procedure TCSLUCustDiscFrm.LoadTreeViews(Sender: TObject);
Var
scode: string;
begin
{Load up the tree view};
DiscTreeview.Items.Clear;
tncode := DiscTreeView.Items.Add(Nil,'Product Code');
ddTemp := TDiscDet.Create(0, '', '', '', 0, 0, 0.00, 0, 0, True);
tncode.Data := ddTemp;
tngroup := DiscTreeView.Items.Add(Nil,'Product Group');
ddTemp := TDiscDet.Create(0, '', '', '', 0, 0, 0.00, 0, 0, False);
tngroup.data := ddTemp;
GetDetssql.sql := getPartsQuery.sql;
With GetDetsSql do
  begin
    Close;
    ParamByName('Customer').AsInteger := icust;
    Open;
    First;
    if not EOF then
      begin
        while EOF = False do
          begin
          scode := fieldbyname('Part').AsString;
(*        tntemp := DiscTreeView.Items.AddChild(tncode,sCode+' - '+FieldByName('Part_Description').AsString+' Effective:'+
          formatdatetime('dd-mmm-yyyy',fieldByName('Date_Effective').AsDateTime)+ ' '+
          fieldByName('Discount_Type').AsString+ ' '+CurrencyDisp(FloatToStr(fieldByName('Discount_Value').AsFloat)));
*)
          tntemp := DiscTreeView.Items.AddChild(tncode,sCode+' - '+FieldByName('Part_Description').AsString+' Effective: '+
            formatdatetime('dd-mmm-yyyy',fieldByName('Date_Effective').AsDateTime));
          ddTemp := TDiscDet.Create(fieldByName('Customer_Discount').AsInteger, fieldByName('Discount_Type').AsString,
            FieldByName('Part_Description').AsString,sCode, icust, FieldByName('Part_Group').AsInteger, fieldByName('Discount_Value').AsFloat, fieldByName('Date_Effective').AsDateTime,
            fieldByName('Date_Ineffective').AsDateTime, True);
          tnTemp.Data := ddtemp;
          Next;
          end;
      end;
  end;
GetDetssql.sql := getgroupsQuery.sql;
With GetDetsSql do
  begin
    Close;
    ParamByName('Customer').AsInteger := icust;
    Open;
    First;
    if EOF then exit;
    while EOF = False do
      begin
      scode := fieldbyname('Part_Group').AsString;
(*        tntemp := DiscTreeView.Items.AddChild(tngroup,fieldbyName('Part_group_Descr_short').AsString+' '+
          formatdatetime('dd-mmm-yyyy',fieldByName('Date_Effective').AsDateTime)+ ' '+
          fieldByName('Discount_Type').AsString+ ' '+CurrencyDisp(FloatToStr(fieldByName('Discount_Value').AsFloat)));
*)
      tntemp := DiscTreeView.Items.AddChild(tngroup,fieldbyName('Part_group_Descr_short').AsString+' Effective: '+
          formatdatetime('dd-mmm-yyyy',fieldByName('Date_Effective').AsDateTime));
      ddTemp := TDiscDet.Create(fieldByName('Customer_Discount').AsInteger, fieldByName('Discount_Type').AsString,
          fieldByName('Part_Group_Descr_short').AsString, sCode, icust, FieldByName('Part_Group').AsInteger, fieldByName('Discount_Value').AsFloat, fieldByName('Date_Effective').AsDateTime,
          fieldByName('Date_Ineffective').AsDateTime, False);
      tntemp.data := ddTemp;
      Next;
      end;

  end;
end;

procedure TCSLUCustDiscFrm.FormActivate(Sender: TObject);
begin
CustLabel.Caption := 'Customer: ' + sCustName;
If bIs_Lookup = True then
   begin
   Caption := 'Lookup a Customer Discount' ;
   SelectBitBtn.Visible := True ;
   end
else
   begin
   Caption := 'Maintain Customer Discounts' ;
   SelectBitBtn.Visible := False ;
   end;
LoadTreeViews(Self);
DiscTreeView.FullExpand;

// DiscTreeViewClick(Self);
end;

procedure TCSLUCustDiscFrm.UpdateTreeView(sTempFuncMode: String);
begin
  if sTempFuncMode = 'D' then
  begin
      DiscTreeView.items.delete(DiscTreeView.selected);
      ddtemp.free;
      DiscTreeView.Refresh;
  end;
  if sTempFuncMode = 'A' then
  begin
    With CSMaintCustDiscFrm do
    begin
      if ddtemp.ByPart then
      begin
(*      tntemp := DiscTreeView.Items.AddChild(tncode,ddtemp.Part+' '+ddTemp.Desc+' '+
        FormatDateTime('dd-mmm-yy',ddTemp.Date_Effec)+ ' '+
        ddTemp.Typ+ ' '+CurrencyDisp(FloatToStr(ddTemp.Disc_Val)));
*)
      tntemp := DiscTreeView.Items.AddChild(tncode,ddtemp.Part+' - '+ddTemp.Desc+' Effective: '+
        FormatDateTime('dd-mmm-yy',ddTemp.Date_Effec));
      tntemp.data := ddtemp;
      DiscTreeView.refresh;
      end
      else
      begin
(*      tntemp := DiscTreeView.Items.AddChild(tngroup,ddTemp.Desc+' '+
        FormatDateTime('dd-mmm-yy',ddTemp.Date_Effec)+ ' '+
        ddTemp.Typ+ ' '+CurrencyDisp(FloatToStr(ddTemp.Disc_Val)));
*)
      tntemp := DiscTreeView.Items.AddChild(tngroup,ddTemp.Desc+' Effective: '+
        FormatDateTime('dd-mmm-yy',ddTemp.Date_Effec));
      tntemp.data := ddtemp;
      DiscTreeView.refresh;
      end;
    end;
  end;
  if sTempFuncMode = 'C' then
  begin
  With CSMaintCustDiscFrm do
  begin
    if CSLUCustDiscFrm.ddTemp.ByPart then
      begin
(*        DiscTreeView.Selected.Text := ddtemp.Part+' '+ddTemp.Desc+' '+
        FormatDateTime('dd-mmm-yy',ddtemp.Date_Effec)+ ' '+
        ddTemp.Typ+ ' '+CurrencyDisp(FloatToStr(ddtemp.Disc_Val));
*)
        DiscTreeView.Selected.Text := ddtemp.Part+' - '+ddTemp.Desc+' Effective: '+
        FormatDateTime('dd-mmm-yy',ddtemp.Date_Effec);
        DiscTreeView.Selected.Data := ddtemp;
        end
    else
      begin
(*      DiscTreeView.Selected.Text := ddTemp.Desc+' '+
        FormatDateTime('dd-mmm-yy',ddtemp.Date_Effec)+ ' '+
        ddTemp.Typ+ ' '+CurrencyDisp(FloatToStr(ddtemp.Disc_Val));
*)
        DiscTreeView.Selected.Text := ddTemp.Desc+' Effective: '+
        FormatDateTime('dd-mmm-yy',ddtemp.Date_Effec);
        DiscTreeView.Selected.Data := ddtemp;
      end;
end;
end;
end;

procedure TCSLUCustDiscFrm.DiscTreeViewClick(Sender: TObject);
begin
  ddTemp := TTreeNode(DiscTreeView.Selected).Data;
  rec_point := ddtemp.Rec;
  addbitbtn.enabled := true;
  if rec_point = 0 then
    exit;
  chgBitbtn.enabled := true;
  delbitbtn.enabled := true;
  end;

{ TDiscDet }

constructor TDiscDet.Create(const Rec: Integer; Typ, Desc, Part: String;
  Cust, Group: Integer; Disc_Val: Real; Date_effec,
  Date_ineffec: TDatetime; ByPart: Bytebool);
begin
DDRec := Rec;
DDTyp := Typ;
DDDesc := Desc;
DDPart := Part;
DDCust := Cust;
DDGroup := Group;
DDDisc_Val := Disc_Val;
DDDate_effec := Date_effec;
DDDate_Ineffec := Date_ineffec;
DDByPart := ByPart;
end;

procedure TDiscDet.setByPart(const Value: ByteBool);
begin
ddByPart := Value;
end;

procedure TDiscDet.setCust(const Value: Integer);
begin
DDCust := Value;
end;

procedure TDiscDet.setDate_effec(const Value: TDateTime);
begin
DDDate_effec := Value;
end;

procedure TDiscDet.setDate_Ineffec(const Value: TDateTime);
begin
DDDate_Ineffec := Value;
end;

procedure TDiscDet.setDesc(const Value: String);
begin
DDDesc := Value;
end;

procedure TDiscDet.setDisc_Val(const Value: Real);
begin
DDDisc_Val := Value;
end;

procedure TDiscDet.setGroup(const Value: Integer);
begin
DDGroup := Value;
end;

procedure TDiscDet.setPart(const Value: String);
begin
DDPart := Value;
end;

procedure TDiscDet.SetRec(const Value: Integer);
begin
DDRec := Value;
end;

procedure TDiscDet.SetTyp(const Value: String);
begin
DDTyp := Value;
end;

procedure TCSLUCustDiscFrm.FormDestroy(Sender: TObject);
begin
tngroup.DeleteChildren;
tncode.DeleteChildren;
tngroup.Free;
tncode.free;
end;


end.
