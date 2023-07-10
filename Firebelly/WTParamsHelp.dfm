object frmWTParamsHelp: TfrmWTParamsHelp
  Left = 520
  Top = 90
  BorderStyle = bsDialog
  Caption = 'frmWTParamsHelp'
  ClientHeight = 408
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    308
    408)
  PixelsPerInch = 96
  TextHeight = 13
  object DispMemo: TMemo
    Left = 8
    Top = 8
    Width = 289
    Height = 385
    Anchors = [akLeft, akTop, akBottom]
    Lines.Strings = (
      'Key words for email narrative'
      ''
      'Quote Emails:  <Number>'
      '                        <Customer Contact>'
      '                        <Description>'
      '                        <Material>'
      '                        <Office Contact>'
      '                        <Telephone>'
      ''
      'Sales Order Confirmation'
      '                        <Number>'
      '                        <Customer Contact>'
      '                        <Description>'
      '                        <Date Type>'
      '                        <Template Date>'
      '                        <Fitting Date>'
      '                        <Office Contact>'
      '                        <Telephone>'
      ''
      'Sales Invoice/Credits'
      '                        <Number>'
      ''
      'Purchase Order'
      '                        <Number>'
      '                        <Description>'
      '                        <Supplier Contact>'
      '                        <Office Contact>'
      '                        <Telephone>')
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
