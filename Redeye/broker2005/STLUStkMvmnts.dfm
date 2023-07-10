object STLUStkMvmntsFrm: TSTLUStkMvmntsFrm
  Left = 40
  Top = 199
  AutoScroll = False
  Caption = 'Stock Movements'
  ClientHeight = 330
  ClientWidth = 685
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 685
    Height = 289
    Align = alClient
    TabOrder = 0
    object dbgrdMvmnts: TDBGrid
      Left = 1
      Top = 49
      Width = 683
      Height = 239
      Align = alClient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Date_received'
          Title.Caption = 'Date'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Store_Name'
          Title.Caption = 'Store'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Movement_Bin'
          Title.Caption = 'Bin'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Store_Lot'
          Title.Caption = 'Lot'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Move_Type_Descr'
          Title.Caption = 'Move Type'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Movement_Reference'
          Title.Caption = 'Reference'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Stock_Pack_Quantity'
          Title.Caption = 'Pack'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_Quantity'
          Title.Caption = 'Quantity'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_cost'
          Title.Caption = 'Value'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Store_Total_Quantity'
          Title.Caption = 'Stock Balance'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Audit_User'
          Title.Caption = 'User Name'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Audit_Workstation'
          Title.Caption = 'Workstation'
          Width = 86
          Visible = True
        end>
    end
    object pnlPart: TPanel
      Left = 1
      Top = 1
      Width = 683
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        683
        48)
      object lblPartDesc: TLabel
        Left = 240
        Top = 8
        Width = 273
        Height = 13
        AutoSize = False
        Caption = 'lblPartDesc'
      end
      object lblPartCode: TLabel
        Left = 64
        Top = 8
        Width = 169
        Height = 13
        AutoSize = False
        Caption = 'lblPartCode'
      end
      object lblPart: TLabel
        Left = 8
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Product:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 528
        Top = 8
        Width = 55
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Total Stock'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 528
        Top = 24
        Width = 52
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Free Stock'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblTotalStock: TLabel
        Left = 608
        Top = 8
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'lblTotalStock'
      end
      object lblFreeStock: TLabel
        Left = 611
        Top = 24
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'lblFreeStock'
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 289
    Width = 685
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      685
      41)
    object pnlButton: TPanel
      Left = 580
      Top = 1
      Width = 104
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btbtnClose: TBitBtn
        Left = 16
        Top = 8
        Width = 75
        Height = 25
        TabOrder = 0
        Kind = bkClose
      end
    end
    object btnExcel: TBitBtn
      Left = 456
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Excel'
      Enabled = False
      TabOrder = 1
      OnClick = btnExcelClick
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
        FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
        00000000000000000000A4070707000707070707070700070707A40707070007
        07000700070700070707A4070707000707000000070700070707A40707070007
        07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
    end
  end
end
