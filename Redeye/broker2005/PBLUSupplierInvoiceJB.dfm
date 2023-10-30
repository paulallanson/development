object PBLUSupplierInvoiceJBFrm: TPBLUSupplierInvoiceJBFrm
  Left = 7
  Top = 29
  Caption = 'Job Bag item selection'
  ClientHeight = 502
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object stBrDetails: TStatusBar
    Left = 0
    Top = 483
    Width = 774
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    ExplicitTop = 474
    ExplicitWidth = 768
  end
  object Panel3: TPanel
    Left = 0
    Top = 392
    Width = 774
    Height = 91
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 383
    ExplicitWidth = 768
    object Panel1: TPanel
      Left = 0
      Top = 9
      Width = 353
      Height = 73
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 0
      object CustomerGroupBox: TGroupBox
        Left = 8
        Top = 13
        Width = 285
        Height = 60
        Caption = 'Type here to narrow the search'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 32
          Width = 43
          Height = 13
          Caption = 'Supplier'
        end
        object edtSupplierName: TEdit
          Left = 60
          Top = 24
          Width = 213
          Height = 21
          TabOrder = 0
          OnChange = edtSupplierNameChange
        end
      end
    end
    object Panel2: TPanel
      Left = 453
      Top = 0
      Width = 321
      Height = 91
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 447
      object GroupBox2: TGroupBox
        Left = 212
        Top = 6
        Width = 105
        Height = 76
        Caption = 'Function'
        TabOrder = 0
        object btnSelect: TBitBtn
          Left = 14
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Select '
          Enabled = False
          Glyph.Data = {
            BE060000424DBE06000000000000360400002800000024000000120000000100
            0800000000008802000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A600000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            03030303030303030303030303030303030303030303FF030303030303030303
            03030303030303040403030303030303030303030303030303F8F8FF03030303
            03030303030303030303040202040303030303030303030303030303F80303F8
            FF030303030303030303030303040202020204030303030303030303030303F8
            03030303F8FF0303030303030303030304020202020202040303030303030303
            0303F8030303030303F8FF030303030303030304020202FA0202020204030303
            0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
            040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
            03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
            FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
            0303030303030303030303FA0202020403030303030303030303030303F8FF03
            03F8FF03030303030303030303030303FA020202040303030303030303030303
            0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
            03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
            030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
            0202040303030303030303030303030303F8FF03F8FF03030303030303030303
            03030303FA0202030303030303030303030303030303F8FFF803030303030303
            030303030303030303FA0303030303030303030303030303030303F803030303
            0303030303030303030303030303030303030303030303030303030303030303
            0303}
          NumGlyphs = 2
          TabOrder = 0
          OnClick = btnSelectClick
        end
        object BitBtn2: TBitBtn
          Left = 14
          Top = 47
          Width = 75
          Height = 25
          Caption = 'Close'
          Kind = bkClose
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 6
        Width = 209
        Height = 76
        Caption = 'Job Bag'
        TabOrder = 1
        object Label2: TLabel
          Left = 34
          Top = 27
          Width = 41
          Height = 13
          Caption = 'Number'
        end
        object Label3: TLabel
          Left = 34
          Top = 51
          Width = 21
          Height = 13
          Caption = 'Line'
        end
        object edtJBNumber: TEdit
          Left = 88
          Top = 19
          Width = 105
          Height = 21
          TabOrder = 0
          OnKeyPress = edtJBNumberKeyPress
        end
        object edtJBLNumber: TEdit
          Left = 88
          Top = 43
          Width = 105
          Height = 21
          TabOrder = 1
          OnKeyPress = edtJBNumberKeyPress
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel4'
    TabOrder = 2
    ExplicitWidth = 768
    ExplicitHeight = 383
    object dbgJB: TDBGrid
      Left = 0
      Top = 0
      Width = 774
      Height = 392
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnCellClick = dbgJBCellClick
      OnDblClick = dbgJBDblClick
      Columns = <
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Job_Bag'
          Title.Caption = 'Job Bag'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Job_Bag_Line'
          Title.Caption = 'Line'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = 'Supplier'
          Width = 222
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Job_Bag_Line_Descr'
          Title.Caption = 'Description'
          Width = 226
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Job_Bag_Quantity'
          Title.Caption = 'Quantity'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Job_Bag_Line_Cost'
          Title.Alignment = taRightJustify
          Title.Caption = 'Cost'
          Width = 81
          Visible = True
        end>
    end
  end
  object SearchTimer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = SearchTimerTimer
    Left = 264
    Top = 48
  end
end
