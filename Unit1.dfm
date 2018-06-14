object Forma: TForma
  Left = 322
  Top = 250
  Caption = 'Faktury VAT'
  ClientHeight = 229
  ClientWidth = 518
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
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
    Width = 105
    Height = 25
    Caption = 'Wystaw FV'
    TabOrder = 0
    OnClick = Wystawfaktur1Click
  end
  object BtnContractor: TButton
    Left = 119
    Top = 8
    Width = 106
    Height = 25
    Caption = 'Kontrachenci'
    TabOrder = 1
    OnClick = Listanabywcw1Click
  end
  object BtnArchive: TButton
    Left = 230
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Archiwum'
    TabOrder = 2
    OnClick = Archiwumfaktur1Click
  end
  object btnExportJson: TButton
    Left = 119
    Top = 39
    Width = 105
    Height = 25
    Caption = 'Generuj JSON'
    TabOrder = 3
    Visible = False
    OnClick = btnExportJsonClick
  end
  object BtnJPK: TButton
    Left = 8
    Top = 39
    Width = 105
    Height = 25
    Caption = 'Generuj JPK'
    TabOrder = 4
    Visible = False
    OnClick = BtnJPKClick
  end
  object btnParseXML: TButton
    Left = 230
    Top = 70
    Width = 105
    Height = 25
    Caption = 'Parse to XML'
    TabOrder = 5
    Visible = False
    OnClick = btnParseXMLClick
  end
  object btnLoadXML: TButton
    Left = 8
    Top = 70
    Width = 105
    Height = 25
    Caption = 'Load from XML'
    TabOrder = 6
    Visible = False
    OnClick = btnLoadXMLClick
  end
  object btnSaveXML: TButton
    Left = 119
    Top = 70
    Width = 105
    Height = 25
    Caption = 'Save to XML'
    TabOrder = 7
    Visible = False
    OnClick = btnSaveXMLClick
  end
  object MainMenu: TMainMenu
    Left = 376
    Top = 56
    object Plik1: TMenuItem
      Caption = 'Plik'
      object Wystawfaktur1: TMenuItem
        Caption = 'Wystaw faktur'#281
        OnClick = Wystawfaktur1Click
      end
      object Zamknij1: TMenuItem
        Caption = 'Zamknij'
        OnClick = Zamknij1Click
      end
    end
    object Listy1: TMenuItem
      Caption = 'Dane'
      object Listasprzedawcw1: TMenuItem
        Caption = 'Dane w'#322'a'#347'cicieli firmy'
        OnClick = Listasprzedawcw1Click
      end
      object Listanabywcw1: TMenuItem
        Caption = 'Dane kontrahent'#243'w'
        OnClick = Listanabywcw1Click
      end
      object Archiwumfaktur1: TMenuItem
        Caption = 'Archiwum faktur'
        OnClick = Archiwumfaktur1Click
      end
    end
    object Opcje1: TMenuItem
      Caption = 'Inne opcje'
      object Ustawienia1: TMenuItem
        Caption = 'Ustawienia'
        OnClick = Ustawienia1Click
      end
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'json'
    FileName = 'faktury'
    Filter = 'text/json|*.json'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Miejsce docelowe pliku JSON'
    Left = 408
    Top = 56
  end
end
