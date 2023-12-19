object STMaintStoreStockfrm: TSTMaintStoreStockfrm
  Left = 404
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Maintain Bin Location'
  ClientHeight = 204
  ClientWidth = 739
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object pnlproduct: TPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 81
    Align = alTop
    Enabled = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 19
      Width = 73
      Height = 13
      Caption = 'Product Code:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 312
      Top = 19
      Width = 59
      Height = 13
      Caption = 'Description'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 51
      Width = 59
      Height = 13
      Caption = 'Warehouse'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 512
      Top = 51
      Width = 63
      Height = 13
      Caption = 'Bin Location'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object PartEdit: TEdit
      Left = 96
      Top = 15
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DescriptionEdit: TEdit
      Left = 376
      Top = 15
      Width = 337
      Height = 21
      TabStop = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object WarehouseEdit: TEdit
      Left = 96
      Top = 47
      Width = 313
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object BinLocationEdit: TEdit
      Left = 600
      Top = 47
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 81
    Width = 739
    Height = 72
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object Label6: TLabel
      Left = 8
      Top = 9
      Width = 41
      Height = 13
      Caption = 'In Stock'
    end
    object Label10: TLabel
      Left = 176
      Top = 9
      Width = 43
      Height = 13
      Caption = '(Singles)'
    end
    object Label12: TLabel
      Left = 320
      Top = 9
      Width = 48
      Height = 13
      Caption = 'Allocated'
    end
    object Label13: TLabel
      Left = 464
      Top = 9
      Width = 43
      Height = 13
      Caption = '(Singles)'
    end
    object memInStock: TEdit
      Left = 96
      Top = 5
      Width = 75
      Height = 21
      TabOrder = 0
    end
    object memAllocated: TEdit
      Left = 379
      Top = 5
      Width = 75
      Height = 21
      TabOrder = 1
    end
    object chkbxPaidFor: TCheckBox
      Left = 8
      Top = 40
      Width = 225
      Height = 17
      Caption = 'Stock has been paid for'
      TabOrder = 2
    end
  end
  object pnlFunctions: TPanel
    Left = 0
    Top = 153
    Width = 739
    Height = 51
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    TabStop = True
    DesignSize = (
      739
      51)
    object lblMessage: TLabel
      Left = 8
      Top = 24
      Width = 470
      Height = 13
      Caption = 
        'Sales Orders currently exist with stock allocated to them. You c' +
        'annot change the quantities'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OKBtn: TBitBtn
      Left = 575
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
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
      ParentFont = False
      TabOrder = 0
      OnClick = OKBtnClick
    end
    object CancelBtn: TBitBtn
      Left = 655
      Top = 18
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      Kind = bkCancel
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnClick = CancelBtnClick
    end
  end
  object qryStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Part.Part,'
      '        Part.Part_Description,'
      '        Part_Store.Part_Store,'
      '        Part_Store.Part_Store_Name,'
      '        Store_Stock.Store_Quantity,'
      '        Store_Stock.Quantity_Allocated,'
      '        Store_Stock.Store_Cost,'
      '        Store_Stock.Date_Received,'
      '        Store_Stock.Part_Store_Lot,'
      '        Store_Stock.Part_Bin,'
      '        Store_Stock.Invoice_Upfront,'
      '        Store_Stock.Stock_Pack_Quantity,'
      '        Store_Stock.Store_Stock_Description'
      'FROM Part_Store'
      '      INNER JOIN (Part'
      '      INNER JOIN Store_Stock'
      '        ON Part.Part = Store_Stock.Part)'
      '        ON Part_Store.Part_Store = Store_Stock.Part_Store'
      'WHERE Store_Stock = :Store_Stock')
    Left = 472
    Top = 16
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
  object qryUpStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Store_Stock'
      'SET Quantity_Allocated = :Quantity_Allocated,'
      '    Store_Quantity = :Store_Quantity,'
      '    Invoice_Upfront = :Invoice_Upfront'
      'WHERE Store_Stock = :Store_Stock')
    Left = 592
    Top = 16
    ParamData = <
      item
        Name = 'Quantity_Allocated'
      end
      item
        Name = 'Store_Quantity'
      end
      item
        Name = 'Invoice_Upfront'
      end
      item
        Name = 'Store_Stock'
      end>
  end
  object qryDelStoreStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE from Store_Stock'
      
        'WHERE Store_Stock = :Store_Stock and (Store_Quantity = 0) and (Q' +
        'uantity_Allocated = 0)')
    Left = 592
    Top = 72
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
  object qryGetPartStoreAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Part_Store_Allocation.Part_Store_Allocation'
      'FROM Part_Store_Allocation'
      'WHERE Store_Stock = :Store_Stock')
    Left = 472
    Top = 113
    ParamData = <
      item
        Name = 'Store_Stock'
      end>
  end
end
