object JPKForma: TJPKForma
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Generuj JPK'
  ClientHeight = 297
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 8
  Padding.Top = 8
  Padding.Right = 8
  Padding.Bottom = 8
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 283
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Data od'
  end
  object Label2: TLabel
    Left = 297
    Top = 8
    Width = 283
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Data do'
  end
  object DateFrom: TMonthCalendar
    Left = 8
    Top = 27
    Width = 283
    Height = 182
    Date = 43262.819311759260000000
    TabOrder = 0
  end
  object btnGenerate: TButton
    Left = 467
    Top = 219
    Width = 113
    Height = 67
    Caption = 'Generuj JPK '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    WordWrap = True
    OnClick = btnGenerateClick
  end
  object DateTo: TMonthCalendar
    Left = 297
    Top = 27
    Width = 283
    Height = 182
    Date = 43313.819311770840000000
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 215
    Width = 453
    Height = 74
    Caption = 'Konfiguracja'
    TabOrder = 3
    object Label3: TLabel
      Left = 16
      Top = 20
      Width = 38
      Height = 13
      Alignment = taCenter
      Caption = 'Waluta:'
    end
    object Label4: TLabel
      Left = 16
      Top = 48
      Width = 38
      Height = 13
      Caption = 'Kod US:'
    end
    object Label5: TLabel
      Left = 229
      Top = 20
      Width = 38
      Height = 13
      Caption = 'Podmiot'
    end
    object EUR: TRadioButton
      Left = 119
      Top = 19
      Width = 49
      Height = 17
      Caption = 'EUR'
      TabOrder = 0
    end
    object PLN: TRadioButton
      Left = 64
      Top = 19
      Width = 49
      Height = 17
      Caption = 'PLN'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object KodUrzedu: TEdit
      Left = 64
      Top = 42
      Width = 97
      Height = 21
      TabOrder = 2
      Text = '1217'
    end
    object Podmiot: TComboBox
      Left = 273
      Top = 16
      Width = 168
      Height = 21
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object SaveDialog: TSaveDialog
    FileName = 'JPK.xml'
    Filter = 'application/xml|*.xml'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Wybierz lokalizacj'#281' zapisu'
    Left = 400
    Top = 256
  end
end
