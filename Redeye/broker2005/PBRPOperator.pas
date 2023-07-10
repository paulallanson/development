unit PBRPOperator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Db, DBTables, Qrctrls, Buttons, ComCtrls, CCSPrint,
  Menus;

type
  TPBRPOperatorFrm = class(TForm)
    qrOperator: TQuickRep;
    qrbndTitle: TQRBand;
    qrstrbndDetail: TQRStringsBand;
    qrlblButtonName: TQRLabel;
    qryOpBtns: TQuery;
    qrlblAccess: TQRLabel;
    qrlblCat: TQRLabel;
    qrlblTitle: TQRLabel;
    qrlblOpName: TQRLabel;
    qrySelOperator: TQuery;
    qrlblLoginName: TQRLabel;
    qrlblRep: TQRLabel;
    qrlblDocDirectory: TQRLabel;
    qryCompany: TQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure qrstrbndDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    saList: array of array of string;
    lineInx: integer;
    lastCat: string;
    operator: integer;
    firstGroup: boolean;
    function GetButtonAccess(btnName: string): string;
    procedure BuildButtonList;
    procedure GetOperatorDetails;
  public
    { Public declarations }
    procedure Report(Operator: integer; preview: boolean);
  end;

var
  PBRPOperatorFrm: TPBRPOperatorFrm;

implementation

uses PBMainMenu;

{$R *.DFM}

{ TPBRPOperatorFrm }

procedure TPBRPOperatorFrm.Report(Operator: integer; preview: boolean);
begin
  self.operator := operator;
  BuildButtonList;
  GetOperatorDetails;
  firstGroup := true;

  if preview then
    self.qrOperator.Preview
  else
  begin
    if CCSPrint.SetUpPrinter(self.qrOperator.PrinterSettings) then
      self.qrOperator.Print;
  end;
end;

procedure TPBRPOperatorFrm.qrstrbndDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inc(lineInx);

  if (saList[lineInx, 2] <> lastCat) then
  begin
    qrlblCat.Caption := saList[lineInx, 2] + ':';
    lastCat := saList[lineInx, 2];
    if (not firstGroup) then
    begin
      qrlblCat.top        := 40;
      qrlblButtonName.top := 40;
      qrlblAccess.top     := 40;
      qrstrbndDetail.Height := 64;
    end;
    firstGroup := false;
  end
  else
  begin
    qrlblCat.Caption := '';
    qrlblCat.top        := 0;
    qrlblButtonName.top := 0;
    qrlblAccess.top     := 0;
    qrstrbndDetail.Height := 24;
  end;
  
  qrlblButtonName.Caption := saList[lineInx, 1];

  if saList[lineInx, 3] = 'B' then
    qrlblAccess.Caption := 'Block'
  else if saList[lineInx, 3] = 'F' then
    qrlblAccess.Caption := 'Full'
  else if saList[lineInx, 3] = 'N' then
    qrlblAccess.Caption := 'Notes'
  else if saList[lineInx, 3] = 'E' then
    qrlblAccess.Caption := 'Enquiries'
  else if saList[lineInx, 3] = 'O' then
    qrlblAccess.Caption := 'Operator'
  else if saList[lineInx, 3] = 'R' then
    qrlblAccess.Caption := 'Rep'
  else
    qrlblAccess.Caption := 'Various';
end;

function TPBRPOperatorFrm.GetButtonAccess(btnName: string): string;
begin
  if qryOpBtns.Locate('Button_Name', btnName, [loCaseInsensitive]) then
    Result := qryOpBtns.FieldByName('Button_Status').asString
  else
    Result := 'B';
end;

procedure TPBRPOperatorFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryOpBtns.Close;
  qryCompany.close;
end;

procedure TPBRPOperatorFrm.BuildButtonList;
var
  icount, iListCount, btnCount: Integer;
  sCatName, sBtnName, sBtnDescr: string;
  iTempComp, iTempComp1: TComponent;
