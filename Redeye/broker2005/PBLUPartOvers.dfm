object PBLUPartOversFrm: TPBLUPartOversFrm
  Left = 307
  Top = 137
  BorderStyle = bsDialog
  Caption = 'Lookup Production Overs'
  ClientHeight = 327
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 288
    Width = 645
    Height = 39
    Align = alBottom
    TabOrder = 0
    object btnSelect: TBitBtn
      Left = 467
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Select'
      Default = True
      TabOrder = 0
      OnClick = btnSelectClick
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
      Left = 553
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 65
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 40
      Height = 13
      Caption = 'Product:'
    end
    object Label2: TLabel
      Left = 16
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
    object lblProduct: TLabel
      Left = 88
      Top = 16
      Width = 47
      Height = 13
      Caption = 'lblProduct'
    end
    object lblDescription: TLabel
      Left = 88
      Top = 40
      Width = 63
      Height = 13
      Caption = 'lblDescription'
    end
    object Label3: TLabel
      Left = 472
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Quantity:'
    end
    object lblQuantity: TLabel
      Left = 544
      Top = 16
      Width = 49
      Height = 13
      Caption = 'lblQuantity'
    end
  end
  object sgDetails: TStringGrid
    Left = 0
    Top = 65
    Width = 645
    Height = 223
    Align = alClient
    ColCount = 6
    DefaultColWidth = 50
    DefaultRowHeight = 19
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goTabs, goRowSelect]
    TabOrder = 2
    ColWidths = (
      50
      93
      86
      88
      107
      113)
  end
  object qryOvers: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part_Movement.*'
      'from Part_Movement'
      
        'where Part_Movement.Part = :Part and Part_Movement_Type = '#39'J'#39' an' +
        'd'
      'Part_Movement.date_received < :Date_Received'
      'Order By Part_Movement desc')
    Left = 432
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Received'
        ParamType = ptUnknown
      end>
  end
end
