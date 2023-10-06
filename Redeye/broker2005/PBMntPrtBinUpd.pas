unit PBMntPrtBinUpd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, 
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, 
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TPBMntPrtBinUpdFrm = class(TForm)
    Label1: TLabel;
    BinFromEdit: TEdit;
    Label2: TLabel;
    BinToEdit: TEdit;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    PickRadioGroup: TRadioGroup;
    GetBinSQL: TFDQuery;
    AddBinSQL: TFDQuery;
    procedure BinFromEditChange(Sender: TObject);
    procedure BinToEditChange(Sender: TObject);
    procedure CheckOK(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    function GenerateBins(iTempStore: Integer; sTempFrom, sTempTo: String; bTempUpd: ByteBool): Integer;
    function CreateBin(iTempStore: Integer; sTempBin: String; bTempUpd: ByteBool): Integer;
    procedure PickRadioGroupClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function GetNum(sTempStrFrom, sTempStrTo: String): String;
  private
    { Private declarations }
    bFromToSame, bStopToChangeEvent: ByteBool ;
  public
    { Public declarations }
    sFuncMode: String;
    iStore: Integer;
  end;

var
  PBMntPrtBinUpdFrm: TPBMntPrtBinUpdFrm;

implementation

uses UITypes, CCSCommon;

{$R *.DFM}

procedure TPBMntPrtBinUpdFrm.BinFromEditChange(Sender: TObject);
begin
If bFromToSame then
   begin
   bStopToChangeEvent := True ;
   BinToEdit.Text := BinFromEdit.Text ;
   bStopToChangeEvent := False ;
   end;
CheckOK(Self) ;
end;

procedure TPBMntPrtBinUpdFrm.BinToEditChange(Sender: TObject);
begin
If (bStopToChangeEvent = False) then
   begin
   bFromToSame := False ;
   CheckOK(self) ;
   end;
end;

procedure TPBMntPrtBinUpdFrm.CheckOK(Sender: TObject);
begin
OKBitBtn.Enabled := (Length(BinFromEdit.Text) = Length(BinToEdit.Text)) and
            (Length(BinFromEdit.Text) > 0) and
            (PickRadioGroup.ItemIndex > -1);
end;

procedure TPBMntPrtBinUpdFrm.OKBitBtnClick(Sender: TObject);
begin
If MessageDlg('You are about to create ' +
   IntToStr(GenerateBins(iStore, BinFromEdit.Text, BinToEdit.Text, False)) +
              ' new bins - Proceed?', mtConfirmation, [mbNo,mbYes],0) = mrYes then
                 GenerateBins(iStore,BinFromEdit.Text, BinToEdit.Text, True) ;
end;

function TPBMntPrtBinUpdFrm.GenerateBins(iTempStore: Integer; sTempFrom, sTempTo: String; bTempUpd: ByteBool): Integer;
Var
iTempChar, iTempPos, iTempBinCount: Integer ;
sTempBin, sAlphas,sTempChar, sTempOutChar, sTempNum: String ;
bTempMore: ByteBool ;
begin
sAlphas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ^';
sTempBin := sTempFrom ;
iTempBinCount := 0 ;
iTempBinCount := iTempBinCount + CreateBin(iTempStore, sTempbin, bTempUpd) ;
{Work out what bins to create} ;
bTempMore := True ;
While bTempMore = True do
      begin
      bTempMore := False ;
      For iTempChar := Length(sTempFrom) downto 1 do
          begin
          sTempChar := Copy(sTempBin,iTempChar,1) ;
          sTempOutChar := Copy(sTempTo,iTempChar,1) ;
          iTempPos := Pos(sTempChar, sAlphas) ;
          If iTempPos > 0 then
             begin
             sTempChar := Copy(sAlphas,iTempPos + 1,1) ;
             if (sTempChar = '^') or (sTempChar > sTempOutChar) then
                begin
                {This character has reached its limit so reset it and move on} ;
                sTempBin := Copy(sTempBin,1,iTempChar - 1) + Copy(sTempFrom,iTempChar,1) +
                           Copy(sTempFrom,iTempChar + 1, Length(sTempBin) - iTempChar);
                Continue ;
                end
             else
                begin
                sTempBin := Copy(sTempBin,1,iTempChar - 1) + sTempChar +
                          Copy(sTempFrom,iTempChar + 1, Length(sTempBin) - iTempChar);
                bTempMore := True ;
                Break ;
                end;
             end;
          sTempNum := GetNum(Copy(sTempBin,1,iTempChar),Copy(sTempTo,1,iTempChar)) ;
          If sTempNum <> '' then
             begin
             bTempMore :=  True ;
             sTempBin :=  Copy(sTempBin,1,iTempChar - Length(sTempNum)) + sTempNum +
                                     Copy(sTempFrom,iTempChar + 1, Length(sTempBin) - iTempChar) ;
             Break ;
             end;
          end;
      If bTempMore then
         BEGIN
         iTempBinCount := iTempBinCount + CreateBin(iTempStore, sTempbin, bTempUpd) ;
         end;
      end;
Result := iTempBinCount ;
end;

function TPBMntPrtBinUpdFrm.CreateBin(iTempStore: Integer; sTempBin: String; bTempUpd: ByteBool): Integer;
begin
{Create/check the bin} ;
With GetBinSQL do
     begin
     Close ;
     ParamByName('Part_Store').AsInteger := iTempStore ;
     ParamByName('Part_Bin').AsString := sTempBin ;
     Open ;
     If RecordCount > 0 then
        begin
        Result := 0 ;
        end
     else
        begin
        Result := 1 ;
        If bTempUpd then
           begin
           With AddBinSQL do
                begin
                Close ;
                ParamByName('Part_Store').AsInteger := iTempStore ;
                ParamByName('Part_Bin').AsString := sTempBin ;
                If PickRadioGroup.ItemIndex = 0 then
                   ParamByName('Bin_Can_Pick').AsString := 'Y'
                else
                   ParamByName('Bin_Can_Pick').AsString := 'N' ;
                ExecSQL ;
                end;
           end;
        end;
     end;
end;

procedure TPBMntPrtBinUpdFrm.PickRadioGroupClick(Sender: TObject);
begin
CheckOK(self) ;
end;

procedure TPBMntPrtBinUpdFrm.FormActivate(Sender: TObject);
begin
bFromToSame := True ;
bStopToChangeEvent := False ;
end;

function TPBMntPrtBinUpdFrm.GetNum(sTempStrFrom, sTempStrTo: String): String;
Var
iTempCount, iTempCount2: Integer ;
sTempMin, sTempMax: String ;
begin
iTempCount2 := 0 ;
{Return any numeric portion of the string} ;
For iTempCount := Length(sTempStrFrom) DownTo 1 do
        If Pos(Copy(sTempStrFrom, iTempCount, 1), '0123456789') > 0 then
           iTempCount2 := iTempCount2 + 1
        else
           Break ;
sTempMin := Copy(sTempStrFrom,Length(sTempStrFrom) - iTempCount2 + 1, iTempCount2) ;
sTempMax := Copy(sTempStrTo,Length(sTempStrTo) - iTempCount2 + 1, iTempCount2) ;
sTempMin := IncrementNo(sTempMin) ;
If sTempMin > sTempMax then
   Result := ''
else
   Result := sTempMin ; 
end;

end.
