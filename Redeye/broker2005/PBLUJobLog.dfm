object PBLUJobLogFrm: TPBLUJobLogFrm
  Left = 143
  Top = 112
  Caption = 'Shop Floor Data Capture Raw Data'
  ClientHeight = 441
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object dbgDetails: TDBGrid
    Left = 0
    Top = 0
    Width = 854
    Height = 345
    Align = alClient
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Date_Point'
        Title.Caption = 'Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_bag'
        Title.Caption = 'Job'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer_Name'
        Title.Caption = 'Customer'
        Width = 154
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Process_Group_Description'
        Title.Caption = 'Department'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Process_Description'
        Title.Caption = 'Process'
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Work_Centre_Name'
        Title.Caption = 'Work Centre'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Number_Up'
        Title.Caption = 'Number Up/Inserts'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Job_bag_Description'
        Title.Caption = 'Job Name'
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Paper_Size_Description'
        Title.Caption = 'Paper Size'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Caption = 'Count'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Labour_hours'
        Title.Caption = 'Labour hours'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Machine_Hours'
        Title.Caption = 'Machine Hours'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Operation_Description'
        Title.Caption = 'Operation'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Work_Centre_Operator'
        Title.Caption = 'Machine Operator'
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Labour_Overtime_Hours'
        Title.Caption = 'Labour Overtime'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Labour_Time_From'
        Title.Caption = 'Start Time'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Labour_Time_To'
        Title.Caption = 'Finish Time'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Activity'
        Title.Caption = 'Non Job Bag Code'
        Width = 102
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 345
    Width = 854
    Height = 36
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      854
      36)
    object Label1: TLabel
      Left = 690
      Top = 12
      Width = 78
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Machine Hours'
      ExplicitLeft = 696
    end
    object Label4: TLabel
      Left = 530
      Top = 12
      Width = 80
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Overtime Hours'
      ExplicitLeft = 536
    end
    object Label5: TLabel
      Left = 362
      Top = 12
      Width = 81
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Standard Hours'
      ExplicitLeft = 368
    end
    object lblDateFrom: TLabel
      Left = 16
      Top = 12
      Width = 24
      Height = 13
      Caption = 'Date'
    end
    object memMachine: TMemo
      Left = 770
      Top = 8
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Lines.Strings = (
        '0.00')
      TabOrder = 0
      WantReturns = False
      WordWrap = False
    end
    object memOvertime: TMemo
      Left = 610
      Top = 8
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Lines.Strings = (
        '0.00')
      TabOrder = 1
      WantReturns = False
      WordWrap = False
    end
    object memLabour: TMemo
      Left = 450
      Top = 8
      Width = 65
      Height = 21
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Lines.Strings = (
        '0.00')
      TabOrder = 2
      WantReturns = False
      WordWrap = False
    end
    object dtmDateFrom: TDateTimePicker
      Left = 72
      Top = 8
      Width = 89
      Height = 21
      Date = 39825.000000000000000000
      Time = 0.441564409717102500
      TabOrder = 3
      OnChange = dtmDateFromChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 381
    Width = 854
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object lblSearch: TLabel
      Left = 16
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Employee'
    end
    object edtSearch: TEdit
      Left = 72
      Top = 12
      Width = 161
      Height = 21
      TabOrder = 0
      OnChange = edtSearchChange
    end
    object btnSearch: TBitBtn
      Left = 256
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Search'
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object Panel2: TPanel
      Left = 576
      Top = 1
      Width = 277
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        277
        39)
      object btnClose: TButton
        Left = 192
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Close'
        TabOrder = 0
        OnClick = btnCloseClick
      end
      object btnExcel: TBitBtn
        Left = 10
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Excel'
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
        TabOrder = 1
        OnClick = btnExcelClick
      end
    end
  end
  object stsbrDetails: TStatusBar
    Left = 0
    Top = 422
    Width = 854
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 200
      end>
  end
  object tmrSearch: TTimer
    OnTimer = tmrSearchTimer
    Left = 440
    Top = 120
  end
  object Query1: TFDQuery
    Left = 248
    Top = 120
  end
end
