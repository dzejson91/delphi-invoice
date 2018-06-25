object Wystaw: TWystaw
  Left = 188
  Top = 187
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  BorderWidth = 8
  Caption = 'Wystaw faktur'#281
  ClientHeight = 452
  ClientWidth = 719
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    719
    452)
  PixelsPerInch = 96
  TextHeight = 16
  object Clos: TButton
    Left = 660
    Top = 427
    Width = 59
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Wyjd'#378
    TabOrder = 4
    OnClick = ClosClick
  end
  object Pages1: TPageControl
    Left = 0
    Top = 0
    Width = 719
    Height = 202
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Nag'#322#243'wek'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Pages2: TPageControl
        Left = 0
        Top = 0
        Width = 711
        Height = 171
        ActivePage = TabSheet2
        Align = alClient
        TabOrder = 0
        object TabSheet4: TTabSheet
          Caption = 'Opis'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          DesignSize = (
            703
            140)
          object Label7: TLabel
            Left = 312
            Top = 12
            Width = 66
            Height = 16
            Caption = 'Typ faktury'
          end
          object Label8: TLabel
            Left = 574
            Top = 12
            Width = 14
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'Nr'
            ExplicitLeft = 536
          end
          object Label3: TLabel
            Left = 16
            Top = 12
            Width = 78
            Height = 16
            Caption = 'Miejscowo'#347#263
          end
          object Label4: TLabel
            Left = 486
            Top = 44
            Width = 98
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'Data dokumentu'
            ExplicitLeft = 448
          end
          object Label5: TLabel
            Left = 8
            Top = 44
            Width = 93
            Height = 16
            Caption = 'Typ dokumentu'
          end
          object Label9: TLabel
            Left = 8
            Top = 76
            Width = 94
            Height = 16
            Caption = 'Data sprzeda'#380'y'
          end
          object Typ: TEdit
            Left = 384
            Top = 8
            Width = 65
            Height = 24
            MaxLength = 15
            TabOrder = 1
            Text = 'FV'
          end
          object Nr: TEdit
            Left = 598
            Top = 8
            Width = 97
            Height = 24
            Anchors = [akTop, akRight]
            MaxLength = 20
            TabOrder = 2
            Text = '63/11'
          end
          object Oryg: TComboBox
            Left = 112
            Top = 40
            Width = 129
            Height = 24
            Style = csDropDownList
            ItemHeight = 0
            ItemIndex = 0
            MaxLength = 20
            TabOrder = 3
            Text = 'Orygina'#322' / Kopia'
            Items.Strings = (
              'Orygina'#322' / Kopia'
              'Orygina'#322
              'Kopia')
          end
          object Msc: TEdit
            Left = 112
            Top = 8
            Width = 129
            Height = 24
            MaxLength = 128
            TabOrder = 0
          end
          object DataDzis: TDateTimePicker
            Left = 598
            Top = 40
            Width = 97
            Height = 24
            Anchors = [akTop, akRight]
            Date = 40757.554821863430000000
            Time = 40757.554821863430000000
            TabOrder = 4
          end
          object DataSprzed: TDateTimePicker
            Left = 112
            Top = 72
            Width = 97
            Height = 24
            Date = 40757.554821863430000000
            Time = 40757.554821863430000000
            TabOrder = 5
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'W'#322'a'#347'ciciel / Kontrahent'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 703
            Height = 57
            Align = alTop
            Caption = ' Wybierz w'#322'a'#347'ciciela firmy '
            TabOrder = 0
            DesignSize = (
              703
              57)
            object LSpr: TComboBox
              Left = 8
              Top = 24
              Width = 684
              Height = 24
              AutoDropDown = True
              AutoCloseUp = True
              Anchors = [akLeft, akTop, akRight]
              DropDownCount = 10
              ItemHeight = 0
              TabOrder = 0
              OnChange = LSprChange
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 57
            Width = 703
            Height = 83
            Align = alClient
            Caption = ' Wybierz kontrahenta '
            TabOrder = 1
            DesignSize = (
              703
              83)
            object SpeedButton1: TSpeedButton
              Left = 669
              Top = 50
              Width = 23
              Height = 22
              Anchors = [akTop, akRight]
              Caption = '+'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              OnClick = SpeedButton1Click
            end
            object Label2: TLabel
              Left = 8
              Top = 24
              Width = 120
              Height = 16
              Caption = 'Znajd'#378' kontrachenta'
            end
            object LKon: TComboBox
              Left = 3
              Top = 50
              Width = 660
              Height = 24
              AutoDropDown = True
              AutoCloseUp = True
              Anchors = [akLeft, akTop, akRight]
              DropDownCount = 10
              ItemHeight = 0
              TabOrder = 0
              OnChange = LSprChange
            end
            object KontrSearch: TEdit
              Left = 134
              Top = 20
              Width = 558
              Height = 24
              TabOrder = 1
              OnChange = KontrSearchChange
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'P'#322'atno'#347'ci i transport'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 336
        Top = 40
        Width = 105
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Termin p'#322'atno'#347'ci'
      end
      object Label10: TLabel
        Left = 96
        Top = 40
        Width = 105
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Spos'#243'b zap'#322'aty'
      end
      object Label11: TLabel
        Left = 456
        Top = 40
        Width = 105
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Transport'
      end
      object Label1: TLabel
        Left = 216
        Top = 40
        Width = 105
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ilo'#347#263' dni'
      end
      object DataZaplaty: TDateTimePicker
        Left = 336
        Top = 60
        Width = 105
        Height = 24
        Date = 40757.554821863430000000
        Time = 40757.554821863430000000
        TabOrder = 0
        OnChange = DataZaplatyChange
      end
      object Sposob: TComboBox
        Left = 96
        Top = 60
        Width = 105
        Height = 24
        ItemHeight = 0
        MaxLength = 30
        TabOrder = 1
        Text = 'Got'#243'wka'
        Items.Strings = (
          'Przelew'
          'Got'#243'wka'
          'Karta'
          'Got'#243'wka - pobranie')
      end
      object transport: TComboBox
        Left = 456
        Top = 60
        Width = 105
        Height = 24
        ItemHeight = 0
        MaxLength = 64
        TabOrder = 2
        Items.Strings = (
          ''
          'W'#322'asny'
          'Dostawcy'
          'Odbiorcy'
          'Sprzedawcy')
      end
      object IleDni: TSpinEdit
        Left = 216
        Top = 60
        Width = 105
        Height = 26
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = IleDniChange
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Uwagi do dokumentu'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Uwagi: TMemo
        Left = 0
        Top = 0
        Width = 711
        Height = 171
        Align = alClient
        MaxLength = 255
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object Lista: TListView
    Left = 0
    Top = 208
    Width = 719
    Height = 204
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Lp.'
        Width = 30
      end
      item
        Caption = 'Towar'
        Width = 150
      end
      item
        Caption = 'J.m'
        Width = 40
      end
      item
        Caption = 'Waluta'
        Width = 60
      end
      item
        Caption = 'Ilo'#347#263
        Width = 45
      end
      item
        Caption = 'Cena (szt.)'
        Width = 100
      end
      item
        Caption = 'Rabat [%]'
        Width = 80
      end
      item
        Caption = 'Wart. netto'
        Width = 100
      end
      item
        Caption = 'VAT [%]'
        Width = 70
      end
      item
        Caption = 'Wart VAT'
        Width = 85
      end
      item
        Caption = 'Wart. brutto'
        Width = 105
      end>
    ColumnClick = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FullDrag = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
    OnChange = ListaChange
  end
  object btnDelete: TButton
    Left = 0
    Top = 427
    Width = 129
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Usu'#324' zaznaczone'
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object btnAdd: TButton
    Left = 136
    Top = 427
    Width = 65
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Dodaj'
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnPrint: TButton
    Tag = 2
    Left = 596
    Top = 427
    Width = 59
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Drukuj'
    Enabled = False
    TabOrder = 5
    OnClick = btnPrintClick
  end
  object btnPreview: TButton
    Tag = 1
    Left = 470
    Top = 427
    Width = 121
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Podgl'#261'd wydruku'
    Enabled = False
    TabOrder = 6
    OnClick = btnPrintClick
  end
  object PrintLogo: TCheckBox
    Left = 367
    Top = 431
    Width = 97
    Height = 17
    Anchors = [akRight, akBottom]
    Caption = 'Drukuj logo'
    TabOrder = 7
  end
end
