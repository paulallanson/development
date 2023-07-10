object frmWTMaintOption: TfrmWTMaintOption
  Left = 468
  Top = 141
  BorderStyle = bsDialog
  Caption = 'Rename option'
  ClientHeight = 210
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    527
    210)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
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
    Top = 80
    Width = 85
    Height = 13
    Caption = 'Quote Description'
  end
  object edtDescription: TEdit
    Left = 120
    Top = 44
    Width = 265
    Height = 21
    TabOrder = 1
    Text = 'edtDescription'
    OnChange = EnableOK
  end
  object btnOK: TBitBtn
    Left = 191
    Top = 175
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    TabOrder = 3
    OnClick = btnOKClick
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
  object BitBtn2: TBitBtn
    Left = 279
    Top = 175
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkCancel
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
    Top = 78
    Width = 394
    Height = 74
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 255
    TabOrder = 2
    OnChange = EnableOK
  end
  object dtsOptions: TDataSource
    DataSet = qryOptions
    Left = 312
    Top = 8
  end
  object qryOptions: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'Select *'
      'from Customer_Worktop_Group'
      'WHERE Customer = :Customer'
      'Order by Group_Description')
    Left = 352
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
end
