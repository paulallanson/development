object PBEnqJobDtlsFrm: TPBEnqJobDtlsFrm
  Left = 368
  Top = 103
  Caption = 'Supplier Additional Details'
  ClientHeight = 298
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object GroupBox1: TGroupBox
    Left = 5
    Top = 8
    Width = 271
    Height = 273
    ParentBackground = False
    TabOrder = 0
    object Label10: TLabel
      Left = 8
      Top = 5
      Width = 48
      Height = 17
      Caption = 'Supplier'
    end
    object Label11: TLabel
      Left = 8
      Top = 50
      Width = 39
      Height = 17
      Caption = 'Branch'
    end
    object Label9: TLabel
      Left = 8
      Top = 150
      Width = 62
      Height = 17
      Caption = 'Comments'
    end
    object Label8: TLabel
      Left = 47
      Top = 239
      Width = 95
      Height = 17
      Caption = 'Additional Costs'
    end
    object AddCostsSpeedBtn: TSpeedButton
      Left = 234
      Top = 236
      Width = 23
      Height = 23
      Caption = '...'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = AddCostsSpeedBtnClick
    end
    object Label1: TLabel
      Left = 8
      Top = 97
      Width = 55
      Height = 17
      Caption = 'Price Unit'
    end
    object SupplierEdit: TEdit
      Left = 8
      Top = 24
      Width = 249
      Height = 25
      ReadOnly = True
      TabOrder = 0
    end
    object BranchEdit: TEdit
      Left = 8
      Top = 69
      Width = 249
      Height = 25
      ReadOnly = True
      TabOrder = 1
    end
    object SupplierMemo: TMemo
      Left = 8
      Top = 168
      Width = 249
      Height = 57
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 2
    end
    object AddCostsMemo: TMemo
      Left = 144
      Top = 236
      Width = 81
      Height = 23
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      ReadOnly = True
      TabOrder = 3
    end
    object PriceUnitEdit: TEdit
      Left = 8
      Top = 116
      Width = 153
      Height = 25
      ReadOnly = True
      TabOrder = 4
    end
  end
end
