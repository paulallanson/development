object PBMaintInterfFrm: TPBMaintInterfFrm
  Left = 145
  Top = 155
  BorderStyle = bsSingle
  Caption = 'Maintain Interfaces'
  ClientHeight = 291
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 13
  object CancelBitBtn: TBitBtn
    Left = 291
    Top = 256
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object OKBitBtn: TBitBtn
    Left = 203
    Top = 256
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
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
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 553
    Height = 233
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Accounts'
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 521
        Height = 185
        ParentBackground = False
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 28
          Width = 43
          Height = 13
          Caption = 'Package'
        end
        object Label1: TLabel
          Left = 7
          Top = 60
          Width = 74
          Height = 13
          Caption = 'Import Directory'
        end
        object Label2: TLabel
          Left = 8
          Top = 92
          Width = 75
          Height = 13
          Caption = 'Export Directory'
        end
        object Label3: TLabel
          Left = 8
          Top = 125
          Width = 104
          Height = 13
          Caption = 'Last File No (invoices)'
        end
        object Label4: TLabel
          Left = 8
          Top = 157
          Width = 109
          Height = 13
          Caption = 'Last File No (accounts)'
        end
        object Label8: TLabel
          Left = 280
          Top = 125
          Width = 121
          Height = 13
          Caption = 'Last File No (Direct Debit)'
        end
        object AccPkgDBLookupComboBox: TDBLookupComboBox
          Left = 112
          Top = 24
          Width = 193
          Height = 21
          KeyField = 'Accounts_Package'
          ListField = 'Accounts_Package_Description'
          ListSource = AccPkgSRC
          TabOrder = 0
          OnClick = EnableOK
        end
        object ImportEdit: TEdit
          Left = 112
          Top = 56
          Width = 305
          Height = 21
          MaxLength = 50
          ReadOnly = True
          TabOrder = 1
          OnChange = EnableOK
        end
        object ExportEdit: TEdit
          Left = 112
          Top = 88
          Width = 305
          Height = 21
          MaxLength = 50
          ReadOnly = True
          TabOrder = 2
          OnChange = EnableOK
        end
        object BrowseBitBtn: TBitBtn
          Left = 422
          Top = 55
          Width = 75
          Height = 25
          Caption = 'Browse'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = BrowseBitBtnClick
        end
        object browse2BitBtn: TBitBtn
          Left = 422
          Top = 87
          Width = 75
          Height = 25
          Caption = 'Browse'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = browse2BitBtnClick
        end
        object LastFileInvSpinEdit: TSpinEdit
          Left = 152
          Top = 120
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
        object LastFileAccSpinEdit: TSpinEdit
          Left = 152
          Top = 152
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
        end
        object LastFileDDSpinEdit: TSpinEdit
          Left = 424
          Top = 120
          Width = 73
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 7
          Value = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Scheduling'
      ImageIndex = 1
      object GroupBox3: TGroupBox
        Left = 8
        Top = 8
        Width = 521
        Height = 57
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          521
          57)
        object Label7: TLabel
          Left = 8
          Top = 28
          Width = 43
          Height = 13
          Caption = 'Package'
        end
        object dblkpSchedule: TDBLookupComboBox
          Left = 112
          Top = 24
          Width = 193
          Height = 21
          KeyField = 'Schedule_Package'
          ListField = 'Schedule_Package_Name'
          ListSource = dtsSchedPackage
          TabOrder = 0
          OnClick = EnableOK
        end
        object BitBtn3: TBitBtn
          Left = 314
          Top = 22
          Width = 23
          Height = 24
          Hint = 'Clear Schedule Package'
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtn3Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Data Transfer'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 521
        Height = 57
        ParentBackground = False
        TabOrder = 0
        object Label6: TLabel
          Left = 7
          Top = 28
          Width = 84
          Height = 13
          Caption = 'Transfer Directory'
        end
        object edtDataTransfer: TEdit
          Left = 112
          Top = 24
          Width = 305
          Height = 21
          MaxLength = 50
          ReadOnly = True
          TabOrder = 0
          OnChange = EnableOK
        end
        object btnBrowse: TBitBtn
          Left = 422
          Top = 23
          Width = 75
          Height = 25
          Caption = 'Browse'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnBrowseClick
        end
      end
    end
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Data_Import_Directory, Data_Export_Directory,'
      
        '       Last_File_No_Inv, Last_File_No_Acc, Accounts_Package, Dat' +
        'a_Transfer_Directory, Schedule_Package,'
      '       Last_File_No_Direct_Debit'
      'From Company')
    Left = 352
    Top = 120
  end
  object UpdDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set'
      'Data_Import_Directory = :Data_Import_Directory,'
      'Data_Export_Directory = :Data_Export_Directory,'
      'Last_File_No_Inv = :Last_File_No_Inv,'
      'Last_File_No_Acc = :Last_File_No_Acc,'
      'Accounts_Package = :Accounts_Package,'
      'Data_Transfer_Directory = :Data_Transfer_Directory,'
      'Schedule_Package = :Schedule_Package,'
      'Last_File_No_Direct_Debit = :Last_File_No_Direct_Debit'
      '')
    Left = 264
    Top = 120
    ParamData = <
      item
        Name = 'Data_Import_Directory'
      end
      item
        Name = 'Data_Export_Directory'
      end
      item
        Name = 'Last_File_No_Inv'
      end
      item
        Name = 'Last_File_No_Acc'
      end
      item
        Name = 'Accounts_Package'
      end
      item
        Name = 'Data_Transfer_Directory'
      end
      item
        Name = 'Schedule_Package'
        DataType = ftInteger
      end
      item
        Name = 'Last_File_No_Direct_Debit'
      end>
  end
  object AccPkgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Accounts_Package')
    Left = 360
    Top = 16
  end
  object AccPkgSRC: TDataSource
    DataSet = AccPkgSQL
    Left = 392
    Top = 16
  end
  object qrySchedPackage: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Schedule_Package')
    Left = 496
    Top = 80
  end
  object dtsSchedPackage: TDataSource
    DataSet = qrySchedPackage
    Left = 496
    Top = 24
  end
end
