object Archiw: TArchiw
  Left = 211
  Top = 199
  BorderWidth = 8
  Caption = 'Archiwum'
  ClientHeight = 385
  ClientWidth = 674
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = SDataCloseUp
  OnCreate = FormCreate
  DesignSize = (
    674
    385)
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 674
    Height = 57
    Align = alTop
    Caption = ' Wyszukiwarka faktur '
    TabOrder = 0
    DesignSize = (
      674
      57)
    object Label1: TLabel
      Left = 108
      Top = 28
      Width = 8
      Height = 16
      Caption = '--'
    end
    object Label2: TLabel
      Left = 467
      Top = 27
      Width = 104
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'NIP kontrahenta:  '
      ExplicitLeft = 382
    end
    object Label3: TLabel
      Left = 315
      Top = 27
      Width = 59
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Nr faktury:'
    end
    object SData: TDateTimePicker
      Left = 8
      Top = 24
      Width = 97
      Height = 24
      Date = 40759.387082245370000000
      Time = 40759.387082245370000000
      TabOrder = 0
      OnCloseUp = SDataCloseUp
    end
    object EData: TDateTimePicker
      Left = 120
      Top = 24
      Width = 97
      Height = 24
      Date = 40759.387082245370000000
      Time = 40759.387082245370000000
      TabOrder = 1
      OnCloseUp = SDataCloseUp
    end
    object SNIP: TMaskEdit
      Left = 577
      Top = 24
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnChange = SDataCloseUp
    end
    object SNFV: TMaskEdit
      Left = 380
      Top = 24
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 2
      OnChange = SDataCloseUp
    end
  end
  object Lista: TListView
    Left = 0
    Top = 63
    Width = 673
    Height = 284
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Id'
      end
      item
        Alignment = taCenter
        Caption = 'Data dok.'
        Width = 100
      end
      item
        Caption = 'Nr FV'
        Width = 60
      end
      item
        Alignment = taCenter
        Caption = 'NIP'
        Width = 100
      end
      item
        Caption = 'Nazwa kontrahenta'
        Width = 300
      end>
    ColumnClick = False
    FullDrag = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnChange = ListaChange
  end
  object Button2: TButton
    Tag = 2
    Left = 616
    Top = 353
    Width = 58
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Drukuj'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button3: TButton
    Tag = 1
    Left = 488
    Top = 353
    Width = 122
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Podgl'#261'd wydruku'
    TabOrder = 3
    OnClick = Button3Click
  end
  object btnGenerateJPK: TButton
    Tag = 1
    Left = 0
    Top = 353
    Width = 105
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Generuj JPK'
    TabOrder = 4
    OnClick = Button3Click
  end
end
