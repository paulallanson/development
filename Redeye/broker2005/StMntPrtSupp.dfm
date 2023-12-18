object STMntPrtSuppFrm: TSTMntPrtSuppFrm
  Left = 131
  Top = 104
  Caption = 'Product Suppliers'
  ClientHeight = 453
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  TextHeight = 13
  object PartLabel: TLabel
    Left = 8
    Top = 8
    Width = 114
    Height = 13
    Caption = 'Suppliers For Product:'
  end
  object Label4: TLabel
    Left = 8
    Top = 360
    Width = 132
    Height = 13
    Caption = 'Drag and Drop to change'
  end
  object PartEdit: TEdit
    Left = 8
    Top = 32
    Width = 193
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object PartDescrEdit: TEdit
    Left = 208
    Top = 32
    Width = 305
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object SuppsListView: TListView
    Left = 264
    Top = 72
    Width = 250
    Height = 281
    Columns = <
      item
        AutoSize = True
        Caption = 'Selected Suppliers'
      end>
    DragMode = dmAutomatic
    TabOrder = 2
    ViewStyle = vsReport
    OnDragDrop = SuppsListViewDragDrop
    OnDragOver = SuppsListViewDragOver
  end
  object AvailListView: TListView
    Left = 6
    Top = 72
    Width = 250
    Height = 281
    Columns = <
      item
        AutoSize = True
        Caption = 'Suppliers'
      end>
    DragMode = dmAutomatic
    TabOrder = 3
    ViewStyle = vsReport
    OnDragDrop = AvailListViewDragDrop
    OnDragOver = AvailListViewDragOver
  end
  object OKBitBtn: TBitBtn
    Left = 360
    Top = 408
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 440
    Top = 408
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object SearchGrpBox: TGroupBox
    Left = 8
    Top = 384
    Width = 249
    Height = 49
    Caption = 'Type here to narrow the search'
    ParentBackground = False
    TabOrder = 6
    object NameEdit: TEdit
      Left = 8
      Top = 16
      Width = 225
      Height = 21
      TabOrder = 0
      OnChange = NameEditChange
    end
  end
  object GetPartSuppsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_Supplier.Supplier,'
      '       Part_Supplier.Branch_No,'
      
        '       (Supplier.Name + '#39', '#39' + Supplier_Branch.Name) as Supplier' +
        '_Name'
      'From  Part_Supplier, Supplier_Branch, Supplier'
      'Where (Part_Supplier.Supplier = Supplier.Supplier) and'
      '      (Part_Supplier.Part = :Part) and'
      '      (Supplier_Branch.Supplier = Part_Supplier.Supplier) and'
      '      (Supplier_Branch.Branch_No = Part_Supplier.Branch_No)'
      'Order By Supplier_Preference_Order')
    Left = 392
    Top = 128
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object GetSuppsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier_Branch.Supplier, Supplier_Branch.Branch_No,'
      
        '       (Supplier.Name + '#39', '#39' + Supplier_Branch.Name) as Supplier' +
        '_Name'
      'From Supplier_Branch, Supplier'
      'Where Supplier.Name like :Name AND'
      '      (Supplier_Branch.Supplier = Supplier.Supplier) and'
      '      (Supplier_Branch.Supplier Not In (Select Supplier'
      '                        From Part_Supplier'
      '                        Where (Part_Supplier.Part = :Part) and'
      
        '                              (Part_Supplier.Supplier = Supplier' +
        '_Branch.Supplier) and'
      
        '                              (Part_Supplier.Branch_No = Supplie' +
        'r_Branch.Branch_No)))'
      'Order By Supplier.Name, Supplier_Branch.Name')
    Left = 136
    Top = 136
    ParamData = <
      item
        Name = 'Name'
      end
      item
        Name = 'Part'
      end>
  end
  object AddSuppQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into  Part_Supplier'
      '(Part, Supplier, Branch_No, Supplier_Preference_Order)'
      'Values'
      '(:Part, :Supplier, :Branch_No, :Supplier_Preference_Order)'
      ' '
      ' '
      ' ')
    Left = 368
    Top = 192
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier_Preference_Order'
      end>
  end
  object DelSuppsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From  Part_Supplier'
      'Where (Part_Supplier.Part = :Part)'
      ' ')
    Left = 352
    Top = 128
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrSearchTimer
    Left = 216
    Top = 136
  end
end
