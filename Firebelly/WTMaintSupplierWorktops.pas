unit WTMaintSupplierWorktops;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, ComCtrls,
  WTSupplierDM, Data.DB;

type
  TfrmWTMaintSupplierWorktops = class(TForm)
    stsbrDetails: TStatusBar;
    Panel1: TPanel;
    btnOK: TBitBtn;
    BitBtn2: TBitBtn;
    pnlDetails: TPanel;
    dbgDetails: TDBGrid;
    Label2: TLabel;
    dblkpMaterialType: TDBLookupComboBox;
    Label3: TLabel;
    dblkpGroup: TDBLookupComboBox;
    btnClearGroup: TSpeedButton;
    chkbxShowInactive: TCheckBox;
    tmrSearch: TTimer;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edtSearch: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkpGroupClick(Sender: TObject);
    procedure dblkpMaterialTypeClick(Sender: TObject);
    procedure btnClearGroupClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure AddSupplierWorktops(tmpWorktop: integer);
    { Private declarations }
  public
    bOK: boolean;
    Supplier: integer;
    dtmdlOneSupplier: TdtmdlSuppliers;
  end;

var
  frmWTMaintSupplierWorktops: TfrmWTMaintSupplierWorktops;

implementation

uses
  wtDataModule, System.UITypes;

{$R *.dfm}

procedure TfrmWTMaintSupplierWorktops.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmWTMaintSupplierWorktops.btnOKClick(Sender: TObject);
var
  icount: integer;
