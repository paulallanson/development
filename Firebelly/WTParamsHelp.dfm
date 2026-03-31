object frmWTParamsHelp: TfrmWTParamsHelp
  Left = 520
  Top = 90
  BorderStyle = bsDialog
  Caption = 'Keyword Help'
  ClientHeight = 562
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  DesignSize = (
    314
    562)
  TextHeight = 17
  object DispMemo: TMemo
    Left = 8
    Top = 8
    Width = 289
    Height = 539
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
    ExplicitHeight = 385
  end
end
