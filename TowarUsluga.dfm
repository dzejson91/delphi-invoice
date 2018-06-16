object Towar: TTowar
  Left = 281
  Top = 210
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 8
  Caption = 'Dodaj towar lub us'#322'ug'#281
  ClientHeight = 313
  ClientWidth = 443
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    443
    313)
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 0
    Top = 4
    Width = 142
    Height = 16
    Caption = 'Nazwa towaru lub us'#322'ugi'
  end
  object Label2: TLabel
    Left = 43
    Top = 36
    Width = 99
    Height = 16
    Alignment = taRightJustify
    Caption = 'Jednostka miary'
  end
  object Label3: TLabel
    Left = 114
    Top = 68
    Width = 28
    Height = 16
    Alignment = taRightJustify
    Caption = 'Ilo'#347#263
  end
  object Label4: TLabel
    Left = 46
    Top = 100
    Width = 96
    Height = 16
    Alignment = taRightJustify
    Caption = 'Cena jedn. netto'
  end
  object zl1: TLabel
    Left = 216
    Top = 100
    Width = 9
    Height = 16
    Caption = 'z'#322
  end
  object gr1: TLabel
    Left = 304
    Top = 100
    Width = 12
    Height = 16
    Caption = 'gr'
  end
  object Label7: TLabel
    Left = 105
    Top = 132
    Width = 37
    Height = 16
    Alignment = taRightJustify
    Caption = 'Rabat'
  end
  object Label8: TLabel
    Left = 216
    Top = 132
    Width = 12
    Height = 16
    Caption = '%'
  end
  object Label9: TLabel
    Left = 79
    Top = 188
    Width = 63
    Height = 16
    Alignment = taRightJustify
    Caption = 'Wart. netto'
  end
  object zl2: TLabel
    Left = 232
    Top = 188
    Width = 9
    Height = 16
    Caption = 'z'#322
  end
  object Label11: TLabel
    Left = 115
    Top = 156
    Width = 27
    Height = 16
    Alignment = taRightJustify
    Caption = 'VAT'
  end
  object Label12: TLabel
    Left = 216
    Top = 156
    Width = 12
    Height = 16
    Caption = '%'
  end
  object zl3: TLabel
    Left = 232
    Top = 220
    Width = 9
    Height = 16
    Caption = 'z'#322
  end
  object Label14: TLabel
    Left = 81
    Top = 220
    Width = 61
    Height = 16
    Alignment = taRightJustify
    Caption = 'Wart. VAT'
  end
  object zl4: TLabel
    Left = 232
    Top = 252
    Width = 9
    Height = 16
    Caption = 'z'#322
  end
  object Label16: TLabel
    Left = 78
    Top = 252
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = 'Wart.brutto'
  end
  object Label17: TLabel
    Left = 252
    Top = 36
    Width = 42
    Height = 16
    Alignment = taRightJustify
    Caption = 'Waluta'
  end
  object Ust: TSpeedButton
    Left = 376
    Top = 32
    Width = 23
    Height = 22
    Caption = '...'
    Enabled = False
    OnClick = UstClick
  end
  object Label5: TLabel
    Left = 304
    Top = 64
    Width = 3
    Height = 16
  end
  object Eur: TLabel
    Left = 304
    Top = 64
    Width = 3
    Height = 16
    Visible = False
  end
  object Nazwa: TComboBox
    Left = 152
    Top = 0
    Width = 291
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 0
    MaxLength = 255
    TabOrder = 0
  end
  object Jedn: TComboBox
    Left = 152
    Top = 32
    Width = 57
    Height = 24
    ItemHeight = 16
    MaxLength = 10
    TabOrder = 1
    Text = 'FRA'
    Items.Strings = (
      'FRA'
      'SZT')
  end
  object Ilosc: TSpinEdit
    Left = 152
    Top = 64
    Width = 57
    Height = 26
    MaxValue = 9999999
    MinValue = 0
    TabOrder = 2
    Value = 1
    OnChange = PVATChange
  end
  object Zl: TSpinEdit
    Left = 152
    Top = 96
    Width = 57
    Height = 26
    MaxValue = 99999999
    MinValue = 0
    TabOrder = 3
    Value = 0
    OnChange = PVATChange
  end
  object Gr: TSpinEdit
    Left = 256
    Top = 96
    Width = 41
    Height = 26
    MaxValue = 99
    MinValue = 0
    TabOrder = 4
    Value = 0
    OnChange = PVATChange
  end
  object Rabat: TSpinEdit
    Left = 152
    Top = 128
    Width = 57
    Height = 26
    MaxValue = 99
    MinValue = 0
    TabOrder = 5
    Value = 0
    OnChange = PVATChange
  end
  object WartNetto: TEdit
    Left = 152
    Top = 184
    Width = 73
    Height = 24
    Color = cl3DLight
    Enabled = False
    TabOrder = 6
    Text = '0,00'
  end
  object PVAT: TSpinEdit
    Left = 152
    Top = 152
    Width = 57
    Height = 26
    MaxValue = 99
    MinValue = 0
    TabOrder = 7
    Value = 23
    OnChange = PVATChange
  end
  object WartVat: TEdit
    Left = 153
    Top = 218
    Width = 73
    Height = 24
    Color = cl3DLight
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 8
    Text = '0,00'
  end
  object WartBrutto: TEdit
    Left = 152
    Top = 248
    Width = 73
    Height = 24
    TabOrder = 9
    Text = '0,00'
  end
  object Button1: TButton
    Left = 376
    Top = 288
    Width = 67
    Height = 25
    Caption = 'Wyjd'#378
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 288
    Width = 67
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 10
    OnClick = Button2Click
  end
  object Waluta: TComboBox
    Left = 304
    Top = 32
    Width = 65
    Height = 24
    Style = csDropDownList
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 12
    Text = 'PLN'
    OnChange = WalutaChange
    Items.Strings = (
      'PLN'
      'EURO')
  end
  object Button3: TButton
    Left = 247
    Top = 248
    Width = 60
    Height = 24
    Caption = 'przelicz'
    TabOrder = 13
    OnClick = Button3Click
  end
end
