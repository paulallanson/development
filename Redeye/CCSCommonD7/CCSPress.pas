unit CCSPress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, CCSDataBroker, QuickRpt, Qrctrls, CCSDevil, Compositor,
  CCSPrint, QrExport, PDLetter, qrprntr, CCSCommon;

type
  TfrmPrintingPress = class(TForm)
    ReportImage: TImage;
    QuickR: TQuickRep;
    LineToPrint: TQRBand;
    Column1: TQRLabel;
    Column2: TQRLabel;
    Column3: TQRLabel;
    PageHeader: TQRBand;
    PageFooter: TQRBand;
    imgLogo: TQRImage;
    MyAddress: TQRMemo;
    PageContinued: TQRChildBand;
    labContinued: TQRLabel;
    qrlblAuthorised: TQRLabel;
    imgLogo1: TQRImage;
    imgLogo2: TQRImage;
    imgLogo3: TQRImage;
    MyRegAddress: TQRMemo;
    procedure FormCreate(Sender: TObject);
    procedure QuickRNeedData(Sender: TObject; var MoreData: Boolean);
    procedure LineToPrintBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRStartPage(Sender: TCustomQuickRep);
    procedure LineToPrintAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure PageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    FContinued : Boolean;
    FDataBroker: TDataBroker;
    FDevil : TDevil;
    FAuthorised: Boolean;
    procedure ResetVirtualPage;
    procedure SetDataBroker(const Value: TDataBroker);
    procedure SetColumn(Column : TQRLabel; Compositor : TCompositor);
    procedure SetAuthorised(const Value: Boolean);
  public
    property DataBroker : TDataBroker read FDataBroker write SetDataBroker;
    property Authorised: Boolean read FAuthorised write SetAuthorised;
  end;

implementation
uses UITypes, 
{$IFDEF DEBUG}
  CCSDebug,
{$ENDIF}
  Printers, PBImages;

{$R *.DFM}

{ TfrmPrintingPress }

procedure TfrmPrintingPress.FormCreate(Sender: TObject);
begin
  FDevil := TDevil.Create;
end;

procedure TfrmPrintingPress.QuickRNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  with FDevil do
  begin
    MoreData := DataReady;
    if MoreData then
      if (SpaceNeeded > DataBroker.PageLayout.SpaceLeft) or (NewLetter) then
      begin
{$IFDEF DEBUG}
        Trace('SpaceNeeded=' + IntToStr(SpaceNeeded) + ', SpaceLeft=' +
          IntToStr(DataBroker.PageLayout.SpaceLeft) + ', NewLetter=' +
          BoolToStr(NewLetter));
{$ENDIF}
        FContinued := not NewLetter;
        QuickR.NewPage;
        NewLetter := false;
        AdjustWidths;
      end;
  end;
end;

procedure TfrmPrintingPress.LineToPrintBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with FDevil do
  begin
    SetColumn(Column1, Compositor1);
    SetColumn(Column2, Compositor2);
    SetColumn(Column3, Compositor3);
    LineToPrint.Height := LineHeight;
  end;
end;

procedure TfrmPrintingPress.SetDataBroker(const Value: TDataBroker);
begin
  FDataBroker := Value;
  FDataBroker.BuildPrintRecords;
  FDevil.DataBroker := FDataBroker;
end;

procedure TfrmPrintingPress.SetColumn(Column: TQRLabel;
  Compositor: TCompositor);
begin
  with FDevil do
  begin
    Column.Alignment := taLeftJustify;
    Column.Enabled := Compositor.HaveData;
    if Column.Enabled then
    begin
      Column.Font.Assign(Compositor.Font);
      Column.Caption := Compositor.Line;
      Column.Height := Compositor.TextHeight;
      Column.Top := (LineToPrint.Height div 2)-(Column.Height div 2);
      if Compositor.Alignment = taLeftJustify then
        Column.Left := Compositor.LeftMargin + DataBroker.PageLayout.MarginLeft
      else
      if Compositor.Alignment = taCenter then
        with DataBroker.PageLayout do
          Column.Left := ((CurrentWidth - Column.Width) DIV 2) + MarginLeft
      else  { must be right justify }
      begin
        Column.Alignment := taRightJustify;
        Column.Left := Compositor.LeftMargin + DataBroker.PageLayout.MarginLeft;
        Column.Width := DataBroker.PageLayout.CurrentWidth;
      end;
    end;
  end;
