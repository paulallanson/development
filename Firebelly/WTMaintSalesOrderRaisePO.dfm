object frmWTMaintSalesOrderRaisePO: TfrmWTMaintSalesOrderRaisePO
  Left = 270
  Top = 107
  Caption = 'Raise Purchase Orders'
  ClientHeight = 373
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 695
    Height = 49
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 13
      Top = 17
      Width = 74
      Height = 13
      Caption = 'Date Required'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtDateRequired: TEdit
      Left = 91
      Top = 13
      Width = 89
      Height = 21
      TabOrder = 0
      OnChange = CheckOK
      OnExit = edtDateRequiredExit
    end
    object btnDateRequired: TBitBtn
      Left = 195
      Top = 11
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnDateRequiredClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 308
    Width = 695
    Height = 46
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      695
      46)
    object btnOK: TBitBtn
      Left = 270
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOKClick
    end
    object BitBtn2: TBitBtn
      Left = 358
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 354
    Width = 695
    Height = 19
    Panels = <>
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 49
    Width = 695
    Height = 259
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Supplier_Name'
        Title.Caption = 'Supplier'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Material_Description'
        Title.Caption = 'Material'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Worktop_Description'
        Title.Caption = 'Colour'
        Width = 143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Thickness_mm'
        Title.Caption = 'Thickness'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Length'
        Title.Caption = 'Slab Length'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Depth'
        Title.Caption = 'Slab Depth'
        Width = 88
        Visible = True
      end>
  end
end
