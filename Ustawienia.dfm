object Ustaw: TUstaw
  Left = 315
  Top = 229
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ustawienia'
  ClientHeight = 223
  ClientWidth = 321
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 321
    Height = 223
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Drukowanie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnShow = TabSheet1Show
      DesignSize = (
        313
        192)
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 297
        Height = 17
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Wyb'#243'r drukarki do podgl'#261'du (wirtualna)'
      end
      object Label2: TLabel
        Left = 8
        Top = 112
        Width = 297
        Height = 17
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Wyb'#243'r drukarki do drukowania (oryginalna)'
      end
      object Label7: TLabel
        Left = 8
        Top = 4
        Width = 143
        Height = 16
        Caption = 'Wyb'#243'r czcionki wydruku'
        Visible = False
      end
      object Label8: TLabel
        Left = 8
        Top = 28
        Width = 297
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Uwzgl'#281'dnia si'#281' tylko nazw'#281' czcionki'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object SpeedButton1: TSpeedButton
        Left = 160
        Top = 0
        Width = 23
        Height = 22
        Caption = '...'
        Visible = False
        OnClick = SpeedButton1Click
      end
      object czc: TLabel
        Left = 192
        Top = 4
        Width = 84
        Height = 16
        Caption = 'MS Sans Serif'
        Visible = False
      end
      object DPodg: TComboBox
        Left = 8
        Top = 64
        Width = 297
        Height = 24
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 16
        TabOrder = 0
        OnChange = DPodgChange
      end
      object DDruk: TComboBox
        Left = 8
        Top = 136
        Width = 297
        Height = 24
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight, akBottom]
        ItemHeight = 16
        TabOrder = 1
        OnChange = DPodgChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Kurs Euro'
      ImageIndex = 1
      OnShow = TabSheet2Show
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label3: TLabel
        Left = 104
        Top = 104
        Width = 29
        Height = 16
        Caption = '1z'#322' = '
      end
      object Label4: TLabel
        Left = 192
        Top = 104
        Width = 27
        Height = 16
        Caption = 'euro'
      end
      object Label5: TLabel
        Left = 72
        Top = 32
        Width = 59
        Height = 16
        Caption = 'Na dzie'#324': '
      end
      object Label6: TLabel
        Left = 56
        Top = 68
        Width = 76
        Height = 16
        Caption = 'Numer tabeli'
      end
      object Euro: TEdit
        Left = 136
        Top = 100
        Width = 49
        Height = 24
        TabOrder = 0
        Text = '4,0256'
        OnExit = EuroExit
      end
      object DEuro: TDateTimePicker
        Left = 136
        Top = 28
        Width = 97
        Height = 24
        Date = 40761.763564270830000000
        Time = 40761.763564270830000000
        TabOrder = 1
        OnChange = DEuroChange
      end
      object NrTab: TEdit
        Left = 136
        Top = 64
        Width = 97
        Height = 24
        MaxLength = 10
        TabOrder = 2
        Text = '87/2011'
        OnChange = NrTabChange
      end
    end
  end
  object Font: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Device = fdPrinter
    Options = [fdEffects, fdScalableOnly]
    Left = 276
    Top = 51
  end
end
