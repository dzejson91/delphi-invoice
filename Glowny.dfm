object Forma: TForma
  Left = 322
  Top = 250
  Caption = 'Faktury VAT'
  ClientHeight = 202
  ClientWidth = 542
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 8
  Padding.Top = 8
  Padding.Right = 8
  Padding.Bottom = 8
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 16
  object BtnCreateFV: TButton
    Left = 8
    Top = 8
    Width = 170
    Height = 56
    Caption = 'Wystaw FV'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BtnCreateFVClick
  end
  object BtnContractor: TButton
    Left = 8
    Top = 70
    Width = 170
    Height = 56
    Caption = 'Kontrachenci'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = BtnContractorClick
  end
  object BtnArchive: TButton
    Left = 184
    Top = 8
    Width = 170
    Height = 56
    Caption = 'Archiwum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = BtnArchiveClick
  end
  object BtnJPK: TButton
    Left = 8
    Top = 132
    Width = 170
    Height = 56
    Caption = 'Generuj JPK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnJPKClick
  end
  object btnSeller: TButton
    Left = 184
    Top = 70
    Width = 170
    Height = 56
    Caption = 'Sprzedawcy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnSellerClick
  end
  object brnConfig: TButton
    Left = 360
    Top = 8
    Width = 170
    Height = 56
    Caption = 'Ustawienia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = brnConfigClick
  end
  object btnImportStruct: TButton
    Left = 184
    Top = 132
    Width = 170
    Height = 56
    Caption = 'Import struct'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnClick = btnImportStructClick
  end
  object btnBackup: TButton
    Left = 360
    Top = 70
    Width = 170
    Height = 56
    Caption = 'Kopia danych'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Cambria'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnBackupClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xml'
    FileName = 'faktury'
    Filter = 'application/xml|*.xml'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Miejsce docelowe pliku'
    Left = 360
    Top = 136
  end
end
