(*******************************************************************************

Copyright (c) Centrereed Ltd 1999

Comments
--------
  Maintain Fax Details

VSS Info:
$Header: /PBL D5/PBFaxSt.pas 3     2/05/:1 12:51 Paul $
$History: PBFaxSt.pas $
 * 
 * *****************  Version 3  *****************
 * User: Paul         Date: 2/05/:1    Time: 12:51
 * Updated in $/PBL D5
 * Changed to convert the property of the Purchase Order to float rather
 * than integer, this then allows the creation of Call Off Orders
 * 
 * *****************  Version 2  *****************
 * User: Paul         Date: 19/03/:1   Time: 10:54
 * Updated in $/PBL D5
 * Increased number of days fax history from 2 to 10
 * 
 * *****************  Version 1  *****************
 * User: Roddym       Date: 7/12/99    Time: 9:41
 * Created in $/PBL D5
 * First check-in after conversion from Delphi 2 to 5.  Sources
 * reformatted and try..finally blocks added round form creation/free.
 * Boolean comparisons standardised.  Version updated to 1.6a.
*******************************************************************************)
unit AllFaxStatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DB, StdCtrls, Buttons, ExtCtrls, QrCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, 
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, 
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, 
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmAllFaxStatus = class(TForm)
    GetFaxesQuery: TFDQuery;
    GetFaxesDataSource: TDataSource;
    GetFaxQuery: TFDQuery;
    UpdFaxQuery: TFDQuery;
    Label4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    CancelFaxBitBtn: TBitBtn;
    ReQueFaxBitBtn: TBitBtn;
    ReFreshBitBtn: TBitBtn;
    Panel4: TPanel;
    ShowFaxesDBGrid: TDBGrid;
    FaxDatabase: TFDConnection;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure ShowFaxesDBGridColEnter(Sender: TObject);
    procedure ReadFaxes(Sender: TObject);
    procedure CancelFaxBitBtnClick(Sender: TObject);
    procedure DisableButtons(Sender: TObject);
    procedure ReQueFaxBitBtnClick(Sender: TObject);
    procedure ReFreshBitBtnClick(Sender: TObject);
    function GetFaxStatus(TempFax: string): string;
    procedure BitBtn1Click(Sender: TObject);
    procedure FaxDatabaseLogin(Database: TFDConnection; LoginParams: TStrings);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bViewOnly: ByteBool;
  end;

var
  frmAllFaxStatus: TfrmAllFaxStatus;

implementation

{$R *.DFM}

procedure TfrmAllFaxStatus.FormActivate(Sender: TObject);
begin
  {First re-read the faxes};
  ReadFaxes(Self);
  DisableButtons(Self);
  {Then format the data grid};
  ShowFaxesDBGrid.Fields[0].Displaywidth := 20;
  ShowFaxesDBGrid.Fields[1].Displaywidth := 30;
  ShowFaxesDBGrid.Fields[2].Displaywidth := 12;
  ShowFaxesDBGrid.Fields[3].Displaywidth := 2;
  ShowFaxesDBGrid.Fields[4].Displaywidth := 10;
  ShowFaxesDBGrid.Fields[5].Displaywidth := 20;
  ShowFaxesDBGrid.Fields[6].Displaywidth := 20;
  ShowFaxesDBGrid.Fields[0].DisplayLabel := 'Created';
  ShowFaxesDBGrid.Fields[1].DisplayLabel := 'Description';
  ShowFaxesDBGrid.Fields[2].DisplayLabel := 'Status';
  ShowFaxesDBGrid.Fields[3].DisplayLabel := 'RT';
  ShowFaxesDBGrid.Fields[4].DisplayLabel := 'User';
  ShowFaxesDBGrid.Fields[5].DisplayLabel := 'Phone No.';
  ShowFaxesDBGrid.Fields[6].DisplayLabel := 'Last Try';
  CancelFaxBitBtn.Visible := (not (bViewOnly));
  ReQueFaxBitBtn.Visible := (not (bViewOnly));
end;

procedure TfrmAllFaxStatus.ShowFaxesDBGridColEnter(Sender: TObject);
var
  Status: string[1];
begin
  {User has selected a fax};
  Status := GetFaxStatus(ShowFaxesDBGrid.Fields[ShowFaxesDBGrid.SelectedIndex +
    7].AsString);
  if Status = '' then Exit;
  DisableButtons(Self);
  {Check the status};
  if (Status = 'C') or (Status = 'F') then
  begin
    ReQueFaxBitBtn.Enabled := True;
  end;
  if (Status = 'N') or (Status = 'R') then
  begin
    CancelFaxBitBtn.Enabled := True;
  end;
end;

procedure TfrmAllFaxStatus.ReadFaxes(Sender: TObject);
begin
  {Re-read the fax que};
  with GetFaxesQuery do
  begin
    Close;
    ParamByName('Start_Date').AsDateTime := Date - 10;
    Open;
  end;
  GetFaxStatus('');
end;

procedure TfrmAllFaxStatus.CancelFaxBitBtnClick(Sender: TObject);
begin
  with UpdFaxQuery do
  begin
    Close;
    ParamByName('FileName').AsString :=
      GetFaxQuery.FieldByName('FileName').AsString;
    ParamByName('Status').AsString := 'C';
    ParamByName('NoOfRetries').AsInteger := 99;
    ExecSQL;
  end;
  DisableButtons(Self);
  FormActivate(Self);
end;

procedure TfrmAllFaxStatus.DisableButtons(Sender: TObject);
begin
  CancelFaxBitBtn.Enabled := False;
  ReQueFaxBitBtn.Enabled := False;
end;

procedure TfrmAllFaxStatus.ReQueFaxBitBtnClick(Sender: TObject);
begin
  with UpdFaxQuery do
  begin
    Close;
    ParamByName('FileName').AsString :=
      GetFaxQuery.FieldByName('FileName').AsString;
    ParamByName('Status').AsString := 'N';
    ParamByName('NoOfRetries').AsInteger := 0;
    ExecSQL;
  end;
  DisableButtons(Self);
  FormActivate(Self);
end;

procedure TfrmAllFaxStatus.ReFreshBitBtnClick(Sender: TObject);
begin
  FormActivate(Self);
end;

function TfrmAllFaxStatus.GetFaxStatus(TempFax: string): string;
begin
  with GetFaxQuery do
  begin
    Close;
    ParamByName('FileName').AsString := TempFax;
    Open;
    if RecordCount <> 1 then
    begin
      Result := '';
      Exit;
    end;
    First;
    Result := GetFaxQuery.FieldByName('Status').AsString;
  end;
end;

procedure TfrmAllFaxStatus.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmAllFaxStatus.FaxDatabaseLogin(Database: TFDConnection;
  LoginParams: TStrings);
begin
  {Get user and password from login screen};
  LoginParams.Values['USER NAME'] := 'faxes';
  LoginParams.Values['PASSWORD'] := 'rabbit';
end;

procedure TfrmAllFaxStatus.Timer1Timer(Sender: TObject);
begin
  FormActivate(self);
end;

end.