begin
  if (dbgDetails.SelectedRows.Count = 1) then
    begin
      if messagedlg('Confirm the selected worktop is supplied by this supplier?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          AddSupplierWorktops(dbgDetails.datasource.dataset.fieldbyname('Worktop').asinteger);
        end;
    end
  else
    begin
      if messagedlg('Confirm the selected worktops are supplied by this supplier?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          for iCount := 0 to (dbgDetails.SelectedRows.Count - 1) do
            begin
              dbgDetails.DataSource.DataSet.GotoBookmark(TBookmark(dbgDetails.SelectedRows[iCount]));

              AddSupplierWorktops(dbgDetails.datasource.dataset.fieldbyname('Worktop').asinteger);
            end;
        end;
    end;
  bOK := true;
end;

procedure TfrmWTMaintSupplierWorktops.FormActivate(Sender: TObject);
begin
  dblkpMaterialType.ListSource := dtmdlOneSupplier.dtsMaterialType;
  dblkpGroup.ListSource := dtmdlOneSupplier.dtsGetMaterialGroup;
  dbgDetails.datasource := dtmdlOneSupplier.dtsWorktops;

  dtmdlOneSupplier.MaterialType := 0;
  dtmdlOneSupplier.WorktopGroup := 0;
  dtmdlOneSupplier.WorktopDescription := '';

  dtmdlOneSupplier.qryMaterialType.active := false;
  dtmdlOneSupplier.qryMaterialType.active := true;

  dtmdlOneSupplier.qryMaterialType.first;
  dblkpMaterialType.keyvalue := dtmdlOneSupplier.qryMaterialType.fieldbyname('Material_Type').asinteger;
  dtmdlOneSupplier.MaterialType := dtmdlOneSupplier.qryMaterialType.fieldbyname('Material_Type').asinteger;

  dtmdlOneSupplier.qryGetMaterialGroups.active := false;
  dtmdlOneSupplier.qryGetMaterialGroups.active := true;

  dtmdlOneSupplier.RefreshWorktops;

  edtSearch.setFocus;
end;

procedure TfrmWTMaintSupplierWorktops.dblkpGroupClick(
  Sender: TObject);
begin
(*  try
    dtmdlOneSupplier.WorktopGroup := (Sender as TDBLookupComboBox).keyvalue;
  except
    dtmdlOneSupplier.WorktopGroup := 0;
  end;
*)
  dtmdlOneSupplier.WorktopGroup := (Sender as TDBLookupComboBox).keyvalue;
  dtmdlOneSupplier.RefreshWorktops;
end;

procedure TfrmWTMaintSupplierWorktops.dblkpMaterialTypeClick(
  Sender: TObject);
begin
  dtmdlOneSupplier.MaterialType := (Sender as TDBLookupComboBox).keyvalue;
  dtmdlOneSupplier.RefreshWorktops;
end;

procedure TfrmWTMaintSupplierWorktops.btnClearGroupClick(
  Sender: TObject);
begin
  dblkpGroup.KeyValue := 0;
  dtmdlOneSupplier.WorktopGroup := 0;
  dtmdlOneSupplier.RefreshWorktops;

end;

procedure TfrmWTMaintSupplierWorktops.edtSearchChange(
  Sender: TObject);
begin
  dtmdlOneSupplier.WorktopDescription := edtSearch.Text;
  tmrSearch.Enabled := False;
  tmrSearch.Enabled := True;
end;

procedure TfrmWTMaintSupplierWorktops.tmrSearchTimer(Sender: TObject);
begin
  tmrSearch.Enabled := False;
  dtmdlOneSupplier.RefreshWorktops;
end;

procedure TfrmWTMaintSupplierWorktops.BitBtn1Click(Sender: TObject);
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

procedure TfrmWTMaintSupplierWorktops.AddSupplierWorktops(tmpWorktop: integer);
var
  iPricePointer: integer;
  iThickness: integer;
  iCount: integer;
  stext: string;
begin
  with dtmdlOneSupplier.qryGetWTThickness do
    begin
      close;
      parambyname('Worktop').asinteger := tmpWorktop;
      open;

      iCount := 1;
      while EOF <> true do
        begin
          iThickness := dtmdlOneSupplier.qryGetWTThickness.fieldbyname('Thickness').asinteger;

          if iCount = 1 then
            begin
              {Check Supplier/Worktop}
              dtmdlOneSupplier.qryChkSupplierWT.close;
              dtmdlOneSupplier.qryChkSupplierWT.parambyname('Supplier').asinteger := Supplier;
              dtmdlOneSupplier.qryChkSupplierWT.parambyname('Worktop').asinteger := tmpWorktop;
              dtmdlOneSupplier.qryChkSupplierWT.open;

              if dtmdlOneSupplier.qryChkSupplierWT.recordcount = 0 then
                begin
                  {Add Supplier/Worktop record}
                  dtmdlOneSupplier.qryAddSupplierWT.close;
                  dtmdlOneSupplier.qryAddSupplierWT.parambyname('Supplier').asinteger := Supplier;
                  dtmdlOneSupplier.qryAddSupplierWT.parambyname('Worktop').asinteger := tmpWorktop;
                  dtmdlOneSupplier.qryAddSupplierWT.execsql;
                end;
            end;

          {Check for Supplier/Worktop/Thickness}
          dtmdlOneSupplier.qryChkSupplierWTThickness.close;
          if dtmdlWorktops.IsSQL then
            begin
              sText := stringreplace(dtmdlOneSupplier.qryChkSupplierWTThickness.SQL.Text, 'now()', 'getdate()', [rfReplaceAll]);
              dtmdlOneSupplier.qryChkSupplierWTThickness.SQL.Text := sText;
            end;

          dtmdlOneSupplier.qryChkSupplierWTThickness.parambyname('Supplier').asinteger := Supplier;
          dtmdlOneSupplier.qryChkSupplierWTThickness.parambyname('Worktop').asinteger := tmpWorktop;
          dtmdlOneSupplier.qryChkSupplierWTThickness.parambyname('Thickness').asinteger := iThickness;
          dtmdlOneSupplier.qryChkSupplierWTThickness.open;

          if dtmdlOneSupplier.qryChkSupplierWTThickness.recordcount = 0 then
            begin
              {Get Price Pointer}
              dtmdlWorktops.qryNewPrice.Close;
              dtmdlWorktops.qryNewPrice.Open;
              iPricePointer := dtmdlWorktops.qryNewPrice.fields[0].asinteger+1;

	            dtmdlWorktops.qryAddPointer.Close;
              dtmdlWorktops.qryAddPointer.PArambyname('Pointer').asinteger := iPricePointer;
              dtmdlWorktops.qryAddPointer.PArambyname('Type').asstring := 'M';
	            dtmdlWorktops.qryAddPointer.ExecSQl;

              {Add Supplier/Worktop/Thickness record}
              dtmdlOneSupplier.qryAddSupplierWTThickness.close;
              dtmdlOneSupplier.qryAddSupplierWTThickness.parambyname('Supplier').asinteger := Supplier;
              dtmdlOneSupplier.qryAddSupplierWTThickness.parambyname('Worktop').asinteger := tmpWorktop;
              dtmdlOneSupplier.qryAddSupplierWTThickness.parambyname('Thickness').asinteger := iThickness;
              dtmdlOneSupplier.qryAddSupplierWTThickness.parambyname('Price_Pointer').asinteger := iPricePointer;
              dtmdlOneSupplier.qryAddSupplierWTThickness.execsql;
            end;

          iCount := iCount + 1;
          next;
        end;
    end;
end;

procedure TfrmWTMaintSupplierWorktops.FormCreate(Sender: TObject);
begin
  bOK := false;
end;

end.
