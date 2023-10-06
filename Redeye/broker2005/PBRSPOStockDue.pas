unit PBRSPOStockDue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Data.DB;

type
  TPBRSPOStockDueFrm = class(TForm)
    pnlControl: TPanel;
    pnlRightControl: TPanel;
    PreviewBitBtn: TBitBtn;
    PrintBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    pnlSelections: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    DateFromButton: TSpeedButton;
    Label2: TLabel;
    DateToButton: TSpeedButton;
    rgSupplier: TRadioGroup;
    rgCustomer: TRadioGroup;
    SupplierPanel: TPanel;
    lblSupplier: TLabel;
    edtSupplier: TEdit;
    btnSupplier: TButton;
    CustomerPanel: TPanel;
    lblCustomer: TLabel;
    edtCustomer: TEdit;
    btnCustomer: TButton;
    chkbxBranches: TCheckBox;
    cbSort1: TComboBox;
    cbSort2: TComboBox;
    cbSort3: TComboBox;
    pnlDates: TPanel;
    chkbxPageBreak: TCheckBox;
    ExcOnHoldCheckBox: TCheckBox;
    TotByRadioGroup: TRadioGroup;
    chkbxShowSales: TCheckBox;
    DateFromEdit: TEdit;
    DateToEdit: TEdit;
    DBGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PBRSPOStockDueFrm: TPBRSPOStockDueFrm;

implementation

{$R *.dfm}

end.
