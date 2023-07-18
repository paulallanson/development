unit PBQuestnCats;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, Db, DBTables, StdCtrls, DBCtrls, Buttons;

type
  TPBQuestnCatsFrm = class(TForm)
    QuestnDBGrid: TDBGrid;
    GetQuestnsSQL: TQuery;
    QuestnsDS: TDataSource;
    Label1: TLabel;
    dblkpProductType: TDBLookupComboBox;
    Label2: TLabel;
    GetCatsSQL: TQuery;
    CatsDS: TDataSource;
    CloseBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    AddMemo: TMemo;
    GetCatsProdTypesSQL: TQuery;
    GetLastNoSQL: TQuery;
    AddSQL: TQuery;
    AddQListSQL: TQuery;
    qryProdType: TQuery;
    dtsProdType: TDataSource;
    qryGetProductType: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure dblkpProductTypeClick(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure QuestnDBGridCellClick(Column: TColumn);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBQuestnCatsFrm: TPBQuestnCatsFrm;

implementation

uses PBDatabase, pbMainMenu;

{$R *.DFM}

procedure TPBQuestnCatsFrm.FormActivate(Sender: TObject);
begin
With GetQuestnsSQL do
        begin
        Close ;
        Open ;
        end;
With qryProdType do
        begin
        Close ;
        Open ;
        end;
CheckOK(self) ;
  dmBroker.ScreenAccessControl(Self,'mnuProductTypeUtils',frmpbMainMenu.iOperator,0,0) ;
end;

procedure TPBQuestnCatsFrm.dblkpProductTypeClick(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TPBQuestnCatsFrm.CheckOK(Sender: TObject);
begin
If (dblkpProductType.KeyValue <> 0) and
        (QuestnDBGrid.SelectedRows.Count > 0) then
        begin
        OKBitBtn.Enabled := True ;
        AddMemo.Visible := True ;
        end
else
        begin
        OKBitBtn.Enabled := False ;
        AddMemo.Visible := False ;
        end;
end;

procedure TPBQuestnCatsFrm.QuestnDBGridCellClick(Column: TColumn);
begin
CheckOK(self) ;
end;

procedure TPBQuestnCatsFrm.OKBitBtnClick(Sender: TObject);
Var
iTempCount, iTempCount2: Integer;
begin
{Actually add the questions} ;
With qryGetProductType do
        begin
        {Get all the product types in the category} ;
        Close ;
        ParamByName('Product_Type').AsInteger := dblkpProductType.KeyValue ;
        Open ;
        First ;
        While not EOF do
                begin
                For iTempCount := 0 to (QuestnDBGrid.SelectedRows.Count - 1) do
                        begin
                        {Loop through the selected questions} ;
                        QuestnsDS.DataSet.GotoBookmark(TBookmark(QuestnDBGrid.SelectedRows[iTempCount])) ;
                        With GetLastNoSQL do
                                begin
                                Close ;
                                ParamByName('Product_Type').AsInteger := qryGetProductType.FieldByName('Product_Type').AsInteger ;
                                Open ;
                                First ;
                                iTempCount2 := FieldByName('Last_No').AsInteger + 1 ;
                                end;
                        With AddSQL do
                                begin
                                Close ;
                                ParamByName('Product_Type').AsInteger := qryGetProductType.FieldByName('Product_Type').AsInteger ;
                                ParamByName('Question').AsInteger := iTempCount2 ;
                                ParamByName('Question_Text').AsString := QuestnsDS.DataSet.FieldByName('Question_Text').AsString ;
                                ParamByName('Sequence_Reference').AsString := QuestnsDS.DataSet.FieldByName('Sequence_Reference').AsString ;
                                If QuestnsDS.DataSet.FieldByName('Prompt_Type').AsString <> '' then
                                        ParamByName('Prompt_Type').AsString := QuestnsDS.DataSet.FieldByName('Prompt_Type').AsString
                                else
                                        ParamByName('Prompt_Type').Clear ;
                                If QuestnsDS.DataSet.FieldByName('Question_Category').AsInteger <> 0 then
                                        ParamByName('Question_Category').AsInteger := QuestnsDS.DataSet.FieldByName('Question_Category').AsInteger
                                else
                                        ParamByName('Question_Category').Clear ;
                                ExecSQL ;
                                end;
                        With AddQListSQL do
                                begin
                                {Add in the Question List} ;
                                Close ;
                                ParamByName('Product_Type').AsInteger := qryGetProductType.FieldByName('Product_Type').AsInteger ;
                                ParamByName('Question').AsInteger := QuestnsDS.DataSet.FieldByName('Question').AsInteger ;
                                ParamByName('PT_Question').AsInteger := iTempCount2 ;
                                ExecSQL ;
                                end;
                        end;
                Next ;
                end;
        end;
dblkpProductType.KeyValue := 0 ;
CheckOK(self) ;
end;

end.
