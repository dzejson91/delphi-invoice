object JPKForma: TJPKForma
  Left = 0
  Top = 0
  Caption = 'Generuj JPK'
  ClientHeight = 507
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
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
    Date = 43262.861338020830000000
    TabOrder = 0
  end
  object Button1: TButton
    Left = 467
    Top = 219
    Width = 113
    Height = 32
    Caption = 'Generuj JPK '
    TabOrder = 1
    OnClick = Button1Click
  end
  object DateTo: TMonthCalendar
    Left = 297
    Top = 27
    Width = 283
    Height = 182
    Date = 43262.861869560180000000
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 8
    Top = 295
    Width = 577
    Height = 204
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 215
    Width = 453
    Height = 74
    Caption = 'Konfiguracja'
    TabOrder = 4
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
end
