object Kontrahent: TKontrahent
  Left = 214
  Top = 176
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Dane kontrahent'#243'w'
  ClientHeight = 426
  ClientWidth = 581
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    581
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object Edycja: TLabel
    Left = 232
    Top = 399
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
    ExplicitTop = 347
  end
  object Label12: TLabel
    Left = 8
    Top = 4
    Width = 49
    Height = 13
    Caption = 'Wyszukaj:'
  end
  object Lista: TListView
    Left = 0
    Top = 23
    Width = 581
    Height = 194
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Identyfikator'
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = 'W'#322'a'#347'ciciel'
        Width = 190
      end
      item
        Alignment = taCenter
        Caption = 'NIP'
        Width = 110
      end
      item
        Alignment = taCenter
        Caption = 'Miasto'
        Width = 150
      end>
    ColumnClick = False
    FullDrag = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = ListaChange
    OnClick = ListaClick
  end
  object Pages: TPageControl
    Left = 0
    Top = 223
    Width = 581
    Height = 165
    ActivePage = TabSheet1
    Align = alCustom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    OnExit = PagesExit
    object TabSheet1: TTabSheet
      Caption = 'Dane podstawowe'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 61
        Height = 13
        Caption = 'Identyfikator:'
      end
      object Label2: TLabel
        Left = 8
        Top = 72
        Width = 67
        Height = 13
        Caption = 'Kod pocztowy'
      end
      object Label3: TLabel
        Left = 160
        Top = 72
        Width = 31
        Height = 13
        Caption = 'Miasto'
      end
      object Label4: TLabel
        Left = 56
        Top = 40
        Width = 18
        Height = 13
        Caption = 'NIP'
      end
      object Label5: TLabel
        Left = 392
        Top = 72
        Width = 24
        Height = 13
        Caption = 'Ulica'
      end
      object Label6: TLabel
        Left = 240
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nazwa'
      end
      object Label9: TLabel
        Left = 8
        Top = 104
        Width = 68
        Height = 13
        Caption = 'Nr domu / lok.'
      end
      object Label10: TLabel
        Left = 168
        Top = 104
        Width = 67
        Height = 13
        Caption = 'Wojew'#243'dztwo'
      end
      object Label11: TLabel
        Left = 392
        Top = 104
        Width = 37
        Height = 13
        Caption = 'Oddzia'#322
      end
      object Ident: TEdit
        Left = 88
        Top = 4
        Width = 121
        Height = 21
        MaxLength = 128
        TabOrder = 0
        OnExit = IdentExit
      end
      object Kod: TMaskEdit
        Left = 96
        Top = 68
        Width = 57
        Height = 21
        EditMask = '99-999;0;_'
        MaxLength = 6
        TabOrder = 4
        OnExit = IdentExit
      end
      object Miasto: TEdit
        Left = 208
        Top = 68
        Width = 169
        Height = 21
        MaxLength = 128
        TabOrder = 5
        OnExit = IdentExit
      end
      object Ulica: TEdit
        Left = 432
        Top = 68
        Width = 137
        Height = 21
        MaxLength = 128
        TabOrder = 6
        OnExit = IdentExit
      end
      object Nazwa1: TEdit
        Left = 288
        Top = 4
        Width = 281
        Height = 21
        MaxLength = 255
        TabOrder = 2
        OnExit = IdentExit
      end
      object Nazwa2: TEdit
        Left = 288
        Top = 36
        Width = 281
        Height = 21
        MaxLength = 255
        TabOrder = 3
        OnExit = IdentExit
      end
      object NIP: TMaskEdit
        Left = 88
        Top = 34
        Width = 118
        Height = 21
        EditMask = '>cc 9999999999;0;_'
        MaxLength = 13
        TabOrder = 1
        Text = 'PL'
        OnExit = IdentExit
      end
      object NrDomu: TEdit
        Left = 96
        Top = 100
        Width = 57
        Height = 21
        MaxLength = 20
        TabOrder = 7
        OnExit = IdentExit
      end
      object Oddzial: TEdit
        Left = 448
        Top = 100
        Width = 121
        Height = 21
        MaxLength = 128
        TabOrder = 9
        OnExit = IdentExit
      end
      object Wojew: TComboBox
        Left = 256
        Top = 100
        Width = 121
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 8
        OnExit = IdentExit
        Items.Strings = (
          ''
          'dolno'#347'l'#261'skie'
          'kujawsko-pomorskie'
          'lubelskie'
          'lubuskie'
          #322#243'dzkie'
          'ma'#322'opolskie'
          'mazowieckie'
          'opolskie'
          'podkarpackie'
          'podlaskie'
          'pomorskie'
          #347'l'#261'skie'
          #347'wi'#281'tokrzyskie'
          'warmi'#324'sko-mazurskie'
          'wielkopolskie'
          'zachodniopomorskie')
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Bank'
      ImageIndex = 1
      object Label7: TLabel
        Left = 104
        Top = 24
        Width = 33
        Height = 13
        Caption = 'Nazwa'
      end
      object Label8: TLabel
        Left = 96
        Top = 56
        Width = 41
        Height = 13
        Caption = 'Nr konta'
      end
      object BNazwa: TEdit
        Left = 152
        Top = 20
        Width = 289
        Height = 21
        MaxLength = 255
        TabOrder = 0
        OnExit = IdentExit
      end
      object BNumer: TMaskEdit
        Left = 152
        Top = 52
        Width = 289
        Height = 21
        EditMask = '99 9999 9999 9999 9999 9999 9999;0;_'
        MaxLength = 32
        TabOrder = 1
        OnExit = IdentExit
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Uwagi'
      ImageIndex = 2
      object Uwagi: TMemo
        Left = 0
        Top = 0
        Width = 573
        Height = 137
        Align = alClient
        MaxLength = 255
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnEnter = IdentExit
      end
    end
  end
  object Button2: TButton
    Left = 144
    Top = 393
    Width = 73
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Dodaj'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 8
    Top = 393
    Width = 129
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Usu'#324' zaznaczony'
    Enabled = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 480
    Top = 393
    Width = 93
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Zapisz i wyjd'#378
    TabOrder = 4
    OnClick = Button3Click
  end
  object Search: TEdit
    Left = 63
    Top = 0
    Width = 518
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    OnChange = SearchChange
  end
end