end;

procedure TfrmPrintingPress.FormDestroy(Sender: TObject);
begin
  FDevil.Free;
end;

procedure TfrmPrintingPress.QuickRStartPage(Sender: TCustomQuickRep);
begin
  ResetVirtualPage;
end;

procedure TfrmPrintingPress.ResetVirtualPage;
begin
  with DataBroker.PageLayout do
  begin
    YPos := MarginTop;
    SpaceLeft := PageHeight - Trunc(MarginTop + MarginBottom);
    PageHeader.Height := MarginTop;
    PageFooter.Height := MarginBottom;

    {Print Main Logo}
    if PrintLogo then
    begin
      imgLogo.Top := LogoTop;
      imgLogo.Left := LogoLeft;
      imgLogo.Height := LogoHeight;
      imgLogo.Width := LogoWidth;

      if FileExists(LogoFileName) and (trim(LogoFileName) <> '') then
//        imgLogo.Picture := PBImagesFrm.ReportImage.Picture
        imgLogo.Picture.LoadFromFile(LogoFileName)
      else
      if FileExists(cDefaultRepLogo) then
        imgLogo.Picture := PBImagesFrm.ReportImage.Picture;
//        imgLogo.Picture.LoadFromFile(cDefaultRepLogo);
//      imgLogo.Picture.bitmap.pixelformat := pfDevice;
      imgLogo.Enabled := true;
    end
    else
    begin
      imgLogo.Picture := nil;
      imgLogo.Enabled := false;
    end;

    {Print Logo 1}
    if PrintLogo1 then
    begin
      imgLogo1.Top := LogoTop1;
      imgLogo1.Left := LogoLeft1;
      imgLogo1.Height := LogoHeight1;
      imgLogo1.Width := LogoWidth1;

      if FileExists(LogoFileName1) then
//        imgLogo.Picture := PBImagesFrm.ReportImage.Picture
        imgLogo1.Picture.LoadFromFile(LogoFileName1)
      else
      if FileExists(cDefaultRepLogo1) then
        imgLogo1.Picture := PBImagesFrm.ReportImage1.Picture;
//        imgLogo.Picture.LoadFromFile(cDefaultRepLogo);
//      imgLogo.Picture.bitmap.pixelformat := pfDevice;
      imgLogo1.Enabled := true;
    end
    else
    begin
      imgLogo1.Picture := nil;
      imgLogo1.Enabled := false;
    end;

    {Print Logo 2}
    if PrintLogo2 then
    begin
      imgLogo2.Top := LogoTop2;
      imgLogo2.Left := LogoLeft2;
      imgLogo2.Height := LogoHeight2;
      imgLogo2.Width := LogoWidth2;

      if FileExists(LogoFileName2) then
//        imgLogo.Picture := PBImagesFrm.ReportImage.Picture
        imgLogo2.Picture.LoadFromFile(LogoFileName2)
      else
      if FileExists(cDefaultRepLogo2) then
        imgLogo2.Picture := PBImagesFrm.ReportImage2.Picture;
//        imgLogo.Picture.LoadFromFile(cDefaultRepLogo);
//      imgLogo.Picture.bitmap.pixelformat := pfDevice;
      imgLogo2.Enabled := true;
    end
    else
    begin
      imgLogo2.Picture := nil;
      imgLogo2.Enabled := false;
    end;

    {Print Logo 3}
    if PrintLogo3 then
    begin
      imgLogo3.Top := LogoTop3;
      imgLogo3.Left := LogoLeft3;
      imgLogo3.Height := LogoHeight3;
      imgLogo3.Width := LogoWidth3;

      if FileExists(LogoFileName3) then
