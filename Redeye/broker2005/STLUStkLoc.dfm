object STLUStkLocFrm: TSTLUStkLocFrm
  Left = 148
  Top = 213
  AutoScroll = False
  Caption = 'Stock Locations'
  ClientHeight = 283
  ClientWidth = 652
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
    ParentBackground = False
    Left = 0
    Top = 0
    Width = 652
    Height = 223
    Align = alClient
    TabOrder = 0
    object dbgrdLocations: TDBGrid
      Left = 1
      Top = 33
      Width = 650
      Height = 189
      Align = alClient
      DefaultDrawing = False
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = pmnStock
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = dbgrdLocationsDrawColumnCell
      OnDblClick = dbgrdLocationsDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Part'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Part_Description'
          Title.Caption = 'Description'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Part_Store_Name'
          Title.Caption = 'Store'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Part_Bin'
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
          FieldName = 'Store_Stock_Description'
          Title.Caption = 'Order Reference'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Qty_in_Stock'
          Title.Caption = 'Qty in Stock'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Qty_Allocated'
          Title.Caption = 'Qty Allocated'
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Free_Stock'
          Title.Caption = 'Free Stock'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Received'
          Title.Caption = 'Date Received'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Store_Cost'
          Title.Caption = 'Stock Cost'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Pallet_ID'
          Title.Caption = 'Pallet ID'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Stock_is_Overs'
          Title.Caption = 'Overs'
          Width = 34
          Visible = True
        end>
    end
    object pnlPart: TPanel
      ParentBackground = False
      Left = 1
      Top = 1
      Width = 650
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblPartDesc: TLabel
        Left = 184
        Top = 8
        Width = 54
        Height = 13
        Caption = 'lblPartDesc'
      end
      object lblPartCode: TLabel
        Left = 64
        Top = 8
        Width = 54
        Height = 13
        Caption = 'lblPartCode'
      end
      object lblPart: TLabel
        Left = 8
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Product:'
      end
    end
  end
  object pnlFooter: TPanel
    ParentBackground = False
    Left = 0
    Top = 223
    Width = 652
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      652
      41)
    object Label1: TLabel
      Left = 12
      Top = 12
      Width = 250
      Height = 15
      Caption = 'Stock items in red have been invoiced upfront.'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object pnlButton: TPanel
      ParentBackground = False
      Left = 547
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 264
    Width = 652
    Height = 19
    Panels = <>
  end
  object pmnStock: TPopupMenu
    Left = 368
    Top = 88
    object SerialNumbers1: TMenuItem
      Caption = 'Serial Numbers'
      OnClick = SerialNumbers1Click
    end
    object ManageStockRecord1: TMenuItem
      Caption = 'Manage Stock Record'
      OnClick = ManageStockRecord1Click
    end
  end
end
