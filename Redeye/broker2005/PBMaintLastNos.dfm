object PBMaintLastNosFrm: TPBMaintLastNosFrm
  Left = 456
  Top = 156
  BorderStyle = bsDialog
  Caption = 'Maintain Sequence Number'
  ClientHeight = 335
  ClientWidth = 481
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  TextHeight = 13
  object CancelBitBtn: TBitBtn
    Left = 392
    Top = 288
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object OKBitBtn: TBitBtn
    Left = 304
    Top = 288
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
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
    Width = 465
    Height = 265
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 8
        Top = 21
        Width = 98
        Height = 13
        Caption = 'Last Enquiry Number'
      end
      object Label2: TLabel
        Left = 8
        Top = 84
        Width = 78
        Height = 13
        Caption = 'Last PO Number'
      end
      object Label5: TLabel
        Left = 8
        Top = 116
        Width = 102
        Height = 13
        Caption = 'Last Job Bag Number'
      end
      object Label6: TLabel
        Left = 8
        Top = 148
        Width = 123
        Height = 13
        Caption = 'Last Works Order Number'
      end
      object Label7: TLabel
        Left = 8
        Top = 52
        Width = 92
        Height = 13
        Caption = 'Last Quote Number'
      end
      object Label8: TLabel
        Left = 8
        Top = 180
        Width = 149
        Height = 13
        Caption = 'Last Non Conformance Number'
      end
      object Label9: TLabel
        Left = 8
        Top = 212
        Width = 103
        Height = 13
        Caption = 'Last Contract Number'
      end
      object LastEnqNoSpinEdit: TSpinEdit
        Left = 168
        Top = 16
        Width = 73
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object LastPONoSpinEdit: TSpinEdit
        Left = 168
        Top = 79
        Width = 73
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object LastJBSpinEdit: TSpinEdit
        Left = 168
        Top = 111
        Width = 73
        Height = 22
        MaxLength = 10
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object LastWOSpinEdit: TSpinEdit
        Left = 168
        Top = 143
        Width = 73
        Height = 22
        MaxLength = 10
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 0
      end
      object LastQuoteNoSpinEdit: TSpinEdit
        Left = 168
        Top = 47
        Width = 73
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object LastNCSpinEdit: TSpinEdit
        Left = 168
        Top = 175
        Width = 73
        Height = 22
        MaxLength = 10
        MaxValue = 0
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object LastContractNoSpinEdit: TSpinEdit
        Left = 168
        Top = 207
        Width = 73
        Height = 22
        MaxLength = 10
        MaxValue = 0
        MinValue = 0
        TabOrder = 6
        Value = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Invoicing'
      ImageIndex = 1
      object Label3: TLabel
        Left = 8
        Top = 21
        Width = 98
        Height = 13
        Caption = 'Last Invoice Number'
      end
      object Label4: TLabel
        Left = 8
        Top = 52
        Width = 116
        Height = 13
        Caption = 'Last Credit Note Number'
      end
      object grdDetails: TStringGrid
        Left = 8
        Top = 80
        Width = 441
        Height = 145
        ColCount = 4
        DefaultColWidth = 120
        DefaultRowHeight = 18
        TabOrder = 0
        OnClick = grdDetailsClick
        OnDrawCell = grdDetailsDrawCell
        ColWidths = (
          120
          98
          83
          94)
        RowHeights = (
          18
          18
          18
          18
          18)
      end
      object cmbSuffix: TComboBox
        Left = 192
        Top = 184
        Width = 145
        Height = 21
        ItemIndex = 0
        TabOrder = 1
        Text = 'Suffix'
        Visible = False
        OnClick = cmbSuffixClick
        Items.Strings = (
          'Suffix'
          'Prefix')
      end
      object lastInvNoSpinEdit: TSpinEdit
        Left = 152
        Top = 16
        Width = 73
        Height = 22
        MaxLength = 10
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object LastCreditNoteSpinEdit: TSpinEdit
        Left = 152
        Top = 47
        Width = 73
        Height = 22
        MaxLength = 10
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
    end
  end
  object GetDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_Enquiry_Number, Last_PO_Number,'
      
        '           Last_Invoice_No, Last_Credit_Note_No, Last_Job_Bag_Nu' +
        'mber,'
      '           Last_Works_Order_Number,'
      '           Last_Quote_Number,'
      '           Last_Non_Conform_Number,'
      '           Last_Contract_Number'
      'From Company')
    Left = 296
    Top = 104
  end
  object UpdDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set'
      'Last_Enquiry_Number =:Last_Enq_No,'
      'Last_PO_Number =:Last_PO_No,'
      'Last_Invoice_No =:Last_Inv_No,'
      'Last_Credit_Note_no =:Last_Credit_Note_No,'
      'Last_Job_Bag_Number = :Last_Job_Bag_Number,'
      'Last_Works_Order_Number = :Last_works_order_number,'
      'Last_Quote_Number = :Last_Quote_Number,'
      'Last_Non_Conform_Number = :Last_Non_Conform_Number,'
      'Last_Contract_Number = :Last_Contract_Number'
      '')
    Left = 376
    Top = 48
    ParamData = <
      item
        Name = 'Last_Enq_No'
      end
      item
        Name = 'Last_PO_No'
      end
      item
        Name = 'Last_Inv_No'
      end
      item
        Name = 'Last_Credit_Note_No'
      end
      item
        Name = 'Last_Job_Bag_Number'
      end
      item
        Name = 'Last_works_order_number'
      end
      item
        Name = 'Last_Quote_Number'
      end
      item
        Name = 'Last_Non_Conform_Number'
      end
      item
        Name = 'Last_Contract_Number'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    Left = 296
    Top = 48
  end
  object qryGetCompCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company_Category.*,'
      'Category.Description'
      'from Company_Category, Category'
      'where Company_Category.Category = Category.Category and'
      'Company_Category.Inactive = '#39'N'#39
      'Order by Category.Description')
    Left = 300
    Top = 168
  end
  object qryUpdCompCat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Company_Category'
      'set Last_Invoice_No = :Last_Invoice_No,'
      'Suffix_or_Prefix = :Suffix_or_Prefix,'
      'Suffix_or_Prefix_Value = :Suffix_or_Prefix_Value'
      'Where Company = :Company and'
      'Category = :Category')
    Left = 380
    Top = 104
    ParamData = <
      item
        Name = 'Last_Invoice_No'
      end
      item
        Name = 'Suffix_or_Prefix'
      end
      item
        Name = 'Suffix_or_Prefix_Value'
      end
      item
        Name = 'Company'
      end
      item
        Name = 'Category'
      end>
  end
end
