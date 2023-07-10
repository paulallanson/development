unit STPrtTransSN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids;

type
  TSTPrtTransSNFrm = class(TForm)
    ItemNoLabel: TLabel;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SNStringGrid: TStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iNoOfSNs: Integer ;
    bOK: ByteBool ;
  end;

var
  STPrtTransSNFrm: TSTPrtTransSNFrm;

implementation

{$R *.DFM}

procedure TSTPrtTransSNFrm.FormActivate(Sender: TObject);
Var
iTempCount: Integer ;
begin
bOK := False ;
SNStringGrid.RowCount := iNoOfSNs + 1 ;
SNStringGrid.Cells[0,0] := 'No' ;
SNStringGrid.Cells[1,0] := 'Serial Number' ;
For iTempCount := 1 to iNoOfSNs do
      SNStringGrid.Cells[0,iTempCount] := IntToStr(iTempcount) ;
end;

procedure TSTPrtTransSNFrm.OKBitBtnClick(Sender: TObject);

Var
iTempCount, iTempCount2: Integer ;
begin
For iTempCount := 1 to SNStringGrid.RowCount - 1 do
           begin
           if SNStringGrid.Cells[1,iTempCount] = '' then
              begin
              MessageDlg('You must enter a serial number for all ' +
                              IntToStr(iNoOfSNs) + ' items.', mtError,[mbOK],0) ;
              exit ;
              end;
           For iTempCount2 := iTempCount + 1 to SNStringGrid.RowCount - 1 do
                begin
                if SNStringGrid.Cells[1,iTempCount] = SNStringGrid.Cells[1,iTempCount2] then
                   begin
                   MessageDlg('All the serial numbers must be different.', mtError,[mbOK],0) ;
                   exit ;
                   end;
                end;
           end;
bOK := True ;
Close ;
end;

end.
