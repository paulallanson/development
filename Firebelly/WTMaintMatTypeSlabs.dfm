object frmWTMaintMatTypeSlabs: TfrmWTMaintMatTypeSlabs
  Left = 307
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Maintain Slab Sizes'
  ClientHeight = 204
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  DesignSize = (
    332
    204)
  TextHeight = 17
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 39
    Height = 17
    Caption = 'Length'
  end
  object Label3: TLabel
    Left = 16
    Top = 60
    Width = 35
    Height = 17
    Caption = 'Depth'
  end
  object Label2: TLabel
    Left = 179
    Top = 24
    Width = 22
    Height = 17
    Caption = 'mm'
  end
  object Label4: TLabel
    Left = 179
    Top = 64
    Width = 22
    Height = 17
    Caption = 'mm'
  end
  object Label5: TLabel
    Left = 16
    Top = 100
    Width = 66
    Height = 17
    Caption = 'Description'
  end
  object btnOK: TBitBtn
    Left = 89
    Top = 151
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOKClick
  end
  object BitBtn2: TBitBtn
    Left = 169
    Top = 151
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    TabOrder = 1
  end
  object edtLength: TCREditInt
    Left = 96
    Top = 16
    Width = 80
    Height = 25
    TabOrder = 2
    Text = 'edtLength'
    OnChange = EnableOK
  end
  object edtDepth: TCREditInt
    Left = 96
    Top = 56
    Width = 80
    Height = 25
    TabOrder = 3
    Text = 'edtDepth'
    OnChange = EnableOK
  end
  object edtSlabSizeDescription: TEdit
    Left = 96
    Top = 96
    Width = 185
    Height = 25
    TabOrder = 4
    Text = 'edtSlabSizeDescription'
  end
  object qryUpdate: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'UPDATE Material_Type_Slab_Size'
      'SET'
      '  Slab_Size_Description = :Slab_Size_Description,'
      '  Length = :Length,'
      '  Depth = :Depth'
      'WHERE'
      '  Slab_Size = :Slab_Size')
    Left = 256
    Top = 80
    ParamData = <
      item
        Name = 'Slab_Size_Description'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Slab_Size'
      end>
  end
  object qryAdd: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Insert Into Material_Type_Slab_Size'
      '( Slab_Size_Description,'
      '  Length,'
      '  Depth,'
      '  Material_Type'
      ')'
      'Values'
      '( :Slab_Size_Description,'
      '  :Length,'
      '  :Depth,'
      '  :Material_Type'
      ')')
    Left = 256
    Top = 24
    ParamData = <
      item
        Name = 'Slab_Size_Description'
      end
      item
        Name = 'Length'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Material_Type'
      end>
  end
end