//        imgLogo.Picture := PBImagesFrm.ReportImage.Picture
        imgLogo3.Picture.LoadFromFile(LogoFileName3)
      else
      if FileExists(cDefaultRepLogo3) then
        imgLogo3.Picture := PBImagesFrm.ReportImage3.Picture;
//        imgLogo.Picture.LoadFromFile(cDefaultRepLogo);
//      imgLogo.Picture.bitmap.pixelformat := pfDevice;
      imgLogo3.Enabled := true;
    end
    else
    begin
      imgLogo3.Picture := nil;
      imgLogo3.Enabled := false;
    end;

    {Main Address}
    if PrintAddress then
    begin
      MyAddress.Font.Name := AddressFontName;
      MyAddress.Font.Size := AddressFontSize;

      DataBroker.PrintAddressbyLine := AddressPrintByLine;
      if AddressFontStyle <> 0 then
      begin
        MyAddress.Font.Style := [];
        if (AddressFontStyle and cBold) <> 0 then
          MyAddress.Font.Style := MyAddress.Font.Style + [fsBold];
        if (AddressFontStyle and cItalic) <> 0 then
          MyAddress.Font.Style := MyAddress.Font.Style + [fsItalic];
        if (AddressFontStyle and cUnderline) <> 0 then
          MyAddress.Font.Style := MyAddress.Font.Style + [fsUnderline];
      end;

      if AddressAlignment = 'C' then
        MyAddress.Alignment := taCenter
      else
      if AddressAlignment = 'R' then
        MyAddress.Alignment := taRightJustify
      else
        MyAddress.Alignment := taLeftJustify;

      MyAddress.Top := AddressTop;
      MyAddress.Left := AddressLeft;
      MyAddress.Width := AddressWidth;
      MyAddress.Height := AddressHeight;
      MyAddress.Enabled := true;
      MyAddress.Lines.Text := DataBroker.CompanyAddress;
    end
    else
      MyAddress.Enabled := false;

    {Reg Address}
    if PrintRegAddress then
    begin
      MyRegAddress.Font.Name := RegAddressFontName;
      MyRegAddress.Font.Size := RegAddressFontSize;

      DataBroker.PrintRegAddressbyLine := RegAddressPrintByLine;
      if RegAddressFontStyle <> 0 then
      begin
        MyRegAddress.Font.Style := [];
        if (RegAddressFontStyle and cBold) <> 0 then
          MyRegAddress.Font.Style := MyRegAddress.Font.Style + [fsBold];
        if (RegAddressFontStyle and cItalic) <> 0 then
          MyRegAddress.Font.Style := MyRegAddress.Font.Style + [fsItalic];
        if (RegAddressFontStyle and cUnderline) <> 0 then
          MyRegAddress.Font.Style := MyRegAddress.Font.Style + [fsUnderline];
      end;

      if RegAddressAlignment = 'C' then
        MyRegAddress.Alignment := taCenter
      else
      if RegAddressAlignment = 'R' then
        MyRegAddress.Alignment := taRightJustify
      else
        MyRegAddress.Alignment := taLeftJustify;

      MyRegAddress.Top := RegAddressTop;
      MyRegAddress.Left := RegAddressLeft;
      MyRegAddress.Width := RegAddressWidth;
      MyRegAddress.Height := RegAddressHeight;
      MyRegAddress.Enabled := true;
      MyRegAddress.Lines.Text := DataBroker.RegisteredAddress;
    end
    else
      MyRegAddress.Enabled := false;
  end;
end;

