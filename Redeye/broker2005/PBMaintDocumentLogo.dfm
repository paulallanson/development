object frmPBMaintDocumentLogos: TfrmPBMaintDocumentLogos
  Left = 422
  Top = 181
  BorderStyle = bsDialog
  Caption = 'Document Logos'
  ClientHeight = 198
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    608
    198)
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label7: TLabel
    Left = 16
    Top = 59
    Width = 29
    Height = 13
    Caption = 'Image'
  end
  object Label2: TLabel
    Left = 16
    Top = 91
    Width = 76
    Height = 13
    Caption = 'Document Type'
  end
  object btnOK: TBitBtn
    Left = 218
    Top = 160
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 314
    Top = 160
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 2
  end
  object edtLogoName: TEdit
    Left = 102
    Top = 20
    Width = 185
    Height = 21
    TabOrder = 0
    Text = 'edtLogoName'
    OnChange = EnableOK
  end
  object edtLogoPath: TEdit
    Left = 104
    Top = 55
    Width = 385
    Height = 21
    TabOrder = 3
    Text = 'edtLogoPath'
    OnChange = EnableOK
  end
  object Button3: TButton
    Left = 497
    Top = 53
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 4
    OnClick = Button3Click
  end
  object chkbxInactive: TCheckBox
    Left = 16
    Top = 129
    Width = 97
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Inactive'
    TabOrder = 5
  end
  object cmbDocumentType: TComboBox
    Left = 104
    Top = 88
    Width = 145
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 6
    OnChange = EnableOK
    Items.Strings = (
      'Delivery Notes'
      'Labels')
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Document_Logo'
      'SET'
      '      Logo_Name = :Logo_Name,'
      '      Logo_Path = :Logo_Path,'
      '      Document_Type = :Document_Type,'
      '      inActive = :inactive'
      'WHERE'
      '  ID = :ID')
    Left = 96
    Top = 112
    ParamData = <
      item
        Name = 'Logo_Name'
      end
      item
        Name = 'Logo_Path'
      end
      item
        Name = 'Document_Type'
      end
      item
        Name = 'inactive'
      end
      item
        Name = 'ID'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Document_Logo'
      '('
      '      Logo_Name,'
      '      Logo_Path,'
      '      Document_Type,'
      '      inActive'
      ')'
      'Values'
      '('
      '      :Logo_Name,'
      '      :Logo_Path,'
      '      :Document_Type,'
      '      :inActive'
      ')'
      ' ')
    Left = 144
    Top = 112
    ParamData = <
      item
        Name = 'Logo_Name'
      end
      item
        Name = 'Logo_Path'
      end
      item
        Name = 'Document_Type'
      end
      item
        Name = 'inactive'
      end>
  end
  object qryGetLast: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select max(ID) as Last_ID'
      'From Document_Logo')
    Left = 192
    Top = 112
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'All (*.apf;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.apf;*.jpg;*.j' +
      'peg;*.bmp;*.ico;*.emf;*.wmf;*.png|APRO APF Format (*.apf)|*.apf|' +
      'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bi' +
      'tmaps (*.bmp)|*.bmp|Icons (*.ico)|*.ico|Enhanced Metafiles (*.em' +
      'f)|*.emf|Metafiles (*.wmf)|*.wmf'
    Left = 408
    Top = 88
  end
end
