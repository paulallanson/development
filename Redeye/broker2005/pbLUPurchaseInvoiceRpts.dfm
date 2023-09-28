object frmPBLUPurchaseInvoiceRpts: TfrmPBLUPurchaseInvoiceRpts
  Left = 201
  Top = 107
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Purchase Invoice Reports'
  ClientHeight = 271
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lstvwReports: TListView
      Left = 0
      Top = 0
      Width = 405
      Height = 230
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
      Items.ItemData = {
        05590100000400000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF000000
        001050007500720063006800610073006500200044006100790062006F006F00
        6B000F50004200520053005000550052004300480049004E005600460052004D
        000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00000000135000
        7500720063006800610073006500200062007900200049006E0076006F006900
        63006500115000420052005300500055005200430048004200590049004E0056
        00460052004D000000000000000000FFFFFFFFFFFFFFFF01000000FFFFFFFF00
        0000001853007500700070006C0069006500720020005400750072006E006F00
        76006500720020005200650070006F0072007400135000420052005300530055
        00500050004C004900450052005400550052004E00460052004D000000000000
        000000FFFFFFFFFFFFFFFF00000000FFFFFFFF0000000000FFFFFFFFFFFF}
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lstvwReportsDblClick
      ExplicitWidth = 413
      ExplicitHeight = 235
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 230
    Width = 405
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      405
      41)
    object btnRun: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Run'
      TabOrder = 0
      OnClick = btnRunClick
    end
    object Button2: TButton
      Left = 328
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