procedure TfrmPrintingPress.LineToPrintAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  with DataBroker.PageLayout do
  begin
    SpaceLeft := SpaceLeft - LineToPrint.Height;
    YPos := YPos + LineToPrint.Height;
    FDevil.AdjustWidths;
{$IFDEF DEBUG}
    Trace('SpaceLeft=' + IntToStr(SpaceLeft) + ', YPos=' + IntToStr(YPos));
    Trace('QR CurrentY=' + IntToStr(Trunc((96*QuickR.CurrentY/100)/2.54)));
{$ENDIF}
  end;
end;

procedure TfrmPrintingPress.QuickRBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   TopMar, BottomMar, LeftMar, RightMar: Double;
   Copies: Integer;
   Bin: TQRBin;
   Size: TQRPaperSize;
   Duplex: Boolean;
begin
(*
  {set the printer to what the user selected}
  QuickR.PrinterSettings.PrinterIndex := Printers.Printer.PrinterIndex;
  GetPrinterMargins(TopMar, BottomMar, LeftMar, RightMar);
  GetPrinterValues(Copies, Bin, Size, Duplex);
  QuickR.PrinterSettings.OutputBin := Bin;   {set the output bin the }
  QuickR.PrinterSettings.Copies := Copies;   {set the output bin the }
*)

  {This is all Roddy's work}
  ResetVirtualPage;
  DataBroker.Reset;
  FContinued := false;
  QuickR.Page.orientation := poPortrait;
//  QuickR.Page.orientation := Printer.Orientation;
  with QuickR.PrinterSettings do
  begin
    PrinterIndex := DataBroker.PrinterSettings.PrinterIndex;
    Copies := DataBroker.PrinterSettings.Copies;
    if DataBroker.PrinterSettings.FromPage <> 0 then
    begin
      FirstPage := DataBroker.PrinterSettings.FromPage;
      LastPage := DataBroker.PrinterSettings.ToPage;
    end;
    OutputBin := DataBroker.PrinterSettings.OutputBin;
  end;

(*
   {make sure the reports margins are not outside of the printers minimum
margins}
   if QuickReport.Page.Orientation = poPortrait then
   begin
      if BottomMar > QuickReport.Page.BottomMargin then
         if StrToFloatDef(FormatFloat('0.0', BottomMar), 0, FormatSettings) > BottomMar then
            QuickReport.Page.BottomMargin := StrToFloatDef(FormatFloat('0.0',
BottomMar))
         else
            QuickReport.Page.BottomMargin := StrToFloatDef(FormatFloat('0.0',
BottomMar)) + 0.1;
   end
   else
   begin
      if BottomMar > QuickReport.Page.RightMargin then
         if StrToFloatDef(FormatFloat('0.0', BottomMar), 0, FormatSettings) > BottomMar then
            QuickReport.Page.RightMargin := StrToFloatDef(FormatFloat('0.0',
BottomMar))
         else
            QuickReport.Page.RightMargin := StrToFloatDef(FormatFloat('0.0',
BottomMar)) + 0.1;
   end;
*)
end; {QuickReportBeforePrint}

procedure TfrmPrintingPress.PageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iWidth : integer;
begin
  labContinued.Caption := DataBroker.ContinuedText;
  if Assigned(DataBroker.ContinuedFont) then
    labContinued.Font.Assign(DataBroker.ContinuedFont);
//  labContinued.Top := PageHeader.Height DIV 2;
  labContinued.Enabled := FContinued;
  PageContinued.Enabled := FContinued;
  if FContinued then
  begin
    { Form font has been set to same as labContinued for measurement }
    iWidth := Self.Canvas.TextWidth(DataBroker.ContinuedText);
    labContinued.Left := DataBroker.PageLayout.MarginLeft +
      ((DataBroker.PageLayout.CurrentWidth - iWidth) DIV 2);
    PageContinued.Height := (labContinued.height+2)*2;
  end;
end;

procedure TfrmPrintingPress.SetAuthorised(const Value: Boolean);
begin
  FAuthorised := Value;
  qrlblAuthorised.Enabled := not FAuthorised
end;

end.
