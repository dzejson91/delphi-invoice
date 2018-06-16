object Forma: TForma
  Left = 322
  Top = 250
  Caption = 'Faktury VAT'
  ClientHeight = 433
  ClientWidth = 729
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  DesignSize = (
    729
    433)
  PixelsPerInch = 96
  TextHeight = 16
  object BtnCreateFV: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 41
    Caption = 'Wystaw FV'
    TabOrder = 0
    OnClick = BtnCreateFVClick
  end
  object BtnContractor: TButton
    Left = 119
    Top = 55
    Width = 106
    Height = 41
    Caption = 'Kontrachenci'
    TabOrder = 1
    OnClick = BtnContractorClick
  end
  object BtnArchive: TButton
    Left = 231
    Top = 8
    Width = 105
    Height = 42
    Caption = 'Archiwum'
    TabOrder = 2
    OnClick = BtnArchiveClick
  end
  object advanced: TGroupBox
    Left = 8
    Top = 102
    Width = 713
    Height = 323
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Funkcje zaawansowane'
    TabOrder = 3
    Visible = False
    object btnParseXML: TButton
      Left = 230
      Top = 22
      Width = 105
      Height = 35
      Caption = 'Struct to XML'
      TabOrder = 0
      OnClick = btnParseXMLClick
    end
    object btnSaveStruct: TButton
      Left = 119
      Top = 63
      Width = 105
      Height = 36
      Caption = 'Struct - Zapis'
      TabOrder = 1
      OnClick = btnSaveStructClick
    end
    object btnReadStruct: TButton
      Left = 8
      Top = 63
      Width = 105
      Height = 36
      Caption = 'Struct - Odczyt'
      TabOrder = 2
      OnClick = btnReadStructClick
    end
    object btnLoadXML: TButton
      Left = 8
      Top = 22
      Width = 105
      Height = 35
      Caption = 'Load from XML'
      TabOrder = 3
      OnClick = btnLoadXMLClick
    end
    object btnSaveXML: TButton
      Left = 119
      Top = 22
      Width = 105
      Height = 35
      Caption = 'Save to XML'
      TabOrder = 4
      OnClick = btnSaveXMLClick
    end
  end
  object BtnJPK: TButton
    Left = 231
    Top = 56
    Width = 105
    Height = 40
    Caption = 'Generuj JPK'
    TabOrder = 4
    OnClick = BtnJPKClick
  end
  object btnSeller: TButton
    Left = 7
    Top = 55
    Width = 106
    Height = 41
    Caption = 'Sprzedawcy'
    TabOrder = 5
    OnClick = btnSellerClick
  end
  object brnConfig: TButton
    Left = 119
    Top = 8
    Width = 106
    Height = 41
    Caption = 'Ustawienia'
    TabOrder = 6
    OnClick = brnConfigClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xml'
    FileName = 'faktury'
    Filter = 'application/xml|*.xml'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Miejsce docelowe pliku'
    Left = 520
    Top = 40
  end
end
