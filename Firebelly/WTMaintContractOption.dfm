object frmWTMaintContractOption: TfrmWTMaintContractOption
  Left = 468
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Rename option'
  ClientHeight = 233
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    527
    233)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 78
    Width = 36
    Height = 13
    Caption = 'Caption'
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Option'
  end
  object Label3: TLabel
    Left = 16
    Top = 110
    Width = 85
    Height = 13
    Caption = 'Quote Description'
  end
  object Label4: TLabel
    Left = 16
    Top = 48
    Width = 49
    Height = 13
    Caption = 'Thickness'
  end
  object edtDescription: TEdit
    Left = 120
    Top = 74
    Width = 265
    Height = 21
    TabOrder = 3
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object btnOK: TBitBtn
    Left = 191
    Top = 198
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
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
    TabOrder = 5
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 279
    Top = 198
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 6
    OnClick = BitBtn2Click
  end
  object dblkpOptions: TDBLookupComboBox
    Left = 120
    Top = 12
    Width = 177
    Height = 21
    KeyField = 'Group_Number'
    ListField = 'Group_Description'
    ListSource = dtsOptions
    TabOrder = 0
    OnClick = dblkpOptionsClick
  end
  object edtQuoteDescription: TMemo
    Left = 120
    Top = 108
    Width = 394
    Height = 74
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 255
    TabOrder = 4
    OnChange = EnableOK
  end
  object btnOptions: TBitBtn
    Left = 310
    Top = 11
    Width = 22
    Height = 22
    Hint = 'Search for Customer'
    Anchors = [akTop, akRight]
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 1
    OnClick = btnOptionsClick
  end
  object dblkpThickness: TDBLookupComboBox
    Left = 120
    Top = 44
    Width = 121
    Height = 21
    KeyField = 'Thickness'
    ListField = 'Thickness_mm'
    ListSource = dtsOptionThickness
    TabOrder = 2
    OnClick = dblkpThicknessClick
  end
  object dtsOptions: TDataSource
    DataSet = qryOptions
    Left = 424
    Top = 8
  end
  object qryOptions: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select *'
      'from Customer_Worktop_Group'
      'WHERE Customer = :Customer'
      'Order by Group_Description')
    Left = 480
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object qryOptionThickness: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Customer_Worktop_Group_Thick.Customer,'
      '        Customer_Worktop_Group_Thick.Group_Number,'
      '        Customer_Worktop_Group_Thick.Thickness,'
      '        Thickness.Thickness_mm, Thickness.inactive'
      'FROM Thickness'
      '      INNER JOIN Customer_Worktop_Group_Thick'
      
        '        ON Thickness.Thickness = Customer_Worktop_Group_Thick.Th' +
        'ickness'
      'WHERE Customer = :Customer AND'
      '      Group_Number = :Group_Number'
      'ORDER BY Thickness.Thickness_mm')
    Left = 480
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Group_Number'
      end>
  end
  object dtsOptionThickness: TDataSource
    DataSet = qryOptionThickness
    Left = 424
    Top = 64
  end
end