begin
  btnCount := 0;
  lastCat := '';

  qryOpBtns.ParamByName('operator').asInteger := Operator;
  qryOpBtns.Open;

  //Get the names of all facillities from the menu;
  btnCount := btnCount + frmpbMainMenu.miModules.Count;
  btnCount := btnCount + frmpbMainMenu.miSettings.Count;
  btnCount := btnCount + frmpbMainMenu.miStock.Count;
  btnCount := btnCount + frmpbMainMenu.miManufacturing.Count;
  btnCount := btnCount + frmpbMainMenu.miTools.Count;

  setLength(saList, btnCount, 4);


  with frmpbMainMenu.miModules do
  begin
    iListCount := 0;
    for icount := 0 to count - 1 do
    begin
      if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
      begin
        sCatName := 'Modules';
        sBtnName := items[icount].Name;
        sBtnDescr := items[icount].hint;
        if sCatName = '' then
          Continue;
        iListCount := iListCount + 1;
        qrstrbndDetail.Items.add(sBtnDescr);
        saList[iListCount, 0] := sBtnName;
        saList[iListCount, 1] := sBtnDescr;
        saList[iListCount, 2] := sCatName;
        saList[iListCount, 3] := self.GetButtonAccess(sBtnName);
      end;
    end;
  end;

  with frmpbMainMenu.miSettings do
  begin
//    iListCount := 0;
    for icount := 0 to count - 1 do
    begin
      if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
      begin
        sCatName := 'System Settings';
        sBtnName := items[icount].Name;
        sBtnDescr := items[icount].hint;
        if sCatName = '' then
          Continue;
        iListCount := iListCount + 1;  
        qrstrbndDetail.Items.add(sBtnDescr);
        saList[iListCount, 0] := sBtnName;
        saList[iListCount, 1] := sBtnDescr;
        saList[iListCount, 2] := sCatName;
        saList[iListCount, 3] := self.GetButtonAccess(sBtnName);
      end;
    end;
  end;

  if frmpbMainMenu.miStock.visible then
  with frmpbMainMenu.miStock do
  begin
//      iListCount := 0;
    for icount := 0 to count - 1 do
    begin
      if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
      begin
        sCatName := 'Stock Settings';
        sBtnName := items[icount].Name;
        sBtnDescr := items[icount].hint;
        if sCatName = '' then
          Continue;
        iListCount := iListCount + 1;  
        qrstrbndDetail.Items.add(sBtnDescr);
        saList[iListCount, 0] := sBtnName;
        saList[iListCount, 1] := sBtnDescr;
        saList[iListCount, 2] := sCatName;
        saList[iListCount, 3] := self.GetButtonAccess(sBtnName);
      end;
    end;
  end;

  if frmpbMainMenu.miManufacturing.visible then
    with frmpbMainMenu.miManufacturing do
    begin
//      iListCount := 0;
      for icount := 0 to count - 1 do
      begin
        if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
        begin
          sCatName := 'Manufacturing';
          sBtnName := items[icount].Name;
          sBtnDescr := items[icount].hint;
          if sCatName = '' then
            Continue;
          iListCount := iListCount + 1;   
          qrstrbndDetail.Items.add(sBtnDescr);
          saList[iListCount, 0] := sBtnName;
          saList[iListCount, 1] := sBtnDescr;
          saList[iListCount, 2] := sCatName;
          saList[iListCount, 3] := self.GetButtonAccess(sBtnName);
        end;
      end;
    end;

  with frmpbMainMenu.miTools do
  begin
//    iListCount := 0;
    for icount := 0 to count - 1 do
    begin
      if (items[icount].Visible) and (copy(items[icount].name,1,3) = 'mnu') then
      begin
        sCatName := 'Tools';
        sBtnName := items[icount].Name;
        sBtnDescr := items[icount].hint;
        if sCatName = '' then
          Continue;
        iListCount := iListCount + 1;      
        qrstrbndDetail.Items.add(sBtnDescr);
        saList[iListCount, 0] := sBtnName;
        saList[iListCount, 1] := sBtnDescr;
        saList[iListCount, 2] := sCatName;
        saList[iListCount, 3] := self.GetButtonAccess(sBtnName);
      end;
    end;
  end;
end;

procedure TPBRPOperatorFrm.GetOperatorDetails;
begin
  qrySelOperator.ParamByName('operator').asInteger := self.operator;
  qrySelOperator.open;
  qryCompany.open;

  qrlblOpName.Caption := qrlblOpName.Caption +
    qrySelOperator.FieldByName('name').asString;

  qrlblLoginName.Caption := qrlblLoginName.Caption +
    qrySelOperator.FieldByName('login_name').asString;

  if qrySelOperator.FieldByName('rep_name').asString <> ''
  then
    qrlblRep.Caption := qrlblRep.Caption + qrySelOperator.FieldByName('rep_name').asString
  else
    qrlblRep.Caption := qrlblRep.Caption + 'No Rep Assigned';

  qrlblDocDirectory.Caption := qrlblDocDirectory.caption +
    qryCompany.fieldByName('Document_Directory').asString + '\' +
    qrySelOperator.FieldByName('Document_Directory').asString;
end;

end.
