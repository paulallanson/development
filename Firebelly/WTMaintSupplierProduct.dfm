object frmWTMaintSupplierProduct: TfrmWTMaintSupplierProduct
  Left = 275
  Top = 129
  BorderStyle = bsDialog
  Caption = 'Product Maintenance'
  ClientHeight = 208
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFunctions: TPanel
    Left = 0
    Top = 168
    Width = 758
    Height = 40
    Align = alBottom
    TabOrder = 3
    TabStop = True
    DesignSize = (
      758
      40)
    object btnOK: TBitBtn
      Left = 594
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 674
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Kind = bkCancel
    end
    object chkbxInactive: TCheckBox
      Left = 16
      Top = 11
      Width = 169
      Height = 17
      Caption = 'Product is inactive'
      TabOrder = 2
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 25
    Width = 758
    Height = 78
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 13
      Width = 65
      Height = 13
      Caption = 'Product Code'
    end
    object Label2: TLabel
      Left = 18
      Top = 45
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object edtProductCode: TEdit
      Left = 112
      Top = 8
      Width = 385
      Height = 21
      TabOrder = 0
      Text = 'edtProductCode'
      OnChange = CheckOK
    end
    object edtDescription: TEdit
      Left = 112
      Top = 40
      Width = 625
      Height = 21
      TabOrder = 1
      Text = 'edtDescription'
      OnChange = CheckOK
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 25
    Align = alTop
    TabOrder = 0
  end
  object pnlCosts: TPanel
    Left = 0
    Top = 103
    Width = 758
    Height = 65
    Align = alBottom
    TabOrder = 2
    object Label12: TLabel
      Left = 18
      Top = 10
      Width = 43
      Height = 13
      Caption = 'Unit Cost'
    end
    object Label3: TLabel
      Left = 226
      Top = 10
      Width = 91
      Height = 13
      Caption = 'Cost Pack Quantity'
    end
    object Label4: TLabel
      Left = 18
      Top = 42
      Width = 46
      Height = 13
      Caption = 'Unit Price'
    end
    object Label5: TLabel
      Left = 226
      Top = 42
      Width = 94
      Height = 13
      Caption = 'Price Pack Quantity'
    end
    object edtUnitCost: TCREditMoney
      Left = 112
      Top = 6
      Width = 80
      Height = 21
      TabOrder = 0
      OnChange = CheckOK
    end
    object edtCostUnit: TMemo
      Left = 328
      Top = 6
      Width = 80
      Height = 21
      TabOrder = 1
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
    end
    object edtUnitPrice: TCREditMoney
      Left = 112
      Top = 38
      Width = 80
      Height = 21
      TabOrder = 2
      OnChange = CheckOK
    end
    object edtpriceUnit: TMemo
      Left = 328
      Top = 38
      Width = 80
      Height = 21
      TabOrder = 3
      WantReturns = False
      WordWrap = False
      OnChange = CheckOK
    end
  end
  object qryCheckProduct: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT Supplier_Product_Code'
      'FROM Supplier_Product'
      'WHERE Supplier = :Supplier AND'
      '      Supplier_Product_Code = :Supplier_Product_Code')
    Left = 560
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Product_Code'
        ParamType = ptUnknown
      end>
  end
end
