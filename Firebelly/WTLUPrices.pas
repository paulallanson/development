unit WTLUPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, ComCtrls, StdCtrls, ToolWin, Grids, Db, DBGrids,
  Buttons, WTPricesDM, AllCommon, IniFiles, System.ImageList;

type
  TfrmWTLUPrices = class(TForm)
    stsBrDetails: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    edtMaterial: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    dbgDetails: TDBGrid;
    CoolBar2: TCoolBar;
    Panel3: TPanel;
    Label2: TLabel;
    lblCurrentPrices: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnChange: TToolButton;
    btnDelete: TToolButton;
    imgLstHot: TImageList;
    tmrSearch: TTimer;
    Label3: TLabel;
    edtColour: TEdit;
    Label5: TLabel;
    edtThickness: TEdit;
    Label6: TLabel;
    edtGroup: TEdit;
    Label4: TLabel;
    cmbPriceTypeFilter: TComboBox;
    btnClear: TBitBtn;
    Label7: TLabel;
    edtEffectiveDate: TEdit;
    btnEffectiveDate: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnRefresh: TToolButton;
    chkbxShowWebPrices: TCheckBox;
    chkbxShowInactive: TCheckBox;
    ToolButton1: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtMaterialChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure edtColourChange(Sender: TObject);
    procedure edtThicknessChange(Sender: TObject);
    procedure edtGroupChange(Sender: TObject);
    procedure chkbxShowCurrentPricesClick(Sender: TObject);
    procedure cmbPriceTypeFilterChange(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dbgDetailsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnEffectiveDateClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure edtEffectiveDateKeyPress(Sender: TObject; var Key: Char);
    procedure edtEffectiveDateExit(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure chkbxShowWebPricesClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure chkbxShowInactiveClick(Sender: TObject);
    procedure dbgDetailsDblClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    ActiveCode: integer;
    FDisableNameChangeEvent: boolean;
    procedure SetButtons(Sender: TObject; Field: TField);
    procedure SetDisableNameChangeEvent(const Value: boolean);
    function InputDate(TempDate: TDateTime): TDateTime;
    procedure DeletePriceRecord(iPointer: integer; dtEffective: TDateTime);
    procedure CallMaintScreen(FuncMode: string);
    { Private declarations }
  public
    { Public declarations }
  protected
    property DisableNameChangeEvent: boolean read FDisableNameChangeEvent write SetDisableNameChangeEvent;
  end;

var
  frmWTLUPrices: TfrmWTLUPrices;
  dtmdlAllPrices: TdtmdlPrices;

implementation

uses wtMain, DateSelV5, wtMaintWT, wtLUWTThickness;

{$R *.dfm}

procedure TfrmWTLUPrices.SetDisableNameChangeEvent(const Value: boolean);
begin
  FDisableNameChangeEvent := Value;
end;

procedure TfrmWTLUPrices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AllCommon.SaveDBGridCols('', 'PricesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
  Action := caFree;
end;

procedure TfrmWTLUPrices.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTLUPrices.FormCreate(Sender: TObject);
begin
  dtmdlAllPrices := TdtmdlPrices.create(Application);
  dtmdlAllPrices.dtsAllPrices.OnDataChange := SetButtons;
  dbgDetails.DataSource := dtmdlAllPrices.dtsAllPrices;

  AllCommon.SetDBGridCols('', 'PricesLU Col Order', TfrmWTMain.AppIniFile, self.dbgDetails);
end;

procedure TfrmWTLUPrices.FormDestroy(Sender: TObject);
begin
  dtmdlAllPrices.free;
end;

procedure TfrmWTLUPrices.edtMaterialChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllPrices.Material := edtMaterial.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlAllPrices.PriceType := cmbPriceTypeFilter.itemindex;
  dtmdlAllPrices.refreshWorktopData;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUPrices.FormShow(Sender: TObject);
begin
  edtMaterial.setfocus;
end;

procedure  TfrmWTLUPrices.SetButtons(Sender: TObject; Field: TField);
begin
  with dtmdlAllPrices do
  begin
    btnChange.Enabled := HeaderCountAll > 0;
    btnDelete.Enabled := HeaderCountAll > 0;

    lblCurrentPrices.Visible := ShowLive;
    stsBrDetails.panels[0].text := inttostr(HeaderCountAll) + ' records displayed';
  end;
end;

procedure TfrmWTLUPrices.FormActivate(Sender: TObject);
begin
  dtmdlAllPrices.PriceType := cmbPriceTypeFilter.itemindex;
  dtmdlAllPrices.RefreshWorktopData;
  dbgDetails.datasource.DataSet.locate('Worktop', Variant(inttostr(ActiveCode)),[lopartialKey]) ;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUPrices.FormDeactivate(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Worktop').asinteger;
  except
    Activecode := 0
  end;

end;

procedure TfrmWTLUPrices.edtColourChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllPrices.Colour := edtColour.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.edtThicknessChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllPrices.Thickness := edtThickness.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.edtGroupChange(Sender: TObject);
begin
  if DisableNameChangeEvent then Exit;
  dtmdlAllPrices.Group := edtGroup.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.chkbxShowCurrentPricesClick(Sender: TObject);
begin
  dtmdlAllPrices.PriceType := cmbPriceTypeFilter.itemindex;
  dtmdlAllPrices.refreshWorktopData;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUPrices.cmbPriceTypeFilterChange(Sender: TObject);
begin
  dtmdlAllPrices.PriceType := (Sender as TComboBox).itemindex;
  dtmdlAllPrices.refreshWorktopData;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUPrices.btnClearClick(Sender: TObject);
begin
  edtColour.Clear;
  edtGroup.clear;
  edtMaterial.Clear;
  edtThickness.clear;
  edtEffectiveDate.Clear;
  dtmdlAllPrices.EffectiveDate := 0;
end;

procedure TfrmWTLUPrices.dbgDetailsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Txt: array [0..255] of Char;
begin
  if(gdFocused in State) or (gdSelected in State) then
    begin
      (Sender as TDBGrid).Canvas.Font.Style := (Sender as TDBGrid).Canvas.Font.Style + [fsBold];
      (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    end;

  if(dbgDetails.datasource.dataset.fieldByName('inActive').AsString = 'Y') then
    begin
      (Sender as TDBGrid).Canvas.font.style := [fsStrikeout];
    end;

  if  (Column.Title.Caption <> 'Unit Price') and (Column.Title.Caption <> 'Unit Cost') then
  	begin
      StrPCopy(txt, Column.field.text);
      SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_RIGHT OR TA_CENTER) or TA_LEFT);
      ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Left + 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
    end
  else
  	begin
  		StrPCopy(Txt, Column.field.text);
  		SetTextAlign((Sender as TDBGrid).Canvas.Handle,
    			GetTextAlign((Sender as TDBGrid).Canvas.Handle)
      			and not(TA_LEFT OR TA_CENTER) or TA_RIGHT);
  		ExtTextOut((Sender as TDBGrid).Canvas.Handle, Rect.Right - 2, Rect.Top + 2,
    			ETO_CLIPPED or ETO_OPAQUE, @Rect, Txt, StrLen(Txt), nil);
     end;

end;

procedure TfrmWTLUPrices.btnEffectiveDateClick(Sender: TObject);
var
  tempDate: string;
begin
  if trim(edtEffectiveDate.Text) = '' then
    tempdate := padateStr(date)
  else
    tempdate := edtEffectiveDate.text;

  edtEffectiveDate.text := paDatestr(InputDate(paDateStr(tempdate)));

  dtmdlAllPrices.EffectiveDate := paDateStr(edtEffectiveDate.text);
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

function TfrmWTLUPrices.InputDate(TempDate: TDateTime): TDateTime;
var
  DateSelV5Form: TDateSelV5Form;
begin
  Result := TempDate;
  DateSelV5Form := TDateSelV5Form.Create(Self);
  try
    try
      DateSelV5Form.Date := TempDate;
    except
      DateSelV5Form.Date := Date;
    end;
    if DateSelV5Form.ShowModal = mrOK then
      Result := DateSelV5Form.Date;
  finally
    DateSelV5Form.Free;
  end;
end;

procedure TfrmWTLUPrices.BitBtn1Click(Sender: TObject);
begin
  edtEffectiveDate.Clear;
  dtmdlAllPrices.EffectiveDate := 0;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.btnDeleteClick(Sender: TObject);
var
  icount: integer;
begin
  if (dbgDetails.SelectedRows.Count = 1) then
    begin
      if messagedlg('Delete the current prices for the selected record?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          try
            DeletePriceRecord(dbgDetails.datasource.dataset.fieldbyname('Price_Pointer').asinteger,
                          dbgDetails.datasource.dataset.fieldbyname('Effective_Date').asdatetime);
            dtmdlAllPrices.RefreshWorktopData;

            dbgDetails.datasource.DataSet.locate('Worktop', Variant(inttostr(ActiveCode)),[lopartialKey]) ;

            with dbgDetails do
              begin
                try
                  if datasource.dataset.recordcount > 0 then
                    SelectedRows.CurrentRowSelected := true ;
                except
                end;
              end;
          except
            messagedlg(dbgDetails.datasource.dataset.fieldbyname('Thickness_mm').asstring + ' ' +
                   dbgDetails.datasource.dataset.fieldbyname('Worktop_Description').asstring
                    + ' has related data, therefore cannot be deleted', mtInformation, [mbOk], 0);
          end;
        end;
    end
  else
    begin
      if messagedlg('Delete the current prices for the selected records?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
            begin
              dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));
              DeletePriceRecord(dbgDetails.datasource.dataset.fieldbyname('Price_Pointer').asinteger,
                          dbgDetails.datasource.dataset.fieldbyname('Effective_Date').asdatetime);
            end;

          dtmdlAllPrices.RefreshWorktopData;

          with dbgDetails do
            begin
              try
                if datasource.dataset.recordcount > 0 then
                  SelectedRows.CurrentRowSelected := true ;
              except
              end;
            end;
        end;
    end;

end;

procedure TfrmWTLUPrices.DeletePriceRecord(iPointer: integer; dtEffective: TDateTime);
begin
  with dtmdlAllPrices.qryDeletePrices do
    begin
      close;
      parambyname('Price_Pointer').asinteger := iPointer;
      parambyname('Effective_Date').asdatetime := dtEffective;
      execsql;
    end;
end;

procedure TfrmWTLUPrices.BitBtn2Click(Sender: TObject);
begin
  with dbgDetails.DataSource.dataset do
    begin
      first ;
      while EOF <> true do
        begin
          dbgDetails.SelectedRows.CurrentRowSelected := true ;
          next ;
        end;
     end;
end;

procedure TfrmWTLUPrices.edtEffectiveDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then { if it's an enter key }
    begin
      btnEffectiveDate.setfocus;
    end;
end;

procedure TfrmWTLUPrices.edtEffectiveDateExit(Sender: TObject);
var
  NewDate: TDateTime;
begin
  if trim((Sender as TEdit).text) = '' then
    exit;
  try
    NewDate := StrToDate((Sender as TEdit).Text);
  except
    begin
      MessageDlg('Invalid Date', mtError, [mbOk], 0);
      (Sender as TEdit).SetFocus;
      Exit;
    end;
  end;
  (Sender as TEdit).Text := paDatestr(NewDate);

  dtmdlAllPrices.EffectiveDate := paDateStr((Sender as TEdit).Text);
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.btnRefreshClick(Sender: TObject);
begin
  try
    Activecode := dbgDetails.datasource.DataSet.FieldByName('Worktop').asinteger;
  except
    Activecode := 0
  end;

  dtmdlAllPrices.refreshWorktopData;
  dbgDetails.datasource.DataSet.locate('Worktop', Variant(floattostr(ActiveCode)),[lopartialKey]) ;

  with dbgDetails do
    begin
      try
        if datasource.dataset.recordcount > 0 then
          SelectedRows.CurrentRowSelected := true ;
      except
      end;
    end;
end;

procedure TfrmWTLUPrices.chkbxShowWebPricesClick(Sender: TObject);
begin
  dtmdlAllPrices.ShowOnlyWebPrices := (Sender as TCheckBox).checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.btnAddClick(Sender: TObject);
begin
  CallMaintScreen('A');
end;

procedure TfrmWTLUPrices.CallMaintScreen(FuncMode: string);
var
  OldCursor : TCursor;
  iCode: integer;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  frmWTMaintWT := TfrmWTMaintWT.create(Application);
  try
    if FuncMode <> 'A' then
      iCode := dbgDetails.datasource.dataset.fieldbyname('Worktop').asinteger
    else
      iCode := 0;
    frmWTMaintWT.FunctionMode := FuncMode;
    frmWTMaintWT.Worktop := iCode;
    frmWTMaintWT.showmodal;
    iCode := frmWTMaintWT.iCode;
    dtmdlAllPrices.refreshWorktopData;
    dbgDetails.DataSource.DataSet.Locate('Worktop',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTMaintWT.free;
  end;

end;

procedure TfrmWTLUPrices.btnChangeClick(Sender: TObject);
begin
  CallMaintScreen('C');
end;

procedure TfrmWTLUPrices.chkbxShowInactiveClick(Sender: TObject);
begin
  dtmdlAllPrices.ShowinactiveWorktops := (Sender as TCheckBox).checked;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTLUPrices.dbgDetailsDblClick(Sender: TObject);
begin
  btnChangeClick(self);
end;

procedure TfrmWTLUPrices.ToolButton1Click(Sender: TObject);
var
  iCode: integer;
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    iCode := dbgDetails.datasource.dataset.fieldbyname('Worktop').asinteger;
    frmWTLUWTThickness := TfrmWTLUWTThickness.create(Application);
    frmWTLUWTThickness.worktop := dbgDetails.datasource.dataset.fieldbyname('Worktop').asinteger;
    frmWTLUWTThickness.showmodal;
    dtmdlAllPrices.refreshWorktopData;
    dbgDetails.DataSource.DataSet.Locate('Worktop',Variant(inttostr(iCode)),[]);
  finally
    Screen.Cursor := OldCursor;
    frmWTLUWTThickness.free;
  end;
end;

end.
