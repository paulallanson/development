object frmWTRSContract: TfrmWTRSContract
  Left = 215
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Print Contract Quotes'
  ClientHeight = 221
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    441
    221)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Quote No'#39's'
  end
  object memSelection: TMemo
    Left = 8
    Top = 24
    Width = 337
    Height = 73
    ReadOnly = True
    TabOrder = 0
    OnChange = EnableRun
  end
  object btnPrint: TButton
    Left = 8
    Top = 184
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Print'
    Enabled = False
    TabOrder = 1
    OnClick = btnPrintClick
  end
  object Button4: TButton
    Left = 360
    Top = 184
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button4Click
  end
  object chkbxprintLogo: TCheckBox
    Left = 8
    Top = 104
    Width = 97
    Height = 17
    Caption = 'Print your logo'
    TabOrder = 3
  end
  object SelectLst: TListBox
    Left = 200
    Top = 8
    Width = 25
    Height = 105
    ItemHeight = 13
    Sorted = True
    TabOrder = 4
    Visible = False
  end
  object btnPreview: TButton
    Left = 96
    Top = 184
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'P&review'
    Enabled = False
    TabOrder = 5
    OnClick = btnPreviewClick
  end
  object btnEmail: TButton
    Left = 184
    Top = 184
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Email'
    Enabled = False
    TabOrder = 6
    OnClick = btnEmailClick
  end
  object chkbxIncludeTemplating: TCheckBox
    Left = 8
    Top = 128
    Width = 345
    Height = 17
    Caption = 'Include Template && Fitting Charges in Option prices'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object btnExcel: TBitBtn
    Left = 274
    Top = 184
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Excel'
    TabOrder = 8
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
  object pnlExportPrgrss: TPanel
    Left = 84
    Top = 55
    Width = 289
    Height = 61
    TabOrder = 9
    Visible = False
    object lblExporting: TLabel
      Left = 16
      Top = 12
      Width = 53
      Height = 13
      Caption = 'Exporting...'
    end
    object prgbrExport: TProgressBar
      Left = 16
      Top = 32
      Width = 257
      Height = 16
      Step = 1
      TabOrder = 0
    end
  end
  object OleContainer1: TOleContainer
    Left = 196
    Top = 27
    Width = 129
    Height = 89
    Caption = 'OleContainer1'
    Color = clBtnFace
    TabOrder = 10
    Visible = False
  end
  object chkbxValue: TCheckBox
    Left = 8
    Top = 152
    Width = 345
    Height = 17
    Caption = 'Value document based on Units per Drawing'
    TabOrder = 11
  end
  object qryGetQuotes: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Quote.Quote,'
      '        Quote.Customer,'
      '        Quote.Customer_Name,'
      '        Quote.Contact_Name,'
      '        Customer.Fax_number as Customer_Fax,'
      '        Customer.Email_Address as Customer_Email,'
      '        Customer.Is_Retail_Customer,'
      '        Address.Fax_number,'
      '        Address.Email_Address'
      'FROM Int_Sel'
      '      INNER JOIN (Address'
      '      RIGHT JOIN (Customer'
      '      INNER JOIN Quote ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Address.Address = Quote.Address) ON'
      '        Int_Sel.Sel1 = Quote.Quote'
      'WHERE Int_Sel.Int_Sel_Code = :Int_Sel_Code')
    Left = 136
    Top = 50
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object qryGetRange: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT distinct Quote.Quote'
      'FROM Quote'
      'WHERE'
      '  (Quote >= :From_Quote) and'
      '  (Quote <= :To_Quote)')
    Left = 264
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'From_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'To_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQuoteMaterial: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'SELECT  TOP 1'
      '        Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description as Colour_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Worktop_Type.Worktop_Type,'
      '        Worktop_Type.Description AS Worktop_Material'
      'FROM Worktop_Type'
      '      RIGHT JOIN (Material_Type'
      '      INNER JOIN ((Quote_Element'
      '      LEFT JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness)'
      '      LEFT JOIN Worktop'
      '        ON Quote_Element.Worktop = Worktop.Worktop)'
      
        '        ON Material_Type.Material_Type = Quote_Element.Material_' +
        'type)'
      
        '        ON Worktop_Type.Worktop_Type = Material_Type.Worktop_Typ' +
        'e'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 51
    Top = 38
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
end
