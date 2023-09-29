object STPrtEnqMovFrm: TSTPrtEnqMovFrm
  Left = 5
  Top = 84
  Caption = 'Product Movements Enquiry'
  ClientHeight = 368
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    779
    368)
  TextHeight = 13
  object PartLabel: TLabel
    Left = 8
    Top = 12
    Width = 65
    Height = 13
    Caption = 'Product Code'
  end
  object StoreLabel: TLabel
    Left = 8
    Top = 34
    Width = 25
    Height = 13
    Caption = 'Store'
  end
  object DateLabel: TLabel
    Left = 8
    Top = 58
    Width = 63
    Height = 13
    Caption = 'Dates:   From'
  end
  object Label1: TLabel
    Left = 264
    Top = 58
    Width = 13
    Height = 13
    Caption = 'To'
  end
  object Label2: TLabel
    Left = 400
    Top = 34
    Width = 15
    Height = 13
    Caption = 'Bin'
  end
  object Label3: TLabel
    Left = 400
    Top = 58
    Width = 15
    Height = 13
    Caption = 'Lot'
  end
  object PartEdit: TEdit
    Left = 104
    Top = 8
    Width = 217
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object StoreNameEdit: TEdit
    Left = 104
    Top = 32
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object FromEdit: TEdit
    Left = 104
    Top = 56
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object ToEdit: TEdit
    Left = 288
    Top = 56
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object PartDescrEdit: TEdit
    Left = 328
    Top = 8
    Width = 297
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object DetsDBGrid: TDBGrid
    Left = 8
    Top = 88
    Width = 769
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DetsDataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Date_Received'
        Title.Caption = 'Date'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Store_Name'
        Title.Caption = 'Store'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Movement_Bin'
        Title.Caption = 'Bin'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Store_Lot'
        Title.Caption = 'Lot'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Move_Type_Descr'
        Title.Caption = 'Move Type'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Movement_Reference'
        Title.Caption = 'Reference'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Stock_Pack_Quantity'
        Title.Caption = 'Pack'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Store_Quantity'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantity'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Store_Cost'
        Title.Caption = 'Value'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object BinEdit: TEdit
    Left = 432
    Top = 32
    Width = 193
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object lotEdit: TEdit
    Left = 432
    Top = 56
    Width = 193
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object CloseBitBtn: TBitBtn
    Left = 696
    Top = 343
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 8
    OnClick = CloseBitBtnClick
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Part_Movement.Date_Received, Part_Movement_Type.Part_Move' +
        '_Type_Descr,'
      
        '       Part_Store.Part_Store_Name, Part_Movement.Part_Movement_B' +
        'in,'
      
        '       Part_Movement.Part_Store_Lot, Part_Movement.Part_Movement' +
        '_Reference,'
      '       Part_Movement.Store_Cost, Part_Movement.Store_Quantity,'
      '       Part_Movement.Stock_Pack_Quantity,'
      
        '       Part_Movement.Store_Quantity / Part_Movement.Stock_Pack_Q' +
        'uantity as Qty_In_Packs'
      'FROM (Part_Movement LEFT JOIN Part_Movement_Type'
      
        '                        ON Part_Movement.Part_Movement_Type = Pa' +
        'rt_Movement_Type.Part_Movement_Type)'
      '                    LEFT JOIN Part_Store'
      
        '                        ON Part_Movement.Part_Movement_Store = P' +
        'art_Store.Part_Store'
      'Where (Part = :Part) and'
      
        '      ((Part_Movement.Part_Movement_Store = :Part_Store) or (:Pa' +
        'rt_Store = 0)) and'
      
        '      ((Part_Movement.Part_Movement_Bin = :Part_Bin) or (:Part_B' +
        'in = '#39#39')) and'
      
        '      ((Part_Movement.Part_Store_Lot = :Part_Store_Lot) or (:Par' +
        't_Store_Lot = '#39#39'))'
      'Order By Part_Movement.Part_Movement desc'
      ' ')
    Left = 224
    Top = 56
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Part_Store'
        DataType = ftString
      end
      item
        Name = 'Part_Store'
        DataType = ftString
      end
      item
        Name = 'Part_Bin'
        DataType = ftString
      end
      item
        Name = 'Part_Bin'
        DataType = ftString
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end
      item
        Name = 'Part_Store_Lot'
        DataType = ftString
      end>
    object GetDetsSQLDate_Received: TDateTimeField
      FieldName = 'Date_Received'
    end
    object GetDetsSQLPart_Move_Type_Descr: TStringField
      FieldName = 'Part_Move_Type_Descr'
      FixedChar = True
      Size = 40
    end
    object GetDetsSQLPart_Store_Name: TStringField
      FieldName = 'Part_Store_Name'
      FixedChar = True
      Size = 60
    end
    object GetDetsSQLPart_Movement_Bin: TStringField
      FieldName = 'Part_Movement_Bin'
      FixedChar = True
    end
    object GetDetsSQLPart_Store_Lot: TStringField
      FieldName = 'Part_Store_Lot'
      FixedChar = True
      Size = 40
    end
    object GetDetsSQLPart_Movement_Reference: TStringField
      FieldName = 'Part_Movement_Reference'
      FixedChar = True
      Size = 60
    end
    object GetDetsSQLStore_Cost: TCurrencyField
      FieldName = 'Store_Cost'
    end
    object GetDetsSQLStore_Quantity: TIntegerField
      FieldName = 'Store_Quantity'
      OnGetText = GetDetsSQLStore_QuantityGetText
    end
    object GetDetsSQLStock_Pack_Quantity: TIntegerField
      FieldName = 'Stock_Pack_Quantity'
    end
  end
  object DetsDataSource: TDataSource
    DataSet = GetDetsSQL
    Left = 304
    Top = 56
  end
end
