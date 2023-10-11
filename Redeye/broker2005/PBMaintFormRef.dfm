object PBMaintFormRefFrm: TPBMaintFormRefFrm
  Left = 178
  Top = 169
  BorderStyle = bsDialog
  Caption = 'Maintain Form Reference'
  ClientHeight = 222
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object DetsGrpBox: TGroupBox
    Left = 8
    Top = 4
    Width = 497
    Height = 181
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 44
      Height = 13
      Caption = 'Customer'
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 37
      Height = 13
      Caption = 'Branch '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 72
      Width = 76
      Height = 13
      Caption = 'Form Reference'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 124
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object Label11: TLabel
      Left = 264
      Top = 154
      Width = 67
      Height = 13
      Caption = 'Reorder Level'
    end
    object Label3: TLabel
      Left = 8
      Top = 98
      Width = 81
      Height = 13
      Caption = 'Stock Reference'
    end
    object lblPrefix: TLabel
      Left = 360
      Top = 44
      Width = 26
      Height = 13
      Caption = 'Prefix'
    end
    object CustNameEdit: TEdit
      Left = 104
      Top = 16
      Width = 242
      Height = 21
      Color = clBtnFace
      MaxLength = 40
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = 'CustNameEdit'
    end
    object BranchNameEdit: TEdit
      Left = 104
      Top = 42
      Width = 241
      Height = 21
      Color = clBtnFace
      MaxLength = 40
      ReadOnly = True
      TabOrder = 1
      Text = 'BranchNameEdit'
    end
    object RefIDEdit: TEdit
      Left = 104
      Top = 68
      Width = 329
      Height = 21
      MaxLength = 50
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = RefIDEditChange
      OnExit = RefIDEditExit
      OnKeyPress = RefIDEditKeyPress
    end
    object RefDescrEdit: TEdit
      Left = 104
      Top = 120
      Width = 329
      Height = 21
      MaxLength = 50
      TabOrder = 4
      Text = 'RefDescrEdit'
      OnChange = RefDescrEditChange
      OnKeyPress = RefDescrEditKeyPress
    end
    object ChkBoxStockedItem: TCheckBox
      Left = 8
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Stocked Item'
      TabOrder = 5
      OnClick = ChkBoxStockedItemClick
    end
    object edtReorder: TMemo
      Left = 352
      Top = 148
      Width = 81
      Height = 25
      Alignment = taRightJustify
      Lines.Strings = (
        '')
      TabOrder = 6
      WantReturns = False
      OnChange = CheckOK
      OnEnter = SaveMemoField
    end
    object StockRefEdit: TEdit
      Left = 104
      Top = 94
      Width = 329
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 25
      TabOrder = 3
      Text = 'STOCKREFEDIT'
      OnChange = StockRefEditChange
      OnExit = RefIDEditExit
      OnKeyPress = StockRefEditKeyPress
    end
    object btnLUProd: TButton
      Left = 444
      Top = 93
      Width = 25
      Height = 25
      Hint = 'Stock Code lookup'
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnLUProdClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 191
    Width = 514
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object DelLabel: TLabel
      Left = 128
      Top = 3
      Width = 145
      Height = 15
      Caption = 'Delete the above details ?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object OKBitBtn: TBitBtn
      Left = 304
      Top = 1
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F00007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F7F0000007F00007F007F0000007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F0000007F00007F00007F0000
        7F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F000000
        7F00007F00007F00007F00007F00007F007F0000007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F7F0000007F00007F00007F0000FF00007F00007F00007F00007F00
        7F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F00007F00007F0000FF00007F7F
        00FF00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F7F7F7FFFFFFF007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00
        007F0000FF00007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F00FF
        00007F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F
        7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF0000
        7F00007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F
        7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F00FF00007F00007F00007F007F0000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00
        007F00007F007F0000007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFF
        FFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F00FF00007F00007F007F0000007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F
        7F7FFFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00FF00007F00007F
        00007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F00FF00007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 384
      Top = 1
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F0000FF7F7F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7FFFFFFF007F7F
        007F7F007F7F007F7F007F7F007F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F00
        00FF00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        FFFFFF007F7F7F7F7FFFFFFF007F7F007F7F007F7FFFFFFF7F7F7F7F7F7FFFFF
        FF007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F00007F7F7F7F007F7F007F7F
        007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7FFFFF
        FF7F7F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F00007F00007F7F7F7F00007F00007F00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F
        7F007F7F7F7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F00007F
        00007F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F00
        7F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        0000FF00007F00007F00007F00007F00007F00007F7F7F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F00
        7F7F007F7F007F7F007F7FFFFFFF7F7F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F00007F00007F00007F00007F00007F7F7F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF0000
        7F00007F00007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F
        7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F0000FF00007F00007F00007F00007F00007F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F
        007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F0000FF00007F00007F00007F7F7F7F00007F00
        007F00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F7F7F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F00007F00
        007F7F7F7F007F7F0000FF00007F00007F00007F7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F7F7F7F007F7F007F7F007F7F7F7F7FFFFF
        FF007F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F0000FF00007F00007F7F7F7F007F7F007F7F007F7F0000FF00007F00007F
        00007F7F7F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7FFFFFFF007F
        7F007F7F7F7F7F007F7F7F7F7FFFFFFF007F7F007F7F7F7F7FFFFFFF007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F007F7F007F7F007F7F
        007F7F007F7F0000FF00007F00007F00007F007F7F007F7F007F7F007F7F007F
        7F007F7F7F7F7FFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F7F7F7FFFFFFF00
        7F7F007F7F7F7F7FFFFFFF007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F0000FF00007F0000FF007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F007F7F007F7F00
        7F7F007F7F007F7F7F7F7FFFFFFFFFFFFFFFFFFF7F7F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F7F7F7F7F7F7F7F7F7F
        007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F
        7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F00
        7F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F007F7F
        007F7F007F7F007F7F007F7F007F7F007F7F}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
      OnClick = CancelBitBtnClick
    end
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Form_Reference'
      '  (Customer,'
      '  Branch_No,'
      '  Form_Reference,'
      '  Form_Reference_Descr,'
      '  Form_Reference_ID,'
      '  Stocked_Item,'
      '  Reorder_Level,'
      '  Stock_Reference)'
      
        'Select :Customer, :Branch_No, Max(Form_Reference)+1, :GUID, '#39' '#39',' +
        ' '#39'N'#39',0, '#39' '#39
      '  From Form_Reference'
      '')
    Left = 16
    Top = 56
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Form_Reference'
      'Set'
      '  Form_Reference_Descr=:Form_Reference_Descr,'
      '  Form_Reference_ID=:Form_Reference_ID,'
      '  Stocked_Item=:Stocked_Item,'
      '  Reorder_Level=:Reorder_Level,'
      '  Stock_Reference = :Stock_Reference'
      'Where Form_Reference = :Form_Reference')
    Left = 56
    Top = 56
    ParamData = <
      item
        Name = 'Form_Reference_Descr'
      end
      item
        Name = 'Form_Reference_ID'
      end
      item
        Name = 'Stocked_Item'
      end
      item
        Name = 'Reorder_Level'
      end
      item
        Name = 'Stock_Reference'
      end
      item
        Name = 'Form_Reference'
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Form_Reference'
      'Where'
      '(Form_Reference=:Form_Reference)'
      '')
    Left = 96
    Top = 56
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
  object GetFormRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Form_Reference_ID, Form_Reference_Descr'
      'From Form_Reference'
      ''
      '')
    Left = 48
    Top = 4
  end
  object FormRefSRC: TDataSource
    DataSet = GetFormRefSQL
    Left = 176
    Top = 4
  end
  object MaxSQL: TFDQuery
    SQL.Strings = (
      'Select Max(Form_Reference_Code) as Last_Code'
      'From Form_Reference'
      '')
    Left = 80
    Top = 184
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Form_Reference'
      'From Form_Reference'
      'Where Form_Reference_Descr = :GUID'
      '')
    Left = 8
    Top = 188
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object CheckFormRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Form_Reference'
      'where Customer=:Customer and'
      '          Branch_No=:Branch_No and'
      '          Form_Reference_ID=:Form_Reference_ID')
    Left = 240
    Top = 4
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Form_Reference_ID'
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Form_Reference'
      'From Form_Reference'
      'Where Form_Reference_Descr = :GUID'
      '')
    Left = 48
    Top = 188
    ParamData = <
      item
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object CompanySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Company')
    Left = 16
    Top = 4
  end
  object CheckFormRef2SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT top 1 Form_Reference.Form_Reference_ID,'
      ' Customer.Name,'
      ' Customer_Branch.Name as branch_name'
      'FROM Customer_Branch'
      'INNER JOIN (Form_Reference'
      
        '  INNER JOIN Customer ON Form_Reference.Customer = Customer.Cust' +
        'omer)'
      
        'ON (Customer.Customer = Customer_Branch.Customer) AND (Customer_' +
        'Branch.Branch_no = Form_Reference.Branch_No) AND (Customer_Branc' +
        'h.Customer = Form_Reference.Customer)'
      'where (form_reference.stock_reference = :stock_reference)'
      'and (form_reference_id <> :form_reference_id)'
      'and (form_reference_id <> :Old_Form_Reference_id)'
      ' ')
    Left = 288
    Top = 8
    ParamData = <
      item
        Name = 'stock_reference'
      end
      item
        Name = 'form_reference_id'
      end
      item
        Name = 'Old_Form_Reference_id'
      end>
  end
  object CheckFormRef3SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select top 1 customer.name'
      'from Form_Reference'
      
        'inner join customer on form_reference.customer = customer.custom' +
        'er'
      'where Form_Reference.Customer <> :Customer and'
      '          Form_Reference.stock_reference=:stock_reference'
      ' '
      ' ')
    Left = 320
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'stock_reference'
      end>
  end
  object CheckFormRef4SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select form_reference.Form_Reference_Descr'
      'from form_reference'
      'where form_reference.customer = :customer'
      'and form_reference.form_reference_id = :form_reference_id'
      'and form_reference.stock_reference = :stock_reference '
      ' ')
    Left = 376
    Top = 84
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'form_reference_id'
      end
      item
        Name = 'stock_reference'
      end>
  end
  object qryDelEComm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from ecommerce_info '
      'where stock_reference = :stock_reference;')
    Left = 192
    Top = 108
    ParamData = <
      item
        Name = 'stock_reference'
      end>
  end
  object qryECommStockRef: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 * from ecommerce_info '
      'where stock_reference = :stock_reference;')
    Left = 56
    Top = 92
    ParamData = <
      item
        Name = 'stock_reference'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select product_code_prefix'
      'from customer'
      'where customer = :customer')
    Left = 256
    Top = 108
    ParamData = <
      item
        Name = 'customer'
      end>
  end
end
