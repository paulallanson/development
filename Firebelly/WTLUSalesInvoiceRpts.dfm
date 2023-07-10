object frmWTLUSalesInvoiceRpts: TfrmWTLUSalesInvoiceRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Sales Invoice Reports'
  ClientHeight = 184
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 143
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 412
      Height = 143
      Align = alClient
      Columns = <
        item
          Caption = 'Description'
          Width = 200
        end
        item
          Caption = 'File Name'
          Width = 100
        end
        item
          Caption = 'Item No'
          Width = 0
        end>
      Items.Data = {
        240100000400000000000000FFFFFFFFFFFFFFFF01000000000000001753616C
        657320627920496E766F696365205265706F72741546524D5754525353414C45
        534259494E564F49434500000000FFFFFFFFFFFFFFFF01000000000000000E50
        61796D656E74205265706F72741146524D5754525353495041594D454E545300
        000000FFFFFFFFFFFFFFFF01000000000000002753616C657320496E766F6963
        65205061796D656E7420436F6D70617269736F6E205265706F72741B46524D57
        54525353414C4553494E564F4943455041594D454E545300000000FFFFFFFFFF
        FFFFFF0100000000000000184D6174657269616C732053616C657320416E616C
        797369731746524D575452534D4154455249414C414E414C59534953FFFFFFFF
        FFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = enableSelect
      OnDblClick = lstvwReportsDblClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 143
    Width = 412
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      412
      41)
    object btnselect: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Select'
      Enabled = False
      TabOrder = 0
      OnClick = btnselectClick
    end
    object Button2: TButton
      Left = 327
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
